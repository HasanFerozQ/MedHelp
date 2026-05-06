BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-basics' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-basics not found.';
    END IF;

    -- Use a temporary table to stage insertions and prevent duplicates without a global constraint
    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    -- Batch 7: 336-370 (Advanced Basics, Pathophysiology, and Clinical Correlates)
    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('336: "Physiologic Anemia of Pregnancy" is defined as a Hemoglobin level below _____ in the first or third trimester.', '["10 g/dL", "11 g/dL", "12 g/dL", "13 g/dL"]', 1, 'Due to plasma volume increasing more than red cell mass. (ACOG)'),
    ('337: What is the primary reason for increased "Urinary Frequency" in the first trimester?', '["Infection", "Pelvic organ prolapse", "Uterine growth compressing the bladder", "Increased GFR alone"]', 2, 'The growing uterus rests directly on the bladder before rising out of the pelvis. (Beckmann)'),
    ('338: "Ptyalism" during pregnancy refers to:', '["Excessive vomiting", "Excessive salivation", "Nosebleeds", "Cravings for non-food items"]', 1, 'Often associated with severe nausea and inability to swallow saliva. (Williams)'),
    ('339: A pregnant woman at 16 weeks complains of sharp, unilateral groin pain when standing up quickly. Most likely diagnosis?', '["Ectopic pregnancy", "Round ligament pain", "Appendicitis", "Ovarian torsion"]', 1, 'Classic description of stretching round ligaments. (Beckmann)'),
    ('340: Which of the following is a normal "Dermatologic" change in pregnancy?', '["Linea nigra", "Melasma (chloasma)", "Striae gravidarum", "All of the above"]', 3, 'Due to increased estrogen and melanocyte-stimulating hormone. (Williams)'),
    ('341: "Palmar erythema" and "Spider angiomas" in a healthy pregnant woman are caused by:', '["Liver failure", "High estrogen levels", "High progesterone", "Low platelets"]', 1, 'These are normal physiological responses to hyperestrogenemia. (Beckmann)'),
    ('342: What happens to "Gastrointestinal Motility" during pregnancy?', '["It increases, causing diarrhea", "It decreases, causing constipation", "It remains unchanged", "It stops completely"]', 1, 'Progesterone causes smooth muscle relaxation. (Williams)'),
    ('343: The increased risk of "Gallstones" in pregnancy is due to:', '["High fat diet", "Progesterone-induced gallbladder stasis and estrogen-induced cholesterol supersaturation", "Autoimmune reaction", "Liver failure"]', 1, 'Creates a lithogenic environment. (Comprehensive Gynecology)'),
    ('344: "Supine Hypotensive Syndrome" is caused by:', '["Dehydration", "The gravid uterus compressing the Inferior Vena Cava (IVC)", "Heart failure", "Vagal response"]', 1, 'Decreases venous return and cardiac output. Relieved by left lateral decubitus position. (Beckmann)'),
    ('345: The "Placenta" is formed from the maternal decidua basalis and the fetal:', '["Chorion frondosum", "Amnion", "Yolk sac", "Allantois"]', 0, 'The chorionic villi invade the decidua to form the functional placenta. (Williams)'),
    ('346: Oxygen transfer across the placenta occurs primarily by:', '["Active transport", "Facilitated diffusion", "Simple diffusion", "Pinocytosis"]', 2, 'Driven by the maternal-fetal oxygen gradient. (Beckmann)'),
    ('347: Glucose transfer across the placenta occurs via:', '["Simple diffusion", "Facilitated diffusion (carrier-mediated)", "Active transport", "Endocytosis"]', 1, 'Relies on GLUT transporters. (Williams)'),
    ('348: Which immunoglobulin (Ig) can cross the placenta to provide passive immunity to the fetus?', '["IgA", "IgM", "IgG", "IgE"]', 2, 'IgG is the only class that crosses in significant amounts. (Comprehensive Gynecology)'),
    ('349: The "Umbilical Cord" normally contains:', '["2 Veins, 1 Artery", "2 Arteries, 1 Vein", "1 Artery, 1 Vein", "2 Arteries, 2 Veins"]', 1, 'A 2-vessel cord (1A, 1V) is a variant associated with renal anomalies. (Williams)'),
    ('350: "Wharton''s Jelly" is:', '["A type of amniotic fluid", "The connective tissue that surrounds and protects the umbilical vessels", "A placental hormone", "A vaginal discharge"]', 1, 'Prevents compression of the cord. (Beckmann)'),
    ('351: "Quickening" (first maternal perception of fetal movement) typically occurs at:', '["8-10 weeks", "12-14 weeks", "16-20 weeks", "24-28 weeks"]', 2, 'Earlier in multiparas, later in primigravidas. (ACOG)'),
    ('352: The "Cervix" softens and becomes bluish-purple in early pregnancy. This is known as:', '["Hegar sign", "Chadwick sign", "Goodell sign", "McDonald sign"]', 1, 'Due to increased vascularity. (Williams)'),
    ('353: Softening of the lower uterine segment in early pregnancy is called:', '["Hegar sign", "Chadwick sign", "Goodell sign", "Piskacek sign"]', 0, 'Palpable on bimanual exam. (Beckmann)'),
    ('354: What is the normal "Weight Gain" recommendation for a woman with a normal BMI (18.5-24.9) during pregnancy?', '["11-20 lbs", "15-25 lbs", "25-35 lbs", "28-40 lbs"]', 2, 'Based on IOM guidelines. (ACOG)'),
    ('355: Women who are "Obese" (BMI > 30) should gain how much weight during pregnancy?', '["0 lbs", "11-20 lbs", "25-35 lbs", "15-25 lbs"]', 1, 'To optimize fetal growth while minimizing maternal risks. (ACOG)'),
    ('356: What is the caloric requirement increase during the 2nd and 3rd trimesters?', '["50 kcal/day", "300-400 kcal/day", "1000 kcal/day", "No increase needed"]', 1, 'Pregnancy does not mean "eating for two" adult portions. (Beckmann)'),
    ('357: "Pica" is the craving for non-nutritive substances (ice, dirt, clay) and is often associated with:', '["Zinc toxicity", "Iron Deficiency Anemia", "Diabetes", "Preeclampsia"]', 1, 'Checking a CBC and ferritin is indicated. (Williams)'),
    ('358: "Naegele''s Rule" is based on a standard menstrual cycle of how many days?', '["21", "28", "35", "40"]', 1, 'Assumes ovulation on day 14. Adjustments are needed for longer/shorter cycles. (Beckmann)'),
    ('359: If a woman has a 35-day cycle, her actual EDD will be _____ Naegele''s rule prediction.', '["The same as", "7 days earlier than", "7 days later than", "14 days later than"]', 2, 'Because ovulation occurred on day 21 instead of day 14. (ACOG)'),
    ('360: "Fetal Heart Tones" can typically be heard by a handheld Doppler starting at:', '["5-6 weeks", "10-12 weeks", "16-20 weeks", "24 weeks"]', 1, 'Ultrasound can see the heartbeat at 5.5-6 weeks. (Beckmann)'),
    ('361: What is the "Discriminatory Zone" for hCG level, above which an intrauterine pregnancy should be visible on transvaginal ultrasound?', '["500 - 1,000 mIU/mL", "1,500 - 2,000 mIU/mL", "5,000 - 6,000 mIU/mL", "10,000 mIU/mL"]', 1, 'If no sac is seen above this level, ectopic is highly suspected. (ACOG)'),
    ('362: Serum hCG levels normally "double" every 48 hours until they peak at what gestational age?', '["4 weeks", "8-10 weeks", "20 weeks", "Term"]', 1, 'After peaking, they slowly decline and plateau. (Williams)'),
    ('363: "Leukorrhea of pregnancy" is a normal, thin, white vaginal discharge. It is primarily caused by:', '["Infection", "High estrogen increasing cervical mucus production", "Amniotic fluid leak", "Urine"]', 1, 'Microscopy shows no clue cells or trichomonads. (Beckmann)'),
    ('364: Pregnant women are in a "respiratory alkalosis." How does the kidney compensate?', '["Retaining H+", "Excreting more Bicarbonate", "Retaining sodium", "Excreting potassium"]', 1, 'Keeps maternal pH near normal (~7.40-7.44). (Williams)'),
    ('365: "Gestational Age" is traditionally calculated from the First Day of the Last Menstrual Period (LMP). "Embryologic Age" (from fertilization) is therefore:', '["2 weeks longer", "2 weeks shorter", "The same", "4 weeks shorter"]', 1, 'Embryologists count from conception; obstetricians count from LMP. (Beckmann)'),
    ('366: The "First Trimester" ends at exactly:', '["10 weeks 0 days", "13 weeks 6 days", "20 weeks 0 days", "15 weeks 0 days"]', 1, 'Standard obstetric definition. (ACOG)'),
    ('367: "Term" pregnancy is defined as reaching at least:', '["36 weeks 0 days", "37 weeks 0 days", "39 weeks 0 days", "40 weeks 0 days"]', 1, '"Early term" is 37w0d to 38w6d. "Full term" is 39w0d to 40w6d. (ACOG)'),
    ('368: A "Post-term" pregnancy is one that reaches:', '["40 weeks 0 days", "41 weeks 0 days", "42 weeks 0 days", "43 weeks 0 days"]', 2, 'Associated with placental insufficiency and macrosomia. (ACOG)'),
    ('369: "Fetal Macrosomia" is technically defined as an estimated fetal weight greater than:', '["3,500 g", "4,000 g or 4,500 g (depending on diabetes status)", "5,000 g", "3,000 g"]', 1, 'Increases risk of shoulder dystocia. (ACOG)'),
    ('370: What is the primary purpose of "Leopold Maneuvers"?', '["To measure amniotic fluid", "To determine fetal lie, presentation, and position", "To estimate fetal weight exactly", "To check maternal blood pressure"]', 1, 'A standard part of the abdominal exam in the 3rd trimester. (Beckmann)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;

    RAISE NOTICE 'SUCCESS: Final Batch 7 (336-370) MCQs for OBGYN Basics registered.';
    RAISE NOTICE 'TOTAL MCQS FOR THIS TOPIC: 370';
END $$;
COMMIT;
