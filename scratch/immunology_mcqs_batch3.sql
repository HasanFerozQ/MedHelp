-- Batch 3: 20 Immunology MCQs for USMLE Step 1 (Sources: First Aid, Janeway, BRS, Abbas, Steinberg)
-- Topic ID: 5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 3-year-old boy has a history of recurrent Neisseria gonorrhoeae and N. meningitidis infections. Tests show an absence of C8. Which immune mechanism is fundamentally defective in this patient?', 
'["Opsonization of encapsulated bacteria", "Chemotaxis of neutrophils to the site of infection", "Formation of pores in bacterial cell membranes", "Neutralization of bacterial toxins"]'::jsonb, 
2, 
'C8 is a critical component of the terminal complement pathway (C5b, C6, C7, C8, C9), which assembles to form the Membrane Attack Complex (MAC). The MAC inserts into target cell membranes to form a pore, causing osmotic lysis. While the MAC is generally ineffective against thick-walled Gram-positive bacteria, it is the primary and essential mechanism for killing thin-walled Gram-negative Neisseria species. Opsonization depends primarily on C3b.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient presents with recurrent episodes of non-pruritic, non-pitting edema of the face, lips, and airway without urticaria. Laboratory analysis shows low C4 levels. Which of the following is contraindicated in this patient due to the risk of triggering an attack?', 
'["ACE inhibitors", "Beta-blockers", "Corticosteroids", "Epinephrine"]'::jsonb, 
0, 
'This patient has Hereditary Angioedema (HAE), an autosomal dominant disorder caused by a deficiency or dysfunction of C1 esterase inhibitor (C1-INH). C1-INH normally inhibits C1 (preventing runaway classical complement activation, hence low C4) and inhibits kallikrein. Kallikrein normally converts kininogen to bradykinin (a potent vasodilator causing edema). ACE normally breaks down bradykinin. Therefore, ACE inhibitors prevent bradykinin degradation, causing a massive build-up and triggering severe angioedema attacks.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'During somatic hypermutation in germinal centers, B cells that produce lower-affinity antibodies are eliminated. Which cell type is primarily responsible for selecting and rescuing B cells that have successfully generated high-affinity B cell receptors?', 
'["Follicular dendritic cells (FDCs)", "T follicular helper (Tfh) cells", "Macrophages", "Plasmacytoid dendritic cells"]'::jsonb, 
0, 
'Follicular dendritic cells (FDCs) are specialized stromal cells residing in the B cell follicles of lymph nodes. FDCs display intact, unprocessed antigen on their surface using Fc and complement receptors. B cells undergoing somatic hypermutation compete to bind these displayed antigens. Only those B cells that have mutated to possess the highest affinity receptors can successfully bind the limited antigen, retrieve it, and present it to Tfh cells to receive survival signals.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 22-year-old male is bitten by a rattlesnake and is treated with equine (horse-derived) antivenom. One week later, he develops fever, an urticarial rash, arthralgias, and proteinuria. This clinical presentation is mediated by which of the following?', 
'["IgE binding to mast cells", "Immune complex deposition", "CD8+ T cell-mediated cytotoxicity", "Macrophage activation by IFN-gamma"]'::jsonb, 
1, 
'This patient is suffering from Serum Sickness, a classic Type III hypersensitivity reaction. It occurs 1-2 weeks after the administration of foreign proteins (like horse serum in antivenom or certain monoclonal antibodies). The patient''s immune system produces IgG antibodies against the foreign proteins, forming circulating antigen-antibody immune complexes. These complexes deposit in blood vessels, joints, and glomeruli, activating complement and causing vasculitis, arthritis, and nephritis.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following describes the mechanism of action of the immunosuppressive drug Mycophenolate mofetil?', 
'["Inhibits calcineurin, preventing IL-2 transcription", "Inhibits inosine monophosphate dehydrogenase, blocking de novo purine synthesis", "Alkylates DNA, preventing cell division", "Binds CD52, causing widespread lymphocyte depletion"]'::jsonb, 
1, 
'Mycophenolate mofetil is rapidly hydrolyzed to mycophenolic acid, a potent, reversible inhibitor of inosine monophosphate dehydrogenase (IMPDH). IMPDH is the rate-limiting enzyme in the de novo synthesis of guanine nucleotides (purines). Because T and B lymphocytes lack a significant purine salvage pathway, they are critically dependent on this de novo pathway for proliferation. Thus, mycophenolate selectively suppresses lymphocyte expansion.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 40-year-old female presents with dry eyes, a dry mouth, and bilateral parotid gland enlargement. Serological testing is positive for anti-Ro/SSA and anti-La/SSB autoantibodies. Biopsy of her minor salivary glands would most likely show infiltration by which of the following cell types?', 
'["Neutrophils", "Eosinophils", "Lymphocytes", "Giant cells"]'::jsonb, 
2, 
'The patient has Sjögren syndrome, an autoimmune disorder characterized by the destruction of exocrine glands, particularly the lacrimal and salivary glands. The hallmark histopathological finding is a dense focal lymphocytic infiltrate (primarily CD4+ T cells and B cells) within the affected glands, which progressively replaces the glandular epithelium and causes sicca symptoms (dryness).'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'The binding of an antigen to the T cell receptor (TCR) initiates an intracellular signaling cascade. Which of the following molecules directly associates with the TCR and contains ITAMs (Immunoreceptor Tyrosine-based Activation Motifs) that are phosphorylated to transmit the signal inward?', 
'["CD3", "CD4", "CD28", "CTLA-4"]'::jsonb, 
0, 
'The T cell receptor (TCR) itself lacks an intracellular signaling tail. It must physically associate with the CD3 complex (consisting of gamma, delta, epsilon, and zeta chains). The cytoplasmic tails of the CD3 chains contain ITAMs. When the TCR binds an MHC-peptide complex, the Src-family kinase Lck phosphorylates these ITAMs, recruiting ZAP-70 and initiating the downstream intracellular signaling cascade that leads to T cell activation.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 15-year-old girl develops a diffuse maculopapular rash after taking ampicillin for a viral infection. In this scenario, the ampicillin molecule is too small to elicit an immune response on its own. Instead, it covalently binds to host serum proteins to become immunogenic. The ampicillin molecule is acting as a(n):', 
'["Adjuvant", "Hapten", "Superantigen", "Epitope"]'::jsonb, 
1, 
'A hapten is a small molecule that is antigenic (can bind to an antibody or TCR) but is not immunogenic on its own (cannot elicit an immune response). To induce an immune response, a hapten must covalently bind to a larger carrier protein (like serum albumin). Penicillin and its derivatives often act as haptens, binding to host proteins and triggering drug-induced hypersensitivity reactions.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following immunoglobulins is the only class capable of crossing the placenta to provide passive immunity to the fetus?', 
'["IgA", "IgD", "IgE", "IgG"]'::jsonb, 
3, 
'IgG is the only immunoglobulin class capable of crossing the human placenta. This transplacental transfer is an active process mediated by the neonatal Fc receptor (FcRn) expressed on the syncytiotrophoblast of the placenta. This provides the fetus and newborn with passive humoral immunity against pathogens the mother has encountered, which lasts for approximately the first 6 months of life.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A subset of T cells expressing the gamma-delta (γδ) T cell receptor is found predominantly in which of the following anatomical locations?', 
'["Thymic cortex", "Splenic white pulp", "Epithelial layers (skin and mucosa)", "Lymph node paracortex"]'::jsonb, 
2, 
'Unlike the majority of T cells which express an alpha-beta (αβ) TCR and circulate in the blood and secondary lymphoid organs, gamma-delta (γδ) T cells constitute a small minority of T cells but are heavily concentrated in epithelial tissues (e.g., the skin, intestinal mucosa, reproductive tract). They act as a first line of defense at mucosal surfaces and recognize lipid antigens and stress proteins without the need for classic MHC presentation.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Superantigens, such as the Toxic Shock Syndrome Toxin (TSST-1) produced by Staphylococcus aureus, cause massive cytokine release and shock. By what mechanism do they achieve this?', 
'["By forming pores in macrophage cell membranes", "By cross-linking the beta region of the TCR directly to MHC Class II outside the peptide-binding groove", "By acting as haptens bound to host albumin", "By inhibiting the proteasome in antigen-presenting cells"]'::jsonb, 
1, 
'Conventional antigens are processed into peptides and presented within the groove of MHC molecules to specific T cells (activating ~0.01% of T cells). Superantigens bypass this processing. They bind simultaneously to the outer surface of the MHC Class II molecule on APCs and the variable region of the beta chain (V-beta) on the TCR. This cross-linking non-specifically activates up to 20% of all CD4+ T cells, leading to a massive, life-threatening release of cytokines (IFN-gamma, IL-2) known as a cytokine storm.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 28-year-old female with Graves disease presents with weight loss, heat intolerance, and exophthalmos. The pathogenesis of this disease involves an autoantibody acting via which of the following mechanisms?', 
'["Complement-mediated destruction of thyroid follicular cells", "Stimulation of the TSH receptor, causing unregulated thyroid hormone production", "Blockade of the TSH receptor, preventing hormone production", "Formation of immune complexes in the thyroid microvasculature"]'::jsonb, 
1, 
'Graves disease is a Type II non-cytotoxic hypersensitivity reaction. The patient produces an IgG autoantibody called Thyroid-Stimulating Immunoglobulin (TSI) that binds directly to the Thyrotropin (TSH) receptor on the surface of thyroid follicular cells. Instead of destroying the cell, the antibody acts as an agonist, mimicking TSH and continuously stimulating the receptor. This leads to unregulated overproduction of thyroid hormones (T3/T4) and hyperthyroidism.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'To prevent Rh sensitization in an Rh-negative mother carrying an Rh-positive fetus, anti-D immunoglobulin (RhoGAM) is administered. What specific type of immune regulation does this therapy exploit?', 
'["Antibody-dependent cellular cytotoxicity (ADCC)", "Antibody feedback inhibition via FcγRIIB receptors", "Induction of CD4+ regulatory T cells", "Complement-mediated opsonization"]'::jsonb, 
1, 
'While RhoGAM clears fetal RBCs via macrophage phagocytosis, a key mechanism preventing the mother from mounting an immune response is Antibody Feedback Inhibition. B cells have an inhibitory receptor called FcγRIIB. When RhoGAM (IgG) binds to fetal Rh antigen, the Fc portion of RhoGAM can cross-link the B cell receptor to the FcγRIIB receptor on the mother''s naive B cells. This delivers a strong inhibitory signal that shuts down B cell activation and prevents the primary immune response.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'During the immune response to a helminthic infection, which cytokine is primarily responsible for inducing the bone marrow to increase the production and release of eosinophils?', 
'["IL-2", "IL-4", "IL-5", "IL-10"]'::jsonb, 
2, 
'Interleukin-5 (IL-5) is the key cytokine for eosinophil development, recruitment, and activation. During a parasitic infection or allergic response, Th2 cells secrete IL-5. This cytokine travels to the bone marrow to stimulate the proliferation of eosinophil precursors and also acts peripherally to activate mature eosinophils, enhancing their ability to degranulate and kill helminths.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient with a known allergy to peanuts accidentally consumes a trace amount. Within minutes, he develops wheezing, facial swelling, and a precipitous drop in blood pressure. Which molecule is responsible for cross-linking IgE on the surface of his mast cells to trigger this reaction?', 
'["Peanut antigen", "Histamine", "Complement C3a", "Major basic protein"]'::jsonb, 
0, 
'This is a classic Type I (anaphylactic) hypersensitivity reaction. The patient was previously sensitized, meaning peanut-specific IgE antibodies are pre-bound to high-affinity FcεRI receptors on his mast cells and basophils. When he consumes the peanut again, the intact peanut antigen enters the bloodstream and physically bridges (cross-links) adjacent IgE molecules on the mast cell surface. This cross-linking provides the mechanical signal for rapid, massive degranulation of histamine and other mediators.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A 5-year-old child presents with recurrent sinus infections and a staggering gait (ataxia). Physical examination reveals prominent dilated blood vessels (telangiectasias) on his conjunctivae and face. Laboratory testing is likely to show a significant deficiency in which of the following?', 
'["IgM", "IgA", "Complement C3", "Neutrophil elastase"]'::jsonb, 
1, 
'This patient has Ataxia-Telangiectasia (AT), an autosomal recessive disorder caused by a mutation in the ATM gene, which is responsible for detecting DNA double-strand breaks and halting the cell cycle for repair. Failure to repair DNA breaks heavily impairs V(D)J recombination and class switching. Patients typically present with cerebellar ataxia, spider angiomas (telangiectasias), and severe immunodeficiency. A hallmark laboratory finding is a severe deficiency or complete absence of IgA (and often IgE and IgG), leading to recurrent sinopulmonary infections.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following cytokines is a potent inhibitor of both Th1 and macrophages, playing a crucial role in winding down the immune response and maintaining peripheral tolerance?', 
'["Interleukin-2", "Interleukin-8", "Interleukin-10", "Tumor Necrosis Factor-alpha"]'::jsonb, 
2, 
'Interleukin-10 (IL-10) and Transforming Growth Factor-beta (TGF-beta) are the two primary anti-inflammatory, immunosuppressive cytokines. IL-10 is secreted by Regulatory T cells (Tregs) and Th2 cells. It heavily suppresses the Th1 response, inhibits macrophage activation, and downregulates the expression of MHC Class II and costimulatory molecules on APCs, effectively acting as the "brakes" of the immune system.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'MHC Class I molecules present endogenous antigens to CD8+ T cells. Structurally, the MHC Class I molecule consists of a heavy alpha chain non-covalently linked to which of the following proteins, which is essential for its stable expression on the cell surface?', 
'["Beta-2 microglobulin", "Invariant chain", "J chain", "CD3 zeta chain"]'::jsonb, 
0, 
'MHC Class I molecules are heterodimers composed of a polymorphic heavy alpha chain (which contains the peptide-binding groove and is encoded by HLA-A, B, or C) and a smaller, non-polymorphic protein called beta-2 microglobulin (encoded on a different chromosome). Beta-2 microglobulin does not span the membrane but is absolutely essential for the proper folding, transport, and stable expression of the MHC Class I molecule on the cell surface.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'A patient undergoes a tuberculin skin test (PPD). The macrophages arriving at the site of the intradermal injection are primarily attracted by which of the following chemokines secreted by activated T cells and resident macrophages?', 
'["IL-4", "CCL2 (MCP-1)", "CXCL8 (IL-8)", "Leukotriene C4"]'::jsonb, 
1, 
'In a Type IV hypersensitivity reaction like the PPD test, the recruitment of macrophages to the site is critical for granuloma formation and induration. Macrophage Chemotactic Protein-1 (MCP-1), also known as CCL2, is a potent chemokine specifically responsible for attracting monocytes/macrophages from the bloodstream into the tissue. CXCL8 (IL-8) is primarily a neutrophil chemoattractant.'),

('5ac0b9ef-cbf6-4d57-b2bb-71c9441a2bdd', 
'Which of the following components of the innate immune system is a soluble acute-phase protein that binds to phosphorylcholine on bacterial surfaces, acting as an opsonin and activating the classical complement pathway without requiring antibodies?', 
'["C-reactive protein (CRP)", "Mannose-binding lectin (MBL)", "Defensins", "Lysozyme"]'::jsonb, 
0, 
'C-reactive protein (CRP) is an acute-phase reactant synthesized by the liver in response to IL-6. It belongs to the pentraxin family of proteins. CRP binds to phosphorylcholine, a component of the cell wall of many bacteria and fungi. Once bound, CRP acts as a potent opsonin (enhancing phagocytosis) and can directly interact with C1q to activate the classical complement pathway, making it a critical early defense mechanism before specific antibodies are produced.')

;
