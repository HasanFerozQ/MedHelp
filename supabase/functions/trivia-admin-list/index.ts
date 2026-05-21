import { corsHeaders, getServiceClient, jsonResponse, methodNotAllowed } from "../_shared/trivia.ts";

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (req.method !== "POST") return methodNotAllowed();

  try {
    const body = await req.json().catch(() => ({}));
    const adminSecret = Deno.env.get("TRIVIA_ADMIN_SECRET");
    if (adminSecret && body.admin_secret !== adminSecret) {
      return jsonResponse({ error: "Unauthorized" }, 401);
    }

    const admin = getServiceClient();
    const { data: sets, error: setsErr } = await admin
      .from("trivia_sets")
      .select("id, scheduled_date, title, status, created_at, published_at, updated_at, allow_retakes")
      .order("created_at", { ascending: false });
    if (setsErr) throw setsErr;

    const { data: counts, error: countErr } = await admin
      .from("trivia_questions")
      .select("set_id");
    if (countErr) throw countErr;

    const countBySet = new Map<string, number>();
    for (const row of counts || []) {
      const id = row.set_id as string;
      countBySet.set(id, (countBySet.get(id) || 0) + 1);
    }

    const rows = (sets || []).map((s) => ({
      set_id: s.id,
      scheduled_date: s.scheduled_date,
      title: s.title,
      status: s.status,
      question_count: countBySet.get(s.id) || 0,
      created_at: s.created_at,
      published_at: s.published_at,
      updated_at: s.updated_at,
      allow_retakes: s.allow_retakes,
    }));

    return jsonResponse({ ok: true, sets: rows });
  } catch (error: any) {
    return jsonResponse({ error: error.message ?? "Failed to list trivia sets" }, 500);
  }
});
