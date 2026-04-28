-- Migration: Year 3 - Nephrology MCQ Bank (PART 2: 81-160)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'nephrology' LIMIT 1;

    -- SECTION 9: SODIUM DISORDERS (HYPONATREMIA)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '81: Hyponatremia is defined as a serum sodium level less than:', '["120 mEq/L", "135 mEq/L", "145 mEq/L", "150 mEq/L"]', 1, 'The most common electrolyte disorder in hospitalized patients. (Harrison''s Ch. 49)'),
    (v_topic_id, '82: "Pseudohyponatremia" (normal serum osmolality) is often caused by severe:', '["Dehydration", "Hyperlipidemia or Hyperproteinemia", "Diabetes", "Beer potomania"]', 1, 'Solids displace water in the sample, but the osmolality remains normal. (Step-Up)'),
    (v_topic_id, '83: "Hypertonic Hyponatremia" (high osmolality) is most commonly due to:', '["Volume overload", "Hyperglycemia", "Heart failure", "Liver failure"]', 1, 'Glucose pulls water into the extracellular space, diluting sodium. (Pocket Medicine)'),
    (v_topic_id, '84: In "Hypovolemic Hyponatremia", if urine sodium is < 20 mEq/L, the source of fluid loss is likely:', '["Kidneys (Diuretics)", "Extra-renal (GI loss, skin, third-spacing)", "Brain", "Normal"]', 1, 'The kidneys are retaining sodium appropriately. (Step-Up)'),
    (v_topic_id, '85: "SIADH" (Syndrome of Inappropriate ADH) presents as which type of hyponatremia?', '["Hypovolemic", "Euvolemic", "Hypervolemic", "Hypertonic"]', 1, 'Water is retained, but volume status appears normal clinically. (Harrison''s Ch. 49)'),
    (v_topic_id, '86: A common cause of SIADH is:', '["Dehydration", "Small Cell Lung Cancer", "Diabetes Insipidus", "Addison''s disease"]', 1, 'Paraneoplastic production of ADH. (Pocket Medicine)'),
    (v_topic_id, '87: What is the most feared complication of CORRECTING hyponatremia too rapidly?', '["Cerebral Edema", "Osmotic Demyelination Syndrome (Central Pontine Myelinolysis)", "Heart failure", "Seizures"]', 1, '"From low to high, the pons will die." (Step-Up)'),
    (v_topic_id, '88: The recommended maximum rate of sodium correction is ____ mEq/L in 24 hours.', '["2", "6-8", "15", "20"]', 1, 'To prevent irreversible brain damage. (Harrison''s Ch. 49)'),
    (v_topic_id, '89: "Hypervolemic Hyponatremia" (with edema) is seen in:', '["Heart failure, Cirrhosis, and Nephrotic syndrome", "Dehydration", "SIADH", "Adrenal insufficiency"]', 0, 'Effective arterial blood volume is low, triggering ADH. (Pocket Medicine)'),
    (v_topic_id, '90: The first-line treatment for euvolemic hyponatremia (SIADH) is usually:', '["IV Normal Saline", "Fluid restriction", "Diuretics", "Vasopressin"]', 1, 'Limiting intake allows the body to clear excess water. (Step-Up)');

    -- SECTION 10: SODIUM DISORDERS (HYPERNATREMIA)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '91: Hypernatremia is defined as a serum sodium level greater than:', '["140 mEq/L", "145 mEq/L", "155 mEq/L", "160 mEq/L"]', 1, 'Always indicates a state of relative water deficit (hyperosmolality). (Harrison''s Ch. 49)'),
    (v_topic_id, '92: "Central Diabetes Insipidus" (DI) is due to a deficiency of:', '["Insulin", "ADH (Vasopressin) production", "Aldosterone", "Glucose"]', 1, 'Often follows head trauma or brain surgery. (Step-Up)'),
    (v_topic_id, '93: "Nephrogenic DI" occurs when the kidneys are ____ to ADH.', '["Hypersensitive", "Resistant", "Unconnected", "Normal"]', 1, 'Often caused by drugs like Lithium. (Pocket Medicine)'),
    (v_topic_id, '94: Which medication is the most common cause of Nephrogenic DI?', '["Aspirin", "Lithium", "Lisinopril", "Metformin"]', 1, 'Interferes with aquaporin insertion in the collecting duct. (Harrison''s Ch. 49)'),
    (v_topic_id, '95: In the "Water Deprivation Test," if urine osmolality increases after Desmopressin (dDAVP), the diagnosis is:', '["Nephrogenic DI", "Central DI", "Primary Polydipsia", "Normal"]', 1, 'The kidneys respond to the exogenous ADH they were missing. (Step-Up)'),
    (v_topic_id, '96: Correcting hypernatremia too RAPIDLY can cause:', '["Demyelination", "Cerebral Edema", "Kidney stones", "Anemia"]', 1, 'Water rushes into brain cells as osmolality drops. (Pocket Medicine)'),
    (v_topic_id, '97: What is the preferred fluid for treating hypernatremia with a "free water deficit"?', '["Normal Saline (0.9%)", "5% Dextrose in Water (D5W)", "Albumin", "3% Saline"]', 1, 'D5W is effectively free water once the glucose is metabolized. (Harrison''s Ch. 49)'),
    (v_topic_id, '98: "Skin tenting" and dry mucous membranes in hypernatremia suggest:', '["Overhydration", "Volume depletion (Hypovolemia)", "Liver failure", "Normal finding"]', 1, 'Physical signs of dehydration. (Step-Up)'),
    (v_topic_id, '99: The "Free Water Deficit" calculation uses which variable?', '["Body Weight, Serum Sodium, and Total Body Water (TBW)", "Height", "Age alone", "Heart rate"]', 0, 'Helps guide the volume of fluid replacement. (Pocket Medicine)'),
    (v_topic_id, '100: "Primary Polydipsia" presents with low sodium and ____ urine.', '["Concentrated", "Dilute (low osmolality)", "Bloody", "High protein"]', 1, 'The body is trying to excrete the massive water load. (Harrison''s Ch. 49)');

    -- SECTION 11: POTASSIUM DISORDERS (HYPERKALEMIA)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '101: What is the most serious complication of hyperkalemia?', '["Muscle cramps", "Lethal Cardiac Arrhythmias", "Diarrhea", "Cough"]', 1, 'Can lead to ventricular fibrillation or asystole. (Harrison''s Ch. 50)'),
    (v_topic_id, '102: "Peaked T-waves" on EKG are the earliest sign of:', '["Hypokalemia", "Hyperkalemia", "Heart attack", "Low calcium"]', 1, 'Followed by PR prolongation and widening of the QRS. (Step-Up)'),
    (v_topic_id, '103: "Pseudohyperkalemia" can occur due to:', '["Eating a banana", "Hemolysis during blood draw", "Diabetes", "Fasting"]', 1, 'Potassium is released from broken red cells in the tube. (Pocket Medicine)'),
    (v_topic_id, '104: Which class of blood pressure medications is a common cause of hyperkalemia?', '["Calcium channel blockers", "ACE Inhibitors/ARBs", "Diuretics like Furosemide", "Beta-blockers"]', 1, 'They inhibit aldosterone-mediated potassium excretion. (Step-Up)'),
    (v_topic_id, '105: What is the FIRST step in treating severe hyperkalemia with EKG changes?', '["Insulin + Glucose", "IV Calcium Gluconate (or Calcium Chloride)", "Albuterol", "Dialysis"]', 1, 'Calcium stabilizes the cardiac membrane but does not lower potassium. (Harrison''s Ch. 50)'),
    (v_topic_id, '106: "Insulin and Glucose" treatment for hyperkalemia works by:', '["Removing K+ from the body", "Shifting K+ into the cells", "Excreting K+ in urine", "Neutralizing K+"]', 1, 'Stimulates the Na-K ATPase pump. (Pocket Medicine)'),
    (v_topic_id, '107: "Sodium Polystyrene Sulfonate" (Kayexalate) and "Patiromer" work by:', '["Shifting K+", "Binding K+ in the GI tract for excretion", "Diluting K+", "None"]', 1, 'Potassium binders used for total body removal. (Step-Up)'),
    (v_topic_id, '108: Which acid-base state promotes hyperkalemia?', '["Metabolic Alkalosis", "Metabolic Acidosis", "Respiratory Alkalosis", "None"]', 1, 'H+ ions enter cells, and K+ ions move out to maintain neutrality. (Harrison''s Ch. 50)'),
    (v_topic_id, '109: "Sine wave" pattern on EKG is a sign of:', '["Mild hyperkalemia", "Critical/Severe Hyperkalemia", "Normal heart", "Hypocalcemia"]', 1, 'Impending cardiac arrest. (Pocket Medicine)'),
    (v_topic_id, '110: "Addison''s Disease" (Adrenal insufficiency) causes hyperkalemia due to low levels of:', '["Cortisol only", "Aldosterone", "Thyroid hormone", "Insulin"]', 1, 'Aldosterone is required for K+ excretion. (Step-Up)');

    -- SECTION 12: POTASSIUM DISORDERS (HYPOKALEMIA)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '111: "U-waves" on an EKG are characteristic of:', '["Hyperkalemia", "Hypokalemia", "Hypertension", "Hypercalcemia"]', 1, 'Also causes ST depression and flat T-waves. (Harrison''s Ch. 50)'),
    (v_topic_id, '112: Which of the following is a common cause of hypokalemia?', '["Renal failure", "Diuretics (Loop/Thiazide) or GI loss (vomiting/diarrhea)", "ACE inhibitors", "Spironolactone"]', 1, 'Increased potassium wasting. (Step-Up)'),
    (v_topic_id, '113: Refractory hypokalemia (difficult to correct) should prompt a check of which other electrolyte?', '["Sodium", "Magnesium", "Calcium", "Phosphate"]', 1, 'Low magnesium prevents K+ reabsorption in the tubules. (Pocket Medicine)'),
    (v_topic_id, '114: "Conn Syndrome" (Primary Hyperaldosteronism) classically presents with:', '["Hypotension and Hyperkalemia", "Hypertension and Hypokalemia", "Weight loss", "Anemia"]', 1, 'Excessive sodium retention and potassium wasting. (Step-Up)'),
    (v_topic_id, '115: High-dose Albuterol can cause hypokalemia by:', '["Direct loss in urine", "Intracellular shifting", "Vomiting", "None"]', 1, 'Beta-2 stimulation shifts K+ into cells. (Harrison''s Ch. 50)'),
    (v_topic_id, '116: Severe hypokalemia can lead to which muscle complication?', '["Hypertrophy", "Paralysis and Rhabdomyolysis", "Cramps only", "None"]', 1, 'Low K+ impairs muscle contraction and blood flow. (Pocket Medicine)'),
    (v_topic_id, '117: What is the safest route for potassium replacement in a stable patient?', '["IV push (bolus)", "Oral", "Central line only", "None"]', 1, 'Oral K+ is safest; IV K+ must be slow and diluted. (Step-Up)'),
    (v_topic_id, '118: "Liddle Syndrome" is a genetic disorder that mimics:', '["Hyperaldosteronism (Hypertension/Hypokalemia)", "Addison''s", "Diabetes", "Heart failure"]', 0, 'Due to overactive ENaC channels in the collecting duct. (Harrison''s Ch. 50)'),
    (v_topic_id, '119: Hypokalemia causes which acid-base disturbance?', '["Metabolic Acidosis", "Metabolic Alkalosis", "Respiratory Acidosis", "Normal-gap acidosis"]', 1, 'K+ shifts out of cells, and H+ shifts in; also triggers H+ excretion in urine. (Pocket Medicine)'),
    (v_topic_id, '120: "Licorice" ingestion can cause hypokalemia by inhibiting:', '["Insulin", "11-beta-hydroxysteroid dehydrogenase (leads to cortisol acting like aldosterone)", "ACE", "Renin"]', 1, 'Pseudohyperaldosteronism. (Step-Up)');

    -- SECTION 13: ACID-BASE DISORDERS (METABOLIC ACIDOSIS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '121: The "Anion Gap" (AG) is calculated using which formula?', '["Na - (Cl + HCO3)", "Na + K - Cl", "Cl - HCO3", "None"]', 0, 'Normal range is typically 8-12. (Harrison''s Ch. 51)'),
    (v_topic_id, '122: Which mnemonic is used for High Anion Gap Metabolic Acidosis (HAGMA)?', '["MUDPILES (or GOLDMARK)", "HARDUP", "ABCD", "VOMIT"]', 0, 'Methanol, Uremia, DKA, Propylene glycol, INH/Iron, Lactic acid, Ethylene glycol, Salicylates. (Step-Up)'),
    (v_topic_id, '123: "Lactic Acidosis" is most commonly caused by:', '["Diabetes", "Tissue Hypoperfusion/Shock (Type A) or Liver failure", "Diarrhea", "Vomiting"]', 1, 'Inadequate oxygen delivery to tissues. (Pocket Medicine)'),
    (v_topic_id, '124: "Winter''s Formula" is used to determine if ____ compensation is appropriate in metabolic acidosis.', '["Renal", "Respiratory (CO2)", "Hepatic", "None"]', 1, 'Predicts the expected PaCO2. (Harrison''s Ch. 51)'),
    (v_topic_id, '125: "Normal Anion Gap" (Non-gap) Metabolic Acidosis is most commonly caused by:', '["Toxins", "Diarrhea or Renal Tubular Acidosis (RTA)", "DKA", "Starvation"]', 1, 'Loss of bicarbonate instead of addition of new acid. (Step-Up)'),
    (v_topic_id, '126: "Type 1 RTA" (Distal) is characterized by the inability to:', '["Reabsorb Glucose", "Secrete H+ in the distal tubule", "Reabsorb Bicarbonate in proximal tubule", "Excrete Potassium"]', 1, 'Leads to high urine pH (>5.5) and hypokalemia. (Harrison''s Ch. 312)'),
    (v_topic_id, '127: "Type 2 RTA" (Proximal) is a defect in:', '["H+ secretion", "Bicarbonate reabsorption", "Renin production", "Water handling"]', 1, 'Often associated with Fanconi Syndrome. (Pocket Medicine)'),
    (v_topic_id, '128: "Type 4 RTA" is unique because it is associated with:', '["Hypokalemia", "Hyperkalemia", "Low blood pressure", "Kidney stones"]', 1, 'Due to Hypoaldosteronism or resistance to aldosterone. (Step-Up)'),
    (v_topic_id, '129: Salicylate (Aspirin) overdose classically presents with which mixed acid-base disorder?', '["Metabolic Acidosis only", "Metabolic Alkalosis and Respiratory Acidosis", "High Anion-Gap Metabolic Acidosis and Respiratory Alkalosis", "None"]', 2, 'Aspirin stimulates the respiratory center AND adds acid. (Harrison''s Ch. 51)'),
    (v_topic_id, '130: "Kussmaul breathing" (deep, rapid breaths) is a compensatory response to:', '["Respiratory Alkalosis", "Severe Metabolic Acidosis (e.g., DKA)", "Heart failure", "Asthma"]', 1, 'The body is trying to "blow off" CO2 to raise pH. (Pocket Medicine)');

    -- SECTION 14: ACID-BASE DISORDERS (ALKALOSIS & RESPIRATORY)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '131: Metabolic Alkalosis is often maintained by which state?', '["Volume overload", "Volume depletion and Hypochloremia", "High potassium", "Renal failure"]', 1, 'Contraction alkalosis. (Harrison''s Ch. 51)'),
    (v_topic_id, '132: "Chloride-Responsive" metabolic alkalosis is usually due to:', '["Vomiting or Diuretics", "Hyperaldosteronism", "Liddle syndrome", "Eating salt"]', 0, 'Urine chloride is low (<20); responds to saline. (Step-Up)'),
    (v_topic_id, '133: Respiratory Acidosis is defined by a ____ PaCO2.', '["Low (<35)", "High (>45)", "Normal", "None"]', 1, 'Due to hypoventilation (e.g., COPD, Opioids). (Pocket Medicine)'),
    (v_topic_id, '134: Respiratory Alkalosis is defined by a ____ PaCO2.', '["Low (<35)", "High (>45)", "Normal", "None"]', 0, 'Due to hyperventilation (e.g., Anxiety, PE, early Aspirin). (Step-Up)'),
    (v_topic_id, '135: The kidneys compensate for chronic respiratory ACIDOSIS by:', '["Excreting Bicarbonate", "Retaining Bicarbonate", "Lowering pH", "Breathing faster"]', 1, 'Takes 3-5 days to fully compensate. (Harrison''s Ch. 51)'),
    (v_topic_id, '136: "Acetazolamide" (Carbonic Anhydrase inhibitor) is used to treat which acid-base state?', '["Metabolic Acidosis", "Metabolic Alkalosis (e.g., from heart failure therapy)", "Respiratory Acidosis", "None"]', 1, 'Promotes bicarbonate excretion in urine. (Pocket Medicine)'),
    (v_topic_id, '137: "Delta-Delta" (Change in AG / Change in HCO3) is used to check for:', '["COPD", "Mixed acid-base disorders in HAGMA", "Kidney stones", "Diabetes"]', 1, 'Checks if there is an additional non-gap acidosis or metabolic alkalosis. (Step-Up)'),
    (v_topic_id, '138: "Opiate overdose" classically causes:', '["Respiratory Alkalosis", "Respiratory Acidosis", "Metabolic Alkalosis", "None"]', 1, 'Depression of the respiratory drive. (Harrison''s Ch. 51)'),
    (v_topic_id, '139: In Metabolic Alkalosis, "Urine Chloride > 40 mEq/L" (Chloride-Resistant) suggests:', '["Vomiting", "Mineralocorticoid excess (e.g., Conn Syndrome)", "Dehydration", "Normal"]', 1, 'Does not respond to saline alone. (Pocket Medicine)'),
    (v_topic_id, '140: A patient has pH 7.20, PaCO2 20, and HCO3 8. This is:', '["Respiratory Acidosis", "Metabolic Acidosis with partial compensation", "Metabolic Alkalosis", "Normal"]', 1, 'Primary problem is low bicarb (acidosis). (Step-Up)');

    -- SECTION 15: CALCIUM, MAGNESIUM & PHOSPHATE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '141: What is the most common cause of "Hypercalcemia" in outpatient settings?', '["Malignancy", "Primary Hyperparathyroidism", "Vitamin D", "Milk"]', 1, 'Usually due to a parathyroid adenoma. (Harrison''s Ch. 410)'),
    (v_topic_id, '142: What is the most common cause of "Hypercalcemia" in hospitalized patients?', '["Primary Hyperparathyroidism", "Malignancy (e.g., PTHrP or bone mets)", "Sarcoidosis", "Thiazides"]', 1, 'Often indicates a poor prognosis. (Step-Up)'),
    (v_topic_id, '143: "Chvostek sign" and "Trousseau sign" are clinical markers of:', '["Hypercalcemia", "Hypocalcemia", "Hypermagnesemia", "Low sodium"]', 1, 'Signs of neuromuscular irritability (tetany). (Pocket Medicine)'),
    (v_topic_id, '144: "Shortened QT interval" on EKG is seen in:', '["Hypocalcemia", "Hypercalcemia", "Hyperkalemia", "Low magnesium"]', 1, '"Stones, Bones, Groans, and Psychic Overtones." (Harrison''s Ch. 410)'),
    (v_topic_id, '145: "Prolonged QT interval" is a feature of:', '["Hypercalcemia", "Hypocalcemia", "Hyperthyroidism", "None"]', 1, 'Increases risk for Torsades de Pointes. (Step-Up)'),
    (v_topic_id, '146: What is the first-line treatment for severe hypercalcemic crisis?', '["Steroids", "Aggressive IV fluids (Normal Saline) and Bisphosphonates", "Dialysis", "Calcitonin only"]', 1, 'Saline promotes calcium excretion. (Pocket Medicine)'),
    (v_topic_id, '147: Severe hypomagnesemia can cause:', '["Hypercalcemia", "Hypocalcemia (due to PTH resistance)", "Hypernatremia", "None"]', 1, 'Must correct magnesium before calcium can normalize. (Harrison''s Ch. 50)'),
    (v_topic_id, '148: "Refeeding Syndrome" is a life-threatening shift of which electrolyte?', '["Sodium", "Phosphate (causing severe hypophosphatemia)", "Calcium", "Chloride"]', 1, 'Insulin release moves phosphate into cells. (Step-Up)'),
    (v_topic_id, '149: "Hypermagnesemia" (usually from laxative abuse in CKD) classically causes:', '["Seizures", "Loss of Deep Tendon Reflexes (DTRs) and Respiratory Depression", "Hypertension", "Tachycardia"]', 1, 'Acts as a muscle relaxant. (Pocket Medicine)'),
    (v_topic_id, '150: High serum Phosphorus (Hyperphosphatemia) is a hallmark of:', '["Alcoholism", "Advanced Chronic Kidney Disease", "Starvation", "Vitamin D deficiency"]', 1, 'Kidneys cannot excrete the dietary load. (Harrison''s Ch. 50)');

    -- SECTION 16: NEPHROLOGY BASICS (QUICK-FIRE)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '151: "Orthostatic Hypotension" is defined as a drop in SBP > ____ or DBP > ____.', '["10/5", "20/10", "30/20", "50/30"]', 1, 'Sign of volume depletion or autonomic dysfunction. (Harrison''s Ch. 33)'),
    (v_topic_id, '152: Which diuretic is most likely to cause "Ototoxicity" (hearing loss)?', '["Hydrochlorothiazide", "Loop Diuretics (e.g., Furosemide, Ethacrynic acid)", "Spironolactone", "Amiloride"]', 1, 'Especially when given as a rapid high-dose IV bolus. (Step-Up)'),
    (v_topic_id, '153: "Thiazide diuretics" can cause which electrolyte pattern?', '["Hyperkalemia", "Hyponatremia and Hypercalcemia", "Hypocalcemia", "Metabolic Acidosis"]', 1, 'Thiazides increase calcium reabsorption in the distal tubule. (Pocket Medicine)'),
    (v_topic_id, '154: Loop diuretics (Furosemide) typically cause ____ in serum calcium.', '["Increased", "Decreased (Hypocalcemia)", "No change", "Variable"]', 1, '"Loops lose calcium." (Step-Up)'),
    (v_topic_id, '155: "Triamterene" and "Amiloride" work by blocking:', '["Loop of Henle", "ENaC channels in the collecting duct", "Renin", "ACE"]', 1, 'Potassium-sparing diuretics. (Harrison''s Ch. 309)'),
    (v_topic_id, '156: "Metolazone" is a thiazide-like diuretic often added to loop diuretics to overcome:', '["Allergy", "Diuretic resistance (sequential nephron blockade)", "Cough", "Hypercalcemia"]', 1, 'Very potent combination. (Pocket Medicine)'),
    (v_topic_id, '157: Which hormone is the primary regulator of water excretion by the kidney?', '["Aldosterone", "Vasopressin (ADH)", "Renin", "Insulin"]', 1, 'Controls the number of aquaporin channels. (Step-Up)'),
    (v_topic_id, '158: "Urine Anion Gap" (Na + K - Cl) is used to evaluate:', '["Diabetes", "Normal-gap metabolic acidosis (distinguishes GI loss from RTA)", "HAGMA", "Stones"]', 1, 'A negative gap suggests GI loss (kidneys excreting NH4Cl). (Harrison''s Ch. 51)'),
    (v_topic_id, '159: "Cystoscopy" is the gold standard for visualizing the:', '["Kidney", "Bladder and Urethra", "Ureter only", "Prostate only"]', 1, 'Essential for evaluating gross hematuria. (Pocket Medicine)'),
    (v_topic_id, '160: What is the most common organism causing Urinary Tract Infection (UTI)?', '["Proteus", "Escherichia coli", "Klebsiella", "Enterococcus"]', 1, 'Gram-negative rod from the GI tract. (Step-Up)');

    RAISE NOTICE 'SUCCESS: Nephrology MCQ Part 2 (81-160) registered.';
END $$;

COMMIT;
