-- Batch 7: Cardiac Emergencies (341-380)
-- Topic: Cardiac Emergencies (Year 4 Emergency Medicine)
-- Focus: ACLS, Toxicology, Cardiac Trauma, Advanced Interventions

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-cardiac-emergencies' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'During ACLS for a patient in pulseless Ventricular Tachycardia, a shock is delivered. What is the immediate next step?', '["Check the pulse", "Check the rhythm", "Resume chest compressions", "Give Epinephrine"]', 2, 'Per ACLS guidelines, chest compressions should be resumed immediately after a shock is delivered, without waiting to check the rhythm or pulse.'),
        (topic_id_val, 'A 60-year-old male is found in PEA (Pulseless Electrical Activity) with a rate of 40. Which reversible cause should be prioritized if the ECG shows narrow complexes?', '["Hyperkalemia", "Tension Pneumothorax", "Hypovolemia", "Cardiac Tamponade"]', 2, 'Narrow-complex PEA is most commonly caused by hypovolemia or mechanical obstruction (e.g., tamponade, tension pneumothorax), whereas wide-complex PEA is often metabolic (e.g., hyperkalemia).'),
        (topic_id_val, 'What is the role of Sodium Bicarbonate in the management of a patient with Tricyclic Antidepressant (TCA) overdose and a QRS > 120ms?', '["To acidify the urine", "To increase the fraction of non-ionized drug", "To overcome sodium channel blockade", "To treat metabolic alkalosis"]', 2, 'Sodium bicarbonate provides a sodium load and alkalinizes the blood, both of which help overcome the TCA-induced blockade of fast sodium channels in the heart.'),
        (topic_id_val, 'A patient presents with bradycardia, hypotension, and hyperglycemia after an intentional ingestion of an unknown cardiac medication. Which overdose is most likely?', '["Beta-blocker", "Calcium Channel Blocker (CCB)", "Digoxin", "Clonidine"]', 1, 'Both BB and CCB cause bradycardia and hypotension, but CCB overdose is classically associated with hyperglycemia (due to inhibition of insulin release), while BB overdose often presents with normal or low glucose.'),
        (topic_id_val, 'What is the "antidote" or specialized treatment for a Beta-blocker overdose that fails to respond to atropine and fluids?', '["High-dose Insulin Eustate Therapy (HIET)", "Glucagon IV", "N-acetylcysteine", "Calcium Gluconate"]', 1, 'Glucagon is traditionally considered the first-line antidote for beta-blocker overdose as it increases cAMP via a pathway that bypasses the beta-receptor.'),
        (topic_id_val, 'A 75-year-old on Digoxin presents with nausea, yellow-tinted vision, and "scooped" ST segments on ECG. K+ is 5.8. What is the most specific treatment for life-threatening toxicity?', '["Hemodialysis", "Digoxin-specific antibody fragments (DigiFab)", "Calcium Chloride", "IV Fluids"]', 1, 'DigiFab is the definitive treatment for severe digoxin toxicity. Note: Calcium is controversial in digoxin toxicity due to the theoretical "stone heart" phenomenon.'),
        (topic_id_val, 'A patient suffers a high-speed steering wheel impact to the chest. He is stable but has persistent sinus tachycardia and premature ventricular contractions (PVCs). What is the most likely diagnosis?', '["Aortic Dissection", "Blunt Cardiac Injury (Contusion)", "Cardiac Tamponade", "Rib Fracture"]', 1, 'Blunt cardiac injury (contusion) often presents with non-specific ECG changes, arrhythmias, or tachycardia following blunt chest trauma.'),
        (topic_id_val, 'A pulseless patient with a stab wound to the left chest has a positive FAST exam for pericardial fluid. What is the most appropriate emergent ED procedure?', '["Pericardiocentesis", "ED Thoracotomy", "Endotracheal Intubation", "Chest Tube Insertion"]', 1, 'In a patient with penetrating chest trauma who has recently lost pulses, an emergent ED thoracotomy is indicated to relieve tamponade and control hemorrhage.'),
        (topic_id_val, 'What is the primary physiological benefit of "therapeutic hypothermia" (Targeted Temperature Management) post-cardiac arrest?', '["To increase cardiac output", "To reduce cerebral metabolic rate and prevent reperfusion injury", "To treat underlying infection", "To improve renal function"]', 1, 'TTM (32-36°C) is used to improve neurological outcomes by reducing cerebral oxygen demand and mitigating the inflammatory response after reperfusion.'),
        (topic_id_val, 'In a patient with Cardiac Arrest due to Opioid Overdose, what is the priority after starting CPR and defibrillation?', '["IV Naloxone", "IV Epinephrine", "IV Amiodarone", "Bicarbonate"]', 1, 'Standard ACLS (CPR, defibrillation, Epinephrine) takes priority over naloxone in the setting of full cardiac arrest.');
        
    END IF;
END $$;
