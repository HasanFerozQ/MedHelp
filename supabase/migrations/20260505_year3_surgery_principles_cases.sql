BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Surgical Principles
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'surgical-principles' LIMIT 1;

    -- CASE 01: Post-operative Fluid Management
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Post-Op Oliguria', 'A 65-year-old male is 12 hours post-laparotomy for a perforated ulcer. His urine output has dropped to 20 mL/hr for the last 3 hours. His BP is 105/70 mmHg, and heart rate is 100 bpm.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate initial step in evaluating this patient''s oliguria?', '["Immediate dialysis", "Fluid bolus of 500 mL Normal Saline", "Give 40 mg of Furosemide", "Insert a central line"]', 1, 'The most common cause of early post-op oliguria is prerenal azotemia due to volume depletion or "third-spacing." A fluid challenge is the standard first step.'),
    (v_case_id, 'What is the definition of "adequate" hourly urine output for an adult?', '["0.1 mL/kg/hr", "0.5 mL/kg/hr", "2.0 mL/kg/hr", "5.0 mL/kg/hr"]', 1, 'Adequate urine output is generally considered > 0.5 mL/kg/hr for adults.'),
    (v_case_id, 'If the patient''s urine sodium is < 20 mEq/L, what does this suggest?', '["Acute Tubular Necrosis", "Prerenal state", "Postrenal obstruction", "Renal artery stenosis"]', 1, 'A low urine sodium (< 20) indicates that the kidneys are functioning correctly and attempting to conserve volume (prerenal).');

    -- CASE 02: Post-operative Hyponatremia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Confusion After Surgery', 'A 70-year-old female is 48 hours post-hip replacement. She has been receiving D5W at 125 mL/hr. She becomes confused and has a generalized seizure. Sodium is 115 mEq/L.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause of her hyponatremia?', '["Excessive sodium loss", "Iatrogenic water intoxication (excessive hypotonic fluids)", "Renal failure", "SIADH"]', 1, 'Giving hypotonic fluids (D5W) to a post-op patient (who has high ADH levels due to stress) often leads to dilutional hyponatremia.'),
    (v_case_id, 'How should symptomatic, acute hyponatremia be treated?', '["Fluid restriction only", "Slow infusion of 0.45% Saline", "Hypertonic (3%) Saline", "Furosemide"]', 2, 'Acute, symptomatic hyponatremia (seizures) is a medical emergency requiring 3% Saline to rapidly raise the sodium by 4-6 mEq/L.'),
    (v_case_id, 'What is the risk of correcting chronic hyponatremia too quickly?', '["Cerebral edema", "Osmotic Demyelination Syndrome", "Heart failure", "Aspiration"]', 1, 'Rapid correction of chronic hyponatremia can cause Central Pontine Myelinolysis.');

    -- CASE 03: Hyperkalemia in Trauma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Crush Injury', 'A 25-year-old male was trapped under a collapsed wall for 6 hours. On arrival, he has extensive bruising of both legs. ECG shows peaked T waves.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate priority in managing his hyperkalemia?', '["Hemodialysis", "IV Calcium Gluconate", "IV Insulin and Glucose", "Albuterol nebulizer"]', 1, 'Calcium gluconate does not lower potassium but stabilizes the cardiac membrane to prevent fatal arrhythmias.'),
    (v_case_id, 'What is the underlying pathophysiological process causing the high potassium?', '["Acute renal failure", "Rhabdomyolysis with release of intracellular potassium", "Metabolic alkalosis", "Excessive IV fluids"]', 1, 'Crush injuries cause massive muscle cell death (rhabdomyolysis), releasing potassium, myoglobin, and phosphate into the blood.'),
    (v_case_id, 'Which of the following is an additional late complication of rhabdomyolysis?', '["Hypocalcemia", "Acute Kidney Injury (due to myoglobinuria)", "Hypernatremia", "Metabolic alkalosis"]', 1, 'Myoglobin is toxic to the renal tubules, especially in the setting of hypovolemia and acidic urine.');

    -- CASE 04: Acid-Base - Gastric Outlet Obstruction
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Vomiting Patient', 'A 50-year-old male with a history of peptic ulcer disease presents with persistent vomiting of non-bilious material. Labs: pH 7.55, Cl 88, K 3.0, HCO3 35.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic acid-base disturbance in gastric outlet obstruction?', '["Metabolic Acidosis", "Hypochloremic, hypokalemic metabolic alkalosis", "Respiratory Acidosis", "Normal anion gap acidosis"]', 1, 'Loss of HCl and KCl from the stomach leads to this classic pattern.'),
    (v_case_id, 'What is "paradoxical aciduria"?', '["The urine is alkaline despite systemic alkalosis", "The kidney excretes acidic urine despite systemic alkalosis to conserve sodium and potassium", "The patient is vomiting acid", "The blood is acidic but the urine is alkaline"]', 1, 'In severe volume and potassium depletion, the kidney reabsorbs Na+ in exchange for H+ in the distal tubule, leading to acidic urine in an alkalotic patient.'),
    (v_case_id, 'What is the most important component of resuscitation for this patient?', '["Bicarbonate", "Normal Saline and Potassium", "Hydrochloric acid infusion", "D5W"]', 1, 'Restoring volume with Chloride-rich fluid (NS) and replacing Potassium allows the kidney to stop the H+/Na+ exchange and excrete the excess HCO3.');

    -- CASE 05: Shock - Hemorrhagic
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The GSW to the Abdomen', 'A 30-year-old male arrives after a gunshot wound. BP 80/40, HR 140, RR 30. He is pale and confused.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What class of hemorrhagic shock is this patient in?', '["Class I", "Class II", "Class III", "Class IV"]', 2, 'Class III shock involves a 30-40% blood loss (1500-2000 mL), characterized by hypotension, significant tachycardia, and altered mental status.'),
    (v_case_id, 'What is the first-line resuscitation fluid in a trauma patient with hemorrhagic shock?', '["Crystalloids (NS/LR)", "Blood products (1:1:1 ratio of RBC, FFP, and Platelets)", "Albumin", "Pressors (Norepinephrine)"]', 1, '"Damage Control Resuscitation" prioritizes early blood product use over large volumes of crystalloid to avoid dilutional coagulopathy.'),
    (v_case_id, 'The "Lethal Triad" in trauma consists of:', '["Hypotension, Tachycardia, Hypoxia", "Acidosis, Coagulopathy, Hypothermia", "Pain, Fever, Bleeding", "Anemia, Shock, Coma"]', 1, 'These three factors exacerbate each other and lead to a high mortality rate in trauma.');

    -- CASE 06: Shock - Septic
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Post-Op Peritonitis', 'On post-op day 5 after a colon resection, a patient develops severe abdominal pain, fever (102°F), and hypotension (90/50). His skin is warm and flushed.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary hemodynamic change in septic shock?', '["Increased Systemic Vascular Resistance (SVR)", "Decreased Systemic Vascular Resistance (SVR)", "Decreased Cardiac Output", "Increased Wedge Pressure"]', 1, 'Septic shock is a "distributive" shock characterized by massive vasodilation (low SVR).'),
    (v_case_id, 'Why is his skin "warm and flushed" compared to the hemorrhagic shock patient?', '["He has a fever", "Peripheral vasodilation allows high blood flow to the skin", "He is well-hydrated", "It is a sign of recovery"]', 1, 'Unlike hypovolemic shock (cold/clammy due to vasoconstriction), early septic shock often has "warm" extremities.'),
    (v_case_id, 'What is the most common cause of septic shock in a surgical patient on POD 5?', '["Pneumonia", "Anastomotic leak with peritonitis", "Wound infection", "UTI"]', 1, 'POD 5-7 is the classic time for an anastomotic leak to manifest.');

    -- CASE 07: Wound Dehiscence
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The "Salmon-Pink" Discharge', 'A 60-year-old obese male is post-op day 6 from a midline laparotomy. He reports a "popping" sensation while coughing, followed by the appearance of thin, clear, pink fluid soaking his dressing.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the significance of the salmon-pink (serosanguinous) discharge?', '["It is normal wound healing", "It is pathognomonic for fascial dehiscence", "It indicates a wound infection", "It is a sign of a seroma"]', 1, 'Serosanguinous fluid from a fresh abdominal wound is a classic sign that the deep fascia has opened.'),
    (v_case_id, 'What is the immediate management for this patient?', '["Tape the skin and discharge", "Apply a sterile moist dressing and prepare for urgent return to the OR", "Start IV antibiotics only", "Drain the fluid in the clinic"]', 1, 'Fascial dehiscence requires surgical repair to prevent evisceration (organs spilling out).'),
    (v_case_id, 'What is the most important technical factor in preventing dehiscence?', '["Type of suture material", "Proper suture-to-wound length ratio and tension", "Using staples instead of sutures", "Antibiotic use"]', 1, 'Proper surgical technique (large bites, no tension) is the most critical factor.');

    -- CASE 08: Surgical Site Infection (SSI)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hot Incision', 'On post-op day 3, a patient complains of increasing pain at his incision site. The skin is red, warm, and tender for 2 cm around the wound. There is no fluctuance.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How would you classify this SSI?', '["Superficial incisional", "Deep incisional", "Organ/Space", "Systemic"]', 0, 'Involvement of only the skin and subcutaneous tissue is a superficial incisional SSI.'),
    (v_case_id, 'What is the most common causative organism for SSIs following "clean" surgery (e.g., hernia repair)?', '["E. coli", "Staphylococcus aureus", "Bacteroides fragilis", "Pseudomonas"]', 1, 'Staph aureus (from the skin) is the most common culprit in clean procedures.'),
    (v_case_id, 'What is the primary treatment for a wound that is PURULENT or has fluctuance?', '["Double the antibiotic dose", "Incision and drainage (opening the wound)", "Heat packs", "Nothing"]', 1, 'Antibiotics are secondary; "Ubi pus, ibi evacua" (where there is pus, drain it).');

    -- CASE 09: Nutrition - TPN Complications
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'TPN and Liver Labs', 'A patient has been on Total Parenteral Nutrition (TPN) for 3 weeks due to short bowel syndrome. His LFTs show a steady rise in Alkaline Phosphatase and Bilirubin.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a common hepatobiliary complication of long-term TPN?', '["Hepatitis A", "Biliary sludge and cholestasis", "Liver cancer", "Autoimmune hepatitis"]', 1, 'Lack of enteral stimulation leads to gallbladder stasis, sludge, and potentially acalculous cholecystitis.'),
    (v_case_id, 'What is "Refeeding Syndrome"?', '["Allergic reaction to TPN", "Severe electrolyte shifts (low PO4, K, Mg) when feeding a malnourished patient", "Weight gain", "Nausea after eating"]', 1, 'Insulin release causes a massive shift of electrolytes into cells, with Hypophosphatemia being the hallmark.'),
    (v_case_id, 'Which vitamin deficiency is classically associated with impaired wound healing and "corkscrew" hairs?', '["Vitamin A", "Vitamin C (Scurvy)", "Vitamin D", "Vitamin K"]', 1, 'Vitamin C is essential for collagen cross-linking.');

    -- CASE 10: Surgical Safety and Antibiotics
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Timing the Prophylaxis', 'A 45-year-old is undergoing an elective laparoscopic cholecystitis. The surgeon orders 1g of Cefazolin.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the optimal timing for the administration of prophylactic antibiotics?', '["Night before surgery", "Within 60 minutes before the incision", "Immediately after the incision", "In the recovery room"]', 1, 'Antibiotics must be in the tissue at bactericidal levels when the skin is cut.'),
    (v_case_id, 'When should prophylactic antibiotics be DISCONTINUED for most standard surgeries?', '["After 7 days", "Within 24 hours of the surgery ending", "Never", "After the first bowel movement"]', 1, 'Prolonged use (> 24 hours) does not reduce SSI risk and increases the risk of C. difficile and resistance.'),
    (v_case_id, 'The "WHO Surgical Safety Checklist" includes a "Time Out." When does this occur?', '["Before the patient enters the OR", "Just before the skin incision", "After the surgery is finished", "During the pre-op clinic visit"]', 1, 'The Time Out is performed immediately before the incision to confirm patient identity, site, and procedure.');

    -- CASE 11: Homeostasis - The Surgical Stress Response
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Metabolic Ebb and Flow', 'A 40-year-old male is recovering from a major multi-trauma. In the first 24 hours (Ebb phase), he is hypotensive and cool. On day 3 (Flow phase), he is tachycardic, febrile, and has a high metabolic rate.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which hormone is the primary driver of the catabolic "Flow phase" of the stress response?', '["Insulin", "Cortisol", "Thyroid hormone", "Growth hormone"]', 1, 'Cortisol, along with catecholamines and glucagon, drives the hypermetabolic, catabolic state after major injury.'),
    (v_case_id, 'What happens to glucose metabolism during the surgical stress response?', '["Increased insulin sensitivity", "Hyperglycemia and peripheral insulin resistance", "Hypoglycemia", "No change"]', 1, 'Stress causes "diabetes of injury" via increased gluconeogenesis and insulin resistance.'),
    (v_case_id, 'What is the primary goal of the "Ebb phase"?', '["Wound healing", "Conservation of circulating volume and energy", "Muscle building", "Fighting infection"]', 1, 'The Ebb phase (first 24-48h) is focused on survival and hemodynamic stability.');

    -- CASE 12: Hemostasis - Pre-op Evaluation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Bleeding Risk', 'A 50-year-old male is scheduled for a elective hernia repair. He reports that he "bleeds a lot" when he gets a tooth pulled or a small cut.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which test is the most important for evaluating his reported bleeding history?', '["PT/INR", "aPTT", "A detailed personal and family clinical history", "Platelet count"]', 2, 'History is a better predictor of surgical bleeding risk than routine screening labs in an asymptomatic patient.'),
    (v_case_id, 'If the patient is on Aspirin, how many days before surgery should it ideally be stopped?', '["1 day", "3 days", "7-10 days", "It should never be stopped"]', 2, 'Aspirin irreversibly inhibits platelets for their entire lifespan (7-10 days).'),
    (v_case_id, 'Which common herbal supplement is known to increase bleeding risk and should be stopped pre-op?', '["Vitamin C", "Ginkgo biloba", "Echinacea", "Melatonin"]', 1, 'The "G" herbs (Ginkgo, Garlic, Ginseng) and Ginger can all increase bleeding.');

    -- CASE 13: Transfusion Reactions - Acute
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Fever During Transfusion', 'Ten minutes after starting a unit of packed red blood cells, a patient develops fever, chills, and severe back pain. His urine in the Foley bag turns dark red.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Febrile non-hemolytic reaction", "Acute hemolytic transfusion reaction (AHTR)", "Allergic reaction", "TRALI"]', 1, 'Back pain and hemoglobinuria (red urine) are classic for ABO incompatibility and AHTR.'),
    (v_case_id, 'What is the immediate first step in management?', '["Slow the transfusion", "Stop the transfusion and disconnect the tubing", "Give Tylenol", "Give Benadryl"]', 1, 'Immediate cessation of the offending product is vital to prevent further hemolysis and renal failure.'),
    (v_case_id, 'What is the primary cause of death in AHTR?', '["Anaphylaxis", "Acute Renal Failure and DIC", "Liver failure", "Stroke"]', 1, 'Free hemoglobin causes tubular necrosis, and the immune complex storm triggers DIC.');

    -- CASE 14: Transfusion-Related Lung Injury (TRALI)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Shortness of Breath After Plasma', 'A patient receives 2 units of FFP. Two hours later, he develops sudden respiratory distress, hypoxia, and bilateral infiltrates on CXR. His heart size is normal and CVP is 5 (low/normal).', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["TACO (Circulatory Overload)", "TRALI", "Anaphylaxis", "Pneumonia"]', 1, 'TRALI is non-cardiogenic pulmonary edema (normal heart size, low CVP) occurring within 6 hours of transfusion.'),
    (v_case_id, 'What is the underlying mechanism of TRALI?', '["Fluid overload", "Donor antibodies reacting with recipient neutrophils in the lungs", "Bacterial contamination", "Histamine release"]', 1, 'Anti-HLA or anti-neutrophil antibodies in the donor product trigger neutrophil activation in the patient''s pulmonary vasculature.'),
    (v_case_id, 'How is TRALI treated?', '["Diuretics", "Supportive care (Ventilation/Oxygenation)", "Antibiotics", "Dialysis"]', 1, 'Supportive care is the mainstay; unlike TACO, diuretics are not helpful and may be harmful due to low volume status.');

    -- CASE 15: Burns - Rule of Nines
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Kitchen Fire', 'A 70 kg man presents with partial-thickness burns to his entire right arm, his entire chest, and his entire abdomen.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Using the Rule of Nines, what is the Total Body Surface Area (TBSA) burned?', '["18%", "27%", "45%", "54%"]', 2, 'Right arm (9%) + Chest (18%) + Abdomen (18%) = 45%.'),
    (v_case_id, 'Using the Parkland Formula (4 mL x kg x %TBSA), how much Lactated Ringer''s should he receive in the first 24 hours?', '["6,300 mL", "12,600 mL", "15,400 mL", "20,000 mL"]', 1, '4 * 70 * 45 = 12,600 mL.'),
    (v_case_id, 'How much of this total volume should be given in the FIRST 8 hours?', '["25%", "50% (6,300 mL)", "75%", "100%"]', 1, 'Half of the total volume is given in the first 8 hours from the time of the burn.');

    -- CASE 16: Inhalation Injury
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Trapped in a Smoke-Filled Room', 'A burn victim has singed nasal hairs, carbonaceous (sooty) sputum, and a hoarse voice.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most urgent concern for this patient?', '["Infection", "Airway obstruction due to edema", "Kidney failure", "Electrolyte imbalance"]', 1, 'Upper airway edema can progress rapidly, leading to complete obstruction. Early intubation is often necessary.'),
    (v_case_id, 'A patient with a normal pO2 but a "cherry-red" skin appearance and a high lactate after a fire likely has:', '["Oxygen toxicity", "Carbon Monoxide or Cyanide poisoning", "Heat stroke", "Normal recovery"]', 1, 'Both CO and Cyanide are common in house fires and interfere with oxygen use/delivery.'),
    (v_case_id, 'Which fluid is preferred for burn resuscitation?', '["Normal Saline", "Lactated Ringer''s", "D5W", "Albumin"]', 1, 'LR is preferred to avoid the hyperchloremic acidosis associated with large volumes of NS.');

    -- CASE 17: Electrical Burns and Rhabdomyolysis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'High-Voltage Injury', 'A utility worker is struck by a high-voltage line. He has a small "entrance" wound on his hand and an "exit" wound on his foot. His urine is dark brown.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the surface appearance of an electrical burn often deceptive?', '["It isn''t", "The main damage occurs internally along deep tissue paths and muscles (like an iceberg)", "The skin heals faster", "Electricity doesn''t burn"]', 1, 'Deep tissue damage is often much more extensive than the skin wounds suggest.'),
    (v_case_id, 'What is the most immediate life-threatening complication of high-voltage injury?', '["Kidney failure", "Cardiac arrhythmia (VFib or Asystole)", "Fractures", "Infection"]', 1, 'Electricity can stop the heart or trigger lethal rhythms instantly.'),
    (v_case_id, 'How does the fluid requirement in electrical burns differ from thermal burns?', '["It is less", "It is often much higher than calculated by the Rule of Nines due to deep tissue damage", "It is the same", "No fluids are needed"]', 1, 'The visible TBSA does not reflect the true extent of tissue damage in electrical burns.');

    -- CASE 18: Wound Healing - Primary vs. Secondary
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Closing the Wound', 'A surgeon performs an appendectomy for a perforated appendix with gross contamination. He decides to leave the skin and subcutaneous tissue open, planning to close it in 4-5 days.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this type of wound closure called?', '["Primary intention", "Secondary intention", "Delayed Primary Closure (Tertiary intention)", "Spontaneous closure"]', 2, 'Leaving a contaminated wound open to be closed later is tertiary intention.'),
    (v_case_id, 'What is "Secondary intention" healing?', '["Closing with staples", "Allowing the wound to close on its own through granulation and contraction", "Using a skin graft", "Immediate suturing"]', 1, 'Secondary intention is used for highly infected or large wounds where suturing is not feasible.'),
    (v_case_id, 'Which cell type is primarily responsible for "wound contraction"?', '["Macrophages", "Myofibroblasts", "Neutrophils", "Endothelial cells"]', 1, 'Myofibroblasts contain actin and pull the edges of the wound together.');

    -- CASE 19: Metabolic Response - SIRS
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Inflamed Patient', 'A patient is POD 1 after a major case. Temp 101.5°F, HR 110, RR 24, WBC 14,000.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does this patient meet the criteria for Systemic Inflammatory Response Syndrome (SIRS)?', '["No, only 1 criterion met", "Yes, he meets all 4 criteria", "Only if he has a positive culture", "SIRS is no longer used"]', 1, 'Criteria: Temp > 38 (100.4), HR > 90, RR > 20, WBC > 12k or < 4k. He meets all four.'),
    (v_case_id, 'What is the definition of Sepsis?', '["SIRS + Infection", "Hypotension + Fever", "Organ dysfunction due to a dysregulated host response to infection (SOFA score)", "Bacteria in the blood"]', 2, 'The modern Sepsis-3 definition focuses on organ dysfunction (SOFA score) rather than just SIRS.'),
    (v_case_id, 'What is "MODS"?', '["A type of infection", "Multiple Organ Dysfunction Syndrome", "A surgical technique", "A nutritional supplement"]', 1, 'MODS is the progressive failure of two or more organ systems due to severe inflammation or sepsis.');

    -- CASE 20: Suture Materials
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Choosing the Suture', 'A resident is closing a simple skin laceration on the arm. He needs to choose between Silk, Nylon, and Vicryl.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of these is a NON-absorbable, monofilament suture ideal for skin?', '["Silk", "Nylon", "Vicryl", "Chromic Gut"]', 1, 'Nylon is non-absorbable and monofilament, which reduces the risk of infection.'),
    (v_case_id, 'Why is Silk generally avoided in contaminated wounds?', '["It is too strong", "It is a braided (multifilament) material that can harbor bacteria", "It is expensive", "It melts"]', 1, 'Multifilament sutures have "interstices" where bacteria can hide from neutrophils.'),
    (v_case_id, 'Which suture is an absorbable, braided material frequently used for deep tissue layers?', '["Prolene", "Vicryl", "Monocryl", "Stainless Steel"]', 1, 'Vicryl (Polyglactin 910) is a common braided absorbable suture.');

    -- CASE 21: Local Anesthetics
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Numbing the Wound', 'A surgeon is using 1% Lidocaine with Epinephrine to numb a scalp laceration.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary benefit of adding Epinephrine to the local anesthetic?', '["It makes it work faster", "It causes vasoconstriction, reducing bleeding and prolonging the duration of action", "It prevents allergic reactions", "It changes the pH"]', 1, 'Vasoconstriction keeps the anesthetic in the local area longer and improves visibility by reducing bleeding.'),
    (v_case_id, 'Where is Epinephrine-containing anesthetic classically AVOIDED due to the risk of tissue necrosis?', '["Scalp", "Appendages like fingers, toes, nose, and penis", "Back", "Abdomen"]', 1, 'In areas with "end-artery" circulation, excessive vasoconstriction can lead to ischemia.'),
    (v_case_id, 'What are the early signs of Lidocaine toxicity?', '["Rash", "Perioral numbness, metallic taste, and tinnitus", "Heartburn", "Leg cramps"]', 1, 'CNS symptoms often precede cardiovascular collapse in local anesthetic systemic toxicity (LAST).');

    -- CASE 22: Shock - Neurogenic
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Fall from a Height', 'A patient presents after a 20-foot fall. He is paralyzed below the waist. BP 80/40, HR 55 (Bradycardia).', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Hypovolemic shock", "Neurogenic shock", "Septic shock", "Spinal shock"]', 1, 'Neurogenic shock is characterized by hypotension and BRADYCARDIA (due to loss of sympathetic tone).'),
    (v_case_id, 'How is "Spinal Shock" different from "Neurogenic Shock"?', '["They are the same", "Neurogenic is hemodynamic (BP/HR); Spinal is neurological (loss of reflexes)", "Neurogenic is more severe", "Spinal occurs later"]', 1, 'Spinal shock refers to the temporary loss of all spinal cord activity (reflexes/motor/sensory) below the injury.'),
    (v_case_id, 'What is the primary treatment for neurogenic shock after volume is restored?', '["More fluids", "Vasopressors (to restore SVR)", "Atropine for the heart", "Steroids"]', 1, 'Vasopressors are needed to counteract the massive vasodilation caused by the loss of sympathetic input.');

    -- CASE 23: Shock - Cardiogenic (Peri-op MI)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chest Pressure in the PACU', 'An 80-year-old male is in the recovery room after a vascular procedure. He becomes hypotensive (80/40) with a high CVP (18) and crackles in both lungs.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of shock is this?', '["Hypovolemic", "Septic", "Cardiogenic", "Neurogenic"]', 2, 'Hypotension with HIGH filling pressures (CVP/Wedge) and pulmonary edema indicates pump failure.'),
    (v_case_id, 'What is the most common cause of cardiogenic shock in the peri-operative period?', '["Pulmonary embolism", "Acute Myocardial Infarction", "Cardiac tamponade", "Anesthesia overdose"]', 1, 'Peri-operative MI is a high risk in patients with pre-existing CAD undergoing major surgery.'),
    (v_case_id, 'What is the goal of "Inotropic" therapy in this patient?', '["To slow the heart", "To increase the contractility of the heart", "To lower the blood pressure", "To decrease the heart rate"]', 1, 'Inotropes (like Dobutamine) help the failing ventricle pump more effectively.');

    -- CASE 24: Pressure Ulcers
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Bedbound Patient', 'An 85-year-old bedbound patient has a 3 cm area of skin loss over his sacrum. The ulcer extends through the entire thickness of the skin into the subcutaneous fat, but muscle and bone are not visible.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What stage is this pressure ulcer?', '["Stage I", "Stage II", "Stage III", "Stage IV"]', 2, 'Stage III involves full-thickness skin loss involving damage or necrosis of subcutaneous tissue.'),
    (v_case_id, 'A Stage I pressure ulcer is defined as:', '["Skin loss", "Non-blanchable erythema of intact skin", "Blistering", "Necrosis"]', 1, 'Stage I is a warning sign; the skin is intact but red and does not turn white (blanch) when pressed.'),
    (v_case_id, 'What is the most important factor in PREVENTING pressure ulcers?', '["Antibiotic creams", "Frequent turning and pressure redistribution (every 2 hours)", "High protein diet", "Massage"]', 1, 'Relieving the pressure that compromises capillary blood flow is the key to prevention.');

    -- CASE 25: Thermal Injury - Frostbite
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Frozen Fingers', 'A mountain climber presents with numb, hard, white fingers after being exposed to sub-zero temperatures.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first step in the treatment of frostbite?', '["Rapid rewarming in a warm water bath (40-42°C)", "Slow rewarming at room temperature", "Rubbing the fingers with snow", "Immediate amputation"]', 0, 'Rapid rewarming in warm water is the standard of care. NEVER rub the area, as it causes mechanical damage.'),
    (v_case_id, 'When is the decision to amputate usually made in severe frostbite?', '["Immediately on arrival", "After several weeks (allowing for \"mummification\" and clear demarcation)", "After the first 24 hours", "Only if infection occurs"]', 1, '"Freeze in January, amputate in July" — it takes time for the true extent of tissue viability to become clear.'),
    (v_case_id, 'What is the difference between "Frostnip" and "Frostbite"?', '["Frostnip involves tissue loss", "Frostnip is reversible without tissue loss; frostbite involves actual freezing and potential necrosis", "They are the same", "Frostbite is only on the toes"]', 1, 'Frostnip is the mildest form of cold injury.');

    -- CASE 26: Pre-Op Risk Assessment
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ASA Score', 'A 60-year-old male with well-controlled hypertension and a history of a remote MI is scheduled for surgery. He has no current symptoms.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is his likely ASA physical status classification?', '["ASA I", "ASA II", "ASA III", "ASA IV"]', 2, 'ASA III is a patient with severe systemic disease (e.g., controlled HTN with a history of MI). ASA II is mild systemic disease.'),
    (v_case_id, 'A "moribund patient who is not expected to survive without the operation" is ASA class:', '["IV", "V", "VI", "E"]', 1, 'ASA V is the highest risk category for an active patient. VI is brain-dead.'),
    (v_case_id, 'What does the "E" suffix added to an ASA score indicate?', '["Elderly", "Emergency", "Elective", "Extensive"]', 1, 'An "E" (e.g., ASA III-E) denotes an emergency procedure, which increases the risk.');

    -- CASE 27: Airway Management - Mallampati
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Predicting the Difficult Airway', 'During a pre-op assessment, a patient opens their mouth. You can see the soft palate and the base of the uvula, but the tips of the tonsillar pillars are obscured.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What Mallampati class is this?', '["Class I", "Class II", "Class III", "Class IV"]', 1, 'Class II: Soft palate, fauces, and uvula are visible. Class III: Only soft palate and base of uvula visible.'),
    (v_case_id, 'Which Mallampati class is associated with the highest difficulty for intubation?', '["Class I", "Class II", "Class III", "Class IV"]', 3, 'Class IV (only hard palate visible) is a strong predictor of a difficult airway.'),
    (v_case_id, 'What is the "3-3-2 rule"?', '["A rule for fluid resuscitation", "A clinical predictor for difficult intubation (mouth opening, hyoid-mental distance, thyroid-hyoid distance)", "A rule for suturing", "A rule for antibiotics"]', 1, 'It uses finger breadths to estimate anatomical adequacy for intubation.');

    -- CASE 28: Acid-Base - Lactic Acidosis in Surgery
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Abdominal Pain Out of Proportion', 'A 75-year-old with Atrial Fibrillation presents with sudden, severe mid-abdominal pain. His physical exam is relatively unremarkable (no guarding). Labs show a pH of 7.20 and a Lactate of 9.0.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What surgical emergency should be at the top of your differential?', '["Appendicitis", "Acute Mesenteric Ischemia", "Cholecystitis", "SBO"]', 1, 'Severe pain with a "quiet" abdomen and high lactate in an AFib patient is the classic triad for an embolic mesenteric stroke.'),
    (v_case_id, 'Why is the lactate elevated?', '["Liver failure", "Tissue hypoxia/ischemia of the bowel", "Dehydration", "Pain"]', 1, 'Anaerobic metabolism in the ischemic bowel produces large amounts of lactic acid.'),
    (v_case_id, 'What is the gold standard diagnostic test for this condition?', '["CT scan", "Mesenteric Angiography (CT or Conventional)", "Ultrasound", "KUB"]', 1, 'Angiography is needed to visualize the arterial blockage.');

    -- CASE 29: Post-Op Complications - The 5 Ws
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Post-Op Fever', 'A patient develops a fever of 101°F on post-op day 1 after a major thoracic procedure.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of fever on POD 1-2 ("Wind")?', '["Pneumonia", "Atelectasis", "UTI", "DVT"]', 1, 'Atelectasis (or early pneumonia) is the classic "Wind" cause of early post-op fever.'),
    (v_case_id, 'What is the "5 Ws" mnemonic for post-op fever in order?', '["Wind, Water, Walking, Wound, Wonder drugs", "Wound, Wind, Water, Walking, Wonder drugs", "Water, Wind, Wound, Walking, Wonder drugs", "Wind, Wound, Water, Walking, Wonder drugs"]', 0, 'Wind (POD 1-2), Water (POD 3: UTI), Walking (POD 5: DVT/PE), Wound (POD 7: SSI), Wonder drugs (anytime).'),
    (v_case_id, 'A fever occurring WITHIN THE FIRST HOUR of surgery is most concerning for:', '["Infection", "Malignant Hyperthermia", "Atelectasis", "Drug reaction"]', 1, 'Malignant hyperthermia is a life-threatening reaction to anesthetic gases.');

    -- CASE 30: Malignant Hyperthermia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The OR Crisis', 'During an operation, the anesthesiologist notices a sudden rise in end-tidal CO2, followed by muscle rigidity and a temperature of 105°F.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definitive pharmacological treatment for Malignant Hyperthermia?', '["Atropine", "Dantrolene", "Epinephrine", "Insulin"]', 1, 'Dantrolene blocks the release of calcium from the sarcoplasmic reticulum.'),
    (v_case_id, 'What is the underlying defect in this condition?', '["Potassium channel mutation", "Ryanodine receptor (RYR1) mutation in skeletal muscle", "Hyperthyroidism", "Liver failure"]', 1, 'It is an autosomal dominant mutation triggered by volatile anesthetics (e.g., Halothane) or succinylcholine.'),
    (v_case_id, 'What happens to the pCO2 and pH in Malignant Hyperthermia?', '["High pCO2 and Metabolic Acidosis", "Low pCO2 and Alkalosis", "Normal", "High pCO2 and Alkalosis"]', 0, 'Massive muscle metabolism leads to extreme CO2 production and lactic acidosis.');

    RAISE NOTICE 'SUCCESS: Surgical Principles Case Blocks (1-30) registered.';
END $$;

COMMIT;
