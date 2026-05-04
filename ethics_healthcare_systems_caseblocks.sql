-- Ethics, Law & Health Systems: Healthcare systems — Medicare, Medicaid, insurance - Part 1 (Cases 1-10)
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ethics-healthcare-systems

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ethics-healthcare-systems' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ethics-healthcare-systems';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Medicare Eligibility - Age-Based
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Transitioning to Retirement' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Transitioning to Retirement', 'A 64-year-old male with hypertension and type 2 diabetes presents for a wellness visit. He is planning to retire next month on his 65th birthday and asks about his eligibility for federal health insurance. 

Vitals: BP 138/86 mmHg, HR 72 bpm, Temp 98.6°F.
Physical Examination: Normal S1/S2, no bruits.
Laboratory Results: HbA1c 7.1%, Creatinine 1.0 mg/dL.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 64-year-old male with hypertension and type 2 diabetes presents for a wellness visit. He is planning to retire next month on his 65th birthday and asks about his eligibility for federal health insurance. 

Vitals: BP 138/86 mmHg, HR 72 bpm, Temp 98.6°F.
Physical Examination: Normal S1/S2, no bruits.
Laboratory Results: HbA1c 7.1%, Creatinine 1.0 mg/dL.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the primary criterion for this patient to qualify for Medicare based on age?', '["Low income status", "US citizenship or permanent residency for 5 years", "Current employment", "History of catastrophic illness"]', 1, 'Medicare eligibility at age 65 requires the individual to be a US citizen or a permanent resident who has resided in the US for at least 5 years.'),
    (v_case_id, 'The patient asks if he needs to have paid into the system. How many "quarters of coverage" are generally required to receive Medicare Part A without a premium?', '["20 quarters", "40 quarters", "60 quarters", "No requirement"]', 1, 'Individuals who have paid Medicare taxes for at least 40 quarters (10 years) are eligible for premium-free Part A.'),
    (v_case_id, 'If the patient continues working past 65 at a firm with 50 employees, which insurance typically acts as the primary payer?', '["Medicare", "The employer-sponsored insurance (ESI)", "Medicaid", "COBRA"]', 1, 'For individuals 65 or older who are still working and have ESI through a large employer (20+ employees), the ESI is the primary payer, and Medicare is secondary.');

    ---------------------------------------------------------------------------
    -- CASE 02: Medicare Eligibility - Disability
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'A Long Road to Recovery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'A Long Road to Recovery', 'A 45-year-old female was diagnosed with Multiple Sclerosis (MS) three years ago. She has been unable to work due to progressive motor weakness and has been receiving Social Security Disability Insurance (SSDI) payments.

Vitals: BP 110/70 mmHg, HR 80 bpm.
Physical Examination: 3/5 strength in lower extremities bilaterally, increased tone.
Laboratory Results: CSF shows oligoclonal bands.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old female was diagnosed with Multiple Sclerosis (MS) three years ago. She has been unable to work due to progressive motor weakness and has been receiving Social Security Disability Insurance (SSDI) payments.

Vitals: BP 110/70 mmHg, HR 80 bpm.
Physical Examination: 3/5 strength in lower extremities bilaterally, increased tone.
Laboratory Results: CSF shows oligoclonal bands.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How long must this patient receive SSDI payments before becoming eligible for Medicare?', '["Immediately", "12 months", "24 months", "60 months"]', 2, 'Individuals under 65 qualify for Medicare after receiving SSDI for 24 months.'),
    (v_case_id, 'Which of the following conditions would allow her to bypass this 24-month waiting period?', '["Amyotrophic Lateral Sclerosis (ALS)", "Systemic Lupus Erythematosus (SLE)", "Traumatic Brain Injury", "Parkinson Disease"]', 0, 'Patients with ALS (Lou Gehrig''s disease) are eligible for Medicare the first month they receive disability benefits, bypassing the 24-month wait.'),
    (v_case_id, 'Once eligible, which part of Medicare will cover her prescription disease-modifying therapies (DMTs)?', '["Part A", "Part B", "Part D", "Medigap"]', 2, 'Medicare Part D covers prescription drugs, including most self-administered DMTs for MS.');

    ---------------------------------------------------------------------------
    -- CASE 03: Medicare Eligibility - ESRD
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dialysis Decision' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dialysis Decision', 'A 52-year-old male with long-standing polycystic kidney disease has reached End-Stage Renal Disease (ESRD). He is starting hemodialysis three times a week.

Vitals: BP 155/95 mmHg, HR 88 bpm.
Physical Examination: Palpable bilateral flank masses.
Laboratory Results: GFR 8 mL/min/1.73m², Creatinine 7.4 mg/dL, Potassium 5.6 mEq/L.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 52-year-old male with long-standing polycystic kidney disease has reached End-Stage Renal Disease (ESRD). He is starting hemodialysis three times a week.

Vitals: BP 155/95 mmHg, HR 88 bpm.
Physical Examination: Palpable bilateral flank masses.
Laboratory Results: GFR 8 mL/min/1.73m², Creatinine 7.4 mg/dL, Potassium 5.6 mEq/L.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this patient eligible for Medicare regardless of his age?', '["No, only if > 65", "Yes, due to ESRD diagnosis", "Only if he is also blind", "Only if he has no other assets"]', 1, 'Medicare coverage is available to individuals of any age with End-Stage Renal Disease (ESRD) who require dialysis or a kidney transplant.'),
    (v_case_id, 'When does Medicare coverage typically begin for a patient starting in-center hemodialysis?', '["First day of dialysis", "First day of the fourth month of dialysis", "After 1 year", "Immediately upon diagnosis"]', 1, 'For in-center hemodialysis, Medicare coverage usually starts on the first day of the fourth month of dialysis treatments.'),
    (v_case_id, 'If the patient receives a kidney transplant, how long does his Medicare coverage typically continue post-transplant if he is under 65?', '["12 months", "36 months", "Permanently", "6 months"]', 1, 'For individuals under 65 whose Medicare eligibility is based solely on ESRD, coverage ends 36 months after a successful kidney transplant.');

    ---------------------------------------------------------------------------
    -- CASE 04: Medicare Part A - Hospitalization
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Acute Pneumonia Admission' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Acute Pneumonia Admission', 'An 82-year-old female is admitted to the hospital with community-acquired pneumonia. She stays for 5 days receiving IV antibiotics and oxygen.

Vitals: BP 120/75 mmHg, HR 92 bpm, RR 22/min, O2 Sat 91% on RA.
Physical Examination: Right lower lobe crackles.
Laboratory Results: WBC 14.5 x 10³/µL, CXR shows RLL infiltrate.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 82-year-old female is admitted to the hospital with community-acquired pneumonia. She stays for 5 days receiving IV antibiotics and oxygen.

Vitals: BP 120/75 mmHg, HR 92 bpm, RR 22/min, O2 Sat 91% on RA.
Physical Examination: Right lower lobe crackles.
Laboratory Results: WBC 14.5 x 10³/µL, CXR shows RLL infiltrate.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which part of Medicare primarily covers this patient''s 5-day inpatient hospital stay?', '["Part A", "Part B", "Part C", "Part D"]', 0, 'Medicare Part A covers inpatient hospital stays, including semi-private rooms, meals, general nursing, and drugs as part of your inpatient treatment.'),
    (v_case_id, 'For each "benefit period," what must the patient pay before Medicare Part A begins to pay for hospital care?', '["Nothing", "A deductible", "A 20% coinsurance", "Monthly premium only"]', 1, 'Medicare Part A has a deductible for each benefit period before coverage kicks in for hospital stays.'),
    (v_case_id, 'A "benefit period" begins the day a patient is admitted as an inpatient and ends when they have not received any inpatient hospital or SNF care for how many consecutive days?', '["30 days", "60 days", "90 days", "180 days"]', 1, 'A benefit period ends when the patient has not received any inpatient hospital care (or skilled care in a SNF) for 60 days in a row.');

    ---------------------------------------------------------------------------
    -- CASE 05: Medicare Part A - Skilled Nursing Facility (SNF)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-Surgical Rehab' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-Surgical Rehab', 'A 78-year-old male undergoes a total hip replacement. After a 4-day inpatient stay, he is transferred to a Skilled Nursing Facility (SNF) for intensive physical therapy.

Vitals: Stable.
Physical Examination: Post-operative incision clean/dry/intact, limited ROM of left hip.
Laboratory Results: Hb 10.2 g/dL.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 78-year-old male undergoes a total hip replacement. After a 4-day inpatient stay, he is transferred to a Skilled Nursing Facility (SNF) for intensive physical therapy.

Vitals: Stable.
Physical Examination: Post-operative incision clean/dry/intact, limited ROM of left hip.
Laboratory Results: Hb 10.2 g/dL.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'To qualify for SNF coverage under Medicare Part A, the patient must have had a prior "qualifying" hospital stay of at least how many days?', '["1 day", "2 days", "3 days", "5 days"]', 2, 'Medicare Part A requires a minimum 3-day (three midnights) inpatient hospital stay before covering SNF care.'),
    (v_case_id, 'How many days of SNF care are covered at 100% (no coinsurance) by Medicare Part A per benefit period?', '["First 20 days", "First 50 days", "First 100 days", "0 days"]', 0, 'Medicare Part A covers the first 20 days of SNF care in full. Days 21-100 require a daily coinsurance payment.'),
    (v_case_id, 'Does Medicare Part A cover "custodial care" (e.g., help with bathing or dressing) if that is the only care the patient needs?', '["Yes", "No", "Only if patient is low income", "Only if ordered by a surgeon"]', 1, 'Medicare does NOT cover custodial care if it is the only care needed. It only covers skilled nursing or rehabilitative services.');

    ---------------------------------------------------------------------------
    -- CASE 06: Medicare Part A - Hospice
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Comfort at the End' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Comfort at the End', 'A 72-year-old male with metastatic pancreatic cancer has decided to pursue palliative care only. His physician estimates his life expectancy to be less than 6 months.

