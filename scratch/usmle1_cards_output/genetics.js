const geneticsCards = [
  {
    "q": "What are the four modes of Mendelian inheritance?",
    "a": "<ul><li><b>1. Autosomal Dominant</b></li><li>2. <b>Autosomal Recessive</b></li><li>3. <b>X-linked Dominant</b></li><li>4. <b>X-linked Recessive</b></li></ul>"
  },
  {
    "q": "Key features of <b>Autosomal Dominant</b> inheritance?",
    "a": "<ul><li>• Appears in every generation</li><li>• Male = Female affected</li><li>• 50% chance to offspring</li><li>• Often structural proteins or gain-of-function</li></ul>"
  },
  {
    "q": "Key features of <b>Autosomal Recessive</b> inheritance?",
    "a": "<ul><li>• Skips generations</li><li>• Often enzyme deficiencies</li><li>• 25% affected, 50% carriers</li><li>• More common in consanguinity</li></ul>"
  },
  {
    "q": "Key features of <b>X-linked Recessive</b> inheritance?",
    "a": "<ul><li>• More males affected</li><li>• No male-to-male transmission</li><li>• All daughters of affected male are carriers</li><li>• Examples: Hemophilia A/B, Duchenne MD, G6PD</li></ul>"
  },
  {
    "q": "Key features of <b>X-linked Dominant</b> inheritance?",
    "a": "<ul><li>• More females affected</li><li>• No male-to-male transmission</li><li>• Affected males transmit to all daughters</li><li>• Example: Hypophosphatemic rickets</li></ul>"
  },
  {
    "q": "What is <b>incomplete <b>penetrance</b></b>? Give example.",
    "a": "Genotype present but phenotype not expressed. <b>Example:</b> Hereditary Breast-Ovarian Cancer (<b>BRCA1</b>/2) — not <b>all</b> carriers develop cancer."
  },
  {
    "q": "What is <b>variable <b>expressivity</b></b>? Give example.",
    "a": "Different severity in individuals with same genotype. <b>Example:</b> <b>Neurofibromatosis type 1</b> (<b>NF1</b>)."
  },
  {
    "q": "What is <b>anticipation</b>? In which disorders is it seen?",
    "a": "<ul><li>Worsening severity/earlier onset in successive generations due to trinucleotide repeat expansion.</li><li><b>Seen in:</b> Huntington, Myotonic dystrophy, Fragile X.</li></ul>"
  },
  {
    "q": "What is <b>genomic imprinting</b>? Give examples.",
    "a": "<ul><li>Gene expression depends on parent of origin.</li><li>• <b>Prader-Willi</b>: paternal deletion (15q)</li><li>• <b>Angelman</b>: maternal deletion (15q)</li></ul>"
  },
  {
    "q": "What is <b>uniparental disomy</b> (<b>UPD</b>)?",
    "a": "Both chromosomes of a pair inherited from one parent. Can cause imprinting disorders (e.g., maternal <b>UPD</b> 15 → <b>Prader-Willi</b>)."
  },
  {
    "q": "Trisomy 21 (<b>Down syndrome</b>) — most common cause?",
    "a": "<b>Meiotic nondisjunction</b> (95%) — usually maternal meiosis I. Risk ↑ with advanced maternal age."
  },
  {
    "q": "Cardiac defect most common in <b>Down syndrome</b>?",
    "a": "<b>Atrioventricular septal defect (<b>AVSD</b> / <b>endocardial cushion defect</b>)</b>"
  },
  {
    "q": "Trisomy 18 (<b>Edwards syndrome</b>) — classic findings?",
    "a": "Rocker-bottom feet, clenched fists, micrognathia, low-set ears, congenital heart disease, severe ID. Most die in first year."
  },
  {
    "q": "Trisomy 13 (<b>Patau syndrome</b>) — classic findings?",
    "a": "Cleft lip/palate, polydactyly, holoprosencephaly, severe ID, congenital heart disease."
  },
  {
    "q": "What is the genetic cause of <b>Fragile X</b> syndrome?",
    "a": "<b>CGG trinucleotide repeat expansion</b> (&gt;200 repeats) in <b>FMR1</b> gene on X chromosome → hypermethylation and silencing."
  },
  {
    "q": "Classic physical features of <b>Fragile X</b> syndrome?",
    "a": "Long face, large everted ears, <b>macroorchidism</b> (post-puberty), mitral valve prolapse, intellectual disability, autism spectrum features."
  },
  {
    "q": "What is the most common inherited cause of intellectual disability?",
    "a": "<b><b>Fragile X</b> syndrome</b> (in males)."
  },
  {
    "q": "What is the genetic defect in <b>Cystic Fibrosis</b>?",
    "a": "<b>Autosomal recessive</b> — mutation in <b>CFTR</b> gene (most common: ΔF508) on chromosome 7."
  },
  {
    "q": "What is the most common mutation in CF and its effect?",
    "a": "<b>ΔF508</b> — misfolded protein → defective trafficking to cell membrane (Class II mutation)."
  },
  {
    "q": "What is the diagnostic test for <b>Cystic Fibrosis</b>?",
    "a": "<b>Sweat chloride test</b> (&gt;60 mmol/L). Confirm with <b>CFTR</b> genotyping."
  },
  {
    "q": "What is the genetic defect in <b>Phenylketonuria</b> (<b>PKU</b>)?",
    "a": "<b>Autosomal recessive</b> — deficiency of <b>phenylalanine hydroxylase</b> (<b>PAH</b>) or tetrahydrobiopterin (BH4) cofactor."
  },
  {
    "q": "Classic untreated presentation of <b>PKU</b>?",
    "a": "Musty body odor, fair skin/hair, eczema, intellectual disability, seizures. Musty odor from phenylacetic acid."
  },
  {
    "q": "Treatment of classic <b>PKU</b>?",
    "a": "Phenylalanine-restricted diet + tyrosine supplementation. Avoid aspartame."
  },
  {
    "q": "What is the genetic defect in <b>Tay-Sachs</b> disease?",
    "a": "<b>Autosomal recessive</b> — deficiency of <b>β-<b>hexosaminidase A</b></b> → GM2 ganglioside accumulation."
  },
  {
    "q": "Classic findings in <b>Tay-Sachs</b>?",
    "a": "Cherry-red spot on macula, progressive neurodegeneration, developmental <b>regression</b>, death by age 4–5. Common in Ashkenazi Jews."
  },
  {
    "q": "What is the genetic defect in <b>Gaucher</b> disease (most common lysosomal storage disease)?",
    "a": "<b>Autosomal recessive</b> — deficiency of <b><b>glucocerebrosidase</b></b>."
  },
  {
    "q": "What is the genetic defect in <b>Huntington</b> disease?",
    "a": "<b>Autosomal dominant</b> — CAG trinucleotide repeat expansion in <b>Huntingtin (<b>HTT</b>)</b> gene on chromosome 4."
  },
  {
    "q": "What is the genetic defect in <b>Myotonic dystrophy</b> type 1?",
    "a": "<b>CTG repeat expansion</b> in <b>DMPK</b> gene on chromosome 19 (<b>autosomal dominant</b>)."
  },
  {
    "q": "What is the genetic cause of <b>Prader-Willi</b> syndrome?",
    "a": "Lack of paternally expressed genes on chromosome 15q11-13 (deletion of paternal copy or maternal <b>UPD</b>)."
  },
  {
    "q": "Classic features of <b>Prader-Willi</b> syndrome?",
    "a": "Hypotonia & poor feeding in infancy → hyperphagia & obesity in childhood, short stature, hypogonadism, mild-moderate ID."
  },
  {
    "q": "Classic features of <b>Angelman</b> syndrome?",
    "a": "<b>“Happy puppet”</b> — severe ID, inappropriate laughter, ataxia, seizures, absent speech."
  },
  {
    "q": "What is the genetic defect in <b>Duchenne Muscular Dystrophy</b>?",
    "a": "<b>X-linked recessive</b> — <b>frameshift mutation</b>/deletion in <b>Dystrophin</b> gene (Xp21)."
  },
  {
    "q": "What is <b>Gower sign</b>?",
    "a": "<b>Patient uses hands to “walk up” their legs when rising from floor</b> — classic in Duchenne MD."
  },
  {
    "q": "What is the genetic defect in <b>Marfan</b> syndrome?",
    "a": "<b>Autosomal dominant</b> — mutation in <b>FBN1</b> gene (<b>fibrillin-1</b>) on chromosome 15."
  },
  {
    "q": "Classic cardiovascular complication in <b>Marfan</b> syndrome?",
    "a": "<b>Aortic root dilation</b> → aneurysm and dissection (leading cause of death)."
  },
  {
    "q": "What is the genetic defect in <b>Familial Hypercholesterolemia</b>?",
    "a": "<b>Autosomal dominant</b> — mutation in <b>LDL receptor</b> gene (most common)."
  },
  {
    "q": "What is the genetic defect in <b>Hemochromatosis</b> (classic form)?",
    "a": "<b>Autosomal recessive</b> — HFE gene mutation (C282Y) on chromosome 6 → increased intestinal iron absorption."
  },
  {
    "q": "What is <b>Hardy-Weinberg</b> equilibrium?",
    "a": "p² + 2pq + q² = 1 (allele frequencies remain constant in a population without evolutionary forces)."
  },
  {
    "q": "What are the assumptions for <b>Hardy-Weinberg</b> equilibrium?",
    "a": "No mutation, no selection, no migration, random mating, large population size."
  },
  {
    "q": "What is <b>linkage disequilibrium</b>?",
    "a": "Non-random association of alleles at different loci (occurs when loci are close on same chromosome)."
  },
  {
    "q": "What is a <b>missense mutation</b>?",
    "a": "Single nucleotide change that results in a different amino acid (e.g., sickle cell: Glu → Val)."
  },
  {
    "q": "What is a <b>nonsense mutation</b>?",
    "a": "Point mutation that creates a premature stop codon → truncated protein."
  },
  {
    "q": "What is a <b>frameshift mutation</b>?",
    "a": "Insertion or deletion of nucleotides not divisible by 3 → altered reading frame, usually nonfunctional protein."
  },
  {
    "q": "What is a <b>silent mutation</b>?",
    "a": "Nucleotide change that does not change the amino acid (due to degeneracy of genetic code)."
  },
  {
    "q": "What is a trinucleotide repeat disorder with <b>anticipation</b> in males?",
    "a": "<b><b>Fragile X</b> syndrome</b> (CGG repeats) — Sherman paradox (more severe when transmitted by mother)."
  },
  {
    "q": "What is <b>Lyonization</b> (X-inactivation)?",
    "a": "Random inactivation of one X chromosome in females → Barr body. Explains variable expression in female carriers of X-linked disorders."
  },
  {
    "q": "What is <b>mitochondrial inheritance</b> pattern?",
    "a": "Maternal inheritance. <b>All</b> offspring of affected mother can be affected; no male-to-offspring transmission. Example: Leber Hereditary Optic Neuropathy (LHON)."
  },
  {
    "q": "What is a <b>Robertsonian translocation</b>?",
    "a": "Fusion of two acrocentric chromosomes (13,14,15,21,22) at centromere. Carrier has 45 chromosomes but is phenotypically normal. Increased risk of unbalanced offspring (e.g., translocation <b>Down syndrome</b>)."
  },
  {
    "q": "Most common chromosomal cause of spontaneous abortion?",
    "a": "<b>Trisomy 16</b> (most common), followed by other trisomies and monosomy X."
  },
  {
    "q": "What is the genetic mechanism of <b>Cri-du-chat</b> syndrome?",
    "a": "Deletion of short arm of chromosome 5 (5p-)."
  },
  {
    "q": "Classic cry in <b>Cri-du-chat</b> syndrome?",
    "a": "High-pitched, cat-like cry."
  },
  {
    "q": "What is the most common inherited cause of mental retardation in males?",
    "a": "<b><b>Fragile X</b> syndrome</b>"
  },
  {
    "q": "What is the second most common cause of genetic intellectual disability after <b>Down syndrome</b>?",
    "a": "<b><b>Fragile X</b> syndrome</b>"
  },
  {
    "q": "What is the genetic basis of <b>Beckwith-Wiedemann</b> syndrome?",
    "a": "Imprinting defect at chromosome <b>11p15</b> (paternal overexpression of IGF2)"
  },
  {
    "q": "Classic features of <b>Beckwith-Wiedemann</b> syndrome?",
    "a": "Macrosomia, macroglossia, omphalocele, hemihypertrophy, Wilms tumor risk"
  },
  {
    "q": "What is the genetic mechanism of <b>Wolf-Hirschhorn</b> syndrome?",
    "a": "Deletion of short arm of chromosome <b>4p</b>"
  },
  {
    "q": "What is the genetic mechanism of <b>DiGeorge</b> syndrome (22q11.2 deletion)?",
    "a": "Microdeletion at <b>22q11.2</b> (TBX1 gene)"
  },
  {
    "q": "<b>CATCH-22</b> mnemonic for 22q11.2 deletion syndrome?",
    "a": "<b>C</b>ardiac defects, <b>A</b>bnormal facies, <b>T</b>hymic hypoplasia, <b>C</b>left palate, <b>H</b>ypocalcemia (22q11)"
  },
  {
    "q": "What is the most common microdeletion syndrome?",
    "a": "<b>22q11.2 deletion syndrome</b> (<b>DiGeorge</b> / Velocardiofacial)"
  },
  {
    "q": "What is the karyotype in <b>Klinefelter syndrome</b>?",
    "a": "<b>47,XXY</b>"
  },
  {
    "q": "Classic presentation of <b>Klinefelter syndrome</b>?",
    "a": "Tall male, gynecomastia, small firm testes, azoospermia, infertility, mild intellectual disability"
  },
  {
    "q": "What is the karyotype in <b>Turner syndrome</b>?",
    "a": "<b>45,XO</b> (most common)"
  },
  {
    "q": "Classic features of <b>Turner syndrome</b>?",
    "a": "Short stature, webbed neck, widely spaced nipples, coarctation of aorta, streak ovaries, primary amenorrhea"
  },
  {
    "q": "What is the genetic defect in <b>Triple X syndrome</b>?",
    "a": "<b>47,XXX</b>"
  },
  {
    "q": "What is the genetic defect in <b>XYY syndrome</b>?",
    "a": "<b>47,XYY</b> — tall stature, acne, normal fertility, possible behavioral issues"
  },
  {
    "q": "What is a balanced translocation carrier?",
    "a": "Phenotypically normal but increased risk of unbalanced gametes and offspring with chromosomal abnormalities"
  },
  {
    "q": "What is the most common <b>Robertsonian translocation</b>?",
    "a": "t(14;21)"
  },
  {
    "q": "What is the risk of <b>Down syndrome</b> in a carrier of t(14;21) <b>Robertsonian translocation</b>?",
    "a": "Approximately <b>10–15%</b> (higher if maternal carrier)"
  },
  {
    "q": "What is a contiguous gene syndrome?",
    "a": "Phenotype caused by deletion or duplication of multiple adjacent genes (e.g., <b>DiGeorge</b>, <b>Williams syndrome</b>)"
  },
  {
    "q": "What is <b>Williams syndrome</b> genetic cause?",
    "a": "Microdeletion at <b>7q11.23</b> (includes elastin gene)"
  },
  {
    "q": "Classic features of <b>Williams syndrome</b>?",
    "a": "Elfin facies, supravalvular <b>aortic stenosis</b>, hypercalcemia, cocktail party personality, intellectual disability"
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
    "q": "What is the difference between karyotyping and <b>FISH</b>?",
    "a": "Karyotype: detects large chromosomal abnormalities (&gt;5 Mb). <b>FISH</b>: detects specific smaller deletions/duplications using fluorescent probes"
  },
  {
    "q": "What is PCR used for in genetics?",
    "a": "Amplification of specific DNA segments (e.g., for trinucleotide repeat disorders, <b>cystic fibrosis</b> genotyping)"
  },
  {
    "q": "What is Southern blot used for?",
    "a": "Detection of large DNA fragments, trinucleotide repeats (e.g., <b>Fragile X</b>, <b>Myotonic dystrophy</b>)"
  },
  {
    "q": "What is the principle of <b>Sanger sequencing</b>?",
    "a": "Chain-termination method using dideoxynucleotides (ddNTPs)"
  },
  {
    "q": "What is <b>next-generation sequencing</b> (<b>NGS</b>) primarily used for?",
    "a": "<b>Whole exome or whole genome sequencing</b> — high throughput, identifies point mutations and small indels"
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
    "q": "What are <b>oncogenes</b>?",
    "a": "Mutated proto-<b>oncogenes</b> that promote cell proliferation (gain-of-function). Need only one mutated copy (dominant)"
  },
  {
    "q": "What are <b>tumor suppressor</b> genes?",
    "a": "Genes that inhibit cell proliferation. Both copies must be inactivated (Knudson’s <b>two-hit hypothesis</b>)"
  },
  {
    "q": "Give examples of proto-<b>oncogenes</b> turned <b>oncogenes</b>.",
    "a": "<b>ras</b> (pancreatic, colon cancer), <b>myc</b> (<b>Burkitt lymphoma</b>), <b>HER2/neu</b> (breast cancer)"
  },
  {
    "q": "Give examples of <b>tumor suppressor</b> genes.",
    "a": "<b>RB1</b> (<b>retinoblastoma</b>), <b>TP53</b> (<b>Li-Fraumeni</b>), <b>APC</b> (<b>FAP</b>), <b><b>BRCA1</b>/2</b>"
  },
  {
    "q": "What is <b>Li-Fraumeni</b> syndrome?",
    "a": "<b>Autosomal dominant</b> germline <b>TP53</b> mutation → multiple cancers at young age (sarcomas, breast, brain, leukemia)"
  },
  {
    "q": "What is the inheritance and defect in Familial Adenomatous Polyposis (<b>FAP</b>)?",
    "a": "<b>Autosomal dominant</b> — mutation in <b>APC</b> <b>tumor suppressor</b> gene on chromosome 5q"
  },
  {
    "q": "What is the inheritance of Hereditary Nonpolyposis Colorectal Cancer (<b>HNPCC</b> / <b>Lynch syndrome</b>)?",
    "a": "<b>Autosomal dominant</b> — defect in DNA mismatch repair genes (MSH2, MLH1, etc.)"
  },
  {
    "q": "What cancers are increased in <b>Lynch syndrome</b>?",
    "a": "Colorectal, endometrial, ovarian, gastric, urothelial"
  },
  {
    "q": "What is <b>microsatellite instability</b> (<b>MSI</b>)?",
    "a": "Seen in tumors with defective mismatch repair (<b>Lynch syndrome</b>)"
  },
  {
    "q": "What is the genetic defect in <b>Neurofibromatosis type 1</b> (von Recklinghausen)?",
    "a": "<b>Autosomal dominant</b> — mutation in <b>NF1</b> gene (<b>tumor suppressor</b>) on chromosome 17"
  },
  {
    "q": "Diagnostic criteria for <b>NF1</b> (need 2 or more)?",
    "a": "≥6 café-au-lait spots, ≥2 neurofibromas, axillary/inguinal freckling, optic glioma, Lisch nodules, bony lesion, first-degree relative"
  },
  {
    "q": "What is the genetic defect in <b>NF2</b>?",
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
    "q": "What is the genetic defect in <b>Wilson disease</b>?",
    "a": "<b>Autosomal recessive</b> — mutation in <b>ATP7B</b> gene (copper transport) on chromosome 13"
  },
  {
    "q": "What is the genetic defect in <b>Alpha-1 antitrypsin</b> deficiency?",
    "a": "<b>Autosomal recessive</b> — mutation in <b>SERPINA1</b> gene on chromosome 14 (PiZZ genotype worst)"
  },
  {
    "q": "What is the genetic defect in <b>hereditary spherocytosis</b>?",
    "a": "Mutations in genes encoding red cell membrane proteins (ankyrin, spectrin, band 3)"
  },
  {
    "q": "What is the genetic defect in <b>Gilbert syndrome</b>?",
    "a": "Mild deficiency of <b>UGT1A1</b> (glucuronyl transferase) → unconjugated hyperbilirubinemia, benign"
  },
  {
    "q": "What is the genetic defect in <b>Crigler-Najjar</b> syndrome Type 1?",
    "a": "Complete absence of <b>UGT1A1</b> → severe unconjugated hyperbilirubinemia, kernicterus risk"
  },
  {
    "q": "What is <b>heteroplasmy</b> in mitochondrial diseases?",
    "a": "Mixture of normal and mutant mtDNA within a cell. Explains variable expression"
  },
  {
    "q": "What is the <b>threshold effect</b> in <b>mitochondrial inheritance</b>?",
    "a": "Disease manifests only when mutant mtDNA exceeds a certain percentage in tissues"
  },
  {
    "q": "Give examples of mitochondrial diseases.",
    "a": "Leber Hereditary Optic Neuropathy (LHON), MELAS, MERRF, Kearns-Sayre syndrome"
  },
  {
    "q": "What is the genetic mechanism of <b>Prader-Willi</b> vs <b>Angelman</b> (summary)?",
    "a": "<ul><li><b>Prader-Willi:</b> loss of paternal 15q11-13 genes</li><li><b>Angelman:</b> loss of maternal UBE3A gene at 15q11-13</li></ul>"
  },
  {
    "q": "What is the inheritance and defect in <b>Hereditary Spherocytosis</b>?",
    "a": "Usually <b>autosomal dominant</b> — mutations in ankyrin, spectrin, or band 3. Osmotic fragility test positive."
  },
  {
    "q": "What is the inheritance of <b>Familial Hypercholesterolemia</b>?",
    "a": "<b>Autosomal dominant</b> — LDL receptor mutation (most common)."
  },
  {
    "q": "What is the inheritance and defect in <b>Hemochromatosis</b> (classic)?",
    "a": "<b>Autosomal recessive</b> — HFE gene (C282Y) mutation on chromosome 6."
  },
  {
    "q": "What is the inheritance of <b>Wilson disease</b>?",
    "a": "<b>Autosomal recessive</b> — ATP7B gene mutation (copper transporter)."
  },
  {
    "q": "What is the inheritance of <b>Alpha-1 antitrypsin</b> deficiency?",
    "a": "<b>Autosomal recessive</b> — <b>SERPINA1</b> gene (PiZZ genotype most severe)."
  },
  {
    "q": "What is the inheritance of <b>Gilbert syndrome</b>?",
    "a": "<b>Autosomal recessive (mild) or dominant</b> — reduced UGT1A1 activity."
  },
  {
    "q": "What is the inheritance of <b>Crigler-Najjar</b> Type 1?",
    "a": "<b>Autosomal recessive</b> — complete <b>UGT1A1</b> deficiency."
  },
  {
    "q": "What is the inheritance of <b>Lesch-Nyhan</b> syndrome?",
    "a": "<b>X-linked recessive</b> — <b>HGPRT</b> deficiency → hyperuricemia, self-mutilation, gout."
  },
  {
    "q": "What is the inheritance of <b>Fabry</b> disease?",
    "a": "<b>X-linked recessive</b> — α-galactosidase A deficiency → angiokeratomas, acroparesthesias, renal failure."
  },
  {
    "q": "What is the inheritance of <b>Hunter</b> syndrome (MPS II)?",
    "a": "<b>X-linked recessive</b> — <b>iduronate-2-sulfatase</b> deficiency (milder than <b>Hurler</b>)."
  },
  {
    "q": "What is the inheritance of <b>Hurler</b> syndrome (MPS I)?",
    "a": "<b>Autosomal recessive</b> — α-L-iduronidase deficiency."
  },
  {
    "q": "What is the inheritance of <b>Pompe</b> disease?",
    "a": "<b>Autosomal recessive</b> — acid α-glucosidase deficiency → cardiomegaly, hypotonia."
  },
  {
    "q": "What is the inheritance of <b>McArdle</b> disease?",
    "a": "<b>Autosomal recessive</b> — muscle <b>glycogen</b> phosphorylase deficiency (Type V GSD)."
  },
  {
    "q": "What is the inheritance of <b>Von Gierke</b> disease?",
    "a": "<b>Autosomal recessive</b> — <b>glucose-6-phosphatase</b> deficiency (<b>Type I</b> GSD)."
  },
  {
    "q": "What is the inheritance of <b>Galactosemia</b> (classic)?",
    "a": "<b>Autosomal recessive</b> — galactose-1-phosphate uridyltransferase deficiency."
  },
  {
    "q": "What is the inheritance of <b>Hereditary Fructose Intolerance</b>?",
    "a": "<b>Autosomal recessive</b> — aldolase B deficiency."
  },
  {
    "q": "What is <b>Hardy-Weinberg</b> equation for allele frequencies?",
    "a": "<ul><li>p + q = 1</li><li>p² + 2pq + q² = 1 (p = dominant allele frequency, q = recessive)</li></ul>"
  },
  {
    "q": "How do you calculate carrier frequency for <b>autosomal recessive</b> disease?",
    "a": "If disease incidence = q², then carrier frequency ≈ 2pq (≈ 2q if q is small)."
  },
  {
    "q": "What does a high inbreeding coefficient (F) increase?",
    "a": "Homozygosity for rare recessive alleles → higher incidence of <b>autosomal recessive</b> diseases."
  },
  {
    "q": "What is <b>founder effect</b>?",
    "a": "High frequency of a rare allele in a population descended from a small number of ancestors (e.g., <b>Tay-Sachs</b> in Ashkenazi Jews)."
  },
  {
    "q": "What is <b>genetic drift</b>?",
    "a": "Random change in allele frequencies, more pronounced in small populations."
  },
  {
    "q": "What is the <b>bottleneck effect</b>?",
    "a": "Sharp reduction in population size → loss of genetic variation (e.g., cheetahs)."
  },
  {
    "q": "What is the difference between <b>penetrance</b> and <b>expressivity</b>?",
    "a": "<ul><li><b>Penetrance:</b> % of genotype carriers who show phenotype.</li><li><b>Expressivity:</b> degree/severity of phenotype in those who express it.</li></ul>"
  },
  {
    "q": "What is <b>pleiotropy</b>?",
    "a": "One gene influences multiple seemingly unrelated phenotypic traits (e.g., <b>PKU</b>, <b>Marfan</b>)."
  },
  {
    "q": "What is <b>locus heterogeneity</b>?",
    "a": "Same phenotype caused by mutations in different genes (e.g., retinitis pigmentosa)."
  },
  {
    "q": "What is <b>allelic heterogeneity</b>?",
    "a": "Different mutations in the same gene cause the same phenotype (e.g., <b>CFTR</b> mutations in <b>cystic fibrosis</b>)."
  },
  {
    "q": "What is <b>anticipation</b> and in which disorders is it prominent?",
    "a": "Increasing severity/earlier onset in successive generations due to trinucleotide repeat expansion. Seen in <b>Huntington</b>, <b>Myotonic dystrophy</b>, <b>Fragile X</b>."
  },
  {
    "q": "What is a <b>dominant negative mutation</b>?",
    "a": "Mutant protein interferes with the function of the wild-type protein (e.g., osteogenesis imperfecta)."
  },
  {
    "q": "What is <b>haploinsufficiency</b>?",
    "a": "Loss of one functional copy of a gene is not enough for normal function (often causes dominant disorders)."
  },
  {
    "q": "What is the <b>two-hit hypothesis</b> (Knudson)?",
    "a": "Both alleles of a <b>tumor suppressor</b> gene must be inactivated for tumor formation (<b>retinoblastoma</b>, Wilms tumor)."
  },
  {
    "q": "What is the genetic defect in <b>Retinoblastoma</b>?",
    "a": "Mutation in <b>RB1</b> <b>tumor suppressor</b> gene on chromosome 13q."
  },
  {
    "q": "What is the inheritance of <b>Retinoblastoma</b> (familial form)?",
    "a": "<b>Autosomal dominant</b> with <b>incomplete <b>penetrance</b></b>."
  },
  {
    "q": "What cancers are increased in <b>Li-Fraumeni</b> syndrome?",
    "a": "Sarcomas, breast cancer, brain tumors, leukemia, adrenocortical carcinoma (TP53 mutation)."
  },
  {
    "q": "What is the inheritance of <b>Xeroderma Pigmentosum</b>?",
    "a": "<b>Autosomal recessive</b> — defective nucleotide excision repair → extreme UV sensitivity and skin cancers."
  },
  {
    "q": "What is the inheritance of <b>Ataxia-Telangiectasia</b>?",
    "a": "<b>Autosomal recessive</b> — ATM gene (DNA repair) defect."
  },
  {
    "q": "What is <b>Bloom syndrome</b>?",
    "a": "<b>Autosomal recessive</b> — BLM gene (<b>DNA helicase</b>) → photosensitivity, short stature, increased cancer risk."
  },
  {
    "q": "What is <b>Fanconi anemia</b>?",
    "a": "<b>Autosomal recessive</b> (mostly) — defective DNA cross-link repair → pancytopenia, thumb/radius abnormalities, increased cancer risk."
  },
  {
    "q": "What is the genetic defect in <b>Sickle Cell Disease</b>?",
    "a": "<b>Point mutation in β-globin gene (Glu6Val)</b> — HbS."
  },
  {
    "q": "What is the genetic defect in β-Thalassemia major?",
    "a": "Mutations in β-globin gene → reduced or absent β-chain synthesis."
  },
  {
    "q": "What is the genetic defect in α-Thalassemia (Hb Bart’s hydrops fetalis)?",
    "a": "Deletion of <b>all</b> four α-globin genes (—/—)."
  },
  {
    "q": "What is the genetic defect in <b>Hemophilia A</b>?",
    "a": "<b>X-linked recessive</b> — Factor VIII deficiency."
  },
  {
    "q": "What is the genetic defect in <b>Hemophilia B</b>?",
    "a": "<b>X-linked recessive</b> — Factor IX deficiency."
  },
  {
    "q": "What is the genetic defect in <b>von Willebrand Disease</b> (most common type)?",
    "a": "<b>Autosomal dominant (usually)</b> — quantitative or qualitative defect in vWF."
  },
  {
    "q": "What is the genetic basis of ABO blood groups?",
    "a": "Multiple alleles at a single locus on chromosome 9 (IA, IB, i)."
  },
  {
    "q": "What is the Rh blood group inheritance?",
    "a": "<b>Autosomal dominant</b> expression of D antigen."
  },
  {
    "q": "What is <b>erythroblastosis fetalis</b> (hemolytic disease of newborn)?",
    "a": "Rh-negative mother sensitized to Rh-positive fetus → anti-D <b>IgG</b> crosses placenta."
  },
  {
    "q": "What is the genetic defect in <b>Chronic Granulomatous Disease</b>?",
    "a": "<b>Most commonly X-linked</b> — NADPH oxidase defect (CYBB gene)."
  },
  {
    "q": "What is the genetic defect in <b>Bruton</b> <b>agammaglobulinemia</b>?",
    "a": "<b>X-linked recessive</b> — BTK (<b>Bruton</b> tyrosine kinase) mutation."
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
    "a": "<b>Autosomal recessive</b> — adenosine deaminase deficiency (a cause of <b>SCID</b>)."
  },
  {
    "q": "What HLA allele is strongly associated with <b>Celiac disease</b>?",
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
    "q": "What is the genetic mechanism of imprinting in <b>Prader-Willi</b> syndrome?",
    "a": "Loss of paternally expressed genes at 15q11-13."
  },
  {
    "q": "What gene is silenced in <b>Angelman</b> syndrome?",
    "a": "<b>UBE3A</b> (maternally expressed in brain)."
  },
  {
    "q": "What is <b>DNA methylation</b>’s role in epigenetics?",
    "a": "Usually silences gene expression (CpG islands in promoters)."
  },
  {
    "q": "What is <b>histone acetylation</b>’s effect on gene expression?",
    "a": "Promotes transcription (loosens chromatin structure)."
  },
  {
    "q": "What is the most common genetic cause of congenital bilateral absence of vas deferens?",
    "a": "<b><b>Cystic fibrosis</b> (<b>CFTR</b> mutations)</b>"
  },
  {
    "q": "What is the genetic defect in <b>Kartagener syndrome</b>?",
    "a": "<b>Autosomal recessive</b> — defective dynein arms → primary ciliary dyskinesia, situs inversus, bronchiectasis, infertility."
  },
  {
    "q": "What is the genetic defect in <b>Polycystic Kidney Disease</b> (adult form)?",
    "a": "<b>Autosomal dominant</b> — PKD1 (chromosome 16) or PKD2 (chromosome 4)."
  },
  {
    "q": "What is the genetic defect in <b>Tuberous Sclerosis</b>?",
    "a": "<b>Autosomal dominant</b> — TSC1 (hamartin) or TSC2 (tuberin)."
  },
  {
    "q": "What is the genetic defect in <b>Sturge-Weber</b> syndrome?",
    "a": "Somatic mutation in <b>GNAQ</b> gene."
  },
  {
    "q": "What is the genetic defect in Neurofibromatosis type 2?",
    "a": "Mutation in <b>NF2</b> (merlin) gene on chromosome 22."
  },
  {
    "q": "What is pharmacogenomic testing for before starting abacavir?",
    "a": "HLA-B*5701 allele (risk of <b>hypersensitivity</b> reaction)."
  },
  {
    "q": "What enzyme deficiency causes <b>malignant hyperthermia</b> susceptibility?",
    "a": "Usually ryanodine receptor (RYR1) mutation (<b>autosomal dominant</b>)."
  },
  {
    "q": "What is the genetic basis of Long QT syndrome (most common form)?",
    "a": "<b>Autosomal dominant</b> — mutations in potassium channel genes (KCNQ1, KCNH2)."
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
    "a": "<b>Autosomal dominant</b> — mutations in <b>type I</b> collagen genes (COL1A1 or COL1A2)."
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
    "a": "<b>Maternal (mitochondrial) inheritance</b> — MT-TL1 mutation."
  },
  {
    "q": "What is the inheritance of Myoclonic Epilepsy with Ragged Red Fibers (MERRF)?",
    "a": "<b>Maternal inheritance</b> — MT-TK mutation."
  },
  {
    "q": "What is <b>heteroplasmy</b>?",
    "a": "Presence of both normal and mutant mtDNA in a cell/tissue → variable phenotypic expression in mitochondrial diseases."
  },
  {
    "q": "What is the <b>threshold effect</b> in mitochondrial disorders?",
    "a": "Disease manifests only when the proportion of mutant mtDNA exceeds a tissue-specific threshold."
  }
];
module.exports = { geneticsCards };
