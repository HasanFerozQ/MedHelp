BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-neonatology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-neonatology not found.';
    END IF;

    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    -- Batch 7: 361-370 (Dermatology, Ethics, and Final Pearls)
    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('361: "Transient Neonatal Pustular Melanosis" (TNPM) is most common in which population?', '["Caucasians", "African Americans", "Asians", "Hispanics"]', 1, 'Presents at birth with pustules that rupture, leaving pigmented macules. (Beckmann)'),
    ('362: "Miliaria Crystallina" (heat rash) is due to:', '["Infection", "Obstruction of eccrine sweat ducts", "Allergy", "Dry skin"]', 1, 'Clear, superficial blisters; benign. (Williams)'),
    ('363: "Neonatal Acne" (Benign Cephalic Pustulosis) usually appears when?', '["At birth", "At 2-3 weeks of life", "At 6 months", "At 1 year"]', 1, 'Thought to be related to maternal androgens. (Beckmann)'),
    ('364: "Seborrheic Dermatitis" (Cradle Cap) treatment?', '["Surgery", "Gentle washing and topical mineral oil or mild steroids if severe", "Antibiotics", "None"]', 1, 'Waxy, yellow scales on the scalp. (Williams)'),
    ('365: "Sacral Dimple" is considered high-risk if it is:', '["< 5 mm", "> 5 mm deep, located > 2.5 cm from the anus, or associated with hair/skin changes", "Tiny", "Normal"]', 1, 'Warrants spinal ultrasound to rule out tethered cord. (ACOG)'),
    ('366: What is the most common cause of neonatal mortality in the developed world?', '["Sepsis", "Congenital anomalies", "Prematurity complications", "SIDS"]', 1, 'Congenital defects are the leading cause in high-income countries. (WHO)'),
    ('367: Ethical principle: When a newborn has a lethal condition (e.g., Anencephaly), the primary goal of care is:', '["Aggressive resuscitation", "Comfort care (Palliative care)", "Clinical trials", "Surgery"]', 1, 'Focus is on dignity and family bonding. (ACOG)'),
    ('368: If parents refuse a life-saving blood transfusion for a neonate based on religious beliefs, the physician should:', '["Respect the parents'' wishes", "Obtain a court order or proceed under emergency doctrine to provide the life-saving treatment", "Discharge the baby", "None"]', 1, 'In emergencies, the child''s right to life takes precedence over parental refusal. (AAP)'),
    ('369: "Griscelli Syndrome" involves:', '["Albinism and immunodeficiency", "Heart failure", "Blindness", "None"]', 0, 'Rare genetic disorder. (Williams)'),
    ('370: Final Pearl: The most important indicator of successful newborn transition is:', '["Pink skin", "A rising heart rate and regular respirations", "Loud crying", "APGAR 10"]', 1, 'Heart rate is the most sensitive indicator of resuscitation success. (NRP)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;
END $$;
COMMIT;
