BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-contraception' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-contraception not found.';
    END IF;

    -- Use a temporary table to stage insertions and prevent duplicates
    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('241: A 15-year-old requesting contraception in a state with "minor consent" laws. Should you inform her parents?', '["Yes, immediately", "No, confidentiality should be maintained to ensure the minor continues to seek healthcare", "Only if she chooses an IUD", "None"]', 1, 'Standard of care for adolescent reproductive health. (ACOG; AAP)'),
    
    ('242: Which principle of ethics is most relevant when a provider refuses to provide contraception based on personal beliefs?', '["Autonomy", "Beneficence", "Conscientious Objection (with the duty to refer the patient for timely care)", "Justice"]', 2, 'Ethical balance between provider belief and patient access. (ACOG)'),
    
    ('243: "Reproductive Coercion" involves:', '["Choosing a method together", "A partner interfering with contraceptive use or forcing a pregnancy", "Using condoms", "None"]', 1, 'Screening for intimate partner violence (IPV) is essential in family planning visits. (ACOG)'),
    
    ('244: What is the primary reason for "unintended pregnancy" worldwide?', '["Lack of knowledge", "Unmet need for modern contraception", "Method failure", "None"]', 1, 'Global health priority. (WHO; ACOG)'),
    
    ('245: A woman with "Intellectual Disability" requesting sterilization. What is the key legal requirement?', '["Parental permission only", "Strict adherence to state laws regarding capacity and the \"best interests\" of the patient, often requiring court oversight", "Refusal", "None"]', 1, 'Protects against historical abuses/coerced sterilization. (ACOG)'),
    
    ('246: A 28-year-old with "End Stage Renal Disease" on hemodialysis. Safest method?', '["OCPs", "LARC (IUD or Nexplanon)", "NFP", "None"]', 1, 'Avoids estrogen-related blood pressure and clotting issues. (ACOG; USMEC)'),
    
    ('247: A woman on "Warfarin" (Coumadin) for a mechanical heart valve. Which is generally PREFERRED to avoid interaction and bleeding?', '["OCPs", "Levonorgestrel IUD or Nexplanon (reduces menstrual bleeding which may be worsened by anticoagulation)", "Copper IUD", "None"]', 1, 'Progestin-only LARCs are excellent for anticoagulated patients. (ACOG; Williams)'),
    
    ('248: Does "emergency contraception" (Ella or Plan B) have any "Category 4" contraindications?', '["Current breast cancer", "History of VTE", "Pregnancy (it won''t work, but it''s not harmful)", "None (it is safe for almost all women)"]', 3, 'Safe for one-time use even with comorbidities. (ACOG; USMEC)'),
    
    ('249: A woman with "Multiple Sclerosis" (MS) with limited mobility. Why is "Estrogen" avoided?', '["It causes MS flares", "Increased VTE risk due to immobility", "It interacts with MS meds", "None"]', 1, 'Immobility is a Category 3/4 for COCs. (ACOG; USMEC)'),
    
    ('250: "LARC" (IUDs and Implants) should be offered as _____ to all women desiring contraception.', '["Second-line", "First-line (due to highest efficacy and satisfaction)", "Last resort", "None"]', 1, 'Current ACOG recommendation. (ACOG)'),
    
    ('251: A woman on "Depo-Provera" has NOT had a period for 2 years. She is worried about "blood building up." Reassurance?', '["Yes, it is dangerous", "No, the lining (endometrium) is simply thin and not building up; this is safe and protective", "She needs a D&C", "None"]', 1, 'Essential patient education. (Beckmann; Williams)'),
    
    ('252: "IUD" string check: Is it still recommended for patients to check their own strings?', '["Yes, every day", "It is optional (ACOG notes that evidence is limited on its utility but many providers still teach it)", "No, it is dangerous", "None"]', 1, 'Focus is moving toward regular professional check-ups and self-awareness of symptoms. (ACOG)'),
    
    ('253: A woman with an IUD has "heavy vaginal discharge" and "cervical motion tenderness." Management?', '["Remove IUD and wait", "Treat for PID (Ceftriaxone + Doxycycline); IUD can stay unless she fails to improve", "Wash with soap", "None"]', 1, 'Follow CDC PID treatment guidelines. (CDC; ACOG)'),
    
    ('254: "Nexplanon" removal: If the rod has "migrated" deep into the muscle, who should remove it?', '["General surgeon", "Interventional Radiologist or Surgeon under ultrasound/fluoroscopy guidance", "Medical student", "None"]', 1, 'Deep implants require specialized removal. (ACOG; Williams)'),
    
    ('255: After "Vasectomy", the man is considered sterile when the sperm count is _____ on two consecutive samples.', '["< 1 million", "Zero (Azoospermia)", "< 100", "None"]', 1, 'Standard for success. (Beckmann)'),
    
    ('256: "Sterilization" by "Tubal Ligation" is done via which common laparoscopic approach?', '["Monopolar", "Bipolar cautery or mechanical clips/rings", "Scissors only", "None"]', 1, 'Bipolar is the most common energy-based method. (Williams; Beckmann)'),
    
    ('257: A patient on "Levothyroxine" for hypothyroidism starts COCs. What might happen?', '["She will lose weight", "The estrogen increases Thyroid Binding Globulin (TBG), potentially necessitating a higher dose of Levothyroxine", "She will stop sleeping", "None"]', 1, 'Estrogen increases binding proteins; monitor TSH. (Williams)'),
    
    ('258: Does "emergency contraception" (Plan B) cause a "miscarriage"?', '["Yes", "No, it works before fertilization/implantation occurs", "Only if taken with water", "None"]', 1, 'Clarifying mechanism to patients is vital. (ACOG)'),
    
    ('259: Which IUD provides the MOST effective treatment for "Menorrhagia"?', '["Copper IUD", "Mirena (52mg LNG)", "Kyleena (19.5mg LNG)", "None"]', 1, 'Higher dose LNG provides more endometrial suppression. (ACOG; Beckmann)'),
    
    ('260: A 42-year-old smoker wants an IUD. Safe?', '["No", "Yes (Category 1); smoking is NOT a contraindication for progestin-only or copper IUDs", "Only if she stops", "None"]', 1, 'Key distinction from COCs. (USMEC; ACOG)'),
    
    ('261: "Combined Hormonal Contraception" and "Inflammatory Bowel Disease" (IBD): Which is a concern?', '["Estrogen only", "Absorption (in Crohn''s) and VTE risk (during active flares)", "Progesterone only", "None"]', 1, 'Parenteral methods (Patch/Ring/LARC) may be better. (ACOG; USMEC)'),
    
    ('262: "Copper IUD" and "MRI": If the patient is at 3.0 Tesla, is it safe?', '["No", "Yes (most are safe up to 3T; check specific label)", "Only at 1T", "None"]', 1, 'Standard safety check. (Williams)'),
    
    ('263: A woman on "Depo-Provera" wants to switch to "POPs." When?', '["Wait 1 year", "Start on the day the next injection was due", "Immediately", "None"]', 1, 'Ensures no gap in coverage. (ACOG; CDC)'),
    
    ('264: "Nexplanon" side effect: "Acne" occurs in about _____% of users.', '["1%", "10-15%", "50%", "None"]', 1, 'Important to mention as it can lead to discontinuation. (Beckmann)'),
    
    ('265: "Tubal Ligation" and "Ectopic Pregnancy": If a woman gets pregnant AFTER a tubal ligation, _____% are ectopic.', '["1%", "10%", "33% (1 in 3)", "None"]', 2, 'High relative risk in failures. (Williams; ACOG)'),
    
    ('266: "Vasectomy" and "Cancer": Is there a proven link to Prostate Cancer?', '["Yes", "No, large studies have debunked this link", "Only in smokers", "None"]', 1, 'Reassure male patients. (Beckmann; AUA)'),
    
    ('267: A woman with "Ovarian Cancer" risk (BRCA1 mutation). Best contraception?', '["Copper IUD", "COCs (since they reduce ovarian cancer risk by ~50%)", "NFP", "None"]', 1, 'Medical prophylaxis. (ACOG; Williams)'),
    
    ('268: "Combined Hormonal Contraception" is Category _____ for "Uncomplicated Valvular Heart Disease."', '["1", "2", "3", "4"]', 1, 'Category 2. (USMEC; ACOG)'),
    
    ('269: "IUD" and "Fibroids": If the fibroid is NOT distorting the cavity, is it safe?', '["No", "Yes (Category 1)", "Only if < 1 cm", "None"]', 1, 'Safety depends on cavity architecture. (USMEC; ACOG)'),
    
    ('270: "Nexplanon" and "Breastfeeding": Does it affect milk composition?', '["Yes", "No (Category 1 after 4-6 weeks; Category 2 before)", "Only in older women", "None"]', 1, 'Safe postpartum option. (ACOG)'),
    
    ('271: "Emergency Contraception" (Ella) and "Breastfeeding": Wait _____ before nursing again.', '["No wait", "24 hours", "1 week", "None"]', 1, 'Specific recommendation for Ella. (ACOG)'),
    
    ('272: "Combined" Vaginal Ring (NuvaRing) is Category _____ for women with "Benign Breast Disease."', '["1", "2", "3", "4"]', 0, 'Category 1. (USMEC; ACOG)'),
    
    ('273: "Copper IUD" and "Menopause": When should it be removed?', '["Immediately at age 50", "1 year after the last menstrual period", "Wait until 60", "None"]', 1, 'To ensure pregnancy risk is zero. (ACOG)'),
    
    ('274: "Nexplanon" and "Infection": Risk at insertion site is approximately:', '["< 1%", "5%", "20%", "None"]', 0, 'Rare complication. (Beckmann)'),
    
    ('275: "IUD" and "Pelvic Inflammatory Disease" (PID): Does the IUD need to be removed during treatment?', '["Yes", "No, only if the patient does not improve with antibiotics in 48-72 hours", "Only if it is copper", "None"]', 1, 'Standard of care. (CDC; ACOG)'),
    
    ('276: A woman on "Depo-Provera" has "spotting" and "depression." Management?', '["Ignore", "Counsel and consider switching (progestin-only methods can worsen mood in some)", "Give estrogen", "None"]', 1, 'Comprehensive care. (Beckmann)'),
    
    ('277: "Copper IUD" and "Dysmenorrhea": Can it be treated with NSAIDs?', '["No", "Yes, NSAIDs are first-line for copper IUD-associated pain and bleeding", "Only surgery", "None"]', 1, 'Helps patients tolerate the device. (ACOG; Williams)'),
    
    ('278: "Combined Hormonal Contraception" risk of VTE is highest in which year of use?', '["First year", "Fifth year", "Tenth year", "None"]', 0, 'Risk is highest in new starts and re-starts. (ACOG; Williams)'),
    
    ('279: "Progestin" in the implant (Nexplanon) inhibits ovulation for _____ years.', '["1", "3", "10", "None"]', 1, 'Main mechanism for this device. (Beckmann)'),
    
    ('280: "IUD" and "Ectopic Pregnancy": The IUD _____ the absolute risk of ectopic pregnancy compared to no contraception.', '["Increases", "Decreases", "Does not change", "None"]', 1, 'Because it prevents so many total pregnancies. (ACOG; Williams)'),
    
    ('281: "Combined Hormonal Contraception" is Category _____ for "Controlled Hypertension" (140-159/90-99).', '["1", "2", "3", "4"]', 2, 'Category 3. (USMEC; ACOG)'),
    
    ('282: "IUD" and "HIV": Is it safe to initiate in an HIV-positive woman?', '["No", "Yes (Category 1) for copper and LNG", "Only if on HAART", "None"]', 1, 'Safe and effective. (USMEC; ACOG)'),
    
    ('283: "Emergency Contraception": How many times can a woman use it in a year?', '["1", "12", "As many times as needed (though long-term methods are better)", "None"]', 2, 'No medical restriction. (ACOG)'),
    
    ('284: "Combined" Vaginal Ring (NuvaRing) is Category _____ for "Hyperthyroidism."', '["1", "2", "3", "4"]', 0, 'Category 1. (USMEC; ACOG)'),
    
    ('285: "Copper IUD" and "Pregnancy": If not removed in the 1st trimester, what is the miscarriage risk?', '["10%", "50%", "90%", "None"]', 1, 'Significant risk if left in place. (Williams; ACOG)'),
    
    ('286: "Sterilization" Regret: "Young age" is more significant than the number of "children" a woman has.', '["True", "False", "Only in men", "None"]', 0, 'Key counseling pearl. (Williams)'),
    
    ('287: "Combined" Patch (Xulane) is Category _____ for "Obesity" (BMI >= 30).', '["1", "2", "3", "4"]', 1, 'Category 2 for Twirla; Category 3 for Xulane if BMI >= 30. (USMEC; ACOG)'),
    
    ('288: "Progestin-Only" Injectable (DMPA) is Category _____ for "Active VTE."', '["1", "2", "3", "4"]', 1, 'Category 2. (USMEC; ACOG)'),
    
    ('289: "Nexplanon" and "BMI": Is efficacy reduced in obese women?', '["Yes, significantly", "No clinical data has proven reduced efficacy in obesity", "Only for copper", "None"]', 1, 'Remains one of the most effective methods. (ACOG)'),
    
    ('290: "Emergency Contraception" (Plan B) does NOT work if the woman is already _____ at the time of intercourse.', '["Ovulating", "Pregnant", "Bleeding", "None"]', 1, 'EC is not an abortifacient. (ACOG)'),
    
    ('291: "IUD" and "Actinomyces": If symptomatic (e.g., pain/fever), what is the antibiotic of choice?', '["Doxycycline", "Penicillin", "Metronidazole", "None"]', 1, 'Standard treatment for Actinomycosis. (Williams; Beckmann)'),
    
    ('292: "Combined" Vaginal Ring (NuvaRing) is Category _____ for "Gallbladder Disease" (Post-cholecystectomy).', '["1", "2", "3", "4"]', 0, 'Category 1. (USMEC; ACOG)'),
    
    ('293: "Copper IUD" is Category _____ for "Pelvic Inflammatory Disease" (CONTINUATION).', '["1", "2", "3", "4"]', 1, 'Category 2 (can stay while treating). (USMEC; ACOG)'),
    
    ('294: "Nexplanon" and "Acne": If a patient wants to keep the rod but treat the acne, what can be used?', '["Topical retinoids", "Spironolactone or OCPs (if no contraindications)", "Nothing", "None"]', 1, 'Clinical management of side effects. (Williams)'),
    
    ('295: "Sterilization" failure: Most failures occur within _____ months of the procedure.', '["1", "12-24", "60", "None"]', 1, 'Highest risk in the early years. (Williams)'),
    
    ('296: "Combined" Patch (Xulane) should be applied to the:', '["Breast", "Buttocks, abdomen, upper outer arm, or upper torso", "Face", "None"]', 1, 'Never on the breast. (Beckmann)'),
    
    ('297: "Progestin-Only" Injectable (DMPA) and "Bone": Does ACOG recommend routine DEXA screening for DMPA users?', '["Yes", "No", "Only if over 50", "None"]', 1, 'Not recommended. (ACOG)'),
    
    ('298: "Emergency Contraception": Can the "Copper IUD" be used for EC in a woman with a history of PID (currently resolved)?', '["No", "Yes (Category 1)", "Only if she is on antibiotics", "None"]', 1, 'Resolved PID is not a contraindication. (USMEC; ACOG)'),
    
    ('299: "IUD" and "Expulsion": If it is expelled, can she have another one placed?', '["No, never", "Yes, but she should be counseled on the increased risk of re-expulsion (~20%)", "Only after surgery", "None"]', 1, 'Management of device failure. (Beckmann; Williams)'),
    
    ('300: "Family Planning" is a fundamental human right.', '["True", "False", "Only in some countries", "None"]', 0, 'Recognized globally as essential for health and autonomy. (WHO; ACOG)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;
END $$;
COMMIT;
