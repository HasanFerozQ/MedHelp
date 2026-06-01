/**
 * MediHelp Medical Calculator — UI Controller
 */
window.CalcUI = {
  state: { view: 'home', role: null, calcId: null, emergency: false },
  _erPatient: null,
  STORAGE: { favs: 'mh_calc_favs', recents: 'mh_calc_recents', searches: 'mh_calc_searches', values: 'mh_calc_last_vals', erPatient: 'mh_calc_er_patient' },

  init() {
    CalcI18n.init();
    this._bindEvents();
    this._registerSW();
    this._erPatient = this._erPatientFromStorage();
    this._checkAccess().then(() => {
      this._parseRoute();
      this.render();
    });
  },

  async _checkAccess() {
    const user = (await window.dbClient?.auth.getUser())?.data?.user;
    this._user = user;
    this._premium = await MediHelp.isPremium();
    return true;
  },

  canAccess(calc) {
    if (calc?.freeDemo) return 'ok';
    if (!this._user) return 'auth';
    if (this._premium) return 'ok';
    return 'premium';
  },

  _parseRoute() {
    const root = document.getElementById('calc-app');
    const defaultCalc = root ? root.dataset.calcId : null;
    const defaultRole = root ? root.dataset.roleId : null;

    const p = new URLSearchParams(location.search);
    const calc = p.get('calc') || defaultCalc;
    const role = p.get('role') || defaultRole;

    if (calc && CalcRegistry.getById(calc)) {
      this.state.view = 'calc';
      this.state.calcId = calc;
      const calcObj = CalcRegistry.getById(calc);
      if (calcObj) {
        this.state.role = calcObj.role;
      }
    } else if (role) {
      this.state.view = 'role';
      this.state.role = role;
    }
    this.state.emergency = p.get('emergency') === '1' || ['er', 'icu'].includes(this.state.role);
  },

  _bindEvents() {
    window.addEventListener('popstate', () => { this._parseRoute(); this.render(); });
  },

  _registerSW() {
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker.register('/sw-calculator.js').catch(() => {});
    }
  },

  goHome() {
    this.state = { view: 'home', role: null, calcId: null, emergency: this.state.emergency };
    history.pushState({}, '', '/medical-calculator');
    this.render();
  },

  goRole(roleId) {
    this.state = { view: 'role', role: roleId, calcId: null, emergency: ['er', 'icu'].includes(roleId) };
    const path = location.pathname.startsWith('/calculators/') ? location.pathname : '/medical-calculator';
    history.pushState({}, '', path + '?role=' + roleId);
    this.render();
  },

  _schemaFor(id) {
    if (CalcSchemas[id]) return CalcSchemas[id];
    const canon = CalcCompute._aliases?.[id];
    if (canon && CalcSchemas[canon]) return CalcSchemas[canon];
    return null;
  },

  openCalc(id) {
    const calc = CalcRegistry.getById(id);
    if (!calc) return;
    const access = this.canAccess(calc);
    if (access === 'auth') { MediHelp.showAuthModal(); return; }
    if (access === 'premium' && !calc.implemented) {
      alert(CalcI18n.t('comingSoon') + ' — ' + this._name(calc));
      return;
    }
    if (access === 'premium') { this._showPremium(); return; }
    if (!calc.implemented) {
      alert(CalcI18n.t('comingSoon') + ' — ' + this._name(calc));
      return;
    }
    this._addRecent(id);

    // Dynamic SEO landing page redirections for top-4 calculators
    if (id === 'bmi') { window.location.href = '/calculators/bmi-calculator'; return; }
    if (id === 'creatinine-clearance') { window.location.href = '/calculators/creatinine-clearance-calculator'; return; }
    if (id === 'bsa') { window.location.href = '/calculators/bsa-calculator'; return; }
    if (id === 'bicarbonate-deficit') { window.location.href = '/calculators/bicarbonate-deficit-calculator'; return; }

    this.state = { view: 'calc', role: calc.role, calcId: id, emergency: this.state.emergency || ['er', 'icu'].includes(calc.role) };
    const path = location.pathname.startsWith('/calculators/') ? location.pathname : '/medical-calculator';
    history.pushState({}, '', path + '?calc=' + id);
    this.render();
  },

  _showPremium() {
    document.getElementById('calc-premium-modal')?.classList.add('visible');
  },

  _addRecent(id) {
    let r = JSON.parse(localStorage.getItem(this.STORAGE.recents) || '[]');
    r = [id, ...r.filter(x => x !== id)].slice(0, 4);
    localStorage.setItem(this.STORAGE.recents, JSON.stringify(r));
  },

  _onSearch(q) {
    const box = document.getElementById('search-results');
    if (!box) return;
    if (!q.trim()) { box.innerHTML = ''; box.classList.remove('visible'); return; }
    const results = CalcRegistry.search(q).slice(0, 8);
    box.innerHTML = results.map(c => `
      <button class="search-item" data-id="${c.id}">
        <strong>${this._name(c)}</strong>
        <span>${c.implemented ? '' : CalcI18n.t('comingSoon')}</span>
      </button>`).join('');
    box.classList.add('visible');
    box.querySelectorAll('.search-item').forEach(btn => {
      btn.onclick = () => { this.openCalc(btn.dataset.id); box.classList.remove('visible'); document.getElementById('calc-search').value = ''; };
    });
    let s = JSON.parse(localStorage.getItem(this.STORAGE.searches) || '[]');
    if (q.length > 2) { s = [q, ...s.filter(x => x !== q)].slice(0, 5); localStorage.setItem(this.STORAGE.searches, JSON.stringify(s)); }
  },

  _name(c) { return c.name[CalcI18n.lang] || c.name.en; },
  _desc(c) { return c.desc[CalcI18n.lang] || c.desc.en; },

  getClinicalInfo(id, calc, schema) {
    const name = this._name(calc);
    const formulaStr = schema.formula || 'Custom Algorithmic Calculation';

    // Tailored database of calculators
    const DB = {
      'gcs': {
        why: 'The Glasgow Coma Scale (GCS) is used to objectively describe the level of consciousness in a patient following acute brain injury. It helps identify severity of impairment, guides triage decisions (e.g., airway protection), and tracks neurological trends.',
        formula: 'GCS = Eye (1-4) + Verbal (1-5) + Motor (1-6)',
        formulaExplanation: 'The sum score ranges from 3 (deep coma or brain death) to 15 (fully awake and oriented). Individual sub-scores should always be reported (e.g., E3V4M6 = GCS 13) to track specific deficits.',
        steps: [
          'Assess Eye Opening: Observe if the patient opens eyes spontaneously, to voice, to painful stimulation, or not at all.',
          'Assess Verbal Response: Ask the patient simple orientation questions (name, location, month) to determine if they are oriented, confused, using inappropriate words, making incomprehensible sounds, or completely silent.',
          'Assess Motor Response: Ask the patient to obey commands. If unable, apply localized stimulus to test for purposeful localization, withdrawal, decorticate/flexion posturing, decerebrate/extension posturing, or no movement.',
          'Add the three values together to calculate the final GCS score.'
        ],
        clinicalTips: 'A GCS score of 8 or less is the classic clinical threshold indicating the need for endotracheal intubation to protect the airway ("GCS less than 8, intubate").'
      },
      'egfr': {
        why: 'Estimated Glomerular Filtration Rate (eGFR) is the gold standard metric used to screen for, stage, and monitor Chronic Kidney Disease (CKD). It estimates the volume of blood filtered by the kidneys per minute, normalized to a standard body surface area.',
        formula: 'CKD-EPI 2021 Equation (Serum Creatinine)',
        formulaExplanation: 'The updated 2021 CKD-EPI equation calculates eGFR by scaling serum creatinine, age, and sex, notably omitting the race coefficient used in older MDRD or 2009 CKD-EPI formulas to enhance objectivity.',
        steps: [
          'Measure the patient\'s Serum Creatinine levels (mg/dL or µmol/L).',
          'Record the patient\'s age and biological sex.',
          'Apply the mathematical equation which utilizes specific constants based on sex and creatinine level thresholds to determine estimated clearance in mL/min/1.73m².'
        ],
        clinicalTips: 'An eGFR persistently below 60 mL/min/1.73m² for 3 months or longer satisfies the diagnostic criteria for Chronic Kidney Disease.'
      },
      'chads2-vasc': {
        why: 'The CHA₂DS₂-VASc score is a clinically validated tool used to estimate stroke risk in patients with non-valvular Atrial Fibrillation (AFib). It helps clinicians determine whether oral anticoagulation (like DOACs or Warfarin) is indicated.',
        formula: 'Sum of risk points (0 to 9)',
        formulaExplanation: 'Points are allocated as: Congestive Heart Failure (+1), Hypertension (+1), Age ≥75 (+2), Diabetes (+1), Stroke/TIA history (+2), Vascular disease (+1), Age 65-74 (+1), and Female sex (+1).',
        steps: [
          'Review the patient\'s medical history for congestive heart failure, hypertension, diabetes, previous stroke/TIA, and vascular disease.',
          'Identify the patient\'s age and gender.',
          'Assign 1 or 2 points for each positive risk factor and sum them up to calculate the score.'
        ],
        clinicalTips: 'Anticoagulation is strongly recommended for a score ≥ 2 in males or ≥ 3 in females. Consider anticoagulation for a score of 1 in males.'
      },
      'wells-pe': {
        why: 'The Wells Criteria for Pulmonary Embolism (PE) is a clinical decision rule used to estimate the pre-test probability of a PE, helping to guide diagnostic workups (e.g., D-dimer vs. CT Angiogram).',
        formula: 'Wells Score Sum (0 to 12.5)',
        formulaExplanation: 'Assigns points based on clinical features: DVT signs (+3), PE most likely (+3), Heart rate >100 (+1.5), Immobilization/surgery (+1.5), Previous PE/DVT (+1.5), Hemoptysis (+1), and Malignancy (+1).',
        steps: [
          'Evaluate the patient for active swelling and pain suggestive of a Deep Vein Thrombosis.',
          'Evaluate if an alternative diagnosis is less likely than a pulmonary embolism.',
          'Check vital signs for tachycardia, and review history for recent immobilization/surgery, hemoptysis, active cancer, or previous thrombosis.',
          'Sum the active points to determine low, moderate, or high risk stratification.'
        ],
        clinicalTips: 'In patients with a Wells Score ≤ 4 ("PE unlikely"), a highly sensitive D-dimer test can safely rule out PE without the need for radiation exposure from a CT scan.'
      },
      'curb65': {
        why: 'The CURB-65 score is a severity predictor for patients diagnosed with Community-Acquired Pneumonia (CAP). It helps clinicians decide whether the patient can be safely treated as an outpatient, requires admission to the ward, or requires intensive care.',
        formula: 'CURB-65 Score (0 to 5)',
        formulaExplanation: 'One point is given for each of: Confusion, BUN >19 mg/dL, Respiratory rate ≥30/min, Systolic BP <90 or Diastolic ≤60, and Age ≥65 years.',
        steps: [
          'Assess the patient\'s orientation for acute confusion.',
          'Obtain blood chemistry to check Urea or Blood Urea Nitrogen (BUN) levels.',
          'Count the respiratory rate and record the blood pressure.',
          'Sum the points: 0-1 points indicate outpatient management, 2 points warrant hospital admission, and ≥3 points indicate severe pneumonia requiring intensive care consideration.'
        ],
        clinicalTips: 'Always pair the CURB-65 score with clinical judgment; comorbidities, social support, and oxygen saturation are critical secondary indicators.'
      },
      'qsofa': {
        why: 'The Quick SOFA (qSOFA) score is a rapid screening tool used at the bedside outside the intensive care unit to identify patients with suspected infection who are at high risk of poor outcomes or clinical deterioration.',
        formula: 'qSOFA Score (0 to 3)',
        formulaExplanation: 'One point is awarded for each of: Respiratory rate ≥22 breaths/min, Altered mental status (GCS <15), and Systolic blood pressure ≤100 mmHg.',
        steps: [
          'Measure the patient\'s respiratory rate (breaths per minute).',
          'Evaluate the patient\'s consciousness (presence of new confusion or lethargy).',
          'Measure the systolic blood pressure.',
          'Count the active criteria: a score of ≥2 suggests high risk of sepsis and clinical deterioration, indicating a need for urgent investigation.'
        ],
        clinicalTips: 'qSOFA does not define sepsis, but is an excellent screening trigger for aggressive fluid resuscitation, blood culture collection, and broad-spectrum antibiotics.'
      },
      'sofa': {
        why: 'The Sequential Organ Failure Assessment (SOFA) score is a diagnostic staging tool used in critical care units to quantify and track the severity of organ dysfunction across six physiological systems, correlating strongly with intensive care mortality risk.',
        formula: 'SOFA Score Sum (0 to 24)',
        formulaExplanation: 'Grades dysfunction from 0 (normal) to 4 (severe failure) across 6 organ systems: Respiration (PaO₂/FiO₂), Coagulation (Platelets), Liver (Bilirubin), Cardiovascular (MAP/Vasopressors), CNS (GCS), and Renal (Creatinine/Urine output).',
        steps: [
          'Obtain arterial blood gas results for PaO₂ and determine current FiO₂.',
          'Obtain laboratory values for platelets, bilirubin, and creatinine.',
          'Evaluate blood pressure, vasopressor infusion rates, and GCS.',
          'Monitor hourly urine output.',
          'Grade each organ system from 0 to 4 based on clinical thresholds and sum the scores.'
        ],
        clinicalTips: 'An increase in the SOFA score of 2 points or more in a patient with suspected infection satisfies the formal Sepsis-3 definition of Sepsis.'
      },
      'map': {
        why: 'Mean Arterial Pressure (MAP) represents the average perfusion pressure flowing through the systemic vasculature during a single cardiac cycle. It is a critical vital sign for ensuring adequate organ perfusion.',
        formula: 'MAP = (Systolic BP + 2 × Diastolic BP) / 3',
        formulaExplanation: 'Diastole accounts for two-thirds of the cardiac cycle duration at normal heart rates, which is why diastolic pressure is weighted twice as heavily as systolic pressure.',
        steps: [
          'Obtain the patient\'s blood pressure reading.',
          'Multiply the Diastolic Blood Pressure by 2.',
          'Add the Systolic Blood Pressure to that result.',
          'Divide the final sum by 3 to calculate the MAP in mmHg.'
        ],
        clinicalTips: 'A MAP of at least 65 mmHg is widely regarded as the absolute minimum threshold required to maintain perfusion to vital organs (brain, kidneys, heart) in shock states.'
      },
      'shock-index': {
        why: 'The Shock Index is a simple, highly sensitive bedside screening tool used to detect early, occult, or compensated hypovolemic and hemorrhagic shock before standard hypotension manifests.',
        formula: 'Shock Index = Heart Rate / Systolic BP',
        formulaExplanation: 'Normally, systolic blood pressure is higher than heart rate, yielding a ratio of 0.5 to 0.7. An elevated ratio indicates occult systemic hypovolemia.',
        steps: [
          'Count the patient\'s heart rate (beats per minute).',
          'Measure the patient\'s systolic blood pressure (mmHg).',
          'Divide the heart rate by the systolic blood pressure to obtain the index.'
        ],
        clinicalTips: 'A Shock Index greater than 0.9 strongly suggests significant occult intravascular volume depletion, warning of impending cardiovascular collapse.'
      },
      'parkland': {
        why: 'The Parkland Formula is a validated guide used to calculate the volume of intravenous crystalloid fluids required to resuscitate a patient experiencing major, severe burns over the first 24 hours from the time of injury.',
        formula: 'Resuscitation Volume = 4 mL × Body Weight (kg) × %TBSA Burned',
        formulaExplanation: 'Calculates the volume of Lactated Ringer\'s solution needed. Total Body Surface Area (%TBSA) is estimated using the Rule of Nines for partial- and full-thickness burns.',
        steps: [
          'Determine the patient\'s body weight in kilograms.',
          'Estimate the percentage of total body surface area affected by partial- or full-thickness burns.',
          'Multiply: 4 × Weight × TBSA to find the total 24-hour volume in mL.',
          'Administer 50% of the calculated volume over the first 8 hours (starting from the *time of burn*), and the remaining 50% over the next 16 hours.'
        ],
        clinicalTips: 'Always titrate actual fluid delivery based on urine output (target 0.5 to 1.0 mL/kg/h in adults) rather than strictly adhering to the calculated value.'
      },
      'abg-analyzer': {
        why: 'Arterial Blood Gas (ABG) interpretation is vital in critical care to assess oxygenation, ventilation efficiency, and systemic acid-base balances, guiding ventilator adjustments and metabolic therapies.',
        formula: 'Henderson-Hasselbalch Equilibrium Integration',
        formulaExplanation: 'Evaluates arterial pH, partial pressure of carbon dioxide (PaCO₂) and bicarbonate (HCO₃⁻) to identify primary respiratory or metabolic acid-base disorders and compensation trends.',
        steps: [
          'Obtain arterial blood gas values for pH, PaCO₂, and HCO₃⁻.',
          'Evaluate pH: <7.35 indicates acidemia; >7.45 indicates alkalemia.',
          'Check PaCO₂ and HCO₃⁻ to determine if the primary disorder is respiratory (matching PaCO₂) or metabolic (matching HCO₃⁻).',
          'Assess for compensation: check if the non-primary variable has shifted in the direction that opposes the pH change.'
        ],
        clinicalTips: 'Always cross-reference the clinical context—history of chronic lung disease, severe vomiting, or diarrhea helps validate complex mixed disorders.'
      },
      'anion-gap': {
        why: 'The Serum Anion Gap calculates the concentration of unmeasured anions in the blood, helping clinicians differentiate the etiologies of metabolic acidosis.',
        formula: 'Anion Gap = Sodium − (Chloride + Bicarbonate)',
        formulaExplanation: 'Represents the difference between measured cations (sodium) and measured anions (chloride and bicarbonate). A normal gap is typically 8 to 12 mEq/L.',
        steps: [
          'Obtain the patient\'s basic metabolic panel (BMP) lab values.',
          'Add the Chloride and Bicarbonate levels together.',
          'Subtract that sum from the Sodium level to find the gap.'
        ],
        clinicalTips: 'An elevated anion gap (>12 mEq/L) indicates the presence of unmeasured organic acids, classically remembered by the mnemonic MUDPILES (Methanol, Uremia, DKA, Propylene glycol, INH/Iron, Lactic acidosis, Ethylene glycol, Salicylates).'
      },
      'corrected-calcium': {
        why: 'Corrected Calcium is calculated because approximately 40-50% of serum calcium is bound to albumin. Hypoalbuminemia falsely lowers measured total calcium levels despite ionized (physiologically active) calcium remaining normal.',
        formula: 'Corrected Ca (mg/dL) = Measured Ca + 0.8 × (4.0 − Serum Albumin)',
        formulaExplanation: 'For every 1 g/dL drop in serum albumin below the standard normal of 4.0 g/dL, total serum calcium drops by approximately 0.8 mg/dL.',
        steps: [
          'Obtain measured serum total calcium and serum albumin levels from blood tests.',
          'Subtract the albumin level from 4.0.',
          'Multiply that difference by 0.8.',
          'Add that result to the measured calcium level to find the corrected total calcium.'
        ],
        clinicalTips: 'Always calculate corrected calcium before diagnosing clinical hypocalcemia in malnourished, cirrhotic, or hospitalized patients with low albumin.'
      },
      'corrected-sodium': {
        why: 'Sodium Correction is necessary because hyperglycemia acts as an osmotic agent, drawing intracellular water into the vascular space and diluting measured serum sodium concentrations (pseudohyponatremia).',
        formula: 'Corrected Na = Measured Na + 1.6 × [ (Glucose − 100) / 100 ]',
        formulaExplanation: 'For every 100 mg/dL increase in serum glucose above 100 mg/dL, the measured sodium concentration is diluted by approximately 1.6 mEq/L (or 2.4 mEq/L if glucose exceeds 400 mg/dL).',
        steps: [
          'Obtain serum sodium and glucose levels from a basic metabolic panel.',
          'Subtract 100 from the glucose level.',
          'Divide that value by 100.',
          'Multiply by 1.6 (or 2.4 for extreme hyperglycemia) and add the result to the measured sodium.'
        ],
        clinicalTips: 'Failing to correct sodium in patients with DKA or severe hyperglycemia can lead to inappropriate saline resuscitation planning, risking cerebral edema.'
      },
      'qtc': {
        why: 'The Corrected QT (QTc) interval standardizes the QT measurement against heart rate variations. A prolonged QTc is a critical biomarker for high risk of severe ventricular arrhythmias, particularly Torsades de Pointes.',
        formula: 'QTc (Bazett) = QT / √ (RR interval in seconds)',
        formulaExplanation: 'The standard Bazett formula divides the measured QT interval by the square root of the RR interval (which is calculated as 60 divided by the Heart Rate).',
        steps: [
          'Measure the QT interval on an ECG (onset of Q wave to end of T wave).',
          'Record the heart rate in beats per minute.',
          'Apply the Bazett formula to calculate the rate-normalized interval in milliseconds.'
        ],
        clinicalTips: 'A QTc interval greater than 500 milliseconds is a critical warning threshold associated with a high risk of drug-induced arrhythmias.'
      },
      'maintenance-fluid': {
        why: 'Maintenance Fluid calculation plans the hourly fluid volume required to replace physiological water and electrolyte losses in a patient unable to tolerate oral intake, preventing dehydration without causing volume overload.',
        formula: 'Holliday-Segar (4-2-1 Rule)',
        formulaExplanation: 'Allocates hourly rates: 4 mL/kg/h for the first 10 kg of body weight, + 2 mL/kg/h for the next 10 kg, and + 1 mL/kg/h for every kilogram above 20 kg.',
        steps: [
          'Identify the patient\'s body weight in kilograms.',
          'Apply the 4-2-1 rule: for a 70 kg adult, calculate: (10 × 4) + (10 × 2) + (50 × 1) = 40 + 20 + 50 = 110 mL/h.',
          'Select an appropriate maintenance crystalloid solution (e.g., D5 ½NS + 20 mEq KCl).'
        ],
        clinicalTips: 'The Holliday-Segar method represents a physiological baseline; always adjust rates based on clinical signs of volume status, heart failure, or renal impairment.'
      },
      'tidal-volume': {
        why: 'Tidal Volume planning dictates the volume of air delivered during a mechanical ventilator breath. Standardizing volume against Ideal Body Weight prevents high pressure (barotrauma) and stretch (volutrauma) in the lungs.',
        formula: 'Target Vt = 6 to 8 mL / kg of Ideal Body Weight (IBW)',
        formulaExplanation: 'Calculates protective lung volumes. Crucially, the calculation must utilize Ideal Body Weight (which scales with biological lung size) rather than actual weight.',
        steps: [
          'Compute the patient\'s Ideal Body Weight based on height and biological sex.',
          'Select the desired protective clinical target (typically 6 mL/kg for ARDS, or up to 8 mL/kg for normal lungs).',
          'Multiply the target mL/kg by the Ideal Body Weight to determine the ventilator setting.'
        ],
        clinicalTips: 'Using a patient\'s actual weight to program tidal volumes in obese patients is a major clinical error that can lead to severe ventilator-induced lung injury.'
      },
      'apgar': {
        why: 'The APGAR score is a rapid, standardized method used to assess a newborn infant\'s physical condition immediately after birth at 1 and 5 minutes, guiding emergency resuscitation decisions.',
        formula: 'APGAR = Appearance + Pulse + Grimace + Activity + Respiration',
        formulaExplanation: 'Grades five physiological metrics from 0 (poor) to 2 (normal), yielding a sum score from 0 to 10.',
        steps: [
          'Assess skin color (Appearance) for cyanosis or pinkness.',
          'Measure the pulse rate.',
          'Observe reflex response to mild stimulation (Grimace).',
          'Evaluate muscle tone and active movement (Activity).',
          'Observe respiratory effort and crying quality.',
          'Sum the scored parameters to find the total APGAR score.'
        ],
        clinicalTips: 'An APGAR score of 7 to 10 is considered normal. A score of 3 or less indicates critical distress, requiring immediate cardiopulmonary resuscitation.'
      },
      'edd': {
        why: 'The Estimated Date of Delivery (EDD) calculator predicts the due date of a pregnancy, which is vital for timing clinical prenatal screenings, tracking fetal growth milestones, and planning deliveries.',
        formula: 'Naegele\'s Rule: EDD = LMP + 7 Days − 3 Months + 1 Year',
        formulaExplanation: 'Naegele\'s rule projects delivery assuming a standard 280-day gestational duration from the first day of the Last Menstrual Period (LMP).',
        steps: [
          'Identify the first day of the patient\'s Last Menstrual Period.',
          'Add 7 days to that date.',
          'Subtract 3 calendar months.',
          'Add 1 calendar year to calculate the final estimated date.'
        ],
        clinicalTips: 'Always correlate LMP-derived due dates with a first-trimester ultrasound measurement, which is the gold standard for clinical pregnancy dating.'
      },
      'gestational-age': {
        why: 'Gestational Age calculations track the progress of a pregnancy in weeks and days, which is the primary metric governing all clinical decisions, testing schedules, and medication safety profiles.',
        formula: 'Weeks and Days since the first day of the LMP',
        formulaExplanation: 'Measures time elapsed from the first day of the Last Menstrual Period to the current date, standardly reported as a dual number (e.g., 28 weeks and 3 days).',
        steps: [
          'Identify the first day of the Last Menstrual Period.',
          'Count the exact number of days that have elapsed from that date to the current bedside evaluation date.',
          'Divide the total number of days by 7 to determine the weeks and remaining days.'
        ],
        clinicalTips: 'In cases of IVF pregnancies, gestational age is determined using the exact date of embryo transfer rather than LMP.'
      },
      'vbac': {
        why: 'The Vaginal Birth After Cesarean (VBAC) calculator estimates the probability of a successful vaginal delivery in a patient who has previously undergone a cesarean section, assisting in patient counseling and delivery planning.',
        formula: 'Guideline-Based Success Probability Model',
        formulaExplanation: 'Uses clinical variables including age, BMI, prior vaginal deliveries, and the specific indication for the prior cesarean section to compute a predicted success rate.',
        steps: [
          'Record the patient\'s age and pre-pregnancy body mass index.',
          'Identify if the patient has ever had a successful vaginal delivery (before or after the cesarean).',
          'Review the indication for the prior cesarean section (e.g., arrested labor/dystocia).',
          'Calculate the success percentage using the weighted risk models.'
        ],
        clinicalTips: 'A predicted success probability of 70% or greater is widely considered favorable for offering a Trial of Labor After Cesarean (TOLAC) in a setting with immediate surgical support.'
      }
    };

    if (DB[id]) {
      return {
        title: name,
        why: DB[id].why,
        formula: DB[id].formula,
        formulaExplanation: DB[id].formulaExplanation,
        steps: DB[id].steps,
        clinicalTips: DB[id].clinicalTips
      };
    }

    const inputNames = schema.inputs.map(i => i.label.en).join(', ');
    return {
      title: name,
      why: `The ${name} is an evidence-based clinical calculator designed to support clinical decision-making. It standardizes evaluations, reduces calculation errors, and provides quick bedside assistance.`,
      formula: formulaStr,
      formulaExplanation: `This calculator processes the inputs: ${inputNames} according to standard clinical algorithms and medical guidelines.`,
      steps: [
        `Identify and gather the required clinical parameters: ${inputNames}.`,
        `Input the measured patient values into the designated calculator fields.`,
        `Click "Calculate" to execute the standard physiological formula and view the clinical interpretation.`
      ],
      clinicalTips: 'Always pair calculated results with a comprehensive clinical evaluation. Clinical calculators support, but do not replace, individual bedside judgment.'
    };
  },

  toggleFav(id) {
    let f = JSON.parse(localStorage.getItem(this.STORAGE.favs) || '[]');
    f = f.includes(id) ? f.filter(x => x !== id) : [...f, id];
    localStorage.setItem(this.STORAGE.favs, JSON.stringify(f));
    this.render();
  },

  isFav(id) {
    return JSON.parse(localStorage.getItem(this.STORAGE.favs) || '[]').includes(id);
  },

  render() {
    const root = document.getElementById('calc-app');
    if (!root) return;
    root.classList.toggle('emergency-mode', this.state.emergency);
    if (this.state.view === 'home') root.innerHTML = this._renderHome();
    else if (this.state.view === 'role') root.innerHTML = this._renderRole(this.state.role);
    else if (this.state.view === 'calc') root.innerHTML = this._renderCalculator(this.state.calcId);
    this._updateOfflineBadge();
  },

  _renderHome() {
    const favs = JSON.parse(localStorage.getItem(this.STORAGE.favs) || '[]');
    const recents = JSON.parse(localStorage.getItem(this.STORAGE.recents) || '[]').slice(0, 4);
    let html = `
      <div class="calc-hero">
        <h1 class="hero-h1">${CalcI18n.t('appTitle')}</h1>
        <p class="hero-sub">${CalcI18n.t('appSubtitle')}</p>
        <div class="calc-search-wrap">
          <input id="calc-search" type="search" placeholder="${CalcI18n.t('searchPlaceholder')}" autocomplete="off" inputmode="search">
          <div id="search-results" class="search-results"></div>
        </div>
        <div class="calc-lang">
          <button id="lang-en" class="lang-btn ${CalcI18n.lang === 'en' ? 'active' : ''}">EN</button>
          <button id="lang-es" class="lang-btn ${CalcI18n.lang === 'es' ? 'active' : ''}">ES</button>
          <span class="lang-sep">|</span>
          <button id="unit-us" class="lang-btn ${CalcUnits.system === 'US' ? 'active' : ''}" title="US units (lbs, in, mg/dL)">US</button>
          <button id="unit-si" class="lang-btn ${CalcUnits.system === 'SI' ? 'active' : ''}" title="SI/metric units (kg, cm, µmol/L)">SI</button>
        </div>
        <div id="offline-badge" class="offline-badge">🟢 ${CalcI18n.t('offlineReady')}</div>
      </div>`;

    if (favs.length) html += `<section class="calc-section"><h2>${CalcI18n.t('favorites')}</h2><div class="calc-grid">${favs.map(id => this._card(CalcRegistry.getById(id))).join('')}</div></section>`;
    if (recents.length) html += `<section class="calc-section"><h2>${CalcI18n.t('recents')}</h2><div class="calc-grid">${recents.map(id => this._card(CalcRegistry.getById(id))).filter(Boolean).join('')}</div></section>`;

    html += `<section class="calc-section"><h2>${CalcI18n.t('selectRole')}</h2><div class="role-grid">`;
    html += CalcRegistry.roles.map(r => `
      <button class="role-card ${r.emergency ? 'role-emergency' : ''}" data-role="${r.id}">
        <span class="role-icon">${r.icon}</span>
        <span class="role-name">${CalcI18n.t('roles.' + r.id)}</span>
        <span class="role-count">${CalcRegistry.getByRole(r.id).filter(c => c.implemented).length} active</span>
      </button>`).join('');
    html += '</div></section>';
    html += `<p class="calc-disclaimer">${CalcI18n.t('disclaimer')}</p>`;

    setTimeout(() => {
      document.querySelectorAll('.role-card').forEach(btn => btn.onclick = () => this.goRole(btn.dataset.role));
      document.getElementById('calc-search')?.addEventListener('input', (e) => this._onSearch(e.target.value));
      document.getElementById('lang-en')?.addEventListener('click', () => { CalcI18n.setLang('en'); this.render(); });
      document.getElementById('lang-es')?.addEventListener('click', () => { CalcI18n.setLang('es'); this.render(); });
      document.getElementById('unit-us')?.addEventListener('click', () => { CalcUnits.setSystem('US'); this.render(); });
      document.getElementById('unit-si')?.addEventListener('click', () => { CalcUnits.setSystem('SI'); this.render(); });
      this._bindCalcCards();
    }, 0);
    return html;
  },

  _bindCalcCards() {
    document.querySelectorAll('.calc-card').forEach(card => {
      const id = card.dataset.id;
      const calc = CalcRegistry.getById(id);
      if (!calc) return;
      const btn = card.querySelector('button');
      if (!btn) return;
      if (!calc.implemented) { btn.disabled = true; return; }
      const access = this.canAccess(calc);
      if (access === 'premium') {
        btn.onclick = () => this._showPremium();
      } else if (access === 'auth') {
        btn.onclick = () => MediHelp.showAuthModal();
      } else {
        btn.onclick = () => this.openCalc(id);
      }
    });
  },

  _card(c) {
    if (!c) return '';
    const access = this.canAccess(c);
    const locked = access === 'premium';
    return `
      <article class="calc-card ${!c.implemented ? 'coming-soon' : ''} ${locked ? 'locked' : ''}" data-id="${c.id}">
        ${c.freeDemo ? `<span class="chip chip-free">${CalcI18n.t('freeDemo')}</span>` : ''}
        ${!c.implemented ? `<span class="chip chip-soon">${CalcI18n.t('comingSoon')}</span>` : ''}
        <h3>${this._name(c)}</h3>
        <p>${this._desc(c)}</p>
        <button class="btn btn-primary btn-sm" ${!c.implemented || locked ? 'disabled' : ''}>${CalcI18n.t('openCalculator')}</button>
      </article>`;
  },

  _renderRole(roleId) {
    const role = CalcRegistry.roles.find(r => r.id === roleId);
    const calcs = CalcRegistry.getByRole(roleId);
    const bySpec = {};
    calcs.forEach(c => { const s = c.specialty || 'general'; (bySpec[s] ||= []).push(c); });

    let html = `<div class="calc-role-header ${role?.emergency ? 'emergency' : ''}">
      <button id="calc-back" class="btn btn-ghost">← ${CalcI18n.t('back')}</button>
      <h1>${role?.icon || ''} ${CalcI18n.t('roles.' + roleId)}</h1>
      ${role?.emergency ? `<div class="er-patient-panel">
        <div class="panel-row">
          <label>Age (years)<input type="number" id="er-age" min="0" max="120" step="1" placeholder="e.g. 35"></label>
          <label>Sex
            <select id="er-sex">
              <option value="male">Male</option>
              <option value="female">Female</option>
            </select>
          </label>
          <label>Weight (lbs or kg)<input type="text" id="er-weight" placeholder="e.g. 150 lbs or 70 kg"></label>
        </div>
        <div class="panel-note">Values are shared across all ER calculators for fast bedside input.</div>
      </div>` : ''}
    </div>`;

    for (const [spec, items] of Object.entries(bySpec)) {
      html += `<section class="calc-section"><h2 class="spec-title">${spec.replace(/-/g, ' ')}</h2><div class="calc-grid">`;
      html += items.map(c => this._card(c)).join('');
      html += '</div></section>';
    }

    setTimeout(() => {
      document.getElementById('calc-back')?.addEventListener('click', () => this.goHome());
      this._bindCalcCards();
      if (role?.emergency) this._bindErPanel();
    }, 0);
    return html;
  },

  _renderCalculator(id) {
    const calc = CalcRegistry.getById(id);
    const schema = this._schemaFor(id);
    if (!calc || !schema) return '<p>Calculator not found</p>';

    const saved = JSON.parse(localStorage.getItem(this.STORAGE.values) || '{}')[id] || {};

    let html = `<div class="calc-view-header">
      <button id="calc-back" class="btn btn-ghost">← ${CalcI18n.t('back')}</button>
      <div class="calc-title-block">
        <h1>${this._name(calc)}</h1>
        <p>${this._desc(calc)}</p>
      </div>
      <button class="fav-btn ${this.isFav(id) ? 'active' : ''}" id="fav-btn" title="${CalcI18n.t('bookmark')}">⭐</button>
    </div>
    <div class="calc-layout">
      <form id="calc-form" class="calc-form">
        <div class="formula-box"><span>${CalcI18n.t('formula')}</span><code>${(schema.formula || '').replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;')}</code></div>`;

    const basic = schema.inputs.filter(i => !i.advanced);
    const advanced = schema.inputs.filter(i => i.advanced);

    html += basic.map(inp => this._inputHtml(inp, saved)).join('');
    if (advanced.length) {
      html += `<button type="button" id="toggle-adv" class="btn btn-ghost adv-toggle">${CalcI18n.t('showAdvanced')}</button>
        <div id="adv-fields" class="hidden">${advanced.map(inp => this._inputHtml(inp, saved)).join('')}</div>`;
    }
    html += `<button type="submit" class="btn btn-primary calc-submit">${CalcI18n.t('calculate')}</button>
      </form>
      <div id="calc-result" class="calc-result empty">
        <div class="result-placeholder">${CalcI18n.t('result')}</div>
      </div>
    </div>`;

    // Fetch and append the rich clinical information block directly under the calculator
    const info = this.getClinicalInfo(id, calc, schema);
    html += `
    <article class="clinical-content" style="max-width: 900px; margin: 48px auto 0; border-top: 1px solid var(--border); padding-top: 32px;">
      <h2 style="font-family: var(--font-display); font-size: 26px; font-weight: 800; color: var(--text-h); margin-top: 20px; margin-bottom: 16px; border-left: 4px solid var(--accent); padding-left: 16px;">
        ${info.title} Reference Guide
      </h2>
      
      <h3 style="font-size: 18px; font-weight: 700; color: var(--text-h); margin-top: 24px; margin-bottom: 10px;">Why we use this calculator and what for?</h3>
      <p style="margin-bottom: 20px; line-height: 1.8; color: var(--text-body);">${info.why}</p>
      
      <h3 style="font-size: 18px; font-weight: 700; color: var(--text-h); margin-top: 24px; margin-bottom: 10px;">What Formula is used?</h3>
      <div class="formula-card" style="background: var(--bg-card); border: 1px solid var(--border); border-radius: 16px; padding: 24px; margin: 16px 0; box-shadow: var(--shadow);">
        <div class="formula-math" style="font-family: var(--font-mono); font-size: 18px; color: var(--accent-light); text-align: center; margin: 12px 0; font-weight: bold; word-wrap: break-word;">
          ${(info.formula || '').replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;')}
        </div>
        <p style="margin: 0; font-size: 14px; color: var(--text-muted); line-height: 1.6;">${info.formulaExplanation}</p>
      </div>
      
      <h3 style="font-size: 18px; font-weight: 700; color: var(--text-h); margin-top: 24px; margin-bottom: 10px;">How to calculate?</h3>
      <ol style="margin-bottom: 24px; padding-left: 20px; line-height: 1.8; color: var(--text-body);">
        ${info.steps.map(s => `<li style="margin-bottom: 8px;">${s}</li>`).join('')}
      </ol>
      
      ${info.clinicalTips ? `
      <div style="background: rgba(var(--accent-rgb), 0.04); border: 1px solid rgba(var(--accent-rgb), 0.15); border-radius: 12px; padding: 20px; margin-bottom: 28px; margin-top: 24px;">
        <strong style="color: var(--accent); display: block; margin-bottom: 8px; font-size: 15px;">💡 Bedside Clinical Tips & Warnings</strong>
        <p style="margin: 0; font-size: 14px; line-height: 1.6; color: var(--text-body);">${info.clinicalTips}</p>
      </div>` : ''}
    </article>`;

    setTimeout(() => {
      document.getElementById('calc-back')?.addEventListener('click', () => this.goRole(calc.role));
      document.getElementById('fav-btn')?.addEventListener('click', () => this.toggleFav(id));
      document.getElementById('toggle-adv')?.addEventListener('click', () => {
        document.getElementById('adv-fields')?.classList.toggle('hidden');
      });
      document.getElementById('calc-form')?.addEventListener('submit', (e) => {
        e.preventDefault();
        this._runCalc(id);
      });
      if (calc.role === 'er') {
        this._pushErPatientToForms();
        this._showErBanner();
      }
      document.querySelectorAll('.stepper').forEach(s => {
        s.querySelector('.step-minus')?.addEventListener('click', () => this._step(s, -1));
        s.querySelector('.step-plus')?.addEventListener('click', () => this._step(s, 1));
      });
      // Unit badge — toggle only this field's display unit (does not change global SI/US)
      document.querySelectorAll('.unit-badge').forEach(btn => {
        btn.addEventListener('click', () => {
          const grp = btn.dataset.group;
          if (!grp) return;
          const inp = document.querySelector(`[name="${btn.dataset.field}"]`);
          if (!inp) return;
          const currentDisplay = inp.dataset.displayUnit || CalcUnits.system;
          const newDisplay = currentDisplay === 'SI' ? 'US' : 'SI';
          const currentVal = parseFloat(inp.value);
          if (!isNaN(currentVal)) {
            const canonical = CalcUnits.displayToCanonical(currentVal, grp, currentDisplay);
            inp.value = CalcUnits.canonicalToDisplay(canonical, grp, newDisplay);
          }
          inp.dataset.displayUnit = newDisplay;
          btn.textContent = CalcUnits.getUnit(grp, newDisplay) + ' ⇆';
        });
      });
    }, 0);
    return html;
  },

  _inputHtml(inp, saved) {
    const grp = CalcUnits.inferGroup(inp);
    const savedUnits = saved._units || {};
    const fieldDisplaySys = savedUnits[inp.id] || CalcUnits.system;
    const displayUnit = grp ? CalcUnits.getUnit(grp, fieldDisplaySys) : (inp.unit || '');
    const siDefault = inp.default ?? '';
    const displayDefault = (grp && siDefault !== '')
      ? CalcUnits.canonicalToDisplay(siDefault, grp, fieldDisplaySys)
      : siDefault;
    const savedRaw = saved[inp.id];
    let val = displayDefault;
    if (savedRaw !== undefined && savedRaw !== '') {
      if (grp) {
        const storedSys = savedUnits[inp.id] || fieldDisplaySys;
        const n = parseFloat(savedRaw);
        if (!isNaN(n)) {
          const canon = CalcUnits.displayToCanonical(n, grp, storedSys);
          val = CalcUnits.canonicalToDisplay(canon, grp, fieldDisplaySys);
        } else {
          val = savedRaw;
        }
      } else {
        val = savedRaw;
      }
    }
    let label = inp.label[CalcI18n.lang] || inp.label.en;
    if (displayUnit) {
      label += ` (${displayUnit})`;
    }
    const range = grp ? CalcUnits.getRange(grp, fieldDisplaySys) : (inp.min !== undefined ? inp.min + '–' + (inp.max || '') : '');
    const placeholder = range ? 'Norm: ' + range : '';

    if (inp.type === 'select') {
      const opts = inp.options.map(o => `<option value="${o.v}" ${String(val) === String(o.v) ? 'selected' : ''}>${o.l[CalcI18n.lang] || o.l.en}</option>`).join('');
      return `<label class="calc-field"><span>${label}</span><select name="${inp.id}" class="calc-input">${opts}</select></label>`;
    }
    if (inp.type === 'toggle') {
      return `<label class="calc-field toggle-field"><span>${label}</span><input type="checkbox" name="${inp.id}" class="calc-toggle" ${val ? 'checked' : ''}></label>`;
    }
    if (inp.type === 'date') {
      return `<label class="calc-field"><span>${label}</span><input type="date" name="${inp.id}" class="calc-input" value="${val}"></label>`;
    }
    if (inp.type === 'datetime-local') {
      return `<label class="calc-field"><span>${label}</span><input type="datetime-local" name="${inp.id}" class="calc-input" value="${val}"></label>`;
    }
    const unitBadge = displayUnit ? `<button type="button" class="unit-badge" data-field="${inp.id}" data-group="${grp || ''}" title="Toggle unit">${displayUnit} ⇆</button>` : '';
    return `<label class="calc-field">
      <span>${label}${inp.optional ? ' <em class="opt-label">Optional</em>' : ''}</span>
      <div class="stepper">
        <button type="button" class="step-minus">−</button>
        <input type="number" name="${inp.id}" class="calc-input" value="${val}" min="${inp.min ?? ''}" max="${inp.max ?? ''}" step="any" data-step="${inp.step || 1}" data-display-unit="${grp ? fieldDisplaySys : ''}" data-unit-group="${grp || ''}" inputmode="decimal" placeholder="${placeholder}">
        <button type="button" class="step-plus">+</button>
        ${unitBadge}
      </div>
    </label>`;
  },

  _step(wrap, dir) {
    const inp = wrap.querySelector('input');
    const step = parseFloat(inp.dataset.step) || 1;
    inp.value = (parseFloat(inp.value || 0) + dir * step).toFixed(step < 1 ? 1 : 0);
  },

  _runCalc(id) {
    const form = document.getElementById('calc-form');
    const vals = {};
    new FormData(form).forEach((v, k) => {
      const el = form.elements[k];
      if (el?.type === 'checkbox') return;
      vals[k] = v;
    });
    form.querySelectorAll('input[type="checkbox"]').forEach(cb => {
      if (cb.name) vals[cb.name] = cb.checked;
    });
    const displayUnits = {};
    form.querySelectorAll('[data-display-unit]').forEach(el => {
      if (el.name && el.dataset.displayUnit) displayUnits[el.name] = el.dataset.displayUnit;
    });

    const all = JSON.parse(localStorage.getItem(this.STORAGE.values) || '{}');
    all[id] = Object.assign({ _units: displayUnits }, vals);
    localStorage.setItem(this.STORAGE.values, JSON.stringify(all));

    const schema = this._schemaFor(id);
    const box = document.getElementById('calc-result');
    if (!box) return;
    if (!schema) {
      box.innerHTML = '<div class="result-error">Calculator schema missing — unit conversion unavailable. Check registry/schema keys.</div>';
      box.classList.remove('empty');
      return;
    }
    const siVals = CalcUnits.convertFormToSI(vals, schema, displayUnits);

    const result = CalcCompute.compute(id, siVals);

    if (result.error) {
      box.innerHTML = `<div class="result-error">${result.error}</div>`;
      box.classList.remove('empty');
      return;
    }

    const chipClass = 'chip-' + (result.chip || 'normal');
    let html = `<div class="result-primary">${result.primary}</div>
      <span class="status-chip ${chipClass}">${CalcI18n.t(result.chip || 'normal')}</span>
      <p class="result-interp">${result.interpretation}</p>`;
    if (result.details) {
      html += '<ul class="result-details">' + result.details.map(d => `<li><strong>${d.label}:</strong> ${d.value}</li>`).join('') + '</ul>';
    }
    html += `<button type="button" class="btn btn-ghost" id="copy-result">${CalcI18n.t('copy')}</button>`;
    box.innerHTML = html;
    box.classList.remove('empty');
    document.getElementById('copy-result')?.addEventListener('click', () => {
      navigator.clipboard.writeText(result.primary + ' — ' + result.interpretation);
    });
  },

  _applyPreset(preset) {
    // SI defaults in kg; convert to current display unit before populating fields
    const defaults = { adult: { weight: 70 }, ped: { weight: 20 }, '70': { weight: 70 } };
    const vals = defaults[preset];
    if (!vals) return;
    Object.entries(vals).forEach(([k, v]) => {
      const el = document.querySelector(`[name="${k}"]`);
      if (!el) return;
      // v is always in SI (kg); convert to display unit if US mode
      const displaySys = el.dataset.displayUnit || CalcUnits.system;
      const grp = el.dataset.unitGroup || (k === 'weight' ? 'weight' : '');
      const displayVal = grp ? CalcUnits.canonicalToDisplay(v, grp, displaySys) : v;
      el.value = displayVal;
    });
  },

  _erPatientFromStorage() {
    try {
      const raw = JSON.parse(localStorage.getItem(this.STORAGE.erPatient) || '{}');
      const weightText = raw.weightText || '';
      return {
        age: raw.age || '',
        sex: raw.sex || '',
        weightText,
        weightKg: this._parseErWeight(weightText)
      };
    } catch (e) {
      return null;
    }
  },

  _parseErWeight(weight) {
    if (weight === undefined || weight === null) return null;
    const value = String(weight).trim().toLowerCase().replace(/,/g, '');
    if (!value) return null;
    const lbMatch = value.match(/^([\d.]+)\s*(lb|lbs)$/);
    const kgMatch = value.match(/^([\d.]+)\s*(kg)?$/);
    if (lbMatch) return parseFloat(lbMatch[1]) * 0.45359237;
    if (kgMatch) return parseFloat(kgMatch[1]);
    const parsed = parseFloat(value);
    return Number.isFinite(parsed) ? parsed : null;
  },

  _bindErPanel() {
    const ageEl = document.getElementById('er-age');
    const sexEl = document.getElementById('er-sex');
    const weightEl = document.getElementById('er-weight');
    if (!ageEl || !sexEl || !weightEl) return;

    ageEl.value = this._erPatient?.age || '';
    sexEl.value = this._erPatient?.sex || 'male';
    weightEl.value = this._erPatient?.weightText || '';

    const save = () => {
      this._erPatient = {
        age: ageEl.value || '',
        sex: sexEl.value || 'male',
        weightText: weightEl.value || '',
        weightKg: this._parseErWeight(weightEl.value || '')
      };
      localStorage.setItem(this.STORAGE.erPatient, JSON.stringify({
        age: this._erPatient.age,
        sex: this._erPatient.sex,
        weightText: this._erPatient.weightText
      }));
      this._pushErPatientToForms();
      this._showErBanner();
    };

    ageEl.addEventListener('input', save);
    sexEl.addEventListener('change', save);
    weightEl.addEventListener('input', save);
  },

  _pushErPatientToForms() {
    if (!this._erPatient) return;
    const entries = [
      ['age', this._erPatient.age],
      ['sex', this._erPatient.sex],
      ['weight', this._erPatient.weightKg != null ? this._erPatient.weightKg : this._erPatient.weightText]
    ];
    entries.forEach(([field, value]) => {
      if (value === undefined || value === null || value === '') return;
      const elements = Array.from(document.querySelectorAll(`[name="${field}"]`));
      elements.forEach(el => {
        if (el.type === 'radio') {
          el.checked = el.value === String(value);
          return;
        }
        if (field === 'weight' && el.dataset.unitGroup === 'weight') {
          const displaySys = el.dataset.displayUnit || CalcUnits.system;
          if (this._erPatient.weightKg != null) {
            el.value = CalcUnits.canonicalToDisplay(this._erPatient.weightKg, 'weight', displaySys);
          } else {
            el.value = this._erPatient.weightText;
          }
          return;
        }
        el.value = String(value);
      });
    });
  },

  _showErBanner() {
    const existing = document.getElementById('er-patient-banner');
    if (!this._erPatient || (!this._erPatient.age && !this._erPatient.sex && !this._erPatient.weightText)) {
      existing?.remove();
      return;
    }
    const summary = [];
    if (this._erPatient.age) summary.push(`Age ${this._erPatient.age}`);
    if (this._erPatient.sex) summary.push(this._erPatient.sex.charAt(0).toUpperCase() + this._erPatient.sex.slice(1));
    if (this._erPatient.weightText) summary.push(`Weight ${this._erPatient.weightText}`);
    const bannerHtml = `<div id="er-patient-banner" class="er-banner"><strong>ER patient:</strong> ${summary.join(' · ')}. Saved across ER calculators.</div>`;
    if (existing) {
      existing.innerHTML = bannerHtml;
    } else {
      document.querySelector('.calc-layout')?.insertAdjacentHTML('afterbegin', bannerHtml);
    }
  },

  _updateOfflineBadge() {
    const badge = document.getElementById('offline-badge');
    if (!badge) return;
    if (navigator.onLine) {
      badge.textContent = '🟢 ' + CalcI18n.t('offlineReady');
      badge.style.opacity = '1';
    } else {
      badge.textContent = '🔴 Offline — cached content available';
      badge.style.opacity = '0.8';
    }
  }
};

async function verifyCalcLicense() {
  const user = (await window.dbClient?.auth.getUser())?.data?.user;
  if (!user) { MediHelp.showAuthModal(); return; }
  const key = document.getElementById('calc-license-key')?.value.trim();
  const email = document.getElementById('calc-license-email')?.value.trim();
  if (!key || !email) { MediHelp.toast?.('Enter license key and email') || alert('Enter license key and email'); return; }
  try {
    await MediHelp.License.verify(key, email);
    document.getElementById('calc-premium-modal')?.classList.remove('visible');
    CalcUI._premium = true;
    location.reload(); // reload fetches fresh premium state; in-memory render() before reload is wasted
  } catch (e) {
    alert(e.message || 'Invalid license');
  }
}

function closeCalcPremium() {
  document.getElementById('calc-premium-modal')?.classList.remove('visible');
}

document.addEventListener('DOMContentLoaded', () => CalcUI.init());
