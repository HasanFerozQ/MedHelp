const geneticsRawCards = [
  {
    "q": "What are the four modes of Mendelian inheritance?",
    "a": "<b>1. Autosomal Dominant</b><br>2. <b>Autosomal Recessive</b><br>3. <b>X-linked Dominant</b><br>4. <b>X-linked Recessive</b>"
  },
  {
    "q": "Key features of Autosomal Dominant inheritance?",
    "a": "• Appears in every generation<br>• Male = Female affected<br>• 50% chance to offspring<br>• Often structural proteins or gain-of-function"
  },
  {
    "q": "Key features of Autosomal Recessive inheritance?",
    "a": "• Skips generations<br>• Often enzyme deficiencies<br>• 25% affected, 50% carriers<br>• More common in consanguinity"
  },
  {
    "q": "Key features of X-linked Recessive inheritance?",
    "a": "• More males affected<br>• No male-to-male transmission<br>• All daughters of affected male are carriers<br>• Examples: Hemophilia A/B, Duchenne MD, G6PD"
  },
  {
    "q": "Key features of X-linked Dominant inheritance?",
    "a": "• More females affected<br>• No male-to-male transmission<br>• Affected males transmit to all daughters<br>• Example: Hypophosphatemic rickets"
  },
  {
    "q": "What is incomplete penetrance? Give example.",
    "a": "Genotype present but phenotype not expressed. <b>Example:</b> Hereditary Breast-Ovarian Cancer (BRCA1/2) — not all carriers develop cancer."
  },
  {
    "q": "What is variable expressivity? Give example.",
    "a": "Different severity in individuals with same genotype. <b>Example:</b> Neurofibromatosis type 1 (NF1)."
  },
  {
    "q": "What is anticipation? In which disorders is it seen?",
    "a": "Worsening severity/earlier onset in successive generations due to trinucleotide repeat expansion.<br><b>Seen in:</b> Huntington, Myotonic dystrophy, Fragile X."
  },
  {
    "q": "What is genomic imprinting? Give examples.",
    "a": "Gene expression depends on parent of origin.<br>• <b>Prader-Willi</b>: paternal deletion (15q)<br>• <b>Angelman</b>: maternal deletion (15q)"
  },
  {
    "q": "What is uniparental disomy (UPD)?",
    "a": "Both chromosomes of a pair inherited from one parent. Can cause imprinting disorders (e.g., maternal UPD 15 → Prader-Willi)."
  },
  {
    "q": "Trisomy 21 (Down syndrome) — most common cause?",
    "a": "<b>Meiotic nondisjunction</b> (95%) — usually maternal meiosis I. Risk ↑ with advanced maternal age."
  },
  {
    "q": "Cardiac defect most common in Down syndrome?",
    "a": "<b>Atrioventricular septal defect (AVSD / endocardial cushion defect)</b>"
  },
  {
    "q": "Trisomy 18 (Edwards syndrome) — classic findings?",
    "a": "Rocker-bottom feet, clenched fists, micrognathia, low-set ears, congenital heart disease, severe ID. Most die in first year."
  },
  {
    "q": "Trisomy 13 (Patau syndrome) — classic findings?",
    "a": "Cleft lip/palate, polydactyly, holoprosencephaly, severe ID, congenital heart disease."
  },
  {
    "q": "What is the genetic cause of Fragile X syndrome?",
    "a": "<b>CGG trinucleotide repeat expansion</b> (>200 repeats) in <b>FMR1</b> gene on X chromosome → hypermethylation and silencing."
  },
  {
    "q": "Classic physical features of Fragile X syndrome?",
    "a": "Long face, large everted ears, macroorchidism (post-puberty), mitral valve prolapse, intellectual disability, autism spectrum features."
  },
  {
    "q": "What is the most common inherited cause of intellectual disability?",
    "a": "<b>Fragile X syndrome</b> (in males)."
  },
  {
    "q": "What is the genetic defect in Cystic Fibrosis?",
    "a": "<b>Autosomal recessive</b> — mutation in <b>CFTR</b> gene (most common: ΔF508) on chromosome 7."
  },
  {
    "q": "What is the most common mutation in CF and its effect?",
    "a": "<b>ΔF508</b> — misfolded protein → defective trafficking to cell membrane (Class II mutation)."
  },
  {
    "q": "What is the diagnostic test for Cystic Fibrosis?",
    "a": "<b>Sweat chloride test</b> (>60 mmol/L). Confirm with CFTR genotyping."
  },
  {
    "q": "What is the genetic defect in Phenylketonuria (PKU)?",
    "a": "<b>Autosomal recessive</b> — deficiency of <b>phenylalanine hydroxylase</b> (PAH) or tetrahydrobiopterin (BH4) cofactor."
  },
  {
    "q": "Classic untreated presentation of PKU?",
    "a": "Musty body odor, fair skin/hair, eczema, intellectual disability, seizures. Musty odor from phenylacetic acid."
  },
  {
    "q": "Treatment of classic PKU?",
    "a": "Phenylalanine-restricted diet + tyrosine supplementation. Avoid aspartame."
  },
  {
    "q": "What is the genetic defect in Tay-Sachs disease?",
    "a": "<b>Autosomal recessive</b> — deficiency of <b>β-hexosaminidase A</b> → GM2 ganglioside accumulation."
  },
  {
    "q": "Classic findings in Tay-Sachs?",
    "a": "Cherry-red spot on macula, progressive neurodegeneration, developmental regression, death by age 4–5. Common in Ashkenazi Jews."
  },
  {
    "q": "What is the genetic defect in Gaucher disease (most common lysosomal storage disease)?",
    "a": "<b>Autosomal recessive</b> — deficiency of <b>glucocerebrosidase</b>."
  },
  {
    "q": "What is the genetic defect in Huntington disease?",
    "a": "<b>Autosomal dominant</b> — CAG trinucleotide repeat expansion in <b>Huntingtin (HTT)</b> gene on chromosome 4."
  },
  {
    "q": "What is the genetic defect in Myotonic dystrophy type 1?",
    "a": "<b>CTG repeat expansion</b> in <b>DMPK</b> gene on chromosome 19 (autosomal dominant)."
  },
  {
    "q": "What is the genetic cause of Prader-Willi syndrome?",
    "a": "Lack of paternally expressed genes on chromosome 15q11-13 (deletion of paternal copy or maternal UPD)."
  },
  {
    "q": "Classic features of Prader-Willi syndrome?",
    "a": "Hypotonia & poor feeding in infancy → hyperphagia & obesity in childhood, short stature, hypogonadism, mild-moderate ID."
  },
  {
    "q": "Classic features of Angelman syndrome?",
    "a": "“Happy puppet” — severe ID, inappropriate laughter, ataxia, seizures, absent speech."
  },
  {
    "q": "What is the genetic defect in Duchenne Muscular Dystrophy?",
    "a": "<b>X-linked recessive</b> — frameshift mutation/deletion in <b>Dystrophin</b> gene (Xp21)."
  },
  {
    "q": "What is Gower sign?",
    "a": "Patient uses hands to “walk up” their legs when rising from floor — classic in Duchenne MD."
  },
  {
    "q": "What is the genetic defect in Marfan syndrome?",
    "a": "<b>Autosomal dominant</b> — mutation in <b>FBN1</b> gene (fibrillin-1) on chromosome 15."
  },
  {
    "q": "Classic cardiovascular complication in Marfan syndrome?",
    "a": "<b>Aortic root dilation</b> → aneurysm and dissection (leading cause of death)."
  },
  {
    "q": "What is the genetic defect in Familial Hypercholesterolemia?",
    "a": "<b>Autosomal dominant</b> — mutation in <b>LDL receptor</b> gene (most common)."
  },
  {
    "q": "What is the genetic defect in Hemochromatosis (classic form)?",
    "a": "<b>Autosomal recessive</b> — HFE gene mutation (C282Y) on chromosome 6 → increased intestinal iron absorption."
  },
  {
    "q": "What is Hardy-Weinberg equilibrium?",
    "a": "p² + 2pq + q² = 1 (allele frequencies remain constant in a population without evolutionary forces)."
  },
  {
    "q": "What are the assumptions for Hardy-Weinberg equilibrium?",
    "a": "No mutation, no selection, no migration, random mating, large population size."
  },
  {
    "q": "What is linkage disequilibrium?",
    "a": "Non-random association of alleles at different loci (occurs when loci are close on same chromosome)."
  },
  {
    "q": "What is a missense mutation?",
    "a": "Single nucleotide change that results in a different amino acid (e.g., sickle cell: Glu → Val)."
  },
  {
    "q": "What is a nonsense mutation?",
    "a": "Point mutation that creates a premature stop codon → truncated protein."
  },
  {
    "q": "What is a frameshift mutation?",
    "a": "Insertion or deletion of nucleotides not divisible by 3 → altered reading frame, usually nonfunctional protein."
  },
  {
    "q": "What is a silent mutation?",
    "a": "Nucleotide change that does not change the amino acid (due to degeneracy of genetic code)."
  },
  {
    "q": "What is a trinucleotide repeat disorder with anticipation in males?",
    "a": "<b>Fragile X syndrome</b> (CGG repeats) — Sherman paradox (more severe when transmitted by mother)."
  },
  {
    "q": "What is Lyonization (X-inactivation)?",
    "a": "Random inactivation of one X chromosome in females → Barr body. Explains variable expression in female carriers of X-linked disorders."
  },
  {
    "q": "What is mitochondrial inheritance pattern?",
    "a": "Maternal inheritance. All offspring of affected mother can be affected; no male-to-offspring transmission. Example: Leber Hereditary Optic Neuropathy (LHON)."
  },
  {
    "q": "What is a Robertsonian translocation?",
    "a": "Fusion of two acrocentric chromosomes (13,14,15,21,22) at centromere. Carrier has 45 chromosomes but is phenotypically normal. Increased risk of unbalanced offspring (e.g., translocation Down syndrome)."
  },
  {
    "q": "Most common chromosomal cause of spontaneous abortion?",
    "a": "<b>Trisomy 16</b> (most common), followed by other trisomies and monosomy X."
  },
  {
    "q": "What is the genetic mechanism of Cri-du-chat syndrome?",
    "a": "Deletion of short arm of chromosome 5 (5p-)."
  },
  {
    "q": "Classic cry in Cri-du-chat syndrome?",
    "a": "High-pitched, cat-like cry."
  },
  {
    "q": "What is the most common inherited cause of mental retardation in males?",
    "a": "<b>Fragile X syndrome</b>"
  },
  {
    "q": "What is the second most common cause of genetic intellectual disability after Down syndrome?",
    "a": "<b>Fragile X syndrome</b>"
  },
  {
    "q": "What is the genetic basis of Beckwith-Wiedemann syndrome?",
    "a": "Imprinting defect at chromosome <b>11p15</b> (paternal overexpression of IGF2)"
  },
  {
    "q": "Classic features of Beckwith-Wiedemann syndrome?",
    "a": "Macrosomia, macroglossia, omphalocele, hemihypertrophy, Wilms tumor risk"
  },
  {
    "q": "What is the genetic mechanism of Wolf-Hirschhorn syndrome?",
    "a": "Deletion of short arm of chromosome <b>4p</b>"
  },
  {
    "q": "What is the genetic mechanism of DiGeorge syndrome (22q11.2 deletion)?",
    "a": "Microdeletion at <b>22q11.2</b> (TBX1 gene)"
  },
  {
    "q": "CATCH-22 mnemonic for 22q11.2 deletion syndrome?",
    "a": "<b>C</b>ardiac defects, <b>A</b>bnormal facies, <b>T</b>hymic hypoplasia, <b>C</b>left palate, <b>H</b>ypocalcemia (22q11)"
  },
  {
    "q": "What is the most common microdeletion syndrome?",
    "a": "<b>22q11.2 deletion syndrome</b> (DiGeorge / Velocardiofacial)"
  },
  {
    "q": "What is the karyotype in Klinefelter syndrome?",
    "a": "<b>47,XXY</b>"
  },
  {
    "q": "Classic presentation of Klinefelter syndrome?",
    "a": "Tall male, gynecomastia, small firm testes, azoospermia, infertility, mild intellectual disability"
  },
  {
    "q": "What is the karyotype in Turner syndrome?",
    "a": "<b>45,XO</b> (most common)"
  },
  {
    "q": "Classic features of Turner syndrome?",
    "a": "Short stature, webbed neck, widely spaced nipples, coarctation of aorta, streak ovaries, primary amenorrhea"
  },
  {
    "q": "What is the genetic defect in Triple X syndrome?",
    "a": "<b>47,XXX</b>"
  },
  {
    "q": "What is the genetic defect in XYY syndrome?",
    "a": "<b>47,XYY</b> — tall stature, acne, normal fertility, possible behavioral issues"
  },
  {
    "q": "What is a balanced translocation carrier?",
    "a": "Phenotypically normal but increased risk of unbalanced gametes and offspring with chromosomal abnormalities"
  },
  {
    "q": "What is the most common Robertsonian translocation?",
    "a": "t(14;21)"
  },
  {
    "q": "What is the risk of Down syndrome in a carrier of t(14;21) Robertsonian translocation?",
    "a": "Approximately <b>10–15%</b> (higher if maternal carrier)"
  },
  {
    "q": "What is a contiguous gene syndrome?",
    "a": "Phenotype caused by deletion or duplication of multiple adjacent genes (e.g., DiGeorge, Williams syndrome)"
  },
  {
    "q": "What is Williams syndrome genetic cause?",
    "a": "Microdeletion at <b>7q11.23</b> (includes elastin gene)"
  },
  {
    "q": "Classic features of Williams syndrome?",
    "a": "Elfin facies, supravalvular aortic stenosis, hypercalcemia, cocktail party personality, intellectual disability"
  },
  {
    "q": "What is the genetic test of choice for diagnosing microdeletion syndromes?",
    "a": "<b>FISH</b> (Fluorescence In Situ Hybridization) or <b>Chromosomal Microarray (CMA)</b>"
  },
  {
    "q": "What is chromosomal microarray (CMA) best used for?",
    "a": "Detection of copy number variants (deletions/duplications) not visible on standard karyotype"
  },
  {
    "q": "What is the difference between karyotyping and FISH?",
    "a": "Karyotype: detects large chromosomal abnormalities (>5 Mb). FISH: detects specific smaller deletions/duplications using fluorescent probes"
  },
  {
    "q": "What is PCR used for in genetics?",
    "a": "Amplification of specific DNA segments (e.g., for trinucleotide repeat disorders, cystic fibrosis genotyping)"
  },
  {
    "q": "What is Southern blot used for?",
    "a": "Detection of large DNA fragments, trinucleotide repeats (e.g., Fragile X, Myotonic dystrophy)"
  },
  {
    "q": "What is the principle of Sanger sequencing?",
    "a": "Chain-termination method using dideoxynucleotides (ddNTPs)"
  },
  {
    "q": "What is next-generation sequencing (NGS) primarily used for?",
    "a": "Whole exome or whole genome sequencing — high throughput, identifies point mutations and small indels"
  },
  {
    "q": "What is a loss-of-function mutation?",
    "a": "Mutation that leads to reduced or absent protein function (usually recessive)"
  },
  {
    "q": "What is a gain-of-function mutation?",
    "a": "Mutation that gives the protein new or enhanced activity (often dominant)"
  },
  {
    "q": "What are oncogenes?",
    "a": "Mutated proto-oncogenes that promote cell proliferation (gain-of-function). Need only one mutated copy (dominant)"
  },
  {
    "q": "What are tumor suppressor genes?",
    "a": "Genes that inhibit cell proliferation. Both copies must be inactivated (Knudson’s two-hit hypothesis)"
  },
  {
    "q": "Give examples of proto-oncogenes turned oncogenes.",
    "a": "<b>ras</b> (pancreatic, colon cancer), <b>myc</b> (Burkitt lymphoma), <b>HER2/neu</b> (breast cancer)"
  },
  {
    "q": "Give examples of tumor suppressor genes.",
    "a": "<b>RB1</b> (retinoblastoma), <b>TP53</b> (Li-Fraumeni), <b>APC</b> (FAP), <b>BRCA1/2</b>"
  },
  {
    "q": "What is Li-Fraumeni syndrome?",
    "a": "<b>Autosomal dominant</b> germline <b>TP53</b> mutation → multiple cancers at young age (sarcomas, breast, brain, leukemia)"
  },
  {
    "q": "What is the inheritance and defect in Familial Adenomatous Polyposis (FAP)?",
    "a": "<b>Autosomal dominant</b> — mutation in <b>APC</b> tumor suppressor gene on chromosome 5q"
  },
  {
    "q": "What is the inheritance of Hereditary Nonpolyposis Colorectal Cancer (HNPCC / Lynch syndrome)?",
    "a": "<b>Autosomal dominant</b> — defect in DNA mismatch repair genes (MSH2, MLH1, etc.)"
  },
  {
    "q": "What cancers are increased in Lynch syndrome?",
    "a": "Colorectal, endometrial, ovarian, gastric, urothelial"
  },
  {
    "q": "What is microsatellite instability (MSI)?",
    "a": "Seen in tumors with defective mismatch repair (Lynch syndrome)"
  },
  {
    "q": "What is the genetic defect in Neurofibromatosis type 1 (von Recklinghausen)?",
    "a": "<b>Autosomal dominant</b> — mutation in <b>NF1</b> gene (tumor suppressor) on chromosome 17"
  },
  {
    "q": "Diagnostic criteria for NF1 (need 2 or more)?",
    "a": "≥6 café-au-lait spots, ≥2 neurofibromas, axillary/inguinal freckling, optic glioma, Lisch nodules, bony lesion, first-degree relative"
  },
  {
    "q": "What is the genetic defect in NF2?",
    "a": "Mutation in <b>NF2</b> (merlin) gene on chromosome 22 → bilateral acoustic schwannomas, meningiomas"
  },
  {
    "q": "What is pharmacogenetics?",
    "a": "Study of how genetic variations affect drug response (e.g., CYP450 polymorphisms)"
  },
  {
    "q": "What is the clinical significance of CYP2D6 poor metabolizer?",
    "a": "Increased risk of toxicity with codeine, tamoxifen, antidepressants (cannot convert to active form or clear drug)"
  },
  {
    "q": "What is G6PD deficiency inheritance and trigger?",
    "a": "<b>X-linked recessive</b>. Triggers: fava beans, primaquine, sulfa drugs, infections → hemolytic anemia"
  },
  {
    "q": "What is the genetic basis of Warfarin sensitivity?",
    "a": "Polymorphisms in <b>VKORC1</b> and <b>CYP2C9</b> genes → lower dose requirement"
  },
  {
    "q": "What is multifactorial inheritance?",
    "a": "Interaction of multiple genes + environment. Examples: Neural tube defects, diabetes type 2, hypertension, schizophrenia"
  },
  {
    "q": "What is the recurrence risk pattern in multifactorial diseases?",
    "a": "Higher if more relatives affected, more severe in proband, or proband is of the less commonly affected sex"
  },
  {
    "q": "What is the genetic defect in Wilson disease?",
    "a": "<b>Autosomal recessive</b> — mutation in <b>ATP7B</b> gene (copper transport) on chromosome 13"
  },
  {
    "q": "What is the genetic defect in Alpha-1 antitrypsin deficiency?",
    "a": "<b>Autosomal recessive</b> — mutation in <b>SERPINA1</b> gene on chromosome 14 (PiZZ genotype worst)"
  },
  {
    "q": "What is the genetic defect in hereditary spherocytosis?",
    "a": "Mutations in genes encoding red cell membrane proteins (ankyrin, spectrin, band 3)"
  },
  {
    "q": "What is the genetic defect in Gilbert syndrome?",
    "a": "Mild deficiency of <b>UGT1A1</b> (glucuronyl transferase) → unconjugated hyperbilirubinemia, benign"
  },
  {
    "q": "What is the genetic defect in Crigler-Najjar syndrome Type 1?",
    "a": "Complete absence of <b>UGT1A1</b> → severe unconjugated hyperbilirubinemia, kernicterus risk"
  },
  {
    "q": "What is heteroplasmy in mitochondrial diseases?",
    "a": "Mixture of normal and mutant mtDNA within a cell. Explains variable expression"
  },
  {
    "q": "What is the threshold effect in mitochondrial inheritance?",
    "a": "Disease manifests only when mutant mtDNA exceeds a certain percentage in tissues"
  },
  {
    "q": "Give examples of mitochondrial diseases.",
    "a": "Leber Hereditary Optic Neuropathy (LHON), MELAS, MERRF, Kearns-Sayre syndrome"
  },
  {
    "q": "What is the genetic mechanism of Prader-Willi vs Angelman (summary)?",
    "a": "Prader-Willi: loss of paternal 15q11-13 genes<br>Angelman: loss of maternal UBE3A gene at 15q11-13"
  },
  {
    "q": "What is the inheritance and defect in Hereditary Spherocytosis?",
    "a": "Usually <b>autosomal dominant</b> — mutations in ankyrin, spectrin, or band 3. Osmotic fragility test positive."
  },
  {
    "q": "What is the inheritance of Familial Hypercholesterolemia?",
    "a": "<b>Autosomal dominant</b> — LDL receptor mutation (most common)."
  },
  {
    "q": "What is the inheritance and defect in Hemochromatosis (classic)?",
    "a": "<b>Autosomal recessive</b> — HFE gene (C282Y) mutation on chromosome 6."
  },
  {
    "q": "What is the inheritance of Wilson disease?",
    "a": "<b>Autosomal recessive</b> — ATP7B gene mutation (copper transporter)."
  },
  {
    "q": "What is the inheritance of Alpha-1 antitrypsin deficiency?",
    "a": "<b>Autosomal recessive</b> — SERPINA1 gene (PiZZ genotype most severe)."
  },
  {
    "q": "What is the inheritance of Gilbert syndrome?",
    "a": "Autosomal recessive (mild) or dominant — reduced UGT1A1 activity."
  },
  {
    "q": "What is the inheritance of Crigler-Najjar Type 1?",
    "a": "<b>Autosomal recessive</b> — complete UGT1A1 deficiency."
  },
  {
    "q": "What is the inheritance of Lesch-Nyhan syndrome?",
    "a": "<b>X-linked recessive</b> — HGPRT deficiency → hyperuricemia, self-mutilation, gout."
  },
  {
    "q": "What is the inheritance of Fabry disease?",
    "a": "<b>X-linked recessive</b> — α-galactosidase A deficiency → angiokeratomas, acroparesthesias, renal failure."
  },
  {
    "q": "What is the inheritance of Hunter syndrome (MPS II)?",
    "a": "<b>X-linked recessive</b> — iduronate-2-sulfatase deficiency (milder than Hurler)."
  },
  {
    "q": "What is the inheritance of Hurler syndrome (MPS I)?",
    "a": "<b>Autosomal recessive</b> — α-L-iduronidase deficiency."
  },
  {
    "q": "What is the inheritance of Pompe disease?",
    "a": "<b>Autosomal recessive</b> — acid α-glucosidase deficiency → cardiomegaly, hypotonia."
  },
  {
    "q": "What is the inheritance of McArdle disease?",
    "a": "<b>Autosomal recessive</b> — muscle glycogen phosphorylase deficiency (Type V GSD)."
  },
  {
    "q": "What is the inheritance of Von Gierke disease?",
    "a": "<b>Autosomal recessive</b> — glucose-6-phosphatase deficiency (Type I GSD)."
  },
  {
    "q": "What is the inheritance of Galactosemia (classic)?",
    "a": "<b>Autosomal recessive</b> — galactose-1-phosphate uridyltransferase deficiency."
  },
  {
    "q": "What is the inheritance of Hereditary Fructose Intolerance?",
    "a": "<b>Autosomal recessive</b> — aldolase B deficiency."
  },
  {
    "q": "What is Hardy-Weinberg equation for allele frequencies?",
    "a": "p + q = 1<br>p² + 2pq + q² = 1 (p = dominant allele frequency, q = recessive)"
  },
  {
    "q": "How do you calculate carrier frequency for autosomal recessive disease?",
    "a": "If disease incidence = q², then carrier frequency ≈ 2pq (≈ 2q if q is small)."
  },
  {
    "q": "What does a high inbreeding coefficient (F) increase?",
    "a": "Homozygosity for rare recessive alleles → higher incidence of autosomal recessive diseases."
  },
  {
    "q": "What is founder effect?",
    "a": "High frequency of a rare allele in a population descended from a small number of ancestors (e.g., Tay-Sachs in Ashkenazi Jews)."
  },
  {
    "q": "What is genetic drift?",
    "a": "Random change in allele frequencies, more pronounced in small populations."
  },
  {
    "q": "What is the bottleneck effect?",
    "a": "Sharp reduction in population size → loss of genetic variation (e.g., cheetahs)."
  },
  {
    "q": "What is the difference between penetrance and expressivity?",
    "a": "Penetrance: % of genotype carriers who show phenotype.<br>Expressivity: degree/severity of phenotype in those who express it."
  },
  {
    "q": "What is pleiotropy?",
    "a": "One gene influences multiple seemingly unrelated phenotypic traits (e.g., PKU, Marfan)."
  },
  {
    "q": "What is locus heterogeneity?",
    "a": "Same phenotype caused by mutations in different genes (e.g., retinitis pigmentosa)."
  },
  {
    "q": "What is allelic heterogeneity?",
    "a": "Different mutations in the same gene cause the same phenotype (e.g., CFTR mutations in cystic fibrosis)."
  },
  {
    "q": "What is anticipation and in which disorders is it prominent?",
    "a": "Increasing severity/earlier onset in successive generations due to trinucleotide repeat expansion. Seen in Huntington, Myotonic dystrophy, Fragile X."
  },
  {
    "q": "What is a dominant negative mutation?",
    "a": "Mutant protein interferes with the function of the wild-type protein (e.g., osteogenesis imperfecta)."
  },
  {
    "q": "What is haploinsufficiency?",
    "a": "Loss of one functional copy of a gene is not enough for normal function (often causes dominant disorders)."
  },
  {
    "q": "What is the two-hit hypothesis (Knudson)?",
    "a": "Both alleles of a tumor suppressor gene must be inactivated for tumor formation (retinoblastoma, Wilms tumor)."
  },
  {
    "q": "What is the genetic defect in Retinoblastoma?",
    "a": "Mutation in <b>RB1</b> tumor suppressor gene on chromosome 13q."
  },
  {
    "q": "What is the inheritance of Retinoblastoma (familial form)?",
    "a": "<b>Autosomal dominant</b> with incomplete penetrance."
  },
  {
    "q": "What cancers are increased in Li-Fraumeni syndrome?",
    "a": "Sarcomas, breast cancer, brain tumors, leukemia, adrenocortical carcinoma (TP53 mutation)."
  },
  {
    "q": "What is the inheritance of Xeroderma Pigmentosum?",
    "a": "<b>Autosomal recessive</b> — defective nucleotide excision repair → extreme UV sensitivity and skin cancers."
  },
  {
    "q": "What is the inheritance of Ataxia-Telangiectasia?",
    "a": "<b>Autosomal recessive</b> — ATM gene (DNA repair) defect."
  },
  {
    "q": "What is Bloom syndrome?",
    "a": "<b>Autosomal recessive</b> — BLM gene (DNA helicase) → photosensitivity, short stature, increased cancer risk."
  },
  {
    "q": "What is Fanconi anemia?",
    "a": "<b>Autosomal recessive</b> (mostly) — defective DNA cross-link repair → pancytopenia, thumb/radius abnormalities, increased cancer risk."
  },
  {
    "q": "What is the genetic defect in Sickle Cell Disease?",
    "a": "Point mutation in β-globin gene (Glu6Val) — HbS."
  },
  {
    "q": "What is the genetic defect in β-Thalassemia major?",
    "a": "Mutations in β-globin gene → reduced or absent β-chain synthesis."
  },
  {
    "q": "What is the genetic defect in α-Thalassemia (Hb Bart’s hydrops fetalis)?",
    "a": "Deletion of all four α-globin genes (—/—)."
  },
  {
    "q": "What is the genetic defect in Hemophilia A?",
    "a": "<b>X-linked recessive</b> — Factor VIII deficiency."
  },
  {
    "q": "What is the genetic defect in Hemophilia B?",
    "a": "<b>X-linked recessive</b> — Factor IX deficiency."
  },
  {
    "q": "What is the genetic defect in von Willebrand Disease (most common type)?",
    "a": "Autosomal dominant (usually) — quantitative or qualitative defect in vWF."
  },
  {
    "q": "What is the genetic basis of ABO blood groups?",
    "a": "Multiple alleles at a single locus on chromosome 9 (IA, IB, i)."
  },
  {
    "q": "What is the Rh blood group inheritance?",
    "a": "Autosomal dominant expression of D antigen."
  },
  {
    "q": "What is erythroblastosis fetalis (hemolytic disease of newborn)?",
    "a": "Rh-negative mother sensitized to Rh-positive fetus → anti-D IgG crosses placenta."
  },
  {
    "q": "What is the genetic defect in Chronic Granulomatous Disease?",
    "a": "Most commonly X-linked — NADPH oxidase defect (CYBB gene)."
  },
  {
    "q": "What is the genetic defect in Bruton agammaglobulinemia?",
    "a": "<b>X-linked recessive</b> — BTK (Bruton tyrosine kinase) mutation."
  },
  {
    "q": "What is the genetic defect in Wiskott-Aldrich syndrome?",
    "a": "<b>X-linked recessive</b> — WASP gene mutation."
  },
  {
    "q": "What is the genetic defect in Severe Combined Immunodeficiency (X-linked form)?",
    "a": "Mutation in common γ-chain of IL-2 receptor (IL2RG)."
  },
  {
    "q": "What is the genetic defect in ADA deficiency?",
    "a": "<b>Autosomal recessive</b> — adenosine deaminase deficiency (a cause of SCID)."
  },
  {
    "q": "What HLA allele is strongly associated with Celiac disease?",
    "a": "<b>HLA-DQ2 and DQ8</b>"
  },
  {
    "q": "What HLA allele is strongly associated with Ankylosing Spondylitis?",
    "a": "<b>HLA-B27</b>"
  },
  {
    "q": "What HLA alleles are associated with Type 1 Diabetes Mellitus?",
    "a": "<b>HLA-DR3 and DR4</b>"
  },
  {
    "q": "What is the genetic mechanism of imprinting in Prader-Willi syndrome?",
    "a": "Loss of paternally expressed genes at 15q11-13."
  },
  {
    "q": "What gene is silenced in Angelman syndrome?",
    "a": "<b>UBE3A</b> (maternally expressed in brain)."
  },
  {
    "q": "What is DNA methylation’s role in epigenetics?",
    "a": "Usually silences gene expression (CpG islands in promoters)."
  },
  {
    "q": "What is histone acetylation’s effect on gene expression?",
    "a": "Promotes transcription (loosens chromatin structure)."
  },
  {
    "q": "What is the most common genetic cause of congenital bilateral absence of vas deferens?",
    "a": "<b>Cystic fibrosis (CFTR mutations)</b>"
  },
  {
    "q": "What is the genetic defect in Kartagener syndrome?",
    "a": "Autosomal recessive — defective dynein arms → primary ciliary dyskinesia, situs inversus, bronchiectasis, infertility."
  },
  {
    "q": "What is the genetic defect in Polycystic Kidney Disease (adult form)?",
    "a": "<b>Autosomal dominant</b> — PKD1 (chromosome 16) or PKD2 (chromosome 4)."
  },
  {
    "q": "What is the genetic defect in Tuberous Sclerosis?",
    "a": "<b>Autosomal dominant</b> — TSC1 (hamartin) or TSC2 (tuberin)."
  },
  {
    "q": "What is the genetic defect in Sturge-Weber syndrome?",
    "a": "Somatic mutation in <b>GNAQ</b> gene."
  },
  {
    "q": "What is the genetic defect in Neurofibromatosis type 2?",
    "a": "Mutation in <b>NF2</b> (merlin) gene on chromosome 22."
  },
  {
    "q": "What is pharmacogenomic testing for before starting abacavir?",
    "a": "HLA-B*5701 allele (risk of hypersensitivity reaction)."
  },
  {
    "q": "What enzyme deficiency causes malignant hyperthermia susceptibility?",
    "a": "Usually ryanodine receptor (RYR1) mutation (autosomal dominant)."
  },
  {
    "q": "What is the genetic basis of Long QT syndrome (most common form)?",
    "a": "Autosomal dominant — mutations in potassium channel genes (KCNQ1, KCNH2)."
  },
  {
    "q": "What is the genetic defect in Brugada syndrome?",
    "a": "Usually loss-of-function mutation in sodium channel (SCN5A)."
  },
  {
    "q": "What is the recurrence risk for neural tube defects in subsequent pregnancies?",
    "a": "2–5% (higher if previous affected child). Prevent with high-dose folic acid."
  },
  {
    "q": "What is the most common genetic cause of sensorineural hearing loss?",
    "a": "Mutation in <b>GJB2</b> (connexin 26) gene."
  },
  {
    "q": "What is the genetic defect in Osteogenesis Imperfecta (most common form)?",
    "a": "<b>Autosomal dominant</b> — mutations in type I collagen genes (COL1A1 or COL1A2)."
  },
  {
    "q": "What is the genetic defect in Achondroplasia?",
    "a": "<b>Autosomal dominant</b> — gain-of-function mutation in FGFR3."
  },
  {
    "q": "What is the genetic defect in Ehlers-Danlos syndrome (classical type)?",
    "a": "Mutations in type V collagen genes."
  },
  {
    "q": "What is the genetic defect in Homocystinuria (classic form)?",
    "a": "<b>Autosomal recessive</b> — cystathionine β-synthase deficiency."
  },
  {
    "q": "What is the genetic defect in Alkaptonuria?",
    "a": "<b>Autosomal recessive</b> — homogentisate 1,2-dioxygenase deficiency (ochronosis)."
  },
  {
    "q": "What is the genetic defect in Maple Syrup Urine Disease?",
    "a": "<b>Autosomal recessive</b> — branched-chain α-ketoacid dehydrogenase deficiency."
  },
  {
    "q": "What is the genetic defect in Ornithine Transcarbamylase Deficiency?",
    "a": "<b>X-linked recessive</b> — most common urea cycle disorder."
  },
  {
    "q": "What is the inheritance of Mitochondrial Encephalomyopathy, Lactic Acidosis, and Stroke-like episodes (MELAS)?",
    "a": "Maternal (mitochondrial) inheritance — MT-TL1 mutation."
  },
  {
    "q": "What is the inheritance of Myoclonic Epilepsy with Ragged Red Fibers (MERRF)?",
    "a": "Maternal inheritance — MT-TK mutation."
  },
  {
    "q": "What is heteroplasmy?",
    "a": "Presence of both normal and mutant mtDNA in a cell/tissue → variable phenotypic expression in mitochondrial diseases."
  },
  {
    "q": "What is the threshold effect in mitochondrial disorders?",
    "a": "Disease manifests only when the proportion of mutant mtDNA exceeds a tissue-specific threshold."
  }
];
module.exports = { geneticsRawCards };
