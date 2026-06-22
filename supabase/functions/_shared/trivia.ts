import { createClient } from "npm:@supabase/supabase-js@2.45.0";

export const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

export function jsonResponse(payload: unknown, status = 200) {
  return new Response(JSON.stringify(payload), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

export function methodNotAllowed() {
  return jsonResponse({ error: "Method not allowed" }, 405);
}

export function getServiceClient() {
  return createClient(
    Deno.env.get("SUPABASE_URL") ?? "",
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
  );
}

export function getUserClient(req: Request) {
  const authHeader = req.headers.get("Authorization") ?? "";
  return createClient(
    Deno.env.get("SUPABASE_URL") ?? "",
    Deno.env.get("SUPABASE_ANON_KEY") ?? "",
    { global: { headers: { Authorization: authHeader } } },
  );
}

export async function getIdentity(req: Request) {
  const userClient = getUserClient(req);
  const authHeader = req.headers.get("Authorization");
  if (!authHeader) return { userId: null as string | null };
  const { data, error } = await userClient.auth.getUser();
  if (error || !data.user) return { userId: null as string | null };
  return { userId: data.user.id };
}

export function checkAdminSecret(body: { admin_secret?: string }) {
  const adminSecret = Deno.env.get("TRIVIA_ADMIN_SECRET");
  if (adminSecret && body.admin_secret !== adminSecret) {
    return jsonResponse({ ok: false, error: "Unauthorized" }, 401);
  }
  return null;
}

export async function listTriviaSetsForAdmin() {
  const admin = getServiceClient();
  const { data: sets, error: setsErr } = await admin
    .from("trivia_sets")
    .select("id, scheduled_date, title, status, created_at, published_at, updated_at, allow_retakes")
    .order("created_at", { ascending: false });
  if (setsErr) throw setsErr;

  const { data: counts, error: countErr } = await admin.from("trivia_questions").select("set_id");
  if (countErr) throw countErr;

  const { data: sessions, error: sessErr } = await admin
    .from("trivia_sessions")
    .select("set_id, status");
  if (sessErr) throw sessErr;

  const countBySet = new Map<string, number>();
  for (const row of counts || []) {
    const id = row.set_id as string;
    countBySet.set(id, (countBySet.get(id) || 0) + 1);
  }

  const participantsBySet = new Map<string, number>();
  const completersBySet = new Map<string, number>();
  for (const row of sessions || []) {
    const id = row.set_id as string;
    participantsBySet.set(id, (participantsBySet.get(id) || 0) + 1);
    if (row.status === "finished") {
      completersBySet.set(id, (completersBySet.get(id) || 0) + 1);
    }
  }

  const rows = (sets || []).map((s) => ({
    set_id: s.id,
    scheduled_date: s.scheduled_date,
    title: s.title,
    status: s.status,
    question_count: countBySet.get(s.id) || 0,
    participants: participantsBySet.get(s.id) || 0,
    completers: completersBySet.get(s.id) || 0,
    created_at: s.created_at,
    published_at: s.published_at,
    updated_at: s.updated_at,
    allow_retakes: s.allow_retakes,
  }));

  return jsonResponse({ ok: true, sets: rows });
}
