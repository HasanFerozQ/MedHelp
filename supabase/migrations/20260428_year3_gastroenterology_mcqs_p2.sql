-- Migration: Year 3 - Gastroenterology MCQ Bank (PART 2: 81-160)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-28

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'gastroenterology' LIMIT 1;

    -- SECTION 9: COLORECTAL POLYPS & CANCER
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '81: Which type of colonic polyp has the highest malignant potential?', '["Hyperplastic", "Villous Adenoma", "Tubular Adenoma", "Inflammatory"]', 1, 'Villous adenomas are larger and more likely to contain cancer. (Harrison''s Ch. 84)'),
    (v_topic_id, '82: "Familial Adenomatous Polyposis" (FAP) is caused by a mutation in the ____ gene.', '["p53", "APC", "KRAS", "BRCA1"]', 1, 'Results in hundreds of polyps and near 100% risk of cancer by age 40. (Step-Up)'),
    (v_topic_id, '83: "Gardner Syndrome" includes colonic polyposis plus:', '["Osteomas and soft tissue tumors", "Pigmented spots on lips", "Brain tumors", "Skin tags"]', 0, 'A variant of FAP. (Pocket Medicine)'),
    (v_topic_id, '84: "Lynch Syndrome" (HNPCC) is due to a defect in:', '["DNA Mismatch Repair (MMR) genes", "Tumor suppressor genes", "Proto-oncogenes", "None"]', 0, 'Increases risk of colorectal, endometrial, and ovarian cancers. (Harrison''s Ch. 84)'),
    (v_topic_id, '85: What is the current recommended age to START colorectal cancer screening for average-risk individuals?', '["40", "45", "50", "60"]', 1, 'Guidelines were recently lowered from 50 to 45. (Step-Up / ACS)'),
    (v_topic_id, '86: "Apple core" lesion on a barium enema is highly suggestive of:', '["Crohn''s", "Colorectal Cancer", "Diverticulitis", "IBS"]', 1, 'Indicates a circumferential, constricting mass. (Pocket Medicine)'),
    (v_topic_id, '87: Right-sided (ascending) colon cancers typically present with:', '["Obstruction", "Occult bleeding and Iron deficiency anemia", "Changes in stool caliber", "Rectal pain"]', 1, 'They have more room to grow before causing obstruction. (Harrison''s Ch. 84)'),
    (v_topic_id, '88: Left-sided (descending) colon cancers are more likely to cause:', E'["Iron deficiency", "Obstruction and \\"pencil-thin\\" stools", "Liver failure", "Vitamin B12 deficiency"]', 1, 'The lumen is narrower and stool is more solid. (Step-Up)'),
    (v_topic_id, '89: Which tumor marker is used for MONITORING (not screening) colorectal cancer?', '["AFP", "CEA", "CA 19-9", "PSA"]', 1, 'Carcinoembryonic antigen. (Pocket Medicine)'),
    (v_topic_id, '90: "Peutz-Jeghers Syndrome" is characterized by hamartomatous polyps and:', '["Osteomas", "Hyperpigmented macules on the lips and oral mucosa", "Brain tumors", "Thyroid cancer"]', 1, 'STK11 mutation. (Harrison''s Ch. 326)');

    -- SECTION 10: INTESTINAL OBSTRUCTION & ISCHEMIA
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '91: What is the #1 cause of SMALL bowel obstruction (SBO) in adults?', '["Hernia", "Adhesions (post-surgical)", "Tumor", "Crohn''s"]', 1, 'Previous abdominal surgery is the biggest risk factor. (Step-Up)'),
    (v_topic_id, '92: "Step-ladder" appearance and multiple air-fluid levels on X-ray suggest:', '["Ileus", "Small Bowel Obstruction", "Constipation", "Perforation"]', 1, 'Signs of mechanical obstruction. (Harrison''s Ch. 326)'),
    (v_topic_id, '93: "Ogilvie Syndrome" refers to:', '["Mechanical obstruction", "Acute colonic pseudo-obstruction (dilation without mechanical cause)", "Gastric cancer", "Fecal impaction"]', 1, 'Often seen in severely ill patients. (Pocket Medicine)'),
    (v_topic_id, '94: What is the #1 cause of LARGE bowel obstruction in adults?', '["Adhesions", "Colorectal Cancer", "Volvulus", "Diverticulitis"]', 1, 'Unlike SBO, malignancy is the primary cause in the colon. (Step-Up)'),
    (v_topic_id, '95: "Coffee bean" sign on X-ray is diagnostic of:', '["Gallstone ileus", "Sigmoid Volvulus", "Intussusception", "Appendicitis"]', 1, 'A massive, air-filled loop of sigmoid colon. (Harrison''s Ch. 326)'),
    (v_topic_id, '96: "Intussusception" in adults is most often caused by:', '["Idiopathic", "A lead point (e.g., tumor)", "Infection", "Allergies"]', 1, 'Unlike in children, a pathological cause is usually found in adults. (Pocket Medicine)'),
    (v_topic_id, '97: "Acute Mesenteric Ischemia" classically presents with:', '["Severe abdominal pain, but a relatively normal physical exam (Pain out of proportion)", "Fever and chills", "Massive hematemesis", "Obvious peritoneal signs early on"]', 0, 'A "surgical abdomen" with a surprisingly soft belly initially. (Step-Up)'),
    (v_topic_id, '98: "Chronic Mesenteric Ischemia" (Intestinal Angina) presents as pain when?', '["When fasting", "Shortly after eating (post-prandial)", "During sleep", "Only when standing"]', 1, 'Due to inability to meet the increased blood flow demands of digestion. (Harrison''s Ch. 327)'),
    (v_topic_id, '99: What is the gold standard for diagnosing mesenteric ischemia?', '["CT scan", "Mesenteric Angiography", "Endoscopy", "Ultrasound"]', 1, 'Allows visualization of the arterial blockage. (Pocket Medicine)'),
    (v_topic_id, '100: "Pneumatosis intestinalis" (air in the bowel wall) on X-ray is a sign of:', '["Obstruction", "Bowel infarction/Ischemia", "IBS", "Constipation"]', 1, 'A grave sign indicating tissue death. (Step-Up)');

    -- SECTION 11: APPENDICITIS & PERITONEUM
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '101: Appendicitis pain typically starts in the ____ and migrates to the ____.', '["LLQ, RUQ", "Periumbilical area, RLQ", "RLQ, Epigastrium", "Back, Groin"]', 1, 'Classic migration pattern. (Harrison''s Ch. 326)'),
    (v_topic_id, '102: "McBurney''s point" is located:', '["1/3 of the way from the ASIS to the umbilicus", "At the umbilicus", "In the left flank", "Above the pubis"]', 0, 'Point of maximal tenderness in appendicitis. (Step-Up)'),
    (v_topic_id, '103: "Rovsing''s sign" is positive when:', '["Pain is felt in the RLQ when the LLQ is palpated", "Pain occurs with hip extension", "Pain occurs with internal rotation", "None"]', 0, 'Suggests peritoneal irritation. (Pocket Medicine)'),
    (v_topic_id, '104: What is the most common cause of appendicitis in adults?', '["Viral infection", "Fecalith (hardened stool)", "Cancer", "Parasites"]', 1, 'Obstructs the appendiceal lumen. (Harrison''s Ch. 326)'),
    (v_topic_id, '105: "Psoas sign" and "Obturator sign" are used to assess:', '["Heart failure", "Appendicitis", "Liver disease", "Renal stones"]', 1, 'Identify irritation from an inflamed appendix in specific positions. (Step-Up)'),
    (v_topic_id, '106: Spontaneous Bacterial Peritonitis (SBP) is diagnosed by an ascitic fluid PMN count >:', '["100 cells/mm3", "250 cells/mm3", "500 cells/mm3", "1000 cells/mm3"]', 1, 'Most common organism is E. coli. (Pocket Medicine)'),
    (v_topic_id, '107: What is the treatment of choice for SBP?', '["Surgery", "Third-generation cephalosporin (e.g., Cefotaxime)", "Vancomycin", "Metronidazole"]', 1, 'Infection occurs without an obvious intra-abdominal source. (Harrison''s Ch. 328)'),
    (v_topic_id, '108: Perforation of a hollow viscus presents with "free air" where on an upright X-ray?', '["Under the diaphragm", "In the bladder", "In the heart", "In the lungs"]', 0, 'Pneumoperitoneum. (Step-Up)'),
    (v_topic_id, '109: "Fitz-Hugh-Curtis Syndrome" is perihepatitis associated with:', '["Alcohol", "Pelvic Inflammatory Disease (Chlamydia/Gonorrhea)", "Hepatitis B", "Gallstones"]', 1, 'Causes "violin string" adhesions between the liver and abdominal wall. (Pocket Medicine)'),
    (v_topic_id, '110: "Secondary Peritonitis" differs from SBP because it:', '["Is less severe", "Is due to a primary source (e.g., perforated ulcer, appendicitis)", "Only affects children", "Is not infectious"]', 1, 'Requires surgical intervention. (Harrison''s Ch. 328)');

    -- SECTION 12: GI BLEEDING (OVERVIEW)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '111: "Melena" (black, tarry stool) typically indicates bleeding from:', '["Lower GI (Colon)", "Upper GI (above the Ligament of Treitz)", "Anus", "Small bowel only"]', 1, 'Blood is digested as it passes through the gut. (Harrison''s Ch. 33)'),
    (v_topic_id, '112: "Hematochezia" (bright red blood per rectum) usually signifies:', '["Upper GI bleed", "Lower GI bleed", "Stomach ulcer", "Liver failure"]', 1, 'Most often from the colon or rectum. (Step-Up)'),
    (v_topic_id, '113: Which of the following can cause an "Upper GI bleed" to present with hematochezia?', '["Small ulcer", "Massive, rapid hemorrhage", "Slow bleed", "Chronic gastritis"]', 1, 'Blood moves too fast to be digested. (Pocket Medicine)'),
    (v_topic_id, '114: A "BUN/Creatinine ratio > 20-30" in the context of GI bleeding suggests:', '["Lower GI source", "Upper GI source", "Renal failure", "Liver failure"]', 1, 'Due to digestion and absorption of blood proteins. (Harrison''s Ch. 33)'),
    (v_topic_id, '115: What is the most common cause of Upper GI Bleeding?', '["Varices", "Peptic Ulcer Disease", "Mallory-Weiss tear", "Cancer"]', 1, 'Accounts for about 50% of cases. (Step-Up)'),
    (v_topic_id, '116: "Hematemesis" refers to:', '["Bloody stool", "Vomiting of blood", "Blood in urine", "Coughing up blood"]', 1, 'Sign of an upper GI source. (Pocket Medicine)'),
    (v_topic_id, '117: What is the first-line treatment for an unstable patient with a massive GI bleed?', '["Endoscopy", "Volume resuscitation (IV fluids/blood)", "PPI", "Surgery"]', 1, 'Stabilize the patient before intervention. (Harrison''s Ch. 33)'),
    (v_topic_id, '118: "Occult GI bleeding" is detected by:', '["Visual inspection", "Fecal Occult Blood Test (FOBT) or FIT", "Endoscopy only", "CT scan"]', 1, 'Bleeding that is not visible to the patient. (Step-Up)'),
    (v_topic_id, '119: "Ligament of Treitz" is the anatomical landmark that divides:', '["Stomach and Duodenum", "Upper and Lower GI tract", "Small and Large bowel", "Colon and Rectum"]', 1, 'End of the duodenum. (Pocket Medicine)'),
    (v_topic_id, '120: "Angiodysplasia" is a common cause of lower GI bleeding in:', '["Children", "Elderly", "Athletes", "Pregnant women"]', 1, 'Arteriovenous malformations, often in the cecum. (Harrison''s Ch. 326)');

    -- SECTION 13: DIARRHEA & MOTILITY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '121: "Osmotic diarrhea" characteristically:', '["Continues while fasting", "Stops when the patient fasts", "Is always bloody", "Is caused by infection"]', 1, 'Due to unabsorbed solutes in the gut (e.g., Lactose). (Harrison''s Ch. 32)'),
    (v_topic_id, '122: "Secretory diarrhea" (like Cholera) is unique because it:', '["Stops with fasting", "Continues during fasting and has a small osmotic gap", "Only affects men", "Is never watery"]', 1, 'Active secretion of ions by the gut. (Step-Up)'),
    (v_topic_id, '123: Which pathogen is most likely to cause "Rice-water stools"?', '["Salmonella", "Vibrio cholerae", "Shigella", "Giardia"]', 1, 'Massive secretory diarrhea. (Pocket Medicine)'),
    (v_topic_id, '124: "Steatorrhea" refers to:', '["Bloody stool", "Fatty, foul-smelling, floating stools", "Hard stool", "Mucus in stool"]', 1, 'Sign of malabsorption (e.g., Pancreatic insufficiency, Celiac). (Harrison''s Ch. 32)'),
    (v_topic_id, '125: Which of the following is a common cause of "Inflammatory diarrhea" with blood and pus?', '["Giardia", "Shigella or Campylobacter", "Lactose intolerance", "Vibrio"]', 1, 'Pathogens that invade the mucosa. (Step-Up)'),
    (v_topic_id, '126: "Pseudomembranous colitis" is caused by:', '["Viral infection", "Clostridioides difficile toxin", "Amoeba", "Gluten"]', 1, 'Often follows antibiotic use. (Harrison''s Ch. 129)'),
    (v_topic_id, '127: What is the first-line treatment for C. difficile infection?', '["Penicillin", "Oral Vancomycin or Fidaxomicin", "Ciprofloxacin", "Metronidazole only"]', 1, 'Metronidazole is now considered second-line for most cases. (Pocket Medicine)'),
    (v_topic_id, '128: Diarrhea in a patient with a "fecal impaction" is called:', '["Secretory", "Overflow diarrhea", "Infectious", "Malabsorptive"]', 1, 'Liquid stool seeps around the hard mass. (Step-Up)'),
    (v_topic_id, '129: "Tenesmus" is the feeling of:', '["Pain when eating", "Incomplete defecation/Urge to stool", "Nausea", "Fullness"]', 1, 'Common in proctitis/UC. (Harrison''s Ch. 32)'),
    (v_topic_id, '130: Diarrhea + Dermatitis + Dementia + Death (the 4 D''s) is:', '["Scurvy", "Pellagra (Vitamin B3 deficiency)", "Beriberi", "Rickets"]', 1, 'Niacin deficiency. (Pocket Medicine)');

    -- SECTION 14: NAUSEA, VOMITING & MISC
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '131: "Projectile vomiting" without nausea in an infant is classic for:', '["GERD", "Hypertrophic Pyloric Stenosis", "Gastroenteritis", "Food allergy"]', 1, 'Palpable "olive-shaped" mass in the epigastrium. (Step-Up)'),
    (v_topic_id, '132: "Feculent vomiting" (vomiting material that looks/smells like stool) suggests:', '["Gastritis", "Distal Small Bowel or Colonic Obstruction", "Achalasia", "PUD"]', 1, 'Sign of long-standing obstruction. (Harrison''s Ch. 31)'),
    (v_topic_id, '133: Which brain area is the "Chemoreceptor Trigger Zone" (CTZ) for vomiting?', '["Hypothalamus", "Area Postrema in the Medulla", "Thalamus", "Frontal lobe"]', 1, 'Outside the blood-brain barrier; senses toxins. (Pocket Medicine)'),
    (v_topic_id, '134: Metoclopramide is a D2 antagonist that also has ____ effects.', '["Anticholinergic", "Prokinetic", "Sedative", "Antihistamine"]', 1, 'Increases GI motility. (Step-Up)'),
    (v_topic_id, '135: "Ondansetron" works by blocking which receptors?', '["Dopamine", "5-HT3 (Serotonin)", "Histamine", "Muscarinic"]', 1, 'Very effective for chemotherapy-induced nausea. (Harrison''s Ch. 31)'),
    (v_topic_id, '136: Chronic vomiting can lead to which acid-base disturbance?', '["Metabolic Acidosis", "Hypokalemic, Hypochloremic Metabolic Alkalosis", "Respiratory Acidosis", "None"]', 1, 'Due to loss of HCl and volume depletion. (Pocket Medicine)'),
    (v_topic_id, '137: "Scopolamine" patches are used for vomiting caused by:', '["Chemo", "Motion Sickness", "Infection", "Surgery"]', 1, 'Anticholinergic effect on the vestibular system. (Step-Up)'),
    (v_topic_id, '138: "Gastric volvulus" is a rare emergency often associated with:', '["Obesity", "Paraesophageal Hiatal Hernia", "Gastritis", "PUD"]', 1, 'Stomach twists on itself. (Harrison''s Ch. 322)'),
    (v_topic_id, '139: "Bezoars" are indigestible masses in the stomach made of:', '["Hair (Trichobezoar) or Vegetable fibers (Phytobezoar)", "Plastic", "Bone", "Ice"]', 0, 'Can cause obstruction. (Pocket Medicine)'),
    (v_topic_id, '140: What is the most common cause of "Gastroenteritis" worldwide?', '["Salmonella", "Norovirus", "E. coli", "Giardia"]', 1, 'Highly contagious, causes outbreaks in schools/cruises. (Harrison''s Ch. 135)');

    -- SECTION 15: NUTRITION & VITAMINS (GI RELATED)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '141: Vitamin B12 absorption requires "Intrinsic Factor" produced by:', '["Chief cells", "Parietal cells", "Goblet cells", "G cells"]', 1, 'Absorbed in the terminal ileum. (Harrison''s Ch. 322)'),
    (v_topic_id, '142: "Pernicious anemia" is due to antibodies against:', '["Vitamin B12", "Intrinsic Factor or Parietal cells", "Hemoglobin", "Thyroid"]', 1, 'Leads to macrocytic anemia and neurological symptoms. (Step-Up)'),
    (v_topic_id, '143: Fat-soluble vitamins (A, D, E, K) require ____ for absorption.', '["Acid", "Bile salts and Pancreatic Lipase", "Insulin", "Water"]', 1, 'Chronic cholestasis or pancreatic insufficiency lead to deficiency. (Pocket Medicine)'),
    (v_topic_id, '144: "Night blindness" is an early sign of ____ deficiency.', '["Vitamin C", "Vitamin A", "Vitamin E", "Vitamin K"]', 1, 'Essential for rhodopsin synthesis. (Harrison''s Ch. 329)'),
    (v_topic_id, '145: "Osteomalacia" and Rickets are caused by deficiency of:', '["Vitamin A", "Vitamin D", "Calcium only", "Vitamin C"]', 1, 'Impairs bone mineralization. (Step-Up)'),
    (v_topic_id, '146: Easy bruising and a prolonged PT are signs of ____ deficiency.', '["Vitamin A", "Vitamin K", "Iron", "Zinc"]', 1, 'Vitamin K is needed for clotting factors II, VII, IX, and X. (Pocket Medicine)'),
    (v_topic_id, '147: "Wernicke-Korsakoff Syndrome" is due to deficiency of:', '["Vitamin B12", "Vitamin B1 (Thiamine)", "Vitamin B6", "Folate"]', 1, 'Classic in chronic alcoholics. (Harrison''s Ch. 329)'),
    (v_topic_id, '148: "Scurvy" (bleeding gums, poor wound healing) is due to deficiency of:', '["Vitamin D", "Vitamin C", "Vitamin A", "Vitamin B"]', 1, 'Vitamin C is essential for collagen synthesis. (Step-Up)'),
    (v_topic_id, '149: Folate deficiency during pregnancy increases the risk of:', '["Down syndrome", "Neural tube defects", "Diabetes", "Asthma"]', 1, 'Supplementation is critical in the first trimester. (Pocket Medicine)'),
    (v_topic_id, '150: "Zinc deficiency" can cause which specific skin rash?', '["Eczema", "Acrodermatitis enteropathica (perioral/perianal rash)", "Hives", "Psoriasis"]', 1, 'Also causes impaired wound healing and taste changes. (Harrison''s Ch. 329)');

    -- SECTION 16: GI PROCEDURES (BASICS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '151: "ERCP" is used primarily to visualize and treat:', '["Stomach ulcers", "Biliary and Pancreatic ducts", "Colon polyps", "Esophageal varices"]', 1, 'Endoscopic Retrograde Cholangiopancreatography. (Harrison''s Ch. 331)'),
    (v_topic_id, '152: A common complication of ERCP is:', '["Pneumonia", "Acute Pancreatitis", "Heart attack", "Stroke"]', 1, 'Occurs in about 5-10% of cases. (Step-Up)'),
    (v_topic_id, '153: Colonoscopy is superior to CT for screening because it:', '["Is cheaper", "Allows for simultaneous biopsy and polyp removal", "Is less painful", "Requires no prep"]', 1, 'The "Gold Standard" for colorectal cancer prevention. (Pocket Medicine)'),
    (v_topic_id, '154: "Capsule endoscopy" is best for visualizing the:', '["Stomach", "Small Bowel", "Colon", "Esophagus"]', 1, 'Hard to reach with standard scopes. (Harrison''s Ch. 323)'),
    (v_topic_id, '155: "Flexible Sigmoidoscopy" only visualizes the:', '["Right colon", "Left colon (up to the splenic flexure)", "Stomach", "Small bowel"]', 1, 'Can be done with less prep but misses right-sided lesions. (Step-Up)'),
    (v_topic_id, '156: "Paracentesis" is the procedure to:', '["Drain the lungs", "Drain ascitic fluid from the abdomen", "Remove the gallbladder", "Biopsy the liver"]', 1, 'Used for diagnosis (e.g., SBP) and therapy (large volume). (Pocket Medicine)'),
    (v_topic_id, '157: "Liver biopsy" is the gold standard for staging:', '["Gallstones", "Liver fibrosis and cirrhosis", "Gastritis", "Pancreatitis"]', 1, 'Determines the degree of inflammation and scarring. (Harrison''s Ch. 331)'),
    (v_topic_id, '158: "Urea Breath Test" detects H. pylori by measuring labeled:', '["Oxygen", "Carbon Dioxide (CO2)", "Nitrogen", "Methane"]', 1, 'Bacteria break down labeled urea. (Step-Up)'),
    (v_topic_id, '159: "Fecal Fat Test" (72-hour collection) is the gold standard for:', '["Infection", "Steatorrhea/Malabsorption", "Bleeding", "Constipation"]', 1, 'Measures total fat excretion. (Pocket Medicine)'),
    (v_topic_id, '160: "Anoscopy" is used specifically to evaluate the:', '["Sigmoid colon", "Anal canal and distal rectum", "Stomach", "Duodenum"]', 1, 'Best for hemorrhoids and anal fissures. (Step-Up)');

    RAISE NOTICE 'SUCCESS: Gastroenterology MCQ Part 2 (81-160) registered.';
END $$;

COMMIT;
