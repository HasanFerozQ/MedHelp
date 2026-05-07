import json
import re

content = """
Front: Purines vs. Pyrimidines (structures)?
Back: Purines (A, G): 2 rings. Pyrimidines (C, T, U): 1 ring. (Mnemonic: PURe As Gold; CUT the PY)

Front: Bond type between base pairs in DNA?
Back: Hydrogen bonds (3 between G-C, 2 between A-T).

Front: Definition of a Nucleosome?
Back: DNA wrapped twice around a histone octamer (2 each of H2A, H2B, H3, H4).

Front: Charge of Histones and DNA?
Back: Histones: Positive (Arginine/Lysine). DNA: Negative (Phosphate group).

Front: Effect of Histone Acetylation?
Back: Relaxes DNA coiling, permitting transcription (Euchromatin).

Front: Effect of DNA Methylation at CpG islands?
Back: Silences gene expression ("Methylation Makes DNA Mute").

Front: Function of DNA Helicase?
Back: Unwinds DNA template at the replication fork.

Front: Direction of DNA Polymerase proofreading (exonuclease activity)?
Back: 3' to 5'.

Front: Probability of an offspring being affected in Autosomal Dominant (AD) inheritance (one affected parent)?
Back: 50%.

Front: Classic example of an Autosomal Dominant disorder with "delayed age of onset"?
Back: Huntington Disease.

Front: Probability of an offspring being a carrier in Autosomal Recessive (AR) inheritance (two carrier parents)?
Back: 50% (25% affected, 25% unaffected).

Front: What is Pleiotropy?
Back: One gene mutation results in multiple seemingly unrelated phenotypic effects.

Front: Definition of Allelic Heterogeneity?
Back: Different mutations at the same locus produce the same phenotype (e.g., beta-thalassemia).

Front: Definition of Locus Heterogeneity?
Back: Mutations at different loci produce the same phenotype (e.g., Albinism).

Front: What is Heteroplasmy?
Back: Presence of both normal and mutated mtDNA, resulting in variable expression in mitochondrial diseases.

Front: Inheritance pattern that never shows male-to-male transmission?
Back: X-linked Recessive.

Front: Genetic defect in Cystic Fibrosis?
Back: Autosomal recessive mutation in CFTR gene (usually delta F508 on Chromosome 7).

Front: Mechanism of Fragile X Syndrome?
Back: Trinucleotide repeat expansion (CGG) in the FMR1 gene.

Front: Physical findings in Fragile X?
Back: Post-pubertal macroorchidism, long face with large ears, autism.

Front: Cause of Prader-Willi Syndrome?
Back: Maternal imprinting with Paternal gene deletion/mutation (Chromosome 15).

Front: Cause of Angelman Syndrome?
Back: Paternal imprinting with Maternal gene deletion/mutation (Chromosome 15).

Front: Trinucleotide repeat in Huntington Disease?
Back: CAG ("Caudate Acetylcholine GABA" are decreased).

Front: Trinucleotide repeat in Myotonic Dystrophy?
Back: CTG.

Front: Common feature of Mitochondrial Myopathies on muscle biopsy?
Back: "Ragged red fibers."

Front: Most common cause of Down Syndrome (Trisomy 21)?
Back: Meiotic non-disjunction (associated with advanced maternal age).

Front: Chromosomal finding in Edwards Syndrome?
Back: Trisomy 18 ("Edwards" = Eighteen).

Front: Chromosomal finding in Patau Syndrome?
Back: Trisomy 13 ("Patau" = Puberty at 13).

Front: Clinical features of Patau Syndrome?
Back: Cleft lip/palate, holoprosencephaly, polydactyly, microphthalmia.

Front: Karyotype of Klinefelter Syndrome?
Back: 47, XXY.

Front: Karyotype of Turner Syndrome?
Back: 45, XO.

Front: Physical findings in Turner Syndrome?
Back: Short stature, webbed neck, streak ovaries, coarctation of the aorta.

Front: Mechanism of Cri-du-chat Syndrome?
Back: Congenital microdeletion of short arm of chromosome 5 (5p-).

Front: Common findings in DiGeorge Syndrome?
Back: CATCH-22: Cardiac defects, Abnormal facies, Thymic hypoplasia, Cleft palate, Hypocalcemia (22q11 deletion).

Front: Hardy-Weinberg Equation for allele frequency?
Back: p + q = 1

Front: Hardy-Weinberg Equation for phenotype/genotype frequency?
Back: p^2 + 2pq + q^2 = 1

Front: What does 2pq represent in Hardy-Weinberg?
Back: Heterozygote (carrier) frequency.

Front: Purpose of PCR (Polymerase Chain Reaction)?
Back: Rapidly amplify specific DNA sequences.

Front: Purpose of Southern Blot?
Back: Detect specific DNA sequences. (Mnemonic: SNoW DRoP—Southern/DNA, Northern/RNA, Western/Protein)

Front: Purpose of FISH (Fluorescence In Situ Hybridization)?
Back: Direct visualization of chromosomal anomalies (microdeletions, translocations) at the molecular level.

Front: What is Robertsonian Translocation?
Back: Fusion of two acrocentric chromosomes (13, 14, 15, 21, 22) at the centromere.

Front: Genetic defect in Marfan Syndrome?
Back: FBN1 mutation (Fibrillin-1) on Chromosome 15.

Front: Genetic defect in Achondroplasia?
Back: Constitutive activation of FGFR3.

Front: Mode of inheritance for G6PD Deficiency?
Back: X-linked Recessive.

Front: Mode of inheritance for Hemophilia A and B?
Back: X-linked Recessive.

Front: What is Anticipation?
Back: Increased severity or earlier onset of disease in succeeding generations (common in trinucleotide repeats).

Front: "Lyonization" refers to what process?
Back: X-inactivation (formation of Barr bodies).

Front: The p arm of a chromosome refers to?
Back: The short arm ("petite").

Front: Function of Single-strand binding proteins (SSBPs)?
Back: Prevent DNA strands from reannealing during replication.

Front: Role of Primase in DNA replication?
Back: Makes an RNA primer on which DNA polymerase III can initiate replication.

Front: Which DNA polymerase in prokaryotes has 5' to 3' exonuclease activity?
Back: DNA Polymerase I (removes the RNA primer).

Front: Definition of a "Silent" mutation?
Back: Nucleotide change that codes for the same amino acid (often a "wobble" position).

Front: Definition of a "Nonsense" mutation?
Back: Nucleotide change resulting in a premature Stop codon (UAG, UAA, UGA).

Front: Effect of a "Frameshift" mutation?
Back: Insertion or deletion of nucleotides (not a multiple of 3), changing the reading frame.

Front: Type of repair deficient in Xeroderma Pigmentosum?
Back: Nucleotide Excision Repair (inability to repair pyrimidine dimers from UV light).

Front: Type of repair deficient in Hereditary Nonpolyposis Colorectal Cancer (HNPCC/Lynch Syndrome)?
Back: Mismatch Repair.

Front: Sequence of the "Start" codon?
Back: AUG (Codes for Methionine in eukaryotes; fMet in prokaryotes).

Front: Sequence of the three "Stop" codons?
Back: UAA, UAG, UGA ("U Are Away, U Are Gone, U Go Away").

Front: Function of the TATA box?
Back: Eukaryotic promoter sequence that binds RNA polymerase II and transcription factors.

Front: Three post-transcriptional modifications of mRNA?
Back: 5' Capping, 3' Polyadenylation (Poly-A tail), and Splicing of introns.

Front: Function of the Spliceosome?
Back: Removes introns and joins exons; mediated by snRNPs ("snurps").

Front: Antibodies against snRNPs (Anti-Smith) are highly specific for?
Back: Systemic Lupus Erythematosus (SLE).

Front: What is Alternative Splicing?
Back: Producing different proteins from the same gene by including/excluding different exons.

Front: Function of Aminoacyl-tRNA synthetase?
Back: Matches and attaches the correct amino acid to its tRNA (requires ATP).

Front: Inheritance of most enzyme deficiencies?
Back: Autosomal Recessive.

Front: Inheritance of most structural protein deficiencies?
Back: Autosomal Dominant.

Front: Genetic defect in Familial Hypercholesterolemia?
Back: Defective LDL receptor (Autosomal Dominant).

Front: Genetic defect in Hereditary Hemochromatosis?
Back: HFE gene mutation (usually C282Y) leading to iron overload.

Front: Diagnosis for intellectual disability, "fair" skin/hair, and "musty" odor?
Back: Phenylketonuria (PKU).

Front: Inheritance of Hunter Syndrome vs. Hurler Syndrome?
Back: Hunter is X-linked Recessive; Hurler is Autosomal Recessive.

Front: Function of the p53 gene?
Back: Tumor suppressor; induces p21 and stalls cell cycle at G1/S to repair DNA or induce apoptosis.

Front: Genetic condition associated with germline p53 mutation?
Back: Li-Fraumeni Syndrome (multiple early-onset cancers).

Front: Translocation associated with Chronic Myeloid Leukemia (CML)?
Back: t(9;22) — The Philadelphia Chromosome (BCR-ABL fusion).

Front: Translocation associated with Burkitt Lymphoma?
Back: t(8;14) — c-myc activation.

Front: Translocation associated with Follicular Lymphoma?
Back: t(14;18) — bcl-2 activation (inhibits apoptosis).

Front: Genetic defect in Neurofibromatosis Type 1?
Back: NF1 gene on Chromosome 17.

Front: Genetic defect in Neurofibromatosis Type 2?
Back: NF2 gene on Chromosome 22 ("22 for Type 2").

Front: Function of the RB1 gene?
Back: Tumor suppressor that inhibits E2F; prevents G1 -> S transition.

Front: Definition of Uniparental Disomy?
Back: Offspring receives two copies of a chromosome from one parent and zero from the other.

Front: What is Germline Mosaicism?
Back: Mutation occurs in a precursor egg or sperm cell, affecting some offspring but not the parent's somatic cells.

Front: Definition of Variable Expressivity?
Back: Patients with the same genotype have varying degrees of phenotypic severity (e.g., NF1).

Front: Definition of Incomplete Penetrance?
Back: Not all individuals with a mutant genotype show the mutant phenotype.

Front: Formula for the "Carrier Frequency" of an AR disease if the prevalence is 1/10,000?
Back: q^2 = 1/10,000 -> q = 1/100. Carrier frequency (2pq) is approx 2 x 1/100 = 1/50.

Front: Karyotype of Jacob Syndrome?
Back: 47, XYY (presents with tall stature, acne, and learning disability).

Front: Mechanism of G6PD Deficiency inheritance?
Back: X-linked Recessive.

Front: Genetics of Wilson Disease?
Back: ATP7B mutation on Chromosome 13 (Autosomal Recessive).

Front: Defect in von Hippel-Lindau (VHL) disease?
Back: VHL gene (tumor suppressor) on Chromosome 3.

Front: Name of the syndrome: 45, XO?
Back: Turner Syndrome.

Front: Name of the syndrome: 47, XXY?
Back: Klinefelter Syndrome.

Front: Most common cause of intellectual disability in males?
Back: Fragile X Syndrome.

Front: Genetics of Williams Syndrome?
Back: Microdeletion of long arm of chromosome 7 (includes elastin gene).

Front: Characteristics of Williams Syndrome?
Back: "Elfin" facies, extreme friendliness with strangers, cardiovascular problems (supravalvular aortic stenosis).

Front: Genetic cause of McCune-Albright Syndrome?
Back: G-protein signaling mutation (mosaicism); presents with cafe-au-lait spots, polyostotic fibrous dysplasia, and precocious puberty.

Front: Function of Homeobox (Hox) genes?
Back: Code for transcription factors that guide the segmental organization of the embryo in a cranio-caudal direction.

Front: Result of a mutation in a Hox gene?
Back: Appendages appearing in the wrong locations (homeotic transformation).

Front: Part of the cell cycle where "p53" and "Rb" primarily act?
Back: G1 to S phase transition.

Front: Cell type that remains in G0 (permanent)?
Back: Neurons, skeletal muscle, cardiac muscle, and RBCs.

Front: Cell type that enters G1 from G0 only when stimulated (stable/quiescent)?
Back: Hepatocytes and Lymphocytes.

Front: Definition of Genomic Imprinting?
Back: One allele is transcriptionally inactivated (silenced) during gametogenesis depending on the parent of origin.

Front: Mechanism of MicroRNAs (miRNAs)?
Back: Small non-coding RNA molecules that post-transcriptionally regulate gene expression by targeting mRNA for degradation or translational repression.

Front: Definition of Codominance?
Back: Both alleles are expressed in the phenotype of a heterozygote (e.g., Blood groups A, B, AB).

Front: Purpose of a "Northern Blot"?
Back: To detect specific sequences of RNA to study gene expression.

Front: Purpose of a "Western Blot"?
Back: To detect specific proteins in a tissue sample or extract.

Front: Definition of Polymorphism?
Back: A genetic variant that occurs in at least 1% of the population.

Front: Clinical significance of the CYP2D6 polymorphism?
Back: Affects the metabolism of many drugs (e.g., Codeine, antidepressants); patients can be "poor" or "ultra-rapid" metabolizers.

Front: Genetic test used to detect chromosomal imbalances (deletions/duplications) that are too small for a standard karyotype?
Back: Microarray (Comparative Genomic Hybridization).

Front: Genetic defect in Wiskott-Aldrich Syndrome?
Back: Mutation in the WASP gene (X-linked Recessive); triad of Eczema, Thrombocytopenia, and Immunodeficiency.

Front: Genetic defect in Bruton Agammaglobulinemia?
Back: Defect in Bruton Tyrosine Kinase (BTK gene) on the X chromosome.

Front: Most common chromosomal cause of spontaneous abortion in the first trimester?
Back: Autosomal Trisomy (Trisomy 16 is the most common specifically, though rarely seen live-born).

Front: Chromosomal location of the "Alpha-globin" genes?
Back: Chromosome 16.

Front: Chromosomal location of the "Beta-globin" genes?
Back: Chromosome 11.

Front: Definition of "Loss of Heterozygosity"?
Back: When a patient inherits one mutant tumor suppressor gene and the second, normal allele is later mutated or lost (Knudson’s "Two-Hit" Hypothesis).
"""

