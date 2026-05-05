BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-contraception' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-contraception not found.';
    END IF;

    -- Batch 6: 301-335 (Final Review and Comprehensive Counseling)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '301: A 19-year-old on OCPs is starting treatment for TB with Rifampin. Most important advice?', '["OCPs are still effective", "Rifampin significantly decreases OCP efficacy; use a backup method (condoms) or switch to LARC", "Stop all meds", "None"]', 1, 'Rifampin is the only antibiotic with a proven, clinically significant interaction with COCs. (ACOG)'),
    (v_topic_id, '302: A woman with "Migraine with Aura" wants the most effective reversible method. Best choice?', '["COCs", "Nexplanon or Progestin-only IUD", "The Patch", "None"]', 1, 'Avoid estrogen in patients with aura. (CDC)'),
    (v_topic_id, '303: "IUD" - A patient has a "Positive Pregnancy Test" with an IUD in place. Ultrasound confirms an INTRAUTERINE pregnancy. Next step?', '["Immediate termination", "Remove IUD if strings are visible (reduces risk of septic abortion/preterm labor)", "Leave it", "None"]', 1, 'Early removal improves pregnancy outcomes. (ACOG)'),
    (v_topic_id, '304: "Plan B" (Levonorgestrel) vs "Ella" (Ulipristal): Which one is more effective closer to the time of ovulation?', '["Plan B", "Ella (can still work during the LH surge but before rupture)", "Same", "None"]', 1, 'Ulipristal has a broader window of efficacy. (Williams)'),
    (v_topic_id, '305: A woman is 35, smokes 20 cigarettes/day, and has regular cycles. Contraceptive choice?', '["COCs", "Copper IUD or Progestin-only method", "Patch", "None"]', 1, 'Estrogen is contraindicated in smokers > 35. (CDC)'),
    (v_topic_id, '306: "IUD" - If a patient has a "Uterine Perforation" during insertion, what is the most common presenting sign?', '["Severe bleeding", "A "loss of resistance" during sounding or insertion and higher-than-expected depth", "Fever", "None"]', 1, 'Requires immediate stopping and evaluation. (Beckmann)'),
    (v_topic_id, '307: "OCPs" - Protective effect against "Ovarian Cancer" is roughly what percentage reduction after 5 years of use?', '["10%", "50%", "90%", "0%"]', 1, 'Significant long-term cancer prevention benefit. (ACOG)'),
    (v_topic_id, '308: "Nexplanon" - What is the failure rate per 100 woman-years (Pearl Index)?', '["0.05", "1.0", "5.0", "None"]', 0, 'The most effective reversible contraceptive available. (ACOG)'),
    (v_topic_id, '309: "Depo-Provera" - Can a woman get her first injection during menses?', '["No", "Yes, and no backup is needed if started within 7 days of menses onset", "Wait 1 month", "None"]', 1, 'Immediate protection if started during the period. (CDC)'),
    (v_topic_id, '310: "Sterilization" - Does "Tubal Ligation" cause earlier menopause?', '["Yes", "No (the ovaries continue to function normally)", "Maybe", "None"]', 1, 'Surgery only affects the tubes. (Beckmann)'),
    (v_topic_id, '311: "Copper IUD" - If a patient is breastfeeding. IUD category?', '["1 (No restriction)", "2", "3", "4"]', 0, 'Safe and effective non-hormonal option for lactating women. (CDC)'),
    (v_topic_id, '312: "OCPs" - If a patient has "Severe Hypertension" (170/110). COC category?', '["1", "2", "3", "4"]', 3, 'High risk for cardiovascular events. (CDC)'),
    (v_topic_id, '313: "Nexplanon" - "Return to ovulation" after removal?', '["1 year", "Within 1-3 weeks for most women", "Never", "None"]', 1, 'Highly and rapidly reversible. (Williams)'),
    (v_topic_id, '314: "IUD" - If a patient has "Purulent Cervicitis" (active infection). IUD initiation category?', '["1", "2", "3", "4"]', 3, 'Delay initiation until the infection is resolved. (CDC)'),
    (v_topic_id, '315: "Emergency Contraception" - Can a "Copper IUD" be used as EC in a woman with a BMI of 40?', '["No", "Yes, it is the most effective EC method for obese women", "Only if < 25", "None"]', 1, 'No weight limit for IUD efficacy. (ACOG)'),
    (v_topic_id, '316: "Vasectomy" - Risk of "regret" is lower when the patient is over age _____?', '["21", "25", "30", "None"]', 2, 'Age is a major predictor of sterilization regret. (ACOG)'),
    (v_topic_id, '317: "OCPs" - Does it protect against "Benign Breast Disease" (e.g. fibrocystic changes)?', '["No", "Yes, it reduces the incidence of benign breast disease", "Makes it worse", "None"]', 1, 'A non-contraceptive benefit. (Beckmann)'),
    (v_topic_id, '318: "IUD" - If the patient has "Lichen Sclerosus". IUD category?', '["1", "2", "4", "None"]', 0, 'No restriction. (CDC)'),
    (v_topic_id, '319: "Patch" - "Return to fertility" after stopping?', '["1 year", "Rapid (usually within 1-2 months)", "Immediate", "None"]', 1, 'Similar to OCPs. (Williams)'),
    (v_topic_id, '320: "Depo-Provera" - If a patient has "Unexplained Vaginal Bleeding". DMPA initiation category?', '["1", "2", "3", "4"]', 2, 'Wait for diagnosis before starting. (CDC)'),
    (v_topic_id, '321: "OCPs" - A patient has "Factor V Leiden mutation". COC category?', '["1", "2", "3", "4"]', 3, 'High risk of VTE. (CDC)'),
    (v_topic_id, '322: "IUD" - A patient has "History of PID". Current asymptomatic. IUD category?', '["1", "2", "4", "None"]', 0, 'No restriction if the infection is resolved. (CDC)'),
    (v_topic_id, '323: "Nexplanon" - Does it affect "Lactation"?', '["Yes, stops it", "No (progestin-only methods are safe for breastfeeding)", "Maybe", "None"]', 1, 'Can be inserted immediately postpartum. (ACOG)'),
    (v_topic_id, '324: "OCPs" - Effect on "Pelvic Inflammatory Disease" (PID)?', '["Increases risk", "Reduces risk of symptomatic PID (via thickened cervical mucus)", "No effect", "None"]', 1, 'Protective against ascending infection. (Williams)'),
    (v_topic_id, '325: "Copper IUD" - If a patient has a "Copper IUD" and gets PID. Should it be removed?', '["Yes, immediately", "No, treat PID with the IUD in place (standard guidelines)", "Only if severe", "None"]', 1, 'No benefit to removal during treatment. (ACOG)'),
    (v_topic_id, '326: "Sterilization" - "Bilateral Salpingectomy" - Is it the current "standard of care" for permanent contraception?', '["No, ligation is preferred", "Yes, increasingly preferred due to ovarian cancer risk reduction", "Only in teens", "None"]', 1, 'Opportunistic salpingectomy is the modern standard. (ACOG)'),
    (v_topic_id, '327: "OCPs" - If a patient is "over 50" and still has regular cycles. Can she take OCPs?', '["No", "Yes, if she is a non-smoker and has no other contraindications", "Only if parous", "None"]', 1, 'Benefits for cycle control and BMD. (ACOG)'),
    (v_topic_id, '328: "Emergency Contraception" - "Ella" vs "Plan B": Which is more effective between 72 and 120 hours?', '["Plan B", "Ella (maintains efficacy throughout the 5-day window)", "Same", "None"]', 1, 'Superior in the late window. (ACOG)'),
    (v_topic_id, '329: "IUD" - A patient has "Severe Liver Cirrhosis". IUD category?', '["1", "2", "4", "None"]', 0, 'LNG-IUD is Category 1; Copper is Category 1. (CDC)'),
    (v_topic_id, '330: "Vasectomy" - Does it cause "Autoimmune" disease?', '["Yes", "No (though anti-sperm antibodies develop, they have no systemic health effect)", "Only in teens", "None"]', 1, 'Scientific consensus. (ACOG)'),
    (v_topic_id, '331: "OCPs" - If a patient is starting "Hepatitis C" treatment (e.g. Viekira Pak). COC category?', '["1", "2", "3", "4"]', 3, 'Can cause liver enzyme elevations. (CDC)'),
    (v_topic_id, '332: "Nexplanon" - Does it decrease "Endometrial Cancer" risk?', '["Yes (likely, similar to other progestins)", "No", "Increases it", "None"]', 0, 'By thinning the lining. (Williams)'),
    (v_topic_id, '333: "Contraception" - What is the most important factor for "Patient Satisfaction"?', '["Cost", "Choice (counseling that honors the patient''s preferences and values)", "Speed", "None"]', 1, 'Shared decision-making is essential. (ACOG)'),
    (v_topic_id, '334: "IUD" - A patient has "Multiple sexual partners". Is an IUD contraindicated?', '["Yes", "No (behavior is not a contraindication; just counsel on STI protection)", "Only in teens", "None"]', 1, 'Current guidelines. (ACOG)'),
    (v_topic_id, '335: "Contraception" - What is the "Best" method overall?', '["Condoms", "The one the patient chooses and will use consistently and correctly", "Hysterectomy", "None"]', 1, 'Individualized care is the goal. (ACOG)');

    RAISE NOTICE 'SUCCESS: Final Batch 6 (301-335) MCQs for Contraception registered.';
    RAISE NOTICE 'TOTAL MCQS FOR THIS TOPIC: 335';
END $$;
COMMIT;
