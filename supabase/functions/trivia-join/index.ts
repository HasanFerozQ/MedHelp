import { corsHeaders, getIdentity, getServiceClient, jsonResponse, methodNotAllowed } from "../_shared/trivia.ts";

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  if (req.method !== "POST") return methodNotAllowed();

  try {
    const body = await req.json().catch(() => ({}));
    const timezone = body.timezone ?? "UTC";
    const guestToken = (body.guest_token ?? "").toString().trim();
    const guestUsername = (body.guest_username ?? "").toString().trim();

    const { userId } = await getIdentity(req);
    if (!userId && !guestToken) {
      return jsonResponse({ error: "guest_token is required for unauthenticated users" }, 400);
    }

    const admin = getServiceClient();
    const { data: todaySetRows, error: todayError } = await admin.rpc("get_today_set_for_play");
    if (todayError) throw todayError;
    if (!todaySetRows?.[0]) return jsonResponse({ error: "No trivia set scheduled for today" }, 404);

    const todaySet = todaySetRows[0];

    // Time window validation (same as RPC trivia_join_session)
    const now = new Date();
    const startAt = todaySet.start_at ? new Date(todaySet.start_at) : null;
    const endAt = todaySet.end_at ? new Date(todaySet.end_at) : null;
    
    if (startAt && now < startAt) {
      return jsonResponse({ error: "Trivia opens at 8:00 PM Eastern Time." }, 403);
    }
    if (endAt && (now > endAt || todaySet.status === "closed")) {
      return jsonResponse({ error: "Today's trivia has closed. Come back tomorrow at 8 PM ET!" }, 403);
    }
    const identityColumn = userId ? "user_id" : "guest_token";
    const identityValue = userId ?? guestToken;

    const { data: existingSession, error: existingError } = await admin
      .from("trivia_sessions")
      .select("id, set_id, status, started_at, ended_at, score, correct_count, share_grid")
      .eq("set_id", todaySet.set_id)
      .eq(identityColumn, identityValue)
      .maybeSingle();
    if (existingError) throw existingError;

    if (existingSession) {
      return jsonResponse({ reused: true, session: existingSession, set: todaySet });
    }

    const insertPayload = {
      set_id: todaySet.set_id,
      user_id: userId,
      guest_token: userId ? null : guestToken,
      guest_username: userId ? null : (guestUsername || null),
      timezone_snapshot: timezone,
      client_started_at: new Date().toISOString(),
      status: 'active',
    };

    const { data: newSession, error: insertError } = await admin
      .from("trivia_sessions")
      .insert(insertPayload)
      .select("id, set_id, status, started_at, ended_at, score, correct_count, share_grid")
      .single();
    if (insertError) throw insertError;

    return jsonResponse({ reused: false, session: newSession, set: todaySet });
  } catch (error: any) {
    return jsonResponse({ error: error.message ?? "Failed to join trivia" }, 500);
  }
});
