-- Batch 4: 20 Immunology MCQs for USMLE Step 1 (Sources: First Aid, Janeway, BRS, Abbas, Steinberg)
-- Topic ID: 5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 20-year-old male receives a diagnosis of leprosy. Skin biopsy shows a strong Th2 response with high levels of IL-4 and IL-5, few macrophages, and numerous acid-fast bacilli. Which form of leprosy does this patient have, and why is the immune response ineffective?', 
'["Tuberculoid leprosy; Th2 cytokines inhibit the Th1 macrophage-activating response", "Lepromatous leprosy; Th2 cytokines inhibit the Th1 macrophage-activating response", "Tuberculoid leprosy; Th2 cells cannot activate cytotoxic T cells", "Lepromatous leprosy; Th2 cells induce hyperactive granuloma formation"]'::jsonb, 
1, 
'This patient has lepromatous leprosy, the severe, disseminated form of the disease. Mycobacterium leprae is an intracellular pathogen that requires a strong Th1 response (IFN-gamma, IL-2) to activate macrophages for effective clearance (which results in the milder, contained tuberculoid form). In lepromatous leprosy, the immune system mounts a Th2 response. Th2 cytokines (IL-4, IL-10) actively inhibit the Th1 response and macrophage activation, allowing the bacilli to multiply unchecked within macrophages.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A laboratory identifies a mutation in a patient’s CD18 gene. Flow cytometry confirms the absence of the CD11b/CD18 integrin complex (Mac-1) on the surface of neutrophils. This defect will primarily impair which of the following steps in the acute inflammatory response?', 
'["Rolling", "Tight adhesion and transmigration", "Chemotaxis along a concentration gradient", "Phagolysosome fusion"]'::jsonb, 
1, 
'The CD11/CD18 integrins (such as LFA-1 and Mac-1) are crucial for the tight adhesion of neutrophils to ICAM-1 on the activated endothelial cell surface, which is a prerequisite for transmigration (diapedesis) into the tissue. This mutation causes Leukocyte Adhesion Deficiency (LAD) Type 1. Rolling is mediated by selectins (E-, P-, and L-selectin). Chemotaxis is mediated by chemokines (like IL-8 or C5a), and phagolysosome fusion is mediated by lysosomal trafficking proteins (defective in Chediak-Higashi).'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following cytokines is secreted by macrophages and dendritic cells and is the most critical factor for inducing the differentiation of naive CD4+ T cells into the Th1 subset?', 
'["IL-2", "IL-4", "IL-12", "TGF-beta"]'::jsonb, 
2, 
'Interleukin-12 (IL-12) is the primary polarizing cytokine for Th1 differentiation. When a macrophage or dendritic cell phagocytoses an intracellular pathogen, it secretes IL-12. This IL-12 binds to receptors on naive CD4+ T cells, activating the STAT4 transcription factor, which drives the T cell to differentiate into a Th1 cell. The Th1 cell then secretes IFN-gamma to fully activate the macrophage, creating a positive feedback loop crucial for fighting intracellular infections.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 6-year-old child presents with recurrent, severe respiratory and gastrointestinal tract infections. A quantitative immunoglobulin panel reveals extremely low levels of all immunoglobulin classes (IgG, IgA, IgM). However, flow cytometry demonstrates a completely normal number of circulating mature CD19+ B cells. Which is the most likely diagnosis?', 
'["X-linked Agammaglobulinemia (XLA)", "Common Variable Immunodeficiency (CVID)", "Severe Combined Immunodeficiency (SCID)", "Hyper-IgM Syndrome"]'::jsonb, 
1, 
'This is the classic presentation of Common Variable Immunodeficiency (CVID). The hallmark of CVID is hypogammaglobulinemia across all classes, despite having normal (or near-normal) numbers of B cells. The defect lies in the terminal differentiation of B cells into antibody-secreting plasma cells. In contrast, X-linked agammaglobulinemia (XLA) also presents with absent immunoglobulins, but flow cytometry will show an absence of B cells (no CD19+ cells) due to a maturation block in the bone marrow.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient presents with pernicious anemia due to autoimmune destruction of parietal cells in the stomach. The autoantibodies produced in this condition target intrinsic factor and the H+/K+ ATPase pump. Which T cell subset is primarily responsible for helping B cells generate these high-affinity autoantibodies?', 
'["Th1 cells", "Th2 cells", "T follicular helper (Tfh) cells", "Cytotoxic T cells (CTLs)"]'::jsonb, 
2, 
'While Th1 and Th2 cells polarize the overall immune response, the specific subset of CD4+ T cells required to help B cells form germinal centers, undergo somatic hypermutation, and class-switch to produce high-affinity antibodies (including autoantibodies like those in pernicious anemia) are T follicular helper (Tfh) cells. Tfh cells reside in the B cell follicles and provide essential signals (via CD40L and IL-21) directly to B cells.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'During the alternative complement pathway, which molecule undergoes spontaneous hydrolysis in the plasma to initiate the cascade?', 
'["C1q", "C3", "Factor B", "Properdin"]'::jsonb, 
1, 
'The alternative pathway is part of the innate immune system and is constantly active at a low level ("tick-over"). It is initiated by the spontaneous, slow hydrolysis of the thioester bond in C3 in the plasma, forming C3(H2O). This molecule binds Factor B, which is then cleaved by Factor D to form the fluid-phase C3 convertase (C3(H2O)Bb). Properdin stabilizes the C3 convertase once it binds to a microbial surface.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A researcher is studying the mechanism of central tolerance for B cells in the bone marrow. If an immature B cell strongly recognizes a self-antigen presented on stromal cells, what is its primary initial defense mechanism against becoming an autoreactive clone?', 
'["Immediate apoptosis via the Fas/FasL pathway", "Receptor editing by reactivating RAG genes to alter the light chain", "Anergy induction", "Migration to the thymus for negative selection"]'::jsonb, 
1, 
'When an immature B cell in the bone marrow strongly cross-links its surface IgM with a multivalent self-antigen, it does not immediately die. Instead, it pauses development and reactivates the RAG genes. This allows it to undergo "receptor editing"—rearranging a different light chain (usually progressing from kappa to lambda) to create a new, non-autoreactive B cell receptor. If receptor editing fails to eliminate self-reactivity, the cell undergoes apoptosis.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 25-year-old female presents with recurrent miscarriages and a history of a deep vein thrombosis. Serological testing is positive for Lupus Anticoagulant. What is the target of the autoantibodies in this condition?', 
'["Double-stranded DNA", "Phospholipids and phospholipid-binding proteins", "Platelet glycoprotein IIb/IIIa", "Cardiolipin-cholesterol complexes in mitochondria"]'::jsonb, 
1, 
'The patient has Antiphospholipid Syndrome (APS). The autoantibodies in APS (such as Lupus Anticoagulant, anti-cardiolipin, and anti-beta-2-glycoprotein I) target phospholipids and phospholipid-binding proteins on cell membranes. In vivo, these antibodies activate endothelial cells and platelets, causing a hypercoagulable state leading to recurrent arterial/venous thromboses and pregnancy morbidity (due to placental thrombosis).'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following is the primary physiological function of the MHC Class II-associated invariant chain (Ii)?', 
'["It transports the MHC Class II molecule to the cell surface", "It stabilizes the empty MHC Class I groove", "It prevents the binding of endogenous peptides to MHC Class II in the endoplasmic reticulum", "It cleaves viral proteins in the endolysosome"]'::jsonb, 
2, 
'MHC Class II molecules are assembled in the endoplasmic reticulum (ER), the same location where endogenous peptides (destined for MHC Class I) are present. To prevent these endogenous peptides from filling the MHC Class II groove, the invariant chain (Ii) binds tightly into the groove, blocking it. The invariant chain also directs the MHC Class II complex to the endolysosomal compartment, where it is degraded (leaving only the CLIP peptide), allowing exogenous antigens to bind.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 40-year-old male undergoes treatment with a targeted biological agent that neutralizes Tumor Necrosis Factor-alpha (TNF-alpha). Before starting this medication, it is most critical to screen the patient for which of the following latent infections?', 
'["Hepatitis C virus", "Herpes simplex virus", "Mycobacterium tuberculosis", "Human papillomavirus"]'::jsonb, 
2, 
'TNF-alpha is critical for the formation and maintenance of granulomas, which act as "walls" to contain intracellular pathogens that cannot be fully eradicated. Neutralizing TNF-alpha (with drugs like infliximab, adalimumab, or etanercept) causes these granulomas to break down, leading to the rapid reactivation and dissemination of latent Mycobacterium tuberculosis. All patients must undergo a PPD or IGRA screening before starting anti-TNF therapy.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A healthy 30-year-old receives the oral polio vaccine (a live-attenuated vaccine). Two weeks later, tests show significant levels of neutralizing antibodies in his intestinal mucosa. These antibodies primarily belong to which isotype?', 
'["Monomeric IgA", "Secretory IgA (dimer)", "IgG", "IgM"]'::jsonb, 
1, 
'The oral polio vaccine (Sabin) replicates in the gastrointestinal tract, inducing a robust mucosal immune response. The primary antibody isotype produced in mucosal tissues and secreted into the gut lumen is Secretory IgA. Secretory IgA exists as a dimer (linked by a J chain) and is protected from intestinal proteases by a secretory component attached during transcytosis across the epithelium. Intramuscular vaccines (like the Salk polio vaccine) primarily induce systemic IgG, not mucosal IgA.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 3-month-old infant presents with oral thrush, chronic diarrhea, and failure to thrive. Lymphocyte subpopulation analysis reveals severely depressed T cell counts but normal B cell counts. However, serum immunoglobulin levels are exceptionally low. What is the best explanation for the hypogammaglobulinemia in this patient?', 
'["A primary defect in V(D)J recombination affecting both T and B cells", "A defect in Bruton tyrosine kinase (BTK)", "Lack of CD4+ T cell help required for B cell activation and class switching", "Accelerated destruction of immunoglobulins by the spleen"]'::jsonb, 
2, 
'This patient has a form of Severe Combined Immunodeficiency (SCID) categorized as T-negative, B-positive (T-B+ SCID), commonly caused by a mutation in the IL-2 receptor common gamma chain (X-linked SCID). Even though the B cells are present in normal numbers, they are completely non-functional because they absolutely require costimulation and cytokine help from CD4+ T cells to activate, class-switch, and produce functional antibodies. Therefore, a primary T cell defect functionally paralyzes the B cell compartment.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'The complement regulatory protein CD59 (MAC-inhibitory protein) protects host cells from complement-mediated lysis by binding to which complex in the complement cascade?', 
'["C3 convertase (C4b2a)", "C5 convertase", "C1qrs complex", "C5b-8 complex"]'::jsonb, 
3, 
'CD59 (Protectin) is a GPI-anchored surface protein that protects host cells from the terminal complement pathway. It functions by binding to the assembling C5b-8 complex and preventing the polymerization and insertion of multiple C9 molecules, thereby halting the formation of the Membrane Attack Complex (MAC). A defect in the GPI anchor (PIGA mutation) leads to the absence of CD59, causing Paroxysmal Nocturnal Hemoglobinuria (PNH).'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following events provides the "Signal 1" necessary for the activation of a naive CD8+ cytotoxic T cell?', 
'["Binding of the TCR to an MHC Class II-peptide complex on a dendritic cell", "Binding of the TCR to an MHC Class I-peptide complex on a dendritic cell", "Binding of CD28 to B7 (CD80/86)", "Binding of Fas Ligand to Fas"]'::jsonb, 
1, 
'Naive CD8+ T cells are restricted to MHC Class I. Signal 1 for their activation occurs when their T cell receptor (TCR) and CD8 coreceptor specifically bind to an MHC Class I molecule presenting a viral or tumor antigen on the surface of a professional antigen-presenting cell (usually a dendritic cell via cross-presentation). Signal 2 is the costimulatory binding of CD28 to B7.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 10-year-old girl is diagnosed with Type 1 Diabetes Mellitus. The destruction of her pancreatic beta cells is primarily a cell-mediated autoimmune process. Which T cell subset directly executes the targeted destruction of the insulin-producing beta cells?', 
'["Th1 cells", "Th2 cells", "Regulatory T cells (Tregs)", "CD8+ Cytotoxic T Lymphocytes (CTLs)"]'::jsonb, 
3, 
'Type 1 Diabetes Mellitus is an autoimmune disease where the insulin-producing beta cells of the pancreas are selectively destroyed. This destruction is primarily executed by autoreactive CD8+ Cytotoxic T Lymphocytes (CTLs). The CTLs recognize autoantigens (like insulin or glutamic acid decarboxylase) presented on MHC Class I molecules on the surface of the beta cells and induce apoptosis via perforin/granzyme or Fas/FasL pathways.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which region of an IgG antibody molecule contains the highly variable complementarity-determining regions (CDRs) that dictate its antigen-binding specificity?', 
'["The constant region of the heavy chain (CH)", "The constant region of the light chain (CL)", "The Fab fragment, specifically the Vh and Vl domains", "The Fc fragment"]'::jsonb, 
2, 
'The antigen-binding specificity of an antibody is determined by the Variable heavy (Vh) and Variable light (Vl) domains, which together form the tip of the Fab (Fragment antigen-binding) region. Within these variable domains are three hypervariable loops called complementarity-determining regions (CDRs). These CDRs form the physical pocket that contacts the specific epitope of the antigen.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient with a defect in the classical complement pathway is found to have a genetic deficiency in C4. This deficiency will directly impair the formation of which of the following?', 
'["C3(H2O)Bb", "C4b2a", "C3bBb", "C5b-9"]'::jsonb, 
1, 
'In the classical (and lectin) complement pathway, C1 cleaves C4 and C2. The larger fragments, C4b and C2a, bind together on the microbial surface to form the complex C4b2a. This complex is the classical pathway C3 convertase, whose function is to cleave thousands of C3 molecules. Without C4, the classical C3 convertase cannot form. C3(H2O)Bb and C3bBb are convertases of the alternative pathway.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 22-year-old medical student receives the Hepatitis B recombinant surface antigen vaccine. His immune system successfully mounts a humoral response. Which cell type is responsible for presenting this vaccine antigen to naive CD4+ T cells in the draining lymph node?', 
'["Macrophage", "B lymphocyte", "Plasmacytoid dendritic cell", "Conventional dendritic cell"]'::jsonb, 
3, 
'While macrophages and B cells can present antigens to previously activated memory T cells, the *only* antigen-presenting cells capable of initiating a primary immune response by activating *naive* T cells are conventional dendritic cells. They reside in tissues, phagocytose the vaccine antigen, mature, and migrate via lymphatics to the paracortex of the draining lymph node to present the antigen on MHC Class II to naive CD4+ T cells.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient presents with a severe fungal infection caused by Candida albicans. A mutation is found in the AIRE gene. Which of the following conditions does this patient likely have?', 
'["DiGeorge syndrome", "Autoimmune Polyendocrinopathy-Candidiasis-Ectodermal Dystrophy (APECED)", "Severe Combined Immunodeficiency (SCID)", "Hyper-IgM Syndrome"]'::jsonb, 
1, 
'Mutations in the AIRE (Autoimmune Regulator) gene cause APECED, also known as Autoimmune Polyendocrine Syndrome Type 1 (APS-1). The lack of AIRE impairs negative selection in the thymus, allowing autoreactive T cells to escape. This leads to autoimmune destruction of multiple endocrine glands (e.g., hypoparathyroidism, adrenal insufficiency). Patients also universally develop chronic mucocutaneous candidiasis due to autoantibodies against IL-17, neutralizing the Th17 response needed to fight Candida.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following cytokines, primarily produced by Th2 cells, is responsible for inducing B cells to undergo class switch recombination to produce IgE antibodies?', 
'["IL-2", "IL-4", "IL-5", "IFN-gamma"]'::jsonb, 
1, 
'Interleukin-4 (IL-4) is the hallmark cytokine of the Th2 response. It has two main functions: (1) it drives the differentiation of naive CD4+ T cells into Th2 cells, and (2) it acts on B cells to induce class switch recombination to the IgE isotype. IgE is essential for defense against helminths and mediates Type I hypersensitivity (allergic) reactions. IL-5, another Th2 cytokine, recruits and activates eosinophils.')

;
