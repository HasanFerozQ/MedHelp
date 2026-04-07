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
    const { codes, npis } = await req.json();

    // 1. CODING DATA (Medicare Fees & NCCI)
    const allCodes = Array.isArray(codes) ? [...new Set(codes.map(c => (c || "").trim().toUpperCase()).filter(c => c && c.length >= 2))] : [];
    const cptCodes = allCodes.filter(c => /^[0-9]{5}$/.test(c));
    const drugCodes = allCodes.filter(c => /^[A-Z][0-9]{4}$/.test(c));
    
    const [cptRes, drugRes, ncciRes] = await Promise.all([
      allCodes.length > 0 ? supabaseAdmin.from('cpt_medicare_fees').select('cpt_code, base_price, description').in('cpt_code', cptCodes) : { data: [] },
      allCodes.length > 0 ? supabaseAdmin.from('hcpcs_drug_fees').select('hcpcs_code, payment_limit, short_description').in('hcpcs_code', drugCodes) : { data: [] },
      allCodes.length > 0 ? supabaseAdmin.from('ncci_ptp_edits').select('column1_code, column2_code, modifier_allowed').in('column1_code', allCodes).in('column2_code', allCodes) : { data: [] }
    ]);

    const feeMap: Record<string, { price: number, type: string, desc?: string }> = {};
    (cptRes.data || []).forEach((f: any) => { feeMap[f.cpt_code] = { price: f.base_price, type: 'CPT', desc: f.description }; });
    (drugRes.data || []).forEach((f: any) => { feeMap[f.hcpcs_code] = { price: f.payment_limit, type: 'DRUG', desc: f.short_description }; });

    // 2. PROVIDER DATA (NPPES API Proxy)
    let providerMap = {};
    if (npis && Array.isArray(npis) && npis.length > 0) {
      // NPPES API allows single number lookup. For simplicity, we loop or use their bulk (if available)
      // Here we use a limited loop for top 3 NPIs found on a bill (usually 1-2)
      const uniqueNpis = [...new Set(npis)].slice(0, 3);
      const providerPromises = uniqueNpis.map(async (npi) => {
        try {
          const res = await fetch(`https://npiregistry.cms.hhs.gov/api/v2.0/?number=${npi}&version=2.1`);
          const data = await res.json();
          if (data.results && data.results.length > 0) {
            const p = data.results[0];
            return {
              npi,
              name: p.basic.organization_name || `${p.basic.first_name} ${p.basic.last_name}`,
              specialty: p.taxonomies?.[0]?.desc || 'Medical Provider',
              status: p.basic.status || 'Active'
            };
          }
        } catch (e) { return null; }
      });
      const providers = await Promise.all(providerPromises);
      providers.filter(p => !!p).forEach(p => providerMap[p.npi] = p);
    }

    return new Response(
      JSON.stringify({ 
        ok: true,
        fees: feeMap,
        ncci: ncciRes.data || [],
        providers: providerMap
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