def enhance_back(text):
    # Arrows and symbols FIRST, but avoid messing up future tags
    text = text.replace("->", "SYMBOL_ARROW")
    
    # Bold key terms
    keys = [
        "Purines", "Pyrimidines", "Nucleosome", "Histones", "DNA", "Helicase", "DNA Polymerase",
        "Huntington Disease", "Cystic Fibrosis", "CFTR", "Fragile X Syndrome", "FMR1",
        "Prader-Willi Syndrome", "Angelman Syndrome", "Myotonic Dystrophy", "Mitochondrial Myopathies",
        "Down Syndrome", "Trisomy 21", "Edwards Syndrome", "Trisomy 18", "Patau Syndrome", "Trisomy 13",
        "Klinefelter Syndrome", "Turner Syndrome", "Cri-du-chat Syndrome", "DiGeorge Syndrome",
        "Hardy-Weinberg", "PCR", "Southern Blot", "Northern Blot", "Western Blot", "FISH",
        "Robertsonian Translocation", "Marfan Syndrome", "Achondroplasia", "G6PD Deficiency",
        "Hemophilia A and B", "Anticipation", "Lyonization", "Silent", "Nonsense", "Frameshift",
        "Xeroderma Pigmentosum", "Lynch Syndrome", "TATA box", "Spliceosome", "Anti-Smith",
        "Systemic Lupus Erythematosus", "SLE", "Familial Hypercholesterolemia", "Hereditary Hemochromatosis",
        "Phenylketonuria", "PKU", "Hunter Syndrome", "Hurler Syndrome", "p53", "Li-Fraumeni Syndrome",
        "Chronic Myeloid Leukemia", "CML", "Burkitt Lymphoma", "Follicular Lymphoma",
        "Neurofibromatosis Type 1", "NF1", "Neurofibromatosis Type 2", "NF2", "RB1",
        "Jacob Syndrome", "Wilson Disease", "Williams Syndrome", "McCune-Albright Syndrome",
        "Homeobox", "Hox", "Wiskott-Aldrich Syndrome", "Bruton Agammaglobulinemia"
    ]
    for key in sorted(keys, key=len, reverse=True):
        text = re.sub(rf"(?i)\b({re.escape(key)})\b", r"<b>\1</b>", text)
    
    # Italics for mnemonics, specific sequences, and findings
    italics = [
        "PURe As Gold", "CUT the PY", "Methylation Makes DNA Mute", "Euchromatin",
        "delayed age of onset", "Pleiotropy", "Allelic Heterogeneity", "Locus Heterogeneity",
        "Heteroplasmy", "delta F508", "CGG", "macroorchidism", "CAG", "Caudate Acetylcholine GABA",
        "CTG", "Ragged red fibers", "non-disjunction", "Puberty at 13", "Eighteen", "CATCH-22",
        "2pq", "SNoW DRoP", "FBN1", "Fibrillin-1", "FGFR3", "wobble", "UAG, UAA, UGA",
        "U Are Away, U Are Gone, U Go Away", "snRNPs", "snurps", "Alternative Splicing",
        "iron overload", "musty", "p21", "The Philadelphia Chromosome", "BCR-ABL", "c-myc", "bcl-2",
        "E2F", "Uniparental Disomy", "Germline Mosaicism", "Variable Expressivity", "Incomplete Penetrance",
        "ATP7B", "elfin", "homeotic transformation", "G0", "G1", "miRNAs", "Codominance",
        "CYP2D6", "WASP", "BTK", "Two-Hit", "Knudson"
    ]
    for it in sorted(italics, key=len, reverse=True):
        text = re.sub(rf"(?i)\b({re.escape(it)})\b", r"<i>\1</i>", text)

    # Finally replace symbol placeholders
    text = text.replace("SYMBOL_ARROW", "<b>\u2192</b>")
    
    return text

cards = []
lines = content.strip().split("\n")
current_q = None
for line in lines:
    if line.startswith("Front:"):
        current_q = line.replace("Front:", "").strip()
    elif line.startswith("Back:"):
        a = line.replace("Back:", "").strip()
        cards.append({"q": current_q, "a": enhance_back(a)})

print(json.dumps(cards, indent=2))
