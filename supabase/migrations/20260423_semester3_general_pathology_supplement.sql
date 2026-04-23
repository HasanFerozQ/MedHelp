-- Migration: Semester 3 - General Pathology MCQ Supplement
-- Date: 2026-04-23
-- This script adds the specific questions missed in the representative migration.

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-pathology' LIMIT 1;

    -- SECTION 22: PHARMACOLOGY SUPPLEMENT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'The time required to reach steady-state concentration (Css) during a continuous infusion is determined by:', '["The dose", "Volume of distribution", "The half-life", "Clearance rate"]', 2, 'It takes 4–5 half-lives to reach steady state regardless of the dose.'),
    (v_topic_id, 'Which parameter is shifted to the right on a dose-response curve by a competitive antagonist?', '["Vmax", "Emax", "ED50 (Potency)", "t1/2"]', 2, 'Competitive antagonists increase ED50 (decrease potency) but do not change maximal efficacy.'),
    (v_topic_id, 'Which organ is the primary site of "First-Pass Metabolism"?', '["Kidney", "Lung", "Liver", "Small Intestine"]', 2, 'Drugs absorbed from the GI tract are metabolized by the liver before reaching systemic circulation.'),
    (v_topic_id, '"Zero-order kinetics" of elimination means:', '["Constant fraction eliminated", "Constant amount eliminated", "Dependent on concentration", "Half-life is constant"]', 1, 'In zero-order kinetics (e.g. ethanol), elimination is saturated and constant.'),
    (v_topic_id, 'Which receptor is found on the motor endplate of skeletal muscle?', '["Muscarinic (M3)", "Nicotinic (Nm)", "Alpha-1", "Beta-2"]', 1, 'Somatic neuromuscular junctions utilize nicotinic acetylcholine receptors.');

    -- SECTION 23: TOXICOLOGY SUPPLEMENT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A patient presents with pinpoint pupils and drooling after spraying pesticides. Treatment?', '["Pralidoxime and Atropine", "Physostigmine", "Neostigmine", "Propranolol"]', 0, 'Organophosphate poisoning is treated with Atropine and Pralidoxime.'),
    (v_topic_id, 'What is the antidote for Iron toxicity?', '["Penicillamine", "Deferoxamine", "EDTA", "Dimercaprol"]', 1, 'Deferoxamine is a chelating agent specific for iron.'),
    (v_topic_id, 'A patient with ethylene glycol poisoning is treated with Fomepizole. What is inhibited?', '["Acetylcholinesterase", "Alcohol dehydrogenase", "Cytochrome oxidase", "NADPH oxidase"]', 1, 'Fomepizole inhibits alcohol dehydrogenase to prevent toxic metabolite formation.');

    -- SECTION 24: CARDIOVASCULAR SUPPLEMENT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'The most common cause of sudden cardiac death in a young athlete is:', '["Myocardial infarction", "Hypertrophic Cardiomyopathy (HCM)", "Viral myocarditis", "Long QT syndrome"]', 1, 'HCM is the leading cause of sudden death in young athletes due to arrhythmias.'),
    (v_topic_id, 'Which valvular lesion is associated with a "mid-systolic click"?', '["Aortic stenosis", "Mitral valve prolapse", "Mitral stenosis", "Tricuspid regurgitation"]', 1, 'Mitral valve prolapse classically presents with a mid-systolic click followed by a murmur.');

    -- SECTION 25: RESPIRATORY SUPPLEMENT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 40-year-old female non-smoker has a lung mass. What is the most likely histological type?', '["Squamous cell", "Adenocarcinoma", "Small cell", "Large cell"]', 1, 'Adenocarcinoma is the most common lung cancer in non-smokers and females.'),
    (v_topic_id, '"Currant jelly" sputum is a classic sign of pneumonia caused by:', '["Strep pneumoniae", "Klebsiella pneumoniae", "Mycoplasma", "Legionella"]', 1, 'Klebsiella is common in alcoholics and causes thick, bloody sputum.'),
    (v_topic_id, '"Honeycomb lung" is the end-stage appearance of which condition?', '["Chronic bronchitis", "Bronchiectasis", "Idiopathic Pulmonary Fibrosis", "Asthma"]', 2, 'Diffuse fibrosis leads to architectural distortion and cystic spaces.');

    -- SECTION 28: RENAL SUPPLEMENT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'The most common type of kidney stone is composed of:', '["Uric acid", "Calcium oxalate", "Struvite", "Cystine"]', 1, 'Calcium oxalate stones are the most common (80%).'),
    (v_topic_id, 'Which nephrotic syndrome is most common in children and responds to steroids?', '["Membranous", "FSGS", "Minimal Change Disease", "IgA Nephropathy"]', 2, 'Minimal change disease shows effacement of podocyte foot processes on EM.'),
    (v_topic_id, '"Lumpy-bumpy" appearance on immunofluorescence (IgG/C3) is seen in:', '["Goodpasture", "Post-streptococcal glomerulonephritis (PSGN)", "Alport", "Wegener"]', 1, 'Reflects subepithelial immune complex "humps".');

    -- SECTION 30: CNS SUPPLEMENT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'The most common primary malignant brain tumor in adults is:', '["Meningioma", "Glioblastoma multiforme", "Ependymoma", "Medulloblastoma"]', 1, 'GBM is highly aggressive and shows pseudopalisading necrosis.'),
    (v_topic_id, '"Psammoma bodies" and a "whirled pattern" on histology are seen in:', '["Schwannoma", "Meningioma", "Astrocytoma", "Oligodendroglioma"]', 1, 'Meningiomas are typically benign and arise from the arachnoid cells.'),
    (v_topic_id, '"Negri bodies" in neurons are pathognomonic for:', '["Herpes simplex", "Rabies virus", "CMV", "HIV"]', 1, 'Eosinophilic cytoplasmic inclusions in Purkinje cells or hippocampus.'),
    (v_topic_id, '"Lewy bodies" (alpha-synuclein) are the hallmark of:', '["Alzheimer''s", "Parkinson''s disease", "Huntington''s", "Multiple Sclerosis"]', 1, 'Found in the substantia nigra in Parkinson''s.');

    -- SECTION 31: REPRODUCTIVE SUPPLEMENT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which ovarian tumor is associated with "Call-Exner bodies"?', '["Serous", "Granulosa cell tumor", "Teratoma", "Dysgerminoma"]', 1, 'Granulosa cell tumors secrete estrogen and can cause precocious puberty.'),
    (v_topic_id, 'A "chocolate cyst" in the ovary is a clinical sign of:', '["PCOS", "Endometriosis", "Ectopic pregnancy", "Dermoid cyst"]', 1, 'Endometrioma filled with old, brown blood.');

    -- SECTION 32: MSK & SKIN SUPPLEMENT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '"Heberden nodes" at the DIP joints are a sign of:', '["Rheumatoid Arthritis", "Osteoarthritis", "Gout", "Psoriatic Arthritis"]', 1, 'Nodes at PIP joints are called Bouchard nodes.'),
    (v_topic_id, 'Which skin cancer has a "pearly papule" appearance with telangiectasia?', '["Squamous cell", "Basal cell carcinoma", "Melanoma", "Kaposi"]', 1, 'BCC is the most common skin cancer; it rarely metastasizes.'),
    (v_topic_id, '"Auspitz sign" (pinpoint bleeding after scaling) is seen in:', '["Eczema", "Psoriasis", "Lichen planus", "Pityriasis rosea"]', 1, 'Associated with hyperkeratosis and parakeratosis.');

    -- SECTION 34: CLINICAL CHEMISTRY SUPPLEMENT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Elevated Alkaline Phosphatase (ALP) with normal GGT suggests pathology in:', '["Liver", "Bone", "Pancreas", "Kidney"]', 1, 'High GGT confirms a hepatic source of ALP elevation.'),
    (v_topic_id, 'Increased "Indirect (Unconjugated) Bilirubin" is most likely seen in:', '["Biliary obstruction", "Hemolysis", "Pancreatic cancer", "Hepatitis"]', 1, 'Hemolysis overwhelms the liver''s conjugation capacity.');

    RAISE NOTICE 'SUCCESS: Supplement for General Pathology MCQs ingested.';
END $$;

COMMIT;
