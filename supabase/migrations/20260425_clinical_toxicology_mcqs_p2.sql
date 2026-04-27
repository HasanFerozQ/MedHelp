-- Migration: Year 2 - Clinical Toxicology MCQ Bank (PART 2: 71-140)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (Analgesics & Alcohols)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- SECTION 3: ACETAMINOPHEN (PARACETAMOL) OVERDOSE (71-105)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'What is the toxic metabolite of Acetaminophen that causes liver necrosis?', '["Glucuronide", "Sulfate", "N-acetyl-p-benzoquinone imine (NAPQI)", "Acetaldehyde"]', 2, 'NAPQI is a highly reactive intermediate that binds to and destroys hepatocytes.'),
    (v_topic_id, 'Which enzyme system is responsible for producing NAPQI from Acetaminophen?', '["Glucuronyl transferase", "Cytochrome P450 (specifically CYP2E1)", "Alcohol dehydrogenase", "Xanthine oxidase"]', 1, 'CYP2E1 is induced by chronic alcohol use, increasing acetaminophen toxicity.'),
    (v_topic_id, 'What is the "Antidote" for Acetaminophen overdose?', '["Fomepizole", "N-acetylcysteine (NAC)", "Naloxone", "Flumazenil"]', 1, 'NAC replenishes glutathione, which detoxifies NAPQI.'),
    (v_topic_id, 'The "Rumack-Matthew Nomogram" is used to determine the need for NAC based on which factors?', '["Time since ingestion and serum Acetaminophen level", "Age and weight", "AST and ALT levels", "Presence of jaundice"]', 0, 'It is only valid for a single acute ingestion between 4 and 24 hours.'),
    (v_topic_id, 'NAC is most effective if administered within how many hours of an acute Acetaminophen ingestion?', '["2 hours", "8 hours", "24 hours", "72 hours"]', 1, 'Treating within 8 hours virtually guarantees survival from liver failure.'),
    (v_topic_id, 'In which "Phase" of Acetaminophen toxicity does the patient often appear clinically improved but have rising AST/ALT?', '["Phase 1 (0-24h)", "Phase 2 (24-72h)", "Phase 3 (72-96h)", "Phase 4 (Recovery)"]', 1, 'Phase 2 is the "latent" or "silent" period of metabolic damage.'),
    (v_topic_id, 'Which phase of Acetaminophen toxicity is characterized by peak hepatotoxicity, jaundice, and coagulopathy?', '["Phase 1", "Phase 2", "Phase 3", "Phase 4"]', 2, 'Phase 3 is the most critical stage where liver failure occurs.'),
    (v_topic_id, 'Why does chronic alcohol consumption increase the risk of Acetaminophen toxicity?', '["Alcohol prevents NAC absorption", "Alcohol induces CYP2E1 and depletes glutathione", "Alcohol causes kidney failure", "Alcohol acts as an antacid"]', 1, 'Chronic users have more NAPQI production and less detoxification capacity.'),
    (v_topic_id, 'Which lab test is the earliest indicator of liver dysfunction in Acetaminophen overdose?', '["Bilirubin", "ALT (Alanine aminotransferase)", "PT/INR", "Albumin"]', 2, 'The liver stops making clotting factors (Factor VII has the shortest half-life) early in failure.'),
    (v_topic_id, 'What is the mechanism of N-acetylcysteine (NAC)?', '["It blocks CYP2E1", "It provides a source of cysteine for glutathione synthesis and acts as a glutathione substitute", "It blocks NAPQI receptors", "It causes vomiting"]', 1, 'It provides the substrate needed to neutralize the toxic metabolite.'),
    (v_topic_id, 'Can NAC be given intravenously (IV)?', '["No, only oral", "Yes (Acetadote)", "Only if the patient is a child", "Only for alcoholics"]', 1, 'IV NAC is preferred for vomiting, pregnancy, or fulminant failure.'),
    (v_topic_id, 'A patient presents 30 hours after ingesting 20 grams of Acetaminophen. Should NAC be given?', '["No, it is too late", "Yes, NAC may still be beneficial even in late presentation or liver failure", "Only if the AST is normal", "Only if the patient has jaundice"]', 1, 'NAC has antioxidant and anti-inflammatory benefits in late stages.'),
    (v_topic_id, 'What is the "King''s College Criteria" used for in Acetaminophen overdose?', '["Diagnosing the overdose", "Predicting the need for a liver transplant", "Calculating the dose of NAC", "Measuring the osmolar gap"]', 1, 'Includes pH < 7.3 or the triad of INR > 6.5, Creatinine > 3.4, and Grade 3/4 Encephalopathy.'),
    (v_topic_id, 'What is the "Toxic Dose" of Acetaminophen in an adult?', '["1 gram", "4 grams", "7.5 to 10 grams (or > 150 mg/kg)", "20 grams only"]', 2, 'Lower doses may be toxic in high-risk individuals (alcoholics, malnourished).'),
    (v_topic_id, 'Acetaminophen toxicity primarily causes necrosis in which part of the liver lobule?', '["Zone 1 (Periportal)", "Zone 2 (Midzonal)", "Zone 3 (Centrilobular)", "Glisson''s capsule"]', 2, 'Zone 3 has the highest concentration of CYP450 enzymes.'),
    (v_topic_id, 'A patient on NAC develops flushing, itching, and mild hypotension during the infusion. Management?', '["Stop permanently", "Slow the infusion, give antihistamines, and restart (Anaphylactoid reaction)", "Give Epinephrine immediately", "Call the morgue"]', 1, 'This is a non-IgE mediated "Anaphylactoid" reaction, common with IV NAC.'),
    (v_topic_id, 'Activated charcoal should be given if the patient presents within 1-2 hours of Acetaminophen ingestion:', '["True", "False (Charcoal blocks NAC)", "Only if the dose was small", "Only for children"]', 0, 'Charcoal does NOT clinically interfere with NAC and is highly effective for reducing the dose absorbed.'),
    (v_topic_id, 'Chronic Acetaminophen toxicity is diagnosed by:', '["The Rumack-Matthew Nomogram", "Persistent ingestion over days and presence of liver injury/symptoms", "A single high level", "A normal AST"]', 1, 'The nomogram CANNOT be used for chronic/staggered ingestions.'),
    (v_topic_id, 'Which drug can induce CYP2E1 besides ethanol?', '["Isoniazid", "Penicillin", "Omeprazole", "Vitamin C"]', 0, 'Isoniazid is a potent inducer.'),
    (v_topic_id, 'Acetaminophen is often combined with which drug class, leading to a "Mixed" toxidrome in overdose?', '["Antibiotics", "Opioids (e.g., Oxycodone/Acetaminophen)", "Antacids", "Statins"]', 1, 'Overdoses on Percocet/Vicodin present with both Opioid and Hepatic toxicity.'),
    (v_topic_id, 'Which criteria determine the "End" of NAC therapy?', '["21 hours have passed", "Patient feels better", "Acetaminophen level is undetectable AND AST/ALT are normal or significantly improving", "The hospital is full"]', 2, 'Therapy is "tailored" until the liver is clearly safe.'),

    -- SECTION 4: SALICYLATES (ASPIRIN) (106-125)
    (v_topic_id, 'What is the classic early symptom of Salicylate toxicity?', '["Jaundice", "Tinnitus (Ringing in the ears)", "Constipation", "Pinpoint pupils"]', 1, 'Tinnitus and hearing loss are hallmark signs.'),
    (v_topic_id, 'Salicylates cause which complex acid-base disturbance?', '["Pure metabolic acidosis", "Pure respiratory alkalosis", "Mixed Respiratory Alkalosis and High Anion Gap Metabolic Acidosis", "Metabolic alkalosis"]', 2, 'Direct stimulation of the respiratory center (alkalosis) occurs alongside uncoupling of oxidative phosphorylation (acidosis).'),
    (v_topic_id, 'What is the mechanism of metabolic acidosis in Aspirin overdose?', '["Salicylate is an acid", "Uncoupling of oxidative phosphorylation leads to anaerobic metabolism and lactic/ketoacidosis", "Kidney failure", "None"]', 1, 'This leads to heat production (fever) and acid buildup.'),
    (v_topic_id, 'Why does acidosis worsen Salicylate toxicity?', '["It kills bacteria", "Low pH shifts Salicylate into its non-ionized form, allowing it to cross the BBB into the brain", "It makes the heart stronger", "It prevents vomiting"]', 1, 'This is why alkalinization is the mainstay of treatment.'),
    (v_topic_id, 'The priority in treating severe Aspirin poisoning is:', '["N-acetylcysteine", "Urinary alkalinization with Sodium Bicarbonate", "Naloxone", "Atropine"]', 1, 'Keeping blood and urine alkaline traps the drug outside the brain and speeds its excretion.'),
    (v_topic_id, 'Hemodialysis is indicated in Salicylate poisoning when:', '["The patient has a headache", "Serum level > 100 mg/dL (acute) or severe altered mental status/renal failure", "The patient is vomiting", "The dose was 5 grams"]', 1, 'Aspirin is small and poorly protein-bound at high levels, making it very dialyzable.'),
    (v_topic_id, 'What effect does Aspirin have on the Prothrombin Time (PT)?', '["Decreases it", "Increases it (Interferes with Vitamin K dependent factors)", "No effect", "None"]', 1, 'Aspirin can cause a "Warfarin-like" effect in large doses.'),
    (v_topic_id, 'Salicylates are found in which common topical product?', '["Lotion", "Oil of Wintergreen (Methyl Salicylate)", "Toothpaste", "Sunscreen"]', 1, 'One teaspoon of Oil of Wintergreen is equivalent to approx. 21 standard aspirin tablets.'),
    (v_topic_id, 'A child with a viral illness given Aspirin is at risk for:', '["Reye Syndrome", "Toxic Epidermal Necrolysis", "G6PD deficiency", "Diabetes"]', 0, 'Acute encephalopathy and fatty liver (microvesicular steatosis).'),
    (v_topic_id, 'What is "Bismuth Subsalicylate" (Pepto-Bismol) risk in overdose?', '["Liver failure only", "Salicylate toxicity", "Encephalopathy", "Both B and C"]', 3, 'Both the bismuth and the salicylate components can be toxic.'),
    (v_topic_id, 'In Aspirin toxicity, hyperventilation is a:', '["Direct drug effect on the medulla", "Compensatory mechanism", "Both", "Sign of heart failure"]', 2, 'It starts as a direct effect and continues as compensation for metabolic acidosis.'),
    (v_topic_id, 'Severe Salicylate toxicity can cause which pulmonary complication?', '["Asthma", "Non-cardiogenic pulmonary edema (NCPE)", "Pneumonia", "Lung cancer"]', 1, 'Increased capillary permeability leads to fluid in the lungs.'),

    -- SECTION 5: TOXIC ALCOHOLS (126-140)
    (v_topic_id, 'Methanol is metabolized by Alcohol Dehydrogenase to which toxic intermediate?', '["Acetaldehyde", "Formaldehyde", "Glycolaldehyde", "Formic Acid"]', 1, 'Formaldehyde is then rapidly converted to Formic Acid.'),
    (v_topic_id, 'Formic acid (from Methanol) specifically damages which organ?', '["Kidney", "Retina (Optic Nerve)", "Heart", "Lung"]', 1, 'Causes "Snowstorm" vision and permanent blindness.'),
    (v_topic_id, 'Ethylene Glycol (Antifreeze) is metabolized to which substance that causes kidney damage?', '["Formic acid", "Oxalic Acid", "Acetic acid", "Lactic acid"]', 1, 'Oxalic acid binds calcium to form calcium oxalate crystals in the renal tubules.'),
    (v_topic_id, 'What is the classic urine finding in Ethylene Glycol poisoning?', '["Blood", "Envelope-shaped calcium oxalate crystals", "Protein", "Glucose"]', 1, 'Visible under polarized light.'),
    (v_topic_id, 'Fomepizole works by inhibiting which enzyme?', '["Aldehyde dehydrogenase", "Alcohol dehydrogenase (ADH)", "Xanthine oxidase", "MAO"]', 1, 'By blocking ADH, the toxic alcohols are excreted unchanged by the kidneys.'),
    (v_topic_id, 'Which cofactor is given in Methanol poisoning to speed the breakdown of formic acid?', '["Thiamine", "Folic Acid (Leucovorin)", "Pyridoxine", "Vitamin K"]', 1, 'Folate is a cofactor in the conversion of formate to CO2 and water.'),
    (v_topic_id, 'Which cofactors are given in Ethylene Glycol poisoning to shunt metabolism away from oxalic acid?', '["Thiamine and Pyridoxine (Vitamin B6)", "Folate", "Vitamin C", "Niacin"]', 0, 'They promote the formation of less toxic alpha-hydroxy-beta-ketoadipate.'),
    (v_topic_id, 'Toxic alcohol ingestion causes which "Gap" combination?', '["High Anion Gap Acidosis and High Osmolar Gap", "Normal Gap", "Osmolar gap only", "Anion gap only"]', 0, 'The parent alcohol increases the osmolar gap; the acid metabolites increase the anion gap.'),
    (v_topic_id, 'Isopropanol (Rubbing Alcohol) toxicity is characterized by:', '["Blindness", "Ketosis WITHOUT Acidosis", "Kidney failure", "Heart failure"]', 1, 'Isopropanol -> Acetone. Acetone is a ketone but not an acid.'),
    (v_topic_id, 'A patient "smells like fruit/nail polish remover" but has a normal pH and high osmolar gap. Diagnosis?', '["Methanol", "Isopropanol", "Ethylene Glycol", "Aspirin"]', 1, 'Acetone breath from isopropanol.'),
    (v_topic_id, 'What is a major side effect of IV Ethanol when used as an antidote?', '["Seizures", "Sedation, hypoglycemia, and difficult-to-maintain levels", "Blindness", "Liver failure"]', 1, 'Ethanol is much harder to manage than Fomepizole.'),
    (v_topic_id, 'Hemodialysis is required for Methanol or Ethylene Glycol if:', '["The patient has a headache", "Severe acidosis (pH < 7.25) or organ damage (visual/renal)", "The osmolar gap is 5", "The patient is awake"]', 1, 'Dialysis removes both the parent alcohol and the toxic acids.'),
    (v_topic_id, 'Which toxic alcohol causes "Hypocalcemia"?', '["Methanol", "Ethylene Glycol", "Isopropanol", "Ethanol"]', 1, 'Calcium is consumed in the formation of calcium oxalate crystals.'),
    (v_topic_id, '"Fluorescein" is sometimes added to antifreeze to help diagnose ingestion by:', '["Making the patient glow", "Allowing the urine to glow under a Wood''s lamp (UV light)", "Staining the teeth", "None"]', 1, 'This is a quick but sometimes unreliable bedside test.');

    RAISE NOTICE 'SUCCESS: Clinical Toxicology MCQ Part 2 (71-140) registered.';
END $$;

COMMIT;
