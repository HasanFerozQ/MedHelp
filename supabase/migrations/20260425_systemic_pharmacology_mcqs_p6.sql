-- Migration: Year 2 - Systemic Pharmacology MCQ Bank (PART 6: FINAL CLEANUP)
-- Date: 2026-04-25

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-pharmacology' LIMIT 1;

    -- 1. Prevent Duplicates by removing the specific questions in this part
    DELETE FROM mcqs 
    WHERE topic_id = v_topic_id 
    AND question IN (
        'What is the mechanism of Heparin?',
        'What is the antidote for Heparin overdose?',
        'Warfarin (Coumadin) acts by:',
        'Which lab test is used to monitor Warfarin therapy?',
        'What is the most immediate treatment for life-threatening Warfarin bleeding?',
        'Rivaroxaban and Apixaban (DOACs) directly inhibit which factor?',
        'Clopidogrel and Prasugrel are antiplatelet drugs that:',
        'The mechanism of Thrombolytics like Alteplase is:',
        'Methotrexate is a cancer drug that acts by:',
        'Which cancer drug is known for Cardiotoxicity and dilated cardiomyopathy?',
        'Vincristine and Vinblastine act by:',
        'Cisplatin is associated with which major side effects?',
        'Cyclophosphamide can cause Hemorrhagic Cystitis. This is prevented by:',
        'Paclitaxel and Docetaxel act by:',
        'Which monoclonal antibody is used for HER2 positive breast cancer?',
        'Which cancer drug inhibits the BCR-ABL tyrosine kinase in CML?',
        'The mechanism of 5-Fluorouracil is:',
        'Which drug is a Rescue for Methotrexate toxicity?',
        'Tamoxifen is a SERM used primarily for which cancer?',
        'Which drug is a GnRH agonist used for prostate cancer?',
        'The primary side effect of Bleomycin is:',
        'Which immunosuppressant inhibits calcineurin?',
        'What is a major side effect of Cyclosporine?',
        'Which drug is a TNF-alpha inhibitor?',
        'The mechanism of Azathioprine is:',
        'Which drug is a monoclonal antibody against CD20?',
        'Abciximab blocks which receptor?',
        'Which drug is used for iron overload?',
        'Which drug is a direct thrombin inhibitor used in HIT?',
        'What is the mechanism of Filgrastim?',
        'Which drug is used for lead poisoning?',
        'Which drug is used for Wilson disease?',
        'Which drug is a HER2 inhibitor that can cause cardiotoxicity?',
        'What is the mechanism of Etoposide?'
    );

    -- 2. Insert the clean 31 questions
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'What is the mechanism of Heparin?', '["Directly inhibits Thrombin", "Activates Antithrombin III", "Inhibits Vitamin K epoxide reductase", "Blocks ADP receptors"]', 1, 'Heparin-ATIII complex inactivates thrombin (IIa) and Factor Xa.'),
    (v_topic_id, 'What is the antidote for Heparin overdose?', '["Vitamin K", "Protamine Sulfate", "Fresh Frozen Plasma", "Aspirin"]', 1, 'Protamine is a positively charged molecule that neutralizes negatively charged heparin.'),
    (v_topic_id, 'Warfarin (Coumadin) acts by:', '["Inhibiting Factor Xa", "Inhibiting Vitamin K epoxide reductase", "Activating Plasmin", "Blocking GpIIb/IIIa"]', 1, 'Warfarin prevents the recycling of Vitamin K, inhibiting factors II, VII, IX, and X.'),
    (v_topic_id, 'Which lab test is used to monitor Warfarin therapy?', '["aPTT", "PT/INR", "Bleeding time", "Platelet count"]', 1, 'INR is the standard for Warfarin monitoring.'),
    (v_topic_id, 'What is the most immediate treatment for life-threatening Warfarin bleeding?', '["Vitamin K", "Fresh Frozen Plasma or PCC", "Heparin", "Platelet transfusion"]', 1, 'FFP or PCC provides factors immediately.'),
    (v_topic_id, 'Rivaroxaban and Apixaban (DOACs) directly inhibit which factor?', '["IIa", "Xa", "VIIa", "IXa"]', 1, 'They are direct Factor Xa inhibitors.'),
    (v_topic_id, 'Clopidogrel and Prasugrel are antiplatelet drugs that:', '["Inhibit COX", "Block ADP P2Y12 receptors", "Block GpIIb/IIIa receptors", "Increase cAMP"]', 1, 'They prevent ADP-mediated platelet aggregation.'),
    (v_topic_id, 'The mechanism of Thrombolytics like Alteplase is:', '["Inhibiting thrombin", "Converting Plasminogen to Plasmin", "Stabilizing clots", "Activating Factor X"]', 1, 'Plasmin degrades the fibrin mesh of a clot.'),
    (v_topic_id, 'Methotrexate is a cancer drug that acts by:', '["Inhibiting DHFR", "Alkylating DNA", "Inhibiting microtubules", "Inhibiting Topoisomerase"]', 0, 'MTX is a folate antagonist.'),
    (v_topic_id, 'Which cancer drug is known for Cardiotoxicity and dilated cardiomyopathy?', '["Cyclophosphamide", "Doxorubicin", "Vincristine", "Cisplatin"]', 1, 'Doxorubicin causes free radical damage in the heart.'),
    (v_topic_id, 'Vincristine and Vinblastine act by:', '["Inhibiting microtubule polymerization", "Inhibiting microtubule depolymerization", "Alkylating DNA", "Inhibiting DHFR"]', 0, 'They stop the mitotic spindle polymerization.'),
    (v_topic_id, 'Cisplatin is associated with which major side effects?', '["Pulmonary fibrosis", "Nephrotoxicity and Ototoxicity", "Cardiotoxicity", "Hemorrhagic cystitis"]', 1, 'Cisplatin is toxic to the kidneys and ears.'),
    (v_topic_id, 'Cyclophosphamide can cause Hemorrhagic Cystitis. This is prevented by:', '["Vitamin B6", "Mesna", "Leucovorin", "Allopurinol"]', 1, 'Mesna neutralizes acrolein in the bladder.'),
    (v_topic_id, 'Paclitaxel and Docetaxel act by:', '["Inhibiting polymerization", "Inhibiting depolymerization", "Inhibiting DNA polymerase", "Blocking HER2"]', 1, 'Taxanes stabilize microtubules.'),
    (v_topic_id, 'Which monoclonal antibody is used for HER2 positive breast cancer?', '["Rituximab", "Trastuzumab", "Infliximab", "Bevacizumab"]', 1, 'Trastuzumab targets the HER2 receptor.'),
    (v_topic_id, 'Which cancer drug inhibits the BCR-ABL tyrosine kinase in CML?', '["Imatinib", "Trastuzumab", "Erlotinib", "Sorafenib"]', 0, 'Imatinib is the treatment for CML.'),
    (v_topic_id, 'The mechanism of 5-Fluorouracil is:', '["Inhibition of DHFR", "Inhibition of Thymidylate Synthase", "DNA Cross-linking", "Alkylating agent"]', 1, '5-FU inhibits thymine synthesis.'),
    (v_topic_id, 'Which drug is a Rescue for Methotrexate toxicity?', '["Mesna", "Dexrazoxane", "Leucovorin", "Allopurinol"]', 2, 'Leucovorin bypasses the blocked enzyme.'),
    (v_topic_id, 'Tamoxifen is a SERM used primarily for which cancer?', '["Prostate", "Breast", "Colon", "Lung"]', 1, 'It is an ER antagonist in the breast.'),
    (v_topic_id, 'Which drug is a GnRH agonist used for prostate cancer?', '["Leuprolide", "Finasteride", "Flutamide", "Tamoxifen"]', 0, 'Continuous GnRH downregulates testosterone.'),
    (v_topic_id, 'The primary side effect of Bleomycin is:', '["Cardiotoxicity", "Pulmonary fibrosis", "Nephrotoxicity", "Bone marrow suppression"]', 1, 'Bleomycin causes lung toxicity.'),
    (v_topic_id, 'Which immunosuppressant inhibits calcineurin?', '["Azathioprine", "Cyclosporine", "Mycophenolate", "Rituximab"]', 1, 'Cyclosporine inhibits calcineurin.'),
    (v_topic_id, 'What is a major side effect of Cyclosporine?', '["Nephrotoxicity", "Liver failure", "Ototoxicity", "Cough"]', 0, 'Nephrotoxicity is the main side effect.'),
    (v_topic_id, 'Which drug is a TNF-alpha inhibitor?', '["Infliximab", "Rituximab", "Abciximab", "Omalizumab"]', 0, 'Infliximab targets TNF-alpha.'),
    (v_topic_id, 'The mechanism of Azathioprine is:', '["Inhibiting DHFR", "Purine synthesis inhibition", "Alkylating DNA", "Blocking IL-2"]', 1, 'Azathioprine inhibits purine synthesis.'),
    (v_topic_id, 'Which drug is a monoclonal antibody against CD20?', '["Trastuzumab", "Rituximab", "Bevacizumab", "Cetuximab"]', 1, 'Rituximab targets CD20.'),
    (v_topic_id, 'Abciximab blocks which receptor?', '["ADP", "GpIIb/IIIa", "COX-1", "PDE3"]', 1, 'It blocks GpIIb/IIIa.'),
    (v_topic_id, 'Which drug is used for iron overload?', '["Deferoxamine", "Dimercaprol", "EDTA", "Penicillamine"]', 0, 'Deferoxamine is an iron chelator.'),
    (v_topic_id, 'Which drug is a direct thrombin inhibitor used in HIT?', '["Argatroban", "Heparin", "Warfarin", "Enoxaparin"]', 0, 'Argatroban is used in HIT.'),
    (v_topic_id, 'What is the mechanism of Filgrastim?', '["RBC production", "Neutrophil production", "TNF block", "Factor X block"]', 1, 'G-CSF stimulates neutrophil production.'),
    (v_topic_id, 'Which drug is used for lead poisoning?', '["EDTA", "Charcoal", "Naloxone", "Atropine"]', 0, 'EDTA is a chelator for lead.');

    RAISE NOTICE 'SUCCESS: Systemic Pharmacology MCQ Part 6 (Final Cleanup) registered.';
END $$;

COMMIT;
