-- ==========================================
-- Respiratory Physiology Clinical Cases Migration
-- 25 Scenarios | Semester 2 First Year
-- ==========================================

DO $$
DECLARE
    v_topic_id UUID;
    v_case1_id UUID; v_case2_id UUID; v_case3_id UUID; v_case4_id UUID; v_case5_id UUID;
    v_case6_id UUID; v_case7_id UUID; v_case8_id UUID; v_case9_id UUID; v_case10_id UUID;
    v_case11_id UUID; v_case12_id UUID; v_case13_id UUID; v_case14_id UUID; v_case15_id UUID;
    v_case16_id UUID; v_case17_id UUID; v_case18_id UUID; v_case19_id UUID; v_case20_id UUID;
    v_case21_id UUID; v_case22_id UUID; v_case23_id UUID; v_case24_id UUID; v_case25_id UUID;
BEGIN
    -- 1. Get Topic ID
    SELECT id INTO v_topic_id FROM public.topics 
    WHERE title = 'Respiratory Physiology' AND (semester_id = 2 OR usmle_step = 1) 
    LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "Respiratory Physiology" not found. Please ensure it exists in Semester 2.';
    END IF;

    -- 2. Clear existing cases for this topic to avoid duplication
    DELETE FROM public.case_studies WHERE topic_id = v_topic_id;

    -- 3. Insert Case Scenarios
    
    -- Case 1 
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'High Altitude Hyperventilation', 'A 22-year-old man travels rapidly from sea level to a mountain town at 3,500 meters. Within hours, he develops lightheadedness and tingling in his fingers. ABG shows low PaCO2 and mildly increased pH.', 1)
    RETURNING id INTO v_case1_id;

    -- Case 2
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Opioid-Induced Hypoventilation', 'A 30-year-old man is brought to the emergency department after opioid overdose. Respiratory rate is 6/min. ABG shows elevated PaCO2 and decreased pH.', 2)
    RETURNING id INTO v_case2_id;

    -- Case 3
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hyperventilation During Anxiety', 'A 19-year-old student becomes anxious before an exam and starts breathing rapidly. She complains of dizziness and perioral numbness.', 3)
    RETURNING id INTO v_case3_id;

    -- Case 4
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pulmonary Function Testing in Obstruction', 'A 45-year-old smoker has chronic cough and wheezing. Spirometry shows reduced FEV1, reduced FEV1/FVC ratio, and increased residual volume.', 4)
    RETURNING id INTO v_case4_id;

    -- Case 5
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Restrictive Physiology', 'A 52-year-old woman with interstitial lung disease has progressive exertional dyspnea. Spirometry shows reduced TLC, reduced FVC, and normal-to-high FEV1/FVC ratio.', 5)
    RETURNING id INTO v_case5_id;

    -- Case 6
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Surfactant and Neonatal Distress', 'A premature infant develops tachypnea, grunting, and cyanosis shortly after birth.', 6)
    RETURNING id INTO v_case6_id;

    -- Case 7
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Laplace Law and Alveolar Stability', 'A professor asks why surfactant is essential for alveolar stability.', 7)
    RETURNING id INTO v_case7_id;

    -- Case 8
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dead Space Ventilation', 'A patient develops a pulmonary embolism. He is tachypneic, but some alveoli are ventilated without perfusion.', 8)
    RETURNING id INTO v_case8_id;

    -- Case 9
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Right-to-Left Shunt', 'A child with congenital heart disease has hypoxemia that does not improve significantly with 100% oxygen.', 9)
    RETURNING id INTO v_case9_id;

    -- Case 10
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'V/Q Relationships in the Lung', 'A healthy medical student learns that ventilation and perfusion vary from apex to base of the lung in an upright person.', 10)
    RETURNING id INTO v_case10_id;

    -- Case 11
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Oxygen-Hemoglobin Dissociation Curve: Right Shift', 'A patient with fever and sepsis has increased tissue oxygen demand.', 11)
    RETURNING id INTO v_case11_id;

    -- Case 12
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Left Shift of Oxygen-Hemoglobin Curve', 'A fetus obtains oxygen from maternal blood across the placenta.', 12)
    RETURNING id INTO v_case12_id;

    -- Case 13
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Carbon Monoxide Poisoning', 'A man is found in a garage with a running car. His pulse oximetry appears near normal, but he has headache and confusion.', 13)
    RETURNING id INTO v_case13_id;

    -- Case 14
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Diffusion Limitation', 'A patient with pulmonary fibrosis has worsening dyspnea during exercise.', 14)
    RETURNING id INTO v_case14_id;

    -- Case 15
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Compliance in Emphysema vs Fibrosis', 'Two patients are compared: one with emphysema and one with pulmonary fibrosis.', 15)
    RETURNING id INTO v_case15_id;

    -- Case 16
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Work of Breathing', 'A patient with severe asthma is using accessory muscles of respiration.', 16)
    RETURNING id INTO v_case16_id;

    -- Case 17
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pleural Pressure and Pneumothorax', 'A tall young man develops sudden pleuritic chest pain and dyspnea. Imaging confirms spontaneous pneumothorax.', 17)
    RETURNING id INTO v_case17_id;

    -- Case 18
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Mechanics of Inspiration', 'A healthy person takes a normal quiet breath.', 18)
    RETURNING id INTO v_case18_id;

    -- Case 19
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Central vs Peripheral Chemoreceptors', 'A patient with chronic CO2 retention has reduced central chemoreceptor sensitivity over time.', 19)
    RETURNING id INTO v_case19_id;

    -- Case 20
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chronic CO2 Retention', 'A patient with long-standing COPD has chronic hypercapnia.', 20)
    RETURNING id INTO v_case20_id;

    -- Case 21
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Alveolar Gas Equation Logic', 'A student is asked why alveolar oxygen falls during hypoventilation.', 21)
    RETURNING id INTO v_case21_id;

    -- Case 22
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Shallow Rapid Breathing', 'A patient with pleuritic pain takes rapid shallow breaths.', 22)
    RETURNING id INTO v_case22_id;

    -- Case 23
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Exercise and Oxygen Transfer', 'A healthy athlete exercises intensely.', 23)
    RETURNING id INTO v_case23_id;

    -- Case 24
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pulmonary Edema and Diffusion', 'A patient with left-sided heart failure develops pulmonary edema.', 24)
    RETURNING id INTO v_case24_id;

    -- Case 25
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Determinants of Airway Resistance', 'A patient with asthma has expiratory wheezing and prolonged expiration.', 25)
    RETURNING id INTO v_case25_id;


    -- 4. Insert Questions for Case 1
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case1_id, 'The immediate cause of his symptoms is:', '["Hypoventilation with hypercapnia", "Hyperventilation causing respiratory alkalosis", "Metabolic acidosis from lactic acid", "Increased dead space ventilation", "Decreased alveolar ventilation"]', 1, 'Hypoxia at altitude stimulates hyperventilation, which blows off CO2, leading to respiratory alkalosis.'),
    (v_case1_id, 'The strongest stimulus for his increased ventilation at altitude is:', '["Increased PaCO2", "Decreased PaO2 stimulating peripheral chemoreceptors", "Increased CSF H+", "Increased bicarbonate", "Decreased hemoglobin concentration"]', 1, 'At high altitude, the low partial pressure of oxygen (hypoxia) is the primary driver of ventilation via peripheral chemoreceptors.'),
    (v_case1_id, 'Which receptor is most responsible initially?', '["Central chemoreceptor in medulla", "Peripheral chemoreceptor in carotid body", "Stretch receptors in bronchi", "J receptors", "Cerebellar cortex"]', 1, 'Peripheral chemoreceptors in the carotid and aortic bodies respond directly to low PaO2.'),
    (v_case1_id, 'After several days, which renal response helps compensation?', '["Increased bicarbonate retention", "Increased H+ secretion only", "Increased bicarbonate excretion", "Increased phosphate retention", "Decreased ammonium excretion"]', 2, 'The kidneys compensate for respiratory alkalosis by increasing the excretion of bicarbonate.');

    -- 5. Insert Questions for Case 2
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case2_id, 'The primary acid-base disorder is:', '["Respiratory alkalosis", "Metabolic alkalosis", "Respiratory acidosis", "Metabolic acidosis", "Mixed respiratory alkalosis and metabolic acidosis"]', 2, 'Hypoventilation leads to CO2 retention (hypercapnia), causing respiratory acidosis.'),
    (v_case2_id, 'The rise in PaCO2 is due to:', '["Increased dead space only", "Decreased alveolar ventilation", "Increased oxygen consumption", "Increased diffusion capacity", "Increased pulmonary blood flow"]', 1, 'Opioids decrease the respiratory rate and depth, leading to reduced alveolar ventilation.'),
    (v_case2_id, 'Which area is depressed directly by opioids?', '["Carotid body", "Respiratory centers in medulla", "Pulmonary capillary endothelium", "Type II pneumocytes", "Pleura"]', 1, 'Opioids directly depress the rhythmicity centers in the medulla oblongata.'),
    (v_case2_id, 'If severe hypoventilation continues, PaO2 will generally:', '["Rise", "Remain unchanged", "Fall", "Become higher than alveolar PO2", "Equal venous PO2"]', 2, 'Hypoventilation decreases the amount of fresh air reaching the alveoli, leading to a fall in PaO2.');

    -- 6. Insert Questions for Case 3
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case3_id, 'Her ABG is most likely to show:', '["Increased PaCO2, decreased pH", "Decreased PaCO2, increased pH", "Decreased PaCO2, decreased pH", "Increased PaCO2, increased HCO3− immediately", "Normal PaCO2 with severe metabolic alkalosis"]', 1, 'Anxiety-induced hyperventilation blows off CO2, causing respiratory alkalosis.'),
    (v_case3_id, 'Her symptoms are largely related to:', '["Hypercapnia", "Respiratory acidosis", "Respiratory alkalosis reducing ionized calcium", "Increased alveolar dead space", "Diffusion limitation"]', 2, 'Alkalosis increases the binding of calcium to albumin, reducing the ionized (physiologically active) calcium in the blood.'),
    (v_case3_id, 'Which chemoreceptor drive is reduced as hyperventilation continues?', '["Peripheral oxygen sensing only", "Central chemoreceptor drive from CSF H+", "Stretch receptor firing", "J receptor activation", "Cortical influence"]', 1, 'Lower PaCO2 reduces the H+ concentration in the CSF, decreasing the central chemoreceptor drive.');

    -- 7. Insert Questions for Case 4
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case4_id, 'This pattern is most consistent with:', '["Restrictive disease", "Obstructive disease", "Normal spirometry", "Diffusion-limited disease only", "Pure chest wall weakness"]', 1, 'Reduced FEV1/FVC ratio and increased RV are hallmark signs of obstructive lung disease like COPD or asthma.'),
    (v_case4_id, 'The reduced FEV1/FVC ratio occurs because:', '["FVC falls more than FEV1", "FEV1 falls disproportionately", "Tidal volume is increased", "Residual volume is decreased", "Compliance is always reduced"]', 1, 'In obstruction, air flows out more slowly, so FEV1 (the volume in the first second) falls much more than the total FVC.'),
    (v_case4_id, 'Residual volume is often increased in obstruction because of:', '["Increased elastic recoil", "Air trapping", "Reduced airway resistance", "Increased surfactant", "Reduced lung compliance"]', 1, 'Loss of elastic recoil or early airway closure leads to air being trapped in the lungs at the end of expiration.'),
    (v_case4_id, 'Which flow-volume pattern is expected?', '["Tall narrow curve with preserved expiratory limb", "Scooped-out expiratory limb", "Small symmetric loop only", "Increased peak expiratory flow", "Normal loop with isolated inspiratory flattening"]', 1, 'The classic flow-volume loop in obstructive disease shows a "scooped-out" appearance during the expiratory phase.');

    -- 8. Insert Questions for Case 5
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case5_id, 'This pattern is most consistent with:', '["Obstructive disease", "Restrictive disease", "Normal spirometry", "Pure upper airway obstruction", "Neuromuscular failure with hyperinflation"]', 1, 'Reduced TLC and FVC with a normal or high FEV1/FVC ratio is characteristic of restrictive lung disease.'),
    (v_case5_id, 'In restrictive lung disease, lung compliance is often:', '["Increased", "Decreased", "Unchanged always", "Higher than emphysema", "Infinite"]', 1, 'Restrictive diseases like fibrosis make the lungs "stiff," requiring more pressure to inflate them.'),
    (v_case5_id, 'The FEV1/FVC ratio is often normal or high because:', '["FEV1 decreases proportionally less than FVC", "Residual volume is always increased", "Expiratory flow limitation is severe", "Airways collapse early", "Pulmonary capillary blood volume rises"]', 0, 'Since the total volume (FVC) is small, the fraction expelled in the first second remains high.'),
    (v_case5_id, 'Total lung capacity is expected to be:', '["Increased", "Normal", "Decreased", "Increased only during exercise", "Equal to vital capacity"]', 2, 'Decreased TLC is the definitive diagnostic criterion for restrictive disease.');

    -- 9. Insert Questions for Case 6
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case6_id, 'The major physiologic defect is deficiency of:', '["Hemoglobin", "Surfactant", "Alveolar macrophages", "Pulmonary capillaries", "Pleural fluid"]', 1, 'Neonatal Respiratory Distress Syndrome (NRDS) is primarily caused by insufficient surfactant in premature infants.'),
    (v_case6_id, 'Surfactant normally functions to:', '["Increase surface tension", "Decrease alveolar compliance", "Decrease surface tension and prevent alveolar collapse", "Increase diffusion distance", "Decrease functional residual capacity"]', 2, 'Surfactant reduces the work of breathing and stabilizes alveoli by lowering surface tension.'),
    (v_case6_id, 'Type II pneumocytes primarily:', '["Exchange oxygen", "Produce surfactant", "Form alveolar capillary endothelium", "Control medullary rhythm", "Produce bicarbonate"]', 1, 'Type II pneumocytes are cuboidal cells responsible for synthesizing and secreting surfactant.'),
    (v_case6_id, 'Smaller alveoli are especially protected by surfactant because it:', '["Raises their pressure more than larger alveoli", "Lowers surface tension and reduces pressure differences", "Increases their radius", "Eliminates elastic recoil", "Prevents pulmonary blood flow"]', 1, 'By lowering surface tension more effectively as alveoli shrink, surfactant prevents the collapse of smaller alveoli into larger ones.');

    -- 10. Insert Questions for Case 7
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case7_id, 'According to Laplace law, pressure in an alveolus is proportional to:', '["Radius / surface tension", "Surface tension / radius", "Compliance × volume", "Volume / resistance", "Flow × diffusion area"]', 1, 'Laplace Law states P = 2T / r, where T is surface tension and r is radius.'),
    (v_case7_id, 'Without surfactant, small alveoli would tend to:', '["Expand more than large alveoli", "Collapse into larger alveoli", "Have lower pressure than larger alveoli", "Maintain equal pressure automatically", "Increase diffusion capacity"]', 1, 'Smaller radius (r) leads to higher pressure (P) if surface tension (T) is constant, causing air to flow from small to large alveoli.'),
    (v_case7_id, 'Surfactant improves which lung property most directly?', '["Airway resistance", "Lung compliance", "Pulmonary blood flow", "Dead space", "Hemoglobin affinity"]', 1, 'By reducing surface tension, surfactant makes the lung easier to expand (increases compliance).');

    -- 11. Insert Questions for Case 8
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case8_id, 'These alveoli represent increased:', '["Shunt", "Anatomic dead space", "Alveolar dead space", "Tidal volume", "Diffusing capacity"]', 2, 'Alveoli that are ventilated but not perfused (due to an embolism) contribute to alveolar dead space.'),
    (v_case8_id, 'Physiologic dead space equals:', '["Tidal volume − residual volume", "Anatomic dead space + alveolar dead space", "Inspiratory reserve volume + expiratory reserve volume", "Vital capacity − tidal volume", "FRC + RV"]', 1, 'Physiologic dead space is the sum of anatomic (conducting zones) and alveolar (non-functional alveoli) dead space.'),
    (v_case8_id, 'In pulmonary embolism, the V/Q ratio in affected alveoli tends toward:', '["Zero", "One", "Infinity", "0.8 exactly", "Mixed venous value"]', 2, 'Ventilation without perfusion (Q=0) results in a V/Q ratio of infinity.'),
    (v_case8_id, 'Which change is expected in those alveoli?', '["Low alveolar PO2 and high alveolar PCO2", "High alveolar PO2 and low alveolar PCO2", "Equal alveolar and venous gases", "Complete loss of ventilation", "Increased surfactant only"]', 1, 'Since no gas exchange occurs, alveolar air matches inspired air (high O2, zero CO2).');

    -- 12. Insert Questions for Case 9
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case9_id, 'This strongly suggests:', '["High-altitude hypoxia", "Hypoventilation", "Right-to-left shunt", "Low inspired oxygen only", "Respiratory alkalosis"]', 2, 'Shunts are characterized by hypoxemia that does not fully correct with 100% O2 because the shunted blood never sees the oxygenated alveoli.'),
    (v_case9_id, 'In a true right-to-left shunt, blood reaches systemic circulation after:', '["Full ventilation and perfusion matching", "Passing ventilated alveoli only", "Bypassing ventilated alveoli", "Increased dead space only", "Increased diffusion capacity"]', 2, 'Blood bypasses the gas exchange surface entirely and mixes with oxygenated blood.'),
    (v_case9_id, 'Which V/Q condition resembles shunt physiology most closely?', '["V/Q approaching infinity", "V/Q approaching zero", "V/Q exactly one", "Dead space only", "High tidal volume"]', 1, 'Perfusion without ventilation (V=0) is a shunt.');

    -- 13. Insert Questions for Case 10
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case10_id, 'At the apex, V/Q ratio is generally:', '["Lower than at the base", "Equal to zero", "Higher than at the base", "Equal everywhere", "Less than venous blood ratio"]', 2, 'Both V and Q are lower at the apex, but Q falls more significantly, leading to a higher V/Q ratio.'),
    (v_case10_id, 'Compared with the base, apical alveoli have:', '["Lower PO2 and higher PCO2", "Higher PO2 and lower PCO2", "Lower PO2 and lower PCO2", "Higher PO2 and higher PCO2", "Equal PO2 and PCO2"]', 1, 'High V/Q ratios at the apex result in higher PO2 and lower PCO2.'),
    (v_case10_id, 'At the base of the lung, perfusion compared with ventilation is:', '["Relatively greater", "Relatively less", "Absent", "Equal in all postures", "Higher only during exercise"]', 0, 'Gravity increases both V and Q at the base, but perfusion (Q) increases more, leading to a lower V/Q ratio.');

    -- 14. Insert Questions for Case 11
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case11_id, 'Which change shifts the oxygen-hemoglobin dissociation curve to the right?', '["Decreased temperature", "Decreased PCO2", "Increased 2,3-BPG", "Increased pH", "Fetal hemoglobin"]', 2, 'Increased 2,3-BPG, H+ (acidosis), CO2, and temperature all shift the curve right.'),
    (v_case11_id, 'A right shift promotes:', '["Greater oxygen loading in lungs only", "Greater oxygen unloading in tissues", "Stronger hemoglobin-oxygen affinity", "Lower P50", "Less tissue oxygen delivery"]', 1, 'A right shift decreases affinity, making it easier for oxygen to dissociate from hemoglobin at the tissue level.'),
    (v_case11_id, 'Which combination also causes a right shift?', '["Alkalosis and hypothermia", "Acidosis and increased temperature", "Decreased 2,3-BPG and alkalosis", "Carbon monoxide only", "Fetal hemoglobin and alkalosis"]', 1, 'Both metabolic activity (heat) and waste products (H+) facilitate oxygen release.');

    -- 15. Insert Questions for Case 12
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case12_id, 'Fetal hemoglobin is advantageous because it:', '["Has lower affinity for oxygen than adult hemoglobin", "Has higher affinity for oxygen than adult hemoglobin", "Causes right shift in fetus", "Decreases oxygen uptake from maternal blood", "Eliminates the effect of PO2"]', 1, 'HbF must "grab" oxygen from adult HbA in the placenta, so it requires higher affinity.'),
    (v_case12_id, 'A left shift means:', '["Increased P50", "Decreased oxygen affinity", "Decreased P50 and increased oxygen affinity", "More oxygen unloading to tissues", "Increased 2,3-BPG effect"]', 2, 'A left shift increases affinity and decreases the P50 (the PO2 at which 50% saturation is reached).'),
    (v_case12_id, 'Which also shifts the curve left?', '["Increased temperature", "Increased H+", "Carbon monoxide", "Increased 2,3-BPG", "Exercise"]', 2, 'CO binds with high affinity and prevents oxygen unloading, effectively causing a left shift of the remaining sites.');

    -- 16. Insert Questions for Case 13
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case13_id, 'Carbon monoxide causes hypoxia primarily by:', '["Decreasing dissolved oxygen in plasma only", "Binding hemoglobin with high affinity", "Increasing alveolar-capillary diffusion distance", "Causing severe bronchoconstriction", "Destroying surfactant"]', 1, 'CO binds to the heme site 200x more strongly than O2.'),
    (v_case13_id, 'Carbon monoxide shifts the oxygen-hemoglobin curve:', '["Right", "Left", "No change", "Randomly", "Toward zero saturation only"]', 1, 'CO increases the affinity of the remaining heme sites for oxygen, preventing its release.'),
    (v_case13_id, 'Tissue oxygen delivery is impaired because CO:', '["Increases oxygen unloading", "Decreases oxygen content and impairs unloading", "Increases PaO2 markedly", "Increases hemoglobin synthesis instantly", "Raises P50"]', 1, 'Total oxygen content falls because CO replaces O2, and the remaining O2 is held too tightly.');

    -- 17. Insert Questions for Case 14
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case14_id, 'Gas transfer across alveoli is governed by:', '["Poiseuille law", "Fick law of diffusion", "Boyle law", "Charles law", "Dalton law only"]', 1, 'Fick Law: Diffusion Rate = (Area / Thickness) × D × DeltaP.'),
    (v_case14_id, 'Diffusion of gas is increased by:', '["Increased membrane thickness", "Decreased surface area", "Increased diffusion coefficient and larger surface area", "Reduced partial pressure gradient", "Reduced capillary blood flow only"]', 2, 'Larger area and better solubility (coefficient) facilitate faster diffusion.'),
    (v_case14_id, 'In pulmonary fibrosis, diffusion is impaired mainly because of:', '["Reduced hemoglobin affinity", "Increased membrane thickness", "Decreased dead space", "Increased alveolar ventilation only", "Reduced airway resistance"]', 1, 'Scarring thickens the alveolar-capillary barrier.'),
    (v_case14_id, 'Exercise worsens hypoxemia in diffusion limitation because:', '["Transit time of blood in pulmonary capillaries decreases", "Dead space always falls to zero", "Hemoglobin loses affinity", "Alveolar PO2 always decreases", "Shunt disappears"]', 0, 'Faster cardiac output means blood spends less time at the exchange surface, not leaving enough time for equilibration in a thick membrane.');

    -- 18. Insert Questions for Case 15
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case15_id, 'Lung compliance in emphysema is typically:', '["Decreased", "Increased", "Normal only", "Zero", "Lower than fibrosis"]', 1, 'Loss of alveolar walls and elastin makes the lung highly "stretchy" but weak in recoil.'),
    (v_case15_id, 'Lung compliance in pulmonary fibrosis is typically:', '["Increased", "Normal", "Decreased", "Greater than emphysema", "Infinite"]', 2, 'Stiff lungs are non-compliant.'),
    (v_case15_id, 'Emphysema leads to increased compliance because of:', '["Increased surfactant only", "Loss of elastic tissue", "Thickened alveolar membrane", "Increased airway smooth muscle tone", "Reduced residual volume"]', 1, 'Elastin destruction reduces the inward "snap back" force of the lung.');

    -- 19. Insert Questions for Case 16
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case16_id, 'In obstructive disease, work of breathing is increased mainly because of:', '["Decreased airway resistance", "Increased airway resistance", "Increased surfactant", "Reduced dead space", "Increased chest wall compliance only"]', 1, 'Airway resistance (asthma/COPD) increases the friction work of moving air.'),
    (v_case16_id, 'In restrictive disease, work of breathing is increased mainly because of:', '["Increased compliance", "Decreased elastic work", "Decreased compliance", "Reduced respiratory rate", "Decreased alveolar pressure gradient"]', 2, 'Stiff lungs increase the elastic work required to stretch the tissue.'),
    (v_case16_id, 'Accessory muscles are recruited primarily to:', '["Reduce oxygen consumption to zero", "Increase ventilatory effort", "Decrease tidal volume", "Eliminate dead space", "Decrease pleural pressure changes"]', 1, 'Muscles like the scalenes and sternocleidomastoids help generate the higher pressures needed.');

    -- 20. Insert Questions for Case 17
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case17_id, 'Normally, intrapleural pressure at rest is:', '["Positive relative to atmosphere", "Equal to alveolar pressure throughout cycle", "Negative relative to atmosphere", "Zero always", "Higher than venous pressure"]', 2, 'The chest wall pulls out and the lung pulls in, creating a sub-atmospheric (negative) vacuum.'),
    (v_case17_id, 'In pneumothorax, the affected lung collapses because:', '["Surfactant increases too much", "Intrapleural pressure approaches atmospheric pressure", "Airway resistance falls", "Pulmonary perfusion stops completely", "Diaphragm contracts more strongly"]', 1, 'Loss of the negative pleural pressure allows the lung''s natural elastic recoil to collapse it.'),
    (v_case17_id, 'Transpulmonary pressure is defined as:', '["Intrapleural pressure − alveolar pressure", "Alveolar pressure − intrapleural pressure", "Atmospheric pressure − alveolar pressure", "Capillary pressure − pleural pressure", "Venous pressure − alveolar pressure"]', 1, 'Ptp = Palv - Ppl. A positive Ptp keeps the lung open.');

    -- 21. Insert Questions for Case 18
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case18_id, 'During quiet inspiration, the diaphragm:', '["Relaxes and ascends", "Contracts and descends", "Does not move", "Increases intrapleural pressure", "Decreases thoracic volume"]', 1, 'Contraction flattens the diaphragm, increasing thoracic volume.'),
    (v_case18_id, 'Alveolar pressure during inspiration becomes:', '["More positive than atmospheric", "Equal to venous pressure", "Slightly negative relative to atmospheric", "Zero always", "Equal to intrapleural pressure"]', 2, 'The expansion of the chest increases the volume of the alveoli, lowering the internal pressure below atmospheric level.'),
    (v_case18_id, 'Air flows into the lungs because:', '["Alveolar pressure exceeds atmospheric pressure", "Intrapleural pressure becomes positive", "Alveolar pressure falls below atmospheric pressure", "Pulmonary capillary pressure falls", "Surfactant increases suddenly"]', 2, 'Gases move from high pressure (atmosphere) to low pressure (alveoli).');

    -- 22. Insert Questions for Case 19
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case19_id, 'Central chemoreceptors respond primarily to changes in:', '["Arterial PO2 directly", "CSF H+ generated from CO2 diffusion", "Hemoglobin concentration", "Tidal volume", "Lung stretch"]', 1, 'CO2 crosses the BBB and generates H+ in the CSF, which stimulates the medulla.'),
    (v_case19_id, 'Peripheral chemoreceptors are most strongly stimulated by:', '["PaO2 below about 60 mmHg", "Mild increases in bicarbonate", "Increased lung compliance", "Decreased venous return", "Reduced surfactant"]', 0, 'Peripheral receptors (carotid/aortic) are primarily oxygen sensors.'),
    (v_case19_id, 'The main peripheral chemoreceptors are located in the:', '["Medulla only", "Carotid and aortic bodies", "Pleura", "Alveoli", "Pulmonary veins"]', 1, 'Carotid bodies (CN IX) and Aortic bodies (CN X).'),
    (v_case19_id, 'Which molecule crosses the blood-brain barrier more readily to affect central chemoreceptors?', '["H+", "HCO3−", "CO2", "Hemoglobin", "Chloride"]', 2, 'CO2 is lipid-soluble and diffuses easily via the BBB.');

    -- 23. Insert Questions for Case 20
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case20_id, 'Over time, central chemoreceptor response may diminish because CSF pH is partially corrected by:', '["Decreased bicarbonate transport out of CSF", "Increased bicarbonate in CSF", "Increased lactic acid", "Reduced renal bicarbonate generation", "Increased surfactant secretion"]', 1, 'Bicarbonate transport into the CSF buffers the H+, resetting the sensitivity.'),
    (v_case20_id, 'In such patients, hypoxemia may become a more important respiratory drive via:', '["Central chemoreceptors only", "Peripheral chemoreceptors", "Stretch receptors", "Cerebral cortex only", "J receptors"]', 1, 'When CO2 drive is lost, "hypoxic drive" via peripheral chemoreceptors takes over.'),
    (v_case20_id, 'Excessive oxygen administration in severe chronic CO2 retainers may reduce:', '["Dead space", "Hypoxic respiratory drive", "Pulmonary blood flow everywhere", "Hemoglobin content", "Airway resistance directly to zero"]', 1, 'Giving too much O2 can remove the patient''s only remaining stimulus for breathing (the hypoxic drive).');

    -- 24. Insert Questions for Case 21
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case21_id, 'Alveolar PO2 is inversely related to:', '["Alveolar PCO2", "Hemoglobin concentration", "Lung compliance", "Diffusion coefficient only", "Surfactant production"]', 0, 'Alveolar Gas Equation: PAO2 = FiO2(Patm-Ph2o) - PACO2/R.'),
    (v_case21_id, 'Hypoventilation generally causes:', '["Increased alveolar PO2", "Decreased alveolar PCO2", "Increased alveolar PCO2 and decreased alveolar PO2", "No change in alveolar gases", "Increased diffusion capacity"]', 2, 'Ventilating less means CO2 builds up and O2 falls.'),
    (v_case21_id, 'If inspired oxygen fraction is unchanged, rising PaCO2 tends to:', '["Raise PAO2", "Lower PAO2", "Leave PAO2 unchanged", "Eliminate dead space", "Raise oxygen content always"]', 1, 'In the alveolar gas equation, PACO2 is subtracted from the oxygen term.');

    -- 25. Insert Questions for Case 22
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case22_id, 'Rapid shallow breathing tends to reduce alveolar ventilation because:', '["Tidal volume decreases relative to dead space contribution", "Total minute ventilation always increases alveolar ventilation", "Dead space becomes zero", "Residual volume decreases markedly", "Diffusing capacity increases"]', 0, 'Alveolar Vent = (TV - DS) * RR. If TV is small, most of it just fills the dead space.'),
    (v_case22_id, 'Alveolar ventilation is proportional to:', '["Respiratory rate × total lung capacity", "(Tidal volume − dead space) × respiratory rate", "Residual volume × respiratory rate", "FRC × respiratory rate", "Compliance × tidal volume"]', 1, 'Only the air that clears the dead space reaches the exchange surface.'),
    (v_case22_id, 'If tidal volume approaches dead space volume, alveolar ventilation will:', '["Increase", "Remain maximal", "Fall markedly", "Equal minute ventilation", "Increase PaO2 automatically"]', 2, 'In extreme cases, air just moves back and forth in the trachea without reaching the alveoli.');

    -- 26. Insert Questions for Case 23
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case23_id, 'During exercise, oxygen consumption by tissues:', '["Decreases", "Increases", "Remains fixed", "Becomes diffusion-independent", "Equals carbon dioxide output always"]', 1, 'Cells consume more O2 for aerobic metabolism.'),
    (v_case23_id, 'Mixed venous PO2 during heavy exercise generally:', '["Increases", "Decreases", "Equals arterial PO2", "Becomes zero always", "Depends only on hematocrit"]', 1, 'Tissues extract more O2, leaving less in the venous blood.'),
    (v_case23_id, 'Diffusing capacity for oxygen during exercise tends to:', '["Decrease", "Remain exactly unchanged", "Increase", "Become zero", "Fall only in trained athletes"]', 2, 'The body optimizes exchange during exercise.'),
    (v_case23_id, 'Which contributes to increased diffusing capacity during exercise?', '["Reduced pulmonary capillary blood volume", "Recruitment and distension of pulmonary capillaries", "Thickening of alveolar membrane", "Reduced cardiac output", "Decreased surface area"]', 1, 'Increased blood flow opens up more capillaries, increasing available surface area.');

    -- 27. Insert Questions for Case 24
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case24_id, 'Gas exchange is impaired partly because edema:', '["Decreases diffusion distance", "Increases diffusion distance", "Decreases airway resistance only", "Increases surfactant production", "Decreases capillary blood volume"]', 1, 'Fluid in the interstitial space or alveoli thickens the barrier.'),
    (v_case24_id, 'Which gas is affected first in diffusion impairment under many conditions?', '["Carbon dioxide more than oxygen always", "Oxygen more than carbon dioxide", "Nitrogen only", "Water vapor only", "All gases equally"]', 1, 'Oxygen is usually affected first because CO2 has higher solubility and reaches equilibrium faster.'),
    (v_case24_id, 'Carbon dioxide often diffuses better than oxygen because it has:', '["Lower solubility", "Higher molecular weight only", "Much higher diffusion coefficient in tissue", "No partial pressure gradient requirement", "No need for membrane crossing"]', 2, 'CO2 is 20-24 times more soluble than O2 in water/tissue.');

    -- 28. Insert Questions for Case 25
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case25_id, 'Airway resistance is most sensitive to changes in:', '["Airway radius", "Hemoglobin affinity", "Pleural fluid volume only", "Diffusion coefficient", "Pulmonary capillary pressure"]', 0, 'Resistance is proportional to 1/r^4.'),
    (v_case25_id, 'During expiration in obstructive disease, airway narrowing is worsened by:', '["Increased radial traction", "Dynamic airway compression", "Increased surfactant", "Reduced intrathoracic pressure", "Increased alveolar stability only"]', 1, 'Expiratory effort increases pleural pressure, which can compress floppy airways.'),
    (v_case25_id, 'Beta-2 agonists improve airflow primarily by:', '["Increasing surfactant", "Bronchodilation", "Increasing alveolar dead space", "Decreasing diaphragm contraction", "Lowering hemoglobin concentration"]', 1, 'Relaxes smooth muscle in the bronchioles.'),
    (v_case25_id, 'Expiration is especially difficult in asthma because:', '["It is always an active process in healthy people too", "Airways narrow more during expiration", "Compliance falls to zero", "Tidal volume increases too much", "Pulmonary perfusion stops"]', 1, 'Natural airway narrowing during expiration compounds the underlying pathological obstruction.');


    RAISE NOTICE 'Respiratory Physiology cases and questions populated successfully.';
END $$;
