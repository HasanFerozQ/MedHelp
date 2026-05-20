import "@supabase/functions-js/edge-runtime.d.ts";
import { corsHeaders, getServiceClient, jsonResponse, methodNotAllowed } from "../_shared/trivia.ts";

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (req.method !== "POST") return methodNotAllowed();

  try {
    const body = await req.json();
    const sessionId = body.session_id as string;
    const questionOrder = Number(body.question_order);

    if (!sessionId || !Number.isInteger(questionOrder) || questionOrder < 1 || questionOrder > 10) {
      return jsonResponse({ error: "session_id and question_order (1-10) are required" }, 400);
    }

    const admin = getServiceClient();
    const { data, error } = await admin.rpc("get_trivia_question", {
      p_session_id: sessionId,
      p_question_order: questionOrder,
    });
    if (error) throw error;

    if (!data?.[0]) return jsonResponse({ error: "Question not found" }, 404);
    return jsonResponse({ question: data[0] });
  } catch (error: any) {
    return jsonResponse({ error: error.message ?? "Failed to fetch question" }, 500);
  }
});
