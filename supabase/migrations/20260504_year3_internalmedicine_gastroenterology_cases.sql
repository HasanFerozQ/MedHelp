BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'gastroenterology' LIMIT 1;

    -- CASE 01: Acute Upper GI Bleeding (PUD)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Melena and Hematemesis', 'A 55-year-old male with a history of daily NSAID use for arthritis presents with episodes of vomiting "coffee-ground" material and passing black, tarry stools. His BP is 100/60 mmHg and HR is 105 bpm.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of his bleeding?', '["Esophageal Varices", "Peptic Ulcer Disease (PUD)", "Mallory-Weiss Tear", "Diverticulosis"]', 1, 'NSAID use is a major risk factor for gastric and duodenal ulcers.'),
    (v_case_id, 'What is the first-line diagnostic and therapeutic procedure?', '["CT Abdomen", "Upper Endoscopy (EGD)", "Colonoscopy", "Barium Swallow"]', 1, 'EGD allows for visualization and intervention (e.g., clipping, cautery).'),
    (v_case_id, 'What pharmacological agent should be started immediately?', '["Low-dose Aspirin", "IV Proton Pump Inhibitor (PPI)", "Octreotide", "Antibiotics"]', 1, 'High-dose IV PPI reduces the risk of re-bleeding.');

    -- CASE 02: Variceal Bleeding
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hematemesis in a Patient with Cirrhosis', 'A 50-year-old male with known alcoholic cirrhosis presents with massive bright red hematemesis. He has a distended abdomen with shifting dullness and "caput medusae" on his abdominal wall.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely source of bleeding?', '["Gastric ulcer", "Esophageal Varices", "Angiodysplasia", "Hemorrhoids"]', 1, 'Portal hypertension in cirrhosis leads to the formation of varices.'),
    (v_case_id, 'Which medication should be given to reduce portal inflow?', '["Propranolol", "Octreotide", "Lactulose", "Omeprazole"]', 1, 'Octreotide causes splanchnic vasoconstriction, reducing portal pressure.'),
    (v_case_id, 'In addition to endoscopic banding, what else is routinely given to cirrhotics with GI bleeding?', '["Morphine", "Prophylactic Antibiotics (e.g., Ceftriaxone)", "High-dose Vitamin C", "Insulin"]', 1, 'Antibiotics reduce mortality and the risk of SBP in cirrhotics with GI bleeds.');

    -- CASE 03: Acute Pancreatitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Epigastric Pain Radiating to the Back', 'A 40-year-old female presents with severe, boring epigastric pain that radiates to her back. She has nausea and vomiting. She has no history of alcohol use but was recently diagnosed with gallstones.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two most common causes of acute pancreatitis in the US?', '["Gallstones and Alcohol", "Drugs and Trauma", "Infection and Cancer", "High fat and smoking"]', 0, 'Gallstones are #1, Alcohol is #2.'),
    (v_case_id, 'Which lab test is more specific for the diagnosis of pancreatitis?', '["Serum Amylase", "Serum Lipase", "Liver Function Tests", "White Blood Cell Count"]', 1, 'Lipase stays elevated longer and is more specific than amylase.'),
    (v_case_id, 'What is the mainstay of initial management?', '["Immediate surgery", "Aggressive IV fluid resuscitation and NPO", "IV antibiotics", "Morphine only"]', 1, 'Hydration is critical to prevent necrosis; antibiotics are NOT used for uncomplicated pancreatitis.');

    -- CASE 04: Crohn''s Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'RLQ Pain and Perianal Fistulas', 'A 25-year-old female presents with chronic abdominal pain, weight loss, and non-bloody diarrhea. On exam, she has a tender mass in the RLQ and a perianal fistula.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Ulcerative Colitis", "Crohn''s Disease", "Appendicitis", "Celiac Disease"]', 1, 'Crohn''s can involve any part of the GI tract, often involves the terminal ileum (RLQ), and commonly forms fistulas.'),
    (v_case_id, 'What is a classic endoscopic finding in Crohn''s?', '["Diffuse continuous inflammation", "Skip lesions and Cobblestoning", "Pseudopolyps only", "Flat mucosa"]', 1, 'Skip lesions and transmural inflammation are hallmark features.'),
    (v_case_id, 'Histology of a biopsy from the affected area would most likely show:', '["Crypt abscesses only", "Non-caseating granulomas", "Villous atrophy", "Signet ring cells"]', 1, 'Granulomas are seen in ~30% of Crohn''s patients.');

    -- CASE 05: Ulcerative Colitis (UC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bloody Diarrhea and Tenesmus', 'A 30-year-old male presents with 2 months of bloody diarrhea, abdominal cramping, and tenesmus (a constant urge to defecate).', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Crohn''s Disease", "Ulcerative Colitis", "Infectious Colitis", "IBS"]', 1, 'UC typically involves the rectum and extends proximally in a continuous fashion.'),
    (v_case_id, 'What is the most serious ACUTE complication of UC?', '["Fistula", "Toxic Megacolon", "Stricture", "Weight loss"]', 1, 'Characterized by massive colonic dilation and risk of perforation.'),
    (v_case_id, 'Which extra-intestinal manifestation is strongly associated with UC?', '["Ankylosing spondylitis", "Primary Sclerosing Cholangitis (PSC)", "Uveitis", "Erythema nodosum"]', 1, 'PSC is seen in ~5% of UC patients; check alkaline phosphatase.');

    -- CASE 06: Achalasia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dysphagia to Solids and Liquids', 'A 45-year-old female presents with 6 months of difficulty swallowing both solid foods and liquids. She often regurgitates undigested food at night.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Esophageal Cancer", "Achalasia", "Schatzki Ring", "Zenker Diverticulum"]', 1, 'Dysphagia to both solids and liquids from the start suggests a motility disorder like achalasia.'),
    (v_case_id, 'What is the classic finding on a Barium Swallow?', '["Apple-core lesion", "Bird''s-beak appearance", "Corkscrew esophagus", "Outpouching"]', 1, 'Represents a dilated esophagus with a tapered distal end.'),
    (v_case_id, 'What is the gold standard diagnostic test?', '["Endoscopy", "Esophageal Manometry", "CT scan", "24-hour pH monitoring"]', 1, 'Manometry shows failure of the Lower Esophageal Sphincter (LES) to relax and aperistalsis.');

    -- CASE 07: Gastroesophageal Reflux Disease (GERD)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Heartburn and a Sour Taste', 'A 50-year-old obese male presents with "heartburn" that is worse after eating large meals and when lying down. He also notes a "sour taste" in his mouth in the morning.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary management for uncomplicated GERD?', '["Immediate surgery", "Lifestyle modifications and Proton Pump Inhibitors (PPIs)", "Antibiotics", "Endoscopy"]', 1, 'Weight loss, avoiding late meals, and PPIs are first-line.'),
    (v_case_id, 'Chronic GERD can lead to which premalignant condition?', '["Squamous cell hyperplasia", "Barrett''s Esophagus", "Gastric atrophy", "Achalasia"]', 1, 'Metaplasia of squamous epithelium to columnar epithelium (intestine-like).'),
    (v_case_id, 'Patients with Barrett''s Esophagus are at increased risk for:', '["Squamous cell carcinoma", "Esophageal Adenocarcinoma", "Gastric cancer", "Lymphoma"]', 1, 'Risk of adenocarcinoma is increased ~30-fold.');

    -- CASE 08: Celiac Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Diarrhea, Weight Loss, and an Itchy Rash', 'A 35-year-old female presents with chronic diarrhea, bloating, and weight loss. She also has a very itchy, blistering rash on her elbows and knees (dermatitis herpetiformis).', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best initial screening test?', '["Stool culture", "Anti-tissue Transglutaminase (tTG) IgA antibody", "Colonoscopy", "Skin biopsy"]', 1, 'Highly sensitive and specific for celiac disease.'),
    (v_case_id, 'What would a small bowel biopsy show?', '["Granulomas", "Villous atrophy and crypt hyperplasia", "Normal mucosa", "Flat polyps"]', 1, 'Blunting of the villi leads to malabsorption.'),
    (v_case_id, 'What is the definitive treatment?', '["Steroids", "Gluten-free diet", "Antibiotics", "Lactase supplements"]', 1, 'Requires complete avoidance of wheat, barley, and rye.');

    -- CASE 09: Primary Biliary Cholangitis (PBC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pruritus and Fatigue in a Middle-Aged Female', 'A 45-year-old female presents with severe itching (pruritus) and fatigue. Her skin shows scratch marks but no rash. Labs show a markedly elevated Alkaline Phosphatase with normal Bilirubin.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Hepatitis C", "Primary Biliary Cholangitis (PBC)", "Gallstones", "Liver cancer"]', 1, 'PBC is an autoimmune destruction of intrahepatic bile ducts.'),
    (v_case_id, 'What is the most specific laboratory marker for PBC?', '["Anti-Nuclear Antibody (ANA)", "Anti-Mitochondrial Antibody (AMA)", "p-ANCA", "Anti-Smooth Muscle Antibody"]', 1, 'AMA is positive in > 95% of patients.'),
    (v_case_id, 'What medication is used to slow the progression of PBC?', '["Prednisone", "Ursodeoxycholic acid (UDCA)", "Methotrexate", "Aspirin"]', 1, 'UDCA improves bile flow and delays the need for liver transplant.');

    -- CASE 10: Primary Sclerosing Cholangitis (PSC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Jaundice and a History of Ulcerative Colitis', 'A 35-year-old male with a 10-year history of Ulcerative Colitis presents with jaundice and right upper quadrant pain. MRCP shows multiple strictures and dilations of the intra- and extra-hepatic bile ducts.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Gallstones", "Primary Sclerosing Cholangitis (PSC)", "PBC", "Liver abscess"]', 1, 'Associated with IBD (especially UC) and characterized by "beaded" bile ducts.'),
    (v_case_id, 'What classic appearance is seen on liver biopsy?', '["Mallory bodies", "Onion-skin fibrosis of the bile ducts", "Granulomas", "Ground-glass hepatocytes"]', 1, 'Periductal concentric fibrosis.'),
    (v_case_id, 'PSC significantly increases the risk for which cancer?', '["Hepatocellular carcinoma", "Cholangiocarcinoma", "Pancreatic cancer", "Gallbladder cancer"]', 1, 'Cancer of the bile ducts.');

    -- CASE 11: Wilson Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Liver Disease and Neuropsychiatric Symptoms', 'A 20-year-old male presents with abnormal liver enzymes, tremors, and new-onset depression. On eye exam, there are brownish rings at the margin of the cornea.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the corneal rings?', '["Kayser-Fleischer rings", "Arcus senilis", "Roth spots", "Lisch nodules"]', 0, 'Due to copper deposition in Descemet''s membrane.'),
    (v_case_id, 'What is the underlying defect in Wilson disease?', '["Iron overload", "Impaired biliary excretion of Copper", "Vitamin A toxicity", "B12 deficiency"]', 1, 'Mutation in the ATP7B gene.'),
    (v_case_id, 'What are the characteristic lab findings?', '["High ceruloplasmin", "Low ceruloplasmin and high urinary copper", "High iron", "Low ferritin"]', 1, 'Copper cannot be loaded onto ceruloplasmin, leading to low serum levels and high tissue/urine levels.');

    -- CASE 12: Hemochromatosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Diabetes and "Bronze" Skin', 'A 55-year-old male presents with fatigue and joint pain. He is noted to have a dark, "bronze" tan. He was recently diagnosed with Type 2 Diabetes. His Ferritin is 2,000 ng/mL.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Wilson Disease", "Hereditary Hemochromatosis", "Addison''s Disease", "Porphyria"]', 1, 'The "Bronze Diabetes" triad: Skin pigmentation, Diabetes, and Cirrhosis.'),
    (v_case_id, 'What is the genetic basis for most cases?', '["ATP7B mutation", "HFE gene mutation (C282Y)", "CFTR mutation", "Lactose intolerance"]', 1, 'Leads to unregulated iron absorption from the gut.'),
    (v_case_id, 'What is the most effective long-term treatment?', '["Liver transplant", "Therapeutic Phlebotomy", "Low-iron diet only", "Chelation with Desferrioxamine"]', 1, 'Removing blood removes iron. Chelation is usually reserved for secondary iron overload (e.g., from transfusions).');

    -- CASE 13: Spontaneous Bacterial Peritonitis (SBP)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and Abdominal Pain in a Cirrhotic', 'A 60-year-old male with cirrhosis and ascites presents with a low-grade fever and diffuse abdominal tenderness. He is slightly more confused than usual.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important diagnostic step?', '["Abdominal CT", "Paracentesis and fluid analysis", "Stool culture", "EGD"]', 1, 'Analysis of the ascitic fluid is required for diagnosis.'),
    (v_case_id, 'What fluid finding confirms the diagnosis of SBP?', '["Absolute Neutrophil Count (ANC) >= 250 cells/mm3", "Presence of visible bacteria", "High protein count", "Low glucose"]', 0, 'ANC >= 250 is the diagnostic threshold.'),
    (v_case_id, 'What is the most common causative organism?', '["Staph aureus", "Escherichia coli", "Pseudomonas", "Anaerobes"]', 1, 'E. coli and Klebsiella are the most common pathogens.');

    -- CASE 14: Hepatic Encephalopathy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Confusion and "Flapping" Tremor', 'A 62-year-old male with cirrhosis presents with confusion. On exam, when he holds his arms out with his wrists extended, he has a coarse, flapping tremor (asterixis).', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary toxin responsible for this condition?', '["Bilirubin", "Ammonia", "Urea", "Creatinine"]', 1, 'Failure of the liver to convert ammonia to urea leads to neurotoxicity.'),
    (v_case_id, 'What is the first-line pharmacological treatment?', '["Antibiotics", "Lactulose", "Steroids", "Midazolam"]', 1, 'Lactulose acidifies the gut, converting NH3 to non-absorbable NH4+, and acts as an osmotic laxative.'),
    (v_case_id, 'Which non-absorbable antibiotic can be added for prevention of recurrence?', '["Penicillin", "Rifaximin", "Metronidazole", "Ciprofloxacin"]', 1, 'Rifaximin reduces ammonia-producing bacteria in the gut.');

    -- CASE 15: Diverticulitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'LLQ Pain and Fever', 'A 70-year-old male presents with 2 days of constant left lower quadrant pain and fever. He has a history of chronic constipation.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Appendicitis", "Diverticulitis", "Colon Cancer", "IBS"]', 1, 'Known as "Left-sided appendicitis."'),
    (v_case_id, 'What is the preferred diagnostic imaging modality?', '["Plain X-ray", "CT Abdomen/Pelvis with IV contrast", "Colonoscopy", "Ultrasound"]', 1, 'CT is sensitive for inflammation and complications like abscesses.'),
    (v_case_id, 'Why is colonoscopy AVOIDED during the acute phase of diverticulitis?', '["It is too expensive", "Risk of perforation of the inflamed diverticulum", "The patient is too old", "It cannot see the area"]', 1, 'Colonoscopy should be deferred for 6-8 weeks until the inflammation resolves.');

    -- CASE 16: Acute Cholecystitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'RUQ Pain and Murphy''s Sign', 'A 45-year-old obese female presents with severe right upper quadrant pain after eating a fatty meal. On exam, she stops breathing in when the doctor presses under her right ribs.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the finding "cessation of inspiration on palpation" called?', '["Rovsing sign", "Murphy''s Sign", "McBurney''s sign", "Courvoisier''s sign"]', 1, 'Highly suggestive of acute cholecystitis.'),
    (v_case_id, 'What is the best initial diagnostic test?', '["CT Abdomen", "Ultrasound (RUQ)", "HIDA Scan", "ERCP"]', 1, 'Ultrasound is fast and sensitive for stones, wall thickening, and pericholecystic fluid.'),
    (v_case_id, 'If the ultrasound is equivocal but suspicion remains high, what is the next step?', '["Repeat ultrasound", "HIDA Scan (Cholescintigraphy)", "Wait and see", "EGD"]', 1, 'Failure to visualize the gallbladder on HIDA confirms cystic duct obstruction.');

    -- CASE 17: Ascending Cholangitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever, Jaundice, and RUQ Pain', 'A 65-year-old male presents with a high fever (103\u00b0F), jaundice, and right upper quadrant pain. His BP is 90/60 mmHg and he seems confused.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the triad of Fever, Jaundice, and RUQ Pain called?', '["Beck''s Triad", "Charcot''s Triad", "Whipple''s Triad", "Cushing''s Triad"]', 1, 'Indicates acute biliary obstruction and infection.'),
    (v_case_id, 'The addition of Hypotension and Altered Mental Status (as seen in this patient) makes:', '["Charcot''s Triad", "Reynolds'' Pentad", "Murphy''s Sign", "SBP"]', 1, 'Indicates severe, life-threatening septic shock from cholangitis.'),
    (v_case_id, 'What is the most appropriate definitive management?', '["Antibiotics only", "Urgent biliary decompression (usually via ERCP)", "Wait for surgery", "Diuretics"]', 1, 'Must remove the obstruction to treat the source of infection.');

    -- CASE 18: Mallory-Weiss Tear
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hematemesis after Heavy Drinking and Vomiting', 'A 25-year-old male presents with bright red hematemesis. He spent the night "binge drinking" and had several episodes of forceful non-bloody vomiting before the blood appeared.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Esophageal Varices", "Mallory-Weiss Tear", "Boerhaave Syndrome", "Gastric Cancer"]', 1, 'A longitudinal mucosal tear at the gastroesophageal junction caused by retching.'),
    (v_case_id, 'How is this distinguished from Boerhaave Syndrome?', '["Mallory-Weiss is a partial-thickness mucosal tear; Boerhaave is a full-thickness rupture", "Mallory-Weiss is fatal", "Boerhaave causes melena", "None"]', 0, 'Boerhaave is a surgical emergency with air in the mediastinum.'),
    (v_case_id, 'What is the typical management?', '["Emergency surgery", "Supportive care (bleeding usually stops spontaneously) and PPI", "Heparin", "Antibiotics"]', 1, 'Most M-W tears heal on their own without intervention.');

    -- CASE 19: Zenker Diverticulum
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Halitosis and Regurgitation of Undigested Food', 'An 80-year-old male presents with foul-smelling breath (halitosis) and reports that he often regurgitates undigested food that he ate several hours earlier. He also has a "gurgling" sound in his neck when he swallows.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Achalasia", "Zenker Diverticulum", "Esophageal Cancer", "GERD"]', 1, 'A false diverticulum through Killian''s triangle in the posterior hypopharynx.'),
    (v_case_id, 'What is the best initial diagnostic test?', '["Endoscopy", "Barium Swallow", "CT Neck", "Manometry"]', 1, 'Endoscopy is risky as the scope can perforate the diverticulum.'),
    (v_case_id, 'What is the primary treatment?', '["Antacids", "Surgical or Endoscopic Cricopharyngeal Myotomy", "Soft food diet only", "Antibiotics"]', 1, 'Treats the underlying high-pressure zone (UES) and removes the sac.');

    -- CASE 20: Irritable Bowel Syndrome (IBS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Abdominal Pain Relieved by Defecation', 'A 28-year-old female presents with 1 year of intermittent abdominal pain associated with alternating constipation and diarrhea. She notes that the pain is relieved after she has a bowel movement. She has no weight loss or blood in her stool.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["UC", "Crohn''s", "IBS", "Celiac Disease"]', 2, 'Chronic pain + change in bowel habits + relief with defecation + NO "red flags" (blood, weight loss, age) = IBS.'),
    (v_case_id, 'What are the criteria used for diagnosing IBS?', '["Light''s Criteria", "Rome IV Criteria", "Wells Criteria", "Anthonisen Criteria"]', 1, 'Recurrent abdominal pain at least 1 day/week for 3 months.'),
    (v_case_id, 'Which of the following is a "red flag" that would REQUIRE further investigation (e.g., colonoscopy)?', '["Stress", "Onset after age 50", "Bloating", "Mucus in stool"]', 1, 'New onset in older patients must be evaluated for malignancy.');

    -- CASE 21: Chronic Mesenteric Ischemia ("Intestinal Angina")
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Weight Loss and Fear of Eating', 'A 70-year-old female smoker with severe PAD presents with a 20 lb weight loss. She says she is "afraid to eat" because she gets severe abdominal pain about 30 minutes after every meal.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["PUD", "Chronic Mesenteric Ischemia", "Gallstones", "Gastric Cancer"]', 1, 'Due to atherosclerotic narrowing of the mesenteric arteries; pain occurs when oxygen demand exceeds supply during digestion.'),
    (v_case_id, 'This condition is analogous to which other medical problem?', '["Diverticulitis", "Stable Angina", "Asthma", "Renal failure"]', 1, 'It is exertional ischemia of the bowel.'),
    (v_case_id, 'What is the best diagnostic test?', '["Endoscopy", "CT Angiography", "Ultrasound", "Plain X-ray"]', 1, 'Visualizes the narrowing in the celiac or mesenteric arteries.');

    -- CASE 22: Acute Mesenteric Ischemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Pain out of Proportion" to Exam', 'A 75-year-old male with Atrial Fibrillation presents with sudden, agonizing abdominal pain. On exam, his abdomen is soft and non-tender despite his obvious distress.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Perforated Ulcer", "Acute Mesenteric Ischemia", "Bowel Obstruction", "Kidney Stone"]', 1, 'Sudden onset pain + AFib (embolic source) + "Pain out of proportion" to physical findings = Mesenteric Ischemia.'),
    (v_case_id, 'What is the most common cause of acute mesenteric ischemia?', '["Venous thrombosis", "Arterial Embolus (usually from the heart)", "Vasospasm", "Atherosclerosis"]', 1, 'AFib is the classic risk factor for an embolus to the SMA.'),
    (v_case_id, 'If left untreated, this condition leads to:', '["Bowel necrosis and Peritonitis", "Spontaneous resolution", "Weight gain", "Liver failure"]', 0, 'A surgical emergency with very high mortality.');

    -- CASE 23: Clostridioides Difficile Infection
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Diarrhea after Antibiotics', 'A 70-year-old male presents with watery diarrhea and abdominal cramping 10 days after completing a course of Clindamycin for a skin infection.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Viral gastroenteritis", "C. difficile infection", "UC", "Lactose intolerance"]', 1, 'Antibiotic use disrupts normal flora, allowing C. diff to overgrow.'),
    (v_case_id, 'What is the current first-line treatment for an initial episode of C. diff?', '["Oral Vancomycin or Fidaxomicin", "Metronidazole", "Ciprofloxacin", "Amoxicillin"]', 0, 'Oral Vancomycin is preferred over metronidazole for better efficacy.'),
    (v_case_id, 'What classic endoscopic finding is associated with severe C. diff?', '["Skip lesions", "Pseudomembranes (yellow plaques)", "Cobblestoning", "Normal mucosa"]', 1, 'Called Pseudomembranous Colitis.');

    -- CASE 24: Small Bowel Obstruction (SBO)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Abdominal Distension and Tinkling Bowel Sounds', 'A 40-year-old female with a history of two previous C-sections presents with vomiting, abdominal distension, and failure to pass gas. On exam, she has high-pitched, "tinkling" bowel sounds.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Ileus", "Small Bowel Obstruction", "Gastroparesis", "Pancreatitis"]', 1, 'History of surgery + distension/vomiting = SBO.'),
    (v_case_id, 'What is the #1 cause of SBO in industrialized countries?', '["Hernias", "Adhesions (from previous surgery)", "Tumors", "Intussusception"]', 1, 'Fibrous bands of scar tissue form after surgery.'),
    (v_case_id, 'What is seen on a plain abdominal X-ray in SBO?', '["Dilated loops of small bowel with air-fluid levels", "Air under the diaphragm", "Normal gas pattern", "Gallstones"]', 0, 'Classic radiographic findings.');

    -- CASE 25: Hepatorenal Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Kidney Failure in a Cirrhotic', 'A patient with severe cirrhosis and ascites is hospitalized for SBP. Despite clearing the infection, his creatinine rises from 1.0 to 3.5 mg/dL. His urine sodium is < 10 mEq/L and he does not respond to a 1.5L fluid challenge.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["ATN", "Hepatorenal Syndrome (HRS)", "AIN", "Postrenal obstruction"]', 1, 'Functional kidney failure in the setting of liver failure; caused by intense renal vasoconstriction.'),
    (v_case_id, 'What is the underlying pathophysiology of HRS?', '["Direct toxin from the liver", "Splanchnic vasodilation leading to renal vasoconstriction", "Stone", "Drug reaction"]', 1, 'Portal HTN causes NO release, leading to systemic vasodilation and compensatory renal artery constriction.'),
    (v_case_id, 'What is the definitive treatment for HRS?', '["Dialysis", "Liver Transplantation", "Aggressive diuretics", "Antibiotics"]', 1, 'Only a new liver fixes the underlying problem.');

    -- CASE 26: Gastrinoma (Zollinger-Ellison Syndrome)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Refractory Peptic Ulcers and Diarrhea', 'A 45-year-old male presents with multiple stomach ulcers, including one in the distal duodenum. His symptoms do not improve with standard PPI therapy, and he also has chronic watery diarrhea.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Standard PUD", "Zollinger-Ellison Syndrome (ZES)", "Crohn''s", "Celiac Disease"]', 1, 'ZES is a gastrin-secreting tumor (gastrinoma) usually in the pancreas or duodenum.'),
    (v_case_id, 'Which lab test is used to confirm ZES?', '["Random Gastrin", "Secretin Stimulation Test", "Amylase", "tTG antibody"]', 1, 'Secretin normally inhibits gastrin, but it STIMULATES gastrin release from gastrinoma cells.'),
    (v_case_id, 'ZES is often associated with which hereditary syndrome?', '["MEN 1", "MEN 2A", "Lynch Syndrome", "FAP"]', 0, 'MEN 1 includes Pituitary, Parathyroid, and Pancreatic (including gastrinoma) tumors.');

    -- CASE 27: Lactose Intolerance
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bloating and Diarrhea after Ice Cream', 'A 22-year-old male presents with abdominal bloating, flatulence, and explosive diarrhea that occur about 1 hour after he eats dairy products.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Celiac Disease", "Lactose Intolerance", "IBD", "Food poisoning"]', 1, 'Deficiency of the lactase enzyme in the brush border.'),
    (v_case_id, 'What test is used to confirm the diagnosis?', '["Stool culture", "Hydrogen Breath Test", "Endoscopy", "Blood glucose after fasting"]', 1, 'Undigested lactose is fermented by bacteria, producing hydrogen gas.'),
    (v_case_id, 'What is the mechanism of the diarrhea?', '["Active secretion", "Osmotic diarrhea", "Inflammation", "Malabsorption of fat"]', 1, 'Undigested lactose acts as an osmotic agent, pulling water into the lumen.');

    -- CASE 28: Gastroparesis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Early Satiety in a Diabetic', 'A 60-year-old male with a 20-year history of poorly controlled Diabetes presents with nausea, vomiting of undigested food, and "feeling full" after only a few bites of a meal.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Gastric Cancer", "Diabetic Gastroparesis", "PUD", "Small bowel obstruction"]', 1, 'Autonomic neuropathy leading to delayed gastric emptying.'),
    (v_case_id, 'What is the gold standard diagnostic test?', '["Endoscopy", "Gastric Emptying Study (Scintigraphy)", "Barium Swallow", "CT scan"]', 1, 'Measures the rate at which a labeled meal leaves the stomach.'),
    (v_case_id, 'Which medication is often used to stimulate gastric motility?', '["Omeprazole", "Metoclopramide or Erythromycin", "Loperamide", "Ondansetron"]', 1, 'Prokinetic agents.');

    -- CASE 29: Gilbert Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Jaundice after Fasting or Stress', 'A 19-year-old healthy male is found to have mild scleral icterus (yellowing of the eyes) during final exams. He feels fine otherwise. His labs show an isolated Indirect (Unconjugated) Bilirubin of 2.5 mg/dL. All other liver tests are normal.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Hepatitis A", "Gilbert Syndrome", "Gallstones", "Hemolytic anemia"]', 1, 'A common, benign condition with reduced Uridine Diphosphate Glucuronosyltransferase (UGT) activity.'),
    (v_case_id, 'Which of the following is a classic trigger for jaundice in Gilbert syndrome?', '["Eating a large meal", "Fasting, Stress, or Illness", "Sleeping too much", "Vitamin C"]', 1, 'Anything that increases the bilirubin load or reduces conjugation.'),
    (v_case_id, 'What is the recommended management?', '["Liver transplant", "Reassurance (no treatment needed)", "Steroids", "Avoiding all fats"]', 1, 'Gilbert syndrome is benign and does not lead to chronic liver disease.');

    -- CASE 30: Acute Mesenteric Ischemia (Venous Thrombosis)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Subacute Abdominal Pain and Oral Contraceptives', 'A 30-year-old female on oral contraceptives presents with 3 days of progressive abdominal pain and bloating. She has no AFib. CT shows a thrombus in the Superior Mesenteric Vein.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Arterial Embolus", "Mesenteric Venous Thrombosis", "Appendicitis", "IBS"]', 1, 'Venous thrombosis is a less common cause of mesenteric ischemia, often linked to hypercoagulable states (like OCPs).'),
    (v_case_id, 'What is the most appropriate initial treatment?', '["Surgery", "Systemic Anticoagulation (Heparin)", "Aspirin", "Antibiotics"]', 1, 'Unlike arterial embolism which needs surgery, venous thrombosis often responds to anticoagulation.'),
    (v_case_id, 'What complication are you trying to prevent?', '["Liver failure", "Bowel infarction", "Diabetes", "Pneumonia"]', 1, 'Venous congestion can lead to ischemia and gangrene if the pressure is high enough.');

    RAISE NOTICE 'SUCCESS: Gastroenterology Case Blocks (1-30) registered.';
END $$;

COMMIT;
