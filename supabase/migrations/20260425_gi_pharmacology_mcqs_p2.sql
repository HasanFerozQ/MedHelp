-- Migration: Year 2 - GI Pharmacology MCQ Bank (PART 2: 71-140)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (Motility & IBS)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'gi-pharmacology' LIMIT 1;

    -- SECTION 3: MOTILITY & LAXATIVES (71-105)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which macrolide antibiotic is used off-label as a prokinetic agent because it stimulates Motilin receptors?', '["Azithromycin", "Erythromycin", "Clarithromycin", "Telithromycin"]', 1, 'Erythromycin acts as a motilin agonist to stimulate gastric emptying.'),
    (v_topic_id, 'What is the mechanism of action of Bulk-forming laxatives (e.g., Psyllium)?', '["Directly stimulate nerves", "Absorb water and expand, stimulating peristalsis", "Softening the stool with oil", "Increasing salt in the lumen"]', 1, 'They mimic dietary fiber.'),
    (v_topic_id, 'Which laxative is an osmotic agent used for rapid bowel prep before colonoscopy?', '["Psyllium", "Polyethylene Glycol (PEG)", "Mineral Oil", "Bisacodyl"]', 1, 'PEG is a balanced osmotic that doesn''t cause electrolyte shifts.'),
    (v_topic_id, 'Lactulose is used in Hepatic Encephalopathy because it:', '["Is a strong stimulant", "Acidifies the gut and traps ammonia as ammonium (NH4+)", "Kills gut bacteria directly", "Increases glucose"]', 1, 'By lowering pH, it converts NH3 (diffusible) to NH4+ (non-diffusible).'),
    (v_topic_id, 'What is the mechanism of action of Bisacodyl and Senna?', '["Osmotic action", "Direct stimulation of the enteric nervous system and colon", "Lubrication", "Bulk forming"]', 1, 'These are "Stimulant" laxatives.'),
    (v_topic_id, 'Chronic use of Anthraquinone laxatives (like Senna) can lead to which harmless colon condition?', '["Colon cancer", "Melanosis coli", "Ulcerative colitis", "Diverticulitis"]', 1, 'Pigment-laden macrophages give the mucosa a dark brown appearance.'),
    (v_topic_id, 'Which drug is a stool softener (Surfactant) that allows water and lipids to penetrate the stool?', '["Docusate", "Mineral Oil", "Lactulose", "Psyllium"]', 0, 'Docusate is used primarily to prevent straining in patients with heart disease or post-surgery.'),
    (v_topic_id, 'A major risk of using Mineral Oil as a laxative is:', '["Hypermagnesemia", "Aspiration pneumonia (Lipid pneumonia) and interference with fat-soluble vitamins", "Lactic acidosis", "Renal failure"]', 1, 'It should not be taken before bed or by those at risk of aspiration.'),
    (v_topic_id, 'What is the mechanism of action of Lubiprostone?', '["Stimulates 5-HT4 receptors", "Activates Type 2 Chloride channels (ClC-2) in the small intestine", "Blocks opioid receptors", "Bulk forming"]', 1, 'It increases fluid secretion into the lumen.'),
    (v_topic_id, 'Linaclotide and Plecanatide are used for chronic constipation. What is their mechanism?', '["D2 antagonism", "Agonism at Guanylate Cyclase-C (GC-C) receptors", "M3 stimulation", "H1 blockade"]', 1, 'GC-C activation increases cGMP and stimulates chloride and bicarbonate secretion.'),
    (v_topic_id, 'Which drug is a peripherally acting mu-opioid receptor antagonist (PAMORA) used for opioid-induced constipation?', '["Loperamide", "Methylnaltrexone", "Naloxone", "Diphenoxylate"]', 1, 'It blocks the constipating effects of opioids in the gut without affecting analgesia in the brain.'),
    (v_topic_id, 'Prucalopride is a prokinetic drug used for chronic idiopathic constipation. Its mechanism is:', '["5-HT3 antagonist", "5-HT4 receptor agonist", "D2 agonist", "Motilin antagonist"]', 1, '5-HT4 stimulation increases colonic mass movements.'),
    (v_topic_id, 'Which laxative is associated with a risk of acute phosphate nephropathy?', '["Magnesium citrate", "Sodium Phosphate", "Lactulose", "Senna"]', 1, 'High doses of phosphate used for bowel prep can cause renal damage.'),
    (v_topic_id, 'Metoclopramide increases the tone of which structure?', '["Upper esophageal sphincter", "Lower esophageal sphincter (LES)", "Pyloric sphincter", "Anal sphincter"]', 1, 'By increasing LES tone, it helps in GERD.'),
    (v_topic_id, 'The laxative effect of Magnesium salts occurs because:', '["They stimulate the vagus", "They are osmotically active and also stimulate CCK release", "They are slippery", "They kill bacteria"]', 1, 'Magnesium has dual osmotic and secretagogue properties.'),
    (v_topic_id, 'In chronic opioid use, which type of laxative should generally be avoided as a first-line mono-therapy?', '["Stimulant", "Bulk-forming", "Osmotic", "Stool softener"]', 1, 'Fiber (Bulk) can cause impaction if motility is severely suppressed by opioids.'),
    (v_topic_id, 'Alvimopan is a PAMORA used specifically for:', '["Chronic constipation", "Accelerating recovery of bowel function after bowel resection", "IBS-D", "Diarrhea"]', 1, 'It is restricted to hospital use for post-operative ileus.'),
    (v_topic_id, 'What is the primary action of Tegaserod?', '["5-HT3 antagonist", "Partial 5-HT4 agonist", "D2 blocker", "NK1 antagonist"]', 1, 'Used in IBS-C, though its use is restricted due to CV concerns.'),
    (v_topic_id, 'Which drug class is used to treat "Bowel Prep" associated electrolyte imbalance?', '["None (they cause them)", "Balanced PEG-electrolyte solutions", "Hypertonic saline", "Furosemide"]', 1, 'PEG with electrolytes is designed to be iso-osmotic.'),
    (v_topic_id, 'Metoclopramide is useful in which diabetic complication?', '["Retinopathy", "Gastroparesis", "Nephropathy", "Neuropathy"]', 1, 'It treats the delayed gastric emptying common in diabetics.'),
    (v_topic_id, 'Which opioid-derived antidiarrheal has zero potential for addiction because it does not cross the BBB?', '["Diphenoxylate", "Loperamide", "Codeine", "Paregoric"]', 1, 'Loperamide is a substrate for P-glycoprotein, which pumps it out of the brain.'),
    (v_topic_id, 'Why is Atropine added to Diphenoxylate (Lomotil)?', '["To increase potency", "To discourage abuse/overdose (due to anticholinergic side effects)", "To treat cramps", "To prevent nausea"]', 1, 'The unpleasant atropine effects prevent people from taking high doses for a "high."'),
    (v_topic_id, 'What is the mechanism of Eluxadoline in IBS-D?', '["Mu-opioid agonist and Delta-opioid antagonist", "5-HT3 antagonist", "Muscarinic blocker", "Antibiotic"]', 0, 'It acts locally in the gut to reduce pain and diarrhea.'),
    (v_topic_id, 'Which drug is a bile acid sequestrant used to treat diarrhea caused by bile acid malabsorption?', '["Loperamide", "Cholestyramine", "Octreotide", "Bismuth"]', 1, 'Bile acids in the colon act as osmotic laxatives.'),
    (v_topic_id, 'Octreotide is used for which type of diarrhea?', '["Infectious", "Secretory diarrhea (e.g., VIPoma, Carcinoid syndrome)", "Constipation-predominant", "IBS"]', 1, 'It inhibits the secretion of multiple GI hormones.'),
    (v_topic_id, 'Which drug is a 5-HT3 antagonist used for severe, treatment-resistant IBS with diarrhea (IBS-D) in women?', '["Ondansetron", "Alosetron", "Tegaserod", "Lubiprostone"]', 1, 'Alosetron has a restricted program due to the risk of ischemic colitis.'),
    (v_topic_id, 'What is the most serious side effect of Alosetron?', '["Seizures", "Severe constipation and Ischemic Colitis", "Liver failure", "Kidney failure"]', 1, 'It can significantly slow transit and cause gut ischemia.'),
    (v_topic_id, 'Which antibiotic is used to treat IBS without constipation (IBS-D) by altering gut flora?', '["Amoxicillin", "Rifaximin", "Ciprofloxacin", "Metronidazole"]', 1, 'Rifaximin is a non-absorbable antibiotic.'),
    (v_topic_id, 'Antispasmodics like Dicyclomine and Hyoscyamine work in IBS by:', '["Blocking Serotonin", "Blocking Muscarinic (M3) receptors on smooth muscle", "Stimulating Opioid receptors", "Blocking Chloride channels"]', 1, 'They reduce the "spasms" and pain by relaxing gut muscle.'),
    (v_topic_id, 'Which drug is used for Traveler''s Diarrhea and is also used in hepatic encephalopathy?', '["Loperamide", "Rifaximin", "Bismuth", "Doxycycline"]', 1, 'Rifaximin is versatile for gut-lumen infections and ammonia reduction.'),
    (v_topic_id, 'What is a contraindication for antidiarrheal use?', '["Mild food poisoning", "Severe bloody diarrhea, high fever, or suspected systemic infection", "Running a marathon", "Anxiety"]', 1, 'Stopping diarrhea in cases of C. diff or EHEC can lead to toxic megacolon.'),
    (v_topic_id, 'How does Loperamide stop diarrhea?', '["Decreases circular and longitudinal muscle activity", "Increases fluid absorption", "Inhibits gastrin", "A and B"]', 3, 'It slows transit time and allows more water to be reabsorbed.'),
    (v_topic_id, 'Which IBS medication is a chloride channel activator?', '["Alosetron", "Lubiprostone", "Linaclotide", "Dicyclomine"]', 1, 'Lubiprostone stimulates ClC-2.'),
    (v_topic_id, 'Side effect of Linaclotide is primarily:', '["Constipation", "Diarrhea", "Headache", "Weight gain"]', 1, 'The excessive secretion can cause loose stools.'),
    (v_topic_id, 'Which drug is used specifically for the pain associated with IBS?', '["Loperamide", "Low-dose Tricyclic Antidepressants (TCAs)", "Laxatives", "Antacids"]', 1, 'TCAs (like Amitriptyline) modulate visceral hypersensitivity.'),

    -- SECTION 4: IBS & SPECIAL MOTILITY (106-140)
    (v_topic_id, 'The "Triple Action" of Bismuth in diarrhea includes:', '["Anti-secretory, Anti-inflammatory, and Anti-microbial", "Bulk, Lubrication, Osmotic", "D2 block, M1 block, H1 block", "None"]', 0, 'Salicylate is anti-inflammatory; Bismuth is antimicrobial.'),
    (v_topic_id, 'Naloxegol is a PAMORA. What is its PEGylated structure for?', '["To increase potency", "To prevent crossing the blood-brain barrier", "To allow IV use", "To prevent liver metabolism"]', 1, 'PEGylation keeps it peripheral.'),
    (v_topic_id, 'Which drug is an SSRI sometimes used for IBS with constipation (IBS-C)?', '["Fluoxetine", "Amitriptyline", "Loperamide", "Psyllium"]', 0, 'SSRIs generally increase gut motility as a side effect, which helps in IBS-C.'),
    (v_topic_id, 'Cisapride was withdrawn from most markets because it caused:', '["Liver failure", "Fatal cardiac arrhythmias (Long QT)", "Blindness", "Kidney stones"]', 1, 'It blocked HERG K+ channels in the heart.'),
    (v_topic_id, 'Which 5-HT4 agonist is safer than Cisapride regarding the heart?', '["Tegaserod", "Prucalopride", "Alosetron", "Ondansetron"]', 1, 'Prucalopride is highly selective for 5-HT4 and doesn''t affect cardiac channels.'),
    (v_topic_id, 'Lactulose can cause which side effect in high doses?', '["Constipation", "Flatulence and abdominal cramping", "Hypoglycemia", "Hypernatremia"]', 1, 'Fermentation of the sugar by bacteria produces gas.'),
    (v_topic_id, 'Which drug is a Guanylate Cyclase-C agonist that is NOT absorbed systemically?', '["Linaclotide", "Lubiprostone", "Tegaserod", "Metoclopramide"]', 0, 'Linaclotide works purely within the intestinal lumen.'),
    (v_topic_id, 'IBS-D patients often have high levels of which neurotransmitter in the gut?', '["Dopamine", "Serotonin (5-HT)", "Norepinephrine", "GABA"]', 1, 'Excess 5-HT leads to hypermotility and pain.'),
    (v_topic_id, 'The standard "Bowel Regimen" for a patient on opioids is:', '["Laxative + Stool Softener", "Bulk-forming fiber only", "Antacids", "Bismuth"]', 0, 'Usually a stimulant (Senna) and a softener (Docusate).'),
    (v_topic_id, 'What is the role of Crofelemer?', '["Treatment of HIV-associated non-infectious diarrhea", "Treatment of IBD", "Prokinetic", "Antispasmodic"]', 0, 'It inhibits chloride channels (CFTR and CaCC) to reduce water loss.'),
    (v_topic_id, 'Which natural oil is an antispasmodic used in IBS?', '["Mineral oil", "Peppermint oil", "Castor oil", "Olive oil"]', 1, 'Menthol in peppermint oil acts as a natural calcium channel blocker in the gut.'),
    (v_topic_id, 'Castor oil works by being hydrolyzed to Ricinoleic acid, which:', '["Is a lubricant", "Irritates the gut and stimulates motility", "Absorbs water", "Kills parasites"]', 1, 'It is a very potent stimulant laxative (often used in traditional medicine).'),
    (v_topic_id, 'Why should patients with IBS-C avoid taking high-dose Loperamide?', '["It causes heart failure", "It will worsen their constipation significantly", "It causes ulcers", "It is ineffective"]', 1, 'Obviously, an antidiarrheal worsens constipation.'),
    (v_topic_id, 'Which drug class is used for the "Bloating" symptom of IBS?', '["Antibiotics (Rifaximin) or Probiotics", "Laxatives", "Antacids", "Steroids"]', 0, 'Bloating is often due to bacterial fermentation.'),
    (v_topic_id, 'Tegaserod is currently approved only for which group?', '["Children", "Men with IBS-C", "Women < 65 with IBS-C and low CV risk", "Elderly"]', 2, 'Usage is limited due to rare ischemic events.'),
    (v_topic_id, 'Which mu-opioid receptor agonist is used for diarrhea but is a Schedule IV controlled substance?', '["Loperamide", "Diphenoxylate", "Eluxadoline", "Paregoric"]', 2, 'Eluxadoline has some central activity, hence the scheduling.'),
    (v_topic_id, 'What is "Secretory Diarrhea"?', '["Diarrhea from eating too much sugar", "Excessive active secretion of electrolytes and water into the lumen", "Diarrhea from fiber", "Bleeding"]', 1, 'Seen in cholera or hormonal tumors.'),
    (v_topic_id, 'Which drug is a somatostatin analog used to treat dumping syndrome after gastric surgery?', '["Octreotide", "Loperamide", "Metoclopramide", "Pantoprazole"]', 0, 'Octreotide slows gastric emptying and hormonal surges.'),
    (v_topic_id, 'In pediatric diarrhea, what is the most important treatment?', '["Loperamide", "Oral Rehydration Salts (ORS)", "Antibiotics", "Bismuth"]', 1, 'Maintaining hydration is life-saving.'),
    (v_topic_id, 'The use of Probiotics in IBS aims to:', '["Kill all bacteria", "Restore a healthy balance of gut microflora", "Speed up transit", "Inhibit acid"]', 1, 'Lactobacillus and Bifidobacterium are commonly used.'),
    (v_topic_id, 'Which laxative should be avoided in patients with heart failure due to sodium load?', '["Polyethylene Glycol", "Sodium Phosphate and Sodium Bicarbonate", "Mineral Oil", "Psyllium"]', 1, 'Sodium can cause fluid retention and HF exacerbation.'),
    (v_topic_id, 'What is the risk of using Loperamide in very high "megadoses" (abuse)?', '["Liver failure", "QT prolongation and fatal arrhythmias", "Kidney stones", "Blindness"]', 1, 'At extremely high doses, it can cross the BBB and also affect cardiac conduction.'),
    (v_topic_id, 'Which drug is used for "Functional Dyspepsia" to increase gastric accommodation?', '["Buspirone", "Metoclopramide", "Omeprazole", "Sucralfate"]', 0, 'Buspirone (a 5-HT1A agonist) helps the stomach relax and expand for food.'),
    (v_topic_id, 'Chronic laxative abuse can lead to:', '["Electrolyte imbalance and \"Cathartic Colon\"", "Weight loss", "Super-strength bowels", "Improved digestion"]', 0, 'The colon becomes atonic and dependent on laxatives.'),
    (v_topic_id, 'What is a common side effect of Prucalopride?', '["Constipation", "Headache", "Weight gain", "Drowsiness"]', 1, 'Headache is a common side effect of 5-HT4 agonists.'),
    (v_topic_id, 'Which drug is used to treat fecal incontinence by increasing anal sphincter tone?', '["Loperamide", "Phenylephrine (topical)", "Docusate", "Psyllium"]', 1, 'Alpha-1 agonists increase sphincter contraction.'),
    (v_topic_id, 'Octreotide side effects include All EXCEPT:', '["Gallstones (Biliary sludge)", "Steatorrhea", "Hyperglycemia or Hypoglycemia", "Rapid hair growth"]', 3, 'Octreotide inhibits CCK and gallbladder contraction, leading to stones.'),
    (v_topic_id, 'The mechanism of Linaclotide involves an increase in which secondary messenger?', '["cAMP", "cGMP", "IP3", "Calcium"]', 1, 'Via Guanylate Cyclase-C stimulation.'),
    (v_topic_id, 'Which laxative is a "Hyperosmolar Sugar" that is not absorbed?', '["Lactulose and Sorbitol", "Glucose", "Fructose", "Sucrose"]', 0, 'They pull water into the colon.'),
    (v_topic_id, 'What is the primary clinical use of Methylnaltrexone?', '["Heroin overdose", "Opioid-induced constipation in palliative care", "Diarrhea", "Alcoholism"]', 1, 'It does not reverse the pain relief of the opioids.'),
    (v_topic_id, 'Dicyclomine is often referred to as a "Smooth Muscle Relaxant." Which receptor does it block?', '["Alpha-1", "Beta-2", "M3 Muscarinic", "D2"]', 2, 'It is an anticholinergic.'),
    (v_topic_id, 'Which antidiarrheal is a clay-like substance that adsorbs toxins?', '["Loperamide", "Attapulgite / Kaolin-Pectin", "Bismuth", "Cholestyramine"]', 1, 'Adsorbents bind toxins and water in the lumen.'),
    (v_topic_id, 'Why is Loperamide sold Over-the-Counter while Diphenoxylate is Prescription?', '["Loperamide is stronger", "Loperamide has much lower abuse potential", "Diphenoxylate is cheaper", "None"]', 1, 'Loperamide is very safe regarding central effects at normal doses.'),
    (v_topic_id, 'The role of 5-HT4 receptors in the gut is to:', '["Inhibit motility", "Promote the release of Acetylcholine and stimulate peristalsis", "Increase acid", "Cause pain"]', 1, 'They are the "pro-motility" serotonin receptors.');

    RAISE NOTICE 'SUCCESS: GI Pharmacology MCQ Part 2 (71-140) registered.';
END $$;

COMMIT;
