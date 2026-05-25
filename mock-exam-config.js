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
      totalBlocks: 7,
      questionsPerBlock: 40,
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
      totalBlocks: 7,
      questionsPerBlock: 40,
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
      totalBlocks: 7,
      questionsPerBlock: 40,
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
      totalBlocks: 7,
      questionsPerBlock: 40,
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
      totalBlocks: 7,
      questionsPerBlock: 40,
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
      title: 'USMLE Step 2 CK Mock #1',
      badge: 'STEP 2 CK',
      questions: 320,
      totalBlocks: 8,
      questionsPerBlock: 40,
      totalHours: 9,
      format: '8 Blocks / 60m ea.',
      freeDemo: true,
      pool: 'step2-dedicated-mock1',
      focus: 'Balanced NBME-style clinical vignettes — internal medicine, surgery, pediatrics, OB/GYN, psychiatry (UWorld / First Aid / Step-Up).',
      confirmMessage: 'Ready to start the 9-hour USMLE Step 2 CK Mock #1? The clock runs in real time once you begin.',
    },
    'step2-mock2': {
      id: 'step2-mock2',
      step: 2,
      tab: 'step2',
      title: 'USMLE Step 2 CK Mock #2',
      badge: 'STEP 2 CK',
      questions: 320,
      totalBlocks: 8,
      questionsPerBlock: 40,
      totalHours: 9,
      format: '8 Blocks / 60m ea.',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step2-dedicated-mock2',
      focus: 'Internal medicine emphasis — Harrison, CMDT, Washington Manual, Kumar & Clark, organ-system subspecialty texts.',
      confirmMessage: 'Ready to start USMLE Step 2 CK Mock #2? Internal medicine–weighted vignettes load across 8 timed blocks.',
    },
    'step2-mock3': {
      id: 'step2-mock3',
      step: 2,
      tab: 'step2',
      title: 'USMLE Step 2 CK Mock #3',
      badge: 'STEP 2 CK',
      questions: 320,
      totalBlocks: 8,
      questionsPerBlock: 40,
      totalHours: 9,
      format: '8 Blocks / 60m ea.',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step2-dedicated-mock3',
      focus: 'Surgery & acute care — Schwartz, Bailey & Love, ATLS, Tintinalli, Rosen, Surgical Recall, trauma and perioperative management.',
      confirmMessage: 'Ready to start USMLE Step 2 CK Mock #3? Surgery and emergency medicine vignettes load across 8 blocks.',
    },
    'step2-mock4': {
      id: 'step2-mock4',
      step: 2,
      tab: 'step2',
      title: 'USMLE Step 2 CK Mock #4',
      badge: 'STEP 2 CK',
      questions: 320,
      totalBlocks: 8,
      questionsPerBlock: 40,
      totalHours: 9,
      format: '8 Blocks / 60m ea.',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step2-dedicated-mock4',
      focus: 'Pediatrics & OB/GYN — Nelson, Williams Obstetrics/Gynecology, Beckmann, PALS/ALSO, high-yield women's and children's health.',
      confirmMessage: 'Ready to start USMLE Step 2 CK Mock #4? Pediatrics and OB/GYN vignettes load across 8 timed blocks.',
    },
    'step2-mock5': {
      id: 'step2-mock5',
      step: 2,
      tab: 'step2',
      title: 'USMLE Step 2 CK Mock #5',
      badge: 'STEP 2 CK',
      questions: 320,
      totalBlocks: 8,
      questionsPerBlock: 40,
      totalHours: 9,
      format: '8 Blocks / 60m ea.',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step2-dedicated-mock5',
      focus: 'Psychiatry, ethics, geriatrics, derm, ophtho, ENT — Kaplan & Sadock, Beauchamp & Childress, multispecialty integration.',
      confirmMessage: 'Ready to start USMLE Step 2 CK Mock #5? Multispecialty and behavioral health vignettes load across 8 blocks.',
    },
    'step3-mock1': {
      id: 'step3-mock1',
      step: 3,
      tab: 'step3',
      title: 'USMLE Step 3 Mock #1',
      badge: 'STEP 3',
      step3Exam: true,
      twoDayExam: true,
      questions: 438,
      totalHours: 13,
      format: '2 Days · D1: 240 MCQ · D2: 198 MCQ',
      freeDemo: true,
      pool: 'step3-dedicated-mock1',
      focus: 'Balanced FIP + ACP MCQs — First Aid Step 3, Master the Boards, UWorld-style vignettes (CCS not included).',
      confirmMessage: 'Start Step 3 Mock #1? Day 1 (FIP) is ~7 hours; Day 2 (198 MCQ only) unlocks after Day 1 is complete.',
    },
    'step3-mock2': {
      id: 'step3-mock2',
      step: 3,
      tab: 'step3',
      title: 'USMLE Step 3 Mock #2',
      badge: 'STEP 3',
      step3Exam: true,
      twoDayExam: true,
      questions: 438,
      totalHours: 13,
      format: '2 Days · D1: 240 MCQ · D2: 198 MCQ',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step3-dedicated-mock2',
      focus: 'OB/GYN, neonatology, pediatrics — Williams, Nelson, NRP, PALS, Case Files.',
      confirmMessage: 'Ready for Step 3 Mock #2? Complete Day 1 before starting Day 2.',
    },
    'step3-mock3': {
      id: 'step3-mock3',
      step: 3,
      tab: 'step3',
      title: 'USMLE Step 3 Mock #3',
      badge: 'STEP 3',
      step3Exam: true,
      twoDayExam: true,
      questions: 438,
      totalHours: 13,
      format: '2 Days · D1: 240 MCQ · D2: 198 MCQ',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step3-dedicated-mock3',
      focus: 'Emergency medicine & surgery — Tintinalli, Rosen, ATLS, ACLS, Schwartz, trauma algorithms.',
      confirmMessage: 'Ready for Step 3 Mock #3? Emergency and surgical management emphasis.',
    },
    'step3-mock4': {
      id: 'step3-mock4',
      step: 3,
      tab: 'step3',
      title: 'USMLE Step 3 Mock #4',
      badge: 'STEP 3',
      step3Exam: true,
      twoDayExam: true,
      questions: 438,
      totalHours: 13,
      format: '2 Days · D1: 240 MCQ · D2: 198 MCQ',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step3-dedicated-mock4',
      focus: 'MSK, ophtho, ENT, dermatology — Campbell, Kanski, Cummings, Fitzpatrick, subspecialty pearls.',
      confirmMessage: 'Ready for Step 3 Mock #4? Subspecialty-heavy Day 2 MCQ.',
    },
    'step3-mock5': {
      id: 'step3-mock5',
      step: 3,
      tab: 'step3',
      title: 'USMLE Step 3 Mock #5',
      badge: 'STEP 3',
      step3Exam: true,
      twoDayExam: true,
      questions: 438,
      totalHours: 13,
      format: '2 Days · D1: 240 MCQ · D2: 198 MCQ',
      freeDemo: false,
      premiumOnly: true,
      pool: 'step3-dedicated-mock5',
      focus: 'Ethics, health systems, geriatrics, palliative care — Beauchamp, Jonsen, Hazzard, AGS Beers, biostatistics.',
      confirmMessage: 'Ready for Step 3 Mock #5? Ethics, prevention, and geriatrics integration.',
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

  /** Dedicated Supabase topic slugs (hidden from USMLE topic browser). */
  step2DedicatedPoolSlugs: {
    'step2-dedicated-mock1': 'usmle-2-mock-pool-mock1',
    'step2-dedicated-mock2': 'usmle-2-mock-pool-mock2',
    'step2-dedicated-mock3': 'usmle-2-mock-pool-mock3',
    'step2-dedicated-mock4': 'usmle-2-mock-pool-mock4',
    'step2-dedicated-mock5': 'usmle-2-mock-pool-mock5',
  },

  getDedicatedPoolSlug(examId) {
    const pool = this.getExam(examId).pool;
    return this.step2DedicatedPoolSlugs[pool] || null;
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

  /** Canonical Step 2 CK textbook & board-prep sources (exam metadata). */
  step2TextbookSources: [
    'UWorld Step 2 CK Qbank',
    'AMBOSS Step 2 CK Qbank',
    'Master the Boards USMLE Step 2 CK (Conrad Fischer)',
    'Step-Up to Medicine (Steven Agabegi)',
    'First Aid for the USMLE Step 2 CK (Tao Le & Vikas Bhushan)',
    'OnlineMedEd (video + notes)',
    "Harrison's Principles of Internal Medicine",
    'Washington Manual of Medical Therapeutics',
    'Current Medical Diagnosis & Treatment (CMDT)',
    'Clinical Medicine (Kumar & Clark)',
    "Braunwald's Heart Disease",
    "Murray & Nadel's Respiratory Medicine",
    "Sleisenger and Fordtran's GI and Liver Disease",
    "Brenner & Rector's The Kidney",
    "Williams Textbook of Endocrinology",
    "Mandell, Douglas, and Bennett's Infectious Diseases",
    "Schwartz's Principles of Surgery",
    "Tintinalli's Emergency Medicine",
    "Williams Obstetrics / Williams Gynecology",
    'Nelson Textbook of Pediatrics',
    "Kaplan & Sadock's Synopsis of Psychiatry",
    "Bates' Guide to Physical Examination",
    'Case Files Series (Toy et al.)',
    'Symptom to Diagnosis (Stern et al.)',
  ],

  getStep1Exams() {
    return this.getExamsForTab('step1');
  },

  getStateKey(examId) {
    const exam = this.getExam(examId);
    if (exam.step3Exam) {
      return window.MockExamStep3Config
        ? window.MockExamStep3Config.getStateKey(examId)
        : `mh_sim3_state_${examId}`;
    }
    return `mh_sim_state_${examId}`;
  },

  getCompletionKey(examId) {
    return `mh_mock_completed_${examId}`;
  },

  isMockCompleted(examId) {
    try {
      const raw = localStorage.getItem(this.getCompletionKey(examId));
      if (!raw) return false;
      const data = JSON.parse(raw);
      return data && data.completed === true;
    } catch {
      return false;
    }
  },

  markMockCompleted(examId, summary) {
    localStorage.setItem(
      this.getCompletionKey(examId),
      JSON.stringify({
        completed: true,
        completedAt: Date.now(),
        ...summary,
      })
    );
  },

  getSimulatorPath(examId) {
    const exam = this.getExam(examId);
    if (exam.step3Exam) return 'medical-exam-simulator-step3.html';
    return 'medical-exam-simulator.html';
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

  getStep2Percentile(threeDigitScore) {
    if (threeDigitScore >= 270) return 99;
    if (threeDigitScore >= 265) return 97;
    if (threeDigitScore >= 260) return 93;
    if (threeDigitScore >= 255) return 88;
    if (threeDigitScore >= 250) return 80;
    if (threeDigitScore >= 245) return 72;
    if (threeDigitScore >= 240) return 62;
    if (threeDigitScore >= 235) return 52;
    if (threeDigitScore >= 230) return 42;
    if (threeDigitScore >= 225) return 32;
    if (threeDigitScore >= 220) return 24;
    if (threeDigitScore >= 214) return 15;
    if (threeDigitScore >= 205) return 8;
    if (threeDigitScore >= 195) return 4;
    return 1;
  },

  getStep2Readiness(scorePct) {
    let projectedMin, projectedMax, status, statusColor, performanceLevel;
    if (scorePct >= 85) {
      projectedMin = 258; projectedMax = 272;
      status = 'Excellent (Target 260+)';
      statusColor = '#10b981';
      performanceLevel = 'Outstanding score — competitive for highly selective specialties. Maintain pace.';
    } else if (scorePct >= 75) {
      projectedMin = 244; projectedMax = 257;
      status = 'Very Good (Target 245-255)';
      statusColor = '#34d399';
      performanceLevel = 'Strong foundation — focus on clinical reasoning nuances and medical ethics/safety.';
    } else if (scorePct >= 65) {
      projectedMin = 228; projectedMax = 243;
      status = 'Good (Target 230-240)';
      statusColor = '#fbbf24';
      performanceLevel = 'Solid performance — close gaps in preventive medicine and high-yield algorithms.';
    } else if (scorePct >= 55) {
      projectedMin = 214; projectedMax = 227;
      status = 'Passing / Borderline';
      statusColor = '#f59e0b';
      performanceLevel = 'Passing but near threshold — target weak clerkships (OB/GYN, Pediatrics, Surgery).';
    } else if (scorePct >= 45) {
      projectedMin = 195; projectedMax = 213;
      status = 'At Risk';
      statusColor = '#f97316';
      performanceLevel = 'Below passing score — build structured knowledge base and practice timing.';
    } else {
      projectedMin = 160; projectedMax = 194;
      status = 'Not Ready';
      statusColor = '#ef4444';
      performanceLevel = 'Significant knowledge gaps — review core clerkship materials before next full-length.';
    }
    const projectedMid = Math.round((projectedMin + projectedMax) / 2);
    const percentile = this.getStep2Percentile(projectedMid);
    const statusEmoji = scorePct >= 75 ? '🟢' : scorePct >= 65 ? '🟡' : scorePct >= 55 ? '🟠' : '🔴';
    return {
      passMin: projectedMin,
      passMax: projectedMax,
      passMid: projectedMid,
      passRange: `${projectedMin}–${projectedMax}`,
      percentile,
      status,
      statusEmoji,
      statusColor,
      performanceLevel,
    };
  },
};
