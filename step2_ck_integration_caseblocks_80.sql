-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Clinical Case Integration (Step 2 CK)
-- Topic: Multi-system clinical vignettes
-- Topic Slug: case-vignettes
-- Sourced: UWorld, Step-Up to Medicine, MTB Step 2, First Aid Step 2 CK

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-vignettes' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'case-vignettes';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 50-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: The Rapid Rash and Headache
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapid Rash and Headache', 'A 19-year-old college student is brought to the ER with a severe headache, high fever, and a rapidly spreading rash. He was well 12 hours ago.

Vitals: T 39.8 C, BP 85/50 mmHg, HR 125 bpm, RR 26 bpm.
Physical Examination: Ill-appearing, confused. Neck stiffness and positive Brudzinski sign. The skin shows multiple petechiae and large, dusky purpuric patches (purpura fulminans) on the lower extremities.
Laboratory Results: WBC 22,000 (85% neutrophils, 10% bands). Platelets 45,000. LP shows cloudy fluid with 2,000 neutrophils and Gram-negative diplococci.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely causative organism for this multi-system presentation?', '["Streptococcus pneumoniae","Neisseria meningitidis","Staphylococcus aureus","Haemophilus influenzae"]', 1, 'Neisseria meningitidis is a classic cause of rapid-onset sepsis, meningitis, and purpura fulminans (DIC).'),
        (v_case_id, 'What is the mechanism behind the ''purpura fulminans'' seen in this patient?', '["Direct bacterial invasion of skin cells","Disseminated Intravascular Coagulation (DIC) leading to microvascular thrombosis and hemorrhagic necrosis","Allergic reaction to the fever","Venous insufficiency"]', 1, 'The toxin-induced inflammatory cascade triggers systemic clotting and consumption of coagulation factors.'),
        (v_case_id, 'What is the immediate management priority for this patient?', '["Wait for blood culture results","CT head","Empiric IV antibiotics (e.g., Ceftriaxone and Vancomycin) and aggressive fluid resuscitation","Topical steroids for the rash"]', 2, 'Time is of the essence; antibiotics must be started immediately after (or even before) LP if delayed.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Heart and the Hand
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Heart and the Hand', 'A 65-year-old male with a history of a prosthetic heart valve presents with low-grade fever, weight loss, and ''painful spots'' on his fingertips for 3 days.

Vitals: T 38.1 C, BP 130/80 mmHg.
Physical Examination: A new grade III/VI systolic murmur at the apex. Small, tender, erythematous nodules on the pads of the fingers (Osler nodes). Non-tender, hemorrhagic macules on the palms (Janeway lesions). Splinter hemorrhages in the nails.
Laboratory Results: ESR 85. Blood cultures show growth of Streptococcus viridans in 3 of 3 sets. Echocardiogram shows a 5mm vegetation on the mitral valve.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the immunopathologic mechanism of ''Osler Nodes''?', '["Microemboli of bacteria","Immune complex deposition (Type III hypersensitivity)","Direct fungal infection","Mechanical trauma"]', 1, 'Osler nodes are tender, immunologic phenomena, whereas Janeway lesions are non-tender and embolic.'),
        (v_case_id, 'Which of the following is considered a ''Major'' Duke criterion for the diagnosis of IE?', '["Osler nodes","Fever > 38.0 C","Positive echocardiogram showing vegetation","Janeway lesions"]', 2, 'Duke Major criteria include positive blood cultures (typical organism) and evidence of endocardial involvement (Echo).'),
        (v_case_id, 'The splinter hemorrhages in this patient are caused by which mechanism?', '["Vitamin deficiency","Microemboli from the heart vegetation","Fungal infection","None of the above"]', 1, 'Septic microemboli lodge in the small capillaries of the nail bed.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Target and the Joint
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Target and the Joint', 'A 32-year-old male presents with a large ''bulls-eye'' rash on his leg and a swollen, painful right knee. He went hiking in Connecticut 4 weeks ago.

Vitals: Normal.
Physical Examination: A large (15 cm) annular plaque with central clearing on the thigh (Erythema Migrans). Right knee is swollen, warm, and tender with limited range of motion.
Laboratory Results: Synovial fluid shows WBC 40,000 (neutrophil-predominant) with no crystals or bacteria. Serology for Borrelia burgdorferi is positive.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the vector for the transmission of this disease?', '["Anopheles mosquito","Ixodes tick (Deer tick)","Dermacentor tick","Flea"]', 1, 'Lyme disease is transmitted by the Ixodes scapularis tick.'),
        (v_case_id, 'Which stage of Lyme disease is represented by the swollen knee (arthritis)?', '["Early localized","Early disseminated","Late disseminated","None of the above"]', 2, 'Arthritis is a hallmark of late Lyme disease (months after the initial bite).'),
        (v_case_id, 'What is the treatment of choice for early localized Lyme disease (EM rash) in a non-pregnant adult?', '["Penicillin","Doxycycline","Vancomycin","Acyclovir"]', 1, 'Oral Doxycycline for 10-14 days is the standard treatment.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Copper Penny Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Copper Penny Rash', 'A 28-year-old male presents with a non-itchy rash on his trunk, palms, and soles. He remembers having a painless ''ulcer'' on his penis about 2 months ago that healed on its own.

Vitals: Normal.
Physical Examination: Symmetric, red-brown, maculopapular rash on the trunk and prominent ''copper-penny'' lesions on the palms and soles. Generalized lymphadenopathy (epitrochlear nodes present). Small, flat, moist-appearing gray papules in the perianal area.
Laboratory Results: RPR positive (1:64). FTA-ABS positive.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the name for the moist, gray perianal papules seen in this patient?', '["Condyloma acuminata","Condyloma lata","Molluscum","Hemorrhoids"]', 1, 'Condyloma lata are highly infectious lesions of secondary syphilis. Condyloma acuminata are HPV-induced warts.'),
        (v_case_id, 'The presence of a rash on the palms and soles should strongly raise suspicion for which conditions?', '["Syphilis, Rocky Mountain Spotted Fever, and Coxsackievirus (Hand-Foot-Mouth)","Eczema and Psoriasis","Acne and Rosacea","Tinea and Vitiligo"]', 0, 'This is a classic ''high-yield'' clinical distribution triad.'),
        (v_case_id, 'What is the treatment of choice for secondary syphilis?', '["Oral Azithromycin","IM Penicillin G benzathine (2.4 million units, single dose)","IV Ceftriaxone","Topical Steroids"]', 1, 'Single-dose IM Benzathine Penicillin G is the standard treatment for early syphilis.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Purple Patch and the Cough
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Purple Patch and the Cough', 'A 35-year-old HIV-positive male with a CD4 count of 80 presents with several dark purple, firm patches on his legs and a persistent dry cough.

Vitals: Normal.
Physical Examination: Multiple violaceous, non-blanching nodules and plaques on the lower extremities and hard palate. Lung auscultation is clear.
Laboratory Results: Chest X-ray shows bibasilar infiltrates and pleural effusions. Bronchoscopy shows similar violaceous lesions on the bronchial mucosa.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which virus is the causative agent of Kaposi Sarcoma?', '["HIV","Human Herpesvirus 8 (HHV-8)","EBV","HPV"]', 1, 'While HIV provides the immunosuppressive environment, HHV-8 is the oncogenic driver.'),
        (v_case_id, 'Kaposi sarcoma is a malignancy of which cell type?', '["Keratinocytes","Melanocytes","Vascular endothelial cells","Lymphocytes"]', 2, 'It is an angioproliferative disorder of the vascular endothelium.'),
        (v_case_id, 'What is the first-line management for AIDS-associated Kaposi Sarcoma?', '["Chemotherapy only","Initiation or optimization of Antiretroviral Therapy (ART)","Surgical excision of all lesions","Antibiotics"]', 1, 'Restoring immune function with ART often leads to regression of KS lesions.');

    ---------------------------------------------------------------------------
    -- CASE 06: The Peeling Child
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Peeling Child', 'A 4-year-old child presents with a 5-day history of high fever, red eyes, and a peeling rash on his hands.

Vitals: T 39.5 C.
Physical Examination: Bilateral non-exudative conjunctival injection. Strawberry tongue and cracked red lips. Erythematous, polymorphous rash on the trunk. Edema and erythema of the hands with desquamation (peeling) around the fingernails. Single enlarged cervical lymph node (2 cm).
Laboratory Results: WBC 15,000. Platelets 600,000 (thrombocytosis). ESR 100.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most serious potential complication of this disease?', '["Liver failure","Coronary artery aneurysms","Blindness","Kidney stones"]', 1, 'Kawasaki disease is a medium-vessel vasculitis with a predilection for coronary arteries.'),
        (v_case_id, 'What is the recommended treatment to reduce the risk of the complication mentioned above?', '["High-dose Aspirin and IVIG (Intravenous Immunoglobulin)","Steroids and Ibuprofen","Antibiotics","Acyclovir"]', 0, 'IVIG within the first 10 days significantly reduces the risk of aneurysms.'),
        (v_case_id, 'This patient''s ''Strawberry Tongue'' is also seen in which other pediatric infection?', '["Chickenpox","Scarlet Fever (Group A Strep)","Roseola","Hand-Foot-Mouth"]', 1, 'Scarlet fever also presents with a strawberry tongue and rash, but lacks the conjunctivitis and hand changes of Kawasaki.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Butterfly and the Protein
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Butterfly and the Protein', 'A 26-year-old female presents with a red rash on her cheeks, joint pain in her hands, and swelling of her ankles.

Vitals: BP 150/95 mmHg.
Physical Examination: Malar erythema sparing the nasolabial folds. Swelling and tenderness of the PIP and MCP joints. 2+ pitting edema of the lower legs.
Laboratory Results: UA shows 3+ protein and RBC casts. Positive ANA (1:1280) and low C3/C4 levels.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The combination of malar rash, arthritis, and proteinuria meets how many SLICC criteria for SLE?', '["1","2","3","4 (meets diagnosis)","5"]', 3, 'Malar rash (1), Arthritis (2), Proteinuria (3), and ANA positive (4) satisfy the clinical/immunologic criteria.'),
        (v_case_id, 'What is the significance of the ''RBC casts'' in the urine?', '["Bladder infection","Glomerulonephritis (nephritic syndrome)","Kidney stones","Normal in women"]', 1, 'RBC casts are pathognomonic for glomerular bleeding, indicating active lupus nephritis.'),
        (v_case_id, 'Which antibody is MOST specific for the diagnosis of SLE?', '["ANA","Anti-dsDNA or Anti-Smith","Anti-Ro","Anti-Histone"]', 1, 'While ANA is very sensitive, Anti-dsDNA and Anti-Smith are highly specific for SLE.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Heliotrope and the Weakness
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Heliotrope and the Weakness', 'A 55-year-old male presents with difficulty rising from a chair and a purple rash on his face.

Vitals: Normal.
Physical Examination: Violaceous erythema of the eyelids (heliotrope rash). Red, scaly papules on the knuckles (Gottron papules). Symmetric proximal muscle weakness (3/5) in the deltoids and hip flexors.
Laboratory Results: Elevated CK and Aldolase. CT Chest/Abdomen reveals an irregular mass in the right lung.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Dermatomyositis in an older adult should prompt an immediate evaluation for what?', '["Diabetes","Internal malignancy (Paraneoplastic syndrome)","Vitamin D deficiency","Fungal infection"]', 1, 'About 20-25% of adult dermatomyositis cases are associated with an underlying cancer.'),
        (v_case_id, 'What is the primary site of muscle involvement in dermatomyositis?', '["Distal muscles (hands/feet)","Proximal muscles (shoulders/hips)","Only the face","Smooth muscle of the gut"]', 1, 'DM/PM typically presents with symmetric proximal muscle weakness.'),
        (v_case_id, 'Which specific skin finding is considered ''pathognomonic'' for dermatomyositis?', '["Heliotrope rash","Gottron papules","Malar rash","Psoriasis"]', 1, 'Gottron papules (violaceous papules over the joints) are highly specific for DM.');

    ---------------------------------------------------------------------------
    -- CASE 09: The Hard Skin and the Heartburn
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hard Skin and the Heartburn', 'A 45-year-old woman complains of ''shiny'' skin on her hands, difficulty swallowing solid food, and fingers that turn white in the cold.

Vitals: Normal.
Physical Examination: Tightening and thickening of the skin on the fingers (sclerodactyly). Telangiectasias on the face. Raynaud''s phenomenon in the fingers.
Laboratory Results: Positive Anti-Centromere antibody. Esophageal manometry shows aperistalsis in the lower two-thirds.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''E'' in the CREST mnemonic stand for?', '["Edema","Esophageal dysmotility","Eczema","Erythema"]', 1, 'C-Calcinosis, R-Raynaud''s, E-Esophageal dysmotility, S-Sclerodactyly, T-Telangiectasia.'),
        (v_case_id, 'Which serious vascular complication is most associated with the LIMITED form of systemic sclerosis?', '["Renal crisis","Pulmonary Arterial Hypertension (PAH)","Aortic aneurysm","Stroke"]', 1, 'PAH is a major cause of late mortality in limited disease, whereas Renal Crisis is more common in diffuse disease.'),
        (v_case_id, 'The Anti-Scl-70 (Topoisomerase I) antibody is associated with which form of scleroderma?', '["Limited","Diffuse (associated with pulmonary fibrosis)","Morphea","None"]', 1, 'Anti-Scl-70 is the marker for diffuse systemic sclerosis.');

    ---------------------------------------------------------------------------
    -- CASE 10: The Blood in the Urine and the Nose
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Blood in the Urine and the Nose', 'A 50-year-old male presents with chronic sinusitis, a persistent cough with bloody sputum, and dark-colored urine.

Vitals: BP 160/100 mmHg.
Physical Examination: Crusts and ulcerations in the nasal cavity (saddle-nose deformity). Lung exam shows rales. Pitting edema of the legs.
Laboratory Results: UA shows RBCs and RBC casts. Positive c-ANCA (PR3-ANCA). Biopsy of the lung shows necrotizing granulomatous vasculitis.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which triad of systems is classically involved in GPA?', '["Upper respiratory, Lower respiratory, and Renal","Heart, Brain, and Gut","Skin, Joints, and Eyes","Liver, Spleen, and Bone"]', 0, 'The ''Wegener''s triad'' involves the nasopharynx, lungs, and kidneys.'),
        (v_case_id, 'What is the most characteristic laboratory marker for GPA?', '["p-ANCA","c-ANCA (Anti-proteinase 3)","ANA","Rheumatoid Factor"]', 1, 'c-ANCA is highly sensitive and specific for GPA.'),
        (v_case_id, 'The ''saddle-nose'' deformity is caused by destruction of which structure?', '["Nasal bone","Nasal cartilage","Skin of the nose","Brain"]', 1, 'Chronic granulomatous inflammation destroys the cartilaginous nasal bridge.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Purple Spots on the Child
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Purple Spots on the Child', 'An 8-year-old boy presents with a purple rash on his legs, belly pain, and dark urine following a cold 1 week ago.

Vitals: Normal.
Physical Examination: Palpable purpura on the buttocks and lower extremities. Abdomen is tender. Joint swelling in the ankles.
Laboratory Results: UA shows microscopic hematuria. Platelet count is normal. Biopsy of a skin lesion shows IgA-dominant leukocytoclastic vasculitis.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the key clinical finding that distinguishes HSP from other causes of purpura (like ITP)?', '["The spots are itchy","The purpura are ''palpable'' and occur with a normal platelet count","The patient is old","There is no fever"]', 1, 'HSP is a small-vessel vasculitis; the spots are raised (palpable) because of vessel wall inflammation, not low platelets.'),
        (v_case_id, 'What is the classic tetrad of HSP?', '["Purpura, Arthritis, Abdominal pain, and Renal disease","Fever, Rash, Cough, Diarrhea","Headache, Neck pain, Photophobia, Vomiting","None of the above"]', 0, 'This is the ''classic'' pediatric vasculitis presentation.'),
        (v_case_id, 'Which gastrointestinal emergency is a known complication of HSP in children?', '["Appendicitis","Intussusception","Pyloric stenosis","Volvulus"]', 1, 'Bowel wall edema can act as a lead point for intussusception (usually ileo-ileal).');

    ---------------------------------------------------------------------------
    -- CASE 12: The Sinus, the Asthma, and the Spots
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sinus, the Asthma, and the Spots', 'A 40-year-old male with a long history of severe asthma develops numbness in his left foot and purple spots on his legs.

Vitals: Normal.
Physical Examination: Palpable purpura on the lower limbs. Weakness in dorsiflexion of the left foot (foot drop). Lung exam shows diffuse wheezing.
Laboratory Results: WBC 15,000 with 30% eosinophils (Eosinophilia). Positive p-ANCA (MPO-ANCA). Chest X-ray shows transient pulmonary infiltrates.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''hallmark'' laboratory finding in Churg-Strauss syndrome?', '["Neutrophilia","Peripheral eosinophilia (>10% or absolute count >1500)","High glucose","Low platelets"]', 1, 'Eosinophilia is a diagnostic requirement for EGPA.'),
        (v_case_id, 'The numbness and ''foot drop'' in this patient represent which complication?', '["Stroke","Mononeuritis multiplex (due to vasculitis of the vasa nervorum)","Herniated disc","Muscle strain"]', 1, 'Vasculitis affecting the blood supply to nerves is common in ANCA-associated vasculitides.'),
        (v_case_id, 'Which systemic condition is almost universally present in patients with EGPA?', '["Diabetes","Asthma (often severe or late-onset)","Hypertension","Psoriasis"]', 1, 'EGPA almost always develops in patients with pre-existing asthma and allergic rhinitis.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Mouth Sores and the Belly Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mouth Sores and the Belly Pain', 'A 22-year-old female presents with recurrent, painful mouth ulcers and bloody diarrhea.

Vitals: Normal.
Physical Examination: Multiple aphthous ulcers on the buccal mucosa. Tender, red nodules on the shins (erythema nodosum). Abdominal tenderness.
Laboratory Results: Colonoscopy shows ''skip lesions'' and a ''cobblestone'' appearance of the terminal ileum.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the red, tender nodule on the shins called?', '["Pyoderma gangrenosum","Erythema nodosum","Sweet''s syndrome","Cellulitis"]', 1, 'EN is a septal panniculitis and a common skin finding in IBD and Sarcoidosis.'),
        (v_case_id, 'How does the ''skip lesion'' pattern help distinguish Crohn''s from Ulcerative Colitis (UC)?', '["Crohn''s is continuous; UC skips","Crohn''s involves patchy areas with normal mucosa in between; UC is continuous starting from the rectum","There is no difference","Crohn''s only affects the colon"]', 1, 'Patchy involvement (skip lesions) and transmural inflammation are hallmarks of Crohn''s.'),
        (v_case_id, 'Which skin condition in IBD presents as a painful ulcer with a ''violaceous, undermined'' border?', '["Erythema nodosum","Pyoderma gangrenosum","Acanthosis nigricans","Vitiligo"]', 1, 'PG is the more severe and ulcerative skin manifestation of IBD.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Cough and the Red Eyes
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Cough and the Red Eyes', 'A 30-year-old African American female presents with a dry cough, blurry vision, and red bumps on her shins.

Vitals: Normal.
Physical Examination: Painful, erythematous nodules on the pretibial area. Bilateral redness of the eyes (uveitis). Enlarged, firm parotid glands.
Laboratory Results: Chest X-ray shows bilateral hilar lymphadenopathy. Serum ACE (Angiotensin-Converting Enzyme) level is high. Biopsy of a shin nodule shows non-caseating granulomas.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic histological finding in sarcoidosis?', '["Caseating granulomas","Non-caseating granulomas","Pus-filled abscesses","Acantholysis"]', 1, 'Non-caseating granulomas are the hallmark, distinguishing it from Tuberculosis.'),
        (v_case_id, 'What is the name for the syndrome of fever, uveitis, parotitis, and facial nerve palsy in sarcoidosis?', '["Lofgren Syndrome","Heerfordt Syndrome (Uveoparotid fever)","Sweet Syndrome","CREST"]', 1, 'This is a specific, rare constellation of sarcoid findings.'),
        (v_case_id, 'Lofgren syndrome includes which clinical triad?', '["Erythema nodosum, hilar lymphadenopathy, and polyarthritis","Cough, rash, diarrhea","Fever, headache, stiff neck","None of the above"]', 0, 'Lofgren syndrome is a benign, acute presentation of sarcoidosis.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Velvety Neck and the Weight Loss
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Velvety Neck and the Weight Loss', 'A 60-year-old male notices dark, thick, ''velvety'' skin in his armpits and on the back of his neck. He has also lost 15 lbs unintentionally.

Vitals: Normal.
Physical Examination: Hyperpigmented, velvety plaques in the intertriginous areas (acanthosis nigricans). Multiple sudden-onset seborrheic keratoses on the back (Leser-Trélat sign).
Laboratory Results: Fasting glucose is normal. Abdominal CT shows a mass in the stomach.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'While acanthosis nigricans is often associated with insulin resistance, sudden onset in an older patient with weight loss should suggest:', '["New-onset Diabetes","Internal malignancy (especially Gastric Adenocarcinoma)","Fungal infection","Poor hygiene"]', 1, 'Malignant AN is a paraneoplastic sign.'),
        (v_case_id, 'What is the ''Leser-Trélat sign''?', '["A type of fracture","The sudden appearance of multiple seborrheic keratoses, indicating an underlying malignancy","Red eyes","Clubbing"]', 1, 'Both AN and Leser-Trélat can be triggered by transforming growth factor alpha (TGF-a) from a tumor.'),
        (v_case_id, 'Which hormone is usually responsible for the ''benign'' form of acanthosis nigricans in obese patients?', '["Thyroid hormone","Insulin (binding to IGF-1 receptors on keratinocytes)","Estrogen","Cortisol"]', 1, 'Hyperinsulinemia triggers the growth of keratinocytes and fibroblasts.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Bronze Skin and the High Sugar
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Bronze Skin and the High Sugar', 'A 50-year-old male presents with joint pain, new-onset diabetes, and skin that looks ''permanently tanned''.

Vitals: Normal.
Physical Examination: Generalized hyperpigmentation (bronze skin). Hepatomegaly. Tenderness of the 2nd and 3rd MCP joints.
Laboratory Results: Fasting glucose 180 mg/dL. Ferritin 2,000 ng/mL. Transferrin saturation 85%.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic triad of Hemochromatosis?', '["Cirrhosis, Diabetes, and Hyperpigmentation","Fever, Rash, Joint pain","Anemia, Jaundice, Splenomegaly","None of the above"]', 0, 'This is often referred to as ''Bronze Diabetes''.'),
        (v_case_id, 'What is the genetic defect in the most common form of this disease?', '["CFTR mutation","HFE gene mutation (C282Y)","RB1 mutation","JAK2 mutation"]', 1, 'HFE mutations lead to increased iron absorption in the gut.'),
        (v_case_id, 'What is the first-line treatment for symptomatic hemochromatosis?', '["Iron supplements","Therapeutic phlebotomy","Antibiotics","Liver transplant"]', 1, 'Regularly removing blood reduces the total body iron stores.');

    ---------------------------------------------------------------------------
    -- CASE 17: The Thickened Shin and the Fast Heart
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Thickened Shin and the Fast Heart', 'A 35-year-old female complains of anxiety, weight loss despite increased appetite, and a ''weird thickening'' on her shins.

Vitals: HR 115 bpm (regular), BP 145/70 mmHg.
Physical Examination: Exophthalmos (bulging eyes). Diffuse, non-tender goiter. Non-pitting, orange-peel-like induration on the bilateral pre-tibial areas (pretibial myxedema).
Laboratory Results: TSH < 0.01 (Low), Free T4 High. Positive TSH-receptor antibodies.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Pretibial myxedema (thyroid dermopathy) is most specific for which condition?', '["Hypothyroidism","Graves'' Disease","Iodine deficiency","Thyroid cancer"]', 1, 'While ''myxedema'' usually implies hypo, ''pretibial myxedema'' is a hallmark of Graves'' hyperthyroidism.'),
        (v_case_id, 'What is the mechanism of the skin thickening in this patient?', '["Fat accumulation","Accumulation of glycosaminoglycans (mucin) in the dermis due to fibroblast stimulation","Water retention","Bacterial infection"]', 1, 'The same autoimmune process affecting the eyes (orbitopathy) affects the skin.'),
        (v_case_id, 'Which medication is used to provide symptomatic relief of the tachycardia and tremors in this patient?', '["Methimazole","Propranolol (Beta-blocker)","Radioactive iodine","Levothyroxine"]', 1, 'Beta-blockers manage the adrenergic symptoms of thyrotoxicosis.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Tan in the Winter
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Tan in the Winter', 'A 40-year-old female presents with severe fatigue, weight loss, and darkening of her skin, especially in the creases of her palms and around old scars.

Vitals: BP 90/60 mmHg (orthostatic).
Physical Examination: Diffuse hyperpigmentation. Hyperpigmented palmar creases and buccal mucosa. Sparse axillary and pubic hair.
Laboratory Results: Na+ 130 (Low), K+ 5.5 (High). Morning cortisol is low; ACTH is high.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why does the skin become hyperpigmented in primary adrenal insufficiency?', '["The patient spends more time in the sun","High ACTH levels cross-react with Melanocyte-Stimulating Hormone (MSH) receptors","Liver failure","Low glucose"]', 1, 'ACTH and MSH share a common precursor (POMC); high ACTH stimulates melanocytes.'),
        (v_case_id, 'Would you see hyperpigmentation in SECONDARY adrenal insufficiency (pituitary failure)?', '["Yes","No, because ACTH levels would be low, not high","Only if they have a tumor","Only on the face"]', 1, 'Lack of ACTH in secondary insufficiency means no stimulation of pigment.'),
        (v_case_id, 'The electrolyte pattern (Low Na, High K) suggests a deficiency of which hormone?', '["Cortisol only","Aldosterone","Growth Hormone","Insulin"]', 1, 'Aldosterone normally saves sodium and excretes potassium; its absence leads to this pattern.');

    ---------------------------------------------------------------------------
    -- CASE 19: The Purple Striae
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Purple Striae', 'A 30-year-old female presents with weight gain, a ''round face'', and large purple ''stretch marks'' on her belly.

Vitals: BP 165/105 mmHg.
Physical Examination: Central obesity with thin limbs. Moon facies and a ''buffalo hump''. Wide (>1 cm), violaceous striae on the abdomen. Multiple bruises with minimal trauma.
Laboratory Results: 24-hour urinary free cortisol is high. High-dose dexamethasone suppression test fails to suppress cortisol. ACTH is low.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the difference between Cushing ''Syndrome'' and Cushing ''Disease''?', '["They are synonyms","Syndrome is the clinical state of high cortisol; Disease specifically refers to a pituitary ACTH-secreting tumor","Disease is worse","Syndrome is only from steroids"]', 1, 'This is a key nomenclature distinction in Step 2 CK.'),
        (v_case_id, 'The ''purple striae'' in Cushing''s are caused by:', '["Rapid weight gain stretching the skin","Cortisol-induced inhibition of collagen synthesis leading to dermal thinning and visible blood vessels","Bacterial infection","Allergy"]', 1, 'Cortisol is catabolic to skin collagen.'),
        (v_case_id, 'What is the most likely source of cortisol in this patient given the low ACTH?', '["Pituitary tumor","Exogenous steroids or an Adrenal tumor","Small cell lung cancer","Thyroid tumor"]', 1, 'Low ACTH indicates that the source of cortisol is independent of the pituitary (Adrenal or Exogenous).');

    ---------------------------------------------------------------------------
    -- CASE 20: The Lumpy Face and the Seizures
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Lumpy Face and the Seizures', 'A 12-year-old boy presents for a school physical. His mother mentions he has had ''difficulty focusing'' and occasional ''staring spells''.

Vitals: Normal.
Physical Examination: Small, flesh-colored-to-pink papules in a malar distribution on the face (angiofibromas). A patch of thick, dimpled skin on the lower back (shagreen patch). Several hypopigmented, leaf-shaped macules (ash-leaf spots) on the trunk.
Laboratory Results: Brain MRI shows subependymal nodules.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the name for the ''leaf-shaped'' white spots in TSC?', '["Vitiligo","Ash-leaf spots","Shagreen patch","Cafe-au-lait spots"]', 1, 'These are often the earliest visible sign of TSC.'),
        (v_case_id, 'Which cardiac tumor is most associated with infants who have TSC?', '["Myxoma","Rhabdomyoma","Sarcoma","Fibroma"]', 1, 'Cardiac rhabdomyomas often regress spontaneously but are a major clue in infancy.'),
        (v_case_id, 'What is the classic clinical triad of Tuberous Sclerosis (Vogt triad)?', '["Seizures, Intellectual disability, and Adenoma sebaceum (Angiofibromas)","Fever, rash, joint pain","Cough, rash, diarrhea","None of the above"]', 0, 'Though only 30% of patients have all three, it is a classic Step 2 description.');

    ---------------------------------------------------------------------------
    -- CASE 21: The Cafe-au-Lait and the Bumps
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Cafe-au-Lait and the Bumps', 'A 20-year-old male presents with multiple brown spots on his skin and soft, fleshy bumps that have been increasing in number.

Vitals: Normal.
Physical Examination: >6 light-brown, oval macules (cafe-au-lait spots). Hundreds of soft, pedunculated skin-colored papules (neurofibromas). Freckling in the armpits (axillary freckling/Lisch sign).
Laboratory Results: Eye exam shows pigmented hamartomas on the iris (Lisch nodules).', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the genetic inheritance pattern of NF1?', '["Autosomal Recessive","Autosomal Dominant","X-linked","Mitochondrial"]', 1, 'NF1 is autosomal dominant, with about 50% of cases being de novo mutations.'),
        (v_case_id, 'What is ''Crowe sign'' in the context of NF1?', '["Lisch nodules","Axillary or inguinal freckling","Neurofibromas","Optic glioma"]', 1, 'Crowe sign refers to freckling in non-sun-exposed intertriginous areas.'),
        (v_case_id, 'NF1 is caused by a mutation in a gene on which chromosome?', '["13","17","22","X"]', 1, 'NF1 = 17 letters/Chromosome 17. NF2 = Chromosome 22.');

    ---------------------------------------------------------------------------
    -- CASE 22: The Port-Wine Stain and the Seizures
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Port-Wine Stain and the Seizures', 'An infant is born with a large, flat, purple-red patch covering the left side of his face, including the eyelid.

Vitals: Normal.
Physical Examination: Port-wine stain (nevus flammeus) in the V1/V2 distribution of the trigeminal nerve. The ophthalmology exam shows increased intraocular pressure (glaucoma) in the left eye.
Laboratory Results: Head CT shows ''tram-track'' calcifications in the left cerebral cortex.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the underlying vascular abnormality in Sturge-Weber?', '["Capillary malformation of the skin and leptomeningeal angiomatosis","Venous thrombosis","Arterial aneurysm","None of the above"]', 0, 'It is a phakomatosis involving skin and brain capillaries.'),
        (v_case_id, 'Why is the distribution of the port-wine stain critical for the diagnosis?', '["Only stains in the V1/V2 distribution carry a significant risk of associated brain involvement","It doesn''t matter","It must be on the legs","It must be blue"]', 0, 'Specifically, involvement of the upper eyelid (V1 area) is the highest risk factor.'),
        (v_case_id, 'Which complication is common on the same side as the port-wine stain?', '["Deafness","Glaucoma and Seizures","Limb overgrowth","Liver failure"]', 1, 'Ipsilateral glaucoma and contralateral seizures/hemiparesis are classic features.');

    ---------------------------------------------------------------------------
    -- CASE 23: The Nosebleed and the Red Spots
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Nosebleed and the Red Spots', 'A 40-year-old male presents with recurrent nosebleeds (epistaxis) and several small red spots on his lips and tongue.

Vitals: Normal.
Physical Examination: Multiple 1-2 mm telangiectasias on the lips, tongue, and fingertips. He also has clubbing of the fingers.
Laboratory Results: Hemoglobin 18 g/dL (Polycythemia). Chest X-ray shows a well-circumscribed nodule in the right lung. Pulse oximetry is 88%.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of the polycythemia and low oxygen saturation in this patient?', '["Smoking","Pulmonary Arteriovenous Malformations (AVMs) causing right-to-left shunting","Dehydration","High altitude"]', 1, 'AVMs in the lung allow blood to bypass gas exchange, leading to chronic hypoxemia and secondary polycythemia.'),
        (v_case_id, 'HHT is an autosomal dominant disorder of which system?', '["Coagulation factors","Vascular wall integrity and angiogenesis","Platelet function","Red blood cell enzymes"]', 1, 'It leads to the formation of fragile telangiectasias and AVMs.'),
        (v_case_id, 'Patients with HHT are at an increased risk of ''paradoxical'' brain abscesses. Why?', '["Poor immune system","Bacteria from the venous system bypass the capillary filter of the lungs through a pulmonary AVM","The nosebleeds let bacteria in","Direct spread from the ears"]', 1, 'The lung capillaries normally filter out small septic emboli; AVMs create a bypass to the brain.');

    ---------------------------------------------------------------------------
    -- CASE 24: The Mouth Spots and the Bowel Obstruction
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mouth Spots and the Bowel Obstruction', 'A 15-year-old boy presents with dark spots on his lips and severe abdominal pain.

Vitals: Normal.
Physical Examination: Multiple brown macules (freckle-like) on the lips and oral mucosa. Abdomen is distended with decreased bowel sounds.
Laboratory Results: X-ray shows multiple dilated loops of small bowel. Colonoscopy reveals numerous hamartomatous polyps.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the hallmark combination of Peutz-Jeghers Syndrome?', '["Mucocutaneous hyperpigmentation and GI hamartomatous polyps","Skin cancer and polyps","Diabetes and freckles","Obesity and warts"]', 0, 'The lentigines on the lips and polyps in the gut define the syndrome.'),
        (v_case_id, 'What is the most likely cause of the acute abdominal pain in this patient?', '["Appendicitis","Intussusception (with a polyp acting as a lead point)","Food poisoning","Ulcer"]', 1, 'The large hamartomatous polyps frequently trigger intussusception.'),
        (v_case_id, 'Peutz-Jeghers syndrome is associated with an increased risk of which cancers?', '["Colorectal, Pancreatic, Breast, and Ovarian cancers","Only skin cancer","Brain cancer only","None"]', 0, 'Surveillance for multiple internal malignancies is required.');

    ---------------------------------------------------------------------------
    -- CASE 25: The Bone Cysts and the Skin Spots
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Bone Cysts and the Skin Spots', 'A 10-year-old girl presents with early onset of menses (precocious puberty) and several large, irregular brown spots on her back.

Vitals: Normal.
Physical Examination: Large, ''jagged-edged'' cafe-au-lait patches (Coast of Maine) that do not cross the midline. Prominent breasts (Tanner stage 3).
Laboratory Results: X-ray of the femur shows multiple cystic lesions (polyostotic fibrous dysplasia).', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic triad of McCune-Albright Syndrome?', '["Precocious puberty, Fibrous dysplasia of bone, and Cafe-au-lait spots","Fever, rash, joint pain","Anemia, jaundice, bone pain","Seizures, spots, tumors"]', 0, 'This is a sporadic disorder caused by a G-protein signaling mutation (GNAS).'),
        (v_case_id, 'How do the cafe-au-lait spots of McCune-Albright differ from those of NF1?', '["NF1 are smaller","McCune-Albright spots are larger, irregular, ''jagged'' (Coast of Maine), and typically follow Blaschko lines or respect the midline; NF1 are smooth (Coast of California)","There is no difference","McCune-Albright spots are blue"]', 1, 'The ''Coast of Maine'' vs ''Coast of California'' description is a classic Step 2 CK pearl.'),
        (v_case_id, 'Is McCune-Albright syndrome inherited from parents?', '["Yes, Autosomal Dominant","No, it is caused by a somatic mosaic mutation that occurs after fertilization","Yes, Autosomal Recessive","Only from the mother"]', 1, 'If the mutation were germline (inherited), it would be lethal.');

    ---------------------------------------------------------------------------
    -- CASE 26: The Drug, the Fever, and the Eosinophils
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Drug, the Fever, and the Eosinophils', 'A 45-year-old male was started on Allopurinol for gout 4 weeks ago. He now presents with a high fever, a widespread rash, and swelling of his face.

Vitals: T 39.2 C, BP 110/70 mmHg.
Physical Examination: Diffuse erythematous maculopapular rash covering 80% of the body. Facial edema. Generalized lymphadenopathy. Liver is tender to palpation.
Laboratory Results: WBC 18,000 with 15% eosinophils. ALT 450, AST 380 (Elevated). Cr 1.8 (Baseline 1.0).', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the characteristic latency period between starting a drug and the onset of DRESS?', '["1-3 days","2-8 weeks","6 months","1 year"]', 1, 'DRESS has a much longer latency than simple morbilliform rashes or SJS.'),
        (v_case_id, 'Which systemic organ is MOST commonly involved in DRESS?', '["Lungs","Liver (Hepatitis)","Heart","Pancreas"]', 1, 'Hepatitis is the most frequent systemic manifestation of DRESS.'),
        (v_case_id, 'Besides Allopurinol, which drug class is a frequent trigger for DRESS?', '["Anticonvulsants (e.g., Phenytoin, Carbamazepine)","Antibiotics (Penicillins)","Aspirin","Statins"]', 0, 'Anticonvulsants and sulfonamides are common culprits.');

    ---------------------------------------------------------------------------
    -- CASE 27: The Sloughed Skin and the Mucosal Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sloughed Skin and the Mucosal Pain', 'A 30-year-old female presents with a painful rash and peeling skin 10 days after starting Sulfamethoxazole-Trimethoprim for a UTI.

Vitals: T 38.5 C, BP 100/60 mmHg.
Physical Examination: Diffuse dusky-red macules that are beginning to coalesce. Two areas of the back show large sheets of skin peeling off. Positive Nikolsky sign. Severe erosions on the lips and conjunctiva. Approximately 25% of the total body surface area (TBSA) is denuded.
Laboratory Results: None.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How is the diagnosis categorized based on the percentage of skin detachment (TBSA)?', '["SJS < 10%; SJS/TEN Overlap 10-30%; TEN > 30%","SJS < 30%; TEN > 30%","SJS = only mouth; TEN = whole body","None of the above"]', 0, 'This is the standard classification based on epidermal detachment.'),
        (v_case_id, 'What is the primary histological finding in SJS/TEN?', '["Acantholysis","Full-thickness epidermal necrosis","Subcutaneous fat inflammation","Bacterial invasion"]', 1, 'Extensive apoptosis of keratinocytes leads to the sloughing.'),
        (v_case_id, 'What is the most important initial management step for this patient?', '["High-dose steroids","IV Antibiotics","Discontinuation of the offending drug and transfer to a burn unit for supportive care","Surgical debridement"]', 2, 'Immediate removal of the trigger and intensive supportive care (fluid/electrolyte management) are life-saving.');

    ---------------------------------------------------------------------------
    -- CASE 28: The Itch and the Yellow Eyes
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itch and the Yellow Eyes', 'A 28-year-old female in her third trimester of pregnancy presents with intense itching that is worse on her palms and soles. She has no visible rash.

Vitals: Normal.
Physical Examination: Scleral icterus. Multiple excoriations on the limbs from scratching. No primary skin lesions.
Laboratory Results: Elevated serum bile acids (45 µmol/L). Mildly elevated ALT/AST and Bilirubin.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the hallmark symptom of ICP?', '["Painful blisters","Severe pruritus (itching) involving the palms and soles, usually in the 3rd trimester","Cough","Headache"]', 1, 'The ''palms and soles'' distribution is a classic clue for ICP.'),
        (v_case_id, 'What is the main risk associated with ICP?', '["Maternal liver failure","Fetal complications (preterm birth, meconium staining, intrauterine fetal demise)","Maternal skin scarring","Diabetes"]', 1, 'High bile acids are toxic to the fetus, necessitating close monitoring and often early delivery.'),
        (v_case_id, 'What is the first-line medication used to treat ICP and reduce bile acids?', '["Diphenhydramine","Ursodeoxycholic acid (Ursodiol)","Topical steroids","Aspirin"]', 1, 'Ursodiol improves bile flow and reduces symptoms/fetal risk.');

    ---------------------------------------------------------------------------
    -- CASE 29: The Red-Man and the Vancomycin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red-Man and the Vancomycin', 'A patient being treated for MRSA bacteremia develops sudden flushing, redness, and itching of the face, neck, and upper chest during an IV infusion.

Vitals: BP 115/75 mmHg (Stable).
Physical Examination: Intense erythema on the upper body. No hives (urticaria) or swelling of the lips.
Laboratory Results: None.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of this reaction?', '["IgE-mediated Type I hypersensitivity","Direct, non-immunologic release of histamine from mast cells","Toxic epidermal necrolysis","Bacterial lysis"]', 1, 'This is a ''pseudoallergic'' reaction, not a true IgE-mediated allergy.'),
        (v_case_id, 'How can this reaction be prevented or managed?', '["Stop the drug forever","Slow the rate of the vancomycin infusion and pre-treat with antihistamines","Give high-dose steroids","Switch to Penicillin"]', 1, 'The reaction is rate-dependent. Infusing over 60+ minutes usually prevents it.'),
        (v_case_id, 'If the patient also had hypotension, wheezing, and hives, what would the diagnosis be?', '["Still Red-Man syndrome","Anaphylaxis","SJS","Anxiety"]', 1, 'Hypotension and wheezing indicate a systemic IgE-mediated response (Anaphylaxis).');

    ---------------------------------------------------------------------------
    -- CASE 30: The Confusion and the Petechiae
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Confusion and the Petechiae', 'A 22-year-old male is admitted after a femur fracture from a motorcycle accident. Two days later, he becomes suddenly confused and short of breath.

Vitals: T 38.2 C, HR 110, RR 28, O2 Sat 88%.
Physical Examination: Confused and agitated. Scattered petechiae on the chest and axillae. Lung exam shows bilateral crackles.
Laboratory Results: Chest X-ray shows diffuse bilateral infiltrates.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic triad of Fat Embolism Syndrome?', '["Hypoxemia, Neurologic abnormalities, and Petechial rash","Fever, rash, joint pain","Tachycardia, Hypotension, Muffled heart sounds","None of the above"]', 0, 'The petechial rash (usually upper body) is a very specific but transient sign.'),
        (v_case_id, 'What is the most common trigger for this syndrome?', '["Bedrest","Long bone fractures (e.g., femur, pelvis)","Skin infection","Pneumonia"]', 1, 'Fat droplets from the bone marrow enter the venous circulation.'),
        (v_case_id, 'How is Fat Embolism Syndrome primarily managed?', '["Heparin","Supportive care (Oxygen, mechanical ventilation if needed)","IV Antibiotics","Surgical removal of the fat"]', 1, 'There is no specific ''clot-buster'' for fat; treatment is purely supportive until it resolves.');

    ---------------------------------------------------------------------------
    -- CASE 31: The Purple Toes and the Stent
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Purple Toes and the Stent', 'An 80-year-old male with severe atherosclerosis undergoes an urgent cardiac catheterization. Three days later, he develops painful, blue-purple toes and livedo reticularis on his legs.

Vitals: BP 160/95 mmHg.
Physical Examination: ''Blue toes'' (cyanosis) with palpable pulses. Livedo reticularis (lace-like rash) on the thighs. Hollenhorst plaques seen on fundoscopy.
Laboratory Results: Eosinophilia and Eosinophiluria. Cr 3.2 (Baseline 1.1).', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the typical trigger for Cholesterol Embolism?', '["Sitting too long","Invasive vascular procedures (e.g., catheterization, surgery) or anticoagulation","A fall","Drinking too much water"]', 1, 'The procedure mechanically dislodges cholesterol plaques from the aorta.'),
        (v_case_id, 'What is the classic renal finding on biopsy for this condition?', '["RBC casts","Biconvex, needle-shaped ''cholesterol clefts'' within small arteries","Normal kidneys","Bacteria"]', 1, 'The cholesterol crystals dissolve during processing, leaving ''clefts''.'),
        (v_case_id, 'Why are the pedal pulses usually ''palpable'' in these patients?', '["They aren''t","The emboli are tiny and lodge in the microvasculature (arterioles) distal to the large palpable arteries","The patient has high blood pressure","None of the above"]', 1, 'This distinguishes atheroembolism from a large-vessel acute arterial occlusion (where pulses would be absent).');

    ---------------------------------------------------------------------------
    -- CASE 32: The Stiff Skin and the MRI
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Stiff Skin and the MRI', 'A patient with end-stage renal disease (ESRD) on dialysis underwent an MRI of the brain with gadolinium 2 weeks ago. He now presents with ''woody'', painful thickening of the skin on his limbs.

Vitals: Normal.
Physical Examination: Symmetric, indurated, ''bound-down'' plaques on the extremities. The face is spared. He has difficulty moving his joints due to the skin''s stiffness.
Laboratory Results: GFR 10 mL/min.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'NSF is strongly linked to the use of which contrast agent in patients with renal failure?', '["Iodine","Gadolinium-based contrast","Barium","Air"]', 1, 'Free gadolinium ions trigger a massive fibrotic response in predisposed patients.'),
        (v_case_id, 'How does NSF differ from systemic sclerosis (scleroderma)?', '["NSF characteristically spares the face and does NOT have Raynaud''s phenomenon","NSF is on the face","NSF is not painful","They are the same"]', 0, 'The clinical distribution and lack of Raynaud''s are key differences.'),
        (v_case_id, 'What is the best way to prevent NSF?', '["Drinking water","Avoiding gadolinium contrast in patients with GFR < 30 mL/min","Taking steroids","None"]', 1, 'Prevention is critical as there is no effective treatment for advanced NSF.');

    ---------------------------------------------------------------------------
    -- CASE 33: The Painful Skin and the Dialysis
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Skin and the Dialysis', 'A 60-year-old female with ESRD presents with extremely painful, purple patches on her thighs that are beginning to turn into black, necrotic ulcers.

Vitals: Normal.
Physical Examination: Retiform (stellate) purpura and large necrotic ulcers with a firm, lumpy texture on palpation. Very tender.
Laboratory Results: Cr 8.0. Ca 10.5, Phos 7.2 (High Ca x Phos product). PTH is markedly elevated.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the underlying pathology of calciphylaxis?', '["Infection","Calcification of the tunica media of small dermohypodermal arteries, leading to ischemia and necrosis","Vasculitis","Low calcium"]', 1, 'Vessel calcification ''chokes'' the blood supply to the skin.'),
        (v_case_id, 'Which lab abnormality is a major risk factor for calciphylaxis?', '["Anemia","High Calcium-Phosphate product and Secondary/Tertiary Hyperparathyroidism","Low potassium","High glucose"]', 1, 'Mineral bone disease in ESRD drives the calcification process.'),
        (v_case_id, 'What is the prognosis for patients with ulcerated calciphylaxis?', '["Excellent","Poor (high mortality due to sepsis from infected ulcers)","It resolves with moisturizers","Good with surgery"]', 1, 'Calciphylaxis is a devastating condition with a 1-year mortality rate of >50%.');

    ---------------------------------------------------------------------------
    -- CASE 34: The Smoker, the Weight Loss, and the Red Migrating Spots
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Smoker, the Weight Loss, and the Red Migrating Spots', 'A 68-year-old male with a 50-pack-year smoking history presents with ''red cords'' on his legs that seem to move from one place to another over weeks.

Vitals: Normal.
Physical Examination: Linear, tender, erythematous nodules following the course of superficial veins. The lesions resolve in one area and appear in another (migratory thrombophlebitis).
Laboratory Results: CBC shows mild anemia. CT Abdomen shows a mass in the head of the pancreas.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Trousseau syndrome is a paraneoplastic manifestation of which type of cancer?', '["Skin cancer","Visceral malignancy (especially Pancreatic Adenocarcinoma)","Brain tumor","Leukemia"]', 1, 'The cancer secretes procoagulants that cause recurrent superficial clots.'),
        (v_case_id, 'What is the name for this sign?', '["Trousseau sign of malignancy","Homans sign","Nikolsky sign","Darier sign"]', 0, 'Not to be confused with the Trousseau sign of hypocalcemia (carpal spasm).'),
        (v_case_id, 'What is the treatment for the underlying cause of these spots?', '["Antibiotics","Treatment of the underlying malignancy and Low Molecular Weight Heparin (LMWH)","Warfarin","Aspirin"]', 1, 'LMWH is the preferred anticoagulant in cancer-associated thrombosis.');

    ---------------------------------------------------------------------------
    -- CASE 35: The Itchy Patient and the High WBC
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Patient and the High WBC', 'A 70-year-old male presents with generalized redness and scaling of his entire skin surface (erythroderma). He also has enlarged lymph nodes and severe itching.

Vitals: Normal.
Physical Examination: 95% of the body surface is red and scaly (exfoliative dermatitis). Thickened, hyperkeratotic palms and soles (keratoderma).
Laboratory Results: WBC 25,000. Peripheral blood smear shows ''Sezary cells'' (lymphocytes with cerebriform nuclei).', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Sezary Syndrome?', '["A fungal infection","The leukemic (systemic) phase of Mycosis Fungoides (Cutaneous T-cell Lymphoma)","A type of eczema","A viral rash"]', 1, 'It is defined by erythroderma, lymphadenopathy, and circulating malignant T-cells.'),
        (v_case_id, 'What does a ''cerebriform'' nucleus look like?', '["A circle","Brain-like, with multiple folds and indentations","A star","A square"]', 1, 'This is a pathognomonic finding on the blood smear.'),
        (v_case_id, 'What is the term for a patient with >90% body surface area involvement of any skin rash?', '["Urticaria","Erythroderma (Exfoliative dermatitis)","Psoriasis","Vitiligo"]', 1, 'Erythroderma is a dermatologic emergency that can lead to high-output heart failure and thermoregulatory issues.');

    ---------------------------------------------------------------------------
    -- CASE 36: The Diabetic and the Necrotic Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Diabetic and the Necrotic Rash', 'A 55-year-old female with a history of weight loss and mild diabetes presents with a painful, ''angry'' rash on her groin and legs.

Vitals: Normal.
Physical Examination: Erythematous patches with central blistering and erosion. The border is scaly and ''migrating'' (necrolytic migratory erythema). She also has a smooth, red tongue (glossitis).
Laboratory Results: Glucagon level is 1,200 pg/mL (extremely high). CT shows a mass in the tail of the pancreas.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic skin rash associated with Glucagonoma?', '["Acanthosis nigricans","Necrolytic Migratory Erythema (NME)","Pyoderma gangrenosum","Sweet''s syndrome"]', 1, 'NME is the hallmark paraneoplastic sign of this tumor.'),
        (v_case_id, 'What are the ''4 D''s'' of Glucagonoma?', '["Diabetes, Dermatosis (NME), Depression, and Decline (weight loss)","Dizziness, Diarrhea, Deafness, Death","None of the above","Doughy skin, Dementia, Death, Dryness"]', 0, 'This mnemonic helps remember the systemic presentation.'),
        (v_case_id, 'Where is the glucagonoma tumor typically located in the pancreas?', '["Head","Body/Tail","Duct","Ampulla"]', 1, 'Islet cell tumors are more common in the body and tail.');

    ---------------------------------------------------------------------------
    -- CASE 37: The Blue Gums and the Lead
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Blue Gums and the Lead', 'A 30-year-old construction worker presents with abdominal pain, constipation, and ''pins and needles'' in his hands.

Vitals: Normal.
Physical Examination: A bluish-gray line along the margin of the gums (Burton''s line). Weakness in wrist extension (wrist drop).
Laboratory Results: Microcytic anemia. Peripheral smear shows ''basophilic stippling'' of the RBCs. Elevated Lead level.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is ''Burton''s line''?', '["A scar","A dark line on the gums caused by reaction of lead with oral bacteria","A type of rash","A sign of cancer"]', 1, 'It is a characteristic finding of chronic lead poisoning.'),
        (v_case_id, 'What is the classic hematologic finding on the blood smear for lead poisoning?', '["Target cells","Basophilic stippling","Howell-Jolly bodies","Schistocytes"]', 1, 'Lead inhibits an enzyme (pyrimidine 5''-nucleotidase) leading to ribosomes clumping in the RBCs.'),
        (v_case_id, 'What is the first-line chelation therapy for SEVERE lead poisoning in an adult?', '["Iron","EDTA or Succimer","Penicillin","Activated charcoal"]', 1, 'Chelating agents bind the lead to allow for excretion.');

    ---------------------------------------------------------------------------
    -- CASE 38: The Red Urine and the Sun Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red Urine and the Sun Blisters', 'A 50-year-old male with Hepatitis C notices that every time he spends a day in the sun, he gets small blisters on the back of his hands that heal with scars.

Vitals: Normal.
Physical Examination: Small vesicles, bullae, and erosions on the dorsal hands. Milia (tiny white cysts) and hyperpigmentation in the same areas. Facial hair is increased (hypertrichosis).
Laboratory Results: Elevated ALT/AST. Urine fluoresces coral-red under a Wood''s lamp.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the enzyme deficiency in PCT?', '["Uroporphyrinogen decarboxylase (UROD)","PPOX","HMBS","ALAS"]', 0, 'Deficiency of UROD leads to accumulation of uroporphyrins.'),
        (v_case_id, 'PCT is strongly associated with which chronic infection?', '["HIV","Hepatitis C","Syphilis","Tuberculosis"]', 1, 'Alcohol and iron overload are also common triggers.'),
        (v_case_id, 'What is the first-line treatment for PCT to reduce iron and porphyrin levels?', '["Steroids","Phlebotomy or low-dose Hydroxychloroquine","Antibiotics","Surgical skin graft"]', 1, 'Phlebotomy reduces iron, which is a cofactor for the dysfunctional enzyme.');

    ---------------------------------------------------------------------------
    -- CASE 39: The Itchy Diver
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Diver', 'A 40-year-old male develops an intensely itchy, red, ''winding'' rash on his foot after walking barefoot on a beach in the Caribbean.

Vitals: Normal.
Physical Examination: A serpiginous, erythematous, raised track that has moved about 2 cm since yesterday.
Laboratory Results: None.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common cause of Cutaneous Larva Migrans?', '["Human hookworm","Dog or cat hookworm (Ancylostoma braziliense)","Tapeworm","Pinworm"]', 1, 'The larvae cannot complete their life cycle in humans and wander aimlessly in the skin.'),
        (v_case_id, 'How does the larva enter the skin?', '["Ingestion","Direct penetration through intact skin from contaminated sand or soil","Insect bite","Breathing in dust"]', 1, 'Walking barefoot on beaches with dog/cat feces is the classic history.'),
        (v_case_id, 'What is the treatment for this condition?', '["Surgery to cut out the track","Oral Ivermectin or Albendazole","Topical antifungals","Antibiotics"]', 1, 'Anti-helminthics are highly effective.');

    ---------------------------------------------------------------------------
    -- CASE 40: The Sudden Hair Loss and the Stress
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Hair Loss and the Stress', 'A 30-year-old female presents with dramatic hair loss. She says her hair is ''falling out in handfuls'' every time she brushes it. She had a major surgery 3 months ago.

Vitals: Normal.
Physical Examination: Diffuse thinning of the scalp hair. A ''hair pull test'' yields >10 hairs from multiple sites. No inflammation or bald patches.
Laboratory Results: CBC and TSH are normal.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the pathophysiology of Telogen Effluvium?', '["Fungus eating the hair","A physiological stressor causes a large percentage of hair follicles to shift prematurely into the resting (telogen) phase","Autoimmune destruction","Vitamin D toxicity"]', 1, 'The hair falls out when the new hair starts growing, usually 3-4 months after the stressor.'),
        (v_case_id, 'Common triggers for Telogen Effluvium include:', '["Major surgery, pregnancy/childbirth, severe illness, or extreme weight loss","Drinking too much water","Sunlight","Reading too much"]', 0, 'Significant systemic stressors are the usual cause.'),
        (v_case_id, 'What is the prognosis?', '["Permanent baldness","Excellent (most cases resolve spontaneously within 6-12 months once the stressor is removed)","Requires a transplant","Requires lifelong medication"]', 1, 'It is a temporary, self-limited process.');

    ---------------------------------------------------------------------------
    -- CASE 41: The Thick Nails and the Smokers
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Thick Nails and the Smokers', 'A 65-year-old male with COPD has extremely thick, yellow, curved nails and swelling in both legs.

Vitals: RR 22, O2 Sat 92%.
Physical Examination: All 20 nails are thickened, yellowish-green, and slow-growing. Non-pitting edema of the lower legs. Breath sounds are decreased with wheezing.
Laboratory Results: Chest X-ray shows hyperinflation and a pleural effusion.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic triad of Yellow Nail Syndrome?', '["Yellow nails, Lymphedema, and Respiratory disease (e.g., pleural effusion, bronchiectasis)","Fever, rash, joint pain","Diabetes, jaundice, rash","None of the above"]', 0, 'This is a rare but high-yield multi-system syndrome.'),
        (v_case_id, 'What is the suspected underlying cause of the edema and nail changes?', '["Fungal infection","Impaired lymphatic drainage","Heart failure","Protein deficiency"]', 1, 'Sluggish lymphatics cause the color and the fluid buildup.'),
        (v_case_id, 'Do the nails typically have cuticles in this condition?', '["Yes","No, loss of the cuticle is a characteristic feature","Only on the feet","Only in women"]', 1, 'The cuticle is often absent.');

    ---------------------------------------------------------------------------
    -- CASE 42: The Itchy Feet and the Hepatitis
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Feet and the Hepatitis', 'A 50-year-old male with chronic Hepatitis C develops very itchy, flat, purple bumps on his shins and white lacy lines in his mouth.

Vitals: Normal.
Physical Examination: Purple, polygonal, planar papules (6 P''s) on the shins. Wickham striae on the buccal mucosa.
Laboratory Results: Elevated Liver Function Tests (LFTs). Positive Hepatitis C RNA.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Lichen Planus is famously associated with which viral infection?', '["HIV","Hepatitis C","Herpes","HPV"]', 1, 'While not all LP patients have Hep C, the association is significant enough to warrant screening in widespread cases.'),
        (v_case_id, 'Which ''P'' is NOT part of the classic Lichen Planus mnemonic?', '["Purple","Polygonal","Painless","Pruritic (Itchy)"]', 2, 'The papules are intensely itchy (pruritic), not painless.'),
        (v_case_id, 'What is the histological hallmark of Lichen Planus?', '["Pus","Saw-tooth pattern of epidermal hyperplasia and interface dermatitis","Bacteria","Cancer cells"]', 1, 'The inflammation ''nibbles'' at the base of the epidermis.');

    ---------------------------------------------------------------------------
    -- CASE 43: The Red Eyes, the Joint Pain, and the Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red Eyes, the Joint Pain, and the Rash', 'A 25-year-old male presents with painful urination, red eyes, and a scaly rash on the soles of his feet. He had a stomach flu 3 weeks ago.

Vitals: T 37.8 C.
Physical Examination: Conjunctivitis. Asymmetric arthritis of the right knee. Scaly, yellowish plaques on the soles (keratoderma blennorrhagicum). Small, painless ulcers on the glans penis (circinate balanitis).
Laboratory Results: Positive HLA-B27.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic ''can''t see, can''t pee, can''t climb a tree'' triad?', '["Uveitis/Conjunctivitis, Urethritis, and Arthritis","Fever, Rash, Diarrhea","Headache, Stiff neck, Vomiting","None of the above"]', 0, 'This refers to the three systems involved in reactive arthritis.'),
        (v_case_id, 'What is the name for the scaly rash on the palms and soles in this condition?', '["Psoriasis","Keratoderma blennorrhagicum","Syphilis","Eczema"]', 1, 'It looks very similar to pustular psoriasis.'),
        (v_case_id, 'Which antecedent infections are most commonly linked to reactive arthritis?', '["Chlamydia or Enteric infections (Salmonella, Shigella, Campylobacter)","Common cold","Strep throat","Fungal infection"]', 0, 'It is an autoimmune reaction following a distant infection.');

    ---------------------------------------------------------------------------
    -- CASE 44: The Flushed Face and the Diarrhea
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Flushed Face and the Diarrhea', 'A 60-year-old female presents with sudden episodes of facial flushing, wheezing, and watery diarrhea.

Vitals: BP 100/60 mmHg, HR 105.
Physical Examination: Diffuse erythema of the face and neck during an episode. A soft systolic murmur of tricuspid regurgitation is heard.
Laboratory Results: Elevated 24-hour urinary 5-HIAA. CT scan shows a mass in the liver and small bowel.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Carcinoid syndrome usually only occurs once the tumor has metastasized to which organ?', '["Brain","Liver (so that the serotonin bypasses the first-pass metabolism)","Lungs","Bones"]', 1, 'If the tumor is in the gut, the liver usually inactivates the hormones before they reach the general circulation.'),
        (v_case_id, 'What is the primary hormone responsible for the symptoms of Carcinoid syndrome?', '["Insulin","Serotonin","Cortisol","Thyroid hormone"]', 1, 'Serotonin causes the diarrhea, flushing, and fibrosis of heart valves.'),
        (v_case_id, 'Which vitamin deficiency can occur in Carcinoid syndrome due to the depletion of Tryptophan?', '["Vitamin B12","Niacin (B3) - leading to Pellagra","Vitamin C","Vitamin D"]', 1, 'Tryptophan is used up to make Serotonin instead of Niacin.');

    ---------------------------------------------------------------------------
    -- CASE 45: The Three D''''s of Pellagra
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Three D''''s of Pellagra', 'A chronic alcoholic presents with a scaly, red rash on his face and hands that looks like a severe sunburn. He also seems confused and has diarrhea.

Vitals: Normal.
Physical Examination: Symmetric, hyperpigmented, scaly rash on the face, neck (''Casal necklace''), and dorsal hands. He is oriented only to person.
Laboratory Results: Mild anemia.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are the ''Three D''s'' of Pellagra?', '["Dementia, Diarrhea, and Dermatitis","Deafness, Dizziness, Death","Dryness, Dullness, Darkness","None of the above"]', 0, 'The fourth ''D'' is Death if left untreated.'),
        (v_case_id, 'What is the ''Casal necklace''?', '["A piece of jewelry","A characteristic dermatitis around the neck in Niacin deficiency","A surgical scar","None of the above"]', 1, 'It is one of the classic signs of Pellagra.'),
        (v_case_id, 'Pellagra can occur in patients with Hartnup disease due to the inability to absorb which amino acid?', '["Leucine","Tryptophan (the precursor to Niacin)","Lysine","Valine"]', 1, 'Tryptophan is required for endogenous niacin synthesis.');

    ---------------------------------------------------------------------------
    -- CASE 46: The Mouth Sores and the Genital Sores
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mouth Sores and the Genital Sores', 'A 25-year-old male of Turkish descent has had recurrent mouth ulcers for years. He now has a painful sore on his scrotum and red, blurry vision.

Vitals: Normal.
Physical Examination: Painful oral ulcers and a deep genital ulcer. Inflammation of the eye (uveitis). A pustule forms at the site of a recent blood draw.
Laboratory Results: Positive Pathergy test.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the name for the skin test where a small needle prick causes a pustule?', '["Nikolsky test","Pathergy test","Patch test","Prick test"]', 1, 'Pathergy is a hallmark of Behcet''s and reflects neutrophilic hyperactivity.'),
        (v_case_id, 'Which systemic complication is the leading cause of death in Behcet''s?', '["Mouth ulcers","Vascular involvement (e.g., aneurysms, pulmonary artery aneurysm rupture)","Blindness","Skin rash"]', 1, 'Behcet''s is a vasculitis that can affect vessels of all sizes.'),
        (v_case_id, 'Is there a specific lab test to diagnose Behcet''s?', '["Yes, the Behcet antibody","No, it is a clinical diagnosis based on the pattern of involvement","ANA","Blood culture"]', 1, 'Diagnosis is based on clinical criteria (Recurrent oral ulcers + 2 others: Genital ulcers, eye lesions, skin lesions, or + pathergy).');

    ---------------------------------------------------------------------------
    -- CASE 47: The Swollen Face and the Drug
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Swollen Face and the Drug', 'A 60-year-old male starts taking Lisinopril for hypertension. Two hours later, his lips and tongue begin to swell rapidly. He has no rash or itching.

Vitals: BP 140/90, HR 85, RR 20.
Physical Examination: Marked edema of the lips, tongue, and eyelids. No urticaria (hives). Lungs are clear.
Laboratory Results: None.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mediator of ACE inhibitor-induced angioedema?', '["Histamine","Bradykinin","Leukotrienes","Serotonin"]', 1, 'ACE normally breaks down bradykinin; inhibitors lead to its accumulation, causing vasodilation and edema.'),
        (v_case_id, 'Why are there no hives (urticaria) in this reaction?', '["The patient is too old","It is not a histamine-mediated (Type I) allergic reaction","Hives are only on the legs","None of the above"]', 1, 'Bradykinin-mediated angioedema is characteristically non-pruritic and lacks urticaria.'),
        (v_case_id, 'If the patient develops airway obstruction, what is the first priority?', '["Epinephrine","Airway management (Intubation or Cricothyrotomy if necessary)","Steroids","Benadryl"]', 1, 'While Epinephrine is used for anaphylaxis, bradykinin-mediated edema may not respond to it, and the airway must be secured.');

    ---------------------------------------------------------------------------
    -- CASE 48: The Fever, the Joint Pain, and the Evanescent Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Fever, the Joint Pain, and the Evanescent Rash', 'A 24-year-old female presents with daily spiking fevers for 2 weeks, severe joint pain, and a salmon-pink rash that comes and goes with the fever.

Vitals: T 39.5 C.
Physical Examination: Salmon-pink maculopapular rash on the trunk. Swelling and tenderness of the wrists and knees. Enlarged spleen and lymph nodes.
Laboratory Results: WBC 20,000 (Neutrophilia). Ferritin 5,000 ng/mL (extremely high). ANA and RF are negative.', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the character of the rash in Still''s disease?', '["Permanent purple patches","Evanescent (fleeting), salmon-pink macules that typically appear during febrile spikes","Itchy blisters","Warts"]', 1, 'The ''evanescent'' nature is a key clinical differentiator.'),
        (v_case_id, 'Which laboratory marker is characteristically extremely elevated in AOSD?', '["Glucose","Ferritin","Cholesterol","Bilirubin"]', 1, 'Hyperferritinemia is a major clue for AOSD.'),
        (v_case_id, 'Is AOSD considered an autoimmune or an autoinflammatory disease?', '["Autoimmune","Autoinflammatory (involving the innate immune system)","Allergy","Infection"]', 1, 'It is often managed with IL-1 inhibitors, reflecting its autoinflammatory nature.');

    ---------------------------------------------------------------------------
    -- CASE 49: The Red Eyes and the Joint Pain (Traps)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red Eyes and the Joint Pain (Traps)', 'A patient presents with a ''strawberry tongue'', red eyes, and a peeling rash. He is 25 years old.

Vitals: T 38.5 C.
Physical Examination: Conjunctivitis, cracked red lips, and a rash on his hands that is starting to peel.
Laboratory Results: RPR positive (1:32).', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'While the symptoms look like Kawasaki disease, why is that diagnosis unlikely in a 25-year-old?', '["Adults don''t get Kawasaki","Kawasaki is almost exclusively a disease of early childhood (90% are < 5 years old)","Adults don''t get fevers","None of the above"]', 1, 'In an adult, systemic symptoms with hand peeling and mucosal changes should prompt a check for Syphilis or TSS.'),
        (v_case_id, 'This case highlights that which infection is ''The Great Mimicker''?', '["Flu","Syphilis","Fungus","HIV"]', 1, 'Syphilis can present with almost any dermatologic pattern.'),
        (v_case_id, 'What is the name for the reaction of fever and worsening rash that can occur after the first dose of Penicillin for syphilis?', '["Anaphylaxis","Jarisch-Herxheimer reaction","SJS","Drug rash"]', 1, 'This is caused by the release of endotoxin-like substances from dying spirochetes.');

    ---------------------------------------------------------------------------
    -- CASE 50: The Sudden Itch and the Pancreas
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Itch and the Pancreas', 'A 75-year-old smoker presents with sudden onset of jaundice and intense, generalized itching. He has lost 20 lbs.

Vitals: Normal.
Physical Examination: Scleral icterus and generalized jaundice. Palpable, non-tender gallbladder (Courvoisier sign). Multiple scratch marks on the skin.
Laboratory Results: Bilirubin 12.0 (High), Alkaline Phosphatase 600 (High).', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of the intense itching in this patient?', '["Dry skin","Accumulation of bile salts in the skin due to obstructive jaundice","Allergy to the cancer","Lice"]', 1, 'Obstructive jaundice from the tumor blocking the common bile duct leads to pruritus.'),
        (v_case_id, 'What is the ''Courvoisier sign''?', '["A type of rash","A palpable, non-tender, enlarged gallbladder in the presence of jaundice, suggesting malignancy","Red eyes","A heart murmur"]', 1, 'This distinguishes malignant obstruction from gallstone obstruction (where the gallbladder is usually scarred and not palpable).'),
        (v_case_id, 'Which marker is most commonly used for monitoring (not diagnosis) of pancreatic cancer?', '["CEA","CA 19-9","AFP","PSA"]', 1, 'CA 19-9 is the classic pancreatic cancer marker.');

    ---------------------------------------------------------------------------
    -- CASE 51: The Apple-Jelly Nose
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Apple-Jelly Nose', 'A 45-year-old male presents with a persistent, dusky red-to-purple plaque on his nose and cheeks that has been slowly growing for a year.

Vitals: Normal.
Physical Examination: Violaceous, indurated plaque on the nose (lupus pernio). Diascopy (pressing a glass slide) reveals an ''apple-jelly'' color. He also has crackles at the lung bases.
Laboratory Results: Serum ACE elevated. Chest X-ray shows interstitial lung disease and bilateral hilar adenopathy.', 51)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is ''Lupus Pernio'' and what does it signify?', '["A form of skin lupus","A skin manifestation of sarcoidosis that is highly associated with chronic pulmonary disease","A fungal infection","Frostbite"]', 1, 'Lupus pernio is a classic ''Step 2'' skin marker for severe, chronic sarcoidosis.'),
        (v_case_id, 'The ''apple-jelly'' appearance on diascopy is characteristic of which pathologic process?', '["Pus","Granulomatous inflammation","Hemorrhage","Edema"]', 1, 'Granulomas appear as translucent yellowish-brown (apple-jelly) when blood is pressed out of the vessels.'),
        (v_case_id, 'Besides the lungs and skin, which organ system involvement in sarcoidosis is a major cause of morbidity/mortality?', '["Muscles","Cardiac (arrhythmias, heart block)","Nails","Hair"]', 1, 'Cardiac sarcoidosis is a high-risk manifestation requiring aggressive monitoring.');

    ---------------------------------------------------------------------------
    -- CASE 52: The Pinch Purpura and the Big Tongue
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pinch Purpura and the Big Tongue', 'A 70-year-old male with a history of multiple myeloma presents with fatigue, a large tongue, and ''easy bruising'' around his eyes.

Vitals: Normal.
Physical Examination: Macroglossia (large tongue) with indentations from teeth. Periorbital purpura (raccoon eyes) that appeared after he rubbed his eyes. Pitting edema of the legs.
Laboratory Results: 24-hour urine shows 4g of protein (Nephrotic range). Echo shows ''speckled'' myocardial appearance.', 52)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of ''pinch purpura'' (raccoon eyes) in amyloidosis?', '["Low platelets","Amyloid deposition in the walls of small blood vessels, making them fragile and prone to rupture with minor trauma","Vitamin K deficiency","Liver failure"]', 1, 'Vascular fragility due to amyloid infiltration is a classic Step 2 CK clue.'),
        (v_case_id, 'The ''speckled'' appearance on echocardiogram suggests what?', '["Normal heart","Restrictive cardiomyopathy due to amyloid infiltration","Viral myocarditis","Pericarditis"]', 1, 'Amyloidosis is a major cause of restrictive cardiomyopathy.'),
        (v_case_id, 'Which stain is used on biopsy to confirm the presence of amyloid?', '["Gram stain","Congo Red (showing apple-green birefringence under polarized light)","H&E only","PAS stain"]', 1, 'This is the ''gold standard'' histological description for amyloid.');

    ---------------------------------------------------------------------------
    -- CASE 53: The Diaper Rash and the Diarrhea
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Diaper Rash and the Diarrhea', 'An 8-month-old infant, recently weaned from breast milk, presents with a severe, weeping rash around the mouth and diaper area, along with persistent diarrhea.

Vitals: Normal.
Physical Examination: Sharply demarcated, erythematous, eroded plaques in the periorificial (mouth, nose, anus) and acral (fingers, toes) areas. Thin hair (alopecia).
Laboratory Results: Low serum zinc level.', 53)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Acrodermatitis enteropathica is caused by a deficiency of which mineral?', '["Iron","Zinc","Copper","Selenium"]', 1, 'It is an inherited or acquired defect in zinc absorption.'),
        (v_case_id, 'Why do symptoms often appear shortly after weaning from breast milk?', '["Breast milk contains a ligand that aids zinc absorption, which is absent in cow''s milk or formula","Allergy to formula","Infection from new foods","None of the above"]', 0, 'Breast milk-associated zinc-binding ligands help maintain levels in infants with the genetic defect.'),
        (v_case_id, 'What is the clinical triad of Acrodermatitis Enteropathica?', '["Dermatitis (acral/periorificial), Alopecia, and Diarrhea","Fever, rash, joint pain","Anemia, jaundice, rash","None of the above"]', 0, 'This triad is highly characteristic of zinc deficiency.');

    ---------------------------------------------------------------------------
    -- CASE 54: The Corkscrew Hairs and Bleeding Gums
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Corkscrew Hairs and Bleeding Gums', 'A 65-year-old male who lives alone and eats primarily tea and toast presents with weakness and ''black and blue'' spots on his legs.

