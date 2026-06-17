const biochem2Cards = [
  {
    "q": "What are the four major classes of biomolecules?",
    "a": "<ol><li><b>Carbohydrates</b></li><li><b>Lipids</b></li><li><b>Proteins</b></li><li><b>Nucleic acids</b></li></ol>"
  },
  {
    "q": "What is the difference between aldoses and ketoses?",
    "a": "Aldoses have aldehyde group (e.g., glucose); ketoses have ketone group (e.g., fructose)."
  },
  {
    "q": "Name the three most important hexoses in human metabolism.",
    "a": "Glucose, Fructose, Galactose."
  },
  {
    "q": "What is the storage form of glucose in liver and muscle?",
    "a": "<b>Glycogen</b> (branched polymer of glucose with α-1,4 and α-1,6 linkages)."
  },
  {
    "q": "Which enzyme deficiency causes <b>von Gierke</b> disease (GSD I)?",
    "a": "<b>Glucose-6-phosphatase</b>. Cannot release free glucose from liver → severe fasting hypoglycemia."
  },
  {
    "q": "Which enzyme deficiency causes <b>Pompe</b> disease (GSD II)?",
    "a": "<b>Acid α-glucosidase (lysosomal maltase)</b> → cardiomegaly, muscle weakness."
  },
  {
    "q": "What is the rate-limiting enzyme of glycolysis?",
    "a": "<b><b>Phosphofructokinase-1</b> (<b>PFK-1</b>)</b>. Activated by AMP, <b>fructose-2,6-BP</b>; inhibited by <b>ATP</b>, citrate."
  },
  {
    "q": "What is the net <b>ATP</b> yield from complete aerobic oxidation of one glucose molecule?",
    "a": "Approximately <b>30–32 <b>ATP</b></b> (2 from glycolysis, 2 from TCA, 26–28 from oxidative phosphorylation)."
  },
  {
    "q": "What is the key regulatory enzyme of gluconeogenesis?",
    "a": "<b>Fructose-1,6-bisphosphatase</b>. Inhibited by <b>fructose-2,6-BP</b> and AMP."
  },
  {
    "q": "Which tissues cannot perform gluconeogenesis and why?",
    "a": "Muscle and brain lack <b>glucose-6-phosphatase</b>."
  },
  {
    "q": "What are the three irreversible steps of glycolysis and their gluconeogenic bypass enzymes?",
    "a": "<ol><li><b>Hexokinase</b> → <b>Glucose-6-phosphatase</b></li><li><b>PFK-1</b> → <b>Fructose-1,6-bisphosphatase</b></li><li><b>Pyruvate kinase</b> → <b>Pyruvate carboxylase</b> + <b>PEPCK</b></li></ol>"
  },
  {
    "q": "What is the Cori cycle?",
    "a": "<b>Cori cycle:</b> Anaerobic muscle glycolysis → <b>lactate</b> → transported to liver → <b>gluconeogenesis</b> → glucose returned to muscle."
  },
  {
    "q": "What is the pentose phosphate pathway (HMP shunt) main product in oxidative phase?",
    "a": "<b>NADPH</b> (used for fatty acid synthesis, glutathione reduction)."
  },
  {
    "q": "Which enzyme deficiency causes classic <b>galactosemia</b>?",
    "a": "<b>Galactose-1-phosphate uridyltransferase (GALT)</b>. <b>Cataracts</b>, hepatomegaly, E. coli sepsis."
  },
  {
    "q": "What is the defect in <b>hereditary fructose intolerance</b>?",
    "a": "<b>Aldolase B</b> deficiency → accumulation of fructose-1-phosphate → hypoglycemia, liver damage."
  },
  {
    "q": "What is the committed step of fatty acid synthesis?",
    "a": "<b><b>Acetyl-CoA</b> carboxylase</b> (produces <b>malonyl-CoA</b>). Activated by citrate, inhibited by palmitoyl-CoA."
  },
  {
    "q": "Where does fatty acid β-oxidation occur?",
    "a": "Mitochondrial matrix."
  },
  {
    "q": "Which cofactor is required for β-oxidation?",
    "a": "<b>Carnitine</b> (transports long-chain fatty acyl-CoA into mitochondria)."
  },
  {
    "q": "What is the rate-limiting enzyme of cholesterol synthesis?",
    "a": "<b>HMG-CoA reductase</b> (target of <b>statins</b>)."
  },
  {
    "q": "What is the function of lipoprotein lipase (<b>LPL</b>)?",
    "a": "Hydrolyzes triglycerides in chylomicrons and VLDL on capillary endothelium."
  },
  {
    "q": "Which apolipoprotein activates <b>LPL</b>?",
    "a": "<b>ApoC-II</b>."
  },
  {
    "q": "Which apolipoprotein is the ligand for LDL receptor?",
    "a": "<b>ApoB-100</b>."
  },
  {
    "q": "What is the defect in <b>familial hypercholesterolemia</b>?",
    "a": "<b>LDL receptor</b> mutation → very high LDL, early atherosclerosis."
  },
  {
    "q": "What is the function of <b>LCAT</b>?",
    "a": "Lecithin-cholesterol acyltransferase esterifies cholesterol in HDL."
  },
  {
    "q": "What are the ketone bodies?",
    "a": "Acetoacetate, β-hydroxybutyrate, acetone."
  },
  {
    "q": "In which organ are ketone bodies synthesized?",
    "a": "Liver mitochondria (from excess <b>acetyl-CoA</b>)."
  },
  {
    "q": "Which enzyme is deficient in <b>MCAD</b> deficiency?",
    "a": "Medium-chain acyl-CoA dehydrogenase → hypoketotic hypoglycemia during fasting."
  },
  {
    "q": "What is the urea cycle rate-limiting enzyme?",
    "a": "<b>Carbamoyl phosphate synthetase I (<b>CPS I</b>)</b>. Activated by N-acetylglutamate."
  },
  {
    "q": "Which amino acid donates the second nitrogen in urea cycle?",
    "a": "<b>Aspartate</b>."
  },
  {
    "q": "What is the defect in ornithine transcarbamylase (<b>OTC</b>) deficiency?",
    "a": "Most common urea cycle disorder → hyperammonemia, orotic aciduria, X-linked."
  },
  {
    "q": "What are the essential amino acids?",
    "a": "<b>Mnemonic: PVT TIM HaLL</b><ul><li><b>P</b>henylalanine</li><li><b>V</b>aline</li><li><b>T</b>ryptophan</li><li><b>T</b>hreonine</li><li><b>I</b>soleucine</li><li><b>M</b>ethionine</li><li><b>H</b>istidine</li><li><b>L</b>eucine</li><li><b>L</b>ysine</li></ul>"
  },
  {
    "q": "Which amino acids are purely ketogenic?",
    "a": "<b>Leucine and Lysine</b>."
  },
  {
    "q": "Which amino acids are both glucogenic and ketogenic?",
    "a": "Isoleucine, Phenylalanine, Tryptophan, Tyrosine."
  },
  {
    "q": "What is the precursor of catecholamines?",
    "a": "<b>Tyrosine</b>."
  },
  {
    "q": "What is the precursor of <b>serotonin</b>?",
    "a": "<b>Tryptophan</b>."
  },
  {
    "q": "What is the precursor of heme?",
    "a": "<b>Glycine + <b>Succinyl-CoA</b></b>."
  },
  {
    "q": "Which disease is caused by deficiency of <b>phenylalanine hydroxylase</b>?",
    "a": "<b><b>Phenylketonuria</b> (<b>PKU</b>)</b>. Musty odor, fair skin, intellectual disability. Treated with low-phenylalanine diet."
  },
  {
    "q": "What is the defect in alkaptonuria?",
    "a": "<b>Homogentisate oxidase</b> deficiency → dark urine, ochronosis, arthritis."
  },
  {
    "q": "What is the most common aminoaciduria?",
    "a": "<b>Cystinuria</b> (defective dibasic amino acid transporter)."
  },
  {
    "q": "What is the function of tetrahydrofolate (THF)?",
    "a": "Carrier of one-carbon units (methyl, methylene, formyl)."
  },
  {
    "q": "What is the active form of vitamin B12?",
    "a": "Methylcobalamin and deoxyadenosylcobalamin."
  },
  {
    "q": "Which reaction requires both B12 and folate?",
    "a": "Homocysteine → Methionine (methionine synthase)."
  },
  {
    "q": "What is the defect in <b>Lesch-Nyhan</b> syndrome?",
    "a": "<b>HGPRT</b> deficiency (purine salvage pathway) → hyperuricemia, self-mutilation, gout."
  },
  {
    "q": "What is the rate-limiting enzyme of de novo purine synthesis?",
    "a": "<b>Glutamine-PRPP amidotransferase</b>."
  },
  {
    "q": "What is the rate-limiting enzyme of pyrimidine synthesis?",
    "a": "<b>Carbamoyl phosphate synthetase II (<b>CPS II</b>)</b>."
  },
  {
    "q": "Which drug inhibits dihydrofolate reductase?",
    "a": "<b><b>Methotrexate</b></b>."
  },
  {
    "q": "Which drug inhibits thymidylate synthase?",
    "a": "<b><b>5-Fluorouracil</b> (<b>5-FU</b>)</b>."
  },
  {
    "q": "What is the function of ribonucleotide reductase?",
    "a": "Converts ribonucleotides to deoxyribonucleotides."
  },
  {
    "q": "What is the function of pyruvate dehydrogenase complex (PDH)?",
    "a": "<b>Converts pyruvate → acetyl-CoA.</b> Requires 5 cofactors:<ul><li><b>TPP</b> (B1 — Thiamine)</li><li><b>Lipoic acid</b></li><li><b>CoA</b> (B5 — Pantothenate)</li><li><b>FAD</b> (B2 — Riboflavin)</li><li><b>NAD</b> (B3 — Niacin)</li></ul><b>Mnemonic: Tender Loving Care For Nancy</b>"
  },
  {
    "q": "Which vitamin deficiency causes Wernicke-<b>Korsakoff syndrome</b>?",
    "a": "<b><b>Thiamine</b> (B1)</b> deficiency — common in alcoholics. Damage to mammillary bodies."
  },
  {
    "q": "What is the rate-limiting enzyme of the TCA cycle?",
    "a": "<b>Isocitrate dehydrogenase</b>. Inhibited by <b>NADH</b> and <b>ATP</b>; activated by ADP."
  },
  {
    "q": "How many <b>NADH</b> and FADH₂ are produced per <b>acetyl-CoA</b> in one turn of TCA cycle?",
    "a": "3 <b>NADH</b> + 1 FADH₂ + 1 <b>GTP</b>."
  },
  {
    "q": "What is the clinical presentation of pyruvate dehydrogenase deficiency?",
    "a": "Lactic acidosis, neurological deficits. Treated with high-fat diet and <b>thiamine</b> supplementation."
  },
  {
    "q": "Which shuttle transfers reducing equivalents from cytosolic <b>NADH</b> into mitochondria?",
    "a": "<b>Malate-aspartate shuttle</b> (yields 2.5 <b>ATP</b>) vs <b>Glycerol-3-phosphate shuttle</b> (1.5 <b>ATP</b>)."
  },
  {
    "q": "What is the defect in Leigh syndrome?",
    "a": "Pyruvate dehydrogenase or electron transport chain defects → severe lactic acidosis and neurodegeneration."
  },
  {
    "q": "What are the sources of <b>NADPH</b> in the cell?",
    "a": "<ol><li><b>Pentose phosphate pathway</b> (oxidative phase, via G6PD)</li><li><b>Malic enzyme</b></li><li><b>Isocitrate dehydrogenase</b> (cytosolic)</li></ol>"
  },
  {
    "q": "What is the function of glutathione peroxidase?",
    "a": "Reduces H₂O₂ using glutathione (requires selenium)."
  },
  {
    "q": "Which enzyme regenerates reduced glutathione?",
    "a": "<b>Glutathione reductase</b> (requires <b>NADPH</b>)."
  },
  {
    "q": "What is the role of G6PD in RBCs?",
    "a": "Generates <b>NADPH</b> → maintains reduced glutathione → protects RBCs from oxidative damage."
  },
  {
    "q": "What triggers hemolytic anemia in G6PD deficiency?",
    "a": "Oxidative stress (fava beans, <b>primaquine</b>, sulfa drugs, infections)."
  },
  {
    "q": "What is the Heinz body?",
    "a": "Precipitated denatured hemoglobin seen in G6PD deficiency."
  },
  {
    "q": "Which <b>glycogen</b> storage disease presents with painful muscle cramps and myoglobinuria on exercise?",
    "a": "<b><b>McArdle</b> disease (GSD V)</b> — muscle phosphorylase deficiency."
  },
  {
    "q": "Which GSD is characterized by hepatomegaly and hypoglycemia but no lactic acidosis?",
    "a": "<b><b>Hers disease</b> (GSD VI)</b> — liver phosphorylase deficiency."
  },
  {
    "q": "What is the defect in <b>Cori disease</b> (GSD III)?",
    "a": "<b>Debranching enzyme (amylo-1,6-glucosidase)</b> deficiency."
  },
  {
    "q": "Name the key allosteric regulators of <b>PFK-1</b>.",
    "a": "<ul><li><b>Activators ↑:</b> AMP, Fructose-2,6-bisphosphate</li><li><b>Inhibitors ↓:</b> ATP, Citrate, Low pH</li></ul>"
  },
  {
    "q": "What is the function of <b>fructose-2,6-bisphosphate</b>?",
    "a": "Powerful activator of <b>PFK-1</b> (glycolysis) and inhibitor of <b>fructose-1,6-bisphosphatase</b> (gluconeogenesis)."
  },
  {
    "q": "Which hormone increases <b>fructose-2,6-BP</b> levels in liver?",
    "a": "<b>Insulin</b> (via PFK-2 activation)."
  },
  {
    "q": "Which hormone decreases <b>fructose-2,6-BP</b> levels?",
    "a": "<b>Glucagon / Epinephrine</b> (via <b>PKA</b> → PFK-2 phosphorylation)."
  },
  {
    "q": "What is the main product of the non-oxidative phase of HMP shunt?",
    "a": "<b>Ribose-5-phosphate</b> (for nucleotide synthesis)."
  },
  {
    "q": "What is the role of transketolase?",
    "a": "Transfers 2-carbon units in non-oxidative HMP shunt (requires <b>thiamine</b>)."
  },
  {
    "q": "What is essential fructosuria?",
    "a": "Benign condition due to <b>fructokinase</b> deficiency."
  },
  {
    "q": "What accumulates in galactokinase deficiency?",
    "a": "Galactitol → <b>cataracts</b>."
  },
  {
    "q": "What is the committed step of fatty acid oxidation?",
    "a": "Formation of fatty acyl-carnitine by <b><b>carnitine palmitoyltransferase I</b> (<b>CPT-I</b>)</b>."
  },
  {
    "q": "Which drug inhibits <b>CPT-I</b>?",
    "a": "<b>Etomoxir</b> (experimental); <b>malonyl-CoA</b> is physiological inhibitor."
  },
  {
    "q": "What is the final product of odd-chain fatty acid oxidation?",
    "a": "<b>Propionyl-CoA</b> → <b>succinyl-CoA</b> (via methylmalonyl-CoA)."
  },
  {
    "q": "What vitamin is required for methylmalonyl-CoA mutase?",
    "a": "<b>Vitamin B12</b>."
  },
  {
    "q": "What causes <b>Refsum disease</b>?",
    "a": "Deficiency of <b>phytanoyl-CoA hydroxylase</b> → accumulation of phytanic acid."
  },
  {
    "q": "What is the rate-limiting step of ketogenesis?",
    "a": "<b>HMG-CoA synthase</b>."
  },
  {
    "q": "Why can't the liver use ketone bodies as fuel?",
    "a": "Lacks <b><b>succinyl-CoA</b>:acetoacetate CoA transferase (thiophorase)</b>."
  },
  {
    "q": "What is the defect in abetalipoproteinemia?",
    "a": "Mutation in <b>microsomal triglyceride transfer protein (MTP)</b> → no chylomicrons or VLDL."
  },
  {
    "q": "What are the features of <b>Tangier disease</b>?",
    "a": "ABCA1 deficiency → very low HDL, orange tonsils, peripheral neuropathy."
  },
  {
    "q": "Which apolipoprotein is deficient in familial dysbetalipoproteinemia (<b>Type III</b>)?",
    "a": "<b>ApoE</b> (E2/E2 genotype)."
  },
  {
    "q": "What is the function of <b>CETP</b>?",
    "a": "<b>Cholesteryl ester transfer protein</b> — transfers cholesterol esters from HDL to VLDL/LDL."
  },
  {
    "q": "What is the precursor of nitric oxide (NO)?",
    "a": "<b>Arginine</b> (via NOS enzyme)."
  },
  {
    "q": "Which amino acid is the precursor of <b>histamine</b>?",
    "a": "<b>Histidine</b>."
  },
  {
    "q": "Which amino acid is the precursor of creatine?",
    "a": "Glycine + Arginine + Methionine (SAM)."
  },
  {
    "q": "What is the defect in homocystinuria (most common form)?",
    "a": "<b>Cystathionine β-synthase</b> deficiency → elevated homocysteine and methionine."
  },
  {
    "q": "What is the treatment for cystathionine β-synthase deficiency?",
    "a": "Pyridoxine (B6), folate, B12, betaine, and low-methionine diet."
  },
  {
    "q": "What causes maple syrup urine disease?",
    "a": "Deficiency of <b>branched-chain α-ketoacid dehydrogenase</b>."
  },
  {
    "q": "Which amino acids are elevated in MSUD?",
    "a": "Leucine, Isoleucine, Valine."
  },
  {
    "q": "What is the defect in albinism?",
    "a": "<b>Tyrosinase</b> deficiency (cannot convert tyrosine to DOPA)."
  },
  {
    "q": "What is the rate-limiting enzyme of heme synthesis?",
    "a": "<b>ALA synthase</b> (requires vitamin B6)."
  },
  {
    "q": "Which porphyria presents with <b>photosensitivity</b> and blistering skin lesions?",
    "a": "<b>Porphyria cutanea tarda</b> (uroporphyrinogen decarboxylase deficiency)."
  },
  {
    "q": "Which porphyria presents with acute abdominal pain, neuropsychiatric symptoms, and dark urine?",
    "a": "<b>Acute intermittent porphyria</b> (porphobilinogen deaminase deficiency)."
  },
  {
    "q": "What drug class can precipitate acute porphyria attacks?",
    "a": "<b>Barbiturates</b>, anticonvulsants (<b>CYP450</b> inducers)."
  },
  {
    "q": "What is the final product of purine degradation in humans?",
    "a": "<b>Uric acid</b>."
  },
  {
    "q": "Which enzyme deficiency causes gout due to overproduction of <b>uric acid</b>?",
    "a": "<b>PRPP synthetase</b> overactivity or <b>HGPRT</b> deficiency (<b>Lesch-Nyhan</b>)."
  },
  {
    "q": "What is the difference between leading and lagging strand in DNA replication?",
    "a": "<ul><li><b>Leading strand:</b> synthesized continuously (5' → 3').</li><li><b>Lagging strand:</b> synthesized discontinuously in Okazaki fragments.</li></ul>"
  },
  {
    "q": "Which enzyme synthesizes RNA primers during replication?",
    "a": "<b>Primase</b> (DNA-dependent RNA polymerase)."
  },
  {
    "q": "What is the function of <b>DNA helicase</b>?",
    "a": "Unwinds double helix using <b>ATP</b>."
  },
  {
    "q": "What is the function of DNA topoisomerase II?",
    "a": "Relieves supercoiling ahead of replication fork (also called gyrase in bacteria)."
  },
  {
    "q": "Which enzyme removes RNA primers and fills gaps with DNA?",
    "a": "<b>DNA polymerase I</b> (prokaryotes); <b>Pol δ + Fen1</b> in eukaryotes."
  },
  {
    "q": "What is the direction of DNA replication?",
    "a": "Always 5' → 3'."
  },
  {
    "q": "What are <b>telomeres</b> and what enzyme maintains them?",
    "a": "TTAGGG repeats at chromosome ends. Maintained by <b>telomerase</b> (reverse transcriptase)."
  },
  {
    "q": "What is the defect in <b>xeroderma pigmentosum</b>?",
    "a": "Defective <b>nucleotide excision repair (NER)</b> → extreme UV sensitivity and skin cancer."
  },
  {
    "q": "Which DNA repair mechanism fixes double-strand breaks?",
    "a": "<b>Non-homologous end joining (<b>NHEJ</b>)</b> or <b>Homologous recombination</b>."
  },
  {
    "q": "What is the most common mutation type caused by UV light?",
    "a": "<b>Thymine dimers</b> (cyclobutane pyrimidine dimers)."
  },
  {
    "q": "What is the central dogma of molecular biology?",
    "a": "DNA → RNA → Protein (with reverse transcription in retroviruses)."
  },
  {
    "q": "What is the function of RNA polymerase II?",
    "a": "Transcribes mRNA (protein-coding genes)."
  },
  {
    "q": "What are the three types of RNA polymerase in eukaryotes?",
    "a": "<ul><li><b>RNA Pol I</b> — rRNA</li><li><b>RNA Pol II</b> — mRNA</li><li><b>RNA Pol III</b> — tRNA & 5S rRNA</li></ul><b>Mnemonic:</b> I make rRNA, II make mRNA, III make tRNA."
  },
  {
    "q": "What is the <b>TATA box</b>?",
    "a": "Promoter sequence ~25 bp upstream of transcription start site; binds TBP (part of TFIID)."
  },
  {
    "q": "What is the difference between prokaryotic and eukaryotic mRNA?",
    "a": "<ul><li><b>Prokaryotic:</b> polycistronic, no cap/poly-A tail.</li><li><b>Eukaryotic:</b> monocistronic, 5' cap, poly-A tail, splicing.</li></ul>"
  },
  {
    "q": "What is <b>alternative splicing</b>?",
    "a": "Process by which one gene produces multiple protein isoforms by including/excluding different exons."
  },
  {
    "q": "What is the start codon and what amino acid does it code for?",
    "a": "<b>AUG</b> → Methionine (Met)."
  },
  {
    "q": "What are the stop codons?",
    "a": "<ul><li><b>UAA</b> (ochre)</li><li><b>UAG</b> (amber)</li><li><b>UGA</b> (opal/umber)</li></ul>"
  },
  {
    "q": "What is the wobble hypothesis?",
    "a": "Third base of codon can have flexible base-pairing with tRNA anticodon, allowing fewer tRNAs."
  },
  {
    "q": "Which antibiotic inhibits peptidyl transferase on 50S subunit?",
    "a": "<b><b>Chloramphenicol</b></b>."
  },
  {
    "q": "Which antibiotic blocks translocation on 30S subunit?",
    "a": "<b><b>Tetracyclines</b></b>."
  },
  {
    "q": "What is the mechanism of action of <b>erythromycin</b>?",
    "a": "Binds 50S subunit and inhibits translocation."
  },
  {
    "q": "What is a <b>frameshift mutation</b>?",
    "a": "Insertion or deletion of nucleotides not in multiples of 3 → altered reading frame."
  },
  {
    "q": "What is a <b>missense mutation</b>?",
    "a": "Single nucleotide change that results in a different amino acid."
  },
  {
    "q": "What is a <b>nonsense mutation</b>?",
    "a": "Creates a premature stop codon."
  },
  {
    "q": "What is <b>anticipation</b> in genetics?",
    "a": "Increasing severity/earlier onset in successive generations (seen in trinucleotide repeat disorders)."
  },
  {
    "q": "Name three trinucleotide repeat disorders.",
    "a": "<ol><li><b>Huntington disease</b> — CAG (chromosome 4)</li><li><b>Fragile X syndrome</b> — CGG (FMR1)</li><li><b>Myotonic dystrophy</b> — CTG</li></ol>"
  },
  {
    "q": "What is the function of chaperones in protein folding?",
    "a": "Prevent misfolding and aggregation (e.g., heat shock proteins)."
  },
  {
    "q": "What is <b>ubiquitin</b> and its role?",
    "a": "Tags proteins for degradation by <b>proteasome</b>."
  },
  {
    "q": "What is the defect in α1-antitrypsin deficiency?",
    "a": "Misfolded protein retained in liver → <b>cirrhosis</b> + panacinar emphysema in lungs."
  },
  {
    "q": "What is the function of vitamin A (retinol)?",
    "a": "Visual pigments (rhodopsin), epithelial differentiation, gene transcription."
  },
  {
    "q": "What is the function of vitamin D?",
    "a": "Calcium and phosphate homeostasis; gene transcription via VDR."
  },
  {
    "q": "What is the active form of vitamin D?",
    "a": "1,25-dihydroxycholecalciferol (<b>calcitriol</b>)."
  },
  {
    "q": "Which vitamin is a cofactor for carboxylation reactions?",
    "a": "<b><b>Biotin</b> (B7)</b>."
  },
  {
    "q": "Which vitamin deficiency causes pellagra?",
    "a": "<b><b>Niacin</b> (B3)</b> — 4 Ds: Dermatitis, Diarrhea, Dementia, Death."
  },
  {
    "q": "Which vitamin is required for collagen synthesis (hydroxylation)?",
    "a": "<b>Vitamin C (ascorbic acid)</b>."
  },
  {
    "q": "What is the function of vitamin K?",
    "a": "γ-carboxylation of clotting factors II, VII, IX, X, and proteins C & S."
  },
  {
    "q": "Which vitamin deficiency causes night blindness?",
    "a": "<b>Vitamin A</b>."
  },
  {
    "q": "What is the function of selenium?",
    "a": "Component of glutathione peroxidase."
  },
  {
    "q": "What is the function of zinc?",
    "a": "Cofactor for many enzymes (carbonic anhydrase, DNA/RNA polymerases); wound healing."
  },
  {
    "q": "What is the function of iodine?",
    "a": "Thyroid hormone synthesis."
  },
  {
    "q": "What is the rate-limiting enzyme of glycolysis in the fed state?",
    "a": "<b>PFK-1</b> (activated by insulin via <b>fructose-2,6-BP</b>)."
  },
  {
    "q": "What is the main fuel for the brain during prolonged starvation?",
    "a": "<b>Ketone bodies</b>."
  },
  {
    "q": "Which hormone activates hormone-sensitive lipase in adipose tissue?",
    "a": "<b>Glucagon / Epinephrine</b> (via <b>PKA</b>)."
  },
  {
    "q": "What is the <b>Randle cycle</b> (glucose-fatty acid cycle)?",
    "a": "Increased fatty acid oxidation inhibits glucose oxidation (via increased <b>acetyl-CoA</b>, citrate, <b>NADH</b>)."
  },
  {
    "q": "What is the primary defect in type 1 diabetes?",
    "a": "Absolute insulin deficiency (autoimmune β-cell destruction)."
  },
  {
    "q": "What is the primary defect in type 2 diabetes?",
    "a": "Insulin resistance + relative insulin deficiency."
  },
  {
    "q": "What is the mechanism of <b>metformin</b>?",
    "a": "Activates <b>AMPK</b> → inhibits gluconeogenesis."
  },
  {
    "q": "What is the function of <b>GLUT4</b> transporter?",
    "a": "Insulin-dependent glucose uptake in muscle and adipose tissue."
  },
  {
    "q": "What is the function of <b>GLUT2</b>?",
    "a": "Bidirectional glucose transport in liver, β-cells, intestine, kidney (high Km)."
  },
  {
    "q": "What is the mechanism of action of sulfonylureas?",
    "a": "Close <b>ATP</b>-sensitive K⁺ channels on β-cells → depolarization → insulin release."
  },
  {
    "q": "What is the mechanism of <b>SGLT2</b> inhibitors?",
    "a": "Block glucose reabsorption in proximal tubule → glucosuria."
  },
  {
    "q": "What is the most common mutation in <b>cystic fibrosis</b>?",
    "a": "ΔF508 deletion in <b>CFTR</b> gene (impaired chloride channel folding)."
  },
  {
    "q": "What is the inheritance pattern of <b>Huntington</b> disease?",
    "a": "<b>Autosomal dominant</b>; trinucleotide repeat (CAG) on chromosome 4."
  },
  {
    "q": "What is the inheritance pattern of <b>Fragile X</b> syndrome?",
    "a": "X-linked; CGG repeat in <b>FMR1</b> gene."
  },
  {
    "q": "What is <b>genomic imprinting</b>?",
    "a": "Gene expression depends on parent of origin (e.g., <b>Prader-Willi</b> vs <b>Angelman</b> syndrome on chromosome 15)."
  },
  {
    "q": "What is the function of <b>telomerase</b> in cancer?",
    "a": "Reactivation allows unlimited replication (immortality)."
  },
  {
    "q": "What is the role of <b>oncogenes</b> vs <b>tumor suppressor</b> genes?",
    "a": "<ul><li><b>Oncogenes:</b> gain-of-function (one mutated copy sufficient — dominant)</li><li><b>Tumor suppressors:</b> loss-of-function (both copies usually lost — recessive, Knudson two-hit hypothesis)</li></ul>"
  },
  {
    "q": "What is <b>Li-Fraumeni</b> syndrome?",
    "a": "Germline <b>p53</b> mutation → multiple cancers at young age."
  },
  {
    "q": "What is the defect in <b>HNPCC</b>/<b>Lynch syndrome</b>?",
    "a": "Defective DNA mismatch repair (MSH2, MLH1, etc.)."
  },
  {
    "q": "What is the function of <b>retinoblastoma</b> (Rb) protein?",
    "a": "<b>Tumor suppressor</b>; binds E2F → prevents G1 to S progression."
  },
  {
    "q": "What is the most common enzyme deficiency causing hemolytic anemia?",
    "a": "<b>G6PD deficiency</b>."
  },
  {
    "q": "What is the classic presentation of <b>Wilson disease</b>?",
    "a": "Hepatitis, Kayser-Fleischer rings, low ceruloplasmin, high copper."
  },
  {
    "q": "What is the defect in <b>Wilson disease</b>?",
    "a": "ATP7B gene mutation → impaired copper excretion into bile."
  },
  {
    "q": "What is the treatment for <b>Wilson disease</b>?",
    "a": "<b>Penicillamine</b> or trientine (copper chelators); zinc."
  },
  {
    "q": "What is <b>hemochromatosis</b>?",
    "a": "Iron overload due to HFE gene mutation (C282Y) → bronze diabetes, <b>cirrhosis</b>, arthropathy."
  },
  {
    "q": "What is the inheritance of hereditary <b>hemochromatosis</b>?",
    "a": "<b>Autosomal recessive</b>."
  },
  {
    "q": "What is the treatment for hereditary <b>hemochromatosis</b>?",
    "a": "Phlebotomy."
  },
  {
    "q": "What is the function of α1-antitrypsin?",
    "a": "Inhibits neutrophil elastase in lungs."
  },
  {
    "q": "What are the two major clinical manifestations of α1-antitrypsin deficiency?",
    "a": "Panacinar emphysema (lungs) + <b>cirrhosis</b> (liver)."
  },
  {
    "q": "What is the most common inborn error of metabolism?",
    "a": "<b><b>Phenylketonuria</b> (<b>PKU</b>)</b>."
  },
  {
    "q": "What is the newborn screening test for <b>PKU</b>?",
    "a": "Guthrie test (elevated phenylalanine)."
  },
  {
    "q": "What is the treatment for <b>PKU</b>?",
    "a": "Low-phenylalanine diet; avoid aspartame."
  },
  {
    "q": "What accumulates in <b>Tay-Sachs</b> disease?",
    "a": "GM2 ganglioside (<b>hexosaminidase A</b> deficiency)."
  },
  {
    "q": "What is the classic presentation of <b>Tay-Sachs</b>?",
    "a": "Ashkenazi Jewish infant with cherry-red spot, developmental <b>regression</b>, seizures."
  },
  {
    "q": "What is the enzyme deficient in <b>Gaucher</b> disease?",
    "a": "<b><b>Glucocerebrosidase</b></b>."
  },
  {
    "q": "What is the enzyme deficient in <b>Niemann-Pick</b> disease?",
    "a": "<b>Sphingomyelinase</b>."
  },
  {
    "q": "What accumulates in <b>Fabry</b> disease?",
    "a": "Ceramide trihexoside (α-galactosidase A deficiency)."
  },
  {
    "q": "What is the treatment for <b>Gaucher</b> disease?",
    "a": "Enzyme replacement therapy (imiglucerase)."
  },
  {
    "q": "What is the inheritance pattern of most lysosomal storage diseases?",
    "a": "<b>Autosomal recessive</b> — except:<ul><li><b>Fabry disease</b> — X-linked (α-galactosidase A)</li><li><b>Hunter syndrome</b> — X-linked (iduronate-2-sulfatase)</li></ul>"
  },
  {
    "q": "What is the defect in <b>Hurler</b> syndrome?",
    "a": "<b>α-L-iduronidase</b> deficiency (mucopolysaccharidosis)."
  },
  {
    "q": "What is the defect in <b>Hunter</b> syndrome?",
    "a": "<b>Iduronate-2-sulfatase</b> deficiency (X-linked)."
  },
  {
    "q": "What is the major fuel source for RBCs?",
    "a": "Glucose (via anaerobic glycolysis)."
  },
  {
    "q": "What is the role of <b>2,3-BPG</b> in hemoglobin?",
    "a": "Decreases O₂ affinity → right shift of O₂ dissociation curve."
  },
  {
    "q": "What is the <b>Bohr effect</b>?",
    "a": "Increased CO₂ and H⁺ decrease hemoglobin's O₂ affinity (right shift)."
  },
  {
    "q": "What is the <b>Haldane effect</b>?",
    "a": "Deoxygenated hemoglobin binds more CO₂."
  },
  {
    "q": "What is fetal hemoglobin (<b>HbF</b>) composition?",
    "a": "<b>α₂γ₂</b> — higher O₂ affinity than adult HbA (α₂β₂)."
  },
  {
    "q": "What is the major hemoglobin in <b>sickle cell disease</b>?",
    "a": "<b>HbS</b> (β6 Glu → Val)."
  },
  {
    "q": "What triggers sickling in <b>sickle cell disease</b>?",
    "a": "Deoxygenation, acidosis, dehydration, infection."
  },
  {
    "q": "What is the treatment for sickle cell crisis?",
    "a": "Hydration, oxygen, pain control, <b>hydroxyurea</b> (increases <b>HbF</b>)."
  },
  {
    "q": "What is the most common cause of megaloblastic anemia?",
    "a": "<b>Vitamin B12 or folate deficiency</b>."
  },
  {
    "q": "What is the <b>Schilling test</b> used for?",
    "a": "Diagnosing cause of B12 deficiency (<b>pernicious anemia</b> vs malabsorption)."
  },
  {
    "q": "What is the function of <b>intrinsic factor</b>?",
    "a": "Binds B12 for absorption in terminal ileum."
  }
];
module.exports = { biochem2Cards };
