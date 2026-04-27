-- Migration: Year 2 - Clinical Toxicology MCQ Bank (PART 4: 211-280)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (Cardiovascular & Environmental)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- SECTION 9: CARDIOVASCULAR TOXINS (211-240)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'What is the mechanism of Digoxin toxicity?', '["Inhibition of Na+/K+ ATPase pump", "Activation of Beta-1 receptors", "Blocking calcium channels", "Inhibiting ACE"]', 0, 'This leads to increased intracellular sodium and subsequently calcium (via Na/Ca exchanger), but also hyperkalemia.'),
    (v_topic_id, 'Which electrolyte abnormality MOST predisposes a patient to Digoxin toxicity?', '["Hyperkalemia", "Hypokalemia", "Hypernatremia", "Hypocalcemia"]', 1, 'Potassium and Digoxin compete for the same binding site on the Na+/K+ ATPase pump; low K+ allows more Digoxin to bind.'),
    (v_topic_id, 'What is the "First-line" treatment for life-threatening Digoxin toxicity?', '["Potassium supplements", "Digoxin-specific antibody fragments (DigiFab)", "Atropine", "Hemodialysis"]', 1, 'DigiFab rapidly binds and inactivates the drug.'),
    (v_topic_id, 'The classic visual disturbance in Digoxin toxicity is:', '["Snowstorm vision", "Yellow-green halos (Xanthopsia)", "Blindness", "Tunnel vision"]', 1, 'Due to effects on the retina/optic nerve.'),
    (v_topic_id, 'In acute Digoxin overdose, what is a strong predictor of mortality?', '["Serum Digoxin level", "Serum Potassium level (Hyperkalemia > 5.5 mEq/L)", "Age", "Heart rate"]', 1, 'High K+ reflects the degree of Na/K pump inhibition and is a critical marker.'),
    (v_topic_id, 'A patient with Calcium Channel Blocker (CCB) overdose presents with profound bradycardia and hypotension. What is the mechanism of hyperglycemia in this patient?', '["CCBs stimulate glucagon", "CCBs inhibit insulin release from pancreatic beta cells", "Liver failure", "None"]', 1, 'Insulin release depends on L-type calcium channels, which are blocked by CCBs.'),
    (v_topic_id, 'What is the role of "High-dose Insulin" (HDI) in CCB and Beta-blocker overdose?', '["To treat hyperglycemia", "To improve myocardial metabolic efficiency and increase contractility", "To stop vomiting", "None"]', 1, 'The stressed heart switches to glucose as a primary fuel; insulin facilitates this uptake.'),
    (v_topic_id, 'In CCB overdose, which type of CCB is most likely to cause profound peripheral vasodilation (hypotension with relative tachycardia)?', '["Diltiazem", "Verapamil", "Dihydropyridines (e.g., Amlodipine, Nifedipine)", "None"]', 2, 'Dihydropyridines are more selective for vascular smooth muscle than the heart.'),
    (v_topic_id, 'Which drug is used for Beta-blocker overdose to increase heart rate by bypassing the beta-receptor?', '["Epinephrine", "Glucagon", "Atropine", "Calcium"]', 1, 'Glucagon activates its own Gs-coupled receptors to increase cAMP in the heart.'),
    (v_topic_id, 'Calcium gluconate or chloride is given in CCB overdose primarily to:', '["Treat hypocalcemia", "Overcome the competitive blockade and increase contractility", "Stop seizures", "Protect the brain"]', 1, 'High extracellular calcium can improve heart function through sheer concentration gradient.'),
    (v_topic_id, 'A patient on Nitroprusside infusion for a hypertensive crisis develops confusion and metabolic acidosis. What is the most likely toxin?', '["Nitroglycerin", "Cyanide", "Lead", "Arsenic"]', 1, 'Nitroprusside contains five cyanide groups per molecule; prolonged use or high doses can cause toxicity.'),
    (v_topic_id, 'Cyanide inhibits which part of the Electron Transport Chain?', '["Complex I", "Complex III", "Complex IV (Cytochrome c oxidase)", "Complex V"]', 2, 'It stops cellular respiration, leading to lactic acidosis.'),
    (v_topic_id, 'What is the clinical presentation of "Cyanide" poisoning?', '["Cherry-red skin, almond breath, and profound lactic acidosis", "Pinpoint pupils", "Jaundice", "Constipation"]', 0, 'Cells cannot use oxygen (histotoxic hypoxia), so the blood remains oxygenated (red).'),
    (v_topic_id, 'The modern "Cyanokit" contains which substance?', '["Amyl Nitrite", "Hydroxocobalamin", "N-acetylcysteine", "Atropine"]', 1, 'Hydroxocobalamin traps cyanide to form Vitamin B12.'),
    (v_topic_id, 'Which toxin causes "Cherry-red" carboxyhemoglobin and binds to hemoglobin 200x more strongly than oxygen?', '["Cyanide", "Carbon Monoxide (CO)", "Hydrogen Sulfide", "Nitrogen"]', 1, 'CO prevents oxygen delivery and causes a left shift in the dissociation curve.'),
    (v_topic_id, 'What is the treatment for Carbon Monoxide poisoning?', '["Hydroxocobalamin", "100% High-flow Oxygen or Hyperbaric Oxygen (HBO)", "Methylene blue", "Atropine"]', 1, 'Oxygen competes with CO for the hemoglobin binding sites; HBO speeds this up 4-5 times faster than room air.'),
    (v_topic_id, 'Which environmental toxin is a common cause of "Delayed Neurological Sequelae" (DNS) such as parkinsonism and memory loss weeks after recovery?', '["Lead", "Carbon Monoxide", "Mercury", "Arsenic"]', 1, 'Globus pallidus necrosis is a classic MRI finding in CO poisoning.'),
    (v_topic_id, 'A child living in an old house presents with abdominal pain, anemia with "basophilic stippling," and developmental delay. Diagnosis?', '["Iron poisoning", "Lead poisoning", "Vitamin C deficiency", "Mercury poisoning"]', 1, 'Lead interferes with ferrochelatase and ALA dehydratase.'),
    (v_topic_id, 'What is the classic X-ray finding in a child with chronic Lead ingestion?', '["Heart enlargement", "Lead lines (increased density) at the epiphyses of long bones", "Lung nodules", "Kidney stones"]', 1, 'Lead is deposited in the bone matrix.'),
    (v_topic_id, 'Antidote for Lead poisoning in a child with a level > 45 mcg/dL?', '["N-acetylcysteine", "Succimer (DMSA)", "Deferoxamine", "Naloxone"]', 1, 'Succimer is an oral chelator.'),
    (v_topic_id, 'Which chelator is used for "Lead Encephalopathy" (severe cases)?', '["Dimercaprol (BAL) followed by EDTA", "Succimer only", "Penicillamine", "Deferoxamine"]', 0, 'Dimercaprol must be given first to prevent lead from redistributing to the brain.'),
    (v_topic_id, '"Burton''s line" refers to:', '["Lines on the skin", "Bluish-purple line on the gums associated with Lead poisoning", "Nail ridges", "None"]', 1, 'Caused by reaction of lead with sulfur-producing bacteria in the mouth.'),
    (v_topic_id, 'Acute Arsenic poisoning presents with All EXCEPT:', '["Garlic breath", "Severe \"rice-water\" diarrhea", "QT prolongation", "Hair growth"]', 3, 'Arsenic causes severe GI upset and cardiac issues.'),
    (v_topic_id, 'Chronic Arsenic exposure is associated with which skin findings?', '["\"Raindrop\" hyperpigmentation and palmoplantar hyperkeratosis", "Eczema", "Hives", "Psoriasis"]', 0, 'It is also a known carcinogen for skin, lung, and bladder cancer.'),
    (v_topic_id, '"Mees'' lines" (transverse white bands on nails) are associated with:', '["Iron", "Arsenic and Thallium", "Lead", "Mercury"]', 1, 'Also seen in some systemic illnesses.'),
    (v_topic_id, 'A patient with Mercury poisoning presents with "Erethism" (excessive shyness, irritability, and tremors). This is typical of:', '["Elemental Mercury vapor (Inhalation)", "Organic Mercury (Methylmercury)", "Inorganic salts", "None"]', 0, 'Inhaled vapor is highly neurotoxic.'),
    (v_topic_id, '"Minamata Disease" was caused by the consumption of fish contaminated with:', '["Lead", "Methylmercury", "Arsenic", "Cyanide"]', 1, 'Methylmercury is an organic form that bioaccumulates in the food chain and causes severe neurologic damage.'),
    (v_topic_id, '"Acrodynia" (Pink disease), characterized by painful, pink, peeling hands and feet, is a sign of:', '["Lead poisoning", "Chronic Mercury poisoning in children", "Vitamin deficiency", "Arsenic"]', 1, 'Once common due to mercury in teething powders.'),
    (v_topic_id, 'Antidote for Mercury poisoning?', '["Deferoxamine", "Succimer (DMSA) or Dimercaprol (BAL)", "N-acetylcysteine", "Atropine"]', 1, 'Chelation is used for most forms, except methylmercury (where it is less effective).'),
    (v_topic_id, 'The "Antidote" for Thallium poisoning?', '["Dimercaprol", "Prussian Blue", "N-acetylcysteine", "EDTA"]', 1, 'Prussian blue traps thallium in the gut (enterohepatic circulation).'),
    (v_topic_id, 'Methemoglobinemia (Fe2+ to Fe3+) causes which physical finding?', '["Cherry-red skin", "Chocolate-colored blood and Cyanosis unresponsive to oxygen", "Jaundice", "Pale skin"]', 1, 'Fe3+ cannot bind oxygen effectively.'),
    (v_topic_id, 'Antidote for Methemoglobinemia?', '["Hydroxocobalamin", "Methylene Blue", "Dimercaprol", "Penicillamine"]', 1, 'Methylene blue provides an electron to reduce iron back to Fe2+.'),
    (v_topic_id, 'Methylene blue is contraindicated in which patients?', '["Diabetics", "G6PD Deficiency", "Hypertensives", "Elderly"]', 1, 'It can cause severe hemolysis in G6PD deficient patients.'),
    (v_topic_id, 'Hydrofluoric Acid (HF) burns are uniquely dangerous because they cause:', '["Simple burns", "Life-threatening hypocalcemia and hyperkalemia due to fluoride ions", "Liver failure", "None"]', 1, 'Fluoride binds calcium and magnesium greedily, leading to cardiac arrest.'),
    (v_topic_id, 'Treatment for Hydrofluoric Acid exposure?', '["Water only", "Calcium gluconate (topical, subcutaneous, or IV)", "Baking soda", "Vinegar"]', 1, 'Calcium neutralizes the fluoride ions.'),
    (v_topic_id, 'Which heavy metal is associated with "Mee''s lines" and "Alopecia" (hair loss)?', '["Lead", "Thallium", "Mercury", "Iron"]', 1, 'Thallium is the classic "poisoner''s poison" that causes hair to fall out.'),
    (v_topic_id, 'Chelation therapy involves molecules with:', '["Single bonds", "Two or more electronegative groups that form stable rings with metal ions", "No charge", "High lipids"]', 1, 'The word "Chelate" comes from the Greek word for "Claw."'),
    (v_topic_id, 'Why is Deferoxamine given via slow IV or IM?', '["It is poorly absorbed", "Rapid IV infusion can cause histamine release and hypotension", "It causes liver failure", "It is expensive"]', 1, 'Rapid infusion must be avoided.'),
    (v_topic_id, 'A patient on chronic Hemodialysis develops "Aluminum toxicity" from the water. Antidote?', '["Succimer", "Deferoxamine", "EDTA", "Penicillamine"]', 1, 'Deferoxamine can chelate aluminum as well as iron.'),
    (v_topic_id, 'Penicillamine is primarily used for which metal-related disease?', '["Lead poisoning", "Wilson Disease (Copper overload)", "Hemochromatosis", "Mercury"]', 1, 'It is an effective copper chelator.');

    RAISE NOTICE 'SUCCESS: Clinical Toxicology MCQ Part 4 (211-280) registered.';
END $$;

COMMIT;
