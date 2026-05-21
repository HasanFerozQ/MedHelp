(function () {
  const QUESTION_TIME_MS = 60_000;
  const RATIONALE_PAUSE_MS = 5_000;
  const TOTAL_QUESTIONS = 10;
  const GUEST_KEY = "mh_trivia_guest";
  const MUTE_KEY = "mh_trivia_muted";
  const ACTIVE_KEY = "mh_trivia_active";

  const audio = {
    clock: new Audio("audio/Clock.mp3"),
    correct: new Audio("audio/correctAnswer.mp3"),
    wrong: new Audio("audio/wrongAnswer.mp3"),
    bell: new Audio("audio/BellRing.mp3"),
  };

  audio.clock.loop = true;
  Object.values(audio).forEach((a) => {
    a.preload = "auto";
    a.volume = 0.45;
  });

  const ctx = {
    state: "loading",
    todaySet: null,
    session: null,
    questionOrder: 1,
    liveScore: 0,
    questionStartedAt: null,
    questionTicker: null,
    muted: localStorage.getItem(MUTE_KEY) === "true",
    presenceTicker: null,
  };

  function db() {
    return window.initDbClient ? window.initDbClient() : null;
  }

  function getGuest() {
    try {
      return JSON.parse(localStorage.getItem(GUEST_KEY) || "null");
    } catch (_) {
      return null;
    }
  }

  function saveGuest(username) {
    const token = crypto.randomUUID();
    const guest = { token, username };
    localStorage.setItem(GUEST_KEY, JSON.stringify(guest));
    return guest;
  }

  async function ensureGuestIdentity() {
    const { data } = await db().auth.getUser();
    if (data?.user) return { isAuth: true, user: data.user };
    const existing = getGuest();
    if (existing?.token && existing?.username) return { isAuth: false, guest: existing };
    return { isAuth: false, guest: null };
  }

  function displayName(identity) {
    if (identity.isAuth) {
      const u = identity.user;
      return u?.user_metadata?.username || u?.email?.split("@")[0] || "Member";
    }
    return identity.guest?.username || "Guest";
  }

  function setMuted(next, muteBtnEl) {
    ctx.muted = !!next;
    localStorage.setItem(MUTE_KEY, String(ctx.muted));
    Object.values(audio).forEach((a) => {
      a.muted = ctx.muted;
    });
    if (muteBtnEl) {
      muteBtnEl.setAttribute("aria-pressed", String(ctx.muted));
      muteBtnEl.title = ctx.muted ? "Unmute sound" : "Mute sound";
      const on = muteBtnEl.querySelector(".mute-icon-on");
      const off = muteBtnEl.querySelector(".mute-icon-off");
      if (on && off) {
        on.classList.toggle("hidden", ctx.muted);
        off.classList.toggle("hidden", !ctx.muted);
      }
    }
  }

  function stopClock() {
    audio.clock.pause();
    audio.clock.currentTime = 0;
  }

  function playAudio(key) {
    if (ctx.muted || !audio[key]) return;
    if (key === "clock") {
      audio.clock.currentTime = 0;
      audio.clock.play().catch(() => {});
      return;
    }
    audio[key].currentTime = 0;
    audio[key].play().catch(() => {});
  }

  function saveActiveSession() {
    if (!ctx.session?.id) return;
    sessionStorage.setItem(
      ACTIVE_KEY,
      JSON.stringify({
        session: ctx.session,
        questionOrder: ctx.questionOrder,
        liveScore: ctx.liveScore,
      })
    );
  }

  function loadActiveSession() {
    try {
      const raw = sessionStorage.getItem(ACTIVE_KEY);
      if (!raw) return false;
      const data = JSON.parse(raw);
      if (!data?.session?.id) return false;
      ctx.session = data.session;
      ctx.questionOrder = data.questionOrder || 1;
      ctx.liveScore = data.liveScore || 0;
      return true;
    } catch (_) {
      return false;
    }
  }

  function clearActiveSession() {
    sessionStorage.removeItem(ACTIVE_KEY);
  }

  function normalizeTodaySetRow(data) {
    const row = Array.isArray(data) ? data[0] : data;
    if (!row) return null;
    const setId = row.set_id || row.id;
    if (!setId) return null;
    return {
      set_id: setId,
      scheduled_date: row.scheduled_date,
      status: row.status,
      allow_retakes: row.allow_retakes !== false,
      start_at: row.start_at,
      end_at: row.end_at,
    };
  }

  async function loadState() {
    const client = db();
    if (!client) throw new Error("Supabase client unavailable");
    const nowIso = new Date().toISOString();

    const setRes = await client.rpc("get_today_set_for_play", {});
    if (setRes.error) throw new Error(setRes.error.message || "Failed to load today’s trivia set");

    ctx.todaySet = normalizeTodaySetRow(setRes.data);

    if (ctx.todaySet) {
      ctx.state = ctx.todaySet.status === "closed" ? "post_game" : "live";
    } else {
      const stateRes = await client.rpc("get_current_trivia_state", { now_tz: nowIso });
      if (stateRes.error) throw new Error(stateRes.error.message || "Failed to load trivia state");
      ctx.state = typeof stateRes.data === "string" ? stateRes.data : "no_content";
    }

    return { state: ctx.state, today_set: ctx.todaySet, now_iso: nowIso };
  }

  async function updatePresence() {
    if (!ctx.todaySet?.set_id) return;
    const identity = await ensureGuestIdentity();
    const identityKey = identity.isAuth ? `user:${identity.user.id}` : `guest:${identity.guest?.token || "anon"}`;
    const username = identity.isAuth
      ? (identity.user?.user_metadata?.username || identity.user?.email || "user")
      : (identity.guest?.username || "guest");
    await db().from("trivia_waiting_room_presence").upsert({
      set_id: ctx.todaySet.set_id,
      identity_key: identityKey,
      username,
      last_seen: new Date().toISOString(),
    }, { onConflict: "set_id,identity_key" });
  }

  async function joinSession(guestUsernameEl) {
    const identity = await ensureGuestIdentity();
    let guest = identity.guest;

    if (!identity.isAuth) {
      const guestName = (guestUsernameEl?.value || "").trim();
      if (!guest && !guestName) {
        throw new Error("Please enter a guest username before joining.");
      }
      if (!guest) guest = saveGuest(guestName);
    }

    const client = db();
    const { data, error } = await client.rpc("trivia_join_session", {
      p_guest_token: identity.isAuth ? null : guest.token,
      p_guest_username: identity.isAuth ? null : guest.username,
      p_timezone: Intl.DateTimeFormat().resolvedOptions().timeZone || "UTC",
    });
    if (error) throw new Error(error.message || "Failed to join trivia");
    ctx.session = data.session;
    ctx.questionOrder = 1;
    ctx.liveScore = 0;
    saveActiveSession();
    return data;
  }

  function renderScoreGridHtml(shareGrid) {
    const chars = Array.from(String(shareGrid || ""));
    const cells = [];
    for (let i = 0; i < TOTAL_QUESTIONS; i++) {
      const ch = chars[i] || "";
      const correct = ch === "\u{1F7E9}" || ch === "🟩";
      cells.push(`<span class="score-tile ${correct ? "is-correct" : "is-miss"}" aria-label="${correct ? "Correct" : "Missed"}"></span>`);
    }
    return cells.join("");
  }

  window.MedTriviaCore = {
    QUESTION_TIME_MS,
    RATIONALE_PAUSE_MS,
    TOTAL_QUESTIONS,
    ACTIVE_KEY,
    audio,
    ctx,
    db,
    getGuest,
    saveGuest,
    ensureGuestIdentity,
    displayName,
    setMuted,
    stopClock,
    playAudio,
    saveActiveSession,
    loadActiveSession,
    clearActiveSession,
    loadState,
    updatePresence,
    joinSession,
    renderScoreGridHtml,
  };
})();
