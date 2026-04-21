-- ==========================================
-- Topic: Biochemistry (Metabolism + Genetics) - 100 Standalone MCQs
-- Semester 2 First Year
-- ==========================================

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    -- 1. Get or Create the Topic ID (KEEPING System Level intact)
    SELECT id INTO v_topic_id FROM topics 
    WHERE title = 'Biochemistry (Metabolism + Genetics)' AND semester_id = 2;
    
    IF v_topic_id IS NULL THEN
        INSERT INTO topics (semester_id, title, slug, "order", usmle_step)
        VALUES (2, 'Biochemistry (Metabolism + Genetics)', 'biochemistry-metabolism-genetics', 15, 1)
        RETURNING id INTO v_topic_id;
    END IF;

    -- 2. Cleanup existing MCQs for THIS topic ONLY
    DELETE FROM mcqs WHERE topic_id = v_topic_id;

    -- 3. Insert 100 MCQs
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'The rate-limiting enzyme of glycolysis is:', '["Hexokinase", "Pyruvate kinase", "Phosphofructokinase-1", "Aldolase", "Lactate dehydrogenase"]', 2, 'PFK-1 is the primary regulated step in glycolysis.'),
    (v_topic_id, 'Glycolysis occurs in the:', '["Mitochondria", "Cytosol", "Nucleus", "Endoplasmic reticulum", "Golgi apparatus"]', 1, 'Glycolysis is a cytoplasmic pathway.'),
    (v_topic_id, 'The main purpose of converting pyruvate to lactate under anaerobic conditions is to regenerate:', '["ATP", "NAD+", "FAD", "Acetyl-CoA", "Oxaloacetate"]', 1, 'Lactate dehydrogenase oxidizes NADH to NAD+ to keep glycolysis running.'),
    (v_topic_id, 'Pyruvate dehydrogenase converts pyruvate to:', '["Lactate", "Acetyl-CoA", "Oxaloacetate", "Citrate", "Malate"]', 1, 'The PDH complex performs oxidative decarboxylation of pyruvate.'),
    (v_topic_id, 'Which cofactor is required by pyruvate dehydrogenase?', '["Biotin", "Thiamine", "Pyridoxine", "Cobalamin", "Folate"]', 1, 'PDH requires Thiamine pyrophosphate (TPP).'),
    (v_topic_id, 'The TCA cycle occurs primarily in the:', '["Cytosol", "Mitochondrial matrix", "Nucleus", "Peroxisome", "Lysosome"]', 1, 'All TCA enzymes except succinate dehydrogenase are in the matrix.'),
    (v_topic_id, 'A major product of the TCA cycle is:', '["Glucose", "NADH", "Lactate", "Urea", "Ribose-5-phosphate"]', 1, 'The cycle harvests high-energy electrons (NADH/FADH2) for the ETC.'),
    (v_topic_id, 'The final electron acceptor in the electron transport chain is:', '["NAD+", "FAD", "Oxygen", "Coenzyme Q", "Cytochrome c"]', 2, 'Oxygen is reduced to water at Complex IV.'),
    (v_topic_id, 'Oxidative phosphorylation occurs on the:', '["Outer mitochondrial membrane", "Inner mitochondrial membrane", "Cytosolic surface", "Nuclear membrane", "Golgi membrane"]', 1, 'ATP synthase and the ETC are embedded in the inner mitochondrial membrane.'),
    (v_topic_id, 'Uncoupling of oxidative phosphorylation would be expected to:', '["Increase ATP synthesis", "Decrease oxygen consumption", "Increase heat production", "Stop electron transport completely", "Block glycolysis directly"]', 2, 'Uncouplers dissipate the proton gradient, converting the energy into heat.'),
    (v_topic_id, 'The pentose phosphate pathway generates:', '["ATP and pyruvate", "NADPH and ribose-5-phosphate", "FADH2 and ketones", "Urea and ammonia", "Acetyl-CoA and malate"]', 1, 'The PPP provides reducing power (NADPH) and sugar for nucleotides.'),
    (v_topic_id, 'NADPH is especially important for maintaining which molecule in reduced form inside RBCs?', '["Glutathione", "Hemoglobin", "Bilirubin", "Lactate", "Uric acid"]', 0, 'Reduced glutathione protects RBC membranes from oxidative damage.'),
    (v_topic_id, 'The rate-limiting enzyme of the pentose phosphate pathway is:', '["PFK-1", "Pyruvate kinase", "Glucose-6-phosphate dehydrogenase", "Hexokinase", "Fructose-1,6-bisphosphatase"]', 2, 'G6PD is the primary control point of the pathway.'),
    (v_topic_id, 'Liver glycogen primarily serves to:', '["Fuel muscle contraction", "Maintain blood glucose between meals", "Produce ketone bodies", "Synthesize protein", "Generate NADPH"]', 1, 'The liver releases glucose into the blood to maintain euglycemia.'),
    (v_topic_id, 'Muscle glycogen cannot directly contribute to blood glucose because muscle lacks:', '["Glycogen phosphorylase", "Glucose-6-phosphatase", "Hexokinase", "Glycogen synthase", "PFK-1"]', 1, 'Muscle cannot dephosphorylate G6P, so glucose cannot exit the cell.'),
    (v_topic_id, 'Gluconeogenesis occurs mainly in the:', '["Brain", "Liver", "RBC", "Adipose tissue", "Platelets"]', 1, 'The liver is the body''s major site of glucose synthesis.'),
    (v_topic_id, 'Which of the following can serve as a major substrate for gluconeogenesis?', '["Acetyl-CoA", "Lactate", "Leucine", "Palmitate", "Cholesterol"]', 1, 'Lactate, glycerol, and alanine are major gluconeogenic precursors.'),
    (v_topic_id, 'Pyruvate carboxylase requires which cofactor?', '["Biotin", "Thiamine", "Pyridoxine", "Niacin", "Riboflavin"]', 0, 'Biotin is the required cofactor for carboxylation of pyruvate.'),
    (v_topic_id, 'Fructose-2,6-bisphosphate:', '["Activates gluconeogenesis", "Activates glycolysis", "Inhibits PFK-1", "Activates glycogen phosphorylase", "Blocks pyruvate kinase directly"]', 1, 'F-2,6-BP is the most powerful activator of PFK-1 in the liver.'),
    (v_topic_id, 'Fructose metabolism occurs predominantly in the:', '["Brain", "Liver", "Skeletal muscle", "RBC", "Spleen"]', 1, 'The liver expresses fructokinase for rapid fructose uptake.'),
    (v_topic_id, 'Hereditary fructose intolerance is caused by deficiency of:', '["Fructokinase", "Aldolase B", "Lactase", "Galactokinase", "Pyruvate kinase"]', 1, 'Deficiency of Aldolase B leads to accumulation of Fructose-1-Phosphate.'),
    (v_topic_id, 'Classic galactosemia is most commonly due to deficiency of:', '["Galactokinase", "Galactose-1-phosphate uridyltransferase", "Lactase", "Aldolase B", "Hexokinase"]', 1, 'GALT deficiency leads to accumulation of Galactose-1-Phosphate.'),
    (v_topic_id, 'Beta-oxidation of fatty acids occurs in the:', '["Cytosol", "Mitochondria", "Nucleus", "Golgi", "Lysosome"]', 1, 'Fatty acids are broken down in the mitochondrial matrix.'),
    (v_topic_id, 'Long-chain fatty acids enter mitochondria via the:', '["Malate shuttle", "Carnitine shuttle", "Glycerol shuttle", "Cori shuttle", "GLUT4 system"]', 1, 'The carnitine shuttle is the required transport mechanism for LCFAs.'),
    (v_topic_id, 'Beta-oxidation produces:', '["Glucose", "Acetyl-CoA, NADH, and FADH2", "Lactate and pyruvate", "Ribose-5-phosphate", "Urea and ammonia"]', 1, 'Produces high-energy molecules for the TCA cycle and ETC.'),
    (v_topic_id, 'Fatty acid synthesis occurs in the:', '["Mitochondria", "Cytosol", "Nucleus", "Peroxisome", "Lysosome"]', 1, 'Lipogenesis is a cytoplasmic biosynthetic process.'),
    (v_topic_id, 'The committed step of fatty acid synthesis is catalyzed by:', '["HMG-CoA reductase", "Acetyl-CoA carboxylase", "Fatty acid synthase", "CPT I", "Citrate synthase"]', 1, 'ACC converts acetyl-CoA into malonyl-CoA.'),
    (v_topic_id, 'Fatty acid synthesis requires:', '["NADH", "NADPH", "FADH2", "Uric acid", "Bilirubin"]', 1, 'NADPH provides the necessary reducing power.'),
    (v_topic_id, 'Malonyl-CoA inhibits:', '["Acetyl-CoA carboxylase", "Carnitine palmitoyltransferase I", "Glycogen phosphorylase", "HMG-CoA reductase", "Pyruvate carboxylase"]', 1, 'Malonyl-CoA prevents beta-oxidation while fat is being synthesized.'),
    (v_topic_id, 'Ketone bodies are synthesized mainly in the:', '["Brain", "Liver", "Muscle", "Kidney", "RBC"]', 1, 'Ketogenesis is primarily a hepatic process.'),
    (v_topic_id, 'Ketone bodies are formed from excess:', '["Oxaloacetate", "Acetyl-CoA", "Lactate", "Glucose-6-phosphate", "Ribose"]', 1, 'Excess acetyl-CoA is shunted into ketone body production.'),
    (v_topic_id, 'The liver cannot use ketone bodies because it lacks:', '["Carnitine", "Thiophorase", "Pyruvate dehydrogenase", "Hexokinase", "PFK-1"]', 1, 'Liver lacks thiophorase, preventing consumption of its own ketones.'),
    (v_topic_id, 'The rate-limiting enzyme of cholesterol synthesis is:', '["Acetyl-CoA carboxylase", "HMG-CoA reductase", "Lipoprotein lipase", "Hormone-sensitive lipase", "Pyruvate kinase"]', 1, 'HMG-CoA reductase is the major regulated step and drug target.'),
    (v_topic_id, 'Cholesterol synthesis is generally stimulated by:', '["Glucagon", "Insulin", "Fasting", "Epinephrine", "AMP"]', 1, 'Insulin signals the fed state, promoting lipid synthesis.'),
    (v_topic_id, 'The urea cycle functions primarily to detoxify:', '["Lactate", "Ammonia", "Ketone bodies", "Bilirubin", "Glucose"]', 1, 'Converts highly toxic nitrogenous waste into soluble urea.'),
    (v_topic_id, 'The urea cycle occurs mainly in the:', '["Liver", "Brain", "RBC", "Spleen", "Adipose tissue"]', 0, 'The liver is the primary site of ammonia detoxification.'),
    (v_topic_id, 'The first committed enzyme of the urea cycle is:', '["Carbamoyl phosphate synthetase I", "Ornithine transcarbamylase", "Arginase", "CPS II", "Glutaminase"]', 0, 'CPS I is the mitochondrial entry point for the urea cycle.'),
    (v_topic_id, 'N-acetylglutamate acts as an activator of:', '["HMG-CoA reductase", "Carbamoyl phosphate synthetase I", "Pyruvate dehydrogenase", "PFK-1", "Acetyl-CoA carboxylase"]', 1, 'NAG is the obligate allosteric activator for CPS I.'),
    (v_topic_id, 'Phenylketonuria is caused by defective metabolism of:', '["Leucine", "Phenylalanine", "Methionine", "Glycine", "Arginine"]', 1, 'PKU results from high levels of phenylalanine.'),
    (v_topic_id, 'Maple syrup urine disease affects metabolism of:', '["Aromatic amino acids", "Branched-chain amino acids", "Acidic amino acids", "Basic amino acids", "Sulfur-containing amino acids only"]', 1, 'MSUD blocks degradation of Leucine, Isoleucine, and Valine.'),
    (v_topic_id, 'DNA polymerase synthesizes DNA in the:', '["3''→5'' direction", "5''→3'' direction", "Random direction", "2''→5'' direction", "Bidirectional direction on the same strand"]', 1, 'Replication always proceeds toward the 3'' end.'),
    (v_topic_id, 'The lagging strand is synthesized:', '["Continuously", "Discontinuously", "Without primers", "Only in mitochondria", "Only after ligase action"]', 1, 'Lagging strand matches the fork direction via small fragments.'),
    (v_topic_id, 'Okazaki fragments are found on the:', '["Leading strand", "Lagging strand", "Template strand", "mRNA strand", "Histone core"]', 1, 'Discontinuous pieces formed on the lagging strand.'),
    (v_topic_id, 'Primase synthesizes:', '["DNA primers", "RNA primers", "Histones", "Telomeres", "Ligase"]', 1, 'RNA primers are required for DNA polymerase to start.'),
    (v_topic_id, 'Transcription is carried out by:', '["DNA polymerase", "RNA polymerase", "Primase", "Ligase", "Telomerase"]', 1, 'RNA polymerase copies DNA into RNA.'),
    (v_topic_id, 'Eukaryotic mRNA processing includes:', '["Only splicing", "Capping, polyadenylation, and splicing", "Only translation", "DNA replication", "Histone methylation only"]', 1, 'Triple processing ensures stability and identification.'),
    (v_topic_id, 'A missense mutation results in:', '["Premature stop codon", "Change of one amino acid to another", "No amino acid change", "Deletion of an entire chromosome", "Trinucleotide repeat expansion"]', 1, 'Changes the primary sequence of the protein.'),
    (v_topic_id, 'A nonsense mutation results in:', '["One amino acid substitution", "Premature stop codon", "Reading frame shift", "Silent codon change", "Inversion"]', 1, 'Terminates translation prematurely.'),
    (v_topic_id, 'Trisomy 21 most commonly results from:', '["Frameshift mutation", "Meiotic nondisjunction", "Mitochondrial inheritance", "Point mutation", "Genomic imprinting"]', 1, 'Error in chromosome separation during meiosis.'),
    (v_topic_id, 'X-linked recessive disorders are generally more common in:', '["Females", "Males", "Both sexes equally", "Neonates only", "Elderly adults only"]', 1, 'Males have only one X chromosome and express any allele on it.'),
    (v_topic_id, 'In the fed state, the liver is most likely to increase:', '["Gluconeogenesis", "Glycogen synthesis", "Ketogenesis", "Beta-oxidation", "Proteolysis"]', 1, 'Insulin promotes storage of glucose as glycogen.'),
    (v_topic_id, 'In early fasting, the hormone most responsible for increasing hepatic glucose output is:', '["Insulin", "Glucagon", "Prolactin", "Aldosterone", "Calcitonin"]', 1, 'Glucagon triggers glycogenolysis in the liver.'),
    (v_topic_id, 'GLUT4 is the major insulin-responsive glucose transporter in:', '["Liver and pancreatic beta cells", "Skeletal muscle and adipose tissue", "Brain and RBCs", "Kidney and intestine", "Hepatocytes only"]', 1, 'Insulin recruits GLUT4 to the surfaces of muscle and fat cells.'),
    (v_topic_id, 'GLUT2 is found prominently in:', '["Skeletal muscle only", "Adipose tissue only", "Liver and pancreatic beta cells", "RBCs only", "Neurons only"]', 2, 'GLUT2 allows for glucose sensing in beta cells and uptake in liver.'),
    (v_topic_id, 'The Cori cycle involves:', '["Alanine transport from muscle to liver", "Lactate transport from muscle/RBCs to liver", "Ketone transport from liver to brain", "Ammonia transport from liver to kidney", "Glucose transport from adipose to liver"]', 1, 'Recycles lactate produced by active muscle/RBCs back into glucose.'),
    (v_topic_id, 'The glucose-alanine cycle is important because alanine transports:', '["Only carbon from liver to muscle", "Nitrogen and carbon skeletons from muscle to liver", "Ketones from liver to brain", "Fatty acids from adipose to liver", "Ribose from liver to marrow"]', 1, 'Transports toxic muscle nitrogen safely to the liver.'),
    (v_topic_id, 'Pyruvate carboxylase converts pyruvate to oxaloacetate and requires:', '["Thiamine", "Biotin", "Pyridoxine", "Cobalamin", "Folate"]', 1, 'PC is a biotin-dependent carboxylase.'),
    (v_topic_id, 'Pyruvate carboxylase is activated by:', '["Citrate", "Acetyl-CoA", "AMP", "NADH", "Fructose-2,6-bisphosphate"]', 1, 'High levels of acetyl-CoA signal the need for more OAA.'),
    (v_topic_id, 'Fructose-2,6-bisphosphate primarily:', '["Activates fructose-1,6-bisphosphatase", "Activates PFK-1 and inhibits fructose-1,6-bisphosphatase", "Inhibits glycolysis entirely", "Stimulates beta-oxidation", "Activates pyruvate carboxylase"]', 1, 'It is the main switch promoting glycolysis over gluconeogenesis.'),
    (v_topic_id, 'In the liver, glucagon decreases fructose-2,6-bisphosphate to favor:', '["Glycolysis", "Gluconeogenesis", "Glycogen synthesis", "Fat acid synthesis", "Cholesterol uptake"]', 1, 'Inhibiting the inhibitor (F-2,6-BP) unlocks gluconeogenesis.'),
    (v_topic_id, 'A major irreversible enzyme unique to gluconeogenesis is:', '["Pyruvate kinase", "PFK-1", "Fructose-1,6-bisphosphatase", "Aldolase", "Lactate dehydrogenase"]', 2, 'Bypasses the PFK-1 step of glycolysis.'),
    (v_topic_id, 'Glucose-6-phosphatase functions to:', '["Phosphorylate glucose", "Release free glucose from glucose-6-phosphate", "Convert glycogen to glucose-1-phosphate", "Convert pyruvate to lactate", "Oxidize glucose to ribose"]', 1, 'Allows free glucose to enter the blood from the liver.'),
    (v_topic_id, 'During intense anaerobic exercise, pyruvate in muscle is most likely converted to:', '["Acetyl-CoA", "Lactate", "Oxaloacetate", "Citrate", "Ketone bodies"]', 1, 'Lactate synthesis allows recycling of NAD+ for fast ATP.'),
    (v_topic_id, 'Pyruvate kinase deficiency most strongly affects:', '["Hepatocytes using beta-oxidation", "Red blood cells dependent on glycolysis", "Brain cells using ketones", "Adipocytes synthesizing fat", "Thyroid follicular cells"]', 1, 'RBCs rely solely on glycolysis and cannot survive PK deficiency.'),
    (v_topic_id, 'The oxidative phase of the pentose phosphate pathway is:', '["Reversible and ATP-producing", "Irreversible and NADPH-producing", "Mitochondrial and ketone-producing", "The main source of acetyl-CoA", "Active only in muscle"]', 1, 'Provides non-reversible synthesis of NADPH.'),
    (v_topic_id, 'Cells especially dependent on NADPH for reductive biosynthesis include:', '["RBCs only", "Hepatocytes and adrenal cortex", "Skeletal muscle only", "Neurons only", "Platelets only"]', 1, 'Hepatocytes use NADPH for fat synthesis; Adrenals for steroids.'),
    (v_topic_id, 'NADPH oxidase in phagocytes uses NADPH to generate:', '["ATP", "Reactive oxygen species", "Ketone bodies", "Glycogen", "Urea"]', 1, 'Creates the "burst" needed to kill microbes.'),
    (v_topic_id, 'In G6PD deficiency, oxidant stress causes hemolysis because RBCs cannot maintain:', '["Oxidized glutathione", "Reduced glutathione", "Acetyl-CoA", "Fructose-2,6-bisphosphate", "Urea"]', 1, 'Reduced glutathione is essential for membrane integrity.'),
    (v_topic_id, 'Glycogeen branching enzyme forms:', '["Alpha-1,4 linkages only", "Alpha-1,6 linkages", "Beta-1,4 linkages", "Peptide bonds", "Ester bonds"]', 1, 'Branching increases solubility and access speed.'),
    (v_topic_id, 'Debranching enzyme deficiency would impair:', '["Glycogen synthesis only", "Complete breakdown of glycogen near branch points", "Glycolysis only", "Fatty acid synthesis", "Cholesterol esterification"]', 1, 'Causes accumulation of abnormal "limit dextrins."'),
    (v_topic_id, 'Hormone-sensitive lipase in adipose tissue is activated by:', '["Insulin", "Epinephrine and glucagon", "Glucose only", "Citrate", "Fructose-2,6-bisphosphate"]', 1, 'Triggers release of fatty acids during stress or fasting.'),
    (v_topic_id, 'Lipoprotein lipase mainly:', '["Mobilize stored triglycerides from adipocytes", "Hydrolyze triglycerides in circulating lipoproteins", "Synthesize ketone bodies", "Oxidize cholesterol", "Release glycerol from glycogen"]', 1, 'Clears fats from the blood into tissues.'),
    (v_topic_id, 'Insulin activates lipoprotein lipase mainly to promote:', '["Fat storage in adipose tissue", "Ketogenesis", "Beta-oxidation in liver", "Cholesterol excretion", "Urea synthesis"]', 0, 'Encourages fat entry into adipocytes after meal.'),
    (v_topic_id, 'The committed step in fatty acid synthesis is formation of malonyl-CoA by:', '["HMG-CoA reductase", "Acetyl-CoA carboxylase", "Fatty acid synthase", "Carnitine acyltransferase I", "Pyruvate carboxylase"]', 1, 'ACC is the principal control point for fat synthesis.'),
    (v_topic_id, 'Fatty acid synthase elongates chains mainly using:', '["Malonyl-CoA units", "Citrate units", "Ketone bodies", "Cholesterol units", "Propionyl-CoA only"]', 0, 'Uses 3nd carbon to add 2-carbon chunks.'),
    (v_topic_id, 'The main product of fatty acid synthase in humans is:', '["Stearate", "Palmitate", "Oleate", "Arachidonate", "Acetate"]', 1, 'Final product is the 16-carbon saturated fat.'),
    (v_topic_id, 'Very-long-chain fatty acids are shortened mainly in the:', '["Cytosol", "Peroxisomes", "Nucleus", "Golgi", "Lysosomes"]', 1, 'Peroxisomes process extra-long fats into shorter pieces.'),
    (v_topic_id, 'Carnitine deficiency would most impair:', '["Glycolysis in RBCs", "Mitochondrial oxidation of long-chain fatty acids", "Cholesterol synthesis", "Urea cycle", "Pentose phosphate pathway"]', 1, 'LCFAs cannot cross into the matrix for energy.'),
    (v_topic_id, 'Ketogenesis is favored when hepatic oxaloacetate is depleted because it is being used for:', '["Glycogenesis", "Gluconeogenesis", "Cholesterol synthesis", "Heme synthesis", "Purine salvage"]', 1, 'Low carbohydrate availability forces OAA toward glucose synthesis.'),
    (v_topic_id, 'HMG-CoA is an intermediate in both:', '["Glycolysis and TCA cycle", "Ketogenesis and cholesterol synthesis", "Urea cycle and beta-oxidation", "PPP and glycogenesis", "Purine synthesis and glycolysis"]', 1, 'Branching point in the liver matrix vs cytosol.'),
    (v_topic_id, 'HMG-CoA reductase is inhibited by:', '["Insulin", "Statins", "Citrate", "NADPH", "Fructose-2,6-bisphosphate"]', 1, 'Statins are competitive inhibitors of this enzyme.'),
    (v_topic_id, 'LDL primarily delivers:', '["Triglycerides from gut to tissues", "Cholesterol to peripheral tissues", "Cholesterol from tissues to liver", "Ketones to brain", "Bile salts to intestine"]', 1, 'Delivers cholesterol to cells expressing LDL receptors.'),
    (v_topic_id, 'HDL is most associated with:', '["Delivery of dietary triglycerides", "Reverse cholesterol transport", "Hepatic ketogenesis", "Glucose transport", "Urea excretion"]', 1, 'Gathers excess cholesterol from tissues to return to liver.'),
    (v_topic_id, 'ApoB-48 is associated mainly with:', '["LDL", "Chylomicrons", "HDL", "VLDL only", "Albumin"]', 2, 'Marker for chylomicrons entering from the gut.'),
    (v_topic_id, 'ApoB-100 is found in:', '["Chylomicrons only", "VLDL and LDL", "HDL only", "Albumin only", "Ketone bodies only"]', 1, 'Found in lipoproteins of hepatic origin.'),
    (v_topic_id, 'The urea cycle links with the TCA cycle through fumarate, which can be converted to:', '["Citrate only", "Malate and then oxaloacetate", "Acetyl-CoA only", "Lactate only", "Glucose-6-phosphate directly"]', 1, 'Fumarate returns to the mitochondrial matrix to reach the TCA cycle.'),
    (v_topic_id, 'Ornithine transcarbamylase deficiency typically leads to:', '["Hyperammonemia", "Hypoglycemia only", "Hypercholesterolemia", "Isolated lactic acidosis only", "Ketonuria without ammonia change"]', 0, 'Classic cause of toxic ammonia buildup.'),
    (v_topic_id, 'Arginase catalyzes the final step of the urea cycle, producing:', '["Carbamoyl phosphate and urea", "Urea and ornithine", "Citrulline and NH3", "Argininosuccinate and fumarate", "Aspartate and CO2"]', 1, 'Releases urea for excretion and resets the cycle.'),
    (v_topic_id, 'Phenylalanine hydroxylase deficiency impairs conversion of phenylalanine to:', '["Leucine", "Tyrosine", "Tryptophan", "Alanine", "Methionine"]', 1, 'PKU patients cannot make Tyrosine natively.'),
    (v_topic_id, 'Branched-chain alpha-ketoacid dehydrogenase deficiency causes accumulation of:', '["Leucine, isoleucine, and valine metabolites", "Phenylalanine and tyrosine", "Methionine and homocysteine", "Glycine and serine", "Lysine and tryptophan"]', 0, 'Results in sweet-smelling urine from branched-chain buildup.'),
    (v_topic_id, 'DNA helicase functions to:', '["Add RNA primers", "Unwind the DNA double helix", "Join Okazaki fragments", "Proofread newly synthesized DNA", "Remove thymine dimers"]', 1, 'Opens the "zipper" for replication.'),
    (v_topic_id, 'DNA ligase primarily:', '["Synthesizes RNA primers", "Seals nicks between DNA fragments", "Unwinds DNA", "Adds telomeres", "Removes introns"]', 1, 'Connects DNA backbone nicks in repair and synthesis.'),
    (v_topic_id, 'Telomerase is especially active in:', '["Mature RBCs", "Germ cells and many cancer cells", "Skeletal muscle only", "Hepatocytes only in fasting", "Platelets only"]', 1, 'Maintains chromosome length in proliferative cells.'),
    (v_topic_id, 'Nucleotide excision repair is especially important for repairing:', '["Mismatched bases after replication", "Bulky DNA lesions such as thymine dimers", "Double-strand breaks only", "Trinucleotide repeat expansion", "RNA primer errors only"]', 1, 'Removes logic "bulks" like those from UV rays.'),
    (v_topic_id, 'A silent mutation is one that:', '["Creates a premature stop codon", "Changes the codon but not the amino acid", "Shifts the reading frame", "Deletes a chromosome", "Always abolishes protein function"]', 1, 'No change in the resulting amino acid sequence.'),
    (v_topic_id, 'In an autosomal dominant disorder, an affected heterozygous parent and unaffected partner have what risk of affected offspring?', '["0%", "25%", "50%", "75%", "100%"]', 2, 'Aa x aa genotype cross results in 50% affected.'),
    (v_topic_id, 'Mitochondrial inheritance is characterized by transmission from:', '["Father only", "Mother only", "Both parents equally", "Y chromosome only", "Autosomes only"]', 1, 'Inherited through the oocyte (egg).'),
    (v_topic_id, 'Trinucleotide repeat expansion disorders are classically associated with:', '["Frameshift in every generation only", "Anticipation", "Mitochondrial inheritance", "X-linked recessive transmission only", "Codominance only"]', 1, 'Symptoms appear earlier and more severely in next generation.'),
    (v_topic_id, 'A karyotype 47,XX,+21 most likely resulted from:', '["Point mutation", "Meiotic nondisjunction", "Frameshift mutation", "Triplet repeat expansion", "Mismatch repair defect only"]', 1, 'Numeric chromosomal error during gametogenesis.'),
    (v_topic_id, 'Which best describes the major metabolic pattern of uncontrolled type 1 diabetes?', '["High insulin, high glycogen synthesis, low lipolysis", "Low insulin, increased lipolysis, increased ketogenesis", "Low glucagon, low gluconeogenesis, low ketones", "High insulin, low GLUT4, high glycogenolysis", "Normal insulin, isolated lactic acidosis only"]', 1, 'Absolute insulin deficiency triggers a "pseudo-starvation" state with high ketones.');

    RAISE NOTICE 'Biochemistry (Metabolism + Genetics) MCQs Migration Completed (100 Questions).';
END $$;