Vitals: BP 100/60 mmHg, HR 95 bpm.
Physical Examination: Cachectic, icteric, abdominal distension.
Laboratory Results: Bilirubin 8.5 mg/dL, CA 19-9 elevated.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old male with metastatic pancreatic cancer has decided to pursue palliative care only. His physician estimates his life expectancy to be less than 6 months.

Vitals: BP 100/60 mmHg, HR 95 bpm.
Physical Examination: Cachectic, icteric, abdominal distension.
Laboratory Results: Bilirubin 8.5 mg/dL, CA 19-9 elevated.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which part of Medicare covers hospice care?', '["Part A", "Part B", "Part C", "Part D"]', 0, 'Medicare Part A covers hospice care for terminally ill patients.'),
    (v_case_id, 'To be eligible for the Medicare hospice benefit, a physician must certify that the patient has a terminal illness with a life expectancy of:', '["3 months or less", "6 months or less", "12 months or less", "No specific timeframe"]', 1, 'Hospice eligibility requires a physician certification of a terminal illness with a prognosis of 6 months or less if the disease runs its normal course.'),
    (v_case_id, 'When choosing hospice, what does the patient waive his right to?', '["All medical care", "Curative treatments for the terminal illness", "Pain management", "Doctor visits"]', 1, 'By electing hospice, the patient agrees to forego curative treatments for the terminal illness, focusing instead on comfort/palliative care.');

    ---------------------------------------------------------------------------
    -- CASE 07: Medicare Part B - Outpatient Visit
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Managing Chronic Conditions' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Managing Chronic Conditions', 'A 68-year-old female presents to her primary care physician for a follow-up on her hypertension and hyperlipidemia. 

Vitals: BP 142/88 mmHg.
Physical Examination: Normal heart and lung sounds.
Laboratory Results: LDL 130 mg/dL.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old female presents to her primary care physician for a follow-up on her hypertension and hyperlipidemia. 

Vitals: BP 142/88 mmHg.
Physical Examination: Normal heart and lung sounds.
Laboratory Results: LDL 130 mg/dL.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which part of Medicare covers this outpatient physician office visit?', '["Part A", "Part B", "Part C", "Part D"]', 1, 'Medicare Part B covers outpatient services, including doctor visits, lab tests, and screenings.'),
    (v_case_id, 'Unlike Part A, which is often premium-free, what does Part B usually require from the patient?', '["A yearly deductible and monthly premium", "Only a one-time fee", "A 50% copay for all visits", "Nothing if they are over 70"]', 0, 'Medicare Part B requires a monthly premium (often deducted from Social Security checks) and an annual deductible.'),
    (v_case_id, 'After the deductible is met, what percentage of the "Medicare-approved amount" for services does Part B typically cover?', '["50%", "80%", "90%", "100%"]', 1, 'After the deductible, Medicare Part B typically pays 80% of the approved amount, leaving the patient with a 20% coinsurance.');

    ---------------------------------------------------------------------------
    -- CASE 08: Medicare Part B - Durable Medical Equipment (DME)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mobility Assistance' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mobility Assistance', 'A 75-year-old male with severe osteoarthritis of the knees has significant difficulty walking. His doctor prescribes a walker to help him stay mobile.

Vitals: Stable.
Physical Examination: Crepitus and reduced ROM in both knees.
Laboratory Results: Knee X-ray shows joint space narrowing.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old male with severe osteoarthritis of the knees has significant difficulty walking. His doctor prescribes a walker to help him stay mobile.

Vitals: Stable.
Physical Examination: Crepitus and reduced ROM in both knees.
Laboratory Results: Knee X-ray shows joint space narrowing.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which part of Medicare covers Durable Medical Equipment (DME) like walkers, wheelchairs, and oxygen tanks?', '["Part A", "Part B", "Part C", "Part D"]', 1, 'Medicare Part B covers medically necessary DME.'),
    (v_case_id, 'To be covered by Medicare, DME must be:', '["Prescribed by a doctor", "Used in the patient''s home", "Expected to last at least 3 years", "All of the above"]', 3, 'DME must be durable (last 3+ years), used for a medical reason, generally not useful to someone who isn''t sick, used in your home, and prescribed by a Medicare-enrolled provider.'),
    (v_case_id, 'If the patient also needs a "hospital bed" at home, which part covers it?', '["Part A", "Part B", "Part D", "It is not covered"]', 1, 'Hospital beds used in the home are considered DME and covered under Part B.');

    ---------------------------------------------------------------------------
    -- CASE 09: Medicare Part B - Preventive Services
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The "Welcome to Medicare" Visit' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The "Welcome to Medicare" Visit', 'A 65-year-old woman just enrolled in Medicare and schedules her first appointment to discuss screenings for breast and colon cancer.

Vitals: BP 118/76 mmHg.
Physical Examination: Normal.
Laboratory Results: Last colonoscopy was 10 years ago (normal).', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old woman just enrolled in Medicare and schedules her first appointment to discuss screenings for breast and colon cancer.

Vitals: BP 118/76 mmHg.
Physical Examination: Normal.
Laboratory Results: Last colonoscopy was 10 years ago (normal).', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the one-time preventive visit offered within the first 12 months of Part B enrollment?', '["Annual Wellness Visit", "Initial Preventive Physical Examination (IPPE)", "Medicare Intake Exam", "Senior Screen"]', 1, 'The IPPE (Welcome to Medicare visit) is a one-time visit within the first 12 months of enrollment.'),
    (v_case_id, 'Does the patient usually have to pay the Part B deductible or coinsurance for recommended preventive services like mammograms or flu shots?', '["Yes, always", "No, they are often covered at 100%", "Only if she is low income", "Only if the doctor is a specialist"]', 1, 'Most preventive services covered by Medicare Part B (like mammograms, flu shots, and colonoscopies) have the deductible and coinsurance waived if the provider accepts assignment.'),
    (v_case_id, 'How often does Medicare Part B cover an "Annual Wellness Visit" after the first year?', '["Every 6 months", "Once every 12 months", "Once every 2 years", "Only if patient is sick"]', 1, 'Medicare covers an Annual Wellness Visit once every 12 months.');

    ---------------------------------------------------------------------------
    -- CASE 10: Medicare Part B - Dialysis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Maintenance Dialysis Costs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Maintenance Dialysis Costs', 'The patient from Case 03 (ESRD) has started his maintenance dialysis. He is worried about how the treatments and medications are billed.

Vitals: BP 140/90 mmHg.
Physical Examination: AV fistula in left arm with palpable thrill.
Laboratory Results: BUN 50, Creatinine 6.5.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The patient from Case 03 (ESRD) has started his maintenance dialysis. He is worried about how the treatments and medications are billed.

Vitals: BP 140/90 mmHg.
Physical Examination: AV fistula in left arm with palpable thrill.
Laboratory Results: BUN 50, Creatinine 6.5.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which part of Medicare covers outpatient dialysis treatments and related supplies?', '["Part A", "Part B", "Part C", "Part D"]', 1, 'Outpatient dialysis is covered under Medicare Part B.'),
    (v_case_id, 'Injectable drugs given during dialysis (like Erythropoietin) are typically covered under which part?', '["Part A", "Part B", "Part D", "They are not covered"]', 1, 'Drugs given by injection or infusion during outpatient dialysis are usually covered under Part B as part of the dialysis "bundle" or as a separate Part B drug.'),
    (v_case_id, 'If the patient chooses "Home Dialysis," does Medicare Part B still cover the equipment and training?', '["Yes", "No, only in-center", "Only if he lives > 50 miles from a center", "Only if he has Part D"]', 0, 'Medicare Part B covers home dialysis equipment, supplies, and training for the patient and their caregiver.');

    ---------------------------------------------------------------------------
    -- CASE 11: Medicare Part C - Medicare Advantage Basics
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'An Alternative to Original Medicare' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'An Alternative to Original Medicare', 'A 70-year-old male is considering switching from "Original Medicare" to a Medicare Advantage plan (Part C). He wants to know how it differs from his current coverage.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal routine screening labs.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old male is considering switching from "Original Medicare" to a Medicare Advantage plan (Part C). He wants to know how it differs from his current coverage.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal routine screening labs.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Who provides the coverage in a Medicare Advantage (Part C) plan?', '["The federal government directly", "Private insurance companies approved by Medicare", "The state government", "Employer-only funds"]', 1, 'Medicare Advantage plans are offered by private companies that contract with Medicare to provide all Part A and Part B benefits.'),
    (v_case_id, 'To join a Medicare Advantage plan, the patient must already have which of the following?', '["Medicare Part A only", "Medicare Part B only", "Both Medicare Part A and Part B", "Medicaid"]', 2, 'To be eligible for Part C, an individual must be enrolled in both Part A and Part B.'),
    (v_case_id, 'Which of the following is a potential advantage of Part C plans?', '["They often include Part D prescription coverage", "They may offer extra benefits like vision or dental", "They have a yearly limit on out-of-pocket costs", "All of the above"]', 3, 'Medicare Advantage plans often bundle Parts A, B, and D, and provide additional benefits not covered by Original Medicare, along with a maximum out-of-pocket (MOOP) limit.');

    ---------------------------------------------------------------------------
    -- CASE 12: Medicare Part C - Network Restrictions
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Choosing a Specialist' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Choosing a Specialist', 'A patient in a Medicare Advantage HMO plan wants to see an out-of-network cardiologist for a second opinion on his heart failure management.

Vitals: BP 130/80, HR 85 (AFib).
Physical Examination: Trace pedal edema, JVP not elevated.
Laboratory Results: NT-proBNP 450 pg/mL.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient in a Medicare Advantage HMO plan wants to see an out-of-network cardiologist for a second opinion on his heart failure management.

