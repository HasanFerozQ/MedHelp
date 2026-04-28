-- Migration: Year 3 - Gastroenterology MCQ Bank (PART 3: 161-240)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-28

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'gastroenterology' LIMIT 1;

    -- SECTION 17: LIVER BASICS & JAUNDICE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '161: Jaundice becomes clinically visible when total bilirubin exceeds:', '["1.0 mg/dL", "2.0-3.0 mg/dL", "5.0 mg/dL", "10.0 mg/dL"]', 1, 'First noticed in the sclera (scleral icterus). (Harrison''s Ch. 330)'),
    (v_topic_id, '162: "Unconjugated (Indirect) Hyperbilirubinemia" is most often due to:', '["Biliary obstruction", "Hemolysis or Gilbert Syndrome", "Cirrhosis", "Pancreatitis"]', 1, 'Reflects overproduction or impaired conjugation. (Step-Up)'),
    (v_topic_id, '163: "Conjugated (Direct) Hyperbilirubinemia" with dark urine is a sign of:', '["Hemolysis", "Hepatobiliary disease or obstruction", "Gilbert Syndrome", "Crigler-Najjar"]', 1, 'Direct bilirubin is water-soluble and can be excreted in urine. (Pocket Medicine)'),
    (v_topic_id, '164: "Gilbert Syndrome" is a benign condition caused by a mild deficiency of:', '["AST", "UGT1A1 (Glucuronosyltransferase)", "Albumin", "Lipase"]', 1, 'Leads to mild unconjugated jaundice, often triggered by stress or fasting. (Harrison''s Ch. 330)'),
    (v_topic_id, '165: Which of the following is a "functional" marker of liver synthetic capacity?', '["ALT", "INR (Prothrombin Time) and Albumin", "AST", "Bilirubin alone"]', 1, 'ALT/AST are markers of injury, not function. (Step-Up)'),
    (v_topic_id, '166: A "disproportionate elevation of Alkaline Phosphatase (ALP)" suggests:', '["Acute viral hepatitis", "Cholestasis or Biliary obstruction", "Muscle injury", "Alcoholic liver disease"]', 1, 'ALP is found in the lining of bile ducts. (Pocket Medicine)'),
    (v_topic_id, '167: An "AST to ALT ratio > 2:1" is highly suggestive of:', '["Viral hepatitis", "Alcoholic Liver Disease", "Nonalcoholic Fatty Liver Disease (NAFLD)", "Autoimmune hepatitis"]', 1, '"A"lcoholic "S"tatistics "T"rump ALT. (Harrison''s Ch. 331)'),
    (v_topic_id, '168: Very high transaminases (>1000 U/L) are typically seen in:', '["Cirrhosis", "Acute viral hepatitis, Ischemic liver (Shock liver), or Toxin (APAP)", "Chronic Hep B", "Gallstones"]', 1, 'Indicates massive, acute hepatocyte death. (Step-Up)'),
    (v_topic_id, '169: "Dubin-Johnson Syndrome" is a benign conjugated hyperbilirubinemia characterized by:', E'["Yellow skin only", "A \\"black liver\\" on biopsy", "Severe itching", "Liver failure"]', 1, 'Due to a defect in bilirubin excretion into bile. (Pocket Medicine)'),
    (v_topic_id, '170: "Pruritus" (itching) in liver disease is thought to be due to accumulation of:', '["Bilirubin", "Bile salts and other pruritogens", "Sugar", "Iron"]', 1, 'Often seen in cholestatic conditions like PBC. (Harrison''s Ch. 330)');

    -- SECTION 18: VIRAL HEPATITIS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '171: Hepatitis A is primarily transmitted via the ____ route.', '["Blood", "Fecal-oral", "Sexual", "Respiratory"]', 1, 'Often associated with contaminated food/water or travel. (Step-Up)'),
    (v_topic_id, '172: Which of the following Hepatitis viruses is a DNA virus?', '["Hepatitis A", "Hepatitis B", "Hepatitis C", "Hepatitis E"]', 1, 'HBV is a partially double-stranded DNA virus. (Harrison''s Ch. 332)'),
    (v_topic_id, '173: What is the first serological marker to appear in an acute Hepatitis B infection?', '["HBsAb", "HBsAg (Surface Antigen)", "HBcAb", "HBeAg"]', 1, 'Indicates the presence of the virus. (Pocket Medicine)'),
    (v_topic_id, '174: The presence of "HBsAb" (Surface Antibody) alone indicates:', '["Chronic infection", "Acute infection", "Immunity (via vaccination or prior resolved infection)", "Highly infectious state"]', 2, 'Successful vaccination leads to HBsAb without HBcAb. (Step-Up)'),
    (v_topic_id, '175: "HBeAg" is a marker of:', '["Immunity", "High viral replication and infectivity", "Resolution", "Chronic carrier state only"]', 1, 'Signifies that the virus is actively multiplying. (Harrison''s Ch. 332)'),
    (v_topic_id, '176: Hepatitis D can only cause infection in the presence of:', '["Hepatitis A", "Hepatitis B", "Hepatitis C", "Alcohol"]', 1, 'HDV is a defective virus that requires HBsAg for its envelope. (Pocket Medicine)'),
    (v_topic_id, '177: What is the most common mode of transmission for Hepatitis C in the Western world?', '["Food", "Injection Drug Use (Needle sharing)", "Sexual", "Vertical"]', 1, 'Significant risk factor for chronic liver disease. (Step-Up)'),
    (v_topic_id, '178: Which Hepatitis virus has a high mortality rate (up to 20%) in PREGNANT women?', '["Hepatitis A", "Hepatitis E", "Hepatitis B", "Hepatitis C"]', 1, 'Particularly in endemic regions. (Harrison''s Ch. 332)'),
    (v_topic_id, '179: "Ground-glass hepatocytes" on biopsy are characteristic of:', '["Alcohol", "Chronic Hepatitis B", "Hepatitis C", "Wilson''s disease"]', 1, 'Reflects accumulation of HBsAg in the cytoplasm. (Pocket Medicine)'),
    (v_topic_id, '180: What is the primary goal of treatment for chronic Hepatitis C?', '["Lifelong suppression", "Sustained Virologic Response (SVR) / Cure", "Symptom management only", "Prevention of Hep A"]', 1, 'Modern DAA therapies cure >95% of patients. (Harrison''s Ch. 332)');

    -- SECTION 19: ALCOHOLIC & FATTY LIVER DISEASE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '181: "Mallory-Denk bodies" on liver biopsy are classic for:', '["Viral hepatitis", "Alcoholic Hepatitis", "Hemochromatosis", "Wilson''s disease"]', 1, 'Damaged intermediate filaments in hepatocytes. (Step-Up)'),
    (v_topic_id, '182: The "Maddrey Discriminant Function" is used to decide whether to start ____ in alcoholic hepatitis.', '["Antibiotics", "Corticosteroids", "Diuretics", "Lactulose"]', 1, 'Based on PT and Bilirubin levels. (Pocket Medicine)'),
    (v_topic_id, '183: What is the first stage of alcoholic liver disease?', '["Cirrhosis", "Steatosis (Fatty Liver)", "Hepatitis", "Liver cancer"]', 1, 'Usually reversible with cessation of alcohol. (Harrison''s Ch. 333)'),
    (v_topic_id, '184: "MASLD" (formerly NAFLD) is strongly associated with which condition?', '["Smoking", "Metabolic Syndrome (Obesity, Diabetes, HTN)", "Alcohol", "High protein diet"]', 1, 'Most common cause of incidental elevated LFTs in the US. (Step-Up)'),
    (v_topic_id, '185: "MASH" (formerly NASH) differs from simple steatosis because it involves:', '["More fat", "Inflammation and hepatocyte injury (ballooning)", "Viral infection", "Alcohol"]', 1, 'Higher risk of progression to cirrhosis. (Pocket Medicine)'),
    (v_topic_id, '186: What is the first-line management for MASLD?', '["Vitamin E", "Weight loss and exercise", "Metformin", "Statins"]', 1, 'Gradual weight loss (7-10%) can reverse many changes. (Harrison''s Ch. 334)'),
    (v_topic_id, '187: Which medication is sometimes used for biopsy-proven MASH in non-diabetic patients?', '["Aspirin", "Vitamin E", "Penicillin", "Prednisone"]', 1, 'May reduce inflammation in specific populations. (Pocket Medicine)'),
    (v_topic_id, '188: "Micronodular cirrhosis" is most commonly caused by:', '["Chronic Hep C", "Alcohol", "Wilson''s disease", "A1AT deficiency"]', 1, 'Small, uniform nodules < 3mm. (Step-Up)'),
    (v_topic_id, '189: "Macronodular cirrhosis" is more typical of:', '["Alcohol", "Chronic Viral Hepatitis", "Heart failure", "Diabetes"]', 1, 'Larger, irregular nodules. (Harrison''s Ch. 335)'),
    (v_topic_id, '190: In alcoholic hepatitis, why is the AST higher than ALT?', '["ALT is more stable", "Alcohol causes a deficiency of Pyridoxal-5-phosphate (Vitamin B6), which ALT needs", "ALT is not in the liver", "None"]', 1, 'Classic biochemical finding. (Pocket Medicine)');

    -- SECTION 20: CIRRHOSIS & COMPLICATIONS (ASCITES, SBP)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '191: What is the primary cause of portal hypertension in cirrhosis?', '["High heart rate", "Increased resistance to blood flow within the liver due to fibrosis", "High salt intake", "Obesity"]', 1, 'Leads to back-pressure in the splanchnic circulation. (Harrison''s Ch. 335)'),
    (v_topic_id, '192: "SAAG" (Serum-Ascites Albumin Gradient) >= 1.1 g/dL indicates:', '["Cancer", "Portal Hypertension (e.g., Cirrhosis, Heart Failure)", "TB", "Nephrotic syndrome"]', 1, 'High gradient suggests transudative fluid driven by pressure. (Step-Up)'),
    (v_topic_id, '193: What is the first-line diuretic regimen for ascitic management in cirrhosis?', '["Furosemide alone", "Spironolactone + Furosemide (100:40 ratio)", "Hydrochlorothiazide", "Acetazolamide"]', 1, 'Aldosterone antagonism is key. (Pocket Medicine)'),
    (v_topic_id, '194: "Caput medusae" and "Spider angiomata" are physical signs of:', '["Pneumonia", "Cirrhosis/Chronic Liver Disease", "Kidney failure", "Anemia"]', 1, 'Signs of portal-systemic shunting and hyperestrogenemia. (Step-Up)'),
    (v_topic_id, '195: "Asterixis" (flapping tremor) is a clinical sign of:', '["Heart failure", "Hepatic Encephalopathy", "Stroke", "Diabetes"]', 1, 'Due to neurotoxicity from accumulated toxins like ammonia. (Harrison''s Ch. 335)'),
    (v_topic_id, '196: What is the first-line treatment for Hepatic Encephalopathy?', '["Antibiotics", "Lactulose", "Protein-rich diet", "Sedatives"]', 1, 'Lactulose acidifies the gut and promotes ammonia excretion. (Pocket Medicine)'),
    (v_topic_id, '197: Which antibiotic is often added to lactulose for recurrent encephalopathy?', '["Amoxicillin", "Rifaximin", "Ciprofloxacin", "Vancomycin"]', 1, 'Reduces ammonia-producing bacteria in the gut. (Harrison''s Ch. 335)'),
    (v_topic_id, '198: "Hepatorenal Syndrome" (HRS) is a type of kidney failure caused by:', '["Direct kidney damage", "Splanchnic vasodilation and renal vasoconstriction in cirrhosis", "High protein", "Infection only"]', 1, 'Functional renal failure with normal kidney histology. (Pocket Medicine)'),
    (v_topic_id, '199: What is the definitive treatment for advanced cirrhosis and its complications?', '["Lifelong lactulose", "Liver Transplantation", "TIPS procedure", "High-dose steroids"]', 1, 'Replaces the failed organ. (Step-Up)'),
    (v_topic_id, '200: "Child-Pugh Score" uses Bilirubin, Albumin, PT/INR, and which two clinical factors?', '["Fever and Pain", "Ascites and Encephalopathy", "Age and Gender", "Weight and Height"]', 1, 'Predicts mortality and guides surgical risk. (Harrison''s Ch. 335)');

    -- SECTION 21: PORTAL HYPERTENSION & VARICES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '201: What is the most life-threatening complication of portal hypertension?', '["Ascites", "Esophageal Variceal Hemorrhage", "Jaundice", "Spider angiomata"]', 1, 'Requires urgent endoscopic and medical management. (Harrison''s Ch. 335)'),
    (v_topic_id, '202: Which medication is used for PRIMARY prophylaxis to prevent variceal bleeding?', '["Aspirin", "Non-selective Beta-blockers (e.g., Propranolol, Nadolol)", "PPI", "Statins"]', 1, 'Reduce portal pressure and heart rate. (Step-Up)'),
    (v_topic_id, '203: What is the immediate medical treatment for an acute variceal bleed?', '["Antibiotics", "Octreotide (Somatostatin analogue) + Endoscopic Banding", "Warfarin", "Lactulose"]', 1, 'Octreotide causes splanchnic vasoconstriction. (Pocket Medicine)'),
    (v_topic_id, '204: Prophylactic antibiotics (e.g., Ceftriaxone) should be given to EVERY cirrhotic with:', '["Ascites", "Acute GI Bleed", "Fever only", "Jaundice"]', 1, 'Reduces the risk of SBP and improves survival in bleeds. (Harrison''s Ch. 335)'),
    (v_topic_id, '205: "TIPS" (Transjugular Intrahepatic Portosystemic Shunt) is used for:', '["Curing cirrhosis", "Refractory variceal bleeding or ascites", "Treating cancer", "Nothing"]', 1, 'Creates a shunt between the portal and hepatic veins. (Step-Up)'),
    (v_topic_id, '206: A potential major side effect of the TIPS procedure is:', '["Liver failure", "Worsening Hepatic Encephalopathy", "Kidney stones", "Deafness"]', 1, 'Toxins bypass the liver and go straight to the brain. (Pocket Medicine)'),
    (v_topic_id, '207: "Gastric varices" that occur without esophageal varices should prompt a check for:', '["Stomach cancer", "Splenic Vein Thrombosis", "Pancreatitis", "Ulcer"]', 1, 'Associated with "isolated" gastric varices. (Harrison''s Ch. 335)'),
    (v_topic_id, '208: "Cruveilhier-Baumgarten bruit" is heard over the umbilicus due to:', '["Aorta", "Patent paraumbilical vein in portal hypertension", "Cancer", "Hernia"]', 1, 'Sign of significant portal-systemic shunting. (Pocket Medicine)'),
    (v_topic_id, '209: The goal heart rate for patients on beta-blockers for variceal prophylaxis is:', '["40 bpm", "55-60 bpm", "70-80 bpm", "90-100 bpm"]', 1, 'Similar to stable angina targets. (Step-Up)'),
    (v_topic_id, '210: "MELD Score" (Model for End-Stage Liver Disease) is used primarily for:', '["Diagnosing Hep B", "Liver transplant allocation", "Checking for gallstones", "Staging cancer"]', 1, 'Based on Bilirubin, INR, and Creatinine (plus Sodium). (Harrison''s Ch. 335)');

    -- SECTION 22: AUTOIMMUNE & CHOLESTATIC LIVER DISEASES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '211: "Primary Biliary Cholangitis" (PBC) typically affects middle-aged women and is associated with:', '["p-ANCA", "Anti-Mitochondrial Antibody (AMA)", "Anti-dsDNA", "Anti-Sm"]', 1, 'Destruction of small intrahepatic bile ducts. (Harrison''s Ch. 336)'),
    (v_topic_id, '212: What is the first-line treatment for PBC?', '["Prednisone", "Ursodeoxycholic Acid (UDCA)", "Penicillamine", "Antibiotics"]', 1, 'Slows the progression of the disease. (Step-Up)'),
    (v_topic_id, '213: "Primary Sclerosing Cholangitis" (PSC) is characterized by "beading" of the bile ducts on:', '["Ultrasound", "MRCP or ERCP", "CT scan", "Chest X-ray"]', 1, 'Affects both intra- and extrahepatic ducts; strongly linked to UC. (Pocket Medicine)'),
    (v_topic_id, '214: Patients with PSC are at significantly increased risk for:', '["Pancreatic cancer", "Cholangiocarcinoma (Bile duct cancer)", "Gastric cancer", "Lung cancer"]', 1, 'Requires regular surveillance with imaging/CA 19-9. (Harrison''s Ch. 336)'),
    (v_topic_id, '215: "Autoimmune Hepatitis" (Type 1) is associated with which antibody?', '["Anti-Mitochondrial", "Anti-Smooth Muscle Antibody (ASMA) and ANA", "p-ANCA", "Anti-histone"]', 1, 'Responds well to corticosteroids and Azathioprine. (Step-Up)'),
    (v_topic_id, '216: Biopsy in Autoimmune Hepatitis classically shows:', '["Granulomas", "Interface Hepatitis (Plasma cell rich)", "Mallory bodies", "Fat"]', 1, 'Inflammation at the boundary of the portal tract and parenchyma. (Pocket Medicine)'),
    (v_topic_id, '217: "Vanishing Bile Duct Syndrome" is a feature of:', '["Acute Hep A", "Chronic rejection or advanced PBC/PSC", "Gallstones", "Alcohol"]', 1, 'Progressive loss of small bile ducts. (Harrison''s Ch. 336)'),
    (v_topic_id, '218: Which vitamin deficiencies are most common in chronic cholestatic diseases (PBC/PSC)?', '["B and C", "A, D, E, and K (Fat soluble)", "Iron", "Zinc"]', 1, 'Due to impaired bile flow needed for fat absorption. (Step-Up)'),
    (v_topic_id, '219: Xanthelasmas (yellow cholesterol deposits around eyes) are a sign of:', '["Diabetes", "Chronic Cholestasis (e.g., PBC)", "Alcoholism", "Heart failure"]', 1, 'Due to severe hyperlipidemia in PBC. (Pocket Medicine)'),
    (v_topic_id, '220: What is the definitive treatment for end-stage PBC or PSC?', '["High-dose UDCA", "Liver Transplantation", "Biliary stenting", "Chemo"]', 1, 'UDCA does not cure PSC. (Harrison''s Ch. 336)');

    -- SECTION 23: METABOLIC LIVER DISEASES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '221: "Hereditary Hemochromatosis" is most commonly due to a mutation in the ____ gene.', '["ATP7B", "HFE (C282Y)", "A1AT", "CFTR"]', 1, 'Leads to excessive iron absorption and deposition. (Harrison''s Ch. 337)'),
    (v_topic_id, '222: "Bronze Diabetes" refers to the triad of cirrhosis, hyperpigmentation, and diabetes in:', '["Wilson''s", "Hemochromatosis", "A1AT deficiency", "Alcoholism"]', 1, 'Iron deposits in the skin and pancreas. (Step-Up)'),
    (v_topic_id, '223: What is the screening test of choice for Hemochromatosis?', '["Serum Iron", "Transferrin Saturation (>45%) and Ferritin", "Liver biopsy", "MRI"]', 1, 'Ferritin alone is non-specific (acute phase reactant). (Pocket Medicine)'),
    (v_topic_id, '224: What is the primary treatment for Hemochromatosis?', '["Chelation", "Therapeutic Phlebotomy", "Low protein diet", "Vitamin C"]', 1, 'Physically removing iron-rich blood. (Harrison''s Ch. 337)'),
    (v_topic_id, '225: "Wilson''s Disease" is a disorder of ____ metabolism.', '["Iron", "Copper", "Zinc", "Glucose"]', 1, 'ATP7B mutation leads to impaired biliary copper excretion. (Harrison''s Ch. 411)'),
    (v_topic_id, '226: "Kayser-Fleischer rings" in the cornea are diagnostic for:', '["Hemochromatosis", "Wilson''s Disease", "A1AT deficiency", "PBC"]', 1, 'Copper deposition in Descemet''s membrane. (Step-Up)'),
    (v_topic_id, '227: What is a classic laboratory finding in Wilson''s Disease?', '["High Ceruloplasmin", "Low Serum Ceruloplasmin and High 24-hour Urinary Copper", "Low Ferritin", "High ALP"]', 1, 'Ceruloplasmin is the copper-carrying protein. (Pocket Medicine)'),
    (v_topic_id, '228: What is the treatment for Wilson''s Disease?', '["Phlebotomy", "Chelating agents (Penicillamine or Trientine) and Zinc", "Iron supplements", "Steroids"]', 1, 'Zinc blocks intestinal copper absorption. (Harrison''s Ch. 411)'),
    (v_topic_id, '229: Alpha-1 Antitrypsin (A1AT) deficiency causes lung emphysema and:', '["Kidney failure", "Liver Cirrhosis/Hepatocellular CA", "Diabetes", "Blindness"]', 1, 'Abnormal protein aggregates in the liver (PAS+ diastase-resistant globules). (Step-Up)'),
    (v_topic_id, '230: Which A1AT phenotype is associated with the highest risk of disease?', '["MM", "MZ", "ZZ", "MS"]', 2, 'ZZ homozygous patients have only 10-15% of normal A1AT levels. (Pocket Medicine)');

    -- SECTION 24: LIVER TUMORS & MISC
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '231: What is the most common primary malignancy of the liver?', '["Cholangiocarcinoma", "Hepatocellular Carcinoma (HCC)", "Angiosarcoma", "Metastatic cancer"]', 1, 'Almost always occurs in the setting of cirrhosis. (Harrison''s Ch. 83)'),
    (v_topic_id, '232: Which tumor marker is used for HCC surveillance?', '["CEA", "Alpha-fetoprotein (AFP)", "CA 125", "PSA"]', 1, 'Used in combination with ultrasound every 6 months in cirrhotics. (Step-Up)'),
    (v_topic_id, '233: "Hepatic Adenoma" is most strongly linked to the use of:', '["Aspirin", "Oral Contraceptive Pills (OCPs)", "Statins", "Alcohol"]', 1, 'Can rupture during pregnancy; usually regress after stopping OCPs. (Pocket Medicine)'),
    (v_topic_id, '234: What is the most common BENIGN tumor of the liver?', '["Adenoma", "Hemangioma", "Focal Nodular Hyperplasia", "Cyst"]', 1, 'Usually found incidentally; "wait and watch" approach. (Harrison''s Ch. 331)'),
    (v_topic_id, '235: "Focal Nodular Hyperplasia" (FNH) is characterized by a ____ on imaging.', '["Capsule", "Central Stellate Scar", "Calcification", "Fluid level"]', 1, 'A benign response to a vascular malformation. (Step-Up)'),
    (v_topic_id, '236: "Budd-Chiari Syndrome" is caused by obstruction of:', '["Portal vein", "Hepatic venous outflow (Hepatic Veins/IVC)", "Bile duct", "Hepatic artery"]', 1, 'Presents with triad of hepatomegaly, ascites, and abdominal pain. (Harrison''s Ch. 335)'),
    (v_topic_id, '237: "Amebic Liver Abscess" (Entamoeba histolytica) fluid is described as:', '["Pus", "Anchovy paste", "Milk", "Clear"]', 1, 'Usually a single abscess in the right lobe. (Pocket Medicine)'),
    (v_topic_id, '238: "Hydatid cyst" of the liver is caused by:', '["Amoeba", "Echinococcus granulosus (Tapeworm)", "H. pylori", "Virus"]', 1, 'Surgical/PAIR treatment needed; do not simple aspirate due to anaphylaxis risk. (Step-Up)'),
    (v_topic_id, '239: Acetaminophen (APAP) toxicity causes liver damage through its metabolite:', '["Acetic acid", "NAPQI", "Glutathione", "Ethanol"]', 1, 'Depletes glutathione stores. (Harrison''s Ch. 333)'),
    (v_topic_id, '240: What is the antidote for Acetaminophen overdose?', '["Atropine", "N-acetylcysteine (NAC)", "Flumazenil", "Naloxone"]', 1, 'Restores hepatic glutathione. (Pocket Medicine)');

    RAISE NOTICE 'SUCCESS: Gastroenterology MCQ Part 3 (161-240) registered.';
END $$;

COMMIT;
