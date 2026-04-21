-- ==========================================
-- GI Physiology MCQs Migration
-- 100 Questions | Semester 2 First Year
-- ==========================================

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    -- 1. Get Topic ID
    SELECT id INTO v_topic_id FROM public.topics 
    WHERE title = 'Gastrointestinal Physiology' AND (semester_id = 2 OR usmle_step = 1) 
    LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "Gastrointestinal Physiology" not found.';
    END IF;

    -- 2. Clear existing standalone MCQs for this topic
    DELETE FROM public.mcqs WHERE topic_id = v_topic_id;

    -- 3. Insert 100 MCQs
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation, "order")
    VALUES 
    (v_topic_id, 'The upper esophageal sphincter is composed primarily of:', '["Smooth muscle", "Skeletal muscle", "Cardiac muscle", "Simple columnar epithelium", "Serosa"]', 1, 'The UES (cricopharyngeus) consists of striated skeletal muscle under voluntary control.', 1),
    (v_topic_id, 'Primary peristalsis in the esophagus is initiated by:', '["Gastric distension", "Swallowing", "Colonic activity", "Pancreatic secretion", "Bile release"]', 1, 'Swallowing triggers the brainstem reflex that starts the primary wave.', 2),
    (v_topic_id, 'Failure of lower esophageal sphincter relaxation leads to:', '["Gastric ulcer", "Achalasia", "Dumping syndrome", "Malabsorption", "Secretory diarrhea"]', 1, 'Achalasia is characterized by aperistalsis and hypertensive LES.', 3),
    (v_topic_id, 'Gastric acid is secreted by:', '["Chief cells", "Parietal cells", "G cells", "D cells", "Goblet cells"]', 1, 'Parietal cells in the body/fundus produce HCl.', 4),
    (v_topic_id, 'The final step in gastric acid secretion is mediated by:', '["Na+/K+ ATPase", "H+/K+ ATPase", "SGLT transporter", "ENaC channel", "NKCC transporter"]', 1, 'The proton pump is the final common pathway for acid secretion.', 5),
    (v_topic_id, 'Histamine stimulates gastric acid secretion via:', '["H1 receptors", "H2 receptors", "M3 receptors", "Beta-2 receptors", "D2 receptors"]', 1, 'H2 blockers target this receptor on parietal cells.', 6),
    (v_topic_id, 'Acetylcholine stimulates parietal cells via:', '["H2 receptors", "M3 receptors", "Alpha-1 receptors", "Nicotinic receptors only", "D1 receptors"]', 1, 'Vagal stimulation releases ACh onto muscarinic M3 receptors.', 7),
    (v_topic_id, 'Gastrin is secreted by:', '["Chief cells", "G cells", "D cells", "ECL cells", "Enterocytes"]', 1, 'G cells are found in the antrum of the stomach.', 8),
    (v_topic_id, 'Gastrin primarily increases:', '["Bicarbonate secretion", "Gastric acid secretion", "Pancreatic enzyme secretion", "Bile production", "Intestinal motility only"]', 1, 'Gastrin stimulates parietal cells directly and via ECL histamine release.', 9),
    (v_topic_id, 'Somatostatin has which effect on gastric function?', '["Stimulates acid secretion", "Inhibits acid secretion", "Increases gastrin release", "Stimulates pepsin", "Increases gastric emptying"]', 1, 'Somatostatin is the GI inhibitory hormone.', 10),
    (v_topic_id, 'Pepsinogen is secreted by:', '["Parietal cells", "Chief cells", "G cells", "D cells", "Enterocytes"]', 1, 'Chief cells produce this inactive protease precursor.', 11),
    (v_topic_id, 'Pepsin is activated by:', '["Alkaline pH", "Gastric acid", "Bile salts", "Trypsin", "Secretin"]', 1, 'Conversion of pepsinogen to pepsin requires an acidic environment.', 12),
    (v_topic_id, 'The cephalic phase of gastric secretion is mediated mainly by:', '["Sympathetic nervous system", "Vagus nerve", "Enteric nervous system only", "Secretin", "CCK"]', 1, 'The anticipation of food triggers vagal output.', 13),
    (v_topic_id, 'Gastric emptying is slowed most by:', '["Carbohydrates", "Fats", "Water", "Protein", "Fiber"]', 1, 'Fats trigger the enterogastric reflex and CCK release.', 14),
    (v_topic_id, 'Cholecystokinin (CCK) is released in response to:', '["Acid", "Fat and amino acids", "Glucose", "Water", "Sodium"]', 1, 'I cells in the duodenum sense lipids and proteins.', 15),
    (v_topic_id, 'CCK causes:', '["Increased gastric emptying", "Gallbladder contraction", "Reduced pancreatic enzyme secretion", "Increased acid secretion", "Reduced bile flow"]', 1, 'CCK also stimulates pancreatic acinar cells to release enzymes.', 16),
    (v_topic_id, 'Secretin is released in response to:', '["Fat", "Acid in the duodenum", "Glucose", "Amino acids", "Stretch of colon"]', 1, 'S cells release secretin when pH in the duodenum drops.', 17),
    (v_topic_id, 'Secretin stimulates:', '["Gastric acid secretion", "Pancreatic bicarbonate secretion", "Gallbladder contraction", "Insulin release", "Motility only"]', 1, 'Secretin "turns off" the stomach and "turns on" pancreatic buffers.', 18),
    (v_topic_id, 'Pancreatic enzymes are secreted by:', '["Ductal cells", "Acinar cells", "Parietal cells", "G cells", "Brunner glands"]', 1, 'Acinar cells produce zymogens (proteases, amylase, lipase).', 19),
    (v_topic_id, 'Pancreatic bicarbonate is secreted by:', '["Acinar cells", "Ductal cells", "Chief cells", "Enterocytes", "Kupffer cells"]', 1, 'Ductal cells secrete the water and bicarbonate component.', 20),
    (v_topic_id, 'Trypsinogen is activated by:', '["Pepsin", "Enteropeptidase (enterokinase)", "Gastrin", "Secretin", "Lipase"]', 1, 'Enterokinase is a brush border enzyme.', 21),
    (v_topic_id, 'Trypsin activates:', '["Gastrin", "Other pancreatic zymogens", "Bile salts", "Lactase", "Secretin"]', 1, 'Trypsin is the "master switch" for pancreatic proteases.', 22),
    (v_topic_id, 'Bile salts function primarily to:', '["Digest protein", "Emulsify fats", "Activate trypsin", "Absorb glucose", "Neutralize acid"]', 1, 'They increase the surface area for lipase action.', 23),
    (v_topic_id, 'Bile salts are synthesized from:', '["Glucose", "Cholesterol", "Protein", "Bilirubin", "Urea"]', 1, 'The liver converts cholesterol into primary bile acids.', 24),
    (v_topic_id, 'Most bile salts are reabsorbed in the:', '["Duodenum", "Jejunum", "Ileum", "Colon", "Stomach"]', 2, 'Absorption is localized to the terminal ileum.', 25),
    (v_topic_id, 'Enterohepatic circulation refers to:', '["Kidney-liver circulation", "Recycling of bile salts", "Portal-systemic shunting", "Intestinal motility reflex", "Lymphatic absorption"]', 1, 'Recycling saves over 95% of the total bile salt pool daily.', 26),
    (v_topic_id, 'Bilirubin is derived mainly from:', '["Glucose metabolism", "Heme breakdown", "Protein digestion", "Fat absorption", "Cholesterol synthesis"]', 1, 'Breakdown of hemoglobin from senescent red cells.', 27),
    (v_topic_id, 'Bilirubin is conjugated in the liver with:', '["Sulfate", "Glucuronic acid", "Lactate", "Phosphate", "Bicarbonate"]', 1, 'Glucuronyl transferase performs this reaction (UMP-GT).', 28),
    (v_topic_id, 'Segmentation contractions in the small intestine primarily:', '["Propel contents", "Mix contents", "Stop digestion", "Increase acid secretion", "Close pylorus"]', 1, 'Non-propulsive contractions for optimal enzyme mixing.', 29),
    (v_topic_id, 'Peristalsis primarily serves to:', '["Mix chyme", "Propel contents aborally", "Secrete enzymes", "Absorb nutrients", "Stop intestinal movement"]', 1, 'Sequential contractions that move food forward.', 30),
    (v_topic_id, 'The migrating motor complex occurs during:', '["Fed state", "Fasting state", "Sleep only", "Exercise only", "After fatty meals"]', 1, 'Intestinal "housekeeping" via motilin.', 31),
    (v_topic_id, 'Motilin is associated with:', '["Gastric acid secretion", "Migrating motor complex", "Bile production", "Insulin release", "Colonic motility"]', 1, 'Motilin levels peak every 90 minutes during the interdigestive period.', 32),
    (v_topic_id, 'Lactase deficiency leads to diarrhea because lactose:', '["Is absorbed fully", "Acts osmotically in lumen", "Inhibits bile secretion", "Reduces motility", "Decreases water content"]', 1, 'Osmotic load pulls water into the gut lumen.', 33),
    (v_topic_id, 'Carbohydrate absorption occurs mainly as:', '["Disaccharides", "Monosaccharides", "Polysaccharides", "Glycogen", "Lactose"]', 1, 'Only glucose, galactose, and fructose are absorbed.', 34),
    (v_topic_id, 'Glucose absorption occurs via:', '["Passive diffusion", "Na+-glucose cotransport", "ADH channels", "Bile-mediated transport", "Insulin receptors"]', 1, 'Uses SGLT1 (secondary active transport).', 35),
    (v_topic_id, 'Protein digestion is completed mainly by:', '["Salivary enzymes", "Pancreatic proteases", "Gastric acid alone", "Bile salts", "Colonic bacteria"]', 1, 'Combined with brush border peptidases.', 36),
    (v_topic_id, 'Lipid digestion requires:', '["Pepsin", "Pancreatic lipase", "Amylase", "Lactase", "Trypsin"]', 1, 'Lipase is the key enzyme for triglyceride breakdown.', 37),
    (v_topic_id, 'Long-chain fatty acids are absorbed as:', '["Free fatty acids directly into blood", "Chylomicrons via lymphatics", "Amino acids", "Monosaccharides", "Bile salts"]', 1, 'They bypass the portal vein initially.', 38),
    (v_topic_id, 'Iron absorption occurs mainly in the:', '["Stomach", "Duodenum", "Ileum", "Colon", "Jejunum only"]', 1, 'Proximal small intestine is the site for Fe2+ uptake.', 39),
    (v_topic_id, 'Hepcidin decreases iron levels by:', '["Increasing absorption", "Decreasing absorption and release", "Increasing RBC production", "Increasing bile secretion", "Increasing vitamin D"]', 1, 'Hepcidin inhibits ferroportin on enterocytes and macrophages.', 40),
    (v_topic_id, 'Vitamin B12 absorption requires:', '["Gastrin", "Intrinsic factor", "Pepsin", "Secretin", "Lipase"]', 1, 'IF binds B12 for specific uptake.', 41),
    (v_topic_id, 'Intrinsic factor is produced by:', '["Chief cells", "Parietal cells", "G cells", "D cells", "Pancreas"]', 1, 'Co-secreted with HCl by parietal cells.', 42),
    (v_topic_id, 'Vitamin B12 is absorbed mainly in the:', '["Duodenum", "Jejunum", "Ileum", "Colon", "Stomach"]', 2, 'Via cubilin receptors in the ileum.', 43),
    (v_topic_id, 'CFTR channels in intestine mediate:', '["Sodium absorption", "Chloride secretion", "Glucose transport", "Fat digestion", "Protein absorption"]', 1, 'Crucial for maintaining stool hydration.', 44),
    (v_topic_id, 'Secretory diarrhea occurs because of:', '["Decreased intestinal secretion", "Increased active secretion of electrolytes", "Reduced osmotic load", "Reduced motility", "Increased absorption"]', 1, 'Usually caused by toxins (e.g., cholera).', 45),
    (v_topic_id, 'The colon primarily:', '["Digests proteins", "Absorbs water and electrolytes", "Produces bile", "Secretes pancreatic enzymes", "Absorbs iron"]', 1, 'Converts liquid chyme into solid feces.', 46),
    (v_topic_id, 'The gastrocolic reflex increases colonic motility after:', '["Fasting", "A meal", "Exercise", "Sleep", "Defecation"]', 1, 'Meal ingestion triggers distal colonic activity.', 47),
    (v_topic_id, 'Rectal distension triggers:', '["Contraction of internal anal sphincter", "Relaxation of internal anal sphincter", "Gastric emptying", "Bile secretion", "Pancreatic secretion"]', 1, 'The recto-anal inhibitory reflex.', 48),
    (v_topic_id, 'The external anal sphincter is:', '["Smooth muscle", "Skeletal muscle", "Cardiac muscle", "Autonomic only", "Hormone-controlled only"]', 1, 'Under voluntary control (Pudendal nerve).', 49),
    (v_topic_id, 'Most absorbed nutrients first enter the:', '["Systemic circulation directly", "Portal circulation", "Lymphatics only", "Hepatic artery", "Thoracic duct only"]', 1, 'Nutrients are taken up by the portal vein to the liver.', 50),
    (v_topic_id, 'Vagotomy would most directly reduce gastric acid secretion by decreasing:', '["Histamine release", "Gastrin release only", "Acetylcholine stimulation of parietal cells", "Bile salt secretion", "Pancreatic enzyme secretion"]', 2, 'Vagus is the source of parasympathetic ACh stimulus.', 51),
    (v_topic_id, 'H2 receptor blockers reduce gastric acid secretion primarily by:', '["Blocking acetylcholine", "Blocking histamine-mediated stimulation of parietal cells", "Blocking gastrin release", "Increasing somatostatin", "Reducing pepsin secretion"]', 1, 'Cimetidine/Ranitidine inhibit the H2 pathway.', 52),
    (v_topic_id, 'Proton pump inhibitors reduce acid secretion by inhibiting:', '["H+/Na+ exchange", "H+/K+ ATPase", "Na+/K+ ATPase", "Cl−/HCO3− exchange", "ENaC"]', 1, 'Omeprazole irreversibly binds the proton pump.', 53),
    (v_topic_id, 'Zollinger–Ellison syndrome is characterized by excessive:', '["Secretin", "Gastrin", "Somatostatin", "CCK", "Motilin"]', 1, 'A gastrin-secreting tumor.', 54),
    (v_topic_id, 'Excess gastrin leads to:', '["Reduced acid secretion", "Increased acid secretion", "Reduced pepsin activation", "Reduced mucosal growth", "Decreased gastric motility"]', 1, 'Hypergastrinemia causes severe peptic ulcers.', 55),
    (v_topic_id, 'Loss of parietal cells leads to deficiency of:', '["Pepsin", "Intrinsic factor", "Gastrin", "Secretin", "CCK"]', 1, 'Leads to B12 deficiency (pernicious anemia).', 56),
    (v_topic_id, 'Pernicious anemia results primarily from impaired absorption of:', '["Iron", "Vitamin B12", "Calcium", "Folate", "Glucose"]', 1, 'Due to lack of intrinsic factor.', 57),
    (v_topic_id, 'Gastric mucosal atrophy leads to:', '["Increased acid secretion", "Decreased acid secretion", "Increased bile production", "Increased pancreatic secretion", "Increased motilin release"]', 1, 'Hypochlorhydria or achlorhydria.', 58),
    (v_topic_id, 'The main stimulus for gastric emptying is:', '["Fat in duodenum", "Gastric distension", "Acid in duodenum", "CCK release", "Secretin release"]', 1, 'Distension pressure pushes against the pylorus.', 59),
    (v_topic_id, 'The enterogastric reflex acts to:', '["Stimulate gastric emptying", "Inhibit gastric emptying", "Increase acid secretion", "Increase bile release", "Increase pancreatic enzymes"]', 1, 'Duodenal feedback that protects the small intestine.', 60),
    (v_topic_id, 'Secretin inhibits gastric acid secretion by:', '["Direct parietal stimulation", "Decreasing gastrin release and increasing somatostatin", "Stimulating histamine", "Increasing pepsin secretion", "Increasing vagal tone"]', 1, 'Neutralizes acid by slowing the gastric source.', 61),
    (v_topic_id, 'CCK slows gastric emptying mainly to:', '["Increase acid exposure", "Allow adequate digestion of fats", "Increase motilin", "Decrease pancreatic secretion", "Increase intestinal transit speed"]', 1, 'Brake for fat digestion.', 62),
    (v_topic_id, 'Pancreatic enzyme secretion is stimulated most strongly by:', '["Secretin", "CCK", "Gastrin", "Somatostatin", "Motilin"]', 1, 'CCK acts on acinar cells.', 63),
    (v_topic_id, 'Pancreatic bicarbonate secretion is stimulated most strongly by:', '["CCK", "Secretin", "Gastrin", "Motilin", "Histamine"]', 1, 'Secretin acts on ductal cells.', 64),
    (v_topic_id, 'Trypsin inhibits pancreatic secretion by:', '["Stimulating CCK", "Negative feedback on CCK release", "Activating gastrin", "Increasing secretin", "Stimulating bile release"]', 1, 'Feedback loop using CCK-releasing peptide.', 65),
    (v_topic_id, 'The major function of Brunner glands in the duodenum is to:', '["Secrete acid", "Secrete alkaline mucus", "Produce bile", "Secrete enzymes", "Absorb fats"]', 1, 'Protects the duodenum from acidic chyme.', 66),
    (v_topic_id, 'Bile salts are essential for absorption of:', '["Glucose", "Amino acids", "Fat-soluble vitamins", "Iron", "Sodium"]', 2, 'Vitamins A, D, E, and K require micelles.', 67),
    (v_topic_id, 'Fat malabsorption leads to deficiency of:', '["Vitamin C", "Vitamin B12", "Vitamin A, D, E, K", "Iron", "Folate"]', 2, 'Greasy stools (steatorrhea) accompany this.', 68),
    (v_topic_id, 'Short-chain fatty acids are absorbed:', '["Only via lymphatics", "Directly into portal blood", "Only via bile salts", "Only in ileum", "Not absorbed"]', 1, 'They are water-soluble enough for the portal vein.', 69),
    (v_topic_id, 'Steatorrhea is caused primarily by:', '["Protein malabsorption", "Fat malabsorption", "Carbohydrate malabsorption", "Electrolyte imbalance", "Bacterial overgrowth only"]', 1, 'Indicates absence of lipase or bile.', 70),
    (v_topic_id, 'Lactase deficiency leads to:', '["Secretory diarrhea", "Osmotic diarrhea", "Inflammatory diarrhea", "Fat malabsorption", "Protein loss"]', 1, 'Undigested lactose pulls water.', 71),
    (v_topic_id, 'Osmotic diarrhea improves with:', '["Continued feeding", "Fasting", "Increased bile salts", "Increased acid secretion", "Increased motility"]', 1, 'Removing the osmole source stops the water pull.', 72),
    (v_topic_id, 'Secretory diarrhea persists even during:', '["Feeding", "Fasting", "Sleep only", "Exercise only", "Digestion only"]', 1, 'Doesn''t depend on oral intake.', 73),
    (v_topic_id, 'Cholera toxin causes diarrhea by:', '["Blocking sodium absorption", "Increasing cAMP and chloride secretion", "Decreasing intestinal motility", "Blocking bile secretion", "Inhibiting pancreatic enzymes"]', 1, 'Constitutive activation of Gs protein.', 74),
    (v_topic_id, 'Increased cAMP in enterocytes leads to:', '["Increased sodium absorption", "Increased chloride secretion", "Decreased water movement", "Reduced motility", "Increased bile production"]', 1, 'Via CFTR channels.', 75),
    (v_topic_id, 'Portal hypertension can lead to:', '["Reduced portal blood flow", "Development of portosystemic shunts", "Increased bile production", "Increased gastric acid", "Decreased liver perfusion only"]', 1, 'Causes varices and ascites.', 76),
    (v_topic_id, 'The liver receives blood from:', '["Only hepatic artery", "Only portal vein", "Both hepatic artery and portal vein", "Renal artery", "Inferior vena cava"]', 2, 'Dual blood supply (25% arterial, 75% portal).', 77),
    (v_topic_id, 'Kupffer cells in the liver function primarily in:', '["Bile secretion", "Detoxification", "Phagocytosis of bacteria", "Glucose storage", "Hormone production"]', 2, 'Specialized liver macrophages.', 78),
    (v_topic_id, 'The primary site of ethanol metabolism is:', '["Small intestine", "Liver", "Colon", "Stomach only", "Pancreas"]', 1, 'Uses Alcohol Dehydrogenase (ADH).', 79),
    (v_topic_id, 'First-pass metabolism refers to:', '["Renal clearance", "Hepatic metabolism before systemic circulation", "Intestinal digestion", "Pancreatic secretion", "Lymphatic absorption"]', 1, 'Reduces bioavailability of oral drugs.', 80),
    (v_topic_id, 'The ileocecal valve prevents:', '["Gastric reflux", "Backflow of colonic contents into ileum", "Bile secretion", "Pancreatic enzyme release", "Acid entry into duodenum"]', 1, 'One-way gate to protect the small bowel.', 81),
    (v_topic_id, 'Loss of ileum leads to deficiency of:', '["Iron only", "Vitamin B12 and bile salts", "Calcium only", "Glucose only", "Protein only"]', 1, 'Classic problem in Crohn''s or resection.', 82),
    (v_topic_id, 'Loss of bile salts leads to:', '["Increased fat absorption", "Fat malabsorption", "Increased glucose absorption", "Increased protein digestion", "Increased motility"]', 1, 'Disrupts micelle formation.', 83),
    (v_topic_id, 'The main driver of water absorption in the intestine is:', '["Active water transport", "Osmotic gradient created by solute absorption", "Hormonal control only", "Peristalsis", "Bile salts"]', 1, 'Water follows solute absorption passively.', 84),
    (v_topic_id, 'Sodium absorption in the intestine is often coupled with:', '["Water secretion", "Glucose or amino acid transport", "Bile secretion", "Acid secretion", "Fat absorption only"]', 1, 'Exploited in oral rehydration solutions.', 85),
    (v_topic_id, 'Oral rehydration therapy works because:', '["It blocks chloride channels", "It enhances Na+-glucose cotransport", "It inhibits cAMP", "It increases bile salts", "It reduces intestinal motility"]', 1, 'SGLT1 remains functional even in toxin-induced diarrhea.', 86),
    (v_topic_id, 'The gastroileal reflex increases ileal emptying in response to:', '["Colon distension", "Gastric distension", "Pancreatic secretion", "Bile salts", "Motilin"]', 1, 'Empty the "old" to make room for "new".', 87),
    (v_topic_id, 'The rectoanal inhibitory reflex causes:', '["Contraction of internal sphincter", "Relaxation of internal sphincter", "Contraction of external sphincter", "Closure of pylorus", "Increased gastric acid"]', 1, 'Sampling reflex.', 88),
    (v_topic_id, 'Defecation is facilitated by:', '["Sympathetic stimulation", "Parasympathetic stimulation", "Reduced abdominal pressure", "Gastric emptying", "Bile secretion"]', 1, 'Pelvic nerves stimulate the rectum.', 89),
    (v_topic_id, 'Increased parasympathetic activity in the gut generally:', '["Decreased motility", "Increases motility and secretion", "Decreases secretion", "Stops digestion", "Reduces absorption"]', 1, 'The "Rest and Digest" state.', 90),
    (v_topic_id, 'Sympathetic stimulation of the GI tract generally:', '["Increases motility", "Decreases motility", "Increases secretion", "Enhances digestion", "Increases blood flow"]', 1, 'The "Fight or Flight" state slows the gut.', 91),
    (v_topic_id, 'The enteric nervous system can function:', '["Only under CNS control", "Independently but modulated by CNS", "Only during digestion", "Only in colon", "Only in stomach"]', 1, 'Self-contained neural plexus.', 92),
    (v_topic_id, 'VIP (vasoactive intestinal peptide) causes:', '["Vasoconstriction", "Smooth muscle relaxation and secretion", "Increased gastric acid", "Decreased pancreatic secretion", "Reduced intestinal fluid"]', 1, 'Important for LES relaxation and fluid secretion.', 93),
    (v_topic_id, 'Somatostatin generally:', '["Stimulates GI activity", "Inhibits GI secretion and motility", "Increases bile release", "Stimulates insulin only", "Increases motilin"]', 1, 'Universal inhibitor of the GI tract.', 94),
    (v_topic_id, 'Gastrin also promotes:', '["Decreased mucosal growth", "Increased mucosal growth", "Reduced acid secretion", "Reduced motility", "Reduced enzyme secretion"]', 1, 'Trophic effect on gastric mucosa.', 95),
    (v_topic_id, 'The brush border enzymes are located in the:', '["Pancreas", "Intestinal epithelium", "Liver", "Stomach", "Colon"]', 1, 'On the apical membrane of enterocytes.', 96),
    (v_topic_id, 'Most nutrient absorption occurs in the:', '["Stomach", "Small intestine", "Colon", "Esophagus", "Rectum"]', 1, 'Villi/microvilli provide immense surface area.', 97),
    (v_topic_id, 'The jejunum is especially important for:', '["Iron absorption only", "Bulk nutrient absorption", "Bile salt absorption", "Vitamin B12 absorption", "Water excretion"]', 1, 'Site of most carbohydrate/protein uptake.', 98),
    (v_topic_id, 'The ileum is especially important for absorption of:', '["Glucose", "Amino acids", "Vitamin B12 and bile salts", "Lipase", "Pepsin"]', 2, 'Distal part of the small intestine.', 99),
    (v_topic_id, 'The major determinant of GI blood flow after a meal is:', '["Sympathetic tone", "Local metabolic activity", "Renal perfusion", "Cardiac output only", "Plasma osmolality"]', 1, 'Post-prandial hyperemia.', 100);

    RAISE NOTICE 'Gastrointestinal Physiology 100 MCQs populated successfully.';
END $$;
