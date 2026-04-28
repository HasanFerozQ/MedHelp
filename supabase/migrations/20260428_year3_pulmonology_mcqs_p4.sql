-- Migration: Year 3 - Pulmonology MCQ Bank (PART 4: 241-320)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-28

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'pulmonology' LIMIT 1;

    -- SECTION 25: PULMONARY EMBOLISM (PE) & DVT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '241: What is the most common symptom of Pulmonary Embolism (PE)?', '["Cough", "Dyspnea (Shortness of breath)", "Chest pain", "Hemoptysis"]', 1, 'Sudden-onset dyspnea is the most frequent symptom. (Harrison''s Ch. 283)'),
    (v_topic_id, '242: "Virchow''s Triad" for venous thrombosis includes stasis, endothelial injury, and:', '["Hypertension", "Hypercoagulability", "Old age", "Smoking"]', 1, 'The three primary factors predisposing to DVT. (Step-Up)'),
    (v_topic_id, '243: What is the most common ECG finding in Pulmonary Embolism?', '["S1Q3T3 pattern", "Sinus Tachycardia", "Right Bundle Branch Block", "Atrial Fibrillation"]', 1, 'While S1Q3T3 is classic, sinus tachycardia is far more common. (Pocket Medicine)'),
    (v_topic_id, '244: "Westermark sign" and "Hampton Hump" on Chest X-ray are signs of:', '["Pneumonia", "Pulmonary Embolism", "Heart failure", "TB"]', 1, 'Westermark is focal oligemia; Hampton Hump is a wedge-shaped infarct. (Harrison''s Ch. 283)'),
    (v_topic_id, '245: What is the gold standard diagnostic test for Pulmonary Embolism?', '["Chest X-ray", "CT Pulmonary Angiography (CTPA)", "V/Q Scan", "D-dimer"]', 1, 'Highly sensitive and specific for visualization of the clot. (Step-Up)'),
    (v_topic_id, '246: A "Normal" D-dimer test is most useful for:', '["Confirming PE in high-risk patients", "Excluding PE in low-risk patients", "Monitoring treatment", "Staging cancer"]', 1, 'High negative predictive value in low-probability cases. (Pocket Medicine)'),
    (v_topic_id, '247: What is the initial treatment of choice for a hemodynamically STABLE patient with PE?', '["Thrombolytics (Alteplase)", "Anticoagulation (e.g., LMWH or DOAC)", "Inferior Vena Cava (IVC) filter", "Surgery"]', 1, 'Anticoagulation prevents further clot formation. (Harrison''s Ch. 283)'),
    (v_topic_id, '248: Hemodynamic instability (Shock) in a patient with PE is an indication for:', '["LMWH", "Systemic Thrombolysis (Alteplase)", "Warfarin", "Observation"]', 1, 'Immediate reperfusion is needed for massive PE. (Pocket Medicine)'),
    (v_topic_id, '249: In a pregnant patient with suspected PE, which test is generally preferred first to avoid radiation to the fetus?', '["CTPA", "Compression Ultrasound of the legs (DVT check)", "V/Q Scan", "MRI"]', 1, 'If DVT is found, the patient is treated for VTE regardless of PE confirmation. (Harrison''s Ch. 283)'),
    (v_topic_id, '250: The "Modified Wells Score" is used to assess the clinical probability of:', '["Asthma severity", "Pulmonary Embolism", "Pneumonia mortality", "Lung cancer risk"]', 1, 'Guides the diagnostic pathway (D-dimer vs. Imaging). (Step-Up)');

    -- SECTION 26: PULMONARY HYPERTENSION (PH)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '251: Pulmonary Hypertension is defined as a mean Pulmonary Artery Pressure (mPAP) >:', '["15 mmHg", "20 mmHg (2022-2025 guidelines)", "25 mmHg", "30 mmHg"]', 1, 'The threshold was recently lowered from 25 to 20 mmHg. (Harrison''s Ch. 282 / ESC Guidelines)'),
    (v_topic_id, '252: "Group 1" Pulmonary Hypertension is also known as:', '["PH due to left heart disease", "Pulmonary Arterial Hypertension (PAH)", "PH due to lung disease", "Chronic Thromboembolic PH (CTEPH)"]', 1, 'Includes idiopathic and drug/toxin-induced PAH. (Harrison''s Ch. 282)'),
    (v_topic_id, '253: What is the most common cause of Pulmonary Hypertension (Group 2)?', '["Smoking", "Left-sided heart disease (e.g., HFrEF, Valvular disease)", "Pulmonary Embolism", "Connective tissue disease"]', 1, 'Venous hypertension from the left side backs up into the lungs. (Step-Up)'),
    (v_topic_id, '254: Which physical exam finding suggests Right Heart Failure (Cor Pulmonale) due to PH?', '["Loud P2 heart sound, JVP elevation, and peripheral edema", "S3 gallop at the apex", "Lung crackles", "Bradycardia"]', 0, 'Signs of increased right-sided pressures. (Pocket Medicine)'),
    (v_topic_id, '255: "CTEPH" (Group 4 PH) is unique because it is often potentially:', '["Cured by steroids", "Cured by surgical pulmonary thromboendarterectomy", "Fatal within 1 week", "Asymptomatic"]', 1, 'A surgically treatable form of PH. (Harrison''s Ch. 282)'),
    (v_topic_id, '256: Which medication class is a foundational treatment for PAH (Group 1)?', '["Beta-blockers", "Endothelin Receptor Antagonists (e.g., Bosentan)", "Statins", "ACE inhibitors"]', 1, 'Also PDE-5 inhibitors and Prostacyclin analogues. (Pocket Medicine)'),
    (v_topic_id, '257: What is the gold standard test to confirm the diagnosis and measure pressures in PH?', '["Echocardiogram", "Right Heart Catheterization", "Chest CT", "Spirometry"]', 1, 'Provides direct measurement of mPAP and PCWP. (Harrison''s Ch. 282)'),
    (v_topic_id, '258: "Schistosomiasis" is a major cause of PH in:', '["Europe", "Developing countries (endemic areas)", "USA", "Australia"]', 1, 'One of the most common causes of PAH worldwide. (Step-Up)'),
    (v_topic_id, '259: Why are Beta-blockers and ACE inhibitors generally NOT recommended for Group 1 PAH?', '["They cause lung cancer", "They may worsen hemodynamics without benefit", "They are too expensive", "They cause cough"]', 1, 'Management of PAH is very specific and differs from left heart failure. (Pocket Medicine)'),
    (v_topic_id, '260: "Ambrisentan" and "Macitentan" belong to which drug class?', '["PDE-5 inhibitors", "Endothelin Receptor Antagonists", "Prostacyclins", "Diuretics"]', 1, 'Used to reduce pulmonary vascular resistance. (Harrison''s Ch. 282)');

    -- SECTION 27: SLEEP APNEA & HYPOVENTILATION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '261: What is the most common type of sleep apnea?', '["Central Sleep Apnea", "Obstructive Sleep Apnea (OSA)", "Complex Sleep Apnea", "Mixed"]', 1, 'Due to collapse of the upper airway during sleep. (Harrison''s Ch. 296)'),
    (v_topic_id, '262: The "Apnea-Hypopnea Index" (AHI) of >= 15 is generally considered:', '["Normal", "Mild OSA", "Moderate OSA", "Severe OSA"]', 2, '5-15 is mild, 15-30 is moderate, >30 is severe. (Step-Up)'),
    (v_topic_id, '263: What is the strongest risk factor for Obstructive Sleep Apnea?', '["Smoking", "Obesity", "Asthma", "Young age"]', 1, 'Increased neck circumference contributes to airway collapse. (Harrison''s Ch. 296)'),
    (v_topic_id, '264: What is the first-line treatment for symptomatic moderate-to-severe OSA?', '["Oxygen therapy", "Continuous Positive Airway Pressure (CPAP)", "Weight loss alone", "Surgery"]', 1, 'CPAP acts as a pneumatic splint to keep the airway open. (Pocket Medicine)'),
    (v_topic_id, '265: Daytime somnolence, morning headaches, and loud snoring are classic for:', '["Narcolepsy", "Obstructive Sleep Apnea", "Insomnia", "Anemia"]', 1, 'Disrupted sleep architecture leads to daytime symptoms. (Step-Up)'),
    (v_topic_id, '266: "Central Sleep Apnea" is characterized by:', '["Snoring", "Lack of respiratory effort from the brain", "Enlarged tonsils", "Obesity"]', 1, 'Unlike OSA, there is no drive to breathe. (Harrison''s Ch. 296)'),
    (v_topic_id, '267: "Cheyne-Stokes breathing" is a specific form of sleep apnea often seen in:', '["Asthma", "Heart Failure", "Pneumonia", "Liver failure"]', 1, 'Associated with Central Sleep Apnea. (Harrison''s)'),
    (v_topic_id, '268: Long-term untreated OSA is a major risk factor for:', '["Hypertension and AFib", "Lung cancer", "TB", "Asthma"]', 0, 'Significant cardiovascular morbidity. (Pocket Medicine)'),
    (v_topic_id, '269: What is the gold standard diagnostic test for sleep apnea?', '["Neck X-ray", "Polysomnography (Sleep Study)", "Spirometry", "Blood gas"]', 1, 'Monitors airflow, O2 sats, and EEG. (Harrison''s Ch. 296)'),
    (v_topic_id, '270: "Mallampati score" is used to assess:', '["Lung function", "Airway visibility and risk of OSA/difficult intubation", "Heart failure", "Pneumonia"]', 1, 'Higher scores (3 or 4) are associated with OSA. (Step-Up)');

    -- SECTION 28: ARDS & ACUTE RESPIRATORY FAILURE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '271: "Acute Respiratory Distress Syndrome" (ARDS) is defined by a P/F ratio (PaO2/FiO2) of <:', '["100", "300", "500", "200"]', 1, 'The Berlin Definition uses 300 as the threshold. (Harrison''s Ch. 301)'),
    (v_topic_id, '272: ARDS involves non-cardiogenic pulmonary edema due to:', '["High heart pressure", "Increased alveolar-capillary permeability", "Low protein", "Too much salt"]', 1, 'Inflammation causes "leaky" vessels. (Step-Up)'),
    (v_topic_id, '273: What is the most common cause of ARDS?', '["Drowning", "Sepsis", "Multiple fractures", "Smoke inhalation"]', 1, 'Sepsis (especially from a pulmonary source) is the leading trigger. (Harrison''s Ch. 301)'),
    (v_topic_id, '274: Which ventilator strategy has a proven mortality benefit in ARDS?', '["High tidal volumes", "Low tidal volume ventilation (6 mL/kg)", "100% Oxygen constantly", "No PEEP"]', 1, 'The ARDSNet trial showed 6 mL/kg (ideal body weight) reduces mortality. (Pocket Medicine)'),
    (v_topic_id, '275: "Prone positioning" in severe ARDS helps by:', '["Reducing pain", "Improving V/Q matching and reducing lung compression", "Easier feeding", "Preventing pressure sores"]', 1, 'Turning the patient on their stomach can significantly improve oxygenation. (Harrison''s Ch. 301)'),
    (v_topic_id, '276: Type 1 Respiratory Failure is defined as:', '["Hypercapnic (High CO2)", "Hypoxemic (Low O2) with normal/low CO2", "Mixed", "Due to drugs"]', 1, 'Usually due to V/Q mismatch or shunt. (Step-Up)'),
    (v_topic_id, '277: Type 2 Respiratory Failure is defined as:', '["Hypoxemic", "Hypercapnic (High CO2)", "Normal gas", "None"]', 1, 'Due to "pump failure" or hypoventilation (e.g., COPD, neuromuscular). (Pocket Medicine)'),
    (v_topic_id, '278: "PEEP" (Positive End-Expiratory Pressure) on a ventilator helps by:', '["Reducing airway pressure", "Keeping alveoli open at the end of expiration", "Warming the air", "Removing CO2"]', 1, 'Prevents alveolar collapse (atelectasis). (Step-Up)'),
    (v_topic_id, '279: Which finding distinguishes ARDS from cardiogenic pulmonary edema?', '["Crackles", "Hypoxemia", "PCWP <= 18 mmHg (or absence of left atrial hypertension)", "Bilateral opacities"]', 2, 'ARDS is non-cardiogenic. (Harrison''s Ch. 301)'),
    (v_topic_id, '280: "Diffuse Alveolar Damage" (DAD) is the pathological hallmark of:', '["Asthma", "ARDS", "COPD", "Lung cancer"]', 1, 'Includes hyaline membrane formation. (Harrison''s Ch. 301)');

    -- SECTION 29: MECHANICAL VENTILATION & CRITICAL CARE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '281: In "Assist-Control" (AC) ventilation, every breath (including patient-triggered ones) is:', '["Variable", "A full-preset tidal volume", "Just a small puff", "Random"]', 1, 'Provides maximum support. (Harrison''s Ch. 302)'),
    (v_topic_id, '282: "Pressure Support" (PS) ventilation is primarily used to:', '["Replace the lungs", "Assist the patient''s spontaneous efforts during weaning", "Increase CO2", "None"]', 1, 'The patient determines the rate and duration. (Step-Up)'),
    (v_topic_id, '283: "Auto-PEEP" (Intrinsic PEEP) occurs when:', '["The ventilator is set too high", "There is incomplete exhalation before the next breath begins", "The patient is breathing too slow", "The tube is blocked"]', 1, 'Common in obstructive diseases like COPD/Asthma. (Pocket Medicine)'),
    (v_topic_id, '284: What is the most common complication of mechanical ventilation?', '["Liver failure", "Ventilator-Associated Pneumonia (VAP)", "Deafness", "Blindness"]', 1, 'Infection occurring >48 hours after intubation. (Step-Up)'),
    (v_topic_id, '285: "Barotrauma" from a ventilator refers to:', '["Infection", "Lung injury due to high pressures (e.g., Pneumothorax)", "High BP", "Drug reaction"]', 1, 'Physical damage from overdistension. (Harrison''s Ch. 302)'),
    (v_topic_id, '286: Which parameter is the best predictor of successful weaning from a ventilator?', '["Heart rate", "Rapid Shallow Breathing Index (RSBI = f/Vt)", "Fever", "Age"]', 1, 'An RSBI < 105 is a good indicator of weaning success. (Pocket Medicine)'),
    (v_topic_id, '287: "NIV" (Non-invasive Ventilation, e.g., BiPAP) is first-line for which condition?', '["Cardiac arrest", "COPD exacerbation with respiratory acidosis", "Lung cancer", "Pulmonary fibrosis"]', 1, 'Avoids the need for intubation in many cases. (Step-Up)'),
    (v_topic_id, '288: A "SBT" (Spontaneous Breathing Trial) is used to:', '["Test for asthma", "Assess if a patient is ready for extubation", "Check for pneumonia", "None"]', 1, 'Patient breathes through the tube with minimal support. (Harrison''s Ch. 302)'),
    (v_topic_id, '289: In "Volume Control" ventilation, which variable is the "dependent" variable (the one that varies)?', '["Tidal volume", "Airway pressure", "Flow rate", "FiO2"]', 1, 'Pressure will change based on lung compliance and resistance. (Pocket Medicine)'),
    (v_topic_id, '290: What is the goal FiO2 during long-term mechanical ventilation to avoid oxygen toxicity?', '["100%", "90%", "< 60%", "21%"]', 2, 'Goal is to maintain SpO2 88-92% or 92-96% with the lowest FiO2 possible. (Step-Up)');

    -- SECTION 30: MISC PULM (TRANSPLANT, RARE GASES)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '291: What is the most common indication for lung transplantation?', '["COPD", "Idiopathic Pulmonary Fibrosis (IPF)", "Cystic Fibrosis", "Pulmonary HTN"]', 1, 'IPF and COPD are the top indications. (Harrison''s Ch. 294)'),
    (v_topic_id, '292: "Bronchiolitis Obliterans Syndrome" (BOS) is a sign of:', '["Acute rejection", "Chronic rejection after lung transplant", "Pneumonia", "Cancer"]', 1, 'Major cause of long-term failure in transplant patients. (Pocket Medicine)'),
    (v_topic_id, '293: "Nitric Oxide" inhalation is used to:', '["Dilate bronchi", "Selectively dilate pulmonary vessels", "Increase CO2", "Numb the throat"]', 1, 'Used in refractory pulmonary hypertension or hypoxemia. (Step-Up)'),
    (v_topic_id, '294: "Heliox" (Helium-Oxygen mixture) is useful in severe airway obstruction because it:', '["Cures the inflammation", "Reduces gas density and turbulent flow", "Is cheaper", "Smells better"]', 1, 'Decreases the work of breathing. (Harrison''s Ch. 287)'),
    (v_topic_id, '295: "Hyperbaric Oxygen" therapy is the treatment of choice for:', '["Asthma", "Carbon Monoxide (CO) poisoning", "COPD", "Pneumonia"]', 1, 'Accelerates the clearance of carboxyhemoglobin. (Step-Up)'),
    (v_topic_id, '296: "Fat Embolism Syndrome" is classic after:', '["Childbirth", "Long bone fractures (e.g., Femur)", "Diving", "Smoking"]', 1, 'Triad of dyspnea, petechiae, and neurological changes. (Pocket Medicine)'),
    (v_topic_id, '297: "Amniotic Fluid Embolism" presents as:', '["Slow onset", "Sudden catastrophic collapse during or shortly after labor", "Fever", "Cough"]', 1, 'Causes profound shock and DIC. (Harrison''s Ch. 283)'),
    (v_topic_id, '298: "Decompression Sickness" (The Bends) is caused by bubbles of which gas?', '["Oxygen", "Nitrogen", "CO2", "Helium"]', 1, 'Occurs when surfacing too quickly from a dive. (Step-Up)'),
    (v_topic_id, '299: A "High-altitude pulmonary edema" (HAPE) is treated by:', '["Giving fluids", "Rapid descent and supplemental Oxygen", "Antibiotics", "Steroids alone"]', 1, 'Descent is the priority. (Pocket Medicine)'),
    (v_topic_id, '300: What is the primary physiological change at high altitude?', '["High CO2", "Hypobaric Hypoxia (Low inspired partial pressure of O2)", "High Nitrogen", "None"]', 1, 'Total pressure decreases, and so does PO2. (Harrison''s Ch. 284)');

    -- FINAL MISC (301-320)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '301: Which valvular heart disease is most likely to cause pulmonary edema?', '["Aortic Stenosis", "Mitral Stenosis", "Tricuspid Regurg", "Pulmonary Stenosis"]', 1, 'Increases left atrial and pulmonary venous pressures. (Harrison''s Ch. 273)'),
    (v_topic_id, '302: "Pulmonary Sequestration" is an area of lung tissue that:', '["Has no connection to the bronchial tree and has its own systemic blood supply", "Is cancerous", "Is infected", "Is full of air"]', 0, 'Congenital anomaly. (Step-Up)'),
    (v_topic_id, '303: Which pathogen is famously associated with cystic lung lesions and pneumothorax in AIDS?', '["S. pneumoniae", "Pneumocystis jirovecii", "Legionella", "Mycoplasma"]', 1, 'PCP can cause thin-walled pneumatoceles. (Harrison''s Ch. 210)'),
    (v_topic_id, '304: "Scimitar Syndrome" involves an anomalous pulmonary vein draining into the:', '["Left Atrium", "Inferior Vena Cava (IVC)", "Aorta", "Portal Vein"]', 1, 'Often associated with a hypoplastic right lung. (Pocket Medicine)'),
    (v_topic_id, '305: A "Pleural friction rub" is best heard during:', '["Inspiration", "Expiration", "Both inspiration and expiration", "Apnea"]', 2, 'Indicates inflamed pleural surfaces rubbing together. (Step-Up)'),
    (v_topic_id, '306: Which heart sound is often accentuated in pulmonary hypertension?', '["S1", "Loud P2", "Opening snap", "S4"]', 1, 'Reflects forceful closure of the pulmonary valve. (Harrison''s Ch. 282)'),
    (v_topic_id, '307: "Right axis deviation" on ECG in a COPD patient suggests:', '["Left heart failure", "Cor Pulmonale (Right ventricular hypertrophy)", "Normal finding", "Old MI"]', 1, 'Common sign of chronic right-sided strain. (Pocket Medicine)'),
    (v_topic_id, '308: What is the "Gold Standard" for measuring oxygen saturation?', '["Pulse Oximetry", "Arterial Blood Gas (ABG)", "Venous Blood Gas", "Skin color"]', 1, 'Directly measures the partial pressure and saturation in arterial blood. (Step-Up)'),
    (v_topic_id, '309: Which lung volume is increased in a patient with a "Barrel Chest"?', '["FVC", "Residual Volume (RV)", "Inspiratory Capacity", "None"]', 1, 'Due to air trapping and loss of elastic recoil. (Harrison''s Ch. 286)'),
    (v_topic_id, '310: What is the primary risk of "Oxygen therapy" in a chronic CO2 retainer (COPD)?', '["Lung cancer", "Suppression of the hypoxic respiratory drive and worsening hypercapnia", "Infection", "Bleeding"]', 1, 'Requires careful titration of O2. (Harrison''s Ch. 286)'),
    (v_topic_id, '311: "Atelectasis" refers to:', '["Lung infection", "Collapse of lung tissue", "Fluid in the lung", "Air in the pleura"]', 1, 'Common post-operatively. (Step-Up)'),
    (v_topic_id, '312: Which physical maneuver helps prevent post-operative atelectasis?', '["Incentive Spirometry", "Complete bed rest", "Cough suppressants", "Heavy sedation"]', 0, 'Encourages deep breathing and alveolar expansion. (Pocket Medicine)'),
    (v_topic_id, '313: "Hilar overlay sign" is used on a Chest X-ray to distinguish:', '["Pneumonia from cancer", "A hilar mass from an enlarged pulmonary artery", "Fluid from air", "TB from fungal"]', 1, 'Helps localize the lesion. (Harrison''s)'),
    (v_topic_id, '314: "Bronchopulmonary Dysplasia" (BPD) is a chronic lung disease seen in:', '["Smokers", "Premature infants who received mechanical ventilation/O2", "Elderly", "Farmers"]', 1, 'Due to injury to the developing lung. (Step-Up)'),
    (v_topic_id, '315: Which drug is a potent inhibitor of "Pulmonary Vasoconstriction"?', '["Sildenafil", "Epinephrine", "Propranolol", "Digoxin"]', 0, 'Used to treat pulmonary hypertension. (Harrison''s Ch. 282)'),
    (v_topic_id, '316: "Chylothorax" fluid will be rich in:', '["Proteins", "Triglycerides", "Glucose", "Red blood cells"]', 1, 'Usually > 110 mg/dL. (Pocket Medicine)'),
    (v_topic_id, '317: "Silicosis" increases the risk of which infectious disease?', '["Asthma", "Tuberculosis", "Legionella", "Influenza"]', 1, 'Silica is toxic to alveolar macrophages, impairing TB defense. (Harrison''s Ch. 290)'),
    (v_topic_id, '318: "Bilateral crackles" and "orthopnea" most likely suggest:', '["Pneumonia", "Pulmonary Edema", "Pneumothorax", "Asthma"]', 1, 'Classic findings of fluid in the alveoli. (Step-Up)'),
    (v_topic_id, '319: What is the best initial imaging for a suspected pleural effusion?', '["CT scan", "Chest X-ray (including lateral decubitus)", "Ultrasound", "MRI"]', 1, 'Decubitus films show if the fluid is free-flowing. (Pocket Medicine)'),
    (v_topic_id, '320: The "Signet ring sign" on CT is diagnostic of:', '["Lung cancer", "Bronchiectasis", "Pneumonia", "PE"]', 1, 'A dilated bronchus accompanied by a smaller pulmonary artery branch. (Harrison''s Ch. 288)');

    RAISE NOTICE 'SUCCESS: Pulmonology MCQ Part 4 (241-320) registered.';
END $$;

COMMIT;
