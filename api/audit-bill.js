require('dotenv').config();
const { TextractClient, AnalyzeDocumentCommand } = require("@aws-sdk/client-textract");
const { createClient } = require("@supabase/supabase-js");
const multer = require("multer");

// Helper to run middleware in Vercel
const runMiddleware = (req, res, fn) => {
  return new Promise((resolve, reject) => {
    fn(req, res, (result) => {
      if (result instanceof Error) return reject(result);
      return resolve(result);
    });
  });
};

const upload = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: 4 * 1024 * 1024 }, // Keep under 4MB for Vercel
});

// Credentials must be set via environment variables — no fallback for security
const accessKeyId = process.env.AWS_ACCESS_KEY_ID;
const secretAccessKey = process.env.AWS_SECRET_ACCESS_KEY;
const region = process.env.AWS_REGION || "us-east-1";
const awsCredentialsConfigured = !!(accessKeyId && secretAccessKey);

if (!awsCredentialsConfigured) {
  console.error('FATAL: AWS credentials not set. Set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY env vars.');
}

const textractClient = awsCredentialsConfigured
  ? new TextractClient({
      region,
      credentials: {
        accessKeyId,
        secretAccessKey
      }
    })
  : null;

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

function getText(block, blockMap, minConfidence = 85) {
  let text = "";
  let hasLowConfidence = false;
  if (block.Relationships) {
    block.Relationships.forEach(rel => {
      if (rel.Type === "CHILD") {
        rel.Ids.forEach(id => {
          const childBlock = blockMap[id];
          if (childBlock && childBlock.BlockType === "WORD") {
            const conf = childBlock.Confidence || 0;
            if (conf < minConfidence) {
              hasLowConfidence = true;
              // Add a marker for high-precision review
              text += "[?] "; 
            }
            text += childBlock.Text + " ";
          }
        });
      }
    });
  }
  return { text: text.trim().replace(/\[\?\] /g, ''), hasLowConfidence };
}

/**
 * parseCurrency — handles $1,234.00, (1234.00), $500 CR and similar variants.
 * Returns a float. Negative for amounts in parentheses or with CR/cr suffix.
 */
