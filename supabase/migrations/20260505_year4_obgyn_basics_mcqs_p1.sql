BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-basics' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-basics not found.';
    END IF;

    -- Batch 1: 1-60 (Foundational Anatomy & Physiology)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '1: A 32-year-old G0 is undergoing a laparoscopic cystectomy. To avoid injury to the ureter as it enters the pelvis, the surgeon must identify it at which landmark?', '["Superior to the common iliac artery bifurcation", "Deep to the uterine artery", "Anterior to the ovary", "Medial to the uterosacral ligament"]', 0, 'The ureter enters the true pelvis by crossing over the bifurcation of the common iliac artery. (Williams Obstetrics)'),
    (v_topic_id, '2: During a hysterectomy, the uterine artery is ligated. Which structure lies immediately inferior (deep) to the uterine artery at the level of the internal os?', '["Obturator nerve", "Ureter", "Round ligament", "Ovarian vein"]', 1, 'This is the "water under the bridge" relationship. (Beckmann)'),
    (v_topic_id, '3: A 24-year-old primigravida has a pelvic inlet with a rounded shape, a wide subpubic angle, and non-prominent ischial spines. Which pelvic type does she have?', '["Android", "Platypelloid", "Gynecoid", "Anthropoid"]', 2, 'The gynecoid pelvis is the most common and favorable for delivery. (Caldwell-Moloy)'),
    (v_topic_id, '4: A woman is found to have a pelvis with a wedge-shaped inlet and narrow subpubic arch. This pelvic type is associated with which labor complication?', '["Preterm labor", "Persistent Occiput Posterior (OP) position", "Placenta previa", "Uterine rupture"]', 1, 'Android pelvis leads to poor internal rotation. (Williams)'),
    (v_topic_id, '5: A 16-year-old girl presents with primary amenorrhea but normal breast development. Physical exam reveals a short vaginal pouch and no palpable uterus. Karyotype is 46,XX. What is the most likely diagnosis?', '["Failure of the Sinovaginal bulbs", "Müllerian Agenesis (MRKH syndrome)", "Androgen Insensitivity", "Turner Syndrome"]', 1, 'MRKH results from the failure of the paramesonephric ducts to develop. (Beckmann)'),
    (v_topic_id, '6: In the male fetus, MIS causes regression of the paramesonephric ducts. In the female, which structures do these ducts form?', '["Ovaries and Lower Vagina", "Fallopian tubes, Uterus, and Upper Vagina", "Labia majora and Clitoris", "Bladder and Urethra"]', 1, 'The paramesonephric ducts form the internal female organs. (Williams)'),
    (v_topic_id, '7: A patient is diagnosed with a "Bicornuate Uterus." This anomaly is caused by which embryologic event?', '["Complete failure of fusion", "Partial failure of fusion of the Müllerian ducts", "Failure of resorption of the septum", "Agenesis of one duct"]', 1, 'Bicornuate is a fusion defect. (Comprehensive Gynecology)'),
    (v_topic_id, '8: The round ligament of the uterus is embryologically homologous to which structure in the male?', '["Vas deferens", "Gubernaculum testis", "Epididymis", "Prostate"]', 1, 'Both are remnants of the gubernaculum. (Williams)'),
    (v_topic_id, '9: The lymphatic drainage of the upper third of the vagina primarily follows which nodes?', '["Inguinal nodes", "Internal and External Iliac nodes", "Para-aortic nodes", "Obturator nodes"]', 1, 'The upper vagina drains to iliac nodes. (Beckmann)'),
    (v_topic_id, '10: The ovaries receive their primary blood supply via the ovarian arteries. From which vessel do these arteries directly originate?', '["Internal Iliac Artery", "Renal Artery", "Abdominal Aorta", "Common Iliac Artery"]', 2, 'Ovarian arteries branch directly off the aorta. (Williams)'),
    (v_topic_id, '11: Which hormone, produced by the hypothalamus, is released in a pulsatile fashion to regulate the menstrual cycle?', '["LH", "FSH", "GnRH", "hCG"]', 2, 'GnRH must be pulsatile to function. (Beckmann)'),
    (v_topic_id, '12: During the follicular phase, which hormone is primarily responsible for the growth of the endometrial lining?', '["Progesterone", "Estrogen (Estradiol)", "LH", "Androstenedione"]', 1, 'Estrogen stimulates the proliferative phase. (Williams)'),
    (v_topic_id, '13: A "Mid-cycle surge" of which hormone is the direct trigger for ovulation?', '["FSH", "Estradiol", "Luteinizing Hormone (LH)", "Progesterone"]', 2, 'The LH surge occurs 24-36 hours before ovulation. (Comprehensive Gynecology)'),
    (v_topic_id, '14: What is the primary hormone secreted by the corpus luteum during the luteal phase?', '["Estriol", "Progesterone", "Testosterone", "Inhibin B"]', 1, 'Progesterone stabilizes the endometrium. (Beckmann)'),
    (v_topic_id, '15: In a normal cycle, if pregnancy doesn''t occur, why does menstruation occur?', '["Increase in Estrogen", "Withdrawal of Progesterone", "LH surge", "Peak in FSH"]', 1, 'Withdrawal of progesterone leads to sloughing. (Williams)'),
    (v_topic_id, '16: Which cells in the ovarian follicle produce androgens in response to LH?', '["Granulosa cells", "Theca interna cells", "Oocytes", "Sertoli cells"]', 1, 'Theca cells make androgens. (Comprehensive Gynecology)'),
    (v_topic_id, '17: What is the primary estrogen of the reproductive years?', '["Estrone", "Estradiol", "Estriol", "Estetrol"]', 1, 'Estradiol is the most potent. (Beckmann)'),
    (v_topic_id, '18: At the time of ovulation, cervical mucus is expected to be:', '["Thick and sticky", "Thin, clear, and stretchy (Spinnbarkeit)", "Bloody", "Absent"]', 1, 'Estrogen makes mucus thin to facilitate sperm. (Williams)'),
    (v_topic_id, '19: What is the "Gold Standard" for confirming ovulation clinically?', '["Basal temperature", "Serum progesterone level (> 3 ng/mL) in mid-luteal phase", "Single LH strip", "Ultrasound"]', 1, 'Mid-luteal progesterone is the best marker. (Comprehensive Gynecology)'),
    (v_topic_id, '20: Which phase of the menstrual cycle has a fixed duration of ~14 days?', '["Follicular phase", "Luteal phase", "Proliferative phase", "Menstrual phase"]', 1, 'The luteal phase is consistent. (Beckmann)'),
    (v_topic_id, '21: A G1P0 at 24 weeks has a BP of 100/60 (baseline 115/75). What is the physiological cause?', '["Dehydration", "Decreased Systemic Vascular Resistance (SVR)", "Decreased Cardiac Output", "Anemia"]', 1, 'Progesterone decreases SVR. (Williams)'),
    (v_topic_id, '22: By the 3rd trimester, how much has Cardiac Output increased?', '["10%", "30-50%", "100%", "It decreases"]', 1, 'CO increases significantly in pregnancy. (Beckmann)'),
    (v_topic_id, '23: Which hematologic change is normal in pregnancy?', '["Increased Hgb", "Decreased WBC", "Increased Plasma Volume (45-50%)", "Decreased clotting factors"]', 2, 'Plasma volume increases more than RBC mass. (Williams)'),
    (v_topic_id, '24: Which clotting factor decrease contributes to the hypercoagulable state of pregnancy?', '["Factor VII", "Fibrinogen", "Protein S", "Factor X"]', 2, 'Protein S levels decrease. (Comprehensive Gynecology)'),
    (v_topic_id, '25: A pregnant woman at 32 weeks has dyspnea while lying flat; O2 sat 99%. Most likely cause?', '["Pulmonary Embolism", "Increased Tidal Volume and diaphragmatic elevation", "Asthma", "Pneumonia"]', 1, 'Physiologic dyspnea is common. (Williams)'),
    (v_topic_id, '26: Which lung volume decreases during pregnancy?', '["Tidal Volume", "Inspiratory Capacity", "Functional Residual Capacity (FRC)", "Respiratory Rate"]', 2, 'FRC decreases due to diaphragm elevation. (Beckmann)'),
    (v_topic_id, '27: What happens to the GFR in pregnancy?', '["Increases by 50%", "Decreases by 20%", "Stays the same", "Fluctuates"]', 0, 'GFR increases significantly. (Williams)'),
    (v_topic_id, '28: Why is "Glucosuria" common in pregnancy without diabetes?', '["Increased intake", "Decreased renal threshold for glucose reabsorption", "Infection", "High progesterone"]', 1, 'The GFR exceeds reabsorptive capacity. (Beckmann)'),
    (v_topic_id, '29: What is the primary source of the doubled Alkaline Phosphatase in pregnancy?', '["Bone", "Liver", "Placenta", "Fetal Kidneys"]', 2, 'The placenta produces its own isoenzyme. (Williams)'),
    (v_topic_id, '30: A patient at 10 weeks has TSH of 0.3 (Low) and normal Free T4. Explanation?', '["Graves", "hCG weakly stimulates TSH receptor", "Iodine deficiency", "Hypothyroidism"]', 1, 'hCG mimics TSH. (Williams)'),
    (v_topic_id, '31: Which hormone is produced by the syncytiotrophoblast to detect pregnancy?', '["hPL", "hCG", "Estriol", "Relaxin"]', 1, 'hCG is the marker for pregnancy. (Beckmann)'),
    (v_topic_id, '32: What is the primary function of hPL?', '["Inducing labor", "Maintaining corpus luteum", "Ensuring glucose for fetus via maternal insulin resistance", "Softening cervix"]', 2, 'hPL is an insulin antagonist. (Williams)'),
    (v_topic_id, '33: Oxygenated blood from the placenta travels to the fetus via:', '["Umbilical Artery", "Umbilical Vein", "Uterine Artery", "Ductus Arteriosus"]', 1, 'The umbilical vein carries oxygenated blood. (Beckmann)'),
    (v_topic_id, '34: The Ductus Venosus allows blood to bypass which organ?', '["Lungs", "Heart", "Liver", "Kidneys"]', 2, 'It bypasses the liver. (Williams)'),
    (v_topic_id, '35: The Foramen Ovale shunts blood between:', '["RV to LV", "RA to LA", "PA to Aorta", "Aorta to PV"]', 1, 'Shunts blood RA to LA. (Beckmann)'),
    (v_topic_id, '36: What triggers closure of the Ductus Arteriosus after birth?', '["Low estrogen", "Increased O2 and decreased PGE2", "Low BP", "Cold"]', 1, 'O2 increases and PGE2 decreases. (Williams)'),
    (v_topic_id, '37: Why does HbF have a higher oxygen affinity than HbA?', '["Prevents jaundice", "Allows fetus to \"pull\" O2 from mother", "Thicker blood", "Prevents infection"]', 1, 'HbF outcompetes HbA for oxygen. (Beckmann)'),
    (v_topic_id, '38: From the 2nd trimester on, what is the primary source of amniotic fluid?', '["Maternal sweat", "Fetal Urine", "Lung fluid", "Placental transudate"]', 1, 'Fetal urine is the main source. (Williams)'),
    (v_topic_id, '39: Oligohydramnios in the 3rd trimester is associated with:', '["Esophageal Atresia", "Fetal Renal Agenesis", "Trisomy 21", "Diabetes"]', 1, 'Renal issues lead to low fluid. (Beckmann)'),
    (v_topic_id, '40: The L/S ratio assesses:', '["Fetal growth", "Fetal lung maturity", "Down Syndrome", "NTDs"]', 1, 'L/S ratio > 2.0 indicates maturity. (Williams)'),
    (v_topic_id, '41: Recommended Folic Acid for a "Low Risk" woman?', '["40 mcg", "400 mcg", "4.0 mg", "1.0 mg"]', 1, '400 mcg daily. (ACOG)'),
    (v_topic_id, '42: LMP Oct 10. EDD by Naegele''s rule?', '["July 10", "July 17", "August 17", "Jan 17"]', 1, 'LMP + 7 days - 3 months. (Beckmann)'),
    (v_topic_id, '43: Which is NOT a routine initial prenatal lab?', '["CBC", "Rubella Titer", "GCT", "HIV screen"]', 2, 'GCT is done later (24-28 weeks). (ACOG)'),
    (v_topic_id, '44: When should an Rh- woman receive RhoGAM routinely?', '["12 weeks", "28 weeks and postpartum", "Only if bleeding", "First visit"]', 1, '28 weeks is standard. (Williams)'),
    (v_topic_id, '45: Most accurate "Dating" method in the 1st trimester?', '["LMP", "CRL via Ultrasound", "BPD", "Fundal Height"]', 1, 'CRL is the most accurate. (ACOG)'),
    (v_topic_id, '46: Fundal Height at 20 weeks is at the level of:', '["Symphysis", "Umbilicus", "Xiphoid", "Midway"]', 1, 'Umbi-20. (Beckmann)'),
    (v_topic_id, '47: Screening for GDM is done at:', '["12-16 weeks", "20-22 weeks", "24-28 weeks", "32-34 weeks"]', 2, '24-28 weeks is standard. (Williams)'),
    (v_topic_id, '48: Definitive genetic diagnosis at 11 weeks?', '["Quad Screen", "Amnio", "CVS", "cfDNA"]', 2, 'CVS is the choice for early diagnosis. (ACOG)'),
    (v_topic_id, '49: Quad Screen window?', '["10-13 weeks", "15-22 weeks", "24-28 weeks", "At birth"]', 1, '15-22 weeks. (Beckmann)'),
    (v_topic_id, '50: Elevated AFP is associated with:', '["Down Syndrome", "Neural Tube Defects", "Trisomy 18", "Molar Pregnancy"]', 1, 'NTDs cause high AFP. (Williams)'),
    (v_topic_id, '51: High hCG/Inhibin A and Low AFP/Estriol indicates:', '["Trisomy 18", "Trisomy 21", "Normal", "Gastroschisis"]', 1, 'Classic pattern for T21. (Beckmann)'),
    (v_topic_id, '52: Recommended vaccine during every pregnancy?', '["MMR", "Varicella", "Tdap", "HPV"]', 2, 'Tdap is recommended 27-36 weeks. (ACOG)'),
    (v_topic_id, '53: Food to avoid for Listeria?', '["Sushi", "Unpasteurized soft cheese", "Peanut butter", "Cooked chicken"]', 1, 'Listeria risk in deli/soft cheese. (Williams)'),
    (v_topic_id, '54: Initial step for "decreased fetal movement"?', '["Wait", "NST", "C-section", "Cervical exam"]', 1, 'NST is the first step. (ACOG)'),
    (v_topic_id, '55: "Reactive" NST definition?', '["No decels", "2 accels of 15 bpm for 15s in 20 min", "HR 160", "Breathing"]', 1, 'Reactivity requires accelerations. (Beckmann)'),
    (v_topic_id, '56: Next step after non-reactive NST at 40 min?', '["Home", "BPP or CST", "Induction", "Forceps"]', 1, 'Further testing required. (Williams)'),
    (v_topic_id, '57: Which is NOT a BPP component?', '["NST", "Breathing", "Fluid", "Maternal BP"]', 3, 'BP is not in BPP. (Beckmann)'),
    (v_topic_id, '58: BPP 4/10 at term means:', '["Normal", "Repeat in 24h", "Abnormal, consider delivery", "Sleep"]', 2, 'Score of 4 is non-reassuring. (ACOG)'),
    (v_topic_id, '59: GBS screening weeks?', '["24-28", "28-32", "36-37", "Labor"]', 2, '36-37 weeks is standard. (ACOG)'),
    (v_topic_id, '60: Rh- woman with 1:16 Anti-D titer. RhoGAM?', '["Yes", "No, already sensitized", "Only if baby is +", "Only if bleed"]', 1, 'Sensitized women don''t get RhoGAM. (Williams)');

    RAISE NOTICE 'SUCCESS: Batch 1 (1-60) MCQs for OB/GYN Basics registered.';
END $$;
COMMIT;
