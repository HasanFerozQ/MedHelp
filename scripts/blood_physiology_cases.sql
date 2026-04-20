-- Blood Physiology Clinical Cases Migration
BEGIN;

-- 1. Identify Topic ID (Assumes 'Blood Physiology' exists or creates it)
INSERT INTO public.topics (semester_id, title, slug, "order")
VALUES (1, 'Blood Physiology', 'blood-physiology', 20)
ON CONFLICT (semester_id, slug) DO NOTHING;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM public.topics WHERE slug = 'blood-physiology' LIMIT 1;

    -- Case 1: Acute Blood Loss
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Acute Blood Loss', 'A 23-year-old man is brought to the ED after a road traffic accident with acute blood loss. He is pale and tachycardic.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'The immediate major danger of acute hemorrhage is reduced:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'In the first few hours after hemorrhage, hematocrit may:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Reticulocytosis after acute blood loss is mainly driven by increased:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 2: High Altitude Adaptation
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'High Altitude Adaptation', 'A 28-year-old man travels rapidly to a high-altitude region and remains there for several weeks.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Chronic high altitude stimulates RBC production mainly through:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Erythropoietin is produced primarily by:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Increased 2,3-BPG in RBCs at altitude causes the oxygen dissociation curve to shift:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 3: Iron Deficiency and Oxygen Transport
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Iron Deficiency and Oxygen Transport', 'A 26-year-old woman with menorrhagia presents with fatigue and exertional dyspnea. Labs suggest iron deficiency anemia.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'The primary physiologic consequence of anemia is decreased:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Hemoglobin’s main physiologic role is:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'In iron deficiency, arterial oxygen saturation is often:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 4: Carbon Monoxide Exposure
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Carbon Monoxide Exposure', 'A family is brought to the hospital after exposure to smoke from a faulty heater.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Carbon monoxide decreases oxygen delivery primarily by:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Carbon monoxide causes the oxyhemoglobin dissociation curve to shift:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'A major physiologic result is impaired:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 5: Fetal Hemoglobin
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fetal Hemoglobin', 'A pregnant woman asks why fetal hemoglobin is beneficial in utero.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Compared with adult hemoglobin, fetal hemoglobin has:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'This property allows the fetus to:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Fetal hemoglobin interacts less strongly with:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 6: Neonatal Jaundice
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Neonatal Jaundice', 'A 3-day-old newborn develops mild jaundice but is otherwise healthy.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Physiologic neonatal jaundice is partly due to:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Bilirubin is produced mainly from breakdown of:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Macrophages convert heme first into biliverdin and then:', '[]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;


    -- Case 7: Hemolysis and Reticulocytosis
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemolysis and Reticulocytosis', 'A patient with hemolytic anemia has elevated reticulocyte count.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Reticulocytes are:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Increased reticulocyte count in hemolysis reflects:', '[]'::jsonb, 0, 'The correct answer is A.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Reticulocytes still contain residual:', '[]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;


    -- Case 8: Erythrocyte Shape and Splenic Sequestration
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Erythrocyte Shape and Splenic Sequestration', 'A child with hereditary spherocytosis has anemia and splenomegaly.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Normal RBC shape is best described as:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'The biconcave shape helps RBCs by:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'The spleen normally removes aged or less deformable RBCs mainly in the:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 9: G6PD Deficiency Trigger
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'G6PD Deficiency Trigger', 'A man develops hemolysis after taking an oxidative drug.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'RBCs are especially vulnerable to oxidative stress because they:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'The pentose phosphate pathway in RBCs is important for generating:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'NADPH helps maintain:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 10: Sickle Cell Physiology
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sickle Cell Physiology', 'A 16-year-old boy with sickle cell disease has pain crises and chronic hemolysis.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Sickling is promoted most by:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Repeated sickling leads to:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Vaso-occlusive pain episodes are due to:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 11: Polycythemia and Viscosity
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Polycythemia and Viscosity', 'A 58-year-old man has ruddy complexion and elevated hematocrit.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'A major physiologic consequence of markedly increased hematocrit is:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Increased blood viscosity tends to:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Secondary polycythemia can develop in response to chronic:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 12: Leukocyte Response to Bacterial Infection
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Leukocyte Response to Bacterial Infection', 'A 30-year-old man with lobar pneumonia has fever and neutrophilic leukocytosis.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'The leukocyte most important in acute bacterial infection is the:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Neutrophils primarily act by:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Leukocytosis refers to:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 13: Parasitic Infection and Allergy
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Parasitic Infection and Allergy', 'A child with helminth infection has eosinophilia.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Eosinophils are especially important in defense against:', '[]'::jsonb, 0, 'The correct answer is A.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Eosinophils also modulate:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'A bilobed nucleus is characteristic of many:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 14: Basophils and Histamine
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Basophils and Histamine', 'A patient with immediate hypersensitivity has leukocytes participating in histamine release.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'The least numerous circulating granulocyte, containing histamine and heparin, is the:', '[]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Basophils are functionally similar in some ways to:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Histamine release contributes most directly to:', '[]'::jsonb, 0, 'The correct answer is A.')
    ON CONFLICT DO NOTHING;


    -- Case 15: Monocyte to Macrophage
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Monocyte to Macrophage', 'A patient with chronic granulomatous inflammation has abundant macrophages in tissue.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Circulating precursors of tissue macrophages are:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'A major function of macrophages is:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Compared with neutrophils, macrophages are more prominent in:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 16: Lymphocyte Function
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lymphocyte Function', 'A child with recurrent viral infections is found to have defective cell-mediated immunity.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'The lymphocyte most important for cell-mediated immunity is the:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'B lymphocytes primarily contribute to:', '[]'::jsonb, 0, 'The correct answer is A.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Plasma cells are derived from:', '[]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;


    -- Case 17: Platelet Plug Formation
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Platelet Plug Formation', 'A 9-year-old child has mucosal bleeding with defective primary hemostasis.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Primary hemostasis refers mainly to:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Platelets are derived from:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Platelet adhesion at sites of vascular injury is strongly assisted by:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 18: Coagulation Cascade
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Coagulation Cascade', 'A patient with hemophilia develops deep tissue bleeding after minor trauma.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Secondary hemostasis primarily involves:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'The final common step of coagulation produces:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Deep tissue and joint bleeding is more typical of defects in:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 19: Vitamin K and Clotting
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vitamin K and Clotting', 'A patient on long-term antibiotics develops easy bruising due to vitamin K deficiency.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Vitamin K is required for synthesis of several clotting factors in the:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Vitamin K deficiency most directly impairs:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Prolonged deficiency would primarily affect:', '[]'::jsonb, 0, 'The correct answer is A.')
    ON CONFLICT DO NOTHING;


    -- Case 20: Fibrinolysis
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fibrinolysis', 'A post-operative patient is given a drug that enhances plasmin activity.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Plasmin primarily functions to:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Fibrinolysis is important because it:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'The precursor of plasmin is:', '[]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;


    -- Case 21: ABO Blood Grouping
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'ABO Blood Grouping', 'A patient requires blood transfusion before surgery.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'ABO blood groups are determined by antigens present on:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'A person with blood group A has naturally occurring anti-B antibodies mainly of type:', '[]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'If incompatible ABO blood is transfused, the most dangerous immediate result is:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 22: Rh Incompatibility
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rh Incompatibility', 'An Rh-negative mother previously sensitized to Rh antigen becomes pregnant with an Rh-positive fetus.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Hemolytic disease of the newborn is mediated mainly by maternal:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Rh sensitization usually affects which pregnancy more severely?', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'The prevention strategy works by giving anti-D immunoglobulin to:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 23: ESR and Plasma Proteins
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'ESR and Plasma Proteins', 'A patient with chronic inflammatory disease has elevated erythrocyte sedimentation rate (ESR).', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'ESR rises when rouleaux formation increases due to elevated:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Rouleaux refers to RBCs:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'ESR is a nonspecific marker of:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 24: Thrombocytopenia
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Thrombocytopenia', 'A woman with immune thrombocytopenia presents with petechiae and gum bleeding.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Petechiae and mucosal bleeding are most consistent with a defect in:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'A low platelet count primarily impairs:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'Platelets also contribute to clot retraction through contractile proteins including:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


    -- Case 25: Hematopoiesis Across Life
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hematopoiesis Across Life', 'A medical student reviews where blood cells are formed during fetal life and after birth.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'The primary site of hematopoiesis in normal adults is:', '[]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'In fetal life, a major hematopoietic organ before marrow dominance is the:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES (v_case_id, 'All formed elements of blood arise ultimately from:', '[]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;


END $$;

COMMIT;