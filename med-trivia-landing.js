(function () {
  const C = window.MedTriviaCore;
  if (!C) return;

  const statusBadgeEl = document.getElementById("status-badge");
  const setBadgeEl = document.getElementById("set-badge");
  const countdownEl = document.getElementById("countdown");
  const waitingCountEl = document.getElementById("waiting-count");
  const joinBtnEl = document.getElementById("join-btn");
  const joinBtnLabelEl = document.getElementById("join-btn-label");
  const guestFormEl = document.getElementById("guest-form");
  const guestUsernameEl = document.getElementById("guest-username");
  const liveCountEl = document.getElementById("live-waiting-pill");
  const userLabelEl = document.getElementById("user-label");
  const userChipEl = document.getElementById("user-chip");
  const retakeHintEl = document.getElementById("retake-hint");

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

    if (C.ctx.state === "post_game") {
      setStatus("off", "Closed", "Today’s set has ended. Check back tomorrow.");
      joinBtnLabelEl.textContent = "Set closed";
    } else if (C.ctx.state === "live" && !hasSet) {
      setStatus("off", "Setup mismatch", "Playable set missing in API. Run migration 20260524_medtrivia_testing_mode_once.sql once in Supabase.");
      joinBtnLabelEl.textContent = "Not available";
    } else if (!hasSet || C.ctx.state === "no_content") {
      setStatus("off", "Unavailable", "Today's quiz is not open yet. Please check back soon.");
      joinBtnLabelEl.textContent = "Not available";
    } else {
      setStatus("live", "Live now", "Enter the quiz room — you can replay as many times as you need while testing.");
      joinBtnLabelEl.textContent = "Enter live quiz";
      if (liveCountEl) liveCountEl.textContent = "Open for players";
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
