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

if (!accessKeyId || !secretAccessKey) {
  console.error('FATAL: AWS credentials not set. Set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY env vars.');
}

const textractClient = new TextractClient({
  region,
  credentials: {
      accessKeyId,
      secretAccessKey
  }
});

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

function getText(block, blockMap) {
  let text = "";
  if (block.Relationships) {
    block.Relationships.forEach(rel => {
      if (rel.Type === "CHILD") {
        rel.Ids.forEach(id => {
          const childBlock = blockMap[id];
          if (childBlock && childBlock.BlockType === "WORD") {
            text += childBlock.Text + " ";
          }
        });
      }
    });
  }
  return text.trim();
}

function normalizeTextractOutput(blocks) {
  const blockMap = {};
  blocks.forEach(b => blockMap[b.Id] = b);
  
  const tables = blocks.filter(b => b.BlockType === "TABLE");
  const keyValues = blocks.filter(b => b.BlockType === "KEY_VALUE_SET");

  let normalizedItems = [];
  let grandTotal = null;

  // 1. Extract Grand Total from KEY_VALUE_SET (FORMS)
  // Usually, a KEY block points to a VALUE block via a VALUE relationship
  keyValues.forEach(kv => {
    if (kv.EntityTypes && kv.EntityTypes.includes("KEY")) {
      const keyText = getText(kv, blockMap).toLowerCase();
      if (keyText.includes("total") || keyText.includes("amount due") || keyText.includes("balance")) {
        // Find corresponding VALUE
        let valText = null;
        if (kv.Relationships) {
          kv.Relationships.forEach(rel => {
            if (rel.Type === "VALUE") {
              rel.Ids.forEach(id => {
                const valBlock = blockMap[id];
                valText = getText(valBlock, blockMap);
              });
            }
          });
        }
        if (valText) {
          const parsedVal = parseFloat(valText.replace(/[^0-9.]/g, ''));
          if (!isNaN(parsedVal) && parsedVal > 0) {
             grandTotal = parsedVal; // Use the last non-zero total found
          }
        }
      }
    }
  });

  // 2. Extract Line Items from TABLES
  tables.forEach(tableBlock => {
    const grid = {}; // grid[row][col] = text
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
              grid[r][c] = getText(cellBlock, blockMap);
            }
          });
        }
      });
    }

    if (maxRow > 0) {
      let headers = {};
      
      for (let c = 1; c <= maxCol; c++) {
        const text = (grid[1] && grid[1][c]) ? grid[1][c].toLowerCase() : "";
        if (text.includes("date")) headers.date = c;
        else if (text.includes("cpt") || text.includes("code") || text.includes("hcpcs")) headers.cpt = c;
        else if (text.includes("qty") || text.includes("unit") || text.includes("quantity")) headers.qty = c;
        else if (text.includes("price") || text.includes("rate") || text.includes("fee")) headers.unit_price = c;
        else if (text.includes("mod")) headers.modifier = c;
        else if (text.includes("charge") || text.includes("amount") || text.includes("billed") || text.includes("total")) headers.billed_amount = c;
        // CARC / contractual adjustment column (EOB-style bills)
        else if (text.includes("adj") || text.includes("carc") || text.includes("adjustment") || text.includes("contractual")) headers.adjustment = c;
        // ICD-10 / diagnosis column
        else if (text.includes("diag") || text.includes("icd") || text.includes("dx")) headers.dx = c;
      }

      // Fallback: If amount/billed header wasn't found but unit_price was, the right-most numeric column might be Line_Total
      
      if (headers.cpt || headers.billed_amount) {
        for (let r = 2; r <= maxRow; r++) {
          const rowData = grid[r] || {};
          const cptVal = headers.cpt ? (rowData[headers.cpt] || "") : "";
          const amtVal = headers.billed_amount ? (rowData[headers.billed_amount] || "") : "";
          
          if (cptVal.trim() !== "" || amtVal.trim() !== "") {
            let finalQty = headers.qty ? (rowData[headers.qty] || "1") : "1";
            if (finalQty.trim() === "") finalQty = "1";

            let finalAmtStr = amtVal.replace(/[^0-9.-]/g, '');
            let finalUnitPriceStr = headers.unit_price ? (rowData[headers.unit_price] || "").replace(/[^0-9.]/g, '') : null;

            // CARC / contractual adjustment (typically a negative dollar amount on EOBs)
            let adjRaw = headers.adjustment ? (rowData[headers.adjustment] || "").replace(/[^0-9.\-]/g, '') : null;
            let adjValue = adjRaw ? parseFloat(adjRaw) : 0;
            if (!isNaN(adjValue) && adjValue > 0) adjValue = -adjValue; // normalise: adjustments are negative

            // ICD-10 / diagnosis codes
            const dxRaw = headers.dx ? (rowData[headers.dx] || "").trim() : "";
            const ICD10_SERVER_RE = /\b([A-Z]\d{2}(?:\.\w{1,4})?)\b/g;
            const dxCodes = dxRaw ? [...dxRaw.matchAll(ICD10_SERVER_RE)].map(m => m[1]) : [];

            // Accept HCPCS L2 codes (letter + 4 digits) as valid billing codes
            const isValidCode = cptVal.trim() !== "" && (
              /^\d{5}$/.test(cptVal.trim()) || /^[A-Z]\d{4}$/.test(cptVal.trim())
            );

            const billedAmount = parseFloat(finalAmtStr) || 0.00;
            const paidAmount   = adjValue < 0 ? Math.max(0, billedAmount + adjValue) : 0;

            normalizedItems.push({
              Date: headers.date ? (rowData[headers.date] || "").trim() : "",
              CPT: cptVal.trim(),
              IsValidCode: isValidCode,
              Qty: parseFloat(finalQty) || 1,
              Unit_Price: finalUnitPriceStr && finalUnitPriceStr !== "" ? parseFloat(finalUnitPriceStr) : null,
              Modifier: headers.modifier ? (rowData[headers.modifier] || "").trim() : "",
              Billed_Amount: billedAmount,
              Adjustment: adjValue,
              Paid: paidAmount,
              DX: dxCodes,  // ICD-10 diagnosis codes for CO-11 detection
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

  try {
    await runMiddleware(req, res, upload.single('bill'));
    if (!req.file) return res.status(400).json({ error: "Missing PDF" });

    // Step 1: Textract Extraction
    const command = new AnalyzeDocumentCommand({
      Document: {
        Bytes: req.file.buffer
      },
      FeatureTypes: ["TABLES", "FORMS"]
    });

    const data = await textractClient.send(command).catch(err => {
        throw new Error(`AWS Textract OCR Failed: ${err.message}`);
    });
    
    // Step 2: Normalization
    let normalizedItems = [];
    let grandTotal = null;
    try {
        const result = normalizeTextractOutput(data.Blocks || []);
        normalizedItems = result.items;
        grandTotal = result.grandTotal;
    } catch (err) {
        throw new Error(`Normalization Layer Error: Failed to parse bill table structure. ${err.message}`);
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
