import { checkAdminSecret, corsHeaders, jsonResponse, listTriviaSetsForAdmin, methodNotAllowed } from "../_shared/trivia.ts";

/** Legacy alias — prefer trivia-admin-schedule with action: "list". */
Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (req.method !== "POST") return methodNotAllowed();

  try {
    const body = await req.json().catch(() => ({}));
    const denied = checkAdminSecret(body);
    if (denied) return denied;
    return await listTriviaSetsForAdmin();
  } catch (error: any) {
    return jsonResponse({ ok: false, error: error.message ?? "Failed to list trivia sets" }, 500);
  }
});
