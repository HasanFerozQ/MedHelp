-- Migration: Year 2 - GI Pharmacology MCQ Bank (PART 4: 211-280)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (Liver, Biliary & Pancreas)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'gi-pharmacology' LIMIT 1;

    -- SECTION 7: LIVER & BILIARY (211-245)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which drug is used to dissolve small, radiolucent gallstones in patients who are not candidates for surgery?', '["Chenodiol", "Ursodeoxycholic Acid (Ursodiol)", "Cholecystokinin", "Lithium"]', 1, 'Ursodiol decreases the cholesterol content of bile by reducing hepatic cholesterol secretion.'),
    (v_topic_id, 'What is the primary clinical use of Pancrelipase?', '["Treatment of pancreatitis pain", "Replacement therapy for Pancreatic Enzyme Insufficiency (e.g., in Cystic Fibrosis)", "Dissolving gallstones", "Lowering blood sugar"]', 1, 'It contains lipase, amylase, and protease to aid digestion.'),
    (v_topic_id, 'Pancrelipase should be taken:', '["Before bed", "With every meal and snack", "On an empty stomach", "Once weekly"]', 1, 'Enzymes must be present in the duodenum at the same time as food to be effective.'),
    (v_topic_id, 'Why are PPIs often co-administered with Pancrelipase?', '["To treat ulcers", "To prevent the destruction of the enzymes by gastric acid", "To increase appetite", "To reduce the dose of enzymes"]', 1, 'Pancreatic enzymes are acid-labile and work best at a neutral/alkaline pH.'),
    (v_topic_id, 'Which drug is used to treat "Biliary Pruritus" (itching due to cholestasis) by binding bile acids in the gut?', '["Ursodiol", "Cholestyramine", "Loperamide", "Lactulose"]', 1, 'Bile acid sequestrants prevent the reabsorption of bile salts that cause itching.'),
    (v_topic_id, 'What is the mechanism of action of Obeticholic Acid used in Primary Biliary Cholangitis (PBC)?', '["Bile acid sequestrant", "Farnesoid X receptor (FXR) agonist", "PPAR-gamma agonist", "5-HT3 antagonist"]', 1, 'FXR activation inhibits bile acid synthesis and protects the liver from cholestasis.'),
    (v_topic_id, 'Which drug is used for acute management of bleeding esophageal varices by causing splanchnic vasoconstriction?', '["Propranolol", "Octreotide", "Lactulose", "Omeprazole"]', 1, 'Octreotide reduces splanchnic blood flow and portal pressure.'),
    (v_topic_id, 'Which non-selective beta-blocker is used for the Prophylaxis (prevention) of variceal bleeding?', '["Atenolol", "Propranolol or Nadolol", "Metoprolol", "Bisoprolol"]', 1, 'Beta-2 blockade causes splanchnic vasoconstriction (unopposed alpha-1), reducing portal inflow.'),
    (v_topic_id, 'A patient with Cirrhosis and Ascites should be treated with which diuretic combination?', '["Furosemide and Hydrochlorothiazide", "Spironolactone and Furosemide", "Acetazolamide", "Amiloride"]', 1, 'Spironolactone (100mg) and Furosemide (40mg) is the standard 100:40 ratio for ascites.'),
    (v_topic_id, 'Why is Spironolactone the primary diuretic for ascites in cirrhosis?', '["It is the most potent", "It opposes the secondary hyperaldosteronism common in cirrhosis", "It increases potassium", "It protects the heart"]', 1, 'Cirrhotic patients have high aldosterone due to low effective circulating volume.'),
    (v_topic_id, 'Lactulose is used in hepatic encephalopathy to convert NH3 into which non-absorbable ion?', '["NH2", "NH4+ (Ammonium)", "NO3", "N2"]', 1, 'Ammonium is trapped in the gut and excreted in the stool.'),
    (v_topic_id, 'Which antibiotic is used as an alternative or adjunct to Lactulose for Hepatic Encephalopathy?', '["Neomycin or Rifaximin", "Amoxicillin", "Ciprofloxacin", "Vancomycin"]', 0, 'They reduce the population of ammonia-producing bacteria in the gut.'),
    (v_topic_id, 'What is a major side effect of Neomycin when used chronically?', '["Liver failure", "Ototoxicity and Nephrotoxicity", "Blindness", "Seizures"]', 1, 'Even though it is poorly absorbed, enough can accumulate to cause damage.'),
    (v_topic_id, 'Which drug is used to treat Spontaneous Bacterial Peritonitis (SBP)?', '["Third-generation Cephalosporins (e.g., Cefotaxime)", "Oral Vancomycin", "Metronidazole only", "Antacids"]', 0, 'Cefotaxime or Ceftriaxone are the first-line empiric choices.'),
    (v_topic_id, 'What is the mechanism of Ribavirin in the treatment of Hepatitis C?', '["Protease inhibitor", "Guanosine analog that interferes with viral RNA synthesis", "Polymerase inhibitor", "Entry inhibitor"]', 1, 'Ribavirin is often used in combination with direct-acting antivirals (DAAs).'),
    (v_topic_id, 'A major side effect of Ribavirin is:', '["Leukopenia", "Hemolytic Anemia and Teratogenicity", "Hypertension", "Fatty liver"]', 1, 'Ribavirin is highly teratogenic; effective contraception is required for 6 months after stopping.'),
    (v_topic_id, 'Which class of drugs has revolutionized Hepatitis C treatment with cure rates over 95%?', '["Interferons", "Direct-Acting Antivirals (DAAs)", "Corticosteroids", "Immunoglobulins"]', 1, 'DAAs include NS3/4A, NS5A, and NS5B inhibitors.'),
    (v_topic_id, 'Sofosbuvir is an inhibitor of which HCV protein?', '["NS3/4A Protease", "NS5B RNA-dependent RNA polymerase", "NS5A Protein", "Entry protein"]', 1, 'Sofosbuvir is a cornerstone of pangenotypic HCV regimens.'),
    (v_topic_id, 'What is the mechanism of Ledipasvir and Velpatasvir?', '["NS3/4A inhibitors", "NS5A inhibitors", "Nucleoside analogs", "Fusion inhibitors"]', 1, 'They inhibit the NS5A protein required for viral assembly.'),
    (v_topic_id, 'Side effect of Interferon-alpha therapy includes:', '["Flu-like symptoms and severe depression", "Weight gain", "Sedation", "Hirsutism"]', 0, 'Neuropsychiatric side effects are a major reason for treatment discontinuation.'),
    (v_topic_id, 'Which drug is used for the treatment of Chronic Hepatitis B and also has activity against HIV?', '["Tenofovir or Entecavir", "Ribavirin", "Sofosbuvir", "Ondansetron"]', 0, 'Tenofovir is a potent nucleoside/nucleotide reverse transcriptase inhibitor.'),
    (v_topic_id, 'Adefovir and Telbivudine are used for which condition?', '["Hepatitis C", "Hepatitis B", "Cirrhosis", "Gallstones"]', 1, 'They are older anti-HBV agents.'),
    (v_topic_id, 'Which drug is used to treat "Wilson Disease" by chelating copper?', '["Penicillamine", "Deferoxamine", "Ursodiol", "Lactulose"]', 0, 'Penicillamine and Trientine promote copper excretion.'),
    (v_topic_id, 'What is the role of Zinc in Wilson Disease?', '["Kills bacteria", "Inhibits intestinal copper absorption", "Dissolves stones", "Stimulates bile"]', 1, 'Zinc induces metallothionein in enterocytes, which traps copper.'),
    (v_topic_id, 'Which drug is used for the treatment of "Hemochromatosis" when phlebotomy is not possible?', '["Penicillamine", "Deferoxamine", "Zinc", "Silymarin"]', 1, 'Deferoxamine is an iron chelator.'),
    (v_topic_id, 'Silymarin (Milk Thistle) is often used in alternative medicine for:', '["Indigestion", "Liver protection/hepatitis", "Constipation", "GERD"]', 1, 'It is an antioxidant used in various liver conditions.'),
    (v_topic_id, 'Which drug is a vasopressin analog used for hepatorenal syndrome and variceal bleeding?', '["Octreotide", "Terlipressin", "Dopamine", "Furosemide"]', 1, 'Terlipressin is the preferred vasoconstrictor in many international guidelines for HRS.'),
    (v_topic_id, 'The "MELD Score" is used in liver disease to predict:', '["Pain levels", "3-month mortality and need for liver transplant", "Risk of cancer", "Drug metabolism"]', 1, 'Model for End-Stage Liver Disease.'),
    (v_topic_id, 'Which drug is used for "Primary Sclerosing Cholangitis" (PSC) despite limited evidence?', '["Mesalamine", "Ursodeoxycholic Acid", "Prednisone", "Azathioprine"]', 1, 'Ursodiol is commonly used but its effect on disease progression is debated.'),
    (v_topic_id, 'Side effect of Entecavir in patients with HIV co-infection who are not on HAART?', '["Liver failure", "Development of HIV resistance", "Renal failure", "Lactic acidosis"]', 1, 'It has weak anti-HIV activity, which can select for resistant virus.'),
    (v_topic_id, 'Which HCV drug class is associated with "Photosensitivity"?', '["NS5B inhibitors", "NS3/4A Protease inhibitors (e.g., Simeprevir)", "NS5A inhibitors", "Interferon"]', 1, 'Simeprevir was known for this side effect.'),
    (v_topic_id, 'What is the mechanism of N-acetylcysteine (NAC) in Acetaminophen toxicity?', '["Blocks absorption", "Replenishes Glutathione stores to detoxify NAPQI", "Inhibits CYP2E1", "Neutralizes acid"]', 1, 'NAC is the life-saving antidote for paracetamol overdose.'),
    (v_topic_id, 'Which GI drug can cause "Pruritus" as a side effect (ironically, since it''s also used to treat it)?', '["Cholestyramine", "Ursodiol", "Both", "None"]', 2, 'In some patients, starting these drugs can transiently worsen itching.'),
    (v_topic_id, 'What is the "Child-Pugh Score" used for?', '["Staging liver cirrhosis severity", "Diagnosing hepatitis", "Measuring acid", "Checking enzymes"]', 0, 'It uses Bilirubin, Albumin, INR, Ascites, and Encephalopathy.'),
    (v_topic_id, 'Which antibiotic is used for "Primary Prophylaxis" of SBP in high-risk cirrhotic patients?', '["Amoxicillin", "Norfloxacin or Trimethoprim/Sulfamethoxazole", "Vancomycin", "Metronidazole"]', 1, 'Selective intestinal decontamination reduces SBP risk.'),

    -- SECTION 8: PANCREAS & ADVANCED LIVER (246-280)
    (v_topic_id, 'In acute pancreatitis, which drug is used for pain control while avoiding the "Sphincter of Oddi" spasm theoretically caused by Morphine?', '["Morphine", "Meperidine (Pethidine)", "Ibuprofen", "Aspirin"]', 1, 'Although recent data suggests all opioids are similar, Meperidine was traditionally preferred.'),
    (v_topic_id, 'Pancreatic Enzyme replacement products are derived from which animal?', '["Cows", "Pigs (Porcine)", "Sheep", "Chickens"]', 1, 'Porcine-derived enzymes are the standard.'),
    (v_topic_id, 'A major side effect of very high doses of Pancrelipase in children with Cystic Fibrosis is:', '["Liver failure", "Fibrosing Colonopathy", "Seizures", "Growth failure"]', 1, 'High doses can lead to strictures in the colon.'),
    (v_topic_id, 'Which drug is a "Choleretic" (stimulates the production of bile)?', '["Loperamide", "Ursodeoxycholic Acid", "Atropine", "Aluminum hydroxide"]', 1, 'Ursodiol stimulates bile flow.'),
    (v_topic_id, 'The mechanism of Peg-Interferon is different from standard Interferon because:', '["It is more potent", "The PEG moiety slows clearance, allowing once-weekly dosing", "It is oral", "It has no side effects"]', 1, 'PEGylation significantly improves the pharmacokinetic profile.'),
    (v_topic_id, 'What is the "SVR12" in Hepatitis C therapy?', '["Severe Viral Reaction", "Sustained Virologic Response (Undetectable virus 12 weeks after treatment)", "Stage 12 Cirrhosis", "None"]', 1, 'SVR12 is considered a functional "Cure."'),
    (v_topic_id, 'Which liver drug is an antagonist of the "Nuclear Receptor FXR"?', '["Obeticholic acid is an agonist, not an antagonist", "Ursodiol", "Lactulose", "Rifaximin"]', 0, 'Obeticholic acid is the only FXR-targeting drug on the list.'),
    (v_topic_id, 'The use of corticosteroids in "Autoimmune Hepatitis" is:', '["Always avoided", "First-line therapy (Prednisone + Azathioprine)", "Only for flares", "Experimental"]', 1, 'This is the mainstay of treatment for AIH.'),
    (v_topic_id, 'Which drug is used for "Alcoholic Hepatitis" if the Maddrey Discriminant Function is > 32?', '["Antibiotics", "Prednisolone or Pentoxifylline", "Lactulose", "Propranolol"]', 1, 'Steroids improve short-term survival in severe alcoholic hepatitis.'),
    (v_topic_id, 'Pentoxifylline works in alcoholic hepatitis by:', '["Killing bacteria", "Inhibiting TNF-alpha production and improving microcirculation", "Blocking D2", "Stimulating bile"]', 1, 'It is an alternative when steroids are contraindicated.'),
    (v_topic_id, 'What is the primary side effect of Tenofovir Alafenamide (TAF) compared to Tenofovir Disoproxil (TDF)?', '["TAF has higher renal toxicity", "TAF has lower renal and bone toxicity", "TAF causes liver failure", "TAF is ineffective"]', 1, 'TAF is a newer prodrug that delivers more drug to the target cell and less to kidneys/bone.'),
    (v_topic_id, 'A patient on Interferon presents with "Snowstorm" appearance on retinal exam. Diagnosis?', '["Glaucoma", "Interferon Retinopathy", "Cataracts", "Uveitis"]', 1, 'Retinal monitoring is sometimes required on IFN.'),
    (v_topic_id, 'Which drug is used to treat "Type 1 Hepatorenal Syndrome"?', '["Furosemide", "Albumin + Terlipressin (or Midodrine/Octreotide)", "Dialysis only", "Low salt diet only"]', 1, 'Vasoconstrictors + Albumin is the medical bridge to transplant.'),
    (v_topic_id, 'In hepatic encephalopathy, which grade is characterized by "Asterixis" (flapping tremor)?', '["Grade 1", "Grade 2", "Grade 3", "Grade 4"]', 1, 'Grade 2 and 3 usually show asterixis.'),
    (v_topic_id, 'Which drug is used to prevent "Fungal Spontaneous Peritonitis" in high-risk patients?', '["Nystatin", "Fluconazole", "Amphotericin B", "None"]', 1, 'Sometimes used in ICUs.'),
    (v_topic_id, 'The mechanism of Deferasirox in iron overload is:', '["IV chelator", "Oral iron chelator", "Bile acid binder", "Phosphate binder"]', 1, 'Deferasirox is an oral alternative to IV Deferoxamine.'),
    (v_topic_id, 'Which liver condition is treated with "Liver Transplantation" as the only definitive therapy?', '["Mild Hepatitis", "Decompensated Cirrhosis (Child-Pugh C)", "Gallstones", "IBS"]', 1, 'End-stage liver disease requires replacement.'),
    (v_topic_id, 'The side effect "Pruritus" in PBC is managed with all EXCEPT:', '["Cholestyramine", "Rifampin", "Naltrexone", "Metoclopramide"]', 3, 'Rifampin and Opioid antagonists (Naltrexone) are used for refractory itching.'),
    (v_topic_id, 'Why is Rifampin used for cholestatic itching?', '["It kills bacteria", "It induces hepatic enzymes (P40) that metabolize pruritogens", "It is an antacid", "None"]', 1, 'It activates the PXR receptor.'),
    (v_topic_id, 'Which drug is used to treat Chronic Hepatitis C genotype 1 only (older generation)?', '["Simeprevir", "Sofosbuvir", "Velpatasvir", "Daclatasvir"]', 0, 'Simeprevir was one of the first protease inhibitors for Genotype 1.'),
    (v_topic_id, 'What is the "Daclatasvir" mechanism?', '["NS3 inhibitor", "NS5A inhibitor", "NS5B inhibitor", "Protease inhibitor"]', 1, 'Used in combination with Sofosbuvir.'),
    (v_topic_id, 'A patient with Hepatitis B co-infected with Hepatitis D is best treated with:', '["Tenofovir", "Peg-Interferon alpha", "Sofosbuvir", "Entecavir"]', 1, 'Interferon is the only drug with efficacy against Hep D.'),
    (v_topic_id, 'Which liver enzyme is the primary target for Acetaminophen detox via NAC?', '["CYP3A4", "CYP2E1", "Glutathione S-transferase", "None"]', 2, 'NAC provides the cysteine needed for glutathione synthesis.'),
    (v_topic_id, 'The "Gray Baby Syndrome" is associated with which antibiotic that should be avoided in liver failure?', '["Tetracycline", "Chloramphenicol", "Penicillin", "Macrolides"]', 1, 'Due to failure of glucuronidation in the liver.'),
    (v_topic_id, 'Which Gi drug is known to cause "Steatorrhea" (fatty stools)?', '["Orlistat", "Pantoprazole", "Loperamide", "Bismuth"]', 0, 'Orlistat inhibits gastric and pancreatic lipases to treat obesity.'),
    (v_topic_id, 'The risk of "Lactic Acidosis" with anti-HBV nucleoside analogs is due to:', '["Liver damage", "Mitochondrial toxicity", "Kidney failure", "None"]', 1, 'Nucleoside analogs can inhibit mitochondrial DNA polymerase gamma.'),
    (v_topic_id, 'What is the "Goal INR" for a patient with cirrhosis?', '["1.0", "2.0-3.0", "It is usually elevated due to the disease, and we don''t treat the number unless bleeding", "0.5"]', 2, 'INR is a measure of liver synthetic function, not necessarily a target for therapy.'),
    (v_topic_id, 'Which drug class used for Hepatitis C is contraindicated in "Decompensated Cirrhosis"?', '["NS5B inhibitors", "NS3/4A Protease Inhibitors", "NS5A inhibitors", "None"]', 1, 'Protease inhibitors can cause liver injury in patients with Child-Pugh B or C.'),
    (v_topic_id, 'Common side effect of Entecavir?', '["Hair loss", "Dizziness and fatigue", "Renal failure", "Bone loss"]', 1, 'Generally very well tolerated.'),
    (v_topic_id, 'Which liver drug is an inhibitor of "Xanthine Oxidase" used in some GI protocols?', '["Allopurinol", "Probenecid", "Colchicine", "Febuxostat"]', 0, 'Allopurinol is sometimes used to shunt thiopurine metabolism (with caution).'),
    (v_topic_id, 'What is the "Maddrey Function" formula?', '["4.6 x (PT - Control) + Bilirubin", "ALT / AST", "Albumin x INR", "None"]', 0, 'Used for alcoholic hepatitis severity.'),
    (v_topic_id, 'Which GI drug is used for "Hyperammonemia" in Urea Cycle Disorders (not just cirrhosis)?', '["Lactulose", "Sodium Phenylbutyrate", "Rifaximin", "Neomycin"]', 1, 'It provides an alternative pathway for nitrogen excretion.'),
    (v_topic_id, 'The mechanism of "Cylcoprevin" in Hep C was:', '["NS3 blocker", "NS5A blocker", "NS5B blocker", "Entry blocker"]', 0, 'Part of early DAA combos.'),
    (v_topic_id, 'In cirrhosis, why is "Albumin" given after a large-volume paracentesis?', '["To treat malnutrition", "To prevent post-paracentesis circulatory dysfunction (PPCD)", "To stop bleeding", "None"]', 1, 'It maintains oncotic pressure and prevents renal failure.'),
    (v_topic_id, 'Which drug is a bile acid sequestrant available in a "Sachet" or "Powder" form?', '["Colestipol", "Colesevelam", "Cholestyramine", "All of the above"]', 2, 'Cholestyramine is the classic resin powder.');

    RAISE NOTICE 'SUCCESS: GI Pharmacology MCQ Part 4 (211-280) registered.';
END $$;

COMMIT;
