// Setup type definitions for built-in Supabase Runtime APIs
import "@supabase/functions-js/edge-runtime.d.ts"
import { TextractClient, AnalyzeDocumentCommand } from "npm:@aws-sdk/client-textract@3.500.0";
import { createClient } from "npm:@supabase/supabase-js@2.45.0";
import { Buffer } from "node:buffer";

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

// Hardcoded for now per user instruction, move to .env later
const accessKeyId = Deno.env.get('AWS_ACCESS_KEY_ID') || "AKIAW2FKXVUMBQW32WQD";
const secretAccessKey = Deno.env.get('AWS_SECRET_ACCESS_KEY') || "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";
const region = Deno.env.get('AWS_REGION') || "us-east-1";

const textractClient = new TextractClient({
  region,
  credentials: {
      accessKeyId,
      secretAccessKey
  }
});

const supabaseAdmin = createClient(
  Deno.env.get('SUPABASE_URL') ?? '',
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
);

function getText(block: any, blockMap: any) {
  let text = "";
  if (block.Relationships) {
    block.Relationships.forEach((rel: any) => {
      if (rel.Type === "CHILD") {
        rel.Ids.forEach((id: string) => {
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

function normalizeTextractOutput(blocks: any[]) {
  const blockMap: any = {};
  blocks.forEach(b => blockMap[b.Id] = b);
  
  const tables = blocks.filter(b => b.BlockType === "TABLE");
  const keyValues = blocks.filter(b => b.BlockType === "KEY_VALUE_SET");

  let normalizedItems: any[] = [];
  let grandTotal: number | null = null;

  // 1. Extract Grand Total
  keyValues.forEach(kv => {
    if (kv.EntityTypes && kv.EntityTypes.includes("KEY")) {
      const keyText = getText(kv, blockMap).toLowerCase();
      if (keyText.includes("total") || keyText.includes("amount due") || keyText.includes("balance")) {
        let valText: string | null = null;
        if (kv.Relationships) {
          kv.Relationships.forEach((rel: any) => {
            if (rel.Type === "VALUE") {
              rel.Ids.forEach((id: string) => {
                const valBlock = blockMap[id];
                valText = getText(valBlock, blockMap);
              });
            }
          });
        }
        if (valText) {
          const parsedVal = parseFloat(valText.replace(/[^0-9.]/g, ''));
          if (!isNaN(parsedVal) && parsedVal > 0) {
             grandTotal = parsedVal;
          }
        }
      }
    }
  });

  // 2. Extract Line Items
  tables.forEach(tableBlock => {
    const grid: any = {}; 
    let maxRow = 0;
    let maxCol = 0;

    if (tableBlock.Relationships) {
      tableBlock.Relationships.forEach((rel: any) => {
        if (rel.Type === "CHILD") {
          rel.Ids.forEach((id: string) => {
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
      let headers: any = {};
      
      for (let c = 1; c <= maxCol; c++) {
        const text = (grid[1] && grid[1][c]) ? grid[1][c].toLowerCase() : "";
        if (text.includes("date")) headers.date = c;
        else if (text.includes("cpt") || text.includes("code") || text.includes("hcpcs")) headers.cpt = c;
        else if (text.includes("qty") || text.includes("unit") || text.includes("quantity")) headers.qty = c;
        else if (text.includes("price") || text.includes("rate") || text.includes("fee")) headers.unit_price = c;
        else if (text.includes("mod")) headers.modifier = c;
        else if (text.includes("charge") || text.includes("amount") || text.includes("billed") || text.includes("total")) headers.billed_amount = c;
      }

      if (headers.cpt || headers.billed_amount) {
        for (let r = 2; r <= maxRow; r++) {
          const rowData = grid[r] || {};
          const cptVal = headers.cpt ? (rowData[headers.cpt] || "") : "";
          const amtVal = headers.billed_amount ? (rowData[headers.billed_amount] || "") : "";
          
          if (cptVal.trim() !== "" || amtVal.trim() !== "") {
            let finalQty = headers.qty ? (rowData[headers.qty] || "1") : "1";
            if (finalQty.trim() === "") finalQty = "1";
            
            let finalAmtStr = amtVal.replace(/[^0-9.]/g, '');
            let finalUnitPriceStr = headers.unit_price ? (rowData[headers.unit_price] || "").replace(/[^0-9.]/g, '') : null;

            normalizedItems.push({
              Date: headers.date ? (rowData[headers.date] || "").trim() : "",
              CPT: cptVal.trim(),
              Qty: parseFloat(finalQty) || 1,
              Unit_Price: finalUnitPriceStr && finalUnitPriceStr !== "" ? parseFloat(finalUnitPriceStr) : null,
              Modifier: headers.modifier ? (rowData[headers.modifier] || "").trim() : "",
              Billed_Amount: parseFloat(finalAmtStr) || 0.00
            });
          }
        }
      }
    }
  });

  return { items: normalizedItems, grandTotal };
}

function runArithmeticEngine(items: any[], grandTotal: number | null) {
  let findings: any[] = [];
  let calculatedSum = 0;
  let seenCodes = new Set<string>();
  
  const distinctModifiers = ["59", "76", "91", "RT", "LT", "XE", "XS", "XP", "XU"];

  items.forEach(item => {
    calculatedSum += item.Billed_Amount;

    if (item.Unit_Price !== null) {
      const expectedTotal = item.Qty * item.Unit_Price;
      const difference = Math.abs(expectedTotal - item.Billed_Amount);
      
      if (difference > 0.001) {
        findings.push({
          type: "Warning",
          code: item.CPT,
          title: "Math Mismatch",
          reason: `Line item Math Error. Expected $${expectedTotal.toFixed(2)} (${item.Qty} x $${item.Unit_Price.toFixed(2)}) but billed $${item.Billed_Amount.toFixed(2)}.`
        });
      }
    }

    if (item.CPT && item.CPT !== "") {
      const codeKey = `${item.Date}-${item.CPT}`;
      
      if (seenCodes.has(codeKey)) {
        let hasDistinctModifier = false;
        if (item.Modifier) {
          const presentModifiers = item.Modifier.split(",").map((m: string) => m.trim().toUpperCase());
          hasDistinctModifier = presentModifiers.some((m: string) => distinctModifiers.includes(m));
        }

        if (!hasDistinctModifier) {
          findings.push({
            type: "Danger",
            code: item.CPT,
            title: "Potential Duplicate",
            reason: `Duplicate charge for code ${item.CPT} on same date. No distinct unbundling modifier detected.`
          });
        }
      } else {
        seenCodes.add(codeKey);
      }
    }
  });

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
async function runClinicalEngine(items: any[]) {
  const clinicalFindings: any[] = [];
  let totalBenchmark = 0;
  let savingsOpportunity = 0;

  // 1. UNIQUE CODES for Bulk Pricing Lookup
  const allCodes = [...new Set(items.map(i => (i.CPT || "").trim().toUpperCase()).filter(c => c && c.length >= 2))];
  const cptCodes = allCodes.filter(c => /^[0-9]{5}$/.test(c));
  const drugCodes = allCodes.filter(c => /^[A-Z][0-9]{4}$/.test(c)); // J, Q, P, V codes
  
  // Parallel Fetch from both tables
  const [cptRes, drugRes] = await Promise.all([
    supabaseAdmin.from('cpt_medicare_fees').select('cpt_code, base_price, description').in('cpt_code', cptCodes),
    supabaseAdmin.from('hcpcs_drug_fees').select('hcpcs_code, payment_limit, short_description').in('hcpcs_code', drugCodes)
  ]);

  const feeMap: Record<string, { price: number, type: string, desc?: string }> = {};
  (cptRes.data || []).forEach((f: any) => { feeMap[f.cpt_code] = { price: f.base_price, type: 'CPT', desc: f.description }; });
  (drugRes.data || []).forEach((f: any) => { feeMap[f.hcpcs_code] = { price: f.payment_limit, type: 'DRUG', desc: f.short_description }; });

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

  const itemsByDate = items.reduce((acc: any, item) => {
    if (!acc[item.Date]) acc[item.Date] = [];
    acc[item.Date].push(item);
    return acc;
  }, {});

  for (const date in itemsByDate) {
    const dateItems = itemsByDate[date];
    if (dateItems.length < 2) continue;

    const codesForDate = dateItems.map(i => i.CPT).filter(c => c && c.length >= 5);
    
    const { data: ncciEdits } = await supabaseAdmin
      .from('ncci_ptp_edits')
      .select('column1_code, column2_code, modifier_allowed')
      .in('column1_code', codesForDate)
      .in('column2_code', codesForDate);

    if (ncciEdits && ncciEdits.length > 0) {
      ncciEdits.forEach(edit => {
          const componentItem = dateItems.find(i => i.CPT === edit.column2_code);
          const primaryItem = dateItems.find(i => i.CPT === edit.column1_code);

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
                                (primaryItem.Modifier && primaryItem.Modifier !== "");
            
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

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const { pdfBase64, mimeType } = await req.json();

    if (!pdfBase64) {
      return new Response(
        JSON.stringify({ error: "No document base64 provided." }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const pdfBuffer = Buffer.from(pdfBase64, "base64");

    const command = new AnalyzeDocumentCommand({
      Document: {
        Bytes: pdfBuffer
      },
      FeatureTypes: ["TABLES", "FORMS"]
    });

    let data;
    try {
        data = await textractClient.send(command);
    } catch (err: any) {
        throw new Error(`AWS Textract OCR Failed: ${err.message}`);
    }
    
    let normalizedItems: any[] = [];
    let grandTotal = null;
    try {
        const result = normalizeTextractOutput(data.Blocks || []);
        normalizedItems = result.items;
        grandTotal = result.grandTotal;
    } catch (err: any) {
        throw new Error(`Normalization Layer Error: Failed to parse bill. ${err.message}`);
    }

    let engineResults = { findings: [] };
    try {
        engineResults = runArithmeticEngine(normalizedItems, grandTotal);
    } catch (err: any) {
         throw new Error(`Arithmetic Engine Error: Mathematical validation loop crashed. ${err.message}`);
    }

    // Step 4: Clinical Engine (New for Step 5)
    let clinicalResults = { clinicalFindings: [], savingsOpportunity: 0, totalBenchmark: 0 };
    try {
        clinicalResults = await runClinicalEngine(normalizedItems);
    } catch (err: any) {
        console.error("Clinical Engine Error:", err.message);
    }

    const allFindings = [...engineResults.findings, ...clinicalResults.clinicalFindings];
    const numAnomalies = allFindings.length;
    
    let summaryText = `Found ${normalizedItems.length} billing items. Clinical datasets detect $${clinicalResults.savingsOpportunity.toFixed(2)} in potential savings.`;
    if (numAnomalies > 5) {
        summaryText = `High Risk: ${numAnomalies} critical billing anomalies isolated. Potential savings estimated at $${clinicalResults.savingsOpportunity.toFixed(2)}.`;
    }

    return new Response(
      JSON.stringify({ 
        ok: true,
        normalized_bill: normalizedItems, 
        result: {
            summary: summaryText,
            findings: allFindings,
            potential_savings: clinicalResults.savingsOpportunity,
            medicare_benchmark_total: clinicalResults.totalBenchmark
        }
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" }, status: 200 }
    );

  } catch (error: any) {
    console.error("Function error:", error);
    return new Response(JSON.stringify({ error: error.message, detailed_stack: error.stack }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
      status: 500,
    });
  }
});