Vitals: Normal.
Physical Examination: Perifollicular hemorrhages (red dots around hair follicles). Coiled or ''corkscrew'' hairs on the shins. Swollen, friable, bleeding gums. Poor wound healing.
Laboratory Results: Hemoglobin 10.5 (Anemia). Coagulation studies (PT/PTT) are normal.', 54)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Vitamin C is a required cofactor for the hydroxylation of which amino acids in collagen synthesis?', '["Lysine and Valine","Proline and Lysine","Alanine and Glycine","None"]', 1, 'Defective collagen leads to blood vessel fragility and poor connective tissue strength.'),
        (v_case_id, 'The ''corkscrew hairs'' are caused by what?', '["Fungus","Defective keratin cross-linking due to abnormal collagen","Heat damage","Genetic trait"]', 1, 'This is a pathognomonic physical finding for Vitamin C deficiency.'),
        (v_case_id, 'Which of the following is NOT a feature of Scurvy?', '["Bleeding gums","Petechiae","Night blindness","Impaired wound healing"]', 2, 'Night blindness is a feature of Vitamin A deficiency.');

    ---------------------------------------------------------------------------
    -- CASE 55: The Night Blindness and the Dry Eyes
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Night Blindness and the Dry Eyes', 'A 5-year-old child from a developing country presents with difficulty seeing at dusk and ''dry, foamy'' spots on the white of his eyes.

