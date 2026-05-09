-- Batch 2: 20 Immunology MCQs for USMLE Step 1 (Sources: First Aid, Janeway, BRS, Abbas, Steinberg)
-- Topic ID: 5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 25-year-old male receives a PPD (purified protein derivative) skin test for tuberculosis. 48 hours later, he develops a 15 mm area of induration. Which of the following best describes the pathogenesis of this skin reaction?', 
'["Preformed IgE binding to mast cells", "Deposition of immune complexes in the dermis", "Complement-mediated lysis of epithelial cells", "Macrophage activation by Th1 cell-derived cytokines"]'::jsonb, 
3, 
'The PPD skin test (tuberculin test) is a classic Type IV (delayed-type) hypersensitivity reaction. It is primarily mediated by memory Th1 cells that were sensitized during a previous exposure to Mycobacterium tuberculosis. Upon re-exposure to the antigen in the skin, these Th1 cells release IFN-gamma, which powerfully activates macrophages. The macrophages release inflammatory cytokines, leading to the characteristic induration (firmness) and erythema over 48-72 hours.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 6-year-old girl is diagnosed with acute lymphoblastic leukemia (ALL) and is found to have a mutation in the RAG1/RAG2 genes. These genes are normally essential for which of the following processes in lymphocyte development?', 
'["Class switch recombination", "V(D)J recombination", "Somatic hypermutation", "Positive selection in the thymus"]'::jsonb, 
1, 
'The RAG1 and RAG2 (Recombination Activating Genes) proteins form a complex that initiates V(D)J recombination. This process randomly rearranges variable (V), diversity (D), and joining (J) gene segments to create a highly diverse repertoire of T cell receptors (TCRs) and B cell receptors (BCRs)/antibodies. Severe defects in RAG genes cause Omenn syndrome or Severe Combined Immunodeficiency (SCID) due to the failure of both T and B cells to mature.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient presents with a defect in the classical complement pathway. Laboratory testing reveals a deficiency in C1q. This patient is at the greatest increased risk for developing which of the following conditions?', 
'["Systemic lupus erythematosus (SLE)", "Recurrent Neisseria meningitidis infections", "Hereditary angioedema", "Paroxysmal nocturnal hemoglobinuria (PNH)"]'::jsonb, 
0, 
'Deficiencies in the early components of the classical complement pathway (C1q, C1r, C1s, C4, C2) are strongly associated with the development of systemic lupus erythematosus (SLE). The classical complement pathway is essential for the clearance of immune complexes and apoptotic debris. Failure to clear this debris leads to autoantigen presentation, loss of tolerance, and autoantibody production (e.g., antinuclear antibodies).'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following is the primary mechanism by which the immune system prevents autoimmune reactions against antigens expressed normally in peripheral tissues, such as the pancreas or thyroid, during T cell maturation in the thymus?', 
'["Expression of the AIRE gene in medullary thymic epithelial cells", "Fas/FasL-induced apoptosis in the thymic cortex", "Secretion of IL-10 and TGF-beta by thymic macrophages", "Positive selection by cortical thymic epithelial cells"]'::jsonb, 
0, 
'Negative selection in the thymus eliminates autoreactive T cells. To ensure T cells are tolerant to tissue-specific antigens (e.g., insulin in the pancreas) that are not normally present in the thymus, medullary thymic epithelial cells express the Autoimmune Regulator (AIRE) gene. AIRE acts as a transcription factor, driving the ectopic expression of thousands of peripheral tissue antigens so that developing T cells can be tested against them. AIRE mutations cause APECED.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 10-month-old boy presents with severe eczema, recurrent thrombocytopenia, and recurrent respiratory infections. His older brother died of bleeding complications. This disorder is caused by an X-linked mutation affecting which cellular process?', 
'["Actin cytoskeleton reorganization", "Superoxide production", "Lysosomal trafficking", "V(D)J recombination"]'::jsonb, 
0, 
'This patient has Wiskott-Aldrich Syndrome (WAS), characterized by the classic triad of recurrent infections, severe eczema, and microthrombocytopenia (small platelets and low platelet count). It is caused by an X-linked recessive mutation in the WASp gene. The WAS protein is essential for actin cytoskeleton reorganization in hematopoietic cells. Defective actin polymerization impairs cell migration, immune synapse formation (T cell to APC), and platelet release from megakaryocytes.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'During the germinal center reaction, B cells undergo somatic hypermutation and class switch recombination. Which enzyme is absolutely required for both of these DNA-altering processes to occur?', 
'["Terminal deoxynucleotidyl transferase (TdT)", "Activation-induced cytidine deaminase (AID)", "Artemis endonuclease", "DNA ligase IV"]'::jsonb, 
1, 
'Activation-induced cytidine deaminase (AID) is an enzyme expressed specifically in activated B cells within germinal centers. It initiates both somatic hypermutation (increasing antibody affinity) and class switch recombination (changing isotype from IgM to IgG, IgA, or IgE) by deaminating cytosine to uracil in single-stranded DNA. AID deficiency causes Hyper-IgM syndrome type 2, characterized by normal T cells but absent IgG/IgA/IgE.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient receives a mismatched blood transfusion and rapidly develops fever, chills, hemoglobinuria, and hypotension. This acute hemolytic transfusion reaction is an example of which type of hypersensitivity?', 
'["Type I", "Type II", "Type III", "Type IV"]'::jsonb, 
1, 
'An acute hemolytic transfusion reaction (e.g., giving Type A blood to a Type O recipient) is a classic Type II hypersensitivity reaction. Preformed antibodies (IgM or IgG) in the recipient''s serum bind directly to the ABO antigens on the surface of the donor red blood cells. This leads to massive complement activation (classical pathway), forming the Membrane Attack Complex (MAC), which causes intravascular hemolysis of the donor cells.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following immunodeficiencies is characterized by a defect in lysosomal trafficking, leading to giant granules in neutrophils and partial albinism?', 
'["Chediak-Higashi syndrome", "Chronic granulomatous disease", "Leukocyte adhesion deficiency", "Job syndrome (Hyper-IgE syndrome)"]'::jsonb, 
0, 
'Chediak-Higashi syndrome is an autosomal recessive disorder caused by a mutation in the LYST gene, which is critical for lysosomal trafficking. This defect prevents the fusion of lysosomes with phagosomes in neutrophils, causing recurrent pyogenic infections. It also affects melanosome transport in melanocytes, leading to partial oculocutaneous albinism. A classic finding on blood smear is the presence of massive, giant granules in neutrophils.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A researcher studies the interaction between antigen-presenting cells (APCs) and naive T cells. Which molecule on the surface of the APC provides the essential secondary costimulatory signal required to activate a naive CD4+ T cell?', 
'["MHC Class II", "CD40", "B7 (CD80/86)", "LFA-1"]'::jsonb, 
2, 
'Naive T cells require two signals for full activation. Signal 1 is the interaction between the T cell receptor (TCR) and the MHC-antigen complex on the APC. Signal 2 is the costimulatory signal, provided by the interaction between B7 (CD80 or CD86) on the APC and CD28 on the T cell. If Signal 1 occurs without Signal 2, the T cell becomes anergic (unresponsive).'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 2-year-old child presents with coarse facial features, severe eczema, and a history of recurrent "cold" staphylococcal abscesses (lacking typical warmth/erythema). Laboratory testing reveals a markedly elevated serum IgE level. This condition is caused by a deficiency in which type of T helper cell response?', 
'["Th1 response", "Th2 response", "Th17 response", "Regulatory T cell (Treg) response"]'::jsonb, 
2, 
'This patient has Autosomal Dominant Hyper-IgE Syndrome (Job Syndrome), which is most commonly caused by a mutation in STAT3. This mutation impairs the differentiation of naive T cells into Th17 cells. Th17 cells normally produce IL-17, which is crucial for recruiting neutrophils to sites of infection. The lack of neutrophils results in "cold" staphylococcal abscesses that lack typical signs of inflammation (warmth, severe erythema).'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'In response to a viral infection, host cells produce Type I interferons (IFN-alpha and IFN-beta). Which of the following is the primary antiviral mechanism of action of these cytokines on neighboring, uninfected cells?', 
'["Stimulating the release of perforin and granzyme B", "Inducing the synthesis of enzymes that degrade viral RNA and inhibit protein translation", "Upregulating the expression of MHC Class II molecules", "Activating the alternative complement pathway"]'::jsonb, 
1, 
'Type I interferons (IFN-alpha and IFN-beta) are produced by virally infected cells. They act in a paracrine manner on neighboring uninfected cells, binding to IFN receptors and activating the JAK/STAT pathway. This induces an "antiviral state" by upregulating the synthesis of two key enzymes: RNase L (which degrades both viral and host mRNA) and protein kinase R (PKR, which phosphorylates eIF-2, halting all cellular protein translation).'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient is diagnosed with paroxysmal nocturnal hemoglobinuria (PNH). This condition is caused by an acquired mutation in the PIGA gene, leading to a deficiency of GPI anchors on the red blood cell surface. Which specific complement regulatory proteins are missing, making the RBCs susceptible to complement-mediated lysis?', 
'["CD55 (DAF) and CD59 (MAC inhibitory protein)", "C1 inhibitor and Factor H", "CD18 and CD11b", "Toll-like receptor 2 and 4"]'::jsonb, 
0, 
'Paroxysmal nocturnal hemoglobinuria (PNH) is caused by an acquired hematopoietic stem cell mutation in the PIGA gene, which is required for the synthesis of glycosylphosphatidylinositol (GPI) anchors. GPI anchors attach several proteins to the cell membrane, including CD55 (Decay Accelerating Factor, DAF) and CD59 (MAC inhibitory protein). Without these complement regulators, red blood cells are highly susceptible to complement-mediated intravascular hemolysis.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which class of immunoglobulin is found primarily in mucosal secretions (such as tears, saliva, and breast milk) and exists primarily as a dimer stabilized by a J chain and a secretory component?', 
'["IgG", "IgM", "IgE", "IgA"]'::jsonb, 
3, 
'IgA is the most abundant immunoglobulin in mucosal secretions (saliva, tears, breast milk, gut). While it exists as a monomer in serum, it is secreted across mucosal epithelia as a dimer. The two IgA monomers are linked by a J chain, and during transcytosis across the epithelial cell, a portion of the poly-Ig receptor remains attached to the dimer, forming the "secretory component" which protects IgA from proteolytic degradation.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 55-year-old male receives a kidney transplant. Three years later, the graft slowly begins to fail, characterized by a progressive rise in serum creatinine. Biopsy reveals severe interstitial fibrosis, tubular atrophy, and concentric arteriosclerosis of graft blood vessels. Which mechanism is primarily responsible?', 
'["Preformed cytotoxic antibodies against donor HLA", "Acute CD8+ T cell-mediated cytotoxicity", "Chronic CD4+ T cell-mediated cytokine release stimulating smooth muscle proliferation and fibrosis", "Immune complex deposition in the glomeruli"]'::jsonb, 
2, 
'This describes chronic transplant rejection, which occurs months to years post-transplant. It is primarily mediated by CD4+ T cells that recognize donor alloantigens (often presented by recipient APCs via the indirect pathway) and secrete cytokines (like IFN-gamma and PDGF). These cytokines stimulate the proliferation of vascular smooth muscle cells and fibroblasts, leading to obliterative intimal fibrosis (concentric arteriosclerosis) and parenchymal fibrosis/atrophy.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following Toll-like receptors (TLRs) is uniquely localized to the endosomal membrane (intracellularly) rather than the cell surface, and is specialized to detect unmethylated CpG DNA commonly found in bacteria and DNA viruses?', 
'["TLR2", "TLR4", "TLR5", "TLR9"]'::jsonb, 
3, 
'Toll-like receptors (TLRs) recognize pathogen-associated molecular patterns (PAMPs). TLRs 1, 2, 4, 5, and 6 are expressed on the cell surface to detect extracellular pathogens (e.g., TLR4 detects LPS). In contrast, TLRs 3, 7, 8, and 9 are localized intracellularly on endosomal membranes to detect microbial nucleic acids that have been phagocytosed or are replicating inside the cell. TLR9 specifically detects unmethylated CpG dinucleotide DNA motifs.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 30-year-old female presents with a malar rash, joint pain, and proteinuria. Laboratory tests show high titers of anti-dsDNA and anti-Smith antibodies. Which of the following complement profiles is most expected during an acute disease flare?', 
'["Decreased C3, decreased C4, decreased CH50", "Normal C3, normal C4, decreased CH50", "Increased C3, increased C4, normal CH50", "Decreased C3, normal C4, normal CH50"]'::jsonb, 
0, 
'The patient has systemic lupus erythematosus (SLE), an autoimmune disease characterized by widespread Type III hypersensitivity reactions. During an acute flare, massive amounts of antigen-antibody immune complexes form and deposit in tissues (e.g., glomeruli, joints). These complexes strongly activate the classical complement pathway, leading to the rapid consumption and depletion of complement components. Therefore, serum levels of C3, C4, and total hemolytic complement (CH50) are all significantly decreased.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'During T cell development in the thymus, the transition from double-negative (CD4-CD8-) to double-positive (CD4+CD8+) thymocytes is dependent on the successful rearrangement and expression of which molecule?', 
'["TCR alpha chain", "TCR beta chain", "MHC Class I", "FoxP3"]'::jsonb, 
1, 
'T cell development proceeds through stages based on CD4 and CD8 expression. In the double-negative (CD4-CD8-) stage, the T cell first attempts to rearrange the TCR beta chain gene. If successful, the beta chain pairs with a surrogate pre-T alpha chain to form the pre-TCR. Signaling through this pre-TCR halts further beta chain rearrangement (allelic exclusion), induces massive proliferation, and drives the cell to become a double-positive (CD4+CD8+) thymocyte.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient is administered a drug that blocks the action of calcineurin. Which of the following is the most direct consequence of this pharmacological blockade?', 
'["Inhibition of NFAT dephosphorylation, preventing IL-2 transcription", "Inhibition of mTOR, blocking T cell response to IL-2", "Blockade of nucleotide synthesis, preventing lymphocyte proliferation", "Destruction of circulating CD20+ B cells"]'::jsonb, 
0, 
'Calcineurin inhibitors (like Cyclosporine and Tacrolimus) are powerful immunosuppressants used in organ transplantation. Normally, TCR activation increases intracellular calcium, activating calcineurin. Calcineurin (a phosphatase) then dephosphorylates NFAT (Nuclear Factor of Activated T cells), allowing NFAT to enter the nucleus and initiate the transcription of IL-2. Blocking calcineurin prevents IL-2 production, profoundly suppressing T cell activation and proliferation.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following is the primary mechanism by which the immune system clears a localized helminthic (parasitic worm) infection?', 
'["Neutrophil phagocytosis and oxidative burst", "Antibody-dependent cellular cytotoxicity (ADCC) mediated by eosinophils", "Complement-mediated lysis via the alternative pathway", "Direct cytotoxicity by CD8+ T lymphocytes"]'::jsonb, 
1, 
'Helminths are too large to be phagocytosed by macrophages or neutrophils. Instead, the immune system mounts a Th2 response, producing IL-4 and IL-5. IL-4 induces B cells to class switch to IgE, which coats the parasite. Eosinophils (recruited and activated by IL-5) then bind to the Fc portion of the IgE antibodies via their Fc-epsilon receptors. This cross-linking triggers eosinophil degranulation (releasing Major Basic Protein), destroying the parasite via ADCC.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A neonate is born with severe combined immunodeficiency (SCID) due to an autosomal recessive deficiency in Adenosine Deaminase (ADA). How does this enzyme deficiency lead to the death of developing lymphocytes?', 
'["Failure to repair double-strand DNA breaks during V(D)J recombination", "Inability to present antigens via MHC Class II", "Accumulation of toxic deoxyadenosine (dATP), which inhibits ribonucleotide reductase", "Defective formation of the common gamma chain in cytokine receptors"]'::jsonb, 
2, 
'Adenosine deaminase (ADA) is an enzyme in the purine salvage pathway. Its deficiency causes the toxic accumulation of deoxyadenosine and dATP. High levels of dATP potently inhibit ribonucleotide reductase, an enzyme essential for synthesizing all four deoxynucleotides required for DNA synthesis. Because developing T and B cells are highly proliferative, this lack of DNA synthesis leads to their apoptosis, resulting in severe combined immunodeficiency.')

;