Vitals: BP 130/80, HR 85 (AFib).
Physical Examination: Trace pedal edema, JVP not elevated.
Laboratory Results: NT-proBNP 450 pg/mL.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In a Medicare Advantage HMO, what is usually required before seeing a specialist?', '["Nothing", "A referral from a primary care physician (PCP)", "A letter from the CMS administrator", "A 1-year waiting period"]', 1, 'In most Medicare HMO plans, you generally need a referral from your PCP to see a specialist.'),
    (v_case_id, 'If the patient sees an out-of-network provider in a standard HMO plan (non-emergency), who is typically responsible for the cost?', '["Medicare", "The HMO plan", "The patient (100%)", "The provider must write it off"]', 2, 'In an HMO, if you go out-of-network for non-emergency care, you usually have to pay the full cost yourself.'),
    (v_case_id, 'If the patient had a Medicare Advantage PPO instead of an HMO, could he see an out-of-network provider?', '["No", "Yes, but usually at a higher cost-share", "Yes, at the same cost as in-network", "Only if the HMO is full"]', 1, 'PPO plans allow members to see out-of-network providers, but the coinsurance or copayment is typically higher than for in-network providers.');

    ---------------------------------------------------------------------------
    -- CASE 13: Medicare Part D - Prescription Drugs
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pharmacy Counter' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pharmacy Counter', 'A 66-year-old male is newly prescribed a high-intensity statin and an ACE inhibitor. He is enrolled in a stand-alone Medicare Part D Prescription Drug Plan (PDP).

Vitals: BP 145/92 mmHg.
Physical Examination: Normal.
Laboratory Results: Total Cholesterol 240 mg/dL.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 66-year-old male is newly prescribed a high-intensity statin and an ACE inhibitor. He is enrolled in a stand-alone Medicare Part D Prescription Drug Plan (PDP).

Vitals: BP 145/92 mmHg.
Physical Examination: Normal.
Laboratory Results: Total Cholesterol 240 mg/dL.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Medicare Part D plans use a list of covered drugs known as a:', '["Pharmacopoeia", "Formulary", "Statute", "Registry"]', 1, 'A formulary is a list of prescription drugs covered by a drug plan.'),
    (v_case_id, 'Drug plans often group drugs into different "tiers." Which tier generally has the lowest copayment?', '["Tier 1 (Preferred Generics)", "Tier 2 (Generics)", "Tier 3 (Preferred Brands)", "Tier 4 (Non-preferred Brands)"]', 0, 'Lower tiers (Tier 1) usually consist of low-cost generic drugs with the lowest cost-sharing.'),
    (v_case_id, 'If a drug is not on the plan''s formulary, what can the physician request on behalf of the patient?', '["A refund", "A formulary exception", "A Medicare Part B override", "Nothing, the patient must pay cash"]', 1, 'A prescriber can request a formulary exception if they believe the non-formulary drug is medically necessary.');

    ---------------------------------------------------------------------------
    -- CASE 14: Medicare Part D - The "Donut Hole"
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mid-Year Medication Costs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mid-Year Medication Costs', 'A patient with multiple chronic conditions has reached a point where his total drug costs for the year have exceeded a certain threshold (e.g., $5,030 in 2024). He notices he is suddenly paying more for his refills.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Chronic maintenance labs stable.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with multiple chronic conditions has reached a point where his total drug costs for the year have exceeded a certain threshold (e.g., $5,030 in 2024). He notices he is suddenly paying more for his refills.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Chronic maintenance labs stable.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the common term for this "coverage gap" in Medicare Part D?', '["The Black Hole", "The Donut Hole", "The Safety Net", "The Premium Spike"]', 1, 'The "Donut Hole" refers to a temporary limit on what the drug plan will cover for drugs after a certain amount has been spent.'),
    (v_case_id, 'Once the patient exits the "Donut Hole" by reaching the "Out-of-Pocket Threshold," what phase of coverage does he enter?', '["Initial Coverage", "Catastrophic Coverage", "Premium-free Period", "Final Phase"]', 1, 'After reaching the out-of-pocket limit, the patient enters "Catastrophic Coverage" where they pay a small coinsurance or copayment for the rest of the year.'),
    (v_case_id, 'The Inflation Reduction Act of 2022 aims to eliminate which of the following for Part D enrollees starting in 2024/2025?', '["The monthly premium", "The catastrophic coverage coinsurance", "All deductibles", "The right to appeal"]', 1, 'The IRA eliminates the 5% coinsurance in the catastrophic phase in 2024 and caps annual out-of-pocket costs at $2,000 in 2025.');

    ---------------------------------------------------------------------------
    -- CASE 15: Medicare Part D - Creditable Coverage
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Delaying Enrollment' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Delaying Enrollment', 'A 65-year-old retired veteran receives his medications through the VA (Veterans Affairs). He asks if he needs to sign up for Medicare Part D now to avoid future penalties.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old retired veteran receives his medications through the VA (Veterans Affairs). He asks if he needs to sign up for Medicare Part D now to avoid future penalties.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If a patient has drug coverage that is expected to pay at least as much as Medicare''s standard drug coverage, it is called:', '["Primary Coverage", "Creditable Coverage", "Supplemental Coverage", "Exempt Coverage"]', 1, 'Creditable coverage is drug coverage (e.g., from an employer or the VA) that is at least as good as Medicare Part D.'),
    (v_case_id, 'What happens if a patient goes 63 or more days without creditable drug coverage after their initial enrollment period?', '["They lose Medicare Part A", "They must pay a late enrollment penalty for as long as they have Part D", "They can never join Part D", "Nothing"]', 1, 'If you go 63+ days without creditable coverage, you may have to pay a permanent late enrollment penalty when you eventually join a Part D plan.'),
    (v_case_id, 'Is VA drug coverage considered "creditable" for Medicare Part D purposes?', '["Yes", "No", "Only for service-connected disabilities", "Only if the patient is 100% disabled"]', 0, 'VA prescription drug coverage is considered creditable coverage.');

    ---------------------------------------------------------------------------
    -- CASE 16: Medicaid - Eligibility
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Filling the Gap for Low Income' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Filling the Gap for Low Income', 'A 24-year-old single mother working a part-time job with no benefits presents with her 3-year-old child for a check-up. Her income is below the Federal Poverty Level (FPL).

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old single mother working a part-time job with no benefits presents with her 3-year-old child for a check-up. Her income is below the Federal Poverty Level (FPL).

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Medicaid is a health insurance program funded by:', '["The federal government only", "State governments only", "Jointly by federal and state governments", "Private donations"]', 2, 'Medicaid is a joint federal-state program.'),
    (v_case_id, 'Who administers the Medicaid program and determines specific eligibility rules?', '["The CMS", "Each individual state", "The Social Security Administration", "The local hospital board"]', 1, 'While the federal government sets baseline requirements, each state administers its own program and sets its own eligibility and benefit rules.'),
    (v_case_id, 'In states that expanded Medicaid under the Affordable Care Act (ACA), what is the income limit for most adults?', '["100% of FPL", "133% or 138% of FPL", "200% of FPL", "50% of FPL"]', 1, 'The ACA Medicaid expansion covers nearly all non-elderly adults with incomes up to 138% of the FPL.');

    ---------------------------------------------------------------------------
    -- CASE 17: Medicaid - Categorically vs. Medically Needy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'High Medical Bills' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'High Medical Bills', 'An elderly woman''s income is slightly too high to qualify for standard Medicaid, but she has extremely high recurring medical expenses that "spend down" her income.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An elderly woman''s income is slightly too high to qualify for standard Medicaid, but she has extremely high recurring medical expenses that "spend down" her income.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Individuals who qualify for Medicaid because their medical expenses reduce their net income below a certain level are called:', '["Categorically Needy", "Medically Needy (or Spend-down)", "Indigent", "Asset-limited"]', 1, 'The "Medically Needy" program allows people with high medical bills to qualify for Medicaid even if their income is above the regular limit.'),
    (v_case_id, 'Which of the following is a mandatory benefit that states MUST provide under Medicaid?', '["Inpatient hospital services", "Family planning services", "Early and Periodic Screening, Diagnostic and Treatment (EPSDT) for children", "All of the above"]', 3, 'Federal law requires states to provide certain "mandatory" benefits to receive federal matching funds.'),
    (v_case_id, 'Is adult dental care a mandatory or optional benefit under federal Medicaid rules?', '["Mandatory", "Optional", "Prohibited", "Only for emergencies"]', 1, 'Dental services for adults are an optional benefit that states may choose to provide.');

    ---------------------------------------------------------------------------
    -- CASE 18: Medicaid - Long-Term Care
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Nursing Home Financing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Nursing Home Financing', 'An 85-year-old male with advanced Alzheimer''s disease requires 24-hour skilled nursing care in a facility. His family is concerned about the $10,000/month cost.

Vitals: BP 115/75.
Physical Examination: Disoriented to time/place/person, requires total assistance with ADLs.
Laboratory Results: Normal routine labs.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 85-year-old male with advanced Alzheimer''s disease requires 24-hour skilled nursing care in a facility. His family is concerned about the $10,000/month cost.

