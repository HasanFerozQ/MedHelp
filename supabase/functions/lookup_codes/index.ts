// Setup type definitions for built-in Supabase Runtime APIs
import "@supabase/functions-js/edge-runtime.d.ts"
import { createClient } from "npm:@supabase/supabase-js@2.45.0";

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

const supabaseAdmin = createClient(
  Deno.env.get('SUPABASE_URL') ?? '',
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
);

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const { codes } = await req.json();

    if (!codes || !Array.isArray(codes) || codes.length === 0) {
      return new Response(
        JSON.stringify({ error: "No codes provided." }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // 1. UNIQUE CODES for Bulk Pricing Lookup
    const allCodes = [...new Set(codes.map(c => (c || "").trim().toUpperCase()).filter(c => c && c.length >= 2))];
    const cptCodes = allCodes.filter(c => /^[0-9]{5}$/.test(c));
    const drugCodes = allCodes.filter(c => /^[A-Z][0-9]{4}$/.test(c)); // J, Q, P, V codes
    
    // Parallel Fetch from both tables
    const [cptRes, drugRes, ncciRes] = await Promise.all([
      supabaseAdmin.from('cpt_medicare_fees').select('cpt_code, base_price, description').in('cpt_code', cptCodes),
      supabaseAdmin.from('hcpcs_drug_fees').select('hcpcs_code, payment_limit, short_description').in('hcpcs_code', drugCodes),
      supabaseAdmin.from('ncci_ptp_edits').select('column1_code, column2_code, modifier_allowed').in('column1_code', allCodes).in('column2_code', allCodes)
    ]);

    const feeMap: Record<string, { price: number, type: string, desc?: string }> = {};
    (cptRes.data || []).forEach((f: any) => { feeMap[f.cpt_code] = { price: f.base_price, type: 'CPT', desc: f.description }; });
    (drugRes.data || []).forEach((f: any) => { feeMap[f.hcpcs_code] = { price: f.payment_limit, type: 'DRUG', desc: f.short_description }; });

    return new Response(
      JSON.stringify({ 
        ok: true,
        fees: feeMap,
        ncci: ncciRes.data || []
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" }, status: 200 }
    );

  } catch (error: any) {
    console.error("Function error:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
      status: 500,
    });
  }
});
