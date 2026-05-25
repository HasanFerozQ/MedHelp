/**
 * USMLE Step 3 — isolated exam engine (2-day FIP + ACP). Do not merge into Step 1/2 logic.
 */
window.MockExamStep3Config = {
  DAY1: {
    label: 'Day 1 — Foundations of Independent Practice (FIP)',
    blocks: 6,
    questionsPerBlock: 40,
    totalQuestions: 240,
    totalHours: 7,
    blockMinutes: 60,
  },
  DAY2_MCQ: {
    label: 'Day 2 — Advanced Clinical Medicine (MCQ)',
    blocks: 6,
    questionsPerBlock: 33,
    totalQuestions: 198,
    blockMinutes: 60,
  },
  DAY2_CCS: {
    label: 'Day 2 — Computer-Based Case Simulations',
    caseCount: 13,
    defaultMinutes: 15,
  },
  DAY2_TOTAL_HOURS: 9,

  poolSlugs(mockNum, day) {
    const n = mockNum;
    if (day === 1) return `usmle-3-mock-pool-mock${n}-day1-fip`;
    if (day === 2) return `usmle-3-mock-pool-mock${n}-day2-acp`;
    return null;
  },

  getStateKey(examId) {
    return `mh_sim3_state_${examId}`;
  },

  getDay1ResultKey(examId) {
    return `mh_sim3_day1_result_${examId}`;
  },

  /** CCS case templates — 20 core cases; each mock uses 13 via offset. */
  ccsCaseLibrary: [
    {
      title: 'Unstable Chest Pain — ACS Pathway',
      vignette: 'A 58-year-old man presents to the ED with 2 hours of substernal chest pressure, diaphoresis, and nausea. BP 92/58, HR 110. ECG shows ST depressions in V4–V6. Troponin pending.',
      essential: ['ecg', 'troponin', 'iv_access', 'aspirin', 'heparin', 'monitor', 'cardiology_consult'],
      harmful: ['discharge_home', 'stress_test_today'],
      exp: 'Unstable angina/NSTEMI requires monitoring, antiplatelet/anticoagulation, cardiology involvement, and serial troponins — not discharge or outpatient stress testing.',
    },
    {
      title: 'Community-Acquired Pneumonia — Inpatient',
      vignette: 'A 72-year-old woman with COPD has fever, productive cough, and SpO2 88% on room air. RR 28, BP 118/70. CXR: right lower lobe infiltrate.',
      essential: ['o2', 'cbc', 'bmp', 'blood_culture', 'abx_iv', 'sputum_culture'],
      harmful: ['discharge_home'],
      exp: 'Hypoxemic CAP in elderly COPD patient needs admission, oxygen, cultures, and empiric IV antibiotics per severity index.',
    },
    {
      title: 'Acute Asthma Exacerbation',
      vignette: 'A 24-year-old with asthma presents with wheezing and RR 32 after running out of inhalers. Peak flow 40% personal best. Speaking in phrases.',
      essential: ['o2', 'nebulized_saba', 'systemic_steroid', 'monitor'],
      harmful: ['sedation_benzos', 'discharge_without_steroid'],
      exp: 'Moderate–severe asthma exacerbation: SABA, systemic steroids, oxygen if needed; avoid sedatives that suppress respiratory drive.',
    },
    {
      title: 'DKA — Adult Type 1',
      vignette: 'A 19-year-old with T1DM: glucose 520, pH 7.18, ketones positive, K+ 5.4, altered but arousable.',
      essential: ['iv_fluids', 'insulin_drip', 'potassium_monitor', 'bmp', 'anion_gap'],
      harmful: ['bicarb_routine', 'oral_hypoglycemic_only'],
      exp: 'DKA: volume resuscitation, insulin infusion with K+ monitoring; bicarbonate only for severe acidemia.',
    },
    {
      title: 'Upper GI Bleed — Varices Suspected',
      vignette: 'A 52-year-old with cirrhosis presents with hematemesis. HR 124, BP 86/50, Hgb 7.2, INR 2.0.',
      essential: ['iv_access', 'type_cross', 'ppi_iv', 'octreotide', 'antibiotics_sbp', 'gi_consult', 'egd_plan'],
      harmful: ['nsaids', 'discharge_home'],
      exp: 'Suspected variceal bleed: resuscitate, vasoactive therapy, antibiotic prophylaxis, urgent GI/endoscopy — avoid NSAIDs.',
    },
    {
      title: 'Acute Appendicitis',
      vignette: 'A 16-year-old male with RLQ pain, fever, WBC 15k, CT consistent with appendicitis, tolerating PO.',
      essential: ['iv_fluids', 'abx_preop', 'surgical_consult', 'npo', 'pain_control'],
      harmful: ['discharge_home', 'oral_antibiotics_only_outpatient'],
      exp: 'Uncomplicated appendicitis needs surgical evaluation, NPO, IV fluids, preoperative antibiotics.',
    },
    {
      title: 'Sepsis — Urinary Source',
      vignette: 'A 78-year-old with indwelling catheter, fever 39.5°C, HR 118, BP 88/50, lactate 4.2, altered mental status.',
      essential: ['iv_fluids', 'blood_culture', 'broad_abx', 'lactate_repeat', 'remove_catheter', 'monitor'],
      harmful: ['oral_abx_only', 'no_fluids'],
      exp: 'Septic shock: aggressive fluids, cultures, broad-spectrum antibiotics, source control (catheter removal).',
    },
    {
      title: 'Preeclampsia with Severe Features',
      vignette: 'G1P0 at 34 weeks: BP 172/108, headache, 3+ proteinuria, platelets 95k, AST elevated.',
      essential: ['magnesium', 'bp_control', 'labs_monitor', 'ob_consult', 'delivery_plan'],
      harmful: ['discharge_home', 'phenytoin_seizure_prophylaxis'],
      exp: 'Severe preeclampsia: magnesium for seizure prophylaxis, BP control, labs, delivery planning.',
    },
    {
      title: 'Neonatal Jaundice — Day 3',
      vignette: 'Term newborn day 3 of life, breastfeeding, total bilirubin 16 mg/dL at 72 hours, well appearing.',
      essential: ['bilirubin_check', 'feeding_support', 'phototherapy_eval', 'followup_plan'],
      harmful: ['discharge_no_followup'],
      exp: 'Hyperbilirubinemia in newborn needs level monitoring, feeding optimization, phototherapy per nomogram, close follow-up.',
    },
    {
      title: 'Pediatric Dehydration — Gastroenteritis',
      vignette: '18-month-old with 2 days vomiting/diarrhea, sunken eyes, delayed cap refill, still alert, tolerating sips.',
      essential: ['iv_fluids_or_oral_rehydration', 'electrolytes', 'weight', 'zofran_not_routine_under2'],
      harmful: ['plain_water_only', 'discharge_without_education'],
      exp: 'Moderate dehydration: appropriate rehydration (oral or IV), electrolytes, caregiver education.',
    },
    {
      title: 'Hip Fracture — Elderly Fall',
      vignette: 'An 84-year-old woman fell, cannot bear weight, shortened externally rotated leg, X-ray: intertrochanteric fracture.',
      essential: ['pain_control', 'surgical_consult', 'dvt_prophylaxis_plan', 'medical_clearance'],
      harmful: ['weight_bearing_ambulation'],
      exp: 'Unstable hip fracture needs orthopedic consultation, pain control, DVT prophylaxis, surgical planning.',
    },
    {
      title: 'Acute Angle-Closure Glaucoma',
      vignette: 'A 66-year-old with sudden painful red eye, halos around lights, mid-dilated pupil, IOP 55 mmHg.',
      essential: ['iop_lowering', 'ophtho_urgent', 'acetazolamide', 'topical_beta_blocker', 'pil_carpine'],
      harmful: ['discharge_without_treatment'],
      exp: 'Acute angle-closure: emergent IOP reduction, ophthalmology, medical therapy — not observation alone.',
    },
    {
      title: 'Epidural Abscess Suspicion',
      vignette: 'IVDU patient with back pain, fever, leg weakness, elevated ESR, MRI pending.',
      essential: ['mri_spine', 'blood_culture', 'iv_antibiotics', 'neurosurg_consult', 'monitor_neuro'],
      harmful: ['oral_pain_only', 'delay_mri'],
      exp: 'Spinal epidural abscess is emergency: MRI, antibiotics, neurosurgical evaluation.',
    },
    {
      title: 'Cellulitis with Diabetes',
      vignette: 'Diabetic foot with spreading erythema, fever, no ulcer probe-to-bone, WBC 14k.',
      essential: ['wound_culture', 'abx', 'glycemic_control', 'elevation', 'outpatient_followup_or_admit'],
      harmful: ['steroid_topical_only'],
      exp: 'Moderate cellulitis in diabetic: antibiotics, glycemic management, assess for deeper infection.',
    },
    {
      title: 'Major Depression — Suicidal Ideation',
      vignette: 'A 35-year-old with passive suicidal ideation, plan denied, supports at home, no substances.',
      essential: ['safety_assessment', 'psychiatry_consult', 'suicide_precautions_if_admit'],
      harmful: ['discharge_without_assessment'],
      exp: 'Suicidal ideation requires formal risk assessment and psychiatry involvement before disposition.',
    },
    {
      title: 'Elder Abuse Concern',
      vignette: 'An 80-year-old with repeated ER visits, unexplained bruises, caregiver refuses to leave room.',
      essential: ['separate_interview', 'social_work', 'document', 'safety_plan', 'mandated_report_if_required'],
      harmful: ['discharge_with_caregiver_only'],
      exp: 'Suspected elder abuse: interview separately, involve social work, document, report per state law.',
    },
    {
      title: 'Toxic Ingestion — Acetaminophen',
      vignette: 'A 22-year-old took 30g acetaminophen 6 hours ago, nausea, AST pending, NAC not yet given.',
      essential: ['acetaminophen_level', 'nac_protocol', 'bmp_lfts', 'toxicology_consult'],
      harmful: ['charcoal_only_late', 'discharge_home'],
      exp: 'Significant APAP overdose needs level, N-acetylcysteine per nomogram, monitoring.',
    },
    {
      title: 'Atrial Fibrillation — Rapid Ventricular Response',
      vignette: 'A 70-year-old with new AFib, HR 150, BP 130/80, no chest pain, on anticoagulation discussion needed.',
      essential: ['rate_control', 'ecg', 'bmp', 'tsh', 'anticoagulation_assessment'],
      harmful: ['immediate_cardioversion_without_eval'],
      exp: 'Stable rapid AF: rate control, evaluate precipitants, stroke risk assessment for anticoagulation.',
    },
    {
      title: 'Health Maintenance — 50-Year-Old',
      vignette: 'Asymptomatic 50-year-old established patient, due for preventive care, no chronic diseases.',
      essential: ['colon_screening', 'lipid_panel', 'bp_check', 'diabetes_screen', 'immunizations_update'],
      harmful: ['no_preventive_counseling'],
      exp: 'Age-appropriate screening: colorectal cancer, lipids, BP, diabetes screening, vaccines per ACIP.',
    },
    {
      title: 'End-of-Life Goals of Care',
      vignette: 'Metastatic pancreatic cancer, poor performance status, family asks about hospice.',
      essential: ['goals_of_care_discussion', 'palliative_consult', 'symptom_management', 'advance_directive_review'],
      harmful: ['aggressive_chemo_start'],
      exp: 'Advanced cancer with poor PS: goals-of-care, palliative focus, symptom control — not default aggressive therapy.',
    },
  ],

  ccsOrderCatalog: {
    ecg: 'ECG (12-lead)',
    troponin: 'Serial troponins',
    iv_access: 'IV access / fluids',
    aspirin: 'Aspirin',
    heparin: 'Anticoagulation (heparin/LMWH)',
    monitor: 'Cardiac monitoring',
    cardiology_consult: 'Cardiology consultation',
    discharge_home: 'Discharge home now',
    stress_test_today: 'Outpatient stress test today',
    o2: 'Supplemental oxygen',
    cbc: 'CBC',
    bmp: 'BMP / metabolic panel',
    blood_culture: 'Blood cultures',
    abx_iv: 'IV antibiotics (empiric)',
    sputum_culture: 'Sputum culture',
    nebulized_saba: 'Nebulized SABA',
    systemic_steroid: 'Systemic corticosteroids',
    sedation_benzos: 'Benzodiazepine sedation',
    discharge_without_steroid: 'Discharge without steroids',
    iv_fluids: 'IV fluid resuscitation',
    insulin_drip: 'IV insulin infusion',
    potassium_monitor: 'Potassium monitoring/repletion',
    anion_gap: 'Serial anion gap / glucose',
    bicarb_routine: 'Routine sodium bicarbonate',
    oral_hypoglycemic_only: 'Oral agents only (no insulin)',
    type_cross: 'Type & screen / crossmatch',
    ppi_iv: 'IV proton pump inhibitor',
    octreotide: 'Octreotide / vasopressin analog',
    antibiotics_sbp: 'Antibiotics (SBP prophylaxis)',
    gi_consult: 'GI consultation',
    egd_plan: 'Urgent EGD planning',
    nsaids: 'NSAIDs',
    abx_preop: 'Preoperative antibiotics',
    surgical_consult: 'Surgical consultation',
    npo: 'NPO',
    pain_control: 'Analgesia',
    oral_antibiotics_only_outpatient: 'Oral antibiotics only (outpatient)',
    broad_abx: 'Broad-spectrum IV antibiotics',
    lactate_repeat: 'Repeat lactate',
    remove_catheter: 'Remove urinary catheter (source control)',
    oral_abx_only: 'Oral antibiotics only',
    no_fluids: 'Withhold IV fluids',
    magnesium: 'IV magnesium sulfate',
    bp_control: 'Blood pressure control (IV antihypertensive)',
    labs_monitor: 'Serial labs (platelets, LFTs)',
    ob_consult: 'OB/GYN consultation',
    delivery_plan: 'Delivery planning / steroids if preterm',
    phenytoin_seizure_prophylaxis: 'Phenytoin for seizure prophylaxis',
    bilirubin_check: 'Bilirubin monitoring',
    feeding_support: 'Lactation / feeding support',
    phototherapy_eval: 'Phototherapy per nomogram',
    followup_plan: '48–72 h follow-up arranged',
    discharge_no_followup: 'Discharge without follow-up',
    iv_fluids_or_oral_rehydration: 'Rehydration (IV or ORT)',
    electrolytes: 'Electrolytes',
    weight: 'Weight / intake–output',
    zofran_not_routine_under2: 'Routine antiemetic in infant (avoid)',
    plain_water_only: 'Plain water only (no electrolytes)',
    discharge_without_education: 'Discharge without caregiver education',
    dvt_prophylaxis_plan: 'DVT prophylaxis',
    medical_clearance: 'Medical pre-op clearance',
    weight_bearing_ambulation: 'Full weight bearing now',
    iop_lowering: 'IOP-lowering therapy',
    ophtho_urgent: 'Urgent ophthalmology',
    acetazolamide: 'Acetazolamide',
    topical_beta_blocker: 'Topical beta-blocker',
    pil_carpine: 'Pilocarpine',
    discharge_without_treatment: 'Discharge without treatment',
    mri_spine: 'MRI spine',
    neurosurg_consult: 'Neurosurgery consultation',
    monitor_neuro: 'Serial neurologic exams',
    oral_pain_only: 'Analgesics only',
    delay_mri: 'Defer MRI 1 week',
    wound_culture: 'Wound culture',
    abx: 'Antibiotics',
    glycemic_control: 'Glycemic management',
    elevation: 'Extremity elevation',
    outpatient_followup_or_admit: 'Follow-up 24–48 h or admission',
    steroid_topical_only: 'Topical steroids only',
    safety_assessment: 'Suicide risk assessment',
    psychiatry_consult: 'Psychiatry consultation',
    suicide_precautions_if_admit: 'Suicide precautions if admitted',
    discharge_without_assessment: 'Discharge without risk assessment',
    separate_interview: 'Interview patient alone',
    social_work: 'Social work / case management',
    document: 'Document concern in chart',
    safety_plan: 'Safety plan if unsafe home',
    mandated_report_if_required: 'Mandatory reporting if indicated',
    discharge_with_caregiver_only: 'Discharge with caregiver only (no assessment)',
    acetaminophen_level: 'Acetaminophen level',
    nac_protocol: 'N-acetylcysteine protocol',
    lfts: 'LFTs / INR',
    toxicology_consult: 'Toxicology consultation',
    charcoal_only_late: 'Activated charcoal only (late presentation)',
    rate_control: 'Rate control (beta-blocker or CCB)',
    tsh: 'TSH',
    anticoagulation_assessment: 'CHADS-VASc / anticoagulation discussion',
    immediate_cardioversion_without_eval: 'Immediate cardioversion (no evaluation)',
    colon_screening: 'Colorectal cancer screening',
    lipid_panel: 'Lipid panel',
    bp_check: 'Blood pressure check',
    diabetes_screen: 'Diabetes screening',
    immunizations_update: 'Immunization update',
    no_preventive_counseling: 'Defer all preventive care',
    goals_of_care_discussion: 'Goals-of-care discussion',
    palliative_consult: 'Palliative care consultation',
    symptom_management: 'Symptom management (pain, nausea)',
    advance_directive_review: 'Advance directive review',
    aggressive_chemo_start: 'Start new chemotherapy today',
  },

  getCcsCasesForMock(mockNum) {
    const lib = this.ccsCaseLibrary;
    const start = ((mockNum - 1) * 3) % lib.length;
    const cases = [];
    for (let i = 0; i < this.DAY2_CCS.caseCount; i++) {
      const src = lib[(start + i) % lib.length];
      cases.push({
        ...src,
        id: `mock${mockNum}-ccs-${i + 1}`,
        timeMinutes: this.DAY2_CCS.defaultMinutes,
      });
    }
    return cases;
  },

  scoreCcsCase(caseDef, selectedIds) {
    const set = new Set(selectedIds);
    let score = 0;
    let max = caseDef.essential.length;
    caseDef.essential.forEach((id) => {
      if (set.has(id)) score += 1;
    });
    caseDef.harmful.forEach((id) => {
      if (set.has(id)) score -= 1;
    });
    const pct = Math.max(0, Math.round((score / max) * 100));
    return { score, max, pct };
  },

  getStep3Readiness(combinedPct) {
    let projectedMin, projectedMax, status, statusColor, performanceLevel;
    if (combinedPct >= 80) {
      projectedMin = 228; projectedMax = 245;
      status = 'Excellent';
      statusColor = '#10b981';
      performanceLevel = 'Strong Step 3 performance — refine CCS timing and preventive medicine.';
    } else if (combinedPct >= 70) {
      projectedMin = 215; projectedMax = 227;
      status = 'Above Average';
      statusColor = '#34d399';
      performanceLevel = 'Solid — focus CCS essential orders and biostatistics/ethics.';
    } else if (combinedPct >= 60) {
      projectedMin = 205; projectedMax = 214;
      status = 'Passing Range';
      statusColor = '#fbbf24';
      performanceLevel = 'Near passing (~198) — increase UWorld Step 3 and CCS practice.';
    } else if (combinedPct >= 50) {
      projectedMin = 198; projectedMax = 204;
      status = 'Borderline';
      statusColor = '#f59e0b';
      performanceLevel = 'Borderline pass — prioritize Day 2 management and CCS cases.';
    } else {
      projectedMin = 175; projectedMax = 197;
      status = 'Below Passing';
      statusColor = '#ef4444';
      performanceLevel = 'Below target — review First Aid Step 3 and Master the Boards.';
    }
    const projectedMid = Math.round((projectedMin + projectedMax) / 2);
    return {
      passMin: projectedMin,
      passMax: projectedMax,
      passMid: projectedMid,
      passRange: `${projectedMin}–${projectedMax}`,
      status,
      statusColor,
      performanceLevel,
    };
  },
};
