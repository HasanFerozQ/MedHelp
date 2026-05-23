(function () {
  const C = window.MedTriviaCore;
  if (!C) return;

  const timerBar = document.getElementById("timer-bar");
  const timerText = document.getElementById("timer-text");
  const questionProgressEl = document.getElementById("question-progress");
  const questionPromptEl = document.getElementById("question-prompt");
  const questionOptionsEl = document.getElementById("question-options");
  const rationalePanel = document.getElementById("rationale-panel");
  const rationaleTextEl = document.getElementById("rationale-text");
  const scoreLiveEl = document.getElementById("score-live");
  const userLabelEl = document.getElementById("user-label");
  const muteBtnEl = document.getElementById("mute-btn");
  const resultModalEl = document.getElementById("result-modal");
  const resultScoreBigEl = document.getElementById("result-score-big");
  const resultTaglineEl = document.getElementById("result-tagline");
  const resultGridEl = document.getElementById("result-grid");
  const resultStatsEl = document.getElementById("result-stats");

  const LETTERS = ["A", "B", "C", "D"];
  let currentQuestionRationale = "";

  function resetTimerBar() {
    timerBar.style.transition = "none";
    timerBar.style.width = "100%";
    void timerBar.offsetWidth;
    timerBar.style.transition = `width ${C.QUESTION_TIME_MS}ms linear`;
    requestAnimationFrame(() => {
      timerBar.style.width = "0%";
    });
  }

  function runQuestionTimer() {
    clearInterval(C.ctx.questionTicker);
    C.stopClock();
    C.playAudio("clock");
    resetTimerBar();

    const started = new Date(C.ctx.questionStartedAt).getTime();
    if (Number.isNaN(started)) {
      C.ctx.questionStartedAt = new Date().toISOString();
      C.saveActiveSession();
      return runQuestionTimer();
    }

    timerText.classList.remove("text-red-500", "animate-pulse", "text-slate-400");
    timerText.classList.add("text-rose-400");

    C.ctx.questionTicker = setInterval(() => {
      const remaining = Math.max(0, C.QUESTION_TIME_MS - (Date.now() - started));
      const sec = Math.ceil(remaining / 1000);
      timerText.textContent = `${sec}s`;
      if (sec <= 10) {
        timerText.classList.remove("text-rose-400");
        timerText.classList.add("text-red-500", "animate-pulse");
      }
      if (remaining <= 0) {
        clearInterval(C.ctx.questionTicker);
        C.stopClock();
        timerText.textContent = "0s";
        timerText.classList.remove("text-rose-400", "animate-pulse");
        timerText.classList.add("text-slate-400");
        handleTimeout();
      }
    }, 250);
  }

  async function handleTimeout() {
    lockOptions();
    rationaleTextEl.textContent = "Time expired — moving to the next question.";
    rationalePanel.classList.remove("hidden");
    try {
      await submitAnswer(null, currentQuestionRationale || "No rationale provided.");
    } catch (error) {
      console.warn("Timeout answer submit failed:", error);
      setTimeout(async () => {
        C.ctx.questionOrder += 1;
        C.ctx.questionStartedAt = null;
        C.saveActiveSession();
        if (C.ctx.questionOrder > C.TOTAL_QUESTIONS) {
          await finishTrivia();
          return;
        }
        await renderQuestion(C.ctx.questionOrder);
      }, C.RATIONALE_PAUSE_MS);
    }
  }

  function lockOptions() {
    questionOptionsEl.querySelectorAll("button").forEach((b) => {
      b.disabled = true;
    });
  }

  async function renderQuestion(order) {
    const client = C.db();
    const { data: rows, error } = await client.rpc("get_trivia_question", {
      p_session_id: C.ctx.session.id,
      p_question_order: order,
    });
    if (error) throw new Error(error.message || "Failed to load question");
    const q = rows?.[0];
    if (!q) throw new Error("Question unavailable");

    questionProgressEl.textContent = `Question ${order} of ${C.TOTAL_QUESTIONS}`;
    questionPromptEl.textContent = q.prompt;
    questionOptionsEl.innerHTML = "";
    rationalePanel.classList.add("hidden");
    scoreLiveEl.textContent = String(C.ctx.liveScore);

    if (!C.ctx.questionStartedAt || C.ctx.questionOrder !== order) {
      C.ctx.questionStartedAt = new Date().toISOString();
    }
    C.saveActiveSession();

    currentQuestionRationale = q.rationale || "";
    const options = Array.isArray(q.options) ? q.options : JSON.parse(q.options || "[]");
    options.forEach((opt, i) => {
      const btn = document.createElement("button");
      btn.type = "button";
      btn.className =
        "option-pick w-full text-left bg-slate-800 hover:bg-slate-700 border border-slate-700 p-3.5 sm:p-4 rounded-xl flex items-center justify-between transition active:scale-[0.99]";
      btn.innerHTML = `
        <div class="flex items-center space-x-3 pr-2 min-w-0">
          <span class="opt-letter w-7 h-7 sm:w-8 sm:h-8 shrink-0 rounded-lg bg-slate-700 text-slate-300 flex items-center justify-center font-bold text-xs sm:text-sm">${LETTERS[i]}</span>
          <span class="text-xs sm:text-sm font-medium text-slate-200 leading-tight">${escapeHtml(opt)}</span>
        </div>
        <i class="fa-regular fa-circle text-slate-600 text-sm shrink-0"></i>`;
      btn.onclick = () => submitAnswer(i, q.rationale);
      questionOptionsEl.appendChild(btn);
    });

    runQuestionTimer();
  }

  function escapeHtml(str) {
    return String(str)
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;");
  }

  async function submitAnswer(selectedIndex, rationale) {
    lockOptions();
    clearInterval(C.ctx.questionTicker);
    C.stopClock();

    const idem = `${C.ctx.session.id}-${C.ctx.questionOrder}-${selectedIndex}`;
    const { data: answerRows, error } = await C.db().rpc("record_trivia_answer", {
      p_session_id: C.ctx.session.id,
      p_question_order: C.ctx.questionOrder,
      p_selected_index: selectedIndex,
      p_question_started_at: C.ctx.questionStartedAt,
      p_idempotency_key: idem,
    });
    if (error) throw new Error(error.message || "Failed to record answer");

    const result = answerRows?.[0];
    if (!result) throw new Error("Answer response missing");

    if (result.is_correct) {
      C.ctx.liveScore += 1;
      C.playAudio("correct");
    } else {
      C.playAudio("wrong");
    }
    scoreLiveEl.textContent = String(C.ctx.liveScore);

    questionOptionsEl.querySelectorAll("button").forEach((b, idx) => {
      if (idx === result.correct_index) b.classList.add("correct");
      else if (selectedIndex !== null && idx === selectedIndex) b.classList.add("wrong");
    });

    rationaleTextEl.textContent = rationale || "No rationale provided.";
    rationalePanel.classList.remove("hidden");

    setTimeout(async () => {
      C.ctx.questionOrder += 1;
      C.ctx.questionStartedAt = null;
      C.saveActiveSession();
      if (C.ctx.questionOrder > C.TOTAL_QUESTIONS) {
        await finishTrivia();
        return;
      }
      await renderQuestion(C.ctx.questionOrder);
    }, C.RATIONALE_PAUSE_MS);
  }

  function scoreTagline(score, total) {
    if (score === total) return "Perfect score — outstanding.";
    if (score >= 7) return "Strong round — keep it up.";
    if (score >= 4) return "Solid effort — review rationales and try again tomorrow.";
    return "Tough set today — rationales are your best teacher.";
  }

  async function finishTrivia() {
    C.playAudio("bell");
    C.stopClock();

    const { data: finRows, error: finErr } = await C.db().rpc("finalize_trivia_session", {
      p_session_id: C.ctx.session.id,
    });
    if (finErr) throw new Error(finErr.message || "Failed to finish session");
    const row = finRows?.[0];
    if (!row) throw new Error("Finish response missing");

    const score = row.score;
    const total = row.total_questions || C.TOTAL_QUESTIONS;
    const grid = row.share_grid || "";

    resultScoreBigEl.innerHTML = `${score}<span class="text-2xl text-slate-500 font-semibold">/${total}</span>`;
    resultTaglineEl.textContent = scoreTagline(score, total);
    resultGridEl.innerHTML = C.renderScoreGridHtml(grid);

    let stats = null;
    if (C.ctx.session?.set_id) {
      const { data: statRow } = await C.db()
        .from("trivia_daily_stats")
        .select("participants, completers, perfect_10, avg_score")
        .eq("set_id", C.ctx.session.set_id)
        .maybeSingle();
      stats = statRow;
    }
    resultStatsEl.textContent = stats
      ? `${stats.participants} played today · avg ${stats.avg_score} · ${stats.perfect_10} perfect tens`
      : "";

    C.clearActiveSession();
    resultModalEl.classList.remove("hidden");
  }

  async function boot() {
    C.setMuted(C.ctx.muted, muteBtnEl);
    muteBtnEl.addEventListener("click", () => C.setMuted(!C.ctx.muted, muteBtnEl));

    if (!C.loadActiveSession()) {
      window.location.replace("/med-trivia");
      return;
    }
    if (C.ctx.session?.status === "finished") {
      C.clearActiveSession();
      window.location.replace("/med-trivia");
      return;
    }

    const identity = await C.ensureGuestIdentity();
    userLabelEl.textContent = C.displayName(identity);

    document.getElementById("close-result").addEventListener("click", () => {
      window.location.href = "/med-trivia";
    });

    document.getElementById("share-result").addEventListener("click", async () => {
      const score = C.ctx.liveScore;
      const text = `MedTrivia ${new Date().toLocaleDateString()}: ${score}/${C.TOTAL_QUESTIONS} on MediHelp`;
      try {
        await navigator.clipboard.writeText(text);
        alert("Score copied to clipboard.");
      } catch (_) {
        alert(text);
      }
    });

    try {
      await renderQuestion(C.ctx.questionOrder);
    } catch (e) {
      alert(e.message || "Quiz failed to load");
      window.location.href = "/med-trivia";
    }
  }

  boot();
})();
