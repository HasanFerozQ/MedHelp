import {
  checkAdminSecret,
  corsHeaders,
  getServiceClient,
  jsonResponse,
  listTriviaSetsForAdmin,
  methodNotAllowed,
} from "../_shared/trivia.ts";

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (req.method !== "POST") return methodNotAllowed();

  try {
    const body = await req.json().catch(() => ({}));
    const denied = checkAdminSecret(body);
    if (denied) return denied;

    const action = (body.action as string) || "upload";

    if (action === "list") {
      return await listTriviaSetsForAdmin();
    }

    const scheduledDate = body.scheduled_date as string;
    const title = body.title as string;
    const questions = body.questions as unknown;
    const publish = Boolean(body.publish);

    if (!scheduledDate || !questions) {
      return jsonResponse({ ok: false, error: "scheduled_date and questions are required" }, 400);
    }

    const admin = getServiceClient();
    const { data: setId, error } = await admin.rpc("upsert_trivia_set_with_questions", {
      p_scheduled_date: scheduledDate,
      p_title: title ?? "MedTrivia Daily",
      p_questions: questions,
      p_publish: publish,
    });
    if (error) throw error;

    return jsonResponse({ ok: true, set_id: setId, publish });
  } catch (error: any) {
    return jsonResponse({ ok: false, error: error.message ?? "Admin request failed" }, 500);
  }
});
