// ── Stage 1 & 2: Document Ingestion, Classification & Normalization (v6.0) ──

const TOTAL_ROW_RE = /\b(billed subtotal|grand total|total due|amount due|balance due|total charges|subtotal)\b/i;

// ICD-10 code pattern — letter + 2 digits + optional decimal + subchapter chars
const _ICD10_RE = /\b([A-Z]\d{2}(?:\.\w{1,4})?)\b/g;
// HCPCS Level II / CPT anchor regex — matches 5-digit numerics OR letter+4-digit HCPCS
const _CODE_RE  = /\b(\d{5}|[A-Z]\d{4})\b/;

/**
 * Geometric Column Scanner (v6.0 — Anchor-Relative)
 *
 * Strategy: find the CPT/code column by locating actual code tokens, then place
 * all other column zones relative to that anchor.  This is far more robust than
 * centroid guessing because a 1-pixel OCR shift no longer cascades.
 *
 * Returns dMap = { cpt, desc, qty, unit, total }
 * Each zone is [minX, maxX].
 */
function detectTableBoundaries(sortedYs, yGroups) {
  let topY = Infinity;
  let bottomY = -Infinity;

  for (let i = 0; i < sortedYs.length; i++) {
    const y = sortedYs[i];
    const items = yGroups[y];
    const lineText = items.map(u => u.str).join(' ').toUpperCase();
    
    // V7.1: Super-strict header sniffing to bypass test legends.
    // A true billing grid header MUST contain at least one element from each of the 3 primary pillars.
    const hasCode = lineText.includes('CPT') || lineText.includes('CODE') || lineText.includes('HCPCS') || lineText.includes('SERVICE');
    const hasQty  = lineText.includes('QTY') || lineText.includes('QUANTITY') || lineText.includes('UNIT');
    const hasCoin = lineText.includes('CHARGE') || lineText.includes('TOTAL') || lineText.includes('AMOUNT') || lineText.includes('PRICE') || lineText.includes('FEE') || lineText.includes('BILLED');

    if (hasCode && hasQty && hasCoin) {
      if (topY === Infinity) topY = y; // Start of REAL billing grid
    }

    if (TOTAL_ROW_RE.test(lineText)) {
      if (y < topY && bottomY === -Infinity) bottomY = y; // End of billing grid
    }
  }

  // Degrade gracefully if no headers found
  if (topY === Infinity) topY = Infinity; 
  if (bottomY === -Infinity) bottomY = -Infinity;

  return { topY, bottomY };
}

function detectColumns(items, topY = Infinity) {
  const codeXs  = [];
  const priceXs = [];
  const qtyXs   = [];

  const priceRegex = /\$?(\d{1,3}(?:,\d{3})*(?:\.\d{2}))\b/;
  const qtyRegex   = /^\s*(\d{1,3})\s*$/;

  // ── Pass 1: collect x-positions of known token types (ONLY inside table logic) ──
  items.forEach(item => {
    if (item.y > topY) return; // Ignore legends/headers for column clustering!

    const s = (item.str || '').trim();
    if (!s) return;

    if (_CODE_RE.test(s)) {
      const codeCandidate = s.match(_CODE_RE)[0];
      if (isValidCPT(codeCandidate)) codeXs.push(item.x);
    } else if (priceRegex.test(s)) {
      priceXs.push(item.x);
    } else if (qtyRegex.test(s) && !s.includes('-') && !s.includes('/')) {
      qtyXs.push(item.x);
    }
  });

  // ── Pass 2: build sorted arrays ──
  const sortedPriceXs = [...new Set(priceXs)].sort((a, b) => a - b);
  const sortedCodeXs  = [...new Set(codeXs)].sort((a, b) => a - b);
  const sortedQtyXs   = [...new Set(qtyXs)].sort((a, b) => a - b);

  const leftCode   = sortedCodeXs.length ? sortedCodeXs[0] : 10;
  const rightTotal = sortedPriceXs.length ? sortedPriceXs[sortedPriceXs.length - 1] : 700;

  const midPriceCandidates = sortedPriceXs.filter(x => x < rightTotal - 20);
  const midPrice = midPriceCandidates.length
    ? midPriceCandidates[midPriceCandidates.length - 1]
    : Math.max(leftCode + 150, rightTotal - 100);

  const qtyFiltered = sortedQtyXs.filter(x => x > leftCode + 30 && x < midPrice - 10);
  const qtyX = qtyFiltered.length
    ? qtyFiltered[0]
    : Math.round((leftCode + midPrice) / 2);

  // V7: STRICT DYNAMIC CONTIGUOUS ZONES (PREVENTS TOKEN BLEED)
  return {
    cpt:   [leftCode - 50,  leftCode + 70],
    desc:  [leftCode + 71,  qtyX - 15],
    qty:   [qtyX - 14,      midPrice - 15],
    unit:  [midPrice - 14,  rightTotal - 15],
    total: [rightTotal - 14, rightTotal + 150],
  };
}
/**
 * Assign a column zone role to a token based on its x position.
 * Returns 'qty' | 'unit' | 'total' | 'unknown'
 */
