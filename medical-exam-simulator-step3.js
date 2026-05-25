/**
 * USMLE Step 3 two-day mock simulator (isolated from Step 1/2).
 */
(function () {
  const urlParams = new URLSearchParams(window.location.search);
  const EXAM_ID = urlParams.get('exam_id') || 'step3-mock1';
  const EXAM = MockExamConfig.getExam(EXAM_ID);
  if (!EXAM.step3Exam) {
    window.location.href = `medical-exam-simulator.html?exam_id=${encodeURIComponent(EXAM_ID)}`;
    return;
  }

  const MOCK_NUM = parseInt((EXAM_ID.match(/step3-mock(\d+)/) || [0, 1])[1], 10);
  const CFG = window.MockExamStep3Config;
  const STATE_KEY = CFG.getStateKey(EXAM_ID);
  const DAY1_KEY = CFG.getDay1ResultKey(EXAM_ID);

  let phase = 'hub';
  let day1Result = null;
  let blockConfig = { blocks: 6, qPerBlock: 40, totalHours: 7 };
  let TOTAL_BLOCKS = 6;
  let Q_PER_BLOCK = 40;
  let TOTAL_QUESTIONS = 240;
  let TOTAL_TIME = 7 * 3600000;
  let BLOCK_TIME = 60 * 60000;

  let state = {
    examId: EXAM_ID,
    phase: 'hub',
    examStartedAt: null,
    currentBlock: 0,
    currentQ: 0,
    questions: [],
    answers: {},
    marked: new Set(),
    blockStartTimes: {},
    isBreak: false,
    isReview: false,
    reviewWrongOnly: false,
    wrongIndices: [],
  };

  function saveState() {
    localStorage.setItem(STATE_KEY, JSON.stringify({ ...state, phase, marked: Array.from(state.marked) }));
  }

  function loadDay1Result() {
    try {
      const raw = localStorage.getItem(DAY1_KEY);
      return raw ? JSON.parse(raw) : null;
    } catch {
      return null;
    }
  }

  function saveDay1Result(summary) {
    localStorage.setItem(DAY1_KEY, JSON.stringify({ ...summary, savedAt: Date.now() }));
    day1Result = summary;
  }

  function shuffle(arr) {
    const a = [...arr];
    for (let i = a.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [a[i], a[j]] = [a[j], a[i]];
    }
    return a;
  }

  async function loadPool(day) {
    const slug = CFG.poolSlugs(MOCK_NUM, day);
    const { data: topic, error: te } = await window.dbClient
      .from('topics')
      .select('id')
      .eq('slug', slug)
      .maybeSingle();
    if (te || !topic) throw new Error(`Pool ${slug} not found. Apply Step 3 migrations.`);
    const { data: mcqs, error } = await window.dbClient.from('mcqs').select('*').eq('topic_id', topic.id);
    if (error || !mcqs || mcqs.length < TOTAL_QUESTIONS) {
      throw new Error(`Need ${TOTAL_QUESTIONS} questions in ${slug}; found ${mcqs ? mcqs.length : 0}.`);
    }
    const selected = shuffle(mcqs).slice(0, TOTAL_QUESTIONS);
    const blocks = [];
    for (let i = 0; i < TOTAL_BLOCKS; i++) {
      blocks.push(selected.slice(i * Q_PER_BLOCK, (i + 1) * Q_PER_BLOCK));
    }
    return blocks;
  }

  function setPhaseConfig(p) {
    if (p === 'day1-mcq') {
      blockConfig = CFG.DAY1;
      TOTAL_BLOCKS = CFG.DAY1.blocks;
      Q_PER_BLOCK = CFG.DAY1.questionsPerBlock;
      TOTAL_QUESTIONS = CFG.DAY1.totalQuestions;
      TOTAL_TIME = CFG.DAY1.totalHours * 3600000;
    } else if (p === 'day2-mcq') {
      blockConfig = CFG.DAY2_MCQ;
      TOTAL_BLOCKS = CFG.DAY2_MCQ.blocks;
      Q_PER_BLOCK = CFG.DAY2_MCQ.questionsPerBlock;
      TOTAL_QUESTIONS = CFG.DAY2_MCQ.totalQuestions;
      TOTAL_TIME = (CFG.DAY2_MCQ.totalHours || 6) * 3600000;
    }
    BLOCK_TIME = (blockConfig.blockMinutes || 60) * 60000;
  }

  function showView(id) {
    ['hub-ui', 'sim-ui', 'break-ui', 'report-ui', 'loading-ui'].forEach((v) => {
      const el = document.getElementById(v);
      if (!el) return;
      if (v === id) el.classList.remove('hidden');
      else el.classList.add('hidden');
    });
    document.body.classList.toggle('sim-exam-active', id === 'sim-ui');
  }

  function renderHub() {
    day1Result = loadDay1Result();
    const d1Done = !!day1Result;
    const completed = MockExamConfig.isMockCompleted(EXAM_ID);
    document.getElementById('hub-title').textContent = EXAM.title;
    document.getElementById('hub-focus').textContent = EXAM.focus || '';
    document.getElementById('hub-completed-tag').classList.toggle('hidden', !completed);
    document.getElementById('day1-status').textContent = d1Done
      ? `Completed — ${day1Result.scorePct}% (${day1Result.correct}/${day1Result.total})`
      : 'Not started · ~7 hours · 6 blocks × 40 questions';
    const day2Btn = document.getElementById('btn-start-day2');
    day2Btn.disabled = !d1Done;
    day2Btn.title = d1Done ? '' : 'Complete Day 1 first';
    document.getElementById('day2-status').textContent = d1Done
      ? 'Day 2 ACP: 6 blocks × 33 MCQs (~6 hours) — CCS not included'
      : 'Locked until Day 1 is complete';
    showView('hub-ui');
  }

  async function startDay1() {
    setPhaseConfig('day1-mcq');
    phase = 'day1-mcq';
    showView('loading-ui');
    try {
      state.questions = await loadPool(1);
      state.answers = {};
      state.marked = new Set();
      state.currentBlock = 0;
      state.currentQ = 0;
      state.isBreak = false;
      state.isReview = false;
      state.examStartedAt = Date.now();
      state.blockStartTimes[0] = Date.now();
      phase = 'day1-mcq';
      state.phase = phase;
      saveState();
      document.getElementById('sim-exam-title').textContent = `${EXAM.title} — Day 1 FIP`;
      showView('sim-ui');
      initMcqUI();
      updateTimers();
    } catch (e) {
      document.getElementById('loading-msg').textContent = e.message;
    }
  }

  async function startDay2Mcq() {
    if (!loadDay1Result()) {
      alert('Complete Day 1 before starting Day 2.');
      return;
    }
    setPhaseConfig('day2-mcq');
    phase = 'day2-mcq';
    showView('loading-ui');
    try {
      state.questions = await loadPool(2);
      state.answers = {};
      state.marked = new Set();
      state.currentBlock = 0;
      state.currentQ = 0;
      state.isBreak = false;
      state.isReview = false;
      state.examStartedAt = Date.now();
      state.blockStartTimes[0] = Date.now();
      phase = 'day2-mcq';
      state.phase = phase;
      saveState();
      document.getElementById('sim-exam-title').textContent = `${EXAM.title} — Day 2 MCQ`;
      showView('sim-ui');
      initMcqUI();
      updateTimers();
    } catch (e) {
      document.getElementById('loading-msg').textContent = e.message;
    }
  }

  function scoreMcqPhase() {
    let correct = 0;
    let g = 0;
    const wrong = [];
    for (let b = 0; b < TOTAL_BLOCKS; b++) {
      for (let q = 0; q < Q_PER_BLOCK; q++) {
        const question = state.questions[b][q];
        if (state.answers[g] === question.correct_index) correct++;
        else wrong.push(g);
        g++;
      }
    }
    return {
      correct,
      total: TOTAL_QUESTIONS,
      scorePct: Math.round((correct / TOTAL_QUESTIONS) * 100),
      wrongIndices: wrong,
    };
  }

  function finishDay1() {
    const r = scoreMcqPhase();
    saveDay1Result(r);
    phase = 'hub';
    state.phase = 'hub';
    localStorage.removeItem(STATE_KEY);
    renderHub();
    alert(`Day 1 complete. Score: ${r.scorePct}% (${r.correct}/${r.total}). Day 2 is now unlocked.`);
  }

  function finishDay2Mcq() {
    const r = scoreMcqPhase();
    state.day2McqResult = r;
    localStorage.removeItem(STATE_KEY);
    finishFullExam();
  }

  function finishFullExam() {
    const d1 = loadDay1Result() || { scorePct: 0, correct: 0, total: 240 };
    const d2m = state.day2McqResult || scoreMcqPhase();
    const combinedPct = Math.round(d1.scorePct * 0.5 + d2m.scorePct * 0.5);
    const readiness = CFG.getStep3Readiness(combinedPct);

    MockExamConfig.markMockCompleted(EXAM_ID, {
      scorePct: combinedPct,
      day1Pct: d1.scorePct,
      day2McqPct: d2m.scorePct,
      projectedScore: readiness.passMid,
    });

    document.getElementById('report-title').textContent = EXAM.title;
    document.getElementById('report-stats').innerHTML = `
      <div class="report-prob-ring">
        <div>
          <div class="report-prob-value" style="color:${readiness.statusColor}">${readiness.passMid}</div>
          <div style="font-size:12px;color:#6b7280;font-weight:700;">ESTIMATED STEP 3 SCORE</div>
          <div style="font-size:11px;color:#9ca3af;margin-top:4px;">Range: ${readiness.passRange} · Pass ~198 · Mean ~225</div>
        </div>
        <div>
          <div class="report-status-pill" style="border-color:${readiness.statusColor}55;color:${readiness.statusColor}">
            ${readiness.status}
          </div>
          <div style="font-size:36px;font-weight:900;color:white">${combinedPct}%</div>
          <div style="font-size:11px;color:#9ca3af;font-weight:800;text-transform:uppercase">Combined MCQ Raw</div>
        </div>
      </div>
      <div class="report-stat-grid" style="grid-template-columns:1fr 1fr">
        <div class="report-stat-box"><div style="font-size:18px;font-weight:900;color:white">Day 1 FIP</div><div>${d1.scorePct}% · ${d1.correct}/${d1.total}</div></div>
        <div class="report-stat-box"><div style="font-size:18px;font-weight:900;color:white">Day 2 ACP</div><div>${d2m.scorePct}% · ${d2m.correct}/${d2m.total}</div></div>
      </div>
      <p style="font-size:12px;color:#6b7280;margin-top:12px">Note: Real Step 3 Day 2 includes CCS cases; this mock is MCQ-only.</p>
      <p class="report-performance"><strong>Performance:</strong> ${readiness.performanceLevel}</p>
    `;
    localStorage.removeItem(STATE_KEY);
    showView('report-ui');
  }

  function formatTimeLong(ms) {
    const s = Math.floor(ms / 1000);
    const h = Math.floor(s / 3600);
    const m = Math.floor((s % 3600) / 60);
    const rs = s % 60;
    return `${h.toString().padStart(2, '0')}:${m.toString().padStart(2, '0')}:${rs.toString().padStart(2, '0')}`;
  }

  function formatTimeShort(ms) {
    const s = Math.floor(ms / 1000);
    const m = Math.floor(s / 60);
    const rs = s % 60;
    return `${m.toString().padStart(2, '0')}:${rs.toString().padStart(2, '0')}`;
  }

  function updateTimers() {
    if (!state.examStartedAt || state.isReview) return;
    const now = Date.now();
    const remTotal = Math.max(0, TOTAL_TIME - (now - state.examStartedAt));
    const gt = document.getElementById('global-timer');
    const gtb = document.getElementById('global-timer-break');
    if (gt) gt.textContent = formatTimeLong(remTotal);
    if (gtb) gtb.textContent = formatTimeLong(remTotal);
    if (remTotal <= 0) {
      submitBlock(true);
      return;
    }
    if (!state.isBreak) {
      const bs = state.blockStartTimes[state.currentBlock] || state.examStartedAt;
      const remBlock = Math.max(0, BLOCK_TIME - (now - bs));
      const bt = document.getElementById('block-timer');
      if (bt) bt.textContent = formatTimeShort(remBlock);
      if (remBlock <= 0) submitBlock(true);
    }
  }

  function initMcqUI() {
    renderMcqNav();
    renderQuestion();
    setInterval(updateTimers, 1000);
  }

  function renderMcqNav() {
    const dots = document.getElementById('block-dots');
    dots.innerHTML = '';
    for (let i = 0; i < TOTAL_BLOCKS; i++) {
      const dot = document.createElement('div');
      dot.className = `block-dot ${i === state.currentBlock ? 'active' : i < state.currentBlock ? 'done' : ''}`;
      dots.appendChild(dot);
    }
    const qNav = document.getElementById('q-nav');
    qNav.innerHTML = '';
    for (let i = 0; i < Q_PER_BLOCK; i++) {
      const g = state.currentBlock * Q_PER_BLOCK + i;
      const btn = document.createElement('div');
      btn.className = `q-btn ${i === state.currentQ ? 'current' : ''} ${state.answers[g] !== undefined ? 'answered' : 'unanswered'}`;
      btn.textContent = i + 1;
      btn.onclick = () => {
        state.currentQ = i;
        saveState();
        renderQuestion();
        renderMcqNav();
      };
      qNav.appendChild(btn);
    }
    document.getElementById('block-tracker-text').textContent =
      `${phase === 'day1-mcq' ? 'DAY 1 FIP' : 'DAY 2 ACP'} — BLOCK ${state.currentBlock + 1} OF ${TOTAL_BLOCKS}`;
  }

  function renderQuestion() {
    const g = state.currentBlock * Q_PER_BLOCK + state.currentQ;
    const q = state.questions[state.currentBlock][state.currentQ];
    document.getElementById('q-text').innerHTML = `<div style="font-size:11px;color:#9ca3af;margin-bottom:8px;font-weight:800">Q ${state.currentQ + 1} / ${Q_PER_BLOCK}</div><div style="line-height:1.6;font-size:18px">${formatMcqHtml(q.question)}</div>`;
    const opts = Array.isArray(q.options) ? q.options : JSON.parse(q.options);
    document.getElementById('options-list').innerHTML = opts
      .map(
        (opt, i) =>
          `<div class="option-row ${state.answers[g] === i ? 'selected' : ''}" onclick="window._s3Select(${i})"><span class="opt-letter">${String.fromCharCode(65 + i)})</span><span>${formatMcqHtml(opt)}</span></div>`
      )
      .join('');
  }

  window._s3Select = function (idx) {
    const g = state.currentBlock * Q_PER_BLOCK + state.currentQ;
    state.answers[g] = idx;
    saveState();
    renderQuestion();
    renderMcqNav();
  };

  window._s3Next = function () {
    if (state.currentQ < Q_PER_BLOCK - 1) {
      state.currentQ++;
      saveState();
      renderQuestion();
      renderMcqNav();
    }
  };

  window._s3Prev = function () {
    if (state.currentQ > 0) {
      state.currentQ--;
      saveState();
      renderQuestion();
      renderMcqNav();
    }
  };

  function submitBlock(isAuto) {
    if (state.currentBlock + 1 >= TOTAL_BLOCKS) {
      if (phase === 'day1-mcq') finishDay1();
      else finishDay2Mcq();
      return;
    }
    state.isBreak = true;
    state.currentBlock++;
    state.currentQ = 0;
    showView('break-ui');
    saveState();
  }

  window._s3Resume = function () {
    state.isBreak = false;
    state.blockStartTimes[state.currentBlock] = Date.now();
    showView('sim-ui');
    renderMcqNav();
    renderQuestion();
    saveState();
  };

  window._s3Hub = function () {
    phase = 'hub';
    showView('hub-ui');
    renderHub();
  };

  window._s3Exit = function () {
    window.location.href = 'medical-exam-mock.html?tab=step3';
  };

  async function init() {
    if (EXAM.comingSoon) {
      alert('This mock is not available yet.');
      window.location.href = 'medical-exam-mock.html?tab=step3';
      return;
    }
    const premium = await MediHelp.isPremium();
    if (!premium && EXAM.premiumOnly) {
      document.getElementById('paywall-overlay').classList.remove('hidden');
      return;
    }
    document.getElementById('paywall-overlay')?.classList.add('hidden');
    renderHub();
  }

  window._s3StartDay1 = startDay1;
  window._s3StartDay2 = startDay2Mcq;
  window._s3SubmitBlock = () => submitBlock(false);
  document.addEventListener('DOMContentLoaded', init);
})();
