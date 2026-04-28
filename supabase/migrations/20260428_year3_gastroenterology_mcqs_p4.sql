-- Migration: Year 3 - Gastroenterology MCQ Bank (PART 4: 241-320)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-28

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'gastroenterology' LIMIT 1;

    -- SECTION 25: GALLSTONES (CHOLELITHIASIS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '241: What is the most common type of gallstone in Western countries?', '["Pigment stones", "Cholesterol stones", "Calcium carbonate", "Uric acid"]', 1, 'Supersaturation of bile with cholesterol. (Harrison''s Ch. 339)'),
    (v_topic_id, '242: Which of the following is a classic risk factor for gallstones (The 4 F''s)?', '["Fat, Female, Forty, Fertile", "Thin, Male, Teenager, Fasting", "Active, Vegetarian, Young, Male", "None"]', 0, 'Reflects hormonal and metabolic risks. (Step-Up)'),
    (v_topic_id, '243: "Biliary colic" is typically caused by a stone obstructing the:', '["Cystic duct", "Common bile duct", "Stomach", "Pancreas"]', 0, 'Pain is usually constant, not truly "colicky." (Harrison''s Ch. 339)'),
    (v_topic_id, '244: What is the imaging test of choice for suspected gallstones?', '["CT scan", "Transabdominal Ultrasound", "Chest X-ray", "MRI"]', 1, 'Highly sensitive and specific for stones and wall thickening. (Step-Up)'),
    (v_topic_id, '245: "Black pigment stones" are associated with:', '["Infection", "Chronic Hemolysis (e.g., Sickle cell)", "Obesity", "Diabetes"]', 1, 'Due to high bilirubin load. (Pocket Medicine)'),
    (v_topic_id, '246: "Brown pigment stones" are usually associated with:', '["Hemolysis", "Biliary tract infection or parasites", "High fat diet", "Age"]', 1, 'Common in East Asia. (Harrison''s Ch. 339)'),
    (v_topic_id, '247: "Porcelain Gallbladder" refers to calcification of the wall and is associated with:', '["Gallbladder Cancer", "Diabetes", "Heart failure", "Asthma"]', 0, 'Indication for prophylactic cholecystectomy. (Step-Up)'),
    (v_topic_id, '248: Asymptomatic gallstones generally require:', '["Urgent surgery", "Observation only", "Bile acid pills", "Lithotripsy"]', 1, 'Only about 1-2% become symptomatic per year. (Pocket Medicine)'),
    (v_topic_id, '249: "Gallstone ileus" is caused by a large stone eroding into the bowel and obstructing the:', '["Duodenum", "Terminal Ileum (at the Ileocecal valve)", "Sigmoid colon", "Stomach"]', 1, 'Presents with small bowel obstruction and "rigler''s triad." (Step-Up)'),
    (v_topic_id, '250: "Rigler''s Triad" for gallstone ileus includes SBO, a gallstone in the bowel, and:', '["Fever", "Pneumobilia (air in the biliary tree)", "Ascites", "Jaundice"]', 1, 'Air enters from the gut via a cholecystoenteric fistula. (Pocket Medicine)');

    -- SECTION 26: CHOLECYSTITIS & CHOLANGITIS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '251: Acute Cholecystitis is most commonly caused by:', '["Infection", "Persistent cystic duct obstruction by a gallstone", "Alcohol", "Tumor"]', 1, 'Leads to inflammation and secondary infection. (Harrison''s Ch. 339)'),
    (v_topic_id, '252: "Murphy''s sign" is positive in acute cholecystitis when:', '["Pain occurs with internal rotation", "Inspiration is arrested during palpation of the RUQ", "There is rebound tenderness in LLQ", "None"]', 1, 'A highly specific clinical sign. (Step-Up)'),
    (v_topic_id, '253: If ultrasound is equivocal for cholecystitis, what is the next best test?', '["CT scan", "HIDA Scan (Cholescintigraphy)", "ERCP", "Liver biopsy"]', 1, 'Non-visualization of the gallbladder confirms cystic duct obstruction. (Pocket Medicine)'),
    (v_topic_id, '254: "Acalculous Cholecystitis" is typically seen in:', '["Healthy adults", "Severely ill/critically ill patients (trauma, burns, sepsis)", "Children", "Pregnant women"]', 1, 'High mortality rate; requires urgent drainage. (Harrison''s Ch. 339)'),
    (v_topic_id, '255: "Charcot''s Triad" for acute cholangitis includes RUQ pain, jaundice, and:', '["Vomiting", "Fever", "Hypotension", "Confusion"]', 1, 'Due to infection in an obstructed biliary tree. (Step-Up)'),
    (v_topic_id, '256: "Reynold''s Pentad" adds which two features to Charcot''s Triad?', '["Nausea and Diarrhea", "Hypotension and Altered Mental Status", "Cough and Rash", "None"]', 1, 'Indicates severe, life-threatening suppurative cholangitis. (Pocket Medicine)'),
    (v_topic_id, '257: What is the immediate treatment for acute ascending cholangitis?', '["Observation", "Antibiotics + Biliary decompression (e.g., ERCP)", "Surgery", "Steroids"]', 1, 'The obstruction must be relieved urgently. (Harrison''s Ch. 339)'),
    (v_topic_id, '258: "Mirizzi Syndrome" is extrinsic compression of the common hepatic duct by a stone in the:', '["Gallbladder or Cystic duct", "Duodenum", "Pancreas", "Liver"]', 0, 'Causes jaundice without a stone in the CBD itself. (Pocket Medicine)'),
    (v_topic_id, '259: Emphysematous cholecystitis (gas in the wall) is most common in which group?', '["Young females", "Elderly diabetics", "Smokers", "Athletes"]', 1, 'A surgical emergency due to high risk of gangrene/perforation. (Step-Up)'),
    (v_topic_id, '260: What is the definitive treatment for acute cholecystitis?', '["Antibiotics alone", "Cholecystectomy (usually within 72 hours)", "Wait for 6 weeks", "ERCP"]', 1, 'Surgical removal of the gallbladder. (Pocket Medicine)');

    -- SECTION 27: BILE DUCT & PANCREAS BASICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '261: "Choledocholithiasis" refers to a stone in the:', '["Gallbladder", "Common Bile Duct", "Hepatic duct", "Pylorus"]', 1, 'Causes obstructive jaundice and can lead to pancreatitis. (Harrison''s Ch. 339)'),
    (v_topic_id, '262: "Courvoisier''s Law" states that a palpable, painless gallbladder in a jaundiced patient suggests:', '["Gallstones", "Malignancy (e.g., Pancreatic cancer)", "Hep A", "Cirrhosis"]', 1, 'Stones cause scarring, making the gallbladder small and non-distensible. (Step-Up)'),
    (v_topic_id, '263: The exocrine pancreas primarily secretes bicarbonate and:', '["Insulin", "Digestive enzymes (Trypsin, Lipase, Amylase)", "Glucagon", "Somatostatin"]', 1, 'Aids in digestion of fats, proteins, and carbs. (Harrison''s Ch. 340)'),
    (v_topic_id, '264: "Trypsinogen" is converted to active Trypsin in the duodenum by:', '["Pepsin", "Enterokinase", "Bile", "Acid"]', 1, 'Prevents premature activation within the pancreas (autodigestion). (Step-Up)'),
    (v_topic_id, '265: "Pancreas Divisum" is a common congenital anomaly where the two ducts:', '["Fuse too early", "Fail to fuse", "Are missing", "Cross each other"]', 1, 'Usually asymptomatic but can predispose to pancreatitis. (Pocket Medicine)'),
    (v_topic_id, '266: "Annular Pancreas" can cause obstruction of the:', '["Esophagus", "Duodenum", "Colon", "Bile duct"]', 1, 'The pancreas encircles the second part of the duodenum. (Step-Up)'),
    (v_topic_id, '267: Which test is more specific for the diagnosis of acute pancreatitis?', '["Amylase", "Lipase", "Bilirubin", "ALT"]', 1, 'Lipase stays elevated longer and is more specific to the pancreas. (Harrison''s Ch. 341)'),
    (v_topic_id, '268: "Sentinel loop" (dilated jejunum) on abdominal X-ray suggests:', '["Bowel obstruction", "Local inflammation from Acute Pancreatitis", "Pneumonia", "IBS"]', 1, 'Reflects localized ileus. (Pocket Medicine)'),
    (v_topic_id, '269: "Colon cut-off sign" on X-ray is associated with:', '["Cancer", "Acute Pancreatitis", "Volvulus", "Diverticulitis"]', 1, 'Abrupt termination of gas in the transverse colon. (Step-Up)'),
    (v_topic_id, '270: "Cullen sign" (periumbilical ecchymosis) suggests:', '["Appendicitis", "Retroperitoneal hemorrhage (e.g., Hemorrhagic Pancreatitis)", "Liver failure", "Ulcer"]', 1, 'Sign of severe, necrotizing pancreatitis. (Harrison''s Ch. 341)');

    -- SECTION 28: ACUTE PANCREATITIS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '271: What are the two most common causes of Acute Pancreatitis?', '["Smoking and Obesity", "Gallstones and Alcohol", "Drugs and Trauma", "Infection and Cancer"]', 1, 'Account for 80% of cases in the US. (Harrison''s Ch. 341)'),
    (v_topic_id, '272: "Grey Turner sign" refers to ecchymosis in the:', '["Umbilicus", "Flanks", "Groin", "Chest"]', 1, 'Another sign of retroperitoneal bleeding. (Step-Up)'),
    (v_topic_id, '273: "Ranson Criteria" are used to assess ____ in acute pancreatitis.', '["Diagnosis", "Severity and Prognosis", "Type of stone", "Drug levels"]', 1, 'Measured at admission and at 48 hours. (Pocket Medicine)'),
    (v_topic_id, '274: What is the single most important initial treatment for acute pancreatitis?', '["Antibiotics", "Aggressive fluid resuscitation", "Immediate surgery", "NPO only"]', 1, 'Prevents organ failure and necrosis. (Harrison''s Ch. 341)'),
    (v_topic_id, '275: "Pancreatic pseudocyst" is a complication that typically occurs how long after an acute episode?', '["1 day", "4-6 weeks", "1 year", "Immediately"]', 1, 'Fluid collection lacking an epithelial lining. (Step-Up)'),
    (v_topic_id, '276: Prophylactic antibiotics in sterile necrotizing pancreatitis are:', '["Always indicated", "Generally NOT recommended", "Used only in smokers", "Necessary for 1 week"]', 1, 'They do not prevent infected necrosis or improve mortality. (Pocket Medicine)'),
    (v_topic_id, '277: "Hypertriglyceridemia" can cause pancreatitis when levels exceed:', '["200 mg/dL", "500 mg/dL", "1000 mg/dL", "150 mg/dL"]', 2, 'A common non-gallstone, non-alcohol cause. (Harrison''s Ch. 341)'),
    (v_topic_id, '278: Acute pancreatitis pain characteristically radiates to the:', '["Groin", "Back", "Right shoulder", "LLQ"]', 1, 'Usually epigastric pain that is "boring" through to the back. (Step-Up)'),
    (v_topic_id, '279: "Hypocalcemia" in acute pancreatitis is a poor prognostic sign due to:', '["Calcium being lost in urine", "Saponification (calcium binding to fat in necrosis)", "Malabsorption", "None"]', 1, 'Reflects the extent of tissue damage. (Pocket Medicine)'),
    (v_topic_id, '280: The "BISAP" score is a simplified tool to predict ____ in pancreatitis.', '["Cost", "Mortality", "Diagnosis", "Recovery time"]', 1, 'BUN, Impaired mental status, SIRS, Age, Pleural effusion. (Harrison''s Ch. 341)');

    -- SECTION 29: CHRONIC PANCREATITIS & INSUFFICIENCY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '281: What is the leading cause of Chronic Pancreatitis in adults?', '["Gallstones", "Alcohol abuse", "Smoking", "Autoimmunity"]', 1, 'Leads to irreversible fibrosis and calcification. (Harrison''s Ch. 341)'),
    (v_topic_id, '282: "TIGAR-O" is a mnemonic for the risk factors of:', '["Liver cancer", "Chronic Pancreatitis", "PUD", "GERD"]', 1, 'Toxic-metabolic, Idiopathic, Genetic, Autoimmune, Recurrent/Severe, Obstructive. (Pocket Medicine)'),
    (v_topic_id, '283: The classic triad of chronic pancreatitis includes calcifications, steatorrhea, and:', '["Jaundice", "Diabetes Mellitus", "Weight gain", "Fever"]', 1, 'Reflects loss of both exocrine and endocrine function. (Step-Up)'),
    (v_topic_id, '284: "Chain of lakes" appearance on imaging describes:', '["Biliary tree", "Dilated and irregular pancreatic duct in chronic pancreatitis", "Small bowel", "Aorta"]', 1, 'Visible on MRCP/ERCP. (Harrison''s Ch. 341)'),
    (v_topic_id, '285: What is the treatment for pancreatic exocrine insufficiency?', '["Insulin", "Pancreatic Enzyme Replacement Therapy (PERT)", "Antibiotics", "Low fat diet alone"]', 1, 'Enzymes must be taken with every meal. (Step-Up)'),
    (v_topic_id, '286: "Fecal Elastase-1" test is used to diagnose:', '["Infection", "Pancreatic Exocrine Insufficiency", "Colon cancer", "Gallstones"]', 1, 'Non-invasive marker of pancreatic function. (Pocket Medicine)'),
    (v_topic_id, '287: Autoimmune Pancreatitis (Type 1) is often part of which systemic disease?', '["SLE", "IgG4-Related Disease", "Sjogren''s", "Sarcoidosis"]', 1, 'Responds dramatically to steroids. (Harrison''s Ch. 341)'),
    (v_topic_id, '288: Smoking is a major risk factor for both chronic pancreatitis and:', '["Gastritis", "Pancreatic Cancer", "IBD", "Celiac"]', 1, 'Significantly accelerates the disease course. (Step-Up)'),
    (v_topic_id, '289: Chronic pancreatitis pain is often worsened by:', '["Lying flat", "Eating", "Standing", "Sleeping"]', 1, 'Due to stimulation of pancreatic secretion. (Pocket Medicine)'),
    (v_topic_id, '290: Tropical Pancreatitis is associated with the consumption of:', '["Alcohol", "Cassava", "Red meat", "Spices"]', 1, 'Common in parts of Asia and Africa. (Harrison''s Ch. 341)');

    -- SECTION 30: PANCREATIC & BILIARY TUMORS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '291: What is the most common histological type of Pancreatic Cancer?', '["Islet cell tumor", "Ductal Adenocarcinoma", "Cystadenoma", "Lymphoma"]', 1, 'Usually located in the head of the pancreas (60-70%). (Harrison''s Ch. 83)'),
    (v_topic_id, '292: "Trousseau syndrome" (migratory thrombophlebitis) is a paraneoplastic sign of:', '["Lung cancer", "Pancreatic Cancer", "Liver cancer", "Gastric cancer"]', 1, 'Hypercoagulable state associated with adenocarcinoma. (Step-Up)'),
    (v_topic_id, '293: Which tumor marker is used to MONITOR pancreatic cancer?', '["CEA", "CA 19-9", "AFP", "CA 125"]', 1, 'Helpful for tracking response to therapy. (Pocket Medicine)'),
    (v_topic_id, '294: The surgical procedure of choice for cancer in the HEAD of the pancreas is:', '["Whipple Procedure (Pancreaticoduodenectomy)", "Distal Pancreatectomy", "Gastrectomy", "Cholecystectomy"]', 0, 'Complex surgery involving resection of head, duodenum, and part of the bile duct. (Step-Up)'),
    (v_topic_id, '295: "Double duct sign" on ERCP (dilatation of both CBD and pancreatic duct) suggests:', '["Gallstones", "Cancer in the head of the pancreas or ampulla", "Alcoholism", "Normal variant"]', 1, 'Indicates an obstructive lesion at the junction. (Harrison''s Ch. 83)'),
    (v_topic_id, '296: "Glucagonoma" classically presents with a specific skin rash called:', '["Hives", "Necrolytic Migratory Erythema", "Eczema", "Psoriasis"]', 1, 'Also causes diabetes, weight loss, and anemia. (Pocket Medicine)'),
    (v_topic_id, '297: "Insulinoma" is characterized by "Whipple''s Triad," which includes hypoglycemia, symptoms, and:', '["Weight gain", "Relief of symptoms upon administration of glucose", "Fever", "Pain"]', 1, 'Usually a benign islet cell tumor. (Harrison''s Ch. 341)'),
    (v_topic_id, '298: "Cholangiocarcinoma" (Bile duct cancer) is most strongly associated with:', '["Alcohol", "Primary Sclerosing Cholangitis (PSC)", "Smoking", "Obesity"]', 1, 'Requires high suspicion in PSC patients with worsening jaundice. (Step-Up)'),
    (v_topic_id, '299: "Klatskin tumors" are cholangiocarcinomas located at the:', '["Distal CBD", "Bifurcation of the right and left hepatic ducts", "Gallbladder", "Pancreas"]', 1, 'Difficult to resect surgically. (Pocket Medicine)'),
    (v_topic_id, '300: Gallbladder cancer is most often found incidentally after:', '["A meal", "Cholecystectomy for stones", "Colonoscopy", "X-ray"]', 1, 'Usually diagnosed in an advanced stage. (Harrison''s Ch. 339)');

    -- FINAL MISC (301-320)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '301: What is the most common cause of acute LIVER failure in the US?', '["Hepatitis A", "Acetaminophen overdose", "Alcohol", "Gallstones"]', 1, 'Requires rapid evaluation for transplant. (Harrison''s Ch. 333)'),
    (v_topic_id, '302: "Hampton Hump" on X-ray is to PE as "Rigler''s Triad" is to:', '["Pancreatitis", "Gallstone ileus", "Ulcer", "Cancer"]', 1, 'Classic radiographic associations. (Step-Up)'),
    (v_topic_id, '303: Which part of the colon is most susceptible to "Ischemic Colitis"?', '["Cecum", "Splenic Flexure (Watershed area)", "Rectum", "Ascending colon"]', 1, 'Griffith''s point. (Pocket Medicine)'),
    (v_topic_id, '304: A patient with cirrhosis develops "sudden worsening" of ascites and jaundice. What is the priority?', '["Increase diuretics", "Diagnostic paracentesis to rule out SBP", "Give Vitamin K", "Wait"]', 1, 'Must exclude infection. (Harrison''s Ch. 335)'),
    (v_topic_id, '305: "Sister Mary Joseph Node" is found in the umbilicus, while "Irish Node" is in the:', '["Axilla", "Left supraclavicular", "Neck", "Groin"]', 0, 'Metastatic signs of gastric CA. (Step-Up)'),
    (v_topic_id, '306: Which drug can cause "Drug-induced SLE" and liver injury?', '["Isoniazid", "Hydralazine", "Procainamide", "All of the above"]', 3, 'Lupus-like syndrome. (Pocket Medicine)'),
    (v_topic_id, '307: "Porcelain gallbladder" increases the risk of:', '["Stones", "Adenocarcinoma of the gallbladder", "Pancreatitis", "Ulcers"]', 1, 'Wall calcification. (Harrison''s Ch. 339)'),
    (v_topic_id, '308: What is the best initial test for a jaundiced patient?', '["CT scan", "Abdominal Ultrasound", "ERCP", "Liver biopsy"]', 1, 'Differentiates obstructive from hepatocellular jaundice. (Step-Up)'),
    (v_topic_id, '309: "Acanthosis nigricans" (dark skin in folds) can be a paraneoplastic sign of:', '["Lung cancer", "Gastric Adenocarcinoma", "Breast cancer", "None"]', 1, 'Usually associated with insulin resistance, but can be malignant. (Pocket Medicine)'),
    (v_topic_id, '310: Which IBD is more likely to cause "primary sclerosing cholangitis"?', '["Crohn''s", "Ulcerative Colitis", "Both", "None"]', 1, 'Classic association. (Harrison''s Ch. 324)'),
    (v_topic_id, '311: "Whipple Triad" is associated with:', '["Cancer", "Insulinoma", "Ulcer", "Pancreatitis"]', 1, 'Diagnostic for insulinoma. (Step-Up)'),
    (v_topic_id, '312: Which electrolyte abnormality is a poor prognostic sign in pancreatitis?', '["High sodium", "Hypocalcemia", "High potassium", "Low chloride"]', 1, 'Saponification in necrosis. (Pocket Medicine)'),
    (v_topic_id, '313: "Spider angiomata" are due to excess ____ in liver failure.', '["Estrogen", "Testosterone", "Insulin", "Glucagon"]', 0, 'Impaired estrogen metabolism by the liver. (Harrison''s Ch. 335)'),
    (v_topic_id, '314: "Krukenberg tumor" is a gastric cancer metastatic to the:', '["Liver", "Ovaries", "Lungs", "Brain"]', 1, 'Signet ring cells. (Step-Up)'),
    (v_topic_id, '315: Which antibiotic is notorious for causing C. difficile infection?', '["Penicillin", "Clindamycin", "Azithromycin", "Doxycycline"]', 1, 'Though any antibiotic can cause it. (Pocket Medicine)'),
    (v_topic_id, '316: "Sentinel loop" on X-ray indicates:', '["Obstruction", "Localized ileus (e.g., from pancreatitis)", "Perforation", "Cancer"]', 1, 'Inflammation-induced focal bowel paralysis. (Step-Up)'),
    (v_topic_id, '317: "Bilirubinuria" (bilirubin in urine) only occurs with:', '["Unconjugated bilirubin", "Conjugated bilirubin", "Both", "None"]', 1, 'Only conjugated is water-soluble. (Harrison''s Ch. 330)'),
    (v_topic_id, '318: "HBsAg" for > 6 months defines:', '["Acute Hep B", "Chronic Hep B", "Resolved Hep B", "Vaccinated state"]', 1, 'Surface antigen persistence. (Step-Up)'),
    (v_topic_id, '319: What is the most common symptom of a Mallory-Weiss tear?', '["Chest pain", "Hematemesis after retching", "Diarrhea", "Jaundice"]', 1, 'Vomiting blood. (Pocket Medicine)'),
    (v_topic_id, '320: The "Signet ring" cell is the histological hallmark of:', '["Hepatoma", "Diffuse-type Gastric Adenocarcinoma", "Pancreatic cancer", "Cholangiocarcinoma"]', 1, 'Nucleus pushed to the side by a large mucin vacuole. (Harrison''s Ch. 83)');

    RAISE NOTICE 'SUCCESS: Gastroenterology MCQ Part 4 (241-320) registered.';
END $$;

COMMIT;
