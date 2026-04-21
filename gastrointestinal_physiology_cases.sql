-- ==========================================
-- GI Physiology Clinical Cases Migration
-- 25 Scenarios | Semester 2 First Year
-- ==========================================

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Get Topic ID
    SELECT id INTO v_topic_id FROM public.topics 
    WHERE title = 'Gastrointestinal Physiology' AND (semester_id = 2 OR usmle_step = 1) 
    LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "Gastrointestinal Physiology" not found.';
    END IF;

    -- 2. Clear existing cases for this topic
    DELETE FROM public.case_studies WHERE topic_id = v_topic_id;

    -- CASE 1
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Esophageal Motility and Swallowing', 'A 22-year-old healthy student swallows a bolus of water during a physiology demonstration.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The initial stage of swallowing is:', '["Entirely involuntary", "Entirely autonomic", "Voluntary", "Mediated only by the colon", "Independent of the brainstem"]', 2, 'The oral stage of swallowing is the only part under voluntary control.'),
    (v_case_id, 'Primary peristalsis in the esophagus is initiated by:', '["Gastric distension", "Swallowing", "Colonic mass movements", "Pancreatic secretion", "Enterohepatic circulation"]', 1, 'Swallowing triggers the vagal-mediated primary peristaltic wave to move food through the esophagus.'),
    (v_case_id, 'Failure of lower esophageal sphincter relaxation would primarily impair passage into the:', '["Pharynx", "Stomach", "Duodenum", "Jejunum", "Colon"]', 1, 'The LES is the gateway between the esophagus and the stomach.'),
    (v_case_id, 'The upper esophageal sphincter is composed mainly of:', '["Smooth muscle only", "Skeletal muscle", "Cardiac muscle", "Simple squamous epithelium", "Serosal tissue"]', 1, 'The UES (cricopharyngeus) consists of striated skeletal muscle.');

    -- CASE 2
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Achalasia Physiology', 'A 35-year-old man has progressive dysphagia to solids and liquids. Manometry shows impaired relaxation of the lower esophageal sphincter and absent normal esophageal peristalsis.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The primary motility defect is failure of:', '["Upper esophageal sphincter contraction", "Lower esophageal sphincter relaxation", "Gastric acid secretion", "Pyloric sphincter opening", "Ileocecal valve closure"]', 1, 'Achalasia is characterized by failure of the LES to relax due to loss of inhibitory neurons.'),
    (v_case_id, 'Normal relaxation of the lower esophageal sphincter is mediated mainly by:', '["Sympathetic stimulation only", "Inhibitory enteric neurons releasing NO/VIP", "Histamine release", "Secretin release", "Cholecystokinin only"]', 1, 'Nitric Oxide (NO) and Vasoactive Intestinal Peptide (VIP) are the primary inhibitory neurotransmitters in the gut.'),
    (v_case_id, 'Dysphagia to both solids and liquids from the start suggests:', '["A purely mechanical obstruction", "A motility disorder", "Peptic ulcer disease", "Malabsorption", "Pancreatic insufficiency"]', 1, 'Mechanical obstructions usually start with solids only; motility disorders affect both from the onset.');

    -- CASE 3
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Gastric Acid Secretion', 'A physiology professor asks a student about the mechanism of gastric acid secretion.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Hydrochloric acid is secreted by:', '["Chief cells", "Parietal cells", "G cells", "D cells", "Enterochromaffin cells"]', 1, 'Parietal cells in the fundus/body secretes HCl and intrinsic factor.'),
    (v_case_id, 'The final step in acid secretion depends on the:', '["Na+/K+ ATPase", "H+/K+ ATPase", "Na+/glucose cotransporter", "NKCC transporter", "ENaC channel"]', 1, 'The proton pump (H+/K+ ATPase) is the molecular target for PPIs.'),
    (v_case_id, 'Histamine stimulates acid secretion mainly via which receptor on parietal cells?', '["H1", "H2", "M3", "CCK-A", "Beta-2"]', 1, 'H2 receptors increase intracellular cAMP to trigger acid release.'),
    (v_case_id, 'Acetylcholine stimulates parietal cells primarily through:', '["M3 receptors", "H2 receptors", "Nicotinic receptors only", "Alpha-1 receptors", "D2 receptors"]', 0, 'ACh from the vagus nerve acts on M3 muscarinic receptors.');

    -- CASE 4
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Regulation of Gastric Acid', 'A patient is given a protein-rich meal. Gastric acid secretion rises.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which hormone directly stimulates parietal and ECL-related acid secretion after a meal?', '["Secretin", "Gastrin", "Somatostatin", "GIP", "Motilin"]', 1, 'Gastrin is the primary hormonal driver of post-prandial acid secretion.'),
    (v_case_id, 'Gastrin is secreted by:', '["Chief cells", "G cells in the antrum", "Parietal cells", "D cells", "Pancreatic acinar cells"]', 1, 'G cells are located in the gastric antral mucosa.'),
    (v_case_id, 'Somatostatin normally acts to:', '["Increase gastrin release", "Inhibit gastric acid secretion", "Increase pancreatic enzyme secretion", "Stimulate gallbladder contraction", "Increase motilin release"]', 1, 'Somatostatin is the "universal inhibitor" of the GI tract.'),
    (v_case_id, 'Which cell releases histamine in the stomach?', '["Chief cell", "ECL cell", "Goblet cell", "Enterocyte", "Brunner gland cell"]', 1, 'Enterochromaffin-like (ECL) cells release histamine when stimulated by gastrin or ACh.');

    -- CASE 5
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Phases of Gastric Secretion', 'A physiology question asks about the phases of gastric secretion during a meal.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The cephalic phase is triggered primarily by:', '["Food in the small intestine", "Sight, smell, taste, and thought of food", "Colonic distension", "Bile salt reabsorption", "Pancreatic bicarbonate secretion"]', 1, 'Thinking about or seeing food prepares the stomach for digestion.'),
    (v_case_id, 'The cephalic phase is mediated mainly through the:', '["Vagus nerve", "Phrenic nerve", "Hypoglossal nerve", "Sympathetic chain only", "Pudendal nerve"]', 0, 'Parasympathetic vagal output drives the cephalic phase.'),
    (v_case_id, 'The intestinal phase of gastric secretion is generally:', '["Strongly stimulatory only", "Mostly inhibitory overall", "Independent of duodenal contents", "Due only to motilin", "Due only to bile salts"]', 1, 'Hormones like secretin and CCK inhibit gastric activity once food reaches the small intestine.');

    -- CASE 6
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pepsin and Protein Digestion', 'A patient with severe hypochlorhydria has impaired activation of pepsin.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Pepsinogen is secreted by:', '["Parietal cells", "Chief cells", "G cells", "D cells", "ECL cells"]', 1, 'Chief cells are found in the gastric pits of the fundus.'),
    (v_case_id, 'Pepsinogen is converted to pepsin primarily by:', '["Alkaline pH", "Gastric acid", "Pancreatic bicarbonate", "Bile salts", "Trypsin"]', 1, 'The cleavage of pepsinogen to the active pepsin protease is highly pH-dependent (pH < 3.0).'),
    (v_case_id, 'Pepsin functions best in:', '["Neutral pH", "Acidic pH", "Strongly alkaline pH", "Colonic pH only", "Plasma pH"]', 1, 'Pepsin is inactivated once it reaches the neutral/alkaline duodenum.');

    -- CASE 7
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Gastric Mucosal Protection', 'A patient taking NSAIDs develops epigastric pain. A teacher reviews gastric mucosal defense.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'One major protective factor of gastric mucosa is:', '["High luminal acid", "Mucus-bicarbonate barrier", "Low mucosal blood flow", "Reduced prostaglandin activity", "Pepsin activation"]', 1, 'This barrier maintains a near-neutral pH at the cell surface.'),
    (v_case_id, 'Prostaglandins normally help protect the stomach by:', '["Increasing acid secretion only", "Increasing mucus and bicarbonate secretion", "Decreasing mucosal blood flow", "Stimulating pepsin secretion only", "Relaxing the lower esophageal sphincter"]', 1, 'PGE2 and PGI2 maintain mucosal integrity.'),
    (v_case_id, 'NSAIDs can predispose to mucosal injury because they:', '["Increase prostaglandin synthesis", "Decrease prostaglandin synthesis", "Block gastrin receptors directly", "Increase bicarbonate secretion", "Increase mucus viscosity only"]', 1, 'NSAIDs inhibit COX enzymes, depleting protective prostaglandins.');

    -- CASE 8
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Gastric Emptying', 'A mixed meal leaves the stomach gradually over several hours.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Gastric emptying is slowed most by:', '["Isotonic fluid in the stomach", "Fat in the duodenum", "Water in the stomach", "Hunger", "Vagal stimulation alone"]', 1, 'The duodenal brake ensures that fat is processed efficiently before more arrives.'),
    (v_case_id, 'The duodenum slows gastric emptying to prevent:', '["Protein digestion", "Overloading the small intestine", "Bile secretion", "Pancreatic enzyme activation", "Colonic motility"]', 1, 'This matches the delivery of nutrients to the digestive capacity of the small intestine.'),
    (v_case_id, 'Which hormone released by fat helps slow gastric emptying?', '["Gastrin", "Secretin", "Cholecystokinin", "Motilin", "Somatostatin from pancreas only"]', 2, 'CCK is the main "fat reflex" hormone.');

    -- CASE 9
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Secretin and Pancreatic Bicarbonate', 'Acidic chyme enters the duodenum after a meal.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The hormone most strongly stimulated by acid in the duodenum is:', '["Gastrin", "Secretin", "Motilin", "GIP only", "Histamine"]', 1, 'S cells release secretin when pH drops below 4.5.'),
    (v_case_id, 'Secretin acts mainly to increase:', '["Gastric acid secretion", "Pancreatic bicarbonate secretion", "Gallbladder contraction", "Colonic motility", "Pepsinogen activation"]', 1, 'Bicarbonate neutralizes the incoming gastric acid.'),
    (v_case_id, 'Pancreatic bicarbonate is secreted mainly by:', '["Acinar cells", "Ductal cells", "Chief cells", "G cells", "Enterocytes only"]', 1, 'Ductal cells secrete water and bicarb, while acinar cells secrete enzymes.'),
    (v_case_id, 'The major purpose of bicarbonate secretion is to:', '["Activate pepsin", "Neutralize gastric acid in the duodenum", "Promote colonic fermentation", "Inhibit pancreatic enzymes", "Increase gastric emptying"]', 1, 'This protects the duodenal mucosa and provides the optimal pH for pancreatic enzymes.');

    -- CASE 10
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'CCK and Pancreatic Enzymes', 'A fatty meal stimulates the release of multiple GI hormones.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Cholecystokinin is released primarily in response to:', '["Acid only", "Fatty acids and amino acids in the duodenum", "Water only", "Colonic distension", "Hypoglycemia only"]', 1, 'I cells sense the arrival of lipids and proteins.'),
    (v_case_id, 'CCK stimulates:', '["Pancreatic bicarbonate secretion only", "Gallbladder contraction and pancreatic enzyme secretion", "Gastric acid secretion only", "Gastric emptying", "Lower esophageal sphincter relaxation"]', 1, 'It coordinates the delivery of bile and enzymes for micelle formation and digestion.'),
    (v_case_id, 'Pancreatic digestive enzymes are secreted mainly by:', '["Ductal cells", "Acinar cells", "Chief cells", "Goblet cells", "Brunner glands"]', 1, 'The acini produce proteases, lipases, and amylases.');

    -- CASE 11
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Enterokinase and Trypsin Activation', 'A student is asked how pancreatic enzymes become activated in the intestine.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Trypsinogen is activated to trypsin by:', '["Gastrin", "Enteropeptidase (enterokinase) at the brush border", "Pepsin", "Secretin", "Somatostatin"]', 1, 'This master switch prevents the pancreas from digesting itself.'),
    (v_case_id, 'Once trypsin is formed, it can:', '["Inactivate all pancreatic enzymes", "Activate other pancreatic zymogens", "Neutralize bile salts", "Stimulate gastric acid secretion only", "Stop protein digestion"]', 1, 'Trypsin exhibits positive feedback to activate fellow proteases like chymotrypsin.'),
    (v_case_id, 'Pancreatic enzymes are secreted as inactive zymogens mainly to:', '["Improve gastric digestion", "Prevent autodigestion of the pancreas", "Increase bile production", "Slow intestinal absorption", "Stimulate secretin release"]', 1, 'Essential safety mechanism.');

    -- CASE 12
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bile and Fat Digestion', 'A patient with biliary obstruction develops greasy stools.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The major role of bile salts in digestion is to:', '["Digest proteins directly", "Emulsify fats and form micelles", "Activate trypsin", "Increase gastric acid", "Absorb glucose"]', 1, 'Bile salts act as detergents to break fat globules into tiny droplets.'),
    (v_case_id, 'Fat absorption is impaired in absence of bile mainly because:', '["Pancreatic bicarbonate is absent", "Micelle formation is impaired", "Lactase is absent", "Pepsin secretion is low", "Enterokinase is inhibited"]', 1, 'Micelles are needed to transport hydrophobic lipids to the brush border.'),
    (v_case_id, 'Bile salts are synthesized from:', '["Triglycerides", "Cholesterol", "Glucose", "Bilirubin", "Amino acids only"]', 1, 'Bile synthesis is the path for cholesterol elimination.');

    -- CASE 13
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Enterohepatic Circulation', 'A medical student reviews bile salt conservation.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most bile salts are reabsorbed in the:', '["Duodenum", "Jejunum", "Ileum", "Colon", "Stomach"]', 2, 'The terminal ileum has specific transporters for bile salt recapture.'),
    (v_case_id, 'Reabsorbed bile salts return to the liver through the:', '["Hepatic artery", "Portal circulation", "Inferior vena cava directly", "Thoracic duct only", "Pancreatic duct"]', 1, 'They travel via the portal vein back to the hepatocytes.'),
    (v_case_id, 'This recycling process is called:', '["Countercurrent multiplication", "Enterohepatic circulation", "Gastrocolic reflex", "Migrating motor complex", "Hepatopancreatic reflex"]', 1, 'This cycle occurs 6-10 times daily.');

    -- CASE 14
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bilirubin Physiology', 'A teacher asks about bilirubin handling.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Bilirubin is produced mainly from breakdown of:', '["Albumin", "Heme", "Cholesterol", "Bile salts", "Trypsin"]', 1, 'Specifically from the iron-containing part of aged RBCs.'),
    (v_case_id, 'In the liver, bilirubin is conjugated primarily to:', '["Sulfate", "Glucuronic acid", "Lactate", "Phosphate", "Bicarbonate"]', 1, 'Conjugation makes the lipid-soluble bilirubin water-soluble.'),
    (v_case_id, 'Conjugated bilirubin is secreted into:', '["Urine directly from plasma", "Bile", "Gastric lumen", "Pancreatic juice", "Saliva"]', 1, 'It is then eliminated via the biliary tract into the intestines.');

    -- CASE 15
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Small Intestinal Motility', 'A fed patient has rhythmic contractions in the small intestine that mix chyme.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The major mixing movements of the small intestine are:', '["Mass movements", "Segmentation contractions", "Haustrations only", "Reverse peristalsis only", "Retropulsion only"]', 1, 'Segmentation maximizes contact between nutrients and the brush border.'),
    (v_case_id, 'Peristalsis in the intestine serves mainly to:', '["Prevent absorption", "Propel contents aborally", "Eliminate pancreatic enzymes", "Stop segmentation", "Close the ileocecal valve"]', 1, 'Peristalsis provides the "one-way street" forward.'),
    (v_case_id, 'The enteric nervous system can coordinate many gut functions:', '["Only with complete dependence on the CNS", "Largely independently, though modulated by autonomics", "Only through sympathetic fibers", "Only through vagal fibers", "Only in the colon"]', 1, 'The "Second Brain" has its own reflex arcs.');

    -- CASE 16
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Migrating Motor Complex', 'A patient who has fasted overnight has cyclic waves of GI motility.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The migrating motor complex occurs mainly during:', '["Fed state only", "Fasting state", "Immediately after fatty meals", "Colonic filling only", "During vomiting only"]', 1, 'It serves as the "intestinal housekeeper" between meals.'),
    (v_case_id, 'A hormone associated with the migrating motor complex is:', '["Gastrin", "Motilin", "Secretin", "CCK", "Somatostatin only"]', 1, 'Motilin peaks during Phase III of the MMC.'),
    (v_case_id, 'The function of the migrating motor complex is to:', '["Promote gastric acid secretion", "Sweep residual undigested material through the GI tract", "Increase bile synthesis", "Enhance carbohydrate digestion only", "Slow intestinal transit after meals"]', 1, 'Prevents bacterial overgrowth and cleans the tract for the next meal.');

    -- CASE 17
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Carbohydrate Digestion and Lactase', 'A child develops bloating and diarrhea after drinking milk.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Lactose is normally digested by:', '["Pancreatic amylase", "Lactase on the brush border", "Pepsin", "Trypsin", "Bile salts"]', 1, 'Lactase breaks milk sugar into glucose and galactose.'),
    (v_case_id, 'Lactase deficiency leads to diarrhea mainly because unabsorbed lactose:', '["Is fully digested in the stomach", "Acts osmotically in the intestine", "Inhibits bile secretion directly", "Lowers pancreatic enzyme secretion", "Decreases colonic water content"]', 1, 'Lactose pulls water into the lumen and is fermented by bacteria.'),
    (v_case_id, 'Monosaccharides are absorbed mainly in the:', '["Stomach", "Small intestine", "Colon", "Esophagus", "Gallbladder"]', 1, 'The small intestine contains the final transporters (SGLT1/GLUT5).');

    -- CASE 18
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Protein Digestion and Absorption', 'A student is asked about digestion of dietary proteins.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Protein digestion begins significantly in the:', '["Mouth", "Stomach", "Ileum", "Colon", "Gallbladder"]', 1, 'Gastric pepsin initiates the breakdown.'),
    (v_case_id, 'Most peptide digestion in the intestinal lumen is carried out by:', '["Salivary amylase", "Pancreatic proteases", "Bile salts", "Lactase", "Gastrin"]', 1, 'Lumenal proteases break proteins into small peptides.'),
    (v_case_id, 'Amino acids and small peptides are absorbed mainly in the:', '["Small intestine", "Colon only", "Stomach only", "Esophagus", "Pancreatic duct"]', 0, 'Enterocytes use PEPT1 and specific AA transporters.');

    -- CASE 19
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fat Absorption and Chylomicrons', 'A patient with pancreatic insufficiency has fat malabsorption.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Pancreatic lipase is needed mainly to digest:', '["Proteins", "Triglycerides", "Lactose", "Bile salts", "Cellulose"]', 1, 'Lipase breaks fats into free fatty acids and monoglycerides.'),
    (v_case_id, 'After absorption into enterocytes, long-chain lipids are packaged into:', '["Micelles", "Chylomicrons", "VLDL in the intestinal lumen", "Bilirubin complexes", "Albumin only"]', 1, 'Chylomicrons are large lipid-transporting particles.'),
    (v_case_id, 'Chylomicrons enter the circulation initially through the:', '["Portal vein", "Lacteals/lymphatics", "Hepatic artery", "Splenic vein", "Renal vein"]', 1, 'Fat bypasses the liver initially.');

    -- CASE 20
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Iron Absorption', 'A patient with chronic blood loss develops iron deficiency. A tutor reviews intestinal iron handling.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Iron is absorbed mainly in the:', '["Ileum", "Duodenum", "Colon", "Stomach", "Jejunum only"]', 1, 'The proximal small intestine is the site of Fe2+ uptake.'),
    (v_case_id, 'The liver hormone that decreases intestinal iron absorption is:', '["Gastrin", "Hepcidin", "Secretin", "Somatostatin", "Motilin"]', 1, 'Hepcidin is increased during systemic inflammation.'),
    (v_case_id, 'Increased hepcidin tends to:', '["Increase iron release into plasma", "Decrease iron absorption and release from stores", "Stimulate bile salt uptake", "Increase calcium absorption", "Increase vitamin B12 absorption"]', 1, 'It causes the internalization of ferroportin.');

    -- CASE 21
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vitamin B12 Absorption', 'A patient with pernicious anemia has impaired vitamin B12 absorption.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Vitamin B12 requires which gastric product for absorption?', '["Pepsin", "Intrinsic factor", "Gastrin", "Histamine", "Secretin"]', 1, 'B12 must bind IF to be recognized for uptake.'),
    (v_case_id, 'Intrinsic factor is secreted by:', '["Chief cells", "Parietal cells", "G cells", "D cells", "Pancreatic acinar cells"]', 1, 'Parietal cells secrete both HCl and Intrinsic Factor.'),
    (v_case_id, 'Vitamin B12-intrinsic factor complex is absorbed mainly in the:', '["Duodenum", "Jejunum", "Ileum", "Colon", "Stomach"]', 2, 'Reabsorption occurs via cubilin receptors in the terminal ileum.');

    -- CASE 22
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Intestinal Fluid Secretion and Diarrhea', 'A patient with secretory diarrhea loses large volumes of isotonic fluid.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Intestinal chloride secretion is mediated largely by:', '["SGLT1", "CFTR channels", "H+/K+ ATPase", "ENaC only", "NKCC in parietal cells"]', 1, 'CFTR is the channel exploited by cholera toxin.'),
    (v_case_id, 'Increased chloride secretion into the intestinal lumen promotes:', '["Reduced water movement into lumen", "Water secretion into lumen", "Reduced sodium movement", "Increased pepsin activation", "Reduced bicarbonate secretion only"]', 1, 'Osmotic pull moves water into the lumen.'),
    (v_case_id, 'Secretory diarrhea can continue even during fasting because it is driven by:', '["Osmotic load only", "Active intestinal secretion", "Reduced motility only", "Low bile salts only", "Decreased chloride transport"]', 1, 'Unlike osmotic diarrhea, fasting does not stop the ion pumps.');

    -- CASE 23
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Colon Physiology', 'A healthy adult absorbs water and electrolytes from the colon.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'A major normal function of the colon is:', '["Primary protein digestion", "Water and sodium absorption", "Bile synthesis", "Iron absorption primarily", "Intrinsic factor secretion"]', 1, 'The colon turns liquid chyme into solid stool.'),
    (v_case_id, 'Colonic mass movements serve mainly to:', '["Mix chyme with pancreatic enzymes", "Propel fecal material over long distances", "Initiate pepsin secretion", "Open the pyloric sphincter", "Increase gastric acid secretion"]', 1, 'These occur 1-3 times a day, usually after meals.'),
    (v_case_id, 'The gastrocolic reflex is best described as increased colonic motility after:', '["Defecation", "A meal", "Exercise only", "Sleep", "Fasting"]', 1, 'Food in the stomach triggers motility in the colon.');

    -- CASE 24
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Defecation Reflex', 'A child feels the urge to defecate after rectal distension.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Rectal distension normally triggers:', '["Relaxation of the internal anal sphincter", "Contraction of the internal anal sphincter", "Closure of the ileocecal valve", "Gastric emptying", "Bile release"]', 0, 'This is the recto-anal inhibitory reflex.'),
    (v_case_id, 'The external anal sphincter is under:', '["Involuntary smooth muscle control only", "Voluntary skeletal muscle control", "Hormonal control only", "Enteric control only", "No neural control"]', 1, 'Controlled by the pudendal nerve.'),
    (v_case_id, 'Defecation involves both:', '["Gastric and biliary reflexes", "Involuntary reflexes and voluntary control", "Pancreatic secretion and micelle formation", "Only parasympathetic inhibition", "Only sympathetic activation"]', 1, 'Both smooth and skeletal muscle must coordinate.');

    -- CASE 25
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Portal Circulation and First-Pass Delivery', 'A pharmacology teacher explains why many absorbed nutrients first reach the liver.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most absorbed water-soluble nutrients enter the:', '["Lymphatics first", "Portal venous circulation", "Hepatic artery first", "Systemic arterial circulation directly", "Thoracic duct only"]', 1, 'Liver processes everything before it goes to the heart.'),
    (v_case_id, 'The major exception among absorbed dietary products is:', '["Glucose", "Amino acids", "Short-chain fatty acids", "Chylomicrons", "Water-soluble vitamins"]', 3, 'Chylomicrons are too large for capillary walls; they use lymph.'),
    (v_case_id, 'Chylomicrons bypass the portal vein initially because they enter:', '["Hepatic sinusoids directly", "Intestinal lymphatics", "Splenic circulation", "Renal circulation", "Pancreatic ductules"]', 1, 'Ultimately they reach the subclavian vein via the thoracic duct.');

    RAISE NOTICE 'Gastrointestinal Physiology cases and questions populated successfully.';
END $$;