function assignZone(x, dMap) {
  if (!dMap) return 'unknown';
  if (x >= dMap.qty[0]   && x <= dMap.qty[1])   return 'qty';
  if (x >= dMap.unit[0]  && x <= dMap.unit[1])  return 'unit';
  if (x >= dMap.total[0] && x <= dMap.total[1]) return 'total';
  return 'unknown';
}

/**
 * Service Block Normalizer (v6.0 — HCPCS-aware multiline grouping)
 * Groups stacked PDF lines into a single logical service entry.
 * An anchor line is one that contains a 5-digit CPT OR a HCPCS L2 code.
 */
function buildServiceBlocks(sortedYs, yGroups) {
  const blocks = [];
  let currentBlock = null;

  sortedYs.forEach(y => {
    const lineItems = yGroups[y].sort((a, b) => a.x - b.x);
    const lineText  = lineItems.map(i => i.str).join(' ');

    // Anchor = line containing a valid CPT or HCPCS L2 code
    const codeMatch = lineText.match(_CODE_RE);
    const hasCPT    = codeMatch ? isValidCPT(codeMatch[0]) : false;
    const isTotal   = TOTAL_ROW_RE.test(lineText);

    if (hasCPT) {
      if (currentBlock) blocks.push(currentBlock);
      currentBlock = { items: [...lineItems], text: lineText, yStart: y };
    } else if (currentBlock && !isTotal) {
      // Append secondary lines (description/diagnosis) to the active block
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

/**
 * getNumericTokens (v6.0 — Zone-Gated)
 *
 * Critical fix: every extracted number is now classified against the column-zone
 * map produced by detectColumns(). Tokens that fall outside all numeric zones
 * (qty / unit / total) are discarded. This eliminates the column-bleed problem
 * where numbers from a distant column were being picked up as wrong field values.
 *
 * @param {Array}  items  — PDF item objects with .str and .x
 * @param {Object} dMap   — zone map from detectColumns()
 * @returns {Array} sorted tokens each with { val, x, raw, zone }
 */
function getNumericTokens(items, dMap) {
  const CARC_LABEL_RE = /^[A-Z]{1,2}-?\d{1,4}$/;  // e.g. CO-4, PR-1, OA-23
  const ANOMALY_RE    = /[■□✅⚠️🚨]/;
  const WORD_RE       = /[a-z]{3,}/i;               // labels / description words
  const DATE_RE       = /\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}/; // dates — skip

  return items
    .filter(i => {
      const s = (i.str || '').trim();
      if (!s) return false;
      if (CARC_LABEL_RE.test(s))  return false; // skip CARC adjustment labels
      if (ANOMALY_RE.test(s))     return false; // skip emoji markers
      if (WORD_RE.test(s))        return false; // skip text labels
      if (DATE_RE.test(s))        return false; // skip dates
      if (_CODE_RE.test(s) && isValidCPT(s.match(_CODE_RE)[0])) return false; // skip the code itself
      return true;
    })
    .map(i => {
      const matches = i.str.match(/-?\$?\d{1,3}(?:,\d{3})*(?:\.\d{2,})?|\b\d+\b/g) || [];
      return matches.map(m => {
        const val  = parseFloat(m.replace(/[$,]/g, ''));
        const zone = assignZone(i.x, dMap);
        return { val, x: i.x, raw: m, zone };
      });
    })
    .flat()
    .filter(t => {
      if (isNaN(t.val))      return false;
      // If we have a dMap, discard tokens that don't belong to any numeric zone
      if (dMap && t.zone === 'unknown') return false;
      return true;
    })
    .sort((a, b) => a.x - b.x);
}

/**
 * extractRowsFromSpatialLine (v6.0)
 *
 * Key changes vs v5:
 *  1. Passes dMap into getNumericTokens() for zone-gated extraction
 *  2. Extracts qty / unit / total by ZONE, not by positional slot [0]/[1]/[2]
 *  3. Detects CARC adjustment (negative) tokens BEFORE generic extraction;
 *     derives r.paid = r.total + r.adj   (adj is negative, so paid < total)
 *  4. Filters ICD-10 codes out of token candidates; stores them in r.dx
 *  5. Recognises HCPCS L2 codes as valid anchors
 */
function extractRowsFromSpatialLine(lineItems, lineText, detectedMap = null, currentCode = '') {
  const lineUpper = lineText.toUpperCase();
  const isTotalRow = TOTAL_ROW_RE.test(lineText) || lineUpper.includes('TOTAL');

  // ── 1. Extract diagnosis codes (ICD-10) BEFORE anything else ──
  _ICD10_RE.lastIndex = 0; // reset stateful regex
  const dxCodes = [];
  let dxMatch;
  while ((dxMatch = _ICD10_RE.exec(lineText)) !== null) {
    // Only capture if it looks like a real ICD-10 (not a CPT in disguise)
    const candidate = dxMatch[1];
    if (!isValidCPT(candidate)) {
      dxCodes.push(candidate);
    }
  }

  // ── 2. Extract billing code (CPT or HCPCS L2) ──
  const cptMatches  = [...lineText.matchAll(/\b(\d{5})\b/g)].map(m => m[1]).filter(c => isValidCPT(c));
  const hcpcsMatches= [...lineText.matchAll(/\b([A-Z]\d{4})\b/g)].map(m => m[1]).filter(c => isValidCPT(c));
  const rawDRGs     = [...lineText.matchAll(/\b[1-9]\d{2}\b/g)].map(m => m[0]);
  const validDRGs   = rawDRGs.filter(c => (window.DRG_BENCHMARKS || {})[c]);

  const code  = cptMatches[0] || hcpcsMatches[0] || (validDRGs.length ? validDRGs[0] : '');
  const isDRG = !!validDRGs.length && !cptMatches.length && !hcpcsMatches.length;

  if (!code && !isTotalRow) return null;

  // ── 3. Filter items: remove the identified code, ICD-10 tokens, and negative adjustments ──
  const negAdjRE = /^-\$?[\d,]+\.?\d*$/; // strictly negative dollar amounts

  // Separate out CARC adjustment tokens (negative values on EOBs)
  const adjItems = lineItems.filter(i => negAdjRE.test((i.str || '').trim()));
  const adjValue = adjItems.reduce((sum, i) => {
    return sum + parseFloat(i.str.replace(/[$,]/g, ''));
  }, 0); // will be <= 0

  // Remove adj tokens, the code itself, and ICD-10 strings from candidates
  const filteredItems = lineItems.filter(i => {
    const s = (i.str || '').trim();
    if (s === code)              return false; // the billing code
    if (negAdjRE.test(s))       return false; // CARC adjustment (handled separately)
    // Strip any token that matches an ICD-10 code we already captured
    if (dxCodes.length && _ICD10_RE.test(s)) {
      _ICD10_RE.lastIndex = 0;
      return false;
    }
    return true;
  });

  // ── 4. Zone-gated numeric extraction ──
  const tokens = getNumericTokens(filteredItems, detectedMap);

  // ── 5. Assign values from zones (not positional slots) ──
  let qty   = 1;
  let price = 0;
  let total = 0;

  const qtyTokens   = tokens.filter(t => t.zone === 'qty');
  const unitTokens  = tokens.filter(t => t.zone === 'unit');
  const totalTokens = tokens.filter(t => t.zone === 'total');

  if (detectedMap) {
    // ── Zone-based extraction (preferred path on real PDFs) ──
    qty   = qtyTokens.length   ? qtyTokens[0].val   : 1;
    price = unitTokens.length  ? unitTokens[0].val  : 0;
    total = totalTokens.length ? totalTokens[0].val : 0;

    // If no price or total found via zones, degrade gracefully
    if (total === 0 && price === 0) {
      // Fallback: last token is probably the total
      if (tokens.length) { total = tokens[tokens.length - 1].val; price = total; }
    } else if (total === 0 && price > 0) {
      total = price * qty;
    } else if (price === 0 && total > 0) {
      price = total;
    }
  } else {
    // ── Legacy fallback (text-paste mode, no position data) ──
    if (tokens.length >= 3) {
      qty   = tokens[0].val;
      price = tokens[1].val;
      total = tokens[2].val;
    } else if (tokens.length === 2) {
      price = tokens[0].val;
      total = tokens[1].val;
    } else if (tokens.length === 1) {
      total = tokens[0].val;
      price = total;
    }
  }

  // ── 6. Derive paid from CARC adjustment ──
  // adjValue is <= 0 (e.g. -180).  paid = total + adj  (e.g. 195 + (-180) = 15)
  const paid = adjValue < 0 ? Math.max(0, total + adjValue) : 0;

  // ── 7. Sanity clamps ──
  if (qty > 9999 || qty < 0) qty = 1;
  if (Math.abs(total) > 1_000_000) return null;

  // ── 8. Date extraction ──
  const dates  = lineText.match(/\b\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\b/);
  const dateStr = dates ? dates[0] : '';

  // ── 9. Modifier extraction ──
  let modifier = '';
  if (code) {
    const modMatch = lineText.match(new RegExp(`${code}[-\\s]([A-Z0-9]{2})\\b`));
    if (modMatch) modifier = modMatch[1];
  }

  // ── 10. Description (safe) ──
  let desc = lineItems
    .filter(i => {
      const s = i.str.trim();
      if (s === code)               return false;
      if (/^\d{5,}/.test(s))        return false; // 5+ digit nums (NPI/Account)
      if (/\$\d+/.test(s))          return false; // prices
      if (dxCodes.some(dx => s.includes(dx))) return false; // ICD-10 fragments
      return true;
    })
    .map(i => i.str)
    .join(' ')
    .replace(/\s+/g, ' ')
    .trim();

  // Strip any remaining ICD-10 sequences from the description
  desc = desc.replace(_ICD10_RE, '').replace(/\s+/g, ' ').trim();
  _ICD10_RE.lastIndex = 0;

  if (!desc) {
    desc = lineText.replace(new RegExp(`\\b${code}\\b`, 'g'), ' ').replace(/\s+/g, ' ').trim();
  }
  if (desc.length > 80) desc = desc.substring(0, 77) + '…';

  return {
    date:  dateStr,
    code,
    modifier,
    isDRG,
    dx:    dxCodes,   // ICD-10 diagnosis codes found on this line
    adj:   adjValue,  // CARC adjustment (≤ 0)
    desc:  desc || (isDRG ? 'Hospital Stay' : 'Medical Service'),
    qty,
    price:           price || total,
    total,
    paid,
    owed:            0,
    priceWasDerived: (price === 0 || price === total),
    isTotalRow,
  };
}

/**
 * extractRowsFromText — text-paste fallback (no positional data)
 * Builds a synthetic layout with monotone x-positions so the parser degrades
 * safely to the legacy slot-based extraction.
 */
function extractRowsFromText(text) {
  if (!text) return { rows: [], suspect_rows: [] };
  const lines    = text.split('\n').filter(l => l.trim().length > 0);
  const fakePage = lines.map((lineText, idx) => {
    const parts = lineText.trim().split(/\s+/);
    const y     = (lines.length - idx) * 20;
    return parts.map((str, pIdx) => ({ str, x: pIdx * 70, y }));
  }).flat();

  return reconstructRowsFromLayout([fakePage]);
}

/**
 * classifyDocument — uses keyword matching against DOCUMENT_PROFILES.
 * v6.0: profiles now have keywords arrays so this actually returns non-GENERIC
 * results for professional/institutional/EOB bills.
 */
function classifyDocument(items) {
  const fullText   = (items || []).map(i => i.str).join(' ').toLowerCase();
  const profiles   = window.DOCUMENT_PROFILES || {};
  let bestProfile  = profiles.GENERIC || { id: 'GENERIC', label: 'Generic Medical Document' };
  let maxHits      = 0;

  Object.values(profiles).forEach(p => {
    if (!p || p.id === 'GENERIC') return;
    const hits = (p.keywords || []).filter(k => fullText.includes(k.toLowerCase())).length;
    if (hits > maxHits) { maxHits = hits; bestProfile = p; }
  });
  return bestProfile;
}

/**
 * reconstructRowsFromLayout — main entry point after PDF.js extraction.
 * Passes the computed dMap into extractRowsFromSpatialLine so zone-gated
 * token extraction can work.
 */
function reconstructRowsFromLayout(pages) {
  const flatItems = pages.flat();
  const profile   = classifyDocument(flatItems);

  const allRows = [];
  pages.forEach((items) => {
    const yGroups = {};
    items.forEach(item => {
      const y = Math.round(item.y / 6) * 6;
      (yGroups[y] = yGroups[y] || []).push(item);
    });

    const sortedYs = Object.keys(yGroups).sort((a, b) => b - a);
    
    // v7: Detect rigid grid boundaries to lock out test legends
    const bounds = detectTableBoundaries(sortedYs, yGroups);
    const dMap   = detectColumns(items, bounds.topY);

    // v7: Extract global date from the header
    const headerText = items.filter(i => i.y >= bounds.topY).map(i => i.str).join(' ');
    const headerDates = headerText.match(/\b\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\b/g) || [];
    const globalDate = headerDates.length ? headerDates[headerDates.length - 1] : '';

    const blocks   = buildServiceBlocks(sortedYs, yGroups);

    blocks.forEach(block => {
      // v7: Guard boundaries for service lines
      if (!block.isTotal) {
        if (bounds.topY !== Infinity && block.yStart > bounds.topY) return; // Skip legends ABOVE grid
        if (bounds.bottomY !== -Infinity && block.yStart <= bounds.bottomY) return; // Skip footnotes BELOW grid
      } else {
        if (bounds.topY !== Infinity && block.yStart > bounds.topY) return; // Skip generic 'totals' in legend
      }

      const row = extractRowsFromSpatialLine(block.items, block.text, dMap);
      if (row) {
        if (!row.date && globalDate) row.date = globalDate; // v7 date inheritance
        row.profile = profile.id;
        allRows.push(row);
      }
    });
  });

  const result   = filterNormalRows(allRows);
  result.profile = profile;
  return result;
}

/**
 * filterNormalRows — quarantines rows that have no code AND no financial data.
 * v6.0: HCPCS L2 codes pass isValidCPT so they won't be falsely quarantined.
 */
function filterNormalRows(rows) {
  const clean_rows   = [];
  const suspect_rows = [];

  rows.forEach(r => {
    const d = (r.desc || '').toUpperCase();
    if (['TEST', 'FAKE', 'SAMPLE', 'VOID'].some(k => d.includes(k))) return;

    if (!r.code && r.total === 0 && !r.isTotalRow) {
      r.quarantine_reason = 'Missing financial or code anchors';
      suspect_rows.push(r);
    } else {
      clean_rows.push(r);
    }
  });

  return { rows: clean_rows, suspect_rows };
}

// ── Window exports ──
window.TOTAL_ROW_RE              = TOTAL_ROW_RE;
window.classifyDocument          = classifyDocument;
window.detectColumns             = detectColumns;
window.extractRowsFromSpatialLine= extractRowsFromSpatialLine;
window.reconstructRowsFromLayout = reconstructRowsFromLayout;
window.filterNormalRows          = filterNormalRows;
window.buildServiceBlocks        = buildServiceBlocks;
window.getNumericTokens          = getNumericTokens;
