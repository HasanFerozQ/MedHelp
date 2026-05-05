BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-benign-gynecology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-benign-gynecology not found.';
    END IF;

    -- Batch 6: 301-335 (Final Review and Integration)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '301: A 28-year-old G0 with dysmenorrhea and a 6 cm ground-glass adnexal mass. CA-125 is 45. Diagnosis?', '["Ovarian cancer", "Endometrioma", "Follicular cyst", "Dermoid"]', 1, 'Classic ground-glass appearance and moderately elevated CA-125 in a young woman suggest endometriosis. (Williams)'),
    (v_topic_id, '302: A woman has heavy bleeding and a 10 cm intramural fibroid. She wants a minimally invasive option and is done with childbearing. Best option?', '["Myomectomy", "Uterine Artery Embolization (UAE)", "Hysterectomy", "Both B and C"]', 3, 'Both are appropriate; UAE is least invasive, Hysterectomy is definitive. (ACOG)'),
    (v_topic_id, '303: "Asherman Syndrome" - Diagnosis is confirmed by:', '["Ultrasound", "Hysteroscopy (direct visualization of adhesions)", "Blood test", "None"]', 1, 'Standard of care for diagnosis and treatment. (Beckmann)'),
    (v_topic_id, '304: "PCOS" - Weight loss improves fertility by lowering which hormone?', '["Progesterone", "Insulin (which then lowers androgens)", "Estrogen", "None"]', 1, 'Address the underlying metabolic driver. (ACOG)'),
    (v_topic_id, '305: "Leiomyoma" - Can they cause "Urinary Frequency"?', '["No", "Yes, due to direct pressure on the bladder", "Only in obesity", "None"]', 1, 'A common "bulk" symptom of anterior fibroids. (Williams)'),
    (v_topic_id, '306: "Adenomyosis" - Why is it difficult to diagnose before surgery?', '["It is microscopic", "Symptoms and imaging findings overlap with fibroids and endometriosis", "It is rare", "None"]', 1, 'Often requires a high index of suspicion. (Beckmann)'),
    (v_topic_id, '307: "Hirsutism" - First-line MEDICAL therapy for a woman who does NOT want to get pregnant?', '["Metformin", "Combined Oral Contraceptives (OCPs)", "Spironolactone", "None"]', 1, 'OCPs suppress ovarian androgens and increase SHBG. (ACOG)'),
    (v_topic_id, '308: "Endometriosis" - "Stage I" disease is often _____ painful than Stage IV.', '["More", "Less", "Equally", "There is no correlation between stage and pain severity"]', 3, 'Important clinical fact. (ACOG)'),
    (v_topic_id, '309: "PID" - What is the most common cause of "Infertility" after PID?', '["Uterine scarring", "Tubal factor (adhesions and blockage)", "Ovarian failure", "None"]', 1, 'Damage to the delicate endosalpinx. (Williams)'),
    (v_topic_id, '310: "Bartholin Abscess" - Is "Gonorrhea" testing required?', '["No", "Yes, as it can be the underlying cause in some cases", "Only in teens", "None"]', 1, 'Standard part of the workup for any vulvar abscess. (ACOG)'),
    (v_topic_id, '311: "Chronic Pelvic Pain" - Does "Laparoscopy" always find the cause?', '["Yes", "No, up to 40% of laparoscopies for chronic pain find no visible pathology", "Only in cancer", "None"]', 1, 'Highlights the complexity of pelvic pain. (Beckmann)'),
    (v_topic_id, '312: "Fibroids" - Effect on "Menopause"?', '["They grow faster", "They typically shrink due to the drop in estrogen levels", "No effect", "None"]', 1, 'Hormone replacement therapy (HRT) may cause them to persist. (Williams)'),
    (v_topic_id, '313: "PCOS" - Risk of "Type 2 Diabetes" is increased by _____ fold.', '["2", "5-10", "100", "None"]', 1, 'Significant metabolic morbidity. (ACOG)'),
    (v_topic_id, '314: "Leiomyoma" - "Myomectomy" risk in future pregnancy?', '["Infertility", "Uterine rupture during labor (if the myometrium was entered)", "Placenta previa", "None"]', 1, 'Often necessitates a scheduled C-section. (ACOG)'),
    (v_topic_id, '315: "Endometriosis" - Most common site for "Bilateral" adnexal masses?', '["Endometriomas", "Dermoids", "Follicular cysts", "None"]', 0, 'Often found on both ovaries. (Beckmann)'),
    (v_topic_id, '316: "Adenomyosis" - "Definitive" surgical treatment for a woman with severe dysmenorrhea?', '["Ablation", "Hysterectomy", "Myomectomy", "None"]', 1, 'Only way to remove all ectopic tissue. (ACOG)'),
    (v_topic_id, '317: "Vulvar Vestibulitis" - What is the "Q-tip test" for this condition?', '["Measuring length", "Touching the vestibule with a cotton swab to map areas of focal tenderness", "Checking for yeast", "None"]', 1, 'Standard diagnostic maneuver. (Williams)'),
    (v_topic_id, '318: "Urge Incontinence" - Is "Caffeine" a trigger?', '["No", "Yes, it is a bladder irritant and diuretic", "Only in men", "None"]', 1, 'Lifestyle modification is key. (ACOG)'),
    (v_topic_id, '319: "Stress Incontinence" - Effect of "Obesity"?', '["No effect", "Worsens symptoms by increasing intra-abdominal pressure", "Improves it", "None"]', 1, 'Weight loss can significantly improve stress incontinence. (Beckmann)'),
    (v_topic_id, '320: "Pelvic Organ Prolapse" - Does "Childbirth" always lead to prolapse?', '["Yes", "No, it is a major risk factor but not the only one (genetics/connective tissue also matter)", "Only in multiples", "None"]', 1, 'Multifactorial etiology. (Williams)'),
    (v_topic_id, '321: "Primary Amenorrhea" - "Androgen Insensitivity" - Why is "Gonadectomy" performed?', '["To stop hair growth", "To prevent malignant transformation of the intra-abdominal testes", "None", "To cure PCOS"]', 1, 'Usually delayed until after puberty to allow for natural growth. (ACOG)'),
    (v_topic_id, '322: "Mullerian Agenesis" - Does the patient have "Ovaries"?', '["No", "Yes, usually functional ovaries", "Only if malignant", "None"]', 1, 'Which is why they have normal secondary sexual characteristics (breasts/hair). (Beckmann)'),
    (v_topic_id, '323: "Hirsutism" - Difference between "Terminal" hair and "Vellus" hair?', '["None", "Terminal hair is thick, dark, and long; Vellus hair is fine and light", "Color only", "None"]', 1, 'Androgens convert vellus hair to terminal hair. (Williams)'),
    (v_topic_id, '324: "PCOS" - Does "Metformin" cause weight loss?', '["Yes, massive loss", "It may cause modest weight loss, but its primary benefit is metabolic", "No", "None"]', 1, 'Should not be used as a primary weight-loss drug. (ACOG)'),
    (v_topic_id, '325: "Fibroids" - "Intravasation" risk is higher with _____ distension media.', '["Saline", "Glycine (Non-electrolytic)", "Air", "None"]', 1, 'Can cause hyponatremia and fluid overload. (Beckmann)'),
    (v_topic_id, '326: "Adenomyosis" - Can it be treated with "UAE"?', '["No", "Yes, but results are often less predictable than for fibroids", "Only if small", "None"]', 1, 'Emerging option for some patients. (ACOG)'),
    (v_topic_id, '327: "Endometriosis" - "Adhesion" prophylaxis during surgery includes:', '["Antibiotics", "Good surgical technique (hemostasis, minimizing tissue handling)", "Adhesion barriers", "Both B and C"]', 3, 'Crucial for preserving future fertility. (Williams)'),
    (v_topic_id, '328: "PID" - "Inpatient" IV antibiotic choice?', '["Penicillin", "Cefotetan or Cefoxitin + Doxycycline", "Cipro", "None"]', 1, 'Standard hospital regimen. (CDC)'),
    (v_topic_id, '329: "Ovarian Torsion" - Most common age group?', '["Infants", "Women of reproductive age (especially if they have a cyst)", "Postmenopausal", "None"]', 1, 'But can occur at any age. (ACOG)'),
    (v_topic_id, '330: "Nabothian Cyst" - Management?', '["Surgery", "Reassurance (benign, no treatment needed)", "Antibiotics", "None"]', 1, 'No clinical significance. (Beckmann)'),
    (v_topic_id, '331: "Urinary Incontinence" - "Burch Colposuspension" is a:', '["Sling", "Surgical procedure to suspend the bladder neck to the Cooper''s ligament", "A med", "None"]', 1, 'Abdominal approach for stress incontinence. (Williams)'),
    (v_topic_id, '332: "Pelvic Organ Prolapse" - "Sacrocolpopexy" involves:', '["Removing the uterus", "Suspending the vaginal vault to the sacrum using mesh", "Fixing the bladder", "None"]', 1, 'Standard "high-level" support surgery. (ACOG)'),
    (v_topic_id, '333: "Asherman Syndrome" - "Cyclic Progestin" is given after estrogen to:', '["Make them bleed", "Cause a withdrawal bleed and organize the new lining", "Stop the drug", "None"]', 1, 'Mimics the natural cycle. (Beckmann)'),
    (v_topic_id, '334: "Leiomyoma" - Most common site for "pedunculated" fibroids?', '["Internal", "Subserosal", "Submucosal", "None"]', 1, 'Floating on a stalk outside the uterus. (Williams)'),
    (v_topic_id, '335: What is the most important "High-Yield" takeaway for Benign Gynecology?', '["All masses are cancer", "Management should be individualized based on symptoms, age, and reproductive goals", "Surgery is always best", "None"]', 1, 'Patient-centered care is paramount. (ACOG)');

    RAISE NOTICE 'SUCCESS: Final Batch 6 (301-335) MCQs for Benign Gynecology registered.';
    RAISE NOTICE 'TOTAL MCQS FOR THIS TOPIC: 335';
END $$;
COMMIT;
