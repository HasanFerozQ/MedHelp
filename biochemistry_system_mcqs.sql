-- ==========================================
-- Topic: Biochemistry (System Level) - 100 Standalone MCQs
-- Semester 2 First Year
-- ==========================================

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    -- 1. Get or Create Topic ID
    SELECT id INTO v_topic_id FROM topics 
    WHERE title = 'Biochemistry (System Level)' AND semester_id = 2;
    
    IF v_topic_id IS NULL THEN
        INSERT INTO topics (semester_id, title, slug, "order", usmle_step)
        VALUES (2, 'Biochemistry (System Level)', 'biochemistry-system-level', 15, 1)
        RETURNING id INTO v_topic_id;
    END IF;

    -- 2. Cleanup existing standalone MCQs for this topic
    DELETE FROM mcqs WHERE topic_id = v_topic_id;

    -- 3. Insert 100 MCQs
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'The rate-limiting enzyme of glycolysis is:', '["Hexokinase", "Pyruvate kinase", "Phosphofructokinase-1", "Aldolase", "Lactate dehydrogenase"]', 2, 'PFK-1 is the primary regulated step in glycolysis.'),
    (v_topic_id, 'Glycolysis occurs in the:', '["Mitochondria", "Cytosol", "Nucleus", "ER", "Golgi"]', 1, 'Glycolysis is a cytoplasmic pathway.'),
    (v_topic_id, 'Under anaerobic conditions, pyruvate is converted to lactate in order to regenerate:', '["ATP", "NAD+", "FAD", "Acetyl-CoA", "CO2"]', 1, 'Lactate dehydrogenase oxidizes NADH to NAD+ to keep glycolysis running.'),
    (v_topic_id, 'The main product of glycolysis under aerobic conditions is:', '["Lactate", "Acetyl-CoA", "Pyruvate", "Citrate", "Succinate"]', 2, 'In the presence of oxygen, pyruvate enters the mitochondria for further oxidation.'),
    (v_topic_id, 'Pyruvate dehydrogenase converts pyruvate into:', '["Lactate", "Acetyl-CoA", "Oxaloacetate", "Alanine", "Glucose"]', 1, 'The PDH complex performs oxidative decarboxylation of pyruvate.'),
    (v_topic_id, 'Pyruvate dehydrogenase requires all except:', '["Thiamine", "FAD", "NAD+", "Biotin", "Lipoic acid"]', 3, 'Biotin is used by carboxylases, not by the PDH complex.'),
    (v_topic_id, 'The TCA cycle occurs in the:', '["Cytosol", "Mitochondrial matrix", "Nucleus", "ER", "Lysosome"]', 1, 'All TCA enzymes except succinate dehydrogenase are in the matrix.'),
    (v_topic_id, 'The main function of the TCA cycle is to:', '["Produce glucose", "Generate NADH and FADH2", "Store glycogen", "Produce ketones", "Break down proteins"]', 1, 'The cycle harvests high-energy electrons for the electron transport chain.'),
    (v_topic_id, 'The final electron acceptor in oxidative phosphorylation is:', '["NAD+", "FAD", "Oxygen", "CO2", "ATP"]', 2, 'Oxygen is reduced to water at Complex IV.'),
    (v_topic_id, 'Inhibition of the electron transport chain decreases:', '["Glycolysis", "ATP production", "Lactate formation", "NADH formation", "Oxygen consumption increases"]', 1, 'ATP synthase depends on the proton gradient created by the ETC.'),
    (v_topic_id, 'The pentose phosphate pathway generates:', '["ATP", "NADPH and ribose-5-phosphate", "FADH2", "Lactate", "Ketone bodies"]', 1, 'The PPP is a source of reducing power and 5-carbon sugars.'),
    (v_topic_id, 'NADPH is important for:', '["ATP synthesis", "Reductive biosynthesis and antioxidant defense", "Glycogen breakdown", "Ketone oxidation", "Urea cycle"]', 1, 'NADPH is used for fatty acid synthesis and maintaining reduced glutathione.'),
    (v_topic_id, 'The rate-limiting enzyme of the PPP is:', '["Hexokinase", "Glucose-6-phosphate dehydrogenase", "PFK-1", "Pyruvate kinase", "Lactate dehydrogenase"]', 1, 'G6PD is the primary control point of the pentose phosphate pathway.'),
    (v_topic_id, 'Glycogen synthase is active in the:', '["Fasting state", "Fed state", "Starvation only", "Acidosis only", "Exercise only"]', 1, 'Insulin promotes glycogen synthesis after meals.'),
    (v_topic_id, 'Glycogen phosphorylase breaks:', '["Alpha-1,6 bonds only", "Alpha-1,4 bonds", "Peptide bonds", "Beta-1,4 bonds", "Ester bonds"]', 1, 'It cleaves alpha-1,4 glycosidic bonds via phosphorolysis.'),
    (v_topic_id, 'Liver glycogen helps maintain:', '["Muscle contraction", "Blood glucose levels", "Ketone production", "Protein synthesis", "Fat storage only"]', 1, 'The liver exports glucose to the blood during short-term fasting.'),
    (v_topic_id, 'Muscle glycogen cannot increase blood glucose due to lack of:', '["Glycogen synthase", "Glucose-6-phosphatase", "Hexokinase", "PFK-1", "Pyruvate kinase"]', 1, 'Muscle lacks the enzyme to remove the phosphate from glucose-6-phosphate.'),
    (v_topic_id, 'Gluconeogenesis occurs mainly in the:', '["Muscle", "Liver", "Brain", "RBC", "Adipose"]', 1, 'The liver is the primary site of glucose synthesis (with some contribute from the kidneys).'),
    (v_topic_id, 'Gluconeogenesis uses all except:', '["Lactate", "Alanine", "Glycerol", "Acetyl-CoA", "Oxaloacetate"]', 3, 'Acetyl-CoA cannot be converted back to glucose in humans.'),
    (v_topic_id, 'Fructose metabolism primarily occurs in the:', '["Brain", "Liver", "Muscle", "Kidney", "RBC"]', 1, 'The liver expresses fructokinase for rapid fructose processing.'),
    (v_topic_id, 'Aldolase B deficiency causes:', '["Galactosemia", "Hereditary fructose intolerance", "PKU", "MSUD", "Glycogen storage disease"]', 1, 'Commonly results in severe hypoglycemia and liver damage after fructose ingestion.'),
    (v_topic_id, 'Galactosemia most commonly involves deficiency of:', '["Galactokinase", "Galactose-1-phosphate uridyltransferase", "Hexokinase", "Aldolase", "Lactase"]', 1, 'Classic galactosemia involves deficiency of GALT.'),
    (v_topic_id, 'Beta-oxidation occurs in the:', '["Cytosol", "Mitochondria", "Nucleus", "ER", "Golgi"]', 1, 'Fatty acids are broken down within the mitochondrial matrix.'),
    (v_topic_id, 'The carnitine shuttle is required for transport of:', '["Glucose", "Long-chain fatty acids", "Amino acids", "Ketones", "Cholesterol"]', 1, 'L-Carnitine is needed to cross the inner mitochondrial membrane.'),
    (v_topic_id, 'Beta-oxidation produces:', '["Glucose", "Acetyl-CoA, NADH, FADH2", "Only lactate", "Only ATP", "Only glycerol"]', 1, 'These products feed into the TCA cycle and ETC.'),
    (v_topic_id, 'Fatty acid synthesis occurs in the:', '["Mitochondria", "Cytosol", "Lysosome", "Nucleus", "Peroxisome"]', 1, 'Biosynthesis of fatty acids is a cytoplasmic process.'),
    (v_topic_id, 'Fatty acid synthesis requires:', '["NADH", "NADPH", "FADH2", "ATP only", "Oxygen only"]', 1, 'NADPH provides the reducing equivalents for synthesis.'),
    (v_topic_id, 'Ketone bodies are produced from:', '["Glucose", "Acetyl-CoA", "Lactate", "Glycogen", "Cholesterol"]', 1, 'Excess acetyl-CoA from fat breakdown is converted to ketones.'),
    (v_topic_id, 'Ketone bodies are synthesized in:', '["Brain", "Liver", "Muscle", "Kidney", "RBC"]', 1, 'Ketogenesis is a hepatic pathway.'),
    (v_topic_id, 'The liver cannot utilize ketone bodies because it lacks:', '["Carnitine", "Thiophorase", "Pyruvate kinase", "Hexokinase", "ATP"]', 1, 'Thiophorase is required to re-activate acetoacetate for consumption.'),
    (v_topic_id, 'Cholesterol synthesis rate-limiting enzyme:', '["Citrate synthase", "HMG-CoA reductase", "Acetyl-CoA carboxylase", "Pyruvate dehydrogenase", "Lipoprotein lipase"]', 1, 'HMG-CoA reductase is the target of statin therapy.'),
    (v_topic_id, 'Cholesterol synthesis is increased by:', '["Glucagon", "Insulin", "Starvation", "AMP", "Ketosis"]', 1, 'Insulin signals high energy, promoting cholesterol and lipid synthesis.'),
    (v_topic_id, 'The urea cycle occurs in:', '["Brain", "Liver", "Kidney", "Muscle", "RBC"]', 1, 'Ammonia detoxification is a hepatic function.'),
    (v_topic_id, 'The urea cycle detoxifies:', '["CO2", "Ammonia", "Lactate", "Ketones", "Cholesterol"]', 1, 'Converts highly toxic NH3 into non-toxic urea.'),
    (v_topic_id, 'Carbamoyl phosphate synthetase I requires:', '["ATP only", "N-acetylglutamate", "NADPH", "FADH2", "Coenzyme Q"]', 1, 'NAG is the obligate allosteric activator of CPS I.'),
    (v_topic_id, 'Phenylketonuria involves defective metabolism of:', '["Tyrosine", "Phenylalanine", "Tryptophan", "Glycine", "Methionine"]', 1, 'Deficiency of phenylalanine hydroxylase (or BH4) leads to high Phe.'),
    (v_topic_id, 'Maple syrup urine disease affects metabolism of:', '["Aromatic amino acids", "Branched-chain amino acids", "Sulfur amino acids", "Basic amino acids", "Acidic amino acids"]', 1, 'Leucine, Isoleucine, and Valine cannot be broken down.'),
    (v_topic_id, 'DNA replication occurs in the:', '["Cytoplasm", "Nucleus", "Ribosome", "Golgi", "Lysosome"]', 1, 'Standard DNA replication occurs within the nucleus.'),
    (v_topic_id, 'DNA polymerase synthesizes DNA in:', '["3-prime to 5-prime", "5-prime to 3-prime", "Random direction", "Bidirectional only", "No direction"]', 1, 'Always adds nucleotides to the 3-prime end.'),
    (v_topic_id, 'The lagging strand is synthesized:', '["Continuously", "Discontinuously", "Without primers", "Only in mitochondria", "Without enzymes"]', 1, 'Lagging strand is made of Okazaki fragments.'),
    (v_topic_id, 'Okazaki fragments occur on the:', '["Leading strand", "Lagging strand", "DNA template", "RNA strand", "Ribosome"]', 1, 'These are the pieces of the discontinuous lagging strand.'),
    (v_topic_id, 'RNA polymerase synthesizes:', '["DNA", "RNA", "Protein", "Lipids", "ATP"]', 1, 'Produces various types of RNA from a DNA template.'),
    (v_topic_id, 'mRNA processing includes:', '["Only splicing", "Capping, splicing, polyadenylation", "Only translation", "DNA repair", "Histone synthesis"]', 1, 'Common modifications in eukaryotes.'),
    (v_topic_id, 'Translation occurs on:', '["DNA", "Ribosomes", "Golgi", "Lysosomes", "ER lumen only"]', 1, 'Ribosomes translate mRNA into protein.'),
    (v_topic_id, 'tRNA carries:', '["DNA", "Amino acids", "Lipids", "Glucose", "ATP"]', 1, 'Specific tRNAs match specific amino acids via anti-codons.'),
    (v_topic_id, 'A missense mutation:', '["Stops protein synthesis", "Changes one amino acid", "Has no effect", "Deletes entire gene", "Duplicates DNA"]', 1, 'Result of a point mutation changing the codon message.'),
    (v_topic_id, 'A nonsense mutation:', '["Changes one amino acid", "Creates a stop codon", "Is silent", "Causes duplication", "Causes inversion"]', 1, 'Creates a premature termination signal.'),
    (v_topic_id, 'Frameshift mutations are caused by:', '["Point mutation", "Insertions/deletions not multiple of 3", "Silent mutations", "Translocation", "Inversion"]', 1, 'Alters the reading frame of all subsequent codons.'),
    (v_topic_id, 'Trisomy 21 results from:', '["Mutation", "Nondisjunction", "Deletion", "Frameshift", "Duplication only"]', 1, 'Meiotic non-separation leads to an extra full chromosome.'),
    (v_topic_id, 'X-linked recessive disorders are more common in:', '["Females", "Males", "Both equally", "Elderly", "Infants only"]', 1, 'Males only have one X and expresses any recessive phenotype on it.'),
    (v_topic_id, 'In the fed state, the liver is most likely to:', '["Increase gluconeogenesis", "Increase glycogen synthesis", "Increase ketogenesis", "Increase beta-oxidation", "Increase proteolysis"]', 1, 'Insulin stimulates glycogen storage.'),
    (v_topic_id, 'In early fasting, the principal hormone promoting hepatic glucose output is:', '["Insulin", "Glucagon", "Prolactin", "Aldosterone", "Calcitonin"]', 1, 'Glucagon acts on the liver to mobilize glycogen.'),
    (v_topic_id, 'GLUT4 is the main insulin-responsive glucose transporter in:', '["Liver and pancreatic beta cells", "Skeletal muscle and adipose tissue", "Brain and RBCs", "Kidney and intestinal brush border", "Hepatocytes only"]', 1, 'Muscle and fat uptake depend on insulin-triggered GLUT4 translocation.'),
    (v_topic_id, 'GLUT2 is found prominently in:', '["Skeletal muscle only", "Adipose tissue only", "Liver and pancreatic beta cells", "RBCs only", "Neurons only"]', 2, 'High KM transporter allowing for glucose sensing and efficient hepatic uptake.'),
    (v_topic_id, 'The Cori cycle involves transport of:', '["Alanine from muscle to liver", "Lactate from muscle/RBCs to liver", "Ketones from liver to brain", "Ammonia from liver to kidney", "Glucose from adipose to liver"]', 1, 'Lactate is recycled to glucose by the liver.'),
    (v_topic_id, 'The glucose-alanine cycle is important because alanine transports:', '["Only carbon from liver to muscle", "Nitrogen and carbon skeletons from muscle to liver", "Ketones from liver to brain", "Fatty acids from adipose to liver", "Ribose from liver to marrow"]', 1, 'Safely removes ammonia from muscle during protein catabolism.'),
    (v_topic_id, 'Pyruvate carboxylase converts pyruvate to oxaloacetate and requires:', '["Thiamine", "Biotin", "Pyridoxine", "Cobalamin", "Folate"]', 1, 'Biotin is needed for all major carboxylation reactions.'),
    (v_topic_id, 'Pyruvate carboxylase is activated by:', '["Citrate", "Acetyl-CoA", "AMP", "NADH", "Fructose-2,6-bisphosphate"]', 1, 'High acetyl-CoA signals the need to run the TCA cycle or gluconeogenesis.'),
    (v_topic_id, 'Fructose-2,6-bisphosphate has the major effect of:', '["Activating fructose-1,6-bisphosphatase", "Activating PFK-1 and inhibiting fructose-1,6-bisphosphatase", "Inhibiting glycolysis entirely", "Stimulating beta-oxidation", "Activating pyruvate carboxylase"]', 1, 'Powerful regulator that promotes glycolysis and inhibits gluconeogenesis.'),
    (v_topic_id, 'In the liver, glucagon promotes phosphorylation of the bifunctional enzyme that results in:', '["Increased fructose-2,6-bisphosphate", "Decreased fructose-2,6-bisphosphate", "Increased glycolysis", "Increased fatty acid synthesis", "Increased glycogen synthesis"]', 1, 'Lowers F-2,6-BP to favor gluconeogenesis during fasting.'),
    (v_topic_id, 'A major irreversible step unique to gluconeogenesis is catalyzed by:', '["Pyruvate kinase", "PFK-1", "Fructose-1,6-bisphosphatase", "Aldolase", "Lactate dehydrogenase"]', 2, 'Counteracts the PFK-1 step of glycolysis.'),
    (v_topic_id, 'Glucose-6-phosphatase is present in liver but absent in muscle. Its function is to:', '["Phosphorylate free glucose", "Release free glucose from glucose-6-phosphate", "Convert glycogen to glucose-1-phosphate", "Convert pyruvate to lactate", "Oxidize glucose to ribose"]', 1, 'Allows the liver (but not muscle) to release glucose into the bloodstream.'),
    (v_topic_id, 'During intense exercise, the major fate of pyruvate in anaerobic muscle is conversion to:', '["Acetyl-CoA", "Lactate", "Oxaloacetate", "Citrate", "Ketone bodies"]', 1, 'Regenerates NAD+ to sustain fast ATP production.'),
    (v_topic_id, 'A deficiency of pyruvate kinase would most strongly affect:', '["Hepatocytes using beta-oxidation", "Red blood cells producing ATP by glycolysis", "Brain cells using ketones", "Adipose cells synthesizing fat", "Thyroid follicular cells only"]', 1, 'Leading cause of hereditary non-spherocytic hemolytic anemia.'),
    (v_topic_id, 'The oxidative phase of the pentose phosphate pathway is:', '["Reversible and produces ribose only", "Irreversible and produces NADPH", "Mitochondrial and ATP generating", "The main source of acetyl-CoA", "Active only in muscle"]', 1, 'Provides 2 NADPH molecules per G6P entering.'),
    (v_topic_id, 'Cells especially dependent on NADPH for reductive biosynthesis include:', '["RBCs only", "Hepatocytes and adrenal cortex", "Skeletal muscle only", "Neurons only", "Platelets only"]', 1, 'Active in steroid and fatty acid synthesis sites.'),
    (v_topic_id, 'NADPH oxidase in phagocytes uses NADPH to generate:', '["ATP", "Reactive oxygen species", "Ketone bodies", "Glycogen", "Nitric oxide only"]', 1, 'The "Respiratory Burst" needed for killing microorganisms.'),
    (v_topic_id, 'A patient with G6PD deficiency develops hemolysis after oxidant stress mainly because RBCs cannot maintain:', '["Oxidized glutathione", "Reduced glutathione", "Fructose-2,6-bisphosphate", "Acetyl-CoA", "Heme oxygenase"]', 1, 'Lack of GSH protection leads to hemoglobin denaturation (Heinz bodies).'),
    (v_topic_id, 'Glycogen branching enzyme creates:', '["Alpha-1,4 linkages only", "Alpha-1,6 linkages", "Beta-1,4 linkages", "Peptide bonds", "Ester bonds"]', 1, 'Creates branch points to increase glycogen solubility and accessibility.'),
    (v_topic_id, 'Debranching enzyme deficiency would impair:', '["Glycogen synthesis only", "Complete breakdown of glycogen near branch points", "Glycolysis only", "Fatty acid synthesis", "Cholesterol esterification only"]', 1, 'Cori disease (GSD III) involves accumulation of abnormal limit dextrins.'),
    (v_topic_id, 'Hormone-sensitive lipase in adipose tissue is activated by:', '["Insulin", "Epinephrine and glucagon", "Glucose only", "Citrate", "Fructose-2,6-bisphosphate"]', 1, 'Signals for fat mobilization during stress or fasting.'),
    (v_topic_id, 'Lipoprotein lipase functions mainly to:', '["Mobilize stored triglycerides from adipocytes", "Hydrolyze triglycerides in circulating lipoproteins", "Synthesize ketone bodies", "Oxidize cholesterol", "Release glycerol from liver glycogen"]', 1, 'Clears fats from chylomicrons and VLDL for tissue use.'),
    (v_topic_id, 'Insulin activates lipoprotein lipase primarily to promote:', '["Fat storage in adipose tissue", "Ketogenesis", "Beta-oxidation in liver", "Cholesterol excretion", "Urea synthesis"]', 0, 'Facilitates clearing of dietary fat into adipocytes.'),
    (v_topic_id, 'The committed step in fatty acid synthesis is formation of malonyl-CoA by:', '["HMG-CoA reductase", "Acetyl-CoA carboxylase", "Fatty acid synthase", "Carnitine acyltransferase I", "Pyruvate carboxylase"]', 1, 'ACC is the rate-limiting step of lipogenesis.'),
    (v_topic_id, 'Fatty acid synthase primarily elongates chains using:', '["Malonyl-CoA units", "Citrate units", "Ketone bodies", "Cholesterol units", "Propionyl-CoA only"]', 0, 'Malonyl-CoA acts as the 2-carbon donor.'),
    (v_topic_id, 'The main product of fatty acid synthase in humans is:', '["Stearate", "Palmitate", "Oleate", "Acetate", "Arachidonate"]', 1, 'Full synthesis cycle yields the 16-carbon palmitate.'),
    (v_topic_id, 'Very-long-chain fatty acids are shortened mainly in the:', '["Cytosol", "Peroxisomes", "Nucleus", "Golgi", "Lysosomes"]', 1, 'Peroxisomal alpha and beta oxidation handle VLCFAs.'),
    (v_topic_id, 'Carnitine deficiency would most impair:', '["Glycolysis in RBCs", "Mitochondrial oxidation of long-chain fatty acids", "Cholesterol synthesis", "Urea cycle", "Pentose phosphate pathway"]', 1, 'LCFAs cannot reach the matrix for breakdown.'),
    (v_topic_id, 'Ketogenesis is favored when hepatic oxaloacetate is depleted because it is being used for:', '["Glycogenesis", "Gluconeogenesis", "Cholesterol synthesis", "Heme synthesis", "Purine salvage"]', 1, 'Common during fasting/starvation or low-carb diets.'),
    (v_topic_id, 'HMG-CoA is an intermediate in both:', '["Glycolysis and TCA cycle", "Ketogenesis and cholesterol synthesis", "Urea cycle and beta-oxidation", "PPP and glycogenesis", "Purine synthesis and glycolysis"]', 1, 'Divergent pathways depending on cell needs and location in the liver cell (matrix vs cytosol).'),
    (v_topic_id, 'The rate-limiting enzyme of cholesterol synthesis is inhibited by:', '["Insulin", "Statins", "Citrate", "Glucagon receptor blockade only", "NADPH"]', 1, 'Statins are competitive inhibitors of HMG-CoA reductase.'),
    (v_topic_id, 'LDL primarily delivers:', '["Triglycerides from gut to tissues", "Cholesterol to peripheral tissues", "Cholesterol from tissues to liver", "Ketones to brain", "Bile salts to intestine"]', 1, 'Derived from VLDL/IDL, high in cholesterol esters.'),
    (v_topic_id, 'HDL is most associated with:', '["Delivery of dietary triglycerides", "Reverse cholesterol transport", "Hepatic ketogenesis", "Glucose transport", "Urea excretion"]', 1, 'Helps return cholesterol from periphery to the liver.'),
    (v_topic_id, 'ApoB-48 is associated mainly with:', '["LDL", "Chylomicrons", "HDL", "VLDL only from liver", "Albumin"]', 1, 'Marker for chylomicrons and their remnants.'),
    (v_topic_id, 'ApoB-100 is found in:', '["Chylomicrons only", "VLDL and LDL", "HDL only", "Albumin only", "Ketone bodies only"]', 1, 'Major protein component of LDL/VLDL (hepatic origin).'),
    (v_topic_id, 'The urea cycle links with the TCA cycle through fumarate, which can be converted to:', '["Citrate only", "Malate and then oxaloacetate", "Acetyl-CoA only", "Lactate only", "Glucose-6-phosphate directly"]', 1, 'Connects nitrogen disposal with mitochondrial metabolism.'),
    (v_topic_id, 'Ornithine transcarbamylase deficiency typically leads to:', '["Hyperammonemia", "Hypoglycemia only", "Hypercholesterolemia", "Isolated lactic acidosis only", "Ketonuria without ammonia change"]', 0, 'Most common urea cycle disorder, X-linked.'),
    (v_topic_id, 'Arginase catalyzes the final step of the urea cycle, producing:', '["Carbamoyl phosphate and urea", "Urea and ornithine", "Citrulline and NH3", "Argininosuccinate and fumarate", "Aspartate and CO2"]', 1, 'Releases urea and recycles ornithine back to the start.'),
    (v_topic_id, 'Phenylalanine hydroxylase deficiency impairs conversion of phenylalanine to:', '["Leucine", "Tyrosine", "Tryptophan", "Alanine", "Methionine"]', 1, 'Primary defect in Classical PKU.'),
    (v_topic_id, 'Tyrosine becomes an essential amino acid in:', '["G6PD deficiency", "Phenylketonuria", "Galactosemia", "OTC deficiency", "Glycogen storage disease type V"]', 1, 'Because it can no longer be synthesized from Phenylalanine.'),
    (v_topic_id, 'Branched-chain alpha-ketoacid dehydrogenase deficiency causes accumulation of:', '["Leucine, isoleucine, and valine metabolites", "Phenylalanine and tyrosine", "Methionine and homocysteine", "Glycine and serine", "Lysine and tryptophan"]', 0, 'Metabolites give a characteristic "maple syrup" scent to urine.'),
    (v_topic_id, 'DNA helicase functions to:', '["Add RNA primers", "Unwind the DNA double helix", "Join Okazaki fragments", "Proofread newly synthesized DNA", "Remove thymine dimers"]', 1, 'Opens the helix for replication.'),
    (v_topic_id, 'DNA ligase primarily:', '["Synthesizes RNA primers", "Seals nicks between DNA fragments", "Unwinds DNA", "Adds telomeres", "Removes introns"]', 1, 'Vital for both replication and repair mechanisms.'),
    (v_topic_id, 'Telomerase is especially active in:', '["Mature RBCs", "Germ cells and many cancer cells", "Skeletal muscle only", "Hepatocytes only in fasting", "Platelets only"]', 1, 'Adds protective caps to the ends of chromosomes.'),
    (v_topic_id, 'Nucleotide excision repair is especially important for repairing:', '["Mismatched bases after replication", "Bulky DNA lesions such as thymine dimers", "Double-strand breaks only", "Trinucleotide repeat expansion", "RNA primer errors only"]', 1, 'Major repair pathway for solar/UV damage.'),
    (v_topic_id, 'A silent mutation is one that:', '["Creates a premature stop codon", "Changes the codon but not the encoded amino acid", "Shifts the reading frame", "Deletes a chromosome", "Always abolishes protein function"]', 1, 'Due to the degeneracy of the genetic code.'),
    (v_topic_id, 'In an autosomal dominant disorder, an affected heterozygous parent and unaffected partner have what risk of affected offspring?', '["0%", "25%", "50%", "75%", "100%"]', 2, 'Basic Mendelian probability: 1/2 chance.'),
    (v_topic_id, 'Mitochondrial inheritance is characterized by transmission from:', '["Father only", "Mother only", "Both parents equally", "Y chromosome only", "Autosomes only"]', 1, 'Mitochondria follow maternal lineages.'),
    (v_topic_id, 'Trinucleotide repeat expansion is classically associated with:', '["Frameshift in every generation only", "Anticipation", "Mitochondrial inheritance", "X-linked recessive transmission only", "Codominance only"]', 1, 'Severity often increases in successive generations.'),
    (v_topic_id, 'A cell with a 47,XX,+21 karyotype most likely resulted from:', '["Point mutation", "Meiotic nondisjunction", "Frameshift mutation", "Triplet repeat expansion", "Mismatch repair defect only"]', 1, 'This describes a female with Down Syndrome.');

    RAISE NOTICE 'Biochemistry (System Level) MCQs Migration Completed (100 Questions).';
END $$;
