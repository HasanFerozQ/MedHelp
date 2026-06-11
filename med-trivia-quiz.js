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
  const resultGridEl = document.getElementById("result-grid");

  const LETTERS = ["A", "B", "C", "D"];
  let currentQuestionRationale = "";
  let finalDbScore = 0; // FIX: track authoritative DB score from finalize_trivia_session

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

    const started = C.ctx.questionStartedAt ? new Date(C.ctx.questionStartedAt).getTime() : NaN;
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
    if (C.ctx.answered) return;
    lockOptions();
    rationaleTextEl.textContent = "Time expired — moving to the next question.";
    rationalePanel.classList.remove("hidden");
    let lastError;
    for (let attempt = 0; attempt < 3; attempt++) {
      try {
        await submitAnswer(null, currentQuestionRationale || "No rationale provided.");
        return;
      } catch (error) {
        lastError = error;
        console.warn(`Timeout answer submit failed (attempt ${attempt + 1}):`, error);
        if (attempt < 2) await new Promise((r) => setTimeout(r, 2000));
      }
    }
    console.error("All timeout submission retries failed:", lastError);
    C.ctx.questionOrder += 1;
    C.ctx.questionStartedAt = null;
    C.ctx.answered = false;
    C.saveActiveSession();
    if (C.ctx.questionOrder > C.TOTAL_QUESTIONS) {
      try { await finishTrivia(); } catch (e) {
        console.error("Finish after timeout fallback failed:", e);
        alert("Could not finalize your session. Returning to lobby.");
        window.location.href = "/med-trivia";
      }
      return;
    }
    try { await renderQuestion(C.ctx.questionOrder); } catch (e) {
      console.error("Render after timeout fallback failed:", e);
      alert("Quiz failed to load. Returning to lobby.");
      window.location.href = "/med-trivia";
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
    C.ctx.answered = false;
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
    if (C.ctx.answered) return;
    C.ctx.answered = true;
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
      try {
        C.ctx.questionOrder += 1;
        C.ctx.questionStartedAt = null;
        C.ctx.answered = false;
        C.saveActiveSession();
        if (C.ctx.questionOrder > C.TOTAL_QUESTIONS) {
          await finishTrivia();
          return;
        }
        await renderQuestion(C.ctx.questionOrder);
      } catch (e) {
        console.error("Post-answer advancement failed:", e);
        alert("Quiz failed to load. Returning to lobby.");
        window.location.href = "/med-trivia";
      }
    }, C.RATIONALE_PAUSE_MS);
  }

  async function renderResultBreakdown(sessionId) {
    const breakdownEl = document.getElementById("result-breakdown");
    if (!breakdownEl) return;
    breakdownEl.innerHTML = '<p class="text-slate-400 text-sm text-center py-4">Loading review...</p>';

    try {
      const { data, error } = await C.db().rpc("get_trivia_session_results", {
        p_session_id: sessionId
      });
      if (error) throw error;
      
      const results = data || [];
      if (!results.length) {
        breakdownEl.innerHTML = '<p class="text-slate-400 text-sm text-center py-4">No answers found.</p>';
        return;
      }

      breakdownEl.innerHTML = results.map(q => {
        try {
          const isRight = q.is_correct;
          const statusColor = isRight ? "text-emerald-400" : "text-rose-400";
          const statusIcon = isRight ? "fa-circle-check" : "fa-circle-xmark";
          const statusBg = isRight ? "bg-emerald-400/10 border-emerald-500/20" : "bg-rose-400/10 border-rose-500/20";
          
          let optionsHtml = '';
          let opts;
          try {
            opts = Array.isArray(q.options) ? q.options : JSON.parse(q.options || "[]");
          } catch (_) {
            opts = [];
          }
          opts.forEach((opt, idx) => {
            const isUserPick = idx === q.user_selected_index;
            const isCorrectAns = idx === q.correct_index;
            
            let optClass = "border-slate-700 bg-slate-800 text-slate-300";
            let iconHtml = '<i class="fa-regular fa-circle text-slate-600 text-[10px] shrink-0"></i>';
            
            if (isCorrectAns) {
              optClass = "border-emerald-500 bg-emerald-500/10 text-emerald-100";
              iconHtml = '<i class="fa-solid fa-check text-emerald-500 text-xs shrink-0"></i>';
            } else if (isUserPick && !isCorrectAns) {
              optClass = "border-rose-500 bg-rose-500/10 text-rose-100";
              iconHtml = '<i class="fa-solid fa-xmark text-rose-500 text-xs shrink-0"></i>';
            }

            optionsHtml += `
              <div class="p-2.5 sm:p-3 rounded-lg border ${optClass} flex items-center justify-between transition-colors">
                <div class="flex items-center space-x-2.5 sm:space-x-3 pr-2 min-w-0">
                  <span class="w-6 h-6 shrink-0 rounded text-[10px] font-bold flex items-center justify-center ${isCorrectAns ? 'bg-emerald-500 text-slate-900' : isUserPick ? 'bg-rose-500 text-white' : 'bg-slate-700 text-slate-300'}">${LETTERS[idx]}</span>
                  <span class="text-[11px] sm:text-xs font-medium leading-tight">${escapeHtml(opt)}</span>
                </div>
                ${iconHtml}
              </div>
            `;
          });

          return `
            <div class="p-3 sm:p-5 rounded-xl border ${statusBg}">
              <div class="flex items-start justify-between mb-3">
                <span class="text-[10px] sm:text-xs font-bold uppercase tracking-widest ${statusColor}">
                  <i class="fa-solid ${statusIcon} mr-1"></i> Q${q.question_order}
                </span>
              </div>
              <p class="text-xs sm:text-sm text-slate-200 leading-relaxed mb-4 whitespace-pre-wrap">${escapeHtml(q.prompt)}</p>
              <div class="flex flex-col space-y-2 mb-4">
                ${optionsHtml}
              </div>
              <div class="bg-slate-950/50 rounded-lg p-3 sm:p-4 border border-slate-800/50">
                <p class="text-[10px] font-bold text-slate-400 uppercase tracking-wider mb-1.5"><i class="fa-solid fa-lightbulb text-amber-400/80 mr-1"></i> Rationale</p>
                <p class="text-[11px] sm:text-xs text-slate-300 leading-relaxed">${escapeHtml(q.rationale)}</p>
              </div>
            </div>
          `;
        } catch (qe) {
          console.warn("Failed to render breakdown for question:", q.question_order, qe);
          return `<div class="p-3 sm:p-5 rounded-xl border border-slate-700 bg-slate-800/40"><p class="text-xs text-slate-400">Unable to load review for Question ${q.question_order}.</p></div>`;
        }
      }).join('');
    } catch (e) {
      console.warn("Could not load rationales:", e);
      breakdownEl.innerHTML = '<p class="text-rose-400 text-sm text-center py-4">Error loading review. Please try again later.</p>';
    }
  }

  async function showResultModal(score, total, grid, setId, sessionId) {
    finalDbScore = score; // Ensure share button has the authoritative score
    resultScoreBigEl.innerHTML = `${score}<span class="text-2xl text-slate-500 font-semibold">/${total}</span>`;
    resultGridEl.innerHTML = C.renderScoreGridHtml(grid);

    let stats = null;
    if (setId) {
      const { data: statRow } = await C.db()
        .from("trivia_daily_stats")
        .select("participants, perfect_10")
        .eq("set_id", setId)
        .maybeSingle();
      stats = statRow;
    }
    
    document.getElementById("global-participants").textContent = stats ? String(stats.participants || 0) : "0";
    document.getElementById("global-perfect").textContent = stats ? String(stats.perfect_10 || 0) : "0";

    await renderResultBreakdown(sessionId);
    resultModalEl.classList.remove("hidden");
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

    C.clearActiveSession();
    await showResultModal(
      row.score, 
      row.total_questions || C.TOTAL_QUESTIONS, 
      row.share_grid || "", 
      row.set_id, 
      row.id
    );
  }

  async function boot() {
    C.setMuted(C.ctx.muted, muteBtnEl);
    muteBtnEl.addEventListener("click", () => C.setMuted(!C.ctx.muted, muteBtnEl));

    if (!C.loadActiveSession()) {
      window.location.replace("/med-trivia");
      return;
    }
    if (C.ctx.session?.status === "finished") {
      const row = C.ctx.session;
      C.clearActiveSession();
      await showResultModal(
        row.score || 0,
        C.TOTAL_QUESTIONS,
        row.share_grid || "",
        row.set_id,
        row.id
      );
      return;
    }

    // Handle refresh during final rationale pause (questionOrder incremented to 11)
    if (C.ctx.questionOrder > C.TOTAL_QUESTIONS) {
      await finishTrivia();
      return;
    }

    const identity = await C.ensureGuestIdentity();
    userLabelEl.textContent = C.displayName(identity);

    document.getElementById("close-result").addEventListener("click", () => {
      window.location.href = "/med-trivia";
    });

    document.getElementById("share-result").addEventListener("click", async () => {
      const score = typeof finalDbScore === "number" ? finalDbScore : C.ctx.liveScore;
      const text = `MedTrivia ${new Date().toLocaleDateString()}: ${score}/${C.TOTAL_QUESTIONS} — MediHelp Med Trivia`;
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
