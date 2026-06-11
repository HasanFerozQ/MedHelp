(function () {
  const C = window.MedTriviaCore;
  if (!C) return;

  const statusBadgeEl = document.getElementById("status-badge");
  const setBadgeEl = document.getElementById("set-badge");
  const countdownEl = document.getElementById("countdown");
  const launchMessageEl = document.getElementById("launch-message");
  const waitingCountEl = document.getElementById("waiting-count");
  const joinBtnEl = document.getElementById("join-btn");
  const joinBtnLabelEl = document.getElementById("join-btn-label");
  const guestFormEl = document.getElementById("guest-form");
  const guestUsernameEl = document.getElementById("guest-username");
  const liveCountEl = document.getElementById("live-waiting-pill");
  const userLabelEl = document.getElementById("user-label");
  const userChipEl = document.getElementById("user-chip");
  const retakeHintEl = document.getElementById("retake-hint");
  let launchTicker = null;
  let statePollTicker = null;
  let isPainting = false;

  function setStatus(kind, label, detail) {
    const colors = {
      live: "text-emerald-400",
      wait: "text-amber-400",
      off: "text-slate-500",
      err: "text-rose-400",
    };
    statusBadgeEl.className = `text-sm font-semibold ${colors[kind] || colors.off}`;
    statusBadgeEl.textContent = label;
    if (detail) countdownEl.textContent = detail;
  }

  function formatCountdown(ms) {
    const totalSeconds = Math.max(0, Math.ceil(ms / 1000));
    const minutes = Math.floor(totalSeconds / 60);
    const seconds = totalSeconds % 60;
    return `${minutes}:${String(seconds).padStart(2, "0")}`;
  }

  // FIX: always tick every second; auto-re-poll when countdown hits 0
  function updateLaunchCountdown(startAt, startLabel) {
    if (!launchMessageEl || !countdownEl) return;
    clearInterval(launchTicker);

    const refresh = () => {
      const remaining = startAt.getTime() - Date.now();

      if (remaining <= 0) {
        // Quiz should now be live — stop the clock and re-poll state
        clearInterval(launchTicker);
        countdownEl.textContent = "Checking status…";
        launchMessageEl.textContent = "Trivia is starting — refreshing…";
        launchMessageEl.classList.remove("hidden");
        setTimeout(() => paintInitialUi().catch(() => {}), 2000);
        return;
      }

      if (remaining > 30 * 60_000) {
        // FIX: use dynamic startLabel instead of hardcoded "8:00 PM ET"
        countdownEl.textContent = startLabel || "Opens at 8:00 PM ET";
        launchMessageEl.textContent = `Quiz opens ${startLabel || "at 8 PM ET"}. Stay tuned!`;
        launchMessageEl.classList.remove("hidden");
      } else {
        countdownEl.textContent = `Starting in ${formatCountdown(remaining)}`;
        launchMessageEl.textContent = "Live quiz opens soon — get ready!";
        launchMessageEl.classList.remove("hidden");
      }
    };

    refresh();
    // FIX: always tick — was previously skipped when > 30 min, so the clock froze
    launchTicker = setInterval(refresh, 1000);
  }

  async function paintInitialUi() {
    if (isPainting) return;
    isPainting = true;
    try {
      // Clear any previous state poll
      clearInterval(statePollTicker);

      const identity = await C.ensureGuestIdentity();
      const name = C.displayName(identity);
      if (userLabelEl) userLabelEl.textContent = name;
      if (userChipEl) userChipEl.classList.remove("hidden");

      if (!identity.isAuth && !identity.guest) {
        guestFormEl.classList.remove("hidden");
      }

      await C.loadState();
      const etToday = new Date().toLocaleDateString("en-CA", { timeZone: "America/New_York" });
      const isTodaySet = C.ctx.todaySet?.scheduled_date === etToday;
      const hasSet = !!C.ctx.todaySet?.set_id;
      const isPlayable = isTodaySet && hasSet && C.ctx.state === "live";
      joinBtnEl.disabled = !isPlayable;

      const setDate = C.ctx.todaySet?.scheduled_date;
      const title = setDate
        ? new Date(setDate + "T12:00:00").toLocaleDateString(undefined, { month: "short", day: "numeric" })
        : "—";
      setBadgeEl.textContent = hasSet
        ? (isTodaySet ? `Set · ${title}` : `Next · ${title}`)
        : "No set";

      if (C.ctx.todaySet?.allow_retakes === false || !C.ctx.todaySet?.allow_retakes) {
        if (retakeHintEl) {
          retakeHintEl.textContent = "One attempt only";
          retakeHintEl.classList.add("text-rose-400");
          retakeHintEl.classList.remove("text-sky-400");
          retakeHintEl.parentElement.querySelector("i")?.classList.replace("text-sky-400", "text-rose-400");
        }
      } else {
        if (retakeHintEl) retakeHintEl.textContent = "Unlimited practice runs";
      }

      const startAt = C.ctx.todaySet?.start_at ? new Date(C.ctx.todaySet.start_at) : null;
      const endAt = C.ctx.todaySet?.end_at ? new Date(C.ctx.todaySet.end_at) : null;
      const startLabel = startAt
        ? `${startAt.toLocaleDateString(undefined, { month: "short", day: "numeric" })} ${startAt.toLocaleTimeString("en-US", { hour: "numeric", minute: "2-digit", timeZone: "America/New_York" })} ET`
        : null;

      if (C.ctx.state === "post_game") {
        clearInterval(launchTicker);
        if (liveCountEl) liveCountEl.textContent = "Waiting room";
        
        let hasFinishedSession = false;
        if (C.ctx.todaySet?.set_id) {
          const { data: sessionRow } = await C.db()
            .from("trivia_sessions")
            .select("id, status, score, share_grid")
            .eq("set_id", C.ctx.todaySet.set_id)
            .eq(identity.isAuth ? "user_id" : "guest_token", identity.isAuth ? identity.user.id : (identity.guest?.token || ''))
            .maybeSingle();
          if (sessionRow && sessionRow.status === "finished") {
            hasFinishedSession = true;
            window.__triviaFinishedSession = { ...sessionRow, set_id: C.ctx.todaySet.set_id };
          }
        }

        if (hasFinishedSession) {
          setStatus("off", "Closed", "Today's set has ended.");
          joinBtnLabelEl.textContent = "View Your Result";
          joinBtnEl.disabled = false;
        } else {
          setStatus("off", "Closed", "Today's set has ended. Check back tomorrow at 8 PM ET.");
          joinBtnLabelEl.textContent = "Set closed";
          joinBtnEl.disabled = true;
        }

      } else if (C.ctx.state === "scheduled") {
        setStatus("wait", "Scheduled", startLabel || "Opens at 8:00 PM ET.");
        joinBtnLabelEl.textContent = "Not open yet";
        if (liveCountEl) liveCountEl.textContent = "Waiting room";
        if (startAt) {
          updateLaunchCountdown(startAt, startLabel);
        } else if (launchMessageEl) {
          launchMessageEl.textContent = "Trivia will start at 8 PM ET. Stay tuned.";
          launchMessageEl.classList.remove("hidden");
        }
        statePollTicker = setInterval(() => paintInitialUi().catch(() => {}), 60_000);

      } else if (C.ctx.state === "live" && !hasSet) {
        setStatus("wait", "Starting soon", "Loading today's set — please wait a moment.");
        joinBtnLabelEl.textContent = "Loading…";
        if (liveCountEl) liveCountEl.textContent = "Waiting room";
        if (launchMessageEl) {
          launchMessageEl.textContent = "Fetching today's quiz set…";
          launchMessageEl.classList.remove("hidden");
        }
        setTimeout(() => paintInitialUi().catch(() => {}), 5000);

      } else if (!hasSet || C.ctx.state === "no_content") {
        clearInterval(launchTicker);
        if (liveCountEl) liveCountEl.textContent = "Waiting room";
        setStatus("off", "Unavailable", startLabel ? `Opens ${startLabel}.` : "No quiz scheduled yet. Check back at 8 PM ET.");
        joinBtnLabelEl.textContent = "Not available";
        if (launchMessageEl) {
          launchMessageEl.textContent = startLabel
            ? `Today's quiz opens at ${startLabel}. Stay tuned!`
            : "Trivia opens daily at 8 PM Eastern Time. Stay tuned.";
          launchMessageEl.classList.remove("hidden");
        }
        if (startAt && startAt.getTime() > Date.now()) {
          updateLaunchCountdown(startAt, startLabel);
        }

      } else {
        // State is live and set exists — open for play
        clearInterval(launchTicker);
        setStatus("live", "Live now", endAt
          ? `Open until ${endAt.toLocaleTimeString("en-US", { hour: "numeric", minute: "2-digit", timeZone: "America/New_York" })} ET`
          : "Enter the quiz room now!");
        joinBtnLabelEl.textContent = "Enter live quiz";
        joinBtnEl.disabled = false;
        if (liveCountEl) liveCountEl.textContent = "Open for players";
        if (launchMessageEl) launchMessageEl.classList.add("hidden");
      }

      if (C.ctx.todaySet?.set_id) {
        await C.updatePresence().catch(() => {});
        clearInterval(C.ctx.presenceTicker);
        C.ctx.presenceTicker = setInterval(() => C.updatePresence().catch(() => {}), 30_000);

        const fiveMinutesAgoIso = new Date(Date.now() - 5 * 60_000).toISOString();
        const { data: rows } = await C.db()
          .from("trivia_waiting_room_presence")
          .select("id")
          .eq("set_id", C.ctx.todaySet.set_id)
          .gte("last_seen", fiveMinutesAgoIso);
        const n = (rows || []).length;
        waitingCountEl.textContent = String(n);
      } else {
        waitingCountEl.textContent = "0";
      }
    } finally {
      isPainting = false;
    }
  }

  joinBtnEl.addEventListener("click", async () => {
    joinBtnEl.disabled = true;
    
    if (C.ctx.state === "post_game" && window.__triviaFinishedSession) {
      joinBtnLabelEl.textContent = "Loading Results…";
      C.ctx.session = window.__triviaFinishedSession;
      C.saveActiveSession();
      window.location.href = "/med-trivia-quiz";
      return;
    }

    joinBtnLabelEl.textContent = "Starting…";
    try {
      C.clearActiveSession();
      await C.joinSession(guestUsernameEl);
      window.location.href = "/med-trivia-quiz";
    } catch (e) {
      alert(e.message || "Failed to join trivia");
      joinBtnEl.disabled = false;
      joinBtnLabelEl.textContent = "Enter live quiz";
    }
  });

  paintInitialUi().catch((e) => {
    setStatus("err", "Error", e.message || "Failed to load trivia");
    joinBtnEl.disabled = true;
  });
})();
