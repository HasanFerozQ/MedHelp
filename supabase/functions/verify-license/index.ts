// Setup type definitions for built-in Supabase Runtime APIs
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
      throw new Error("License key and email are required.");
    }

    // 2. Setup Supabase Admin Client
    const supabaseAdmin = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
    );

    // 3. Verify with Gumroad (Proxy)
    // product_permalink is the URL slug (e.g. "medical-exam-mastery" from gumroad.com/l/medical-exam-mastery)
    const productPermalink = Deno.env.get("GUMROAD_PRODUCT_PERMALINK") ?? "medical-exam-mastery";
    
    console.log(`Verifying license: ${license_key} for permalink: ${productPermalink}`);

    const gumroadRes = await fetch("https://api.gumroad.com/v2/licenses/verify", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: new URLSearchParams({
        product_permalink: productPermalink,
        license_key: license_key,
        increment_uses_count: "false",
      }),
    });

    const data = await gumroadRes.json();

    // 4. Custom Logic Check (device limit = 5)
    if (data.success) {
      if (data.uses > 5) {
        return new Response(
          JSON.stringify({ success: false, message: "LICENSE_LIMIT_REACHED" }),
          { headers: { ...corsHeaders, "Content-Type": "application/json" }, status: 403 }
        );
      }

      // 5. Audit Log (as requested)
      const clientIp = req.headers.get("x-real-ip") || req.headers.get("x-forwarded-for") || "unknown";
      const userAgent = req.headers.get("user-agent") || "unknown";

      await supabaseAdmin.from("license_activations").insert({
        license_key: license_key,
        email: email,
        device_ip: clientIp,
        user_agent: userAgent,
        gumroad_uses: data.uses
      });

      return new Response(
        JSON.stringify({ success: true, uses: data.uses }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" }, status: 200 }
      );
    } else {
      return new Response(
        JSON.stringify({ success: false, message: "INVALID_LICENSE" }),
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
