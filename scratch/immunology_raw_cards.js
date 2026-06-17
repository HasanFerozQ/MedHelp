const immunologyRawCards = [
  {
    "q": "What are the two arms of the immune system?",
    "a": "<b>Innate (non-specific)</b> — immediate, no memory<br><b>Adaptive (specific)</b> — delayed, has memory (B & T cells)"
  },
  {
    "q": "List the main cells of innate immunity.",
    "a": "Neutrophils, Macrophages, Dendritic cells, NK cells, Mast cells, Eosinophils, Basophils"
  },
  {
    "q": "List the main cells of adaptive immunity.",
    "a": "<b>B lymphocytes</b> (humoral) and <b>T lymphocytes</b> (cell-mediated)"
  },
  {
    "q": "What are the three lines of defense in immunity?",
    "a": "1. Anatomic/physiologic barriers<br>2. Innate immunity<br>3. Adaptive immunity"
  },
  {
    "q": "What are the major functions of neutrophils?",
    "a": "Phagocytosis, NET formation, primary defense against bacteria and fungi"
  },
  {
    "q": "What is the role of macrophages in immunity?",
    "a": "Phagocytosis, antigen presentation, cytokine production, tissue repair"
  },
  {
    "q": "What are the two types of dendritic cells?",
    "a": "<b>Conventional DCs</b> (excellent antigen presenters) and <b>Plasmacytoid DCs</b> (produce large amounts of Type I IFN)"
  },
  {
    "q": "What is the function of Natural Killer (NK) cells?",
    "a": "Kill virus-infected and tumor cells (missing-self recognition via KIRs). Part of innate immunity but have some memory."
  },
  {
    "q": "What are Pattern Recognition Receptors (PRRs)?",
    "a": "Receptors on innate cells that recognize Pathogen-Associated Molecular Patterns (PAMPs) and Damage-Associated Molecular Patterns (DAMPs). Examples: TLRs, NLRs, RLRs, C-type lectins."
  },
  {
    "q": "Which TLR is located on the cell surface and recognizes LPS?",
    "a": "<b>TLR4</b> (with MD-2 and CD14)"
  },
  {
    "q": "Which TLR recognizes unmethylated CpG DNA?",
    "a": "<b>TLR9</b> (endosomal)"
  },
  {
    "q": "What is the difference between MHC Class I and Class II?",
    "a": "<b>MHC I</b>: Present on all nucleated cells, presents to CD8 T cells (endogenous antigens)<br><b>MHC II</b>: Present on APCs, presents to CD4 T cells (exogenous antigens)"
  },
  {
    "q": "Which cells express MHC Class II constitutively?",
    "a": "Professional APCs: Dendritic cells, Macrophages, B cells"
  },
  {
    "q": "What is the structure of an antibody?",
    "a": "Two heavy chains + two light chains. Variable (Fab) region binds antigen, Constant (Fc) region mediates effector functions."
  },
  {
    "q": "Name the five antibody isotypes and their main functions.",
    "a": "<b>IgM</b>: Primary response, pentamer<br><b>IgG</b>: Secondary response, crosses placenta, opsonization<br><b>IgA</b>: Mucosal immunity (dimer)<br><b>IgE</b>: Parasites & allergy (mast cell degranulation)<br><b>IgD</b>: B cell receptor"
  },
  {
    "q": "What is the function of the classical complement pathway?",
    "a": "Activated by antigen-antibody complexes (IgM or IgG)"
  },
  {
    "q": "What is the function of the alternative complement pathway?",
    "a": "Spontaneous hydrolysis of C3 or triggered by microbial surfaces"
  },
  {
    "q": "What is the function of the lectin complement pathway?",
    "a": "Mannose-binding lectin (MBL) binds microbial carbohydrates"
  },
  {
    "q": "What are the three main outcomes of complement activation?",
    "a": "1. Opsonization (C3b)<br>2. Inflammation (C3a, C5a)<br>3. Membrane Attack Complex (MAC — C5b-9)"
  },
  {
    "q": "What is the role of CD4 T helper cells?",
    "a": "Orchestrate immune response via cytokine secretion. Subsets: Th1, Th2, Th17, Treg, Tfh."
  },
  {
    "q": "What is the master cytokine for Th1 differentiation?",
    "a": "<b>IFN-γ</b> (activates macrophages, promotes cell-mediated immunity)"
  },
  {
    "q": "What is the master cytokine for Th2 differentiation?",
    "a": "<b>IL-4</b> (promotes humoral immunity, IgE class switching, eosinophil activation)"
  },
  {
    "q": "What is the master cytokine for Th17 differentiation?",
    "a": "<b>IL-6 + TGF-β</b> (recruits neutrophils, important in autoimmunity and fungal defense)"
  },
  {
    "q": "What is the function of Regulatory T cells (Tregs)?",
    "a": "Suppress immune response (prevent autoimmunity). Express <b>FoxP3</b> and CD25."
  },
  {
    "q": "What is the role of T follicular helper (Tfh) cells?",
    "a": "Help B cells in germinal centers (class switching, affinity maturation, memory B cell formation)"
  },
  {
    "q": "What is the difference between central and peripheral tolerance?",
    "a": "<b>Central</b>: Negative selection in thymus/bone marrow<br><b>Peripheral</b>: Anergy, suppression by Tregs, ignorance"
  },
  {
    "q": "What are the four types of hypersensitivity reactions?",
    "a": "<b>Type I</b>: Immediate (IgE)<br><b>Type II</b>: Cytotoxic (IgG/IgM)<br><b>Type III</b>: Immune complex<br><b>Type IV</b>: Delayed (T-cell mediated)"
  },
  {
    "q": "Give examples of Type I hypersensitivity.",
    "a": "Anaphylaxis, allergic rhinitis, asthma, food allergy"
  },
  {
    "q": "Give examples of Type II hypersensitivity.",
    "a": "Autoimmune hemolytic anemia, Goodpasture syndrome, Graves disease, Myasthenia gravis"
  },
  {
    "q": "Give examples of Type III hypersensitivity.",
    "a": "SLE (anti-dsDNA), Post-streptococcal glomerulonephritis, Serum sickness, Arthus reaction"
  },
  {
    "q": "Give examples of Type IV hypersensitivity.",
    "a": "Contact dermatitis, TB skin test, Graft rejection, Type 1 diabetes"
  },
  {
    "q": "What is the mechanism of Type IV hypersensitivity?",
    "a": "T cell mediated (Th1 → macrophage activation or CD8 cytotoxicity)"
  },
  {
    "q": "What is the difference between active and passive immunity?",
    "a": "<b>Active</b>: Host produces antibodies (vaccination, infection)<br><b>Passive</b>: Pre-formed antibodies given (e.g., RhoGAM, antitoxin)"
  },
  {
    "q": "What is immunological memory?",
    "a": "Faster, stronger, and more specific response on re-exposure due to memory B and T cells"
  },
  {
    "q": "What is the difference between primary and secondary immune response?",
    "a": "Primary: slow, mostly IgM<br>Secondary: rapid, high-affinity IgG (anamnestic response)"
  },
  {
    "q": "What are superantigens?",
    "a": "Bacterial toxins (e.g., TSST-1, staphylococcal enterotoxins) that bind MHC II and TCR outside the peptide-binding groove → massive cytokine storm"
  },
  {
    "q": "What is the most common primary immunodeficiency?",
    "a": "<b>Selective IgA deficiency</b>"
  },
  {
    "q": "What is the defect in X-linked agammaglobulinemia (Bruton)?",
    "a": "<b>BTK</b> mutation → no mature B cells, absent plasma cells and immunoglobulins"
  },
  {
    "q": "What is the defect in SCID (most common form)?",
    "a": "<b>IL-2Rγ chain</b> deficiency (X-linked) or ADA deficiency"
  },
  {
    "q": "What is the classic presentation of DiGeorge syndrome?",
    "a": "CATCH-22: Cardiac defects, Abnormal facies, Thymic hypoplasia, Cleft palate, Hypocalcemia (22q11 deletion)"
  },
  {
    "q": "What is the defect in Chronic Granulomatous Disease (CGD)?",
    "a": "<b>NADPH oxidase</b> deficiency → inability to produce superoxide → recurrent catalase-positive infections"
  },
  {
    "q": "What is the nitroblue test used for?",
    "a": "Diagnosis of CGD (negative in CGD)"
  },
  {
    "q": "What is the defect in Leukocyte Adhesion Deficiency (LAD)?",
    "a": "<b>CD18</b> (β2 integrin) deficiency → delayed umbilical cord separation, poor pus formation"
  },
  {
    "q": "What is the defect in Chediak-Higashi syndrome?",
    "a": "<b>LYST</b> gene → giant granules, albinism, recurrent infections, neurological issues"
  },
  {
    "q": "What is the defect in Job syndrome (Hyper-IgE)?",
    "a": "<b>STAT3</b> mutation → high IgE, eczema, recurrent cold abscesses (Staph), coarse facies"
  },
  {
    "q": "What are the two main types of graft rejection?",
    "a": "<b>Acute</b> (T-cell mediated) and <b>Chronic</b> (vascular fibrosis, obliterative vasculopathy)"
  },
  {
    "q": "What is hyperacute rejection?",
    "a": "Pre-existing antibodies (ABO mismatch or anti-HLA) → immediate thrombosis and necrosis"
  },
  {
    "q": "What drug class is used for induction immunosuppression?",
    "a": "Anti-thymocyte globulin, basiliximab (IL-2R antagonist)"
  },
  {
    "q": "What is the mechanism of action of cyclosporine and tacrolimus?",
    "a": "Calcineurin inhibitors → block IL-2 transcription"
  },
  {
    "q": "What is the mechanism of sirolimus (rapamycin)?",
    "a": "mTOR inhibitor → blocks IL-2 signaling and T cell proliferation"
  },
  {
    "q": "What is the mechanism of mycophenolate mofetil?",
    "a": "Inhibits IMPDH → blocks purine synthesis in lymphocytes"
  },
  {
    "q": "What is the major side effect of long-term steroid use in transplant patients?",
    "a": "Osteoporosis, hyperglycemia, hypertension, Cushingoid features"
  },
  {
    "q": "Which cytokine is known as the 'macrophage activating factor'?",
    "a": "<b>IFN-γ</b> (produced by Th1 and NK cells)"
  },
  {
    "q": "Which cytokine stimulates IgE class switching and eosinophil activation?",
    "a": "<b>IL-5</b> (Th2 cytokine)"
  },
  {
    "q": "Which cytokine is the main growth factor for B cells?",
    "a": "<b>IL-4</b> and <b>IL-13</b>"
  },
  {
    "q": "What is the function of IL-2?",
    "a": "T cell proliferation and differentiation (autocrine & paracrine)"
  },
  {
    "q": "Which cytokine drives Th17 differentiation and is pro-inflammatory?",
    "a": "<b>IL-17</b> and <b>IL-23</b>"
  },
  {
    "q": "What is the role of TGF-β in immunity?",
    "a": "Anti-inflammatory; promotes Treg differentiation and IgA class switching"
  },
  {
    "q": "Which cytokine is produced by Th1 cells and activates macrophages?",
    "a": "<b>IFN-γ</b>"
  },
  {
    "q": "What is the function of IL-10?",
    "a": "Potent anti-inflammatory cytokine (produced by Tregs, Th2, macrophages)"
  },
  {
    "q": "What is the major cytokine responsible for fever?",
    "a": "<b>IL-1</b> and <b>TNF-α</b>"
  },
  {
    "q": "Which cells produce Type I interferons (IFN-α/β)?",
    "a": "Plasmacytoid dendritic cells and virus-infected cells"
  },
  {
    "q": "What is the function of Type I interferons?",
    "a": "Inhibit viral replication, increase MHC I expression, activate NK cells"
  },
  {
    "q": "Give three examples of Type II (cytotoxic) hypersensitivity.",
    "a": "1. Autoimmune hemolytic anemia<br>2. Goodpasture syndrome<br>3. Myasthenia gravis / Graves disease"
  },
  {
    "q": "Give three examples of Type III (immune complex) hypersensitivity.",
    "a": "1. SLE<br>2. Post-streptococcal glomerulonephritis<br>3. Serum sickness"
  },
  {
    "q": "Give three examples of Type IV (delayed) hypersensitivity.",
    "a": "1. TB skin test (PPD)<br>2. Contact dermatitis (poison ivy)<br>3. Graft rejection"
  },
  {
    "q": "What is the Arthus reaction?",
    "a": "Localized Type III hypersensitivity — immune complex deposition after antigen injection (e.g., vaccine booster)"
  },
  {
    "q": "What is serum sickness?",
    "a": "Systemic Type III hypersensitivity — fever, rash, arthralgia, glomerulonephritis after exposure to foreign proteins"
  },
  {
    "q": "Which autoimmune disease is associated with anti-dsDNA and anti-Smith antibodies?",
    "a": "<b>Systemic Lupus Erythematosus (SLE)</b>"
  },
  {
    "q": "Which autoimmune disease is associated with anti-CCP antibodies?",
    "a": "<b>Rheumatoid Arthritis</b>"
  },
  {
    "q": "Which disease is associated with anti-centromere antibodies?",
    "a": "<b>Limited scleroderma (CREST syndrome)</b>"
  },
  {
    "q": "Which disease is associated with anti-Scl-70 (topoisomerase I) antibodies?",
    "a": "<b>Diffuse scleroderma</b>"
  },
  {
    "q": "Which disease is associated with anti-mitochondrial antibodies?",
    "a": "<b>Primary Biliary Cholangitis (PBC)</b>"
  },
  {
    "q": "Which disease is associated with anti-GBM antibodies?",
    "a": "<b>Goodpasture syndrome</b>"
  },
  {
    "q": "Which HLA allele is strongly associated with ankylosing spondylitis?",
    "a": "<b>HLA-B27</b>"
  },
  {
    "q": "Which HLA alleles are associated with celiac disease?",
    "a": "<b>HLA-DQ2 and DQ8</b>"
  },
  {
    "q": "Which HLA is associated with rheumatoid arthritis?",
    "a": "<b>HLA-DR4</b>"
  },
  {
    "q": "What test is used to diagnose CGD?",
    "a": "<b>Dihydrorhodamine (DHR)</b> flow cytometry (preferred) or NBT test"
  },
  {
    "q": "What is the inheritance pattern of CGD?",
    "a": "Most common is X-linked (gp91phox), also autosomal recessive"
  },
  {
    "q": "What is the classic triad of Wiskott-Aldrich syndrome?",
    "a": "Eczema, Thrombocytopenia (small platelets), Recurrent infections (T+B cell defect)"
  },
  {
    "q": "What is the genetic defect in Wiskott-Aldrich syndrome?",
    "a": "<b>WASP</b> gene mutation (X-linked)"
  },
  {
    "q": "What is the defect in Ataxia-Telangiectasia?",
    "a": "<b>ATM</b> gene (DNA repair defect) → cerebellar ataxia, telangiectasias, IgA deficiency, increased cancer risk"
  },
  {
    "q": "What complement deficiency predisposes to Neisseria infections?",
    "a": "Terminal complement deficiency (<b>C5–C9</b> — MAC deficiency)"
  },
  {
    "q": "What complement deficiency is associated with SLE-like syndrome?",
    "a": "<b>C1, C2, or C4</b> deficiency (early classical pathway)"
  },
  {
    "q": "What is the most common complement deficiency?",
    "a": "<b>C2 deficiency</b>"
  },
  {
    "q": "What is hereditary angioedema (HAE)?",
    "a": "<b>C1 esterase inhibitor (C1-INH)</b> deficiency → uncontrolled bradykinin production → non-pitting edema"
  },
  {
    "q": "What is the treatment for hereditary angioedema?",
    "a": "C1-INH concentrate, icatibant (bradykinin B2 antagonist), or ecallantide"
  },
  {
    "q": "What is the difference between direct and indirect Coombs test?",
    "a": "<b>Direct</b>: detects antibodies already on RBCs<br><b>Indirect</b>: detects antibodies in serum"
  },
  {
    "q": "What is the mechanism of Type II hypersensitivity in autoimmune hemolytic anemia?",
    "a": "IgG or IgM against RBC antigens → complement activation or phagocytosis"
  },
  {
    "q": "What is the major difference between warm and cold autoimmune hemolytic anemia?",
    "a": "<b>Warm</b>: IgG, extravascular hemolysis (splenic)<br><b>Cold</b>: IgM, intravascular hemolysis (complement)"
  },
  {
    "q": "What infection is classically associated with cold agglutinin disease?",
    "a": "<b>Mycoplasma pneumoniae</b> or EBV"
  },
  {
    "q": "What is the most common cause of secondary immunodeficiency worldwide?",
    "a": "<b>HIV infection</b>"
  },
  {
    "q": "What is the mechanism of action of rituximab?",
    "a": "Anti-CD20 monoclonal antibody → B cell depletion"
  },
  {
    "q": "What is the mechanism of action of infliximab/adalimumab?",
    "a": "Anti-TNF-α monoclonal antibodies"
  },
  {
    "q": "What is the mechanism of action of etanercept?",
    "a": "TNF receptor fusion protein (decoy receptor)"
  },
  {
    "q": "Name two live attenuated vaccines contraindicated in immunocompromised patients.",
    "a": "MMR and Varicella (also oral polio, yellow fever, rotavirus)"
  },
  {
    "q": "What type of vaccine is the Hepatitis B vaccine?",
    "a": "Recombinant subunit vaccine (HBsAg)"
  },
  {
    "q": "What type of vaccine is the Pneumococcal conjugate vaccine (PCV13)?",
    "a": "Conjugate vaccine (polysaccharide + protein carrier)"
  },
  {
    "q": "What is the difference between active and passive immunization?",
    "a": "<b>Active</b>: induces memory (vaccines)<br><b>Passive</b>: immediate protection, no memory (immunoglobulins)"
  },
  {
    "q": "What is the major complication of live vaccines in SCID patients?",
    "a": "Vaccine-associated disease / disseminated infection"
  },
  {
    "q": "What is tumor immunology's 'cancer immunoediting' concept?",
    "a": "Elimination → Equilibrium → Escape phases of tumor-immune interaction"
  },
  {
    "q": "Which immune cells are most important for tumor surveillance?",
    "a": "<b>CD8+ cytotoxic T cells</b> and <b>NK cells</b>"
  },
  {
    "q": "What are tumor-specific antigens vs tumor-associated antigens?",
    "a": "TSA: unique to tumor (e.g., neoantigens)<br>TAA: overexpressed normal proteins (e.g., HER2, MART-1)"
  },
  {
    "q": "Name two immune checkpoint molecules targeted in cancer immunotherapy.",
    "a": "<b>PD-1/PD-L1</b> and <b>CTLA-4</b>"
  },
  {
    "q": "What is the mechanism of action of pembrolizumab / nivolumab?",
    "a": "<b>Anti-PD-1</b> monoclonal antibodies — block PD-1/PD-L1 interaction → unleash T cells against tumors"
  },
  {
    "q": "What is the mechanism of ipilimumab?",
    "a": "<b>Anti-CTLA-4</b> monoclonal antibody — blocks inhibitory signal on T cells"
  },
  {
    "q": "What is the most common primary immunodeficiency in adults?",
    "a": "<b>Selective IgA deficiency</b>"
  },
  {
    "q": "What is the clinical presentation of selective IgA deficiency?",
    "a": "Recurrent sinopulmonary and GI infections, anaphylaxis to blood products, increased autoimmune disease"
  },
  {
    "q": "What is the defect in Severe Combined Immunodeficiency (SCID)?",
    "a": "Defective T and B cell development (most common: IL-2Rγ chain or ADA deficiency)"
  },
  {
    "q": "What is the treatment for SCID?",
    "a": "Bone marrow / stem cell transplant (curative); gene therapy for some forms"
  },
  {
    "q": "What is the classic presentation of X-linked agammaglobulinemia (Bruton disease)?",
    "a": "Boys with recurrent bacterial infections after 6 months of age, absent B cells and plasma cells, low immunoglobulins"
  },
  {
    "q": "What is the defect in Hyper-IgM syndrome?",
    "a": "Defective CD40 ligand (X-linked) or CD40 → inability to class switch from IgM"
  },
  {
    "q": "What infections are common in Hyper-IgM syndrome?",
    "a": "Recurrent sinopulmonary infections + opportunistic infections (Pneumocystis jirovecii)"
  },
  {
    "q": "What is the inheritance of Chronic Granulomatous Disease (CGD)?",
    "a": "70% X-linked (CYBB gene), 30% autosomal recessive"
  },
  {
    "q": "What organisms are most common in CGD infections?",
    "a": "Catalase-positive organisms: Staph aureus, Aspergillus, Serratia, Burkholderia"
  },
  {
    "q": "What is the pathognomonic finding in Chediak-Higashi syndrome?",
    "a": "Giant cytoplasmic granules in leukocytes"
  },
  {
    "q": "What is the triad of Job syndrome (Autosomal dominant Hyper-IgE syndrome)?",
    "a": "1. High IgE<br>2. Eczema<br>3. Recurrent cold staphylococcal abscesses"
  },
  {
    "q": "What gene is mutated in Job syndrome?",
    "a": "<b>STAT3</b>"
  },
  {
    "q": "What is the defect in Leukocyte Adhesion Deficiency Type 1 (LAD-1)?",
    "a": "Deficiency of CD18 (β2-integrin) → impaired neutrophil migration"
  },
  {
    "q": "What is the classic clinical clue for LAD-1?",
    "a": "Delayed separation of umbilical cord + marked leukocytosis without pus formation"
  },
  {
    "q": "What complement components are deficient in patients with recurrent Neisseria infections?",
    "a": "Terminal complement (C5–C9) — inability to form MAC"
  },
  {
    "q": "What is the mechanism of HIV entry into CD4 cells?",
    "a": "gp120 binds CD4 + CCR5 (or CXCR4) co-receptor"
  },
  {
    "q": "Which cells are primarily destroyed in HIV?",
    "a": "<b>CD4+ helper T cells</b>"
  },
  {
    "q": "What is the definition of AIDS?",
    "a": "CD4 count <200 cells/μL or presence of AIDS-defining illness"
  },
  {
    "q": "What is the most common opportunistic infection in AIDS patients with CD4 <200?",
    "a": "<b>Pneumocystis jirovecii pneumonia (PCP)</b>"
  },
  {
    "q": "What is the prophylaxis for PCP in HIV patients?",
    "a": "<b>Trimethoprim-sulfamethoxazole (TMP-SMX)</b>"
  },
  {
    "q": "What malignancy is strongly associated with HIV/AIDS?",
    "a": "<b>Kaposi sarcoma</b> (HHV-8) and non-Hodgkin lymphoma"
  },
  {
    "q": "What is the major difference between allograft, xenograft, and isograft?",
    "a": "<b>Isograft</b>: identical twin<br><b>Allograft</b>: same species<br><b>Xenograft</b>: different species"
  },
  {
    "q": "What is hyperacute rejection mediated by?",
    "a": "Pre-formed antibodies (ABO or anti-HLA) → immediate complement activation and thrombosis"
  },
  {
    "q": "What is the main mechanism of acute cellular rejection?",
    "a": "<b>CD8+ T cells</b> and <b>CD4+ T cells</b> attacking graft"
  },
  {
    "q": "What is the main mechanism of chronic rejection?",
    "a": "Vascular fibrosis and obliterative arteriopathy (accelerated atherosclerosis)"
  },
  {
    "q": "Which immunosuppressant is most associated with nephrotoxicity?",
    "a": "<b>Cyclosporine and Tacrolimus</b> (calcineurin inhibitors)"
  },
  {
    "q": "Which immunosuppressant is most associated with gingival hyperplasia and hirsutism?",
    "a": "<b>Cyclosporine</b>"
  },
  {
    "q": "Which immunosuppressant increases risk of post-transplant lymphoproliferative disorder (PTLD)?",
    "a": "All potent immunosuppressants, especially those causing profound T-cell suppression"
  },
  {
    "q": "What is the mechanism of azathioprine?",
    "a": "Purine analog → inhibits lymphocyte proliferation (converted to 6-MP)"
  },
  {
    "q": "What drug interaction is dangerous with azathioprine?",
    "a": "Allopurinol (inhibits xanthine oxidase → increased toxicity)"
  },
  {
    "q": "What is the mechanism of basiliximab?",
    "a": "Anti-IL-2 receptor (CD25) monoclonal antibody — induction therapy"
  },
  {
    "q": "What is the function of muromonab-CD3 (OKT3)?",
    "a": "Anti-CD3 antibody — depletes T cells (rarely used now)"
  },
  {
    "q": "What is graft-versus-host disease (GVHD)?",
    "a": "Donor T cells attack recipient tissues (skin, liver, GI tract) after bone marrow transplant"
  },
  {
    "q": "What is the difference between acute and chronic GVHD?",
    "a": "<b>Acute</b>: <100 days, maculopapular rash, diarrhea, jaundice<br><b>Chronic</b>: >100 days, scleroderma-like skin changes, sicca syndrome"
  },
  {
    "q": "What is the treatment for acute GVHD?",
    "a": "High-dose corticosteroids ± other immunosuppressants"
  },
  {
    "q": "Name two cancers strongly associated with EBV.",
    "a": "Burkitt lymphoma and Nasopharyngeal carcinoma"
  },
  {
    "q": "Name two cancers strongly associated with HPV.",
    "a": "Cervical cancer and Oropharyngeal squamous cell carcinoma"
  },
  {
    "q": "Name one cancer associated with Hepatitis B/C.",
    "a": "<b>Hepatocellular carcinoma (HCC)</b>"
  },
  {
    "q": "What is the role of PD-L1 on tumor cells?",
    "a": "Inhibits T cell activation via PD-1 receptor → immune evasion"
  },
  {
    "q": "What is immune checkpoint blockade?",
    "a": "Therapeutic antibodies that block inhibitory signals (PD-1, CTLA-4) to enhance anti-tumor immunity"
  },
  {
    "q": "What is the Warburg effect in tumor immunology?",
    "a": "Cancer cells preferentially use aerobic glycolysis even in presence of oxygen"
  },
  {
    "q": "What are tumor-associated macrophages (TAMs)?",
    "a": "Often M2-polarized → promote tumor growth, angiogenesis, and suppress anti-tumor immunity"
  },
  {
    "q": "What is the role of regulatory T cells (Tregs) in cancer?",
    "a": "Suppress anti-tumor immune response (often increased in tumor microenvironment)"
  },
  {
    "q": "What is the most common type of transplant rejection seen in the first week?",
    "a": "<b>Hyperacute rejection</b> (if present)"
  },
  {
    "q": "What is the most common type of rejection seen months to years later?",
    "a": "<b>Chronic rejection</b>"
  },
  {
    "q": "What is the classic skin finding in graft-versus-host disease?",
    "a": "Maculopapular rash starting on palms, soles, and ears"
  },
  {
    "q": "What is the classic autoantibody in Hashimoto thyroiditis?",
    "a": "Anti-thyroid peroxidase (anti-TPO) and anti-thyroglobulin antibodies"
  },
  {
    "q": "What is the classic autoantibody in Graves disease?",
    "a": "Thyroid-stimulating immunoglobulin (TSI) — TSH receptor antibody"
  },
  {
    "q": "What is the classic autoantibody in Myasthenia Gravis?",
    "a": "Anti-acetylcholine receptor (AChR) antibodies"
  },
  {
    "q": "What is the classic autoantibody in Lambert-Eaton myasthenic syndrome?",
    "a": "Anti-voltage-gated calcium channel (VGCC) antibodies"
  },
  {
    "q": "What is the classic autoantibody in pernicious anemia?",
    "a": "Anti-intrinsic factor and anti-parietal cell antibodies"
  },
  {
    "q": "What is the classic autoantibody in primary biliary cholangitis?",
    "a": "Anti-mitochondrial antibodies (AMA)"
  },
  {
    "q": "What is the classic autoantibody in autoimmune hepatitis Type 1?",
    "a": "Anti-smooth muscle antibody (ASMA) and ANA"
  },
  {
    "q": "What disease is associated with anti-Jo-1 antibodies?",
    "a": "Polymyositis / Antisynthetase syndrome"
  },
  {
    "q": "What disease is associated with anti-SSA (Ro) and anti-SSB (La)?",
    "a": "Sjögren syndrome"
  },
  {
    "q": "What is the HLA association for Type 1 Diabetes Mellitus?",
    "a": "<b>HLA-DR3 and DR4</b>"
  },
  {
    "q": "What is molecular mimicry? Give an example.",
    "a": "Immune response against pathogen cross-reacts with self-antigen. Example: Rheumatic fever (Strep M protein mimics cardiac myosin)"
  },
  {
    "q": "What is the pathogenesis of rheumatic fever?",
    "a": "Type II hypersensitivity — molecular mimicry between group A Strep and heart valves, joints, skin, brain"
  },
  {
    "q": "What is the major Jones criterion for rheumatic fever?",
    "a": "Carditis, Polyarthritis, Chorea, Erythema marginatum, Subcutaneous nodules"
  },
  {
    "q": "What is the treatment for acute rheumatic fever?",
    "a": "Penicillin + anti-inflammatory agents (aspirin or corticosteroids)"
  },
  {
    "q": "What is the major cause of death in untreated rheumatic heart disease?",
    "a": "Mitral stenosis"
  },
  {
    "q": "What is the mechanism of action of abatacept?",
    "a": "CTLA-4-Ig fusion protein — blocks CD28-B7 co-stimulation"
  },
  {
    "q": "What is the mechanism of tocilizumab?",
    "a": "Anti-IL-6 receptor antibody"
  },
  {
    "q": "What is the mechanism of ustekinumab?",
    "a": "Anti-IL-12/IL-23 monoclonal antibody"
  },
  {
    "q": "What is the mechanism of secukinumab?",
    "a": "Anti-IL-17A monoclonal antibody"
  },
  {
    "q": "Which vaccine type carries risk of reversion to virulence?",
    "a": "Live attenuated vaccines"
  },
  {
    "q": "Which vaccine is contraindicated in pregnancy?",
    "a": "Live vaccines (MMR, Varicella, etc.)"
  },
  {
    "q": "What is the only live vaccine given at birth?",
    "a": "BCG (in endemic areas)"
  },
  {
    "q": "What type of vaccine is the Haemophilus influenzae type B (Hib) vaccine?",
    "a": "Conjugate vaccine (polysaccharide linked to protein)"
  },
  {
    "q": "What is herd immunity?",
    "a": "Indirect protection from infectious disease when a large percentage of population is immune"
  },
  {
    "q": "What is the most effective way to prevent measles outbreaks?",
    "a": "High MMR vaccination coverage (>95%)"
  },
  {
    "q": "What is the difference between killed and live vaccines regarding boosters?",
    "a": "Killed vaccines usually require boosters; live vaccines often give lifelong immunity"
  },
  {
    "q": "What is the major risk of giving live vaccines to HIV patients with low CD4 counts?",
    "a": "Disseminated infection from the vaccine strain"
  },
  {
    "q": "What is central tolerance?",
    "a": "Elimination of self-reactive lymphocytes in primary lymphoid organs (thymus for T cells, bone marrow for B cells)"
  },
  {
    "q": "What is peripheral tolerance?",
    "a": "Mechanisms outside primary organs: anergy, deletion, suppression by Tregs"
  },
  {
    "q": "What transcription factor is essential for Treg development?",
    "a": "<b>FoxP3</b>"
  },
  {
    "q": "What is AIRE gene defect associated with?",
    "a": "Autoimmune Polyendocrine Syndrome Type 1 (APS-1) — candidiasis, hypoparathyroidism, Addison disease"
  },
  {
    "q": "What is the function of CTLA-4?",
    "a": "Inhibitory receptor on T cells — competes with CD28 for B7 binding"
  },
  {
    "q": "What is the function of PD-1/PD-L1 interaction?",
    "a": "Inhibits T cell activation and promotes tolerance"
  },
  {
    "q": "What is immune privilege? Give examples.",
    "a": "Sites with reduced immune surveillance: eye (anterior chamber), brain, testes, fetus"
  },
  {
    "q": "What is the role of Fas-FasL in immunity?",
    "a": "Induces apoptosis in target cells (important in activation-induced cell death)"
  },
  {
    "q": "What is the difference between necrosis and apoptosis in immune context?",
    "a": "Necrosis → inflammation; Apoptosis → no inflammation (silent clearance)"
  },
  {
    "q": "What is the most common cause of secondary amyloidosis (AA amyloid)?",
    "a": "Chronic inflammation (e.g., rheumatoid arthritis, TB, familial Mediterranean fever)"
  },
  {
    "q": "What is the most common organ affected by amyloidosis?",
    "a": "Kidney (proteinuria, nephrotic syndrome)"
  },
  {
    "q": "What stain is used to diagnose amyloidosis?",
    "a": "Congo red — apple-green birefringence under polarized light"
  },
  {
    "q": "What is the most common paraneoplastic syndrome in small cell lung cancer?",
    "a": "SIADH and Cushing syndrome (ectopic ACTH)"
  },
  {
    "q": "What tumor marker is elevated in seminoma?",
    "a": "β-hCG (mild elevation)"
  },
  {
    "q": "What tumor marker is elevated in yolk sac tumor?",
    "a": "AFP"
  },
  {
    "q": "What is the most common primary brain tumor in adults?",
    "a": "Glioblastoma multiforme"
  },
  {
    "q": "What is the characteristic histologic feature of glioblastoma?",
    "a": "Pseudopalisading necrosis and microvascular proliferation"
  },
  {
    "q": "What is the most common childhood brain tumor in the posterior fossa?",
    "a": "Medulloblastoma"
  },
  {
    "q": "What virus is associated with primary CNS lymphoma in AIDS patients?",
    "a": "EBV"
  },
  {
    "q": "What is the most common route of metastasis for carcinomas?",
    "a": "Lymphatic spread"
  },
  {
    "q": "What is the most common route of metastasis for sarcomas?",
    "a": "Hematogenous spread"
  }
];
module.exports = { immunologyRawCards };
