-- ==========================================
-- Topic: Biochemistry (Metabolism + Genetics) - 25 Clinical Cases
-- Semester 2 First Year
-- ==========================================

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Create/Get the 'Metabolism + Genetics' Topic ID
    SELECT id INTO v_topic_id FROM topics 
    WHERE title = 'Biochemistry (Metabolism + Genetics)' AND semester_id = 2;
    
    IF v_topic_id IS NULL THEN
        INSERT INTO topics (semester_id, title, slug, "order", usmle_step)
        VALUES (2, 'Biochemistry (Metabolism + Genetics)', 'biochemistry-metabolism-genetics', 15, 1)
        RETURNING id INTO v_topic_id;
    END IF;

    -- 2. Cleanup existing data for THIS topic ONLY
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    -- CASE 1: Fed State Metabolism
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Fed State Metabolism', 'A healthy 21-year-old man eats a large carbohydrate-rich meal. Two hours later, insulin is high and glucagon is low.', 1) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In the liver, insulin most strongly promotes:', '["Glycogenolysis", "Gluconeogenesis", "Glycogen synthesis", "Ketogenesis", "Beta-oxidation"]', 2, 'Insulin stimulates glycogen synthase through dephosphorylation.'),
    (v_case_id, 'In adipose tissue, insulin increases:', '["Hormone-sensitive lipase activity", "GLUT4-mediated glucose uptake", "Ketone body formation", "Lipolysis", "Urea synthesis"]', 1, 'Insulin promotes glucose uptake in adipose tissue by recruiting GLUT4 to the plasma membrane.'),
    (v_case_id, 'In skeletal muscle, insulin promotes:', '["Glycogen synthesis", "Glycogen breakdown", "Glucose export", "Gluconeogenesis", "Ketogenesis"]', 0, 'Insulin stimulates both glucose uptake and glycogen storage in muscle.'),
    (v_case_id, 'The main hormone opposing insulin in fasting is:', '["ADH", "Glucagon", "Prolactin", "Calcitonin", "Aldosterone"]', 1, 'Glucagon promotes glucose output from the liver during fasting.');

    -- CASE 2: Early Fasting
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Early Fasting', 'A healthy woman has not eaten for 16 hours. Her blood glucose remains normal.', 2) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'During early fasting, blood glucose is maintained mainly by hepatic:', '["Glycogenesis", "Glycogenolysis", "Lipogenesis", "Cholesterol synthesis", "Ketolysis"]', 1, 'Liver glycogen provides the primary defense against hypoglycemia during the first 24 hours of fasting.'),
    (v_case_id, 'As fasting continues, the liver increasingly relies on:', '["Glycolysis", "Gluconeogenesis", "Glycogen synthesis", "Protein synthesis", "PPP only"]', 1, 'Gluconeogenesis becomes the principal source of glucose as glycogen is depleted.'),
    (v_case_id, 'Which is an important substrate for gluconeogenesis?', '["Acetyl-CoA", "Lactate", "Leucine", "Cholesterol", "Palmitate"]', 1, 'Lactate, glycerol, and glucogenic amino acids are major precursors.'),
    (v_case_id, 'The Cori cycle involves transport of lactate from:', '["Liver to brain", "Muscle/RBCs to liver", "Adipose to muscle", "Kidney to liver", "Liver to adipose"]', 1, 'Lactate produced in muscle/RBCs is shipped to the liver to be converted back into glucose.');

    -- CASE 3: Prolonged Starvation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Prolonged Starvation', 'A man stranded for several days has weight loss, low insulin, and elevated ketone bodies.', 3) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In prolonged starvation, the brain increasingly uses:', '["Free fatty acids directly", "Ketone bodies", "Cholesterol", "Glycogen", "Urea"]', 1, 'Ketones reduce the brain''s absolute requirement for glucose.'),
    (v_case_id, 'Ketone bodies are synthesized mainly in the:', '["Muscle mitochondria", "Liver mitochondria", "Brain cytosol", "Adipose cytosol", "RBCs"]', 1, 'Ketogenesis occurs primarily in the mitochondria of hepatocytes.'),
    (v_case_id, 'Ketone use by the brain helps:', '["Increase insulin release", "Spare muscle protein from breakdown", "Increase glycolysis in RBCs", "Block lipolysis", "Stimulate glycogen synthesis"]', 1, 'Ketone utilization decreases the need for gluconeogenesis from amino acids.'),
    (v_case_id, 'The liver cannot utilize ketone bodies efficiently because it lacks:', '["HMG-CoA reductase", "Thiophorase", "Carnitine", "Pyruvate carboxylase", "Hexokinase"]', 1, 'Thiophorase is absent in the liver, preventing a futile cycle.');

    -- CASE 4: Glycolysis in RBCs
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Glycolysis in RBCs', 'A red blood cell relies entirely on glycolysis for ATP production.', 4) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The rate-limiting enzyme of glycolysis is:', '["Hexokinase", "Pyruvate kinase", "PFK-1", "Aldolase", "Lactate dehydrogenase"]', 2, 'PFK-1 is the primary committed and regulated step.'),
    (v_case_id, 'PFK-1 is activated by:', '["ATP and citrate", "AMP and fructose-2,6-bisphosphate", "Acetyl-CoA and NADH", "Alanine and ATP", "Citrate and glucagon"]', 1, 'F-2,6-BP is the most potent activator of hepatic glycolysis.'),
    (v_case_id, 'Under anaerobic conditions, pyruvate is converted to lactate to regenerate:', '["FAD", "NAD+", "ATP", "CoA", "Biotin"]', 1, 'LDH reduces pyruvate to lactate to oxidize NADH to NAD+ for glycolysis to continue.'),
    (v_case_id, 'Mature RBCs cannot run the TCA cycle because they lack:', '["DNA", "Mitochondria", "Ribosomes", "Cytoskeleton", "Cell membrane"]', 1, 'RBCs lose their nuclei and mitochondria during maturation.');

    -- CASE 5: Pyruvate Dehydrogenase Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Pyruvate Dehydrogenase Deficiency', 'An infant presents with neurologic deficits and lactic acidosis due to impaired conversion of pyruvate to acetyl-CoA.', 5) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The defective complex is:', '["Alpha-ketoglutarate dehydrogenase", "Pyruvate dehydrogenase", "Succinate dehydrogenase", "Citrate synthase", "ATP synthase"]', 1, 'PDH connects the glycolytic pathway to the TCA cycle.'),
    (v_case_id, 'Which cofactor is required by pyruvate dehydrogenase?', '["Biotin", "Thiamine", "Cobalamin", "Tetrahydrofolate", "Vitamin C"]', 1, 'PDH requires Thiamine pyrophosphate (TPP).'),
    (v_case_id, 'Pyruvate is shunted toward:', '["Citrate", "Lactate", "Ketones", "Urea", "Cholesterol"]', 1, 'Blocked PDH leads to excess pyruvate being converted to lactate by LDH.'),
    (v_case_id, 'The pyruvate dehydrogenase reaction occurs in the:', '["Cytosol", "Mitochondrial matrix", "Nucleus", "ER", "Golgi"]', 1, 'The PDH complex is located inside the mitochondrial matrix.');

    -- CASE 6: TCA Cycle
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'TCA Cycle', 'A professor asks about the citric acid cycle.', 6) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The TCA cycle occurs in the:', '["Cytosol", "Mitochondrial matrix", "Nucleus", "Peroxisome", "Plasma membrane"]', 1, 'Most citrate cycle enzymes are in the matrix space.'),
    (v_case_id, 'Its main purpose is to:', '["Make glucose directly", "Oxidize acetyl-CoA and generate reducing equivalents", "Make fatty acids", "Produce ketones", "Degrade DNA"]', 1, 'The TCA cycle harvests electrons for the ETC.'),
    (v_case_id, 'Which is produced in one turn of the TCA cycle?', '["Lactate", "NADH", "Urea", "Glucose", "Ribose"]', 1, 'NADH and FADH2 are the primary outputs.'),
    (v_case_id, 'Succinate dehydrogenase is unique because it is located in the:', '["Cytosol", "Inner mitochondrial membrane", "Outer mitochondrial membrane", "Nucleus", "Lysosome"]', 1, 'It is part of the TCA cycle and is also Complex II of the ETC.');

    -- CASE 7: Oxidative Phosphorylation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Oxidative Phosphorylation', 'A poison blocks complex IV of the electron transport chain.', 7) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Complex IV normally transfers electrons to:', '["NAD+", "FAD", "Oxygen", "Coenzyme Q", "Succinate"]', 2, 'Complex IV is cytochrome c oxidase, reducing O2 to water.'),
    (v_case_id, 'ATP production decreases because oxidative phosphorylation is impaired in the:', '["Cytosol", "Inner mitochondrial membrane", "Nucleus", "Lysosome", "Golgi"]', 1, 'ATP synthase is embedded in the inner mitochondrial membrane.'),
    (v_case_id, 'Oxygen is the final electron acceptor in:', '["Glycolysis", "Oxidative phosphorylation", "Urea cycle", "Glycogenesis", "Fatty acid synthesis"]', 1, 'Oxygen acts as the ultimate terminal electron sink in aerobic respiration.'),
    (v_case_id, 'Uncoupling oxidative phosphorylation would most directly:', '["Stop oxygen use", "Increase heat production and reduce ATP yield", "Increase ATP synthesis", "Block electron transport completely", "Stop glycolysis in RBCs"]', 1, 'Uncouplers dissipate the proton gradient, creating heat.');

    -- CASE 8: Glycogen Metabolism
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Glycogen Metabolism', 'A student compares liver and muscle glycogen handling.', 8) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Liver glycogen primarily functions to:', '["Fuel the liver only", "Maintain blood glucose", "Make ketones", "Supply amino acids", "Generate NADPH"]', 1, 'The liver serves as a central glucose reservoir during between-meal gaps.'),
    (v_case_id, 'Muscle glycogen cannot directly raise blood glucose because muscle lacks:', '["Glycogen synthase", "Glucose-6-phosphatase", "Hexokinase", "PFK-1", "Glycogen phosphorylase"]', 1, 'Glucose-6-phosphate cannot exit the muscle cell as free glucose.'),
    (v_case_id, 'Glycogen phosphorylase breaks:', '["Alpha-1,6 bonds only", "Alpha-1,4 bonds", "Beta-1,4 bonds", "Peptide bonds", "Ester bonds"]', 1, 'It performs phosphorolysis on alpha-1,4 glycosidic bonds.'),
    (v_case_id, 'Glycogen synthase is most active in the:', '["Fed state", "Fasting state", "Starvation state", "Ketotic state", "Stress response only"]', 0, 'Insulin dephosphorylates and activates glycogen synthase.');

    -- CASE 9: Pentose Phosphate Pathway
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Pentose Phosphate Pathway', 'A young man develops hemolysis after oxidant stress.', 9) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The PPP generates:', '["ATP and pyruvate", "NADPH and ribose-5-phosphate", "Acetyl-CoA and FADH2", "Urea and ammonia", "Citrate and malate"]', 1, 'NADPH is used for redox protection and synthesis; Ribose for DNA/RNA.'),
    (v_case_id, 'NADPH is especially important in RBCs for maintaining:', '["Oxidized glutathione", "Reduced glutathione", "Glycogen stores", "TCA cycle activity", "Urea cycle activity"]', 1, 'G6PD deficiency leaves cells vulnerable to oxidative damage.'),
    (v_case_id, 'The rate-limiting enzyme is:', '["Hexokinase", "Glucose-6-phosphate dehydrogenase", "PFK-1", "Pyruvate kinase", "Citrate synthase"]', 1, 'G6PD is regulated by the NADPH/NADP ratio.'),
    (v_case_id, 'Ribose-5-phosphate is used for synthesis of:', '["Fatty acids", "Nucleotides", "Ketones", "Heme", "Urea"]', 1, 'It serves as the sugar component for nucleotides.');

    -- CASE 10: Fructose Metabolism
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Fructose Metabolism', 'An infant develops vomiting and hypoglycemia after fruit ingestion.', 10) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Hereditary fructose intolerance is due to deficiency of:', '["Fructokinase", "Aldolase B", "Galactokinase", "Lactase", "Hexokinase"]', 1, 'Aldolase B deficiency leads to F-1-P accumulation.'),
    (v_case_id, 'Fructose metabolism occurs mainly in the:', '["Brain", "Liver", "RBC", "Kidney only", "Thyroid"]', 1, 'Fructokinase is primarily located in the liver.'),
    (v_case_id, 'Accumulated fructose-1-phosphate traps:', '["NADH", "Phosphate", "Acetyl-CoA", "FAD", "CoQ"]', 1, 'Phosphate sequestration leads to ATP depletion.'),
    (v_case_id, 'This impairs:', '["Glycogenolysis and gluconeogenesis", "Ketogenesis only", "Heme synthesis", "Cholesterol transport", "DNA replication"]', 0, 'Phosphate depletion inhibits glycogenolysis and blocks gluconeogenesis enzymes.');

    -- CASE 11: Galactose Metabolism
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Galactose Metabolism', 'A newborn develops jaundice, cataracts, and vomiting after milk feeding.', 11) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Classic galactosemia is due to deficiency of:', '["Lactase", "Galactose-1-phosphate uridyltransferase", "Aldolase B", "Fructokinase", "Hexokinase"]', 1, 'GALT deficiency is the most common form.'),
    (v_case_id, 'Cataracts develop because of accumulation of:', '["Sorbitol", "Galactitol", "Glycogen", "Ketones", "Bilirubin only"]', 1, 'Galactitol is an osmotic sugar alcohol formed in the lens.'),
    (v_case_id, 'The offending dietary sugar is:', '["Fructose", "Galactose", "Sucrose", "Maltose", "Ribose"]', 1, 'Milk sugar contains glucose and galactose.');

    -- CASE 12: Beta-Oxidation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Beta-Oxidation', 'A fasting adult is relying on fat for energy.', 12) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Beta-oxidation occurs mainly in the:', '["Cytosol", "Mitochondria", "Nucleus", "ER", "Golgi"]', 1, 'Fatty acid breakdown happens in the matrix space.'),
    (v_case_id, 'Long-chain fatty acids enter mitochondria through the:', '["GLUT4 shuttle", "Carnitine shuttle", "Malate shuttle", "Alanine shuttle", "Ribose shuttle"]', 1, 'CPT1 and CPT2 are part of the carnitine transport system.'),
    (v_case_id, 'Beta-oxidation produces:', '["Glucose only", "Acetyl-CoA, NADH, FADH2", "Lactate only", "Urea only", "Cholesterol only"]', 1, 'The products are high-energy molecules.'),
    (v_case_id, 'Carnitine palmitoyltransferase I is inhibited by:', '["Acetyl-CoA", "Malonyl-CoA", "Citrate", "AMP", "NADPH"]', 1, 'Malonyl-CoA blocks beta-oxidation during fat synthesis.');

    -- CASE 13: Fatty Acid Synthesis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Fatty Acid Synthesis', 'A student compares lipogenesis with beta-oxidation.', 13) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Fatty acid synthesis occurs mainly in the:', '["Mitochondria", "Cytosol", "Nucleus", "Lysosome", "Peroxisome"]', 1, 'Fats are synthesized in the cytoplasm.'),
    (v_case_id, 'The committed step is catalyzed by:', '["Fatty acid synthase", "Acetyl-CoA carboxylase", "HMG-CoA reductase", "CPT I", "Citrate synthase"]', 1, 'ACC transforms acetyl-CoA into malonyl-CoA.'),
    (v_case_id, 'The major reducing equivalent used is:', '["NADH", "NADPH", "FADH2", "ATP only", "CoQ"]', 1, 'NADPH is required for reductive steps in synthesis.'),
    (v_case_id, 'The main product of fatty acid synthase is:', '["Oleate", "Palmitate", "Stearate", "Acetate", "Arachidonate"]', 1, 'Human FAS produces the 16-carbon palmitate.');

    -- CASE 14: Ketone Bodies
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Ketone Bodies', 'A person on prolonged fasting develops elevated beta-hydroxybutyrate.', 14) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Ketone bodies are formed from excess:', '["Glucose", "Acetyl-CoA", "Lactate", "Citrate", "Ribose"]', 1, 'Excess acetyl-CoA is shunted into ketogenesis.'),
    (v_case_id, 'Ketogenesis rises when:', '["Insulin is high", "Glucagon is high and oxaloacetate is diverted to gluconeogenesis", "Glycogenesis is maximal", "ATP is absent", "PPP is overactive only"]', 1, 'Low OAA forces acetyl-CoA toward ketone bodies.'),
    (v_case_id, 'Which tissue cannot use ketone bodies?', '["Brain in starvation", "Skeletal muscle", "Liver", "Cardiac muscle", "Renal cortex"]', 2, 'The liver cannot consume its own ketones due to thiophorase absence.'),
    (v_case_id, 'Which is a ketone body?', '["Succinate", "Acetoacetate", "Citrate", "Malate", "Oxaloacetate"]', 1, 'Acetoacetate is one of the three primary ketone bodies.');

    -- CASE 15: Cholesterol Metabolism
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Cholesterol Metabolism', 'A patient starts a statin.', 15) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Statins inhibit:', '["Acetyl-CoA carboxylase", "HMG-CoA reductase", "CPT I", "Lipoprotein lipase", "Hormone-sensitive lipase"]', 1, 'Statins block the rate-limiting enzyme of cholesterol synthesis.'),
    (v_case_id, 'Cholesterol synthesis occurs mainly in the:', '["Liver", "RBC", "Skeletal muscle only", "Brain only", "Bone only"]', 0, 'Most endogenous cholesterol comes from the liver.'),
    (v_case_id, 'Insulin generally:', '["Inhibits cholesterol synthesis", "Stimulates cholesterol synthesis", "Blocks HMG-CoA reductase transcription", "Stops VLDL secretion entirely", "Converts LDL to HDL"]', 1, 'Insulin promotes lipid synthesis pathways in the fed state.'),
    (v_case_id, 'Cholesterol is a precursor of all except:', '["Steroid hormones", "Bile acids", "Vitamin D", "Glycogen", "Cell membranes"]', 3, 'Glycogen is a carbohydrate polymer.');

    -- CASE 16: Urea Cycle
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Urea Cycle', 'A child presents with hyperammonemia.', 16) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The urea cycle functions mainly to:', '["Make glucose", "Detoxify ammonia", "Make ketones", "Degrade heme", "Produce purines"]', 1, 'Converts highly toxic ammonia to soluble urea for export.'),
    (v_case_id, 'It occurs mainly in the:', '["Kidney", "Liver", "RBC", "Spleen", "Brain"]', 1, 'Nitrogen detoxification is primarily a liver function.'),
    (v_case_id, 'The first committed enzyme is:', '["CPS I", "CPS II", "Ornithine transcarbamylase", "Arginase", "Argininosuccinate lyase"]', 0, 'Carbamoyl phosphate synthetase I initiates the cycle in mitochondria.'),
    (v_case_id, 'CPS I is activated by:', '["NADH", "N-acetylglutamate", "ATP", "Citrate", "Malonyl-CoA"]', 1, 'NAG is the obligate allosteric activator of CPS I.');

    -- CASE 17: Amino Acid Metabolism
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Amino Acid Metabolism', 'A newborn has a musty odor; another child has maple syrup odor in urine.', 17) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'PKU involves impaired metabolism of:', '["Leucine", "Phenylalanine", "Methionine", "Glycine", "Arginine"]', 1, 'Deficiency of PAH leads to phenylalanine buildup.'),
    (v_case_id, 'Maple syrup urine disease affects metabolism of:', '["Aromatic amino acids", "Branched-chain amino acids", "Sulfur-containing amino acids", "Basic amino acids", "Acidic amino acids"]', 1, 'MSUD affects Leucine, Isoleucine, and Valine.'),
    (v_case_id, 'Branched-chain amino acids are:', '["Glycine, alanine, serine", "Leucine, isoleucine, valine", "Phenylalanine, tyrosine, tryptophan", "Lysine, arginine, histidine", "Aspartate, glutamate, asparagine"]', 1, 'L-I-V are the trio affected in MSUD.'),
    (v_case_id, 'Tyrosine becomes essential in:', '["OTC deficiency", "PKU", "Galactosemia", "G6PD deficiency", "Pompe disease"]', 1, 'Tyrosine cannot be synthesized from Phenylalanine in these patients.');

    -- CASE 18: DNA Replication
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'DNA Replication', 'Rapidly dividing cells are examined in S phase.', 18) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'DNA polymerase synthesizes DNA in the:', '["3''→5'' direction", "5''→3'' direction", "Random direction", "2''→5'' direction", "Bidirectionally on one strand only"]', 1, 'Synthesis always proceeds in the 5'' to 3'' direction.'),
    (v_case_id, 'The leading strand is synthesized:', '["Continuously", "Discontinuously", "Without a primer", "Only in mitochondria", "Without enzymes"]', 0, 'Leading strand matches the direction of the fork.'),
    (v_case_id, 'Okazaki fragments are found on the:', '["Leading strand", "Lagging strand", "Template strand", "RNA primer only", "Histone core"]', 1, 'Lagging strand synthesis is discontinuous.'),
    (v_case_id, 'Primase synthesizes:', '["DNA primers", "RNA primers", "Telomeres", "Histones", "Ligase"]', 1, 'DNA polymerase requires a starting RNA RNA primer.');

    -- CASE 19: DNA Repair
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'DNA Repair', 'A child develops extreme sensitivity to UV light.', 19) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'UV light commonly causes:', '["Double-strand breaks only", "Pyrimidine dimers", "Frameshifts", "Trinucleotide repeats", "Methylation only"]', 1, 'UV damage often results in thymine-thymine dimers.'),
    (v_case_id, 'Repair of bulky UV lesions is mainly by:', '["Base excision repair", "Nucleotide excision repair", "Mismatch repair", "Reverse transcription", "Telomerase activity"]', 1, 'NER cuts out a multi-nucleotide segment.'),
    (v_case_id, 'Defective nucleotide excision repair is associated with:', '["Marfan syndrome", "Xeroderma pigmentosum", "CF", "PKU", "Hemophilia A"]', 1, 'XP patients are extremely sun-sensitive.'),
    (v_case_id, 'Mismatch repair defects are classically linked to increased risk of:', '["Colon cancer syndromes", "PKU", "Sickle cell disease", "Tay-Sachs disease", "DMD"]', 0, 'HNPCC (Lynch syndrome) is the classic example.');

    -- CASE 20: Transcription and RNA Processing
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Transcription and RNA Processing', 'A eukaryotic cell is actively expressing a gene.', 20) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Transcription uses:', '["DNA polymerase", "RNA polymerase", "Ligase", "Primase", "Topoisomerase only"]', 1, 'RNA polymerase copies DNA info into mRNA.'),
    (v_case_id, 'Eukaryotic mRNA processing includes:', '["Removal of exons", "Capping, polyadenylation, and splicing", "Translation in the nucleus", "Telomere extension", "DNA methylation only"]', 1, 'Processing protects and identifies the mRNA.'),
    (v_case_id, 'Introns are:', '["Coding segments retained in mature mRNA", "Noncoding segments removed by splicing", "Ribosomal proteins", "DNA primers", "Histone tails"]', 1, 'Introns are "intervening" and non-coding.'),
    (v_case_id, 'Small nuclear ribonucleoproteins are important for:', '["DNA replication", "mRNA splicing", "Cholesterol synthesis", "Glycogen breakdown", "ETC function"]', 1, 'snRNPs are part of the spliceosome.');

    -- CASE 21: Translation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Translation', 'A ribosome is translating an mRNA transcript.', 21) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Translation occurs on:', '["DNA", "Ribosomes", "Golgi", "Lysosomes", "Peroxisomes"]', 1, 'The ribosome is the organelle of protein translation.'),
    (v_case_id, 'tRNA carries:', '["DNA fragments", "Amino acids", "Lipids", "Glucose", "ATP only"]', 1, 'tRNA matches amino acids to their genetic code.'),
    (v_case_id, 'The codon is found on:', '["tRNA", "mRNA", "rRNA", "DNA polymerase", "Histone proteins"]', 1, 'The triplet code is on the mRNA transcript.'),
    (v_case_id, 'The anticodon is found on:', '["mRNA", "tRNA", "rRNA", "DNA", "snRNA only"]', 1, 'Anti-codons on tRNA base-pair with mRNA codons.');

    -- CASE 22: Mutation Types
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Mutation Types', 'A genetics lab studies altered coding sequences.', 22) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A mutation that changes one amino acid to another is:', '["Nonsense", "Missense", "Silent", "Frameshift", "Trinucleotide repeat"]', 1, 'Result of a point mutation.'),
    (v_case_id, 'A mutation creating a premature stop codon is:', '["Missense", "Nonsense", "Silent", "Inversion", "Duplication"]', 1, 'Causes early termination of protein synthesis.'),
    (v_case_id, 'Insertion or deletion not in multiples of three causes:', '["Silent mutation", "Frameshift mutation", "Nonsense only", "Anticipation", "Mosaicism only"]', 1, 'Alters the entire downstream reading frame.'),
    (v_case_id, 'A silent mutation:', '["Always changes protein function", "Changes the codon but not the amino acid", "Deletes a chromosome", "Creates a stop codon", "Causes nondisjunction"]', 1, 'Common due to the wobble hypothesis and degeneracy.');

    -- CASE 23: Inheritance Patterns
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Inheritance Patterns', 'A boy has an X-linked recessive disorder. His mother is a carrier and his father is unaffected.', 23) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The chance that a son is affected is:', '["0%", "25% of all children", "50% of sons", "100% of sons", "75% of daughters"]', 2, 'X-linked recessive affects half the sons of carrier mothers.'),
    (v_case_id, 'Fathers pass their X chromosome to:', '["All sons", "All daughters", "Half of sons", "Neither sex", "Firstborn only"]', 1, 'Fathers can only pass their Y to sons.'),
    (v_case_id, 'X-linked recessive disorders are more common in:', '["Females", "Males", "Both equally", "Only infants", "Only elderly adults"]', 1, 'Males have only one X allele.'),
    (v_case_id, 'Mitochondrial disorders are inherited from the:', '["Father only", "Mother only", "Both parents equally", "Y chromosome only", "Autosomes only"]', 1, 'Mitochondria are cytoplasmic and inherited maternally.');

    -- CASE 24: Chromosomal Abnormalities
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Chromosomal Abnormalities', 'A newborn has trisomy 21. Another family asks about anticipation in repeat disorders.', 24) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Trisomy 21 most commonly results from:', '["Frameshift mutation", "Meiotic nondisjunction", "Missense mutation", "Mitochondrial mutation", "Imprinting only"]', 1, 'Failure of chromosome separation.'),
    (v_case_id, 'Nondisjunction occurs during:', '["Translation", "Meiosis", "Protein folding", "Transcription", "DNA methylation"]', 1, 'Standard cause of numeric chromosomal disorders.'),
    (v_case_id, 'Trinucleotide repeat expansion disorders show:', '["Mosaicism only", "Anticipation", "Codominance only", "Mitochondrial inheritance", "Hardy-Weinberg equilibrium only"]', 1, 'Severity often increases through generations.'),
    (v_case_id, 'A karyotype 47,XX,+21 indicates:', '["Monosomy", "Trisomy", "Balanced translocation", "Inversion", "Deletion"]', 1, 'Indicates Trisomy 21.');

    -- CASE 25: Integrated Diabetes Biochemistry
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (v_topic_id, 'Integrated Diabetes Biochemistry', 'A patient with uncontrolled type 1 diabetes develops hyperglycemia, lipolysis, and ketone overproduction.', 25) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Low insulin causes:', '["Increased glycogen synthesis", "Increased catabolism and reduced anabolic storage", "Increased GLUT4 uptake", "Reduced hormone-sensitive lipase activity", "Reduced gluconeogenesis"]', 1, 'Insulin lack forces the body into a catabolic fasting mode.'),
    (v_case_id, 'In adipose tissue, insulin deficiency increases:', '["Glycogen synthesis", "Hormone-sensitive lipase activity", "Glucose uptake", "Fat storage", "PPP only"]', 1, 'HSL is inhibited by insulin; its lack leads to massive fatty acid release.'),
    (v_case_id, 'In the liver, high glucagon/low insulin increases:', '["Glycolysis and fatty acid synthesis", "Gluconeogenesis and ketogenesis", "Glycogen synthesis only", "Cholesterol uptake only", "Ribose synthesis only"]', 1, 'The liver behaves in fasting mode even if glucose is high.'),
    (v_case_id, 'Excess ketone production can cause:', '["Metabolic alkalosis", "Metabolic acidosis", "Respiratory alkalosis", "Hypercalcemia", "Hypernatremia only"]', 1, 'Ketoacidosis results from the high release of protons.');

    RAISE NOTICE 'Biochemistry (Metabolism + Genetics) Cases Migration Completed (25 Cases).';
END $$;
