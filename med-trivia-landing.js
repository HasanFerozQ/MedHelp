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

  function updateLaunchCountdown(startAt, startLabel) {
    if (!launchMessageEl || !countdownEl) return;
    clearInterval(launchTicker);
    const refresh = () => {
      const remaining = startAt.getTime() - Date.now();
      if (remaining <= 0) {
        clearInterval(launchTicker);
        countdownEl.textContent = "Starting now";
        launchMessageEl.textContent = "Trivia is live! Refresh the page to join.";
        launchMessageEl.classList.remove("hidden");
        return;
      }
      if (remaining > 30 * 60_000) {
        countdownEl.textContent = startLabel || "Opens at 8:00 PM ET";
        launchMessageEl.textContent = "Trivia will start at 8 PM ET. Stay tuned.";
        launchMessageEl.classList.remove("hidden");
      } else {
        countdownEl.textContent = `Starting in ${formatCountdown(remaining)}`;
        launchMessageEl.textContent = "Live quiz opens soon — get ready!";
        launchMessageEl.classList.remove("hidden");
      }
    };
    refresh();
    if (startAt.getTime() - Date.now() <= 30 * 60_000) {
      launchTicker = setInterval(refresh, 1000);
    }
  }

  async function paintInitialUi() {
    const identity = await C.ensureGuestIdentity();
    const name = C.displayName(identity);
    if (userLabelEl) userLabelEl.textContent = name;
    if (userChipEl) userChipEl.classList.remove("hidden");

    if (!identity.isAuth && !identity.guest) {
      guestFormEl.classList.remove("hidden");
    }

    await C.loadState();
    const hasSet = !!C.ctx.todaySet?.set_id;
    const isPlayable = hasSet && C.ctx.state !== "no_content" && C.ctx.state !== "post_game";
    joinBtnEl.disabled = !isPlayable;

    const setDate = C.ctx.todaySet?.scheduled_date;
    const title = setDate
      ? new Date(setDate + "T12:00:00").toLocaleDateString(undefined, { month: "short", day: "numeric" })
      : "—";
    setBadgeEl.textContent = hasSet ? `Set · ${title}` : "No set";

    if (C.ctx.todaySet?.allow_retakes !== false) {
      retakeHintEl.textContent = "Unlimited practice runs";
    }

    const startAt = C.ctx.todaySet?.start_at ? new Date(C.ctx.todaySet.start_at) : null;
    const startLabel = startAt
      ? `${startAt.toLocaleDateString(undefined, { month: 'short', day: 'numeric' })} ${startAt.toLocaleTimeString('en-US', { hour: 'numeric', minute: '2-digit', timeZone: 'America/New_York' })} ET`
      : null;

    if (C.ctx.state === "post_game") {
      setStatus("off", "Closed", "Today’s set has ended. Check back tomorrow.");
      joinBtnLabelEl.textContent = "Set closed";
    } else if (C.ctx.state === "scheduled") {
      setStatus("wait", "Scheduled", startLabel || "Opens at 8:00 PM ET.");
      joinBtnLabelEl.textContent = "Not available";
      if (startAt) {
        updateLaunchCountdown(startAt, startLabel);
      } else if (launchMessageEl) {
        launchMessageEl.textContent = "Trivia will start at 8 PM ET. Stay tuned.";
        launchMessageEl.classList.remove("hidden");
      }
    } else if (C.ctx.state === "live" && !hasSet) {
      setStatus("off", "Setup mismatch", "Playable set missing in API. Run migration 20260524_medtrivia_testing_mode_once.sql once in Supabase.");
      joinBtnLabelEl.textContent = "Not available";
      if (launchMessageEl) launchMessageEl.classList.add("hidden");
    } else if (!hasSet || C.ctx.state === "no_content") {
      setStatus("off", "Unavailable", "Today's quiz is not open yet. Please check back soon.");
      joinBtnLabelEl.textContent = "Not available";
      if (launchMessageEl) {
        launchMessageEl.textContent = "Trivia will start at 8 PM ET. Stay tuned.";
        launchMessageEl.classList.remove("hidden");
      }
    } else {
      setStatus("live", "Live now", "Enter the quiz room — you can replay as many times as you need while testing.");
      joinBtnLabelEl.textContent = "Enter live quiz";
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
  }

  joinBtnEl.addEventListener("click", async () => {
    joinBtnEl.disabled = true;
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
