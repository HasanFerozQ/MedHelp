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
      summary: 'Full-length board simulation — timed 7 blocks, mixed high-yield Step 1 disciplines.',
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
      badge: 'STEP 1 · NBME BLUEPRINT',
      summary: 'NBME-style weighting emphasizing pathology, physiology, pharmacology, microbiology & biochemistry.',
      questions: 280,
      totalHours: 8,
      format: '7 Blocks / 60m ea.',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step1-stratified-mock2',
      confirmMessage: 'Ready to start USMLE Step 1 Mock #2? Blueprint-weighted questions load across 7 blocks.',
    },
    'step1-mock3': {
      id: 'step1-mock3',
      step: 1,
      tab: 'step1',
      title: 'USMLE Step 1 Mock #3',
      badge: 'STEP 1 · TEXTBOOK MASTERY',
      summary: 'Classic textbook–driven 280-question exam for Step 1 fundamentals and clinical vignettes.',
      questions: 280,
      totalHours: 8,
      format: '7 Blocks / 60m ea.',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step1-stratified-mock3',
      confirmMessage: 'Ready to start USMLE Step 1 Mock #3? Questions are drawn from your core Step 1 textbook map.',
      showTextbooks: true,
    },
    'step2-mock1': {
      id: 'step2-mock1',
      step: 2,
      tab: 'step2',
      title: 'USMLE Step 2 Mock #1',
      badge: 'STEP 2 CK',
      summary: 'Clinical knowledge assessment — diagnosis and management (coming soon).',
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
      summary: 'Clinical case integration and CCS-style workflow (coming soon).',
      questions: null,
      totalHours: null,
      format: 'Coming soon',
      freeDemo: true,
      comingSoon: true,
      pool: 'step3-random',
    },
  },

  /** NBME blueprint emphasis — Mock #2 only (280). */
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

  /**
   * Textbook-aligned emphasis — Mock #3 only (280).
   * Maps your provided Step 1 sources to topic pools (no overlap with Mock #2 weighting).
   */
  step1Mock3Buckets: [
    { count: 48, label: "Gray's · Langman's · Moore · Netter · HY Gross/Embryo", slugs: ['usmle-1-anatomy', 'embryology', 'musculoskeletal'] },
    { count: 36, label: "Harper's · Lippincott Biochem · molecular", slugs: ['usmle-1-biochemistry', 'molecular-biology', 'usmle-1-nutrition'] },
    { count: 42, label: "Ganong · Guyton · BRS Physiology · West", slugs: ['cardiovascular-physiology', 'respiratory-physiology', 'renal-physiology', 'gastrointestinal-physiology', 'endocrine-physiology', 'reproductive-physiology', 'usmle-1-physiology'] },
    { count: 46, label: "Robbins Basic/PBD · Goljan · Pathoma", slugs: ['usmle-1-pathology', 'pathology', 'hematology'] },
    { count: 26, label: "Katzung · Lippincott Pharm · BRS · Goodman & Gilman", slugs: ['pharmacology-usmle-1', 'neuropharmacology'] },
    { count: 20, label: 'Gladwin · Murray Micro', slugs: ['usmle-1-microbiology'] },
    { count: 12, label: "Abbas · Lippincott Immunology", slugs: ['immunology'] },
    { count: 12, label: "Thompson Genetics · HY Genetics", slugs: ['usmle-1-genetics'] },
    { count: 18, label: "Snell Neuro · Netter Neuro · HY Neuro", slugs: ['neuropathology'] },
    { count: 12, label: 'Kaplan Behavioral · BRS Behavioral · Fletcher · Jekel · HY Biostat', slugs: ['behavioral-sciences-usmle-1', 'ethics-professionalism', 'usmle-1-biostatistics'] },
    { count: 8, label: "Wheater's Histology · Dermatology · Aging", slugs: ['dermatology', 'usmle-1-aging'] },
  ],

  /** Canonical Step 1 textbook list (Mock #3 card + exam metadata). */
  step1TextbookSources: [
    "Gray's Anatomy for Students (Drake, Vogl & Mitchell)",
    "Langman's Medical Embryology (Sadler)",
    "Clinically Oriented Anatomy (Moore, Dalley & Agur)",
    "Harper's Illustrated Biochemistry (Rodwell et al.)",
    "Lippincott's Illustrated Reviews: Biochemistry (Harvey & Ferrier)",
    "Robbins & Cotran: Basic Pathology (Kumar, Abbas & Aster)",
    "Wheater's Functional Histology (Young, O'Dowd & Woodford)",
    "Ganong's Review of Medical Physiology (Barrett et al.)",
    "Guyton & Hall: Textbook of Medical Physiology (Hall & Hall)",
    "BRS Physiology (Costanzo)",
    "Netter's Atlas of Human Anatomy (Netter)",
    "The Developing Human (Moore & Persaud)",
    "Kaplan Medical: USMLE Behavioral Science",
    "Clinical Epidemiology: The Essentials (Fletcher & Fletcher)",
    "Jekel's Epidemiology, Biostatistics & Clinical Medicine (Katz et al.)",
    "Thompson & Thompson: Genetics in Medicine (Nussbaum, McInnes & Willard)",
    "Cellular and Molecular Immunology (Abbas, Lichtman & Pillai)",
    "Basic & Clinical Pharmacology (Katzung, Trevor & Masters)",
    "Lippincott's Illustrated Reviews: Pharmacology (Whalen)",
    "Robbins & Cotran: Pathologic Basis of Disease (Kumar, Abbas & Aster)",
    "Rapid Review Pathology (Goljan)",
    "Clinical Microbiology Made Ridiculously Simple (Gladwin & Trattler)",
    "Murray's Medical Microbiology (Murray et al.)",
    "Goodman & Gilman's Pharmacological Basis of Therapeutics (Brunton et al.)",
    "BRS Pharmacology (Rosenfeld & Loose)",
    "Clinical Neuroanatomy (Snell)",
    "Netter's Neuroscience Flash Cards (Felten et al.)",
    "BRS Behavioral Science (Fadem)",
    "First Aid for the USMLE Step 1 (Le, Bhushan & Sochat)",
    "Pathoma: Fundamentals of Pathology (Husain Sattar)",
    "Sketchy Medical (Micro + Pharm)",
    "UWorld Step 1 Qbank",
    "AMBOSS (Qbank + Library)",
    "High-Yield Neuroanatomy (Fix)",
    "High-Yield Gross Anatomy (Dudek & Louis)",
    "High-Yield Embryology (Dudek)",
    "High-Yield Biostatistics (Glaser)",
    "Lippincott's Illustrated Reviews: Immunology (Theofilopoulos et al.)",
    "High-Yield Genetics (Dudek)",
    "Netter's Clinical Anatomy (Hansen)",
    "Deja Review: USMLE Step 1 Hematology & Oncology (Le)",
    "First Aid Q&A for the USMLE Step 1 (Le & Bhushan)",
  ],

  getExam(id) {
    return this.exams[id] || this.exams['step1-mock1'];
  },

  getExamsForTab(tab) {
    return Object.values(this.exams)
      .filter((e) => e.tab === tab)
      .sort((a, b) => a.title.localeCompare(b.title, undefined, { numeric: true }));
  },

  getBucketsForExam(examId) {
    if (examId === 'step1-mock2') return this.step1Mock2Buckets;
    if (examId === 'step1-mock3') return this.step1Mock3Buckets;
    return null;
  },

  getStateKey(examId) {
    return `mh_sim_state_${examId}`;
  },

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
