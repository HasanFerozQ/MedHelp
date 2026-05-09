-- Batch 1: 20 Immunology MCQs for USMLE Step 1 (Sources: First Aid, Janeway, BRS, Abbas, Steinberg)
-- Topic ID: 5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 6-month-old male infant presents with recurrent, severe Streptococcus pneumoniae and Haemophilus influenzae infections. Flow cytometry shows an absence of CD19+ cells, but normal CD3+ cell counts. Which of the following is the most likely underlying defect?', 
'["Defective CD40 ligand", "Mutation in the WASp gene", "Defect in Bruton tyrosine kinase (BTK)", "Adenosine deaminase (ADA) deficiency"]'::jsonb, 
2, 
'This patient has X-linked agammaglobulinemia (XLA). It is caused by a defect in Bruton tyrosine kinase (BTK), which is essential for B-cell maturation. This leads to absent B cells (CD19+, CD20+) in the peripheral blood and low levels of all immunoglobulins. Patients typically present after 6 months of age (when maternal IgG wanes) with recurrent bacterial and enteroviral infections. T cells (CD3+) remain normal.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 24-year-old woman with a history of systemic lupus erythematosus (SLE) presents with a false-positive VDRL test and prolonged partial thromboplastin time (PTT) that does not correct upon mixing with normal plasma. She is at greatest risk for which of the following complications?', 
'["Spontaneous hemorrhage", "Recurrent deep vein thromboses", "Severe immunodeficiency", "Anaphylactic transfusion reactions"]'::jsonb, 
1, 
'This patient has antiphospholipid syndrome (APS), characterized by lupus anticoagulant (which falsely prolongs PTT in vitro) and anticardiolipin antibodies (which cause a false-positive VDRL/RPR). In vivo, these autoantibodies induce a hypercoagulable state, placing the patient at high risk for recurrent arterial and venous thromboses (e.g., DVT, stroke) and recurrent pregnancy loss. They do not cause bleeding despite the prolonged PTT.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'During a routine blood transfusion, a 35-year-old male develops sudden-onset hypotension, dyspnea, and hives within minutes of receiving packed red blood cells. Which of the following pre-existing conditions is most closely associated with this reaction?', 
'["Selective IgA deficiency", "Common variable immunodeficiency (CVID)", "Severe combined immunodeficiency (SCID)", "Chronic granulomatous disease (CGD)"]'::jsonb, 
0, 
'The patient is experiencing a severe anaphylactic reaction to a blood transfusion. This classically occurs in patients with selective IgA deficiency who have formed pre-existing anti-IgA antibodies (IgE type) against the small amount of IgA present in the donor blood product. Selective IgA deficiency is the most common primary immunodeficiency, often presenting asymptomatically or with recurrent sinopulmonary and gastrointestinal infections.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following cytokines is the most potent stimulator of acute-phase reactant production by the liver (e.g., CRP, fibrinogen) during an acute inflammatory response?', 
'["Interleukin-2 (IL-2)", "Interleukin-4 (IL-4)", "Interleukin-6 (IL-6)", "Interferon-gamma (IFN-γ)"]'::jsonb, 
2, 
'Interleukin-6 (IL-6) is the primary cytokine responsible for stimulating the liver to synthesize acute-phase proteins, such as C-reactive protein (CRP), fibrinogen, and hepcidin. It is produced by macrophages, endothelial cells, and T cells in response to tissue injury or infection. IL-2 stimulates T cell proliferation, IL-4 induces Th2 differentiation and IgE class switching, and IFN-γ activates macrophages.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient receives an organ transplant. Two weeks later, the graft begins to fail. Biopsy of the graft reveals dense infiltration of the tissue by CD8+ T lymphocytes and macrophages. This process is most characteristic of which type of rejection?', 
'["Hyperacute rejection", "Acute cellular rejection", "Chronic rejection", "Graft-versus-host disease (GVHD)"]'::jsonb, 
1, 
'This describes acute cellular rejection, which typically occurs weeks to months after transplantation. It is a Type IV hypersensitivity reaction mediated primarily by recipient CD8+ cytotoxic T cells attacking donor MHC antigens, accompanied by macrophage infiltration. Hyperacute rejection occurs within minutes to hours (preformed antibodies). Chronic rejection occurs over months to years (fibrosis/atherosclerosis).'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A macrophage phagocytoses a viral pathogen. The viral proteins are degraded into peptides by the proteasome and transported into the endoplasmic reticulum by TAP. These peptides will be presented on the cell surface bound to which of the following molecules?', 
'["MHC Class I", "MHC Class II", "CD1", "Toll-like receptor 4 (TLR4)"]'::jsonb, 
0, 
'Endogenous antigens (such as viral proteins synthesized within an infected cell or degraded in the cytosol) are processed by the proteasome, transported into the rough ER via TAP (Transporter associated with Antigen Processing), and loaded onto MHC Class I molecules. MHC Class I then presents these peptides to CD8+ cytotoxic T cells. MHC Class II presents exogenous antigens to CD4+ helper T cells.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 5-year-old boy presents with recurrent skin abscesses caused by Staphylococcus aureus and Aspergillus pneumonia. Nitroblue tetrazolium (NBT) testing shows failure of neutrophils to turn blue. The defective enzyme in this condition normally uses which of the following as a substrate?', 
'["Hydrogen peroxide", "Myeloperoxidase", "NADPH", "Superoxide dismutase"]'::jsonb, 
2, 
'This patient has Chronic Granulomatous Disease (CGD), caused by a deficiency of NADPH oxidase. This enzyme complex is responsible for the respiratory burst in neutrophils, which generates superoxide radicals to kill phagocytosed microbes. The enzyme uses NADPH as its primary substrate (and oxygen) to form superoxide. A negative NBT test (no blue color) or an abnormal dihydrorhodamine (DHR) flow cytometry test confirms the diagnosis.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following cell surface markers is uniquely expressed on regulatory T cells (Tregs) and plays a critical role in their ability to suppress the immune response?', 
'["CD14", "CD19", "FoxP3", "CD56"]'::jsonb, 
2, 
'Regulatory T cells (Tregs) are specialized CD4+ T cells that maintain peripheral tolerance and suppress immune responses. They characteristically express CD4, CD25 (IL-2 receptor alpha chain), and the master transcription factor FoxP3. Mutations in the FOXP3 gene lead to IPEX syndrome (Immune dysregulation, Polyendocrinopathy, Enteropathy, X-linked), highlighting its critical role in self-tolerance.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 22-year-old woman develops a pruritic, erythematous rash at the site where she wears a nickel-plated necklace. The reaction reaches peak intensity 48 hours after exposure. Which cell type is the primary mediator of this hypersensitivity reaction?', 
'["IgE-bound Mast cells", "Th1 lymphocytes", "Neutrophils", "B lymphocytes"]'::jsonb, 
1, 
'Contact dermatitis (e.g., to nickel, poison ivy) is a classic example of a Type IV (delayed-type) hypersensitivity reaction. It is mediated by antigen-specific Th1 lymphocytes (and sometimes CD8+ T cells) that release cytokines like IFN-γ upon re-exposure to the antigen, recruiting macrophages and causing inflammation. It takes 24-72 hours to develop. IgE and mast cells mediate Type I hypersensitivity (e.g., anaphylaxis).'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A researcher develops a monoclonal antibody that blocks the interaction between CD28 on T cells and B7 on antigen-presenting cells. Administration of this drug will most likely result in which of the following?', 
'["T cell anergy", "Enhanced T cell proliferation", "Increased antibody class switching", "Activation of the complement cascade"]'::jsonb, 
0, 
'For full activation, naive T cells require two signals: (1) TCR binding to the MHC-peptide complex on an APC, and (2) a costimulatory signal from CD28 on the T cell binding to B7 (CD80/86) on the APC. If the costimulatory signal is blocked or absent while signal 1 occurs, the T cell becomes unresponsive to the antigen, a state known as anergy. This is a mechanism of peripheral tolerance.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A neonate presents with hypocalcemia, tetany, and a cleft palate. A chest X-ray shows an absent thymic shadow. Which of the following developmental abnormalities is the primary cause of this condition?', 
'["Failure of the 3rd and 4th pharyngeal pouches to develop", "Defect in the 1st pharyngeal arch", "Failure of neural crest cell migration", "Defect in the 2nd pharyngeal cleft"]'::jsonb, 
0, 
'This patient has DiGeorge syndrome (22q11.2 deletion syndrome), characterized by thymic aplasia (causing T-cell deficiency), parathyroid hypoplasia (causing hypocalcemia and tetany), and cardiac/facial defects. The underlying embryological defect is the failure of the 3rd and 4th pharyngeal pouches to develop properly, leading to the absence or hypoplasia of the thymus and parathyroid glands.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A previously healthy 8-year-old boy develops acute poststreptococcal glomerulonephritis 2 weeks after a streptococcal skin infection. Immunofluorescence of a kidney biopsy reveals "lumpy-bumpy" granular deposits of IgG and C3 along the glomerular basement membrane. This pathology is driven by which hypersensitivity type?', 
'["Type I", "Type II", "Type III", "Type IV"]'::jsonb, 
2, 
'Poststreptococcal glomerulonephritis (PSGN) is a classic Type III hypersensitivity reaction. It is caused by the deposition of circulating immune complexes (antigen-antibody complexes) in the glomeruli. These complexes activate the classical complement pathway, leading to consumption of C3, recruitment of neutrophils, and subsequent tissue damage. The "lumpy-bumpy" appearance on immunofluorescence is characteristic of immune complex deposition.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 12-month-old boy has experienced multiple episodes of Neisseria meningitidis bacteremia. Further immunological workup shows normal T cell and B cell counts, normal immunoglobulin levels, and normal oxidative burst. He most likely has a deficiency in which of the following?', 
'["C1 inhibitor", "C5-C9 (Terminal complement components)", "C3", "CD18 (Integrin)"]'::jsonb, 
1, 
'Patients with recurrent infections exclusively caused by Neisseria species (meningococcus or gonococcus) typically have a deficiency in the terminal complement components (C5, C6, C7, C8, or C9), which form the Membrane Attack Complex (MAC). The MAC is crucial for lysing thin-walled Gram-negative bacteria like Neisseria. A C3 deficiency would cause severe, recurrent pyogenic infections with many different capsulated organisms.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient with Goodpasture syndrome develops rapidly progressive glomerulonephritis and hemoptysis. Pathogenesis involves autoantibodies directed against the non-collagenous domain of the alpha-3 chain of Type IV collagen. Which immunofluorescence pattern would be expected on renal biopsy?', 
'["Granular deposition along the GBM", "Linear deposition along the GBM", "Mesangial IgA deposition", "Negative immunofluorescence (Pauci-immune)"]'::jsonb, 
1, 
'Goodpasture syndrome is a Type II hypersensitivity reaction where autoantibodies directly bind to fixed antigens on the glomerular basement membrane (anti-GBM antibodies) and alveolar basement membrane. Because the antibodies bind uniformly along the continuous basement membrane, direct immunofluorescence reveals a smooth, linear ribbon-like pattern of IgG and C3 deposition, distinguishing it from the granular pattern of Type III immune complex diseases.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which class of immunoglobulin is structurally a pentamer when secreted, is the first antibody produced during a primary immune response, and is the most efficient activator of the classical complement pathway?', 
'["IgG", "IgA", "IgM", "IgE"]'::jsonb, 
2, 
'IgM exists as a monomer on the surface of B cells but forms a large pentamer (stabilized by a J chain) when secreted into serum. Because it has 10 antigen-binding sites, it has very high avidity. It is the first antibody isotype produced in the primary humoral response. Its multimeric structure makes it extremely efficient at fixing complement (C1q binding) to initiate the classical cascade.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 30-year-old pregnant woman is found to be Rh-negative. Her partner is Rh-positive. To prevent hemolytic disease of the newborn (HDN) in future pregnancies, she is given anti-D immune globulin (RhoGAM) at 28 weeks and postpartum. This drug works by which of the following mechanisms?', 
'["Active immunization against the D antigen", "Neutralization of maternal anti-D antibodies", "Opsonization and clearance of fetal Rh+ RBCs from maternal circulation", "Stimulation of fetal regulatory T cells"]'::jsonb, 
2, 
'RhoGAM is exogenous IgG anti-D antibody. When administered to an Rh-negative mother, it binds to any fetal Rh-positive red blood cells that have crossed the placenta into her circulation. These antibody-coated fetal RBCs are rapidly cleared by maternal splenic macrophages before the mother''s own immune system can recognize the Rh antigen and mount a primary immune response (sensitization).'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A young child presents with delayed separation of the umbilical cord, recurrent bacterial skin infections lacking pus, and severe periodontitis. Laboratory studies show profound neutrophilia in the blood. This condition is caused by a defect in which of the following molecules?', 
'["CD18 (LFA-1 integrin)", "NADPH oxidase", "Myeloperoxidase", "Bruton tyrosine kinase"]'::jsonb, 
0, 
'This is the classic presentation of Leukocyte Adhesion Deficiency (LAD) Type 1. It is an autosomal recessive defect in the CD18 beta-2 integrin subunit (part of LFA-1 and Mac-1). Neutrophils cannot adhere to the endothelial wall and extravasate into tissues. Consequently, patients suffer from infections without pus formation (since neutrophils can''t reach the site) and show massive neutrophilia in the blood because the cells are stuck in circulation.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Natural Killer (NK) cells are innate immune cells that induce apoptosis in virally infected or tumor cells. What signal prevents an NK cell from killing a healthy host cell?', 
'["Expression of MHC Class I on the target cell", "Expression of MHC Class II on the target cell", "Binding of IgG to the target cell surface", "Secretion of IL-10 by the target cell"]'::jsonb, 
0, 
'NK cells operate on a balance of activating and inhibitory receptors. Their killer immunoglobulin-like receptors (KIRs) recognize and bind to normal self MHC Class I molecules expressed on healthy cells, delivering a strong inhibitory signal that prevents killing. Many viruses and tumor cells downregulate MHC Class I to evade cytotoxic T cells; NK cells detect this "missing self" (lack of the inhibitory signal) and destroy the cell.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient with a history of recurrent Neisseria infections is given a live-attenuated viral vaccine. Which component of the immune system is most critical for clearing this intracellular viral infection?', 
'["B lymphocytes and IgM", "Complement Membrane Attack Complex", "Eosinophils and IgE", "CD8+ Cytotoxic T Lymphocytes"]'::jsonb, 
3, 
'Live-attenuated viral vaccines replicate inside host cells, mimicking a natural viral infection. The most critical immune mechanism for clearing intracellular viral infections is the cell-mediated immune response, specifically CD8+ cytotoxic T lymphocytes (CTLs). CTLs recognize viral peptides presented on MHC Class I molecules by the infected cells and induce apoptosis. Antibodies (B cells) neutralize extracellular virus, but CTLs eradicate the intracellular reservoir.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 45-year-old male with asthma is prescribed a monoclonal antibody, omalizumab, for severe disease resistant to corticosteroids. Omalizumab improves asthma symptoms by directly binding to which of the following?', 
'["IL-5", "The Fc portion of unbound IgE", "Histamine receptors on smooth muscle", "The IgE receptor (FcεRI) on mast cells"]'::jsonb, 
1, 
'Omalizumab is an anti-IgE recombinant humanized monoclonal antibody. It binds to the Fc portion of free, unbound circulating IgE in the blood. By doing so, it prevents IgE from binding to the high-affinity IgE receptors (FcεRI) on the surface of mast cells and basophils, thereby preventing their degranulation and the subsequent release of allergic mediators like histamine and leukotrienes in allergic asthma.')

;