Vitals: BP 115/75.
Physical Examination: Disoriented to time/place/person, requires total assistance with ADLs.
Laboratory Results: Normal routine labs.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which program is the largest primary payer for long-term nursing home care in the United States?', '["Medicare", "Medicaid", "Social Security", "Private HMOs"]', 1, 'Medicaid is the primary payer for long-term nursing home care. Medicare only covers short-term skilled rehab (up to 100 days).'),
    (v_case_id, 'To qualify for Medicaid coverage of nursing home care, the individual must meet both clinical "level of care" requirements and:', '["Strict income and asset (resource) limits", "A minimum 5-year residency in the facility", "A history of military service", "A diagnosis of cancer"]', 0, 'Medicaid long-term care eligibility requires meeting stringent financial criteria regarding both monthly income and countable assets.'),
    (v_case_id, 'What is the "Look-back Period" for Medicaid to check for asset transfers (gifts) made to qualify for coverage?', '["12 months", "36 months", "60 months (5 years)", "10 years"]', 2, 'Medicaid has a 60-month "look-back" period for any asset transfers for less than fair market value; such transfers can result in a penalty period of ineligibility.');

    ---------------------------------------------------------------------------
    -- CASE 19: Medicaid - Dual Eligibility
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The "Dual Eligible" Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The "Dual Eligible" Patient', 'A 72-year-old male has both Medicare (due to age) and Medicaid (due to very low income).

Vitals: BP 135/85.
Physical Examination: Normal.
Laboratory Results: Normal.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old male has both Medicare (due to age) and Medicaid (due to very low income).

Vitals: BP 135/85.
Physical Examination: Normal.
Laboratory Results: Normal.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'For a "Dual Eligible" patient, which program is the "primary" payer for Medicare-covered services?', '["Medicare", "Medicaid", "They split costs 50/50", "The patient must choose one"]', 0, 'For services covered by both programs, Medicare pays first (primary), and Medicaid pays second (secondary).'),
    (v_case_id, 'How does Medicaid typically help this patient with their Medicare costs?', '["Pays Medicare Part B premiums", "Pays Medicare deductibles and coinsurance", "Provides coverage for things Medicare doesn''t (like long-term care)", "All of the above"]', 3, 'Medicaid often acts as a "wrap-around" for Medicare, covering premiums, cost-sharing, and additional benefits.'),
    (v_case_id, 'If this patient needs a prescription drug, which program typically provides the drug coverage?', '["Medicare Part D", "Medicaid", "Medicare Part B", "VA"]', 0, 'For dual eligibles, prescription drug coverage is provided through Medicare Part D (often with "Extra Help" to lower costs).');

    ---------------------------------------------------------------------------
    -- CASE 20: CHIP - Children''s Health Insurance Program
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Not Poor Enough for Medicaid' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Not Poor Enough for Medicaid', 'A family of four earns $55,000 a year. They earn too much to qualify for Medicaid in their state, but they cannot afford private insurance for their two children.

Vitals: Children are healthy.
Physical Examination: Normal growth and development.
Laboratory Results: Up-to-date immunizations.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A family of four earns $55,000 a year. They earn too much to qualify for Medicaid in their state, but they cannot afford private insurance for their two children.

Vitals: Children are healthy.
Physical Examination: Normal growth and development.
Laboratory Results: Up-to-date immunizations.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which program provides health coverage to children in families with incomes too high for Medicaid but too low to afford private insurance?', '["Medicare", "CHIP", "WIC", "COBRA"]', 1, 'CHIP (Children''s Health Insurance Program) provides low-cost health coverage to children in these families.'),
    (v_case_id, 'Does CHIP cover pregnant women?', '["No, only children", "Yes, in some states", "Only if they are under 18", "Only if they have twins"]', 1, 'States have the option to cover pregnant women under CHIP.'),
    (v_case_id, 'Like Medicaid, CHIP is funded jointly by:', '["The federal and state governments", "Public and private sectors", "Parents and schools", "The WHO and CDC"]', 0, 'CHIP is a joint federal-state partnership, similar to Medicaid.');

    ---------------------------------------------------------------------------
    -- CASE 21: Private Insurance - HMO
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gatekeeper Model' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gatekeeper Model', 'A 30-year-old male recently started a new job and chose a Health Maintenance Organization (HMO) plan. He wants to see a dermatologist for his acne.

Vitals: Stable.
Physical Examination: Comedones and papules on forehead and chin.
Laboratory Results: Normal.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old male recently started a new job and chose a Health Maintenance Organization (HMO) plan. He wants to see a dermatologist for his acne.

Vitals: Stable.
Physical Examination: Comedones and papules on forehead and chin.
Laboratory Results: Normal.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In an HMO, who acts as the "gatekeeper" to coordinate all medical care?', '["The insurance company CEO", "The Primary Care Physician (PCP)", "The specialist", "The patient"]', 1, 'In an HMO, the PCP is responsible for managing the patient''s care and providing referrals for specialty services.'),
    (v_case_id, 'If this patient goes to a dermatologist without a referral from his PCP, how will the HMO likely handle the claim?', '["Pay it in full", "Deny the claim", "Pay it at a reduced rate", "Ask the dermatologist for a discount"]', 1, 'HMOs typically will not cover specialist visits unless they have been pre-authorized/referred by the PCP.'),
    (v_case_id, 'HMOs are generally associated with which of the following compared to PPOs?', '["Lower premiums and more restricted choice of providers", "Higher premiums and more flexibility", "No coverage for emergencies", "Lifetime limits on care"]', 0, 'HMOs usually have lower monthly premiums and out-of-pocket costs but limit the patient to a specific network of providers.');

    ---------------------------------------------------------------------------
    -- CASE 22: Private Insurance - PPO
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Paying for Flexibility' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Paying for Flexibility', 'A 45-year-old woman has a Preferred Provider Organization (PPO) plan. She decides to see an orthopedic surgeon directly for her knee pain without visiting her PCP first.

Vitals: Stable.
Physical Examination: Normal alignment, mild effusion.
Laboratory Results: Normal.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old woman has a Preferred Provider Organization (PPO) plan. She decides to see an orthopedic surgeon directly for her knee pain without visiting her PCP first.

Vitals: Stable.
Physical Examination: Normal alignment, mild effusion.
Laboratory Results: Normal.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does a PPO plan typically require a referral to see a specialist?', '["Yes", "No", "Only for surgery", "Only for out-of-state doctors"]', 1, 'PPOs generally do not require referrals to see specialists, whether in-network or out-of-network.'),
    (v_case_id, 'If the patient chooses to see an "out-of-network" surgeon, how does her cost-sharing usually change?', '["It stays the same", "It increases (higher coinsurance/deductible)", "It decreases", "The plan will not pay anything"]', 1, 'PPOs allow members to see out-of-network providers but at a higher cost-share than in-network providers.'),
    (v_case_id, 'PPO premiums are typically ______ than HMO premiums for the same level of benefits.', '["Higher", "Lower", "Identical", "Non-existent"]', 0, 'PPOs usually command higher premiums in exchange for the increased flexibility and lack of gatekeeping.');

    ---------------------------------------------------------------------------
    -- CASE 23: Private Insurance - POS
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hybrid Model' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hybrid Model', 'A patient has a Point of Service (POS) plan. This plan combines features of both HMOs and PPOs.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient has a Point of Service (POS) plan. This plan combines features of both HMOs and PPOs.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Like an HMO, a POS plan usually requires the patient to:', '["Pay 100% of costs", "Designate a Primary Care Physician", "Go without a deductible", "Use only generic drugs"]', 1, 'POS plans typically require members to choose a PCP who acts as a gatekeeper for in-network care.'),
    (v_case_id, 'Like a PPO, a POS plan allows the patient to:', '["See any doctor in the world for free", "Seek care out-of-network at a higher cost", "Bypass all medical necessity reviews", "Pay no premiums"]', 1, 'The "Point of Service" feature allows members to choose at the time they need care whether to stay in-network (cheaper) or go out-of-network (more expensive).'),
    (v_case_id, 'If a POS member sees an out-of-network specialist without a PCP referral, they will likely pay:', '["Nothing", "In-network rates", "Out-of-network rates (highest cost)", "HMO rates"]', 2, 'Going out-of-network in a POS plan usually triggers higher deductibles and coinsurance.');

    ---------------------------------------------------------------------------
    -- CASE 24: HDHP and HSA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High Deductible Trade-off' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High Deductible Trade-off', 'A healthy 28-year-old chooses a High Deductible Health Plan (HDHP) because of the low monthly premiums. He also opens a Health Savings Account (HSA).

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A healthy 28-year-old chooses a High Deductible Health Plan (HDHP) because of the low monthly premiums. He also opens a Health Savings Account (HSA).

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a primary characteristic of an HDHP?', '["High monthly premiums", "Low annual deductible", "Higher annual deductible than traditional plans", "No out-of-pocket limit"]', 2, 'HDHPs have lower premiums but require the patient to pay a significant amount (the deductible) before insurance coverage begins.'),
    (v_case_id, 'Which of the following is true about a Health Savings Account (HSA)?', '["It is \"use it or lose it\" every year", "Funds roll over from year to year", "It can only be used for premiums", "It is taxed upon withdrawal for medical use"]', 1, 'Unlike an FSA, HSA funds roll over indefinitely and are owned by the individual.'),
    (v_case_id, 'To be eligible to contribute to an HSA, an individual MUST be enrolled in:', '["Any health plan", "A High Deductible Health Plan (HDHP)", "Medicare", "Medicaid"]', 1, 'Eligibility for an HSA is strictly tied to being enrolled in a qualifying HDHP.');

    ---------------------------------------------------------------------------
    -- CASE 25: COBRA - Continuity of Coverage
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Losing the Job, Keeping the Plan' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Losing the Job, Keeping the Plan', 'A 50-year-old male with chronic kidney disease is laid off from his job at a large tech company. He is worried about losing his health insurance.

Vitals: BP 130/80.
Physical Examination: Normal.
Laboratory Results: Creatinine 1.8 mg/dL.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male with chronic kidney disease is laid off from his job at a large tech company. He is worried about losing his health insurance.

