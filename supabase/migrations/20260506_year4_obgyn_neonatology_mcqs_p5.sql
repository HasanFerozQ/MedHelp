BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-neonatology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-neonatology not found.';
    END IF;

    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    -- Batch 5: 241-300 (Newborn Nutrition, Breastfeeding, and Metabolic Disorders)
    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('241: What is the primary carbohydrate found in human breast milk?', '["Glucose", "Lactose", "Sucrose", "Fructose"]', 1, 'Lactose provides about 40% of the energy in breast milk. (Williams)'),
    ('242: Which component of breast milk provides passive immunity by preventing bacterial adherence to gut mucosa?', '["Casein", "Secretory IgA", "Vitamin D", "Lactoferrin"]', 1, 'IgA is highly concentrated in colostrum. (Beckmann)'),
    ('243: "Colostrum" is the first milk produced after birth. How does it compare to mature milk?', '["Higher in fat, lower in protein", "Lower in fat, higher in protein and immunoglobulins", "Exactly the same", "Lower in protein, higher in water"]', 1, 'Produced in small volumes (2-20 mL per feed). (ACOG)'),
    ('244: What is the only vitamin that is typically DEFICIENT in breast milk and requires supplementation for the infant?', '["Vitamin K", "Vitamin D (400 IU daily recommended)", "Vitamin B12", "Vitamin C"]', 1, 'Necessary to prevent rickets, especially in dark-skinned or less sun-exposed infants. (AAP)'),
    ('245: Iron supplementation is generally recommended for exclusively breastfed term infants starting at what age?', '["Birth", "2 months", "4 months", "6 months"]', 2, 'Iron stores are usually sufficient for the first 4 months of life. (AAP)'),
    ('246: Which maternal infection is an absolute contraindication to breastfeeding in the United States?', '["Hepatitis B", "Hepatitis C", "HIV", "Mastitis"]', 2, 'Vertical transmission via milk is a significant risk. (ACOG)'),
    ('247: Can a mother with an active Herpes Simplex Virus (HSV) lesion on her breast breastfeed?', '["Yes, it is safe", "No, breastfeeding from the affected breast is contraindicated until the lesion resolves", "Only if she takes acyclovir", "Only if the baby is treated"]', 1, 'Direct contact with the lesion can transmit the virus to the neonate. (Williams)'),
    ('248: Is "Mastitis" a contraindication to breastfeeding?', '["Yes", "No, breastfeeding should continue to help drain the breast and prevent abscess", "Only if she has a fever", "Only if it is bilateral"]', 1, 'Frequent emptying is part of the treatment for mastitis. (Beckmann)'),
    ('249: Most medications are compatible with breastfeeding. Which of the following is generally contraindicated?', '["Ibuprofen", "Acetaminophen", "Lithium and Radioactive isotopes", "Penicillin"]', 2, 'Lithium has a high infant-to-maternal plasma ratio. (ACOG)'),
    ('250: "Breastfeeding Jaundice" (early onset) is primarily due to:', '["Dehydration and poor caloric intake leading to increased enterohepatic circulation", "Enzymes in the milk", "Hemolysis", "Biliary atresia"]', 0, 'Occurs in the first few days of life before the milk "comes in". (Williams)'),
    ('251: Treatment for Breastfeeding Jaundice?', '["Stop breastfeeding", "Supplement with water", "Increase breastfeeding frequency (8-12 times per day) and improve latch", "Give formula only"]', 2, 'Frequent feeding promotes stooling to excrete bilirubin. (Beckmann)'),
    ('252: "Breast Milk Jaundice" (late onset) usually peaks at 2 weeks. Pathophysiology involves:', '["Infection", "Inhibition of bilirubin conjugation by factors in mature milk (e.g., glucuronidase)", "Hemolysis", "Gallstones"]', 1, 'Usually benign and does not require stopping breastfeeding unless levels are extreme. (Williams)'),
    ('253: How is Breast Milk Jaundice diagnosed?', '["Liver biopsy", "Briefly pausing breastfeeding for 24 hours (if levels are high) and observing a rapid drop in bilirubin", "Blood test for infection", "Ultrasound"]', 1, 'Not always necessary but can be used as a diagnostic/therapeutic maneuver. (Beckmann)'),
    ('254: In "Phenylketonuria" (PKU), the infant lacks the enzyme to convert _____ to _____.', '["Phenylalanine to Tyrosine", "Tyrosine to Phenylalanine", "Glucose to Galactose", "Galactose to Glucose"]', 0, 'Leads to toxic accumulation of phenylalanine. (Williams)'),
    ('255: Classic symptom of untreated PKU?', '["Seizures", "Intellectual disability, \"mousy\" or \"musty\" odor, and fair skin/hair", "Liver failure", "Jaundice"]', 1, 'Musty odor is due to phenylacetic acid in sweat and urine. (Beckmann)'),
    ('256: Treatment for PKU?', '["No protein", "Low-phenylalanine diet (restricting meat, dairy, nuts) started early in life", "High protein diet", "Vitamin supplementation"]', 1, 'Dietary restriction is the mainstay. (ACOG)'),
    ('257: Congenital Hypothyroidism is most commonly caused by:', '["Maternal iodine deficiency", "Thyroid dysgenesis (failure of the gland to develop properly)", "Autoimmune destruction", "Pituitary tumor"]', 1, 'Detected on newborn screening. (Williams)'),
    ('258: Classic features of a "Cretin" (untreated congenital hypothyroidism)?', '["Macroglossia (large tongue), umbilical hernia, hypotonia, and coarse facial features", "Small tongue, microcephaly", "Hyperactivity", "Tall stature"]', 0, 'Early treatment with levothyroxine prevents intellectual disability. (Beckmann)'),
    ('259: "Galactosemia" is caused by a deficiency of:', '["Lactase", "Galactose-1-phosphate uridyltransferase (GALT)", "Glucokinase", "Amylase"]', 1, 'Accumulation of galactose-1-phosphate is toxic. (Williams)'),
    ('260: Clinical presentation of Galactosemia within days of starting milk?', '["Cataracts, jaundice, hepatomegaly, and E. coli sepsis", "Fever only", "Diarrhea", "Normal growth"]', 0, 'A neonatal medical emergency. (Beckmann)'),
    ('261: Why is "E. coli" sepsis common in babies with Galactosemia?', '["High glucose levels", "Inhibition of neutrophil function by galactose metabolites", "Contaminated milk", "None"]', 1, 'Direct toxic effect on the immune system. (Williams)'),
    ('262: "Maple Syrup Urine Disease" is a defect in the metabolism of:', '["Sulfur amino acids", "Branched-chain amino acids (Leucine, Isoleucine, Valine)", "Aromatic amino acids", "Lipids"]', 1, 'Urine smells like maple syrup. (Beckmann)'),
    ('263: Newborns with Maple Syrup Urine Disease present with:', '["Vomiting, lethargy, and encephalopathy (dystonia/seizures) in the first week", "Slow growth", "Heart failure", "Rash"]', 0, 'Requires strict dietary management. (Williams)'),
    ('264: "Homocystinuria" can present in the neonate but is often diagnosed later. Key features include:', '["Short stature", "Marfanoid habitus, lens subluxation (downward), and risk of thromboembolism", "Bleeding", "Blindness"]', 1, 'High levels of homocysteine are toxic to the vasculature. (Beckmann)'),
    ('265: "Medium-Chain Acyl-CoA Dehydrogenase (MCAD) Deficiency" is a disorder of:', '["Protein breakdown", "Carbohydrate metabolism", "Fatty acid oxidation", "Nucleic acid synthesis"]', 2, 'The infant cannot utilize fat for energy during fasting. (Williams)'),
    ('266: Life-threatening presentation of MCAD Deficiency?', '["Hypoketotic hypoglycemia triggered by fasting (e.g., during a viral illness)", "Hyperglycemia", "Fever", "Anemia"]', 0, 'Infants must avoid prolonged fasting. (Beckmann)'),
    ('267: Congenital Adrenal Hyperplasia (CAH) is most commonly due to deficiency of:', '["11-beta hydroxylase", "21-hydroxylase", "17-alpha hydroxylase", "Aromatase"]', 1, 'Leads to salt-wasting and virilization in females. (ACOG)'),
    ('268: A newborn female with ambiguous genitalia and electrolyte abnormalities (Low Na+, High K+) should be evaluated for:', '["Turner syndrome", "21-hydroxylase deficiency CAH", "Androgen insensitivity", "PCOS"]', 1, 'Excess androgens cause virilization; lack of aldosterone causes salt-wasting. (Williams)'),
    ('269: Screening for CAH in the newborn involves measuring:', '["17-hydroxyprogesterone", "Cortisol", "Testosterone", "Aldosterone"]', 0, 'High levels of the precursor indicate the enzyme block. (Beckmann)'),
    ('270: "Cystic Fibrosis" (CF) is an autosomal recessive disorder of:', '["Sodium channels", "Chloride channels (CFTR protein)", "Potassium channels", "Calcium channels"]', 1, 'Leads to thick, viscous secretions in the lungs and pancreas. (Williams)'),
    ('271: The earliest clinical sign of CF in a neonate (seen in ~15%) is:', '["Pneumonia", "Meconium ileus (failure to pass stool, bowel obstruction)", "Diabetes", "Salty skin"]', 1, 'Thick meconium gets stuck in the ileum. (Beckmann)'),
    ('272: How is Cystic Fibrosis screened for in the newborn panel?', '["Sweat test", "Immunoreactive Trypsinogen (IRT)", "Stool culture", "X-ray"]', 1, 'Elevated IRT warrants further genetic testing or a sweat test. (AAP)'),
    ('273: "Retinopathy of Prematurity" (ROP) is primarily caused by:', '["Infection", "Oxygen toxicity and disorganized retinal vascular growth", "Genetic defect", "Trauma"]', 1, 'Risk is highest in extremely low birth weight infants. (Williams)'),
    ('274: "Bronchopulmonary Dysplasia" (BPD) is chronic lung disease of the newborn defined by:', '["Oxygen requirement at 36 weeks post-menstrual age", "Pneumonia", "Surfactant use", "Apgar score"]', 0, 'Result of lung injury from mechanical ventilation and oxygen. (Beckmann)'),
    ('275: "Intraventricular Hemorrhage" (IVH) in premature infants typically originates in the:', '["Cerebral cortex", "Germinal matrix", "Brainstem", "Spinal cord"]', 1, 'This highly vascular area is fragile in the preterm brain. (Williams)'),
    ('276: How is IVH screened for in premature infants (< 32 weeks)?', '["CT scan", "Cranial Ultrasound through the fontanelle", "MRI", "EEG"]', 1, 'Performed routinely at 1 week of life. (Beckmann)'),
    ('277: "Periventricular Leukomalacia" (PVL) is a complication of prematurity involving:', '["Bleeding", "Ischemic white matter injury around the ventricles", "Tumor", "Infection"]', 1, 'Major risk factor for spastic diplegia (cerebral palsy). (Williams)'),
    ('278: What is the most common cause of neonatal seizures?', '["Genetic syndromes", "Hypoxic-Ischemic Encephalopathy (HIE)", "Hypoglycemia", "Infection"]', 1, 'Due to perinatal asphyxia. (ACOG)'),
    ('279: Treatment for moderate-to-severe HIE in term infants to improve neurologic outcomes?', '["High-dose steroids", "Therapeutic Hypothermia (Cooling to 33.5C for 72 hours)", "Immediate surgery", "Phenobarbital only"]', 1, 'Cooling reduces secondary brain injury. (Williams)'),
    ('280: Therapeutic hypothermia for HIE must be started within what timeframe after birth?', '["First 6 hours", "First 24 hours", "First week", "Anytime"]', 0, 'The window for neuroprotection is narrow. (Beckmann)'),
    ('281: "Apgar" score of 10 is:', '["Impossible", "Perfect (rarely achieved due to acrocyanosis)", "Required for discharge", "Normal for all babies"]', 1, 'Acrocyanosis (Appearance = 1) is common in healthy babies at 1 and 5 minutes. (ACOG)'),
    ('282: If the 5-minute Apgar score is less than ___, the score should be repeated every 5 minutes.', '["3", "5", "7", "9"]', 2, 'Routine follow-up for depressed neonates. (Williams)'),
    ('283: Low Apgar scores alone (without blood gas/clinical correlation) can definitively diagnose birth asphyxia?', '["Yes", "No", "Only if score is zero", "Only in preemies"]', 1, 'Apgar is an assessment of transition, not a diagnosis of long-term prognosis. (ACOG)'),
    ('284: "Periodic Breathing" in a newborn is:', '["Always pathologic", "Normal (brief pauses in breathing < 15 seconds followed by tachypnea)", "A sign of sepsis", "A sign of heart failure"]', 1, 'Common in newborns, especially preemies. (Beckmann)'),
    ('285: "Apnea of Prematurity" is defined as pauses in breathing for > ____ seconds.', '["5", "10", "20 (or shorter if accompanied by bradycardia or cyanosis)", "60"]', 2, 'Requires monitoring and often treatment. (Williams)'),
    ('286: First-line medication to treat Apnea of Prematurity?', '["Albuterol", "Caffeine citrate", "Epinephrine", "Dopamine"]', 1, 'Caffeine stimulates the respiratory center in the brain. (Beckmann)'),
    ('287: "Harlequin Color Change" in a neonate is:', '["Sign of shock", "Transient, benign vasomotor instability where half the body is red and half is pale", "Skin infection", "Cyanosis"]', 1, 'Common and harmless. (Williams)'),
    ('288: "Erythema Toxicum Neonatorum" appears as:', '["Yellow pustules on an erythematous base appearing on day 2-3", "Blisters", "Bruising", "Warts"]', 0, 'Benign rash containing eosinophils. No treatment needed. (Beckmann)'),
    ('289: "Milia" are:', '["Heat rash", "Small white papules (keratin cysts) on the nose/cheeks", "Acne", "Infection"]', 1, 'Found in ~50% of newborns; resolve spontaneously. (Williams)'),
    ('290: "Mongolian Spots" (Congenital Dermal Melanocytosis) are:', '["Cancerous", "Blue-grey macules usually over the sacrum/buttocks (melanocytes in the dermis)", "Signs of abuse", "Birthmarks that never fade"]', 1, 'Common in darker-skinned infants; important to document to distinguish from bruises. (ACOG)'),
    ('291: "Nevus Simplex" (Stork bite / Salmon patch) is usually located on:', '["The trunk", "Nape of neck, eyelids, or glabella", "Feet", "Arms"]', 1, 'Transient capillary hemangiomas. (Beckmann)'),
    ('292: "Nevus Flammeus" (Port-Wine Stain) that follows the trigeminal nerve distribution may be associated with:', '["Sturge-Weber Syndrome", "Neurofibromatosis", "Down syndrome", "No syndromes"]', 0, 'Can involve intracranial vascular malformations and glaucoma. (Williams)'),
    ('293: A "pilonidal dimple" with a tuft of hair over the sacrum should be evaluated for:', '["Sepsis", "Occult Spinal Dysraphism (Spina bifida occulta)", "Constipation", "Nothing"]', 1, 'Ultrasound is the initial screening test. (Beckmann)'),
    ('294: Most common cause of "ambiguous genitalia" in a 46,XX newborn?', '["Mullerian agenesis", "Congenital Adrenal Hyperplasia (CAH)", "AIS", "Turner syndrome"]', 1, 'Due to virilization from adrenal androgens. (ACOG)'),
    ('295: "Hypospadias" is a condition where the urethral meatus is on the:', '["Dorsal (top) side of the penis", "Ventral (under) side of the penis", "Tip of the glans", "Scrotum only"]', 1, 'Circumcision should be deferred as the foreskin may be needed for surgical repair. (Williams)'),
    ('296: "Epispadias" (meatus on the dorsal side) is often associated with:', '["Undescended testes", "Bladder exstrophy", "Renal failure", "Hydrocele"]', 1, 'More severe than hypospadias. (Beckmann)'),
    ('297: "Cryptorchidism" (undescended testis) should be surgically corrected (orchiopexy) if it has not descended by:', '["1 month", "6-12 months", "Puberty", "Never"]', 1, 'Early correction reduces risk of infertility and malignancy. (Williams)'),
    ('298: Most common cause of a "palpable abdominal mass" in a newborn?', '["Neuroblastoma", "Renal anomaly (e.g., multicystic dysplastic kidney or hydronephrosis)", "Wilms tumor", "Ovarian cyst"]', 1, 'Ultrasound is the first-line diagnostic test. (Beckmann)'),
    ('299: A newborn has a "single umbilical artery" (SUA) instead of two. Management?', '["Ignore", "Screen for other anomalies (especially renal and cardiac) with physical exam and potentially ultrasound", "Immediate surgery", "Blood test"]', 1, 'Found in ~1% of singletons; often an isolated finding but warrants careful exam. (ACOG)'),
    ('300: What is the most common fracture sustained during birth?', '["Femur", "Clavicle", "Skull", "Humerus"]', 1, 'Usually associated with shoulder dystocia. (Williams)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;
END $$;
COMMIT;
