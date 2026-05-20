(function () {
  const QUESTION_TIME_MS = 60_000;
  const RATIONALE_PAUSE_MS = 5_000;
  const TOTAL_QUESTIONS = 10;
  const ET_TIMEZONE = "America/New_York";
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

  async function invoke(fnName, payload) {
    const client = db();
    if (!client) throw new Error("Supabase client unavailable");
    const { data, error } = await client.functions.invoke(fnName, { body: payload || {} });
    if (error) throw new Error(error.message || `Failed calling ${fnName}`);
    return data;
  }

  async function loadState() {
    const data = await invoke("trivia-state");
    ctx.state = data?.state || "no_content";
    ctx.todaySet = data?.today_set || null;
    stateEl.textContent = `State: ${ctx.state.replace("_", " ")}`;
    resultStatsEl.textContent = data?.stats
      ? `Participants: ${data.stats.participants} | Completers: ${data.stats.completers} | Perfect 10: ${data.stats.perfect_10}`
      : "No daily stats yet.";
    return data;
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

    const payload = {
      timezone: Intl.DateTimeFormat().resolvedOptions().timeZone || "UTC",
      guest_token: identity.isAuth ? null : guest.token,
      guest_username: identity.isAuth ? null : guest.username,
    };

    const data = await invoke("trivia-join", payload);
    ctx.session = data.session;
    ctx.questionOrder = 1;
    await startQuestionLoop();
  }

  async function renderQuestion(order) {
    const data = await invoke("trivia-question", {
      session_id: ctx.session.id,
      question_order: order,
    });
    const q = data?.question;
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
    const data = await invoke("trivia-answer", {
      session_id: ctx.session.id,
      question_order: ctx.questionOrder,
      selected_index: selectedIndex,
      question_started_at: ctx.questionStartedAt,
      idempotency_key: idem,
    });

    const result = data?.result;
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
    const data = await invoke("trivia-finish", { session_id: ctx.session.id });
    const session = data?.session;

    resultTextEl.textContent = `Score: ${session.score}/${session.total_questions}`;
    resultGridEl.textContent = session.share_grid || "";
    resultStatsEl.textContent = data?.stats
      ? `Participants: ${data.stats.participants} | Avg Score: ${data.stats.avg_score}`
      : "Stats unavailable.";
    resultModalEl.classList.remove("hidden");
  }

  function formatEtCountdown(targetIso) {
    const diff = new Date(targetIso).getTime() - Date.now();
    if (diff <= 0) return "00:00:00";
    const s = Math.floor(diff / 1000);
    const h = String(Math.floor(s / 3600)).padStart(2, "0");
    const m = String(Math.floor((s % 3600) / 60)).padStart(2, "0");
    const sec = String(s % 60).padStart(2, "0");
    return `${h}:${m}:${sec}`;
  }

  function getEtNextStart() {
    const now = new Date();
    const etNow = new Date(now.toLocaleString("en-US", { timeZone: ET_TIMEZONE }));
    const next = new Date(etNow);
    next.setHours(20, 0, 0, 0);
    if (etNow > next) next.setDate(next.getDate() + 1);
    const offsetMs = now.getTime() - etNow.getTime();
    return new Date(next.getTime() + offsetMs);
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

    const stateData = await loadState();
    const isPlayable = ctx.state === "waiting_room" || ctx.state === "live";
    joinBtnEl.disabled = !isPlayable;

    if (ctx.state === "live") {
      countdownEl.textContent = "Live now";
    } else if (ctx.state === "waiting_room") {
      const startAt = stateData?.today_set?.start_at || getEtNextStart().toISOString();
      clearInterval(ctx.waitingTicker);
      ctx.waitingTicker = setInterval(() => {
        countdownEl.textContent = `Starts in: ${formatEtCountdown(startAt)}`;
      }, 1000);
    } else if (ctx.state === "pre_hype") {
      const nextStart = getEtNextStart().toISOString();
      clearInterval(ctx.waitingTicker);
      ctx.waitingTicker = setInterval(() => {
        countdownEl.textContent = `Next 8:00 PM ET in: ${formatEtCountdown(nextStart)}`;
      }, 1000);
    } else {
      countdownEl.textContent = "No active trivia window.";
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
