const giCards = [
  {
    "q": "What are the four layers of the GI tract wall (from lumen to outside)?",
    "a": "<ol><li><b>Mucosa</b> (epithelium, lamina propria, muscularis mucosae)</li><li><b>Submucosa</b> (contains Meissner’s plexus)</li><li><b>Muscularis propria</b> (inner circular + outer longitudinal muscle; Auerbach’s plexus between layers)</li><li><b>Serosa / Adventitia</b></li></ol>"
  },
  {
    "q": "What is the enteric nervous system?",
    "a": "Intrinsic nervous system of the gut consisting of <b>Meissner’s (submucosal) plexus</b> (controls secretion) and <b>Auerbach’s (myenteric) plexus</b> (controls motility). Can function independently of CNS."
  },
  {
    "q": "Differentiate peristalsis from segmentation.",
    "a": "<ul><li><b>Peristalsis:</b> Propulsive movement — contraction behind bolus, relaxation ahead.</li><li><b>Segmentation:</b> Rhythmic mixing contractions (mainly small intestine) that increase contact with absorptive surface.</li></ul>"
  },
  {
    "q": "What is the Migrating Motor Complex (MMC)?",
    "a": "Occurs during fasting every 90–120 minutes. Strong peristaltic contractions from stomach to ileum that clear residual debris and prevent bacterial overgrowth. Regulated by <b>motilin</b>."
  },
  {
    "q": "List the major GI hormones and their primary actions.",
    "a": "<ul><li><b>Gastrin:</b> ↑ gastric acid</li><li><b>CCK:</b> Gallbladder contraction + pancreatic enzyme secretion</li><li><b>Secretin:</b> ↑ pancreatic HCO₃⁻ secretion</li><li><b>GIP:</b> Inhibits gastric acid + stimulates insulin</li><li><b>Motilin:</b> Initiates MMC</li></ul>"
  },
  {
    "q": "What are the three phases of gastric acid secretion?",
    "a": "<ul><li><b>Cephalic (30%):</b> Vagus nerve (sight/smell/thought)</li><li><b>Gastric (60%):</b> Distension and peptides → gastrin release</li><li><b>Intestinal (10%):</b> Enterogastrones (secretin, CCK) inhibit acid secretion</li></ul>"
  },
  {
    "q": "Which cells secrete HCl and Intrinsic Factor?",
    "a": "<b>Parietal cells</b> in gastric glands (fundus and body). Stimulated by ACh, histamine (H2), and gastrin."
  },
  {
    "q": "What stimulates and inhibits parietal cell acid secretion?",
    "a": "<ul><li><b>Stimulators:</b> Histamine (H2), ACh (M3), Gastrin</li><li><b>Inhibitors:</b> Somatostatin, prostaglandins (PGE₂), secretin, CCK, GIP</li></ul>"
  },
  {
    "q": "What is the role of chief cells?",
    "a": "Secrete <b>pepsinogen</b>, which is activated to pepsin by low pH."
  },
  {
    "q": "What protects the gastric mucosa from acid?",
    "a": "Mucus-bicarbonate barrier, prostaglandins (↑ mucus & blood flow), tight junctions, and adequate mucosal blood flow."
  },
  {
    "q": "What is the source and function of salivary amylase?",
    "a": "Produced by parotid glands. Begins starch digestion in mouth and continues in stomach until inactivated by acid."
  },
  {
    "q": "What are the three major salivary glands?",
    "a": "<b>Parotid</b> (serous, amylase), <b>Submandibular</b> (mixed), <b>Sublingual</b> (mucous). Daily secretion ~1–1.5 L."
  },
  {
    "q": "What is the composition of pancreatic juice?",
    "a": "Alkaline (rich in HCO₃⁻) + digestive enzymes (amylase, lipase, proteases). Secreted in response to secretin (HCO₃⁻) and CCK (enzymes)."
  },
  {
    "q": "What stimulates pancreatic bicarbonate secretion?",
    "a": "<b>Secretin</b> — released when acidic chyme enters duodenum."
  },
  {
    "q": "What stimulates pancreatic enzyme secretion?",
    "a": "<b>CCK</b> — released in response to fats and proteins in duodenum."
  },
  {
    "q": "Outline carbohydrate digestion and absorption.",
    "a": "Salivary + pancreatic amylase → oligosaccharides → brush border enzymes (maltase, sucrase, lactase) → monosaccharides. Absorbed via SGLT1 (glucose/galactose) and GLUT5 (fructose)."
  },
  {
    "q": "Outline protein digestion and absorption.",
    "a": "Stomach: pepsin. Duodenum: trypsin, chymotrypsin, carboxypeptidases → amino acids, di/tripeptides. Absorbed via Na⁺-dependent transporters in proximal small intestine."
  },
  {
    "q": "Describe fat digestion and absorption.",
    "a": "Bile salts emulsify fats → pancreatic lipase + colipase → monoglycerides + FFAs → micelles → absorbed into enterocytes → re-esterified into chylomicrons → lymphatics."
  },
  {
    "q": "What vitamins require bile salts for absorption?",
    "a": "Fat-soluble vitamins: <b>A, D, E, K</b>."
  },
  {
    "q": "Where is Vitamin B12 absorbed?",
    "a": "<b>Terminal ileum</b> — requires Intrinsic Factor from parietal cells."
  },
  {
    "q": "What is the enterohepatic circulation?",
    "a": "Bile salts secreted into intestine → 95% reabsorbed in terminal ileum → returned to liver via portal vein."
  },
  {
    "q": "What is the function of the gallbladder?",
    "a": "Stores and concentrates bile. Contracts in response to CCK."
  },
  {
    "q": "What is the role of the sphincter of Oddi?",
    "a": "Controls flow of bile and pancreatic juice into duodenum. Relaxes in response to CCK."
  },
  {
    "q": "What is the law of the intestine (Bayliss-Starling law)?",
    "a": "Distension of intestine causes contraction proximal to the bolus and relaxation distal to it."
  },
  {
    "q": "What is the role of VIP in the GI tract?",
    "a": "Vasodilation and smooth muscle relaxation. Increases intestinal secretion (water and electrolytes)."
  },
  {
    "q": "What is the effect of parasympathetic stimulation on GI function?",
    "a": "Increases motility, secretion, and blood flow (via vagus and pelvic splanchnics)."
  },
  {
    "q": "What is the effect of sympathetic stimulation on GI function?",
    "a": "Decreases motility and secretion, increases sphincter tone."
  },
  {
    "q": "What is the cephalic phase of digestion?",
    "a": "Anticipatory response mediated by vagus nerve triggered by sight, smell, or thought of food."
  },
  {
    "q": "What is the ileocecal sphincter and its regulation?",
    "a": "Prevents backflow from colon to ileum. Relaxes when ileum is distended; contracts when cecum is distended."
  },
  {
    "q": "What is the gastrocolic reflex?",
    "a": "Distension of stomach → increased colonic motility (especially after meals)."
  },
  {
    "q": "What is Hirschsprung’s disease?",
    "a": "Absence of ganglion cells (Auerbach’s plexus) in distal colon → functional obstruction and megacolon."
  },
  {
    "q": "What is achalasia?",
    "a": "Failure of LES relaxation due to loss of inhibitory neurons (nitric oxide, VIP). Bird-beak appearance on barium swallow."
  },
  {
    "q": "What is the role of gastrin in the stomach?",
    "a": "Stimulates HCl secretion, increases gastric motility, and promotes growth of gastric mucosa."
  },
  {
    "q": "What inhibits gastrin release?",
    "a": "Low gastric pH (somatostatin), secretin, CCK, and GIP."
  },
  {
    "q": "What is Zollinger-Ellison syndrome?",
    "a": "Gastrinoma → excessive gastrin → hypersecretion of gastric acid → refractory peptic ulcers."
  },
  {
    "q": "What is the most potent stimulant of gastric acid secretion?",
    "a": "Histamine (via H2 receptors on parietal cells)."
  },
  {
    "q": "What is the mechanism of proton pump inhibitors (PPIs)?",
    "a": "Irreversible inhibition of H⁺/K⁺-ATPase on parietal cells."
  },
  {
    "q": "What is the mechanism of H2 receptor blockers?",
    "a": "Competitive inhibition of histamine on parietal cells."
  },
  {
    "q": "What protects against NSAID-induced gastric ulcers?",
    "a": "Misoprostol (PGE₁ analog) — increases mucus and bicarbonate secretion."
  },
  {
    "q": "What is the role of intrinsic factor?",
    "a": "Binds Vitamin B12 in stomach → allows absorption in terminal ileum."
  },
  {
    "q": "What is pernicious anemia?",
    "a": "Autoimmune destruction of parietal cells → lack of Intrinsic Factor → Vitamin B12 deficiency."
  },
  {
    "q": "What is the most common site of peptic ulcers?",
    "a": "First part of duodenum (duodenal bulb)."
  },
  {
    "q": "What is the most common cause of peptic ulcer disease?",
    "a": "Helicobacter pylori infection."
  },
  {
    "q": "What is dumping syndrome?",
    "a": "Rapid emptying of hyperosmolar chyme into small intestine after gastric surgery → osmotic fluid shift → diarrhea, hypotension, tachycardia."
  },
  {
    "q": "What is the primary site of nutrient absorption in the small intestine?",
    "a": "<b>Jejunum</b> — highest absorptive capacity due to large surface area (villi + microvilli) and rich blood supply."
  },
  {
    "q": "Compare the jejunum and ileum.",
    "a": "<ul><li><b>Jejunum:</b> Thicker wall, more vascular, longer vasa recta, fewer Peyer’s patches.</li><li><b>Ileum:</b> Thinner wall, more Peyer’s patches, shorter vasa recta, absorbs bile salts and B12.</li></ul>"
  },
  {
    "q": "What is the role of brush border enzymes?",
    "a": "Final digestion of carbohydrates (maltase, sucrase, lactase) and peptides (aminopeptidases, dipeptidases) on the apical membrane of enterocytes."
  },
  {
    "q": "How are bile salts recycled?",
    "a": "Enterohepatic circulation: 95% reabsorbed in terminal ileum via Na⁺-bile salt cotransporter → portal vein → liver."
  },
  {
    "q": "What happens if terminal ileum is resected?",
    "a": "Bile salt malabsorption → steatorrhea + Vitamin B12 deficiency."
  },
  {
    "q": "What is the role of the colon?",
    "a": "Absorbs water and electrolytes (mainly Na⁺ and Cl⁻), forms and stores feces, and harbors gut microbiota."
  },
  {
    "q": "What is the maximum water absorption capacity of the colon per day?",
    "a": "Approximately 4–5 liters."
  },
  {
    "q": "What is the gastrocolic reflex?",
    "a": "Ingestion of food → increased colonic motility and mass movements, mediated by gastrin and vagus nerve."
  },
  {
    "q": "What is the haustral contraction?",
    "a": "Slow segmentation movements in the colon that mix contents and promote water absorption."
  },
  {
    "q": "What is mass movement in the colon?",
    "a": "Powerful peristaltic contractions that occur 3–4 times daily, propel feces toward rectum."
  },
  {
    "q": "What is the rectoanal inhibitory reflex?",
    "a": "Distension of rectum → relaxation of internal anal sphincter (parasympathetic mediated)."
  },
  {
    "q": "What maintains voluntary continence?",
    "a": "External anal sphincter (skeletal muscle, pudendal nerve, S2–S4)."
  },
  {
    "q": "What is Hirschsprung’s disease?",
    "a": "Congenital absence of ganglion cells in distal colon → failure of relaxation → functional obstruction and megacolon."
  },
  {
    "q": "What is the blood supply to the foregut, midgut, and hindgut?",
    "a": "<ul><li><b>Foregut:</b> Celiac trunk</li><li><b>Midgut:</b> Superior mesenteric artery</li><li><b>Hindgut:</b> Inferior mesenteric artery</li></ul>"
  },
  {
    "q": "What is the portal circulation?",
    "a": "Venous blood from GI tract, spleen, and pancreas drains into portal vein → liver sinusoids → hepatic veins."
  },
  {
    "q": "What is the unique feature of splanchnic circulation?",
    "a": "Two capillary beds in series (intestinal capillaries → hepatic sinusoids)."
  },
  {
    "q": "What stimulates liver regeneration?",
    "a": "Hepatocyte growth factor (HGF) and other cytokines after partial hepatectomy."
  },
  {
    "q": "What are the major functions of the liver?",
    "a": "Metabolism (carb, protein, lipid), detoxification, synthesis (albumin, clotting factors), bile production, storage (glycogen, vitamins)."
  },
  {
    "q": "What is bilirubin metabolism pathway?",
    "a": "Heme → unconjugated bilirubin (bound to albumin) → liver conjugation (glucuronidation) → conjugated bilirubin → bile → intestine → urobilinogen (some reabsorbed, some excreted as stercobilin)."
  },
  {
    "q": "Differentiate conjugated vs unconjugated hyperbilirubinemia.",
    "a": "<b>Unconjugated:</b> Heme → unconjugated bilirubin (bound to albumin) → liver conjugation (glucuronidation) → conjugated bilirubin → bile → intestine → urobilinogen (some reabsorbed, some excreted as stercobilin)."
  },
  {
    "q": "What is the cause of jaundice in hemolytic anemia?",
    "a": "Conjugated: Biliary obstruction, Dubin-Johnson, Rotor syndrome."
  },
  {
    "q": "What is the most common cause of conjugated hyperbilirubinemia?",
    "a": "Biliary tract obstruction (e.g., gallstones, pancreatic cancer)."
  },
  {
    "q": "What is the function of Kupffer cells?",
    "a": "Macrophages in liver sinusoids that clear bacteria, toxins, and old RBCs."
  },
  {
    "q": "What is the space of Disse?",
    "a": "Perisinusoidal space between hepatocytes and sinusoidal endothelium — site of exchange."
  },
  {
    "q": "What is the significance of Zone 1 vs Zone 3 in liver acinus?",
    "a": "<ul><li><b>Zone 1 (periportal):</b> Oxygen-rich, resistant to hypoxia.</li><li><b>Zone 3 (centrilobular):</b> Oxygen-poor, most susceptible to hypoxic and toxic injury.</li></ul>"
  },
  {
    "q": "What is the effect of secretin on the liver?",
    "a": "Increases bile flow (choleresis) by stimulating bicarbonate-rich secretion from bile ductules."
  },
  {
    "q": "What is the effect of CCK on the biliary system?",
    "a": "Causes gallbladder contraction and sphincter of Oddi relaxation."
  },
  {
    "q": "What are the primary bile acids?",
    "a": "Cholic acid and chenodeoxycholic acid (synthesized from cholesterol in hepatocytes)."
  },
  {
    "q": "What are secondary bile acids?",
    "a": "Deoxycholic acid and lithocholic acid (formed by bacterial modification in colon)."
  },
  {
    "q": "What is the role of bile salts in fat absorption?",
    "a": "Emulsification of fats and formation of micelles to transport lipid digestion products to enterocytes."
  },
  {
    "q": "What is cholestasis?",
    "a": "Impaired bile flow — can be intrahepatic or extrahepatic."
  },
  {
    "q": "What is the most common cause of chronic pancreatitis in adults?",
    "a": "Chronic alcohol abuse."
  },
  {
    "q": "What is the function of pancreatic lipase?",
    "a": "Hydrolyzes triglycerides into monoglycerides and free fatty acids."
  },
  {
    "q": "What is the role of colipase?",
    "a": "Cofactor that allows pancreatic lipase to function in the presence of bile salts."
  },
  {
    "q": "What activates trypsinogen?",
    "a": "Enteropeptidase (enterokinase) on duodenal brush border."
  },
  {
    "q": "What is the function of pancreatic bicarbonate?",
    "a": "Neutralizes acidic chyme in duodenum to provide optimal pH for pancreatic enzyme activity."
  },
  {
    "q": "What is the secretin stimulation test used for?",
    "a": "Assessing pancreatic exocrine function."
  },
  {
    "q": "What is the most common congenital anomaly of the pancreas?",
    "a": "Pancreas divisum."
  },
  {
    "q": "What hormone inhibits gastric emptying?",
    "a": "CCK and secretin (enterogastrones)."
  },
  {
    "q": "What is receptive relaxation of the stomach?",
    "a": "Vagus-mediated relaxation of fundus and body to accommodate food without increasing pressure."
  },
  {
    "q": "What is the pacemaker of gastric motility?",
    "a": "Interstitial cells of Cajal in the greater curvature."
  },
  {
    "q": "What is the basic electrical rhythm (BER) of the stomach?",
    "a": "3 cycles per minute slow waves."
  },
  {
    "q": "What is the role of motilin?",
    "a": "Initiates the Migrating Motor Complex (MMC) during the fasting state to clear the GI tract of residual contents."
  },
  {
    "q": "What is the role of VIP in the intestine?",
    "a": "Causes relaxation of smooth muscle and increases intestinal secretion of water and electrolytes."
  },
  {
    "q": "What is the effect of somatostatin on the GI tract?",
    "a": "Inhibits release of most GI hormones (including gastrin, CCK, secretin), decreases motility and secretion."
  },
  {
    "q": "What is the mechanism of action of cholera toxin?",
    "a": "Activates Gs protein → ↑ cAMP → opens CFTR Cl⁻ channels → massive secretory diarrhea."
  },
  {
    "q": "What causes traveler’s diarrhea (ETEC)?",
    "a": "Heat-labile toxin (LT) increases cAMP similar to cholera toxin; heat-stable toxin (ST) increases cGMP."
  },
  {
    "q": "What is the absorptive mechanism for iron?",
    "a": "Ferrous iron (Fe²⁺) absorbed in duodenum via DMT1 transporter. Regulated by hepcidin."
  },
  {
    "q": "What is the site of calcium absorption?",
    "a": "Primarily duodenum and proximal jejunum (vitamin D dependent)."
  },
  {
    "q": "What is the consequence of lactose intolerance?",
    "a": "Undigested lactose reaches colon → fermented by bacteria → osmotic diarrhea, gas, bloating."
  },
  {
    "q": "What is celiac disease?",
    "a": "Autoimmune disorder triggered by gluten → villous atrophy in proximal small intestine → malabsorption."
  },
  {
    "q": "What is the diagnostic finding in celiac disease?",
    "a": "Anti-tissue transglutaminase (tTG) antibodies + villous atrophy on biopsy."
  },
  {
    "q": "What is tropical sprue?",
    "a": "Malabsorption syndrome in tropical regions, responds to antibiotics + folate."
  },
  {
    "q": "What is Whipple’s disease?",
    "a": "Caused by Tropheryma whipplei → PAS-positive macrophages in lamina propria, malabsorption."
  },
  {
    "q": "What is the most common cause of steatorrhea?",
    "a": "Pancreatic exocrine insufficiency (chronic pancreatitis) or bile salt deficiency."
  },
  {
    "q": "What is the Schilling test used for?",
    "a": "Diagnosing Vitamin B12 malabsorption (pernicious anemia vs ileal disease)."
  },
  {
    "q": "What is dumping syndrome?",
    "a": "Post-gastric surgery complication: hyperosmolar chyme rapidly enters small intestine → osmotic fluid shift and vasomotor symptoms."
  },
  {
    "q": "What is the role of the appendix in immunity?",
    "a": "Contains abundant lymphoid tissue and may serve as a reservoir for gut microbiota."
  },
  {
    "q": "What is the normal daily volume of intestinal secretions?",
    "a": "Approximately 7–9 liters (most is reabsorbed)."
  },
  {
    "q": "What is the chloride-bicarbonate exchanger in the pancreas?",
    "a": "On apical membrane of duct cells; allows HCO₃⁻ secretion in exchange for Cl⁻."
  },
  {
    "q": "What is the effect of vagotomy on gastric acid secretion?",
    "a": "Reduces cephalic and gastric phases of acid secretion (used historically for peptic ulcer disease)."
  },
  {
    "q": "What is the mechanism of proton pump inhibitors?",
    "a": "Irreversible inhibition of H⁺/K⁺-ATPase on parietal cell canalicular membrane."
  },
  {
    "q": "What is the mechanism of sucralfate?",
    "a": "Forms a protective barrier over ulcer base in acidic environment."
  },
  {
    "q": "What is the role of prostaglandins in gastric protection?",
    "a": "Increase mucus and bicarbonate secretion, enhance mucosal blood flow."
  },
  {
    "q": "What is the most common location of a Meckel’s diverticulum?",
    "a": "2 feet from ileocecal valve on antimesenteric border."
  },
  {
    "q": "What is the rule of 2s for Meckel’s diverticulum?",
    "a": "2% of population, 2 inches long, 2 feet from ileocecal valve, presents by age 2, 2 types of ectopic tissue (gastric/pancreatic)."
  },
  {
    "q": "What is intussusception?",
    "a": "Telescoping of one segment of bowel into another — common cause of intestinal obstruction in children."
  },
  {
    "q": "What is volvulus?",
    "a": "Twisting of bowel on its mesentery — sigmoid volvulus most common in elderly."
  },
  {
    "q": "What is the most common site of peptic ulcer perforation?",
    "a": "Anterior wall of the first part of duodenum."
  },
  {
    "q": "What is the most common cause of lower GI bleeding in adults?",
    "a": "Diverticulosis (usually left-sided)."
  },
  {
    "q": "What is the most common cause of upper GI bleeding?",
    "a": "Peptic ulcer disease."
  },
  {
    "q": "What is the role of the hepatopancreatic ampulla (ampulla of Vater)?",
    "a": "Site where common bile duct and main pancreatic duct join and empty into duodenum."
  },
  {
    "q": "What is the sphincter of Oddi?",
    "a": "Controls release of bile and pancreatic secretions into duodenum."
  },
  {
    "q": "What stimulates release of secretin?",
    "a": "Acid in the duodenum (pH &lt; 4.5)."
  },
  {
    "q": "What stimulates release of CCK?",
    "a": "Fats and amino acids in the duodenum."
  },
  {
    "q": "What is the effect of CCK on the stomach?",
    "a": "Inhibits gastric emptying (enterogastrone effect)."
  },
  {
    "q": "What is the function of GIP (glucose-dependent insulinotropic peptide)?",
    "a": "Inhibits gastric acid secretion and stimulates insulin release in response to glucose."
  },
  {
    "q": "What is the difference between short-chain and long-chain fatty acid absorption?",
    "a": "Short-chain: absorbed directly into portal blood.<br>Long-chain: re-esterified into chylomicrons → lymphatic system."
  },
  {
    "q": "What is the site of absorption of most water-soluble vitamins?",
    "a": "Jejunum."
  },
  {
    "q": "What is the site of absorption of folate?",
    "a": "Jejunum (as monoglutamate)."
  },
  {
    "q": "What is the site of absorption of Vitamin B12?",
    "a": "Terminal ileum (requires intrinsic factor)."
  },
  {
    "q": "What is the consequence of bile acid malabsorption?",
    "a": "Diarrhea (bile acid diarrhea) due to stimulation of colonic secretion."
  },
  {
    "q": "What is the function of enterochromaffin cells?",
    "a": "Secrete serotonin (5-HT) → regulates motility and secretion."
  },
  {
    "q": "What is carcinoid syndrome?",
    "a": "Tumor of enterochromaffin cells → excess serotonin → flushing, diarrhea, valvular heart disease."
  },
  {
    "q": "What is the most common cause of chronic pancreatitis in developed countries?",
    "a": "Chronic alcohol abuse."
  },
  {
    "q": "What is the pathophysiology of acute pancreatitis?",
    "a": "Premature activation of pancreatic enzymes (especially trypsin) inside the pancreas → autodigestion."
  },
  {
    "q": "What are the two most common causes of acute pancreatitis?",
    "a": "Gallstones and alcohol."
  },
  {
    "q": "What are Ranson’s criteria used for?",
    "a": "Prognostic scoring system for severity of acute pancreatitis."
  },
  {
    "q": "What are the clinical signs of retroperitoneal hemorrhage in severe pancreatitis?",
    "a": "Cullen’s sign (periumbilical) and Grey-Turner’s sign (flank)."
  },
  {
    "q": "What is the treatment of choice for gallstone pancreatitis?",
    "a": "Early ERCP if cholangitis or severe obstruction is present."
  },
  {
    "q": "What is the function of pancreatic alpha-amylase?",
    "a": "Hydrolyzes internal α-1,4 glycosidic bonds in starch and glycogen."
  },
  {
    "q": "What activates pancreatic proenzymes?",
    "a": "Enteropeptidase (enterokinase) from duodenal mucosa activates trypsinogen → trypsin then activates other zymogens."
  },
  {
    "q": "What inhibits pancreatic enzyme secretion?",
    "a": "Somatostatin and pancreatic polypeptide."
  },
  {
    "q": "What is the most common congenital anomaly of the pancreas?",
    "a": "Pancreas divisum."
  },
  {
    "q": "What is the blood supply to the pancreas?",
    "a": "Branches of celiac trunk and superior mesenteric artery."
  },
  {
    "q": "What is the venous drainage of the pancreas?",
    "a": "Primarily into the portal venous system."
  },
  {
    "q": "What hormone is secreted by delta cells of the pancreas?",
    "a": "Somatostatin (inhibits insulin and glucagon)."
  },
  {
    "q": "What is the role of glucagon in the GI tract?",
    "a": "Inhibits GI motility and secretion."
  },
  {
    "q": "What is Zollinger-Ellison syndrome?",
    "a": "Gastrin-secreting tumor (gastrinoma) → severe peptic ulcer disease and diarrhea."
  },
  {
    "q": "Where are gastrinomas most commonly located?",
    "a": "Duodenum and pancreas (triangle of gastrinomas)."
  },
  {
    "q": "What is the diagnostic test for Zollinger-Ellison syndrome?",
    "a": "Fasting serum gastrin level + secretin stimulation test."
  },
  {
    "q": "What is the most common functional pancreatic neuroendocrine tumor?",
    "a": "Insulinoma."
  },
  {
    "q": "What is the Whipple triad for insulinoma?",
    "a": "<ol><li>Hypoglycemic symptoms</li><li>Low blood glucose</li><li>Relief with glucose administration.</li></ol>"
  },
  {
    "q": "What is VIPoma?",
    "a": "Verner-Morrison syndrome — watery diarrhea, hypokalemia, achlorhydria (WDHA syndrome)."
  },
  {
    "q": "What is glucagonoma syndrome?",
    "a": "Necrolytic migratory erythema, diabetes, weight loss, anemia."
  },
  {
    "q": "What is somatostatinoma?",
    "a": "Inhibits GI hormones → steatorrhea, diabetes, gallstones."
  },
  {
    "q": "What is the law of the intestine?",
    "a": "Distension causes contraction above and relaxation below the bolus (peristalsis)."
  },
  {
    "q": "What are interstitial cells of Cajal?",
    "a": "Pacemaker cells of the GI tract that generate slow waves."
  },
  {
    "q": "What is the basic electrical rhythm (BER) frequency in stomach vs small intestine?",
    "a": "Stomach: 3/min<br>Small intestine: 12/min (duodenum) decreasing distally."
  },
  {
    "q": "What is the effect of motilin on the stomach?",
    "a": "Increases gastric motility during fasting (part of MMC)."
  },
  {
    "q": "What is the gastroileal reflex?",
    "a": "Food in stomach → increased ileal motility and relaxation of ileocecal sphincter."
  },
  {
    "q": "What is the defecation reflex?",
    "a": "Rectal distension → parasympathetic mediated relaxation of internal anal sphincter + urge to defecate."
  },
  {
    "q": "What maintains fecal continence?",
    "a": "Internal anal sphincter (sympathetic + tonic) and external anal sphincter (voluntary, pudendal nerve)."
  },
  {
    "q": "What is the most common site of colonic diverticula?",
    "a": "Sigmoid colon."
  },
  {
    "q": "What is the difference between diverticulosis and diverticulitis?",
    "a": "Diverticulosis = presence of diverticula.<br>Diverticulitis = inflammation/infection of diverticula."
  },
  {
    "q": "What is Ogilvie’s syndrome?",
    "a": "Acute colonic pseudo-obstruction (massive colonic dilation without mechanical obstruction)."
  },
  {
    "q": "What is the most common cause of bacterial overgrowth?",
    "a": "Impaired motility (scleroderma, diabetes, post-surgical blind loops)."
  },
  {
    "q": "What breath test is used to diagnose small intestinal bacterial overgrowth (SIBO)?",
    "a": "Lactulose or glucose hydrogen breath test."
  },
  {
    "q": "What is the role of gut microbiota in short-chain fatty acid production?",
    "a": "Fermentation of dietary fiber → butyrate, propionate, acetate (energy source for colonocytes)."
  },
  {
    "q": "What is the function of Peyer’s patches?",
    "a": "Gut-associated lymphoid tissue (GALT) involved in mucosal immunity and antigen sampling."
  },
  {
    "q": "What cells sample antigens in the gut lumen?",
    "a": "M cells (microfold cells) overlying Peyer’s patches."
  },
  {
    "q": "What immunoglobulin is secreted into the gut lumen?",
    "a": "Secretory IgA (dimeric IgA + secretory component)."
  },
  {
    "q": "What is the significance of the gut-brain axis?",
    "a": "Bidirectional communication between enteric nervous system and central nervous system via vagus nerve and hormones."
  },
  {
    "q": "What is the most common congenital GI anomaly?",
    "a": "Meckel’s diverticulum."
  },
  {
    "q": "What is the embryonic origin of the enteric nervous system?",
    "a": "Neural crest cells."
  },
  {
    "q": "What is the foregut-midgut junction?",
    "a": "Major duodenal papilla (ampulla of Vater)."
  },
  {
    "q": "What is the midgut-hindgut junction?",
    "a": "Distal third of transverse colon (cannonical point)."
  }
];

module.exports = { giCards };
