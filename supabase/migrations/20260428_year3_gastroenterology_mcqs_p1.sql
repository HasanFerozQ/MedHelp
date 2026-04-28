-- Migration: Year 3 - Gastroenterology MCQ Bank (PART 1: 1-80)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-28

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'gastroenterology' LIMIT 1;

    -- SECTION 1: ESOPHAGUS (GERD, ACHALASIA, MOTILITY)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '1: What is the most common symptom of Gastroesophageal Reflux Disease (GERD)?', '["Dysphagia", "Heartburn (Pyrosis)", "Odynophagia", "Weight loss"]', 1, 'Heartburn is the hallmark symptom of GERD. (Harrison''s Ch. 321)'),
    (v_topic_id, '2: Which of the following is considered an "alarm symptom" in a patient with GERD?', '["Occasional belching", "Dysphagia", "Sour taste in mouth", "Bloating"]', 1, 'Dysphagia suggests a possible stricture or malignancy. (Step-Up)'),
    (v_topic_id, '3: "Barrett''s Esophagus" is characterized by which histological change?', '["Squamous metaplasia", "Intestinal (Columnar) metaplasia", "Dysplasia", "Atrophy"]', 1, 'Replacement of squamous epithelium with columnar cells (goblet cells). (Harrison''s Ch. 321)'),
    (v_topic_id, '4: What is the gold standard for diagnosing esophageal motility disorders like Achalasia?', '["Barium swallow", "Esophageal Manometry", "Endoscopy", "CT Chest"]', 1, 'Manometry measures the pressure and coordination of esophageal contractions. (Pocket Medicine)'),
    (v_topic_id, '5: "Bird''s beak" appearance on a barium swallow is characteristic of:', '["Esophageal web", "Achalasia", "Zenker''s Diverticulum", "Diffuse Esophageal Spasm"]', 1, 'Represents a dilated esophagus with a tapered lower sphincter. (Step-Up)'),
    (v_topic_id, '6: What is the first-line medical treatment for symptom relief in Achalasia?', '["Proton Pump Inhibitors", "Nitrates or Calcium Channel Blockers", "Antibiotics", "Steroids"]', 1, 'These help relax the Lower Esophageal Sphincter (LES). (Harrison''s Ch. 321)'),
    (v_topic_id, '7: "Schatzki ring" is typically found at the:', '["Upper esophagus", "Squamocolumnar junction (Lower esophagus)", "Pharynx", "Mid-esophagus"]', 1, 'A mucosal ring that causes intermittent dysphagia to solids. (Pocket Medicine)'),
    (v_topic_id, '8: Zenker''s Diverticulum is a "false" diverticulum that occurs through:', '["Killian''s triangle", "The diaphragm", "The stomach wall", "The pylorus"]', 0, 'An outpouching of the posterior pharyngeal wall. (Step-Up)'),
    (v_topic_id, '9: "Plummer-Vinson Syndrome" includes iron deficiency anemia, glossitis, and:', '["Esophageal varices", "Esophageal webs", "Achalasia", "GERD"]', 1, 'Commonly found in middle-aged women; increases risk of squamous cell CA. (Harrison''s Ch. 321)'),
    (v_topic_id, '10: "Nutcracker esophagus" is characterized by:', '["Lack of peristalsis", "High-amplitude peristaltic contractions", "Multiple diverticula", "Acid reflux"]', 1, 'A hypercontractile motility disorder. (Pocket Medicine)');

    -- SECTION 2: ESOPHAGEAL INFECTIONS & INJURIES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '11: What is the most common cause of infectious esophagitis in HIV/AIDS patients?', '["HSV", "Candida albicans", "CMV", "H. pylori"]', 1, 'Presents with white plaques on endoscopy. (Step-Up)'),
    (v_topic_id, '12: "Punch-out" ulcers in the esophagus are characteristic of:', '["Candida", "Herpes Simplex Virus (HSV)", "CMV", "Pill esophagitis"]', 1, 'CMV tends to cause large, linear ulcers. (Harrison''s Ch. 321)'),
    (v_topic_id, '13: "Mallory-Weiss tear" occurs at the gastroesophageal junction due to:', '["Acid reflux", "Forceful vomiting or retching", "Infection", "Alcoholism alone"]', 1, 'Mucosal laceration leading to hematemesis. (Pocket Medicine)'),
    (v_topic_id, '14: "Boerhaave Syndrome" refers to:', '["Mucosal tear", "Transmural rupture of the esophagus", "Esophageal cancer", "Variceal bleed"]', 1, 'A surgical emergency often following forceful vomiting. (Step-Up)'),
    (v_topic_id, '15: "Hamman''s crunch" (crepitus heard with heartbeat) is a sign of:', '["Pneumonia", "Pneumomediastinum (often from Boerhaave)", "Heart failure", "Asthma"]', 1, 'Air escaping into the mediastinum. (Harrison''s Ch. 321)'),
    (v_topic_id, '16: Eosinophilic Esophagitis (EoE) is classically associated with:', E'["Smoking", "Atopy (Asthma, Allergies) and \\"stacked rings\\" on endoscopy", "Alcohol", "Old age"]', 1, 'Immune-mediated allergic response. (Pocket Medicine)'),
    (v_topic_id, '17: Which medication is a common cause of "pill-induced" esophagitis?', '["Aspirin", "Alendronate (Bisphosphonates)", "Doxycycline", "All of the above"]', 3, 'These can cause direct mucosal irritation if they get stuck. (Step-Up)'),
    (v_topic_id, '18: What is the primary risk factor for Esophageal Adenocarcinoma in the Western world?', '["Smoking", "GERD/Barrett''s Esophagus", "Alcohol", "Hot tea"]', 1, 'Squamous cell CA is more associated with smoking and alcohol. (Harrison''s Ch. 83)'),
    (v_topic_id, '19: "Corkscrew esophagus" on barium swallow is classic for:', '["Achalasia", "Diffuse Esophageal Spasm (DES)", "GERD", "Scleroderma"]', 1, 'Represents uncoordinated, simultaneous contractions. (Step-Up)'),
    (v_topic_id, '20: In "Scleroderma esophagus", the LES pressure is characteristically:', '["High", "Low/Absent", "Normal", "Variable"]', 1, 'Leads to severe, refractory GERD. (Pocket Medicine)');

    -- SECTION 3: STOMACH & DUODENUM (GASTRITIS, PUD)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '21: Helicobacter pylori is most commonly associated with which condition?', '["Achalasia", "Peptic Ulcer Disease (PUD)", "GERD", "Celiac disease"]', 1, 'A major risk factor for both gastric and duodenal ulcers. (Harrison''s Ch. 165)'),
    (v_topic_id, '22: Which type of Peptic Ulcer classically IMPROVES with food?', '["Gastric Ulcer", "Duodenal Ulcer", "Both", "None"]', 1, 'Food triggers bicarbonate secretion which neutralizes acid in the duodenum. (Step-Up)'),
    (v_topic_id, '23: What is the most common cause of non-H. pylori Peptic Ulcer Disease?', '["Stress", "NSAID use", "Alcohol", "Spicy food"]', 1, 'NSAIDs inhibit prostaglandin synthesis, weakening the mucosal barrier. (Harrison''s Ch. 322)'),
    (v_topic_id, '24: "Zollinger-Ellison Syndrome" (ZES) is caused by a tumor secreting:', '["Insulin", "Gastrin", "Somatostatin", "Glucagon"]', 1, 'Leads to massive gastric acid hypersecretion and multiple ulcers. (Pocket Medicine)'),
    (v_topic_id, '25: What is the preferred non-invasive test for H. pylori eradication?', '["Serum antibody", "Urea Breath Test or Stool Antigen", "Endoscopy", "CT scan"]', 1, 'Serum antibodies remain positive for years even after treatment. (Step-Up)'),
    (v_topic_id, '26: "Cushing ulcer" is a stress ulcer associated with:', '["Severe burns (Curling)", "Increased Intracranial Pressure", "Sepsis", "Trauma"]', 1, 'Vagal overstimulation leads to acid hypersecretion. (Harrison''s Ch. 322)'),
    (v_topic_id, '27: "Curling ulcer" is associated with:', '["Head trauma", "Severe burns", "Renal failure", "Liver failure"]', 1, 'Reduced mucosal blood flow due to hypovolemia. (Step-Up)'),
    (v_topic_id, '28: Gastritis Type A (Autoimmune) typically affects which part of the stomach?', '["Antrum", "Body and Fundus", "Pylorus", "Cardia"]', 1, 'Associated with Pernicious Anemia and Vitamin B12 deficiency. (Harrison''s Ch. 322)'),
    (v_topic_id, '29: Gastritis Type B is primarily caused by:', '["Autoimmunity", "H. pylori infection", "Alcohol", "Bile reflux"]', 1, '"B" for Bacteria (H. pylori). Affects the antrum. (Step-Up)'),
    (v_topic_id, '30: What is the "Standard Triple Therapy" for H. pylori?', '["PPI + Amoxicillin + Clarithromycin", "PPI + Metronidazole + Tetracycline", "PPI + Bismuth", "PPI + Penicillin"]', 0, 'Used for 10-14 days. (Pocket Medicine)');

    -- SECTION 4: GASTRIC NEOPLASMS & MISC STOMACH
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '31: "Virchow''s node" refers to a metastatic node in the:', '["Right axilla", "Left supraclavicular fossa", "Umbilicus (Sister Mary Joseph)", "Groin"]', 1, 'Classic sign of advanced abdominal malignancy, often gastric. (Harrison''s Ch. 83)'),
    (v_topic_id, '32: "Sister Mary Joseph node" refers to metastasis in the:', '["Neck", "Umbilicus", "Pelvis", "Liver"]', 1, 'Nodule on the belly button. (Step-Up)'),
    (v_topic_id, '33: "Linitis plastica" (leather bottle stomach) is a feature of:', '["Gastritis", "Diffuse-type Gastric Adenocarcinoma", "PUD", "Menetrier disease"]', 1, 'Rigid, thickened stomach wall due to infiltrative cancer. (Harrison''s Ch. 83)'),
    (v_topic_id, '34: "Menetrier Disease" is characterized by:', '["Small folds", "Giant gastric mucosal folds and protein-losing enteropathy", "Multiple ulcers", "High acid"]', 1, 'Due to TGF-alpha overproduction. (Pocket Medicine)'),
    (v_topic_id, '35: What is the most common histological type of Gastric Cancer?', '["Lymphoma", "Adenocarcinoma", "GIST", "Carcinoid"]', 1, 'Accounts for >90% of gastric malignancies. (Step-Up)'),
    (v_topic_id, '36: Gastric MALT Lymphoma is uniquely associated with:', '["Smoking", "H. pylori infection", "Alcohol", "Celiac disease"]', 1, 'Often regresses with H. pylori eradication. (Harrison''s Ch. 83)'),
    (v_topic_id, '37: "Dumping Syndrome" is a common complication after:', '["Appendectomy", "Gastric bypass or partial gastrectomy", "Cholecystectomy", "Colonoscopy"]', 1, 'Rapid emptying of hyperosmolar contents into the small bowel. (Pocket Medicine)'),
    (v_topic_id, '38: Late Dumping Syndrome (1-3 hours post-meal) is primarily due to:', '["Dehydration", "Reactive Hypoglycemia", "Infection", "Bile reflux"]', 1, 'Excess insulin release in response to a sudden glucose load. (Step-Up)'),
    (v_topic_id, '39: "Gastroparesis" is most commonly caused by:', '["Cancer", "Diabetes Mellitus", "Infection", "Stress"]', 1, 'Autonomic neuropathy leads to delayed gastric emptying. (Harrison''s Ch. 322)'),
    (v_topic_id, '40: What is the first-line medication for Gastroparesis?', '["PPI", "Metoclopramide or Erythromycin (Prokinetics)", "Loperamide", "Ondansetron"]', 1, 'Erythromycin acts on motilin receptors. (Pocket Medicine)');

    -- SECTION 5: MALABSORPTION & SMALL BOWEL
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '41: Celiac Disease is an immune response to:', '["Lactose", "Gluten (specifically Gliadin)", "Fructose", "Casein"]', 1, 'Associated with HLA-DQ2 and DQ8. (Harrison''s Ch. 323)'),
    (v_topic_id, '42: What is the most sensitive screening test for Celiac Disease?', '["Anti-gliadin antibody", "IgA Tissue Transglutaminase (tTG) antibody", "Anti-centromere", "Colonoscopy"]', 1, 'Patients must be on a gluten-containing diet for accuracy. (Step-Up)'),
    (v_topic_id, '43: "Dermatitis herpetiformis" is a skin manifestation of:', '["Crohn''s", "Celiac Disease", "Ulcerative Colitis", "IBS"]', 1, 'Pruritic vesicles on extensor surfaces. (Pocket Medicine)'),
    (v_topic_id, '44: "Whipple''s Disease" is caused by:', '["A virus", "Tropheryma whipplei (bacterium)", "A fungus", "Autoimmunity"]', 1, 'Presents with weight loss, diarrhea, arthralgia, and PAS+ macrophages. (Harrison''s Ch. 323)'),
    (v_topic_id, '45: "Small Intestinal Bacterial Overgrowth" (SIBO) is diagnosed by:', '["Colonoscopy", "Hydrogen Breath Test", "Chest X-ray", "Fecal fat"]', 1, 'Excess bacteria ferment carbohydrates in the small bowel. (Step-Up)'),
    (v_topic_id, '46: Tropical Sprue differs from Celiac Disease because it:', '["Is genetic", "Responds to antibiotics (Tetracycline/Folate)", "Is caused by gluten", "Affects only the colon"]', 1, 'Occurs in tropical regions; infectious origin. (Pocket Medicine)'),
    (v_topic_id, '47: "Short Bowel Syndrome" typically occurs when less than ____ cm of small bowel remains.', '["500", "200", "50", "1000"]', 1, 'Results in significant malabsorption and need for TPN. (Harrison''s Ch. 323)'),
    (v_topic_id, '48: Lactose intolerance is caused by a deficiency of which enzyme?', '["Amylase", "Lactase", "Lipase", "Pepsin"]', 1, 'Leads to osmotic diarrhea and flatulence. (Step-Up)'),
    (v_topic_id, '49: "Carcinoid Syndrome" presents with flushing, diarrhea, and heart valve lesions due to excess:', '["Gastrin", "Serotonin", "Histamine", "Glucagon"]', 1, 'Usually occurs when a carcinoid tumor metastasizes to the liver. (Harrison''s Ch. 85)'),
    (v_topic_id, '50: What is the classic urine marker for Carcinoid Syndrome?', '["Glucose", "5-HIAA", "VMA", "Protein"]', 1, 'Breakdown product of serotonin. (Pocket Medicine)');

    -- SECTION 6: INFLAMMATORY BOWEL DISEASE (IBD) - CROHN''S
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '51: Crohn''s Disease is characterized by which type of inflammation?', '["Mucosal only", "Transmural", "Superficial", "None"]', 1, 'Can affect the entire thickness of the bowel wall. (Harrison''s Ch. 324)'),
    (v_topic_id, '52: "Skip lesions" and "Cobblestoning" on endoscopy are features of:', '["Ulcerative Colitis", "Crohn''s Disease", "IBS", "Celiac"]', 1, 'Inflammation is patchy and discontinuous. (Step-Up)'),
    (v_topic_id, '53: Crohn''s Disease can affect any part of the GI tract, but most commonly involves the:', '["Esophagus", "Terminal Ileum", "Rectum", "Duodenum"]', 1, 'Often presents as "ileocolitis." (Pocket Medicine)'),
    (v_topic_id, '54: "String sign" on barium imaging represents:', '["A healthy bowel", "Severe narrowing of the lumen (Stricture)", "Ulcers", "Fistulas"]', 1, 'Common in terminal ileal Crohn''s. (Step-Up)'),
    (v_topic_id, '55: "Creeping fat" on surgery is a hallmark of:', '["Obesity", "Crohn''s Disease", "Appendicitis", "Cancer"]', 1, 'Mesenteric fat wraps around the inflamed bowel segments. (Harrison''s Ch. 324)'),
    (v_topic_id, '56: Which complication is MORE common in Crohn''s than in UC?', '["Fistulas and Perianal disease", "Toxic megacolon", "Primary Sclerosing Cholangitis", "Rectal bleeding"]', 0, 'Due to the transmural nature of inflammation. (Pocket Medicine)'),
    (v_topic_id, '57: Granulomas on biopsy are found in about 50% of patients with:', '["Ulcerative Colitis", "Crohn''s Disease", "IBS", "Diverticulitis"]', 1, 'Non-caseating granulomas are a specific feature. (Step-Up)'),
    (v_topic_id, '58: What is the role of smoking in Crohn''s Disease?', '["Protective", "Major risk factor and worsens the disease", "No effect", "Cures it"]', 1, 'Contrast with UC where smoking may be "protective." (Harrison''s Ch. 324)'),
    (v_topic_id, '59: "ASCA" antibodies are more common in:', '["UC", "Crohn''s Disease", "Celiac", "Whipple''s"]', 1, 'Anti-Saccharomyces cerevisiae antibodies. (Pocket Medicine)'),
    (v_topic_id, '60: Which medication is often used to treat perianal fistulas in Crohn''s?', '["Loperamide", "Infliximab (Anti-TNF)", "Aspirin", "PPI"]', 1, 'Biological therapy is highly effective for fistulizing disease. (Step-Up)');

    -- SECTION 7: INFLAMMATORY BOWEL DISEASE (IBD) - ULCERATIVE COLITIS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '61: Ulcerative Colitis (UC) always involves the:', '["Ileum", "Rectum", "Appendix", "Mouth"]', 1, 'Inflammation starts in the rectum and spreads proximally in a continuous fashion. (Harrison''s Ch. 324)'),
    (v_topic_id, '62: "Lead pipe" colon on imaging is due to:', '["Fecal impaction", "Loss of haustration in chronic UC", "Obstruction", "Fistulas"]', 1, 'Reflects a shortened, featureless colon. (Step-Up)'),
    (v_topic_id, '63: "Crypt abscesses" are a histological hallmark of:', '["Crohn''s", "Ulcerative Colitis", "IBS", "Celiac"]', 1, 'Neutrophils within the colonic crypts. (Pocket Medicine)'),
    (v_topic_id, '64: What is a potentially fatal complication of severe UC?', '["Fistula", "Toxic Megacolon", "Malabsorption", "Anal fissure"]', 1, 'Non-obstructive colonic dilation >6cm with systemic toxicity. (Harrison''s Ch. 324)'),
    (v_topic_id, '65: "Primary Sclerosing Cholangitis" (PSC) is most strongly associated with:', '["Crohn''s", "Ulcerative Colitis", "IBS", "Gastritis"]', 1, 'About 70-80% of PSC patients have IBD, usually UC. (Pocket Medicine)'),
    (v_topic_id, '66: "p-ANCA" positivity is more common in:', '["Crohn''s", "Ulcerative Colitis", "Celiac", "Tropical Sprue"]', 1, 'Perinuclear antineutrophil cytoplasmic antibody. (Step-Up)'),
    (v_topic_id, '67: The risk of Colorectal Cancer in IBD begins to increase significantly after how many years of disease?', '["2 years", "8-10 years", "20 years", "1 year"]', 1, 'Requires regular surveillance colonoscopies. (Harrison''s Ch. 324)'),
    (v_topic_id, '68: Which of the following is an extra-intestinal manifestation of IBD?', '["Pyoderma gangrenosum", "Uveitis", "Erythema nodosum", "All of the above"]', 3, 'IBD is a systemic inflammatory disease. (Pocket Medicine)'),
    (v_topic_id, '69: "Backwash ileitis" can be seen in some cases of:', '["Crohn''s", "Ulcerative Colitis", "IBS", "Infection"]', 1, 'Mild inflammation of the terminal ileum in pancolitic UC. (Step-Up)'),
    (v_topic_id, '70: Total proctocolectomy is considered "curative" for which disease?', '["Crohn''s", "Ulcerative Colitis", "Both", "None"]', 1, 'Because UC is limited to the colon/rectum. (Harrison''s Ch. 324)');

    -- SECTION 8: LARGE BOWEL & RECTUM (DIVERTI-DISEASE, IBS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '71: What is the most common site for diverticula in the Western population?', '["Cecum", "Sigmoid Colon", "Ascending Colon", "Rectum"]', 1, 'High-pressure area due to smaller diameter. (Harrison''s Ch. 326)'),
    (v_topic_id, '72: Diverticulitis classically presents with pain in the:', '["Right Lower Quadrant", "Left Lower Quadrant", "Epigastrium", "Right Upper Quadrant"]', 1, '"Left-sided appendicitis." (Step-Up)'),
    (v_topic_id, '73: What is the preferred imaging modality for suspected acute diverticulitis?', '["Barium enema", "CT Abdomen/Pelvis with contrast", "Colonoscopy", "Plain X-ray"]', 1, 'Colonoscopy and barium enema are contraindicated in acute phase due to perforation risk. (Pocket Medicine)'),
    (v_topic_id, '74: What is the most common cause of painless, massive lower GI bleeding in the elderly?', '["Hemorrhoids", "Diverticulosis", "Colorectal cancer", "IBD"]', 1, 'Bleeding from diverticula is usually arterial and sudden. (Harrison''s Ch. 326)'),
    (v_topic_id, '75: Irritable Bowel Syndrome (IBS) is characterized by:', '["Bloody diarrhea", "Abdominal pain related to defecation and change in bowel habits without structural disease", "Weight loss", "Anemia"]', 1, 'A functional disorder; alarm symptoms should prompt further testing. (Step-Up)'),
    (v_topic_id, '76: According to the Rome IV criteria, IBS symptoms must be present for at least:', '["1 month", "3 months", "6 months", "1 year"]', 1, 'At least 1 day per week over the last 3 months. (Pocket Medicine)'),
    (v_topic_id, '77: Which medication is often used for diarrhea-predominant IBS (IBS-D)?', '["Loperamide", "Dicyclomine (Antispasmodic)", "Linaclotide", "All of the above"]', 1, 'Dicyclomine helps with cramping. (Harrison''s Ch. 325)'),
    (v_topic_id, '78: "Hemorrhoids" that prolapse upon defecation and require manual reduction are Grade:', '["I", "II", "III", "IV"]', 2, 'Grade IV are permanently prolapsed. (Step-Up)'),
    (v_topic_id, '79: "Anal fissures" are most commonly found in the:', '["Posterior midline", "Lateral walls", "Anterior midline", "Circumferential"]', 0, 'Usually due to trauma from hard stool. (Pocket Medicine)'),
    (v_topic_id, '80: "Ischemic Colitis" classically affects the "watershed" area at the:', '["Rectum", "Splenic Flexure", "Hepatic Flexure", "Cecum"]', 1, 'Area of limited collateral blood supply (Griffith''s point). (Harrison''s Ch. 327)');

    RAISE NOTICE 'SUCCESS: Gastroenterology MCQ Part 1 (1-80) registered.';
END $$;

COMMIT;
