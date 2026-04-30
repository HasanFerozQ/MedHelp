BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Hepatobiliary Surgery
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'hepatobiliary-surgery' LIMIT 1;

    -- CASE 01: Biliary Colic
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Postprandial RUQ Pain', 'A 45-year-old obese woman presents with episodic right upper quadrant pain that radiates to her right shoulder. The pain usually starts after eating a fatty meal and lasts 2-4 hours. She is currently pain-free.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute Cholecystitis", "Biliary Colic", "Hepatitis", "Peptic Ulcer Disease"]', 1, 'Episodic pain that resolves completely is characteristic of biliary colic (stones temporarily blocking the cystic duct).'),
    (v_case_id, 'What is the first-line imaging study for this patient?', '["CT Abdomen", "RUQ Ultrasound", "HIDA Scan", "ERCP"]', 1, 'Ultrasound is highly sensitive and specific for identifying gallstones.'),
    (v_case_id, 'If she elects to have surgery, what is the definitive procedure?', '["Laparoscopic Cholecystectomy", "Open Cholecystostomy", "ERCP", "Liver resection"]', 0, 'Removal of the gallbladder is the standard treatment for symptomatic gallstones.');

    -- CASE 02: Acute Cholecystitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Persistent RUQ Pain', 'A 50-year-old male presents with RUQ pain that has lasted for 12 hours. He has a fever of 101.2°F and tenderness on inspiration when the RUQ is palpated.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the physical exam finding described?', '["Rovsing''s Sign", "Murphy''s Sign", "Kehr''s Sign", "Courvoisier''s Sign"]', 1, 'Murphy''s sign is a cessation of inspiration during deep RUQ palpation due to pain from the inflamed gallbladder hitting the examiner''s hand.'),
    (v_case_id, 'What ultrasound findings support a diagnosis of acute cholecystitis?', '["Just stones", "Gallbladder wall thickening (> 4mm), pericholecystic fluid, and a sonographic Murphy''s sign", "Dilation of the common bile duct", "Liver cysts"]', 1, 'These findings indicate inflammation, not just the presence of stones.'),
    (v_case_id, 'If the ultrasound is equivocal, which nuclear medicine test is most accurate for acute cholecystitis?', '["PET scan", "HIDA Scan (Cholescintigraphy)", "Bone scan", "V/Q scan"]', 1, 'Non-visualization of the gallbladder on HIDA scan (due to cystic duct obstruction) is diagnostic.');

    -- CASE 03: Choledocholithiasis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Jaundice and Gallstones', 'A 60-year-old female with a history of gallstones presents with RUQ pain and yellowing of the eyes. Her labs show a Bilirubin of 4.5 mg/dL and an Alkaline Phosphatase of 400 U/L.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Cholecystitis", "Choledocholithiasis", "Hepatitis A", "Hemolytic anemia"]', 1, 'Choledocholithiasis is the presence of a stone in the Common Bile Duct (CBD), causing obstructive jaundice.'),
    (v_case_id, 'What is the preferred procedure to remove the stone from the common bile duct?', '["Cholecystectomy", "ERCP (Endoscopic Retrograde Cholangiopancreatography)", "HIDA scan", "CT-guided drainage"]', 1, 'ERCP allows for sphincterotomy and stone extraction from the duct.'),
    (v_case_id, 'If the CBD is dilated to 12 mm on ultrasound, what does this suggest?', '["Nothing", "Distal obstruction (likely a stone or tumor)", "Normal variation", "Liver cirrhosis"]', 1, 'The normal CBD diameter is typically < 6 mm; dilation suggests an downstream blockage.');

    -- CASE 04: Acute Cholangitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Reynolds'' Pentad', 'A patient presents with RUQ pain, fever, and jaundice. He is also hypotensive and confused.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the three components of "Charcot''s Triad"?', '["Fever, Pain, Vomiting", "RUQ Pain, Fever, Jaundice", "Hypotension, Jaundice, Confusion", "Anemia, Fever, Pain"]', 1, 'Charcot''s triad indicates acute cholangitis.'),
    (v_case_id, 'What is the name of the pentad when hypotension and altered mental status are added?', '["Beck''s Pentad", "Reynolds'' Pentad", "Cushing''s Pentad", "Whipple''s Pentad"]', 1, 'Reynolds'' Pentad indicates severe, life-threatening suppurative cholangitis.'),
    (v_case_id, 'What is the immediate priority in managing this patient?', '["Elective cholecystectomy", "Emergent biliary decompression (via ERCP or Percutaneous Drainage) and IV antibiotics", "Laxatives", "Wait for labs"]', 1, 'Cholangitis is a surgical emergency requiring immediate drainage of the infected bile.');

    -- CASE 05: Gallstone Ileus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Large Stone and the Small Bowel', 'An 80-year-old woman with a history of gallstones presents with a small bowel obstruction. CT shows air in the biliary tree (pneumobilia) and a calcified mass in the ileum.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Appendicitis", "Gallstone Ileus", "Colon cancer", "Sigmoid volvulus"]', 1, 'Gallstone ileus occurs when a large stone erodes through the gallbladder wall into the duodenum (cholecystoenteric fistula) and obstructs the bowel.'),
    (v_case_id, 'What is "Rigler''s Triad" seen on imaging?', '["Fever, Pain, Jaundice", "Small bowel obstruction, Pneumobilia, and Ectopic gallstone", "Heart failure, Edema, Ascites", "Air under the diaphragm"]', 1, 'Rigler''s triad is diagnostic of gallstone ileus.'),
    (v_case_id, 'Where is the most common site of obstruction in gallstone ileus?', '["Duodenum", "Jejunum", "Terminal Ileum", "Sigmoid colon"]', 2, 'The ileocecal valve is the narrowest part of the small bowel where the stone usually gets stuck.');

    -- CASE 06: Biliary Dyskinesia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'RUQ Pain with Normal Ultrasound', 'A 30-year-old woman has chronic RUQ pain after meals. Her ultrasound shows no stones, sludge, or wall thickening.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What test can evaluate the functional contraction of the gallbladder?', '["CT scan", "HIDA Scan with CCK (Cholecystokinin) stimulation", "ERCP", "Gastroscopy"]', 1, 'HIDA with CCK measures the Gallbladder Ejection Fraction (GBEF).'),
    (v_case_id, 'A GBEF of less than what percentage is generally considered diagnostic for biliary dyskinesia?', '["10%", "35-40%", "75%", "90%"]', 1, 'Low ejection fraction indicates a motility disorder of the gallbladder.'),
    (v_case_id, 'What is the treatment for symptomatic biliary dyskinesia?', '["Antibiotics", "Laparoscopic Cholecystectomy", "Ursodeoxycholic acid", "No treatment"]', 1, 'Removing the gallbladder often relieves the pain in these patients.');

    -- CASE 07: Mirizzi Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'External Compression', 'A patient with a large stone impacted in the cystic duct neck presents with jaundice. Imaging shows the stone is compressing the common hepatic duct from the outside.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this condition called?', '["Gallstone ileus", "Mirizzi Syndrome", "Klatskin tumor", "PBC"]', 1, 'Mirizzi syndrome is extrinsic compression of the CHD by a stone in the cystic duct or gallbladder neck.'),
    (v_case_id, 'Mirizzi syndrome increases the risk of what intra-operative complication?', '["Bile duct injury", "Bleeding", "Infection", "Hernia"]', 0, 'The inflammation can "fuse" the cystic duct and common duct, making dissection difficult and dangerous.'),
    (v_case_id, 'What is the definitive treatment?', '["ERCP only", "Cholecystectomy (often open) and potentially bile duct reconstruction", "Antibiotics", "Wait and watch"]', 1, 'Surgery is required to remove the stone and resolve the obstruction.');

    -- CASE 08: Primary Sclerosing Cholangitis (PSC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Beads on a String', 'A 35-year-old male with a history of Ulcerative Colitis presents with fatigue and itching (pruritus). MRCP shows multiple strictures and dilations of the intra- and extra-hepatic bile ducts.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["PSC", "PBC", "Hepatitis C", "Gallstones"]', 0, 'PSC is strongly associated with IBD (especially UC) and has a "beaded" appearance on imaging.'),
    (v_case_id, 'What malignancy are patients with PSC at significantly increased risk for?', '["Hepatocellular carcinoma", "Cholangiocarcinoma", "Pancreatic cancer", "Gastric cancer"]', 1, 'Chronic inflammation of the bile ducts predisposes to bile duct cancer.'),
    (v_case_id, 'What is the definitive treatment for end-stage PSC?', '["ERCP every month", "Liver Transplantation", "Total colectomy", "Steroids"]', 1, 'Transplant is the only cure for the liver disease.');

    -- CASE 09: Primary Biliary Cholangitis (PBC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Woman', 'A 45-year-old woman presents with severe itching and fatigue. Her Alkaline Phosphatase is 500 U/L. She has xanthomas on her eyelids.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which auto-antibody is highly specific for PBC?', '["ANA", "Anti-Mitochondrial Antibody (AMA)", "Anti-Smooth Muscle Antibody", "p-ANCA"]', 1, 'AMA is found in > 95% of patients with PBC.'),
    (v_case_id, 'What is the primary site of damage in PBC?', '["Large bile ducts", "Small, interlobular intra-hepatic bile ducts", "Gallbladder wall", "Liver cells (hepatocytes)"]', 1, 'PBC is an autoimmune destruction of the small bile ducts.'),
    (v_case_id, 'What medication is used to slow the progression of PBC?', '["Penicillin", "Ursodeoxycholic acid (UDCA)", "Prednisone", "Interferon"]', 1, 'UDCA helps improve bile flow and slows liver damage.');

    -- CASE 10: Pancreatic Cancer - Head
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Painless Jaundice', 'A 70-year-old male smoker presents with yellowing of the skin and dark urine. He has no pain but has lost 15 lbs. On exam, you feel a large, non-tender gallbladder in the RUQ.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for a palpable, non-tender gallbladder in a jaundiced patient?', '["Murphy''s Sign", "Courvoisier''s Sign", "Kehr''s Sign", "McBurney''s Sign"]', 1, 'Courvoisier''s sign suggests a malignant obstruction of the distal bile duct (e.g., pancreatic head cancer).'),
    (v_case_id, 'What is the standard surgical procedure for resectable cancer of the head of the pancreas?', '["Distal pancreatectomy", "Whipple Procedure (Pancreaticoduodenectomy)", "Total pancreatectomy", "Liver transplant"]', 1, 'The Whipple involves removing the pancreatic head, duodenum, gallbladder, and distal stomach/CBD.'),
    (v_case_id, 'Which tumor marker is commonly used to monitor pancreatic cancer?', '["CEA", "CA 19-9", "AFP", "PSA"]', 1, 'CA 19-9 is the most useful marker for tracking disease and response to therapy.');

    -- CASE 11: Insulinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Fainting Chef', 'A 30-year-old woman presents with episodes of confusion, sweating, and palpitations that occur when she skips meals. Her symptoms resolve immediately after drinking orange juice.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "triad" of findings described here?', '["Charcot''s Triad", "Whipple''s Triad", "Beck''s Triad", "Virchow''s Triad"]', 1, 'Whipple''s triad: symptoms of hypoglycemia, low blood sugar (< 50), and relief of symptoms with glucose.'),
    (v_case_id, 'During a 72-hour fast, what lab finding confirms an insulinoma?', '["Low insulin", "High insulin and High C-peptide", "High insulin and Low C-peptide", "High glucagon"]', 1, 'High C-peptide indicates the insulin is coming from the patient''s own pancreas (endogenous), not from an injection (exogenous).'),
    (v_case_id, 'True or False: Most insulinomas are benign and solitary.', '["True", "False"]', 0, 'True. ~90% of insulinomas are benign and can be cured with simple enucleation.');

    -- CASE 12: Gastrinoma (Zollinger-Ellison Syndrome)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Refractory Peptic Ulcers', 'A patient presents with multiple, severe ulcers in the duodenum and jejunum that have failed treatment with standard doses of PPIs. He also has chronic watery diarrhea.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Gastrinoma (ZES)", "Glucagonoma", "H. pylori", "Crohn''s"]', 0, 'Excessive gastrin secretion leads to massive acid production and ulcers.'),
    (v_case_id, 'Where is the "Gastrinoma Triangle" located?', '["The Neck", "The area between the CBD, Duodenum, and Pancreas", "The Spleen", "The Lungs"]', 1, 'Passaro''s triangle is where the majority of gastrinomas are found.'),
    (v_case_id, 'What genetic syndrome is associated with gastrinomas?', '["MEN 1", "MEN 2A", "FAP", "Lynch"]', 0, 'MEN 1 involves tumors of the Parathyroid, Pituitary, and Pancreas (3 Ps).');

    -- CASE 13: Hepatocellular Carcinoma (HCC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Liver Cancer in Cirrhosis', 'A 60-year-old male with chronic Hepatitis C and cirrhosis is found to have a 3 cm mass in his liver on a screening ultrasound.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which tumor marker is most helpful in the diagnosis of HCC?', '["CEA", "Alpha-fetoprotein (AFP)", "CA 125", "hCG"]', 1, 'AFP is a classic marker for HCC.'),
    (v_case_id, 'What is the most important risk factor for HCC worldwide?', '["Alcohol", "Chronic Hepatitis B or C infection", "Obesity", "Smoking"]', 1, 'Viral hepatitis is the leading cause globally.'),
    (v_case_id, 'In a patient with cirrhosis and a small HCC, what is the best "curative" treatment that addresses both the cancer and the underlying liver disease?', '["Chemotherapy", "Liver Transplantation", "Radiation", "Laxatives"]', 1, 'Transplant removes the tumor and the cirrhotic liver (within Milan criteria).');

    -- CASE 14: Hepatic Hemangioma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Incidental Liver Mass', 'A 40-year-old woman has an ultrasound for "bloating." It shows a 2 cm, well-defined, hyperechoic mass in the right lobe of the liver. She has no pain and normal labs.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common benign tumor of the liver?', '["Hepatic Adenoma", "Cavernous Hemangioma", "Focal Nodular Hyperplasia", "Liver cyst"]', 1, 'Hemangiomas are very common and usually found incidentally.'),
    (v_case_id, 'What is the management for a small, asymptomatic hemangioma?', '["Biopsy", "Surgical resection", "Observation (No further treatment needed)", "Chemotherapy"]', 2, 'Biopsy is contraindicated due to bleeding risk; small asymptomatic lesions are left alone.'),
    (v_case_id, 'What is the characteristic enhancement pattern of a hemangioma on triple-phase CT?', '["Rapid washout", "Peripheral nodular enhancement with gradual centripetal fill-in", "No enhancement", "Diffuse arterial enhancement"]', 1, 'The "fill-in" pattern is highly characteristic.');

    -- CASE 15: Hepatic Adenoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The OCP-Related Mass', 'A 25-year-old woman who has been on oral contraceptives (OCPs) for 10 years presents with sudden RUQ pain and hypotension. CT shows a 6 cm liver mass with evidence of hemorrhage.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Hemangioma", "Hepatic Adenoma", "HCC", "FNH"]', 1, 'Adenomas are strongly associated with estrogen/OCP use and have a risk of spontaneous rupture.'),
    (v_case_id, 'What is the management of a 6 cm hepatic adenoma?', '["Continue OCPs", "Surgical resection (due to risk of rupture and malignant transformation)", "Biopsy", "Aspiration"]', 1, 'Adenomas > 5 cm are generally resected.'),
    (v_case_id, 'Which other group of patients is at risk for hepatic adenomas besides women on OCPs?', '["Men using anabolic steroids", "Alcoholics", "Smokers", "Children"]', 0, 'Androgens also stimulate adenoma growth.');

    -- CASE 16: Focal Nodular Hyperplasia (FNH)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The "Central Scar"', 'A 30-year-old woman is found to have a liver mass. MRI shows a well-circumscribed lesion with a "stellate" central scar that enhances on late phases.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Adenoma", "Focal Nodular Hyperplasia (FNH)", "Hemangioma", "Liver abscess"]', 1, 'The central stellate scar is the classic imaging feature of FNH.'),
    (v_case_id, 'Does FNH have a risk of malignant transformation or rupture?', '["Yes, high risk", "No, it is a benign hyperplasia", "Only if > 10 cm", "Yes, but only in men"]', 1, 'FNH is benign and doesn''t require surgery unless symptomatic.'),
    (v_case_id, 'Is FNH related to OCP use?', '["Yes, definitively", "No, although it is more common in women, it is not clearly linked to OCPs", "It only happens in children", "It is caused by alcohol"]', 1, 'Unlike adenoma, FNH is not hormonally driven.');

    -- CASE 17: Liver Abscess - Pyogenic
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and RUQ Tenderness', 'A 70-year-old male with a history of recent diverticulitis presents with high fever, chills, and RUQ pain. Ultrasound shows a 5 cm fluid-filled lesion in the right lobe of the liver.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pyogenic Liver Abscess", "Amoebic Liver Abscess", "Simple cyst", "HCC"]', 0, 'Pyogenic abscesses often follow intra-abdominal infections (via the portal vein).'),
    (v_case_id, 'What is the treatment for a 5 cm pyogenic liver abscess?', '["Antibiotics alone", "Percutaneous drainage and IV antibiotics", "Surgical resection", "Wait and watch"]', 1, 'Drainage is essential for source control.'),
    (v_case_id, 'What is the most common organism found in pyogenic liver abscesses in the US?', '["Staph aureus", "E. coli and Klebsiella", "Entamoeba histolytica", "Salmonella"]', 1, 'Enteric gram-negative rods and anaerobes are the usual culprits.');

    -- CASE 18: Liver Abscess - Amoebic
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Anchovy Paste" Drainage', 'A patient who recently traveled to Mexico presents with fever and RUQ pain. Aspiration of a liver lesion reveals thick, brown fluid that looks like anchovy paste.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Pyogenic abscess", "Amoebic Liver Abscess (Entamoeba histolytica)", "Hydatid cyst", "Fungal infection"]', 1, 'The "anchovy paste" appearance is classic for amoebic abscess.'),
    (v_case_id, 'What is the primary treatment for an amoebic liver abscess?', '["Surgery", "Metronidazole", "Penicillin", "Drainage is always required"]', 1, 'Unlike pyogenic abscesses, amoebic abscesses usually respond well to Metronidazole alone and rarely need drainage.'),
    (v_case_id, 'How do you definitively diagnose the organism?', '["Stool ova and parasites", "Serum amoebic serology", "Blood culture", "CXR"]', 1, 'Serology is highly sensitive for invasive amoebiasis.');

    -- CASE 19: Hydatid Cyst (Echinococcus)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Dog and the Sheep', 'A patient from a sheep-farming region presents with an incidental liver cyst. CT shows a large cyst with several smaller "daughter cysts" inside.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Simple cyst", "Hydatid Cyst (Echinococcus granulosus)", "Amoebic abscess", "Adenoma"]', 1, 'Daughter cysts are characteristic of Echinococcus.'),
    (v_case_id, 'What is the major risk of biopsying or aspirating a suspected hydatid cyst?', '["Bleeding", "Anaphylactic shock due to leakage of cyst fluid", "Infection", "Pain"]', 1, 'The cyst fluid is highly antigenic; leakage can trigger a fatal reaction.'),
    (v_case_id, 'What is the "PAIR" technique?', '["A surgical incision", "Puncture, Aspiration, Injection (of scolicide), and Re-aspiration", "A type of suture", "A drainage bag"]', 1, 'PAIR is a minimally invasive treatment for certain hydatid cysts.');

    -- CASE 20: Portal Hypertension - Varices
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hematemesis in a Cirrhotic', 'A 50-year-old alcoholic presents with massive hematemesis. He has spider angiomas and a distended abdomen.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely source of the bleeding?', '["Peptic ulcer", "Esophageal Varices", "Mallory-Weiss tear", "Gastric cancer"]', 1, 'Variceal bleeding is the most life-threatening complication of portal hypertension.'),
    (v_case_id, 'What medication should be given immediately to reduce portal pressure?', '["Octreotide", "Aspirin", "Propranolol", "Vitamin K"]', 0, 'Octreotide (somatostatin analogue) causes splanchnic vasoconstriction, reducing blood flow to the varices.'),
    (v_case_id, 'What is the definitive endoscopic treatment for bleeding varices?', '["Sclerotherapy", "Endoscopic Variceal Banding (EVB)", "Clipping", "Cautery"]', 1, 'Banding is more effective and has fewer complications than sclerotherapy.');

    -- CASE 21: Pancreatitis - Pseudocyst
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Persistent Mass After Pancreatitis', 'Six weeks after an episode of severe acute pancreatitis, a patient has persistent dull abdominal pain and early satiety. CT shows a 10 cm fluid collection near the tail of the pancreas.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pancreatic cancer", "Pancreatic Pseudocyst", "Abscess", "Phlegmon"]', 1, 'A pseudocyst is a collection of fluid and enzymes surrounded by a wall of fibrous tissue (not epithelium).'),
    (v_case_id, 'Why must you wait at least 6 weeks before attempting to drain a pseudocyst?', '["To let the patient rest", "To allow the cyst wall to "mature" and become strong enough to hold sutures", "To wait for it to disappear", "To finish the antibiotics"]', 1, 'Internal drainage (cystogastrostomy) requires a mature wall.'),
    (v_case_id, 'What is the management for a small (< 6 cm), asymptomatic pseudocyst?', '["Immediate surgery", "Observation (many resolve spontaneously)", "Percutaneous drainage", "ERCP"]', 1, 'Small asymptomatic cysts often resolve on their own.');

    -- CASE 22: Gallstone Pancreatitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Double Trouble', 'A patient presents with epigastric pain radiating to the back and a high Lipase (3000 U/L). Ultrasound shows gallstones and a dilated CBD.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Alcoholic pancreatitis", "Gallstone Pancreatitis", "Cholecystitis", "SBO"]', 1, 'A stone blocking the pancreatic duct (at the Ampulla of Vater) triggers pancreatitis.'),
    (v_case_id, 'When should the cholecystectomy be performed in a patient with MILD gallstone pancreatitis?', '["Wait 6 weeks", "During the same hospital admission, once the pancreatitis has settled", "Never", "Immediately in the ER"]', 1, 'Performing the cholecystectomy before discharge prevents recurrent attacks.'),
    (v_case_id, 'If the patient also has ascending cholangitis (Fever/Jaundice), what is the priority?', '["Surgery", "Urgent ERCP for biliary decompression", "CT scan", "Antibiotics only"]', 1, 'Cholangitis is the immediate threat and needs decompression.');

    -- CASE 23: Chronic Pancreatitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Steatorrhea and Calcifications', 'A 50-year-old chronic alcoholic has recurrent mid-epigastric pain, foul-smelling oily stools, and new-onset diabetes. A plain abdominal X-ray shows calcifications across the upper abdomen.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Acute Pancreatitis", "Chronic Pancreatitis", "Pancreatic Cancer", "Celiac Disease"]', 1, 'The triad of calcifications, steatorrhea, and diabetes is classic for end-stage chronic pancreatitis.'),
    (v_case_id, 'What is the treatment for the "steatorrhea" (malabsorption)?', '["Low fat diet", "Pancreatic Enzyme Replacement Therapy (PERT)", "Antibiotics", "Insulin"]', 1, 'Replacing the lost lipases and proteases allows for proper digestion.'),
    (v_case_id, 'What is the "Puestow Procedure" (Lateral Pancreaticojejunostomy) used for?', '["To treat diabetes", "To relieve pain in chronic pancreatitis by draining a dilated main pancreatic duct", "To remove the pancreas", "To fix the gallbladder"]', 1, 'It provides drainage for "chain of lakes" ductal dilation.');

    -- CASE 24: Porcelain Gallbladder
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Crunchy Gallbladder', 'An incidental X-ray of the abdomen shows a dense ring of calcification in the right upper quadrant, perfectly outlining the gallbladder.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this finding called?', '["Gallstones", "Porcelain Gallbladder", "Liver cyst", "Kidney stone"]', 1, 'Extensive calcification of the gallbladder wall.'),
    (v_case_id, 'Why is a porcelain gallbladder clinically significant?', '["It is very painful", "It is associated with a high risk of Gallbladder Carcinoma (up to 20-30%)", "It prevents digestion", "It causes jaundice"]', 1, 'Because of the cancer risk, prophylactic cholecystectomy is usually recommended.'),
    (v_case_id, 'What is the most common histological type of gallbladder cancer?', '["Squamous cell", "Adenocarcinoma", "Sarcoma", "Lymphoma"]', 1, 'Adenocarcinoma is the most common type.');

    -- CASE 25: Budd-Chiari Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Post-Hepatic Obstruction', 'A patient with a known hypercoagulable state presents with sudden-onset RUQ pain, massive ascites, and hepatomegaly.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Cirrhosis", "Budd-Chiari Syndrome", "Portal vein thrombosis", "Hepatitis"]', 1, 'Budd-Chiari is the obstruction of the hepatic venous outflow (hepatic veins or IVC).'),
    (v_case_id, 'What is the classic "nutmeg liver" appearance?', '["Infection", "Chronic passive congestion of the liver due to venous outflow obstruction", "Fatty liver", "Cancer"]', 1, 'Congestion leads to a mottled appearance on histology/imaging.'),
    (v_case_id, 'What is a common cause of Budd-Chiari in younger patients?', '["Alcohol", "Polycythemia vera or other myeloproliferative disorders", "Gallstones", "Diabetes"]', 1, 'Hypercoagulable states are the primary triggers.');

    -- CASE 26: Pancreatic Cystic Neoplasms
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The "Mother-Daughter-Grandmother" Rule', 'Three patients have pancreatic cysts. Patient A has a "honeycomb" serous cyst. Patient B has a large mucinous cyst in the tail (female). Patient C has a cyst communicating with the main duct.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of these cysts has essentially ZERO malignant potential?', '["Serous Cystadenoma (Honeycomb)", "Mucinous Cystadenoma", "IPMN", "Pseudocyst"]', 0, 'Serous cysts are almost always benign.'),
    (v_case_id, 'Which cyst is most common in middle-aged women ("Mother") and has significant malignant potential?', '["Serous", "Mucinous Cystadenoma (MCN)", "IPMN", "Solid pseudopapillary"]', 1, 'MCNs are found in women and should generally be resected.'),
    (v_case_id, 'What does "IPMN" stand for?', '["Intraductal Papillary Mucinous Neoplasm", "Internal Pancreatic Mass Node", "Inflammatory Pancreatic Mass", "Infected Pancreatic Node"]', 0, 'IPMNs are cysts that arise from the pancreatic ducts and can progress to cancer.');

    -- CASE 27: Splenectomy for Hematologic Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Spleen and the Platelets', 'A 30-year-old woman with ITP (Immune Thrombocytopenic Purpura) has failed steroids and IVIG. Her platelet count is 20,000.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the role of the spleen in ITP?', '["It makes the antibodies", "It is the site where antibody-coated platelets are destroyed by macrophages", "It produces more platelets", "It has no role"]', 1, 'Removal of the "killing ground" (the spleen) leads to a rise in platelets in 70-80% of cases.'),
    (v_case_id, 'What is an "accessory spleen" (splenule)?', '["A tumor", "A small node of splenic tissue found outside the main spleen (found in 10-15% of people)", "A lymph node", "A part of the liver"]', 1, 'If an accessory spleen is missed during surgery for ITP, the disease may recur.'),
    (v_case_id, 'True or False: Hereditary Spherocytosis is cured by splenectomy.', '["True", "False"]', 0, 'True. While the RBC defect remains, the spleen can no longer destroy the spherical cells, curing the anemia.');

    -- CASE 28: Whipple Procedure Complications
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Post-Whipple Drain', 'Five days after a Whipple procedure, the drainage from the surgical drain is noted to be "milky" or "clear" and has an Amylase level of 5000 U/L.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Infection", "Post-operative Pancreatic Fistula (POPF)", "Bile leak", "Normal drainage"]', 1, 'A leak from the pancreatico-jejunostomy (the "Achilles heel" of the Whipple) is a major complication.'),
    (v_case_id, 'What is the standard treatment for a low-output, stable pancreatic fistula?', '["Return to the OR", "Supportive care, skin protection, and octreotide to reduce secretions", "Immediate total pancreatectomy", "Antibiotics only"]', 1, 'Most fistulas heal with conservative management and drainage.'),
    (v_case_id, 'Which major artery is at risk of "blowout" if a pancreatic leak leads to an abscess/erosion nearby?', '["Aorta", "Gastroduodenal Artery (GDA) stump", "Renal artery", "Iliac artery"]', 1, 'Hemorrhage from the GDA stump is a lethal complication of a pancreatic leak.');

    -- CASE 29: Portal Hypertension - TIPS
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Last Resort for Ascites', 'A cirrhotic patient has refractory ascites and recurrent variceal bleeds despite medical therapy. You discuss a TIPS procedure.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does "TIPS" stand for?', '["Total Internal Portal Shunt", "Transjugular Intrahepatic Portosystemic Shunt", "Temporary Intrahepatic Portal Stent", "Transarterial Portal Shunt"]', 1, 'TIPS creates a low-pressure channel between the portal vein and hepatic vein.'),
    (v_case_id, 'What is a major complication of the TIPS procedure?', '["Kidney failure", "Hepatic Encephalopathy", "Hypertension", "Gallstones"]', 1, 'By bypassing the liver, ammonia and other toxins reach the brain directly, worsening encephalopathy.'),
    (v_case_id, 'What is the primary contraindication for TIPS?', '["Ascites", "Severe Right Heart Failure or Pulmonary Hypertension", "Varices", "Age"]', 1, 'The sudden increase in venous return can cause the right heart to fail.');

    -- CASE 30: Bile Duct Injury
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Post-Cholecystectomy Jaundice', 'A patient undergoes a difficult laparoscopic cholecystectomy. Three days later, they have abdominal pain, jaundice, and high Bilirubin.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most feared technical complication of a cholecystectomy?', '["Bleeding", "Common Bile Duct (CBD) injury or transection", "Incisional hernia", "Wound infection"]', 1, 'CBD injury is a catastrophic complication requiring complex reconstruction.'),
    (v_case_id, 'What imaging test is first-line to evaluate for a bile leak or ductal obstruction?', '["MRI", "Ultrasound or CT", "HIDA Scan", "ERCP"]', 1, 'US/CT can show fluid collections (bilomas) or dilated ducts.'),
    (v_case_id, 'What is the definitive repair for a major CBD transection?', '["Primary repair over a T-tube", "Roux-en-Y Hepaticojejunostomy", "End-to-end anastomosis", "Simple drainage"]', 1, 'A hepaticojejunostomy (connecting the liver duct directly to the small bowel) is the standard repair.');

    RAISE NOTICE 'SUCCESS: Hepatobiliary Surgery Case Blocks (1-30) registered.';
END $$;

COMMIT;
