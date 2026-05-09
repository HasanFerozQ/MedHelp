-- Batch 5: 20 Immunology MCQs for USMLE Step 1 (Sources: First Aid, Janeway, BRS, Abbas, Steinberg)
-- Topic ID: 5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 24-year-old female with a history of recurrent Neisseria infections is diagnosed with a late complement component deficiency (C5-C9). Which of the following laboratory assays is the most appropriate screening test to confirm a deficiency in the classical or terminal complement pathway?', 
'["AH50 assay", "CH50 assay", "C-reactive protein (CRP) level", "Quantitative immunoglobulin panel"]'::jsonb, 
1, 
'The CH50 (Total Hemolytic Complement) assay is the best screening test for deficiencies in the classical and terminal complement pathways (C1 through C9). It measures the ability of the patient''s serum to lyse sheep red blood cells coated with rabbit antibodies. If any component from C1 to C9 is missing, the CH50 will be very low or zero. The AH50 assay screens specifically for the alternative pathway.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'During an inflammatory response, neutrophils migrate from the bloodstream into the tissue. The initial "rolling" phase of leukocyte extravasation is mediated primarily by interactions between sialyl-Lewis X on the neutrophil and which of the following molecules on the activated endothelium?', 
'["ICAM-1", "VCAM-1", "E-selectin and P-selectin", "PECAM-1 (CD31)"]'::jsonb, 
2, 
'Leukocyte extravasation occurs in four steps: (1) Rolling, (2) Tight Adhesion, (3) Diapedesis (transmigration), and (4) Chemotaxis. The initial rolling phase is mediated by low-affinity interactions between Sialyl-Lewis X (a carbohydrate ligand on the neutrophil) and E-selectin/P-selectin expressed on activated endothelial cells. Tight adhesion is mediated by integrins binding to ICAM-1/VCAM-1, and diapedesis is mediated by PECAM-1.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 60-year-old male receives a bone marrow transplant for acute myeloid leukemia. Four weeks later, he develops a maculopapular rash on his palms and soles, profuse watery diarrhea, and jaundice. Which immune cells are primarily responsible for this complication?', 
'["Recipient CD8+ T cells", "Donor CD4+ and CD8+ T cells", "Recipient B cells", "Donor Natural Killer (NK) cells"]'::jsonb, 
1, 
'This patient has Graft-Versus-Host Disease (GVHD). In a bone marrow (hematopoietic stem cell) transplant, the "graft" contains mature, immunocompetent donor T cells. If these donor T cells recognize the recipient''s HLA antigens as foreign, they become activated, proliferate, and attack the recipient''s tissues. GVHD classically targets the skin (rash), liver (jaundice), and gastrointestinal tract (diarrhea). It is driven by donor CD4+ and CD8+ T cells.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient is infected with a virus that completely downregulates the expression of MHC Class I molecules on the surface of infected host cells to evade CD8+ T cell recognition. Which cell type of the innate immune system is specifically equipped to detect and destroy these MHC Class I-deficient cells?', 
'["Macrophages", "Neutrophils", "Natural Killer (NK) cells", "Eosinophils"]'::jsonb, 
2, 
'Natural Killer (NK) cells recognize the absence of MHC Class I on cell surfaces, a concept known as "missing self." Normal cells express MHC Class I, which binds to inhibitory receptors on NK cells, preventing them from killing the cell. When a virus or tumor downregulates MHC Class I, this inhibitory signal is lost, and activating signals (from stress ligands) dominate, prompting the NK cell to release perforin and granzymes to induce apoptosis in the target cell.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following describes the mechanism of hyperacute graft rejection, which occurs within minutes to hours after a solid organ transplant?', 
'["Activation of recipient CD8+ T cells against donor MHC", "Preformed recipient antibodies reacting against donor endothelial HLA or ABO antigens", "Donor T cells reacting against recipient tissues", "Chronic cytokine release stimulating fibrosis"]'::jsonb, 
1, 
'Hyperacute rejection occurs almost immediately (minutes to hours) after restoring blood flow to a transplanted organ. It is a Type II hypersensitivity reaction caused by pre-existing (preformed) recipient antibodies (often IgG against donor HLA due to previous pregnancies, transfusions, or transplants, or IgM against ABO blood group antigens). These antibodies bind to the graft endothelium, activating complement and causing massive thrombosis and ischemic necrosis.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 14-year-old girl is diagnosed with a helminthic infection (Ascaris lumbricoides). Her peripheral blood smear shows a marked increase in eosinophils. Which cytokine is the major chemoattractant for eosinophils to the site of infection?', 
'["IL-1", "IL-5", "IL-8", "TNF-alpha"]'::jsonb, 
1, 
'Interleukin-5 (IL-5), produced by Th2 cells, is the primary cytokine responsible for the proliferation, activation, and chemotaxis of eosinophils. While eotaxin is also a specific chemokine for eosinophils, IL-5 is the master regulator. IL-8 (CXCL8) is the primary chemoattractant for neutrophils.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient presents with recurrent oral thrush and viral pneumonias. Laboratory tests reveal a profound defect in the maturation of T cells in the thymus. Which specific area of the lymph node would you expect to be markedly hypoplastic (underdeveloped) or devoid of cells in this patient?', 
'["Primary follicles", "Germinal centers", "Paracortex", "Medullary cords"]'::jsonb, 
2, 
'The lymph node is divided into specific zones for different cell types. B cells reside in the follicles (cortex), which form germinal centers upon activation. Plasma cells reside in the medullary cords. T cells reside predominantly in the paracortex (the inner cortex region between the follicles and the medulla). In patients with a severe T cell deficiency (e.g., DiGeorge syndrome), the paracortex will be extremely hypoplastic or absent on histological examination.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'In the classical complement pathway, the C1 complex (C1q, C1r, C1s) must bind to the Fc portion of antibodies attached to an antigen. How many IgG molecules must be in close proximity for C1q to bind and activate the cascade, compared to IgM?', 
'["One IgG or one IgM", "Two IgGs or one IgM pentamer", "Five IgGs or two IgM pentamers", "One IgG or two IgM pentamers"]'::jsonb, 
1, 
'The C1q molecule has six globular heads and requires multi-point attachment to activate the classical pathway. Because IgG is a monomer, at least two IgG molecules must bind to the antigen in close proximity to cross-link C1q. In contrast, secreted IgM is a massive pentamer with five closely spaced Fc regions. A single IgM pentamer bound to an antigen is sufficient to bind C1q and robustly activate the classical complement pathway.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 50-year-old male with chronic hepatitis B infection develops palpable purpura on his lower extremities, arthralgias, and peripheral neuropathy. Biopsy of a skin lesion reveals necrotizing vasculitis with fibrinoid necrosis and immune complex deposition in the vessel walls. This condition (Polyarteritis Nodosa) is primarily mediated by which hypersensitivity mechanism?', 
'["Type I", "Type II", "Type III", "Type IV"]'::jsonb, 
2, 
'Polyarteritis Nodosa (PAN) associated with Hepatitis B is a classic example of a Type III hypersensitivity reaction. The chronic viral infection provides a constant source of antigen, leading to the continuous formation of circulating antigen-antibody (HBsAg-anti-HBs) immune complexes. These complexes deposit in the walls of medium-sized arteries, activating complement and recruiting neutrophils, which cause fibrinoid necrosis and necrotizing vasculitis.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following transcription factors is induced by IL-12 signaling and is the master regulator driving the differentiation of naive CD4+ T cells into the Th1 subset?', 
'["GATA-3", "T-bet", "FoxP3", "RORγt"]'::jsonb, 
1, 
'T-bet is the master transcription factor for Th1 cell differentiation. IL-12 and IFN-gamma signaling upregulates T-bet, which commits the cell to the Th1 lineage and induces the production of large amounts of IFN-gamma. GATA-3 is the master regulator for Th2 cells (induced by IL-4). RORγt is the master regulator for Th17 cells (induced by TGF-beta and IL-6). FoxP3 is the master regulator for Regulatory T cells (Tregs).'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 10-year-old boy steps on a rusty nail. A local macrophage phagocytoses Clostridium tetani bacteria. During the presentation of these bacterial peptide antigens to T cells, the MHC Class II molecule is transported from the ER to the endolysosome. Which molecule replaces the CLIP peptide in the MHC Class II groove before it reaches the cell surface?', 
'["Beta-2 microglobulin", "The exogenous bacterial peptide", "An endogenous viral peptide", "The invariant chain"]'::jsonb, 
1, 
'In the ER, the MHC Class II groove is blocked by the invariant chain. In the endolysosome, the invariant chain is degraded down to a small fragment called CLIP, which remains in the groove. A chaperone protein called HLA-DM facilitates the removal of CLIP and the loading of the exogenous bacterial peptide (from the phagocytosed C. tetani) into the MHC Class II groove. The complex is then transported to the cell surface.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient presents with a severe anaphylactic reaction after a bee sting. Epinephrine is administered immediately. Which of the following is the primary mechanism by which epinephrine reverses anaphylaxis?', 
'["It acts as an antihistamine, blocking H1 receptors on blood vessels", "It stimulates beta-2 receptors causing bronchodilation and alpha-1 receptors causing vasoconstriction", "It rapidly degrades circulating IgE antibodies", "It prevents antigen binding to the T cell receptor"]'::jsonb, 
1, 
'Epinephrine is the life-saving treatment for anaphylaxis because it is a potent agonist at both alpha and beta adrenergic receptors, acting as a physiological antagonist to the effects of massive mast cell degranulation. Stimulation of alpha-1 receptors causes profound vasoconstriction, reversing hypotension and reducing mucosal edema (e.g., in the airway). Stimulation of beta-2 receptors causes rapid bronchodilation, reversing the severe bronchospasm.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 35-year-old female presents with fatigue, ptosis (drooping eyelids), and diplopia that worsens as the day progresses. She is diagnosed with Myasthenia Gravis. The pathogenesis involves autoantibodies that cause disease via which mechanism?', 
'["Cross-linking IgE on mast cells in the neuromuscular junction", "Complement-mediated lysis of motor neurons", "Binding to and blocking the acetylcholine receptor at the motor end plate", "Forming immune complexes in the capillaries supplying the muscle"]'::jsonb, 
2, 
'Myasthenia Gravis is a Type II hypersensitivity disorder. Autoantibodies (usually IgG) bind directly to nicotinic acetylcholine receptors on the post-synaptic motor end plate of skeletal muscle. This binding does three things: it competitively blocks acetylcholine from binding, it induces receptor internalization and degradation, and it activates complement causing local damage to the end plate. The result is progressive muscle weakness with use.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'In the context of tumor immunology, some cancer cells evade destruction by CD8+ cytotoxic T cells by upregulating which of the following surface molecules, leading to T cell exhaustion and apoptosis?', 
'["CD28", "PD-L1", "B7-1 (CD80)", "MHC Class I"]'::jsonb, 
1, 
'Programmed Death-Ligand 1 (PD-L1) is an immune checkpoint protein. Many tumors upregulate PD-L1 to evade the immune system. When PD-L1 on the tumor cell binds to the PD-1 receptor on an activated CD8+ T cell, it delivers a powerful inhibitory signal that suppresses T cell proliferation, decreases cytokine production, and induces T cell exhaustion or apoptosis. Monoclonal antibodies targeting PD-1 (e.g., pembrolizumab) or PD-L1 block this interaction, restoring the anti-tumor immune response.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following primary immunodeficiencies is characterized by a failure of the thymus and parathyroid glands to develop due to a microdeletion on chromosome 22q11.2?', 
'["Severe Combined Immunodeficiency (SCID)", "DiGeorge syndrome", "Wiskott-Aldrich syndrome", "Chediak-Higashi syndrome"]'::jsonb, 
1, 
'DiGeorge syndrome (22q11.2 deletion syndrome) results from the failure of the 3rd and 4th pharyngeal pouches to develop. This leads to thymic aplasia (causing a severe deficiency of mature T cells and resulting in recurrent viral/fungal infections) and parathyroid hypoplasia (causing hypocalcemia and tetany). Patients often also have conotruncal cardiac defects (e.g., Tetralogy of Fallot) and characteristic facial features.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 2-year-old child gets a splinter in his finger. Within hours, the area becomes red, warm, and swollen. Which cytokine, released primarily by tissue macrophages, is the major mediator of this acute local inflammation and acts by increasing vascular permeability and upregulating endothelial adhesion molecules?', 
'["IL-10", "TGF-beta", "TNF-alpha", "IFN-gamma"]'::jsonb, 
2, 
'Tumor Necrosis Factor-alpha (TNF-alpha) and Interleukin-1 (IL-1) are the two major pro-inflammatory cytokines secreted by macrophages upon encountering a pathogen (e.g., via TLR activation). TNF-alpha acts locally on endothelial cells to increase vascular permeability (causing swelling) and upregulate the expression of selectins and integrin ligands (like ICAM-1) to recruit neutrophils to the site of infection.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient presents with a severe bacterial infection. Laboratory tests reveal a defect in the alternative complement pathway. Which protein is normally responsible for stabilizing the C3 convertase (C3bBb) on microbial surfaces in this pathway?', 
'["C1 inhibitor", "Factor D", "Properdin", "Factor H"]'::jsonb, 
2, 
'Properdin (Factor P) is a crucial positive regulator of the alternative complement pathway. The alternative pathway C3 convertase (C3bBb) is highly unstable and rapidly decays in plasma. Properdin binds to the C3bBb complex specifically on microbial surfaces, stabilizing it and dramatically extending its half-life, allowing for massive amplification of C3 cleavage and subsequent MAC formation or opsonization.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 30-year-old female presents with joint pain, a butterfly rash on her face, and proteinuria. Which of the following autoantibodies is highly specific for the diagnosis of Systemic Lupus Erythematosus (SLE) and correlates with disease activity, particularly lupus nephritis?', 
'["Anti-nuclear antibody (ANA)", "Anti-dsDNA antibody", "Anti-centromere antibody", "Rheumatoid factor"]'::jsonb, 
1, 
'While Anti-Nuclear Antibodies (ANA) are highly sensitive for SLE (present in >95% of patients), they are not specific. Anti-double-stranded DNA (anti-dsDNA) and Anti-Smith (anti-Sm) antibodies are highly specific for SLE. Furthermore, the titer of anti-dsDNA antibodies uniquely correlates with disease activity; rising levels often precede or accompany a clinical flare, particularly the development of severe lupus nephritis.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following processes ensures that a single mature B cell produces antibodies of only one specific antigen-binding specificity, expressing either a kappa or a lambda light chain, but never both?', 
'["Isotype switching", "Allelic exclusion", "Somatic hypermutation", "Affinity maturation"]'::jsonb, 
1, 
'Allelic exclusion is the process that ensures each B cell (and T cell) expresses only one receptor specificity. During B cell development, if the heavy chain gene rearrangement on one chromosome is successful, the homologous gene on the other chromosome is permanently silenced. The same happens for the light chains (kappa is tried first on both chromosomes, then lambda). This guarantees that every antibody produced by that clonal B cell line has the exact same antigen-binding site.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A neonate presents with failure to thrive, chronic diarrhea, and widespread candidiasis. Flow cytometry of peripheral blood shows an absence of both CD3+ T cells and CD19+ B cells. Which of the following enzymes is most likely deficient in this patient?', 
'["Adenosine deaminase (ADA)", "Bruton tyrosine kinase (BTK)", "Myeloperoxidase (MPO)", "NADPH oxidase"]'::jsonb, 
0, 
'This is a classic presentation of Severe Combined Immunodeficiency (SCID) categorized as T-negative, B-negative (T-B- SCID). The most common cause of this specific phenotype is Adenosine Deaminase (ADA) deficiency. The lack of ADA leads to the intracellular accumulation of toxic purine metabolites (dATP), which profoundly inhibit DNA synthesis. Because both T and B lymphocytes undergo rapid proliferation during development, this toxicity kills both lineages, leaving the patient completely devoid of adaptive immunity.')

;
