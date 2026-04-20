-- Biochem Basics Case Studies Migration
BEGIN;

-- 1. Ensure Topic exists in Semester 1
INSERT INTO public.topics (semester_id, title, slug, "order")
VALUES (1, 'Biochem Basics', 'biochem-basics', 7)
ON CONFLICT (semester_id, slug) DO NOTHING;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM public.topics WHERE slug = 'biochem-basics' LIMIT 1;

    -- Case 1: Lactose Intolerance and Carbohydrates
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lactose Intolerance and Carbohydrates', 'A 19-year-old student develops bloating, abdominal cramps, and diarrhea after drinking milk. He is otherwise healthy.', 1)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Lactose is a:', '["Monosaccharide", "Disaccharide", "Polysaccharide", "Triglyceride", "Nucleotide"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Lactose is composed of:', '["Glucose + fructose", "Glucose + galactose", "Galactose + fructose", "Glucose + glucose", "Ribose + glucose"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'The deficient enzyme in lactose intolerance is:', '["Sucrase", "Maltase", "Lactase", "Amylase", "Hexokinase"]'::jsonb, 2, 'The correct answer is C.'),
    (v_case_id, 'Lactase is located mainly on the:', '["Hepatocyte mitochondria", "Intestinal brush border", "Gastric parietal cell membrane", "Pancreatic acinar granules", "Erythrocyte membrane"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 2: Fructose Source and Monosaccharides
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fructose Source and Monosaccharides', 'A child is given a sweet fruit juice and his teacher asks which sugar is most abundant in fruits.', 2)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Fructose is classified as a:', '["Hexose monosaccharide", "Pentose monosaccharide", "Disaccharide", "Triose", "Steroid"]'::jsonb, 0, 'The correct answer is A.'),
    (v_case_id, 'Glucose, fructose, and galactose are all:', '["Disaccharides", "Monosaccharides", "Polypeptides", "Fatty acids", "Purines"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Which of the following is a pentose sugar important in nucleic acids?', '["Glucose", "Fructose", "Ribose", "Galactose", "Lactose"]'::jsonb, 2, 'The correct answer is C.');

    -- Case 3: Glycogen Storage and Polymer Basics
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Glycogen Storage and Polymer Basics', 'A healthy man is fasting overnight. His liver begins breaking down stored glycogen.', 3)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Glycogen is a polymer of:', '["Galactose", "Fructose", "Glucose", "Ribose", "Mannose"]'::jsonb, 2, 'The correct answer is C.'),
    (v_case_id, 'Glycogen is primarily stored in:', '["Brain and bone", "Liver and skeletal muscle", "Kidney and lung", "Skin and cartilage", "Spleen only"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Glycogen is best classified as a:', '["Disaccharide", "Polysaccharide", "Phospholipid", "Steroid", "Nucleoside"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'The major role of liver glycogen is to help maintain:', '["Plasma cholesterol", "Blood glucose", "Plasma calcium", "Blood pH only", "Ketone levels only"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 4: Cell Membranes and Lipids
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cell Membranes and Lipids', 'A researcher studies membrane fluidity in cultured cells.', 4)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'The major structural component of cell membranes is:', '["Triacylglycerol", "Phospholipid bilayer", "Glycogen", "DNA double helix", "Collagen"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Cholesterol in membranes primarily helps:', '["Form peptide bonds", "Modulate membrane fluidity", "Hydrolyze fats", "Store genetic information", "Bind calcium in bone"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'A phospholipid is amphipathic because it contains:', '["Two hydrophilic ends", "Hydrophilic head and hydrophobic tail", "Only hydrophobic groups", "Only carbohydrate chains", "Nitrogenous bases only"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 5: Essential Fatty Acids
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Essential Fatty Acids', 'A patient on a severely restricted diet develops scaly dermatitis and poor wound healing.', 5)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Essential fatty acids are called “essential” because they:', '["Cannot be stored in adipose tissue", "Must be obtained from the diet", "Are made only in the kidney", "Are the main fuel of RBCs", "Cannot enter membranes"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Linoleic acid is a:', '["Saturated fatty acid", "Polyunsaturated fatty acid", "Monosaccharide", "Phospholipid head group", "Purine"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Unsaturated fatty acids contain:', '["Peptide bonds", "Double bonds", "Triple bonds", "Phosphodiester bonds", "Glycosidic bonds"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 6: Triglycerides and Energy Storage
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Triglycerides and Energy Storage', 'An obese man asks which biomolecule stores the most energy per gram.', 6)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Triacylglycerol is composed of:', '["Glycerol + 3 fatty acids", "Glycerol + 2 amino acids", "3 glucose molecules", "3 phosphate groups + cholesterol", "2 fatty acids + ribose"]'::jsonb, 0, 'The correct answer is A.'),
    (v_case_id, 'The major long-term energy storage form in humans is:', '["Protein", "Glycogen", "Triacylglycerol", "DNA", "Calcium phosphate"]'::jsonb, 2, 'The correct answer is C.'),
    (v_case_id, 'Compared with carbohydrates, fats yield:', '["Less energy per gram", "More energy per gram", "Equal energy always", "No ATP", "Only heat and no energy capture"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 7: Protein Denaturation
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Protein Denaturation', 'A patient with high fever develops denaturation of some proteins.', 7)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Proteins are polymers of:', '["Fatty acids", "Monosaccharides", "Amino acids", "Nucleotides", "Steroid rings"]'::jsonb, 2, 'The correct answer is C.'),
    (v_case_id, 'The primary structure of a protein refers to:', '["Its alpha-helix content", "The linear amino acid sequence", "Its 3D folding into domains", "Association of multiple subunits", "Its glycosylation pattern"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Denaturation usually disrupts:', '["Peptide bonds first", "Secondary and tertiary structure", "Amino acid identity", "DNA sequence", "Ribosome assembly only"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 8: Collagen and Structural Proteins
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Collagen and Structural Proteins', 'A child with vitamin C deficiency has bleeding gums and poor wound healing due to defective collagen maturation.', 8)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Collagen is best classified as a:', '["Storage carbohydrate", "Structural protein", "Nucleic acid", "Phospholipid", "Steroid hormone"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Collagen’s tensile strength makes it especially important in:', '["DNA replication", "Connective tissues", "Bile synthesis", "Glycogen breakdown", "Nerve impulse conduction only"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Which vitamin is important for collagen hydroxylation?', '["Vitamin A", "Vitamin C", "Vitamin D", "Vitamin E", "Vitamin K"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 9: Hemoglobin as a Conjugated Protein
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemoglobin as a Conjugated Protein', 'A man with anemia asks about the composition of hemoglobin.', 9)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Hemoglobin is a:', '["Simple protein only", "Conjugated protein containing heme", "Pure carbohydrate", "Steroid-protein complex", "Triglyceride"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'The protein portion of hemoglobin is called:', '["Heme", "Globin", "Ferritin", "Transferrin", "Bilirubin"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Heme contains:', '["Calcium", "Iron", "Zinc", "Magnesium", "Copper"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 10: Enzyme Kinetics and Competitive Inhibition
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Enzyme Kinetics and Competitive Inhibition', 'A drug resembles the substrate of an enzyme and competes for the active site.', 10)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'This is an example of:', '["Noncompetitive inhibition", "Competitive inhibition", "Irreversible inhibition", "Allosteric activation", "Denaturation only"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'In competitive inhibition, Vmax is typically:', '["Increased", "Decreased", "Unchanged", "Zero", "Unpredictable only"]'::jsonb, 2, 'The correct answer is C.'),
    (v_case_id, 'In competitive inhibition, apparent Km is typically:', '["Decreased", "Increased", "Unchanged", "Zero", "Negative"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Competitive inhibition can often be overcome by:', '["Lowering substrate concentration", "Increasing substrate concentration", "Adding acid", "Removing cofactors", "Cooling to freezing point"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 11: Noncompetitive Inhibition
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Noncompetitive Inhibition', 'A toxin binds an enzyme at a site other than the active site and reduces its catalytic activity.', 11)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'This is:', '["Competitive inhibition", "Noncompetitive inhibition", "Product inhibition only", "Substrate activation", "Feedback phosphorylation only"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'In pure noncompetitive inhibition, Vmax is:', '["Increased", "Decreased", "Unchanged", "Equal to Km", "Undefined"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'In pure noncompetitive inhibition, Km is often:', '["Increased", "Decreased", "Unchanged", "Zero", "Infinite"]'::jsonb, 2, 'The correct answer is C.');

    -- Case 12: Allosteric Regulation
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Allosteric Regulation', 'A biochemistry professor explains why the rate-limiting step of a pathway is often regulated by molecules binding away from the active site.', 12)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'This regulation is called:', '["Covalent hydrolysis", "Allosteric regulation", "DNA methylation", "Osmotic regulation", "Glycosylation"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Allosteric enzymes often show:', '["Only linear kinetics", "Cooperative/sigmoidal kinetics", "No regulation", "No substrate specificity", "Zero-order kinetics only"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'A product that inhibits an earlier enzyme in the same pathway is an example of:', '["Forward amplification", "Feedback inhibition", "Competitive transport", "Oxidative damage", "Reverse transcription"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 13: pH and Enzyme Function
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'pH and Enzyme Function', 'A patient with severe acidosis has altered enzyme function.', 13)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Extreme changes in pH can reduce enzyme activity mainly by:', '["Destroying all amino acids", "Altering ionization and protein conformation", "Converting enzymes to carbohydrates", "Increasing Vmax permanently", "Making substrates disappear"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Most human enzymes work best near:', '["pH 1", "pH 3", "Physiologic pH around 7", "pH 10", "pH 12"]'::jsonb, 2, 'The correct answer is C.'),
    (v_case_id, 'Pepsin is an example of an enzyme that works best at:', '["Alkaline pH", "Acidic pH", "Neutral pH only", "No specific pH", "Intracellular mitochondrial pH only"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 14: Vitamins as Cofactors
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vitamins as Cofactors', 'A malnourished patient develops multiple biochemical dysfunctions due to vitamin deficiency.', 14)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Many vitamins serve as:', '["Structural DNA bases", "Enzyme cofactors or coenzymes", "Storage polysaccharides", "Membrane receptors", "Hemoglobin substitutes"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Water-soluble vitamins include:', '["Vitamins A, D, E, K", "Vitamin C and B-complex", "Cholesterol and vitamin D", "Only vitamin A", "Only vitamin K"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Fat-soluble vitamins are:', '["B1, B2, B6, B12", "A, D, E, K", "C and folate", "C and niacin", "Riboflavin and thiamine"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 15: Vitamin C Deficiency
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vitamin C Deficiency', 'A sailor on a poor diet develops corkscrew hairs, bleeding gums, and perifollicular hemorrhage.', 15)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'The deficient vitamin is:', '["Vitamin A", "Vitamin C", "Vitamin D", "Vitamin E", "Vitamin K"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'The disease is:', '["Rickets", "Beriberi", "Scurvy", "Pellagra", "Night blindness"]'::jsonb, 2, 'The correct answer is C.'),
    (v_case_id, 'The main biochemical defect involves impaired:', '["Gamma-carboxylation of clotting factors", "Collagen hydroxylation", "Oxidative phosphorylation", "DNA base pairing", "Glycogen storage"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 16: Vitamin D Deficiency
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vitamin D Deficiency', 'A child has bowed legs and delayed closure of fontanelles.', 16)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'This child most likely has deficiency of:', '["Vitamin A", "Vitamin B12", "Vitamin D", "Vitamin E", "Vitamin K"]'::jsonb, 2, 'The correct answer is C.'),
    (v_case_id, 'Vitamin D is important for absorption of:', '["Iron and copper", "Calcium and phosphate", "Sodium and potassium", "Vitamin C and folate", "Bilirubin and bile salts"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Deficiency in children causes:', '["Scurvy", "Rickets", "Beriberi", "Pellagra", "Sideroblastic anemia"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 17: Vitamin K and Clotting
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vitamin K and Clotting', 'A newborn with hemorrhagic disease has deficiency of a vitamin needed for clotting factor maturation.', 17)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'The deficient vitamin is:', '["Vitamin A", "Vitamin C", "Vitamin D", "Vitamin E", "Vitamin K"]'::jsonb, 4, 'The correct answer is E.'),
    (v_case_id, 'Vitamin K is required for:', '["Hydroxylation of proline", "Gamma-carboxylation of certain clotting factors", "Ribosome assembly", "Heme synthesis only", "Collagen cross-linking"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'The process occurs mainly in the:', '["Kidney", "Liver", "Spleen", "Bone marrow", "Skin"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 18: Vitamin B1 Deficiency
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vitamin B1 Deficiency', 'A chronic alcoholic develops confusion, ataxia, and ophthalmoplegia.', 18)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'The deficient vitamin is:', '["Thiamine", "Riboflavin", "Niacin", "Pyridoxine", "Biotin"]'::jsonb, 0, 'The correct answer is A.'),
    (v_case_id, 'Thiamine deficiency classically causes:', '["Pellagra", "Beriberi / Wernicke-related syndromes", "Scurvy", "Rickets", "Hemorrhagic disease of newborn"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Thiamine is important in enzymes involved in:', '["Oxidative decarboxylation reactions", "Collagen synthesis", "DNA replication only", "Clotting factor activation", "Bile acid formation"]'::jsonb, 0, 'The correct answer is A.');

    -- Case 19: Niacin Deficiency
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Niacin Deficiency', 'A malnourished man has dermatitis, diarrhea, and dementia.', 19)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'The deficient vitamin is:', '["Thiamine", "Riboflavin", "Niacin", "Folate", "Biotin"]'::jsonb, 2, 'The correct answer is C.'),
    (v_case_id, 'The disease is:', '["Beriberi", "Pellagra", "Scurvy", "Kwashiorkor", "Rickets"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Niacin forms part of:', '["NAD/NADP", "FAD only", "Coenzyme A", "TPP", "Biotinyl-enzyme complexes only"]'::jsonb, 0, 'The correct answer is A.');

    -- Case 20: Folate vs B12
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Folate vs B12', 'A pregnant woman with poor nutrition develops megaloblastic anemia.', 20)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Folate is important for:', '["Gamma-carboxylation", "One-carbon transfer reactions and DNA synthesis", "Collagen hydroxylation", "Clot retraction", "Bile emulsification"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Deficiency of folate particularly affects tissues with:', '["Low turnover", "Rapid cell division", "No DNA synthesis", "No protein synthesis", "Low blood flow only"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Both folate and B12 deficiency can cause:', '["Microcytic anemia", "Megaloblastic anemia", "Hemolytic anemia only", "Polycythemia", "Spherocytosis"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 21: DNA, RNA, and Bases
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'DNA, RNA, and Bases', 'A student is asked to compare DNA and RNA.', 21)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'DNA contains:', '["Uracil", "Thymine", "Ribose only", "No phosphate", "Amino acids"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'RNA contains:', '["Thymine", "Uracil", "Deoxyribose only", "Heme", "Cholesterol"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'The sugar in DNA is:', '["Ribose", "Deoxyribose", "Fructose", "Glucose", "Galactose"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'A nucleotide is composed of base + sugar +:', '["Amino acid", "Phosphate", "Heme", "Fatty acid", "Peptide bond"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 22: Purines and Pyrimidines
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Purines and Pyrimidines', 'A child with a genetic disorder is found to have defects in nucleotide metabolism.', 22)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Purine bases are:', '["Cytosine and thymine", "Adenine and guanine", "Uracil and thymine", "Cytosine and guanine", "Ribose and deoxyribose"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Pyrimidine bases include:', '["Adenine and guanine", "Cytosine, thymine, uracil", "Only adenine", "Only guanine", "Ribose and phosphate"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Adenosine is a:', '["Nucleotide", "Nucleoside", "Pyrimidine only", "Protein", "Phospholipid"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 23: DNA Replication Basics
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'DNA Replication Basics', 'A lab drug interferes with DNA replication in rapidly dividing cells.', 23)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'DNA replication is:', '["Conservative", "Semiconservative", "Dispersive only", "Random", "Unidirectional only"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'DNA polymerase synthesizes DNA in the:', '["3'' to 5'' direction", "5'' to 3'' direction", "Any direction equally", "Circular direction only", "Reverse direction from RNA only"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Okazaki fragments are found on the:', '["Leading strand", "Lagging strand", "mRNA strand", "Template protein", "Ribosomal strand"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Primase produces:', '["DNA primer", "RNA primer", "Protein primer", "Phosphate primer", "Lipid primer"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 24: Transcription and Translation
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Transcription and Translation', 'A mutation affects messenger RNA production.', 24)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'Transcription is the process of making:', '["Protein from RNA", "RNA from DNA template", "DNA from protein", "Lipid from carbohydrate", "ATP from glucose"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Translation occurs on:', '["Lysosomes", "Ribosomes", "Golgi only", "Nucleus only", "Peroxisomes"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'mRNA carries information from:', '["Ribosome to nucleus", "DNA to ribosome", "Golgi to lysosome", "Cytosol to membrane lipids", "Protein to DNA"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'tRNA functions primarily to:', '["Store genes", "Carry amino acids to ribosome", "Make ATP", "Replicate DNA", "Hydrolyze peptide bonds"]'::jsonb, 1, 'The correct answer is B.');

    -- Case 25: Acid-Base Basics and Buffers
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Acid-Base Basics and Buffers', 'A patient with severe diarrhea develops metabolic acidosis. The physician discusses the body’s biochemical buffer systems.', 25)
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation) VALUES 
    (v_case_id, 'The major extracellular buffer system is:', '["Phosphate", "Bicarbonate", "Hemoglobin only", "Protein only", "Ammonia only"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'A buffer works by:', '["Eliminating all acids permanently", "Resisting sudden change in pH", "Raising temperature", "Increasing osmolarity", "Destroying enzymes"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'In blood, hemoglobin also contributes to:', '["DNA repair", "Buffering hydrogen ions", "Platelet aggregation", "Clot lysis", "Ribosome function"]'::jsonb, 1, 'The correct answer is B.'),
    (v_case_id, 'Diarrhea commonly causes loss of:', '["Bicarbonate", "Albumin only", "Hemoglobin", "Ferritin", "Cholesterol"]'::jsonb, 0, 'The correct answer is A.');

END $$;
COMMIT;
