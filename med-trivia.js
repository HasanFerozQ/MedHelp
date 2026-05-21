(function () {
  const QUESTION_TIME_MS = 60_000;
  const RATIONALE_PAUSE_MS = 5_000;
  const TOTAL_QUESTIONS = 10;
  const GUEST_KEY = "mh_trivia_guest";
  const MUTE_KEY = "mh_trivia_muted";

  const stateEl = document.getElementById("trivia-state");
  const countdownEl = document.getElementById("countdown");
  const waitingCountEl = document.getElementById("waiting-count");
  const questionCardEl = document.getElementById("question-card");
  const questionProgressEl = document.getElementById("question-progress");
  const questionPromptEl = document.getElementById("question-prompt");
  const questionOptionsEl = document.getElementById("question-options");
  const rationaleBoxEl = document.getElementById("rationale-box");
  const rationaleTextEl = document.getElementById("rationale-text");
  const resultModalEl = document.getElementById("result-modal");
  const resultTextEl = document.getElementById("result-text");
  const resultGridEl = document.getElementById("result-grid");
  const resultStatsEl = document.getElementById("result-stats");
  const joinBtnEl = document.getElementById("join-btn");
  const guestFormEl = document.getElementById("guest-form");
  const guestUsernameEl = document.getElementById("guest-username");
  const muteBtnEl = document.getElementById("mute-btn");

  const audio = {
    clock: new Audio("audio/Clock.mp3"),
    correct: new Audio("audio/correctAnswer.mp3"),
    wrong: new Audio("audio/wrongAnswer.mp3"),
    bell: new Audio("audio/BellRing.mp3"),
  };

  Object.values(audio).forEach((a) => {
    a.preload = "auto";
    a.volume = 0.45;
  });

  const ctx = {
    state: "loading",
    todaySet: null,
    session: null,
    questionOrder: 1,
    questionStartedAt: null,
    questionTicker: null,
    muted: localStorage.getItem(MUTE_KEY) === "true",
    waitingTicker: null,
    presenceTicker: null,
  };

  function db() {
    return window.initDbClient ? window.initDbClient() : null;
  }

  function setMuted(next) {
    ctx.muted = !!next;
    localStorage.setItem(MUTE_KEY, String(ctx.muted));
    muteBtnEl.textContent = ctx.muted ? "Unmute Sound" : "Mute Sound";
    Object.values(audio).forEach((a) => {
      a.muted = ctx.muted;
    });
  }

  function playAudio(key) {
    if (ctx.muted || !audio[key]) return;
    audio[key].currentTime = 0;
    audio[key].play().catch(() => {});
  }

  async function loadState() {
    const client = db();
    if (!client) throw new Error("Supabase client unavailable");
    const nowIso = new Date().toISOString();
    const [stateRes, setRes] = await Promise.all([
      client.rpc("get_current_trivia_state", { now_tz: nowIso }),
      client.rpc("get_today_set_for_play", {}),
    ]);
    if (stateRes.error) throw new Error(stateRes.error.message || "Failed to load trivia state");
    if (setRes.error) throw new Error(setRes.error.message || "Failed to load today’s trivia set");

    const stateData = stateRes.data;
    const rows = setRes.data;
    const todayRow = Array.isArray(rows) ? rows[0] : rows;

    ctx.state = typeof stateData === "string" ? stateData : "no_content";
    ctx.todaySet = todayRow || null;
    stateEl.textContent = `State: ${ctx.state.replace("_", " ")}`;

    let stats = null;
    if (ctx.todaySet?.set_id) {
      const { data: statRow, error: statErr } = await client
        .from("trivia_daily_stats")
        .select("participants, completers, perfect_10, avg_score, refreshed_at")
        .eq("set_id", ctx.todaySet.set_id)
        .maybeSingle();
      if (statErr) throw new Error(statErr.message || "Failed to load stats");
      stats = statRow;
    }

    resultStatsEl.textContent = stats
      ? `Participants: ${stats.participants} | Completers: ${stats.completers} | Perfect 10: ${stats.perfect_10}`
      : "No daily stats yet.";

    return { state: ctx.state, today_set: ctx.todaySet, stats, now_iso: nowIso };
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

  async function joinTrivia() {
    const identity = await ensureGuestIdentity();
    let guest = identity.guest;

    if (!identity.isAuth) {
      const guestName = guestUsernameEl.value.trim();
      if (!guest && !guestName) {
        alert("Please enter a guest username before joining.");
        return;
      }
      if (!guest) guest = saveGuest(guestName);
      guestFormEl.classList.add("hidden");
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
    await startQuestionLoop();
  }

  async function renderQuestion(order) {
    const client = db();
    const { data: rows, error } = await client.rpc("get_trivia_question", {
      p_session_id: ctx.session.id,
      p_question_order: order,
    });
    if (error) throw new Error(error.message || "Failed to load question");
    const q = rows?.[0];
    if (!q) throw new Error("Question unavailable");

    questionProgressEl.textContent = `Question ${order} / ${TOTAL_QUESTIONS}`;
    questionPromptEl.textContent = q.prompt;
    questionOptionsEl.innerHTML = "";
    rationaleBoxEl.classList.add("hidden");
    questionCardEl.classList.remove("hidden");

    const startedAt = new Date().toISOString();
    ctx.questionStartedAt = startedAt;

    q.options.forEach((opt, i) => {
      const btn = document.createElement("button");
      btn.className = "option-btn";
      btn.textContent = opt;
      btn.onclick = () => submitAnswer(i, q.rationale);
      questionOptionsEl.appendChild(btn);
    });

    runQuestionTimer();
  }

  function runQuestionTimer() {
    clearInterval(ctx.questionTicker);
    const started = new Date(ctx.questionStartedAt).getTime();
    playAudio("clock");

    ctx.questionTicker = setInterval(() => {
      const remaining = Math.max(0, QUESTION_TIME_MS - (Date.now() - started));
      countdownEl.textContent = `Time left: ${Math.ceil(remaining / 1000)}s`;
      if (remaining <= 0) {
        clearInterval(ctx.questionTicker);
        lockOptions();
      }
    }, 250);
  }

  function lockOptions() {
    questionOptionsEl.querySelectorAll("button").forEach((b) => {
      b.disabled = true;
    });
  }

  async function submitAnswer(selectedIndex, rationale) {
    lockOptions();
    clearInterval(ctx.questionTicker);
    const idem = `${ctx.session.id}-${ctx.questionOrder}-${selectedIndex}`;
    const client = db();
    const { data: answerRows, error } = await client.rpc("record_trivia_answer", {
      p_session_id: ctx.session.id,
      p_question_order: ctx.questionOrder,
      p_selected_index: selectedIndex,
      p_question_started_at: ctx.questionStartedAt,
      p_idempotency_key: idem,
    });
    if (error) throw new Error(error.message || "Failed to record answer");

    const result = answerRows?.[0];
    if (!result) throw new Error("Answer response missing");
    if (result.is_correct) playAudio("correct");
    else playAudio("wrong");

    questionOptionsEl.querySelectorAll("button").forEach((b, idx) => {
      if (idx === result.correct_index) b.classList.add("correct");
      else if (idx === selectedIndex) b.classList.add("wrong");
    });

    rationaleTextEl.textContent = rationale || "No rationale provided.";
    rationaleBoxEl.classList.remove("hidden");

    setTimeout(async () => {
      ctx.questionOrder += 1;
      if (ctx.questionOrder > TOTAL_QUESTIONS) {
        await finishTrivia();
        return;
      }
      await renderQuestion(ctx.questionOrder);
    }, RATIONALE_PAUSE_MS);
  }

  async function finishTrivia() {
    playAudio("bell");
    questionCardEl.classList.add("hidden");
    const client = db();
    const { data: finRows, error: finErr } = await client.rpc("finalize_trivia_session", {
      p_session_id: ctx.session.id,
    });
    if (finErr) throw new Error(finErr.message || "Failed to finish session");
    const row = finRows?.[0];
    if (!row) throw new Error("Finish response missing");
    const session = {
      score: row.score,
      total_questions: row.total_questions,
      share_grid: row.share_grid,
    };

    let stats = null;
    if (ctx.session?.set_id) {
      const { data: statRow } = await client
        .from("trivia_daily_stats")
        .select("participants, completers, perfect_10, avg_score")
        .eq("set_id", ctx.session.set_id)
        .maybeSingle();
      stats = statRow;
    }

    resultTextEl.textContent = `Score: ${session.score}/${session.total_questions}`;
    resultGridEl.textContent = session.share_grid || "";
    resultStatsEl.textContent = stats
      ? `Participants: ${stats.participants} | Avg Score: ${stats.avg_score}`
      : "Stats unavailable.";
    resultModalEl.classList.remove("hidden");
  }

  async function startQuestionLoop() {
    stateEl.textContent = "State: live";
    await renderQuestion(ctx.questionOrder);
  }

  async function paintInitialUi() {
    setMuted(ctx.muted);
    const identity = await ensureGuestIdentity();
    if (!identity.isAuth && !identity.guest) {
      guestFormEl.classList.remove("hidden");
    }

    await loadState();
    const hasSet = !!ctx.todaySet?.set_id;
    const isPlayable = hasSet && ctx.state !== "no_content" && ctx.state !== "post_game";
    joinBtnEl.disabled = !isPlayable;

    clearInterval(ctx.waitingTicker);
    ctx.waitingTicker = null;

    if (ctx.state === "post_game") {
      countdownEl.textContent = "Today’s set has ended.";
    } else if (ctx.state === "no_content" || !hasSet) {
      countdownEl.textContent = "No trivia published for today yet.";
    } else {
      countdownEl.textContent = "Today’s set is open — join anytime.";
    }

    if (ctx.todaySet?.set_id) {
      await updatePresence().catch(() => {});
      clearInterval(ctx.presenceTicker);
      ctx.presenceTicker = setInterval(() => {
        updatePresence().catch(() => {});
      }, 30_000);

      const client = db();
      const fiveMinutesAgoIso = new Date(Date.now() - 5 * 60_000).toISOString();
      const { data: rows } = await client
        .from("trivia_waiting_room_presence")
        .select("id")
        .eq("set_id", ctx.todaySet.set_id)
        .gte("last_seen", fiveMinutesAgoIso);
      waitingCountEl.textContent = `Waiting now: ${(rows || []).length}`;
    } else {
      waitingCountEl.textContent = "Waiting now: 0";
    }
  }

  joinBtnEl.addEventListener("click", () => {
    joinTrivia().catch((e) => alert(e.message || "Failed to join trivia"));
  });
  muteBtnEl.addEventListener("click", () => setMuted(!ctx.muted));
  document.getElementById("close-result").addEventListener("click", () => {
    resultModalEl.classList.add("hidden");
    window.location.reload();
  });

  paintInitialUi().catch((e) => {
    stateEl.textContent = "State: error";
    countdownEl.textContent = e.message || "Failed to initialize trivia";
  });
})();
