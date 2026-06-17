const immunologyCards = [
  {
    "q": "What are the two arms of the immune system?",
    "a": "<ul><li><b>Innate (non-specific)</b> — immediate, no memory</li><li><b>Adaptive (specific)</b> — delayed, has memory (B & T cells)</li></ul>"
  },
  {
    "q": "List the main cells of <b>innate</b> immunity.",
    "a": "<b>Neutrophils</b>, <b>Macrophages</b>, Dendritic cells, <b>NK cells</b>, <b>Mast cells</b>, <b>Eosinophils</b>, <b>Basophils</b>"
  },
  {
    "q": "List the main cells of <b>adaptive</b> immunity.",
    "a": "<b>B lymphocytes</b> (humoral) and <b>T lymphocytes</b> (cell-mediated)"
  },
  {
    "q": "What are the three lines of defense in immunity?",
    "a": "<ol><li>Anatomic/physiologic barriers</li><li>Innate immunity</li><li>Adaptive immunity</li></ol>"
  },
  {
    "q": "What are the major functions of <b>neutrophils</b>?",
    "a": "Phagocytosis, NET formation, primary defense against bacteria and fungi"
  },
  {
    "q": "What is the role of <b>macrophages</b> in immunity?",
    "a": "Phagocytosis, antigen presentation, cytokine production, tissue repair"
  },
  {
    "q": "What are the two types of dendritic cells?",
    "a": "<b>Conventional DCs</b> (excellent antigen presenters) and <b>Plasmacytoid DCs</b> (produce large amounts of <b>Type I</b> IFN)"
  },
  {
    "q": "What is the function of Natural Killer (NK) cells?",
    "a": "Kill virus-infected and tumor cells (missing-self recognition via <b>KIRs</b>). Part of <b>innate</b> immunity but have some memory."
  },
  {
    "q": "What are Pattern Recognition Receptors (<b>PRRs</b>)?",
    "a": "Receptors on <b>innate</b> cells that recognize Pathogen-Associated Molecular Patterns (<b>PAMPs</b>) and Damage-Associated Molecular Patterns (<b>DAMPs</b>). Examples: TLRs, NLRs, RLRs, C-type lectins."
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
    "q": "What is the difference between <b>MHC Class I</b> and Class II?",
    "a": "<ul><li><b><b>MHC I</b>:</b> Present on all nucleated cells, presents to CD8 T cells (endogenous antigens)</li><li><b><b>MHC II</b>:</b> Present on APCs, presents to CD4 T cells (exogenous antigens)</li></ul>"
  },
  {
    "q": "Which cells express <b>MHC Class II</b> constitutively?",
    "a": "Professional APCs: Dendritic cells, <b>Macrophages</b>, B cells"
  },
  {
    "q": "What is the structure of an antibody?",
    "a": "Two heavy chains + two light chains. Variable (Fab) region binds antigen, Constant (Fc) region mediates effector functions."
  },
  {
    "q": "Name the five antibody isotypes and their main functions.",
    "a": "<ul><li><b><b>IgM</b>:</b> Primary response, pentamer</li><li><b><b>IgG</b>:</b> Secondary response, crosses placenta, opsonization</li><li><b><b>IgA</b>:</b> Mucosal immunity (dimer)</li><li><b><b>IgE</b>:</b> Parasites & allergy (mast cell degranulation)</li><li><b><b>IgD</b>:</b> B cell receptor</li></ul>"
  },
  {
    "q": "What is the function of the classical <b>complement pathway</b>?",
    "a": "Activated by antigen-antibody complexes (<b>IgM</b> or <b>IgG</b>)"
  },
  {
    "q": "What is the function of the alternative <b>complement pathway</b>?",
    "a": "Spontaneous hydrolysis of C3 or triggered by microbial surfaces"
  },
  {
    "q": "What is the function of the lectin <b>complement pathway</b>?",
    "a": "Mannose-binding lectin (MBL) binds microbial carbohydrates"
  },
  {
    "q": "What are the three main outcomes of complement activation?",
    "a": "<ol><li>Opsonization (C3b)</li><li>Inflammation (C3a, C5a)</li><li>Membrane Attack Complex (MAC — C5b-9)</li></ol>"
  },
  {
    "q": "What is the role of <b>CD4 T helper</b> cells?",
    "a": "Orchestrate immune response via cytokine secretion. Subsets: <b>Th1</b>, <b>Th2</b>, <b>Th17</b>, <b>Treg</b>, <b>Tfh</b>."
  },
  {
    "q": "What is the master cytokine for <b>Th1</b> differentiation?",
    "a": "<b>IFN-γ</b> (activates <b>macrophages</b>, promotes cell-mediated immunity)"
  },
  {
    "q": "What is the master cytokine for <b>Th2</b> differentiation?",
    "a": "<b>IL-4</b> (promotes humoral immunity, <b>IgE</b> class switching, eosinophil activation)"
  },
  {
    "q": "What is the master cytokine for <b>Th17</b> differentiation?",
    "a": "<b>IL-6 + TGF-β</b> (recruits <b>neutrophils</b>, important in autoimmunity and fungal defense)"
  },
  {
    "q": "What is the function of Regulatory T cells (<b>Tregs</b>)?",
    "a": "Suppress immune response (prevent autoimmunity). Express <b><b>FoxP3</b></b> and CD25."
  },
  {
    "q": "What is the role of T follicular helper (<b>Tfh</b>) cells?",
    "a": "Help B cells in germinal centers (class switching, affinity maturation, memory B cell formation)"
  },
  {
    "q": "What is the difference between central and <b>peripheral tolerance</b>?",
    "a": "<ul><li><b><b>Central</b>:</b> Negative selection in thymus/bone marrow</li><li><b><b>Peripheral</b>:</b> Anergy, suppression by Tregs, ignorance</li></ul>"
  },
  {
    "q": "What are the four types of <b>hypersensitivity</b> reactions?",
    "a": "<ul><li><b><b>Type I</b>:</b> Immediate (IgE)</li><li><b><b>Type II</b>:</b> Cytotoxic (IgG/IgM)</li><li><b><b>Type III</b>:</b> Immune complex</li><li><b><b>Type IV</b>:</b> Delayed (T-cell mediated)</li></ul>"
  },
  {
    "q": "Give examples of <b>Type I</b> <b>hypersensitivity</b>.",
    "a": "Anaphylaxis, allergic rhinitis, asthma, food allergy"
  },
  {
    "q": "Give examples of <b>Type II</b> <b>hypersensitivity</b>.",
    "a": "Autoimmune hemolytic anemia, Goodpasture syndrome, <b>Graves disease</b>, <b>Myasthenia gravis</b>"
  },
  {
    "q": "Give examples of <b>Type III</b> <b>hypersensitivity</b>.",
    "a": "SLE (anti-dsDNA), Post-streptococcal glomerulonephritis, Serum sickness, Arthus reaction"
  },
  {
    "q": "Give examples of <b>Type IV</b> <b>hypersensitivity</b>.",
    "a": "Contact dermatitis, TB skin test, Graft rejection, Type 1 diabetes"
  },
  {
    "q": "What is the mechanism of <b>Type IV</b> <b>hypersensitivity</b>?",
    "a": "T cell mediated (<b>Th1</b> → macrophage activation or CD8 cytotoxicity)"
  },
  {
    "q": "What is the difference between active and <b>passive immunity</b>?",
    "a": "<ul><li><b><b>Active</b>:</b> Host produces antibodies (vaccination, infection)</li><li><b><b>Passive</b>:</b> Pre-formed antibodies given (e.g., RhoGAM, antitoxin)</li></ul>"
  },
  {
    "q": "What is immunological memory?",
    "a": "Faster, stronger, and more specific response on re-exposure due to memory B and T cells"
  },
  {
    "q": "What is the difference between primary and secondary immune response?",
    "a": "<ul><li><b>Primary:</b> slow, mostly IgM</li><li><b>Secondary:</b> rapid, high-affinity IgG (anamnestic response)</li></ul>"
  },
  {
    "q": "What are <b>superantigens</b>?",
    "a": "Bacterial toxins (e.g., TSST-1, staphylococcal enterotoxins) that bind <b>MHC II</b> and TCR outside the peptide-binding groove → massive cytokine storm"
  },
  {
    "q": "What is the most common primary immunodeficiency?",
    "a": "<b>Selective <b>IgA</b> deficiency</b>"
  },
  {
    "q": "What is the defect in X-linked <b>agammaglobulinemia</b> (<b>Bruton</b>)?",
    "a": "<b>BTK</b> mutation → no mature B cells, absent <b>plasma cells</b> and immunoglobulins"
  },
  {
    "q": "What is the defect in <b>SCID</b> (most common form)?",
    "a": "<b>IL-2Rγ chain</b> deficiency (X-linked) or ADA deficiency"
  },
  {
    "q": "What is the classic presentation of <b>DiGeorge</b> syndrome?",
    "a": "<b>CATCH-22</b>: Cardiac defects, Abnormal facies, Thymic hypoplasia, Cleft palate, Hypocalcemia (22q11 deletion)"
  },
  {
    "q": "What is the defect in <b>Chronic Granulomatous Disease</b> (<b>CGD</b>)?",
    "a": "<b><b>NADPH</b> oxidase</b> deficiency → inability to produce superoxide → recurrent catalase-positive infections"
  },
  {
    "q": "What is the nitroblue test used for?",
    "a": "Diagnosis of <b>CGD</b> (negative in <b>CGD</b>)"
  },
  {
    "q": "What is the defect in <b>Leukocyte Adhesion Deficiency</b> (<b>LAD</b>)?",
    "a": "<b>CD18</b> (β2 integrin) deficiency → delayed umbilical cord separation, poor pus formation"
  },
  {
    "q": "What is the defect in <b>Chediak-Higashi</b> syndrome?",
    "a": "<b>LYST</b> gene → giant granules, albinism, recurrent infections, neurological issues"
  },
  {
    "q": "What is the defect in <b>Job syndrome</b> (Hyper-<b>IgE</b>)?",
    "a": "<b>STAT3</b> mutation → high <b>IgE</b>, eczema, recurrent cold abscesses (Staph), coarse facies"
  },
  {
    "q": "What are the two main types of graft rejection?",
    "a": "<b>Acute</b> (T-cell mediated) and <b>Chronic</b> (vascular fibrosis, obliterative vasculopathy)"
  },
  {
    "q": "What is <b>hyperacute rejection</b>?",
    "a": "Pre-existing antibodies (ABO mismatch or anti-HLA) → immediate thrombosis and <b>necrosis</b>"
  },
  {
    "q": "What drug class is used for induction immunosuppression?",
    "a": "Anti-thymocyte globulin, <b>basiliximab</b> (IL-2R antagonist)"
  },
  {
    "q": "What is the mechanism of action of <b>cyclosporine</b> and <b>tacrolimus</b>?",
    "a": "Calcineurin inhibitors → block IL-2 transcription"
  },
  {
    "q": "What is the mechanism of <b>sirolimus</b> (<b>rapamycin</b>)?",
    "a": "mTOR inhibitor → blocks IL-2 signaling and T cell proliferation"
  },
  {
    "q": "What is the mechanism of <b>mycophenolate mofetil</b>?",
    "a": "Inhibits IMPDH → blocks purine synthesis in lymphocytes"
  },
  {
    "q": "What is the major side effect of long-term steroid use in transplant patients?",
    "a": "Osteoporosis, hyperglycemia, hypertension, Cushingoid features"
  },
  {
    "q": "Which cytokine is known as the 'macrophage activating factor'?",
    "a": "<b>IFN-γ</b> (produced by <b>Th1</b> and <b>NK cells</b>)"
  },
  {
    "q": "Which cytokine stimulates <b>IgE</b> class switching and eosinophil activation?",
    "a": "<b>IL-5</b> (<b>Th2</b> cytokine)"
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
    "q": "Which cytokine drives <b>Th17</b> differentiation and is pro-inflammatory?",
    "a": "<b>IL-17</b> and <b>IL-23</b>"
  },
  {
    "q": "What is the role of TGF-β in immunity?",
    "a": "Anti-inflammatory; promotes <b>Treg</b> differentiation and <b>IgA</b> class switching"
  },
  {
    "q": "Which cytokine is produced by <b>Th1</b> cells and activates <b>macrophages</b>?",
    "a": "<b>IFN-γ</b>"
  },
  {
    "q": "What is the function of IL-10?",
    "a": "Potent anti-inflammatory cytokine (produced by <b>Tregs</b>, <b>Th2</b>, <b>macrophages</b>)"
  },
  {
    "q": "What is the major cytokine responsible for fever?",
    "a": "<b>IL-1</b> and <b><b>TNF</b>-α</b>"
  },
  {
    "q": "Which cells produce <b>Type I</b> interferons (IFN-α/β)?",
    "a": "Plasmacytoid dendritic cells and virus-infected cells"
  },
  {
    "q": "What is the function of <b>Type I</b> interferons?",
    "a": "Inhibit viral replication, increase <b>MHC I</b> expression, activate <b>NK cells</b>"
  },
  {
    "q": "Give three examples of <b>Type II</b> (cytotoxic) <b>hypersensitivity</b>.",
    "a": "<ol><li>Autoimmune hemolytic anemia</li><li>Goodpasture syndrome</li><li>Myasthenia gravis / Graves disease</li></ol>"
  },
  {
    "q": "Give three examples of <b>Type III</b> (immune complex) <b>hypersensitivity</b>.",
    "a": "<ol><li>SLE</li><li>Post-streptococcal glomerulonephritis</li><li>Serum sickness</li></ol>"
  },
  {
    "q": "Give three examples of <b>Type IV</b> (delayed) <b>hypersensitivity</b>.",
    "a": "<ol><li>TB skin test (PPD)</li><li>Contact dermatitis (poison ivy)</li><li>Graft rejection</li></ol>"
  },
  {
    "q": "What is the Arthus reaction?",
    "a": "<b>Localized Type III hypersensitivity</b> — immune complex deposition after antigen injection (e.g., vaccine booster)"
  },
  {
    "q": "What is serum sickness?",
    "a": "<b>Systemic Type III hypersensitivity</b> — fever, rash, arthralgia, glomerulonephritis after exposure to foreign proteins"
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
    "a": "<b><b>Primary Biliary Cholangitis</b> (PBC)</b>"
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
    "q": "Which HLA alleles are associated with <b>celiac disease</b>?",
    "a": "<b>HLA-DQ2 and DQ8</b>"
  },
  {
    "q": "Which HLA is associated with rheumatoid arthritis?",
    "a": "<b>HLA-DR4</b>"
  },
  {
    "q": "What test is used to diagnose <b>CGD</b>?",
    "a": "<b>Dihydrorhodamine (DHR)</b> flow cytometry (preferred) or <b>NBT</b> test"
  },
  {
    "q": "What is the inheritance pattern of <b>CGD</b>?",
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
    "a": "<b>ATM</b> gene (DNA repair defect) → cerebellar ataxia, telangiectasias, <b>IgA</b> deficiency, increased cancer risk"
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
    "a": "<b>C1 esterase inhibitor (C1-INH)</b> deficiency → uncontrolled <b>bradykinin</b> production → non-pitting edema"
  },
  {
    "q": "What is the treatment for hereditary angioedema?",
    "a": "C1-INH concentrate, icatibant (<b>bradykinin</b> B2 antagonist), or ecallantide"
  },
  {
    "q": "What is the difference between direct and indirect <b>Coombs test</b>?",
    "a": "<ul><li><b><b>Direct</b>:</b> detects antibodies already on RBCs</li><li><b><b>Indirect</b>:</b> detects antibodies in serum</li></ul>"
  },
  {
    "q": "What is the mechanism of <b>Type II</b> <b>hypersensitivity</b> in autoimmune hemolytic anemia?",
    "a": "<b>IgG</b> or <b>IgM</b> against RBC antigens → complement activation or phagocytosis"
  },
  {
    "q": "What is the major difference between warm and cold autoimmune hemolytic anemia?",
    "a": "<ul><li><b><b>Warm</b>:</b> IgG, extravascular hemolysis (splenic)</li><li><b><b>Cold</b>:</b> IgM, intravascular hemolysis (complement)</li></ul>"
  },
  {
    "q": "What infection is classically associated with <b>cold agglutinin</b> disease?",
    "a": "<b>Mycoplasma pneumoniae</b> or EBV"
  },
  {
    "q": "What is the most common cause of secondary immunodeficiency worldwide?",
    "a": "<b>HIV infection</b>"
  },
  {
    "q": "What is the mechanism of action of <b>rituximab</b>?",
    "a": "Anti-CD20 monoclonal antibody → B cell depletion"
  },
  {
    "q": "What is the mechanism of action of <b>infliximab</b>/<b>adalimumab</b>?",
    "a": "Anti-<b>TNF</b>-α monoclonal antibodies"
  },
  {
    "q": "What is the mechanism of action of <b>etanercept</b>?",
    "a": "<b>TNF</b> receptor fusion protein (decoy receptor)"
  },
  {
    "q": "Name two live attenuated vaccines contraindicated in immunocompromised patients.",
    "a": "<b>MMR</b> and <b>Varicella</b> (also oral polio, yellow fever, rotavirus)"
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
    "a": "<ul><li><b><b>Active</b>:</b> induces memory (vaccines)</li><li><b><b>Passive</b>:</b> immediate protection, no memory (immunoglobulins)</li></ul>"
  },
  {
    "q": "What is the major complication of live vaccines in <b>SCID</b> patients?",
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
    "a": "<ul><li><b>TSA:</b> unique to tumor (e.g., neoantigens)</li><li><b>TAA:</b> overexpressed normal proteins (e.g., HER2, MART-1)</li></ul>"
  },
  {
    "q": "Name two immune checkpoint molecules targeted in cancer immunotherapy.",
    "a": "<b>PD-1</b>/<b>PD-L1</b> and <b>CTLA-4</b>"
  },
  {
    "q": "What is the mechanism of action of <b>pembrolizumab</b> / <b>nivolumab</b>?",
    "a": "<b>Anti-<b>PD-1</b></b> monoclonal antibodies — block <b>PD-1</b>/<b>PD-L1</b> interaction → unleash T cells against tumors"
  },
  {
    "q": "What is the mechanism of <b>ipilimumab</b>?",
    "a": "<b>Anti-<b>CTLA-4</b></b> monoclonal antibody — blocks inhibitory signal on T cells"
  },
  {
    "q": "What is the most common primary immunodeficiency in adults?",
    "a": "<b>Selective <b>IgA</b> deficiency</b>"
  },
  {
    "q": "What is the clinical presentation of selective <b>IgA</b> deficiency?",
    "a": "Recurrent sinopulmonary and GI infections, anaphylaxis to blood products, increased autoimmune disease"
  },
  {
    "q": "What is the defect in Severe Combined Immunodeficiency (<b>SCID</b>)?",
    "a": "Defective T and B cell development (most common: IL-2Rγ chain or ADA deficiency)"
  },
  {
    "q": "What is the treatment for <b>SCID</b>?",
    "a": "Bone marrow / stem cell transplant (curative); gene therapy for some forms"
  },
  {
    "q": "What is the classic presentation of X-linked <b>agammaglobulinemia</b> (<b>Bruton</b> disease)?",
    "a": "Boys with recurrent bacterial infections after 6 months of age, absent B cells and <b>plasma cells</b>, low immunoglobulins"
  },
  {
    "q": "What is the defect in Hyper-<b>IgM</b> syndrome?",
    "a": "Defective CD40 ligand (X-linked) or CD40 → inability to class switch from <b>IgM</b>"
  },
  {
    "q": "What infections are common in Hyper-<b>IgM</b> syndrome?",
    "a": "Recurrent sinopulmonary infections + opportunistic infections (Pneumocystis jirovecii)"
  },
  {
    "q": "What is the inheritance of <b>Chronic Granulomatous Disease</b> (<b>CGD</b>)?",
    "a": "70% X-linked (CYBB gene), 30% autosomal recessive"
  },
  {
    "q": "What organisms are most common in <b>CGD</b> infections?",
    "a": "Catalase-positive organisms: Staph aureus, Aspergillus, Serratia, Burkholderia"
  },
  {
    "q": "What is the pathognomonic finding in <b>Chediak-Higashi</b> syndrome?",
    "a": "Giant cytoplasmic granules in leukocytes"
  },
  {
    "q": "What is the triad of <b>Job syndrome</b> (Autosomal dominant Hyper-<b>IgE</b> syndrome)?",
    "a": "<ol><li>High IgE</li><li>Eczema</li><li>Recurrent cold staphylococcal abscesses</li></ol>"
  },
  {
    "q": "What gene is mutated in <b>Job syndrome</b>?",
    "a": "<b>STAT3</b>"
  },
  {
    "q": "What is the defect in <b>Leukocyte Adhesion Deficiency</b> Type 1 (<b>LAD</b>-1)?",
    "a": "Deficiency of CD18 (β2-integrin) → impaired neutrophil migration"
  },
  {
    "q": "What is the classic clinical clue for <b>LAD</b>-1?",
    "a": "Delayed separation of umbilical cord + marked leukocytosis without pus formation"
  },
  {
    "q": "What complement components are deficient in patients with recurrent Neisseria infections?",
    "a": "<b>Terminal complement (C5–C9)</b> — inability to form MAC"
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
    "a": "CD4 count &lt;200 cells/μL or presence of AIDS-defining illness"
  },
  {
    "q": "What is the most common opportunistic infection in AIDS patients with CD4 &lt;200?",
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
    "q": "What is the major difference between <b>allograft</b>, <b>xenograft</b>, and <b>isograft</b>?",
    "a": "<ul><li><b><b>Isograft</b>:</b> identical twin</li><li><b><b>Allograft</b>:</b> same species</li><li><b><b>Xenograft</b>:</b> different species</li></ul>"
  },
  {
    "q": "What is <b>hyperacute rejection</b> mediated by?",
    "a": "Pre-formed antibodies (ABO or anti-HLA) → immediate complement activation and thrombosis"
  },
  {
    "q": "What is the main mechanism of <b>acute cellular rejection</b>?",
    "a": "<b>CD8+ T cells</b> and <b>CD4+ T cells</b> attacking graft"
  },
  {
    "q": "What is the main mechanism of <b>chronic rejection</b>?",
    "a": "Vascular fibrosis and obliterative arteriopathy (accelerated atherosclerosis)"
  },
  {
    "q": "Which immunosuppressant is most associated with nephrotoxicity?",
    "a": "<b>Cyclosporine</b> and <b>Tacrolimus</b> (calcineurin inhibitors)"
  },
  {
    "q": "Which immunosuppressant is most associated with gingival hyperplasia and hirsutism?",
    "a": "<b>Cyclosporine</b>"
  },
  {
    "q": "Which immunosuppressant increases risk of post-transplant lymphoproliferative disorder (PTLD)?",
    "a": "<b>All</b> potent immunosuppressants, especially those causing profound T-cell <b>suppression</b>"
  },
  {
    "q": "What is the mechanism of <b>azathioprine</b>?",
    "a": "Purine analog → inhibits lymphocyte proliferation (converted to 6-MP)"
  },
  {
    "q": "What drug interaction is dangerous with <b>azathioprine</b>?",
    "a": "Allopurinol (inhibits xanthine oxidase → increased toxicity)"
  },
  {
    "q": "What is the mechanism of <b>basiliximab</b>?",
    "a": "<b>Anti-IL-2 receptor (CD25) monoclonal antibody</b> — induction therapy"
  },
  {
    "q": "What is the function of muromonab-CD3 (OKT3)?",
    "a": "<b>Anti-CD3 antibody</b> — depletes T cells (rarely used now)"
  },
  {
    "q": "What is <b>graft-versus-host disease</b> (<b>GVHD</b>)?",
    "a": "Donor T cells attack recipient tissues (skin, liver, GI tract) after bone marrow transplant"
  },
  {
    "q": "What is the difference between acute and chronic <b>GVHD</b>?",
    "a": "<ul><li><b><b>Acute</b>:</b> &lt;100 days, maculopapular rash, diarrhea, jaundice</li><li><b><b>Chronic</b>:</b> &gt;100 days, scleroderma-like skin changes, sicca syndrome</li></ul>"
  },
  {
    "q": "What is the treatment for acute <b>GVHD</b>?",
    "a": "High-dose corticosteroids ± other immunosuppressants"
  },
  {
    "q": "Name two cancers strongly associated with EBV.",
    "a": "<b>Burkitt lymphoma</b> and Nasopharyngeal carcinoma"
  },
  {
    "q": "Name two cancers strongly associated with HPV.",
    "a": "Cervical cancer and Oropharyngeal <b>squamous cell carcinoma</b>"
  },
  {
    "q": "Name one cancer associated with Hepatitis B/C.",
    "a": "<b>Hepatocellular carcinoma (HCC)</b>"
  },
  {
    "q": "What is the role of <b>PD-L1</b> on tumor cells?",
    "a": "Inhibits T cell activation via <b>PD-1</b> receptor → immune evasion"
  },
  {
    "q": "What is immune checkpoint blockade?",
    "a": "Therapeutic antibodies that block inhibitory signals (<b>PD-1</b>, <b>CTLA-4</b>) to enhance anti-tumor immunity"
  },
  {
    "q": "What is the <b>Warburg effect</b> in tumor immunology?",
    "a": "Cancer cells preferentially use aerobic glycolysis even in presence of oxygen"
  },
  {
    "q": "What are tumor-associated <b>macrophages</b> (TAMs)?",
    "a": "Often M2-polarized → promote tumor growth, <b>angiogenesis</b>, and suppress anti-tumor immunity"
  },
  {
    "q": "What is the role of regulatory T cells (<b>Tregs</b>) in cancer?",
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
    "q": "What is the classic skin finding in <b>graft-versus-host disease</b>?",
    "a": "Maculopapular rash starting on palms, soles, and ears"
  },
  {
    "q": "What is the classic autoantibody in <b>Hashimoto thyroiditis</b>?",
    "a": "Anti-thyroid peroxidase (<b>anti-TPO</b>) and anti-thyroglobulin antibodies"
  },
  {
    "q": "What is the classic autoantibody in <b>Graves disease</b>?",
    "a": "<b>Thyroid-stimulating immunoglobulin (TSI)</b> — TSH receptor antibody"
  },
  {
    "q": "What is the classic autoantibody in <b>Myasthenia Gravis</b>?",
    "a": "Anti-acetylcholine receptor (<b>AChR</b>) antibodies"
  },
  {
    "q": "What is the classic autoantibody in <b>Lambert-Eaton</b> myasthenic syndrome?",
    "a": "Anti-voltage-gated calcium channel (<b>VGCC</b>) antibodies"
  },
  {
    "q": "What is the classic autoantibody in <b>pernicious anemia</b>?",
    "a": "Anti-<b>intrinsic factor</b> and anti-parietal cell antibodies"
  },
  {
    "q": "What is the classic autoantibody in <b>primary biliary cholangitis</b>?",
    "a": "Anti-mitochondrial antibodies (<b>AMA</b>)"
  },
  {
    "q": "What is the classic autoantibody in <b>autoimmune hepatitis</b> Type 1?",
    "a": "Anti-smooth muscle antibody (<b>ASMA</b>) and ANA"
  },
  {
    "q": "What disease is associated with <b>anti-Jo-1</b> antibodies?",
    "a": "Polymyositis / Antisynthetase syndrome"
  },
  {
    "q": "What disease is associated with <b>anti-SSA</b> (Ro) and <b>anti-SSB</b> (La)?",
    "a": "<b>Sjögren</b> syndrome"
  },
  {
    "q": "What is the HLA association for Type 1 Diabetes Mellitus?",
    "a": "<b>HLA-DR3 and DR4</b>"
  },
  {
    "q": "What is <b>molecular mimicry</b>? Give an example.",
    "a": "Immune response against pathogen cross-reacts with self-antigen. Example: <b>Rheumatic fever</b> (Strep M protein mimics cardiac myosin)"
  },
  {
    "q": "What is the pathogenesis of <b>rheumatic fever</b>?",
    "a": "<b>Type II hypersensitivity</b> — molecular mimicry between group A Strep and heart valves, joints, skin, brain"
  },
  {
    "q": "What is the major <b>Jones criterion</b> for <b>rheumatic fever</b>?",
    "a": "Carditis, Polyarthritis, Chorea, Erythema marginatum, Subcutaneous nodules"
  },
  {
    "q": "What is the treatment for acute <b>rheumatic fever</b>?",
    "a": "Penicillin + anti-inflammatory agents (aspirin or corticosteroids)"
  },
  {
    "q": "What is the major cause of death in untreated rheumatic heart disease?",
    "a": "<b>Mitral stenosis</b>"
  },
  {
    "q": "What is the mechanism of action of <b>abatacept</b>?",
    "a": "<b>CTLA-4-Ig fusion protein</b> — blocks CD28-B7 co-stimulation"
  },
  {
    "q": "What is the mechanism of <b>tocilizumab</b>?",
    "a": "Anti-IL-6 receptor antibody"
  },
  {
    "q": "What is the mechanism of <b>ustekinumab</b>?",
    "a": "Anti-IL-12/IL-23 monoclonal antibody"
  },
  {
    "q": "What is the mechanism of <b>secukinumab</b>?",
    "a": "Anti-IL-17A monoclonal antibody"
  },
  {
    "q": "Which vaccine type carries risk of reversion to virulence?",
    "a": "Live attenuated vaccines"
  },
  {
    "q": "Which vaccine is contraindicated in pregnancy?",
    "a": "Live vaccines (<b>MMR</b>, <b>Varicella</b>, etc.)"
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
    "q": "What is <b>herd immunity</b>?",
    "a": "Indirect protection from infectious disease when a large percentage of population is immune"
  },
  {
    "q": "What is the most effective way to prevent measles outbreaks?",
    "a": "High <b>MMR</b> vaccination coverage (&gt;95%)"
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
    "q": "What is <b>central tolerance</b>?",
    "a": "Elimination of self-reactive lymphocytes in primary lymphoid organs (thymus for T cells, bone marrow for B cells)"
  },
  {
    "q": "What is <b>peripheral tolerance</b>?",
    "a": "Mechanisms outside primary organs: anergy, deletion, <b>suppression</b> by <b>Tregs</b>"
  },
  {
    "q": "What transcription factor is essential for <b>Treg</b> development?",
    "a": "<b><b>FoxP3</b></b>"
  },
  {
    "q": "What is <b>AIRE gene</b> defect associated with?",
    "a": "<b>Autoimmune Polyendocrine Syndrome Type 1 (APS-1)</b> — candidiasis, hypoparathyroidism, Addison disease"
  },
  {
    "q": "What is the function of <b>CTLA-4</b>?",
    "a": "<b>Inhibitory receptor on T cells</b> — competes with CD28 for B7 binding"
  },
  {
    "q": "What is the function of <b>PD-1</b>/<b>PD-L1</b> interaction?",
    "a": "Inhibits T cell activation and promotes tolerance"
  },
  {
    "q": "What is immune privilege? Give examples.",
    "a": "Sites with reduced immune surveillance: eye (anterior chamber), brain, testes, fetus"
  },
  {
    "q": "What is the role of Fas-FasL in immunity?",
    "a": "Induces <b>apoptosis</b> in target cells (important in activation-induced cell death)"
  },
  {
    "q": "What is the difference between <b>necrosis</b> and <b>apoptosis</b> in immune context?",
    "a": "<b>Necrosis</b> → inflammation; <b>Apoptosis</b> → no inflammation (silent clearance)"
  },
  {
    "q": "What is the most common cause of secondary <b>amyloidosis</b> (AA amyloid)?",
    "a": "Chronic inflammation (e.g., rheumatoid arthritis, TB, familial Mediterranean fever)"
  },
  {
    "q": "What is the most common organ affected by <b>amyloidosis</b>?",
    "a": "Kidney (proteinuria, nephrotic syndrome)"
  },
  {
    "q": "What stain is used to diagnose <b>amyloidosis</b>?",
    "a": "<b>Congo red</b> — apple-green birefringence under polarized light"
  },
  {
    "q": "What is the most common paraneoplastic syndrome in <b>small cell lung cancer</b>?",
    "a": "<b>SIADH</b> and Cushing syndrome (ectopic ACTH)"
  },
  {
    "q": "What tumor marker is elevated in <b>seminoma</b>?",
    "a": "β-hCG (mild elevation)"
  },
  {
    "q": "What tumor marker is elevated in <b>yolk sac tumor</b>?",
    "a": "<b>AFP</b>"
  },
  {
    "q": "What is the most common primary brain tumor in adults?",
    "a": "<b>Glioblastoma multiforme</b>"
  },
  {
    "q": "What is the characteristic histologic feature of glioblastoma?",
    "a": "<b>Pseudopalisading</b> <b>necrosis</b> and microvascular proliferation"
  },
  {
    "q": "What is the most common childhood brain tumor in the posterior fossa?",
    "a": "<b>Medulloblastoma</b>"
  },
  {
    "q": "What virus is associated with primary CNS lymphoma in AIDS patients?",
    "a": "EBV"
  },
  {
    "q": "What is the most common route of <b>metastasis</b> for carcinomas?",
    "a": "Lymphatic spread"
  },
  {
    "q": "What is the most common route of <b>metastasis</b> for sarcomas?",
    "a": "<b>Hematogenous</b> spread"
  }
];
module.exports = { immunologyCards };
