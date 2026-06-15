const endocrineCards = [
  {
    "q": "What is the difference between endocrine, paracrine, and autocrine signaling?",
    "a": "<ul><li><b>Endocrine:</b> Hormone released into blood → distant target.</li><li><b>Paracrine:</b> Acts on nearby cells.</li><li><b>Autocrine:</b> Acts on the same cell that secreted it.</li></ul>"
  },
  {
    "q": "What are the two major chemical classes of hormones?",
    "a": "<ol><li><b>Peptide/Protein hormones</b> (water-soluble, act via membrane receptors)</li><li><b>Steroid hormones</b> (lipid-soluble, act via intracellular receptors)</li><li>Thyroid hormones behave like steroids despite being amino acid derivatives.</li></ol>"
  },
  {
    "q": "What is the second messenger for peptide hormones that use G-protein coupled receptors?",
    "a": "Commonly <b>cAMP</b> (Gs or Gi) or <b>IP3/DAG</b> (Gq)."
  },
  {
    "q": "What is the mechanism of action of steroid hormones?",
    "a": "Diffuse into cell → bind cytoplasmic or nuclear receptor → hormone-receptor complex acts as transcription factor → alters gene expression."
  },
  {
    "q": "What is the hypothalamic-pituitary axis?",
    "a": "Hypothalamus releases releasing/inhibiting hormones → anterior pituitary releases tropic hormones → target glands."
  },
  {
    "q": "Which hormones are released from the posterior pituitary?",
    "a": "<b>ADH (Vasopressin)</b> and <b>Oxytocin</b> (synthesized in hypothalamus, stored in posterior pituitary)."
  },
  {
    "q": "Which hormones are released from the anterior pituitary?",
    "a": "FSH, LH, ACTH, TSH, GH, Prolactin (FLAT PiG mnemonic)."
  },
  {
    "q": "What is the function of Growth Hormone (GH)?",
    "a": "Promotes linear growth, protein synthesis, lipolysis, and insulin resistance. Stimulated by GHRH, inhibited by somatostatin."
  },
  {
    "q": "What mediates most effects of Growth Hormone?",
    "a": "<b>IGF-1 (Somatomedin C)</b> produced mainly in the liver."
  },
  {
    "q": "What is the feedback regulation of GH?",
    "a": "IGF-1 and GH provide negative feedback on hypothalamus and anterior pituitary."
  },
  {
    "q": "What is acromegaly vs gigantism?",
    "a": "<ul><li><b>Gigantism:</b> GH excess before epiphyseal closure.</li><li><b>Acromegaly:</b> GH excess after epiphyseal closure (enlarged hands, feet, jaw, visceromegaly).</li></ul>"
  },
  {
    "q": "What is the most common cause of acromegaly?",
    "a": "Pituitary adenoma secreting GH."
  },
  {
    "q": "What is the diagnostic test for acromegaly?",
    "a": "Failure of GH suppression after oral glucose load + elevated IGF-1."
  },
  {
    "q": "What is prolactin’s main function?",
    "a": "Stimulates milk production (lactation). Inhibited by dopamine (PIH)."
  },
  {
    "q": "What are common causes of hyperprolactinemia?",
    "a": "Prolactinoma, pregnancy, dopamine antagonists (antipsychotics), hypothyroidism (↑ TRH)."
  },
  {
    "q": "What are the clinical features of prolactinoma?",
    "a": "Galactorrhea, amenorrhea/oligomenorrhea, infertility, decreased libido, headaches/visual field defects (bitemporal hemianopia)."
  },
  {
    "q": "What is the treatment of choice for prolactinoma?",
    "a": "Dopamine agonists (cabergoline or bromocriptine)."
  },
  {
    "q": "What is the function of ACTH?",
    "a": "Stimulates adrenal cortex (zona fasciculata) to produce cortisol."
  },
  {
    "q": "What is the diurnal rhythm of cortisol?",
    "a": "Highest in early morning, lowest at midnight."
  },
  {
    "q": "What is the primary regulator of ACTH and cortisol?",
    "a": "CRH from hypothalamus → ACTH from pituitary → cortisol (negative feedback on CRH and ACTH)."
  },
  {
    "q": "What are the major effects of cortisol (glucocorticoids)?",
    "a": "↑ gluconeogenesis, lipolysis, protein catabolism, anti-inflammatory, immunosuppressive, stress response."
  },
  {
    "q": "What is Cushing syndrome vs Cushing disease?",
    "a": "<ul><li><b>Cushing syndrome:</b> Any cause of excess glucocorticoids.</li><li><b>Cushing disease:</b> Pituitary adenoma secreting ACTH.</li></ul>"
  },
  {
    "q": "What is the dexamethasone suppression test used for?",
    "a": "To differentiate causes of Cushing syndrome."
  },
  {
    "q": "What is Addison’s disease?",
    "a": "Primary adrenal insufficiency → ↓ cortisol and ↓ aldosterone → hypotension, hyperkalemia, hyponatremia, hyperpigmentation."
  },
  {
    "q": "What is the most common cause of primary adrenal insufficiency?",
    "a": "Autoimmune adrenalitis (in developed countries)."
  },
  {
    "q": "What is a key lab finding in primary adrenal insufficiency?",
    "a": "High ACTH (due to loss of negative feedback) + hyperpigmentation."
  },
  {
    "q": "What is the function of aldosterone?",
    "a": "↑ Na⁺ reabsorption and K⁺/H⁺ secretion in collecting duct (principal and alpha-intercalated cells)."
  },
  {
    "q": "What regulates aldosterone secretion?",
    "a": "Mainly Angiotensin II and hyperkalemia. ACTH has minor role."
  },
  {
    "q": "What is Conn syndrome?",
    "a": "Primary hyperaldosteronism (adrenal adenoma) → hypertension, hypokalemia, metabolic alkalosis."
  },
  {
    "q": "What is the renin level in primary vs secondary hyperaldosteronism?",
    "a": "<ul><li><b>Primary (Conn):</b> Low renin.</li><li><b>Secondary:</b> High renin (e.g., renal artery stenosis).</li></ul>"
  },
  {
    "q": "What is the function of thyroid hormones (T₃ & T₄)?",
    "a": "↑ basal metabolic rate, ↑ protein synthesis, ↑ β-adrenergic receptors, critical for brain development."
  },
  {
    "q": "Which is more potent: T₃ or T₄?",
    "a": "T₃ is 3–4 times more potent. Most T₄ is converted to T₃ peripherally."
  },
  {
    "q": "What is the regulation of thyroid hormone synthesis?",
    "a": "TRH (hypothalamus) → TSH (anterior pituitary) → thyroid gland. Negative feedback by T₃/T₄."
  },
  {
    "q": "What is the role of thyroglobulin?",
    "a": "Storage and precursor for T₃ and T₄ synthesis in thyroid follicles."
  },
  {
    "q": "What is the Wolff-Chaikoff effect?",
    "a": "High iodine levels temporarily inhibit thyroid hormone synthesis."
  },
  {
    "q": "What is the Jod-Basedow phenomenon?",
    "a": "Hyperthyroidism induced by iodine load in patients with autonomous thyroid nodules."
  },
  {
    "q": "What lab pattern is seen in primary hyperthyroidism?",
    "a": "↑ T₄/T₃, ↓ TSH."
  },
  {
    "q": "What is the most common cause of hyperthyroidism?",
    "a": "Graves’ disease."
  },
  {
    "q": "What is the pathognomonic finding in Graves’ disease?",
    "a": "TSH receptor stimulating antibodies (TSI)."
  },
  {
    "q": "What are the extrathyroidal manifestations of Graves’ disease?",
    "a": "Exophthalmos (proptosis), pretibial myxedema, thyroid acropachy."
  },
  {
    "q": "What is the primary mechanism of hormone action for steroid hormones?",
    "a": "Bind intracellular (nuclear) receptors → hormone-receptor complex acts as transcription factor → alters gene expression (slow onset, long duration)."
  },
  {
    "q": "What are the two main types of cell-surface hormone receptors?",
    "a": "<b>1.</b> G-protein coupled receptors (GPCRs)<br><b>2.</b> Receptor tyrosine kinases (e.g., insulin receptor) or associated tyrosine kinases (JAK-STAT for GH, prolactin)."
  },
  {
    "q": "Which hormones use cAMP as second messenger? (Mnemonic)",
    "a": "<b>FLAT ChAMP</b><br>FSH, LH, ACTH, TSH, CRH, hCG, ADH (V2), Melanocyte-stimulating hormone, PTH."
  },
  {
    "q": "Which hormones use IP3/DAG pathway?",
    "a": "GnRH, TRH, Oxytocin, ADH (V1), Angiotensin II, α₁-adrenergic."
  },
  {
    "q": "Compare the half-life and storage of peptide vs. steroid hormones.",
    "a": "<ul><li><b>Peptide/Amine (water-soluble):</b> Stored in vesicles, short half-life, rapid action.</li><li><b>Steroid/Thyroid (lipid-soluble):</b> Not stored, longer half-life, bound to carrier proteins in blood.</li></ul>"
  },
  {
    "q": "What is the hypothalamic-pituitary axis regulation?",
    "a": "Hypothalamus releases releasing/inhibiting hormones into portal system → Anterior pituitary → Tropic hormones → Target glands → Negative feedback."
  },
  {
    "q": "Name the anterior pituitary hormones (FLAT PiG mnemonic).",
    "a": "<b>F</b>SH, <b>L</b>H, <b>A</b>CTH, <b>T</b>SH, <b>P</b>rolactin, <b>i</b>GH (Growth hormone)."
  },
  {
    "q": "Which anterior pituitary hormone is under predominant inhibitory control?",
    "a": "<b>Prolactin</b> — inhibited by dopamine (PIH) from hypothalamus."
  },
  {
    "q": "What is the effect of dopamine on prolactin?",
    "a": "Inhibits prolactin release. Dopamine antagonists (e.g., antipsychotics) cause hyperprolactinemia."
  },
  {
    "q": "Trace the pathway of Growth Hormone (GH) signaling.",
    "a": "GHRH → Anterior pituitary → GH release → Liver produces IGF-1 (somatomedin) → growth effects. GH also has direct effects (lipolysis, insulin resistance)."
  },
  {
    "q": "What stimulates and inhibits GH secretion?",
    "a": "<ul><li><b>Stimulators:</b> GHRH, hypoglycemia, exercise, sleep, amino acids, ghrelin.</li><li><b>Inhibitors:</b> Somatostatin, IGF-1, hyperglycemia, free fatty acids.</li></ul>"
  },
  {
    "q": "What is the most common cause of acromegaly?",
    "a": "GH-secreting pituitary adenoma (macroadenoma)."
  },
  {
    "q": "Clinical presentation of acromegaly vs. gigantism.",
    "a": "<ul><li><b>Gigantism:</b> Excess GH before epiphyseal closure (linear growth).</li><li><b>Acromegaly:</b> After closure → acral growth, coarsening features, prognathism, visceromegaly.</li></ul>"
  },
  {
    "q": "Diagnostic test for acromegaly.",
    "a": "Failure of GH suppression after oral glucose load + elevated IGF-1."
  },
  {
    "q": "What is the treatment of choice for acromegaly?",
    "a": "Transsphenoidal surgical resection; medical: octreotide (somatostatin analog), pegvisomant (GH receptor antagonist), cabergoline."
  },
  {
    "q": "What is Sheehan syndrome?",
    "a": "Postpartum pituitary necrosis due to hemorrhage/hypotension → panhypopituitarism."
  },
  {
    "q": "What is the most common pituitary adenoma?",
    "a": "Prolactinoma (microadenoma in women, macroadenmac in men)."
  },
  {
    "q": "Classic presentation of prolactinoma in women vs. men.",
    "a": "<ul><li><b>Women:</b> Amenorrhea-galactorrhea.</li><li><b>Men:</b> Decreased libido, impotence, gynecomastia (later due to mass effect).</li></ul>"
  },
  {
    "q": "Treatment of prolactinoma.",
    "a": "Dopamine agonists: Bromocriptine or Cabergoline (first-line)."
  },
  {
    "q": "What are the posterior pituitary hormones and their origin?",
    "a": "<b>ADH (Vasopressin) and Oxytocin</b> — synthesized in supraoptic and paraventricular nuclei of hypothalamus, stored and released from posterior pituitary."
  },
  {
    "q": "What stimulates ADH release?",
    "a": "↑ Plasma osmolality (osmoreceptors), ↓ blood volume/pressure (baroreceptors), angiotensin II, nausea, pain, nicotine."
  },
  {
    "q": "What are the two main receptors for ADH?",
    "a": "<ul><li><b>V1 (vascular):</b> IP3/DAG → vasoconstriction.</li><li><b>V2 (renal):</b> cAMP → insertion of aquaporin-2 channels.</li></ul>"
  },
  {
    "q": "What is SIADH? Key lab findings.",
    "a": "Inappropriate ADH secretion → euvolemic hyponatremia, ↓ serum osmolality, ↑ urine osmolality (&gt;100 mOsm/kg), high urine Na⁺."
  },
  {
    "q": "Most common causes of SIADH.",
    "a": "Small cell lung cancer, CNS disorders (meningitis, stroke), pulmonary disease, drugs (SSRIs, carbamazepine)."
  },
  {
    "q": "Treatment of SIADH.",
    "a": "Fluid restriction (first-line), demeclocycline, tolvaptan (V2 antagonist), hypertonic saline (severe/symptomatic)."
  },
  {
    "q": "What is central diabetes insipidus? Diagnostic test.",
    "a": "Deficiency of ADH. Water deprivation test: urine osmolality remains low; responds to desmopressin."
  },
  {
    "q": "What is nephrogenic diabetes insipidus?",
    "a": "Kidneys do not respond to ADH (V2 receptor or aquaporin defect). No response to desmopressin."
  },
  {
    "q": "Causes of nephrogenic DI.",
    "a": "Lithium, hypercalcemia, hypokalemia, demeclocycline, congenital (V2/AQP2 mutations)."
  },
  {
    "q": "What is the hypothalamic hormone that stimulates TSH?",
    "a": "<b>TRH (Thyrotropin-releasing hormone)</b>."
  },
  {
    "q": "What inhibits TSH release?",
    "a": "Thyroid hormones (T₃/T₄) via negative feedback on pituitary and hypothalamus."
  },
  {
    "q": "Outline thyroid hormone synthesis steps.",
    "a": "<ol><li>Iodide uptake (NIS)</li><li>Oxidation & organification (Thyroid peroxidase)</li><li>Coupling (MIT + DIT → T₃; DIT+DIT → T₄)</li><li>Storage as thyroglobulin</li><li>Proteolysis & release.</li></ol>"
  },
  {
    "q": "Which enzyme is inhibited by PTU and methimazole?",
    "a": "<b>Thyroid peroxidase</b> (organification and coupling)."
  },
  {
    "q": "Which drug also inhibits peripheral T₄ → T₃ conversion?",
    "a": "<b>PTU (Propylthiouracil)</b> (also used in pregnancy)."
  },
  {
    "q": "What is the most active thyroid hormone?",
    "a": "<b>T₃</b> (3–4× more potent than T₄). Most T₃ comes from peripheral deiodination of T₄."
  },
  {
    "q": "What is the effect of thyroid hormones on metabolism?",
    "a": "↑ Basal metabolic rate, ↑ O₂ consumption, ↑ Na⁺/K⁺-ATPase, ↑ thermogenesis, ↑ β-adrenergic sensitivity."
  },
  {
    "q": "What are the causes of primary hyperthyroidism?",
    "a": "Graves’ disease (most common), toxic multinodular goiter, toxic adenoma, thyroiditis."
  },
  {
    "q": "Pathophysiology of Graves’ disease.",
    "a": "TSH-receptor stimulating antibodies (TSI) → diffuse thyroid hyperplasia and excess hormone production."
  },
  {
    "q": "Classic triad of Graves’ disease.",
    "a": "Hyperthyroidism + diffuse goiter + exophthalmos (proptosis) + pretibial myxedema."
  },
  {
    "q": "Lab findings in primary hyperthyroidism.",
    "a": "↑ T₄/T₃, ↓ TSH (suppressed)."
  },
  {
    "q": "Treatment options for Graves’ disease.",
    "a": "Antithyroid drugs (methimazole/PTU), radioactive iodine (¹³¹I), thyroidectomy, β-blockers for symptoms."
  },
  {
    "q": "What is Hashimoto’s thyroiditis?",
    "a": "Autoimmune (anti-TPO, anti-Tg antibodies) → chronic lymphocytic infiltration → hypothyroidism."
  },
  {
    "q": "Most common cause of hypothyroidism in iodine-sufficient areas.",
    "a": "Hashimoto’s thyroiditis."
  },
  {
    "q": "Lab findings in primary hypothyroidism.",
    "a": "↓ T₄/T₃, ↑ TSH."
  },
  {
    "q": "What is the Wolff-Chaikoff effect?",
    "a": "High iodine load inhibits thyroid peroxidase → temporary decrease in thyroid hormone synthesis."
  },
  {
    "q": "What is the Jod-Basedow phenomenon?",
    "a": "Iodine-induced hyperthyroidism (seen in patients with autonomous nodules)."
  },
  {
    "q": "What is the function of parathyroid hormone (PTH)?",
    "a": "↑ Serum Ca²⁺ by: bone resorption, renal Ca²⁺ reabsorption, 1α-hydroxylase activation (↑ Vit D), ↓ renal PO₄ reabsorption."
  },
  {
    "q": "What is the effect of PTH on phosphate?",
    "a": "Phosphaturic (increases renal excretion)."
  },
  {
    "q": "Primary hyperparathyroidism: labs and most common cause.",
    "a": "↑ Ca²⁺, ↑ or inappropriately normal PTH, ↓ PO₄. Most common: parathyroid adenoma."
  },
  {
    "q": "What is the most common cause of secondary hyperparathyroidism?",
    "a": "Chronic kidney disease (↓ Vit D activation + phosphate retention)."
  },
  {
    "q": "What is the treatment of hypoparathyroidism?",
    "a": "Calcium + active vitamin D (calcitriol)."
  },
  {
    "q": "What is the embryonic origin of parathyroid glands?",
    "a": "Superior: 4th pharyngeal pouch; Inferior: 3rd pharyngeal pouch."
  },
  {
    "q": "What are the zones of the adrenal cortex and their products? (Mnemonic)",
    "a": "<b>GFR</b> (Salt, Sugar, Sex)<br><b>G</b>lomerulosa: Aldosterone (mineralocorticoid)<br><b>F</b>asciculata: Cortisol (glucocorticoid)<br><b>R</b>eticularis: Androgens (DHEA)."
  },
  {
    "q": "What is the rate-limiting step in steroid hormone synthesis?",
    "a": "Cholesterol → Pregnenolone via <b>Desmolase (CYP11A1)</b> (stimulated by ACTH via StAR protein)."
  },
  {
    "q": "What stimulates aldosterone release?",
    "a": "Angiotensin II (main), hyperkalemia, ACTH (minor)."
  },
  {
    "q": "What is Conn syndrome?",
    "a": "Primary hyperaldosteronism (aldosterone-producing adenoma) → hypertension, hypokalemia, metabolic alkalosis, suppressed renin."
  },
  {
    "q": "What is Addison’s disease? Classic presentation.",
    "a": "Primary adrenal insufficiency. Hyperpigmentation, hyponatremia, hyperkalemia, hypotension, hypoglycemia."
  },
  {
    "q": "Diagnostic test for Addison’s disease.",
    "a": "ACTH stimulation test (low cortisol response)."
  },
  {
    "q": "What is Waterhouse-Friderichsen syndrome?",
    "a": "Bilateral adrenal hemorrhage (usually in meningococcal sepsis) → acute adrenal crisis."
  },
  {
    "q": "What is Cushing syndrome vs. Cushing disease?",
    "a": "<ul><li><b>Cushing syndrome:</b> Any cause of excess glucocorticoids.</li><li><b>Cushing disease:</b> Pituitary ACTH-secreting adenoma (most common endogenous cause).</li></ul>"
  },
  {
    "q": "Best initial screening test for Cushing syndrome.",
    "a": "Overnight low-dose dexamethasone suppression test or 24h urinary free cortisol."
  },
  {
    "q": "High-dose dexamethasone suppression test result in Cushing disease.",
    "a": "Cortisol suppresses (pituitary origin still feedback-sensitive)."
  },
  {
    "q": "What is the main glucocorticoid in humans and its primary metabolic effects?",
    "a": "<b>Cortisol</b><ul><li>↑ Gluconeogenesis</li><li>↑ Lipolysis</li><li>↑ Protein catabolism</li><li>Anti-inflammatory & immunosuppressive effects.</li></ul>"
  },
  {
    "q": "What is the permissive effect of cortisol on catecholamines?",
    "a": "Cortisol upregulates α₁ and β-adrenergic receptors → enhances vascular and cardiac response to catecholamines."
  },
  {
    "q": "How does cortisol affect immune function?",
    "a": "Inhibits inflammatory cytokines (IL-1, IL-6, TNF-α), stabilizes lysosomal membranes, ↓ neutrophil migration, ↓ lymphocyte proliferation."
  },
  {
    "q": "What is the diurnal rhythm of cortisol?",
    "a": "Highest in early morning (around 6–8 AM), lowest at midnight. Regulated by CRH-ACTH axis."
  },
  {
    "q": "What is the difference between primary, secondary, and tertiary adrenal insufficiency?",
    "a": "<ul><li><b>Primary (Addison’s):</b> Adrenal gland damage → ↑ ACTH, hyperpigmentation</li><li><b>Secondary:</b> Pituitary (↓ ACTH)</li><li><b>Tertiary:</b> Hypothalamic (↓ CRH) — most common after steroid withdrawal.</li></ul>"
  },
  {
    "q": "What is the most common cause of primary adrenal insufficiency in developed countries?",
    "a": "Autoimmune adrenalitis (Addison’s disease)."
  },
  {
    "q": "What electrolyte abnormalities are seen in adrenal crisis?",
    "a": "Hyponatremia, hyperkalemia, hypoglycemia, and metabolic acidosis."
  },
  {
    "q": "Treatment of acute adrenal crisis.",
    "a": "IV Hydrocortisone + IV fluids (normal saline with dextrose) + treat underlying cause."
  },
  {
    "q": "What is the renin-angiotensin-aldosterone system (RAAS) activation sequence?",
    "a": "↓ Renal perfusion → Renin (JG cells) → Angiotensinogen → Ang I → ACE (lungs) → Ang II → Aldosterone release + vasoconstriction."
  },
  {
    "q": "What is the effect of aldosterone on the principal cells of the collecting duct?",
    "a": "↑ ENaC channels and Na⁺/K⁺-ATPase → Na⁺ reabsorption + K⁺ & H⁺ secretion."
  },
  {
    "q": "Clinical features of primary hyperaldosteronism (Conn syndrome).",
    "a": "Hypertension, hypokalemia, metabolic alkalosis, muscle weakness, suppressed plasma renin."
  },
  {
    "q": "How do you screen for primary hyperaldosteronism?",
    "a": "Plasma aldosterone-to-renin ratio (ARR) — elevated aldosterone with low renin."
  },
  {
    "q": "What is the most common pancreatic endocrine tumor?",
    "a": "Insulinoma."
  },
  {
    "q": "Whipple’s triad for insulinoma diagnosis.",
    "a": "<ol><li>Symptoms of hypoglycemia</li><li>Low blood glucose (&lt;45–50 mg/dL)</li><li>Relief of symptoms with glucose.</li></ol>"
  },
  {
    "q": "What suppresses insulin release?",
    "a": "Somatostatin, α₂-adrenergic stimulation, low blood glucose."
  },
  {
    "q": "What are the major actions of insulin on metabolism?",
    "a": "↑ Glucose uptake (GLUT₄), ↑ glycogenesis, ↑ lipogenesis, ↑ protein synthesis, ↓ lipolysis, ↓ gluconeogenesis."
  },
  {
    "q": "What is the counter-regulatory hormone to insulin?",
    "a": "<b>Glucagon</b> (also cortisol, epinephrine, GH)."
  },
  {
    "q": "Where is glucagon produced and what stimulates its release?",
    "a": "Alpha cells of pancreas. Stimulated by hypoglycemia, amino acids, epinephrine."
  },
  {
    "q": "Main actions of glucagon.",
    "a": "↑ Glycogenolysis, ↑ gluconeogenesis, ↑ ketogenesis, ↑ lipolysis."
  },
  {
    "q": "Pathophysiology of Type 1 Diabetes Mellitus.",
    "a": "Autoimmune destruction of beta cells → absolute insulin deficiency → hyperglycemia, ketoacidosis."
  },
  {
    "q": "Pathophysiology of Type 2 Diabetes Mellitus.",
    "a": "Insulin resistance + relative insulin deficiency. Strong genetic component + obesity."
  },
  {
    "q": "Classic symptoms of diabetes mellitus (4 P’s + weight loss).",
    "a": "Polyuria, Polydipsia, Polyphagia, Poor wound healing, and unexplained weight loss."
  },
  {
    "q": "Diagnostic criteria for diabetes mellitus.",
    "a": "<ul><li>Fasting plasma glucose ≥126 mg/dL</li><li>HbA1c ≥6.5%</li><li>Random glucose ≥200 mg/dL with symptoms</li><li>OGTT 2h glucose ≥200 mg/dL.</li></ul>"
  },
  {
    "q": "What is the Somogyi effect?",
    "a": "Nocturnal hypoglycemia (from excess insulin) → rebound hyperglycemia in morning due to counter-regulatory hormones."
  },
  {
    "q": "What is the Dawn phenomenon?",
    "a": "Morning hyperglycemia due to surge in GH, cortisol, and glucagon in early morning (no preceding hypoglycemia)."
  },
  {
    "q": "What is DKA? Key metabolic derangements.",
    "a": "Diabetic Ketoacidosis: Hyperglycemia, anion-gap metabolic acidosis, ketonemia. Due to insulin deficiency → lipolysis → ketone production."
  },
  {
    "q": "Treatment of DKA.",
    "a": "IV fluids, insulin infusion, potassium replacement (even if serum K normal), correct acidosis if severe."
  },
  {
    "q": "What is HHS (Hyperosmolar Hyperglycemic State)?",
    "a": "Severe hyperglycemia (&gt;600 mg/dL), hyperosmolarity, profound dehydration, no significant ketoacidosis. More common in Type 2 DM."
  },
  {
    "q": "What is the role of C-peptide in diabetes diagnosis?",
    "a": "Low C-peptide in Type 1 (no endogenous insulin). Normal/high in Type 2 (insulin resistance)."
  },
  {
    "q": "What is the effect of incretins (GLP-1 and GIP) on insulin?",
    "a": "Enhance glucose-dependent insulin secretion, inhibit glucagon, slow gastric emptying."
  },
  {
    "q": "Name two GLP-1 receptor agonists used in Type 2 DM.",
    "a": "Exenatide, Liraglutide (also promote weight loss)."
  },
  {
    "q": "What is the function of amylin?",
    "a": "Co-secreted with insulin; slows gastric emptying and suppresses glucagon."
  },
  {
    "q": "What is the most common cause of hypocalcemia in hospitalized patients?",
    "a": "Hypoalbuminemia (correct with formula) or hypomagnesemia."
  },
  {
    "q": "How does PTH increase serum calcium?",
    "a": "<ol><li>Bone resorption</li><li>Renal Ca²⁺ reabsorption (DCT)</li><li>↑ 1α-hydroxylase → active Vit D → intestinal Ca absorption.</li></ol>"
  },
  {
    "q": "What is the effect of Vitamin D on phosphate?",
    "a": "Increases intestinal absorption of both Ca²⁺ and PO₄³⁻."
  },
  {
    "q": "What is the role of calcitonin?",
    "a": "Lowers serum calcium (minor role in humans); secreted by parafollicular C cells of thyroid in response to hypercalcemia."
  },
  {
    "q": "What are the clinical features of hypocalcemia?",
    "a": "Tetany, Chvostek sign, Trousseau sign, prolonged QT interval, muscle cramps."
  },
  {
    "q": "What is pseudohypoparathyroidism?",
    "a": "End-organ resistance to PTH → hypocalcemia + hyperphosphatemia + elevated PTH. Associated with Albright hereditary osteodystrophy (short stature, round face)."
  },
  {
    "q": "What is the most common cause of hypercalcemia in outpatients vs inpatients?",
    "a": "<ul><li><b>Outpatient:</b> Primary hyperparathyroidism</li><li><b>Inpatient:</b> Malignancy (PTHrP or osteolytic metastases).</li></ul>"
  },
  {
    "q": "What is multiple endocrine neoplasia (MEN) Type 1 (Wermer syndrome)?",
    "a": "<b>3 P’s:</b> Parathyroid, Pituitary, Pancreas (gastrinoma, insulinoma)."
  },
  {
    "q": "What is MEN Type 2A (Sipple syndrome)?",
    "a": "Medullary thyroid carcinoma, Pheochromocytoma, Parathyroid hyperplasia."
  },
  {
    "q": "What is MEN Type 2B?",
    "a": "Medullary thyroid carcinoma, Pheochromocytoma, Mucosal neuromas, Marfanoid habitus."
  },
  {
    "q": "What is the inheritance pattern of MEN syndromes?",
    "a": "Autosomal dominant (RET proto-oncogene in MEN 2A/2B)."
  },
  {
    "q": "What hormone is elevated in medullary thyroid carcinoma?",
    "a": "Calcitonin."
  },
  {
    "q": "What is the embryonic origin of the adrenal medulla?",
    "a": "Neural crest cells (chromaffin cells)."
  },
  {
    "q": "What catecholamines are produced by the adrenal medulla?",
    "a": "Epinephrine (mainly) and norepinephrine."
  },
  {
    "q": "What is the rate-limiting enzyme in catecholamine synthesis?",
    "a": "Tyrosine hydroxylase."
  },
  {
    "q": "Clinical features of pheochromocytoma (Rule of 10s).",
    "a": "10% bilateral, 10% extra-adrenal, 10% malignant, 10% in children, 10% familial."
  },
  {
    "q": "Diagnostic test for pheochromocytoma.",
    "a": "24-hour urinary metanephrines or plasma free metanephrines (most sensitive)."
  },
  {
    "q": "Preoperative management of pheochromocytoma.",
    "a": "α-blockade (phenoxybenzamine) first → then β-blockade. Never start with β-blocker alone (unopposed α → hypertensive crisis)."
  },
  {
    "q": "What is the function of atrial natriuretic peptide (ANP)?",
    "a": "Released in response to atrial stretch → natriuresis, diuresis, ↓ renin & aldosterone."
  },
  {
    "q": "What is the difference between ANP and BNP?",
    "a": "ANP from atria; BNP from ventricles. Both counter-regulate RAAS and sympathetic system."
  },
  {
    "q": "What is the hypothalamic hormone that controls GnRH release?",
    "a": "Kisspeptin (from arcuate nucleus neurons) stimulates GnRH neurons."
  },
  {
    "q": "What is the pattern of GnRH secretion required for normal reproductive function?",
    "a": "Pulsatile secretion. Continuous GnRH leads to downregulation of GnRH receptors → suppression of FSH/LH (used in GnRH agonist therapy)."
  },
  {
    "q": "What hormones are secreted by theca cells vs granulosa cells in the ovary?",
    "a": "<ul><li><b>Theca cells:</b> Androgens (androstenedione) under LH stimulation.</li><li><b>Granulosa cells:</b> Convert androgens to estrogens via aromatase under FSH stimulation.</li></ul>"
  },
  {
    "q": "What is the two-cell, two-gonadotropin theory of estrogen synthesis?",
    "a": "LH stimulates theca cells → androgens → granulosa cells (FSH) aromatize them to estradiol."
  },
  {
    "q": "What is the main estrogen in non-pregnant women? In pregnancy?",
    "a": "Non-pregnant: Estradiol (E2).<br>Pregnancy: Estriol (E3)."
  },
  {
    "q": "What is the role of progesterone in the menstrual cycle?",
    "a": "Secreted by corpus luteum after ovulation. Prepares endometrium for implantation, inhibits uterine contractions."
  },
  {
    "q": "What maintains the corpus luteum in early pregnancy?",
    "a": "Human chorionic gonadotropin (hCG) produced by syncytiotrophoblast."
  },
  {
    "q": "What is the feedback effect of estrogen on LH/FSH before vs after ovulation?",
    "a": "Low estrogen: negative feedback.<br>High sustained estrogen (late follicular): positive feedback → LH surge → ovulation."
  },
  {
    "q": "What is the LH surge trigger for ovulation?",
    "a": "High estradiol levels from dominant follicle → positive feedback on pituitary."
  },
  {
    "q": "What happens during the luteal phase if no fertilization occurs?",
    "a": "Corpus luteum regresses → ↓ progesterone/estrogen → endometrial shedding (menses)."
  },
  {
    "q": "What is the most common cause of primary amenorrhea with absent uterus?",
    "a": "Müllerian agenesis (Mayer-Rokitansky-Küster-Hauser syndrome)."
  },
  {
    "q": "What is Turner syndrome (45,X) endocrine presentation?",
    "a": "Primary ovarian failure → streak gonads, high FSH/LH, low estrogen, amenorrhea, short stature."
  },
  {
    "q": "What is the most common cause of secondary amenorrhea?",
    "a": "Pregnancy (must be ruled out first)."
  },
  {
    "q": "What is polycystic ovary syndrome (PCOS) pathophysiology?",
    "a": "Increased LH/FSH ratio → theca cell hyperplasia → excess androgens → anovulation, polycystic ovaries, insulin resistance."
  },
  {
    "q": "Classic clinical features of PCOS.",
    "a": "Oligo/amenorrhea, hirsutism, acne, obesity, infertility, increased risk of Type 2 DM."
  },
  {
    "q": "First-line treatment for PCOS in a patient desiring fertility.",
    "a": "Clomiphene citrate (anti-estrogen → ↑ FSH)."
  },
  {
    "q": "What is the function of inhibin in the reproductive axis?",
    "a": "Inhibin B (from granulosa cells) selectively inhibits FSH secretion from pituitary."
  },
  {
    "q": "What hormone peaks mid-cycle and triggers ovulation?",
    "a": "Luteinizing hormone (LH) surge."
  },
  {
    "q": "What is the role of relaxin during pregnancy?",
    "a": "Relaxes pelvic ligaments and inhibits uterine contractions."
  },
  {
    "q": "What maintains the endometrium during the luteal phase?",
    "a": "Progesterone."
  },
  {
    "q": "What is the embryonic origin of testosterone-producing cells in males?",
    "a": "Leydig cells (stimulated by LH)."
  },
  {
    "q": "What cells in the seminiferous tubules produce inhibin and support spermatogenesis?",
    "a": "Sertoli cells (stimulated by FSH)."
  },
  {
    "q": "What is the role of androgen-binding protein (ABP)?",
    "a": "Produced by Sertoli cells; concentrates testosterone in seminiferous tubules for spermatogenesis."
  },
  {
    "q": "What is the effect of testosterone on the hypothalamic-pituitary axis?",
    "a": "Negative feedback on GnRH and LH secretion."
  },
  {
    "q": "What is 5α-reductase responsible for?",
    "a": "Conversion of testosterone to dihydrotestosterone (DHT) — more potent androgen responsible for prostate growth and male-pattern baldness."
  },
  {
    "q": "What is the most potent androgen?",
    "a": "Dihydrotestosterone (DHT)."
  },
  {
    "q": "What causes congenital adrenal hyperplasia (most common form)?",
    "a": "21-hydroxylase deficiency → ↓ cortisol & aldosterone, ↑ androgens → virilization in females, salt-wasting crisis in severe cases."
  },
  {
    "q": "What is the enzyme deficiency in the most common form of CAH that causes virilization without salt wasting?",
    "a": "11β-hydroxylase deficiency → ↑ deoxycorticosterone (mineralocorticoid activity) + androgens."
  },
  {
    "q": "What hormone is responsible for the development of male internal genitalia?",
    "a": "Testosterone (from fetal Leydig cells)."
  },
  {
    "q": "What hormone is responsible for the development of male external genitalia?",
    "a": "Dihydrotestosterone (DHT)."
  },
  {
    "q": "What hormone causes regression of Müllerian ducts in males?",
    "a": "Anti-Müllerian hormone (AMH) from Sertoli cells."
  },
  {
    "q": "What is the most common cause of male hypogonadism?",
    "a": "Klinefelter syndrome (47,XXY) — primary hypogonadism, tall stature, gynecomastia, small testes."
  },
  {
    "q": "What is Kallmann syndrome?",
    "a": "Hypogonadotropic hypogonadism + anosmia (failure of GnRH neuron migration with olfactory neurons)."
  },
  {
    "q": "What hormone is elevated in pregnancy and used in pregnancy tests?",
    "a": "Human chorionic gonadotropin (hCG)."
  },
  {
    "q": "What maintains the corpus luteum until the placenta takes over hormone production?",
    "a": "hCG."
  },
  {
    "q": "When does the placenta begin producing progesterone and estrogen independently?",
    "a": "After ~8–10 weeks of gestation."
  },
  {
    "q": "What is the role of human placental lactogen (hPL)?",
    "a": "Similar to growth hormone and prolactin; increases maternal insulin resistance and lipolysis to provide nutrients to fetus."
  },
  {
    "q": "What causes gestational diabetes?",
    "a": "hPL-induced insulin resistance + increased placental hormones."
  },
  {
    "q": "What is the effect of thyroid hormones on fetal development?",
    "a": "Critical for brain development. Maternal hypothyroidism in pregnancy can cause cretinism if untreated."
  },
  {
    "q": "What is the most common cause of thyrotoxicosis in pregnancy?",
    "a": "Gestational transient thyrotoxicosis or Graves’ disease."
  },
  {
    "q": "Why is PTU preferred over methimazole in first trimester?",
    "a": "Lower risk of teratogenicity (methimazole associated with aplasia cutis and choanal atresia)."
  },
  {
    "q": "What hormone is responsible for milk production (lactogenesis)?",
    "a": "Prolactin."
  },
  {
    "q": "What hormone is responsible for milk ejection (let-down reflex)?",
    "a": "Oxytocin (released in response to suckling via neural reflex)."
  },
  {
    "q": "What inhibits prolactin release during pregnancy?",
    "a": "High levels of estrogen and progesterone."
  },
  {
    "q": "What is the effect of suckling on GnRH/LH/FSH?",
    "a": "Inhibits GnRH pulsatility → lactational amenorrhea (natural contraception for ~6 months)."
  },
  {
    "q": "What is the feedback mechanism of testosterone on the HPG axis?",
    "a": "Negative feedback on hypothalamus (GnRH) and pituitary (LH)."
  },
  {
    "q": "What is the primary regulator of spermatogenesis?",
    "a": "FSH (acts on Sertoli cells) + testosterone (acts on Sertoli cells)."
  },
  {
    "q": "What is the role of Sertoli cells in spermatogenesis?",
    "a": "Nourish developing sperm, produce inhibin and ABP, form blood-testis barrier."
  },
  {
    "q": "What lab pattern distinguishes primary from secondary hypothyroidism?",
    "a": "<ul><li><b>Primary:</b> ↑ TSH, ↓ T₄</li><li><b>Secondary:</b> ↓ or normal TSH, ↓ T₄ (pituitary issue).</li></ul>"
  },
  {
    "q": "What is subclinical hypothyroidism?",
    "a": "Elevated TSH with normal free T₄. Often asymptomatic but may progress to overt hypothyroidism."
  },
  {
    "q": "What is the most common cause of goiter worldwide?",
    "a": "Iodine deficiency."
  },
  {
    "q": "What is Riedel’s thyroiditis?",
    "a": "Rare fibrotic thyroiditis that can cause hard goiter and compressive symptoms (mimics malignancy)."
  },
  {
    "q": "What is the effect of amiodarone on thyroid function?",
    "a": "Can cause both hyperthyroidism (Type 1) and hypothyroidism (Type 2) due to high iodine content and direct toxicity."
  },
  {
    "q": "What is the treatment of thyroid storm?",
    "a": "PTU or methimazole + β-blocker (propranolol) + iodine (after thionamide) + glucocorticoids + supportive care."
  },
  {
    "q": "What is myxedema coma? Key features.",
    "a": "Severe hypothyroidism: altered mental status, hypothermia, bradycardia, hyponatremia, respiratory failure. High mortality."
  },
  {
    "q": "What is the most sensitive test for thyroid function?",
    "a": "TSH (best screening test in most patients)."
  },
  {
    "q": "How do you interpret thyroid function tests in pregnancy?",
    "a": "Total T₄ and T₃ increase due to ↑ TBG; use free T₄ and TSH. TSH reference range is lower in first trimester."
  },
  {
    "q": "What is the role of thyroxine-binding globulin (TBG)?",
    "a": "Major carrier protein for T₄ and T₃. Increased by estrogen, pregnancy, OCPs; decreased by androgens, liver disease."
  },
  {
    "q": "What is the mechanism of action of bisphosphonates?",
    "a": "Inhibit osteoclast activity → ↓ bone resorption. Used in osteoporosis and hypercalcemia of malignancy."
  },
  {
    "q": "What is the difference between osteoporosis and osteomalacia?",
    "a": "<ul><li><b>Osteoporosis:</b> Normal bone mineralization, ↓ bone mass.</li><li><b>Osteomalacia:</b> Defective mineralization (Vitamin D deficiency).</li></ul>"
  },
  {
    "q": "What is the effect of chronic glucocorticoid excess on bone?",
    "a": "Inhibits osteoblast function, ↑ osteoclast activity → osteoporosis."
  },
  {
    "q": "What is hungry bone syndrome?",
    "a": "Profound hypocalcemia after parathyroidectomy due to rapid bone uptake of calcium."
  },
  {
    "q": "What malignancy is most associated with hypercalcemia via PTHrP?",
    "a": "Squamous cell carcinoma (lung, head & neck)."
  },
  {
    "q": "What is the treatment of severe hypercalcemia?",
    "a": "IV fluids (first), bisphosphonates (zoledronate), calcitonin, loop diuretics (after hydration)."
  },
  {
    "q": "What is familial hypocalciuric hypercalcemia (FHH)?",
    "a": "Inactivating mutation in CaSR → mild hypercalcemia, low urine calcium, normal/high PTH. Benign, no treatment needed."
  },
  {
    "q": "What is the most common pituitary hormone deficiency?",
    "a": "Growth hormone deficiency."
  },
  {
    "q": "What is the order of pituitary hormone loss in compressive lesions?",
    "a": "GH → FSH/LH → TSH → ACTH (last: prolactin may increase due to loss of inhibition)."
  },
  {
    "q": "What is empty sella syndrome?",
    "a": "Herniation of arachnoid into sella turcica → pituitary compression. Can cause hypopituitarism."
  },
  {
    "q": "What is the most common functioning pituitary adenoma after prolactinoma?",
    "a": "GH-secreting (acromegaly/gigantism)."
  },
  {
    "q": "What is Nelson syndrome?",
    "a": "Rapid enlargement of pituitary adenoma after bilateral adrenalectomy (loss of cortisol feedback → ↑ ACTH)."
  },
  {
    "q": "What is the diagnostic test for diabetes insipidus?",
    "a": "Water deprivation test followed by desmopressin response."
  },
  {
    "q": "What is psychogenic polydipsia?",
    "a": "Excessive water intake → dilute urine, low plasma osmolality. Distinguish from DI by water deprivation test."
  },
  {
    "q": "What is the effect of cortisol on vascular reactivity?",
    "a": "Permissive effect: required for normal vascular response to catecholamines."
  },
  {
    "q": "What is the difference between Cushing syndrome and Cushing disease?",
    "a": "Cushing syndrome = any cause of glucocorticoid excess.<br>Cushing disease = pituitary ACTH-secreting adenoma."
  },
  {
    "q": "What is the most common cause of endogenous Cushing syndrome?",
    "a": "Cushing disease (pituitary adenoma)."
  },
  {
    "q": "What test distinguishes pituitary from ectopic ACTH production?",
    "a": "High-dose dexamethasone suppression test or inferior petrosal sinus sampling."
  },
  {
    "q": "What are the zones of the adrenal cortex and their main products?",
    "a": "Glomerulosa: Aldosterone<br>Fasciculata: Cortisol<br>Reticularis: Androgens (DHEA)."
  },
  {
    "q": "What is the precursor for all steroid hormones?",
    "a": "Cholesterol."
  },
  {
    "q": "What is the rate-limiting enzyme in catecholamine synthesis?",
    "a": "Tyrosine hydroxylase (converted to DOPA)."
  },
  {
    "q": "What is pheochromocytoma rule of 10s?",
    "a": "10% bilateral, 10% malignant, 10% extra-adrenal, 10% in children, 10% familial."
  },
  {
    "q": "What is the screening test for pheochromocytoma?",
    "a": "Plasma free metanephrines or 24h urinary fractionated metanephrines."
  },
  {
    "q": "Preoperative preparation for pheochromocytoma resection.",
    "a": "α-adrenergic blockade (phenoxybenzamine) first, followed by β-blockade."
  },
  {
    "q": "What is the most common extra-adrenal site of pheochromocytoma?",
    "a": "Organ of Zuckerkandl (near aortic bifurcation)."
  },
  {
    "q": "What is the embryologic origin of chromaffin cells?",
    "a": "Neural crest."
  },
  {
    "q": "What is the function of ANP and BNP?",
    "a": "Promote natriuresis, diuresis, vasodilation, and inhibit RAAS."
  },
  {
    "q": "Where is BNP primarily released from?",
    "a": "Ventricular myocytes (in response to wall stretch)."
  },
  {
    "q": "What is the clinical use of BNP/NT-proBNP?",
    "a": "Diagnosis and prognosis of heart failure."
  },
  {
    "q": "What hormone is released in response to hypoglycemia from pancreatic alpha cells?",
    "a": "Glucagon."
  },
  {
    "q": "What is incretin effect?",
    "a": "Greater insulin release after oral glucose than IV glucose due to GLP-1 and GIP."
  },
  {
    "q": "Name two DPP-4 inhibitors.",
    "a": "Sitagliptin, saxagliptin."
  },
  {
    "q": "What is the mechanism of SGLT2 inhibitors?",
    "a": "Block glucose reabsorption in proximal tubule → glucosuria, natriuresis, weight loss."
  },
  {
    "q": "What is the honeymoon phase in Type 1 DM?",
    "a": "Temporary partial remission after starting insulin due to residual beta cell function."
  },
  {
    "q": "What are the microvascular complications of diabetes?",
    "a": "Retinopathy, nephropathy, neuropathy."
  },
  {
    "q": "What is the most common cause of death in Type 1 DM patients?",
    "a": "Cardiovascular disease (macrovascular complication)."
  },
  {
    "q": "What is the target HbA1c for most diabetic patients?",
    "a": "&lt;7.0% (individualized; stricter in younger patients, less strict in elderly)."
  }
];

module.exports = { endocrineCards };
