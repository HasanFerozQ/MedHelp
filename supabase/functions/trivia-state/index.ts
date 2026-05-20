import "@supabase/functions-js/edge-runtime.d.ts";
import { corsHeaders, getServiceClient, jsonResponse, methodNotAllowed } from "../_shared/trivia.ts";

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (!["GET", "POST"].includes(req.method)) return methodNotAllowed();

  try {
    const admin = getServiceClient();
    const nowIso = new Date().toISOString();

    const [{ data: stateData, error: stateError }, { data: todaySet, error: todayError }] = await Promise.all([
      admin.rpc("get_current_trivia_state", { now_tz: nowIso }),
      admin.rpc("get_today_set_for_play"),
    ]);

    if (stateError) throw stateError;
    if (todayError) throw todayError;

    let stats = null;
    if (todaySet?.[0]?.set_id) {
      const { data: statRow } = await admin
        .from("trivia_daily_stats")
        .select("participants, completers, perfect_10, avg_score, refreshed_at")
        .eq("set_id", todaySet[0].set_id)
        .maybeSingle();
      stats = statRow;
    }

    return jsonResponse({
      state: stateData,
      now_iso: nowIso,
      today_set: todaySet?.[0] ?? null,
      stats,
    });
  } catch (error: any) {
    return jsonResponse({ error: error.message ?? "Failed to fetch trivia state" }, 500);
  }
});