Vitals: BP 130/80.
Physical Examination: Normal.
Laboratory Results: Creatinine 1.8 mg/dL.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which federal law allows this patient to temporarily continue his employer-sponsored health coverage after losing his job?', '["HIPAA", "COBRA", "ERISA", "EMTALA"]', 1, 'COBRA (Consolidated Omnibus Budget Reconciliation Act) provides for the continuation of health coverage in certain instances where coverage would otherwise be lost.'),
    (v_case_id, 'Under COBRA, how much of the premium is the patient typically required to pay?', '["0% (employer pays all)", "50%", "100% plus a 2% administrative fee", "The same amount they paid as an employee"]', 2, 'COBRA is often expensive because the individual must pay the full premium that the employer used to cover, plus an administrative fee.'),
    (v_case_id, 'For most "qualifying events" like job loss, COBRA coverage generally lasts for up to:', '["6 months", "12 months", "18 months", "36 months"]', 2, 'COBRA coverage generally lasts for 18 months for termination of employment or reduction in hours.');

    ---------------------------------------------------------------------------
    -- CASE 26: ERISA - Federal Preemption
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Self-Insured Employer Plans' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Self-Insured Employer Plans', 'A large national retailer "self-insures" its health plan for employees. A state passes a law requiring all health plans to cover a specific new fertility treatment.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A large national retailer "self-insures" its health plan for employees. A state passes a law requiring all health plans to cover a specific new fertility treatment.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which federal law "preempts" state laws for self-insured employer health plans?', '["ERISA", "Social Security Act", "Affordable Care Act", "Tax Code"]', 0, 'ERISA (Employee Retirement Income Security Act) sets federal standards for most voluntarily established retirement and health plans in private industry.'),
    (v_case_id, 'Does the state-mandated benefit (fertility treatment) necessarily apply to this self-insured employer''s plan?', '["Yes, state laws always rule", "No, ERISA exempts self-insured plans from most state insurance mandates", "Only if the company has < 100 employees", "Only if the treatment is life-saving"]', 1, 'Under ERISA''s "preemption clause," self-insured plans are generally exempt from state-level insurance mandates.'),
    (v_case_id, 'ERISA was originally designed primarily to protect:', '["Doctors'' salaries", "Employee pension and welfare benefit plans", "Insurance company profits", "The Medicaid budget"]', 1, 'ERISA was enacted to ensure that employees receive the benefits promised by their employers.');

    ---------------------------------------------------------------------------
    -- CASE 27: Underinsurance - The Financial Burden
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Insured but Still Struggling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Insured but Still Struggling', 'A 55-year-old male has health insurance through his job. However, his deductible is $6,000, and he must pay 30% coinsurance for all visits. He skips his blood pressure medications because he cannot afford the out-of-pocket costs.

Vitals: BP 162/98 mmHg.
Physical Examination: Normal.
Laboratory Results: Normal.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old male has health insurance through his job. However, his deductible is $6,000, and he must pay 30% coinsurance for all visits. He skips his blood pressure medications because he cannot afford the out-of-pocket costs.

Vitals: BP 162/98 mmHg.
Physical Examination: Normal.
Laboratory Results: Normal.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This patient is best described as:', '["Uninsured", "Underinsured", "Indigent", "Fully covered"]', 1, 'Underinsurance occurs when people have health insurance but high out-of-pocket costs relative to their income prevent them from accessing care.'),
    (v_case_id, 'What is a common consequence of underinsurance?', '["Delayed medical care", "Increased use of emergency departments for non-emergencies", "Medical debt and bankruptcy", "All of the above"]', 3, 'Underinsurance often leads to the same negative health and financial outcomes as being completely uninsured.'),
    (v_case_id, 'Which of the following is an example of "cost-sharing"?', '["Premiums", "Deductibles", "Coinsurance", "Both Deductibles and Coinsurance"]', 3, 'Deductibles, coinsurance, and copayments are forms of cost-sharing; premiums are the cost of the policy itself.');

    ---------------------------------------------------------------------------
    -- CASE 28: Adverse Selection
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sickest First' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sickest First', 'An insurance company offers a plan with very low premiums but high deductibles. They find that only healthy, young people sign up, while their "Platinum" plan with high premiums and low deductibles attracts only people with multiple chronic illnesses.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An insurance company offers a plan with very low premiums but high deductibles. They find that only healthy, young people sign up, while their "Platinum" plan with high premiums and low deductibles attracts only people with multiple chronic illnesses.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What economic concept describes this situation where high-risk individuals are more likely to purchase insurance?', '["Moral Hazard", "Adverse Selection", "Cost-Shifting", "Capitation"]', 1, 'Adverse selection occurs when there is asymmetric information (patients know their health status better than insurers) leading to a disproportionate enrollment of sick individuals.'),
    (v_case_id, 'If adverse selection is not managed, it can lead to a "Death Spiral," which is:', '["When doctors stop seeing patients", "When premiums rise so high that healthy people leave, causing premiums to rise further", "When the hospital closes down", "A type of insurance fraud"]', 1, 'A death spiral occurs when the insurance pool becomes increasingly high-risk and expensive, eventually making the plan unsustainable.'),
    (v_case_id, 'Which feature of the ACA was designed to mitigate adverse selection by ensuring healthy people stay in the insurance pool?', '["The Individual Mandate (now $0 penalty)", "Guaranteed Issue", "Essential Health Benefits", "Premium Subsidies"]', 0, 'The individual mandate required everyone to have insurance, preventing healthy people from "opting out" until they get sick.');

    ---------------------------------------------------------------------------
    -- CASE 29: Moral Hazard
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Free Lunch Effect' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Free Lunch Effect', 'A patient with a "first-dollar" coverage plan (no deductible or copay) visits the ED for a minor scratch that could have been treated with a simple bandage at home.

Vitals: Normal.
Physical Examination: 1cm superficial abrasion on forearm.
Laboratory Results: Normal.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a "first-dollar" coverage plan (no deductible or copay) visits the ED for a minor scratch that could have been treated with a simple bandage at home.

Vitals: Normal.
Physical Examination: 1cm superficial abrasion on forearm.
Laboratory Results: Normal.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What economic concept describes the tendency for people to use more healthcare services when they do not have to pay for them directly?', '["Adverse Selection", "Moral Hazard", "Supply-Induced Demand", "Cherry Picking"]', 1, 'Moral hazard occurs when insurance changes an individual''s behavior, leading them to use more care than they would if they were paying the full cost.'),
    (v_case_id, 'Which of the following is used by insurers to reduce moral hazard?', '["Lowering premiums", "Deductibles and Copayments", "Increasing the number of specialists", "Advertising on television"]', 1, 'Cost-sharing (deductibles, copays) gives patients "skin in the game," encouraging more prudent use of resources.'),
    (v_case_id, 'True or False: Moral hazard can also occur on the provider side (e.g., ordering extra tests because the insurance will pay for them).', '["True", "False"]', 0, 'Provider-side moral hazard (or supply-induced demand) occurs when clinicians order more services because they are reimbursed for each service.');

    ---------------------------------------------------------------------------
    -- CASE 30: Pre-existing Conditions and the ACA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Protection for the Chronically Ill' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Protection for the Chronically Ill', 'A 40-year-old woman with a history of breast cancer (currently in remission) is looking for individual health insurance on the ACA marketplace.

Vitals: Stable.
Physical Examination: Post-lumpectomy scar.
Laboratory Results: Normal.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old woman with a history of breast cancer (currently in remission) is looking for individual health insurance on the ACA marketplace.

Vitals: Stable.
Physical Examination: Post-lumpectomy scar.
Laboratory Results: Normal.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Under the Affordable Care Act (ACA), can an insurance company deny this patient coverage or charge her more because of her cancer history?', '["Yes, if it was in the last 5 years", "No, due to the \"guaranteed issue\" and \"community rating\" rules", "Only if she is over 65", "Only if she smokes"]', 1, 'The ACA prohibits insurers from denying coverage or charging higher premiums based on pre-existing conditions.'),
    (v_case_id, 'What is the "Community Rating" system?', '["Insurers must charge the same premium to everyone in a geographic area regardless of health status", "The community votes on insurance rates", "Rates are based on the average age of the town", "Insurance is only provided to the community center"]', 0, 'Community rating ensures that sick and healthy individuals pay the same premiums for the same plan.'),
    (v_case_id, 'Which of the following is one of the "Essential Health Benefits" that all ACA-compliant individual and small group plans must cover?', '["Maternity and newborn care", "Mental health and substance use disorder services", "Prescription drugs", "All of the above"]', 3, 'The ACA defined 10 categories of essential health benefits that must be covered by most health plans.');

    ---------------------------------------------------------------------------
    -- CASE 31: EMTALA - The "Anti-Dumping" Law
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Emergency Arrival' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Emergency Arrival', 'A 22-year-old male is brought to the Emergency Department by friends after a motor vehicle accident. He is bleeding from a leg laceration and appears confused. The triage nurse asks for his insurance card, and his friends say he doesn''t have one.

Vitals: BP 90/60 mmHg, HR 120 bpm, RR 24 bpm.
Physical Examination: 10cm jagged laceration on right thigh with active oozing, pale conjunctiva.
Laboratory Results: Hemoglobin 9.2 g/dL.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old male is brought to the Emergency Department by friends after a motor vehicle accident. He is bleeding from a leg laceration and appears confused. The triage nurse asks for his insurance card, and his friends say he doesn''t have one.

