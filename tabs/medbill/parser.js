// ── Stage 1 & 2: Document Ingestion, Classification & Normalization ──

const TOTAL_ROW_RE = /\b(grand total|total due|amount due|balance due|total charges|subtotal)\b/i;

/** 
 * Geometric Column Scanner (v5.0 Dynamic)
 * Sniffs out clusters of patterns to identify the document's horizontal anatomy.
 */
function detectColumns(items) {
  const codeXs = [];
  const priceXs = [];
  const qtyXs = [];

  const cptRegex = /\b\d{5}\b/;
  const priceRegex = /\$?(\d{1,3}(?:,\d{3})*(?:\.\d{2}))\b/;
  const qtyRegex = /^\s*(\d{1,2})\s*$/;

  items.forEach(item => {
    const s = item.str.trim();
    if (!s) return;
    
    // Scan for semantic markers
    if (cptRegex.test(s) && isValidCPT(s.match(cptRegex)[0])) {
      codeXs.push(item.x);
    } else if (priceRegex.test(s)) {
      priceXs.push(item.x);
    } else if (qtyRegex.test(s) && !s.includes('-') && !s.includes('/')) {
      qtyXs.push(item.x);
    }
  });

  // Helper: Find average/median of a cluster or 10th percentile
  function getCentroid(arr, side = 'left') {
    if (!arr.length) return null;
    const sorted = [...arr].sort((a, b) => a - b);
    return side === 'left' ? sorted[0] : sorted[sorted.length - 1];
  }

  // Dynamic Map Logic
  // Most bills have Code on left, financials on right.
  const leftCode = getCentroid(codeXs, 'left') || 10;
  const rightTotal = getCentroid(priceXs, 'right') || 700;
  const midPrice = getCentroid(priceXs.filter(x => x < rightTotal - 40), 'right') || rightTotal - 100;
  const qtyX = getCentroid(qtyXs.filter(x => x > leftCode + 100 && x < midPrice - 20), 'left') || (leftCode + midPrice) / 2 + 50;

  return {
    cpt:   [leftCode - 20, leftCode + 80],
    desc:  [leftCode + 80, qtyX - 40],
    qty:   [qtyX - 40, qtyX + 40],
    unit:  [midPrice - 60, midPrice + 40],
    total: [rightTotal - 100, 1000] // Open right boundary
  };
}

function extractRowsFromSpatialLine(lineItems, lineText, detectedMap = null) {
  const lineUpper = lineText.toUpperCase();
  const isTotalRow = TOTAL_ROW_RE.test(lineText) || lineUpper.includes('TOTAL');

  // STEP 3: Strict CPT Rules
  const cptRegex = /\b\d{5}\b/g;
  const rawCPTs = [...lineText.matchAll(cptRegex)].map(m => m[0]).filter(c => isValidCPT(c));
  
  const rawDRGs = [...lineText.matchAll(/\b[1-9]\d{2}\b/g)].map(m => m[0]);
  const validDRGs = rawDRGs.filter(c => DRG_BENCHMARKS[c]);

  const code = rawCPTs.length > 0 ? rawCPTs[0] : (validDRGs.length > 0 ? validDRGs[0] : '');
  const isDRG = !!validDRGs.length && !rawCPTs.length;

  if (!code && !isTotalRow) return null;

  // Use Dynamic Map if provided, else fallback to classic
  const MAP = detectedMap || {
    cpt: [0, 80],
    desc: [80, 350],
    qty: [350, 420],
    unit: [420, 520],
    total: [520, 750]
  };

  function extractCol(range) {
    return lineItems.filter(i => i.x >= range[0] && i.x <= range[1]).map(i => i.str).join('');
  }

  let totalStr = extractCol(MAP.total).replace(/[^0-9.\-()]/g, '');
  if (totalStr.includes('(') && totalStr.includes(')')) totalStr = '-' + totalStr.replace(/[()]/g, '');
  let priceStr = extractCol(MAP.unit).replace(/[^0-9.\-()]/g, '');
  let qtyStr   = extractCol(MAP.qty).replace(/[^0-9]/g, '');

  let total = parseFloat(totalStr) || 0;
  let price = parseFloat(priceStr) || 0;
  let qty   = parseInt(qtyStr, 10) || 1;
  let owed = 0, paid = 0;

  const dates = lineText.match(/\b\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\b/);
  const dateStr = dates ? dates[0] : '';

  let modifier = '';
  const modMatch = lineText.match(new RegExp(`${code}-([A-Z0-9]{2})\\b`));
  if (modMatch) modifier = modMatch[1];

  let rawDesc = extractCol(MAP.desc).trim();
  if (!rawDesc) {
    rawDesc = lineText
      .replace(new RegExp(`\\b${code}\\b`, 'g'), ' ')
      .replace(/\b\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\b/g, ' ')
      .replace(/\s+/g, ' ').trim();
  }
  let desc = rawDesc;
  if (desc.length > 60) desc = desc.substring(0, 57) + '…';

  return {
    date:            dateStr,
    code,
    modifier,
    isDRG,
    desc:            desc || (isDRG ? 'Hospital Stay' : 'Medical Service'),
    qty,
    price:           price || total,
    total,
    paid,
    owed,
    priceWasDerived: (price === 0),
    isTotalRow
  };
}

