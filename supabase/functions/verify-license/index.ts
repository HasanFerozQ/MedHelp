// verify-license Edge Function
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

Deno.serve(async (req: Request) => {
  console.log(`Incoming request: ${req.method} ${req.url}`);
  
  // 1. Handle CORS Preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const { license_key, email } = await req.json();

    if (!license_key || !email) {
      return new Response(
        JSON.stringify({ success: false, message: "License key and email are required." }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" }, status: 400 }
      );
    }

    // 2. Setup Supabase Admin Client
    const supabaseAdmin = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
    );

    // 3. Verify with Gumroad
    // IMPORTANT: Gumroad API requires 'product_id' with the INTERNAL hash ID (not the URL permalink).
    // The correct value was confirmed from Gumroad's own error: "Please set 'product_id' to 'xGFF04xgo4rpezVD6BupmA=='"
    const productId = Deno.env.get("GUMROAD_PRODUCT_ID") ?? "xGFF04xgo4rpezVD6BupmA==";
    
    console.log(`Verifying key: ${license_key} | product_id: ${productId} | email: ${email}`);

    const gumroadRes = await fetch("https://api.gumroad.com/v2/licenses/verify", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: new URLSearchParams({
        product_id: productId,
        license_key: license_key,
        increment_uses_count: "false",
      }),
    });

    const gumroadText = await gumroadRes.text();
    console.log(`Gumroad response (status ${gumroadRes.status}): ${gumroadText}`);

    let data: any = {};
    try { data = JSON.parse(gumroadText); } catch (_) {}

    console.log(`Gumroad success: ${data.success} | uses: ${data.uses}`);

    // 4. Check device limit (max 5 activations)
    if (data.success) {
      if (data.uses > 5) {
        return new Response(
          JSON.stringify({ success: false, message: "LICENSE_LIMIT_REACHED" }),
          { headers: { ...corsHeaders, "Content-Type": "application/json" }, status: 403 }
        );
      }

      // 5. Audit Log — non-fatal, don't crash if table doesn't exist
      try {
        const clientIp = req.headers.get("x-real-ip") || req.headers.get("x-forwarded-for") || "unknown";
        const userAgent = req.headers.get("user-agent") || "unknown";
        const { error: insertErr } = await supabaseAdmin.from("license_activations").insert({
          license_key: license_key,
          email: email,
          device_ip: clientIp,
          user_agent: userAgent,
          gumroad_uses: data.uses
        });
        if (insertErr) console.warn("Audit log insert failed (non-fatal):", insertErr.message);
      } catch (auditErr: any) {
        console.warn("Audit log error (non-fatal):", auditErr.message);
      }

      return new Response(
        JSON.stringify({ success: true, uses: data.uses }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" }, status: 200 }
      );
    } else {
      // Return the actual Gumroad message for debugging
      const msg = data.message || "INVALID_LICENSE";
      console.error(`Gumroad rejected key. Message: ${msg}`);
      return new Response(
        JSON.stringify({ success: false, message: "INVALID_LICENSE", gumroad_message: msg }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" }, status: 401 }
      );
    }

  } catch (error: any) {
    console.error("Verification Error:", error.message);
    return new Response(
      JSON.stringify({ success: false, message: error.message }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" }, status: 500 }
    );
  }
});
