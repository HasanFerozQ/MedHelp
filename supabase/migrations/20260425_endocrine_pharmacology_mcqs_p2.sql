-- Migration: Year 2 - Endocrine Pharmacology MCQ Bank (PART 2: 71-140)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (Adrenal Steroids)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrine-pharmacology' LIMIT 1;

    -- Targeted Delete for THIS PART ONLY
    DELETE FROM mcqs 
    WHERE topic_id = v_topic_id 
    AND question IN (
        'What is the mechanism of action of glucocorticoids (e.g., Prednisone)?',
        'Which glucocorticoid has the highest anti-inflammatory potency and zero mineralocorticoid activity?',
        'Which glucocorticoid is preferred for replacement therapy in Addison disease due to its balanced activity?',
        'The primary metabolic effect of glucocorticoids is:',
        'What is the mechanism by which glucocorticoids reduce inflammation?',
        'Chronic use of glucocorticoids can lead to which bone complication?',
        'Which steroid is a potent mineralocorticoid used for replacement in adrenal insufficiency?',
        'The use of glucocorticoids in late pregnancy is indicated to:',
        'Which drug is a competitive antagonist of the mineralocorticoid (aldosterone) receptor?',
        'What is a common side effect of Spironolactone in men?',
        'Eplerenone is preferred over Spironolactone because it:',
        'Mifepristone (RU-486) is an antagonist at which receptors?',
        'Which drug inhibits 11-beta-hydroxylase and is used to test adrenal function?',
        'Ketoconazole, in high doses, inhibits which enzymes?',
        'Abiraterone is used for prostate cancer; its mechanism is:',
        'Which steroid synthesis inhibitor is used specifically for adrenal cortical carcinoma?',
        'Glucocorticoids should be tapered slowly to prevent:',
        'What is the effect of glucocorticoids on the WBC count?',
        'Which condition is a contraindication for high-dose systemic corticosteroids?',
        'Dexamethasone suppression test is used to diagnose:',
        'A patient with Cushing Syndrome due to an ectopic ACTH tumor will show:',
        'Which drug is a mineralocorticoid antagonist that does NOT cause hyperkalemia?',
        'The mechanism of Pasireotide in Cushing disease is:',
        'Corticosteroids are used in the treatment of which hematologic condition?',
        'What is the effect of glucocorticoids on the skin?',
        'Which glucocorticoid is available as an inhaled form for asthma?',
        'The most common cause of secondary adrenal insufficiency is:',
        'Which steroid is the most potent inhibitor of ACTH secretion?',
        'Glucocorticoids increase the risk of which gastrointestinal issue?',
        'The "moon face" and "buffalo hump" seen in Cushingoid patients are due to:',
        'Which electrolyte abnormality is caused by high-dose Hydrocortisone?',
        'Aminoglutethimide inhibits which step of steroid synthesis?',
        'Which drug is used for hyperaldosteronism (Conn Syndrome)?',
        'Glucocorticoids cause muscle wasting primarily through:',
        'The immunosuppressive effect of steroids is mainly due to the inhibition of:'
    );

    -- SECTION 3: ADRENAL STEROIDS (71-140)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'What is the mechanism of action of glucocorticoids (e.g., Prednisone)?', '["Binding to cell surface receptors", "Binding to intracellular receptors and altering gene transcription", "Direct inhibition of COX-2", "Binding to the ribosome"]', 1, 'Steroids are lipophilic; they cross the membrane and bind to cytosolic receptors that then enter the nucleus.'),
    (v_topic_id, 'Which glucocorticoid has the highest anti-inflammatory potency and zero mineralocorticoid activity?', '["Hydrocortisone", "Prednisone", "Dexamethasone", "Fludrocortisone"]', 2, 'Dexamethasone is 25-30x more potent than cortisol and has no salt-retaining effect.'),
    (v_topic_id, 'Which glucocorticoid is preferred for replacement therapy in Addison disease due to its balanced activity?', '["Dexamethasone", "Hydrocortisone", "Triamcinolone", "Betamethasone"]', 1, 'Hydrocortisone (cortisol) provides both glucocorticoid and mineralocorticoid effects.'),
    (v_topic_id, 'The primary metabolic effect of glucocorticoids is:', '["Increased glucose uptake in muscles", "Stimulation of gluconeogenesis and increased blood glucose", "Increased protein synthesis", "Inhibition of lipolysis"]', 1, 'Steroids are "diabetogenic" as they increase glucose production to handle stress.'),
    (v_topic_id, 'What is the mechanism by which glucocorticoids reduce inflammation?', '["Inhibition of Phospholipase A2 via Lipocortin-1", "Direct inhibition of Histamine release", "Activation of Leukotrienes", "Increased capillary permeability"]', 0, 'Inhibiting Phospholipase A2 prevents the production of both prostaglandins and leukotrienes.'),
    (v_topic_id, 'Chronic use of glucocorticoids can lead to which bone complication?', '["Osteopetrosis", "Osteoporosis", "Osteomalacia", "Rickets"]', 1, 'Steroids decrease calcium absorption and inhibit osteoblast activity.'),
    (v_topic_id, 'Which steroid is a potent mineralocorticoid used for replacement in adrenal insufficiency?', '["Hydrocortisone", "Fludrocortisone", "Prednisolone", "Methylprednisolone"]', 1, 'Fludrocortisone is the standard drug for mineralocorticoid replacement.'),
    (v_topic_id, 'The use of glucocorticoids in late pregnancy is indicated to:', '["Prevent gestational diabetes", "Stimulate fetal lung maturation (surfactant production)", "Induce labor", "Prevent preeclampsia"]', 1, 'Betamethasone or Dexamethasone are given to mothers at risk of preterm delivery.'),
    (v_topic_id, 'Which drug is a competitive antagonist of the mineralocorticoid (aldosterone) receptor?', '["Amiloride", "Spironolactone", "Furosemide", "Acetazolamide"]', 1, 'Spironolactone blocks aldosterone in the distal tubule and collecting duct.'),
    (v_topic_id, 'What is a common side effect of Spironolactone in men?', '["Priapism", "Gynecomastia", "Hirsutism", "Prostate enlargement"]', 1, 'Spironolactone also blocks androgen receptors, leading to breast enlargement.'),
    (v_topic_id, 'Eplerenone is preferred over Spironolactone because it:', '["Is more potent", "Is more selective for the aldosterone receptor and lacks anti-androgen effects", "Does not cause hyperkalemia", "Can be given IV"]', 1, 'Eplerenone has much lower affinity for androgen and progesterone receptors.'),
    (v_topic_id, 'Mifepristone (RU-486) is an antagonist at which receptors?', '["Progesterone and Glucocorticoid receptors", "Estrogen receptors", "Androgen receptors", "Insulin receptors"]', 0, 'It is used for medical abortion and in some cases of Cushing syndrome.'),
    (v_topic_id, 'Which drug inhibits 11-beta-hydroxylase and is used to test adrenal function?', '["Ketoconazole", "Metyrapone", "Aminoglutethimide", "Mitotane"]', 1, 'Metyrapone blocks the final step of cortisol synthesis; used to test the ACTH-adrenal axis.'),
    (v_topic_id, 'Ketoconazole, in high doses, inhibits which enzymes?', '["COX-1", "Multiple CYP450 enzymes involved in steroidogenesis", "MAO-B", "Na/K ATPase"]', 1, 'Ketoconazole is a non-selective inhibitor used for Cushing syndrome.'),
    (v_topic_id, 'Abiraterone is used for prostate cancer; its mechanism is:', '["GnRH agonist", "17-alpha-hydroxylase inhibitor", "Androgen receptor blocker", "5-alpha-reductase inhibitor"]', 1, 'It blocks the synthesis of androgens in both the testes and the adrenal glands.'),
    (v_topic_id, 'Which steroid synthesis inhibitor is used specifically for adrenal cortical carcinoma?', '["Ketoconazole", "Mitotane", "Metyrapone", "Mifepristone"]', 1, 'Mitotane is adrenolytic (it destroys the adrenal cortex).'),
    (v_topic_id, 'Glucocorticoids should be tapered slowly to prevent:', '["Hypertension", "Acute Adrenal Insufficiency (Adrenal Crisis)", "Hypoglycemia", "Hyperkalemia"]', 1, 'Exogenous steroids suppress the HPA axis; sudden withdrawal leaves the body with no cortisol.'),
    (v_topic_id, 'What is the effect of glucocorticoids on the WBC count?', '["Leukopenia", "Neutrophilia (via demargination) and Lymphopenia", "Eosinophilia", "Pancytopenia"]', 1, 'Steroids cause neutrophils to leave the vessel walls (demarginate) and increase in the blood.'),
    (v_topic_id, 'Which condition is a contraindication for high-dose systemic corticosteroids?', '["Asthma", "Systemic Fungal Infections", "Rheumatoid Arthritis", "Ulcerative Colitis"]', 1, 'Steroids suppress immunity and can allow fungal infections to disseminate.'),
    (v_topic_id, 'Dexamethasone suppression test is used to diagnose:', '["Addison Disease", "Cushing Syndrome", "Conn Syndrome", "Diabetes Mellitus"]', 1, 'It determines if cortisol production can be suppressed by feedback.'),
    (v_topic_id, 'A patient with Cushing Syndrome due to an ectopic ACTH tumor will show:', '["Suppression with low-dose dexamethasone", "Suppression with high-dose dexamethasone", "No suppression with high-dose dexamethasone", "Low baseline ACTH"]', 2, 'Ectopic tumors (e.g., lung cancer) are typically not responsive to feedback inhibition.'),
    (v_topic_id, 'Which drug is a mineralocorticoid antagonist that is used in heart failure to reduce mortality?', '["Hydrochlorothiazide", "Spironolactone", "Amiloride", "Triamterene"]', 1, 'Aldosterone antagonists prevent cardiac remodeling in heart failure.'),
    (v_topic_id, 'The mechanism of Pasireotide in Cushing disease is:', '["Direct inhibition of adrenal glands", "Inhibition of pituitary ACTH release via somatostatin receptors", "Glucocorticoid receptor block", "11-beta-hydroxylase inhibition"]', 1, 'It is specifically approved for pituitary-dependent Cushing Disease.'),
    (v_topic_id, 'Corticosteroids are used in the treatment of which hematologic condition?', '["Iron deficiency anemia", "Immune Thrombocytopenic Purpura (ITP)", "Polycythemia vera", "Sickle cell anemia"]', 1, 'They reduce the immune destruction of platelets.'),
    (v_topic_id, 'What is the effect of glucocorticoids on the skin?', '["Thickening and hyperpigmentation", "Atrophy and thinning", "Acne suppression", "Increased collagen synthesis"]', 1, 'Steroids inhibit fibroblasts, leading to thin skin and striae (purple stretch marks).'),
    (v_topic_id, 'Which glucocorticoid is available as an inhaled form for asthma?', '["Prednisone", "Fluticasone", "Methylprednisolone", "Betamethasone"]', 1, 'Inhaled steroids (Fluticasone, Budesonide) limit systemic side effects.'),
    (v_topic_id, 'The most common cause of secondary adrenal insufficiency is:', '["Pituitary tumor", "Chronic exogenous corticosteroid use", "Autoimmune destruction", "Tuberculosis"]', 1, 'Prolonged suppression of the pituitary by medication is very common.'),
    (v_topic_id, 'Which steroid is the most potent inhibitor of ACTH secretion?', '["Cortisol", "Dexamethasone", "Aldosterone", "Progesterone"]', 1, 'Dexamethasone provides the strongest negative feedback.'),
    (v_topic_id, 'Glucocorticoids increase the risk of which gastrointestinal issue?', '["Constipation", "Peptic Ulcer Disease", "Colon cancer", "Malabsorption"]', 1, 'Especially when combined with NSAIDs.'),
    (v_topic_id, 'The "moon face" and "buffalo hump" seen in Cushingoid patients are due to:', '["Water retention", "Fat redistribution", "Muscle hypertrophy", "Bone growth"]', 1, 'Steroids cause fat to move from the limbs to the trunk and face.'),
    (v_topic_id, 'Which electrolyte abnormality is caused by high-dose Hydrocortisone?', '["Hyponatremia", "Hypokalemia", "Hypercalcemia", "Acidosis"]', 1, 'High doses of hydrocortisone cross-react with mineralocorticoid receptors, causing K+ excretion.'),
    (v_topic_id, 'Aminoglutethimide inhibits which step of steroid synthesis?', '["Conversion of Cholesterol to Pregnenolone", "11-beta-hydroxylation", "21-hydroxylation", "Aromatization"]', 0, 'It blocks the very first "side-chain cleavage" step.'),
    (v_topic_id, 'Which drug is used for hyperaldosteronism (Conn Syndrome)?', '["Spironolactone", "Dexamethasone", "Furosemide", "Hydrocortisone"]', 0, 'Spironolactone blocks the excess aldosterone action.'),
    (v_topic_id, 'Glucocorticoids cause muscle wasting primarily through:', '["Increased protein synthesis", "Inhibition of protein synthesis and increased catabolism", "Inhibition of glucose uptake", "Nerve damage"]', 1, 'Steroids break down muscle protein to provide amino acids for gluconeogenesis.'),
    (v_topic_id, 'The immunosuppressive effect of steroids is mainly due to the inhibition of:', '["NF-kappaB and pro-inflammatory cytokines", "Platelet aggregation", "Vitamin K", "Thyroid hormone"]', 0, 'Steroids inhibit the transcription of IL-2 and other critical immune signals.'),
    (v_topic_id, 'Which corticosteroid is commonly used as a topical cream for eczema?', '["Hydrocortisone", "Triamcinolone", "Clobetasol", "All of the above"]', 3, 'Topical steroids range from mild (Hydrocortisone) to ultra-potent (Clobetasol).'),
    (v_topic_id, 'What is the "Short Synacthen Test" (Cosyntropin test) used for?', '["To diagnose Hyperthyroidism", "To differentiate Primary from Secondary adrenal insufficiency", "To check for diabetes", "To monitor Spironolactone therapy"]', 1, 'If the adrenals respond to synthetic ACTH, the problem is likely in the pituitary.'),
    (v_topic_id, 'Metyrapone suppression of cortisol leads to a compensatory increase in which compound?', '["Aldosterone", "11-deoxycortisol", "DHEA", "Estradiol"]', 1, 'Blocking 11-hydroxylase causes a buildup of 11-deoxycortisol (the precursor).'),
    (v_topic_id, 'A side effect of inhaled corticosteroids (ICS) that can be prevented by rinsing the mouth is:', '["Cough", "Oral Candidiasis (Thrush)", "Hoarseness", "Hypertension"]', 1, 'Local immunosuppression in the mouth allows yeast to grow.'),
    (v_topic_id, 'Glucocorticoids can cause which psychiatric side effect?', '["Psychosis or Euphoria (Steroid Psychosis)", "Dementia", "Hypersomnia", "Apathy"]', 0, 'High-dose steroids can cause significant mood and behavior changes.'),
    (v_topic_id, 'Which drug is a Mineralocorticoid antagonist used to treat Hirsutism in women?', '["Spironolactone", "Dexamethasone", "Eplerenone", "Prednisone"]', 0, 'Spironolactone''s anti-androgen effect is beneficial for reducing unwanted hair growth.'),
    (v_topic_id, 'What is the effect of glucocorticoids on the eyes?', '["Glaucoma and Cataracts", "Myopia", "Retinal detachment", "Dry eyes"]', 0, 'Steroids can increase intraocular pressure and cause posterior subcapsular cataracts.'),
    (v_topic_id, 'Which corticosteroid has the longest half-life?', '["Prednisone", "Methylprednisolone", "Dexamethasone", "Cortisone"]', 2, 'Dexamethasone is a long-acting steroid (36-72 hours).'),
    (v_topic_id, 'Fludrocortisone is used to treat which condition in the elderly?', '["Hypertension", "Orthostatic Hypotension", "Heart failure", "Insomnia"]', 1, 'It increases salt and water retention to support blood pressure.'),
    (v_topic_id, 'In the treatment of septic shock, why are low-dose steroids used?', '["To kill bacteria", "To treat relative adrenal insufficiency", "To cause vasoconstriction", "To prevent fever"]', 1, 'Severe illness can exhaust the body''s natural cortisol production.'),
    (v_topic_id, 'Which enzyme converts Cortisone (inactive) to Cortisol (active)?', '["11-beta-HSD type 1", "11-beta-HSD type 2", "21-hydroxylase", "Aromatase"]', 0, 'Type 1 (in the liver) activates steroids; Type 2 (in the kidney) inactivates them.'),
    (v_topic_id, 'Why does Glycyrrhizic acid (in licorice) cause hypertension?', '["It acts as a glucocorticoid", "It inhibits 11-beta-HSD type 2, allowing cortisol to act like aldosterone", "It blocks the heart", "It increases sodium"]', 1, 'Cortisol "overflows" onto the mineralocorticoid receptor because it is not being inactivated.'),
    (v_topic_id, 'Which drug is used to treat "Addisonian Crisis"?', '["Oral Prednisone", "IV Hydrocortisone", "Fludrocortisone only", "Dexamethasone only"]', 1, 'Rapid replacement with IV hydrocortisone and saline is life-saving.'),
    (v_topic_id, 'Corticosteroids are used in cerebral edema (e.g., brain tumor) because they:', '["Kill tumor cells", "Decrease capillary permeability and vasogenic edema", "Reduce intracranial pressure directly", "Act as analgesics"]', 1, 'Dexamethasone is the standard for brain edema.'),
    (v_topic_id, 'A patient on chronic steroids presents with hip pain. What is the most likely diagnosis?', '["Osteoarthritis", "Avascular Necrosis of the femoral head", "Bone cancer", "Sciatica"]', 1, 'Avascular necrosis is a classic complication of steroid use.'),
    (v_topic_id, 'Which corticosteroid is specifically used to mature the lungs of a fetus?', '["Prednisone", "Hydrocortisone", "Betamethasone", "Cortisone"]', 2, 'Betamethasone crosses the placenta efficiently.'),
    (v_topic_id, 'Glucocorticoids should be used with caution in patients with:', '["Diabetes Mellitus", "Hypertension", "Peptic Ulcer", "All of the above"]', 3, 'Steroids worsen all these conditions.'),
    (v_topic_id, 'Which drug is a steroid synthesis inhibitor used for medical management of Cushing syndrome?', '["Ketoconazole", "Loperamide", "Metformin", "Aspirin"]', 0, 'Ketoconazole is often the first-line medical therapy.'),
    (v_topic_id, 'The anti-androgen effect of Spironolactone is useful in:', '["Prostate cancer", "PCOS (Polycystic Ovary Syndrome)", "Osteoporosis", "Addison disease"]', 1, 'It helps treat acne and hirsutism in PCOS.'),
    (v_topic_id, 'Which drug is a selective mineralocorticoid receptor antagonist (MRA) with no effect on sex hormone receptors?', '["Spironolactone", "Eplerenone", "Dexamethasone", "Triamcinolone"]', 1, 'Eplerenone has much better tolerability.'),
    (v_topic_id, 'A side effect of steroids in children is:', '["Premature puberty", "Growth suppression", "Weight loss", "Hyperactivity"]', 1, 'Steroids can inhibit the epiphyseal plates of bones.'),
    (v_topic_id, 'Glucocorticoids decrease the production of which arachidonic acid metabolite?', '["Prostaglandins", "Leukotrienes", "Thromboxane", "All of the above"]', 3, 'By inhibiting Phospholipase A2, they block the whole cascade.'),
    (v_topic_id, 'Which drug is used for diagnostic testing of the entire HPA axis?', '["Cosyntropin", "Metyrapone", "Dexamethasone", "Mifepristone"]', 1, 'Metyrapone tests the pituitary response to low cortisol.'),
    (v_topic_id, 'Which steroid is a prodrug that must be activated by the liver?', '["Prednisolone", "Prednisone", "Dexamethasone", "Methylprednisolone"]', 1, 'Prednisone is converted to Prednisolone by 11-beta-HSD1.'),
    (v_topic_id, 'Patients with liver failure should be given which steroid directly?', '["Prednisone", "Prednisolone", "Cortisone", "Fludrocortisone"]', 1, 'Since they cannot activate prednisone effectively, the active form is used.'),
    (v_topic_id, 'Which condition involves the destruction of the adrenal cortex?', '["Cushing syndrome", "Addison disease", "Conn syndrome", "Pheochromocytoma"]', 1, 'Primary adrenal insufficiency.'),
    (v_topic_id, 'The primary cause of the hyperpigmentation in Addison disease is:', '["Excess cortisol", "Excess ACTH (which has MSH-like activity)", "Low aldosterone", "Liver failure"]', 1, 'High ACTH stimulates melanocytes.'),
    (v_topic_id, 'Which steroid is the most potent glucocorticoid?', '["Hydrocortisone", "Prednisone", "Dexamethasone", "Cortisone"]', 2, 'Dexamethasone is the most potent on this list.'),
    (v_topic_id, 'What is the standard treatment for congenital adrenal hyperplasia (CAH)?', '["Surgery", "Glucocorticoid replacement to suppress ACTH", "Thyroxine", "Insulin"]', 1, 'Replacing the missing cortisol stops the excessive ACTH drive.'),
    (v_topic_id, 'Which steroid inhibitor is also used as an antifungal?', '["Metyrapone", "Ketoconazole", "Mitotane", "Aminoglutethimide"]', 1, 'Ketoconazole is a dual-use drug.'),
    (v_topic_id, 'Side effect of topical steroids on the face can include:', '["Thicker skin", "Perioral dermatitis and acne", "Facial hair loss", "Pigment gain"]', 1, 'Long-term use causes skin thinning and acne-like rashes.'),
    (v_topic_id, 'Steroids are used in organ transplantation because they:', '["Kill the donor organ", "Inhibit T-cell activation and cytokine production", "Stimulate the immune system", "Prevent infection"]', 1, 'They are a cornerstone of immunosuppressive therapy.'),
    (v_topic_id, 'What is the effect of glucocorticoids on appetite?', '["Suppression", "Stimulation (Increased appetite)", "No effect", "Loss of taste"]', 1, 'Increased appetite and weight gain are universal side effects.'),
    (v_topic_id, 'Which drug is a pure glucocorticoid antagonist approved for hyperglycemia in Cushing syndrome?', '["Spironolactone", "Mifepristone", "Ketoconazole", "Etomidate"]', 1, 'Mifepristone blocks the receptor directly.'),
    (v_topic_id, 'Which steroid synthesis step is blocked by Ketoconazole?', '["17,20-lyase and 11-beta-hydroxylase", "Aromatase", "5-alpha-reductase", "Lipoxygenase"]', 0, 'It is a broad-spectrum CYP450 inhibitor.');

    RAISE NOTICE 'SUCCESS: Endocrine Pharmacology MCQ Part 2 (71-140) registered.';
END $$;

COMMIT;