Vitals: Normal.
Physical Examination: Generalized dry, scaly skin (phrynoderma). Bitot spots (silver-gray, foamy plaques on the bulbar conjunctiva). Clouding of the cornea.
Laboratory Results: Low serum retinol levels.', 55)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the earliest symptom of Vitamin A deficiency?', '["Dry skin","Night blindness (nyctalopia)","Diarrhea","Cough"]', 1, 'Rhodopsin regeneration in the retina requires Vitamin A.'),
        (v_case_id, 'What are ''Bitot spots''?', '["Cataracts","Foamy keratin debris on the conjunctiva, indicating Vitamin A deficiency","Eye infections","Retinal hemorrhages"]', 1, 'These are a classic clinical sign on physical exam.'),
        (v_case_id, 'Severe Vitamin A deficiency can lead to which irreversible eye condition?', '["Glaucoma","Keratomalacia (corneal melting/softening) and blindness","Myopia","None"]', 1, 'Vitamin A is essential for maintaining the integrity of epithelial surfaces.');

    ---------------------------------------------------------------------------
    -- CASE 56: The Yellow Bumps and the Fat Blood
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Yellow Bumps and the Fat Blood', 'A 30-year-old male with poorly controlled Type 1 Diabetes presents with a sudden eruption of hundreds of small, yellow-pink papules on his buttocks and back.

