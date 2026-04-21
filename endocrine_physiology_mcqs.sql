-- ==========================================
-- Endocrine Physiology MCQs Migration
-- 100 Questions | Semester 2 First Year
-- ==========================================

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    -- 1. Get Topic ID
    SELECT id INTO v_topic_id FROM public.topics 
    WHERE title = 'Endocrine Physiology' AND (semester_id = 2 OR usmle_step = 1) 
    LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "Endocrine Physiology" not found.';
    END IF;

    -- 2. Clear existing standalone MCQs for this topic
    DELETE FROM public.mcqs WHERE topic_id = v_topic_id;

    -- 3. Insert 100 MCQs
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation, "order")
    VALUES 
    (v_topic_id, 'TSH is secreted by the:', '["Hypothalamus", "Posterior pituitary", "Anterior pituitary", "Thyroid follicular cells", "Adrenal cortex"]', 2, 'Thyroid-stimulating hormone is produced by thyrotrophs in the anterior pituitary.', 1),
    (v_topic_id, 'TRH is secreted by the:', '["Thyroid gland", "Hypothalamus", "Anterior pituitary", "Posterior pituitary", "Parathyroid gland"]', 1, 'Thyrotropin-releasing hormone is a hypothalamic hormone.', 2),
    (v_topic_id, 'In primary hypothyroidism, the expected lab pattern is:', '["Low TSH, low T4", "High TSH, low T4", "High TSH, high T4", "Low TSH, high T4", "Normal TSH, low T3 only"]', 1, 'Loss of negative feedback from the thyroid leads to compensatory high TSH.', 3),
    (v_topic_id, 'The major hormone secreted by the thyroid gland is:', '["T3", "T4", "TSH", "TRH", "Reverse T3"]', 1, 'T4 (Thyroxine) is the primary secretary product.', 4),
    (v_topic_id, 'The more biologically active thyroid hormone is:', '["T4", "T3", "Reverse T3", "Thyroglobulin", "Calcitonin"]', 1, 'T3 is about 4x more potent than T4 at the receptor level.', 5),
    (v_topic_id, 'Most circulating thyroid hormone is:', '["Free in plasma", "Protein-bound", "Stored in erythrocytes", "Bound to albumin only transiently and inactive", "Excreted directly in urine"]', 1, 'Over 99.9% of T4 is bound to carrier proteins (TBG, etc.).', 6),
    (v_topic_id, 'Thyroid hormones are synthesized from:', '["Cholesterol and tryptophan", "Tyrosine residues in thyroglobulin plus iodine", "Phenylalanine and glucuronic acid", "Histidine and phosphate", "Tyrosine and cortisol"]', 1, 'Thyroid hormones are amine hormones derived from tyrosine.', 7),
    (v_topic_id, 'Organification in thyroid hormone synthesis refers to:', '["Release of T3 into the blood", "Iodination of tyrosine residues on thyroglobulin", "Peripheral conversion of T4 to T3", "Endocytosis of colloid", "Proteolysis of thyroglobulin"]', 1, 'Covalent bonding of iodine to the tyrosine scaffolds.', 8),
    (v_topic_id, 'Peripheral conversion of T4 to T3 occurs mainly by:', '["Thyroid peroxidase", "Deiodinase enzymes", "Thyroglobulin protease", "Na+/I− cotransporter", "TSH receptor activation"]', 1, 'Type 1 and Type 2 5''-deiodinases handle this conversion.', 9),
    (v_topic_id, 'Thyroid hormone increases basal metabolic rate primarily by increasing:', '["Na+/K+ ATPase activity", "H+/K+ ATPase activity", "ENaC activity", "Na+/glucose cotransport", "Carbonic anhydrase activity"]', 0, 'Higher ATP consumption lead to increased heat production and BMR.', 10),
    (v_topic_id, 'Thyroid hormone excess is typically associated with:', '["Bradycardia", "Heat intolerance", "Weight gain despite low appetite", "Constipation", "Decreased beta-adrenergic responsiveness"]', 1, 'Hyperthyroidism makes patients feel warm and sweaty.', 11),
    (v_topic_id, 'Calcitonin is secreted by:', '["Thyroid follicular cells", "Thyroid parafollicular C cells", "Parathyroid chief cells", "Adrenal medulla", "Anterior pituitary"]', 1, 'C cells are located in the thyroid but are distinct from follicles.', 12),
    (v_topic_id, 'The most important hormone in day-to-day calcium regulation is:', '["Calcitonin", "Parathyroid hormone", "Aldosterone", "Cortisol", "Prolactin"]', 1, 'PTH is the principal regulator of calcium homeostasis.', 13),
    (v_topic_id, 'Parathyroid hormone is secreted in response to:', '["Hypercalcemia", "Hypocalcemia", "Hyperphosphatemia only", "Hyperglycemia", "Hypernatremia"]', 1, 'Calcium-sensing receptors (CaSR) trigger release when levels are low.', 14),
    (v_topic_id, 'PTH increases serum calcium partly by increasing renal calcium reabsorption in the:', '["Proximal tubule", "Thick ascending limb", "Distal convoluted tubule", "Collecting duct", "Bowman space"]', 2, 'PTH regulates the final common path of calcium salvage.', 15),
    (v_topic_id, 'PTH decreases serum phosphate mainly by:', '["Increasing intestinal phosphate secretion", "Decreasing renal phosphate reabsorption", "Decreasing bone resorption", "Increasing calcitonin release", "Increasing distal tubular phosphate reabsorption"]', 1, 'Phosphaturic effect prevents calcium phosphate precipitation.', 16),
    (v_topic_id, 'PTH stimulates renal production of:', '["25-hydroxyvitamin D", "1,25-dihydroxyvitamin D", "Calcitonin", "Cortisol", "Thyroxine"]', 1, 'Activates 1-alpha-hydroxylase to produce calcitriol.', 17),
    (v_topic_id, 'Insulin is secreted by pancreatic:', '["Alpha cells", "Beta cells", "Delta cells", "PP cells", "Acinar cells"]', 1, 'Beta cells are the most abundant in the islets.', 18),
    (v_topic_id, 'Glucagon is secreted by pancreatic:', '["Alpha cells", "Beta cells", "Delta cells", "PP cells", "Ductal cells"]', 0, 'Alpha cells are located at the periphery of the islets.', 19),
    (v_topic_id, 'Somatostatin in the pancreatic islets is secreted by:', '["Alpha cells", "Beta cells", "Delta cells", "Acinar cells", "Chief cells"]', 2, 'Delta cells provide paracrine inhibition.', 20),
    (v_topic_id, 'Glucose enters pancreatic beta cells mainly through:', '["GLUT1", "GLUT2", "GLUT4", "SGLT1", "ENaC"]', 1, 'High-Km transporter allows sensing of high glucose peaks.', 21),
    (v_topic_id, 'In pancreatic beta cells, increased ATP causes:', '["Opening of ATP-sensitive K+ channels", "Closure of ATP-sensitive K+ channels", "Inhibition of calcium entry", "Hyperpolarization of the membrane", "Immediate glucagon release"]', 1, 'The reduction in K+ permeability triggers the release process.', 22),
    (v_topic_id, 'Closure of ATP-sensitive K+ channels in beta cells leads to:', '["Hyperpolarization", "Depolarization and calcium influx", "Potassium efflux and insulin inhibition", "Sodium loss and glucagon secretion", "Decreased exocytosis of insulin granules"]', 1, 'Depolarization opens Voltage-Gated Calcium Channels.', 23),
    (v_topic_id, 'Insulin promotes:', '["Glycogen breakdown", "Lipolysis", "Glycogen synthesis", "Gluconeogenesis", "Ketogenesis"]', 2, 'Favors energy storage (anabolism).', 24),
    (v_topic_id, 'Glucagon acts primarily on the liver to increase:', '["Glycogenesis", "Glycogenolysis and gluconeogenesis", "Skeletal muscle glucose uptake", "Protein synthesis", "Calcium deposition"]', 1, 'Defends against hypoglycemia by releasing glucose.', 25),
    (v_topic_id, 'During fasting, blood glucose is initially maintained mainly by hepatic:', '["Glycogenesis", "Glycogenolysis", "Lipogenesis", "Proteolysis only", "Ketone excretion"]', 1, 'The fastest way to raise glucose is harvesting starch.', 26),
    (v_topic_id, 'With more prolonged fasting, glucose production depends increasingly on:', '["Glycogenesis", "Gluconeogenesis", "Intestinal absorption", "Insulin secretion", "Thyroid hormone release"]', 1, 'Making new sugar from proteins and fats.', 27),
    (v_topic_id, 'Growth hormone is secreted by the:', '["Hypothalamus", "Posterior pituitary", "Anterior pituitary", "Liver", "Thyroid gland"]', 2, 'Secreted by somatotrophs.', 28),
    (v_topic_id, 'Growth hormone secretion is stimulated by:', '["Somatostatin", "GHRH", "Dopamine", "TRH", "CRH"]', 1, 'GHRH is the principal stimulatory secretagogue.', 29),
    (v_topic_id, 'Somatostatin has which effect on growth hormone?', '["Stimulates its release", "Inhibits its release", "Converts it to IGF-1", "Prevents hepatic metabolism only", "Increases its pulsatility"]', 1, 'Also called growth hormone-inhibiting hormone.', 30),
    (v_topic_id, 'Many growth-promoting effects of GH are mediated by:', '["ACTH", "IGF-1", "Prolactin", "TSH", "Calcitonin"]', 1, 'IGF-1 (Somatomedin) does the heavy lifting for bone/tissue growth.', 31),
    (v_topic_id, 'Growth hormone has which acute metabolic effect?', '["Decreases lipolysis", "Increases glucose uptake in muscle and fat", "Increases lipolysis and decreases glucose uptake", "Causes severe hypoglycemia", "Decreases protein synthesis"]', 2, 'Anti-insulin effects to spare glucose for the brain.', 32),
    (v_topic_id, 'ACTH is secreted by the:', '["Hypothalamus", "Anterior pituitary", "Posterior pituitary", "Adrenal cortex", "Adrenal medulla"]', 1, 'Secreted by corticotrophs.', 33),
    (v_topic_id, 'ACTH release is stimulated by hypothalamic:', '["TRH", "GnRH", "CRH", "GHRH", "Dopamine"]', 2, 'CRH is the primary pilot of the HPA axis.', 34),
    (v_topic_id, 'Cortisol is produced mainly in the:', '["Zona glomerulosa", "Zona fasciculata", "Zona reticularis", "Adrenal medulla", "Posterior pituitary"]', 1, 'The central, largest layer of the cortex.', 35),
    (v_topic_id, 'Aldosterone is produced mainly in the:', '["Zona glomerulosa", "Zona fasciculata", "Zona reticularis", "Adrenal medulla", "Pineal gland"]', 0, 'The outer mineralocorticoid layer.', 36),
    (v_topic_id, 'Adrenal androgens are produced mainly in the:', '["Zona glomerulosa", "Zona fasciculata", "Zona reticularis", "Adrenal medulla", "Anterior pituitary"]', 2, 'The inner DHEA-secreting layer.', 37),
    (v_topic_id, 'Cortisol exerts negative feedback on the:', '["Thyroid and parathyroid glands only", "Hypothalamus and anterior pituitary", "Kidney only", "Pancreatic islets only", "Adrenal medulla only"]', 1, 'Classic long-loop feedback.', 38),
    (v_topic_id, 'Cortisol increases blood glucose mainly by promoting:', '["Glycogenesis only", "Gluconeogenesis and reduced peripheral glucose uptake", "Insulin secretion", "Glucose uptake in adipose tissue", "Hepatic glycogen depletion only"]', 1, 'Shares "diabetogenic" features with GH.', 39),
    (v_topic_id, 'Cortisol has a permissive effect on:', '["Catecholamine-mediated vascular responses", "Calcium excretion only", "Thyroglobulin synthesis", "Prolactin release", "Pancreatic bicarbonate secretion"]', 0, 'Required for catecholamines to be effective in stabilizing BP.', 40),
    (v_topic_id, 'Aldosterone secretion is stimulated strongly by:', '["Low potassium and low angiotensin II", "Angiotensin II and hyperkalemia", "Hypocalcemia and ACTH only", "ADH only", "High sodium intake alone"]', 1, 'RAAS system and direct potassium sensing.', 41),
    (v_topic_id, 'Aldosterone acts mainly on:', '["Proximal tubule", "Distal nephron principal cells", "Thin descending limb", "Bowman capsule", "Glomerular mesangium"]', 1, 'Targets the ENaC and Na/K ATPase in the distal nephron.', 42),
    (v_topic_id, 'Aldosterone increases:', '["Sodium excretion and potassium retention", "Sodium reabsorption and potassium secretion", "Glucose reabsorption", "Calcium reabsorption in intestine", "Thyroid hormone synthesis"]', 1, 'Ensures volume expansion while losing potassium.', 43),
    (v_topic_id, 'ADH is synthesized in the:', '["Posterior pituitary", "Hypothalamus", "Adrenal medulla", "Pineal gland", "Thyroid gland"]', 1, 'Produced primarily in the SON and PVN.', 44),
    (v_topic_id, 'ADH is released from the:', '["Anterior pituitary", "Posterior pituitary", "Zona glomerulosa", "Pancreatic islets", "Thyroid gland"]', 1, 'Released via the neurosecretory terminals.', 45),
    (v_topic_id, 'ADH secretion is stimulated strongly by:', '["Decreased plasma osmolality", "Increased plasma osmolality", "Hypercalcemia", "Increased insulin", "Low cortisol"]', 1, 'Hypothalamic osmoreceptors shrink and fire when salt is high.', 46),
    (v_topic_id, 'ADH increases water reabsorption by inserting:', '["GLUT4 transporters", "Aquaporin-2 channels", "ENaC channels", "NKCC transporters", "H+/K+ ATPase"]', 1, 'Creates a water-permeable path in the otherwise impermeable CD.', 47),
    (v_topic_id, 'Prolactin secretion is normally under dominant:', '["Stimulatory control by dopamine", "Inhibitory control by dopamine", "Stimulatory control by somatostatin", "Inhibitory control by GHRH", "No hypothalamic control"]', 1, 'Dopamine from the TIDA pathway provides tonic inhibition.', 48),
    (v_topic_id, 'Prolactin mainly promotes:', '["Milk ejection", "Milk production", "Uterine contraction", "Ovulation", "Thyroid growth"]', 1, 'Lactogenesis (milk production).', 49),
    (v_topic_id, 'Oxytocin mainly mediates:', '["Milk production only", "Milk ejection and uterine contraction", "Sodium retention", "Thyroid hormone release", "Cortisol secretion"]', 1, 'The "let-down" reflex and birth labor.', 50),
    (v_topic_id, 'Oxytocin is synthesized in the:', '["Anterior pituitary", "Posterior pituitary", "Hypothalamus", "Adrenal medulla", "Thyroid gland"]', 2, 'Like ADH, it is a hypothalamic hormone stored in the PP.', 51),
    (v_topic_id, 'FSH and LH are secreted by the:', '["Hypothalamus", "Anterior pituitary", "Posterior pituitary", "Gonads", "Adrenal cortex"]', 1, 'Secreted by gonadotrophs.', 52),
    (v_topic_id, 'FSH and LH secretion is stimulated by:', '["CRH", "TRH", "GnRH", "GHRH", "Somatostatin"]', 2, 'LHRH/GnRH is the stimulator.', 53),
    (v_topic_id, 'GnRH is most effective physiologically when secreted in a:', '["Continuous unchanging pattern", "Pulsatile pattern", "Once-monthly burst only", "Circadian cortisol-like pattern", "Feedback-independent pattern"]', 1, 'Pulses ensure the pituitary doesn''t downregulate.', 54),
    (v_topic_id, 'Continuous administration of GnRH would most likely:', '["Increase FSH and LH indefinitely", "Suppress gonadotropin release after initial stimulation", "Increase prolactin release only", "Cause only oxytocin release", "Have no pituitary effect"]', 1, 'Used therapeutically for prostate cancer (chemical castration).', 55),
    (v_topic_id, 'In women, sustained high estrogen levels in mid-cycle cause:', '["Negative feedback on LH only", "Positive feedback leading to LH surge", "Inhibition of ovulation", "Suppression of GnRH pulse frequency only", "Complete suppression of FSH and LH"]', 1, 'Triggers the switch that causes the egg to release.', 56),
    (v_topic_id, 'The LH surge directly triggers:', '["Menstruation", "Ovulation", "Lactation", "Implantation", "Placental separation"]', 1, 'Release of the oocyte.', 57),
    (v_topic_id, 'Progesterone is secreted in highest amounts during the luteal phase by the:', '["Primary follicle", "Corpus luteum", "Anterior pituitary", "Adrenal medulla", "Thyroid gland"]', 1, 'The "yellow body" formed after ovulation.', 58),
    (v_topic_id, 'Inhibin primarily acts to suppress secretion of:', '["LH", "FSH", "ACTH", "TSH", "Prolactin"]', 1, 'Negative feedback specific to follicle-stimulating hormone.', 59),
    (v_topic_id, 'In males, testosterone secretion is stimulated most directly by:', '["FSH", "LH", "Prolactin", "GnRH acting directly on testes only", "Inhibin"]', 1, 'LH acts on Leydig cells.', 60),
    (v_topic_id, 'Sertoli cells are stimulated mainly by:', '["LH", "FSH", "ACTH", "TSH", "Oxytocin"]', 1, 'FSH is for support (Sertoli) and LH is for hormone (Leydig).', 61),
    (v_topic_id, 'Testosterone exerts negative feedback primarily on:', '["Hypothalamus and anterior pituitary", "Posterior pituitary only", "Thyroid gland", "Adrenal cortex", "Kidney only"]', 0, 'Long-loop feedback reduces GnRH and LH.', 62),
    (v_topic_id, 'The anterior pituitary develops embryologically from:', '["Neuroectoderm only", "Rathke pouch", "Neural crest", "Endoderm of the foregut", "Intermediate mesoderm"]', 1, 'Evagination of the oral ectoderm.', 63),
    (v_topic_id, 'The posterior pituitary develops embryologically from:', '["Rathke pouch", "Oral ectoderm", "Neuroectoderm from the diencephalon", "Endoderm", "Neural crest only"]', 2, 'Extension of the brain down toward the mouth.', 64),
    (v_topic_id, 'Which of the following is stored and released from the posterior pituitary?', '["Prolactin", "ACTH", "Oxytocin", "GH", "TSH"]', 2, 'Only ADH and Oxytocin are neuro-hypophysis products.', 65),
    (v_topic_id, 'Which of the following is secreted by the anterior pituitary?', '["ADH", "Oxytocin", "Prolactin", "TRH", "GnRH"]', 2, 'Prolactin is one of the 6 classic tropes.', 66),
    (v_topic_id, 'Dopamine from the hypothalamus primarily inhibits:', '["TSH", "ACTH", "Prolactin", "GH", "Oxytocin"]', 2, 'Dopamine is the PIF (Prolactin Inhibiting Factor).', 67),
    (v_topic_id, 'TRH can stimulate secretion of both TSH and:', '["ACTH", "Prolactin", "GH", "FSH", "ADH"]', 1, 'In some states, TRH contributes to prolactin release.', 68),
    (v_topic_id, 'Somatostatin inhibits secretion of:', '["Prolactin and oxytocin", "GH and TSH", "ACTH and cortisol", "FSH and LH only", "Aldosterone and renin"]', 1, 'Broad-spectrum inhibitory hormone.', 69),
    (v_topic_id, 'Catecholamines are synthesized from:', '["Cholesterol", "Tyrosine", "Tryptophan", "Histidine", "Glycine"]', 1, 'Tyrosine -> L-Dopa -> Dopamine -> NE -> Epi.', 70),
    (v_topic_id, 'The adrenal medulla is functionally analogous to a:', '["Parasympathetic ganglion", "Sympathetic ganglion", "Thyroid follicle", "Parathyroid gland", "Pineal gland"]', 1, 'Releases neurotransmitters directly into the blood.', 71),
    (v_topic_id, 'Cortisol promotes epinephrine synthesis in the adrenal medulla by inducing:', '["Tyrosine hydroxylase", "Dopamine beta-hydroxylase", "Phenylethanolamine N-methyltransferase", "Monoamine oxidase", "Catechol-O-methyltransferase"]', 2, 'PNMT completion requires high local cortisol.', 72),
    (v_topic_id, 'Epinephrine generally causes:', '["Decreased heart rate and decreased glycogenolysis", "Increased heart rate and increased glycogenolysis", "Increased insulin secretion only", "Bronchoconstriction", "Reduced lipolysis"]', 1, 'Sympathetic flight preparation.', 73),
    (v_topic_id, 'Norepinephrine differs from epinephrine in having relatively greater effects on:', '["Beta-2 receptors", "Alpha-1 receptors", "Insulin receptors", "Mineralocorticoid receptors", "Nuclear receptors"]', 1, 'Pure NE has less beta-2 (bronchial) activity.', 74),
    (v_topic_id, 'Steroid hormones act mainly through:', '["Cell-surface G protein-coupled receptors only", "Intracellular receptors that alter gene transcription", "Ligand-gated ion channels", "Tyrosine kinase receptors only", "No receptor-mediated mechanism"]', 1, 'They are lipid-soluble and travel to the nucleus.', 75),
    (v_topic_id, 'Thyroid hormone acts mainly through:', '["A cell-surface cAMP receptor", "An intracellular nuclear receptor", "A receptor tyrosine kinase", "A ligand-gated calcium channel", "A membrane chloride channel"]', 1, 'Despite being an amine, T3/T4 behave like steroids in mechanism.', 76),
    (v_topic_id, 'Insulin exerts many of its effects through a receptor with intrinsic:', '["Guanylyl cyclase activity", "Tyrosine kinase activity", "Chloride channel activity", "Serotonin transporter activity", "Sodium channel activity"]', 1, 'Autophosphorylation occurs when insulin binds.', 77),
    (v_topic_id, 'ADH acting on V2 receptors uses which second messenger?', '["IP3/DAG", "cAMP", "cGMP", "Tyrosine kinase", "Nitric oxide only"]', 1, 'Gs-mediated pathway in the collecting duct.', 78),
    (v_topic_id, 'ADH acting on V1 receptors in vascular smooth muscle uses:', '["cAMP", "IP3/DAG", "cGMP", "Tyrosine kinase", "JAK/STAT"]', 1, 'Gq-mediated pathway for vasoconstriction.', 79),
    (v_topic_id, 'ACTH, FSH, LH, TSH, and hCG signal mainly through:', '["cAMP", "cGMP", "IP3/DAG exclusively", "Intracellular steroid receptors", "Receptor tyrosine kinases"]', 0, 'Most tropes use the Gs-Adenylate Cyclase path.', 80),
    (v_topic_id, 'GnRH primarily signals through:', '["cAMP", "IP3/DAG", "cGMP", "Tyrosine kinase", "Nuclear receptor activation"]', 1, 'Uses the Gq-PLC pathway.', 81),
    (v_topic_id, 'Growth hormone receptor signaling is best classified as:', '["Gs protein-coupled receptor", "Receptor tyrosine kinase", "JAK/STAT-associated receptor", "Intracellular steroid receptor", "Ligand-gated ion channel"]', 2, 'Recruits internal kinases rather than autophosphorylating.', 82),
    (v_topic_id, 'Prolactin receptor signaling is most similar to that of:', '["Insulin", "Growth hormone", "GnRH", "ACTH", "ADH V2"]', 1, 'Both belong to the cytokines receptor family.', 83),
    (v_topic_id, 'Aldosterone is synthesized from:', '["Tyrosine", "Cholesterol", "Tryptophan", "Histidine", "Glycogen"]', 1, 'Derived from the same ring as cortisol.', 84),
    (v_topic_id, 'All steroid hormones are derived from:', '["Acetylcholine", "Cholesterol", "Tyrosine", "Glycine", "Glucose"]', 1, 'Cholesterol is the mother of all steroids.', 85),
    (v_topic_id, 'Cholesterol side-chain cleavage is the first major step in steroid hormone synthesis and occurs in the:', '["Cytosol only", "Mitochondria", "Nucleus", "Golgi apparatus", "Lysosome"]', 1, 'Specifically performed by CYP11A1.', 86),
    (v_topic_id, 'A patient with primary adrenal insufficiency would be expected to have:', '["Low ACTH and low cortisol", "High ACTH and low cortisol", "High ACTH and high cortisol", "Low ACTH and high aldosterone", "High TSH and high cortisol"]', 1, 'Pituitary tries to drive the failing adrenal with high ACTH.', 87),
    (v_topic_id, 'In secondary adrenal insufficiency, aldosterone secretion is often relatively preserved because it is regulated mainly by:', '["ACTH", "CRH", "Angiotensin II and potassium", "TSH", "Prolactin"]', 2, 'Aldosterone is mostly independent of the pituitary.', 88),
    (v_topic_id, 'A major physiologic effect of aldosterone is increased secretion of:', '["Sodium into urine", "Potassium into tubular lumen", "Calcium into tubular lumen", "Glucose into urine", "Urea into Bowman space"]', 1, 'Principal cells swap Na+ (in) for K+ (out).', 89),
    (v_topic_id, 'Hyperkalemia stimulates aldosterone release directly from the:', '["Zona fasciculata", "Zona glomerulosa", "Zona reticularis", "Adrenal medulla", "Anterior pituitary"]', 1, 'The glomerulosa is extremely sensitive to K+ levels.', 90),
    (v_topic_id, 'During acute stress, the most rapidly acting hormones to raise blood glucose are:', '["Thyroid hormone and cortisol", "Glucagon and epinephrine", "Aldosterone and ADH", "PTH and calcitonin", "Prolactin and oxytocin"]', 1, 'Immediate defenses against energy failure.', 91),
    (v_topic_id, 'Cortisol and growth hormone are considered counterregulatory to insulin because they tend to:', '["Lower blood glucose", "Raise blood glucose", "Increase insulin sensitivity only", "Suppress lipolysis", "Decrease hepatic glucose production"]', 1, 'They keep glucose available for survival needs.', 92),
    (v_topic_id, 'Insulin promotes potassium movement:', '["Out of cells", "Into cells", "Into urine directly", "Into bone", "Into the intestinal lumen"]', 1, 'Insulin activates Na/K ATPase; used to treat hyperkalemia.', 93),
    (v_topic_id, 'Beta-2 adrenergic stimulation tends to shift potassium:', '["Out of cells", "Into cells", "Into urine only", "Into CSF only", "Into bile"]', 1, 'Shared effect with insulin on the Na/K pump.', 94),
    (v_topic_id, 'In the fed state, insulin secretion is increased while glucagon secretion is generally:', '["Increased", "Decreased", "Unchanged always", "Equal to insulin", "Independent of plasma glucose"]', 1, 'High sugar "turns off" alpha cells.', 95),
    (v_topic_id, 'In prolonged fasting, ketone body production increases mainly because of:', '["High insulin and low glucagon", "Low insulin and high glucagon", "High prolactin and high GH", "High TSH and high cortisol only", "High calcitonin and low PTH"]', 1, 'The body switches to alternative fuel sources.', 96),
    (v_topic_id, 'The pineal gland secretes:', '["Serotonin only", "Melatonin", "Dopamine", "Cortisol", "Calcitonin"]', 1, 'Derived from serotonin; regulates circadian rhythms.', 97),
    (v_topic_id, 'Melatonin secretion is generally highest during:', '["Bright daylight", "Darkness", "Exercise only", "Feeding only", "Stress only"]', 1, 'Inhibited by light striking the retina.', 98),
    (v_topic_id, 'Which pairing is correctly matched?', '["ADH — anterior pituitary secretion", "TSH — posterior pituitary secretion", "Prolactin — anterior pituitary secretion", "Oxytocin — anterior pituitary synthesis", "ACTH — hypothalamic secretion"]', 2, 'Prolactin is a true anterior pituitary trope.', 99),
    (v_topic_id, 'Which statement best reflects a general principle of endocrine regulation?', '["Positive feedback is the dominant mechanism in most endocrine axes", "Negative feedback is the dominant mechanism in most endocrine axes", "Hormones act independently of receptors", "Peptide hormones usually diffuse through membranes to bind nuclear receptors", "Steroid hormones are stored in large vesicles before release"]', 1, 'Homeostatic negative feedback maintains order in physiology.', 100);

    RAISE NOTICE 'Endocrine Physiology 100 MCQs populated successfully.';
END $$;
