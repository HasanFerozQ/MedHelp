-- Migration: Year 2 - Endocrine Pharmacology MCQ Bank (PART 5: 281-335)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (Bone, Calcium & Final Topics)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrine-pharmacology' LIMIT 1;

    -- Targeted Delete for THIS PART ONLY
    DELETE FROM mcqs 
    WHERE topic_id = v_topic_id 
    AND question IN (
        'What is the mechanism of action of Bisphosphonates (e.g., Alendronate)?',
        'Which side effect is most characteristic of oral Bisphosphonates?',
        'How should Alendronate be taken to minimize esophageal irritation?',
        'What is a rare but severe side effect of long-term Bisphosphonate use involving the jaw?',
        'The mechanism of Denosumab in osteoporosis is:',
        'Teriparatide is a recombinant version of which hormone?',
        'What is the paradoxical effect of Teriparatide on bone?',
        'Which drug is a SERM used specifically for Osteoporosis in postmenopausal women?',
        'Calcitonin is primarily used for the acute treatment of:',
        'The mechanism of Cinacalcet is:',
        'Vitamin D (Calcitriol) increases blood calcium primarily by:',
        'Which drug is used for Paget Disease of the bone?',
        'What is the effect of glucocorticoids on bone mineral density?',
        'Which drug is used to treat Hypercalcemia of Malignancy?',
        'The mechanism of Zoledronic Acid is:',
        'What is a contraindication for Teriparatide?',
        'Which drug is used to treat hypocalcemia in patients with renal failure?',
        'The primary action of PTH on the kidney is to:',
        'Which drug is a monoclonal antibody that inhibits Sclerostin?',
        'Sevelamer is used for which purpose in chronic kidney disease?',
        'What is the "Hungry Bone Syndrome"?',
        'Which drug is a calcimimetic?',
        'The mechanism of Gallium Nitrate in hypercalcemia is:',
        'Which Vitamin D analog is used topically for Psoriasis?',
        'What is the difference between Ergocalciferol (D2) and Cholecalciferol (D3)?',
        'Which drug inhibits the RANK ligand?',
        'Side effect of Teriparatide includes:',
        'What is the "Drug of Choice" for Osteoporosis in most patients?',
        'Strontium Ranelate has a dual action of:',
        'Calcium sensing receptor (CaSR) is found primarily in:',
        'The effect of Calcitonin on the kidney is to:',
        'Which hormone decreases both blood calcium and phosphate levels?'
    );

    -- SECTION 6: BONE & CALCIUM (281-335)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'What is the mechanism of action of Bisphosphonates (e.g., Alendronate)?', '["Inhibition of osteoclast activity by binding to hydroxyapatite", "Stimulation of osteoblast activity", "Increasing calcium absorption in the gut", "Increasing Vitamin D synthesis"]', 0, 'Bisphosphonates are pyrophosphate analogs that inhibit osteoclast-mediated bone resorption.'),
    (v_topic_id, 'Which side effect is most characteristic of oral Bisphosphonates?', '["Diarrhea", "Esophagitis and esophageal ulcers", "Weight gain", "Hypertension"]', 1, 'They are highly corrosive to the esophageal mucosa.'),
    (v_topic_id, 'How should Alendronate be taken to minimize esophageal irritation?', '["With food", "With a full glass of water, while remaining upright for 30 minutes", "Right before bed", "With a glass of milk"]', 1, 'Gravity and water help prevent the pill from sticking to the esophagus.'),
    (v_topic_id, 'What is a rare but severe side effect of long-term Bisphosphonate use involving the jaw?', '["Jaw fracture", "Osteonecrosis of the Jaw (ONJ)", "Gum disease", "Tooth loss"]', 1, 'ONJ is especially common in patients receiving high-dose IV bisphosphonates for cancer.'),
    (v_topic_id, 'The mechanism of Denosumab in osteoporosis is:', '["PTH receptor agonist", "Monoclonal antibody against RANKL", "Cathepsin K inhibitor", "Sclerostin inhibitor"]', 1, 'By blocking RANKL, it prevents the maturation and survival of osteoclasts.'),
    (v_topic_id, 'Teriparatide is a recombinant version of which hormone?', '["Calcitonin", "PTH (1-34 fragment)", "Growth Hormone", "Vitamin D"]', 1, 'It is the first 34 amino acids of human parathyroid hormone.'),
    (v_topic_id, 'What is the paradoxical effect of Teriparatide on bone?', '["Continuous use builds bone", "Intermittent low-dose use builds bone (Anabolic)", "It causes bone loss at any dose", "It only works on teeth"]', 1, 'While continuous PTH causes bone resorption, intermittent pulses stimulate osteoblasts.'),
    (v_topic_id, 'Which drug is a SERM used specifically for Osteoporosis in postmenopausal women?', '["Tamoxifen", "Raloxifene", "Fulvestrant", "Clomiphene"]', 1, 'Raloxifene has estrogenic effects on bone but anti-estrogenic effects on breast.'),
    (v_topic_id, 'Calcitonin is primarily used for the acute treatment of:', '["Chronic Osteoporosis", "Hypercalcemic Crisis and Paget Disease", "Hypocalcemia", "Rickets"]', 1, 'Calcitonin rapidly lowers calcium by inhibiting osteoclasts.'),
    (v_topic_id, 'The mechanism of Cinacalcet is:', '["Increasing PTH secretion", "Increasing the sensitivity of the calcium-sensing receptor (CaSR)", "Blocking the PTH receptor", "Stimulating Vitamin D"]', 1, 'By making the parathyroid gland "think" calcium is high, it suppresses PTH release.'),
    (v_topic_id, 'Vitamin D (Calcitriol) increases blood calcium primarily by:', '["Increasing intestinal calcium and phosphate absorption", "Inhibiting the kidney from excreting calcium", "Destroying bone", "Inhibiting PTH"]', 0, 'Calcitriol is the active form.'),
    (v_topic_id, 'Which drug is used for Paget Disease of the bone?', '["Alendronate", "Calcitonin", "Zoledronic Acid", "All of the above"]', 3, 'Both bisphosphonates and calcitonin are effective.'),
    (v_topic_id, 'What is the effect of glucocorticoids on bone mineral density?', '["Increase", "Decrease", "No effect", "Only decrease in men"]', 1, 'Steroids are a leading cause of drug-induced osteoporosis.'),
    (v_topic_id, 'Which drug is used to treat Hypercalcemia of Malignancy?', '["Plicamycin", "Zoledronic Acid", "Furosemide + Hydration", "All of the above"]', 3, 'Treatment focuses on hydration and inhibition of resorption.'),
    (v_topic_id, 'The mechanism of Zoledronic Acid is:', '["Oral bisphosphonate", "Potent IV bisphosphonate", "Monoclonal antibody", "Vitamin D analog"]', 1, 'Zoledronic acid is given as an IV infusion.'),
    (v_topic_id, 'What is a contraindication for Teriparatide?', '["Diabetes", "Paget disease or history of bone radiation", "Hypertension", "Obesity"]', 1, 'Animal studies showed a risk of bone cancer.'),
    (v_topic_id, 'Which drug is used to treat hypocalcemia in patients with renal failure?', '["Ergocalciferol", "Calcitriol", "Alendronate", "Cinacalcet"]', 1, 'The active form (Calcitriol) must be given.'),
    (v_topic_id, 'The primary action of PTH on the kidney is to:', '["Increase calcium reabsorption and decrease phosphate reabsorption", "Increase both", "Decrease both", "Increase phosphate only"]', 0, 'PTH is "phosphate trashing."'),
    (v_topic_id, 'Which drug is a monoclonal antibody that inhibits Sclerostin?', '["Denosumab", "Romosozumab", "Abciximab", "Rituximab"]', 1, 'Romosozumab increases bone formation and decreases resorption.'),
    (v_topic_id, 'Sevelamer is used for which purpose in chronic kidney disease?', '["Calcium supplement", "Non-absorbable Phosphate binder", "Vitamin D analog", "Iron supplement"]', 1, 'It prevents the absorption of dietary phosphate.'),
    (v_topic_id, 'What is the "Hungry Bone Syndrome"?', '["Severe osteoporosis", "Severe hypocalcemia following parathyroidectomy", "Hypercalcemia in cancer", "Vitamin D overdose"]', 1, 'The "starved" bones rapidly suck calcium out of the blood.'),
    (v_topic_id, 'Which drug is a calcimimetic?', '["Cinacalcet", "Calcitonin", "Calcitriol", "Calcium gluconate"]', 0, 'Cinacalcet mimics the effect of calcium.'),
    (v_topic_id, 'The mechanism of Gallium Nitrate in hypercalcemia is:', '["Binding to bone and inhibiting resorption", "Blocking PTH", "Inhibiting Vitamin D", "Increasing renal excretion"]', 0, 'Used specifically for cancer-related hypercalcemia.'),
    (v_topic_id, 'Which Vitamin D analog is used topically for Psoriasis?', '["Calcitriol", "Calcipotriene", "Ergocalciferol", "Doxercalciferol"]', 1, 'Calcipotriene inhibits skin cell proliferation.'),
    (v_topic_id, 'What is the difference between Ergocalciferol (D2) and Cholecalciferol (D3)?', '["D2 is from plants; D3 is from animals", "D2 is active; D3 is inactive", "There is no difference", "D3 is toxic"]', 0, 'Both are used as supplements.'),
    (v_topic_id, 'Which drug inhibits the RANK ligand?', '["Denosumab", "Raloxifene", "Alendronate", "Cinacalcet"]', 0, 'Denosumab is the RANKL inhibitor.'),
    (v_topic_id, 'Side effect of Teriparatide includes:', '["Hypercalcemia", "Hypocalcemia", "Lactic acidosis", "Esophagitis"]', 0, 'It can transiently raise blood calcium levels.'),
    (v_topic_id, 'What is the "Drug of Choice" for Osteoporosis in most patients?', '["Calcitonin", "Bisphosphonates", "Estrogen", "Teriparatide"]', 1, 'Due to their proven efficacy in reducing fractures.'),
    (v_topic_id, 'Strontium Ranelate has a dual action of:', '["Building bone and inhibiting resorption", "Blocking calcium and phosphate", "Stimulating PTH and Vitamin D", "None of the above"]', 0, 'Used in Europe.'),
    (v_topic_id, 'Calcium sensing receptor (CaSR) is found primarily in:', '["Bone", "Parathyroid gland and Kidney", "Liver", "Muscle"]', 1, 'It allows these organs to monitor serum calcium.'),
    (v_topic_id, 'The effect of Calcitonin on the kidney is to:', '["Increase excretion of calcium and phosphate", "Increase reabsorption", "No effect", "Stimulate Vitamin D"]', 0, 'Calcitonin is "calciuric."'),
    (v_topic_id, 'Which hormone decreases both blood calcium and phosphate levels?', '["PTH", "Vitamin D", "Calcitonin", "FGF-23"]', 2, 'Calcitonin inhibits the release of both from bone.'),
    (v_topic_id, 'Atypical subtrochanteric fractures are associated with long-term use of:', '["Teriparatide", "Bisphosphonates", "Calcium", "Vitamin D"]', 1, 'Prolonged suppression of bone remodeling can lead to "brittle" bones.'),
    (v_topic_id, 'Which drug is a potent Vitamin D analog used to treat secondary hyperparathyroidism in CKD?', '["Paricalcitol", "Alendronate", "Cinacalcet", "Raloxifene"]', 0, 'Paricalcitol suppresses PTH with less hypercalcemia.'),
    (v_topic_id, 'Which electrolyte should be monitored when using Cinacalcet?', '["Sodium", "Calcium", "Potassium", "Magnesium"]', 1, 'Over-suppression of PTH can lead to low blood calcium.'),
    (v_topic_id, 'The primary cause of Vitamin D deficiency in most patients is:', '["Poor diet", "Lack of sunlight", "Malabsorption", "Liver failure"]', 1, 'Sunlight is the most critical source.'),
    (v_topic_id, 'Which drug is used to treat Osteoporosis by inhibiting the enzyme Cathepsin K?', '["Odanacatib", "Denosumab", "Raloxifene", "Teriparatide"]', 0, 'Cathepsin K is involved in the breakdown of bone matrix.'),
    (v_topic_id, 'A major side effect of high-dose Vitamin D therapy is:', '["Hypercalcemia and Kidney stones", "Hypocalcemia", "Diarrhea", "Hypertension"]', 0, 'Excess Vitamin D leads to excessive calcium absorption.'),
    (v_topic_id, 'Which drug is a recombinant human PTH used for Hypoparathyroidism?', '["Natpara", "Teriparatide", "Forteo", "Natesto"]', 0, 'Natpara is full-length human PTH.'),
    (v_topic_id, 'In Hypercalcemia, why is Loop Diuretic used?', '["To increase calcium reabsorption", "To increase calcium excretion", "To treat heart failure", "To block Vitamin D"]', 1, 'Loop diuretics inhibit the reabsorption of calcium.'),
    (v_topic_id, 'Why are Thiazide diuretics contraindicated in Hypercalcemia?', '["They are not effective", "They increase renal calcium reabsorption", "They cause diarrhea", "They block PTH"]', 1, 'Thiazides are "calcium-sparing."'),
    (v_topic_id, 'Which drug is a Selective Estrogen Receptor Modulator used for Osteoporosis?', '["Raloxifene", "Tamoxifen", "Letrozole", "Fulvestrant"]', 0, 'Raloxifene is the dual-benefit choice.'),
    (v_topic_id, 'What is the "Drug Holiday" in bisphosphonate therapy?', '["Taking the drug only on weekends", "A planned 1-2 year break after 3-5 years", "Taking the drug with food", "Switching to Calcitonin"]', 1, 'Because bisphosphonates stay in the bone for years.'),
    (v_topic_id, 'Which hormone is the "Master Regulator" of phosphate levels?', '["PTH", "FGF-23", "Calcitonin", "Vitamin D"]', 1, 'FGF-23 is a phosphatonin.'),
    (v_topic_id, 'What is the mechanism of FGF-23?', '["Stimulates Vitamin D", "Inhibits Vitamin D activation and increases renal phosphate excretion", "Builds bone", "Increases calcium"]', 1, 'It opposes Vitamin D.'),
    (v_topic_id, 'Common side effect of Cinacalcet includes:', '["Hypocalcemia and Nausea", "Hypercalcemia", "Hypertension", "Weight gain"]', 0, 'Nausea is quite common.'),
    (v_topic_id, 'Which drug is used for severe Hypercalcemia of Malignancy refractory to bisphosphonates?', '["Denosumab", "Plicamycin", "Gallium Nitrate", "All of the above"]', 3, 'These are salvage therapies.'),
    (v_topic_id, 'The active form of Vitamin D is synthesized in which organ?', '["Skin", "Liver", "Kidney", "Bone marrow"]', 2, 'The enzyme is located in the kidney.'),
    (v_topic_id, 'What stimulates the 1-alpha-hydroxylase enzyme in the kidney?', '["High calcium", "PTH and Low Phosphate", "High Vitamin D", "Calcitonin"]', 1, 'PTH and low phosphorus are the signals.'),
    (v_topic_id, 'Which drug class can cause Osteoporosis as a long-term side effect?', '["Glucocorticoids", "Proton Pump Inhibitors", "Anticonvulsants", "All of the above"]', 3, 'All these drugs interfere with calcium metabolism.'),
    (v_topic_id, 'The mechanism of Phenytoin in bone loss is:', '["Direct inhibition of osteoblasts", "Inducing enzymes that speed up Vitamin D metabolism", "Blocking calcium channels", "Inhibiting PTH"]', 1, 'Increased degradation of Vitamin D.'),
    (v_topic_id, 'Which drug is a phosphate binder that does NOT contain calcium?', '["Calcium Carbonate", "Sevelamer", "Lanthanum Carbonate", "Both B and C"]', 3, 'Non-calcium binders are preferred.'),
    (v_topic_id, 'The primary benefit of Bisphosphonates in bone cancer is:', '["Killing cancer cells", "Reducing skeletal-related events", "Increasing white blood cells", "Stimulating hair growth"]', 1, 'They are supportive care.'),
    (v_topic_id, 'Which drug is a 2nd generation Bisphosphonate?', '["Etidronate", "Pamidronate", "Alendronate", "Clodronate"]', 2, 'Alendronate is more potent.'),
    (v_topic_id, 'The final step of Vitamin D activation is inhibited by:', '["PTH", "FGF-23 and Hypercalcemia", "Low phosphate", "Prolactin"]', 1, 'Negative feedback prevents toxicity.');

    RAISE NOTICE 'SUCCESS: Endocrine Pharmacology MCQ Part 5 (281-335) registered.';
END $$;

COMMIT;
