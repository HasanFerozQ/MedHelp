const pathologyCards = [
  {
    "q": "What are the five cardinal signs of inflammation?",
    "a": "<ul><li><b>Rubor</b> — redness</li><li><b>Tumor</b> — swelling</li><li><b>Calor</b> — heat</li><li><b>Dolor</b> — pain</li><li><b>Functio laesa</b> — loss of function</li></ul>"
  },
  {
    "q": "What are the main components of acute inflammation?",
    "a": "Vascular changes (vasodilation, increased permeability) + Cellular events (leukocyte recruitment)."
  },
  {
    "q": "What is the first leukocyte to arrive at the site of acute inflammation?",
    "a": "<b>Neutrophils</b> (within minutes to hours)."
  },
  {
    "q": "What are the steps of leukocyte extravasation?",
    "a": "<ol><li><b>Margination</b></li><li><b>Rolling</b> (selectins)</li><li><b>Adhesion</b> (integrins)</li><li><b>Transmigration / Diapedesis</b></li><li><b>Chemotaxis</b></li></ol>"
  },
  {
    "q": "What are the main <b>opsonins</b>?",
    "a": "<b>IgG</b>, <b>C3b</b>, and mannose-binding lectin."
  },
  {
    "q": "What is the role of <b>histamine</b> in inflammation?",
    "a": "Vasodilation and increased vascular permeability (from <b>mast cells</b> and <b>basophils</b>)."
  },
  {
    "q": "What are the major chemotactic factors?",
    "a": "<b>C5a</b>, <b>LTB4</b>, <b>IL-8</b> (CXCL8), bacterial products."
  },
  {
    "q": "What is the difference between transudate and exudate?",
    "a": "<ul><li><b>Transudate:</b> low protein, low cells (due to pressure imbalance).</li><li><b>Exudate:</b> high protein, high cells (due to inflammation).</li></ul>"
  },
  {
    "q": "What are the types of chronic inflammation?",
    "a": "Granulomatous and non-granulomatous."
  },
  {
    "q": "What cells characterize granulomatous inflammation?",
    "a": "Epithelioid <b>macrophages</b> ± multinucleated giant cells."
  },
  {
    "q": "What are the two types of granulomas?",
    "a": "<b>Caseating</b> (e.g., TB) and Non-<b>caseating</b> (e.g., sarcoidosis)."
  },
  {
    "q": "What is the difference between regeneration and repair?",
    "a": "<ul><li><b>Regeneration:</b> complete restoration of normal tissue.</li><li><b>Repair:</b> fibrosis/scarring when regeneration is limited.</li></ul>"
  },
  {
    "q": "What are the labile, stable, and permanent tissues?",
    "a": "<ul><li><b>Labile:</b> high turnover (skin, GI epithelium, bone marrow)</li><li><b>Stable:</b> low turnover but can regenerate (liver, kidney, pancreas)</li><li><b>Permanent:</b> cannot divide (neurons, cardiac muscle, skeletal muscle)</li></ul>"
  },
  {
    "q": "What is <b>granulation tissue</b>?",
    "a": "<b>Proliferating fibroblasts, new capillaries, and macrophages</b> — precursor to scar."
  },
  {
    "q": "What is the most important growth factor in wound healing?",
    "a": "TGF-β (Transforming Growth Factor Beta)."
  },
  {
    "q": "What is primary intention wound healing?",
    "a": "Clean surgical wounds with approximated edges → minimal scarring."
  },
  {
    "q": "What is secondary intention wound healing?",
    "a": "Large wounds with significant tissue loss → <b>granulation tissue</b> fills defect → more scarring."
  },
  {
    "q": "What are the complications of wound healing?",
    "a": "<ul><li><b>Infection</b></li><li><b>Dehiscence</b> (wound reopening)</li><li><b>Keloid / Hypertrophic scar</b></li><li><b>Contracture</b></li></ul>"
  },
  {
    "q": "What is a <b>keloid</b>?",
    "a": "Excessive collagen deposition beyond original wound boundaries (more common in dark-skinned individuals)."
  },
  {
    "q": "What is <b>amyloidosis</b>?",
    "a": "Extracellular deposition of misfolded proteins that stain with <b>Congo red</b> (<b>apple-green birefringence</b> under polarized light)."
  },
  {
    "q": "What is the most common type of <b>amyloidosis</b>?",
    "a": "<b>AL (primary) amyloidosis</b> — from plasma cell dyscrasia (light chains)."
  },
  {
    "q": "What is AA <b>amyloidosis</b> associated with?",
    "a": "Chronic inflammation (e.g., rheumatoid arthritis, TB)."
  },
  {
    "q": "What is the most common organ affected in <b>amyloidosis</b>?",
    "a": "Kidney (nephrotic syndrome)."
  },
  {
    "q": "What are the hallmarks of reversible cell injury?",
    "a": "<ul><li><b>Cellular swelling</b> (hydropic change)</li><li><b>Fatty change</b> (steatosis)</li><li><b>Plasma membrane blebbing</b></li></ul>"
  },
  {
    "q": "What are the hallmarks of irreversible cell injury?",
    "a": "<ul><li><b>Mitochondrial damage</b> (flocculent densities)</li><li><b>Plasma membrane rupture</b></li><li>Nuclear changes: <b>pyknosis</b> → <b>karyorrhexis</b> → <b>karyolysis</b></li></ul>"
  },
  {
    "q": "What is the most sensitive organelle to hypoxic injury?",
    "a": "Mitochondria."
  },
  {
    "q": "What is liquefactive <b>necrosis</b>?",
    "a": "Enzymatic digestion of tissue (seen in brain infarcts and abscesses)."
  },
  {
    "q": "What is caseous <b>necrosis</b>?",
    "a": "Cheese-like appearance (classic in TB granulomas)."
  },
  {
    "q": "What is fat <b>necrosis</b>?",
    "a": "Enzymatic fat digestion (seen in acute pancreatitis)."
  },
  {
    "q": "What is fibrinoid <b>necrosis</b>?",
    "a": "Deposition of fibrin-like material in vessel walls (seen in vasculitis)."
  },
  {
    "q": "What is gangrenous <b>necrosis</b>?",
    "a": "Coagulative <b>necrosis</b> + superimposed bacterial infection (dry vs wet gangrene)."
  },
  {
    "q": "What is the difference between <b>apoptosis</b> and <b>necrosis</b>?",
    "a": "<ul><li><b>Apoptosis:</b> programmed, energy-dependent, no inflammation.</li><li><b>Necrosis:</b> accidental, inflammatory.</li></ul>"
  },
  {
    "q": "What are the major pathways of <b>apoptosis</b>?",
    "a": "<ul><li><b>Intrinsic (mitochondrial):</b> cytochrome c release → caspase-9 → caspase-3</li><li><b>Extrinsic (death receptor):</b> FasL/TNF → caspase-8 → caspase-3</li></ul>"
  },
  {
    "q": "What is the key executioner caspase in <b>apoptosis</b>?",
    "a": "<b>Caspase-3</b>."
  },
  {
    "q": "What protein inhibits <b>apoptosis</b>?",
    "a": "<b>Bcl-2</b> (anti-apoptotic)."
  },
  {
    "q": "What protein promotes <b>apoptosis</b>?",
    "a": "<b>Bax</b>/<b>Bak</b> (pro-apoptotic)."
  },
  {
    "q": "What is the role of <b>p53</b> in cell injury?",
    "a": "Tumor suppressor; induces cell cycle arrest or <b>apoptosis</b> in response to DNA damage."
  },
  {
    "q": "What are the two main categories of neoplasia?",
    "a": "Benign and Malignant."
  },
  {
    "q": "What are the key differences between benign and malignant tumors?",
    "a": "<ul><li><b>Benign:</b> localized, slow-growing, well-differentiated, no metastasis.</li><li><b>Malignant:</b> invasive, rapid growth, poorly differentiated, capable of metastasis.</li></ul>"
  },
  {
    "q": "What is <b>dysplasia</b>?",
    "a": "Disordered growth with loss of uniformity and architectural orientation (pre-malignant)."
  },
  {
    "q": "What is <b>carcinoma in situ</b>?",
    "a": "Malignant cells confined to epithelium without invasion of basement membrane."
  },
  {
    "q": "What is the most important determinant of tumor behavior?",
    "a": "Degree of differentiation (grade) and stage (extent of spread)."
  },
  {
    "q": "What is tumor grading based on?",
    "a": "Degree of differentiation and mitotic activity."
  },
  {
    "q": "What is tumor staging based on?",
    "a": "Size, lymph node involvement, and distant <b>metastasis</b> (<b>TNM system</b>)."
  },
  {
    "q": "What is the most common route of <b>metastasis</b> for carcinomas?",
    "a": "<b>Lymphatics</b>."
  },
  {
    "q": "What is the most common route of <b>metastasis</b> for sarcomas?",
    "a": "<b>Hematogenous</b> (blood)."
  },
  {
    "q": "What is the most common site of <b>hematogenous</b> <b>metastasis</b>?",
    "a": "Lung and liver."
  },
  {
    "q": "What is the <b>Warburg effect</b>?",
    "a": "Cancer cells preferentially use glycolysis even in the presence of oxygen (aerobic glycolysis)."
  },
  {
    "q": "What is tumor <b>angiogenesis</b>?",
    "a": "New blood vessel formation induced by tumors (mainly via <b>VEGF</b>)."
  },
  {
    "q": "What are the hallmarks of cancer (Hanahan & Weinberg)?",
    "a": "<ol><li>Sustaining <b>proliferative signaling</b></li><li>Evading <b>growth suppressors</b></li><li>Resisting <b>cell death</b></li><li>Enabling <b>replicative immortality</b></li><li>Inducing <b>angiogenesis</b></li><li>Activating <b>invasion & metastasis</b></li></ol>"
  },
  {
    "q": "What is the most common cancer in men worldwide?",
    "a": "Lung cancer."
  },
  {
    "q": "What is the most common cancer in women worldwide?",
    "a": "Breast cancer."
  },
  {
    "q": "What is the most common cause of cancer death in men and women?",
    "a": "Lung cancer."
  },
  {
    "q": "What tumor marker is used for hepatocellular carcinoma?",
    "a": "<b>AFP</b> (alpha-fetoprotein)."
  },
  {
    "q": "What tumor marker is used for prostate cancer?",
    "a": "<b>PSA</b> (prostate-specific antigen)."
  },
  {
    "q": "What tumor marker is used for ovarian cancer?",
    "a": "<b>CA-125</b>."
  },
  {
    "q": "What tumor marker is used for pancreatic cancer?",
    "a": "<b>CA 19-9</b>."
  },
  {
    "q": "What tumor marker is used for colorectal cancer?",
    "a": "<b>CEA</b> (carcinoembryonic antigen)."
  },
  {
    "q": "What is the most common paraneoplastic syndrome?",
    "a": "Hypercalcemia (due to <b>PTHrP</b> or osteolytic metastases)."
  },
  {
    "q": "What cancer is associated with <b>SIADH</b>?",
    "a": "<b>Small cell lung cancer</b>."
  },
  {
    "q": "What cancer is associated with Cushing syndrome (ectopic ACTH)?",
    "a": "<b>Small cell lung cancer</b>."
  },
  {
    "q": "What cancer is associated with hypertrophic osteoarthropathy?",
    "a": "Lung cancer (non-small cell)."
  },
  {
    "q": "What cancer is associated with <b>Lambert-Eaton</b> myasthenic syndrome?",
    "a": "<b>Small cell lung cancer</b>."
  },
  {
    "q": "What cancer is associated with polycythemia?",
    "a": "<b>Renal cell carcinoma</b> (EPO production)."
  },
  {
    "q": "What is the most common primary brain tumor in adults?",
    "a": "<b>Glioblastoma multiforme</b>."
  },
  {
    "q": "What is the most common primary brain tumor in children?",
    "a": "<b>Pilocytic astrocytoma</b>."
  },
  {
    "q": "What is the most common malignant bone tumor in children?",
    "a": "<b>Osteosarcoma</b>."
  },
  {
    "q": "What is the most common malignant bone tumor in adults?",
    "a": "Metastatic carcinoma (much more common than primary)."
  },
  {
    "q": "What is the most common soft tissue sarcoma in children?",
    "a": "<b>Rhabdomyosarcoma</b>."
  },
  {
    "q": "What is the most common soft tissue sarcoma in adults?",
    "a": "<b>Liposarcoma</b>."
  },
  {
    "q": "What is the most common leukemia in children?",
    "a": "Acute lymphoblastic leukemia (<b>ALL</b>)."
  },
  {
    "q": "What is the most common leukemia in adults?",
    "a": "Chronic lymphocytic leukemia (<b>CLL</b>)."
  },
  {
    "q": "What is the most common lymphoma in adults in the Western world?",
    "a": "<b>Diffuse large B-cell lymphoma</b>."
  },
  {
    "q": "What is the most common Hodgkin lymphoma subtype?",
    "a": "<b>Nodular sclerosis</b>."
  },
  {
    "q": "What cell is characteristic of Hodgkin lymphoma?",
    "a": "<b>Reed-Sternberg</b> cell."
  },
  {
    "q": "What are the classic <b>Reed-Sternberg</b> cell variants?",
    "a": "<ul><li><b>Owl-eye</b> — Classic RS cell (nodular sclerosis, mixed cellularity)</li><li><b>Popcorn cell</b> — Lymphocyte predominant</li><li><b>Lacunar cell</b> — Nodular sclerosis</li></ul>"
  },
  {
    "q": "What is the most common non-Hodgkin lymphoma?",
    "a": "<b>Diffuse large B-cell lymphoma</b>."
  },
  {
    "q": "What is <b>Burkitt lymphoma</b> associated with?",
    "a": "EBV and <b>c-MYC</b> translocation t(8;14). <b>Starry sky</b> appearance."
  },
  {
    "q": "What is <b>mantle cell lymphoma</b> associated with?",
    "a": "t(11;14) cyclin D1 overexpression."
  },
  {
    "q": "What is <b>follicular lymphoma</b> associated with?",
    "a": "t(14;18) <b>BCL-2</b> overexpression."
  },
  {
    "q": "What is the most common leukemia in adults in the Western world?",
    "a": "Chronic lymphocytic leukemia (<b>CLL</b>)."
  },
  {
    "q": "What is the hallmark of <b>CLL</b>/SLL on smear?",
    "a": "<b>Smudge cells</b>."
  },
  {
    "q": "What is the most common myeloproliferative neoplasm?",
    "a": "<b>Polycythemia vera</b> (<b>JAK2</b> mutation)."
  },
  {
    "q": "What is the most common cause of death in untreated chronic myeloid leukemia?",
    "a": "<b>Blast crisis</b>."
  },
  {
    "q": "What translocation is diagnostic for <b>CML</b>?",
    "a": "t(9;22) <b>Philadelphia chromosome</b> (<b>BCR-ABL</b>)."
  },
  {
    "q": "What is the most common mutation in myeloproliferative neoplasms?",
    "a": "<b><b>JAK2</b> V617F</b>."
  },
  {
    "q": "What is the most common cause of nephrotic syndrome in children?",
    "a": "<b>Minimal change disease</b>."
  },
  {
    "q": "What is the most common cause of nephrotic syndrome in adults?",
    "a": "Focal segmental glomerulosclerosis (<b>FSGS</b>)."
  },
  {
    "q": "What is the most common glomerulonephritis worldwide?",
    "a": "<b><b>IgA</b> nephropathy</b> (<b>Berger disease</b>)."
  },
  {
    "q": "What is the classic finding in post-streptococcal glomerulonephritis?",
    "a": "Subepithelial humps on electron microscopy, low C3."
  },
  {
    "q": "What is the most common cause of rapidly progressive glomerulonephritis (RPGN)?",
    "a": "Pauci-immune (ANCA-associated) GN."
  },
  {
    "q": "What is the most common renal malignancy in adults?",
    "a": "<b>Renal cell carcinoma</b> (clear cell type)."
  },
  {
    "q": "What is the classic triad of <b>renal cell carcinoma</b>?",
    "a": "Hematuria, flank pain, palpable mass (late finding)."
  },
  {
    "q": "What paraneoplastic syndrome is associated with <b>renal cell carcinoma</b>?",
    "a": "Polycythemia (EPO production)."
  },
  {
    "q": "What is the most common testicular tumor in young men?",
    "a": "<b>Seminoma</b>."
  },
  {
    "q": "What tumor marker is elevated in <b>seminoma</b>?",
    "a": "May have mildly elevated β-hCG."
  },
  {
    "q": "What is the most common germ cell tumor in children?",
    "a": "<b>Yolk sac tumor</b> (elevated <b>AFP</b>)."
  },
  {
    "q": "What is the most common ovarian tumor in young women?",
    "a": "Mature cystic teratoma (<b>dermoid cyst</b>)."
  },
  {
    "q": "What is the most common malignant ovarian tumor?",
    "a": "<b>Serous cystadenocarcinoma</b>."
  },
  {
    "q": "What is the most common breast carcinoma?",
    "a": "<b>Invasive ductal carcinoma</b> (no special type)."
  },
  {
    "q": "What is the most common site of breast cancer?",
    "a": "Upper outer quadrant."
  },
  {
    "q": "What is the most important prognostic factor in breast cancer?",
    "a": "Axillary lymph node status."
  },
  {
    "q": "What is the most common mutation in hereditary breast cancer?",
    "a": "<b>BRCA1</b> or <b>BRCA2</b>."
  },
  {
    "q": "What is <b>Paget disease</b> of the breast?",
    "a": "Eczematous lesion of nipple due to underlying ductal <b>carcinoma in situ</b> or invasive carcinoma."
  },
  {
    "q": "What is the most common thyroid carcinoma?",
    "a": "<b>Papillary thyroid carcinoma</b>."
  },
  {
    "q": "What is the characteristic nuclear feature of <b>papillary thyroid carcinoma</b>?",
    "a": "<ul><li><b>Orphan Annie eye nuclei</b> (ground-glass, empty appearing)</li><li><b>Nuclear grooves</b></li><li><b>Psammoma bodies</b></li></ul>"
  },
  {
    "q": "What is the most aggressive thyroid carcinoma?",
    "a": "<b>Anaplastic thyroid carcinoma</b>."
  },
  {
    "q": "What is the most common primary malignant bone tumor in children/adolescents?",
    "a": "<b>Osteosarcoma</b>."
  },
  {
    "q": "What is the most common primary malignant bone tumor in adults?",
    "a": "<b>Multiple myeloma</b> (plasmacytoma)."
  },
  {
    "q": "What is the most common metastatic site for <b>osteosarcoma</b>?",
    "a": "Lungs."
  },
  {
    "q": "What is the most common primary malignant brain tumor in adults?",
    "a": "<b>Glioblastoma multiforme</b> (grade IV astrocytoma)."
  },
  {
    "q": "What is the characteristic histologic feature of glioblastoma?",
    "a": "<b>Necrosis</b> with <b>pseudopalisading</b> and endothelial proliferation."
  },
  {
    "q": "What is the most common supratentorial tumor in children?",
    "a": "<b>Craniopharyngioma</b>."
  },
  {
    "q": "What is the most common posterior fossa tumor in children?",
    "a": "<b>Medulloblastoma</b>."
  },
  {
    "q": "What mutation is found in &gt;95% of <b>polycythemia vera</b> cases?",
    "a": "<b><b>JAK2</b> V617F</b>."
  },
  {
    "q": "What is the most common indolent lymphoma?",
    "a": "<b>Follicular lymphoma</b>."
  },
  {
    "q": "What translocation is characteristic of <b>follicular lymphoma</b>?",
    "a": "<b>t(14;18)</b> — BCL2 overexpression."
  },
  {
    "q": "What is the most common aggressive lymphoma?",
    "a": "<b>Diffuse large B-cell lymphoma</b>."
  },
  {
    "q": "What virus is associated with <b>Burkitt lymphoma</b> in Africa?",
    "a": "EBV."
  },
  {
    "q": "What is the most common cause of death in <b>multiple myeloma</b>?",
    "a": "Infection (due to hypogammaglobulinemia) or renal failure."
  },
  {
    "q": "What is the most common skin cancer?",
    "a": "<b>Basal cell carcinoma</b>."
  },
  {
    "q": "What is the most common skin cancer with metastatic potential?",
    "a": "<b>Melanoma</b>."
  },
  {
    "q": "What is the most important prognostic factor in <b>melanoma</b>?",
    "a": "<b>Breslow thickness</b> (depth of invasion)."
  },
  {
    "q": "What is the ABCDE rule for <b>melanoma</b>?",
    "a": "<ul><li><b>A</b> — Asymmetry</li><li><b>B</b> — Border irregularity</li><li><b>C</b> — Color variation</li><li><b>D</b> — Diameter &gt;6 mm</li><li><b>E</b> — Evolution (change over time)</li></ul>"
  },
  {
    "q": "What is the most common type of lung cancer?",
    "a": "<b>Adenocarcinoma</b> (especially in non-smokers and women)."
  },
  {
    "q": "What is the most common lung cancer in smokers?",
    "a": "<b>Squamous cell carcinoma</b>."
  },
  {
    "q": "What lung cancer is most strongly associated with smoking?",
    "a": "<b>Small cell lung cancer</b>."
  },
  {
    "q": "What is the most common paraneoplastic syndrome in <b>small cell lung cancer</b>?",
    "a": "<b>SIADH</b> and Cushing syndrome (ectopic ACTH)."
  },
  {
    "q": "What is the most common cause of superior vena cava syndrome?",
    "a": "Lung cancer (especially small cell)."
  },
  {
    "q": "What is the most common primary cardiac tumor in adults?",
    "a": "<b>Myxoma</b> (usually left atrium)."
  },
  {
    "q": "What is the most common primary cardiac tumor in children?",
    "a": "<b>Rhabdomyoma</b> (associated with tuberous sclerosis)."
  },
  {
    "q": "What is the most common metastatic tumor to the heart?",
    "a": "Lung cancer."
  }
];
module.exports = { pathologyCards };
