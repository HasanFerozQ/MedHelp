-- Batch 4: Cardiac Emergencies (181-240)
-- Topic: Cardiac Emergencies (Year 4 Emergency Medicine)
-- Focus: Acute Heart Failure, Pulmonary Edema, Cardiogenic Shock

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-cardiac-emergencies' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A 72-year-old female with a history of HTN and CAD presents with severe dyspnea and orthopnea. BP 210/120, HR 125, SpO2 84%. PE: Diaphoretic, rales halfway up the lungs, 3+ pitting edema. CXR shows "bat-wing" hilar opacities. What is the most appropriate first-line intervention?', '["Furosemide 80mg IV", "Morphine 4mg IV", "Non-invasive Positive Pressure Ventilation (CPAP)", "Intubation and mechanical ventilation"]', 2, 'NIPPV (CPAP or BiPAP) is the most critical first step for Sympathetic Crashing Acute Pulmonary Edema (SCAPE). It reduces work of breathing and decreases preload/afterload immediately.'),
        (topic_id_val, 'In the patient above, which pharmacological intervention is most effective for rapid afterload reduction to resolve the pulmonary edema?', '["Low-dose Nitroglycerin (0.4mg SL every 5 mins)", "High-dose Nitroglycerin infusion (e.g., 200 mcg/min)", "IV Hydralazine", "IV Metoprolol"]', 1, 'In hypertensive pulmonary edema (SCAPE), high-dose nitroglycerin is required for rapid vasodilation to shift blood volume out of the pulmonary circulation.'),
        (topic_id_val, 'A 60-year-old male with an EF of 20% presents with BP 70/40, HR 115, and cool extremities. He was recently started on a new beta-blocker. What is the most likely diagnosis?', '["Septic Shock", "Hypovolemic Shock", "Cardiogenic Shock", "Anaphylactic Shock"]', 2, 'Cardiogenic shock is characterized by low cardiac output (hypotension, cool extremities) despite adequate intravascular volume, often triggered by pump failure or negative inotropes.'),
        (topic_id_val, 'Which vasopressor is preferred in cardiogenic shock when the patient has severe hypotension (MAP < 60) to improve coronary perfusion pressure?', '["Dopamine", "Norepinephrine", "Dobutamine", "Isoproterenol"]', 1, 'Norepinephrine is the first-line vasopressor in cardiogenic shock with severe hypotension as it has fewer tachyarrhythmia complications compared to dopamine.'),
        (topic_id_val, 'A patient with heart failure presents with increased SOB. BNP is 1800 pg/mL (N < 100). What does this laboratory finding primarily reflect?', '["Ventricular wall stretch", "Atrial pressure", "Kidney failure", "Myocardial ischemia"]', 0, 'B-type Natriuretic Peptide (BNP) is released by the ventricles in response to increased wall tension and stretch, making it a sensitive marker for heart failure exacerbation.'),
        (topic_id_val, 'A 55-year-old male with chronic HFrEF presents with SOB. ECG shows Sinus Tachycardia and a LBBB. Troponin is elevated. He is stable but "wet" on exam. What should be avoided in the acute phase?', '["IV Furosemide", "Oxygen", "Beta-blocker up-titration", "Nitroglycerin"]', 2, 'Beta-blockers should not be started or up-titrated during an acute decompensated heart failure episode as they can further decrease cardiac output.'),
        (topic_id_val, 'What is the role of Dobutamine in the management of cardiogenic shock?', '["Vasoconstriction to increase BP", "Inotropic support to increase contractility", "Diuresis", "Rate control"]', 1, 'Dobutamine is an inotrope that increases myocardial contractility, helping to improve cardiac output in pump failure.'),
        (topic_id_val, 'A patient with an acute MI develops a new harsh systolic murmur at the lower left sternal border and sudden cardiogenic shock. Diagnosis?', '["Acute Mitral Regurgitation", "Ventricular Septal Rupture", "Aortic Dissection", "Cardiac Tamponade"]', 1, 'Ventricular septal rupture typically occurs 3-5 days after MI and presents with a new holosystolic murmur and rapid hemodynamic collapse.'),
        (topic_id_val, 'Which of the following is a classic finding of Right-sided Heart Failure on physical exam?', '["Pulmonary rales", "Jugular Venous Distention (JVD)", "S3 gallop", "Paroxysmal nocturnal dyspnea"]', 1, 'JVD, peripheral edema, and hepatic congestion are hallmarks of right-sided heart failure.'),
        (topic_id_val, 'A patient in heart failure has a serum sodium of 128 mEq/L. What is the most likely mechanism?', '["Sodium loss from diuretics", "Dilutional hyponatremia due to ADH activation", "Excessive sodium intake", "Primary polydipsia"]', 1, 'In heart failure, low effective circulating volume leads to ADH activation, causing water retention and dilutional hyponatremia.');
        
    END IF;
END $$;
