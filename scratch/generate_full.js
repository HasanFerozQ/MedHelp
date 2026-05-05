const fs = require('fs');

const cases = [
  {
    title: "The Snoring Husband",
    scenario: "A 55-year-old obese male is brought to the clinic by his wife. She complains that his snoring is 'deafening' and she frequently witnesses him stop breathing for up to 30 seconds at a time during the night. He reports feeling exhausted during the day and often falls asleep while watching TV.\n\nVitals: BP 150/95, BMI 36.\nPhysical Examination: Neck circumference is 18 inches. Oropharyngeal exam reveals a crowded airway with a low-lying soft palate and an elongated uvula (Mallampati Class IV).\nLaboratory Results: None.",
    disease: "Obstructive Sleep Apnea (Adult Classic Presentation)",
    questions: [
      {
        q: "What is the primary pathophysiologic mechanism of Obstructive Sleep Apnea (OSA)?",
        options: ["Lack of respiratory drive from the brainstem", "Recurrent collapse of the pharyngeal airway during sleep due to loss of muscle tone", "Excessive mucus production", "None"],
        ans: 1,
        exp: "During sleep, pharyngeal dilator muscles relax, allowing the soft tissues (palate, tongue) to collapse and obstruct the airway."
      },
      {
        q: "What is the Gold Standard diagnostic test for suspected OSA?",
        options: ["Home pulse oximetry", "In-lab, attended, overnight Polysomnography (PSG)", "CT scan of the neck", "None"],
        ans: 1,
        exp: "PSG monitors EEG, EOG, EMG, airflow, respiratory effort, and oxygen saturation to definitively diagnose and classify OSA."
      },
      {
        q: "What is the most common anatomic risk factor for OSA in adults?",
        options: ["Deviated septum", "Obesity, particularly increased neck circumference (>17 inches in men, >16 in women)", "Large tonsils", "None"],
        ans: 1,
        exp: "Fat deposition in the parapharyngeal spaces narrows the airway and increases its collapsibility."
      }
    ]
  },
  {
    title: "The Hyperactive Child",
    scenario: "A 6-year-old boy is brought in by his parents due to behavioral issues and poor school performance. His teacher suspects ADHD. The parents note he is a chronic mouth-breather, snores loudly, and tosses and turns all night.\n\nVitals: Normal. BMI 50th percentile.\nPhysical Examination: 'Adenoid facies' with an open mouth. Oral exam reveals massive 4+ 'kissing' palatine tonsils that touch in the midline.\nLaboratory Results: None.",
    disease: "Pediatric Obstructive Sleep Apnea",
    questions: [
      {
        q: "What is the most common cause of Obstructive Sleep Apnea in children?",
        options: ["Obesity", "Adenotonsillar hypertrophy", "Craniofacial anomalies", "None"],
        ans: 1,
        exp: "Unlike adults where obesity is the primary driver, pediatric OSA is most frequently caused by enlarged tonsils and adenoids."
      },
      {
        q: "How does the daytime presentation of pediatric OSA classically differ from adult OSA?",
        options: ["Adults are hyperactive; children are sleepy", "Adults typically present with hypersomnolence, while children often present with paradoxical hyperactivity, inattention, and behavioral problems (mimicking ADHD)", "They present identically", "None"],
        ans: 1,
        exp: "Chronic sleep fragmentation in children manifests as behavioral dysregulation and poor executive function."
      },
      {
        q: "What is the first-line definitive treatment for this child?",
        options: ["CPAP", "Adenotonsillectomy", "Stimulant medications for ADHD", "None"],
        ans: 1,
        exp: "Surgical removal of the hypertrophic adenoids and tonsils is highly effective and curative in the vast majority of healthy children with OSA."
      }
    ]
  },
  {
    title: "The Sleep Study",
    scenario: "A 45-year-old male undergoes overnight polysomnography (PSG) for suspected sleep apnea. The PSG report shows an average of 40 events per hour where his airflow completely stops for at least 10 seconds despite continued respiratory effort. His lowest oxygen saturation was 82%.\n\nVitals: Normal.\nPhysical Examination: Normal.\nLaboratory Results: AHI = 40.",
    disease: "Severe Obstructive Sleep Apnea (Polysomnography Interpretation)",
    questions: [
      {
        q: "What index is the primary metric used to diagnose and grade the severity of OSA on a sleep study?",
        options: ["Oxygen Desaturation Index (ODI)", "Apnea-Hypopnea Index (AHI)", "Respiratory Disturbance Index (RDI)", "None"],
        ans: 1,
        exp: "The AHI measures the total number of apneas and hypopneas per hour of sleep."
      },
      {
        q: "How is 'Severe' Obstructive Sleep Apnea defined in adults based on the AHI?",
        options: ["AHI 5-15", "AHI 15-30", "AHI > 30 events per hour", "None"],
        ans: 1,
        exp: "Mild is 5-15, Moderate is 15-30, and Severe is >30 events per hour."
      },
      {
        q: "What defines an 'Apnea' during a sleep study?",
        options: ["A 50% reduction in airflow", "A complete cessation of airflow (drop of ≥90%) lasting at least 10 seconds", "A drop in oxygen by 3%", "None"],
        ans: 1,
        exp: "Apnea means 'no breath'. Hypopnea is a partial reduction in airflow."
      }
    ]
  },
  {
    title: "The Effortless Pause",
    scenario: "A 60-year-old male with severe congestive heart failure undergoes a sleep study. The PSG shows multiple 20-second periods where airflow completely stops. Crucially, the chest and abdominal effort belts show ZERO movement during these events.\n\nVitals: Normal.\nPhysical Examination: Normal.\nLaboratory Results: PSG shows absence of airflow and absence of respiratory effort.",
    disease: "Central Sleep Apnea (CSA)",
    questions: [
      {
        q: "How does Central Sleep Apnea physiologically differ from Obstructive Sleep Apnea?",
        options: ["There is no difference", "In OSA, the airway collapses but respiratory effort continues; in CSA, there is no airway collapse, but the brainstem fails to send the signal to breathe (no respiratory effort)", "CSA only happens awake", "None"],
        ans: 1,
        exp: "Central apnea is a problem of ventilatory drive, not airway anatomy."
      },
      {
        q: "What classic breathing pattern is frequently seen in patients with heart failure and Central Sleep Apnea?",
        options: ["Kussmaul breathing", "Cheyne-Stokes Respiration (a crescendo-decrescendo pattern of breathing separated by central apneas)", "Biot's breathing", "None"],
        ans: 1,
        exp: "Cheyne-Stokes breathing is a hallmark of CSA driven by delayed feedback loops in heart failure."
      },
      {
        q: "Can CPAP be used to treat Central Sleep Apnea?",
        options: ["It is the first choice", "Standard CPAP is often ineffective; Adaptive Servo-Ventilation (ASV) or BiPAP with a backup respiratory rate is typically required", "It cures it instantly", "None"],
        ans: 1,
        exp: "Because the patient is not trying to breathe, just holding the airway open (CPAP) doesn't force air into the lungs."
      }
    ]
  },
  {
    title: "The Mask Therapy",
    scenario: "A 50-year-old male is diagnosed with severe OSA (AHI 45). The sleep physician prescribes the gold-standard medical therapy. The patient returns to the ENT clinic complaining that he finds the machine uncomfortable, but admits his daytime sleepiness has completely resolved when he uses it.\n\nVitals: BP 125/80.\nPhysical Examination: Mild nasal bridge erythema from a mask interface.\nLaboratory Results: CPAP download shows excellent compliance and residual AHI of 2.",
    disease: "Continuous Positive Airway Pressure (CPAP)",
    questions: [
      {
        q: "How does CPAP physically prevent Obstructive Sleep Apnea?",
        options: ["It delivers pure oxygen", "It acts as a 'pneumatic splint,' delivering continuous positive pressure to forcefully hold the pharyngeal soft tissues open during both inspiration and expiration", "It forces the diaphragm to move", "None"],
        ans: 1,
        exp: "It does not breathe for the patient; it just physically prevents the airway from collapsing."
      },
      {
        q: "What is the most common reason for failure of CPAP therapy?",
        options: ["The machine breaks", "Poor patient adherence/compliance due to mask discomfort, claustrophobia, or nasal congestion", "It doesn't work for severe OSA", "None"],
        ans: 1,
        exp: "CPAP is near 100% effective when worn, but long-term compliance is often only 50-60%."
      },
      {
        q: "If a patient complains of severe nasal dryness and epistaxis while using CPAP, what is the best initial intervention?",
        options: ["Stop CPAP forever", "Add heated humidification to the CPAP machine and prescribe saline nasal spray", "Perform sinus surgery", "None"],
        ans: 1,
        exp: "High airflow dries out the nasal mucosa. Humidification is a standard comfort feature."
      }
    ]
  },
  {
    title: "The Two Pressures",
    scenario: "A 400-pound (181 kg) male with severe OSA and obesity hypoventilation is unable to tolerate his CPAP machine because the constant high pressure (18 cm H2O) makes it extremely difficult for him to exhale against it. He feels like he is 'suffocating.'\n\nVitals: SpO2 92%.\nPhysical Examination: Morbid obesity.\nLaboratory Results: None.",
    disease: "Bilevel Positive Airway Pressure (BiPAP)",
    questions: [
      {
        q: "How does BiPAP fundamentally differ from CPAP?",
        options: ["It uses two masks", "CPAP delivers one constant pressure; BiPAP delivers a higher pressure during inspiration (IPAP) and a lower pressure during expiration (EPAP)", "It delivers negative pressure", "None"],
        ans: 1,
        exp: "The lower expiratory pressure makes it much easier and more comfortable for the patient to exhale, especially at high pressure settings."
      },
      {
        q: "In what patient population is BiPAP particularly indicated over CPAP?",
        options: ["Patients with mild OSA", "Patients requiring very high pressures, or those with concomitant hypoventilation syndromes (e.g., COPD, Obesity Hypoventilation Syndrome) needing ventilatory support", "Children", "None"],
        ans: 1,
        exp: "The pressure difference (IPAP - EPAP) provides 'pressure support,' actually assisting ventilation and blowing off CO2."
      },
      {
        q: "What parameter does the EPAP (Expiratory Positive Airway Pressure) in BiPAP primarily control?",
        options: ["Oxygenation", "It acts like CPAP to stent the upper airway open and prevent obstructive collapse", "Heart rate", "None"],
        ans: 1,
        exp: "The baseline expiratory pressure must be high enough to keep the airway open, while the higher inspiratory pressure assists the breath."
      }
    ]
  },
  {
    title: "The Palate Surgery",
    scenario: "A 35-year-old male with moderate OSA (AHI 25) cannot tolerate CPAP. He has very large palatine tonsils (Grade 3) and a long, redundant soft palate. He wants a permanent surgical solution.\n\nVitals: BMI 28.\nPhysical Examination: Redundant soft palate, elongated uvula, enlarged tonsils.\nLaboratory Results: None.",
    disease: "Uvulopalatopharyngoplasty (UPPP)",
    questions: [
      {
        q: "What structures are surgically removed or remodeled during a classic UPPP?",
        options: ["The tongue base and epiglottis", "The palatine tonsils (if present), the uvula, and a portion of the redundant free edge of the soft palate", "The nasal septum", "None"],
        ans: 1,
        exp: "The goal is to widen the retropalatal airway by removing redundant tissue and suturing the pillars to create a tighter box."
      },
      {
        q: "Is UPPP generally considered a highly successful standalone cure for severe OSA in all adults?",
        options: ["Yes, 100% cure rate", "No, success rates (defined as 50% reduction in AHI and AHI < 20) are traditionally only around 40-50% for unselected patients", "Yes, but only in obese patients", "None"],
        ans: 1,
        exp: "UPPP only addresses the palatal level of obstruction. If the patient also collapses at the tongue base (which is common), UPPP alone will fail."
      },
      {
        q: "What is a common long-term risk or complication of overly aggressive UPPP?",
        options: ["Blindness", "Velopharyngeal insufficiency (VPI), resulting in hypernasal speech and nasal regurgitation of liquids", "Loss of taste", "None"],
        ans: 1,
        exp: "If too much soft palate is removed, it cannot seal against the posterior pharyngeal wall during swallowing."
      }
    ]
  },
  {
    title: "The Sleeping Endoscopy",
    scenario: "A 45-year-old male with CPAP-intolerant OSA is being evaluated for sleep surgery. Awake examination reveals a normal palate and small tonsils. The surgeon wants to know exactly where the airway is collapsing before operating.\n\nVitals: Normal.\nPhysical Examination: The patient is taken to the OR and given IV Propofol and Dexmedetomidine to simulate natural sleep. A flexible endoscope is passed through his nose to observe the airway dynamically as he begins to snore and obstruct.\nLaboratory Results: None.",
    disease: "Drug-Induced Sleep Endoscopy (DISE)",
    questions: [
      {
        q: "What is the primary purpose of Drug-Induced Sleep Endoscopy (DISE)?",
        options: ["To cure OSA", "To dynamically identify the exact anatomic levels (palate, lateral walls, tongue base, epiglottis) and patterns (AP vs concentric) of airway collapse during simulated sleep", "To biopsy the airway", "None"],
        ans: 1,
        exp: "Awake exams correlate poorly with sleeping collapse. DISE allows targeted, personalized surgical planning."
      },
      {
        q: "If DISE reveals 'complete concentric collapse' at the level of the velum (soft palate), what specific surgical treatment is generally CONTRAINDICATED?",
        options: ["UPPP", "Hypoglossal Nerve Stimulation (Inspire therapy)", "Tonsillectomy", "None"],
        ans: 1,
        exp: "The FDA strictly contraindicates Inspire therapy in patients with complete concentric palatal collapse, as stimulating the tongue will not open a concentrically collapsed palate."
      },
      {
        q: "What classification system is commonly used to score the findings during DISE?",
        options: ["Mallampati", "VOTE classification (Velum, Oropharynx lateral walls, Tongue base, Epiglottis)", "Friedman", "None"],
        ans: 1,
        exp: "The VOTE system standardizes the reporting of airway collapse."
      }
    ]
  },
  {
    title: "The Hypoventilating Obese Male",
    scenario: "A 55-year-old morbidly obese male (BMI 45) presents with severe daytime somnolence, morning headaches, and lower extremity edema. He has a known history of severe OSA but refuses to use CPAP.\n\nVitals: BP 160/95, RR 20, SpO2 88% on room air while awake in the clinic.\nPhysical Examination: Cyanotic lips, pitting edema of the legs.\nLaboratory Results: Arterial Blood Gas (ABG) while awake: PaCO2 is 55 mmHg (Normal 35-45).",
    disease: "Obesity Hypoventilation Syndrome (Pickwickian Syndrome)",
    questions: [
      {
        q: "What defines Obesity Hypoventilation Syndrome (OHS)?",
        options: ["Obesity and low oxygen", "Obesity (BMI > 30), daytime hypercapnia (PaCO2 > 45 mmHg) while awake, and sleep-disordered breathing, in the absence of other causes of hypoventilation", "Obesity and diabetes", "None"],
        ans: 1,
        exp: "These patients don't just obstruct at night; the extreme weight on the chest wall blunts their respiratory drive, causing chronic CO2 retention even while awake."
      },
      {
        q: "Why do these patients develop peripheral edema?",
        options: ["Kidney failure", "Chronic hypoxia and hypercapnia cause pulmonary vasoconstriction, leading to pulmonary hypertension, right heart failure (cor pulmonale), and subsequent peripheral edema", "Too much salt", "None"],
        ans: 1,
        exp: "Untreated OHS rapidly progresses to irreversible right heart failure."
      },
      {
        q: "What is the most appropriate positive airway pressure therapy for severe OHS?",
        options: ["CPAP only", "BiPAP (Non-Invasive Positive Pressure Ventilation) is often required to aggressively 'blow off' the excess CO2", "No therapy", "None"],
        ans: 1,
        exp: "While CPAP helps the OSA, BiPAP actually ventilates the patient, treating the hypercapnia."
      }
    ]
  },
  {
    title: "The Staging System",
    scenario: "A 30-year-old male is being evaluated for UPPP. The ENT surgeon notes that the patient has a Friedman Stage III airway.\n\nVitals: Normal.\nPhysical Examination: Tonsils are Grade 1 (small, hidden behind pillars). The soft palate is low-lying, and the uvula is completely obscured by the tongue base when the mouth is opened wide (Modified Mallampati Class IV). BMI is 25.\nLaboratory Results: None.",
    disease: "Friedman Staging System",
    questions: [
      {
        q: "What three variables are used to calculate the Friedman Stage for OSA surgical planning?",
        options: ["Age, weight, blood pressure", "Palate position (Modified Mallampati), Tonsil size, and BMI", "Neck size, height, AHI", "None"],
        ans: 1,
        exp: "This simple bedside staging system predicts the success rate of UPPP surgery."
      },
      {
        q: "How would you expect a patient with Friedman Stage I (huge tonsils, high palate, low BMI) to respond to UPPP?",
        options: ["Poorly", "Excellent response (approx. 80% success rate)", "No change", "None"],
        ans: 1,
        exp: "Stage I patients have obvious palatal/tonsillar obstruction that is easily fixed with surgery."
      },
      {
        q: "How would you expect the patient in the scenario (Friedman Stage III: small tonsils, Mallampati IV) to respond to UPPP alone?",
        options: ["Excellent response", "Very poor response (approx. 8% success rate)", "Perfect cure", "None"],
        ans: 1,
        exp: "Stage III patients have obstruction at the tongue base, not just the palate. UPPP alone will almost certainly fail."
      }
    ]
  },
  {
    title: "The Dental Appliance",
    scenario: "A 40-year-old female with mild OSA (AHI 12) complains of snoring that bothers her husband. She tried CPAP but developed severe claustrophobia. She is not obese and does not want surgery. She has good dentition.\n\nVitals: BMI 23.\nPhysical Examination: Normal palate, slight retrognathia (recessed jaw).\nLaboratory Results: None.",
    disease: "Mandibular Advancement Device (MAD)",
    questions: [
      {
        q: "How does a Mandibular Advancement Device (MAD) treat OSA?",
        options: ["It blows air", "It is a custom-fitted dental appliance that physically pulls the lower jaw forward during sleep, bringing the tongue base forward and opening the retroglossal airway", "It holds the mouth closed", "None"],
        ans: 1,
        exp: "By dragging the mandible forward, it tightens the pharyngeal musculature."
      },
      {
        q: "For which OSA severity is a MAD most strongly indicated as a first-line alternative to CPAP?",
        options: ["Severe OSA", "Mild to Moderate OSA", "Central Sleep Apnea", "None"],
        ans: 1,
        exp: "It is highly effective for snoring and mild/moderate OSA, but less reliable for severe OSA."
      },
      {
        q: "What is a common side effect of long-term MAD use?",
        options: ["Tooth decay", "Temporomandibular joint (TMJ) pain and permanent shifts in dental occlusion (bite changes)", "Ear infections", "None"],
        ans: 1,
        exp: "Constant forward pressure on the teeth and jaw joint can cause significant orthodontic changes."
      }
    ]
  },
  {
    title: "The Maxillary Move",
    scenario: "A 45-year-old male with severe OSA (AHI 60) has failed CPAP, UPPP, and a dental appliance. He has a noticeably recessed lower jaw (retrognathia) and a narrow midface. He is seeking a definitive, highly successful surgical cure.\n\nVitals: BMI 28.\nPhysical Examination: Maxillary hypoplasia and severe mandibular retrognathia.\nLaboratory Results: Lateral cephalogram shows a drastically narrowed posterior airway space (PAS).",
    disease: "Maxillomandibular Advancement (MMA)",
    questions: [
      {
        q: "What is Maxillomandibular Advancement (MMA) surgery?",
        options: ["Removing the tonsils", "A major orthognathic surgery where both the upper jaw (maxilla) and lower jaw (mandible) are cut and moved forward (usually ~10mm)", "Removing the tongue", "None"],
        ans: 1,
        exp: "This pulls the entire anterior pharyngeal wall (palate and tongue) forward, massively expanding the airway."
      },
      {
        q: "How does the success rate of MMA compare to UPPP for severe OSA?",
        options: ["It is lower", "MMA is the most effective sleep surgery, with success rates often exceeding 85-90%, approaching the efficacy of CPAP", "They are identical", "None"],
        ans: 1,
        exp: "Because it fundamentally expands the skeletal box of the airway, it treats obstruction at all levels."
      },
      {
        q: "What is a major aesthetic consequence of MMA?",
        options: ["No change", "Significant alteration of facial appearance (moving the lower face forward), which patients must be prepared for", "Loss of teeth", "None"],
        ans: 1,
        exp: "While often beneficial for retrognathic patients, it changes their face permanently."
      }
    ]
  },
  {
    title: "The Nerve Pacemaker",
    scenario: "A 50-year-old male with moderate OSA (AHI 25) cannot tolerate CPAP. DISE shows AP (anterior-posterior) collapse at the tongue base, with NO complete concentric palatal collapse. He is not morbidly obese.\n\nVitals: BMI 30.\nPhysical Examination: Normal.\nLaboratory Results: None.",
    disease: "Hypoglossal Nerve Stimulator (Inspire)",
    questions: [
      {
        q: "How does Hypoglossal Nerve Stimulation work to treat OSA?",
        options: ["It stops breathing", "An implanted pacemaker-like device senses respiration and electrically stimulates the distal branches of the hypoglossal nerve (CN XII) during inspiration", "It stimulates the diaphragm", "None"],
        ans: 1,
        exp: "Stimulation of CN XII causes the genioglossus muscle to contract, pushing the tongue forward and opening the airway."
      },
      {
        q: "Why is complete concentric collapse at the palate a strict contraindication for this therapy?",
        options: ["It causes pain", "Stimulating the tongue only opens the retroglossal airway; it cannot pull open a palate that is collapsing circularly from all sides", "It shocks the palate", "None"],
        ans: 1,
        exp: "This is why Drug-Induced Sleep Endoscopy (DISE) is mandatory before implanting the device."
      },
      {
        q: "The stimulation cuff is placed on the distal branches of the hypoglossal nerve to selectively activate the genioglossus. What movement does this cause?",
        options: ["Tongue retraction", "Tongue protrusion and stiffening", "Palate elevation", "None"],
        ans: 1,
        exp: "Protrusion clears the tongue base out of the posterior airway space."
      }
    ]
  },
  {
    title: "The Ultimate Bypass",
    scenario: "A 60-year-old morbidly obese male with life-threatening severe OSA (AHI 110), severe cor pulmonale, and obesity hypoventilation syndrome has failed all conservative and non-invasive measures. He is in right heart failure and cannot breathe.\n\nVitals: SpO2 85%.\nPhysical Examination: Massive obesity. Cyanosis. Extreme neck thickness.\nLaboratory Results: None.",
    disease: "Tracheostomy for OSA",
    questions: [
      {
        q: "Before the invention of CPAP in the 1980s, what was the only effective treatment for severe OSA?",
        options: ["UPPP", "Tracheostomy", "Dieting", "None"],
        ans: 1,
        exp: "Tracheostomy completely bypasses the collapsible upper airway, providing a 100% cure for Obstructive Sleep Apnea."
      },
      {
        q: "Why is tracheostomy rarely used today for OSA?",
        options: ["It doesn't work", "It carries significant morbidity, psychosocial stigma, and requires rigorous daily stoma care; it is reserved only for extreme, refractory, life-threatening cases", "It is too expensive", "None"],
        ans: 1,
        exp: "It is the treatment of absolute last resort, but it is guaranteed to work."
      },
      {
        q: "If a tracheostomy is performed for OSA, what happens during the day?",
        options: ["The patient cannot talk", "The tube is usually plugged or capped during the day to allow normal speech and breathing, and uncapped only at night to bypass the obstruction", "The tube is removed", "None"],
        ans: 1,
        exp: "This allows the patient to live relatively normally while awake."
      }
    ]
  },
  {
    title: "The Heart Failure",
    scenario: "A 65-year-old male with a 20-year history of untreated severe OSA presents to the ER with worsening shortness of breath, massive leg swelling, and ascites. His lungs are clear to auscultation.\n\nVitals: BP 140/90, HR 95.\nPhysical Examination: Elevated JVP, 3+ pitting edema, hepatomegaly.\nLaboratory Results: Echocardiogram shows severe right ventricular hypertrophy and dilation. Left ventricular function is normal.",
    disease: "Cor Pulmonale secondary to OSA",
    questions: [
      {
        q: "What defines Cor Pulmonale?",
        options: ["Left heart failure", "Right-sided heart failure resulting from primary disease of the lungs or pulmonary vasculature (e.g., severe OSA causing pulmonary hypertension)", "A heart attack", "None"],
        ans: 1,
        exp: "The right heart fails because it is trying to pump against high pressure in the lungs."
      },
      {
        q: "How does untreated OSA lead to Cor Pulmonale?",
        options: ["By causing coronary artery disease", "Chronic intermittent hypoxia during apneic events triggers pulmonary vasoconstriction; over years, this leads to fixed pulmonary hypertension and right heart strain", "By causing arrhythmias", "None"],
        ans: 1,
        exp: "Hypoxic pulmonary vasoconstriction is the body's attempt to shunt blood away from poorly ventilated lung zones; in OSA, the whole lung is poorly ventilated."
      },
      {
        q: "Will initiating CPAP therapy reverse the Cor Pulmonale?",
        options: ["Never", "It can halt progression and often partially reverse the pulmonary hypertension and right heart strain if started before irreversible fibrotic changes occur", "It makes it worse", "None"],
        ans: 1,
        exp: "Reversing the hypoxia removes the trigger for pulmonary vasoconstriction."
      }
    ]
  },
  {
    title: "The Resistant Hypertension",
    scenario: "A 45-year-old male is referred by his cardiologist. He has hypertension that remains uncontrolled (160/100) despite taking three different blood pressure medications (Lisinopril, Amlodipine, HCTZ). He snores heavily.\n\nVitals: BP 160/100. BMI 32.\nPhysical Examination: Thick neck, crowded oropharynx.\nLaboratory Results: None.",
    disease: "OSA and Systemic Hypertension",
    questions: [
      {
        q: "Obstructive Sleep Apnea is recognized as the most common cause of what cardiovascular condition?",
        options: ["Aortic dissection", "Secondary (refractory) systemic hypertension", "Endocarditis", "None"],
        ans: 1,
        exp: "Any patient with hypertension resistant to 3 or more drugs MUST be evaluated for OSA."
      },
      {
        q: "What is the physiological mechanism linking OSA to systemic hypertension?",
        options: ["Kidney failure", "Hypoxia and hypercapnia during apneas trigger massive surges of sympathetic nervous system activity (catecholamines), keeping blood pressure chronically elevated even during the day", "High salt diet", "None"],
        ans: 1,
        exp: "The body essentially experiences a 'fight or flight' response hundreds of times a night."
      },
      {
        q: "What characteristic blood pressure pattern is often seen on 24-hour monitoring in patients with OSA?",
        options: ["Nighttime hypotension", "A 'non-dipping' pattern, where the normal 10-20% drop in blood pressure during sleep does not occur", "Only daytime spikes", "None"],
        ans: 1,
        exp: "The lack of nocturnal dipping is a strong predictor of cardiovascular events (strokes, heart attacks)."
      }
    ]
  },
  {
    title: "The Sleepy Driver",
    scenario: "A 50-year-old truck driver is sent for evaluation by his employer. He recently ran a red light because he 'dozed off' for a second. The ENT asks him to fill out a questionnaire grading his likelihood of dozing in various situations (e.g., sitting and reading, riding in a car, sitting inactive in a public place).\n\nVitals: Normal.\nPhysical Examination: Normal.\nLaboratory Results: His questionnaire score is 18/24.",
    disease: "Epworth Sleepiness Scale (ESS)",
    questions: [
      {
        q: "What is the purpose of the Epworth Sleepiness Scale (ESS)?",
        options: ["To diagnose OSA", "To subjectively quantify a patient's level of daytime sleepiness", "To measure oxygen levels", "None"],
        ans: 1,
        exp: "It does not diagnose OSA, but it measures the clinical impact (somnolence). A score > 10 is considered abnormal."
      },
      {
        q: "Why is commercial driving a major concern in patients with untreated severe OSA?",
        options: ["They get lost", "Untreated severe OSA dramatically increases the risk of motor vehicle accidents due to micro-sleeps and delayed reaction times", "They can't see well", "None"],
        ans: 1,
        exp: "Many regulatory bodies require proof of CPAP compliance for commercial drivers diagnosed with OSA."
      },
      {
        q: "What objective test can be used in the sleep lab to measure the tendency to fall asleep during the day?",
        options: ["PSG", "Multiple Sleep Latency Test (MSLT)", "ECG", "None"],
        ans: 1,
        exp: "The MSLT gives the patient 5 nap opportunities. Falling asleep rapidly (e.g., < 8 minutes) indicates pathologic sleepiness."
      }
    ]
  },
  {
    title: "The Pre-Op Screen",
    scenario: "A 60-year-old male is in the pre-operative clinic before an elective hernia repair. The anesthesiologist administers a questionnaire asking if he Snores, is Tired, has Observed apneas, has high blood Pressure, his BMI, Age, Neck circumference, and Gender.\n\nVitals: BP 145/90. BMI 36.\nPhysical Examination: Neck is 17.5 inches.\nLaboratory Results: None.",
    disease: "STOP-BANG Questionnaire",
    questions: [
      {
        q: "What is the STOP-BANG questionnaire used for?",
        options: ["To diagnose asthma", "It is a highly sensitive screening tool to identify patients at high risk for OSA, especially in the pre-operative setting", "To stage cancer", "None"],
        ans: 1,
        exp: "A score of 3 or more indicates high risk and alerts the anesthesia team to potential airway and extubation challenges."
      },
      {
        q: "What does the 'BANG' stand for?",
        options: ["Blood, Age, Nose, Genetics", "BMI (>35), Age (>50), Neck circumference (>16/17in), Gender (Male)", "Breath, Airway, Neck, Girth", "None"],
        ans: 1,
        exp: "These are the four major demographic/physical risk factors for OSA."
      },
      {
        q: "Why is identifying OSA critical for the anesthesiologist?",
        options: ["To charge more", "Patients with OSA are extremely sensitive to opioids/sedatives and are at high risk for post-operative respiratory failure and airway obstruction", "To pick the right antibiotic", "None"],
        ans: 1,
        exp: "They may require CPAP immediately in the recovery room and careful monitoring with avoidance of narcotics."
      }
    ]
  },
  {
    title: "The Hidden Uvula",
    scenario: "A 35-year-old female presents with snoring. The ENT asks her to open her mouth as wide as possible and stick out her tongue without saying 'ah'. The doctor can only see her hard palate; the soft palate, uvula, and tonsillar pillars are completely hidden by the base of the tongue.\n\nVitals: Normal.\nPhysical Examination: Oral cavity exam as described.\nLaboratory Results: None.",
    disease: "Mallampati Classification (OSA Risk)",
    questions: [
      {
        q: "Based on the description, what Mallampati score does this patient have?",
        options: ["Class I", "Class II", "Class IV", "Class III"],
        ans: 3,
        exp: "Class I: entire uvula/tonsils visible. Class II: uvula partially visible. Class III: only base of uvula/soft palate visible. Class IV: only hard palate visible."
      },
      {
        q: "What does a high Mallampati score (Class III or IV) correlate with?",
        options: ["A good singing voice", "A crowded oropharynx, a higher risk of difficult intubation, and a higher risk of Obstructive Sleep Apnea", "Low risk of OSA", "None"],
        ans: 2,
        exp: "It visually demonstrates the disproportion between the size of the tongue and the size of the oral cavity."
      },
      {
        q: "Why is the patient instructed NOT to say 'ah' during the Modified Mallampati exam?",
        options: ["It spreads germs", "Saying 'ah' actively elevates the soft palate, falsely improving the view and leading to an underestimation of crowding", "It makes them gag", "None"],
        ans: 2,
        exp: "The airway must be assessed in its relaxed state."
      }
    ]
  },
  {
    title: "The Cured Child",
    scenario: "A 7-year-old girl with severe OSA (AHI 25) and massive tonsils underwent a tonsillectomy and adenoidectomy (T&A) 6 weeks ago. She returns for a follow-up. Her parents are ecstatic, reporting she sleeps silently, has boundless energy, and her school grades have improved.\n\nVitals: Normal.\nPhysical Examination: Well-healed tonsillar fossae. Clear nasal airway.\nLaboratory Results: None.",
    disease: "Adenotonsillectomy for Pediatric OSA",
    questions: [
      {
        q: "What is the expected cure rate of Adenotonsillectomy for OSA in otherwise healthy, non-obese children?",
        options: ["10%", "Very high, approximately 80-90%", "50%", "None"],
        ans: 2,
        exp: "T&A is highly curative, making it the definitive first-line treatment."
      },
      {
        q: "Is a post-operative sleep study (PSG) routinely required for all children after T&A?",
        options: ["Yes, always", "No, it is typically reserved for children with severe preoperative OSA, obesity, syndromic conditions, or if symptoms persist", "Only if they snore", "None"],
        ans: 2,
        exp: "If a healthy child has complete symptom resolution, a repeat study is unnecessary."
      },
      {
        q: "What life-threatening complication must be monitored for in children with SEVERE preoperative OSA immediately following T&A?",
        options: ["Deafness", "Post-obstructive pulmonary edema (Negative Pressure Pulmonary Edema) and respiratory compromise", "Blindness", "None"],
        ans: 2,
        exp: "Sudden relief of chronic high-grade obstruction can alter pulmonary hemodynamics. These children must be monitored overnight in the hospital."
      }
    ]
  },
  {
    title: "The Persistent Apnea",
    scenario: "A 6-year-old boy with Down Syndrome and severe OSA underwent Adenotonsillectomy 3 months ago. Despite the surgery, his parents report he still snores heavily and has witnessed apneas. A repeat sleep study shows an AHI of 15.\n\nVitals: BMI 85th percentile.\nPhysical Examination: Large, protruding tongue (macroglossia). Midface hypoplasia. Narrow palate.\nLaboratory Results: None.",
    disease: "Persistent OSA in Down Syndrome",
    questions: [
      {
        q: "Why is the success rate of Adenotonsillectomy for OSA significantly lower in children with Down Syndrome compared to healthy children?",
        options: ["Their tonsils grow back instantly", "They have multiple other anatomic/physiologic levels of obstruction: macroglossia, midface hypoplasia, and generalized hypotonia (floppy airway)", "They don't have OSA", "None"],
        ans: 2,
        exp: "T&A only removes one layer of the problem; the floppy, large tongue and small face remain."
      },
      {
        q: "What is a critical diagnostic step for this child to determine the cause of the persistent OSA?",
        options: ["Chest X-ray", "Drug-Induced Sleep Endoscopy (DISE) to dynamically evaluate for tongue base collapse, epiglottic collapse, or laryngomalacia", "Gastric emptying study", "None"],
        ans: 2,
        exp: "DISE is essential in complex/syndromic pediatric patients who fail T&A to guide further targeted surgery or CPAP."
      },
      {
        q: "What is a common conservative therapy for persistent OSA in syndromic children?",
        options: ["Tracheostomy", "CPAP or BiPAP therapy", "Observation", "None"],
        ans: 2,
        exp: "While surgical options (like tongue base reduction) exist, CPAP is the non-invasive standard for persistent disease."
      }
    ]
  },
  {
    title: "The Cephalometric Profile",
    scenario: "A 30-year-old male with severe OSA is undergoing evaluation for maxillomandibular advancement surgery. The surgeon orders a lateral X-ray of the head and neck to take specific bony and soft tissue measurements.\n\nVitals: Normal.\nPhysical Examination: Micrognathia.\nLaboratory Results: Lateral Cephalogram shows SNA angle 78 (normal 82), SNB angle 74 (normal 80), and Posterior Airway Space (PAS) is 6 mm (normal >11mm).",
    disease: "Lateral Cephalometrics in OSA",
    questions: [
      {
        q: "What does a reduced Posterior Airway Space (PAS) on a lateral cephalogram indicate?",
        options: ["Nasal obstruction", "A narrow airway between the base of the tongue and the posterior pharyngeal wall, heavily predisposing to OSA", "Large tonsils", "None"],
        ans: 2,
        exp: "PAS is a classic 2D measurement of retroglossal airway size."
      },
      {
        q: "What do the SNA and SNB angles measure?",
        options: ["Tongue size", "The anterior-posterior position of the maxilla (SNA) and mandible (SNB) relative to the skull base", "Neck thickness", "None"],
        ans: 2,
        exp: "Low angles confirm skeletal retrognathia (the jaws are set too far back), mechanically crowding the airway."
      },
      {
        q: "How does the position of the Hyoid bone relate to OSA severity?",
        options: ["It doesn't", "A lower, more inferiorly positioned hyoid bone correlates with a longer, more collapsible airway and more severe OSA", "A high hyoid is bad", "None"],
        ans: 2,
        exp: "The hyoid anchors the tongue musculature; if it sits low, the tongue base easily falls backward."
      }
    ]
  },
  {
    title: "The Back Sleeper",
    scenario: "A 45-year-old male undergoes a sleep study. The results show an overall AHI of 12. However, looking closely at the data, his AHI is 35 when he sleeps on his back (supine), and his AHI drops to 2 when he sleeps on his side (lateral decubitus).\n\nVitals: BMI 26.\nPhysical Examination: Normal.\nLaboratory Results: Supine AHI = 35. Non-supine AHI = 2.",
    disease: "Positional Obstructive Sleep Apnea",
    questions: [
      {
        q: "What defines Positional OSA?",
        options: ["OSA that only happens standing", "An AHI that is at least twice as high in the supine position compared to the non-supine position (and often normalizes when non-supine)", "OSA in children", "None"],
        ans: 2,
        exp: "Gravity pulls the tongue base and soft palate straight back against the pharyngeal wall when supine."
      },
      {
        q: "What is the simplest, highly effective treatment for this specific patient?",
        options: ["Tracheostomy", "Positional therapy (e.g., wearing a bumper belt or sewing a tennis ball into the back of a pajama shirt to prevent supine sleep)", "CPAP only", "None"],
        ans: 2,
        exp: "If the OSA is strictly positional, keeping them off their back is curative and avoids CPAP or surgery."
      },
      {
        q: "Why is the tongue base the primary culprit in positional OSA?",
        options: ["It grows at night", "The genioglossus muscle relaxes, and gravity pulls the heavy tongue base posteriorly, crushing the airway", "It paralyzes", "None"],
        ans: 2,
        exp: "Turning to the side displaces the tongue laterally, opening the airway."
      }
    ]
  },
  {
    title: "The REM Drops",
    scenario: "A 50-year-old female has a sleep study. Her overall AHI is 14. During NREM sleep, her AHI is 5. However, during periods of REM (Rapid Eye Movement) sleep, her AHI spikes to 45, with severe oxygen desaturations.\n\nVitals: BMI 28.\nPhysical Examination: Normal.\nLaboratory Results: NREM AHI = 5. REM AHI = 45.",
    disease: "REM-Related Obstructive Sleep Apnea",
    questions: [
      {
        q: "Why does Obstructive Sleep Apnea characteristically worsen during REM sleep?",
        options: ["The brain turns off", "REM sleep is characterized by profound skeletal muscle atonia (paralysis), including the pharyngeal dilator muscles, maximizing airway collapsibility", "Dreams cause panic", "None"],
        ans: 2,
        exp: "The diaphragm still works, but the airway muscles lose almost all their tone."
      },
      {
        q: "Which demographic is most classically associated with isolated REM-related OSA?",
        options: ["Elderly men", "Women, particularly pre-menopausal women or younger adults", "Toddlers", "None"],
        ans: 2,
        exp: "Women often present with milder overall AHI but severe clustered events during REM sleep."
      },
      {
        q: "Are the oxygen desaturations typically worse in NREM or REM sleep apneic events?",
        options: ["NREM", "REM sleep events typically have longer durations and more severe oxygen desaturations", "They are the same", "None"],
        ans: 2,
        exp: "Due to muscle atonia, the patient struggles longer to arouse and break the obstruction."
      }
    ]
  },
  {
    title: "The Blocked Nose",
    scenario: "A 40-year-old male with moderate OSA is prescribed CPAP. He returns a week later saying he takes the mask off after 10 minutes because he feels like he is suffocating. He has a history of a broken nose and chronic nasal congestion. He breathes exclusively through his mouth.\n\nVitals: Normal.\nPhysical Examination: Severe leftward septal deviation blocking 90% of the left nasal airway. Bilateral inferior turbinate hypertrophy.\nLaboratory Results: None.",
    disease: "Nasal Obstruction in OSA (Septoplasty/Turbinate Reduction)",
    questions: [
      {
        q: "Does fixing a deviated septum (Septoplasty) cure Obstructive Sleep Apnea?",
        options: ["Yes, completely", "No, isolated nasal surgery rarely cures OSA (it minimally reduces the AHI), as the primary collapse is usually in the palate or tongue base", "Yes, in 90% of cases", "None"],
        ans: 2,
        exp: "Nasal resistance plays a role, but it is almost never the sole cause of OSA."
      },
      {
        q: "If it doesn't cure OSA, why is nasal surgery frequently performed in OSA patients?",
        options: ["Cosmetics", "To drastically improve CPAP tolerance and compliance by allowing the use of a nasal mask and lowering the required CPAP pressure", "To stop bleeding", "None"],
        ans: 2,
        exp: "If a patient can't breathe through their nose, they can't tolerate nasal CPAP, which is much more comfortable than a full face mask."
      },
      {
        q: "According to the Starling resistor model of the airway, how does nasal obstruction worsen downstream palatal collapse?",
        options: ["It doesn't", "High upstream resistance in the nose requires greater negative inspiratory pressure generated by the chest, which sucks the floppy downstream pharynx closed", "It makes it too dry", "None"],
        ans: 2,
        exp: "Breathing through a pinched straw causes the straw to collapse."
      }
    ]
  },
  {
    title: "The Subtle Apnea",
    scenario: "A 55-year-old male complains of severe daytime fatigue. A sleep study shows only 3 true 'apneas' per hour, but he has 20 events per hour where his airflow drops by 40%, accompanied by a 4% drop in oxygen saturation and a brief EEG arousal.\n\nVitals: Normal.\nPhysical Examination: Normal.\nLaboratory Results: AHI = 23.",
    disease: "Hypopnea Definition",
    questions: [
      {
        q: "How does the AASM (American Academy of Sleep Medicine) define a Hypopnea?",
        options: ["Complete stop of breathing", "A reduction in airflow of at least 30% lasting ≥10 seconds, associated with either a ≥3% oxygen desaturation OR an EEG arousal", "A sneeze", "None"],
        ans: 1,
        exp: "Hypopneas are partial obstructions, but they disrupt sleep architecture and cause hypoxia just as effectively as full apneas."
      },
      {
        q: "Why are both apneas and hypopneas included in the AHI calculation?",
        options: ["To make the score higher", "Both cause sleep fragmentation (arousals) and sympathetic surges, leading to the exact same cardiovascular and neurocognitive consequences", "They aren't", "None"],
        ans: 1,
        exp: "A patient with 30 hypopneas per hour is just as sick as a patient with 30 complete apneas per hour."
      },
      {
        q: "What is an EEG 'arousal' in the context of a sleep study?",
        options: ["Waking up and walking around", "An abrupt shift in EEG frequency lasting at least 3 seconds, representing a brief awakening that the patient does not remember, but which shatters sleep architecture", "A nightmare", "None"],
        ans: 1,
        exp: "These micro-arousals are what prevent the patient from getting deep, restorative N3 and REM sleep."
      }
    ]
  },
  {
    title: "The Exhausted Snorer",
    scenario: "A 35-year-old thin female presents with profound daytime fatigue and headaches. Her husband says she snores lightly but never stops breathing. Her sleep study shows an AHI of 3 (normal). However, she has 30 events per hour where her respiratory effort increases steadily until she has a brief EEG arousal, but without any oxygen desaturation or 30% drop in airflow.\n\nVitals: Normal.\nPhysical Examination: Narrow palate.\nLaboratory Results: AHI = 3. RDI = 33.",
    disease: "Upper Airway Resistance Syndrome (UARS)",
    questions: [
      {
        q: "What defines a Respiratory Effort-Related Arousal (RERA)?",
        options: ["An apnea", "A sequence of breaths characterized by increasing respiratory effort leading to an arousal, but which does NOT meet criteria for an apnea or hypopnea", "A yawn", "None"],
        ans: 1,
        exp: "The airway gets tight, the patient struggles harder and harder to pull air through it, and eventually wakes up just enough to open it, without ever dropping their oxygen."
      },
      {
        q: "How does Upper Airway Resistance Syndrome (UARS) differ classically from OSA?",
        options: ["It affects only men", "UARS patients are often young, thin females who suffer severe sleep fragmentation from RERAs, but lack the hypoxia and obesity typical of OSA", "It causes death instantly", "None"],
        ans: 1,
        exp: "UARS is essentially a subtype of sleep-disordered breathing where the primary insult is sleep fragmentation, not hypoxia."
      },
      {
        q: "If the AHI only counts Apneas + Hypopneas, what index includes Apneas + Hypopneas + RERAs?",
        options: ["BMI", "Respiratory Disturbance Index (RDI)", "Heart rate", "None"],
        ans: 1,
        exp: "In UARS, the AHI is normal (<5), but the RDI is elevated."
      }
    ]
  },
  {
    title: "The Syndromic Infant",
    scenario: "A 3-week-old infant is admitted to the NICU with severe failure to thrive, choking during feeds, and severe inspiratory stridor that worsens when he is laid on his back.\n\nVitals: O2 sat 88% on room air.\nPhysical Examination: Severe micrognathia (very small jaw), glossoptosis (tongue falling back), and a U-shaped cleft palate.\nLaboratory Results: Sleep study shows severe OSA.",
    disease: "Pierre Robin Sequence and OSA",
    questions: [
      {
        q: "What is the classic triad of Pierre Robin Sequence?",
        options: ["Deafness, blindness, mutism", "Micrognathia, Glossoptosis, and Cleft Palate (usually U-shaped)", "Large jaw, big tongue, no teeth", "None"],
        ans: 1,
        exp: "The tiny jaw forces the normal-sized tongue backward, blocking the airway and preventing the palate shelves from fusing during development."
      },
      {
        q: "Why do these infants have severe Obstructive Sleep Apnea?",
        options: ["They have big tonsils", "The glossoptosis (posteriorly displaced tongue) physically impacts the posterior pharyngeal wall, completely occluding the airway, especially when supine", "They have asthma", "None"],
        ans: 1,
        exp: "The primary obstruction is at the tongue base due to the small skeletal box."
      },
      {
        q: "What is a common initial, non-surgical intervention to relieve the airway obstruction in a Pierre Robin infant?",
        options: ["Tracheostomy immediately", "Prone positioning (laying the baby on their stomach), allowing gravity to pull the tongue forward out of the airway", "Steroids", "None"],
        ans: 1,
        exp: "If prone positioning fails, surgical options like mandibular distraction osteogenesis or tongue-lip adhesion are considered."
      }
    ]
  },
  {
    title: "The Floppy Airway",
    scenario: "A 4-month-old infant presents with high-pitched inspiratory stridor that has been present since 2 weeks of age. A sleep study is performed because the parents note he snores and occasionally pauses breathing. The sleep study shows mild OSA.\n\nVitals: Normal.\nPhysical Examination: Flexible laryngoscopy while awake shows an omega-shaped epiglottis and short aryepiglottic folds that collapse inward during inspiration.\nLaboratory Results: None.",
    disease: "Laryngomalacia causing OSA",
    questions: [
      {
        q: "While laryngomalacia is primarily a supraglottic issue, can it cause Obstructive Sleep Apnea?",
        options: ["No, it only causes noise", "Yes, the supraglottic collapse can obstruct airflow sufficiently during sleep to cause apneas, hypopneas, and sleep fragmentation", "Only in adults", "None"],
        ans: 1,
        exp: "Severe laryngomalacia is a recognized cause of pediatric OSA."
      },
      {
        q: "If an infant with laryngomalacia has severe OSA, failure to thrive, or right heart strain, what is the surgical treatment of choice?",
        options: ["Tonsillectomy", "Supraglottoplasty (trimming the floppy aryepiglottic folds and epiglottis to widen the supraglottic airway)", "Tracheostomy", "None"],
        ans: 1,
        exp: "Supraglottoplasty relieves the mechanical obstruction and cures the associated OSA in these specific cases."
      },
      {
        q: "How does the presentation of laryngomalacia differ from typical adenotonsillar OSA?",
        options: ["It doesn't", "Laryngomalacia presents in early infancy (weeks old) with inspiratory stridor, whereas adenotonsillar OSA typically peaks between ages 3-6 years", "Laryngomalacia is silent", "None"],
        ans: 1,
        exp: "The timing of onset is a key clinical clue."
      }
    ]
  },
  {
    title: "The Craniofacial Defect",
    scenario: "A 5-year-old boy presents for sleep apnea evaluation. He has downward-slanting eyes, underdeveloped cheekbones, micrognathia, and malformed ears with hearing loss.\n\nVitals: Normal.\nPhysical Examination: Mandibular hypoplasia, malar hypoplasia.\nLaboratory Results: Sleep study confirms severe OSA.",
    disease: "Treacher Collins Syndrome and OSA",
    questions: [
      {
        q: "What genetic condition is described by this classic phenotype (mandibular/malar hypoplasia, down-slanting palpebral fissures, microtia)?",
        options: ["Down Syndrome", "Treacher Collins Syndrome (Mandibulofacial Dysostosis)", "Crouzon Syndrome", "None"],
        ans: 1,
        exp: "It is an autosomal dominant defect in the 1st and 2nd branchial arches."
      },
      {
        q: "Why is OSA universally present and notoriously difficult to treat in Treacher Collins syndrome?",
        options: ["They have huge tonsils", "The severe skeletal hypoplasia of both the midface and mandible severely crowds the pharyngeal airway, often requiring tracheostomy or major skeletal distraction", "They are obese", "None"],
        ans: 1,
        exp: "Soft tissue surgery (like T&A) is almost never sufficient because the bony box enclosing the airway is too small."
      },
      {
        q: "Unlike Treacher Collins, which craniofacial syndromes are characterized primarily by craniosynostosis and severe midface (maxillary) hypoplasia causing OSA?",
        options: ["Marfan Syndrome", "Crouzon Syndrome and Apert Syndrome", "Turner Syndrome", "None"],
        ans: 1,
        exp: "In these syndromes, the maxilla is pushed back, obstructing the nasopharynx."
      }
    ]
  },
  {
    title: "The Stiff Joint",
    scenario: "A 10-year-old boy with a known history of Hurler syndrome (a mucopolysaccharidosis) presents with severe snoring, daytime sleepiness, and witnessed apneas.\n\nVitals: Normal.\nPhysical Examination: Coarse facial features, macroglossia, short neck. Limited neck extension.\nLaboratory Results: Sleep study confirms severe OSA.",
    disease: "Mucopolysaccharidoses (MPS) and OSA",
    questions: [
      {
        q: "What is the primary mechanism of Obstructive Sleep Apnea in Mucopolysaccharidoses (e.g., Hurler, Hunter syndromes)?",
        options: ["Obesity", "Progressive deposition of glycosaminoglycans (GAGs) in the soft tissues of the airway (tongue, tonsils, pharynx) and altered craniofacial skeletal growth", "Asthma", "None"],
        ans: 1,
        exp: "The tissues literally become thickened and infiltrated with metabolic byproducts."
      },
      {
        q: "Why is surgical management of the airway or anesthesia exceptionally dangerous in patients with MPS?",
        options: ["They bleed easily", "GAG deposition causes a rigid, immobile airway and often atlantoaxial (cervical spine) instability, making intubation extremely difficult and risky", "They are allergic to anesthesia", "None"],
        ans: 1,
        exp: "They are notoriously the most difficult airways in pediatric anesthesia."
      },
      {
        q: "Does enzyme replacement therapy (ERT) reliably cure the OSA in MPS patients?",
        options: ["Yes, immediately", "No, while ERT helps systemic symptoms, it often does not fully reverse established airway tissue deposition or skeletal abnormalities", "Yes, in 100% of cases", "None"],
        ans: 1,
        exp: "These patients often require CPAP or tracheostomy despite medical treatment."
      }
    ]
  },
  {
    title: "The Cold and Tired Woman",
    scenario: "A 45-year-old female presents with fatigue, weight gain, constipation, cold intolerance, and heavy snoring that started a year ago. She has no prior history of snoring.\n\nVitals: HR 55. BMI 31.\nPhysical Examination: Enlarged thyroid gland (goiter). Delayed relaxation phase of deep tendon reflexes. Macroglossia is noted.\nLaboratory Results: TSH is 45 mIU/L (High), Free T4 is 0.4 ng/dL (Low).",
    disease: "Hypothyroidism causing OSA",
    questions: [
      {
        q: "How does severe, untreated hypothyroidism contribute to the development of Obstructive Sleep Apnea?",
        options: ["It shrinks the airway", "It causes macroglossia (enlarged tongue due to myxedema/mucopolysaccharide deposition), weight gain, and generalized myopathy of the pharyngeal dilator muscles", "It causes nasal polyps", "None"],
        ans: 1,
        exp: "The tongue gets bigger, the patient gets heavier, and the airway muscles get weaker."
      },
      {
        q: "What is the initial, most appropriate treatment for this patient's OSA?",
        options: ["UPPP", "Levothyroxine (thyroid hormone replacement), which may completely reverse the OSA as the myxedema and weight resolve", "Tracheostomy", "None"],
        ans: 1,
        exp: "Treat the underlying endocrine cause first before considering sleep surgery."
      },
      {
        q: "Can hypothyroidism also cause Central Sleep Apnea?",
        options: ["No", "Yes, severe hypothyroidism blunts the central hypoxic and hypercapnic respiratory drive, potentially causing central apneas or hypoventilation", "Only in men", "None"],
        ans: 1,
        exp: "It is one of the few conditions that can cause a mixed apnea picture via both mechanical and central mechanisms."
      }
    ]
  },
  {
    title: "The Growing Face",
    scenario: "A 50-year-old male presents with severe snoring and witnessed apneas. He mentions his shoe size has increased recently, and his wedding ring no longer fits. He has prominent frontal bossing and a massive jaw.\n\nVitals: BP 150/90.\nPhysical Examination: Prognathism (protruding jaw), macroglossia, spaced teeth, and enlarged, spade-like hands.\nLaboratory Results: IGF-1 level is markedly elevated.",
    disease: "Acromegaly and OSA",
    questions: [
      {
        q: "What is the primary pathophysiology of OSA in patients with Acromegaly?",
        options: ["Weight loss", "Excess growth hormone causes massive soft tissue hypertrophy of the tongue (macroglossia), pharyngeal walls, and larynx, crowding the airway", "Shrinking jaw", "None"],
        ans: 1,
        exp: "Despite having a large, protruding jaw (which usually opens the airway), the sheer bulk of the soft tissue overpowers it."
      },
      {
        q: "What bony change in the face is characteristic of acromegaly?",
        options: ["Micrognathia", "Mandibular prognathism (protruding lower jaw) and widened dental spaces", "Cleft palate", "None"],
        ans: 1,
        exp: "The mandible continues to grow under the influence of excess GH/IGF-1."
      },
      {
        q: "Will CPAP cure the underlying problem?",
        options: ["Yes", "No, CPAP manages the OSA, but definitive treatment requires transsphenoidal surgical resection of the pituitary adenoma secreting Growth Hormone", "Yes, it shrinks the tumor", "None"],
        ans: 1,
        exp: "OSA is a symptom of the systemic endocrine disease."
      }
    ]
  },
  {
    title: "The Big Tongue Base",
    scenario: "A 40-year-old male with severe OSA had a UPPP 2 years ago. His snoring improved, but his sleep study still shows an AHI of 35. DISE reveals massive collapse purely at the base of the tongue. The palate is open.\n\nVitals: BMI 28.\nPhysical Examination: Palate is surgically absent. Oral exam shows a huge tongue base taking up the entire oropharynx.\nLaboratory Results: None.",
    disease: "Lingual Tonsil Hypertrophy / Base of Tongue Collapse",
    questions: [
      {
        q: "Why did the UPPP fail to cure his Obstructive Sleep Apnea?",
        options: ["The surgeon did it wrong", "UPPP only clears the retropalatal airway; it does nothing to address obstruction caused by a large tongue base or lingual tonsils falling backward (retroglossal collapse)", "He ate too much", "None"],
        ans: 1,
        exp: "This is the most common reason for UPPP failure."
      },
      {
        q: "What specific lymphoid tissue resides at the base of the tongue and can hypertrophy to cause OSA?",
        options: ["Palatine tonsils", "Lingual tonsils", "Adenoids", "None"],
        ans: 1,
        exp: "Hypertrophy of the lingual tonsils is a major, often overlooked, cause of lower pharyngeal obstruction."
      },
      {
        q: "What surgical procedure specifically targets this area of collapse?",
        options: ["Septoplasty", "Transoral Robotic Surgery (TORS) for base of tongue reduction / lingual tonsillectomy, or Genioglossus advancement", "Myringotomy", "None"],
        ans: 1,
        exp: "Robotic surgery allows precise removal of the bulky lingual tonsil tissue from the tongue base."
      }
    ]
  },
  {
    title: "The Genial Tubercle",
    scenario: "A 35-year-old male with tongue base collapse on DISE is undergoing surgery to pull the tongue forward without doing a major jaw movement (MMA).\n\nVitals: Normal.\nPhysical Examination: Normal.\nLaboratory Results: None.",
    disease: "Genioglossus Advancement",
    questions: [
      {
        q: "What is the anatomic goal of a Genioglossus Advancement procedure?",
        options: ["To remove the tongue", "To surgically pull the genial tubercle (a bony prominence on the inside of the anterior mandible where the genioglossus muscle attaches) forward, thereby pulling the tongue base forward and opening the airway", "To pull the palate up", "None"],
        ans: 1,
        exp: "It places tension on the tongue muscle, preventing it from falling back during sleep."
      },
      {
        q: "Does this procedure change the patient's dental bite (occlusion)?",
        options: ["Yes, completely", "No, it involves a 'window' osteotomy in the anterior mandible below the tooth roots, pulling the bone fragment and muscle forward without moving the teeth or jaw joint", "Yes, they lose all teeth", "None"],
        ans: 1,
        exp: "This makes it much less morbid than a full Maxillomandibular Advancement (MMA)."
      },
      {
        q: "This procedure is often combined with what other suspension technique to stabilize the airway?",
        options: ["Palate suspension", "Hyoid suspension (tying the hyoid bone forward to the thyroid cartilage or mandible to expand the hypopharynx)", "Ear suspension", "None"],
        ans: 1,
        exp: "The GA and Hyoid suspension are often performed together as 'Phase 1' tongue base surgery."
      }
    ]
  },
  {
    title: "The Broken Architecture",
    scenario: "A 45-year-old male complains that even if he sleeps 10 hours, he wakes up feeling like he hasn't slept at all. His sleep study shows an AHI of 50. The hypnogram (graph of sleep stages) shows he spent 90% of the night in N1 and N2 sleep, and only 2% in REM and 0% in N3.\n\nVitals: Normal.\nPhysical Examination: Normal.\nLaboratory Results: AHI 50. Minimal REM, absent N3 sleep.",
    disease: "Sleep Architecture in OSA",
    questions: [
      {
        q: "What are N3 and REM sleep?",
        options: ["Awake states", "N3 is deep, restorative 'slow-wave' sleep; REM is dream sleep critical for cognitive/memory consolidation", "Coma states", "None"],
        ans: 1,
        exp: "A normal adult spends ~20% in N3 and ~20-25% in REM."
      },
      {
        q: "Why is N3 and REM sleep severely decreased or absent in severe OSA?",
        options: ["The brain doesn't want it", "Every time the patient enters deeper sleep, the airway collapses, causing an apneic event and an immediate EEG arousal, bumping them back into light (N1/N2) sleep to breathe", "They drink too much coffee", "None"],
        ans: 1,
        exp: "They are trapped in a cycle of choking and waking, never reaching deep sleep."
      },
      {
        q: "What phenomenon frequently occurs on the first night a severe OSA patient successfully uses CPAP?",
        options: ["They die", "REM Rebound (a massive, compensatory increase in REM and N3 sleep percentage) as the brain finally gets a chance to enter deep sleep without interruption", "They never sleep again", "None"],
        ans: 1,
        exp: "Patients often report having intense dreams on their first night of CPAP due to REM rebound."
      }
    ]
  },
  {
    title: "The Dropping Pulse",
    scenario: "A 55-year-old male with severe OSA is on a telemetry monitor in the hospital. The nurses frequently call the doctor because his heart rate drops to 30 bpm for 15 seconds at a time during the night. A 12-lead ECG during the day is perfectly normal.\n\nVitals: HR 70 while awake.\nPhysical Examination: Normal.\nLaboratory Results: Telemetry shows nocturnal sinus bradycardia and sinus pauses up to 5 seconds.",
    disease: "Nocturnal Arrhythmias in OSA",
    questions: [
      {
        q: "Why does severe Obstructive Sleep Apnea cause profound bradycardia or sinus pauses during sleep?",
        options: ["Heart attack", "The massive negative intrathoracic pressure generated by struggling against a closed airway (Muller maneuver) causes extreme vagal nerve stimulation, slowing the heart", "Medications", "None"],
        ans: 1,
        exp: "This intense vagal tone during the apnea is followed by a massive sympathetic surge (tachycardia) upon arousal, creating a classic 'brady-tachy' cyclic pattern."
      },
      {
        q: "Should this patient receive a permanent pacemaker for these nocturnal pauses?",
        options: ["Yes, immediately", "No, the primary treatment is CPAP to resolve the airway obstruction; the bradycardia almost always resolves completely once the apneas stop", "Yes, and a defibrillator", "None"],
        ans: 1,
        exp: "Treat the cause (the apnea), not the symptom (the vagal response)."
      },
      {
        q: "Untreated OSA drastically increases the risk of developing which chronic atrial arrhythmia?",
        options: ["Ventricular tachycardia", "Atrial Fibrillation (AFib)", "Heart block", "None"],
        ans: 1,
        exp: "The structural changes to the heart (atrial stretch from negative pressure) and sympathetic surges heavily promote AFib."
      }
    ]
  },
  {
    title: "The Thick Blood",
    scenario: "A 50-year-old obese male presents to his primary care doctor. Routine labs show his Hemoglobin is remarkably high at 19.5 g/dL, and his Hematocrit is 58%. He does not live at high altitude and does not use testosterone.\n\nVitals: BP 145/90. BMI 35.\nPhysical Examination: Plethoric (red) face.\nLaboratory Results: Hgb 19.5, Hct 58%. Erythropoietin (EPO) level is elevated.",
    disease: "Polycythemia secondary to OSA",
    questions: [
      {
        q: "What is the physiological link between Obstructive Sleep Apnea and Secondary Polycythemia?",
        options: ["Bone marrow cancer", "Chronic, repetitive nocturnal hypoxemia stimulates the kidneys to produce excessive Erythropoietin (EPO), driving the bone marrow to overproduce red blood cells", "Dehydration", "None"],
        ans: 1,
        exp: "The body senses the low oxygen at night and tries to compensate by making more oxygen-carrying RBCs."
      },
      {
        q: "Why is a severely elevated Hematocrit (>55%) dangerous?",
        options: ["It causes bleeding", "It drastically increases blood viscosity (hyperviscosity), slowing blood flow and increasing the risk of thrombosis (strokes, heart attacks)", "It causes anemia", "None"],
        ans: 1,
        exp: "Thick blood doesn't flow well through small vessels."
      },
      {
        q: "Will CPAP therapy improve the polycythemia?",
        options: ["No", "Yes, resolving the nocturnal hypoxia removes the stimulus for EPO production, and the hematocrit will gradually normalize", "Only if combined with phlebotomy", "None"],
        ans: 1,
        exp: "Secondary polycythemia from OSA is entirely reversible with adequate CPAP compliance."
      }
    ]
  },
  {
    title: "The Post-Op Crash",
    scenario: "A 60-year-old male with known severe OSA (who rarely uses his CPAP) undergoes an open cholecystectomy under general anesthesia. In the recovery room (PACU), he is given IV Dilaudid (hydromorphone) for pain. Thirty minutes later, the nurse finds him unresponsive, blue, and not breathing.\n\nVitals: SpO2 70%, HR 40.\nPhysical Examination: Unresponsive, severe airway obstruction.\nLaboratory Results: None.",
    disease: "Perioperative Risk in OSA",
    questions: [
      {
        q: "Why are patients with OSA at extreme risk for sudden respiratory arrest in the immediate post-operative period?",
        options: ["They are allergic to anesthesia", "The combination of residual anesthetic muscle relaxation, supine positioning, and opioid analgesics profoundly depresses respiratory drive and exacerbates airway collapse", "They have bad hearts", "None"],
        ans: 1,
        exp: "Opioids specifically blunt the brain's response to hypoxia and hypercapnia, meaning the patient won't wake up when they stop breathing."
      },
      {
        q: "What is a mandatory protocol for a known severe OSA patient in the recovery room?",
        options: ["Discharge them immediately", "Continuous pulse oximetry monitoring, elevation of the head of the bed, and immediate application of their CPAP/BiPAP machine while recovering", "Give them more opioids", "None"],
        ans: 1,
        exp: "They should never be left flat on their back without airway support after receiving narcotics."
      },
      {
        q: "When planning pain management for an OSA patient, what strategy should be maximized?",
        options: ["Maximum IV narcotics", "Multimodal, opioid-sparing analgesia (e.g., NSAIDs, acetaminophen, regional nerve blocks) to minimize respiratory depression", "No pain control", "None"],
        ans: 1,
        exp: "The less narcotic used, the safer the airway."
      }
    ]
  },
  {
    title: "The Tonsil Scale",
    scenario: "A 15-year-old boy is in the clinic for recurrent tonsillitis and snoring. The ENT documents 'Grade 4+ tonsils' in the chart.\n\nVitals: Normal.\nPhysical Examination: Upon opening the mouth, the palatine tonsils are so massive that they are touching each other in the exact midline.\nLaboratory Results: None.",
    disease: "Tonsil Grading Scale",
    questions: [
      {
        q: "What defines Grade 1+ tonsils?",
        options: ["Touching the midline", "Tonsils are visible but hidden entirely behind the anterior tonsillar pillars (occupying <25% of the oropharyngeal width)", "Touching the uvula", "None"],
        ans: 1,
        exp: "Grade 1 is essentially normal, small tonsils."
      },
      {
        q: "What defines Grade 3+ tonsils?",
        options: ["Touching the midline", "Tonsils extend beyond the pillars and occupy 50-75% of the oropharyngeal width, approaching the uvula", "Hidden behind pillars", "None"],
        ans: 1,
        exp: "Grade 3 and 4 are highly correlated with pediatric OSA."
      },
      {
        q: "What defines Grade 4+ tonsils?",
        options: ["Missing", "Tonsils are 'kissing' or touching each other in the midline, occupying >75% of the airway", "Pus covered", "None"],
        ans: 1,
        exp: "This represents near-total mechanical obstruction of the oropharynx."
      }
    ]
  },
  {
    title: "The Red Eyes",
    scenario: "A 55-year-old obese male presents to the ophthalmologist with chronic, severe, bilateral eye irritation, redness, and a mucous discharge every morning. The eye doctor notices that his upper eyelids are incredibly rubbery, lax, and easily flip inside-out (evert) when he pulls them slightly upward.\n\nVitals: BMI 38.\nPhysical Examination: Hyperlaxity of the upper eyelids. Papillary conjunctivitis.\nLaboratory Results: None.",
    disease: "Floppy Eyelid Syndrome",
    questions: [
      {
        q: "Floppy Eyelid Syndrome is highly, specifically associated with what underlying systemic condition?",
        options: ["Diabetes", "Severe Obstructive Sleep Apnea", "Glaucoma", "None"],
        ans: 1,
        exp: "Almost 100% of patients with Floppy Eyelid Syndrome have OSA. It is a massive red flag."
      },
      {
        q: "What is the proposed mechanical cause of the chronic eye irritation in these patients?",
        options: ["Allergies", "Because the lids are floppy, they easily evert (flip inside out) when the patient rubs their face on the pillow during sleep, exposing the conjunctiva to mechanical abrasion and drying", "Infection", "None"],
        ans: 1,
        exp: "The loss of tarsal elastin makes the lids incredibly loose."
      },
      {
        q: "What is the most definitive treatment to stop the progression of the eye disease?",
        options: ["Eye drops only", "Treating the underlying Obstructive Sleep Apnea with CPAP (and sleeping with eye shields)", "Blindness", "None"],
        ans: 1,
        exp: "While surgical tightening of the lids can be done, treating the OSA prevents further elastin degradation."
      }
    ]
  },
  {
    title: "The Acid Reflux",
    scenario: "A 45-year-old male with severe OSA complains of terrible heartburn, a sour taste in his mouth every morning, and chronic throat clearing. He is already taking a PPI, but it doesn't help at night.\n\nVitals: BMI 34.\nPhysical Examination: Erythema of the posterior larynx.\nLaboratory Results: None.",
    disease: "GERD and OSA Relationship",
    questions: [
      {
        q: "What mechanical force during an OSA event actively worsens Gastroesophageal Reflux Disease (GERD)?",
        options: ["Snoring vibrations", "The massive negative intrathoracic pressure generated by struggling against a closed airway literally acts like a vacuum, sucking gastric acid up into the esophagus and pharynx", "Positive pressure", "None"],
        ans: 1,
        exp: "This is why severe OSA patients often have terrible, refractory nighttime reflux."
      },
      {
        q: "If the patient starts using CPAP effectively, what often happens to his GERD symptoms?",
        options: ["They get worse", "They frequently completely resolve, as the CPAP eliminates the negative pressure 'vacuum' effect and physically pushes down on the esophageal sphincter", "No change", "None"],
        ans: 1,
        exp: "Treating the OSA often cures the nighttime GERD."
      },
      {
        q: "Conversely, how can severe GERD/LPR worsen OSA?",
        options: ["It doesn't", "Acid irritating the pharynx and larynx causes mucosal edema and swelling, further narrowing the upper airway", "It causes weight gain", "None"],
        ans: 1,
        exp: "It is a vicious cycle: OSA causes reflux, and reflux worsens OSA."
      }
    ]
  },
  {
    title: "The Bariatric Cure",
    scenario: "A 40-year-old female with morbid obesity (BMI 48) and severe OSA (AHI 65) undergoes a Roux-en-Y gastric bypass. Over the next 18 months, she loses 120 lbs.\n\nVitals: BMI drops to 26.\nPhysical Examination: Massive weight loss.\nLaboratory Results: Repeat sleep study shows AHI = 4.",
    disease: "Weight Loss and OSA",
    questions: [
      {
        q: "What is the relationship between substantial weight loss and OSA severity?",
        options: ["No effect", "Significant weight loss often dramatically reduces the AHI and can completely cure OSA by removing the parapharyngeal fat compressing the airway", "It makes it worse", "None"],
        ans: 1,
        exp: "Bariatric surgery is one of the most effective 'cures' for severe OSA in the morbidly obese."
      },
      {
        q: "Why is an overnight sleep study (PSG) often mandatory BEFORE bariatric surgery?",
        options: ["To check for dreams", "To diagnose and treat OSA with CPAP pre-operatively, drastically reducing the risk of fatal post-operative airway obstruction and respiratory failure", "To make money", "None"],
        ans: 1,
        exp: "Untreated OSA patients are at extremely high risk during the immediate recovery from abdominal surgery."
      },
      {
        q: "Is a 10% reduction in body weight clinically meaningful for OSA?",
        options: ["No", "Yes, even a 10% weight loss can lead to a 20-30% reduction in the AHI", "Only in men", "None"],
        ans: 1,
        exp: "Fat in the neck is mobilized early during weight loss."
      }
    ]
  },
  {
    title: "The Nightcap",
    scenario: "A 35-year-old male has mild, asymptomatic OSA (AHI 8). However, his wife notes that on Friday nights, when he drinks 4 or 5 beers before bed, his snoring becomes violently loud and he stops breathing frequently.\n\nVitals: Normal.\nPhysical Examination: Normal.\nLaboratory Results: None.",
    disease: "Alcohol and Sedatives Worsening OSA",
    questions: [
      {
        q: "How does alcohol consumption prior to sleep mechanically worsen OSA?",
        options: ["It causes weight gain", "Alcohol is a central nervous system depressant and a muscle relaxant; it directly decreases the tone of the pharyngeal dilator muscles, making the airway much more collapsible", "It inflames the tonsils", "None"],
        ans: 1,
        exp: "It essentially turns a mild, sturdy airway into a floppy, easily collapsible one."
      },
      {
        q: "How does alcohol affect the brain's response to an apneic event?",
        options: ["It makes the brain wake up faster", "It blunts the arousal response to hypoxia and hypercapnia, meaning the apneas last significantly longer before the patient wakes up to breathe", "It prevents dreams", "None"],
        ans: 1,
        exp: "The events are both more frequent and much more severe (longer duration, deeper oxygen desaturation)."
      },
      {
        q: "What other common class of medications has the exact same detrimental effect on OSA?",
        options: ["Antibiotics", "Benzodiazepines and other sedative-hypnotics", "Statins", "None"],
        ans: 1,
        exp: "Prescribing sleeping pills to a snorer can be dangerous, as it worsens the underlying obstruction."
      }
    ]
  },
  {
    title: "The OSA Summary",
    scenario: "A 4th-year medical student is reviewing Obstructive Sleep Apnea for the board exam.\n\nVitals: Normal.\nPhysical Examination: Focused.\nLaboratory Results: None.",
    disease: "OSA High-Yield Review",
    questions: [
      {
        q: "What is the absolute best, most definitive, non-surgical treatment for OSA?",
        options: ["Dental appliance", "CPAP (Continuous Positive Airway Pressure)", "Weight loss supplements", "None"],
        ans: 1,
        exp: "CPAP is the gold standard and near 100% effective if tolerated."
      },
      {
        q: "What is the most effective surgical treatment for pediatric OSA?",
        options: ["UPPP", "Adenotonsillectomy", "MMA", "None"],
        ans: 1,
        exp: "It cures 80-90% of healthy children with OSA."
      },
      {
        q: "What is the most effective (highest success rate) skeletal surgery for adult OSA?",
        options: ["Septoplasty", "Maxillomandibular Advancement (MMA)", "UPPP", "None"],
        ans: 1,
        exp: "MMA fundamentally expands the entire pharyngeal airway."
      }
    ]
  }
];