Vitals: Normal.
Physical Examination: 2-4 mm yellow papules with an erythematous halo (eruptive xanthomas). The serum in his blood draw tube looks ''milky''.
Laboratory Results: Triglycerides 4,500 mg/dL (extremely high). Glucose 450 mg/dL.', 56)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Eruptive xanthomas are most commonly associated with which lipid abnormality?', '["Isolated high LDL","Severe hypertriglyceridemia (>1000 mg/dL)","Low HDL","None"]', 1, 'Chylomicrons or VLDL are taken up by macrophages in the skin when levels are very high.'),
        (v_case_id, 'What is the major systemic risk for a patient with triglycerides > 1,000 mg/dL?', '["Stroke","Acute Pancreatitis","Liver failure","Kidney stones"]', 1, 'Hypertriglyceridemic pancreatitis is a medical emergency.'),
        (v_case_id, 'Which type of xanthoma is most associated with PRIMARY Biliary Cholangitis (PBC)?', '["Eruptive","Tuberous","Planar xanthomas (often in palmar creases)","None"]', 2, 'Planar xanthomas and xanthelasma are common in cholestatic liver diseases.');

    ---------------------------------------------------------------------------
    -- CASE 57: The Achilles Tendon Bump
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Achilles Tendon Bump', 'A 25-year-old male with a family history of ''early heart attacks'' presents with firm, non-tender nodules on his Achilles tendons and knuckles.

