BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Chest X-ray & Radiology
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'chest-xray-radiology' LIMIT 1;

    -- CASE 01: Normal CXR and Orientation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'PA vs AP Projection', 'A healthy 30-year-old male has a screening chest X-ray. The technician instructs him to stand with his chest against the plate and his arms forward.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of X-ray projection is being described?', '["Anteroposterior (AP)", "Posteroanterior (PA)", "Lateral decubitus", "Lordotic"]', 1, 'In a PA view, the X-ray beam enters the back (posterior) and exits the front (anterior) to the detector.'),
    (v_case_id, 'Why is a PA view generally preferred over an AP view for heart size assessment?', '["It uses less radiation", "It minimizes magnification of the heart", "It shows the ribs better", "It is easier for sick patients"]', 1, 'In an AP view, the heart is further from the plate, which causes artificial enlargement (magnification).'),
    (v_case_id, 'How many posterior ribs should be visible above the diaphragm to indicate a good inspiratory effort?', '["5-6", "7-8", "9-10", "12-13"]', 2, 'A good inspiration shows 9-10 posterior ribs or 6 anterior ribs.');

    -- CASE 02: Quality Check - Rotation and Penetration
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Reading the Film Quality', 'A junior resident is reviewing a CXR. He notices that the spinous processes are not centered between the medial ends of the clavicles, and the spine is not visible behind the heart.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The lack of centering of the spinous processes indicates what quality issue?', '["Inadequate inspiration", "Rotation", "Under-penetration", "Over-penetration"]', 1, 'The spinous processes should be equidistant from the medial clavicular heads; if not, the patient is rotated.'),
    (v_case_id, 'If the spine is NOT visible behind the heart, the film is:', '["Over-penetrated", "Under-penetrated", "Normally penetrated", "Rotated"]', 1, 'Under-penetration makes the heart appear too white (opaque) and hides the structures behind it.'),
    (v_case_id, 'An over-penetrated (too dark) film is most likely to obscure which of the following?', '["Large tumors", "Pneumothorax", "Bony fractures", "Subtle lung markings/infiltrates"]', 3, 'Over-penetration "burns through" soft tissue details, making subtle lung markings hard to see.');

    -- CASE 03: Right Middle Lobe Pneumonia - Silhouette Sign
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Disappearing Heart Border', 'A 45-year-old female presents with fever and productive cough. Her CXR shows an opacity in the right lower lung field. The right heart border is no longer visible (it is obscured by the opacity).', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the radiological sign described here?', '["Air bronchogram sign", "Silhouette sign", "Golden S sign", "Deep sulcus sign"]', 1, 'The silhouette sign occurs when two structures of the same density are in contact, blurring their border.'),
    (v_case_id, 'Based on the loss of the right heart border, which lobe is the pneumonia located in?', '["Right Upper Lobe", "Right Middle Lobe", "Right Lower Lobe", "Left Middle Lobe"]', 1, 'The right heart border is in contact with the Right Middle Lobe. If it were the Right Lower Lobe, the heart border would remain visible (it is posterior).'),
    (v_case_id, 'If you see tubular, air-filled structures within the dense lung opacity, what is this called?', '["Cavitation", "Air bronchogram", "Honeycomb lung", "Pneumatocele"]', 1, 'Air bronchograms indicate that the alveoli are filled with fluid (pus/edema) but the airways remain patent, confirming consolidation.');

    -- CASE 04: Pleural Effusion
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Blunt Angle', 'A 70-year-old male with heart failure has a CXR that shows a dense white area at the base of the left lung. The sharp angle where the diaphragm meets the ribs is gone, replaced by a concave upward interface.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumonia", "Pleural effusion", "Atelectasis", "Elevated diaphragm"]', 1, 'Blunting of the costophrenic angle and a meniscus sign are classic for pleural effusion.'),
    (v_case_id, 'What is the name of the "concave upward" line seen at the top of the fluid?', '["Kerley B line", "Meniscus sign", "Silhouette sign", "Westermark sign"]', 1, 'The meniscus sign is the classic shape of a pleural effusion on an upright CXR.'),
    (v_case_id, 'Approximately how much fluid must be present in the pleural space to be visible on an upright PA chest X-ray?', '["10-20 mL", "50-75 mL", "200-300 mL", "500-1000 mL"]', 2, 'Usually, at least 200-300 mL of fluid is needed to blunt the costophrenic angle on a standard PA view.');

    -- CASE 05: Tension Pneumothorax
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Emergency in the Trauma Bay', 'Following a car accident, a 30-year-old male develops sudden hypotension. A portable CXR shows a very dark (radiolucent) right lung with NO lung markings and the heart being pushed toward the left side.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Simple pneumothorax", "Tension pneumothorax", "Hemothorax", "Atelectasis"]', 1, 'A radiolucent area without lung markings and mediastinal shift indicates a tension pneumothorax.'),
    (v_case_id, 'What happens to the right hemi-diaphragm in this condition?', '["It is elevated", "It is depressed (pushed down)", "It is obscured by fluid", "It disappears"]', 1, 'The high pressure of the tension pneumothorax can flatten or depress the diaphragm on the affected side.'),
    (v_case_id, 'In a simple (non-tension) pneumothorax, what would you look for to confirm the diagnosis?', '["A thick white line", "A thin, sharp visceral pleural line", "Air bronchograms", "Kerley B lines"]', 1, 'The visceral pleural line demarcates the edge of the collapsed lung from the air in the pleural space.');

    -- CASE 06: Congestive Heart Failure
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The "Wet" Lung', 'A 75-year-old male with chronic orthopnea presents for follow-up. His CXR shows prominent upper lobe vessels, small horizontal lines at the periphery of the bases, and a heart that spans more than 50% of the chest width.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the small horizontal lines at the periphery (bases) called?', '["Kerley A lines", "Kerley B lines", "Tram-track lines", "Air bronchograms"]', 1, 'Kerley B lines represent thickened interlobular septa due to pulmonary venous hypertension.'),
    (v_case_id, 'What is the term for the "prominent upper lobe vessels"?', '["Pruning", "Cephalization", "Hampton Hump", "Honeycombing"]', 1, 'Cephalization is the redistribution of blood flow to the upper lobes in CHF.'),
    (v_case_id, 'A "Bat-wing" or "Butterfly" pattern of perihilar opacities suggests:', '["Pneumonia", "Alveolar pulmonary edema", "Pulmonary embolism", "Sarcoidosis"]', 1, 'Acute pulmonary edema often presents with a symmetric perihilar distribution.'),

    -- CASE 07: Tuberculosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chronic Cough and Night Sweats', 'A 50-year-old homeless man presents with a 3-month history of cough and weight loss. His CXR shows an ill-defined opacity with a hollow, air-filled center in the right lung APEX.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute pneumonia", "Reactivation Tuberculosis", "Lung abscess", "Bronchiectasis"]', 1, 'Cavitary lesions in the upper lobes/apices are the classic hallmark of secondary (reactivation) TB.'),
    (v_case_id, 'What is the "hollow center" called?', '["Abscess", "Cavitation", "Bulla", "Bleb"]', 1, 'Cavitation occurs when necrotic tissue is coughed out, leaving an air-filled space.'),
    (v_case_id, 'What is a "Ghon complex"?', '["A large apical cavity", "A calcified primary lung nodule and a calcified hilar lymph node", "A pleural effusion in TB", "Miliary spread throughout the lung"]', 1, 'The Ghon complex is a sign of healed primary TB infection.');

    -- CASE 08: Pulmonary Embolism - X-ray Signs
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Normal X-ray with Severe SOB', 'A 40-year-old woman with sudden SOB has a near-normal CXR. On close inspection, you notice a wedge-shaped opacity at the periphery of the lung base and a localized area of decreased lung markings (oligemia).', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the "wedge-shaped opacity" representing lung infarction?', '["Westermark sign", "Hampton Hump", "Palla sign", "Silhouette sign"]', 1, 'Hampton Hump is a peripheral wedge-shaped density representing pulmonary infarction.'),
    (v_case_id, 'What is the name of the "localized area of decreased lung markings"?', '["Westermark sign", "Hampton Hump", "Kerley B line", "Sail sign"]', 0, 'Westermark sign represents focal oligemia distal to a large pulmonary embolus.'),
    (v_case_id, 'What is the most common CXR finding in a patient with a PE?', '["Hampton Hump", "Westermark sign", "A completely normal (or near-normal) CXR", "Large pleural effusion"]', 2, 'The CXR is often normal in PE, making the diagnosis challenging; "Normal CXR in a hypoxic patient" is a classic clue.');

    -- CASE 09: Atelectasis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Post-Operative Opacity', 'A 60-year-old male who just had abdominal surgery develops a fever and low oxygen saturation. His CXR shows a dense area in the left base, and the heart and trachea are pulled TOWARD the left side.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumonia", "Pleural effusion", "Atelectasis (Collapse)", "Pneumothorax"]', 2, 'Atelectasis is a loss of lung volume, which "pulls" the mediastinal structures toward the collapsed area.'),
    (v_case_id, 'How do you distinguish atelectasis from a large pleural effusion on CXR?', '["Atelectasis pushes the heart away; effusion pulls it toward", "Atelectasis pulls the heart toward; effusion pushes it away", "Effusion has air bronchograms", "Atelectasis is always in the apex"]', 1, 'Effusion is a "space-occupying" lesion (pushes), while atelectasis is a "volume-loss" lesion (pulls).'),
    (v_case_id, 'What is the most common cause of atelectasis in a post-operative patient?', '["Bacterial infection", "Mucus plugging of the airways", "Pulmonary embolism", "Heart failure"]', 1, 'Mucus plugs block distal airflow, leading to absorption of air and collapse of the alveoli.');

    -- CASE 10: COPD and Emphysema
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Over-Inflated Lungs', 'A 65-year-old smoker with chronic cough has a CXR that shows very long lungs, flattened diaphragms, and a narrow, "vertical" heart.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'These findings are characteristic of what condition?', '["COPD / Emphysema", "Pulmonary fibrosis", "Heart failure", "Pneumonia"]', 0, 'Hyperinflation (flattened diaphragms, increased retrosternal air space) is the hallmark of emphysema.'),
    (v_case_id, 'How many anterior ribs are typically seen in a patient with significant hyperinflation?', '["4", "6", "8 or more", "None"]', 2, 'Normally 6; more than 7-8 anterior ribs indicates hyperinflation.'),
    (v_case_id, 'What happens to the "retrosternal clear space" on the lateral view in emphysema?', '["It disappears", "It is increased", "It is filled with fluid", "It is normal"]', 1, 'The retrosternal air space increases as the lungs expand behind the sternum.');

    -- CASE 11: Sarcoidosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bilateral Lumps at the Hilum', 'A 35-year-old African American female presents with a dry cough and erythema nodosum on her shins. Her CXR shows prominent, symmetric bulging of the mediastinal structures on both sides of the heart.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Lung cancer", "Tuberculosis", "Sarcoidosis", "Lymphoma"]', 2, 'Bilateral hilar lymphadenopathy (BHL) is the classic CXR Stage 1 finding of sarcoidosis.'),
    (v_case_id, 'What is the term for the characteristic bulging seen at the hilum?', '["Silhouette sign", "Hilar adenopathy", "Westermark sign", "Bat-wing appearance"]', 1, 'Adenopathy refers to enlarged lymph nodes; in sarcoidosis, this is typically symmetric and well-defined.'),
    (v_case_id, 'If the CXR also showed fine reticular (net-like) opacities throughout the lungs, what stage of sarcoidosis would this be?', '["Stage 1", "Stage 2", "Stage 3", "Stage 4"]', 1, 'Stage 1: BHL alone. Stage 2: BHL + interstitial infiltrates. Stage 3: Infiltrates alone. Stage 4: Fibrosis.');

    -- CASE 12: Pneumoperitoneum
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Air Where It Shouldn''t Be', 'A 60-year-old male with a history of peptic ulcer disease presents with sudden, severe "board-like" abdominal pain. An UPRIGHT chest X-ray is performed.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What finding would you look for to confirm a perforated viscus?', '["Air in the esophagus", "Free air under the diaphragm (crescent sign)", "Dilated bowel loops", "Fluid in the pleural space"]', 1, 'Pneumoperitoneum (free air) rises to the highest point under the diaphragm in an upright patient.'),
    (v_case_id, 'Why is an UPRIGHT X-ray necessary to see this?', '["Because air is heavy", "Because air rises to the dependent part of the abdomen", "Because air rises to the non-dependent part (under the diaphragm)", "It isn''t; a supine film is better"]', 2, 'Air is less dense than fluid/organs and will rise; on a supine film, it may be invisible or show Rigler''s sign.'),
    (v_case_id, 'If the patient cannot stand, what is the best alternative X-ray position to see free air?', '["Supine", "Left lateral decubitus", "Prone", "Right lateral decubitus"]', 1, 'In the left lateral decubitus position, free air will rise and be seen easily against the liver on the right side.');

    -- CASE 13: Small Bowel Obstruction
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vomiting and Distension', 'A 45-year-old woman with a history of prior abdominal surgery presents with vomiting and distension. An abdominal X-ray series is performed.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic finding of Small Bowel Obstruction (SBO) on an upright film?', '["Multiple air-fluid levels in a \"stepladder\" pattern", "Air in the rectum", "A single large bubble in the LUQ", "Thumbprinting of the colon"]', 0, 'Dilated loops of bowel with air-fluid levels are the hallmark of mechanical SBO.'),
    (v_case_id, 'What is the diameter threshold for "dilated" small bowel?', '["2 cm", "3 cm", "6 cm", "9 cm"]', 1, 'The 3-6-9 rule: Small bowel > 3cm, Large bowel > 6cm, Cecum > 9cm is dilated.'),
    (v_case_id, 'How can you distinguish small bowel from large bowel on an X-ray?', '["Small bowel has haustra; large bowel has valvulae conniventes", "Small bowel has valvulae conniventes (lines crossing the entire width); large bowel has haustra (lines part-way)", "Small bowel is always on the periphery", "Small bowel is darker than large bowel"]', 1, 'Valvulae conniventes (plicae circulares) cross the full width of the small bowel.'),

    -- CASE 14: Sigmoid Volvulus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Massive Abdominal Bubble', 'An 80-year-old nursing home resident presents with massive abdominal distension. The abdominal X-ray shows a single, enormous, inverted U-shaped loop of bowel that looks like a "coffee bean."', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Small bowel obstruction", "Sigmoid volvulus", "Cecal volvulus", "Toxic megacolon"]', 1, 'The "coffee bean" sign is pathognomonic for sigmoid volvulus.'),
    (v_case_id, 'Where does the "apex" of the coffee bean typically point in sigmoid volvulus?', '["Right upper quadrant", "Left lower quadrant", "Towards the pelvis", "Left upper quadrant"]', 0, 'Sigmoid volvulus usually points toward the RUQ, while cecal volvulus points toward the LUQ.'),
    (v_case_id, 'What is the definitive treatment for an uncomplicated sigmoid volvulus?', '["Laxatives", "Surgical resection immediately", "Endoscopic detorsion (Sigmoidoscopy)", "Antibiotics"]', 2, 'Sigmoidoscopic detorsion is usually the first-line treatment to decompress the bowel.');

    -- CASE 15: Aortic Dissection - Radiology
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Widened Mediastinum', 'A 55-year-old male with tearing chest pain has a CXR performed. The most striking finding is that the mediastinum (the space between the lungs) is much wider than normal (> 8 cm).', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'A widened mediastinum on CXR in this clinical context is highly concerning for:', '["Pneumonia", "Aortic Dissection", "Lung cancer", "Esophageal rupture"]', 1, 'Mediastinal widening can be a sign of a large aortic aneurysm or acute dissection.'),
    (v_case_id, 'What other CXR finding might be seen in an aortic dissection?', '["Air-fluid levels", "Calcium "chipping" or displacement in the aortic knob", "Bilateral pleural effusions", "Atelectasis"]', 1, 'If the aorta has calcium in its wall, a dissection can displace that calcium inward (the "calcium sign").'),
    (v_case_id, 'True or False: A normal mediastinal width completely rules out an aortic dissection.', '["True", "False"]', 1, 'False. Up to 10-20% of patients with dissection can have a normal-appearing mediastinum on CXR.');

    -- CASE 16: Pulmonary Fibrosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The "Honeycombed" Lung', 'A 70-year-old male with progressive dyspnea has a CXR showing small, volume-contracted lungs with coarse, reticular markings that are most prominent at the bases and periphery.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Emphysema", "Interstitial Pulmonary Fibrosis", "Pneumonia", "Pleural effusion"]', 1, 'Small lungs with reticular markings (honeycombing on CT) suggest restrictive interstitial disease.'),
    (v_case_id, 'What term is used for the tiny, cystic air spaces seen in end-stage fibrosis?', '["Cavitations", "Honeycombing", "Bronchiectasis", "Bullae"]', 1, 'Honeycombing represents the destruction of lung architecture and its replacement by fibrous tissue and cysts.'),
    (v_case_id, 'How do lung volumes in fibrosis compare to emphysema?', '["Fibrosis: Increased; Emphysema: Decreased", "Fibrosis: Decreased; Emphysema: Increased", "Both are increased", "Both are decreased"]', 1, 'Fibrosis is restrictive (small lungs); emphysema is obstructive (large, hyperinflated lungs).');

    -- CASE 17: Bronchiectasis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Tram-Track Lines', 'A 30-year-old with cystic fibrosis has a chronic cough and foul-smelling sputum. Her CXR shows thickened, dilated bronchi that appear as parallel lines ("tram-tracks") in the lower lobes.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Asthma", "Bronchiectasis", "Pneumonia", "Lung cancer"]', 1, 'Bronchiectasis is the permanent dilation and thickening of the airways.'),
    (v_case_id, 'What is the "tram-track" sign representing?', '["Atelectasis", "Dilated bronchi viewed from the side", "Calcium in the aorta", "Fluid in the fissures"]', 1, 'When seen in cross-section on CT, these dilated bronchi are called the "signet ring" sign.'),
    (v_case_id, 'Which of the following is a classic cause of localized bronchiectasis?', '["Cystic Fibrosis", "Foreign body aspiration", "Alpha-1 antitrypsin deficiency", "Primary ciliary dyskinesia"]', 1, 'Localized bronchiectasis is often due to a focal obstruction (like a tumor or foreign body), while diffuse disease is due to systemic conditions.');

    -- CASE 18: Cardiomegaly
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Calculating the Heart Size', 'On a standard PA chest X-ray, the maximal horizontal diameter of the heart is 18 cm, and the maximal internal diameter of the thoracic cage is 30 cm.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cardiothoracic (CT) ratio?', '["40%", "50%", "60%", "70%"]', 2, '18 / 30 = 0.60 or 60%.'),
    (v_case_id, 'What is the upper limit of normal for the CT ratio on a PA film?', '["40%", "50%", "60%", "70%"]', 1, 'A normal heart should be less than 50% of the thoracic diameter.'),
    (v_case_id, 'A very large "water-bottle" shaped heart without signs of pulmonary congestion suggests:', '["Left ventricular hypertrophy", "Pericardial effusion", "Mitral stenosis", "Aortic aneurysm"]', 1, 'A massive, globular heart with "clean" lungs is characteristic of a large pericardial effusion.');

    -- CASE 19: Pediatric - Epiglottitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Thumb in the Throat', 'A 4-year-old child presents with high fever, drooling, and a "tripod" position. A lateral neck X-ray is performed carefully.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic X-ray finding for Epiglottitis?', '["Steeple sign", "Thumbprint sign", "Sail sign", "Coffee bean sign"]', 1, 'The "thumbprint sign" is the swollen, rounded epiglottis seen on a lateral neck film.'),
    (v_case_id, 'What is the "Steeple sign" associated with?', '["Epiglottitis", "Croup (Laryngotracheobronchitis)", "Foreign body", "Retropharyngeal abscess"]', 1, 'The steeple sign (subglottic narrowing) is seen on an AP neck film in Croup.'),
    (v_case_id, 'What is the most important first step in managing a child with suspected epiglottitis?', '["Order more X-rays", "Perform a throat culture", "Secure the airway in a controlled environment", "Give a dose of steroids"]', 2, 'Epiglottitis is a medical emergency; maintaining a patent airway is the absolute priority.');

    -- CASE 20: Lung Cancer - Solitary Nodule
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Incidental Nodule', 'A 65-year-old smoker has a CXR for a broken rib. An incidental 2 cm well-defined nodule is seen in the left periphery. A previous CXR from 5 years ago was completely normal.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which feature of this nodule is most concerning for malignancy?', '["Diameter of 2 cm", "Well-defined borders", "Absence on the film from 5 years ago", "Location in the periphery"]', 2, 'A "new" nodule in a smoker is highly suspicious. Growth over time is the most important indicator of cancer.'),
    (v_case_id, 'Which type of calcification pattern is generally considered BENIGN?', '["Speckled", "Eccentric", "Popcorn-like", "Large and central"]', 2, 'Popcorn calcification is characteristic of a benign hamartoma.'),
    (v_case_id, 'What is the next best step for a nodule that is new and has suspicious features?', '["Repeat CXR in 1 year", "CT of the chest", "Start antibiotics", "No follow-up needed"]', 1, 'CT is much more sensitive than CXR for characterizing the borders, density, and associated findings of a nodule.');

    -- CASE 21: Fractures - The Scaphoid
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Wrist Pain after a Fall', 'A 20-year-old male has pain in his thumb base after a fall. The initial X-ray of the wrist is interpreted as normal by the emergency physician.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If the patient has point tenderness in the "snuffbox," why might the initial X-ray be normal?', '["The patient is faking", "Scaphoid fractures are often invisible on early X-rays", "It is probably just a muscle strain", "The wrong bone was X-rayed"]', 1, 'Scaphoid fractures can take 10-14 days to become visible as bone resorption occurs at the fracture site.'),
    (v_case_id, 'What is the classic management for a patient with snuffbox tenderness and a negative X-ray?', '["Ace wrap and discharge", "Thumb spica splint and repeat X-ray in 2 weeks", "Immediate surgery", "Start NSAIDs and return to work"]', 1, 'Immobilization and repeat imaging (or MRI) is mandatory to avoid complications like AVN.'),
    (v_case_id, 'A "Greenstick" fracture, common in children, is defined as:', '["A fracture through a growth plate", "An incomplete fracture where one side of the bone is broken and the other is bent", "A fracture into multiple pieces", "A fracture that breaks the skin"]', 1, 'Children have flexible bones; a greenstick fracture is an incomplete break.');

    -- CASE 22: Esophageal Perforation (Boerhaave)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Severe Chest Pain after Vomiting', 'A 45-year-old male presents with severe chest pain and shock after forceful vomiting. His CXR shows air in the mediastinum (pneumomediastinum) and a left-sided pleural effusion.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Mallory-Weiss tear", "Boerhaave syndrome", "Myocardial infarction", "Pneumothorax"]', 1, 'Boerhaave is a full-thickness rupture of the esophagus; Mallory-Weiss is only a mucosal tear.'),
    (v_case_id, 'What is the term for air outlining the heart and mediastinal structures on CXR?', '["Pneumoperitoneum", "Pneumomediastinum", "Atelectasis", "Chilaiditi syndrome"]', 1, 'Pneumomediastinum appears as thin streaks of air outlining the heart and great vessels.'),
    (v_case_id, 'What imaging test is most appropriate to confirm the diagnosis?', '["CT with oral contrast (Gastrografin)", "Endoscopy", "Barium swallow", "Repeat CXR"]', 0, 'Water-soluble contrast (Gastrografin) is preferred over barium to avoid peritonitis/mediastinitis if a leak is present.');

    -- CASE 23: Hiatal Hernia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Air-Fluid Level behind the Heart', 'On a routine CXR of a 70-year-old obese male, a large, round air-fluid level is seen directly behind the heart on the lateral view and superimposed on the heart on the PA view.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Lung abscess", "Hiatal hernia", "Pericardial cyst", "Aortic aneurysm"]', 1, 'A retrocardiac air-fluid level is the classic appearance of a sliding or paraesophageal hiatal hernia.'),
    (v_case_id, 'Where is this "bubble" actually located?', '["In the left lower lobe", "In the posterior mediastinum", "In the pericardium", "In the anterior mediastinum"]', 1, 'The esophagus and stomach hernia are in the posterior mediastinum.'),
    (v_case_id, 'A "paraesophageal" hernia differs from a "sliding" hernia because:', '["It is smaller", "The gastroesophageal junction remains below the diaphragm", "It always causes GERD", "It never requires surgery"]', 1, 'In paraesophageal hernias, the GE junction stays in place but the fundus herniates; these have a higher risk of strangulation.');

    -- CASE 24: Foreign Body Aspiration
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Missing Peanut', 'A 2-year-old child is brought in for sudden wheezing. The CXR shows that the right lung is much darker and more expanded than the left, and the heart is shifted slightly to the left.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumothorax", "Foreign body aspiration with obstructive emphysema", "Pneumonia", "Asthma"]', 1, 'A foreign body can act as a one-way valve, allowing air in but not out, leading to hyperinflation of the affected lung.'),
    (v_case_id, 'Why is the lung "darker" (more radiolucent)?', '["It has more blood", "It is over-inflated with air", "It is collapsed", "The X-ray was too strong"]', 1, 'More air = more radiolucency (darker).'),
    (v_case_id, 'On an EXPIRATORY film, what would happen to the hyper-inflated lung?', '["It would collapse normally", "It would remain hyper-inflated while the other lung deflates", "It would disappear", "It would turn white"]', 1, 'The trapped air cannot escape, making the hyperinflation more obvious on expiration as the normal lung loses volume.');

    -- CASE 25: Skeletal Radiology - OA
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Knee Pain and Stiff Joints', 'A 70-year-old woman has an X-ray of her knees for chronic pain. It shows narrowed joint spaces, bony outgrowths at the edges, and increased whiteness (density) of the bone just below the joint surface.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the "bony outgrowths" called?', '["Syndesmophytes", "Osteophytes", "Tophi", "Erosions"]', 1, 'Osteophytes (bone spurs) are a hallmark of osteoarthritis.'),
    (v_case_id, 'What is the term for "increased whiteness" of the bone below the joint?', '["Osteopenia", "Subchondral sclerosis", "Lytic lesion", "Periosteal reaction"]', 1, 'Subchondral sclerosis occurs due to increased stress on the bone as cartilage is lost.'),
    (v_case_id, 'How does the joint space narrowing in Osteoarthritis (OA) typically differ from Rheumatoid Arthritis (RA)?', '["OA is symmetric, RA is asymmetric", "OA is asymmetric (e.g., medial compartment only), RA is symmetric (entire joint)", "OA has erosions, RA has osteophytes", "There is no difference"]', 1, 'OA follows mechanical stress (asymmetric), while RA is inflammatory (symmetric).');

    -- CASE 26: Mediastinal Masses
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Anterior Mediastinal Mass', 'A 30-year-old male has a CXR for a cough. A large, well-defined mass is seen in the anterior mediastinum (filling the retrosternal space on the lateral view).', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mnemonic for the most common anterior mediastinal masses?', '["The 4 Ts (Thymoma, Teratoma, Terrible Lymphoma, Thyroid)", "The 3 Cs", "The 5 Ps", "The 2 Ls"]', 0, 'The 4 Ts cover the most common differential for an anterior mass.'),
    (v_case_id, 'A mass in the POSTERIOR mediastinum is most likely to be:', '["Thymoma", "Neurogenic tumor", "Retrosternal goiter", "Pericardial cyst"]', 1, 'Neurogenic tumors (like schwannomas) are the most common posterior mediastinal masses.'),
    (v_case_id, 'Which of these masses is frequently associated with Myasthenia Gravis?', '["Teratoma", "Thymoma", "Lymphoma", "Thyroid goiter"]', 1, 'About 15% of patients with Myasthenia Gravis have a thymoma.');

    -- CASE 27: Heart Failure - Lateral View
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Lateral Heart', 'A patient with suspected heart failure has a lateral CXR. You notice that the posterior border of the heart overlaps the spine.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which chamber is likely enlarged?', '["Right Atrium", "Right Ventricle", "Left Ventricle", "Left Atrium"]', 2, 'The Left Ventricle forms the posterior border of the heart on a lateral view.'),
    (v_case_id, 'Which chamber forms the ANTERIOR border of the heart on a lateral view?', '["Left Ventricle", "Right Ventricle", "Right Atrium", "Aorta"]', 1, 'The Right Ventricle is directly behind the sternum.'),
    (v_case_id, 'Enlargement of which chamber can cause the "carina" (the split of the trachea) to widen?', '["Left Ventricle", "Left Atrium", "Right Atrium", "Right Ventricle"]', 1, 'The Left Atrium sits just below the carina; its enlargement pushes the main bronchi apart.');

    -- CASE 28: Empyema vs Abscess
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Lung Cavity', 'A CXR shows a large air-fluid level within the lung parenchyma. It is round and has thick walls.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pleural effusion", "Lung abscess", "Empyema", "Pneumothorax"]', 1, 'A lung abscess is an infection within the lung itself.'),
    (v_case_id, 'How do you distinguish a lung abscess from an empyema (infected pleural fluid)?', '["Abscesses are always larger", "Empyemas form an obtuse angle with the chest wall and have a "lenticular" shape; abscesses are round and form acute angles", "Abscesses never have air", "There is no way to tell"]', 1, 'Pleural fluid (empyema) conforms to the chest wall, while parenchymal lesions (abscesses) are typically spherical.'),
    (v_case_id, 'Which radiological sign describes air-fluid levels that have different lengths on PA and lateral views in an empyema?', '["Silhouette sign", "Split pleura sign", "Air-fluid level sign", "The "long-short" rule"]', 3, 'In an empyema (which is flat/pancake-shaped), the air-fluid level will have different lengths on orthogonal views. In a round abscess, they will be the same.');

    -- CASE 29: Pulmonary Nodule - Benign Signs
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'A Stable Spot', 'A 40-year-old non-smoker has a CXR that shows a 1 cm nodule. You find an old CXR from 3 years ago that shows the exact same nodule at the same size.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most reassuring feature of this nodule?', '["The size is small", "The patient doesn''t smoke", "Stability over 2 or more years", "The location"]', 2, 'Stability over 2 years is the strongest evidence that a solitary pulmonary nodule is benign.'),
    (v_case_id, 'What is the "doubling time" of most malignant lung tumors?', '["1-7 days", "20-400 days", "5-10 years", "Indefinite"]', 1, 'Malignant doubling times are typically between 1 month and 1 year. Very fast (< 20 days) or very slow (> 400 days) suggests a benign process.'),
    (v_case_id, 'What is the next step for this stable nodule?', '["Biopsy", "CT scan", "No further work-up", "Surgery"]', 2, 'If stability is proven over 2 years, no further work-up is generally required.');

    -- CASE 30: Rib Fractures
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pain with Deep Breaths', 'A 50-year-old male fell on his left side. He has localized pain. The CXR shows breaks in the 4th, 5th, and 6th ribs. Each rib is broken in two places.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for this clinical condition?', '["Simple rib fractures", "Flail chest", "Tension pneumothorax", "Hemothorax"]', 1, 'Flail chest is defined as 3 or more adjacent ribs fractured in 2 or more places.'),
    (v_case_id, 'What is the classic physical exam finding in a flail chest?', '["Rigidity", "Paradoxical chest wall motion (moving inward on inspiration)", "Absent breath sounds", "Crepitus only"]', 1, 'The flail segment is detached and moves opposite to the rest of the chest during breathing.'),
    (v_case_id, 'What is the most dangerous underlying injury associated with a flail chest?', '["Skin bruising", "Pulmonary contusion", "Liver laceration", "Spleen laceration"]', 1, 'Pulmonary contusion (bruising of the lung) often underlies the flail segment and causes significant hypoxia.');

    RAISE NOTICE 'SUCCESS: Chest X-ray & Radiology Case Blocks (1-30) registered.';
END $$;

COMMIT;
