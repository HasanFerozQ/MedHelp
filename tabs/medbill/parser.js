// ── Stage 1 & 2: Document Ingestion, Classification & Normalization ──

const TOTAL_ROW_RE = /\b(billed subtotal|grand total|total due|amount due|balance due|total charges|subtotal)\b/i;

/** 
 * Geometric Column Scanner (v5.0 Dynamic)
 */
function detectColumns(items) {
  const codeXs = [];
  const priceXs = [];
  const qtyXs = [];

  const cptRegex = /\b\d{5}\b/;
  const priceRegex = /\$?(\d{1,3}(?:,\d{3})*(?:\.\d{2}))\b/;
  const qtyRegex = /^\s*(\d{1,2})\s*$/;

  items.forEach(item => {
    const s = (item.str || '').trim();
    if (!s) return;
    
    if (cptRegex.test(s) && isValidCPT(s.match(cptRegex)[0])) {
      codeXs.push(item.x);
    } else if (priceRegex.test(s)) {
      priceXs.push(item.x);
    } else if (qtyRegex.test(s) && !s.includes('-') && !s.includes('/')) {
      qtyXs.push(item.x);
    }
  });

  const getCentroid = (arr, side = 'left') => {
    if (!arr.length) return null;
    const sorted = [...arr].sort((a, b) => a - b);
    return side === 'left' ? sorted[0] : sorted[sorted.length - 1];
  };

  const leftCode = getCentroid(codeXs, 'left') || 10;
  const rightTotal = getCentroid(priceXs, 'right') || 700;
  const midPrice = getCentroid(priceXs.filter(x => x < rightTotal - 40), 'right') || rightTotal - 100;
  const qtyX = getCentroid(qtyXs.filter(x => x > leftCode + 100 && x < midPrice - 20), 'left') || (leftCode + midPrice) / 2 + 50;

  return {
    cpt:   [leftCode - 20, leftCode + 80],
    desc:  [leftCode + 80, qtyX - 40],
    qty:   [qtyX - 40, qtyX + 40],
    unit:  [midPrice - 60, midPrice + 40],
    total: [rightTotal - 100, rightTotal + 60]
  };
}

/**
 * Service Block Normalizer (v5.1 Multiline)
 * Groups stacked lines into a single logical service entry.
 */
function buildServiceBlocks(sortedYs, yGroups) {
  const blocks = [];
  let currentBlock = null;

  sortedYs.forEach(y => {
    const lineItems = yGroups[y].sort((a, b) => a.x - b.x);
    const lineText = lineItems.map(i => i.str).join(' ');
    
    // An anchor is a line containing a 5-digit CPT code
    const hasCPT = /\b\d{5}\b/.test(lineText);
    const isTotal = TOTAL_ROW_RE.test(lineText);

    if (hasCPT) {
      if (currentBlock) blocks.push(currentBlock);
      currentBlock = { items: [...lineItems], text: lineText, yStart: y };
    } else if (currentBlock && !isTotal) {
      // Append secondary lines (description/diagnosis) to the current active block
      currentBlock.items.push(...lineItems);
      currentBlock.text += ' ' + lineText;
    } else if (isTotal) {
      if (currentBlock) blocks.push(currentBlock);
      currentBlock = null;
      blocks.push({ items: lineItems, text: lineText, yStart: y, isTotal: true });
    }
  });

  if (currentBlock) blocks.push(currentBlock);
  return blocks;
}

function getNumericTokens(items) {
  const CARC_RE = window.CARC_RE || /([A-Z]{2}-\d{1,4})/g;
  const ANOMALY_MARKER_RE = window.ANOMALY_MARKER_RE || /[■□✅⚠️🚨]/g;

  return items
    .filter(i => {
      const s = (i.str || '').trim();
      // Skip labels and markers
      return s && !CARC_RE.test(s) && !ANOMALY_MARKER_RE.test(s) && !/[a-z]{3,}/i.test(s);
    })
    .map(i => {
      // Extract numeric-like strings: signs, decimals, commas
      const matches = i.str.match(/-?\$?\d{1,3}(?:,\d{3})*(?:\.\d{2,})?|\b\d+\b/g) || [];
      return matches.map(m => ({
        val: parseFloat(m.replace(/[$,]/g, '')),
        x: i.x,
        raw: m
      }));
    })
    .flat()
    .filter(t => !isNaN(t.val))
    .sort((a, b) => a.x - b.x); // Spatial Sort: Left-to-Right
}