Vitals: BP 90/60 mmHg, HR 120 bpm, RR 24 bpm.
Physical Examination: 10cm jagged laceration on right thigh with active oozing, pale conjunctiva.
Laboratory Results: Hemoglobin 9.2 g/dL.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which federal law prohibits the hospital from turning this patient away or transferring him solely because he lacks insurance?', '["HIPAA", "EMTALA", "ERISA", "The Stark Law"]', 1, 'EMTALA (Emergency Medical Treatment and Labor Act) requires Medicare-participating hospitals to provide a medical screening exam and stabilizing treatment to anyone coming to the emergency department, regardless of ability to pay.'),
    (v_case_id, 'Under EMTALA, what is the hospital''s FIRST obligation when the patient arrives?', '["Check for insurance coverage", "Perform a Medical Screening Examination (MSE)", "Call the nearest charity hospital", "Ask for a deposit"]', 1, 'The hospital must perform an MSE to determine if an emergency medical condition (EMC) exists before asking about insurance or ability to pay.'),
    (v_case_id, 'If an Emergency Medical Condition (EMC) is identified, what must the hospital do before attempting a transfer?', '["Provide stabilizing treatment within its capability", "Get a signed waiver from the patient", "Wait for the patient''s family to arrive", "Check the patient''s credit score"]', 0, 'If an EMC exists, the hospital must stabilize the patient within its capability. A transfer can only occur if the benefits of transfer outweigh the risks and the receiving hospital agrees.');

    ---------------------------------------------------------------------------
    -- CASE 32: EMTALA - Stabilization and Transfer
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'High-Risk Transfer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'High-Risk Transfer', 'A small rural hospital ED receives a patient in active labor with crowning. The hospital does not have an OB/GYN on staff. 

Vitals: BP 150/95 mmHg, HR 100 bpm.
Physical Examination: Fetal head visible at the introitus.
Laboratory Results: Not applicable.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A small rural hospital ED receives a patient in active labor with crowning. The hospital does not have an OB/GYN on staff. 

Vitals: BP 150/95 mmHg, HR 100 bpm.
Physical Examination: Fetal head visible at the introitus.
Laboratory Results: Not applicable.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Under EMTALA, "labor" is considered:', '["A personal choice", "An Emergency Medical Condition (EMC)", "A non-emergency until the baby is born", "Only an emergency if there is bleeding"]', 1, 'EMTALA specifically includes "a pregnant woman who is having contractions" as having an EMC if there is inadequate time to effect a safe transfer before delivery.'),
    (v_case_id, 'Can the hospital transfer this patient to a larger facility 30 miles away because they lack a specialist?', '["Yes, immediately", "No, not if the transfer poses a threat to the health/safety of the woman or the unborn child", "Only if the patient pays for the ambulance", "Only if the state governor approves"]', 1, 'If the patient is in "unstable" labor (imminent delivery), a transfer is generally prohibited under EMTALA unless the patient requests it in writing after being informed of the risks.'),
    (v_case_id, 'What is the penalty for a hospital or physician found to be in "dumping" violation of EMTALA?', '["A verbal warning", "Civil monetary penalties and potential termination from Medicare/Medicaid", "A 1-day suspension", "Nothing"]', 1, 'Violations of EMTALA carry heavy fines per violation and can lead to the hospital being excluded from the Medicare program.');

    ---------------------------------------------------------------------------
    -- CASE 33: Stark Law - Physician Self-Referral
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Imaging Center Investment' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Imaging Center Investment', 'A family physician owns a 25% stake in a local independent MRI imaging center. He refers all of his Medicare patients who need scans to this specific center.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A family physician owns a 25% stake in a local independent MRI imaging center. He refers all of his Medicare patients who need scans to this specific center.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which law is primarily concerned with physician "self-referral" for designated health services (DHS) paid for by Medicare?', '["HIPAA", "EMTALA", "The Stark Law", "The Sherman Act"]', 2, 'The Stark Law (Physician Self-Referral Law) prohibits physicians from referring Medicare patients for DHS to an entity in which the physician (or an immediate family member) has a financial interest.'),
    (v_case_id, 'Is the Stark Law a "strict liability" statute?', '["Yes, intent does not matter", "No, you must prove the doctor intended to commit fraud", "Only if the doctor is a surgeon", "Only in the state of California"]', 0, 'Stark is a strict liability statute, meaning that proof of specific intent to violate the law is not required. If the financial relationship exists and an exception isn''t met, it''s a violation.'),
    (v_case_id, 'Which of the following is considered a "Designated Health Service" (DHS) under the Stark Law?', '["Clinical laboratory services", "Physical therapy services", "Radiology and certain other imaging services", "All of the above"]', 3, 'DHS include labs, PT/OT, radiology, DME, home health, and outpatient drugs.');

    ---------------------------------------------------------------------------
    -- CASE 34: Anti-Kickback Statute (AKS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pharmaceutical Dinner' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pharmaceutical Dinner', 'A pharmaceutical representative offers a physician $500 for every patient the physician starts on a new, expensive brand-name antidepressant. The money is described as a "consulting fee."

Vitals: Patient has depression.
Physical Examination: Depressed mood.
Laboratory Results: Normal.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A pharmaceutical representative offers a physician $500 for every patient the physician starts on a new, expensive brand-name antidepressant. The money is described as a "consulting fee."

Vitals: Patient has depression.
Physical Examination: Depressed mood.
Laboratory Results: Normal.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which law prohibits the "knowing and willful" offer, payment, solicitation, or receipt of any remuneration to induce referrals for items/services paid for by a federal healthcare program?', '["The Stark Law", "The Anti-Kickback Statute (AKS)", "The False Claims Act", "ERISA"]', 1, 'The Anti-Kickback Statute (AKS) is a criminal law that prohibits the exchange (or offer to exchange) of anything of value in an effort to induce or reward the referral of federal healthcare program business.'),
    (v_case_id, 'How does the AKS differ from the Stark Law regarding "intent"?', '["Stark requires intent; AKS does not", "AKS requires \"knowing and willful\" intent; Stark is strict liability", "They both require intent", "Neither requires intent"]', 1, 'Unlike Stark, the Anti-Kickback Statute is an intent-based statute; the government must prove the parties acted "knowingly and willfully."'),
    (v_case_id, 'Are kickbacks under the AKS considered a criminal offense?', '["No, only civil fines", "Yes, they are felonies punishable by fines and imprisonment", "Only if someone dies", "Only if the doctor is a specialist"]', 1, 'AKS violations are felonies. Conviction can result in fines, jail time, and exclusion from federal healthcare programs.');

    ---------------------------------------------------------------------------
    -- CASE 35: False Claims Act (FCA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Billing for "Phantom" Services' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Billing for "Phantom" Services', 'A billing manager at a large medical group notices that the clinic is routinely submitting claims to Medicare for complex office visits (Level 5) when only brief, 5-minute checks were actually performed.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A billing manager at a large medical group notices that the clinic is routinely submitting claims to Medicare for complex office visits (Level 5) when only brief, 5-minute checks were actually performed.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which law imposes liability on persons and companies who defraud governmental programs?', '["HIPAA", "The False Claims Act (FCA)", "The Stark Law", "The ADA"]', 1, 'The False Claims Act (FCA) is the federal government''s primary tool in combating fraud against the government.'),
    (v_case_id, 'The FCA includes a "Qui Tam" provision. What does this mean?', '["It allows private individuals (whistleblowers) to file suits on behalf of the government", "It allows the government to seize all assets immediately", "It prevents the clinic from ever billing again", "It requires all doctors to wear body cameras"]', 0, 'The "qui tam" (whistleblower) provision allows private citizens to sue on behalf of the government and receive a portion of the recovered funds.'),
    (v_case_id, 'The practice of billing for a more expensive service than the one actually provided is known as:', '["Downcoding", "Upcoding", "Unbundling", "Bundling"]', 1, 'Upcoding is a fraudulent practice where providers submit codes for more severe or complex conditions/services than were actually documented or provided.');

    ---------------------------------------------------------------------------
    -- CASE 36: Patient Safety - Root Cause Analysis (RCA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'A Sentinel Event' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'A Sentinel Event', 'A patient undergoing a routine appendectomy has the wrong limb prepped and draped for a different surgery due to a failure in the "Time-Out" procedure. The error is caught before the incision is made.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient undergoing a routine appendectomy has the wrong limb prepped and draped for a different surgery due to a failure in the "Time-Out" procedure. The error is caught before the incision is made.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Events like this (wrong-site surgery, even if averted) that result in unexpected death or serious injury, or the risk thereof, are called:', '["Near Misses", "Sentinel Events", "Active Failures", "Latent Errors"]', 1, 'The Joint Commission defines a sentinel event as an unexpected occurrence involving death or serious physical or psychological injury, or the risk thereof.'),
    (v_case_id, 'After a sentinel event, what is the standardized process used to identify the underlying systems failures (rather than just individual blame)?', '["Root Cause Analysis (RCA)", "Peer Review", "Litigation", "Performance Appraisal"]', 0, 'RCA is a structured method used to analyze serious adverse events to identify the "root" systems-level causes and prevent recurrence.'),
    (v_case_id, 'Root Cause Analysis is primarily:', '["Retrospective (looks back at what happened)", "Prospective (looks forward at what might happen)", "Financial (looks at costs)", "Legal (looks at blame)"]', 0, 'RCA is a retrospective process performed AFTER an event has occurred.');

    ---------------------------------------------------------------------------
    -- CASE 37: Patient Safety - FMEA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Anticipating Error' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Anticipating Error', 'A hospital is implementing a new electronic health record (EHR) system. Before the launch, a team sits down to brainstorm all the ways the system could fail and what the consequences would be.

Vitals: Not applicable.
Physical Examination: Not applicable.
Laboratory Results: Not applicable.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital is implementing a new electronic health record (EHR) system. Before the launch, a team sits down to brainstorm all the ways the system could fail and what the consequences would be.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this PROSPECTIVE tool used to identify where and how a process might fail?', '["Root Cause Analysis (RCA)", "Failure Mode and Effects Analysis (FMEA)", "PDSA Cycle", "Hedgehog Concept"]', 1, 'FMEA is a step-by-step approach for identifying all possible failures in a design, a manufacturing or assembly process, or a product or service.'),
    (v_case_id, 'How does FMEA differ from RCA?', '["FMEA is prospective; RCA is retrospective", "RCA is prospective; FMEA is retrospective", "FMEA is for machines; RCA is for people", "They are the same"]', 0, 'FMEA looks forward to prevent errors before they happen; RCA looks back to understand why an error did happen.'),
    (v_case_id, 'In FMEA, which of the following is calculated to prioritize risks?', '["Risk Priority Number (RPN)", "Total Quality Score", "Patient Satisfaction Index", "P-value"]', 0, 'RPN is calculated by multiplying scores for severity, occurrence (probability), and detection.');

    ---------------------------------------------------------------------------
    -- CASE 38: Quality Improvement - PDSA Cycle
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Reducing Wait Times' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Reducing Wait Times', 'A clinic wants to reduce patient wait times. They decide to try a new "double-booking" strategy for only one morning session to see if it improves throughput.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A clinic wants to reduce patient wait times. They decide to try a new "double-booking" strategy for only one morning session to see if it improves throughput.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard four-step cycle used for continuous quality improvement?', '["Identify, Diagnose, Treat, Follow-up", "Plan-Do-Study-Act (PDSA)", "Ask, Acquire, Appraise, Apply", "Observe, Orient, Decide, Act"]', 1, 'The PDSA cycle (Deming Cycle) is a shorthand for testing a change in the real work setting—by planning it, trying it, observing the results, and acting on what is learned.'),
    (v_case_id, 'During the "STUDY" phase of PDSA, the team should:', '["Implement the change hospital-wide", "Analyze the data collected during the Do phase", "Brainstorm new ideas", "Ignore any negative results"]', 1, 'In the Study phase, you compare the data to your predictions and summarize what was learned.'),
    (v_case_id, 'True or False: PDSA cycles should be large and complex to ensure they capture all variables.', '["True", "False"]', 1, 'PDSA cycles should ideally be small and iterative ("small tests of change") to allow for rapid learning and adjustment.');

    ---------------------------------------------------------------------------
    -- CASE 39: Medical Error Reporting
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Culture of Safety' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Culture of Safety', 'A nurse notices that two different medications have very similar-looking labels and are stored next to each other. She reports this "near miss" to the hospital safety committee.

