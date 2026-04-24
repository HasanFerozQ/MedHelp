-- Migration: Year 2 - Renal/Urinary Pathology Cases (PART 3: 31-45)
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'renal-urinary-pathology' LIMIT 1;

    -- CASE 31: Xanthogranulomatous Pyelonephritis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Foamy Macrophages and Bear Paw Sign', 'A 62-year-old male presents with persistent, dull flank pain and a low-grade fever. He has a history of recurrent urinary tract infections caused by Proteus species. A CT scan shows a large, yellow, lobulated mass that is invading the renal parenchyma, mimicking a tumor. Biopsy shows "foamy macrophages."', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Renal Cell Carcinoma", "Xanthogranulomatous Pyelonephritis", "Renal Sarcoidosis", "Malakoplakia"]', 1, 'Xanthogranulomatous pyelonephritis is a chronic inflammatory response to Proteus infection, often mimicking RCC.'),
    (v_case_id, 'The "foamy" appearance of the macrophages is due to the ingestion of:', '["Glycogen", "Lipid-rich debris from bacterial destruction", "Calcium deposits", "Amyloid fibrils"]', 1, 'Macrophages become "xanthomatous" (loaded with lipids) as they ingest debris from chronic infection.'),
    (v_case_id, 'This condition is often associated with which finding on imaging?', '["Bear paw sign", "String sign", "Apple core lesion", "Eggshell calcification"]', 0, 'The "Bear Paw" sign on CT refers to the pattern of replacement of renal parenchyma with low-density inflammatory tissue.');

    -- CASE 32: Malakoplakia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Michaelis-Gutmann Bodies', 'A 45-year-old female presents with hematuria and suprapubic pain. Cystoscopy reveals soft, yellow, slightly raised mucosal plaques in the bladder. Microscopic exam shows "Michaelis-Gutmann bodies."', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Urothelial Carcinoma", "Malakoplakia", "Cystitis Glandularis", "Interstitial Cystitis"]', 1, 'Malakoplakia is a chronic inflammatory disorder associated with E. coli infections.'),
    (v_case_id, 'What are Michaelis-Gutmann bodies?', '["Intracytoplasmic viral inclusions", "Laminated iron-calcium deposits in macrophages", "Clusters of neutrophils", "Aggregates of IgG"]', 1, 'These are pathognomonic calcified inclusions within macrophages (Von Hansemann cells).'),
    (v_case_id, 'This condition is usually related to a defect in:', '["Antibody production", "Phagosome-lysosome fusion in macrophages", "T-cell maturation", "Complement activation"]', 1, 'A defect in macrophage bacterial killing leads to the accumulation of partially digested bacteria and calcification.');

    -- CASE 33: Angiomyolipoma (Tuberous Sclerosis)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vessels, Muscle, and Fat', 'A 28-year-old male with a history of tuberous sclerosis is found to have a large renal mass on routine screening. Histology shows a mixture of thick-walled blood vessels, smooth muscle, and adipose tissue.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Renal Cell Carcinoma", "Angiomyolipoma", "Oncocytoma", "Medullary Fibroma"]', 1, 'Angiomyolipoma is a benign triphasic tumor (vessels, muscle, fat) highly associated with Tuberous Sclerosis.'),
    (v_case_id, 'What is the major clinical risk associated with this lesion?', '["High metastatic potential", "Spontaneous retroperitoneal hemorrhage", "Progression to Wilms tumor", "Development of Nephrotic Syndrome"]', 1, 'Large angiomyolipomas are prone to sudden, life-threatening hemorrhage.'),
    (v_case_id, 'Tuberous Sclerosis is also characterized by which of the following?', '["Ash-leaf spots and Facial angiofibromas", "Hemangioblastomas", "Optic gliomas", "Cafe-au-lait spots"]', 0, 'The TSC1/TSC2 mutation also causes ash-leaf spots, Shagreen patches, and subependymal hamartomas.');

    -- CASE 34: Oncocytoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Mahogany Mass with Central Scar', 'A 50-year-old male smoker is found to have a well-circumscribed, mahogany-brown renal mass with a central stellate scar. Biopsy shows cells with abundant eosinophilic cytoplasm and numerous mitochondria.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Clear Cell RCC", "Renal Oncocytoma", "Chromophobe RCC", "Papillary RCC"]', 1, 'The central stellate scar and mahogany color are classic gross findings for Oncocytoma.'),
    (v_case_id, 'This tumor arises from which part of the nephron?', '["Proximal tubule", "Loop of Henle", "Intercalated cells of the collecting duct", "Glomerular capsule"]', 2, 'Oncocytomas derive from the intercalated cells of the collecting ducts.'),
    (v_case_id, 'Histologically, how is this benign tumor most easily confused with malignancy?', '["It looks identical to Clear Cell RCC", "It resembles Chromophobe RCC", "It shows frequent mitotic figures", "It always invades the renal vein"]', 1, 'Both contain eosinophilic cells; however, chromophobe cells have perinuclear halos and irregular nuclei.');

    -- CASE 35: Interstitial Cystitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hunner Ulcers and Pelvic Pain', 'A 40-year-old female presents with chronic suprapubic pain that is relieved by voiding. She also reports extreme urinary frequency and urgency. Cystoscopy shows "Hunner ulcers" and small petechial hemorrhages (glomerulations) after bladder distention.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Schistosomiasis", "Interstitial Cystitis (Painful Bladder Syndrome)", "Acute Cystitis", "Radiation Cystitis"]', 1, 'Interstitial cystitis is a chronic inflammatory bladder condition without infectious etiology.'),
    (v_case_id, 'Urinalysis in this patient would typically show:', '["Significant bacteriuria", "Nitrite positivity", "Normal findings (sterile pyuria may occur, but no infection)", "Malignant cells"]', 2, 'IC is a diagnosis of exclusion; urinalysis/culture are typically negative.'),
    (v_case_id, 'Which cell type is often found in increased numbers in the bladder wall in this condition?', '["Eosinophils", "Mast cells", "Plasma cells", "Reed-Sternberg cells"]', 1, 'Mast cell activation is thought to play a role in the pathogenesis and pain of IC.');

    -- CASE 36: Testicular Torsion
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Pain and Absent Cremasteric Reflex', 'A 19-year-old male presents with sudden onset of excruciating left testicular pain. On exam, the left testis is high-riding with a horizontal lie. The cremasteric reflex is absent.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Epididymitis", "Testicular Torsion", "Hydrocele", "Varicocele"]', 1, 'Absent cremasteric reflex and sudden onset pain are highly indicative of torsion.'),
    (v_case_id, 'What is the underlying anatomical predisposition?', '["Patent processus vaginalis", "Bell-clapper deformity", "Inguinal hernia", "Absent gubernaculum"]', 1, 'Bell-clapper deformity refers to the lack of posterior anchoring of the testis to the tunica vaginalis.'),
    (v_case_id, 'If the torsion is not relieved, what type of necrosis will occur?', '["Dry gangrene", "Hemorrhagic infarction (Coagulative necrosis)", "Liquefactive necrosis", "Caseous necrosis"]', 1, 'Veins are compressed first, causing congestion and hemorrhagic infarction (coagulative necrosis).');

    -- CASE 37: Seminoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fried Egg Cells and PLAP', 'A 30-year-old male presents with a painless, heavy sensation in his right scrotum. He has a history of cryptorchidism. Physical exam reveals a firm, non-tender mass that does not transilluminate. Labs show elevated placental alkaline phosphatase (PLAP) but normal AFP and hCG.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Yolk Sac Tumor", "Seminoma", "Choriocarcinoma", "Teratoma"]', 1, 'Seminoma is the most common germ cell tumor; it typically has normal AFP/hCG.'),
    (v_case_id, 'What is the characteristic histological appearance?', '["Schiller-Duval bodies", "Large fried egg cells with clear cytoplasm and prominent nucleoli", "Cytotrophoblasts and syncytiotrophoblasts", "Multiple tissue layers (hair, teeth, muscle)"]', 1, 'Cells resemble spermatogonia and are separated by fibrous septa with lymphocytes.'),
    (v_case_id, 'Which of the following is true regarding this tumor?', '["Highly radio-resistant", "Highly radio-sensitive with excellent prognosis", "Always produces high levels of AFP", "Most common in infants"]', 1, 'Seminomas are exquisitely sensitive to radiotherapy.');

    -- CASE 38: Yolk Sac Tumor
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'High AFP in a 2-year-old', 'A 2-year-old boy presents with a large testicular mass. Labs show a significantly elevated Alpha-Fetoprotein (AFP).', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Seminoma", "Yolk Sac (Endodermal Sinus) Tumor", "Leydig Cell Tumor", "Sertoli Cell Tumor"]', 1, 'Yolk sac tumor is the most common testicular tumor in children; high AFP is the marker.'),
    (v_case_id, 'What is the pathognomonic histological finding?', '["Reinke crystals", "Schiller-Duval bodies (glomeruloid structures)", "Call-Exner bodies", "Psammoma bodies"]', 1, 'Schiller-Duval bodies resemble primitive glomeruli with a central vessel.'),
    (v_case_id, 'This tumor is the most common testicular tumor in which age group?', '["Men over 60", "Adolescents", "Children under 3 years old", "Young adults (20-35)"]', 2, 'Yolk sac tumor is the #1 testicular tumor in infants and toddlers.');

    -- CASE 39: Choriocarcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemoptysis and High hCG', 'A 32-year-old male presents with a testicular mass. Labs show extremely high levels of human chorionic gonadotropin (hCG). He also complains of recent hemoptysis (coughing up blood).', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Choriocarcinoma", "Embryonal Carcinoma", "Seminoma", "Teratoma"]', 0, 'Choriocarcinoma produces massive amounts of hCG and spreads hematogenously very early.'),
    (v_case_id, 'hCG is produced by which cell type in this tumor?', '["Cytotrophoblasts", "Syncytiotrophoblasts", "Blastema", "Hepatocytes"]', 1, 'Syncytiotrophoblasts are the primary source of hCG.'),
    (v_case_id, 'Why does the patient have hemoptysis?', '["Primary lung cancer", "Early hematogenous spread to the lungs", "Pulmonary embolism", "Paraneoplastic pneumonia"]', 1, 'Choriocarcinoma is aggressive and typically presents with lung metastases at diagnosis.');

    -- CASE 40: Leydig Cell Tumor
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Gynecomastia and Reinke Crystals', 'A 45-year-old male presents with a testicular mass. Histology shows "Reinke crystals" (fusiform, rod-shaped inclusions) within the tumor cells. The patient has also noticed recent gynecomastia.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Sertoli Cell Tumor", "Leydig Cell Tumor", "Seminoma", "Lymphoma"]', 1, 'Leydig cell tumors (sex cord-stromal) produce hormones and feature Reinke crystals.'),
    (v_case_id, 'Why did the patient develop gynecomastia?', '["Tumor production of hCG", "Tumor production of androgens or estrogens", "Metastasis to the pituitary", "Starvation"]', 1, 'Leydig cells produce androgens and estrogens; excess estrogen leads to feminization.'),
    (v_case_id, 'Most Leydig cell tumors are:', '["Highly malignant", "Benign", "Associated with 11p deletion", "Only found in children"]', 1, 'The majority (~90%) of Leydig cell tumors in adults are benign.');

    -- CASE 41: Testicular Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bilateral Testicular Masses in the Elderly', 'An 80-year-old man presents with bilateral testicular masses. He has a history of B-cell symptoms (night sweats, weight loss).', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Seminoma", "Spermatocytic Tumor", "Diffuse Large B-cell Lymphoma", "Teratoma"]', 2, 'Lymphoma is the most common cause of a testicular mass in men over 60.'),
    (v_case_id, 'Testicular lymphoma is most common in which demographic?', '["Infants", "Adolescents", "Men over age 60", "HIV patients only"]', 2, 'While it can occur in HIV, it is classically a disease of older men.'),
    (v_case_id, 'This tumor usually represents:', '["Primary testicular cancer", "Metastatic spread from a systemic lymphoma", "A complication of mumps", "A benign proliferation"]', 1, 'Testicular involvement is often the first manifestation of systemic DLBCL.');

    -- CASE 42: Prostatic Adenocarcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Osteoblastic Metastases and Rock-Hard Prostate', 'A 70-year-old male presents with low back pain. He has a history of urinary frequency. A digital rectal exam reveals a rock-hard, nodular prostate. PSA is 50 ng/mL. X-ray of the spine shows "osteoblastic" (radiodense) lesions.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["BPH", "Prostatic Adenocarcinoma", "Osteosarcoma", "Multiple Myeloma"]', 1, 'High PSA, nodular prostate, and osteoblastic bone lesions are diagnostic for prostate cancer.'),
    (v_case_id, 'Prostatic adenocarcinoma most commonly metastasizes to the bone via:', '["Direct extension", "Batson venous plexus", "Lymphatic spread", "Thoracic duct"]', 1, 'The valveless Batson plexus allows direct hematogenous spread to the axial skeleton.'),
    (v_case_id, 'Which grading system is used to determine the prognosis of this cancer?', '["TNM only", "Gleason Score", "Fuhrman Grade", "FIGO Stage"]', 1, 'The Gleason score is based on the architectural pattern of the glands.');

    -- CASE 43: Acute and Chronic Pyelonephritis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and Cortical Abscesses', 'A 30-year-old female presents with abrupt onset of fever, chills, and severe back pain. Urinalysis shows marked pyuria and white cell casts. On gross inspection, the kidney shows small, yellowish cortical abscesses.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Acute Cystitis", "Acute Pyelonephritis", "Acute Tubular Necrosis", "Renal Infarction"]', 1, 'Acute pyelo presents with systemic signs and renal focal inflammation (abscesses).'),
    (v_case_id, 'What is the most common route of infection for this condition?', '["Hematogenous spread", "Ascending infection from the lower urinary tract", "Lymphatic spread", "Direct trauma"]', 1, 'The vast majority are ascending UTIs (E. coli).'),
    (v_case_id, 'Chronic pyelonephritis is characterized by which gross finding?', '["Small, pale kidneys with flea-bitten appearance", "Uremic frost", "Coarse, asymmetric corticomedullary scarring over blunted calyces", "Smooth, subcapsular cysts"]', 2, 'U-shaped scars over blunted (deformed) calyces are hallmark for chronic pyelo.');

    -- CASE 44: Papillary Necrosis Recap
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Diabetes, Smoking, and Sloughed Papillae', 'A 55-year-old male with a history of poorly controlled diabetes and heavy smoking presents with hematuria. He has a history of long-term use of phenacetin. He is found to have necrosis of the renal papillae.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely pathological process?', '["Acute Tubular Necrosis", "Renal Papillary Necrosis", "Acute Glomerulonephritis", "Nephrocalcinosis"]', 1, 'Papillary necrosis occurs when the vasa recta are compromised by diabetes, analgesics, or sickle cell.'),
    (v_case_id, 'Which of the following conditions is NOT associated with this pathology?', '["Sickle cell trait/disease", "Acute pyelonephritis (especially in diabetics)", "Minimal change disease", "Chronic analgesic abuse"]', 2, 'MCD is a podocyte disease and does not cause papillary ischemia.'),
    (v_case_id, 'This condition can lead to what clinical complication?', '["Ureteric obstruction by sloughed papillae", "Hypertension", "Chronic Kidney Disease", "All of the above"]', 3, 'Sloughed tissue can block the ureter, causing renal colic.');

    -- CASE 45: VHL and Clear Cell RCC
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'VHL and Hematuria', 'A 45-year-old male presents with gross hematuria and weight loss. He has a history of von Hippel-Lindau (VHL) disease.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'He is at significantly increased risk for which type of renal cancer?', '["Papillary RCC", "Clear Cell RCC", "Chromophobe RCC", "Wilms Tumor"]', 1, 'VHL mutation (Chr 3p) is the definitive driver for clear cell RCC.'),
    (v_case_id, 'The VHL gene is a tumor suppressor that normally targets which protein for degradation?', '["p53", "Hypoxia-inducible factor (HIF-1alpha)", "Rb", "Myc"]', 1, 'Loss of VHL leads to stable HIF-1a, promoting angiogenesis (VEGF) and tumor growth.'),
    (v_case_id, 'Aside from the kidney, VHL disease is associated with hemangioblastomas in which location?', '["Cerebellum and Retina", "Liver and Spleen", "Lung and Heart", "Bone marrow"]', 0, 'Cerebellar and retinal hemangioblastomas are the classic systemic features.');

    RAISE NOTICE 'SUCCESS: Renal/Urinary Pathology Part 3 (31-45) registered. Finalized.';
END $$;

COMMIT;
