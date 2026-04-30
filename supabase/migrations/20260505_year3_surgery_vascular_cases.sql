BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Vascular Surgery
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'vascular-surgery' LIMIT 1;

    -- CASE 01: Intermittent Claudication
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pain with Walking', 'A 65-year-old male smoker presents with calf pain that occurs after walking two blocks and is relieved by rest. He has no pain at rest.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["DVT", "Intermittent Claudication (Peripheral Artery Disease)", "Spinal stenosis", "Arthritis"]', 1, 'Pain brought on by exertion and relieved by rest is the hallmark of claudication.'),
    (v_case_id, 'What is the first-line diagnostic test for PAD?', '["Angiography", "Ankle-Brachial Index (ABI)", "CT scan", "Ultrasound"]', 1, 'ABI is a simple, non-invasive way to quantify the severity of PAD.'),
    (v_case_id, 'What is the initial management for stable intermittent claudication?', '["Immediate bypass surgery", "Smoking cessation, walking program, and Aspirin/Statin", "Bedrest", "Amputation"]', 1, 'Conservative management (risk factor modification and exercise) is the first step for claudication.');

    -- CASE 02: Chronic Limb-Threatening Ischemia (CLTI)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rest Pain', 'A patient with long-standing PAD now reports burning pain in his foot that occurs at night and is relieved by dangling his foot over the side of the bed.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this symptom called?', '["Claudication", "Ischemic Rest Pain", "Neuropathy", "Cramp"]', 1, 'Rest pain indicates severe ischemia (Stage III/IV) where perfusion is inadequate even at rest.'),
    (v_case_id, 'What ABI value is typically associated with rest pain or tissue loss (ulcers/gangrene)?', '["> 1.0", "0.9 - 0.7", "< 0.4", "1.4"]', 2, 'An ABI < 0.4 suggests severe limb-threatening disease.'),
    (v_case_id, 'What is the management for CLTI?', '["Exercise only", "Urgent revascularization (Bypass or Endovascular) to prevent limb loss", "Antibiotics", "Watch and wait"]', 1, 'Rest pain is a pre-gangrenous state and requires intervention to save the limb.');

    -- CASE 03: Acute Limb Ischemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The 6 Ps', 'A patient with atrial fibrillation presents with sudden onset of a cold, pale, and pulseless right leg.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the "6 Ps" of acute limb ischemia?', '["Pain, Pallor, Pulselessness, Paresthesia, Paralysis, Poikilothermia (Cold)", "Pain, Pressure, Pus, Purple, Pruritus, Pale", "Pneumonia, Pain, Pulse, Pelvis, Prostate, Pale", "None"]', 0, 'These findings indicate a surgical emergency due to sudden arterial occlusion.'),
    (v_case_id, 'What is the most likely cause of acute limb ischemia in a patient with A-fib?', '["Atherosclerosis", "Arterial Embolism", "DVT", "Vasospasm"]', 1, 'The heart is the most common source of emboli (often from the left atrium in A-fib).'),
    (v_case_id, 'What is the immediate medical management once the diagnosis is suspected?', '["Aspirin", "IV Heparin bolus and infusion", "Laxatives", "Wait for an MRI"]', 1, 'Immediate anticoagulation prevents the clot from propagating while preparing for surgery.');

    -- CASE 04: Abdominal Aortic Aneurysm (AAA) - Screening
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Silent Killer', 'A 67-year-old male former smoker comes in for a check-up.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the USPSTF screening recommendation for AAA?', '["Annual CT scans for everyone", "One-time screening ultrasound for men aged 65-75 who have ever smoked", "Screening for women only", "No screening needed"]', 1, 'This specific demographic is at the highest risk.'),
    (v_case_id, 'At what diameter is elective repair of an ASYMPTOMATIC AAA generally recommended for men?', '["3.0 cm", "4.0 cm", "5.5 cm", "10 cm"]', 2, 'At 5.5 cm, the risk of rupture begins to exceed the risk of surgery. (5.0 cm for women).'),
    (v_case_id, 'Where do most AAAs occur relative to the renal arteries?', '["Suprarenal (above)", "Infrarenal (below)", "At the level of the renals", "In the chest"]', 1, '95% of AAAs are infrarenal.');

    -- CASE 05: Ruptured AAA
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Classic Triad of Rupture', 'An 80-year-old male presents with sudden onset severe back pain, hypotension (BP 80/40), and a large pulsatile mass in his abdomen.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate priority for this patient?', '["CT scan", "Immediate transfer to the Operating Room", "Antibiotics", "Wait for lab results"]', 1, 'In a patient with the classic triad and instability, time is tissue. No further imaging is needed before surgery.'),
    (v_case_id, 'What is the mortality rate of a ruptured AAA?', '["5%", "20%", "80-90% (including pre-hospital deaths)", "0%"]', 2, 'Ruptured AAA is one of the most lethal conditions in surgery.'),
    (v_case_id, 'True or False: Most patients with a ruptured AAA have a known history of an aneurysm.', '["True", "False"]', 1, 'False. For many, the rupture is the first time they (or their doctors) knew an aneurysm existed.');

    -- CASE 06: Carotid Stenosis - Symptomatic
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Transient Vision Loss', 'A 70-year-old male presents with a "shade coming down" over his left eye that lasted for 10 minutes and then completely resolved.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the medical term for this transient monocular blindness?', '["Glaucoma", "Amaurosis Fugax", "Hemianopsia", "Diplopia"]', 1, 'It is caused by microemboli from the carotid artery reaching the ophthalmic artery.'),
    (v_case_id, 'What is the next best test to evaluate his carotid arteries?', '["CT Brain", "Carotid Duplex Ultrasound", "MRI Brain", "EEG"]', 1, 'Ultrasound is the standard screening tool for carotid stenosis.'),
    (v_case_id, 'For a SYMPTOMATIC patient (like this one), at what percentage of stenosis is Carotid Endarterectomy (CEA) clearly beneficial?', '["> 30%", "> 50%", "> 70% (and often 50-69%)", "Only at 100%"]', 2, 'The benefit of CEA is highest in symptomatic patients with significant stenosis (> 70%).');

    -- CASE 07: CEA Complications - Nerve Injury
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Post-op Tongue Deviation', 'After a right-sided carotid endarterectomy, the patient is asked to stick out his tongue. It deviates to the right.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve was likely injured during the surgery?', '["Vagus (CN X)", "Hypoglossal (CN XII)", "Glossopharyngeal (CN IX)", "Facial (CN VII)"]', 1, 'The hypoglossal nerve crosses the carotid and can be injured during dissection.'),
    (v_case_id, 'Injury to the Vagus nerve (or recurrent laryngeal nerve) during CEA would cause:', '["Drooping of the mouth", "Hoarseness", "Difficulty swallowing", "Tongue deviation"]', 1, 'The recurrent laryngeal nerve controls the vocal cords.'),
    (v_case_id, 'Which branch of the Facial nerve is at risk during CEA, causing a "crooked smile"?', '["Temporal", "Zygomatic", "Marginal Mandibular", "Cervical"]', 2, 'The marginal mandibular branch can be injured if the incision is too high or during retraction.');

    -- CASE 08: Aortic Dissection
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tearing Chest Pain', 'A 55-year-old with uncontrolled hypertension presents with sudden, excruciating "tearing" pain that radiates between his shoulder blades.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Heart attack", "Aortic Dissection", "Pneumothorax", "PE"]', 1, 'Sudden "tearing" or "ripping" pain in a hypertensive patient is classic for dissection.'),
    (v_case_id, 'According to the Stanford Classification, a dissection involving the ASCENDING aorta is:', '["Type A", "Type B", "Type C", "Type 1"]', 0, 'Type A involves the ascending aorta (regardless of where it starts).'),
    (v_case_id, 'What is the standard management for a Stanford Type B dissection (descending only)?', '["Emergency surgery", "Medical management (aggressive BP and HR control)", "Nothing", "Anticoagulation"]', 1, 'Uncomplicated Type B dissections are managed medically; Type A dissections are surgical emergencies.');

    -- CASE 09: Renal Artery Stenosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Refractory Hypertension', 'A 30-year-old woman has a blood pressure of 180/110. She is on three medications and her BP is still not controlled. An abdominal bruit is heard.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of renal artery stenosis in a YOUNG woman?', '["Atherosclerosis", "Fibromuscular Dysplasia (FMD)", "Vasculitis", "Embolism"]', 1, 'FMD typically affects young women and has a "string of beads" appearance on angiography.'),
    (v_case_id, 'What is the cause of hypertension in renal artery stenosis?', '["Too much salt", "Activation of the Renin-Angiotensin-Aldosterone System (RAAS) due to perceived low pressure at the kidney", "High heart rate", "Brain tumor"]', 1, 'Decreased perfusion to the juxtaglomerular apparatus triggers renin release.'),
    (v_case_id, 'Which class of BP medication can cause an acute drop in kidney function in a patient with BILATERAL renal artery stenosis?', '["Beta blockers", "ACE inhibitors (e.g., Lisinopril)", "Calcium channel blockers", "Diuretics"]', 1, 'ACE inhibitors remove the compensatory efferent arteriolar vasoconstriction needed to maintain GFR in these patients.');

    -- CASE 10: Subclavian Steal Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dizzy When Lifting Weights', 'A patient notices that whenever he does heavy exercise with his left arm, he gets dizzy, develops blurred vision, and feels like he might faint.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Heart failure", "Subclavian Steal Syndrome", "Stroke", "Anemia"]', 1, 'Proximal subclavian stenosis causes blood to flow "backward" down the vertebral artery to the arm, "stealing" blood from the brain.'),
    (v_case_id, 'On exam, what would you expect to find when comparing the two arms?', '["Same blood pressure", "A blood pressure difference of > 20 mmHg between the arms", "One arm is longer", "Both arms have no pulse"]', 1, 'The affected arm will have lower pressure and a delayed pulse.'),
    (v_case_id, 'On which side is Subclavian Steal more common?', '["Right", "Left"]', 1, 'The left subclavian artery is more frequently involved.');

    -- CASE 11: Buerger''s Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Young Smoker with Gangrene', 'A 35-year-old male heavy smoker presents with small, painful ulcers on his fingertips and toes. He has also noticed his fingers turn white and blue in the cold.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Atherosclerosis", "Buerger''s Disease (Thromboangiitis Obliterans)", "Diabetes", "Scleroderma"]', 1, 'Buerger''s is a non-atherosclerotic inflammatory disease of small/medium vessels in young smokers.'),
    (v_case_id, 'What is the only effective treatment for Buerger''s disease?', '["Aspirin", "Smoking cessation", "Bypass surgery", "Antibiotics"]', 1, 'Quitting smoking is the only way to stop the disease progression; surgery is usually not possible due to the small size of the affected vessels.'),
    (v_case_id, 'What "classic" angiographic finding is seen in Buerger''s?', '["Beads on a string", "Corkscrew collaterals", "Aneurysms", "Normal vessels"]', 1, 'Obstruction of small distal vessels leads to the formation of corkscrew collateral vessels.');

    -- CASE 12: Diabetic Foot Ulcers
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painless Ulcer', 'A 60-year-old diabetic presents with a deep, painless ulcer on the sole of his foot, under the first metatarsal head.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary cause of this "painless" ulcer?', '["Ischemia", "Neuropathy (loss of protective sensation)", "Infection", "Fungus"]', 1, 'Diabetic neuropathy leads to repetitive trauma in pressure areas that the patient cannot feel.'),
    (v_case_id, 'Where do ISCHEMIC ulcers (due to PAD) typically occur?', '["The sole of the foot", "The tips of the toes or the lateral malleolus", "The calf", "The knee"]', 1, 'Ischemic ulcers occur at the most distal points or pressure points on the sides of the foot.'),
    (v_case_id, 'What is a "Charcot Foot"?', '["A type of shoe", "Neurogenic arthropathy leading to collapse of the midfoot arch and a \"rocker-bottom\" deformity", "A swollen foot", "A fungal infection"]', 1, 'Loss of sensation and microtrauma lead to bone destruction and joint collapse.');

    -- CASE 13: Deep Vein Thrombosis (DVT)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Swollen Calf After a Long Flight', 'A 40-year-old woman presents with sudden swelling, redness, and tenderness of her left calf after a 12-hour flight.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line imaging test to diagnose DVT?', '["D-dimer", "Venous Duplex Ultrasound", "CT Venogram", "Contrast Venography"]', 1, 'Ultrasound is highly accurate and non-invasive.'),
    (v_case_id, 'What are the three components of Virchow''s Triad?', '["Pain, Swelling, Redness", "Stasis, Hypercoagulability, and Endothelial injury", "Fever, Chills, Pain", "None"]', 1, 'These are the three factors that contribute to venous thrombosis.'),
    (v_case_id, 'What is the most concerning complication of DVT?', '["Varicose veins", "Pulmonary Embolism (PE)", "Leg pain", "Skin rash"]', 1, 'A clot can break off and travel to the lungs, which can be fatal.');

    -- CASE 14: Phlegmasia Cerulea Dolens
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Blue, Swollen Leg', 'A patient with advanced cancer presents with massive swelling of the entire left leg. The leg is blue (cyanotic), cold, and pulses are difficult to feel.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Simple DVT", "Phlegmasia Cerulea Dolens", "Cellulitis", "Acute arterial embolism"]', 1, 'This is a massive, limb-threatening venous thrombosis that compromises arterial inflow due to extreme tissue pressure.'),
    (v_case_id, 'How is this different from Phlegmasia ALBA Dolens?', '["Alba is blue", "Alba is \"milk leg\" (white) and does not involve the same level of ischemia", "Alba is in the arm", "There is no difference"]', 1, 'Alba involves only deep veins; Cerulea involves nearly all venous outflow.'),
    (v_case_id, 'What is the management for Phlegmasia Cerulea Dolens?', '["Compression stockings only", "Aggressive anticoagulation, leg elevation, and often catheter-directed thrombolysis or thrombectomy", "Antibiotics", "Aspirin"]', 1, 'Immediate intervention is needed to prevent venous gangrene and limb loss.');

    -- CASE 15: Chronic Venous Insufficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Stasis Ulcer', 'A 70-year-old woman has chronic swelling of both legs, "brawny" hyperpigmentation of the skin around the ankles, and an ulcer over the medial malleolus.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of the skin color change (hemosiderin staining)?', '["Sun exposure", "Breakdown of RBCs that leak out of high-pressure veins into the skin", "Dirt", "Melanoma"]', 1, 'Chronic venous hypertension causes RBC extravasation.'),
    (v_case_id, 'Where is the classic location for a "venous stasis ulcer"?', '["The heel", "The \"gaiter zone\" (medial malleolus)", "The tips of the toes", "The knee"]', 1, 'The area around the medial ankle is the hallmark location.'),
    (v_case_id, 'What is the most important component of treating venous ulcers?', '["Antibiotics", "Compression therapy (e.g., Unna boot or stockings)", "Bypass surgery", "Elevation only"]', 1, 'Compression helps return blood to the heart and reduces the venous hypertension.');

    -- CASE 16: Thoracic Outlet Syndrome (TOS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Numbness When Reaching Overhead', 'A 25-year-old swimmer reports numbness and tingling in her right hand and arm weakness whenever she practices her backstroke.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Carpal tunnel", "Thoracic Outlet Syndrome", "Rotator cuff tear", "Herniated disc"]', 1, 'Compression of the brachial plexus or vessels in the space between the first rib and clavicle.'),
    (v_case_id, 'Which structure is most commonly compressed in TOS?', '["Subclavian artery", "Subclavian vein", "Brachial plexus (Nerves)", "Carotid artery"]', 2, '95% of TOS cases are neurogenic.'),
    (v_case_id, 'What is "Adson''s Test"?', '["A blood test", "Loss of the radial pulse when the patient rotates their head and inhales (suggests TOS)", "A reflex test", "A strength test"]', 1, 'It is a classic physical exam maneuver for TOS.');

    -- CASE 17: AV Fistula for Dialysis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Dialysis Access', 'A patient with ESRD is being evaluated for a permanent dialysis access.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the preferred type of dialysis access?', '["Tunneled catheter", "Autogenous Arteriovenous (AV) Fistula", "Synthetic Graft", "Peritoneal catheter"]', 1, 'Fistulas have the lowest infection rates and longest patency.'),
    (v_case_id, 'What is the "Rule of 6s" for a maturing fistula?', '["6 inches long, 6 mm diameter, 6 mm deep, 6 weeks old", "6 months, 6 arteries, 6 veins", "6 patients, 6 nurses", "None"]', 0, 'This rule helps decide when a fistula is ready to be used (cannulated) for dialysis.'),
    (v_case_id, 'What is "Dialysis Steal Syndrome"?', '["Someone steals the machine", "Ischemia of the hand because the fistula is \"stealing\" too much arterial blood", "High blood pressure", "Low blood sugar"]', 1, 'If the fistula flow is too high, the hand may become cold, painful, and ischemic.');

    -- CASE 18: Popliteal Artery Aneurysm
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pulsatile Knee', 'A patient with a known AAA is found to have a pulsatile mass behind his left knee.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Baker''s cyst", "Popliteal Artery Aneurysm", "Abscess", "Lipoma"]', 1, 'Popliteal aneurysms are common in patients with AAAs (and are often bilateral).'),
    (v_case_id, 'What is the primary risk of a popliteal aneurysm?', '["Rupture", "Thrombosis and distal embolization (causing acute limb ischemia)", "Bleeding", "Infection"]', 1, 'Unlike AAAs, popliteal aneurysms rarely rupture; they "shut down" or shower clots to the foot.'),
    (v_case_id, 'If you find a popliteal aneurysm in one leg, what is the chance the other leg also has one?', '["1%", "10%", "50%", "100%"]', 2, 'Popliteal aneurysms are bilateral in about 50% of cases.');

    -- CASE 19: Raynaud''s Phenomenon
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'White, Blue, and Red', 'A young woman reports that her fingers turn deathly white in the cold, then blue, and finally red and painful when they warm up.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Buerger''s", "Raynaud''s Phenomenon", "DVT", "PAD"]', 1, 'Raynaud''s is a vasospastic disorder of the digital arteries.'),
    (v_case_id, 'What is the difference between Raynaud''s DISEASE and Raynaud''s SYNDROME?', '["Disease is in men", "Disease is primary (idiopathic); Syndrome is secondary to another condition (e.g., Scleroderma)", "They are the same", "One is only in the feet"]', 1, 'Secondary Raynaud''s is often associated with connective tissue diseases.'),
    (v_case_id, 'What is the first-line medical treatment for severe Raynaud''s?', '["Aspirin", "Calcium Channel Blockers (e.g., Nifedipine)", "Beta blockers", "Heparin"]', 1, 'CCBs help relax the smooth muscle in the arterial walls.');

    -- CASE 20: Raynaud''s vs. Buerger''s
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Differentiating Distal Ischemia', 'Compare a 20-year-old woman with cold-induced color changes and a 35-year-old male smoker with fingertip gangrene.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which patient likely has Buerger''s disease?', '["The woman", "The male smoker"]', 1, 'Smoking history and tissue loss (gangrene) are key markers for Buerger''s.'),
    (v_case_id, 'True or False: Raynaud''s phenomenon usually leads to major amputation.', '["True", "False"]', 1, 'False. Primary Raynaud''s is benign; secondary Raynaud''s can cause small ulcers, but rarely major limb loss.'),
    (v_case_id, 'What should BOTH patients be told to avoid?', '["Walking", "Cold exposure and smoking", "Meat", "Water"]', 1, 'Both cold and nicotine cause vasoconstriction.');

    -- CASE 21: Vascular Trauma - Hard Signs
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Gunshot Wound to the Arm', 'A patient is shot in the upper arm. He has a large, rapidly expanding lump and blood is "spurting" from the wound.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are "Hard Signs" of vascular injury?', '["Active hemorrhage, Expanding/Pulsatile hematoma, Bruit/Thrill, or absent distal pulses", "Pain and swelling", "Bruising", "Numbness"]', 0, 'Hard signs mean the patient goes directly to the OR for exploration.'),
    (v_case_id, 'If a patient has only "Soft Signs" (e.g., small stable hematoma, history of bleeding), what is the next step?', '["Immediate surgery", "Imaging (CTA or ABI)", "Discharge", "Wait"]', 1, 'Soft signs warrant further evaluation but not necessarily immediate surgery.'),
    (v_case_id, 'If there is both a vascular injury and a bone fracture, which should usually be fixed first?', '["Bone", "Artery (to restore blood flow), or use a temporary shunt if the bone work will take too long", "Nerve", "Skin"]', 1, 'Restoring perfusion is the priority; a temporary shunt allows the orthopedic surgeon to fix the bone without the limb being ischemic.');

    -- CASE 22: Median Arcuate Ligament Syndrome (MALS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Post-Prandial Pain in a Young Person', 'A thin 25-year-old woman presents with epigastric pain after eating and weight loss. Imaging shows compression of the celiac artery by a diaphragm ligament.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Celiac disease", "Median Arcuate Ligament Syndrome (Dunbar Syndrome)", "Gallstones", "SMA syndrome"]', 1, 'MALS is extrinsic compression of the celiac axis.'),
    (v_case_id, 'What is "SMA Syndrome" (Wilkie''s Syndrome)?', '["Heart failure", "Compression of the third part of the duodenum between the Aorta and the SMA", "Liver cancer", "Lung disease"]', 1, 'SMA syndrome involves bowel obstruction, whereas MALS involves arterial compression.'),
    (v_case_id, 'What is the treatment for MALS?', '["Bypass", "Surgical division of the median arcuate ligament", "Stenting", "Laxatives"]', 1, 'Releasing the ligament relieves the compression.');

    -- CASE 23: Chronic Mesenteric Ischemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fear of Food', 'A 70-year-old smoker has severe abdominal pain that starts 30 minutes after every meal. He has lost 30 lbs because he is "afraid to eat."', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the clinical term for this condition?', '["Biliary colic", "Intestinal Angina (Chronic Mesenteric Ischemia)", "Gastritis", "Pancreatitis"]', 1, 'Atherosclerosis of the mesenteric vessels prevents the increased blood flow needed for digestion.'),
    (v_case_id, 'Diagnosis of chronic mesenteric ischemia usually requires significant stenosis in how many of the three mesenteric vessels?', '["One", "At least two (Celiac, SMA, or IMA)", "All three", "None"]', 1, 'The rich collateral circulation usually protects the gut unless multiple vessels are blocked.'),
    (v_case_id, 'What is the most effective treatment?', '["High fiber diet", "Revascularization (Stenting or Bypass)", "Antibiotics", "Aspirin only"]', 1, 'Restoring flow allows the patient to eat without pain.');

    -- CASE 24: Superficial Thrombophlebitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red, Hard Vein', 'A patient presents with a painful, red, cord-like structure on her lower leg over a varicose vein. There is no significant swelling of the whole leg.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["DVT", "Superficial Thrombophlebitis", "Cellulitis", "Lymphangitis"]', 1, 'Inflammation and clotting of a superficial vein.'),
    (v_case_id, 'What is the treatment for a localized, uncomplicated superficial thrombophlebitis?', '["Hospitalization and Heparin", "NSAIDs, warm compresses, and ambulation", "Antibiotics", "Surgery"]', 1, 'It is generally a benign, self-limiting condition.'),
    (v_case_id, 'What is "Trousseau''s Sign" of malignancy?', '["Hand spasm", "Migratory superficial thrombophlebitis associated with internal cancer (especially pancreatic)", "Blue spots", "Fever"]', 1, 'Recurrent, shifting clots in superficial veins can be a paraneoplastic sign.');

    -- CASE 25: IVC Filter Indications
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'To Filter or Not to Filter', 'A patient with a large DVT also has an active GI bleed and cannot be anticoagulated.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the appropriate management to prevent PE?', '["Wait for the bleed to stop", "Insertion of an Inferior Vena Cava (IVC) filter", "Give half-dose heparin", "Thrombolysis"]', 1, 'The primary indication for an IVC filter is a DVT/PE in a patient with an absolute contraindication to anticoagulation.'),
    (v_case_id, 'True or False: IVC filters reduce the risk of developing future DVTs.', '["True", "False"]', 1, 'False. Filters actually *increase* the long-term risk of DVT; they only prevent the clot from reaching the lungs (PE).'),
    (v_case_id, 'What is another indication for an IVC filter?', '["The patient is old", "Failure of anticoagulation (recurrent PE despite being on blood thinners)", "Small DVT", "Large varicose veins"]', 1, 'Breakthrough PE is a clear indication for a filter.');

    -- CASE 26: Aortic Dissection - Stanford Type A
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dissection with a New Murmur', 'A patient with a Type A dissection now has a new diastolic murmur and symptoms of heart failure.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What complication has occurred?', '["Mitral stenosis", "Acute Aortic Regurgitation (the dissection reached the aortic valve)", "PE", "Ruptured chordae"]', 1, 'Type A dissections can involve the aortic root and valve.'),
    (v_case_id, 'What is another lethal complication of a Type A dissection involving the pericardium?', '["Pneumonia", "Cardiac Tamponade", "Sepsis", "Liver failure"]', 1, 'Blood can leak into the pericardial sac.'),
    (v_case_id, 'What is the definitive treatment for Type A dissection?', '["Esmolol only", "Emergent surgical repair (Graft replacement of the ascending aorta)", "Stenting", "Bedrest"]', 1, 'Type A is always a surgical emergency due to the risk of rupture or tamponade.');

    -- CASE 27: Varicose Veins
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bulging Leg Veins', 'A 45-year-old hairdresser complains of heavy, aching legs and large, twisted veins on her calves.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying pathophysiology of varicose veins?', '["Arterial blockage", "Incompetent venous valves leading to reflux and high pressure in the superficial veins", "Infection", "Muscle weakness"]', 1, 'Valve failure allows blood to pool in the superficial system.'),
    (v_case_id, 'What is the first-line treatment?', '["Surgery", "Compression stockings and leg elevation", "Sclerotherapy", "Aspirin"]', 1, 'Conservative measures should be tried first.'),
    (v_case_id, 'What is "Ablation" therapy for varicose veins?', '["Removing the skin", "Using heat (laser or radiofrequency) to seal the incompetent vein shut", "Cutting the vein", "Injecting air"]', 1, 'Endovenous thermal ablation has largely replaced surgical "stripping."');

    -- CASE 28: Embolism vs. Thrombosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Acute Ischemia Etiology', 'Compare Patient X (Sudden pain, A-fib, normal pulses in the other leg) and Patient Y (Gradual worsening pain over days, history of claudication, no pulses in either leg).', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which patient likely has an ARTERIAL EMBOLUS?', '["Patient X", "Patient Y"]', 0, 'Sudden onset and a source (A-fib) point to an embolus.'),
    (v_case_id, 'Patient Y likely has:', '["Embolism", "Acute-on-chronic thrombosis (at the site of an existing plaque)", "Vasospasm", "Raynaud''s"]', 1, 'Existing PAD (claudication) and a more gradual course suggest thrombosis.'),
    (v_case_id, 'Which patient is more likely to have a successful result from a Fogarty catheter embolectomy?', '["Patient X", "Patient Y"]', 0, 'Embolectomy is very effective for clear-cut emboli; thrombosis usually requires a bypass because the underlying vessel is diseased.');

    -- CASE 29: Popliteal Entrapment Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Young Athlete with Claudication', 'A 19-year-old male college runner presents with calf pain only when he sprints. He has no risk factors for PAD.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Atherosclerosis", "Popliteal Artery Entrapment Syndrome", "Shin splints", "DVT"]', 1, 'The popliteal artery is compressed by an abnormal medial head of the gastrocnemius muscle.'),
    (v_case_id, 'How do the pulses change during exam maneuvers (like plantarflexion)?', '["They get stronger", "The pedal pulses disappear or diminish", "No change", "They become irregular"]', 1, 'Muscle contraction compresses the artery.'),
    (v_case_id, 'What is the treatment?', '["Stop running", "Surgical release of the compressing muscle/tendon", "Stenting", "Aspirin"]', 1, 'Anatomical correction is required to prevent permanent arterial damage.');

    -- CASE 30: Leriche Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Triad of Aortoiliac Occlusion', 'A 55-year-old male smoker presents with hip/buttock claudication, absent femoral pulses, and impotence (erectile dysfunction).', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this clinical triad called?', '["Leriche Syndrome", "Mirizzi Syndrome", "Whipple Syndrome", "Raynaud Syndrome"]', 0, 'Leriche syndrome is caused by atherosclerotic occlusion of the distal aorta/iliac arteries.'),
    (v_case_id, 'Where is the level of the arterial blockage?', '["Distal aorta and iliac arteries", "Popliteal artery", "Renal artery", "Carotid artery"]', 0, 'The location explains the buttock pain and impotence (internal iliac involvement).'),
    (v_case_id, 'What is the surgical treatment for severe Leriche syndrome?', '["Femoropopliteal bypass", "Aortobifemoral Bypass (ABF)", "Amputation", "Stent the kidney"]', 1, 'ABF bypass is the "gold standard" for extensive aortoiliac disease.');

    RAISE NOTICE 'SUCCESS: Vascular Surgery Case Blocks (1-30) registered.';
END $$;

COMMIT;
