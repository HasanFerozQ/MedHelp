import { corsHeaders, getServiceClient, jsonResponse, methodNotAllowed } from "../_shared/trivia.ts";

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (req.method !== "POST") return methodNotAllowed();

  try {
    const body = await req.json();
    const sessionId = body.session_id as string;
    if (!sessionId) return jsonResponse({ error: "session_id is required" }, 400);

    const admin = getServiceClient();
    const { data: finalizeRows, error: finalizeError } = await admin.rpc("finalize_trivia_session", {
      p_session_id: sessionId,
    });
    if (finalizeError) throw finalizeError;
    const finalized = finalizeRows?.[0];
    if (!finalized) return jsonResponse({ error: "Failed to finalize session" }, 500);

    const { data: sessionRow, error: sessionErr } = await admin
      .from("trivia_sessions")
      .select("set_id, score")
      .eq("id", sessionId)
      .single();
    if (sessionErr) throw sessionErr;

    const { count: totalCount, error: totalErr } = await admin
      .from("trivia_sessions")
      .select("*", { count: "exact", head: true })
      .eq("set_id", sessionRow.set_id)
      .eq("status", "finished");
    if (totalErr) throw totalErr;

    const { count: atOrBelowCount, error: rankErr } = await admin
      .from("trivia_sessions")
      .select("*", { count: "exact", head: true })
      .eq("set_id", sessionRow.set_id)
      .eq("status", "finished")
      .lte("score", sessionRow.score);
    if (rankErr) throw rankErr;

    const percentile =
      totalCount && atOrBelowCount
        ? Number(((atOrBelowCount / totalCount) * 100).toFixed(2))
        : null;

    if (percentile !== null) {
      await admin
        .from("trivia_sessions")
        .update({ rank_percentile: percentile })
        .eq("id", sessionId);
    }

    // Recalculate and upsert daily stats so the result modal shows real numbers
    const { data: setRow } = await admin
      .from("trivia_sets")
      .select("scheduled_date")
      .eq("id", sessionRow.set_id)
      .single();

    const { count: participants } = await admin
      .from("trivia_sessions")
      .select("*", { count: "exact", head: true })
      .eq("set_id", sessionRow.set_id);

    const { count: completers } = await admin
      .from("trivia_sessions")
      .select("*", { count: "exact", head: true })
      .eq("set_id", sessionRow.set_id)
      .eq("status", "finished");

    const { count: perfect10 } = await admin
      .from("trivia_sessions")
      .select("*", { count: "exact", head: true })
      .eq("set_id", sessionRow.set_id)
      .eq("status", "finished")
      .eq("score", 10);

    const { data: avgRow } = await admin
      .from("trivia_sessions")
      .select("score")
      .eq("set_id", sessionRow.set_id)
      .eq("status", "finished");
    const avgScore = avgRow && avgRow.length > 0
      ? Number((avgRow.reduce((sum, r) => sum + (r.score || 0), 0) / avgRow.length).toFixed(2))
      : 0;

    await admin
      .from("trivia_daily_stats")
      .upsert({
        set_id: sessionRow.set_id,
        scheduled_date: setRow?.scheduled_date,
        participants: participants || 0,
        completers: completers || 0,
        perfect_10: perfect10 || 0,
        avg_score: avgScore,
        refreshed_at: new Date().toISOString(),
      }, { onConflict: "set_id" });

    const { data: stats } = await admin
      .from("trivia_daily_stats")
      .select("participants, completers, perfect_10, avg_score, refreshed_at")
      .eq("set_id", sessionRow.set_id)
      .maybeSingle();

    return jsonResponse({
      session: { ...finalized, rank_percentile: percentile },
      stats: stats ?? null,
    });
  } catch (error: any) {
    return jsonResponse({ error: error.message ?? "Failed to finalize trivia" }, 500);
  }
});
