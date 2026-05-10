-- Batch 2: Cardiac Emergencies (61-120)
-- Topic: Cardiac Emergencies (Year 4 Emergency Medicine)
-- Focus: Supraventricular Tachycardias (SVT), Atrial Fibrillation, Atrial Flutter

DO $$
DECLARE
    topic_id_val UUID;
BEGIN
    -- Get topic ID
    SELECT id INTO topic_id_val FROM topics WHERE slug = 'em-cardiac-emergencies' LIMIT 1;

    IF topic_id_val IS NOT NULL THEN
        INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
        (topic_id_val, 'A 28-year-old female presents with sudden onset palpitations and lightheadedness. HR 190, BP 110/70. ECG shows a narrow-complex regular tachycardia with no visible P waves. What is the initial maneuver of choice?', '["Adenosine 6mg rapid IV push", "Vagal maneuvers (e.g., Valsalva)", "Synchronized cardioversion 50J", "Diltiazem 20mg IV"]', 1, 'In a stable patient with SVT, vagal maneuvers should be attempted first before pharmacological intervention.'),
        (topic_id_val, 'The patient above fails the initial maneuver. What is the next step?', '["Adenosine 6mg rapid IV push", "Adenosine 12mg rapid IV push", "Amiodarone 150mg IV", "Metoprolol 5mg IV"]', 0, 'The first pharmacological dose for SVT is Adenosine 6mg via a rapid IV push, followed by 12mg if unsuccessful.'),
        (topic_id_val, 'A 75-year-old male with COPD presents with palpitations. ECG shows a narrow-complex irregular tachycardia with at least 3 different P-wave morphologies. Diagnosis?', '["Atrial Fibrillation", "Multifocal Atrial Tachycardia (MAT)", "Atrial Flutter", "Paroxysmal SVT"]', 1, 'MAT is characterized by an irregular rhythm with three or more distinct P-wave morphologies. It is strongly associated with underlying pulmonary disease like COPD.'),
        (topic_id_val, 'A 60-year-old male presents with "fluttering" in his chest. ECG shows "sawtooth" waves in leads II, III, and aVF with an atrial rate of 300 and a ventricular rate of 150. Diagnosis?', '["Atrial Fibrillation", "Atrial Flutter", "AVNRT", "WPW Syndrome"]', 1, 'Atrial flutter typically presents with a sawtooth baseline and a fixed conduction ratio, commonly 2:1 (Atrial 300 / Ventricular 150).'),
        (topic_id_val, 'A 70-year-old female with Atrial Fibrillation presents with BP 80/50 and altered mental status. What is the immediate management?', '["IV Diltiazem bolus", "IV Amiodarone bolus", "Synchronized cardioversion", "Digoxin loading dose"]', 2, 'Unstable arrhythmias (hypotension, altered mental status, chest pain, or heart failure) require immediate synchronized cardioversion.'),
        (topic_id_val, 'What is the most serious complication of WPW syndrome when Atrial Fibrillation occurs?', '["Cardiac Tamponade", "Degeneration into Ventricular Fibrillation", "Stroke", "Pulmonary Embolism"]', 1, 'In WPW, AFib can conduct rapidly over the accessory pathway, bypassing the AV node and potentially degenerating into VFib.'),
        (topic_id_val, 'In a patient with WPW and Atrial Fibrillation (Wide-complex, irregular), which of the following is CONTRAINDICATED?', '["Procainamide", "Diltiazem", "Ibutilide", "Synchronized Cardioversion"]', 1, 'AV nodal blockers (Diltiazem, Verapamil, Beta-blockers, Digoxin) are contraindicated in WPW with AFib because they can increase conduction through the accessory pathway, risking VFib.'),
        (topic_id_val, 'A patient presents with Atrial Fibrillation of unknown duration. He is hemodynamically stable. What is the primary focus of initial ED management?', '["Immediate conversion to Sinus Rhythm", "Ventricular rate control and assessment of stroke risk", "High-dose steroid therapy", "Pericardiocentesis"]', 1, 'For stable AFib of unknown duration, rate control (e.g., diltiazem or metoprolol) and anticoagulation assessment (CHA2DS2-VASc) are priorities over rhythm control.'),
        (topic_id_val, 'Which medication is preferred for rate control in a patient with Atrial Fibrillation and acute decompensated heart failure?', '["Verapamil", "Metoprolol", "Digoxin", "Diltiazem"]', 2, 'Digoxin or Amiodarone are preferred for rate control in AFib when the patient has low EF or acute heart failure, as CCBs and Beta-blockers can worsen heart failure due to negative inotropy.'),
        (topic_id_val, 'A 40-year-old athlete presents with bradycardia (HR 45) but is asymptomatic. BP 120/80. ECG shows Sinus Bradycardia. Next step?', '["Atropine 0.5mg IV", "Transcutaneous Pacing", "No intervention, monitor", "Permanent pacemaker placement"]', 2, 'Asymptomatic sinus bradycardia, especially in athletes, is a normal physiological finding and requires no treatment.');
        
    END IF;
END $$;