Vitals: Not applicable.
Physical Examination: Not applicable.
Laboratory Results: Not applicable.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A nurse notices that two different medications have very similar-looking labels and are stored next to each other. She reports this "near miss" to the hospital safety committee.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A work environment where individuals are encouraged to report errors or near misses without fear of punishment is known as a:', '["Blame Culture", "Just Culture", "Secretive Culture", "Productivity Culture"]', 1, 'A Just Culture balances the need for an open and honest reporting environment with a process for shared accountability.'),
    (v_case_id, 'Why is it important to report "near misses"?', '["To punish the people involved", "They identify system weaknesses before a patient is actually harmed", "To increase insurance premiums", "They are legally required for billing"]', 1, 'Near misses are "free lessons" that allow organizations to fix problems before they lead to actual injury.'),
    (v_case_id, 'James Reason''s "Swiss Cheese Model" of accident causation suggests that:', '["Errors are always caused by one bad person", "Accidents happen when multiple layers of defense (the cheese slices) have holes that align", "Hospitals should provide more cheese", "Medicine is naturally safe"]', 1, 'The Swiss Cheese Model posits that systems have many layers of defense, but each has flaws (holes). An accident occurs when the holes in many layers momentarily align.');

    ---------------------------------------------------------------------------
    -- CASE 40: Value-Based Care
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Paying for Quality, Not Quantity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Paying for Quality, Not Quantity', 'A healthcare system is moving away from a model where they are paid for every test and procedure they perform, toward a model where they are rewarded for keeping a population of patients healthy.

Vitals: Not applicable.
Physical Examination: Not applicable.
Laboratory Results: Not applicable.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A healthcare system is moving away from a model where they are paid for every test and procedure they perform, toward a model where they are rewarded for keeping a population of patients healthy.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The traditional model of paying for each individual service is called:', '["Capitation", "Bundled Payment", "Fee-for-Service (FFS)", "Salary"]', 2, 'In FFS, providers are reimbursed for each discrete service (visit, test, procedure) provided.'),
    (v_case_id, 'What is the primary incentive in a Fee-for-Service model?', '["To provide the highest quality care", "To increase the volume of services", "To save the government money", "To work as few hours as possible"]', 1, 'FFS incentivizes volume (doing more things) rather than value (outcome or quality).'),
    (v_case_id, 'A payment model where a provider is paid a fixed amount per patient per unit of time, regardless of whether the patient seeks care, is called:', '["Fee-for-service", "Capitation", "Pay-for-performance", "Retainer"]', 1, 'Capitation pays a set "per member per month" fee, incentivizing the provider to keep the patient healthy and avoid unnecessary high-cost interventions.');

    ---------------------------------------------------------------------------
    -- CASE 41: Bundled Payments
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The All-Inclusive Surgery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The All-Inclusive Surgery', 'A hospital system receives a single fixed payment from an insurer for a patient''s entire "episode of care" for a total knee replacement, including the surgery, the hospital stay, and 30 days of post-operative rehab.

Vitals: Stable.
Physical Examination: Normal post-op.
Laboratory Results: Normal.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital system receives a single fixed payment from an insurer for a patient''s entire "episode of care" for a total knee replacement, including the surgery, the hospital stay, and 30 days of post-operative rehab.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This payment model is known as:', '["Fee-for-service", "Capitation", "Bundled Payment (or Episode-based Payment)", "Salary"]', 2, 'Bundled payments establish a single price for a bundle of related services for a specific procedure or condition.'),
    (v_case_id, 'What is the primary goal of bundled payments?', '["To increase the number of surgeries", "To encourage coordination across different providers to improve quality and reduce costs", "To prevent patients from getting surgery", "To allow hospitals to charge whatever they want"]', 1, 'Bundled payments incentivize providers to work together to avoid complications and readmissions, which would otherwise cost the "bundle" more money.'),
    (v_case_id, 'In a bundled payment model, who usually bears the financial risk if a complication occurs that requires a longer hospital stay?', '["The insurer", "The patient", "The provider/hospital", "The government"]', 2, 'In most bundled models, if costs exceed the fixed payment (e.g., due to a complication), the provider/hospital absorbs the loss.');

    ---------------------------------------------------------------------------
    -- CASE 42: Accountable Care Organizations (ACOs)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Shared Savings' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Shared Savings', 'A group of doctors and a local hospital form a network to coordinate care for 10,000 Medicare beneficiaries. If they manage to provide high-quality care for less than Medicare''s projected budget, they get to keep a portion of the savings.

Vitals: Not applicable.
Physical Examination: Not applicable.
Laboratory Results: Not applicable.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A group of doctors and a local hospital form a network to coordinate care for 10,000 Medicare beneficiaries. If they manage to provide high-quality care for less than Medicare''s projected budget, they get to keep a portion of the savings.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This type of organization is called an:', '["HMO", "PPO", "Accountable Care Organization (ACO)", "Independent Practice Association (IPA)"]', 2, 'ACOs are groups of doctors, hospitals, and other health care providers who come together voluntarily to give coordinated high-quality care to their Medicare patients.'),
    (v_case_id, 'What is the "Shared Savings" concept in an ACO?', '["Doctors share their salaries with patients", "The ACO and Medicare share the financial savings generated by efficient, high-quality care", "Patients pay less in premiums", "Hospitals get free equipment"]', 1, 'When an ACO succeeds in both delivering high-quality care and spending health care dollars more wisely, it will share in the savings it achieves for the Medicare program.'),
    (v_case_id, 'True or False: ACOs are only for Medicare patients.', '["True", "False"]', 1, 'While the most prominent ACO model is the Medicare Shared Savings Program, many private insurers also have ACO-like arrangements.');

    ---------------------------------------------------------------------------
    -- CASE 43: Patient-Centered Medical Home (PCMH)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Medical Home' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Medical Home', 'A primary care practice implements a new team-based approach. Patients have access to a pharmacist, a social worker, and a nutritionist all within the same office, coordinated by their physician. They also offer expanded hours and an online portal for communication.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Normal.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A primary care practice implements a new team-based approach. Patients have access to a pharmacist, a social worker, and a nutritionist all within the same office, coordinated by their physician. They also offer expanded hours and an online portal for communication.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This model of care delivery is known as the:', '["Inpatient Ward", "Patient-Centered Medical Home (PCMH)", "Urgent Care Center", "Hospice House"]', 1, 'The PCMH is a care delivery model whereby patient treatment is coordinated through their primary care physician to ensure they receive the necessary care when and where they need it.'),
    (v_case_id, 'Which of the following is a core principle of the PCMH?', '["Comprehensive Care", "Patient-Centered Care", "Coordinated Care", "All of the above"]', 3, 'Core principles include comprehensive care, patient-centeredness, coordinated care, accessible services, and a commitment to quality and safety.'),
    (v_case_id, 'In a PCMH, the primary goal of "coordinated care" is to:', '["Make more money for the specialist", "Prevent fragmented care and reduce duplicative testing", "Ensure the patient stays in the hospital longer", "Limit the patient''s access to the internet"]', 1, 'Coordination ensures that all of a patient''s providers are communicating, which improves safety and efficiency.');

    ---------------------------------------------------------------------------
    -- CASE 44: DRGs - Diagnosis-Related Groups
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hospital Reimbursement' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hospital Reimbursement', 'A hospital is reimbursed a fixed amount for a patient admitted with "Heart Failure with Complications." Whether the patient stays 3 days or 7 days, the base payment to the hospital remains the same.

