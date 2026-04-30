BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for History Taking & Physical Examination
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'history-physical-exam' LIMIT 1;

    -- CASE 01: Vital Signs and Measurement Error
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Falsely Elevated Reading', 'A 55-year-old obese female presents for a routine check-up. The medical assistant records a blood pressure of 165/95 mmHg using a standard-sized adult cuff. The patient has no history of hypertension and no symptoms.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of this patient''s elevated blood pressure reading?', '["White coat hypertension", "Essential hypertension", "Cuff size too small for the arm circumference", "Secondary hypertension"]', 2, 'Using a cuff that is too small for a large arm requires more pressure to compress the artery, leading to a falsely high reading.'),
    (v_case_id, 'What is the recommended ratio of cuff bladder width to arm circumference?', '["20%", "40%", "60%", "80%"]', 1, 'The bladder width should be approximately 40% of the arm circumference.'),
    (v_case_id, 'Which of the following is the correct technique for measuring blood pressure?', '["The patient''s arm should be above heart level", "The patient should have their legs crossed", "The arm should be supported at heart level", "The reading should be taken immediately after the patient sits down"]', 2, 'The arm must be supported at heart level; uncorrected positions can lead to significant errors.');

    -- CASE 02: Skin Examination - Melanoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Changing Mole', 'A 42-year-old male presents with a "spot" on his back that his wife noticed has changed. On exam, you see a 7mm asymmetric, darkly pigmented lesion with irregular borders and multiple shades of brown and black.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which feature of the "ABCDE" rule is most concerning in this lesion?', '["Asymmetry", "Border irregularity", "Color variegation", "All of the above"]', 3, 'Asymmetry, irregular borders, multiple colors, and a diameter > 6mm are all classic "ABCDE" warning signs for melanoma.'),
    (v_case_id, 'What does the "E" in the ABCDE mnemonic stand for?', '["Erythema", "Elevation", "Evolution (change over time)", "Exudate"]', 2, 'Evolution—any change in size, shape, color, or new symptoms like bleeding—is the most sensitive sign of malignancy.'),
    (v_case_id, 'What is the most important prognostic factor for a primary cutaneous melanoma?', '["The diameter of the lesion", "The color of the lesion", "The depth of invasion (Breslow thickness)", "The location on the body"]', 2, 'Breslow thickness (vertical depth) is the strongest predictor of survival and metastatic potential.');

    -- CASE 03: Hearing Loss - Weber and Rinne Tests
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Difficulty Hearing in One Ear', 'A 68-year-old female reports a gradual decrease in hearing in her right ear. On the Weber test (tuning fork on midline), the sound is heard more loudly in her LEFT ear. On the Rinne test, air conduction is greater than bone conduction in both ears (AC > BC).', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of hearing loss does this patient have?', '["Right-sided conductive hearing loss", "Right-sided sensorineural hearing loss", "Left-sided conductive hearing loss", "Left-sided sensorineural hearing loss"]', 1, 'In sensorineural loss, the Weber test lateralizes to the normal (Left) ear, and the Rinne test is normal (AC > BC) in both.'),
    (v_case_id, 'If the patient had a wax impaction in the right ear, how would the Weber test result change?', '["Lateralize to the Left", "Lateralize to the Right", "Remain midline", "Not be heard at all"]', 1, 'In conductive hearing loss, the Weber test lateralizes to the AFFECTED ear because the "noise" of the room is blocked out.'),
    (v_case_id, 'Which of the following is a common cause of sensorineural hearing loss in the elderly?', '["Otosclerosis", "Presbycusis", "Cerumen impaction", "Chronic otitis media"]', 1, 'Presbycusis is age-related sensorineural hearing loss due to degeneration of hair cells in the cochlea.');

    -- CASE 04: Pupillary Examination - Marcus Gunn Pupil
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Blurred Vision and the Swinging Flashlight', 'A 30-year-old female with a history of multiple sclerosis presents with sudden blurred vision and pain in her right eye. When you shine a light in the left eye, both pupils constrict. When you quickly move the light to the right eye, both pupils appear to dilate.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this pupillary finding?', '["Argyll Robertson pupil", "Adie tonic pupil", "Relative Afferent Pupillary Defect (RAPD / Marcus Gunn pupil)", "Horner syndrome"]', 2, 'An RAPD indicates a lesion in the optic nerve or retina on the affected side.'),
    (v_case_id, 'What is the most likely underlying diagnosis in this patient?', '["Acute glaucoma", "Optic neuritis", "Cataract", "Third nerve palsy"]', 1, 'Optic neuritis is a common presentation of MS and is the most classic cause of an RAPD.'),
    (v_case_id, 'In a patient with a complete left 3rd nerve (CN III) palsy, what would you expect to see?', '["Ptosis and a constricted pupil", "Ptosis, dilated pupil, and the eye looking \"down and out\"", "Miosis and anhidrosis", "Normal pupil but inability to abduct the eye"]', 1, 'CN III controls the levator palpebrae, pupillary constrictors, and most extraocular muscles.');

    -- CASE 05: Neck Examination - Thyroid
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Lump in the Neck', 'A 45-year-old woman is found to have a 2 cm firm nodule in the right lobe of her thyroid during a physical exam. The nodule is painless and moves upward when she swallows.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the patient asked to swallow during the thyroid exam?', '["To test the glossopharyngeal nerve", "Because the thyroid is attached to the trachea and moves up with deglutition", "To relax the sternocleidomastoid muscles", "To check for dysphagia"]', 1, 'The thyroid and trachea move upward together during swallowing, helping to differentiate thyroid masses from other neck lumps.'),
    (v_case_id, 'Which of the following findings would be most suspicious for thyroid malignancy?', '["A soft, multi-nodular gland", "Tenderness on palpation", "Associated hoarseness and a fixed, hard nodule", "A nodule that disappears when the neck is flexed"]', 2, 'Hoarseness suggests vocal cord paralysis from recurrent laryngeal nerve involvement, a sign of local invasion by cancer.'),
    (v_case_id, 'Where should the examiner place their fingers to palpate the thyroid isthmus?', '["Above the thyroid cartilage", "Between the thyroid and cricoid cartilages", "Just below the cricoid cartilage", "At the suprasternal notch"]', 2, 'The isthmus typically lies across the 2nd, 3rd, and 4th tracheal rings, just below the cricoid.');

    -- CASE 06: Lung Percussion - Pneumonia vs. Effusion
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dullness at the Base', 'A 60-year-old male presents with fever and cough. Physical exam reveals dullness to percussion at the right lung base. Tactile fremitus is INCREASED over the area of dullness, and you hear egophony (E to A change).', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumothorax", "Pleural effusion", "Lobar pneumonia (consolidation)", "COPD"]', 2, 'Consolidation (pneumonia) increases sound transmission, leading to increased fremitus and egophony. Effusion decreases it.'),
    (v_case_id, 'If the patient had a large pleural effusion instead, what would you expect the tactile fremitus to be?', '["Increased", "Decreased or absent", "Normal", "Hyper-resonant"]', 1, 'Fluid in the pleural space acts as an insulator, blocking the transmission of vibrations from the lung to the chest wall.'),
    (v_case_id, 'What breath sound is classically heard over an area of consolidation?', '["Vesicular", "Bronchial", "Wheezing", "Stridor"]', 1, 'Bronchial breath sounds (louder, harsher, with a silent gap between inspiration and expiration) are normal over the trachea but indicate consolidation when heard over the lung periphery.');

    -- CASE 07: Lung Examination - Pneumothorax
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Dyspnea in a Tall Young Man', 'A 22-year-old tall, thin smoker presents with sudden onset sharp right-sided chest pain and shortness of breath. On exam, the right side of the chest is HYPER-RESONANT to percussion, and breath sounds are absent on that side.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pulmonary embolism", "Spontaneous pneumothorax", "Pneumonia", "Acute asthma"]', 1, 'Hyper-resonance + absent breath sounds = Air in the pleural space (pneumothorax).'),
    (v_case_id, 'Which of the following physical findings would suggest that this has progressed to a TENSION pneumothorax?', '["Tracheal deviation toward the right side", "Tracheal deviation toward the left side", "Dullness to percussion on the right", "Bradycardia"]', 1, 'In a tension pneumothorax, pressure builds up and pushes the mediastinum/trachea AWAY from the affected side.'),
    (v_case_id, 'What is the most immediate life-saving intervention for a tension pneumothorax?', '["Chest X-ray", "Needle decompression", "Endotracheal intubation", "Inhaled albuterol"]', 1, 'Needle decompression should be performed immediately based on clinical diagnosis, without waiting for imaging.');

    -- CASE 08: Cardiac Auscultation - Aortic Stenosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Syncopal Episode in an Elderly Man', 'A 78-year-old male presents after a fainting spell. On cardiac exam, you hear a harsh crescendo-decrescendo systolic murmur at the right second intercostal space that radiates to the carotid arteries. S2 is soft.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Mitral regurgitation", "Aortic stenosis", "Hypertrophic cardiomyopathy", "Aortic regurgitation"]', 1, 'The location and radiation to the carotids are classic for aortic stenosis.'),
    (v_case_id, 'Which physical exam finding is most suggestive of SEVERE aortic stenosis?', '["Loud S1", "Pulsus parvus et tardus", "Early diastolic rumble", "Wide pulse pressure"]', 1, 'Pulsus parvus et tardus (weak and delayed carotid upstroke) is a hallmark of severe AS.'),
    (v_case_id, 'What happens to the intensity of this murmur during a Valsalva maneuver?', '["It increases", "It decreases", "It stays the same", "It disappears"]', 1, 'Valsalva decreases venous return (preload). For AS, this decreases the amount of blood flowing across the valve, making the murmur softer (unlike HCM).');

    -- CASE 09: Cardiac Auscultation - Mitral Regurgitation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Shortness of Breath and a Blowing Murmur', 'A 65-year-old male with a history of a previous MI presents with exertional dyspnea. You hear a high-pitched holosystolic murmur at the apex that radiates to the left axilla.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Tricuspid regurgitation", "Aortic stenosis", "Mitral regurgitation", "Ventricular septal defect"]', 2, 'A holosystolic murmur at the apex radiating to the axilla is the classic description of MR.'),
    (v_case_id, 'Which maneuver would increase the intensity of this murmur?', '["Inspiration", "Handgrip", "Standing up", "Valsalva"]', 1, 'Handgrip increases afterload, which forces more blood backward through the mitral valve, Loudening the murmur.'),
    (v_case_id, 'How can you distinguish Mitral Regurgitation from Tricuspid Regurgitation on exam?', '["MR radiates to the back, TR to the neck", "TR intensity increases with inspiration (Carvallo sign)", "MR is heard best at the lower sternal border", "There is no way to distinguish them"]', 1, 'Right-sided murmurs (TR) increase in intensity with inspiration due to increased venous return.');

    -- CASE 10: Heart Failure Signs - JVP and S3
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pitted Ankles', 'A 70-year-old male with long-standing hypertension presents with 2+ pitting edema of the ankles. On exam, the jugular venous pressure (JVP) is 12 cm H2O. Auscultation reveals a low-pitched extra heart sound in early diastole (S3).', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the significance of the S3 heart sound in this older adult?', '["It is a normal physiological finding", "It suggests mitral valve prolapse", "It indicates ventricular volume overload / heart failure", "It indicates stiff, non-compliant ventricles"]', 2, 'An S3 (ventricular gallop) is a highly specific sign of heart failure in patients over 40.'),
    (v_case_id, 'How is the JVP measured clinically?', '["Horizontal distance from the clavicle", "Vertical distance from the sternal angle + 5 cm", "Vertical distance from the thyroid cartilage", "Direct pressure in the femoral vein"]', 1, 'Vertical distance from the sternal angle plus 5 cm (the distance from the angle to the right atrium) estimates the CVP.'),
    (v_case_id, 'What is the most likely finding on lung auscultation in this patient?', '["Expiratory wheezing", "Inspiratory crackles (rales)", "Pleural friction rub", "Stridor"]', 1, 'Crackles at the lung bases are common in congestive heart failure due to pulmonary edema.');

    -- CASE 11: Abdominal Exam - Appendicitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Right Lower Quadrant Pain', 'A 19-year-old male presents with 12 hours of abdominal pain that started around the umbilicus and moved to the right lower quadrant. He has "rebound tenderness" at McBurney''s point.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "rebound tenderness" a sign of?', '["Simple gas pain", "Peritoneal irritation", "Gallstones", "Kidney stones"]', 1, 'Rebound tenderness suggests inflammation of the parietal peritoneum.'),
    (v_case_id, 'You apply pressure to the LEFT lower quadrant, and the patient feels pain in the RIGHT lower quadrant. What is this sign called?', '["Murphy sign", "Rovsing sign", "Psoas sign", "Obturator sign"]', 1, 'Rovsing sign is a classic finding in acute appendicitis.'),
    (v_case_id, 'The "Psoas sign" is elicited by:', '["Internal rotation of the flexed hip", "Extension of the right hip", "Deep palpation of the RUQ", "Percussion of the flanks"]', 1, 'Extending the hip stretches the psoas muscle; if it is inflamed by an overlying appendix, it causes pain.');

    -- CASE 12: Abdominal Exam - Cholecystitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Post-Prandial RUQ Pain', 'A 45-year-old overweight female presents with sharp right upper quadrant pain that started after a fatty meal. On exam, she suddenly stops her inspiration when you palpate deeply under the right costal margin.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this physical exam finding?', '["McBurney sign", "Murphy sign", "Kehr sign", "Grey Turner sign"]', 1, 'Murphy sign is highly sensitive for acute cholecystitis.'),
    (v_case_id, 'Where might pain from the gallbladder be referred?', '["Left shoulder", "Right shoulder/scapula", "Groin", "Periumbilical area"]', 1, 'Gallbladder pain can radiate to the right scapular region (Boas'' sign).'),
    (v_case_id, 'Which of the following would be an expected laboratory finding in uncomplicated acute cholecystitis?', '["Normal WBC count", "Leukocytosis with left shift", "Extremely high Amylase", "Markedly elevated AST/ALT (>1000)"]', 1, 'Leukocytosis is typical; very high liver enzymes or amylase would suggest common bile duct stones or pancreatitis.');

    -- CASE 13: Abdominal Exam - Ascites
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Distended Abdomen', 'A 55-year-old male with chronic hepatitis C presents with a large, distended abdomen. When you percuss from the umbilicus toward the flanks while he is supine, the sound changes from tympany to dullness.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'To confirm this is fluid, you ask the patient to roll onto his side and percuss again. The area of dullness moves to the dependent side. What is this called?', '["Fluid wave", "Shifting dullness", "Bulge sign", "Puddle sign"]', 1, 'Shifting dullness is a reliable test for peritoneal fluid (ascites).'),
    (v_case_id, 'What is the "Fluid Wave" test?', '["Percussing the liver span", "Tapping one flank and feeling the impulse on the other", "Listening for bowel sounds for 5 minutes", "Pushing on the gallbladder"]', 1, 'A fluid wave requires a second person to place their hand on the midline to block fat-pad vibrations.'),
    (v_case_id, 'A patient with ascites and cirrhosis has dilated veins radiating from the umbilicus. This is called:', '["Spider angioma", "Caput Medusae", "Palmar erythema", "Asterixis"]', 1, 'Caput Medusae represents portal-systemic collateral circulation.');

    -- CASE 14: Abdominal Exam - Aortic Aneurysm
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pulsatile Midline Mass', 'During a routine physical of a 70-year-old male smoker, you palpate a prominent, pulsatile mass in the upper abdomen, slightly to the left of the midline. It is about 5 cm wide.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pancreatic cancer", "Abdominal Aortic Aneurysm (AAA)", "Splenomegaly", "Distended bladder"]', 1, 'A pulsatile midline mass in an older smoker is an AAA until proven otherwise.'),
    (v_case_id, 'What is the screening recommendation for AAA?', '["Annual CT scans for all men", "One-time ultrasound for men 65-75 who have ever smoked", "Annual physical exam is sufficient", "No screening is recommended"]', 1, 'USPSTF recommends a one-time US for this high-risk group.'),
    (v_case_id, 'A sudden onset of severe "tearing" back pain in this patient would suggest:', '["Renal colic", "AAA Rupture or Dissection", "Lumbago", "Pancreatitis"]', 1, 'Rupture is a surgical emergency characterized by pain, hypotension, and a pulsatile mass.');

    -- CASE 15: Vascular Exam - Aortic Dissection
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Discrepant Blood Pressure', 'A 62-year-old male with a history of hypertension presents with sudden, excruciating "tearing" pain in his chest that radiates between his shoulder blades. His BP in the right arm is 180/100, but in the left arm, it is 130/80.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Myocardial infarction", "Aortic dissection", "Pulmonary embolism", "Pneumothorax"]', 1, 'The "tearing" quality and BP discrepancy between arms are highly suggestive of a Stanford Type A dissection.'),
    (v_case_id, 'Which of the following physical exam findings might also be present in this patient if the dissection involves the aortic root?', '["Mitral regurgitation murmur", "Aortic regurgitation murmur", "S3 gallop", "Pericardial friction rub"]', 1, 'Retrograde dissection into the aortic root can cause acute aortic valve insufficiency.'),
    (v_case_id, 'What is the best initial IMAGING test for a hemodynamically stable patient with suspected aortic dissection?', '["Chest X-ray", "CT Angiography (CTA)", "Transthoracic Echo", "Aortography"]', 1, 'CTA is the standard for rapid, accurate diagnosis in stable patients.');

    -- CASE 16: MSK - Knee Injury
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The "Pop" in the Knee', 'A 22-year-old soccer player twisted her knee and felt a "pop" followed by immediate swelling. On exam, you can pull the tibia forward significantly further than on the unaffected side while the knee is flexed at 20 degrees.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this physical exam test?', '["McMurray test", "Lachman test", "Anterior Drawer test", "Valgus stress test"]', 1, 'The Lachman test is the most sensitive test for an ACL tear.'),
    (v_case_id, 'Which structure is most likely injured?', '["Medial meniscus", "Posterior cruciate ligament (PCL)", "Anterior cruciate ligament (ACL)", "Medial collateral ligament (MCL)"]', 2, 'The "pop" and positive Lachman/Drawer tests indicate an ACL injury.'),
    (v_case_id, 'The "Unhappy Triad" of knee injuries involves the ACL, the MCL, and which other structure?', '["Lateral collateral ligament", "Lateral meniscus", "Medial meniscus", "Patellar tendon"]', 2, 'The triad involves the ACL, MCL, and Medial Meniscus (though lateral meniscus is actually more common in acute tears).');

    -- CASE 17: MSK - Shoulder Pain
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Difficulty Lifting the Arm', 'A 65-year-old man presents with chronic right shoulder pain, especially when reaching overhead. When you ask him to slowly lower his arm from a fully abducted position, the arm drops suddenly at about 90 degrees.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this test?', '["Neer test", "Hawkins test", "Drop arm test", "Empty can test"]', 2, 'A positive drop arm test is highly suggestive of a full-thickness rotator cuff tear.'),
    (v_case_id, 'Which rotator cuff muscle is most commonly injured?', '["Supraspinatus", "Infraspinatus", "Teres minor", "Subscapularis"]', 0, 'The supraspinatus is the most frequent site of rotator cuff tears.'),
    (v_case_id, 'The "Empty Can" test (Jobe test) is used to evaluate the same muscle. How is it performed?', '["Resisted internal rotation", "Resisted abduction with the arm in the scapular plane and thumb down", "Resisted external rotation", "Pushing the arm down against gravity"]', 1, 'This position isolates the supraspinatus tendon.');

    -- CASE 18: MSK - Hand and Wrist
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Numbness in the Fingers', 'A 45-year-old secretary complains of numbness and tingling in her thumb, index, and middle fingers, especially at night. You ask her to hold the backs of her hands together with her wrists fully flexed for 60 seconds, which reproduces the symptoms.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this diagnostic maneuver?', '["Tinel sign", "Phalen test", "Finkelstein test", "Froment sign"]', 1, 'Phalen test is used to screen for Carpal Tunnel Syndrome.'),
    (v_case_id, 'Which nerve is compressed in this condition?', '["Ulnar nerve", "Radial nerve", "Median nerve", "Axillary nerve"]', 2, 'The median nerve passes through the carpal tunnel.'),
    (v_case_id, 'Where would you expect to see muscle wasting (atrophy) in severe, chronic cases?', '["Hypothenar eminence", "Thenar eminence", "Interosseous spaces", "Forearm"]', 1, 'The median nerve supplies the thenar muscles (LOAF: Lumbricals 1-2, Opponens pollicis, Abductor pollicis brevis, Flexor pollicis brevis).');

    -- CASE 19: MSK - Wrist Trauma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fall on an Outstretched Hand', 'A 25-year-old male fell while skateboarding. He has pain in his right wrist but no obvious deformity. On exam, he has significant point tenderness in the "anatomical snuffbox."', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely injury?', '["Colles fracture", "Scaphoid fracture", "Hamate fracture", "Radial styloid fracture"]', 1, 'Snuffbox tenderness is the hallmark of a scaphoid fracture.'),
    (v_case_id, 'What is the most serious potential complication of this fracture?', '["Nerve entrapment", "Avascular necrosis", "Tendon rupture", "Osteoarthritis"]', 1, 'The blood supply to the scaphoid enters distally; a proximal pole fracture can easily lead to AVN.'),
    (v_case_id, 'Initial X-rays are often negative for this fracture. What is the appropriate management if clinical suspicion is high?', '["Tell the patient it''s just a sprain", "Repeat X-rays in 10-14 days or order an MRI", "Immediate surgery", "Start physical therapy"]', 1, 'Initial imaging may not show the fracture; immobilization and repeat imaging are mandatory.');

    -- CASE 20: Neurological - Cranial Nerve III
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Drooping Eyelid', 'An 80-year-old male with a history of poorly controlled diabetes presents with a "droopy" right eyelid. On exam, the right eye is looking "down and out," and the pupil is normal and reactive to light.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Ischemic CN III palsy", "Aneurysmal CN III palsy", "Horner syndrome", "Myasthenia gravis"]', 0, 'In diabetics, microvascular ischemia often affects the core of the nerve but spares the superficial parasympathetic fibers (pupil-sparing).'),
    (v_case_id, 'If the pupil was FIXED AND DILATED in this patient, what would be the most urgent concern?', '["Hyperglycemia", "Posterior communicating artery aneurysm", "Stroke", "Cataract"]', 1, 'Compression of the nerve (e.g., by an aneurysm) typically involves the superficial parasympathetic fibers early, causing a "blown pupil."'),
    (v_case_id, 'Which muscles are functioning to pull the eye "down and out" in a 3rd nerve palsy?', '["Superior oblique and Lateral rectus", "Inferior oblique and Medial rectus", "Superior rectus and Lateral rectus", "Inferior rectus and Medial rectus"]', 0, 'CN IV (Superior Oblique) and CN VI (Lateral Rectus) are intact.');

    -- CASE 21: Neurological - CN VII (Facial Nerve)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Crooked Smile', 'A 35-year-old woman woke up with the right side of her face "sagging." On exam, she cannot wrinkle her right forehead, cannot close her right eye, and her right smile is weak.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this a central (Stroke) or peripheral (Bell''s palsy) lesion?', '["Central (UMN)", "Peripheral (LMN)", "Mixed", "Neither"]', 1, 'Involvement of the FOREHEAD indicates a peripheral (LMN) lesion of the facial nerve.'),
    (v_case_id, 'Why is the forehead spared in a central (stroke) lesion of the facial nerve?', '["The forehead has its own nerve", "The forehead is supplied by the trigeminal nerve", "The forehead receives bilateral cortical innervation", "The forehead muscles are stronger"]', 2, 'The upper face receives input from both motor cortices; a unilateral stroke only knocks out one side, leaving the other to function.'),
    (v_case_id, 'What is the most common cause of a peripheral CN VII palsy?', '["Tumor", "Bell''s palsy (idiopathic/viral)", "Lyme disease", "Otitis media"]', 1, 'Bell''s palsy is the most common cause, though Lyme should be considered in endemic areas.');

    -- CASE 22: Neurological - UMN vs LMN
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Weakness and Muscle Twitches', 'A 60-year-old male presents with progressive weakness in his legs. On exam, he has "spasticity," hyperactive deep tendon reflexes (4+), and an upgoing big toe when the sole is stroked (positive Babinski).', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'These findings are characteristic of what type of lesion?', '["Upper Motor Neuron (UMN)", "Lower Motor Neuron (LMN)", "Neuromuscular junction", "Muscle"]', 0, 'Hyperreflexia, spasticity, and a positive Babinski are the classic triad of UMN damage.'),
    (v_case_id, 'Which of the following findings would suggest a LOWER Motor Neuron (LMN) lesion instead?', '["Spasticity", "Clonus", "Fasciculations and atrophy", "Hyperreflexia"]', 2, 'LMN lesions cause "flaccid" paralysis: weakness, atrophy, fasciculations, and hyporeflexia.'),
    (v_case_id, 'A disease that involves BOTH UMN and LMN signs simultaneously is:', '["Multiple Sclerosis", "Amyotrophic Lateral Sclerosis (ALS)", "Myasthenia Gravis", "Polio"]', 1, 'ALS (Lou Gehrig''s disease) is the classic example of combined UMN and LMN degeneration.');

    -- CASE 23: Neurological - Cerebellar Signs
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Unsteady Walk', 'A 50-year-old chronic alcoholic presents with an unsteady gait. When you ask him to touch his nose and then your finger, he exhibits a tremor that worsens as he gets closer to the target.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this type of tremor called?', '["Resting tremor", "Essential tremor", "Intention tremor", "Physiological tremor"]', 2, 'Intention tremors are characteristic of cerebellar disease.'),
    (v_case_id, 'The inability to perform rapid alternating movements (like flipping hands on thighs) is called:', '["Dysmetria", "Dysdiadochokinesia", "Ataxia", "Aphasia"]', 1, 'Dysdiadochokinesia is a hallmark of cerebellar dysfunction.'),
    (v_case_id, 'Which part of the cerebellum is likely affected in a patient with primarily GAIT ataxia and a history of alcoholism?', '["Cerebellar hemispheres", "Cerebellar vermis", "Flocculonodular node", "Pons"]', 1, 'The vermis (midline) controls trunk and gait; it is specifically damaged in chronic alcohol-induced cerebellar degeneration.');

    -- CASE 24: Neurological - Parkinsonian Gait
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Shuffling Steps', 'A 72-year-old male presents with a "pill-rolling" resting tremor. When you ask him to walk, he takes short, shuffling steps, has a stooped posture, and does not swing his arms.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for his shuffling gait?', '["Ataxic gait", "Festinating gait", "Steppage gait", "Waddling gait"]', 1, 'Festination is the tendency to take increasingly rapid, short steps to avoid falling forward.'),
    (v_case_id, 'What happens to his tremor when he reaches out to grab his glasses?', '["It gets worse", "It disappears or dampens", "It changes frequency", "It stays the same"]', 1, 'Parkinsonian tremors are "resting" tremors and typically improve with voluntary activity.'),
    (v_case_id, 'Which of the following is another "cardinal sign" of Parkinson''s disease?', '["Spasticity", "Cogwheel rigidity", "Hyperreflexia", "Chorea"]', 1, 'The cardinal signs are Tremor, Rigidity (cogwheel), Akinesia/Bradykinesia, and Postural instability (TRAP).');

    -- CASE 25: Neurological - Meningeal Signs
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Stiff Neck', 'A 24-year-old college student presents with high fever, headache, and a stiff neck. When you flex his neck, he involuntarily flexes his hips and knees.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this physical exam finding?', '["Kernig sign", "Brudzinski sign", "Babinski sign", "Rovsing sign"]', 1, 'Brudzinski sign is a classic indicator of meningeal irritation.'),
    (v_case_id, 'The Kernig sign is elicited by:', '["Flexing the neck", "Extending the leg with the hip flexed", "Internal rotation of the hip", "Tapping the facial nerve"]', 1, 'Kernig sign is pain and resistance when the knee is extended while the hip is flexed.'),
    (v_case_id, 'The presence of a non-blanching petechial rash in this patient would most strongly suggest which organism?', '["Streptococcus pneumoniae", "Neisseria meningitidis", "Listeria monocytogenes", "Haemophilus influenzae"]', 1, 'Meningococcemia classically presents with a petechial/purpuric rash.');

    -- CASE 26: Breast Examination
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painless Breast Lump', 'A 52-year-old female presents with a "knot" in her left breast. On exam, you palpate a hard, 3 cm mass in the upper outer quadrant. The mass is painless, irregular, and does not move when you attempt to palpate it.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which feature of this mass is most suspicious for malignancy?', '["Size > 2 cm", "Painless nature", "Fixation to surrounding tissue and hardness", "Location in the upper outer quadrant"]', 2, 'Hardness and "fixation" (immobility) are the most reliable indicators of invasive cancer.'),
    (v_case_id, 'What is the significance of "nipple retraction" or skin "dimpling"?', '["They are normal signs of aging", "They suggest infection", "They are signs of Cooper''s ligaments being pulled by an underlying tumor", "They only occur in lactating women"]', 2, 'Dimpling suggests that the tumor is involving the suspensory (Cooper''s) ligaments of the breast.'),
    (v_case_id, 'Which of the following is a classic skin finding of inflammatory breast cancer?', '["Spider angiomas", "Peau d''orange", "Erythema nodosum", "Striae"]', 1, 'Peau d''orange (orange-peel skin) results from lymphatic obstruction by the cancer.');

    -- CASE 27: Lymphatics - Virchow''s Node
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Left Supraclavicular Node', 'A 60-year-old male with chronic epigastric pain and unintentional weight loss presents with a hard, painless, enlarged lymph node in his left supraclavicular fossa.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this clinical finding?', '["Sister Mary Joseph node", "Virchow node", "Osler node", "Janeway lesion"]', 1, 'A Virchow node (Troisier''s sign) is a classic harbinger of internal malignancy.'),
    (v_case_id, 'Why is this node specifically associated with abdominal malignancies?', '["The node has a direct arterial supply from the stomach", "It drains the thoracic duct", "It is the primary drainage for the liver", "It is the largest node in the body"]', 1, 'The thoracic duct, which carries lymph from most of the body (including the abdomen), drains into the left subclavian vein near this node.'),
    (v_case_id, 'A Sister Mary Joseph node refers to a palpable node in which location?', '["Axilla", "Groin", "Umbilicus", "Neck"]', 2, 'A Sister Mary Joseph node is an umbilical nodule associated with metastatic intra-abdominal cancer.');

    -- CASE 28: Pediatric Exam - Hip Dysplasia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Newborn Screening', 'During the newborn physical exam of a baby girl born in the breech position, you flex the hips and knees, then abduct the hips. You feel a distinct "clunk" on the left side.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this maneuver?', '["Barlow maneuver", "Ortolani maneuver", "McMurray test", "Lachman test"]', 1, 'The Ortolani maneuver "reduces" a dislocated hip back into the socket (the "clunk").'),
    (v_case_id, 'The Barlow maneuver is used to:', '["Reduce a dislocated hip", "Attempt to dislocate an unstable hip", "Check for knee stability", "Test for scoliosis"]', 1, 'Barlow (Backwards) tries to push the hip out of the socket.'),
    (v_case_id, 'Which of the following is a major risk factor for Developmental Dysplasia of the Hip (DDH)?', '["Male gender", "Breech presentation", "Preterm birth", "Maternal diabetes"]', 1, 'Breech positioning, female gender, and family history are the key risk factors.');

    -- CASE 29: Cardiovascular - Coarctation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Leg Pain in a Young Adult', 'A 15-year-old boy presents with leg fatigue while running. On exam, you note that his blood pressure is 150/90 in his arms, but his femoral pulses are weak and delayed compared to his radial pulses.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Peripheral artery disease", "Coarctation of the aorta", "Patent ductus arteriosus", "Aortic dissection"]', 1, 'Radio-femoral delay is the hallmark of coarctation of the aorta.'),
    (v_case_id, 'What classic X-ray finding might be seen in this patient due to collateral circulation?', '["Water-bottle heart", "Rib notching", "Egg-on-a-string", "Boot-shaped heart"]', 1, 'Dilated intercostal arteries erode the inferior edges of the ribs.'),
    (v_case_id, 'Coarctation of the aorta is highly associated with which genetic syndrome?', '["Down syndrome", "Turner syndrome", "Marfan syndrome", "Klinefelter syndrome"]', 1, 'Turner syndrome (45,X) is frequently associated with pre-ductal coarctation and bicuspid aortic valve.');

    -- CASE 30: Mental Status - Aphasia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Struggle for Words', 'A 70-year-old patient who recently suffered a stroke in the left frontal lobe can follow your commands perfectly but has great difficulty speaking. His speech is halting, effortful, and consists mostly of nouns and verbs with no connective words.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this type of aphasia?', '["Wernicke aphasia", "Broca aphasia", "Global aphasia", "Conduction aphasia"]', 1, 'Broca (expressive/non-fluent) aphasia is characterized by intact comprehension but impaired production.'),
    (v_case_id, 'Wernicke aphasia (fluent aphasia) is typically characterized by:', '["Struggling to speak", "Excellent comprehension", "Fluent but nonsensical speech (\"word salad\") and poor comprehension", "Inability to repeat words only"]', 2, 'Wernicke''s is a "receptive" aphasia.');

    RAISE NOTICE 'SUCCESS: History Taking & Physical Examination Case Blocks (1-30) registered.';
END $$;

COMMIT;