function extractRowsFromSpatialLine(lineItems, lineText, detectedMap = null, currentCode = '') {
  const lineUpper = lineText.toUpperCase();
  const isTotalRow = TOTAL_ROW_RE.test(lineText) || lineUpper.includes('TOTAL');

  const cptRegex = /\b\d{5}\b/g;
  const rawCPTs = [...lineText.matchAll(cptRegex)].map(m => m[0]).filter(c => isValidCPT(c));
  
  const rawDRGs = [...lineText.matchAll(/\b[1-9]\d{2}\b/g)].map(m => m[0]);
  const validDRGs = rawDRGs.filter(c => DRG_BENCHMARKS[c]);

  const code = rawCPTs.length > 0 ? rawCPTs[0] : (validDRGs.length > 0 ? validDRGs[0] : '');
  const isDRG = !!validDRGs.length && !rawCPTs.length;

  if (!code && !isTotalRow) return null;

  // ── TOKEN-LEVEL EXTRACTION (v6.1 Tuned) ──
  // Filter out the identified code to prevent collisions with Qty/Price
  const filteredItems = lineItems.filter(i => {
    const s = (i.str || '').trim();
    return s !== code && s !== code.replace('-', '');
  });
  
  const tokens = getNumericTokens(filteredItems);
  
  let qty = 1, price = 0, total = 0;

  if (tokens.length >= 3) {
    // Standard [Qty, Unit, Total]
    qty   = tokens[0].val;
    price = tokens[1].val;
    total = tokens[2].val;
  } else if (tokens.length === 2) {
    // [Unit, Total]
    price = tokens[0].val;
    total = tokens[1].val;
  } else if (tokens.length === 1) {
    // [Total]
    total = tokens[0].val;
    price = total; 
  }

  // Sanity Clamps
  if (qty > 100 || qty < 0) qty = 1;
  if (Math.abs(total) > 1000000) return null; // Protective cap

  const dates = lineText.match(/\b\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\b/);
  const dateStr = dates ? dates[0] : '';

  let modifier = '';
  if (code) {
    const modMatch = lineText.match(new RegExp(`${code}-([A-Z0-9]{2})\\b`));
    if (modMatch) modifier = modMatch[1];
  }

  // Description extraction avoids long numbers and pure codes
  let desc = lineItems
    .filter(i => {
       const s = i.str.trim();
       if (s === code) return false;
       if (/^\d{5,}/.test(s)) return false; // Filter out 5+ digit nums (NPI/Acct)
       if (/\$\d+/.test(s)) return false;   // Filter out prices
       return true;
    })
    .map(i => i.str)
    .join(' ')
    .replace(/\s+/g, ' ')
    .trim();
    
  if (!desc) {
    desc = lineText.replace(new RegExp(`\\b${code}\\b`, 'g'), ' ').replace(/\s+/g, ' ').trim();
  }
  if (desc.length > 80) desc = desc.substring(0, 77) + '…';

  return {
    date: dateStr, code, modifier, isDRG,
    desc: desc || (isDRG ? 'Hospital Stay' : 'Medical Service'),
    qty, price: price || total, total, paid: 0, owed: 0,
    priceWasDerived: (price === 0 || price === total),
    isTotalRow
  };
}

function extractRowsFromText(text) {
  if (!text) return { rows: [], suspect_rows: [] };
  const lines = text.split('\n').filter(l => l.trim().length > 0);
  const fakePage = lines.map((lineText, idx) => {
    const parts = lineText.trim().split(/\s+/);
    const y = (lines.length - idx) * 20; 
    return parts.map((str, pIdx) => ({
      str,
      x: pIdx * 70, 
      y
    }));
  }).flat();
  
  const result = reconstructRowsFromLayout([fakePage]);
  return result;
}

function classifyDocument(items) {
  const fullText = (items || []).map(i => i.str).join(' ').toLowerCase();
  const profiles = window.DOCUMENT_PROFILES || {};
  let bestProfile = profiles.GENERIC || { id: 'GENERIC', label: 'Generic Medical Document' };
  let maxHits = 0;

  Object.values(profiles).forEach(p => {
    if (!p || p.id === 'GENERIC') return;
    const hits = (p.keywords || []).filter(k => fullText.includes(k.toLowerCase())).length;
    if (hits > maxHits) { maxHits = hits; bestProfile = p; }
  });
  return bestProfile;
}

function reconstructRowsFromLayout(pages) {
  const flatItems = pages.flat();
  const profile = classifyDocument(flatItems);
  const dMap = detectColumns(flatItems);
  
  const allRows = [];
  pages.forEach((items, pageIdx) => {
    let inTable = (profile.id === 'GENERIC'); // GENERIC profile skips strict header sniffing
    const yGroups = {};
    items.forEach(item => {
      const y = Math.round(item.y / 6) * 6;
      (yGroups[y] = yGroups[y] || []).push(item);
    });

    const sortedYs = Object.keys(yGroups).sort((a, b) => b - a);
    const blocks = buildServiceBlocks(sortedYs, yGroups);

    blocks.forEach(block => {
      const lineUpper = block.text.toUpperCase();
      
      // Sniff for table headers (Broadened)
      if ((lineUpper.includes('CPT') || lineUpper.includes('CODE') || lineUpper.includes('HCPCS') || lineUpper.includes('SERVICE')) && 
          (lineUpper.includes('CHARGE') || lineUpper.includes('TOTAL') || lineUpper.includes('AMOUNT'))) {
        inTable = true;
        return;
      }

      if (TOTAL_ROW_RE.test(block.text)) inTable = false; // Close table after total row

      if (inTable || block.isTotal) {
        const row = extractRowsFromSpatialLine(block.items, block.text, dMap);
        if (row) {
          row.profile = profile.id;
          allRows.push(row);
        }
      }
    });
  });

  const result = filterNormalRows(allRows);
  result.profile = profile;
  return result;
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
    } else {
      clean_rows.push(r);
    }
  });
  return { rows: clean_rows, suspect_rows };
}

window.TOTAL_ROW_RE = TOTAL_ROW_RE;
window.classifyDocument = classifyDocument;
window.detectColumns = detectColumns;
window.extractRowsFromSpatialLine = extractRowsFromSpatialLine;
window.reconstructRowsFromLayout = reconstructRowsFromLayout;
window.filterNormalRows = filterNormalRows;