function parseCurrency(str) {
  if (str === null || str === undefined || str === '') return null;
  const s = String(str).trim();
  const isNeg = /^\(/.test(s) || /CR\s*$/i.test(s);
  const cleaned = s.replace(/[\$,\(\)]/g, '').replace(/CR\s*$/i, '').trim();
  const val = parseFloat(cleaned);
  if (isNaN(val)) return null;
  return isNeg ? -Math.abs(val) : val;
}

function normalizeTextractOutput(blocks) {
  const blockMap = {};
  blocks.forEach(b => blockMap[b.Id] = b);
  
  const tables = blocks.filter(b => b.BlockType === "TABLE");
  const keyValues = blocks.filter(b => b.BlockType === "KEY_VALUE_SET");

  let normalizedItems = [];
  let foundTotals = []; // { val, priority }

  // 1. Extract Grand Total from KEY_VALUE_SET (FORMS)
  keyValues.forEach(kv => {
    if (kv.EntityTypes && kv.EntityTypes.includes("KEY")) {
      const { text: keyText } = getText(kv, blockMap, 0); // Get key text regardless of confidence
      const lowerKey = keyText.toLowerCase();
      
      let priority = 0;
      if (lowerKey.includes("balance due") || lowerKey.includes("amount due")) priority = 3;
      else if (lowerKey.includes("total") && !lowerKey.includes("sub")) priority = 2;
      else if (lowerKey.includes("amount") || lowerKey.includes("balance")) priority = 1;

      if (priority > 0) {
        let valText = null;
        if (kv.Relationships) {
          kv.Relationships.forEach(rel => {
            if (rel.Type === "VALUE") {
              rel.Ids.forEach(id => {
                const valBlock = blockMap[id];
                valText = getText(valBlock, blockMap, 0).text;
              });
            }
          });
        }
        if (valText) {
          const parsedVal = parseFloat(valText.replace(/[^0-9.]/g, ''));
          if (!isNaN(parsedVal) && parsedVal > 0) {
             foundTotals.push({ val: parsedVal, priority });
          }
        }
      }
    }
  });

  // Fallback: If no keywords found, find the largest numeric value in the forms layer
  const grandTotal = foundTotals.length > 0 
    ? foundTotals.sort((a,b) => b.priority - a.priority || b.val - a.val)[0].val 
    : null;

  // 2. Extract Line Items from TABLES
  tables.forEach(tableBlock => {
    const grid = {}; // grid[row][col] = { text, lowConf }
    let maxRow = 0;
    let maxCol = 0;

    if (tableBlock.Relationships) {
      tableBlock.Relationships.forEach(rel => {
        if (rel.Type === "CHILD") {
          rel.Ids.forEach(id => {
            const cellBlock = blockMap[id];
            if (cellBlock && cellBlock.BlockType === "CELL") {
              const r = cellBlock.RowIndex;
              const c = cellBlock.ColumnIndex;
              if (r > maxRow) maxRow = r;
              if (c > maxCol) maxCol = c;
              
              if (!grid[r]) grid[r] = {};
              grid[r][c] = getText(cellBlock, blockMap, 85);
            }
          });
        }
      });
    }

    if (maxRow > 0) {
      let headers = {};
      
      // Multi-row header support: check top 2 rows
      const headerRows = [1, 2];
      headerRows.forEach(hr => {
        for (let c = 1; c <= maxCol; c++) {
          const cell = grid[hr] ? grid[hr][c] : null;
          if (!cell) continue;
          const text = cell.text.toLowerCase();

          // Priority header mapping (exact match vs partial)
          if (text === "date" || text.includes("serv date") || text.includes("dos")) headers.date = c;
          else if (text === "cpt" || text === "hcpcs" || (text.includes("code") && !text.includes("proc"))) headers.cpt = c;
          else if (text.includes("qty") || text === "units" || text === "quantity") headers.qty = c;
          else if (text.includes("price") || text === "rate" || text === "fee") headers.unit_price = c;
          else if (text === "mod" || text === "modifier") headers.modifier = c;
          else if (text === "total" || text === "billed" || text === "amount" || text.includes("charge")) {
             // Only map if not already mapped or if this is a better match
             if (!headers.billed_amount) headers.billed_amount = c;
          }
          else if (text.includes("adj") || text.includes("carc") || text.includes("contractual")) headers.adjustment = c;
          else if (text.includes("diag") || text.includes("icd") || text.includes("dx")) headers.dx = c;
        }
      });

      if (headers.cpt || headers.billed_amount) {
        // Track the lowest row that contained a header
        let headerRowFoundIn = 1;
        headerRows.forEach(hr => {
          for (let c = 1; c <= maxCol; c++) {
            const cell = grid[hr]?.[c];
            if (!cell) continue;
            const text = cell.text.toLowerCase();
            if (text === 'cpt' || text === 'date' || text === 'code' || text.includes('charge')) {
              headerRowFoundIn = hr;
            }
          }
        });
        const dataStart = headerRowFoundIn + 1; 
        
        for (let r = dataStart; r <= maxRow; r++) {
          const rowData = grid[r] || {};
          const cellCpt = rowData[headers.cpt] || { text: "", hasLowConfidence: false };
          const cellAmt = rowData[headers.billed_amount] || { text: "", hasLowConfidence: false };
          
          if (cellCpt.text.trim() !== "" || cellAmt.text.trim() !== "") {
            let finalQtyStr = headers.qty ? (rowData[headers.qty]?.text || "1") : "1";

            // Use parseCurrency for all monetary fields — handles ($1,234.00), $500 CR etc.
            const billedAmount = parseCurrency(cellAmt.text) ?? 0.00;
            const unitPrice    = headers.unit_price ? parseCurrency(rowData[headers.unit_price]?.text) : null;
            const adjRawVal    = headers.adjustment ? parseCurrency(rowData[headers.adjustment]?.text) : null;
            // Normalize: adjustments reduce billed amount (negative in our model)
            const adjValue     = adjRawVal !== null ? (adjRawVal > 0 ? -adjRawVal : adjRawVal) : 0;
            const adjRaw       = adjRawVal !== null ? String(adjRawVal) : null; // for Paid calc gate

            const dxRaw = headers.dx ? (rowData[headers.dx]?.text || "").trim() : "";
            const ICD10_SERVER_RE = /\b([A-Z]\d{2}(?:\.\w{1,4})?)\b/g;
            const dxCodes = dxRaw ? [...dxRaw.matchAll(ICD10_SERVER_RE)].map(m => m[1]) : [];

            const isValidCode = cellCpt.text.trim() !== "" && (
              /^\d{5}$/.test(cellCpt.text.trim()) || /^[A-Z]\d{4}$/.test(cellCpt.text.trim())
            );

            const qty = parseFloat(finalQtyStr) || 1;

            // Internal anomaly detection
            let anomaly = false;
            if (unitPrice && qty && Math.abs((unitPrice * qty) - billedAmount) > 0.01) {
              anomaly = true;
            }

            // Confidence Scoring
            let score = 100;
            if (!isValidCode) score -= 40;
            if (billedAmount === 0) score -= 30;
            if (!headers.date || !rowData[headers.date]?.text) score -= 15;
            if (rowData[headers.cpt]?.hasLowConfidence || rowData[headers.billed_amount]?.hasLowConfidence) score -= 20;
            if (anomaly) score -= 25;

            normalizedItems.push({
              Date: headers.date ? (rowData[headers.date]?.text || "").trim() : "",
              CPT: cellCpt.text.trim(),
              IsValidCode: isValidCode,
              Qty: qty,
              Unit_Price: unitPrice,
              Modifier: headers.modifier ? (rowData[headers.modifier]?.text || "").trim() : "",
              Billed_Amount: billedAmount,
              Adjustment: adjValue,
              Paid: adjRaw !== null ? Math.max(0, billedAmount + adjValue) : 0,
              DX: dxCodes,
              extraction_confidence: Math.max(0, score),
              needs_manual_review: score < 70 || anomaly,
              has_low_confidence_chars: cellCpt.hasLowConfidence || cellAmt.hasLowConfidence
            });
          }
        }
      }
    }
  });

  return { items: normalizedItems, grandTotal };
}

// ARITHMETIC ENGINE: Runs deterministic validation checks
// Server-side helper: validates CPT (5-digit) or HCPCS L2 (letter+4-digit)
function isValidBillingCode(code) {
  if (!code || typeof code !== 'string') return false;
  const c = code.trim().toUpperCase();
  if (/^\d{5}$/.test(c)) {
    const n = parseInt(c, 10);
    return n >= 10000 && n <= 99999;
  }
  return /^[A-Z]\d{4}$/.test(c); // HCPCS Level II
}

function runArithmeticEngine(items, grandTotal) {
  let findings = [];
  let calculatedSum = 0;
  let seenCodes = new Set();

  // Modifiers that justify distinct procedures/duplicates
  const distinctModifiers = ['59', '76', '91', 'RT', 'LT', 'XE', 'XS', 'XP', 'XU'];

  items.forEach((item, index) => {
    // Skip rows whose code is not a valid CPT or HCPCS L2 format
    if (item.CPT && !isValidBillingCode(item.CPT)) {
      findings.push({
        type: 'Warning',
        code: item.CPT,
        title: 'Invalid Billing Code',
        reason: `"${item.CPT}" does not match any valid CPT (10000–99999) or HCPCS Level II (Letter + 4 digits) format. Possible ZIP code or data-entry error.`
      });
    }

    // 1. Accumulate Summation
    calculatedSum += item.Billed_Amount;

    // 2. Line Item Math Check
    if (item.Unit_Price !== null) {
      const expectedTotal = item.Qty * item.Unit_Price;
      const difference    = Math.abs(expectedTotal - item.Billed_Amount);
      if (difference > 0.001) {
        findings.push({
          type: 'Warning',
          code: item.CPT,
          title: 'Math Mismatch',
          reason: `Line item math error. Expected $${expectedTotal.toFixed(2)} (${item.Qty} × $${item.Unit_Price.toFixed(2)}) but billed $${item.Billed_Amount.toFixed(2)}. (CMS Claims Processing Manual, Chapter 1 §30.2.5)`
        });
      }
    }

    // 3. CARC Adjustment consistency check
    if (item.Adjustment && item.Adjustment < 0) {
      const expectedPaid = item.Billed_Amount + item.Adjustment;
      if (expectedPaid < 0) {
        findings.push({
          type: 'Danger',
          code: item.CPT,
          title: 'Credit Balance Liability (CMS Compliance)',
          reason: `Adjustment ($${item.Adjustment.toFixed(2)}) exceeds billed amount ($${item.Billed_Amount.toFixed(2)}). The resulting credit balance ($${Math.abs(expectedPaid).toFixed(2)}) must be refunded within 60 days per CMS Chapter 4 §50.`
        });
      }
    }

    // 4. Duplicate Detection Check
    if (item.CPT && item.CPT !== '') {
      const codeKey = `${item.Date}-${item.CPT}`;
      if (seenCodes.has(codeKey)) {
        let hasDistinctModifier = false;
        if (item.Modifier) {
          const presentModifiers = item.Modifier.split(',').map(m => m.trim().toUpperCase());
          hasDistinctModifier = presentModifiers.some(m => distinctModifiers.includes(m));
        }
        if (!hasDistinctModifier) {
          findings.push({
            type: 'Danger',
            code: item.CPT,
            title: 'Potential Duplicate',
            reason: `Duplicate charge for code ${item.CPT} on ${item.Date || 'same date'}. No distinct unbundling modifier detected. (CMS Claims Processing Manual, Chapter 4 §20.4.2)`
          });
        }
      }
      seenCodes.add(codeKey);
    }
  });

  // 4. Summation Math Check
  if (grandTotal !== null) {
      const difference = Math.abs(calculatedSum - grandTotal);
      if (difference > 0.001) {
         findings.push({
            type: "Warning",
            code: "DOCUMENT",
            title: "Summation Error",
            reason: `Total line items ($${calculatedSum.toFixed(2)}) do not match Document Grand Total ($${grandTotal.toFixed(2)}).`
         });
      }
  }

  return { findings, calculatedSum, grandTotal };
}

// CLINICAL ENGINE: Uses Supabase database for Pricing & NCCI unbundling checks
async function runClinicalEngine(items) {
  let clinicalFindings = [];
  let totalBenchmark = 0;
  let savingsOpportunity = 0;

  // 1. UNIQUE CODES for Bulk Pricing Lookup
  const allCodes = [...new Set(items.map(i => (i.CPT || "").trim().toUpperCase()).filter(c => c && c.length >= 2))];
  const cptCodes = allCodes.filter(c => /^[0-9]{5}$/.test(c));
  const drugCodes = allCodes.filter(c => /^[A-Z][0-9]{4}$/.test(c)); // J, Q, P, V codes
  
  // Parallel Fetch from both tables
  const [cptRes, drugRes] = await Promise.all([
    supabase.from('cpt_medicare_fees').select('cpt_code, base_price, description').in('cpt_code', cptCodes),
    supabase.from('hcpcs_drug_fees').select('hcpcs_code, payment_limit, short_description').in('hcpcs_code', drugCodes)
  ]);

  const feeMap = {};
  (cptRes.data || []).forEach(f => { feeMap[f.cpt_code] = { price: f.base_price, type: 'CPT', desc: f.description }; });
  (drugRes.data || []).forEach(f => { feeMap[f.hcpcs_code] = { price: f.payment_limit, type: 'DRUG', desc: f.short_description }; });

  // 2. PRICING VALIDATION
  items.forEach(item => {
    const code = (item.CPT || "").trim().toUpperCase();
    const feeData = feeMap[code];
    if (feeData) {
      const benchmark = feeData.price;
      const totalBenchmarkValue = benchmark * item.Qty;
      totalBenchmark += totalBenchmarkValue;
      
      // RULE: Flag if charge is > 200% of Medicare
      if (item.Billed_Amount > (totalBenchmarkValue * 2.0)) {
        const typeLabel = feeData.type === 'DRUG' ? 'Drug Pricing Variance' : 'High Pricing Variance';
        const unitDetail = feeData.type === 'DRUG' ? `per unit (${feeData.desc})` : '';
        
        clinicalFindings.push({
          type: "Warning",
          code: code,
          title: typeLabel,
          reason: `Medicare benchmark is ~$${benchmark.toFixed(2)} ${unitDetail}, total fair market ~$${totalBenchmarkValue.toFixed(2)}. But you billed $${item.Billed_Amount.toFixed(2)} (${((item.Billed_Amount / totalBenchmarkValue) * 100).toFixed(0)}% of Medicare).`
        });
        
        // Accumulate potential savings vs 150% benchmark
        savingsOpportunity += (item.Billed_Amount - (totalBenchmarkValue * 1.5));
      }
    }
  });

  // 3. NCCI UNBUNDLING VALIDATION (Pairwise check for same-date items)
  const itemsByDate = items.reduce((acc, item) => {
    if (!acc[item.Date]) acc[item.Date] = [];
    acc[item.Date].push(item);
    return acc;
  }, {});

  for (const date in itemsByDate) {
    const dateItems = itemsByDate[date];
    if (dateItems.length < 2) continue;

    const codesForDate = dateItems.map(i => i.CPT).filter(c => c && c.length >= 5);
    
    // Bulk query for all possible pairs from this date
    const { data: ncciEdits } = await supabase
      .from('ncci_ptp_edits')
      .select('column1_code, column2_code, modifier_allowed')
      .in('column1_code', codesForDate)
      .in('column2_code', codesForDate);

    if (ncciEdits && ncciEdits.length > 0) {
      ncciEdits.forEach(edit => {
          // Find the specific line item for the component (Column 2)
          const componentItem = dateItems.find(i => i.CPT === edit.column2_code);
          const primaryItem = dateItems.find(i => i.CPT === edit.column1_code);

          if (!componentItem) return; // Guard: skip if component code not found on this date

          if (edit.modifier_allowed === '0') {
            clinicalFindings.push({
              type: "Danger",
              code: edit.column2_code,
              title: "Clinical Bundle Violation",
              reason: `Code ${edit.column2_code} is an inseparable component of ${edit.column1_code} and should not be billed separately per CMS NCCI rules.`
            });
            savingsOpportunity += componentItem.Billed_Amount;
          } else if (edit.modifier_allowed === '1') {
            const hasModifier = (componentItem.Modifier && componentItem.Modifier !== "") || 
                                (primaryItem && primaryItem.Modifier && primaryItem.Modifier !== "");
            
            if (!hasModifier) {
               clinicalFindings.push({
                  type: "Warning",
                  code: edit.column2_code,
                  title: "Missing Modifier",
                  reason: `Code ${edit.column2_code} overlaps with ${edit.column1_code}. It requires a distinct modifier (e.g. -59) to be allowed.`
               });
            }
          }
      });
    }
  }

  return { 
    clinicalFindings, 
    savingsOpportunity: Math.max(0, savingsOpportunity),
    totalBenchmark 
  };
}

module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: "Method not allowed" });

  if (!awsCredentialsConfigured || !textractClient) {
    return res.status(500).json({
      ok: false,
      error: 'AWS credentials not configured. Set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.'
    });
  }

  try {
    await runMiddleware(req, res, upload.single('bill'));
    if (!req.file) return res.status(400).json({ error: "Missing PDF" });

    // Step 1: Textract Extraction
    let data;
    try {
      data = await textractClient.send(new AnalyzeDocumentCommand({
        Document: { Bytes: req.file.buffer },
        FeatureTypes: ["TABLES", "FORMS"]
      }));
    } catch (err) {
      return res.status(500).json({ ok: false, error: `AWS Textract failed: ${err.message}` });
    }
    
    // Step 2: Normalization
    let normalizedItems = [];
    let grandTotal = null;
    try {
        const blocks = data.Blocks || [];
        const result = normalizeTextractOutput(blocks);
        normalizedItems = result.items;
        grandTotal = result.grandTotal;
    } catch (err) {
        throw new Error(`Normalization Layer Error: Failed to parse bill table structure. ${err.message}`);
    }

    // Step 2b: CPT Code Existence Check — batch validate against Supabase
    // Any code not found in the DB is quarantined immediately (HITL) rather than
    // silently entering the audit engine with a potentially garbled code.
    try {
        const candidateCodes = [...new Set(
          normalizedItems.filter(i => i.CPT && i.IsValidCode).map(i => i.CPT)
        )];
        if (candidateCodes.length > 0) {
          const { data: knownCodes } = await supabase
            .from('cpt_codes')
            .select('code')
            .in('code', candidateCodes);
          const knownSet = new Set((knownCodes || []).map(r => r.code));
          normalizedItems.forEach(item => {
            if (item.CPT && item.IsValidCode && !knownSet.has(item.CPT)) {
              // Code passed format check but doesn't exist in CPT DB — likely OCR corruption
              item.IsValidCode = false;
              item.extraction_confidence = Math.min(item.extraction_confidence, 30);
              item.needs_manual_review = true;
              item.has_low_confidence_chars = true;
            }
          });
        }
    } catch (dbErr) {
        console.warn('MediHelp: CPT existence batch check skipped:', dbErr.message);
    }

    // Step 3: Arithmetic Engine
    let engineResults = { findings: [] };
    try {
        engineResults = runArithmeticEngine(normalizedItems, grandTotal);
    } catch (err) {
        throw new Error(`Arithmetic Engine Error: Mathematical validation loop crashed. ${err.message}`);
    }

    // Step 4: Clinical Engine (New for Step 5)
    let clinicalResults = { clinicalFindings: [], savingsOpportunity: 0 };
    try {
        clinicalResults = await runClinicalEngine(normalizedItems);
    } catch (err) {
        console.error("Clinical Engine Error:", err.message);
        // We don't crash the whole audit if DB lookup fails, we just show arithmetic
    }

    // Combine Findings
    const allFindings = [...engineResults.findings, ...clinicalResults.clinicalFindings];
    const numAnomalies = allFindings.length;
    
    let summaryText = `Found ${normalizedItems.length} billing items. Clinical datasets detect $${clinicalResults.savingsOpportunity.toFixed(2)} in potential savings.`;
    if (numAnomalies > 5) {
        summaryText = `High Risk: ${numAnomalies} critical billing anomalies isolated. Potential savings estimated at $${clinicalResults.savingsOpportunity.toFixed(2)}.`;
    }

    res.status(200).json({ 
        ok: true, 
        normalized_bill: normalizedItems, 
        result: { 
            summary: summaryText,
            findings: allFindings,
            potential_savings: clinicalResults.savingsOpportunity,
            medicare_benchmark_total: clinicalResults.totalBenchmark
        } 
    });

  } catch (err) {
    console.error("Audit Execution Error:", err.message);
    res.status(500).json({ ok: false, error: err.message, detailed_stack: err.stack });
  }
};

module.exports.config = { api: { bodyParser: false } };