Vitals: BP 145/90.
Physical Examination: +2 edema, S3 gallop.
Laboratory Results: BNP 1200 pg/mL.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A hospital is reimbursed a fixed amount for a patient admitted with "Heart Failure with Complications." Whether the patient stays 3 days or 7 days, the base payment to the hospital remains the same.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the system Medicare uses to pay hospitals for inpatient stays based on the patient''s diagnosis and severity?', '["CPT Codes", "Diagnosis-Related Groups (DRGs)", "RBRVS", "ICD-10-CM"]', 1, 'DRGs are a prospective payment system where hospitals are paid a fixed amount per admission based on the patient''s clinical group.'),
    (v_case_id, 'What does the DRG system incentivize hospitals to do?', '["Keep patients in the hospital as long as possible", "Perform as many tests as possible", "Discharge patients efficiently and safely", "Only admit healthy patients"]', 2, 'Because the payment is fixed, hospitals benefit financially if they can provide high-quality care efficiently and reduce the length of stay.'),
    (v_case_id, 'If a patient is readmitted for the same condition within 30 days, how does Medicare typically react under the Hospital Readmissions Reduction Program (HRRP)?', '["Pay the hospital double", "Potentially penalize the hospital by reducing overall payments", "Ignore the readmission", "Pay for the second stay but not the first"]', 1, 'The HRRP reduces payments to hospitals with higher-than-expected readmission rates for certain conditions (e.g., HF, MI, Pneumonia).');

    ---------------------------------------------------------------------------
    -- CASE 45: HCAHPS
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Patient Voice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Patient Voice', 'After discharge, a patient receives a survey asking about how well the nurses and doctors communicated, how quiet the hospital was at night, and whether they received instructions about their medications.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'After discharge, a patient receives a survey asking about how well the nurses and doctors communicated, how quiet the hospital was at night, and whether they received instructions about their medications.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this national, standardized survey of patients'' perspectives of hospital care?', '["HCAHPS (Hospital Consumer Assessment of Healthcare Providers and Systems)", "Press Ganey", "Gallup Poll", "The USMLE Survey"]', 0, 'HCAHPS is a survey instrument and data collection methodology for measuring patients'' perceptions of their hospital experience.'),
    (v_case_id, 'Why do hospital administrators care about HCAHPS scores?', '["They are published on the \"Hospital Compare\" website", "A portion of Medicare reimbursement is tied to these scores (Value-Based Purchasing)", "They help identify areas for improvement", "All of the above"]', 3, 'HCAHPS scores affect a hospital''s public image and its financial bottom line through Medicare''s incentive programs.'),
    (v_case_id, 'Which of the following is a dimension measured by HCAHPS?', '["Doctor communication", "Nurse communication", "Cleanliness and quietness of the hospital environment", "All of the above"]', 3, 'HCAHPS covers multiple domains of the patient experience.');

    ---------------------------------------------------------------------------
    -- CASE 46: MACRA / MIPS
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Physician Quality Reporting' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Physician Quality Reporting', 'A physician in private practice must report data to Medicare on quality measures, such as the percentage of their diabetic patients who have had an A1c test in the last year.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician in private practice must report data to Medicare on quality measures, such as the percentage of their diabetic patients who have had an A1c test in the last year.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the program that adjusts physician Medicare payments based on performance in quality, cost, and improvement activities?', '["MIPS (Merit-based Incentive Payment System)", "The Stark Law", "Social Security", "The Physician Fee Schedule"]', 0, 'MIPS is one of the two pathways under MACRA (Medicare Access and CHIP Reauthorization Act) for physician payment.'),
    (v_case_id, 'The other pathway under MACRA, for physicians who take on significant financial risk in their practice model, is called:', '["Traditional Medicare", "Advanced Alternative Payment Models (APMs)", "HMO Path", "Cash-only"]', 1, 'APMs are payment approaches that give added incentive payments to provide high-quality and cost-efficient care.'),
    (v_case_id, 'True or False: Under MIPS, a physician''s payment can be adjusted either upward (a bonus) or downward (a penalty).', '["True", "False"]', 0, 'MIPS is budget-neutral; high performers receive bonuses funded by the penalties paid by low performers.');

    ---------------------------------------------------------------------------
    -- CASE 47: Health Disparities and SDoH
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Beyond the Clinic Walls' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Beyond the Clinic Walls', 'A 45-year-old male with poorly controlled asthma lives in a neighborhood with high levels of industrial pollution and lacks a reliable way to get to his pharmacy.

Vitals: BP 120/80, HR 88, RR 20.
Physical Examination: Expiratory wheezing bilaterally.
Laboratory Results: Peak flow 250 L/min (low).', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male with poorly controlled asthma lives in a neighborhood with high levels of industrial pollution and lacks a reliable way to get to his pharmacy.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The conditions in which people are born, grow, live, work, and age are known as:', '["Clinical Outcomes", "Social Determinants of Health (SDoH)", "Genetic Factors", "Patient Choices"]', 1, 'SDoH (e.g., housing, transportation, environment) have a profound impact on health outcomes, often more than clinical care itself.'),
    (v_case_id, 'The term for preventable differences in the burden of disease or opportunities to achieve optimal health experienced by socially disadvantaged populations is:', '["Health Disparities (or Inequities)", "Natural Selection", "Market Failure", "Universal Coverage"]', 0, 'Health disparities are often linked to social, economic, and/or environmental disadvantage.'),
    (v_case_id, 'Addressing "Food Insecurity" (lack of access to healthy food) is an example of an intervention at which level?', '["Cellular", "Individual clinical", "Social/Structural", "Spiritual"]', 2, 'Addressing SDoH like food insecurity requires structural or social interventions beyond the traditional clinical encounter.');

    ---------------------------------------------------------------------------
    -- CASE 48: Public Health Reporting
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mandatory Reporting' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mandatory Reporting', 'A physician diagnoses a 19-year-old college student with Neisseria meningitidis (meningococcal disease).

Vitals: Temp 102.5°F, BP 100/60, HR 110.
Physical Examination: Nuchal rigidity, petechial rash on trunk.
Laboratory Results: CSF shows Gram-negative diplococci.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A physician diagnoses a 19-year-old college student with Neisseria meningitidis (meningococcal disease).', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Must the physician report this diagnosis to public health authorities?', '["No, it violates HIPAA", "Yes, it is a \"reportable\" or \"notifiable\" disease", "Only if the patient gives written consent", "Only if it becomes an outbreak"]', 1, 'Physicians are legally required to report "notifiable" diseases to local or state health departments to protect public health.'),
    (v_case_id, 'Does reporting mandatory diseases to the health department without patient consent violate HIPAA?', '["Yes", "No, HIPAA has a \"public health exception\"", "Only if the report is anonymous", "Only for children"]', 1, 'HIPAA allows the disclosure of protected health information for public health activities, such as disease reporting and surveillance.'),
    (v_case_id, 'Which of the following is typically a reportable disease in most states?', '["Syphilis and HIV", "Tuberculosis", "Measles", "All of the above"]', 3, 'Infectious diseases that pose a significant public threat are mandatory reportable events.');

    ---------------------------------------------------------------------------
    -- CASE 49: USPSTF Recommendations
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Evidence-Based Prevention' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Evidence-Based Prevention', 'A 50-year-old male with a 30 pack-year smoking history (quit 5 years ago) comes in for a physical. The doctor reviews screening recommendations.

Vitals: Stable.
Physical Examination: Normal.
Laboratory Results: Normal.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male with a 30 pack-year smoking history (quit 5 years ago) comes in for a physical. The doctor reviews screening recommendations.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which independent panel of experts provides evidence-based recommendations for clinical preventive services?', '["The CDC", "The FDA", "The US Preventive Services Task Force (USPSTF)", "The AMA"]', 2, 'The USPSTF assigns grades (A, B, C, D, or I) to various screenings, counseling services, and preventive medications.'),
    (v_case_id, 'A USPSTF "Grade A" or "Grade B" recommendation means:', '["The service is not recommended", "There is high certainty that the net benefit is moderate to substantial", "The service should only be done in hospitals", "The evidence is insufficient"]', 1, 'Under the ACA, most private plans and Medicare must cover Grade A and B recommendations without patient cost-sharing.'),
    (v_case_id, 'For this 50-year-old former smoker (30 pack-years), which of the following is currently a USPSTF Grade B recommendation?', '["Annual screening for lung cancer with low-dose CT", "Annual chest X-ray", "Sputum cytology every 6 months", "No screening is recommended"]', 0, 'The USPSTF recommends annual screening for lung cancer with low-dose computed tomography (LDCT) in adults aged 50 to 80 years who have a 20 pack-year smoking history and currently smoke or have quit within the past 15 years.');

    ---------------------------------------------------------------------------
    -- CASE 50: Safety Net Hospitals
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Essential Hospital' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Essential Hospital', 'A large urban hospital provides a significant amount of care to uninsured patients, Medicaid beneficiaries, and other vulnerable populations, regardless of their ability to pay.

Vitals: Not applicable.
Physical Examination: Not applicable.
Laboratory Results: Not applicable.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A large urban hospital provides a significant amount of care to uninsured patients, Medicaid beneficiaries, and other vulnerable populations, regardless of their ability to pay.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'These hospitals are commonly referred to as:', '["Boutique Hospitals", "Safety Net Hospitals", "For-Profit Facilities", "Concierge Clinics"]', 1, 'Safety net hospitals are those that have a legal mandate or explicitly stated mission to provide care to people regardless of their ability to pay.'),
    (v_case_id, 'Which federal payment helps offset the costs these hospitals incur by treating large numbers of low-income and uninsured patients?', '["DSH (Disproportionate Share Hospital) payments", "GME payments", "Research grants", "Property tax refunds"]', 0, 'DSH payments are provided by both Medicare and Medicaid to hospitals that serve a significantly disproportionate number of low-income patients.'),
    (v_case_id, 'True or False: Safety net hospitals often face greater financial challenges because they rely heavily on lower-reimbursing public payers (Medicaid) and uncompensated care.', '["True", "False"]', 0, 'Safety net hospitals are often more financially vulnerable because of their patient mix and mission.');

END $$;

COMMIT;
