-- ==========================================
-- Topic: Biochemistry (System Level) - 25 Clinical Cases
-- Semester 2 First Year
-- ==========================================

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Get or Create Topic ID
    SELECT id INTO v_topic_id FROM topics 
    WHERE title = 'Biochemistry (System Level)' AND semester_id = 2;
    
    IF v_topic_id IS NULL THEN
        INSERT INTO topics (semester_id, title, slug, "order", usmle_step)
        VALUES (2, 'Biochemistry (System Level)', 'biochemistry-system-level', 15, 1)
        RETURNING id INTO v_topic_id;
    END IF;

    -- 2. Cleanup existing cases for this topic
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    -- CASE 1: Fed State After a High-Carbohydrate Meal
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Fed State After a High-Carbohydrate Meal', 
        'A healthy 20-year-old student eats a large carbohydrate-rich meal. Two hours later, insulin levels are high and glucagon levels are low.',
        1
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In the liver, insulin most strongly promotes:', '["Glycogenolysis", "Gluconeogenesis", "Glycogen synthesis", "Ketogenesis", "Lipolysis"]', 2, 'Insulin stimulates glycogen synthase and inhibits phosphorylase in the fed state.'),
    (v_case_id, 'In adipose tissue, insulin increases:', '["Hormone-sensitive lipase activity", "GLUT4-mediated glucose uptake", "Ketone production", "Fatty acid oxidation", "Glucagon receptor signaling"]', 1, 'Insulin promotes glucose uptake in adipose and muscle via GLUT4 translocation.'),
    (v_case_id, 'In skeletal muscle, insulin stimulates:', '["Glycogen breakdown", "Glucose uptake and glycogen synthesis", "Hepatic ketogenesis", "Urea cycle activity", "Lipoprotein breakdown only"]', 1, 'Muscle uses insulin to replenish glycogen stores and take up glucose.'),
    (v_case_id, 'The major hormone opposing insulin in fasting is:', '["Aldosterone", "Glucagon", "Calcitonin", "Prolactin", "ADH"]', 1, 'Glucagon is the primary counter-regulatory hormone secreted by alpha cells.');

    -- CASE 2: Early Fasting State
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Early Fasting State', 
        'A healthy man has not eaten for 14 hours. His blood glucose remains in the normal range.',
        2
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'During early fasting, blood glucose is maintained primarily by hepatic:', '["Glycogenesis", "Glycogenolysis", "Ketolysis", "Fatty acid synthesis", "Cholesterol synthesis"]', 1, 'Glycogen stores are the first line of defense during the first 18-24 hours of fasting.'),
    (v_case_id, 'As fasting continues, the liver increasingly relies on:', '["Glycolysis only", "Gluconeogenesis", "Glycogen synthesis", "Protein synthesis only", "Pentose phosphate pathway only"]', 1, 'Gluconeogenesis becomes the dominant source of glucose after glycogen is depleted.'),
    (v_case_id, 'Which substrate is important for hepatic gluconeogenesis during fasting?', '["Acetyl-CoA only", "Lactate", "Palmitate", "Cholesterol", "Leucine only"]', 1, 'Lactate, glycerol, and glucogenic amino acids (like alanine) are primary substrates.');

    -- CASE 3: Prolonged Starvation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Prolonged Starvation', 
        'A patient stranded without food for several days becomes weak but remains conscious. Blood ketone levels rise.',
        3
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'During prolonged starvation, the brain increasingly uses:', '["Free fatty acids directly", "Ketone bodies", "Glycogen only", "Cholesterol", "Urea"]', 1, 'The brain adapts to use ketones to reduce its reliance on glucose.'),
    (v_case_id, 'Ketone bodies are produced mainly in the:', '["Brain", "Liver mitochondria", "Adipose cytosol", "Kidney cortex only", "Skeletal muscle"]', 1, 'Ketogenesis occurs primarily in the mitochondria of hepatocytes.'),
    (v_case_id, 'The major purpose of ketone use by the brain in starvation is to:', '["Increase urea production", "Spare muscle protein breakdown for gluconeogenesis", "Increase insulin secretion", "Prevent lipolysis", "Block glucagon release"]', 1, 'By using ketones, the body needs less gluconeogenesis, which spares muscle protein.'),
    (v_case_id, 'The liver cannot use ketone bodies efficiently because it lacks:', '["Thiophorase (succinyl-CoA:acetoacetate CoA transferase)", "Carnitine", "Pyruvate carboxylase", "Hexokinase", "Glucose-6-phosphatase"]', 0, 'Thiophorase is required to activate acetoacetate to acetoacetyl-CoA; its absence prevents the liver from consuming its own ketones.');

    -- CASE 4: Glycolysis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Glycolysis', 
        'A red blood cell depends entirely on glycolysis for ATP production.',
        4
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The rate-limiting enzyme of glycolysis is:', '["Hexokinase", "Phosphofructokinase-1", "Pyruvate kinase", "Aldolase", "Lactate dehydrogenase"]', 1, 'PFK-1 is the primary regulated step in the glycolytic pathway.'),
    (v_case_id, 'PFK-1 is activated by:', '["ATP and citrate", "AMP and fructose-2,6-bisphosphate", "Acetyl-CoA only", "NADH", "Alanine"]', 1, 'Fructose-2,6-bisphosphate is the most potent activator of PFK-1.'),
    (v_case_id, 'In anaerobic conditions, pyruvate is converted to lactate in order to regenerate:', '["FAD", "NAD+", "ATP", "Coenzyme A", "Biotin"]', 1, 'LDH reduces pyruvate to lactate to oxidize NADH back to NAD+, allowing glycolysis to continue.'),
    (v_case_id, 'Mature red blood cells cannot perform the TCA cycle because they lack:', '["Cytosol", "Mitochondria", "Ribosomes", "Cell membrane", "Lactate dehydrogenase"]', 1, 'RBCs lose their mitochondria during maturation.');

    -- CASE 5: Pyruvate Dehydrogenase Complex
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Pyruvate Dehydrogenase Complex', 
        'A child develops neurologic symptoms and lactic acidosis due to impaired conversion of pyruvate to acetyl-CoA.',
        5
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The enzyme complex involved is the:', '["Alpha-ketoglutarate dehydrogenase complex", "Pyruvate dehydrogenase complex", "Citrate synthase complex", "Succinate dehydrogenase complex", "ATP synthase complex"]', 1, 'PDH connects glycolysis to the TCA cycle.'),
    (v_case_id, 'Pyruvate dehydrogenase requires all of the following cofactors except:', '["Thiamine", "Lipoic acid", "Biotin", "FAD", "NAD+"]', 2, 'Biotin is required for carboxylases (like Pyruvate Carboxylase), not PDH.'),
    (v_case_id, 'In pyruvate dehydrogenase deficiency, pyruvate is commonly shunted toward:', '["Cholesterol", "Lactate", "Ketone bodies only", "Heme only", "Uric acid"]', 1, 'Excess pyruvate is converted to lactate by LDH, leading to lactic acidosis.'),
    (v_case_id, 'The reaction catalyzed by pyruvate dehydrogenase occurs in the:', '["Cytosol", "Mitochondrial matrix", "Nucleus", "ER", "Lysosome"]', 1, 'PDH is located within the mitochondrial matrix.');

    -- CASE 6: TCA Cycle
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'TCA Cycle', 
        'A biochemistry student is asked about the citric acid cycle.',
        6
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The TCA cycle occurs in the:', '["Cytosol", "Mitochondrial matrix", "Golgi apparatus", "Nucleus", "Cell membrane"]', 1, 'The TCA enzymes are in the matrix (except succinate dehydrogenase).'),
    (v_case_id, 'The major purpose of the TCA cycle is to:', '["Directly generate large amounts of glucose", "Oxidize acetyl-CoA and produce reducing equivalents", "Synthesize fatty acids only", "Produce ketone bodies", "Degrade purines"]', 1, 'The cycle generates NADH and FADH2 for the electron transport chain.'),
    (v_case_id, 'Which of the following is a major product of one turn of the TCA cycle?', '["Glucose", "NADH", "Urea", "Lactate", "Ammonia only"]', 1, '3 NADH, 1 FADH2, and 1 GTP are produced per acetyl-CoA.'),
    (v_case_id, 'Succinate dehydrogenase is unique because it is located in the:', '["Cytosol", "Inner mitochondrial membrane", "Outer mitochondrial membrane", "Nucleus", "Lysosome"]', 1, 'It is part of both the TCA cycle and Complex II of the ETC.');

    -- CASE 7: Electron Transport Chain and Oxidative Phosphorylation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Electron Transport Chain and Oxidative Phosphorylation', 
        'A toxin blocks complex IV of the mitochondrial electron transport chain.',
        7
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Complex IV normally transfers electrons to:', '["NAD+", "Coenzyme Q", "Oxygen", "FAD", "Succinate"]', 2, 'Complex IV (cytochrome c oxidase) reduces O2 to H2O.'),
    (v_case_id, 'Blocking the electron transport chain decreases ATP production by impairing:', '["Substrate-level phosphorylation only", "Oxidative phosphorylation", "Glycolysis directly", "Urea cycle", "Glycogenolysis only"]', 1, 'ATP synthase depends on the proton gradient generated by the ETC.'),
    (v_case_id, 'Oxygen is the final electron acceptor in:', '["Glycolysis", "Oxidative phosphorylation", "Pentose phosphate pathway", "Urea cycle", "Beta-oxidation only"]', 1, 'Without O2, the ETC stops and oxidative phosphorylation fails.'),
    (v_case_id, 'Uncoupling oxidative phosphorylation would most directly:', '["Stop oxygen consumption completely", "Increase heat production while lowering ATP generation", "Increase ATP yield maximally", "Inhibit electron transport fully", "Block glycolysis in RBCs"]', 1, 'Uncouplers (like 2,4-DNP) dissipate the proton gradient, creating heat.');

    -- CASE 8: Glycogen Synthesis and Breakdown
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Glycogen Synthesis and Breakdown', 
        'A physiology lecture compares glycogenesis and glycogenolysis.',
        8
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Glycogen synthase is activated in the:', '["Fed state", "Fasting state", "Prolonged starvation only", "Severe acidosis only", "Ketotic state only"]', 0, 'Insulin dephosphorylates and activates glycogen synthase.'),
    (v_case_id, 'Glycogen phosphorylase breaks glycogen by cleaving:', '["Alpha-1,6 bonds only", "Alpha-1,4 bonds using phosphate", "Peptide bonds", "Beta-1,4 bonds", "Ester linkages"]', 1, 'It performs phosphorolysis on alpha-1,4 glycosidic bonds.'),
    (v_case_id, 'Liver glycogen primarily serves to:', '["Supply the liver only", "Maintain blood glucose between meals", "Fuel only the TCA cycle in hepatocytes", "Produce ketone bodies directly", "Synthesize amino acids"]', 1, 'Liver glycogen is meant for systemic blood glucose maintenance.'),
    (v_case_id, 'Muscle glycogen cannot directly raise blood glucose because muscle lacks:', '["Glycogen phosphorylase", "Glucose-6-phosphatase", "Hexokinase", "PFK-1", "Pyruvate kinase"]', 1, 'G6Pase is required to release free glucose into the blood.');

    -- CASE 9: Pentose Phosphate Pathway
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Pentose Phosphate Pathway', 
        'A young man develops hemolysis after exposure to oxidant stress. A teacher reviews the pentose phosphate pathway.',
        9
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The pentose phosphate pathway generates:', '["ATP and ketones", "NADPH and ribose-5-phosphate", "Only pyruvate", "FADH2 only", "Acetyl-CoA only"]', 1, 'NADPH is used for biosynthesis and redox, Ribose for nucleotides.'),
    (v_case_id, 'NADPH is especially important in RBCs for maintaining:', '["Reduced glutathione", "Urea synthesis", "Glycogen breakdown", "Ketone oxidation", "Cholesterol uptake"]', 0, 'NADPH reduces oxidized glutathione, which protects the cell from reactive oxygen species.'),
    (v_case_id, 'The rate-limiting enzyme of the pentose phosphate pathway is:', '["Pyruvate kinase", "Glucose-6-phosphate dehydrogenase", "PFK-1", "Glycogen synthase", "Hexokinase"]', 1, 'G6PD is regulated by the NADPH/NADP+ ratio.'),
    (v_case_id, 'Ribose-5-phosphate is important for synthesis of:', '["Fatty acids", "Nucleotides", "Ketone bodies", "Bile acids only", "Heme only"]', 1, 'It provides the sugar backbone for DNA and RNA.');

    -- CASE 10: Fructose Metabolism
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Fructose Metabolism', 
        'An infant develops vomiting and hypoglycemia after introduction of fruit juice.',
        10
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Fructose is metabolized mainly in the:', '["Liver", "Brain", "RBC only", "Thyroid", "Spleen"]', 0, 'The liver expresses high levels of fructokinase.'),
    (v_case_id, 'Hereditary fructose intolerance classically involves deficiency of:', '["Fructokinase", "Aldolase B", "Hexokinase", "Galactokinase", "Pyruvate kinase"]', 1, 'Aldolase B deficiency leads to accumulation of fructose-1-phosphate.'),
    (v_case_id, 'Accumulation of fructose-1-phosphate tends to trap:', '["NADH", "Phosphate", "Acetyl-CoA", "Biotin", "FAD"]', 1, 'Intracellular phosphate becomes sequestered, depleting ATP.'),
    (v_case_id, 'This phosphate trapping contributes to impaired:', '["Glycogenolysis and gluconeogenesis", "Cholesterol synthesis only", "Protein translation only", "Heme synthesis only", "Ketone oxidation only"]', 0, 'Phosphate depletion inhibits glycogen phosphorylase and gluconeogenesis enzymes.');

    -- CASE 11: Galactose Metabolism
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Galactose Metabolism', 
        'A newborn develops jaundice, vomiting, and cataracts after milk feeding.',
        11
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The sugar involved is:', '["Fructose", "Galactose", "Sucrose", "Mannose", "Ribose"]', 1, 'Milk sugar (lactose) is a disaccharide of glucose and galactose.'),
    (v_case_id, 'Classic galactosemia is most commonly due to deficiency of:', '["Galactokinase", "Galactose-1-phosphate uridyltransferase", "Aldolase B", "Lactase", "Hexokinase"]', 1, 'GALT deficiency is the "classic" severe form.'),
    (v_case_id, 'Cataracts in galactose disorders are related to accumulation of:', '["Sorbitol-like sugar alcohols such as galactitol", "Ketone bodies", "Uric acid", "Bilirubin only", "Acetyl-CoA"]', 0, 'Aldose reductase converts galactose to galactitol in the lens.');

    -- CASE 12: Beta-Oxidation of Fatty Acids
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Beta-Oxidation of Fatty Acids', 
        'A fasting adult relies heavily on fatty acid oxidation for energy.',
        12
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Beta-oxidation occurs mainly in the:', '["Cytosol", "Mitochondria", "Nucleus", "ER lumen", "Golgi apparatus"]', 1, 'Fatty acids are broken down into 2-carbon units in the matrix.'),
    (v_case_id, 'Long-chain fatty acids enter mitochondria via the:', '["GLUT4 shuttle", "Carnitine shuttle", "Malate shuttle", "Urea transporter", "Cori cycle"]', 1, 'CPT1 and CPT2 catalyze the transport of fatty acyl-CoA into mitochondria.'),
    (v_case_id, 'Beta-oxidation produces:', '["Acetyl-CoA, NADH, and FADH2", "Only glucose", "Only lactate", "Only glycogen", "Only ribose-5-phosphate"]', 0, 'These products are high-energy molecules exported to the TCA cycle and ETC.'),
    (v_case_id, 'Malonyl-CoA inhibits:', '["Fatty acid synthesis", "Carnitine palmitoyltransferase I", "Glycolysis", "TCA cycle", "Gluconeogenesis directly only"]', 1, 'This prevents a futile cycle of simultaneous synthesis and breakdown.');

    -- CASE 13: Fatty Acid Synthesis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Fatty Acid Synthesis', 
        'A student compares lipogenesis with beta-oxidation.',
        13
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Fatty acid synthesis occurs mainly in the:', '["Mitochondria", "Cytosol", "Lysosome", "Nucleus", "Peroxisome only"]', 1, 'Biosynthesis occurs in the cytoplasm.'),
    (v_case_id, 'The immediate source of 2-carbon units for fatty acid synthesis is:', '["Acetyl-CoA", "Malonyl-CoA", "Propionyl-CoA", "Oxaloacetate", "Citrate only"]', 1, 'Malonyl-CoA is the active donor of 2-carbon units to the growing chain.'),
    (v_case_id, 'The major reducing equivalent required for fatty acid synthesis is:', '["NADH", "NADPH", "FADH2", "ATP only", "Coenzyme Q"]', 1, 'NADPH provides the reducing power for fat synthesis.'),
    (v_case_id, 'Acetyl-CoA carboxylase is activated by:', '["Glucagon", "Citrate", "Palmitoyl-CoA", "Epinephrine", "AMP"]', 1, 'Citrate signifies high energy and substrate availability, promoting synthesis.');

    -- CASE 14: Ketone Bodies
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Ketone Bodies', 
        'A patient with prolonged fasting has elevated acetoacetate and beta-hydroxybutyrate.',
        14
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Ketone bodies are synthesized from excess:', '["Glucose", "Acetyl-CoA", "Lactate", "Ribose", "Cholesterol only"]', 1, 'Excess acetyl-CoA from fat breakdown is shunted to ketogenesis when the TCA is saturated.'),
    (v_case_id, 'Ketogenesis increases when:', '["Insulin is high", "Glucagon is high and oxaloacetate is diverted to gluconeogenesis", "Glycogenesis is maximal", "Pentose phosphate pathway is blocked only", "ATP is absent"]', 1, 'Low OAA forces acetyl-CoA into the ketogenic pathway.'),
    (v_case_id, 'Which tissue cannot use ketone bodies as a major fuel?', '["Brain during starvation", "Skeletal muscle", "Liver", "Cardiac muscle", "Kidney cortex"]', 2, 'The liver lacks thiophorase and thus cannot utilize the ketones it produces.'),
    (v_case_id, 'A ketone body is:', '["Citrate", "Acetoacetate", "Succinate", "Oxaloacetate", "Malate"]', 1, 'The three ketone bodies are acetoacetate, beta-hydroxybutyrate, and acetone.');

    -- CASE 15: Cholesterol Synthesis and Regulation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Cholesterol Synthesis and Regulation', 
        'A patient is started on a drug that inhibits HMG-CoA reductase.',
        15
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'HMG-CoA reductase is the rate-limiting enzyme of:', '["Glycolysis", "Cholesterol synthesis", "Ketogenesis", "Urea cycle", "Glycogenolysis"]', 1, 'It is the target of statin drugs.'),
    (v_case_id, 'Cholesterol synthesis occurs mainly in the:', '["Liver", "RBC", "Brain only", "Cartilage only", "Bone marrow only"]', 0, 'Most body cholesterol is synthesized in the liver and intestines.'),
    (v_case_id, 'HMG-CoA reductase activity is generally increased by:', '["Fasting", "Insulin", "Glucagon", "Epinephrine only", "AMP only"]', 1, 'Insulin signals the fed state, promoting lipid storage and synthesis.'),
    (v_case_id, 'Cholesterol is a precursor for all of the following except:', '["Steroid hormones", "Bile acids", "Vitamin D", "Glycogen", "Cell membranes"]', 3, 'Glycogen is a carbohydrate; cholesterol is a lipid.');

    -- CASE 16: Urea Cycle
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Urea Cycle', 
        'A child with hyperammonemia is evaluated for a urea cycle disorder.',
        16
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The primary function of the urea cycle is to:', '["Synthesize ketone bodies", "Detoxify ammonia", "Produce glucose", "Degrade purines", "Synthesize heme"]', 1, 'Nitrogenous waste from amino acid breakdown is converted to non-toxic urea.'),
    (v_case_id, 'The urea cycle occurs mainly in the:', '["Kidney", "Liver", "RBC", "Spleen", "Pancreas"]', 1, 'Only the liver has the full set of enzymes for the urea cycle.'),
    (v_case_id, 'The first committed enzyme of the urea cycle is:', '["Carbamoyl phosphate synthetase I", "Ornithine transcarbamylase", "Arginase", "Glutaminase", "CPS II"]', 0, 'CPS I is in the mitochondria and is the entry point.'),
    (v_case_id, 'N-acetylglutamate is an important:', '["End-product inhibitor", "Activator of CPS I", "Inhibitor of glutamate dehydrogenase", "Cofactor for pyruvate dehydrogenase", "Ketone body precursor"]', 1, 'NAG is an obligate allosteric activator of CPS I.');

    -- CASE 17: Amino Acid Disorders
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Amino Acid Disorders', 
        'A baby has a musty body odor and developmental delay. Another child has maple syrup odor in urine.',
        17
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Phenylketonuria classically involves impaired metabolism of:', '["Leucine", "Phenylalanine", "Methionine", "Tyrosine only", "Glycine"]', 1, 'Deficiency of phenylalanine hydroxylase leads to accumulation of phenylalanine.'),
    (v_case_id, 'Maple syrup urine disease involves deficiency of the enzyme complex that degrades:', '["Aromatic amino acids", "Branched-chain amino acids", "Sulfur-containing amino acids only", "Glycine and serine", "Tryptophan only"]', 1, 'Alpha-ketoacid dehydrogenase deficiency affects leucine, isoleucine, and valine.'),
    (v_case_id, 'Which amino acids are branched-chain?', '["Glycine, alanine, serine", "Leucine, isoleucine, valine", "Phenylalanine, tyrosine, tryptophan", "Lysine, arginine, histidine", "Aspartate, glutamate, asparagine"]', 1, 'LIV (Leucine, Isoleucine, Valine) are the ones affected in MSUD.');

    -- CASE 18: DNA Replication
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'DNA Replication', 
        'A student is asked about DNA replication in rapidly dividing cells.',
        18
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'DNA polymerase synthesizes new DNA in the:', '["3-prime to 5-prime direction", "5-prime to 3-prime direction", "Random direction", "2-prime to 5-prime direction", "Bidirectional on the same strand only"]', 1, 'Nucleotides are added to the 3-prime hydroxyl group.'),
    (v_case_id, 'The leading strand is synthesized:', '["Continuously", "Discontinuously", "Only after ligase action", "Without primers", "Only in mitochondria"]', 0, 'Synthesis proceeds in the same direction as the replication fork.'),
    (v_case_id, 'Okazaki fragments are found on the:', '["Leading strand", "Lagging strand", "Template strand only", "RNA primer strand only", "Histone core"]', 1, 'Lagging strand synthesis is discontinuous.'),
    (v_case_id, 'Primase synthesizes:', '["DNA primers", "RNA primers", "Histones", "Telomeres", "Ligase"]', 1, 'DNA polymerase requires an RNA primer to initiate synthesis.');

    -- CASE 19: DNA Repair
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'DNA Repair', 
        'A child is highly sensitive to ultraviolet light due to defective DNA repair.',
        19
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'UV light most commonly causes formation of:', '["Double-strand breaks only", "Pyrimidine dimers", "Trinucleotide repeats", "Frameshift insertions only", "Histone acetylation only"]', 1, 'Thymine dimers are common UV-induced lesions.'),
    (v_case_id, 'The repair mechanism classically involved in removing UV-induced pyrimidine dimers is:', '["Base excision repair", "Nucleotide excision repair", "Mismatch repair", "Nonhomologous end joining only", "Reverse transcription"]', 1, 'NER involves cutting out an entire chunk of DNA around the lesion.'),
    (v_case_id, 'Failure of this repair mechanism is classically associated with:', '["Xeroderma pigmentosum", "Cystic fibrosis", "PKU", "Marfan syndrome", "Hemophilia A"]', 0, 'XP patients cannot repair pyrimidine dimers and are at extreme risk for skin cancer.');

    -- CASE 20: Transcription and RNA Processing
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Transcription and RNA Processing', 
        'A nucleus is examined during active gene expression.',
        20
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Transcription produces RNA from a DNA template using:', '["DNA polymerase", "RNA polymerase", "Ligase", "Primase", "Telomerase"]', 1, 'RNA polymerase translates the DNA code into an RNA message.'),
    (v_case_id, 'In eukaryotes, messenger RNA is processed by:', '["Removal of exons only", "Capping, polyadenylation, and splicing", "Translation in the nucleus", "DNA methylation only", "Histone degradation"]', 1, 'Processing prepares the mRNA for export and translation.'),
    (v_case_id, 'Introns are:', '["Coding sequences retained in mature mRNA", "Noncoding sequences removed during RNA splicing", "Amino acids in proteins", "Ribosomal subunits", "Promoter regions only"]', 1, 'Introns are "intervening" sequences.');

    -- CASE 21: Translation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Translation', 
        'A ribosome is observed synthesizing a protein.',
        21
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Translation occurs on:', '["DNA polymerase", "Ribosomes", "Golgi vesicles only", "Lysosomes", "Peroxisomes"]', 1, 'The ribosome is the protein synthesis factory.'),
    (v_case_id, 'Transfer RNA carries:', '["DNA fragments", "Amino acids to the ribosome", "Introns to the nucleus", "ATP into mitochondria", "Lipids to the ER"]', 1, 'tRNA acts as the adapter between mRNA codons and amino acids.'),
    (v_case_id, 'The codon is located on:', '["tRNA", "mRNA", "rRNA only", "DNA polymerase", "Histones"]', 1, 'The codon corresponds to a specific amino acid.'),
    (v_case_id, 'The anticodon is located on:', '["DNA", "tRNA", "mRNA", "rRNA only", "Telomerase"]', 1, 'The anticodon base-pairs with the mRNA codon.');

    -- CASE 22: Mutations
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Mutations', 
        'A professor asks students to compare mutation types.',
        22
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A point mutation that changes one amino acid to another is a:', '["Nonsense mutation", "Missense mutation", "Silent deletion", "Frameshift mutation", "Duplication only"]', 1, 'Missense mutations can be harmful or neutral depending on the change.'),
    (v_case_id, 'A mutation that creates a premature stop codon is a:', '["Missense mutation", "Nonsense mutation", "Silent mutation", "Balanced translocation", "Inversion only"]', 1, 'Nonsense mutations usually result in a truncated, non-functional protein.'),
    (v_case_id, 'Addition or deletion of nucleotides not in multiples of three causes a:', '["Silent mutation", "Frameshift mutation", "Missense mutation only", "Duplication syndrome only", "Trinucleotide repeat only"]', 1, 'Frameshifts alter the reading frame for all subsequent codons.');

    -- CASE 23: Inheritance Patterns
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Inheritance Patterns', 
        'A boy has an X-linked recessive disease. His mother is unaffected but is a carrier.',
        23
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A carrier mother and unaffected father have what chance of producing an affected son?', '["0%", "25% of all children", "50% of sons", "100% of sons", "75% of daughters"]', 2, 'X-linked recessive = Half the sons inherit the affected X.'),
    (v_case_id, 'Fathers pass their X chromosome to:', '["All sons", "All daughters", "Half of sons only", "Neither sons nor daughters", "Only firstborn children"]', 1, 'Sons get the Y; daughters must get the X.'),
    (v_case_id, 'X-linked recessive disorders are generally more common in:', '["Females", "Males", "Both equally", "Only newborns", "Only elderly adults"]', 1, 'Males have only one X and thus express the phenotype immediately.');

    -- CASE 24: Chromosomal Abnormalities
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Chromosomal Abnormalities', 
        'A newborn has hypotonia and characteristic facial features due to trisomy 21.',
        24
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Trisomy 21 most commonly results from:', '["Frameshift mutation", "Nondisjunction", "Missense mutation", "Mitochondrial inheritance", "Genomic imprinting only"]', 1, 'Failure of homologous chromosomes to separate during meiosis.'),
    (v_case_id, 'Nondisjunction most often occurs during:', '["DNA repair only", "Meiosis", "Translation", "Protein folding", "Transcription"]', 1, 'Meiotic nondisjunction leads to aneuploidy.'),
    (v_case_id, 'An extra copy of an entire chromosome is called:', '["Monosomy", "Trisomy", "Translocation only", "Inversion", "Deletion"]', 1, 'Trisomy = 3 copies instead of 2.');

    -- CASE 25: Integrated Metabolic Hormonal Regulation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Integrated Metabolic Hormonal Regulation', 
        'A patient with uncontrolled diabetes mellitus develops hyperglycemia, lipolysis, and ketone production.',
        25
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The major biochemical effect of low insulin is:', '["Increased GLUT4-mediated uptake into muscle and adipose", "Decreased anabolic storage and increased catabolism", "Increased glycogen synthesis only", "Reduced gluconeogenesis", "Decreased ketogenesis"]', 1, 'Insulin deficiency is essentially a "starvation in the midst of plenty" state.'),
    (v_case_id, 'In insulin deficiency, adipose tissue shows increased:', '["Glycogen synthesis", "Hormone-sensitive lipase activity", "Lipoprotein lipase only", "Glucose uptake", "Protein synthesis"]', 1, 'Lack of insulin activation of HSL leads to massive fatty acid release.'),
    (v_case_id, 'The liver responds to high glucagon/low insulin by increasing:', '["Glycolysis and fatty acid synthesis only", "Gluconeogenesis and ketogenesis", "Glycogen synthesis only", "Pentose phosphate pathway only", "Cholesterol ester storage only"]', 1, 'The liver acts in fasting mode, pumping glucose into the blood.'),
    (v_case_id, 'Ketone body overproduction in severe insulin deficiency can contribute to:', '["Metabolic alkalosis", "Metabolic acidosis", "Respiratory alkalosis", "Hypercalcemia", "Hyperammonemia only"]', 1, 'Ketoacids release protons, leading to Diabetic Ketoacidosis (DKA).');

    RAISE NOTICE 'Biochemistry (System Level) Cases Migration Completed (25 Cases).';
END $$;