let sql = `-- ENT (Otolaryngology): Obstructive Sleep Apnea
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ent-sleep-apnea
-- Sourced/Inspired by: Cummings, Scott-Brown, Bailey, Lalwani

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ent-sleep-apnea' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ent-sleep-apnea';
    END IF;

`;

cases.forEach((c, idx) => {
  let caseNum = (idx + 1).toString().padStart(2, '0');
  
  let scenarioEscaped = c.scenario.replace(/'/g, "''");
  let diseaseEscaped = c.disease.replace(/'/g, "''");
  let titleEscaped = c.title.replace(/'/g, "''");

  sql += `    ---------------------------------------------------------------------------
    -- CASE ${caseNum}: ${diseaseEscaped}
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = '${titleEscaped}' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, '${titleEscaped}', '${scenarioEscaped}', ${idx + 1}) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = '${scenarioEscaped}', "order" = ${idx + 1} WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
`;

  c.questions.forEach((q, qIdx) => {
    let questionEscaped = q.q.replace(/'/g, "''");
    let optionsJson = JSON.stringify(q.options);
    let optionsEscaped = optionsJson.replace(/'/g, "''");
    let expEscaped = q.exp.replace(/'/g, "''");
    
    let line = `    (v_case_id, '${questionEscaped}', '${optionsEscaped}', ${q.ans}, '${expEscaped}')`;
    if (qIdx === c.questions.length - 1) {
      line += `;`;
    } else {
      line += `,`;
    }
    sql += line + '\n';
  });
  sql += '\n';
});

sql += `END $$;
COMMIT;
`;

fs.writeFileSync('c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\ent_sleep_apnea_caseblocks_50.sql', sql);
console.log("Successfully wrote ent_sleep_apnea_caseblocks_50.sql!");
