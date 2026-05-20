import "@supabase/functions-js/edge-runtime.d.ts";
import { corsHeaders, getServiceClient, jsonResponse, methodNotAllowed } from "../_shared/trivia.ts";

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (req.method !== "POST") return methodNotAllowed();

  try {
    const body = await req.json();
    const sessionId = body.session_id as string;
    const questionOrder = Number(body.question_order);
    const selectedIndex = Number(body.selected_index);
    const questionStartedAt = body.question_started_at as string;
    const idempotencyKey = (body.idempotency_key ?? "").toString() || null;

    if (!sessionId || !questionStartedAt || !Number.isInteger(questionOrder) || !Number.isInteger(selectedIndex)) {
      return jsonResponse({ error: "Missing required payload" }, 400);
    }

    const admin = getServiceClient();
    const { data, error } = await admin.rpc("record_trivia_answer", {
      p_session_id: sessionId,
      p_question_order: questionOrder,
      p_selected_index: selectedIndex,
      p_question_started_at: questionStartedAt,
      p_idempotency_key: idempotencyKey,
    });
    if (error) throw error;

    return jsonResponse({ result: data?.[0] ?? null });
  } catch (error: any) {
    return jsonResponse({ error: error.message ?? "Failed to record answer" }, 500);
  }
});
