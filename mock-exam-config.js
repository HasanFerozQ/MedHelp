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
      badge: 'STEP 1',
      questions: 280,
      totalHours: 8,
      format: '7 Blocks / 60m ea.',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step1-random',
      focus: 'Balanced random mix across all Step 1 disciplines (UWorld / First Aid style full-length).',
      confirmMessage: 'Ready to start the 8-hour USMLE Step 1 exam? The clock runs in real time once you begin.',
    },
    'step1-mock2': {
      id: 'step1-mock2',
      step: 1,
      tab: 'step1',
      title: 'USMLE Step 1 Mock #2',
      badge: 'STEP 1',
      questions: 280,
      totalHours: 8,
      format: '7 Blocks / 60m ea.',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step1-stratified-mock2',
      focus: 'NBME blueprint weighting — pathology-heavy with physiology, pharmacology, micro, and biochemistry.',
      confirmMessage: 'Ready to start USMLE Step 1 Mock #2? Blueprint-weighted questions load across 7 blocks.',
    },
    'step1-mock3': {
      id: 'step1-mock3',
      step: 1,
      tab: 'step1',
      title: 'USMLE Step 1 Mock #3',
      badge: 'STEP 1',
      questions: 280,
      totalHours: 8,
      format: '7 Blocks / 60m ea.',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step1-stratified-mock3',
      focus: 'Classic textbooks — Gray\'s, Langman\'s, Moore, Harper\'s, Robbins, Ganong, Katzung, Goljan, Pathoma, and related sources.',
      confirmMessage: 'Ready to start USMLE Step 1 Mock #3? Questions are drawn from your core Step 1 textbook map.',
    },
    'step1-mock4': {
      id: 'step1-mock4',
      step: 1,
      tab: 'step1',
      title: 'USMLE Step 1 Mock #4',
      badge: 'STEP 1',
      questions: 280,
      totalHours: 8,
      format: '7 Blocks / 60m ea.',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step1-stratified-mock4',
      focus: 'High-yield pass prep — Pathoma, Goljan, Sketchy, First Aid, UWorld-style, Katzung, and BRS disciplines.',
      confirmMessage: 'Ready to start USMLE Step 1 Mock #4? Pass-focused high-yield questions load across 7 timed blocks.',
    },
    'step1-mock5': {
      id: 'step1-mock5',
      step: 1,
      tab: 'step1',
      title: 'USMLE Step 1 Mock #5',
      badge: 'STEP 1',
      questions: 280,
      totalHours: 8,
      format: '7 Blocks / 60m ea.',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step1-stratified-mock5',
      focus: 'Organ-system integration — cardio, pulmonary, renal, GI, endocrine, repro, neuro, MSK/skin (Guyton, Ganong, West, Lilly, Greenspan, Snell, Netter).',
      confirmMessage: 'Ready to start USMLE Step 1 Mock #5? Integrated organ-system vignettes load across 7 blocks.',
    },
    'step2-mock1': {
      id: 'step2-mock1',
      step: 2,
      tab: 'step2',
      title: 'USMLE Step 2 Mock #1',
      badge: 'STEP 2 CK',
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

  /**
   * Board-crush / pass-prep emphasis — Mock #4 only (280).
   * Weights highest-yield Step 1 disciplines (Pathoma, Goljan, Sketchy, First Aid, UWorld, Katzung).
   */
  step1Mock4Buckets: [
    { count: 58, label: 'Pathoma · Goljan · Robbins PBD · First Aid Path', slugs: ['usmle-1-pathology', 'pathology', 'neuropathology'] },
    { count: 32, label: 'Sketchy Pharm · Katzung · Lippincott · BRS · Goodman', slugs: ['pharmacology-usmle-1', 'neuropharmacology'] },
    { count: 24, label: 'Sketchy Micro · Gladwin · Murray', slugs: ['usmle-1-microbiology'] },
    { count: 38, label: 'Ganong · Guyton · BRS Physiology · organ systems', slugs: ['cardiovascular-physiology', 'respiratory-physiology', 'renal-physiology', 'gastrointestinal-physiology', 'endocrine-physiology', 'reproductive-physiology', 'usmle-1-physiology'] },
    { count: 22, label: "Harper's · Lippincott Biochem · First Aid Biochem", slugs: ['usmle-1-biochemistry', 'molecular-biology'] },
    { count: 18, label: "Gray's · HY Gross · Langman's · Moore · Netter", slugs: ['usmle-1-anatomy', 'embryology', 'musculoskeletal'] },
    { count: 14, label: 'Abbas Immunology · Lippincott Immunology', slugs: ['immunology'] },
    { count: 10, label: 'Thompson Genetics · HY Genetics · First Aid', slugs: ['usmle-1-genetics'] },
    { count: 14, label: 'Kaplan Behavioral · BRS Fadem · Ethics · HY Biostat · Jekel', slugs: ['behavioral-sciences-usmle-1', 'ethics-professionalism', 'usmle-1-biostatistics'] },
    { count: 16, label: 'Snell Neuro · HY Neuroanatomy · Netter Neuro', slugs: ['neuropathology'] },
    { count: 12, label: 'Deja Review Heme-Onc · hematology', slugs: ['hematology'] },
    { count: 22, label: 'Multisystem · derm · nutrition · aging · Amboss-style', slugs: ['dermatology', 'usmle-1-nutrition', 'usmle-1-aging'] },
  ],

  /**
   * Organ-system integrated emphasis — Mock #5 only (280).
   * Guyton, Ganong, West, Lilly, Greenspan, Snell, Netter + cross-topic reinforcement.
   */
  step1Mock5Buckets: [
    { count: 26, label: 'Cardiovascular · Lilly · Guyton', slugs: ['cardiovascular-physiology', 'hematology'] },
    { count: 22, label: 'Respiratory · West', slugs: ['respiratory-physiology'] },
    { count: 20, label: 'Renal · Guyton · BRS', slugs: ['renal-physiology'] },
    { count: 18, label: 'Gastrointestinal', slugs: ['gastrointestinal-physiology'] },
    { count: 18, label: 'Endocrine · Greenspan · BRS', slugs: ['endocrine-physiology'] },
    { count: 16, label: 'Reproductive · Costanzo BRS', slugs: ['reproductive-physiology'] },
    { count: 19, label: 'Neuro · Snell · HY Neuro · neuropath', slugs: ['neuropathology', 'neuropharmacology'] },
    { count: 18, label: 'MSK · Netter · Gray\'s · dermatology', slugs: ['musculoskeletal', 'dermatology', 'usmle-1-anatomy'] },
    { count: 18, label: 'Pathology · Robbins · Pathoma · Goljan', slugs: ['usmle-1-pathology', 'pathology'] },
    { count: 17, label: 'Pharmacology · Katzung · Lippincott · Goodman', slugs: ['pharmacology-usmle-1'] },
    { count: 14, label: 'Microbiology · Gladwin · Murray · Sketchy', slugs: ['usmle-1-microbiology'] },
    { count: 14, label: 'Biochemistry · Harper · Lippincott', slugs: ['usmle-1-biochemistry', 'molecular-biology'] },
    { count: 12, label: 'Embryology · Langman\'s · Developing Human', slugs: ['embryology'] },
    { count: 10, label: 'Immunology · Abbas · Lippincott', slugs: ['immunology'] },
    { count: 8, label: 'Genetics · Thompson · HY Genetics', slugs: ['usmle-1-genetics'] },
    { count: 12, label: 'Behavioral · Ethics · Biostat · Kaplan · Jekel', slugs: ['behavioral-sciences-usmle-1', 'ethics-professionalism', 'usmle-1-biostatistics'] },
    { count: 10, label: 'Nutrition · Aging · multisystem', slugs: ['usmle-1-nutrition', 'usmle-1-aging'] },
    { count: 8, label: 'General physiology bridge', slugs: ['usmle-1-physiology'] },
  ],

  /** All Step 1 topic pools available in Supabase (used across mocks). */
  step1TopicCatalog: [
    { slug: 'usmle-1-pathology', name: 'General Pathology' },
    { slug: 'pathology', name: 'Systemic Pathology' },
    { slug: 'neuropathology', name: 'Neuropathology' },
    { slug: 'hematology', name: 'Hematology / Oncology' },
    { slug: 'cardiovascular-physiology', name: 'Cardiovascular Physiology' },
    { slug: 'respiratory-physiology', name: 'Respiratory Physiology' },
    { slug: 'renal-physiology', name: 'Renal / Urinary Physiology' },
    { slug: 'gastrointestinal-physiology', name: 'Gastrointestinal Physiology' },
    { slug: 'endocrine-physiology', name: 'Endocrine Physiology' },
    { slug: 'reproductive-physiology', name: 'Reproductive Physiology' },
    { slug: 'usmle-1-physiology', name: 'General Physiology' },
    { slug: 'pharmacology-usmle-1', name: 'Pharmacology' },
    { slug: 'neuropharmacology', name: 'Neuropharmacology' },
    { slug: 'usmle-1-microbiology', name: 'Microbiology' },
    { slug: 'usmle-1-biochemistry', name: 'Biochemistry' },
    { slug: 'molecular-biology', name: 'Molecular Biology' },
    { slug: 'usmle-1-anatomy', name: 'Gross Anatomy' },
    { slug: 'embryology', name: 'Embryology' },
    { slug: 'musculoskeletal', name: 'Musculoskeletal / Skin' },
    { slug: 'behavioral-sciences-usmle-1', name: 'Behavioral Sciences' },
    { slug: 'ethics-professionalism', name: 'Ethics & Professionalism' },
    { slug: 'immunology', name: 'Immunology' },
    { slug: 'usmle-1-genetics', name: 'Genetics' },
    { slug: 'usmle-1-biostatistics', name: 'Biostatistics & Epidemiology' },
    { slug: 'dermatology', name: 'Dermatology' },
    { slug: 'usmle-1-nutrition', name: 'Nutrition' },
    { slug: 'usmle-1-aging', name: 'Aging / Geriatrics Principles' },
  ],

  /** Canonical Step 1 textbook & board-prep sources (exam engine metadata). */
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
    const pool = this.getExam(examId).pool;
    const byPool = {
      'step1-stratified-mock2': this.step1Mock2Buckets,
      'step1-stratified-mock3': this.step1Mock3Buckets,
      'step1-stratified-mock4': this.step1Mock4Buckets,
      'step1-stratified-mock5': this.step1Mock5Buckets,
    };
    return byPool[pool] || null;
  },

  getStep1Exams() {
    return this.getExamsForTab('step1');
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
