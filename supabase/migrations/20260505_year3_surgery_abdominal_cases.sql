BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Abdominal Surgery
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'abdominal-surgery' LIMIT 1;

    -- CASE 01: Acute Appendicitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Migrating Pain', 'A 19-year-old male presents with 12 hours of abdominal pain that started around his belly button and has moved to his right lower quadrant. He has a fever of 100.5°F and a high WBC count.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for the specific anatomical location of maximal tenderness in this patient?', '["McBurney''s Point", "Murphy''s Point", "Griffith''s Point", "Boas'' Point"]', 0, 'McBurney''s point is located 1/3 of the distance from the ASIS to the umbilicus.'),
    (v_case_id, 'What is the Alvarado Score used for?', '["To stage colon cancer", "To predict the likelihood of acute appendicitis", "To measure fluid loss", "To grade hemorrhoids"]', 1, 'The Alvarado (MANTRELS) score uses symptoms, signs, and labs to help decide on the need for imaging or surgery.'),
    (v_case_id, 'What is the most common cause of luminal obstruction in adult appendicitis?', '["Fruit seeds", "Fecalith", "Lymphoid hyperplasia", "Parasites"]', 1, 'In adults, a fecalith is the primary cause; in children, lymphoid hyperplasia is more common.');

    -- CASE 02: Small Bowel Obstruction (SBO)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vomiting and Previous Surgery', 'A 60-year-old woman presents with crampy abdominal pain, vomiting, and abdominal distension. She has a midline scar from a hysterectomy 10 years ago. X-ray shows dilated small bowel with air-fluid levels.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of small bowel obstruction in the industrialized world?', '["Hernias", "Post-operative adhesions", "Malignancy", "Crohn''s disease"]', 1, 'Adhesions from prior abdominal surgery account for ~60-70% of SBO cases.'),
    (v_case_id, 'What clinical finding most strongly suggests "strangulated" (ischemic) SBO over simple SBO?', '["Nausea", "Fever, tachycardia, and localized, constant abdominal pain", "Abdominal distension", "High-pitched bowel sounds"]', 1, 'Systemic signs and constant (rather than crampy) pain suggest compromised blood flow.'),
    (v_case_id, 'What is the initial management for a stable patient with a partial SBO?', '["Immediate surgery", "NG tube decompression, IV fluids, and \"watchful waiting\"", "Barium enema", "Laxatives"]', 1, 'Many adhesive SBOs resolve with conservative management (drip and suck).');

    -- CASE 03: Indirect Inguinal Hernia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scrotal Bulge', 'A 20-year-old male presents with a bulge in his right scrotum that appears when he lifts weights and disappears when he lies down.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'An indirect inguinal hernia is caused by what embryological defect?', '["Weakness in the transversalis fascia", "Patent processus vaginalis", "Obesity", "Enlarged prostate"]', 1, 'The hernia sac follows the path of the descending testicle through a patent processus.'),
    (v_case_id, 'Where does an INDIRECT hernia enter the inguinal canal?', '["Medial to the inferior epigastric vessels", "Lateral to the inferior epigastric vessels (through the deep ring)", "Below the inguinal ligament", "Through the femoral canal"]', 1, 'Indirect hernias are lateral to the inferior epigastrics.');

    -- CASE 04: Direct Inguinal Hernia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Aging Groin', 'A 70-year-old male has a bulge in his groin that is medial to the inferior epigastric artery. It does not descend into the scrotum.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the anatomical area through which direct hernias protrude?', '["Hesselbach''s Triangle", "The Femoral Ring", "The Deep Ring", "The Obturator Foramen"]', 0, 'Hesselbach''s triangle is bounded by the rectus sheath, inguinal ligament, and inferior epigastric vessels.'),
    (v_case_id, 'What is the primary cause of a DIRECT inguinal hernia?', '["Congenital defect", "Acquired weakness of the abdominal wall (transversalis fascia)", "Infection", "Trauma"]', 1, 'Direct hernias are typically due to wear-and-tear in older patients.');

    -- CASE 05: Femoral Hernia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Lump in an Elderly Woman', 'An 80-year-old woman presents with an intensely painful, non-reducible lump just below the inguinal ligament. She is vomiting.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is a femoral hernia located relative to the inguinal ligament?', '["Above and medial", "Below and lateral to the pubic tubercle", "In the scrotum", "At the umbilicus"]', 1, 'Femoral hernias pass through the femoral canal, inferior to the inguinal ligament.'),
    (v_case_id, 'Why are femoral hernias considered more dangerous than inguinal hernias?', '["They are more common", "They have a high risk of incarceration and strangulation (up to 40%) due to the narrow neck", "They cause more pain", "They are easier to miss"]', 1, 'The rigid boundaries of the femoral canal make strangulation very likely.'),
    (v_case_id, 'True or False: Femoral hernias are more common than inguinal hernias in women.', '["True", "False"]', 1, 'False. Inguinal hernias are still the most common hernia in women, but femoral hernias occur *more frequently* in women than in men.');

    -- CASE 06: Acute Diverticulitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Left-Sided "Appendicitis"', 'A 60-year-old male presents with severe left lower quadrant pain, fever, and constipation.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnostic test of choice for suspected acute diverticulitis?', '["Colonoscopy", "CT Abdomen with IV contrast", "Barium Enema", "Ultrasound"]', 1, 'CT is needed to assess for complications (abscess, phlegmon, perforation). Colonoscopy is avoided in the acute phase due to perforation risk.'),
    (v_case_id, 'What is the Hinchey Classification used for?', '["Grading hemorrhoids", "Categorizing the severity of perforated diverticulitis", "Staging colon cancer", "Measuring bowel length"]', 1, 'Hinchey ranges from 1 (pericolic abscess) to 4 (fecal peritonitis).'),
    (v_case_id, 'What is the classic surgical procedure for a Hinchey III/IV perforation?', '["Laparoscopic appendectomy", "Hartmann''s Procedure (Resection + End Colostomy)", "Primary anastomosis", "Stricturoplasty"]', 1, 'A Hartmann''s procedure involves resecting the diseased segment and bringing the proximal end out as a stoma, leaving the rectal stump closed.');

    -- CASE 07: Sigmoid Volvulus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The "Coffee Bean" on X-ray', 'An 85-year-old nursing home resident with chronic constipation presents with massive abdominal distension. X-ray shows a large, air-filled loop of colon that looks like a coffee bean.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Small Bowel Obstruction", "Sigmoid Volvulus", "Cecal Volvulus", "Intussusception"]', 1, 'Sigmoid volvulus is common in the elderly and institutionalized.'),
    (v_case_id, 'What is the first-line treatment for an uncomplicated sigmoid volvulus (no signs of gangrene)?', '["Emergency surgery", "Endoscopic detorsion (sigmoidoscopy) with a rectal tube", "Laxatives", "Antibiotics"]', 1, 'Sigmoidoscopy can often untwist the bowel and relieve the obstruction non-surgically.'),
    (v_case_id, 'How is a cecal volvulus different in management from a sigmoid volvulus?', '["It can also be untwisted endoscopically", "It almost always requires surgery (Resection or Cecopexy)", "It doesn''t cause distension", "It is always painless"]', 1, 'Endoscopic detorsion is rarely successful for cecal volvulus; surgery is mandatory.');

    -- CASE 08: Mesenteric Ischemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pain Out of Proportion', 'A 70-year-old male with atrial fibrillation presents with sudden, catastrophic abdominal pain. On exam, he has no tenderness or guarding, despite screaming in pain.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic clinical description for this presentation?', '["Rebound tenderness", "Pain out of proportion to physical exam findings", "Positive Murphy''s sign", "Shifting dullness"]', 1, 'This is the hallmark of acute mesenteric ischemia before the bowel becomes necrotic.'),
    (v_case_id, 'What is the most common cause of acute mesenteric ischemia?', '["Venous thrombosis", "Arterial embolism (often from the heart)", "Atherosclerosis", "Cancer"]', 1, 'The SMA is the most common site for an embolic event.'),
    (v_case_id, 'What finding on CT or X-ray indicates "dead bowel" (advanced ischemia)?', '["Dilated loops", "Pneumatosis intestinalis (air in the bowel wall) and portal venous gas", "Stones", "Free air"]', 1, 'Pneumatosis and portal gas are late, ominous signs of transmural necrosis.');

    -- CASE 09: Peptic Ulcer Perforation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Free Air Under the Diaphragm', 'A 45-year-old male with a history of NSAID use presents with sudden, "board-like" abdominal rigidity. An upright CXR shows a crescent of air beneath the right hemidiaphragm.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Pneumonia", "Perforated Peptic Ulcer", "Cholecystitis", "Spleen rupture"]', 1, 'Sudden onset peritonitis and pneumoperitoneum indicate a perforated viscus.'),
    (v_case_id, 'What is the standard surgical repair for a perforated duodenal ulcer?', '["Gastrectomy", "Graham Patch (Omental patch repair)", "Vagotomy", "Whipple procedure"]', 1, 'The perforation is plugged using a piece of the omentum.'),
    (v_case_id, 'Besides NSAIDs, what is the major risk factor for peptic ulcer disease?', '["Diabetes", "Helicobacter pylori infection", "Alcohol", "Smoking"]', 1, 'H. pylori is a leading cause of ulceration.');

    -- CASE 10: Ogilvie''s Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Massive Distension Without Obstruction', 'A 75-year-old is POD 2 from a total hip replacement. He has a massive, bloated abdomen. CT shows a massively dilated colon but no mechanical transition point.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["LBO", "Ogilvie''s Syndrome (Acute Colonic Pseudo-obstruction)", "Sigmoid volvulus", "Celiac disease"]', 1, 'Ogilvie''s is functional colonic dilation often seen in elderly, sick patients after non-abdominal surgery.'),
    (v_case_id, 'What is the risk if the cecal diameter exceeds 10-12 cm?', '["Nothing", "Ischemia and perforation of the cecum", "Vomiting", "Diarrhea"]', 1, 'The cecum is the most likely part to perforate due to Laplace''s Law.'),
    (v_case_id, 'Which medication can be used for pharmacologic decompression of Ogilvie''s?', '["Morphine", "Neostigmine", "Atropine", "Loperamide"]', 1, 'Neostigmine increases parasympathetic tone and stimulates colonic motility.');

    -- CASE 11: Incarcerated vs. Strangulated
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Stuck Hernia', 'A patient presents with an umbilical hernia that can no longer be pushed back into the abdomen. It is tender, but there is no fever or skin redness.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for a hernia that cannot be reduced?', '["Incarcerated", "Strangulated", "Reducible", "Sliding"]', 0, 'Incarceration means the contents are "trapped" but not necessarily ischemic yet.'),
    (v_case_id, 'What is the term when the blood supply to the trapped contents is compromised?', '["Incarcerated", "Strangulated", "Incisional", "Ventral"]', 1, 'Strangulation is a surgical emergency.'),
    (v_case_id, 'A "Richter''s hernia" involves:', '["The whole bowel loop", "Only a portion of the bowel wall (one side)", "The bladder", "The appendix"]', 1, 'Richter hernias can strangulate without causing a complete bowel obstruction.');

    -- CASE 12: Gastric Cancer
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Weight Loss and Early Satiety', 'A 60-year-old male from Japan presents with weight loss and feeling full after only a few bites of food. On exam, he has a firm node in his umbilicus.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the umbilical node called?', '["Virchow node", "Sister Mary Joseph node", "Irish node", "Blumer shelf"]', 1, 'Sister Mary Joseph node indicates metastatic spread to the umbilicus, often from the GI tract.'),
    (v_case_id, 'Which dietary factor is a known risk for gastric cancer?', '["High fiber", "Nitrosamines (smoked and salted foods)", "Vitamin C", "Gluten"]', 1, 'Smoked/salted foods are a major risk factor, explaining higher rates in Japan.'),
    (v_case_id, 'A firm mass felt on digital rectal exam in a patient with gastric cancer is called:', '["Virchow node", "Blumer Shelf", "Krukenberg tumor", "Irish node"]', 1, 'Blumer shelf is a deposit of tumor in the pouch of Douglas.');

    -- CASE 13: Colorectal Cancer - Right vs. Left
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Anemia vs. Obstruction', 'Patient A has iron-deficiency anemia but no change in bowel habits. Patient B has "pencil-thin" stools and bright red blood per rectum.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is Patient A''s likely tumor located?', '["Cecum / Right Colon", "Rectum", "Sigmoid", "Anus"]', 0, 'Right-sided tumors are larger and bleed chronically (anemia) but rarely obstruct because the stool is liquid.'),
    (v_case_id, 'Where is Patient B''s likely tumor located?', '["Cecum", "Left Colon / Sigmoid", "Small bowel", "Appendix"]', 1, 'Left-sided tumors involve solid stool and a narrower lumen, leading to obstructive symptoms and "pencil" stools.'),
    (v_case_id, 'What is the most common site of distant metastasis for colon cancer?', '["Brain", "Liver", "Lungs", "Bone"]', 1, 'Metastasis occurs primarily via the portal circulation to the liver.');

    -- CASE 14: Hemorrhoids
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Painless Bleeding', 'A 45-year-old reports bright red blood dripping into the toilet after a bowel movement. He has no pain but feels a "prolapse" that he can push back manually.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Internal hemorrhoids originate ___________ the dentate line.', '["Above", "Below"]', 0, 'Internal hemorrhoids are above the dentate line and are typically painless.'),
    (v_case_id, 'Based on the description (prolapse requiring manual reduction), what grade of hemorrhoids does he have?', '["Grade I", "Grade II", "Grade III", "Grade IV"]', 2, 'Grade III: Prolapse requiring manual reduction. (Grade II reduces spontaneously; Grade IV is irreducible).'),
    (v_case_id, 'What is the first-line treatment for symptomatic Grade I/II hemorrhoids?', '["Surgery (Hemorrhoidectomy)", "High fiber diet, stool softeners, and increased fluids", "Antibiotics", "Sclerotherapy"]', 1, 'Conservative management is the first step.');

    -- CASE 15: Anal Fissure
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pain Like "Shards of Glass"', 'A 30-year-old female reports excruciating pain during bowel movements that lasts for hours afterward. She has been afraid to eat to avoid going to the bathroom.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common location for an anal fissure?', '["Lateral", "Posterior midline", "Anterior midline", "Left upper quadrant"]', 1, '90% of fissures are in the posterior midline.'),
    (v_case_id, 'A fissure found in a LATERAL position should raise suspicion for:', '["Constipation", "Crohn''s disease, HIV, or syphilis", "Hemorrhoids", "Cancer"]', 1, 'Lateral fissures are "atypical" and suggest an underlying systemic disease.'),
    (v_case_id, 'What is the "sentinel pile" associated with a chronic fissure?', '["A tumor", "A skin tag at the distal end of the fissure", "A hemorrhoid", "An abscess"]', 1, 'A sentinel tag is a sign of chronicity.');

    -- CASE 16: Perianal Abscess
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Throbbing Rectal Pain', 'A patient presents with constant, throbbing perianal pain and fever. On exam, there is a red, fluctuant, exquisitely tender mass near the anus.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the treatment for a perianal abscess?', '["Antibiotics and sitz baths", "Incision and drainage (I&D) in the clinic", "Emergency laparotomy", "Colonoscopy"]', 1, 'All abscesses require drainage. Antibiotics are only used if there is extensive cellulitis or systemic sepsis.'),
    (v_case_id, 'What is a common long-term complication of a perianal abscess (occurring in 30-50% of cases)?', '["Anal cancer", "Fistula-in-ano", "Incontinence", "Constipation"]', 1, 'An abnormal track can form between the anal canal and the skin.'),
    (v_case_id, 'According to "Goodsall''s Rule", a fistula with an external opening POSTERIOR to the transverse anal line will have a track that:', '["Goes straight in", "Curves to the posterior midline", "Curves to the anterior midline", "Has no track"]', 1, 'Posterior openings = curved/midline track. Anterior = straight track (unless > 3cm away).');

    -- CASE 17: Crohn''s - Surgical Indications
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Recurrent Obstruction in IBD', 'A 28-year-old with known Crohn''s disease presents with his 4th episode of small bowel obstruction this year. Imaging shows a "string sign" in the terminal ileum.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the general philosophy regarding surgery for Crohn''s disease?', '["Surgery is curative", "Surgery should be as conservative as possible (bowel-sparing) as the disease can recur", "Total proctocolectomy is the best option", "Surgery should never be done"]', 1, 'Unlike UC, Crohn''s is not cured by surgery; only complications are treated.'),
    (v_case_id, 'What is a "Stricturoplasty"?', '["Removing the bowel", "Widening a narrowed segment of bowel without resecting it", "Bypassing the segment", "Stenting the bowel"]', 1, 'This is a bowel-sparing technique used for fibrotic strictures.'),
    (v_case_id, 'What is the most common site of Crohn''s disease?', '["Rectum", "Terminal ileum and cecum", "Esophagus", "Stomach"]', 1, 'Ileocolic involvement is the most common pattern.');

    -- CASE 18: Ulcerative Colitis - Surgical Indications
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Toxic Megacolon', 'A patient with UC presents with bloody diarrhea, severe abdominal pain, a HR of 130, and a fever of 103°F. X-ray shows the colon dilated to 8 cm.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this life-threatening complication called?', '["Crohn''s flare", "Toxic Megacolon", "Intussusception", "Sigmoid volvulus"]', 1, 'Toxic megacolon is an emergency due to the risk of perforation and sepsis.'),
    (v_case_id, 'What is the definitive, curative surgical procedure for Ulcerative Colitis?', '["Segmental resection", "Total Proctocolectomy with Ileal Pouch-Anal Anastomosis (IPAA)", "Ileostomy only", "Whipple procedure"]', 1, 'Since UC only affects the colon and rectum, removing them "cures" the disease.'),
    (v_case_id, 'True or False: Smoking is a risk factor for Ulcerative Colitis flares.', '["True", "False"]', 1, 'False. Interestingly, smoking is actually somewhat "protective" or associated with a milder course in UC (but is a major risk for Crohn''s).');

    -- CASE 19: Splenic Rupture
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Left Shoulder Pain After a MVA', 'A 20-year-old male is brought to the ER after a car accident. He has left-sided rib fractures and complains of pain in his left shoulder.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for referred left shoulder pain caused by splenic irritation?', '["Murphy''s Sign", "Kehr''s Sign", "Grey Turner''s Sign", "McBurney''s Sign"]', 1, 'Blood in the peritoneum irritating the diaphragm causes referred pain to the C3-C5 dermatomes.'),
    (v_case_id, 'What is the most common organ injured in BLUNT abdominal trauma?', '["Liver", "Spleen", "Small bowel", "Kidney"]', 1, 'The spleen is the #1 organ injured in blunt trauma.'),
    (v_case_id, 'If a patient remains hemodynamically STABLE after a splenic injury, what is the preferred management?', '["Immediate splenectomy", "Non-operative management (observation and bedrest)", "Exploratory laparotomy", "Antibiotics"]', 1, 'Most splenic injuries can be managed without surgery if the patient is stable.');

    -- CASE 20: Post-Splenectomy Complications
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Life Without a Spleen', 'A patient had a splenectomy for trauma. You are preparing him for discharge.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "OPSI"?', '["A type of suture", "Overwhelming Post-Splenectomy Infection", "A bowel condition", "A liver tumor"]', 1, 'Sepsis caused by encapsulated organisms in asplenic patients, which has a very high mortality rate.'),
    (v_case_id, 'Against which three organisms must an asplenic patient be vaccinated?', '["Staph, Strep, Pseudomonas", "S. pneumoniae, H. influenzae type B, and N. meningitidis", "HIV, Hep B, Hep C", "Measles, Mumps, Rubella"]', 1, 'These are the three major encapsulated bacteria that the spleen normally filters.'),
    (v_case_id, 'What characteristic RBC finding is seen on the blood smear after splenectomy?', '["Target cells", "Howell-Jolly bodies", "Schistocytes", "Sickle cells"]', 1, 'Howell-Jolly bodies are nuclear remnants that are normally "pitted" out by the spleen.');

    -- CASE 21: Small Bowel - Carcinoid
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Flushing and Diarrhea', 'A 50-year-old male has had intermittent flushing, wheezing, and watery diarrhea. He is found to have a mass in his distal ileum.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Colon cancer", "Carcinoid Tumor (Carcinoid Syndrome)", "Crohn''s disease", "Celiac disease"]', 1, 'Carcinoid syndrome is caused by the release of serotonin and other mediators.'),
    (v_case_id, 'Why does a small bowel carcinoid only cause systemic "syndrome" once it has metastasized to the liver?', '["The liver activates the serotonin", "First-pass metabolism in the liver normally inactivates the hormones from the gut", "It doesn''t", "The tumor needs to be large"]', 1, 'The liver destroys the serotonin before it reaches the heart/lungs, unless there are liver mets that dump directly into the systemic veins.'),
    (v_case_id, 'Which vitamin deficiency can occur in carcinoid syndrome due to the use of tryptophan to make serotonin?', '["Vitamin B12", "Niacin (B3) - causing Pellagra", "Vitamin D", "Folate"]', 1, 'Divertng tryptophan to serotonin synthesis can lead to niacin deficiency (Diarrhea, Dementia, Dermatitis).');

    -- CASE 22: Pilonidal Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pain at the Base of the Spine', 'An 18-year-old hairy male presents with a painful, draining sinus at the top of his gluteal cleft (tailbone area).', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Anal fissure", "Pilonidal Disease", "Hemorrhoids", "Rectal prolapse"]', 1, 'Pilonidal cysts/sinuses are common in young, hairy males and involve hair follicles in the natal cleft.'),
    (v_case_id, 'What is the primary treatment for an acute pilonidal ABSCESS?', '["Long-term antibiotics", "Incision and drainage", "Total excision", "Laser hair removal"]', 1, 'Acute abscesses must be drained; definitive excision is reserved for after the inflammation has settled.'),
    (v_case_id, 'True or False: Pilonidal disease is an infection of the rectum.', '["True", "False"]', 1, 'False. It is a skin and subcutaneous tissue disease, not connected to the bowel.');

    -- CASE 23: Meckel''s Diverticulum
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rule of 2s', 'A 2-year-old child presents with painless bright red blood from the rectum.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Appendicitis", "Meckel''s Diverticulum", "Intussusception", "Anal fissure"]', 1, 'Meckel''s is the most common congenital anomaly of the GI tract.'),
    (v_case_id, 'Meckel''s diverticulum is a remnant of what embryonic structure?', '["Umbilical cord", "Vitelline (Omphalomesenteric) duct", "Urachus", "Aortic arch"]', 1, 'The duct normally obliterates; if it persists, it forms the diverticulum.'),
    (v_case_id, 'Why does Meckel''s diverticulum cause bleeding?', '["It is a cancer", "It often contains ectopic gastric mucosa that secretes acid, ulcerating the adjacent ileum", "It twists", "It is caused by a virus"]', 1, 'Ectopic acid secretion is the primary cause of painless bleeding.');

    -- CASE 24: Rectal Prolapse
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Protruding Mass', 'An 80-year-old woman with a history of chronic straining and multiparity presents with a large mass protruding from her anus. It has concentric rings of mucosa.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do you distinguish full-thickness rectal prolapse from prolapsed internal hemorrhoids?', '["Hemorrhoids are bigger", "Prolapse has concentric rings; hemorrhoids have radial folds", "Prolapse is only in men", "There is no way to tell"]', 1, 'The pattern of the mucosal folds is the key differentiator.'),
    (v_case_id, 'What is the primary risk factor for rectal prolapse in women?', '["Obesity", "Multiparity (multiple childbirths) and chronic constipation", "Smoking", "High protein diet"]', 1, 'Weakness of the pelvic floor and levator ani muscles allows the rectum to telescope through the anus.'),
    (v_case_id, 'What is the name of the surgical procedure to fix rectal prolapse?', '["Hemorrhoidectomy", "Rectopexy", "Colectomy", "Hartmann''s"]', 1, 'Rectopexy involves anchoring the rectum back to the sacrum.');

    -- CASE 25: Upper GI Bleeding - Dieulafoy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Intermittent Massive Bleeding', 'A 50-year-old presents with intermittent, massive hematemesis. Endoscopy shows a small, pinpoint vessel in the gastric fundus with active arterial spurting, but no ulcer.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Mallory-Weiss tear", "Dieulafoy Lesion", "Gastric cancer", "Esophageal varices"]', 1, 'A Dieulafoy lesion is a large caliber, tortuous submucosal artery that erodes through the mucosa.'),
    (v_case_id, 'Where is a Dieulafoy lesion most commonly located?', '["Duodenum", "Lesser curvature of the stomach (proximal)", "Colon", "Esophagus"]', 1, 'The proximal stomach (cardia/fundus) is the typical site.'),
    (v_case_id, 'How is a Mallory-Weiss tear different?', '["It is an artery", "It is a mucosal laceration at the GE junction following forceful vomiting/retching", "It is in the rectum", "It only happens in children"]', 1, 'Mallory-Weiss follows retching; Dieulafoy is spontaneous arterial bleeding.');

    -- CASE 26: Pancreatitis - Surgical Indications
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Infected Necrosis', 'A patient with severe acute pancreatitis is 2 weeks into his hospital course. He develops a new fever and CT shows gas bubbles within the pancreatic necrotic tissue.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the management of infected pancreatic necrosis?', '["Continue observation only", "Necrosectomy (surgical or endoscopic debridement) and antibiotics", "Immediate total pancreatectomy", "Radiation"]', 1, 'Infected necrosis is a formal indication for intervention.'),
    (v_case_id, 'What is the most common cause of acute pancreatitis in the US?', '["Alcohol", "Gallstones", "Hypertriglyceridemia", "Medications"]', 1, 'Gallstones and Alcohol are the top two, but stones are #1.'),
    (v_case_id, 'What is "Grey Turner''s Sign"?', '["Bruising in the RUQ", "Ecchymosis of the flanks, indicating retroperitoneal hemorrhage", "Ecchymosis of the umbilicus", "A palpable gallbladder"]', 1, 'Classic physical sign of severe hemorrhagic pancreatitis.');

    -- CASE 27: Intussusception
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The "Currant Jelly" Stool', 'A 12-month-old child presents with paroxysms of severe abdominal pain where he draws his knees to his chest, followed by the passage of a "currant jelly" (bloody/mucous) stool.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pyloric stenosis", "Intussusception", "Meckel''s", "Malrotation"]', 1, 'Telescoping of one segment of bowel into another.'),
    (v_case_id, 'What mass is often palpable in the RUQ?', '["A ball", "A sausage-shaped mass", "A rock", "Nothing"]', 1, 'The "sausage mass" in the RUQ with emptiness in the RLQ (Dance sign) is classic.'),
    (v_case_id, 'What is both the diagnostic and therapeutic procedure of choice for pediatric intussusception?', '["CT scan", "Air or Contrast Enema", "Emergency surgery", "Colonoscopy"]', 1, 'The pressure from the enema usually "pops" the bowel back out.');

    -- CASE 28: Small Bowel - Short Bowel Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Life After Massive Resection', 'A patient had a massive resection of his small bowel due to mesenteric ischemia. He now has less than 100 cm of small bowel remaining.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary clinical problem in Short Bowel Syndrome?', '["Constipation", "Malabsorption and malnutrition", "Fever", "High blood pressure"]', 1, 'Lack of surface area leads to severe nutrient and fluid loss.'),
    (v_case_id, 'Loss of which specific segment of the small bowel is most critical?', '["Jejunum", "Terminal Ileum", "Duodenum", "Stomach"]', 1, 'The terminal ileum is where Vitamin B12 and Bile Salts are absorbed; its loss leads to profound B12 deficiency and fat malabsorption.'),
    (v_case_id, 'What is the most important stimulus for "adaptation" (growth) of the remaining bowel?', '["TPN", "Enteral nutrition (feeding the gut)", "Antibiotics", "Steroids"]', 1, 'Nutrients in the lumen trigger hormones that help the remaining bowel grow larger and absorb more.');

    -- CASE 29: Abdominal Compartment Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Tense Abdomen', 'After a massive resuscitation for trauma, a patient has a "rock-hard" abdomen, peak airway pressures on the ventilator are high, and urine output has stopped.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Sepsis", "Abdominal Compartment Syndrome (ACS)", "Pneumonia", "Liver failure"]', 1, 'ACS is caused by high intra-abdominal pressure (> 20 mmHg) leading to organ dysfunction.'),
    (v_case_id, 'What is the indirect way to measure intra-abdominal pressure?', '["Measuring girth", "Bladder pressure (using a Foley catheter)", "CT scan", "Feeling the skin"]', 1, 'Bladder pressure reflects intra-abdominal pressure.'),
    (v_case_id, 'What is the definitive treatment for ACS?', '["Give more fluids", "Decompressive laparotomy (opening the abdomen)", "Diuretics", "Paracentesis"]', 1, 'The abdomen must be opened to relieve the pressure.');

    -- CASE 30: Small Bowel Neoplasms - General
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rare Tumor', 'A 50-year-old is found to have a malignant tumor in his small bowel. It is an Adenocarcinoma.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where in the small bowel is Adenocarcinoma most commonly found?', '["Ileum", "Duodenum (especially the second part)", "Jejunum", "Appendix"]', 1, 'Small bowel adenocarcinoma is rare overall but favors the duodenum.'),
    (v_case_id, 'Which genetic syndrome is associated with a high risk of small bowel adenocarcinoma?', '["FAP (Familial Adenomatous Polyposis)", "MEN 1", "Li-Fraumeni", "Down syndrome"]', 0, 'FAP patients need regular surveillance of the duodenum.'),
    (v_case_id, 'True or False: The small bowel accounts for only 1-2% of all GI malignancies despite being 90% of the GI surface area.', '["True", "False"]', 0, 'True. The small bowel is remarkably resistant to cancer compared to the stomach and colon.');

    RAISE NOTICE 'SUCCESS: Abdominal Surgery Case Blocks (1-30) registered.';
END $$;

COMMIT;
