/**
 * USMLE full-length mock exam definitions (lobby + simulator).
 */
window.MockExamConfig = {
  TOTAL_BLOCKS: 7,
  Q_PER_BLOCK: 40,

  exams: {
    'step1-mock1': {
      id: 'step1-mock1',
      step: 1,
      tab: 'step1',
      title: 'USMLE Step 1 Mock #1',
      badge: 'STEP 1 · MOST POPULAR',
      description: 'Complete 280-question simulation across 7 board-style blocks (First Aid, Pathoma, UWorld-style pool).',
      questions: 280,
      totalHours: 8,
      format: '7 Blocks / 60m ea.',
      freeDemo: true,
      pool: 'step1-random',
      confirmMessage: 'Ready to start the 8-hour USMLE Step 1 exam? The clock runs in real time once you begin.',
    },
    'step1-mock2': {
      id: 'step1-mock2',
      step: 1,
      tab: 'step1',
      title: 'USMLE Step 1 Mock #2',
      badge: 'STEP 1 · HIGH-YIELD',
      description: '280-question exam weighted to NBME/USMLE Step 1 blueprint — pathology, physiology, pharm, micro, biochem, anatomy, behavioral sciences, immunology, genetics, and biostatistics (Gray\'s, Robbins, Costanzo, Katzung, Goljan, Pathoma, Sketchy, Lippincott, BRS, and board prep sources).',
      questions: 280,
      totalHours: 8,
      format: '7 Blocks / 60m ea.',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step1-stratified',
      confirmMessage: 'Ready to start USMLE Step 1 Mock #2? This 8-hour exam uses blueprint-weighted questions from our Step 1 library.',
    },
    'step2-mock1': {
      id: 'step2-mock1',
      step: 2,
      tab: 'step2',
      title: 'USMLE Step 2 Mock #1',
      badge: 'STEP 2 CK',
      description: 'Clinical knowledge assessment focusing on diagnosis and management (318 MCQs · 9 hours).',
      questions: 318,
      totalHours: 9,
      format: '8 Blocks / 60m ea.',
      freeDemo: true,
      comingSoon: true,
      pool: 'step2-random',
    },
    'step3-mock1': {
      id: 'step3-mock1',
      step: 3,
      tab: 'step3',
      title: 'USMLE Step 3 Mock #1',
      badge: 'STEP 3',
      description: 'Clinical case integration and multi-day ambulatory/CCS-style workflow (coming soon).',
      questions: null,
      totalHours: null,
      format: 'Coming soon',
      freeDemo: true,
      comingSoon: true,
      pool: 'step3-random',
    },
  },

  /** Blueprint-weighted topic slugs for Step 1 Mock #2 (sums to 280). */
  step1Mock2Buckets: [
    { count: 70, slugs: ['usmle-1-pathology', 'pathology', 'neuropathology', 'hematology'] },
    { count: 44, slugs: ['cardiovascular-physiology', 'respiratory-physiology', 'renal-physiology', 'gastrointestinal-physiology', 'endocrine-physiology', 'reproductive-physiology', 'usmle-1-physiology'] },
    { count: 26, slugs: ['pharmacology-usmle-1', 'neuropharmacology'] },
    { count: 18, slugs: ['usmle-1-microbiology'] },
    { count: 28, slugs: ['usmle-1-biochemistry', 'molecular-biology'] },
    { count: 20, slugs: ['usmle-1-anatomy', 'musculoskeletal', 'embryology'] },
    { count: 16, slugs: ['behavioral-sciences-usmle-1', 'ethics-professionalism'] },
    { count: 12, slugs: ['immunology'] },
    { count: 11, slugs: ['usmle-1-genetics'] },
    { count: 8, slugs: ['usmle-1-biostatistics'] },
    { count: 27, slugs: ['dermatology', 'usmle-1-nutrition', 'usmle-1-aging'] },
  ],

  getExam(id) {
    return this.exams[id] || this.exams['step1-mock1'];
  },

  getExamsForTab(tab) {
    return Object.values(this.exams).filter((e) => e.tab === tab);
  },

  getStateKey(examId) {
    return `mh_sim_state_${examId}`;
  },

  /** Step 1 readiness report from percent correct. */
  getStep1Readiness(scorePct) {
    let passMin, passMax, status, statusColor, performanceLevel;
    if (scorePct >= 75) {
      passMin = 90; passMax = 97;
      status = 'High Likelihood Pass';
      statusColor = '#10b981';
      performanceLevel = 'Strong performance — continue timed blocks and weak-area drills';
    } else if (scorePct >= 70) {
      passMin = 80; passMax = 90;
      status = 'Likely Pass';
      statusColor = '#34d399';
      performanceLevel = 'Solid foundation — polish high-yield pathology and pharmacology';
    } else if (scorePct >= 65) {
      passMin = 65; passMax = 75;
      status = 'Likely Pass';
      statusColor = '#fbbf24';
      performanceLevel = 'Competent but needs reinforcement in weak systems';
    } else if (scorePct >= 60) {
      passMin = 40; passMax = 55;
      status = 'Borderline';
      statusColor = '#f59e0b';
      performanceLevel = 'Approaching passing range — increase UWorld/Pathoma review volume';
    } else if (scorePct >= 55) {
      passMin = 20; passMax = 30;
      status = 'At Risk';
      statusColor = '#f97316';
      performanceLevel = 'Below target — focus core pathology, physiology, and pharmacology';
    } else {
      passMin = 5; passMax = 18;
      status = 'Not Ready';
      statusColor = '#ef4444';
      performanceLevel = 'Significant gaps — rebuild fundamentals before another full-length';
    }
    const passMid = Math.round((passMin + passMax) / 2);
    const statusEmoji = scorePct >= 70 ? '🟢' : scorePct >= 65 ? '🟡' : scorePct >= 55 ? '🟠' : '🔴';
    return {
      passMin,
      passMax,
      passMid,
      passRange: `${passMin}–${passMax}%`,
      status,
      statusEmoji,
      statusColor,
      performanceLevel,
    };
  },
};