Vitals: Normal.
Physical Examination: Large, firm nodules over the Achilles tendons (tendinous xanthomas) and extensor tendons of the hands. Yellow plaques on the eyelids (xanthelasma).
Laboratory Results: Total Cholesterol 500 mg/dL, LDL 420 mg/dL. Triglycerides 120 (Normal).', 57)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Tendinous xanthomas are highly suggestive of which condition?', '["High triglycerides","Familial Hypercholesterolemia (Type IIa - high LDL)","Diabetes","Obesity"]', 1, 'The deposition of LDL-derived cholesterol in tendons is a hallmark of this genetic disorder.'),
        (v_case_id, 'A xanthelasma (yellow eyelid plaque) is always diagnostic of high cholesterol.', '["True","False - about 50% of patients with xanthelasma have normal lipid levels","Only in men","Only in the elderly"]', 1, 'While a common clue, xanthelasma alone is not 100% sensitive or specific for hyperlipidemia.'),
        (v_case_id, 'What is the primary treatment for this patient to prevent premature coronary artery disease?', '["Diet only","High-intensity statins","Fibrates","Antibiotics"]', 1, 'Genetic high LDL requires aggressive pharmacological management.');

    ---------------------------------------------------------------------------
    -- CASE 58: The Cauliflower Ear
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Cauliflower Ear', 'A 50-year-old male presents with sudden-onset pain, redness, and swelling of both ears. He notes that the earlobes are perfectly normal.

