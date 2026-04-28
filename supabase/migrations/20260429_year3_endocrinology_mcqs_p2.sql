-- Migration: Year 3 - Endocrinology MCQ Bank (PART 2: 84-166)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrinology' LIMIT 1;

    -- SECTION 9: DIABETIC KETOACIDOSIS (DKA) & HHS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '84: "Diabetic Ketoacidosis" (DKA) is most commonly seen in which type of diabetes?', '["Type 1", "Type 2", "Gestational", "MODY"]', 0, 'Due to absolute insulin deficiency. (Harrison''s Ch. 396)'),
    (v_topic_id, '85: The classic triad of DKA is hyperglycemia, ketosis, and:', '["Metabolic Alkalosis", "High Anion-Gap Metabolic Acidosis", "Respiratory Acidosis", "Normal-gap acidosis"]', 1, 'Ketone bodies are organic acids. (Step-Up)'),
    (v_topic_id, '86: "Hyperosmolar Hyperglycemic State" (HHS) is characterized by extreme hyperglycemia (>600) and:', '["Severe ketosis", "Profound dehydration and hyperosmolality WITHOUT significant ketosis", "Low sugar", "Fever"]', 1, 'Usually seen in Type 2 DM patients with some residual insulin. (Pocket Medicine)'),
    (v_topic_id, '87: "Fruity" or acetone-scented breath is a sign of:', '["Hypoglycemia", "DKA", "HHS", "Normal DM"]', 1, 'Due to the volatile ketone body, acetone. (Harrison''s Ch. 396)'),
    (v_topic_id, '88: What is the most important INITIAL treatment for both DKA and HHS?', '["Insulin drip", "Aggressive IV fluid resuscitation (Normal Saline)", "Bicarbonate", "Potassium"]', 1, 'Correcting volume deficit is the priority. (Step-Up)'),
    (v_topic_id, '89: In DKA, when should potassium replacement be started?', '["Only if K+ is low", "As soon as K+ is < 5.2 (and patient is urinating)", "After 24 hours", "Never"]', 1, 'Insulin will shift K+ into cells, potentially causing dangerous hypokalemia. (Pocket Medicine)'),
    (v_topic_id, '90: "Euglycemic DKA" (DKA with near-normal glucose) can be seen in patients taking:', '["Metformin", "SGLT2 inhibitors (e.g., Canagliflozin)", "Sulfonylureas", "Insulin"]', 1, 'Requires high suspicion and checking for ketones. (Harrison''s Ch. 396)'),
    (v_topic_id, '91: Cerebral edema is a rare but fatal complication of DKA treatment, especially in children, if:', '["Sugar stays high", "Fluid/Osmolality is corrected too rapidly", "Insulin is not given", "None"]', 1, 'Requires careful monitoring. (Step-Up)'),
    (v_topic_id, '92: In HHS, "Altered Mental Status" is more common than in DKA because:', '["The glucose is lower", "The serum osmolality is much higher (>320)", "There are more ketones", "None"]', 1, 'Severe dehydration leads to central nervous system dysfunction. (Pocket Medicine)'),
    (v_topic_id, '93: When treating DKA, when can you transition from IV insulin to subcutaneous insulin?', '["When glucose < 200", "When the anion gap is closed and the patient can eat", "After 4 hours", "Immediately"]', 1, 'Ensures ketosis has resolved. (Harrison''s Ch. 396)');

    -- SECTION 10: CHRONIC DIABETIC COMPLICATIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '94: What is the leading cause of blindness in working-age adults?', '["Glaucoma", "Diabetic Retinopathy", "Cataracts", "Macular degeneration"]', 1, 'Non-proliferative and Proliferative forms. (Step-Up)'),
    (v_topic_id, '95: "Cotton wool spots" and "Hard exudates" on fundoscopy suggest:', '["Hyperthyroidism", "Non-proliferative Diabetic Retinopathy", "Normal eye", "Infection"]', 1, 'Signs of microvascular damage. (Pocket Medicine)'),
    (v_topic_id, '96: "Proliferative Retinopathy" is defined by the presence of:', '["Hemorrhage", "Neovascularization (new blood vessel growth)", "Yellow spots", "Nothing"]', 1, 'Triggered by ischemia-induced VEGF. (Harrison''s Ch. 396)'),
    (v_topic_id, '97: "Diabetic Nephropathy" initially presents with "Microalbuminuria," defined as ____ mg/day.', '["< 30", "30-300", "> 300", "> 3000"]', 1, 'Requires screening once a year. (Step-Up)'),
    (v_topic_id, '98: "Kimmelstiel-Wilson nodules" on kidney biopsy are diagnostic for:', '["Lupus", "Diabetic Nephropathy", "Hypertension", "Amyloid"]', 1, 'Nodular glomerulosclerosis. (Pocket Medicine)'),
    (v_topic_id, '99: The most common form of diabetic neuropathy is:', '["Mononeuropathy", "Distal Symmetric Polyneuropathy (Stocking-glove)", "Autonomic neuropathy", "None"]', 1, 'Loss of sensation starting in the feet. (Harrison''s Ch. 396)'),
    (v_topic_id, '100: "Gastroparesis" (delayed gastric emptying) is an example of:', '["Microvascular disease", "Autonomic Neuropathy", "Insulin resistance", "Stomach ulcer"]', 1, 'Causes nausea, vomiting, and early satiety. (Step-Up)'),
    (v_topic_id, '101: "Charcot Joint" (Neuroarthropathy) in a diabetic patient is caused by:', '["High sugar", "Loss of sensation and repetitive microtrauma to the foot", "Infection", "Gout"]', 1, 'Leads to severe foot deformity. (Pocket Medicine)'),
    (v_topic_id, '102: "Monofilament testing" (10g) is used to screen for:', '["Vision loss", "Loss of protective sensation in the feet", "Reflexes", "None"]', 1, 'Identifies patients at high risk for foot ulcers. (Harrison''s Ch. 396)'),
    (v_topic_id, '103: Which drug is first-line for painful diabetic neuropathy?', '["Aspirin", "Gabapentin, Pregabalin, or Duloxetine", "Morphine", "Metformin"]', 1, 'Anticonvulsants and SNRIs are preferred. (Step-Up)');

    -- SECTION 11: INSULIN THERAPY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '104: Which insulin is considered "Rapid-acting" (e.g., Lispro, Aspart)?', '["NPH", "Glargine", "Lispro", "Regular"]', 2, 'Taken right before or after a meal. (Pocket Medicine)'),
    (v_topic_id, '105: Which insulin is "Basal" (Long-acting) and provides a steady level for ~24 hours?', '["Lispro", "Glargine (Lantus)", "NPH", "Regular"]', 1, 'Does not have a pronounced peak. (Harrison''s Ch. 396)'),
    (v_topic_id, '106: "NPH" insulin is classified as:', '["Rapid-acting", "Intermediate-acting", "Long-acting", "Ultra-long"]', 1, 'Usually dosed twice daily. (Step-Up)'),
    (v_topic_id, '107: "Regular" insulin is typically given ____ before a meal.', '["5 minutes", "30 minutes", "2 hours", "Immediately after"]', 1, 'Slower onset than rapid-acting analogs. (Pocket Medicine)'),
    (v_topic_id, '108: "Dawn Phenomenon" is morning hyperglycemia due to:', '["Late night snacks", "Nocturnal surge in GH and Cortisol", "Rebound from low sugar", "None"]', 1, 'Requires increasing the evening basal insulin. (Harrison''s Ch. 396)'),
    (v_topic_id, '109: "Somogyi Effect" is morning hyperglycemia caused by:', '["Too much insulin", "Rebound response to nocturnal hypoglycemia", "Growth hormone", "Exercise"]', 1, 'Requires decreasing the evening insulin. (Step-Up)'),
    (v_topic_id, '110: "Basal-Bolus" insulin regimen refers to:', '["One long-acting + rapid-acting before each meal", "One dose of NPH only", "Mixed insulin twice daily", "None"]', 0, 'Most closely mimics physiological insulin secretion. (Pocket Medicine)'),
    (v_topic_id, '111: What is the most common side effect of insulin therapy?', '["Weight loss", "Hypoglycemia", "Cough", "Edema"]', 1, 'Requires patient education on recognition and treatment. (Harrison''s Ch. 396)'),
    (v_topic_id, '112: "Whipple''s Triad" (symptoms, low glucose, and relief with sugar) is the clinical definition of:', '["Diabetes", "Hypoglycemia", "DKA", "Insulinoma"]', 1, 'Applies to patients both with and without DM. (Step-Up)'),
    (v_topic_id, '113: What is the treatment of choice for severe hypoglycemia in an unconscious patient outside the hospital?', '["Orange juice", "Glucagon (IM/Nasal)", "Water", "Insulin"]', 1, 'They cannot swallow; Glucagon mobilizes liver glucose. (Pocket Medicine)');

    -- SECTION 12: DYSLIPIDEMIA (CHOLESTEROL)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '114: Which lipoprotein is considered "Bad Cholesterol" because it carries cholesterol to the tissues?', '["HDL", "LDL", "Chylomicrons", "VLDL"]', 1, 'Directly associated with atherosclerosis. (Harrison''s Ch. 400)'),
    (v_topic_id, '115: Which lipoprotein is "Good Cholesterol" because it performs reverse cholesterol transport?', '["LDL", "HDL", "IDL", "VLDL"]', 1, 'High levels are protective against CVD. (Step-Up)'),
    (v_topic_id, '116: "Statins" (HMG-CoA Reductase inhibitors) primarily work by:', '["Binding bile acids", "Inhibiting cholesterol synthesis in the liver", "Blocking sugar", "None"]', 1, 'The most potent drugs for lowering LDL. (Pocket Medicine)'),
    (v_topic_id, '117: A serious but rare side effect of high-dose statins is:', '["Liver cancer", "Rhabdomyolysis", "Diabetes Insipidus", "Anemia"]', 1, 'Presents with muscle pain and high CK. (Harrison''s Ch. 400)'),
    (v_topic_id, '118: "Fibrates" (e.g., Fenofibrate, Gemfibrozil) are primarily used to lower:', '["LDL", "Triglycerides", "HDL", "Glucose"]', 1, 'They activate PPAR-alpha. (Step-Up)'),
    (v_topic_id, '119: Severe hypertriglyceridemia (>1000 mg/dL) increases the risk of:', '["Heart attack", "Acute Pancreatitis", "Stroke", "Kidney stones"]', 1, 'Chylomicrons can sludge in the pancreatic microcirculation. (Pocket Medicine)'),
    (v_topic_id, '120: "Ezetimibe" works by:', '["Inhibiting synthesis", "Inhibiting cholesterol absorption in the small intestine", "Breaking down fat", "None"]', 1, 'Often added to statins for further LDL reduction. (Harrison''s Ch. 400)'),
    (v_topic_id, '121: "PCSK9 Inhibitors" (e.g., Evolocumab) are injectables that dramatically lower ____ by increasing receptor recycling.', '["Triglycerides", "LDL", "HDL", "Glucose"]', 1, 'Very effective but expensive. (Step-Up)'),
    (v_topic_id, '122: "Niacin" (Vitamin B3) can cause a side effect of "flushing," which can be minimized by taking:', '["Alcohol", "Aspirin (NSAIDs)", "Sugar", "Milk"]', 1, 'Flushing is mediated by prostaglandins. (Pocket Medicine)'),
    (v_topic_id, '123: "Xanthomas" (fatty deposits on tendons) are signs of:', '["Diabetes", "Severe Hyperlipidemia", "Low sodium", "Gout"]', 1, 'Common in familial hypercholesterolemia. (Harrison''s Ch. 400)');

    -- SECTION 13: METABOLIC SYNDROME & OBESITY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '124: "Metabolic Syndrome" (Syndrome X) requires 3 of 5 criteria. Which is NOT a criterion?', '["Abdominal Obesity", "High Triglycerides", "High LDL", "High Blood Pressure", "High Fasting Glucose"]', 2, 'Low HDL is a criterion, not high LDL. (Step-Up)'),
    (v_topic_id, '125: "Obesity" is defined as a Body Mass Index (BMI) >= ____ kg/m2.', '["25", "30", "35", "40"]', 1, '25-29.9 is overweight. (Harrison''s Ch. 394)'),
    (v_topic_id, '126: "Morbid Obesity" is generally defined as a BMI >= ____.', '["30", "35", "40", "50"]', 2, 'Or BMI > 35 with obesity-related comorbidities. (Step-Up)'),
    (v_topic_id, '127: Which weight-loss medication works by inhibiting GI lipase (fat absorption)?', '["Phentermine", "Orlistat", "Liraglutide", "Metformin"]', 1, 'Can cause steatorrhea (oily stools). (Pocket Medicine)'),
    (v_topic_id, '128: "Bariatric Surgery" (e.g., Gastric Bypass) is generally considered for patients with BMI > ____ who failed lifestyle changes.', '["25", "30", "40 (or 35 with complications)", "None"]', 2, 'Most effective long-term treatment for severe obesity. (Harrison''s Ch. 394)'),
    (v_topic_id, '129: "GLP-1 Receptor Agonists" (e.g., Semaglutide) promote weight loss primarily by:', '["Diuresis", "Increasing satiety and slowing gastric emptying", "Burning fat directly", "None"]', 1, 'Highly effective for both DM and obesity. (Step-Up)'),
    (v_topic_id, '130: Central (Android) obesity is associated with higher risk than peripheral (Gynoid) obesity because:', '["It looks worse", "Visceral fat is more metabolically active and inflammatory", "It hurts more", "None"]', 1, '"Apple" vs "Pear" shape. (Pocket Medicine)');

    -- SECTION 14: PARATHYROID & CALCIUM
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '131: "Primary Hyperparathyroidism" is most commonly due to a:', '["Lung tumor", "Single Parathyroid Adenoma", "Kidney failure", "Vitamin D deficiency"]', 1, 'Presents with asymptomatic hypercalcemia. (Harrison''s Ch. 410)'),
    (v_topic_id, '132: "Secondary Hyperparathyroidism" is a normal response to:', '["High calcium", "Low calcium (usually from Vitamin D deficiency or CKD)", "Hyperthyroidism", "None"]', 1, 'Glands enlarge to try and raise calcium levels. (Step-Up)'),
    (v_topic_id, '133: "Hungry Bone Syndrome" is transient hypocalcemia that occurs after:', '["A high-fat meal", "Parathyroidectomy (for primary HPT)", "Running a marathon", "Diabetes"]', 1, 'Bones rapidly pull calcium out of the blood. (Pocket Medicine)'),
    (v_topic_id, '134: "Hypoparathyroidism" most commonly occurs after:', '["Infection", "Accidental removal or damage during neck surgery (e.g., Thyroidectomy)", "Lupus", "Smoking"]', 1, 'Leads to hypocalcemia and hyperphosphatemia. (Harrison''s Ch. 410)'),
    (v_topic_id, '135: "Pseudohypoparathyroidism" is characterized by resistance to ____ and a specific phenotype (Albright''s).', '["Insulin", "Parathyroid Hormone (PTH)", "TSH", "Cortisol"]', 1, 'PTH levels are actually high. (Step-Up)'),
    (v_topic_id, '136: What is the most common cause of "Hypocalcemia" overall?', '["Vitamin D deficiency", "Low Albumin (pseudohypocalcemia)", "Dialysis", "None"]', 1, 'Since ~50% of calcium is bound to albumin, low protein drops measured total Ca. (Pocket Medicine)'),
    (v_topic_id, '137: "Vitamin D" is activated (to 1,25-OH) in which organ?', '["Liver", "Kidney", "Skin", "Bones"]', 1, 'By the enzyme 1-alpha-hydroxylase. (Harrison''s Ch. 410)'),
    (v_topic_id, '138: "Osteomalacia" in adults and "Rickets" in children are caused by deficiency of:', '["Calcium only", "Vitamin D", "Iron", "Vitamin C"]', 1, 'Soft bones due to impaired mineralization. (Step-Up)'),
    (v_topic_id, '139: "Osteoporosis" is defined by a DEXA scan T-score of <= ____.', '["-1.0", "-2.0", "-2.5", "-3.0"]', 2, 'Increased risk of fragility fractures. (Pocket Medicine)'),
    (v_topic_id, '140: First-line medical treatment for Osteoporosis is:', '["Calcium only", "Bisphosphonates (e.g., Alendronate)", "Estrogen", "Vitamin C"]', 1, 'They inhibit osteoclast activity. (Harrison''s Ch. 411)');

    -- SECTION 15: BONE & MINERAL MISC
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '141: "Bisphosphonates" must be taken with a full glass of water while remaining upright to avoid:', '["Upset stomach", "Severe Esophagitis", "Kidney stones", "Dizziness"]', 1, 'Can cause direct mucosal irritation. (Step-Up)'),
    (v_topic_id, '142: "Paget Disease of Bone" is characterized by disordered bone remodeling and:', '["Low Alkaline Phosphatase", "Elevated Alkaline Phosphatase with normal Calcium/Phosphate", "High Calcium", "None"]', 1, 'Bones are large but weak/deformed. (Pocket Medicine)'),
    (v_topic_id, '143: Patients with Paget disease are at an increased (though rare) risk for:', '["Breast cancer", "Osteosarcoma", "Lymphoma", "Skin cancer"]', 1, 'Malignant transformation of bone. (Harrison''s Ch. 412)'),
    (v_topic_id, '144: "Denosumab" is a monoclonal antibody used for osteoporosis that targets:', '["PTH", "RANK Ligand", "Vitamin D receptor", "Calcium"]', 1, 'Prevents osteoclast maturation. (Step-Up)'),
    (v_topic_id, '145: "Teriparatide" is a recombinant ____ given intermittently to stimulate bone formation.', '["PTH", "Calcitonin", "Thyroxine", "Insulin"]', 0, 'Anabolic therapy. (Pocket Medicine)'),
    (v_topic_id, '146: "Osteogenesis Imperfecta" (Brittle Bone Disease) is due to a defect in:', '["Calcium", "Type 1 Collagen", "Vitamin D", "Osteoblasts"]', 1, 'Often associated with blue sclerae. (Harrison''s Ch. 412)'),
    (v_topic_id, '147: "Milk-Alkali Syndrome" is hypercalcemia, metabolic alkalosis, and renal failure due to:', '["Drinking milk only", "Excessive intake of Calcium Carbonate (antacids)", "Smoking", "Alcohol"]', 1, 'Rare now due to modern ulcer meds. (Step-Up)'),
    (v_topic_id, '148: "Familial Hypocalciuric Hypercalcemia (FHH)" is a benign condition that can mimic:', '["Hypothyroidism", "Primary Hyperparathyroidism", "Diabetes", "Cancer"]', 1, 'Requires checking 24-hour urine calcium to distinguish. (Pocket Medicine)'),
    (v_topic_id, '149: High "Calcitonin" levels are a tumor marker for:', '["Papillary thyroid cancer", "Medullary thyroid cancer", "Lung cancer", "Lymphoma"]', 1, 'Produced by C-cells. (Harrison''s Ch. 377)'),
    (v_topic_id, '150: Osteoporosis screening is recommended for all women starting at age:', '["40", "50", "65", "80"]', 2, 'Earlier if significant risk factors exist. (Step-Up)');

    -- SECTION 16: REPRODUCTIVE ENDOCRINOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '151: "Polycystic Ovary Syndrome" (PCOS) is characterized by hyperandrogenism, ovulatory dysfunction, and:', '["Low sugar", "Polycystic ovaries on US and Insulin Resistance", "High TSH", "Weight loss"]', 1, 'A common cause of infertility. (Harrison''s Ch. 391)'),
    (v_topic_id, '152: Which medication is often used in PCOS to treat both insulin resistance and promote ovulation?', '["Levothyroxine", "Metformin", "Clomiphene", "Both Metformin and Clomiphene are used"]', 3, 'Multifactorial management. (Step-Up)'),
    (v_topic_id, '153: "Kallmann Syndrome" is a form of hypogonadotropic hypogonadism associated with:', '["Blindness", "Anosmia (loss of smell)", "Deafness", "Heart defects"]', 1, 'Failure of GnRH neurons to migrate. (Pocket Medicine)'),
    (v_topic_id, '154: "Klinefelter Syndrome" (47, XXY) classically presents with:', '["Short stature", "Small/firm testes and tall stature", "High IQ", "Early baldness"]', 1, 'Primary hypogonadism. (Harrison''s Ch. 392)'),
    (v_topic_id, '155: "Turner Syndrome" (45, X) presents with streak ovaries and:', '["Tall stature", "Webbed neck and short stature", "High sugar", "No heart defects"]', 1, 'Often associated with bicuspid aortic valve and coarctation. (Step-Up)'),
    (v_topic_id, '156: "Hirsutism" in women refers to excess hair in a male-like pattern and is a sign of:', '["Estrogen excess", "Androgen excess", "Vitamin deficiency", "Old age"]', 1, 'Common in PCOS and CAH. (Pocket Medicine)'),
    (v_topic_id, '157: "Hypergonadotropic hypogonadism" implies the problem is in the:', '["Brain (Pituitary)", "Gonads (Testes/Ovaries)", "Adrenals", "Liver"]', 1, 'FSH/LH are high because the gonads are not responding. (Harrison''s Ch. 391)'),
    (v_topic_id, '158: "Gynecomastia" (breast tissue in men) can be caused by drugs like:', '["Aspirin", "Spironolactone", "Metformin", "Lisinopril"]', 1, '"S"pironolactone, "D"igitalis, "C"imetidine, "K"etoconazole (Some Drugs Create Awesome Knockers). (Step-Up)'),
    (v_topic_id, '159: "Primary Amenorrhea" is defined as the absence of menarche by age ____.', '["12", "15 (or 13 if no secondary sex characteristics)", "18", "21"]', 1, 'Requires thorough workup. (Pocket Medicine)'),
    (v_topic_id, '160: "Erectile Dysfunction" (ED) in a diabetic patient is often a combination of:', '["Psychological only", "Vascular disease and Autonomic Neuropathy", "Insulin allergy", "None"]', 1, 'A marker for underlying cardiovascular disease. (Harrison''s Ch. 396)');

    -- SECTION 17: MEN SYNDROMES & MISC
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '161: "MEN 1" (Wermer Syndrome) involves which three "P"s?', '["Pituitary, Parathyroid, Pancreas", "Prostate, Pituitary, Palate", "Pharynx, Penis, Parotid", "None"]', 0, 'Autosomal dominant inheritance. (Harrison''s Ch. 381)'),
    (v_topic_id, '162: "MEN 2A" (Sipple Syndrome) involves Medullary Thyroid Cancer, Pheochromocytoma, and:', '["Pituitary", "Parathyroid Hyperplasia", "Pancreas", "Prostate"]', 1, 'Associated with RET proto-oncogene. (Step-Up)'),
    (v_topic_id, '163: "MEN 2B" involves Medullary Thyroid Cancer, Pheochromocytoma, and:', '["Parathyroid", "Mucosal Neuromas and Marfanoid habitus", "Pituitary", "None"]', 1, 'Also associated with RET mutations. (Pocket Medicine)'),
    (v_topic_id, '164: "Carcinoid Syndrome" presents with flushing, diarrhea, and wheezing due to excess:', '["Insulin", "Serotonin", "Glucagon", "Cortisol"]', 1, 'Usually occurs when a neuroendocrine tumor metastasizes to the liver. (Harrison''s Ch. 380)'),
    (v_topic_id, '165: "Gastrinoma" (Zollinger-Ellison Syndrome) causes refractory peptic ulcers and is often part of:', '["MEN 1", "MEN 2A", "MEN 2B", "Cushing"]', 0, 'Excess gastrin secretion. (Step-Up)'),
    (v_topic_id, '166: "VIPoma" (WDHA syndrome) causes Watery Diarrhea, Hypokalemia, and:', '["Hypercalcemia", "Achlorhydria (low stomach acid)", "Jaundice", "Weight gain"]', 1, 'Vasoactive Intestinal Peptide tumor. (Pocket Medicine)');

    RAISE NOTICE 'SUCCESS: Endocrinology MCQ Part 2 (84-166) registered.';
END $$;

COMMIT;