function extractRowsFromText(text) {
  const rawProcessedRows = text.split('\n').filter(l => l.trim().length > 3)
    .map(lineText => {
      const parts = lineText.trim().split(/\s+/);
      const chunks = parts.map((str, idx) => {
        let x = idx * 10;
        if (str.includes('$') || /\d+\.\d+/.test(str)) {
          x = idx === parts.length - 1 ? 550 : 450;
        } else if (/\b\d{5}\b/.test(str)) {
          x = 10;
        } else if (idx > 0 && idx < parts.length - 2) {
           x = 150;
        }
        return { str, x };
      });
      return extractRowsFromSpatialLine(chunks, lineText);
    }).filter(Boolean);
  return filterNormalRows(rawProcessedRows);
}

function reconstructRowsFromLayout(pages) {
  const flatItems = pages.flat();
  const dMap = detectColumns(flatItems);
  console.log('MediHelp: Dynamic Column Capture:', dMap);

  const allRows = [];
  let inTable = false;

  pages.forEach(items => {
    const yGroups = {};
    items.forEach(item => {
      if (!item.str.trim()) return;
      const y = Math.round(item.y / 6) * 6;
      (yGroups[y] = yGroups[y] || []).push(item);
    });

    const sortedYs = Object.keys(yGroups).sort((a, b) => b - a);
    sortedYs.forEach(y => {
      const lineItems = yGroups[y].sort((a, b) => a.x - b.x);
      const lineText = lineItems.map(i => i.str).join(' ');
      const lineUpper = lineText.toUpperCase();

      if ((lineUpper.includes('CPT') || lineUpper.includes('CODE')) && 
          (lineUpper.includes('CHARGE') || lineUpper.includes('TOTAL'))) {
        inTable = true;
        return;
      }
      if (TOTAL_ROW_RE.test(lineText)) inTable = false;

      if (!inTable && !TOTAL_ROW_RE.test(lineText)) return;

      const row = extractRowsFromSpatialLine(lineItems, lineText, dMap);
      if (row) allRows.push(row);
    });
  });

  return filterNormalRows(allRows);
}

function filterNormalRows(rows) {
  const clean_rows = [];
  const suspect_rows = [];

  rows.forEach(r => {
    const d = (r.desc || '').toUpperCase();
    if (['TEST','FAKE','SAMPLE','VOID'].some(k => d.includes(k))) return;

    if (!r.code && r.total === 0 && !r.isTotalRow) {
      r.quarantine_reason = 'Missing financial or code anchors';
      suspect_rows.push(r);
      return;
    }
    if (r.code && r.total === 0 && r.price === 0) {
      r.quarantine_reason = 'Code found but missing financial context';
      suspect_rows.push(r);
      return;
    }
    clean_rows.push(r);
  });
  return { rows: clean_rows, suspect_rows };
}

window.detectColumns = detectColumns;
window.extractRowsFromSpatialLine = extractRowsFromSpatialLine;
window.extractRowsFromText = extractRowsFromText;
window.reconstructRowsFromLayout = reconstructRowsFromLayout;
window.filterNormalRows = filterNormalRows;