Vitals: Normal.
Physical Examination: Bright red, swollen, and tender ears, specifically the cartilaginous portion (sparing the non-cartilaginous lobes). He also mentions some ''hoarseness'' and ''shortness of breath''.
Laboratory Results: Biopsy of the ear shows inflammation of the perichondrium.', 58)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the key clinical clue that distinguishes Relapsing Polychondritis from cellulitis of the ear?', '["Cellulitis is not painful","Relapsing polychondritis spares the earlobe (because the lobe has no cartilage)","Cellulitis only affects one ear","There is no difference"]', 1, 'Since it is a disease of cartilage, non-cartilaginous areas like the earlobe are spared.'),
        (v_case_id, 'Which life-threatening complication is a major concern in this disease?', '["Liver failure","Airway collapse due to tracheobronchial cartilage destruction","Brain tumor","Blindness"]', 1, 'Destruction of the cartilage rings in the trachea can lead to ''floppy'' airways.'),
        (v_case_id, 'Besides the ears and airway, which other ''cartilage-heavy'' structure is often affected, leading to a ''saddle-nose'' deformity?', '["Nasal septum","The jaw","The ribs","The skull"]', 0, 'The nasal septum cartilage is a frequent target of inflammation.');

    ---------------------------------------------------------------------------
    -- CASE 59: The Fever and the Juicy Red Plaque
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Fever and the Juicy Red Plaque', 'A 55-year-old female undergoing chemotherapy for AML (Acute Myeloid Leukemia) develops a high fever and painful red bumps on her arms.

Vitals: T 39.5 C.
Physical Examination: Multiple erythematous, ''juicy-appearing'' plaques and nodules on the upper extremities. Some look like they have small blisters on top (pseudovesiculation). They are very tender.
Laboratory Results: WBC 22,000 (Neutrophilia). Biopsy shows a massive, dense infiltrate of neutrophils in the dermis without vasculitis.', 59)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Sweet''s syndrome is frequently associated with which type of internal condition?', '["Diabetes","Malignancy (especially Hematologic like AML)","Fungal infection","Heart failure"]', 1, 'It can be idiopathic, drug-induced, or paraneoplastic.'),
        (v_case_id, 'Why do the plaques look ''juicy'' or ''blister-like''?', '["They are filled with fluid","Severe edema in the upper dermis due to the intense neutrophilic infiltrate","Bacterial infection (Pus)","None"]', 1, 'The ''pseudovesiculation'' is a hallmark clinical sign.'),
        (v_case_id, 'What is the first-line treatment for Sweet''s syndrome?', '["Antibiotics","Systemic Corticosteroids","Chemotherapy","Surgery"]', 1, 'Patients typically show a dramatic and rapid response to steroids.');

    ---------------------------------------------------------------------------
    -- CASE 60: The Painful Ulcer and the Minor Bump
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Ulcer and the Minor Bump', 'A 40-year-old female with Ulcerative Colitis noticed a small ''pustule'' on her leg where she accidentally bumped into a table. Over 3 days, it has turned into a large, extremely painful ulcer.

