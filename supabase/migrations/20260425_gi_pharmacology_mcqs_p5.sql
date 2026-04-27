-- Migration: Year 2 - GI Pharmacology MCQ Bank (PART 5: 281-335)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (Mixed GI & Final Review)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'gi-pharmacology' LIMIT 1;

    -- SECTION 9: ANORECTAL & PARASITIC (281-310)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which topical medication is used for "Anal Fissures" because it causes smooth muscle relaxation via Nitric Oxide?', '["Hydrocortisone", "Nitroglycerin (0.4%)", "Lidocaine", "Phenylephrine"]', 1, 'Topical nitrates relax the internal anal sphincter, improving blood flow and healing.'),
    (v_topic_id, 'What is the mechanism of Nifedipine or Diltiazem when used topically for anal fissures?', '["Vasoconstriction", "Calcium channel blockade leading to sphincter relaxation", "Numbing", "Anti-inflammatory"]', 1, 'They are used as alternatives to nitrates with fewer headaches.'),
    (v_topic_id, 'Which drug is a vasoconstrictor used in OTC hemorrhoid creams to shrink swollen vessels?', '["Lidocaine", "Phenylephrine", "Hydrocortisone", "Witch Hazel"]', 1, 'Alpha-1 agonists cause local vasoconstriction.'),
    (v_topic_id, 'Topical Hydrocortisone is used in hemorrhoid management primarily to:', '["Shrink vessels", "Reduce inflammation and itching", "Numb the pain", "Soften stool"]', 1, 'It is used for short-term symptomatic relief.'),
    (v_topic_id, 'What is the "First-line" treatment for PINWORM (Enterobius vermicularis) infection?', '["Albendazole or Pyrantel Pamoate", "Praziquantel", "Ivermectin", "Metronidazole"]', 0, 'Albendazole and Mebendazole inhibit microtubule synthesis; Pyrantel is a paralytic agent.'),
    (v_topic_id, 'Which drug is the treatment of choice for GI Amebiasis (Entamoeba histolytica)?', '["Albendazole", "Metronidazole", "Praziquantel", "Ivermectin"]', 1, 'Metronidazole treats the tissue infection; a luminal agent is then added.'),
    (v_topic_id, 'What is a luminal amebicide used after Metronidazole to eradicate the carrier state?', '["Paromomycin or Iodoquinol", "Ciprofloxacin", "Azithromycin", "Chloroquine"]', 0, 'Paromomycin is an aminoglycoside that stays in the gut lumen.'),
    (v_topic_id, 'Treatment for Giardiasis is primarily:', '["Metronidazole or Tinidazole", "Amoxicillin", "Loperamide", "Albendazole"]', 0, 'Nitroimidazoles are highly effective against Giardia.'),
    (v_topic_id, 'Which drug is used to treat Tapeworms (Cestodes) and Flukes (Trematodes)?', '["Albendazole", "Praziquantel", "Metronidazole", "Mebendazole"]', 1, 'Praziquantel increases calcium permeability, causing contraction and paralysis of the worm.'),
    (v_topic_id, 'What is the mechanism of action of Albendazole and Mebendazole?', '["Blocking glucose uptake", "Inhibition of microtubule polymerization by binding to beta-tubulin", "Opening Chloride channels", "Paralysis"]', 1, 'This prevents the worm from maintaining its structure and absorbing nutrients.'),
    (v_topic_id, 'Ivermectin is the treatment of choice for which GI-related parasitic infection?', '["Tapeworm", "Strongyloides stercoralis", "Amebiasis", "Pinworm"]', 1, 'It works by opening glutamate-gated chloride channels.'),
    (v_topic_id, 'Which drug is used for "Clostridioides difficile" colitis and is not absorbed orally?', '["Metronidazole", "Oral Vancomycin", "Ciprofloxacin", "Amoxicillin"]', 1, 'Oral Vancomycin is first-line for C. diff because it stays in the gut lumen.'),
    (v_topic_id, 'What is the mechanism of Fidaxomicin in C. diff infection?', '["Cell wall inhibitor", "Inhibition of RNA polymerase", "Protein synthesis inhibitor", "Inhibits DNA synthesis"]', 1, 'Fidaxomicin is a macrocyclic antibiotic with high specificity for C. diff and low recurrence rates.'),
    (v_topic_id, 'Nitazoxanide is an antiprotozoal drug used primarily for:', '["Amebiasis", "Cryptosporidium parvum and Giardia", "Malaria", "Pinworm"]', 1, 'Commonly used in children for traveler''s diarrhea or crypto.'),
    (v_topic_id, 'Which drug is used to treat "Hemorrhoids" by strengthening venous walls (flavonoids)?', '["Daflon (Diosmin/Hesperidin)", "Lidocaine", "Psyllium", "Nitroglycerin"]', 0, 'Phlebotonic agents are used in some regions for chronic venous insufficiency and hemorrhoids.'),

    -- SECTION 10: HIGH-YIELD INTEGRATION & RECAP (311-335)
    (v_topic_id, 'A patient on chronic NSAIDs should be given which drug to prevent both gastric and duodenal ulcers?', '["Antacids", "PPIs", "H2 blockers", "Loperamide"]', 1, 'PPIs are superior to H2 blockers for NSAID-induced ulcer prevention.'),
    (v_topic_id, 'Which GI drug is known to cause "Disulfiram-like reaction" when taken with alcohol?', '["Omeprazole", "Metronidazole", "Loperamide", "Sucralfate"]', 1, 'Metronidazole inhibits acetaldehyde dehydrogenase.'),
    (v_topic_id, 'A patient with chronic kidney disease (CKD) and heartburn should avoid which antacid?', '["Magnesium Hydroxide", "Calcium Carbonate", "Aluminum Hydroxide", "All of the above"]', 0, 'Magnesium accumulation is the biggest risk in renal failure.'),
    (v_topic_id, 'Which drug is used for "Small Intestinal Bacterial Overgrowth" (SIBO)?', '["Loperamide", "Rifaximin", "Metoclopramide", "Pantoprazole"]', 1, 'Non-absorbable antibiotics are preferred.'),
    (v_topic_id, 'What is the role of "Simethicone" in GI pharmacology?', '["Antacid", "Anti-foaming agent that reduces gas/bloating", "Laxative", "Antidiarrheal"]', 1, 'It breaks down gas bubbles in the gut.'),
    (v_topic_id, 'Which drug class can cause "Melanosis Coli" as a benign side effect?', '["Bulk laxatives", "Anthraquinone stimulants (Senna/Cascara)", "Osmotic laxatives", "PPIs"]', 1, 'Classic board-exam question.'),
    (v_topic_id, 'Which drug is an "Antiflatulent"?', '["Simethicone", "Bismuth", "Loperamide", "Metoclopramide"]', 0, 'Commonly found in Gas-X.'),
    (v_topic_id, 'The "Breath Test" for H. pylori works by detecting which enzyme''s activity?', '["Protease", "Urease", "Lipase", "Amylase"]', 1, 'H. pylori produces urease, which converts labeled urea into labeled CO2.'),
    (v_topic_id, 'What is the "Antidote" for Metoclopramide-induced acute dystonia?', '["Epinephrine", "Diphenhydramine or Benztropine", "Naloxone", "Flumazenil"]', 1, 'Anticholinergics restore the dopamine/acetylcholine balance.'),
    (v_topic_id, 'Which GI drug is associated with "Acute Pancreatitis" as a rare side effect?', '["Azathioprine", "Loperamide", "Omeprazole", "Sucralfate"]', 0, 'Thiopurines are a well-known drug cause of pancreatitis.'),
    (v_topic_id, 'Which drug class is used for the management of "Hypercalcemia" but can cause constipation as a GI side effect?', '["Bisphosphonates", "Calcium Carbonate", "Furosemide", "Steroids"]', 1, 'Calcium carbonate is an antacid but can also cause hypercalcemia and constipation.'),
    (v_topic_id, 'A patient with GERD who has "Nocturnal Acid Breakthrough" on PPIs might benefit from adding which drug at night?', '["Another PPI", "H2 receptor antagonist (e.g., Famotidine)", "Antacid", "Prokinetic"]', 1, 'H2 blockers are particularly good at suppressing basal nocturnal acid.'),
    (v_topic_id, 'Which drug is an Alpha-2 agonist used for "Diabetic Diarrhea"?', '["Clonidine", "Metoclopramide", "Loperamide", "Octreotide"]', 0, 'Clonidine can reduce fluid secretion in the diabetic gut.'),
    (v_topic_id, 'The mechanism of "Lubiprostone" in IBS-C involves:', '["Bulk", "ClC-2 Chloride channel activation", "Guanylate Cyclase-C stimulation", "5-HT4 agonism"]', 1, 'It is the only ClC-2 activator on the list.'),
    (v_topic_id, 'Which drug is a "Guanylate Cyclase-C Agonist" that also has a benefit in reducing abdominal pain in IBS-C?', '["Linaclotide", "Lubiprostone", "Psyllium", "Docusate"]', 0, 'cGMP also inhibits pain-sensing nerves in the gut.'),
    (v_topic_id, 'What is a common side effect of Alosetron that led to its temporary withdrawal?', '["Liver failure", "Ischemic Colitis", "Blindness", "Pancreatitis"]', 1, 'Severe slowing of blood flow to the colon.'),
    (v_topic_id, 'Which drug is used for "Celiac Disease" primarily?', '["Gluten-free diet (No drugs currently curative)", "Prednisone", "Mesalamine", "Azathioprine"]', 0, 'Diet is the cornerstone of Celiac management.'),
    (v_topic_id, 'What is the "Standard Duration" for H. pylori triple therapy?', '["3 days", "7-14 days", "30 days", "6 months"]', 1, '14 days is now preferred for better eradication rates.'),
    (v_topic_id, 'Which drug should be avoided in patients with G6PD deficiency due to risk of hemolysis?', '["Mesalamine", "Sulfasalazine", "Omeprazole", "Metoclopramide"]', 1, 'The sulfa component can trigger hemolysis.'),
    (v_topic_id, 'The primary goal of "Maintenance Therapy" in IBD is to:', '["Cure the disease", "Prevent flares and maintain remission", "Save money", "Increase weight"]', 1, 'IBD is a chronic, relapsing condition.');

    RAISE NOTICE 'SUCCESS: GI Pharmacology MCQ Part 5 (281-335) registered.';
END $$;

COMMIT;
