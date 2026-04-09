// ── Stage 1 & 2: Document Ingestion, Classification & Normalization ──

// ── Spatial Row Extraction (v4 Geometric Pipeline) ────────────────────────
const TOTAL_ROW_RE = /\b(grand total|total due|amount due|balance due|total charges|subtotal)\b/i;

function extractRowsFromSpatialLine(lineItems, lineText) {
  const lineUpper = lineText.toUpperCase();
  const isTotalRow = TOTAL_ROW_RE.test(lineText) || lineUpper.includes('TOTAL');

  // STEP 3: Strict CPT Rules
  const cptRegex = /\b\d{5}\b/g;
  const rawCPTs = [...lineText.matchAll(cptRegex)].map(m => m[0]).filter(c => isValidCPT(c));
  
  // Evaluate DRG strictly separately
  const rawDRGs = [...lineText.matchAll(/\b[1-9]\d{2}\b/g)].map(m => m[0]);
  const validDRGs = rawDRGs.filter(c => DRG_BENCHMARKS[c]); // Hard dict lookup

  const code = rawCPTs.length > 0 ? rawCPTs[0] : (validDRGs.length > 0 ? validDRGs[0] : '');
  const isDRG = !!validDRGs.length && !rawCPTs.length;

  // STEP 2: Hard Filter - Skip lines entirely that aren't structurally row-like
  if (!code && !isTotalRow) return null;

  // STEP 4: Exact Geometric Column Mapping (Stop Heuristic Bleed)
  const COLUMN_MAP = {
    cpt: [0, 80],
    desc: [80, 350],
    qty: [350, 420],
    unit: [420, 520],
    total: [520, 750] // extending to right margin
  };

  function extractCol(range) {
    return lineItems.filter(i => i.x >= range[0] && i.x <= range[1]).map(i => i.str).join('');
  }

  let totalStr = extractCol(COLUMN_MAP.total).replace(/[^0-9.\-()]/g, '');
  if (totalStr.includes('(') && totalStr.includes(')')) totalStr = '-' + totalStr.replace(/[()]/g, '');
  let priceStr = extractCol(COLUMN_MAP.unit).replace(/[^0-9.\-()]/g, '');
  let qtyStr   = extractCol(COLUMN_MAP.qty).replace(/[^0-9]/g, '');

  let total = parseFloat(totalStr) || 0;
  let price = parseFloat(priceStr) || 0;
  let qty   = parseInt(qtyStr, 10) || 1;
  let owed = 0, paid = 0;

  // Extract Dates strictly
  const dates = lineText.match(/\b\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\b/);
  const dateStr = dates ? dates[0] : '';

  // Extract Modifier if contiguous with CPT (e.g. 99214-25)
  let modifier = '';
  const modMatch = lineText.match(new RegExp(`${code}-([A-Z0-9]{2})\\b`));
  if (modMatch) modifier = modMatch[1];

  // For description, rely cleanly on the designated desc column if possible
  let rawDesc = extractCol(COLUMN_MAP.desc).trim();
  if (!rawDesc) {
    rawDesc = lineText
      .replace(new RegExp(`\\b${code}\\b`, 'g'), ' ')
      .replace(/\b\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\b/g, ' ')
      .replace(/[|:,\-]/g, ' ')
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
  // Legacy text paste handler — simulate spatial logic by treating chunks as items
  const rawProcessedRows = text.split('\n').filter(l => l.trim().length > 3)
    .map(lineText => {
      // Map space-separated text to column boundaries approximately for testing
      const parts = lineText.trim().split(/\s+/);
      const chunks = parts.map((str, idx) => {
        let x = idx * 10;
        if (str.includes('$') || /\d+\.\d+/.test(str)) {
          // If it looks like money, push it towards the right side columns
          x = idx === parts.length - 1 ? 550 : 450;
        } else if (/\b\d{5}\b/.test(str)) {
          x = 10; // CPT is on the left
        } else if (idx > 0 && idx < parts.length - 2) {
           x = 150; // Description in middle
        }
        return { str, x };
      });
      return extractRowsFromSpatialLine(chunks, lineText);
    }).filter(Boolean);
  return filterNormalRows(rawProcessedRows);
}

// ── Layout Reconstruction ─────────────────────────────────────────────────────
function reconstructRowsFromLayout(pages) {
  const allRows = [];
  let inTable = false;

  pages.forEach(items => {
    // Cluster PDF text elements by vertical Y bands
    const yGroups = {};
    items.forEach(item => {
      if (!item.str.trim()) return;
      const y = Math.round(item.y / 6) * 6; // 6pt tolerance band
      (yGroups[y] = yGroups[y] || []).push(item);
    });

    const sortedYs = Object.keys(yGroups).sort((a, b) => b - a);

    sortedYs.forEach(y => {
      const lineItems = yGroups[y].sort((a, b) => a.x - b.x); // Sort left-to-right
      const lineText = lineItems.map(i => i.str).join(' ');
      const lineUpper = lineText.toUpperCase();

      // STEP 5: Table Bounding
      if ((lineUpper.includes('CPT') || lineUpper.includes('CODE')) && 
          (lineUpper.includes('CHARGE') || lineUpper.includes('TOTAL'))) {
        inTable = true;
        return; // Skip the header itself
      }
      if (TOTAL_ROW_RE.test(lineText)) {
        inTable = false; // Close table but process this total row
      }

      // Enforce bounds (ignore preamble addresses unless explicitly a total row)
      if (!inTable && !TOTAL_ROW_RE.test(lineText)) return;

      const row = extractRowsFromSpatialLine(lineItems, lineText);
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
    
    // Hard noise (Watermarks, test stamps) -> Discard entirely
    if (['TEST','FAKE','SAMPLE','VOID'].some(k => d.includes(k))) return;

    // Quarantine: No code anchor AND total is zero -> Suspect
    if (!r.code && r.total === 0 && !r.isTotalRow) {
      r.quarantine_reason = 'Missing financial or code anchors';
      suspect_rows.push(r);
      return;
    }

    // Quarantine: CPT code found, but no prices at all
    if (r.code && r.total === 0 && r.price === 0) {
      r.quarantine_reason = 'Code found but missing financial context';
      suspect_rows.push(r);
      return;
    }

    // Pass
    clean_rows.push(r);
  });

  return { rows: clean_rows, suspect_rows };
}

window.extractRowsFromSpatialLine = extractRowsFromSpatialLine;
window.extractRowsFromText = extractRowsFromText;
window.reconstructRowsFromLayout = reconstructRowsFromLayout;
window.filterNormalRows = filterNormalRows;