Vitals: Normal.
Physical Examination: A large ulcer with a ''violaceous, undermined'' border and a necrotic base. Pathergy (new lesions appearing at sites of minor trauma) is noted.
Laboratory Results: Biopsy shows a sterile neutrophilic infiltrate.', 60)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is ''pathergy'' in the context of Pyoderma Gangrenosum?', '["An allergy to paths","Development of new lesions or worsening of existing ones at sites of trauma","A type of bacteria","None"]', 1, 'This makes surgical debridement of PG lesions dangerous, as it often worsens the ulcer.'),
        (v_case_id, 'Which systemic diseases are most commonly associated with PG?', '["IBD (UC/Crohn''s), Rheumatoid Arthritis, and Hematologic malignancies (CML/AML)","Diabetes and Hypertension","Asthma and COPD","None"]', 0, 'About 50% of PG cases have an associated systemic disease.'),
        (v_case_id, 'Is Pyoderma Gangrenosum an infectious process?', '["Yes, caused by Staph","No, it is an inflammatory neutrophilic dermatosis; cultures are usually sterile","Yes, caused by a virus","Yes, caused by a fungus"]', 1, 'Despite the name, it is not a ''pyoderma'' (pus-infection) in the infectious sense.');

    ---------------------------------------------------------------------------
    -- CASE 61: The Itchy Elbows and the Bloating
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Elbows and the Bloating', 'A 32-year-old male presents with extremely itchy, small blisters on his elbows and knees. He also mentions frequent bloating and foul-smelling stools.

Vitals: Normal.
Physical Examination: Groups of small vesicles and excoriations (scratches) in a symmetric distribution on the elbows, knees, and buttocks.
Laboratory Results: Positive Anti-tissue transglutaminase (tTG) antibodies. Biopsy of the skin shows IgA deposits in the dermal papillae.', 61)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Dermatitis Herpetiformis is the ''skin manifestation'' of which systemic disease?', '["Herpes","Celiac Disease (Gluten-sensitive enteropathy)","Crohn''s","Lupus"]', 1, 'Nearly 100% of DH patients have an underlying gluten sensitivity, though only some have GI symptoms.'),
        (v_case_id, 'What is the characteristic finding on Direct Immunofluorescence (DIF) of the skin?', '["Linear IgG","Granular IgA deposits in the dermal papillae","Fishnet pattern","No deposits"]', 1, 'This is the diagnostic hallmark of DH.'),
        (v_case_id, 'What is the primary treatment for the long-term management of DH?', '["Topical steroids","Strict gluten-free diet","Antibiotics","Acyclovir"]', 1, 'A gluten-free diet treats both the skin and the underlying gut disease.');

    ---------------------------------------------------------------------------
    -- CASE 62: The Wood-Grain Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Wood-Grain Rash', 'A 72-year-old heavy smoker presents with a rapidly spreading, ''bizarre'' rash that looks like wood grain or a knotty pine board.

Vitals: Normal.
Physical Examination: Concentric, erythematous bands with a fine scale that ''migrate'' several centimeters a day (erythema gyratum repens).
Laboratory Results: Chest X-ray shows a large mass in the right upper lobe.', 62)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Erythema gyratum repens is considered one of the most specific skin markers for what?', '["Fungal infection","Internal malignancy (especially Lung, Breast, or GI cancers)","Diabetes","Old age"]', 1, 'In >80% of cases, an underlying cancer is found shortly before or after the rash appears.'),
        (v_case_id, 'The ''wood-grain'' appearance is caused by what?', '["Bacterial growth","The rapid migration of the inflammatory bands","Tattoos","None of the above"]', 1, 'The scales and bands move so fast they create this unique pattern.'),
        (v_case_id, 'What happens to the rash when the underlying cancer is treated?', '["It stays the same","It usually resolves rapidly","It gets worse","It turns into scars"]', 1, 'Paraneoplastic rashes typically mirror the course of the malignancy.');

    ---------------------------------------------------------------------------
    -- CASE 63: The Sudden Downy Hair
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Downy Hair', 'A 60-year-old woman is distressed by the sudden appearance of fine, ''baby-like'' white hair all over her face and ears.

Vitals: Normal.
Physical Examination: Extensive growth of long, thin, non-pigmented (lanugo) hair on the face. She also mentions recent weight loss and abdominal pain.
Laboratory Results: CT scan shows a mass in the colon.', 63)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is ''Malignant Down''?', '["A type of feather","Another name for Acquired Hypertrichosis Lanuginosa, a paraneoplastic sign of internal cancer","A mood disorder","None"]', 1, 'The sudden growth of lanugo hair in an adult is a major red flag for cancer.'),
        (v_case_id, 'Which cancers are most commonly associated with AHL?', '["Colorectal and Lung cancers","Skin cancer","Brain cancer","Thyroid cancer"]', 0, 'Visceral malignancies are the usual triggers.'),
        (v_case_id, 'How does lanugo hair differ from normal adult (terminal) hair?', '["It''s thicker","It is fine, soft, and unpigmented, like the hair on a newborn","It''s curly","None"]', 1, 'Lanugo is the type of hair normally seen on fetuses.');

    ---------------------------------------------------------------------------
    -- CASE 64: The Jaw Bumps and the Bloody Stools
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Jaw Bumps and the Bloody Stools', 'A 22-year-old male presents with several hard bumps on his jaw and a ''fleshy'' lump on his back. His father died of colon cancer at age 40.

Vitals: Normal.
Physical Examination: Multiple epidermoid cysts on the skin. Hard, bony masses on the mandible (osteomas). A soft-tissue mass on the trunk (desmoid tumor).
Laboratory Results: Colonoscopy shows thousands of polyps throughout the colon.', 64)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Gardner syndrome is a variant of which condition?', '["Lynch syndrome","Familial Adenomatous Polyposis (FAP)","Li-Fraumeni","None"]', 1, 'It combines the colonic polyposis of FAP with specific extra-colonic manifestations.'),
        (v_case_id, 'What is the major risk for the colonic polyps in Gardner syndrome?', '["They are harmless","100% risk of progression to Colorectal Cancer if the colon is not removed","They cause diarrhea only","None"]', 1, 'Prophylactic colectomy is usually required.'),
        (v_case_id, 'What are ''osteomas'' in this syndrome?', '["Skin tags","Benign bony outgrowths, often on the jaw or skull","Types of polyps","Muscle tumors"]', 1, 'Osteomas are a classic clinical finding in Gardner syndrome.');

    ---------------------------------------------------------------------------
    -- CASE 65: The Facial Bumps and the Lung Pop
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Facial Bumps and the Lung Pop', 'A 40-year-old female presents with sudden shortness of breath. She also has many small, white bumps on her face.

Vitals: RR 28, O2 Sat 90%.
Physical Examination: Multiple 2-4 mm, skin-colored, dome-shaped papules on the face and neck (fibrofolliculomas). Decreased breath sounds on the right side.
Laboratory Results: Chest X-ray shows a spontaneous pneumothorax. Abdominal CT reveals a solid mass in the kidney.', 65)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Birt-Hogg-Dubé syndrome is an autosomal dominant disorder characterized by which triad?', '["Facial tumors (fibrofolliculomas), Pulmonary cysts/pneumothorax, and Renal tumors","Fever, rash, joint pain","Anemia, jaundice, rash","None of the above"]', 0, 'The FLCN gene mutation leads to these varied manifestations.'),
        (v_case_id, 'The facial bumps in BHD are tumors of which structure?', '["Sweat glands","Hair follicles (Fibrofolliculomas)","Nerves","Fat"]', 1, 'Fibrofolliculomas are the hallmark skin finding.'),
        (v_case_id, 'Which type of kidney cancer is most common in BHD?', '["Clear cell","Chromophobe renal cell carcinoma or Hybrid oncocytic tumors","Wilms tumor","None"]', 1, 'BHD has a specific predilection for chromophobe and oncocytic renal lineages.');

    ---------------------------------------------------------------------------
    -- CASE 66: The Mouth Warts and the Breast Lump
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mouth Warts and the Breast Lump', 'A 35-year-old woman presents with many small ''warts'' around her mouth and a new lump in her right breast.

Vitals: Normal.
Physical Examination: Multiple small, flesh-colored, ''cobblestone'' papules on the lips and gingiva. Several warty papules on the face (trichilemmomas). A firm, 2cm mass in the upper outer quadrant of the breast.
Laboratory Results: Positive PTEN gene mutation.', 66)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which gene is mutated in Cowden syndrome?', '["APC","PTEN (a tumor suppressor)","TP53","BRCA1"]', 1, 'PTEN mutations lead to the formation of multiple hamartomas and increased cancer risk.'),
        (v_case_id, 'What is the most significant cancer risk for women with Cowden syndrome?', '["Lung cancer","Breast cancer (up to 85% lifetime risk)","Skin cancer","Liver cancer"]', 1, 'Breast cancer is the primary concern for screening.'),
        (v_case_id, 'The ''cobblestone'' appearance of the oral mucosa is caused by which lesions?', '["Viral warts","Oral fibromas/hamartomas","Canker sores","None"]', 1, 'This is a key physical exam finding for Cowden.');

    ---------------------------------------------------------------------------
    -- CASE 67: The Multiple BCCs and the Jaw Cysts
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Multiple BCCs and the Jaw Cysts', 'A 20-year-old male presents with over 50 Basal Cell Carcinomas (BCCs) on his trunk. He also has deep ''pits'' on his palms.

Vitals: Normal.
Physical Examination: Multiple BCCs (some in sun-protected areas). Small, 1-2 mm pits on the palms and soles. Frontal bossing (prominent forehead).
Laboratory Results: Panorex X-ray of the jaw shows multiple odontogenic keratocysts (OKCs). Head CT shows calcification of the falx cerebri.', 67)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative mutation in Gorlin Syndrome?', '["PTCH1 (Patched) gene","BRAF","p53","None"]', 0, 'The PTCH1 gene is part of the Hedgehog signaling pathway.'),
        (v_case_id, 'What is the significant pediatric brain tumor associated with Gorlin syndrome?', '["Glioblastoma","Medulloblastoma","Ependymoma","Astrocyte tumor"]', 1, 'Medulloblastoma occurs in about 5% of children with the syndrome.'),
        (v_case_id, 'The BCCs in Gorlin syndrome often appear when?', '["At age 80","During puberty or early adulthood, often in very large numbers","Only in the summer","None"]', 1, 'Early-onset, multiple BCCs are a major diagnostic criterion.');

    ---------------------------------------------------------------------------
    -- CASE 68: The Waxy Skin and the Plucked Chicken Appearance
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Waxy Skin and the Plucked Chicken Appearance', 'A 25-year-old male presents with yellow, ''bumpy'' skin on the sides of his neck and sudden-onset vision loss.

