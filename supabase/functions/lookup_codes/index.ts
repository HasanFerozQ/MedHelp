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
    const { codes, npis, q, type } = await req.json();

    // ── 1. SEARCH MODE ──────────────────────────────────────────────────────
    if (q && q.trim().length >= 2) {
      const query = `%${q}%`;
      let searchData: any[] = [];

      if (type === 'denials') {
        const { data } = await supabaseAdmin
          .from('denial_codes')
          .select('code, description')
          .or(`code.ilike.${query},description.ilike.${query}`)
          .limit(15);
        searchData = data || [];
      } else {
        // CPT / HCPCS Code Search across fees tables
        const [cptRes, drugRes] = await Promise.all([
          supabaseAdmin
            .from('cpt_medicare_fees')
            .select('cpt_code, base_price, description')
            .or(`cpt_code.ilike.${query},description.ilike.${query}`)
            .limit(10),
          supabaseAdmin
            .from('hcpcs_drug_fees')
            .select('hcpcs_code, payment_limit, short_description')
            .or(`hcpcs_code.ilike.${query},short_description.ilike.${query}`)
            .limit(10)
        ]);

        searchData = [
          ...(cptRes.data || []).map((r: any) => ({ code: r.cpt_code, desc: r.description, price: r.base_price, type: 'CPT' })),
          ...(drugRes.data || []).map((r: any) => ({ code: r.hcpcs_code, desc: r.short_description, price: r.payment_limit, type: 'DRUG' }))
        ];
      }

      return new Response(JSON.stringify({ ok: true, results: searchData }), {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 200
      });
    }

    // ── 2. CODING DATA LOOKUP (called by the audit engine) ─────────────────
    const allCodes = Array.isArray(codes)
      ? [...new Set(codes.map((c: any) => (c || "").trim().toUpperCase()).filter((c: string) => c && c.length >= 2))]
      : [];

    // Separate numeric CPT codes from HCPCS L2 (letter + 4 digits)
    const cptCodes  = allCodes.filter((c: string) => /^[0-9]{5}$/.test(c));
    const hcpcsCodes= allCodes.filter((c: string) => /^[A-Z][0-9]{4}$/.test(c));
    const drugCodes = hcpcsCodes; // hcpcs_drug_fees uses same format

    // ── Fire all DB queries in parallel ──────────────────────────────────────
    const [cptRes, drugRes, ncciRes, mueRes] = await Promise.all([

      // Medicare Physician Fee Schedule
      allCodes.length > 0
        ? supabaseAdmin
            .from('cpt_medicare_fees')
            .select('cpt_code, base_price, description')
            .in('cpt_code', allCodes)           // covers both CPT and HCPCS L2
        : Promise.resolve({ data: [] }),

      // Specialty drug / HCPCS fee table
      drugCodes.length > 0
        ? supabaseAdmin
            .from('hcpcs_drug_fees')
            .select('hcpcs_code, payment_limit, short_description')
            .in('hcpcs_code', drugCodes)
        : Promise.resolve({ data: [] }),

      // NCCI PTP bundling edits
      // Returns all pairs where BOTH column1 AND column2 are in the code list
      allCodes.length > 0
        ? supabaseAdmin
            .from('ncci_ptp_edits')
            .select('column1_code, column2_code, modifier_allowed')
            .in('column1_code', allCodes)
            .in('column2_code', allCodes)
        : Promise.resolve({ data: [] }),

      // ── NEW: MUE daily unit limits ──────────────────────────────────────
      allCodes.length > 0
        ? supabaseAdmin
            .from('mue_limits')
            .select('cpt_code, mue_value, mue_mai, description')
            .in('cpt_code', allCodes)
        : Promise.resolve({ data: [] }),
    ]);

    // ── Build fee map (CPT fees take priority, drug fees fill gaps) ──────────
    const feeMap: Record<string, { price: number; type: string; desc?: string }> = {};
    (cptRes.data || []).forEach((f: any) => {
      feeMap[f.cpt_code] = { price: f.base_price, type: 'CPT', desc: f.description };
    });
    (drugRes.data || []).forEach((f: any) => {
      // Only add if not already from cpt_medicare_fees (avoid overwriting with $0 drug price)
      if (!feeMap[f.hcpcs_code]) {
        feeMap[f.hcpcs_code] = { price: f.payment_limit, type: 'DRUG', desc: f.short_description };
      }
    });

    // ── Build MUE map: { [cpt_code]: { limit, mai, desc } } ──────────────────
    const mueMap: Record<string, { limit: number; mai: string; desc: string }> = {};
    (mueRes.data || []).forEach((m: any) => {
      mueMap[m.cpt_code] = {
        limit: m.mue_value,
        mai  : m.mue_mai  || '',
        desc : m.description || ''
      };
    });

    // ── 3. PROVIDER DATA (NPPES proxy) ────────────────────────────────────────
    const providerMap: Record<string, any> = {};
    if (npis && Array.isArray(npis) && npis.length > 0) {
      const uniqueNpis = [...new Set(npis as string[])].slice(0, 3);
      const providerPromises = uniqueNpis.map(async (npi) => {
        try {
          const res  = await fetch(`https://npiregistry.cms.hhs.gov/api/v2.0/?number=${npi}&version=2.1`);
          const data = await res.json();
          if (data.results?.length > 0) {
            const p = data.results[0];
            return {
              npi,
              name     : p.basic.organization_name || `${p.basic.first_name} ${p.basic.last_name}`,
              specialty: p.taxonomies?.[0]?.desc   || 'Medical Provider',
              status   : p.basic.status             || 'Active'
            };
          }
        } catch (_) { return null; }
      });
      const providers = await Promise.all(providerPromises);
      providers.filter(Boolean).forEach((p: any) => { providerMap[p.npi] = p; });
    }

    // ── Response ──────────────────────────────────────────────────────────────
    return new Response(
      JSON.stringify({
        ok       : true,
        fees     : feeMap,      // { [code]: { price, type, desc } }
        ncci     : ncciRes.data || [],  // [{ column1_code, column2_code, modifier_allowed }]
        mue      : mueMap,      // { [code]: { limit, mai, desc } }  ← NEW
        providers: providerMap  // { [npi]: { name, specialty, status } }
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" }, status: 200 }
    );

  } catch (error: any) {
    console.error("lookup_codes Function error:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
      status: 500,
    });
  }
});
