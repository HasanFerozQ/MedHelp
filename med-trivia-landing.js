(function () {
  const C = window.MedTriviaCore;
  if (!C) return;

  const stateEl = document.getElementById("trivia-state");
  const countdownEl = document.getElementById("countdown");
  const waitingCountEl = document.getElementById("waiting-count");
  const joinBtnEl = document.getElementById("join-btn");
  const guestFormEl = document.getElementById("guest-form");
  const guestUsernameEl = document.getElementById("guest-username");
  const liveCountEl = document.getElementById("live-waiting-pill");

  async function paintInitialUi() {
    const identity = await C.ensureGuestIdentity();
    if (!identity.isAuth && !identity.guest) {
      guestFormEl.classList.remove("hidden");
    }

    await C.loadState();
    const hasSet = !!C.ctx.todaySet?.set_id;
    const isPlayable = hasSet && C.ctx.state !== "no_content" && C.ctx.state !== "post_game";
    joinBtnEl.disabled = !isPlayable;

    stateEl.textContent = `State: ${C.ctx.state.replace("_", " ")}`;

    if (C.ctx.state === "post_game") {
      countdownEl.textContent = "Today’s set has ended.";
    } else if (C.ctx.state === "no_content" || !hasSet) {
      countdownEl.textContent = "No trivia published for today yet.";
    } else {
      countdownEl.textContent = "Today’s set is open — join anytime.";
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
      waitingCountEl.textContent = `Waiting now: ${n}`;
      if (liveCountEl) liveCountEl.textContent = `${n} waiting`;
    } else {
      waitingCountEl.textContent = "Waiting now: 0";
      if (liveCountEl) liveCountEl.textContent = "0 waiting";
    }
  }

  joinBtnEl.addEventListener("click", async () => {
    joinBtnEl.disabled = true;
    joinBtnEl.textContent = "Joining…";
    try {
      await C.joinSession(guestUsernameEl);
      window.location.href = "/med-trivia-quiz";
    } catch (e) {
      alert(e.message || "Failed to join trivia");
      joinBtnEl.disabled = false;
      joinBtnEl.textContent = "Join Live Session";
    }
  });

  paintInitialUi().catch((e) => {
    stateEl.textContent = "State: error";
    countdownEl.textContent = e.message || "Failed to initialize trivia";
  });
})();