Vitals: Normal.
Physical Examination: Small, yellowish papules on the neck and axillae that look like ''plucked chicken skin''. Pulses in the legs are weak.
Laboratory Results: Eye exam shows ''angioid streaks'' (breaks in Bruch''''s membrane).', 68)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the underlying defect in PXE?', '["Collagen defect","Fragmentation and calcification of elastic fibers","Vitamin deficiency","None"]', 1, 'It is caused by mutations in the ABCC6 gene.'),
        (v_case_id, 'What are ''angioid streaks''?', '["Scars on the skin","Retinal findings resembling blood vessels that represent breaks in a calcified Bruch''s membrane","Types of stretch marks","None"]', 1, 'These can lead to choroidal neovascularization and vision loss.'),
        (v_case_id, 'Why are the leg pulses weak in this patient?', '["Heart failure","Premature atherosclerosis and calcification of medium-sized arteries","He is cold","None"]', 1, 'Arterial calcification is a major systemic feature of PXE.');

    ---------------------------------------------------------------------------
    -- CASE 69: The Cigarette-Paper Scars
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Cigarette-Paper Scars', 'A 15-year-old boy is brought in because his ''skin is too stretchy'' and he bruises very easily.

Vitals: Normal.
Physical Examination: Skin can be pulled several centimeters and snaps back (hyperextensibility). Joint hypermobility (Beighton score 8/9). Thin, wide, ''cigarette-paper'' or ''papyraceous'' scars over the knees.
Laboratory Results: Genetic testing for Type V collagen mutation.', 69)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common genetic defect in CLASSIC Ehlers-Danlos?', '["Type I Collagen","Type V Collagen (COL5A1/COL5A2)","Type III Collagen","Fibrillin"]', 1, 'Mutations in Type V collagen lead to the classic skin and joint findings.'),
        (v_case_id, 'Which type of EDS is the most dangerous due to the risk of vascular rupture (Aorta, Bowel)?', '["Classic","Hypermobile","Vascular Type (Type IV - Type III Collagen defect)","None"]', 2, 'Vascular EDS carries a high risk of sudden death from organ or vessel rupture.'),
        (v_case_id, 'What is a ''papyraceous'' scar?', '["A thick scar","A thin, atrophic, ''cigarette-paper'' scar that occurs because of poor connective tissue support","A red scar","None"]', 1, 'These scars are highly characteristic of EDS.');

    ---------------------------------------------------------------------------
    -- CASE 70: The Tall Boy and the Stretch Marks
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Tall Boy and the Stretch Marks', 'A 16-year-old boy who is 6''5" tall presents with back pain and vision changes.

Vitals: Normal.
Physical Examination: Tall stature with long limbs and fingers (arachnodactyly). Pectus excavatum. Wide, horizontal stretch marks (striae) on the back. Eye exam shows the lens is displaced upward (ectopia lentis).
Laboratory Results: Echo shows a dilated aortic root.', 70)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which protein is defective in Marfan syndrome?', '["Collagen","Fibrillin-1","Elastin","Keratin"]', 1, 'Mutations in the FBN1 gene lead to multi-system connective tissue weakness.'),
        (v_case_id, 'What is the most common cause of death in Marfan patients?', '["Lung failure","Aortic dissection or rupture","Skin cancer","Stroke"]', 1, 'Dilatation of the aortic root can lead to fatal dissection.'),
        (v_case_id, 'How does the ''ectopia lentis'' of Marfan differ from that of Homocystinuria?', '["Marfan is upward; Homocystinuria is downward and inward","Marfan is downward; Homocystinuria is upward","There is no difference","None"]', 0, 'This is a classic ''Step'' shelf differentiator.');

    ---------------------------------------------------------------------------
    -- CASE 71: The Silver Hair and the Infections
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Silver Hair and the Infections', 'A 3-year-old boy presents with a high fever and a ''silvery'' sheen to his hair. He has had recurrent pneumonia and skin abscesses.

Vitals: T 39.0 C.
Physical Examination: Silvery-gray hair. Pale skin with patches of darker pigment (partial albinism). Hepatosplenomegaly.
Laboratory Results: Peripheral smear shows giant granules in neutrophils.', 71)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the defect in Chediak-Higashi syndrome?', '["Antibody production","Microtubule polymerization/lysosomal trafficking (LYST gene)","Vitamin C deficiency","None"]', 1, 'This prevents the normal merging of phagosomes with lysosomes, leading to ''giant granules''.'),
        (v_case_id, 'Why do these patients have silvery hair?', '["Bleaching","Failure to transport melanin into the hair shaft (melanosome trafficking defect)","Fungus","None"]', 1, 'The same trafficking defect affecting lysosomes affects melanosomes.'),
        (v_case_id, 'What is the ''accelerated phase'' of this disease?', '["Rapid growth","A lymphohistiocytic infiltration (HLH-like) leading to multi-organ failure","Fast hair growth","None"]', 1, 'This is a life-threatening complication, often triggered by a virus.');

    ---------------------------------------------------------------------------
    -- CASE 72: The Eczema, the Bleeding, and the Infections
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Eczema, the Bleeding, and the Infections', 'An 18-month-old boy presents with severe, bloody diarrhea and a widespread ''itchy'' rash.

Vitals: Normal.
Physical Examination: Severe atopic-like dermatitis (eczema) on the face and flexures. Multiple petechiae and bruises.
Laboratory Results: Platelet count 30,000 (Low) with very small platelets. Low IgM, High IgA and IgE.', 72)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic triad of Wiskott-Aldrich Syndrome?', '["Eczema, Thrombocytopenia (with small platelets), and Recurrent infections","Fever, rash, joint pain","Anemia, jaundice, rash","None of the above"]', 0, 'The mnemonic ''WATER'' (Wiskott-Aldrich, Thrombocytopenia, Eczema, Recurrent infections) is commonly used.'),
        (v_case_id, 'What is the inheritance pattern of WAS?', '["Autosomal Dominant","X-linked Recessive","Autosomal Recessive","Mitochondrial"]', 1, 'It primarily affects males.'),
        (v_case_id, 'What is the function of the WASP protein?', '["Oxygen transport","Actin cytoskeleton remodeling in hematopoietic cells","Skin pigment","None"]', 1, 'The defect impairs the migration and activation of immune cells and platelets.');

    ---------------------------------------------------------------------------
    -- CASE 73: The Orange-Peel Foot and the Thyroid
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Orange-Peel Foot and the Thyroid', 'A 45-year-old male presents with ''swelling'' of his lower legs and ''bulging eyes''.

Vitals: HR 105 bpm.
Physical Examination: Non-pitting, firm, ''peau d''''orange'' (orange peel) plaques on the shins. Proptosis (eye bulging). Finger clubbing (thyroid acropachy).
Laboratory Results: Low TSH, High Free T4.', 73)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the triad of Graves'' disease manifestations?', '["Hyperthyroidism, Ophthalmopathy, and Dermopathy (Pretibial myxedema)","Fever, rash, diarrhea","Cough, rash, joint pain","None"]', 0, 'These are caused by autoantibodies stimulating TSH receptors in various tissues.'),
        (v_case_id, 'What is ''Thyroid Acropachy''?', '["Nail fungus","A rare feature of Graves'' disease involving finger clubbing and periosteal bone formation","A type of rash","None"]', 1, 'It is considered the most advanced stage of Graves'' autoimmune involvement.'),
        (v_case_id, 'What is the name for the ''on-and-off'' separation of the nail from the nail bed seen in hyperthyroidism?', '["Plummer''s nails (Onycholysis)","Beau''s lines","Terry''s nails","None"]', 0, 'Distal onycholysis is a classic ''thyroid nail'' sign.');

    ---------------------------------------------------------------------------
    -- CASE 74: The Yellow Skin and the Normal Eyes
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Yellow Skin and the Normal Eyes', 'A 20-year-old female presents because she thinks she is ''jaundiced''. She has been eating a lot of carrots and squash to lose weight.

Vitals: Normal.
Physical Examination: Yellow-orange discoloration of the skin, most prominent on the palms and soles. The sclera (whites of the eyes) are perfectly white.
Laboratory Results: Normal Bilirubin. Elevated serum carotene.', 74)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How do you distinguish Carotenemia from Jaundice clinically?', '["Jaundice affects the sclera; Carotenemia spares the sclera","Jaundice is orange; Carotenemia is yellow","Carotenemia is only on the face","None"]', 0, 'This is a critical physical exam distinction for Step 2 CK.'),
        (v_case_id, 'Besides excessive diet, which metabolic condition is associated with carotenemia due to decreased conversion of carotene to vitamin A?', '["Diabetes","Hypothyroidism","Hypertension","Asthma"]', 1, 'Thyroid hormone is needed for the hepatic conversion of carotene.'),
        (v_case_id, 'What is the treatment for diet-induced carotenemia?', '["Surgery","Dietary modification (reducing intake of carotene-rich foods)","Antibiotics","Steroids"]', 1, 'It is a benign condition that resolves as pigment is excreted.');

    ---------------------------------------------------------------------------
    -- CASE 75: The Dry Eyes and the Purple Spots
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Dry Eyes and the Purple Spots', 'A 55-year-old female presents with extremely dry eyes, a dry mouth, and ''purple spots'' on her legs.

Vitals: Normal.
Physical Examination: Parotid gland enlargement. Dry, crusty oral mucosa. Palpable purpura on the lower extremities.
Laboratory Results: Positive Anti-Ro (SSA) and Anti-La (SSB) antibodies. Schirmer test shows <5mm moisture in 5 minutes.', 75)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Sicca complex''?', '["Fever and rash","Dry eyes (xerophthalmia) and dry mouth (xerostomia)","Diarrhea and vomiting","None"]', 1, 'This is the core clinical presentation of Sjogren''s.'),
        (v_case_id, 'Patients with Sjogren''s have a 40-fold increased risk of which malignancy?', '["Breast cancer","Non-Hodgkin B-cell Lymphoma (especially MALT lymphoma)","Skin cancer","Lung cancer"]', 1, 'Chronic B-cell stimulation in the salivary glands can lead to lymphoma.'),
        (v_case_id, 'The palpable purpura in Sjogren''s is usually due to:', '["Low platelets","Hypergammaglobulinemic purpura or associated small-vessel vasculitis","Trauma","None"]', 1, 'Vasculitis is a known extra-glandular manifestation of Sjogren''s.');

    ---------------------------------------------------------------------------
    -- CASE 76: The Swollen Fingers and the Mixed Picture
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Swollen Fingers and the Mixed Picture', 'A 30-year-old female presents with fingers that look like ''sausages'' and turn white in the cold. She has joint pain and a rash on her knuckles.

Vitals: Normal.
Physical Examination: Diffuse swelling of the fingers (puffy hands). Raynaud''s phenomenon. Red, scaly papules over the knuckles (Gottron-like). Proximal muscle weakness.
Laboratory Results: Positive ANA (speckled pattern). Extremely high titer of Anti-U1 RNP antibody.', 76)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'MCTD involves overlapping features of which three diseases?', '["SLE, Systemic Sclerosis, and Polymyositis/Dermatomyositis","Diabetes, Hypertension, Asthma","Psoriasis, Eczema, Acne","None"]', 0, 'It is a distinct clinical entity with ''mixed'' findings.'),
        (v_case_id, 'Which antibody is REQUIRED for the diagnosis of MCTD?', '["Anti-dsDNA","Anti-U1 RNP (Ribonucleoprotein)","Anti-Smith","Anti-Ro"]', 1, 'High titers of Anti-U1 RNP in the absence of other specific antibodies (like Anti-Sm or Anti-dsDNA) define MCTD.'),
        (v_case_id, 'What is the most common cause of death in MCTD?', '["Kidney failure","Pulmonary Arterial Hypertension","Skin infection","Stroke"]', 1, 'PAH is a serious and frequent complication of MCTD.');

    ---------------------------------------------------------------------------
    -- CASE 77: The Fever and the Heart Block
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Fever and the Heart Block', 'A 35-year-old male presents with a high fever and a new ''skip'' in his heartbeat. He had a target-shaped rash on his back 3 weeks ago.

Vitals: HR 40 bpm, T 38.5 C.
Physical Examination: Bradycardia. No active rash. Knee joint is slightly swollen.
Laboratory Results: ECG shows 3rd-degree (complete) AV block. Borrelia burgdorferi IgM is positive.', 77)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Lyme carditis most commonly manifests as what?', '["Heart attack","Atrioventricular (AV) node conduction block","Valvular disease","None"]', 1, 'Varying degrees of AV block are the classic cardiac manifestation of early disseminated Lyme disease.'),
        (v_case_id, 'What is the treatment for Lyme disease with high-degree AV block?', '["Oral Doxycycline","IV Ceftriaxone and cardiac monitoring","Pacemaker only","None"]', 1, 'IV antibiotics and hospitalization are required for cardiac involvement.'),
        (v_case_id, 'Is the AV block in Lyme disease usually reversible?', '["No, it''s permanent","Yes, it usually resolves with appropriate antibiotic therapy","Only with surgery","None"]', 1, 'Most cases of Lyme carditis have an excellent prognosis with treatment.');

    ---------------------------------------------------------------------------
    -- CASE 78: The Mouth Spots and the Nail Loss
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mouth Spots and the Nail Loss', 'A 60-year-old male presents with thinning hair, brittle nails that are falling off, and dark spots on his skin. He has lost 30 lbs and has chronic diarrhea.

Vitals: Normal.
Physical Examination: Diffuse alopecia. Onychomadesis (separation of the nail from the base). Hyperpigmented macules on the face and hands. Abdominal distension.
Laboratory Results: Endoscopy shows generalized GI polyposis. All polyps are benign hamartomas.', 78)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What makes Cronkhite-Canada syndrome unique among GI polyposis syndromes?', '["It is inherited","It is acquired (non-hereditary) and includes specific ectodermal changes (nails, hair, skin)","It only affects the mouth","None"]', 1, 'It is a rare, sporadic syndrome usually affecting older adults.'),
        (v_case_id, 'What is the prognosis of Cronkhite-Canada?', '["Excellent","Poor (high mortality due to malabsorption, GI bleeding, and infection)","It resolves with shampoo","None"]', 1, 'It is a severe systemic disease with a poor prognosis if not managed aggressively.'),
        (v_case_id, 'Which nutrient deficiency is MOST likely in this patient?', '["All of the above (due to protein-losing enteropathy and malabsorption)","Only Iron","Only Zinc","Only Vitamin C"]', 0, 'Generalized malabsorption leads to multiple deficiencies.');

    ---------------------------------------------------------------------------
    -- CASE 79: The Child with the Peeling Hands (Follow-up)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Child with the Peeling Hands (Follow-up)', 'A child treated for Kawasaki disease 1 month ago is brought in for a follow-up. He is now asymptomatic.

Vitals: Normal.
Physical Examination: Normal.
Laboratory Results: Echocardiogram shows a 6mm aneurysm of the left anterior descending (LAD) artery.', 79)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'When do coronary artery aneurysms typically form in Kawasaki disease?', '["On day 1","In the subacute phase (2-4 weeks after onset)","10 years later","None"]', 1, 'This is why follow-up echocardiography is mandatory.'),
        (v_case_id, 'What is the long-term management for a child with a persistent coronary aneurysm?', '["Nothing","Long-term low-dose Aspirin (anti-platelet therapy)","No exercise forever","Antibiotics"]', 1, 'Aspirin prevents thrombosis within the dilated aneurysm.'),
        (v_case_id, 'Which medication should be avoided in children on long-term aspirin due to the risk of Reye syndrome?', '["Acetaminophen","Live viral vaccines (like Varicella/Flu) if the child is exposed to the virus","Vitamin D","None"]', 1, 'The combination of Aspirin and certain viral infections (Influenza/Varicella) is the trigger for Reye syndrome.');

    ---------------------------------------------------------------------------
    -- CASE 80: The Scurvy Trap
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scurvy Trap', 'A patient with ''bleeding gums'' and ''easy bruising'' is found to have a normal Vitamin C level. He recently started taking a new ''blood thinner''.

Vitals: Normal.
Physical Examination: Large ecchymoses (bruises). Bleeding from the gums after brushing. No perifollicular hemorrhages.
Laboratory Results: Platelets normal. PT/INR markedly elevated (6.0).', 80)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the key laboratory difference between Scurvy and Warfarin over-anticoagulation?', '["Scurvy has high PT","Scurvy has normal coagulation studies; Warfarin toxicity has high PT/INR","They are the same","None"]', 1, 'Scurvy is a vessel wall defect; Warfarin affects clotting factors.'),
        (v_case_id, 'What is the immediate reversal agent for a dangerously high INR with bleeding?', '["Vitamin C","Vitamin K and Fresh Frozen Plasma (FFP) or Prothrombin Complex Concentrate (PCC)","Aspirin","Water"]', 1, 'Vitamin K is the direct antagonist.'),
        (v_case_id, 'Which type of ''spot'' is missing in this patient that would be present in Scurvy?', '["Large bruises","Perifollicular hemorrhages and corkscrew hairs","Red eyes","None"]', 1, 'These specific follicular findings are characteristic of Scurvy, not simple coagulopathy.');

    RAISE NOTICE 'Finished populating 80 cases for case-vignettes.';
END $$;

COMMIT;
