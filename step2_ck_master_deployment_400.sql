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
-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Clinical Case Integration (Step 2 CK)
-- Topic: Diagnostic reasoning & management algorithms
-- Topic Slug: case-algorithms
-- Sourced: UWorld, Step-Up to Medicine, MTB Step 2, First Aid Step 2 CK

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-algorithms' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'case-algorithms';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 50-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: The Acne Escalation
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Acne Escalation', 'A 16-year-old male presents with worsening acne. He has been using over-the-counter benzoyl peroxide for 6 months with minimal improvement.

Vitals: Normal.
Physical Examination: Multiple open and closed comedones, along with numerous erythematous papules and pustules on the cheeks and forehead. No nodules or scarring are noted.
Laboratory Results: None.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best next step in management for this patient?', '["Switch to salicylic acid","Add topical retinoids (e.g., Tretinoin) and consider topical antibiotics (e.g., Clindamycin)","Start oral Isotretinoin immediately","Perform a chemical peel"]', 1, 'For moderate inflammatory acne failing OTC therapy, the next step is combining a topical retinoid with a topical antibiotic or benzoyl peroxide.'),
        (v_case_id, 'If the patient subsequently develops deep, painful nodules and scarring, what is the ''Most Effective'' treatment?', '["Oral Tetracycline","Oral Isotretinoin","Increase strength of topical steroids","Blue light therapy"]', 1, 'Oral Isotretinoin is the gold standard for severe, recalcitrant nodulocystic acne or acne with scarring.'),
        (v_case_id, 'Which of the following must be checked BEFORE starting the treatment mentioned in the previous question in a female of childbearing age?', '["Liver function tests and lipids only","Two negative pregnancy tests and enrollment in iPLEDGE","Complete blood count","Chest X-ray"]', 1, 'Isotretinoin is highly teratogenic; strict pregnancy prevention is mandatory.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Suspect Mole
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Suspect Mole', 'A 45-year-old female presents with a mole on her back that has changed color and developed ''jagged'' edges over the last 3 months.

Vitals: Normal.
Physical Examination: A 7-mm asymmetric macule with irregular borders and multiple shades of brown and black on the left scapula.
Laboratory Results: None.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial Step'' in the management of this lesion?', '["Shave biopsy","Excisional biopsy with 1-3 mm margins","Wide local excision with 2 cm margins","Laser ablation"]', 1, 'Suspected melanoma should undergo an excisional biopsy (elliptical or punch) to determine the Breslow depth. Shave biopsies are avoided as they may ''transect'' the base and lose depth data.'),
        (v_case_id, 'The biopsy shows melanoma with a Breslow depth of 1.5 mm. What is the next step in management?', '["Chemotherapy","Wide local excision (WLE) and Sentinel Lymph Node Biopsy (SLNB)","Radiation therapy","No further treatment needed"]', 1, 'Melanomas > 0.8 mm (or < 0.8 mm with ulceration/high mitosis) require SLNB in addition to WLE.'),
        (v_case_id, 'What is the most important prognostic factor for localized melanoma?', '["Diameter of the lesion","Breslow thickness (depth of invasion)","Age of the patient","Number of colors in the mole"]', 1, 'Breslow thickness is the single most important predictor of survival and metastatic potential.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Scaly Patch and the Hair Loss
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Patch and the Hair Loss', 'An 8-year-old girl presents with a round patch of hair loss that is ''itchy'' and scaly.

Vitals: Normal.
Physical Examination: A 3-cm circular area of alopecia on the vertex with prominent scaling and ''black dots'' (broken hairs). Cervical lymphadenopathy is present.
Laboratory Results: KOH prep shows fungal hyphae within the hair shaft.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most appropriate next step in treatment for this patient?', '["Topical Ketoconazole cream","Oral Griseofulvin or Terbinafine","Topical steroids","Selenium sulfide shampoo only"]', 1, 'Tinea capitis requires ORAL therapy to penetrate the hair follicle; topicals are ineffective as monotherapy.'),
        (v_case_id, 'If the lesion becomes a boggy, purulent, painful mass with hair loss, what is it called?', '["Abscess","Kerion","Seborrheic dermatitis","Impetigo"]', 1, 'A kerion is a severe inflammatory response to tinea capitis and may lead to permanent scarring alopecia if not treated.'),
        (v_case_id, 'Should the patient''s family members be screened?', '["No, it''s not contagious","Yes, as asymptomatic carriage among household contacts is common","Only if they have pets","Only if they are bald"]', 1, 'Asymptomatic household contacts can act as reservoirs and cause reinfection.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Recurrent Facial Redness
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Recurrent Facial Redness', 'A 40-year-old male presents with redness on his nose and cheeks that worsens after drinking hot coffee or being in the sun.

Vitals: Normal.
Physical Examination: Persistent erythema and telangiectasias over the central face. Multiple inflammatory papules and pustules are present. No comedones are noted.
Laboratory Results: None.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial topical treatment for this patient''s inflammatory lesions?', '["Benzoyl peroxide","Topical Metronidazole or Azelaic acid","Topical Tretinoin","Topical Nystatin"]', 1, 'Topical Metronidazole is a first-line treatment for the papules and pustules of rosacea.'),
        (v_case_id, 'What is the most important ''Non-pharmacologic'' management step?', '["Daily face scrubbing","Avoidance of triggers (e.g., sun, alcohol, spicy foods, hot beverages)","Steam facials","Increasing caffeine intake"]', 1, 'Trigger avoidance is essential to manage the underlying vasomotor instability.'),
        (v_case_id, 'The patient complains of a ''gritty'' sensation in his eyes. What should you evaluate for?', '["Glaucoma","Ocular Rosacea (Blepharitis/Conjunctivitis)","Cataracts","Uveitis"]', 1, 'Ocular involvement occurs in up to 50% of rosacea patients and can lead to corneal scarring.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Itchy Fingers at Night
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Fingers at Night', 'A 25-year-old male presents with intense itching that is much worse at night. His roommate has similar symptoms.

Vitals: Normal.
Physical Examination: Small, erythematous papules and thin, linear tracks (burrows) in the finger webs, wrists, and periumbilical area.
Laboratory Results: Skin scraping under mineral oil shows mites and eggs.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the first-line treatment for this patient and his roommate?', '["Topical Permethrin 5% cream (applied head-to-toe and washed off after 8-14 hours)","Oral Fluconazole","Topical Hydrocortisone","Topical Clotrimazole"]', 0, 'Permethrin is the standard first-line scabicide. Oral Ivermectin is an alternative.'),
        (v_case_id, 'Which of the following management steps is ''Mandatory'' for success?', '["Treating only the symptomatic roommate","Treating all household contacts regardless of symptoms","Shaving all body hair","Taking a bleach bath"]', 1, 'Asymptomatic contacts must be treated simultaneously to prevent a ''ping-pong'' cycle of reinfection.'),
        (v_case_id, 'What should be done with the patient''s bedding and clothing?', '["Discard them","Wash in hot water and dry in a hot dryer (or seal in a plastic bag for 72 hours)","Spray with perfume","Nothing"]', 1, 'High heat kills the mites; they cannot survive away from human skin for more than 2-3 days.');

    ---------------------------------------------------------------------------
    -- CASE 06: The Thickened Toenails
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Thickened Toenails', 'A 60-year-old male presents with yellow, thickened, and crumbly toenails. He is bothered by the appearance and difficulty trimming them.

Vitals: Normal.
Physical Examination: Subungual hyperkeratosis and onycholysis of 8 toenails.
Laboratory Results: KOH and fungal culture are positive for Trichophyton rubrum.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most effective treatment for this patient?', '["Topical Ciclopirox nail lacquer","Oral Terbinafine (usually for 12 weeks for toenails)","Oral Nystatin","Surgical removal of all nails"]', 1, 'Oral Terbinafine has significantly higher cure rates than topical treatments for onychomycosis.'),
        (v_case_id, 'Which laboratory test should be monitored during treatment with oral Terbinafine?', '["Renal function (BUN/Cr)","Liver Function Tests (ALT/AST)","Complete Blood Count","Lipid panel"]', 1, 'Oral Terbinafine can cause hepatotoxicity; baseline and periodic LFTs are recommended.'),
        (v_case_id, 'If the patient had underlying liver cirrhosis, what would be the best management?', '["Still use oral Terbinafine","Topical efinaconazole or avoid systemic treatment","Oral Ketoconazole","None of the above"]', 1, 'Systemic antifungals should be avoided in patients with active or chronic liver disease.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Rapidly Spreading Leg Redness
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapidly Spreading Leg Redness', 'A 55-year-old male with Type 2 Diabetes presents with a warm, red, and painful area on his left lower leg that has spread over 24 hours.

Vitals: T 38.3 C, BP 130/80.
Physical Examination: Ill-defined erythema, warmth, and tenderness on the left pretibial area. There is a small crack (fissure) between his 4th and 5th toes.
Laboratory Results: WBC 13,000.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely causative organism for this non-purulent presentation?', '["Staphylococcus aureus","Streptococcus pyogenes (Group A Strep)","Pseudomonas aeruginosa","E. coli"]', 1, 'Group A Strep is the most common cause of non-purulent cellulitis. S. aureus is more common in purulent cases (abscesses).'),
        (v_case_id, 'What is the best initial management for this patient?', '["Wait for blood cultures before starting antibiotics","Empiric oral antibiotics (e.g., Cephalexin or Dicloxacillin)","Topical Mupirocin","Incision and drainage"]', 1, 'Non-purulent cellulitis is treated with empiric antibiotics targeting Gram-positive cocci.'),
        (v_case_id, 'What is the most important step to prevent recurrence in this patient?', '["Daily bleach baths","Treatment of the tinea pedis (cracks between toes) as it serves as a portal of entry","Compression stockings during the acute phase","None"]', 1, 'Identifying and treating the ''portal of entry'' is a key Step 2 management point.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Flaccid Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Flaccid Blisters', 'A 50-year-old male presents with painful sores in his mouth followed by fragile blisters on his chest and back that ''pop'' easily.

Vitals: Normal.
Physical Examination: Eroded plaques on the oral mucosa. Flaccid bullae on the trunk; when the skin near a blister is rubbed, the top layer slides off (positive Nikolsky sign).
Laboratory Results: Skin biopsy shows intraepidermal acantholysis. Direct Immunofluorescence (DIF) shows a ''fishnet'' pattern of IgG.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary target of autoantibodies in Pemphigus Vulgaris?', '["Hemidesmosomes","Desmoglein 1 and 3 (Desmosomes)","Type IV Collagen","Basement membrane"]', 1, 'Loss of desmosome-mediated adhesion leads to intraepidermal cleavage (acantholysis).'),
        (v_case_id, 'What is the first-line treatment for this condition?', '["Topical steroids only","Systemic high-dose corticosteroids (e.g., Prednisone) and immunosuppressants","IV Antibiotics","Plasmapheresis as first-line"]', 1, 'Pemphigus is potentially fatal and requires systemic immunosuppression.'),
        (v_case_id, 'How does Bullous Pemphigoid differ clinically and pathologically from Pemphigus Vulgaris?', '["BP has flaccid blisters and is Nikolsky positive","BP has tense blisters, is Nikolsky negative, and shows subepidermal cleavage","BP always involves the mouth","BP is more dangerous"]', 1, 'Bullous Pemphigoid involves hemidesmosomes, creating deeper, more stable (tense) blisters.');

    ---------------------------------------------------------------------------
    -- CASE 09: The Silver Scales on the Elbows
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Silver Scales on the Elbows', 'A 30-year-old male presents with thick, red, scaly patches on his elbows and knees that sometimes bleed when the scale is removed.

Vitals: Normal.
Physical Examination: Well-demarcated erythematous plaques with silvery-white scale (micaceous scale). Punctate bleeding is seen when a scale is lifted (Auspitz sign). Nail pitting is also present.
Laboratory Results: None.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial'' treatment for localized plaque psoriasis?', '["Oral Methotrexate","High-potency topical corticosteroids (e.g., Clobetasol)","UVB phototherapy","Oral Prednisone"]', 1, 'Topical steroids are first-line for limited disease (<10% BSA).'),
        (v_case_id, 'Why should systemic (oral) corticosteroids be avoided in the treatment of psoriasis?', '["They don''t work","Risk of triggering life-threatening Erythrodermic or Pustular Psoriasis upon withdrawal","They cause weight gain","None of the above"]', 1, 'This is a major ''Don''t Do'' in the management of psoriasis.'),
        (v_case_id, 'The patient complains of morning stiffness in his fingers that lasts for an hour. What is the most likely association?', '["Osteoarthritis","Psoriatic Arthritis","Gout","Lupus"]', 1, 'Psoriatic arthritis occurs in up to 30% of patients with skin psoriasis.');

    ---------------------------------------------------------------------------
    -- CASE 10: The Sudden Hair Patch
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Hair Patch', 'A 22-year-old female presents with a sudden ''bald spot'' on her head that appeared over the last week. She has no pain or itching.

Vitals: Normal.
Physical Examination: A well-circumscribed, 2-cm smooth patch of complete hair loss on the scalp. Short, ''exclamation point'' hairs are seen at the periphery. The scalp looks normal (no scale or inflammation).
Laboratory Results: None.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely underlying mechanism for this condition?', '["Fungal infection","Autoimmune destruction of the hair follicle","Stress-induced shedding","Genetic balding"]', 1, 'Alopecia areata is a T-cell mediated autoimmune disease.'),
        (v_case_id, 'What is the first-line treatment for localized alopecia areata?', '["Minoxidil","Intralesional corticosteroid injections (e.g., Triamcinolone)","Oral Griseofulvin","Wig fitting"]', 1, 'Injections are highly effective for small patches, bypassing the skin barrier.'),
        (v_case_id, 'What is the name for complete loss of all scalp hair?', '["Alopecia totalis","Alopecia universalis","Telogen effluvium","Traction alopecia"]', 0, 'Alopecia totalis = whole scalp; Alopecia universalis = whole body hair.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Weeping Face in the Toddler
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Weeping Face in the Toddler', 'An 18-month-old child presents with an intensely itchy rash on his cheeks and the folds of his elbows. He has a history of asthma.

Vitals: Normal.
Physical Examination: Erythematous, poorly demarcated, weeping plaques with crusting on the face. Lichenification (thickening) is seen in the antecubital and popliteal fossae.
Laboratory Results: None.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Foundation'' of long-term management for atopic dermatitis?', '["Topical steroids","Frequent use of thick emollients (moisturizers) to restore the skin barrier","Daily swimming","Antibiotics"]', 1, 'Maintaining skin hydration and barrier function is critical to reduce flares.'),
        (v_case_id, 'For acute flares of dermatitis, what is the best initial treatment?', '["Oral Prednisone","Topical corticosteroids (matching potency to the body site)","Topical antifungal","Oral Antihistamines as primary treatment"]', 1, 'Low-potency steroids are used for the face/skin folds; higher potency for the body.'),
        (v_case_id, 'If the child develops a sudden eruption of painful, ''punched-out'' erosions on top of the eczema, what should you suspect?', '["Bacterial superinfection","Eczema Herpeticum (HSV infection)","SJS","Molluscum"]', 1, 'Eczema herpeticum is a dermatologic emergency requiring prompt acyclovir.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Golden Crust
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Golden Crust', 'A 5-year-old boy presents with ''sores'' around his nose and mouth that began as small blisters and have now turned into ''honey-colored'' crusts.

Vitals: Normal.
Physical Examination: Multiple erythematous erosions with adherent golden-yellow crusts on the perioral area. No fever.
Laboratory Results: Gram stain shows Gram-positive cocci in clusters.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial treatment for localized impetigo (a few lesions)?', '["Topical Mupirocin ointment","Oral Cephalexin","Topical steroids","Soap and water only"]', 0, 'Topical mupirocin is sufficient for limited, non-bullous impetigo.'),
        (v_case_id, 'Which organism is the most common cause of both bullous and non-bullous impetigo?', '["Streptococcus pyogenes","Staphylococcus aureus","Pseudomonas","MRSA only"]', 1, 'S. aureus is now the most frequent isolate.'),
        (v_case_id, 'What is a potential ''Nonsuppurative'' complication of impetigo caused by Group A Strep?', '["Acute Rheumatic Fever","Post-streptococcal Glomerulonephritis (PSGN)","Sepsis","Meningitis"]', 1, 'PSGN can follow strep skin infections, but Rheumatic Fever generally only follows strep pharyngitis.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Painful Rash and the ''Crops'' of Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Rash and the ''Crops'' of Blisters', 'A 65-year-old male presents with burning pain followed by a rash on one side of his chest.

Vitals: Normal.
Physical Examination: Clusters of vesicles on an erythematous base in a dermatomal distribution (T4) on the right side. The rash does not cross the midline.
Laboratory Results: Tzanck smear shows multinucleated giant cells.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial treatment to reduce the duration of symptoms and the risk of Post-herpetic Neuralgia (PHN)?', '["Topical Acyclovir","Oral Valacyclovir or Famciclovir within 72 hours of onset","Oral Prednisone alone","Pain medication only"]', 1, 'Early antiviral therapy is the standard of care.'),
        (v_case_id, 'If the patient develops a vesicle on the tip of his nose (Hutchinson sign), what is the next step?', '["Topical Bacitracin","Urgent Ophthalmology consultation (risk of Zoster Ophthalmicus)","Add oral steroids","Ignore it"]', 1, 'V1 involvement can lead to keratitis and permanent vision loss.'),
        (v_case_id, 'Which vaccine is recommended for adults >= 50 years to prevent this condition?', '["MMR","Recombinant Zoster Vaccine (Shingrix)","Pneumococcal vaccine","None"]', 1, 'Shingrix is a highly effective 2-dose series for older adults.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Itchy Welts
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Welts', 'A 30-year-old woman presents with itchy ''hives'' that appear and disappear within a few hours. This has been happening daily for 2 months.

Vitals: Normal.
Physical Examination: Multiple edematous, erythematous plaques (wheals) on the trunk and limbs. No individual lesion lasts more than 24 hours.
Laboratory Results: None.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the first-line treatment for chronic urticaria?', '["Oral Prednisone","Second-generation H1 antihistamines (e.g., Cetirizine, Loratadine) at standard or high doses","Skin biopsy","Strict diet"]', 1, 'Non-sedating antihistamines are the foundation of therapy. Prednisone is avoided for chronic management.'),
        (v_case_id, 'If a single lesion lasts more than 24 hours and leaves a bruise (purpura) when it resolves, what should you suspect?', '["Simple allergy","Urticarial Vasculitis (requires biopsy)","SJS","Spider bite"]', 1, 'This ''red flag'' distinguishes vasculitis from simple urticaria.'),
        (v_case_id, 'Is extensive allergy testing (RAST/Skin tests) usually helpful for CHRONIC (>6 weeks) urticaria?', '["Yes, always","No, an external trigger is rarely found in chronic spontaneous urticaria","Only in children","None"]', 1, 'Extensive workups are generally low-yield and not recommended unless specific triggers are suggested by history.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Shiny Pink Patch and the Sun
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Shiny Pink Patch and the Sun', 'A 70-year-old male presents with a ''pimple'' on his nose that has been bleeding occasionally and hasn''t healed for 4 months.

Vitals: Normal.
Physical Examination: A pearly, pink papule with a ''rolled'' border and visible small blood vessels (telangiectasias). Central ulceration is present.
Laboratory Results: Biopsy shows nests of basaloid cells with peripheral palisading.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the treatment of choice for a high-risk BCC located on the ''H-zone'' of the face (nose, eyes, lips)?', '["Cryotherapy (freezing)","Mohs Micrographic Surgery","Topical 5-FU","Simple excision with 1 cm margins"]', 1, 'Mohs surgery allows for the highest cure rate and maximum tissue sparing in cosmetically sensitive/high-risk areas.'),
        (v_case_id, 'Does BCC have a high risk of distant metastasis?', '["Yes","No, it is locally invasive but almost never metastasizes","Only if it is red","None"]', 1, 'BCC''s danger lies in its local destruction of skin, muscle, and bone.'),
        (v_case_id, 'What is the primary risk factor for developing BCC?', '["Smoking","Chronic UV radiation (sun exposure)","Arsenic","Viruses"]', 1, 'Sun protection is the most important preventive measure.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Scaly Patch that Won''t Go Away
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Patch that Won''t Go Away', 'A 65-year-old fair-skinned male has a 1-cm, red, scaly, and crusty patch on his lower lip that sometimes feels ''gritty'' like sandpaper.

Vitals: Normal.
Physical Examination: A firm, erythematous, scaly plaque on the vermilion border of the lower lip. No palpable lymphadenopathy.
Laboratory Results: Biopsy shows full-thickness atypia of keratinocytes and invasion into the dermis.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the precursor lesion to SCC called?', '["Seborrheic keratosis","Actinic keratosis","Molluscum","Dermatofibroma"]', 1, 'Actinic keratoses (AKs) are ''pre-cancers'' that can progress to SCC.'),
        (v_case_id, 'SCCs on the lip or ear have a higher risk of which complication compared to those on the trunk?', '["Metastasis","Bleeding","Infection","Healing faster"]', 0, 'Lip and ear lesions are considered high-risk sites for SCC metastasis.'),
        (v_case_id, 'If a patient has many scattered actinic keratoses (''field cancerization''), what is a good treatment option?', '["Individual cryotherapy for each","Field therapy (e.g., Topical 5-Fluorouracil or Imiquimod)","Oral chemotherapy","None"]', 1, 'Field therapy treats both visible and subclinical AKs.');

    ---------------------------------------------------------------------------
    -- CASE 17: The Itchy Ring
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Ring', 'A 20-year-old wrestler presents with a red, ''ring-shaped'' rash on his arm that has been expanding.

Vitals: Normal.
Physical Examination: An annular erythematous plaque with a scaly, active border and central clearing.
Laboratory Results: KOH prep from the scaly edge shows branching, septate hyphae.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the first-line treatment for localized tinea corporis?', '["Oral Griseofulvin","Topical antifungals (e.g., Clotrimazole, Terbinafine cream)","Topical Nystatin","Topical Steroids"]', 1, 'Unlike tinea capitis, tinea corporis usually responds well to topical therapy.'),
        (v_case_id, 'Why should Nystatin be avoided in the treatment of Tinea (dermatophytes)?', '["It''s too expensive","Nystatin only works for Candida, not dermatophytes (Tinea)","It''s too strong","None"]', 1, 'This is a frequent ''distractor'' on Step exams.'),
        (v_case_id, 'What is the term for a tinea infection that has been worsened/altered by the use of topical steroids?', '["Tinea incognito","Tinea capitis","Majocchi granuloma","None"]', 0, 'Steroids suppress the inflammation but allow the fungus to thrive and spread deeper.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Painful Armpit Bumps
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Armpit Bumps', 'A 24-year-old obese female presents with recurrent, painful ''boils'' in her armpits that leave scars.

Vitals: Normal.
Physical Examination: Multiple inflammatory nodules, abscesses, and ''double-headed'' comedones in the axillae. Sinus tracts and ''bridge'' scars are present.
Laboratory Results: None.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary management strategy for HS?', '["Repeat incision and drainage of every lesion","Weight loss, smoking cessation, and step-wise therapy (Topical clindamycin -> Oral tetracyclines -> Biologics/Surgery)","Continuous high-dose oral steroids","Long-term IV antibiotics"]', 1, 'HS is a chronic inflammatory condition, not a simple recurrent infection.'),
        (v_case_id, 'What is the Hurley Staging system used for?', '["Acne severity","Categorizing the severity of HS (Stage I: no tracts; II: limited tracts; III: diffuse involvement/interconnected tracts)","Melanoma depth","None"]', 1, 'Management depends heavily on the Hurley stage.'),
        (v_case_id, 'Which biologic agent is FDA-approved for moderate-to-severe HS?', '["Rituximab","Adalimumab (Anti-TNF)","Infliximab","None"]', 1, 'TNF-alpha inhibitors have shown efficacy in severe HS cases.');

    ---------------------------------------------------------------------------
    -- CASE 19: The Mouth Patches in the Newborn
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mouth Patches in the Newborn', 'A 2-week-old infant presents with white patches in his mouth. He is breastfeeding well but his mother has ''nipple pain''.

Vitals: Normal.
Physical Examination: Adherent white plaques on the buccal mucosa and tongue that bleed slightly when scraped off with a tongue depressor.
Laboratory Results: KOH shows budding yeast and pseudohyphae.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial treatment for an infant with oral thrush?', '["Oral Nystatin suspension","Oral Griseofulvin","Topical Mupirocin","IV Fluconazole"]', 0, 'Nystatin ''swish and swallow'' is the standard first-line for infantile thrush.'),
        (v_case_id, 'Should the mother also be evaluated and treated?', '["No, it''s not related","Yes, the mother''s nipples should be treated with topical antifungal to prevent a cycle of reinfection","Only if she has a fever","None"]', 1, 'Candida can be passed back and forth between the infant''s mouth and the mother''s nipple.'),
        (v_case_id, 'In an adult, what condition should recurrent or refractory oral thrush prompt evaluation for?', '["Diabetes","HIV infection","Immunosuppressive medication use","All of the above"]', 3, 'Thrush in a healthy-appearing adult is a major red flag for immune dysfunction.');

    ---------------------------------------------------------------------------
    -- CASE 20: The Sudden Wide Rash (Drug?)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Wide Rash (Drug?)', 'A patient develops a red, symmetric rash on his trunk 5 days after starting a new medication for a sinus infection.

Vitals: Normal (no fever).
Physical Examination: Bright red macules and papules that are beginning to coalesce. No mucosal involvement. No skin tenderness or blisters.
Laboratory Results: Normal.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely ''latency'' for this type of common drug rash?', '["30 minutes","7-14 days after starting the drug (can be shorter on re-exposure)","1 year","None"]', 1, 'This is a delayed Type IV hypersensitivity reaction.'),
        (v_case_id, 'What is the first step in management?', '["Biopsy","Discontinue the suspected drug","Start Prednisone","Give IVIG"]', 1, 'The most important management step for any suspected drug eruption is stopping the culprit.'),
        (v_case_id, 'Which symptom would be a ''Red Flag'' suggesting a more severe reaction like SJS or DRESS?', '["Itching","Fever, facial edema, or skin tenderness","Slight redness","None"]', 1, 'Systemic symptoms and skin pain distinguish simple rashes from life-threatening ones.');

    ---------------------------------------------------------------------------
    -- CASE 21: The Christmas Tree Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Christmas Tree Rash', 'A 20-year-old female presents with a single, large, scaly red patch on her back, followed 1 week later by many smaller patches on her trunk.

Vitals: Normal.
Physical Examination: One 4-cm oval plaque with a ''collarette'' of scale (Herald Patch). Dozens of smaller oval plaques follow the skin tension lines in a ''Christmas tree'' distribution on the back.
Laboratory Results: RPR is negative.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the standard management for Pityriasis Rosea?', '["Oral Antifungals","Reassurance and supportive care for itching (it usually resolves spontaneously in 6-8 weeks)","Oral Steroids","Topical Antibiotics"]', 1, 'PR is a self-limited condition of suspected viral origin.'),
        (v_case_id, 'Why is an RPR often performed in cases that look like Pityriasis Rosea?', '["PR is caused by syphilis","Secondary syphilis can perfectly mimic the rash of PR (including the distribution on the trunk)","To check for pregnancy","None"]', 1, 'This is a classic ''must-rule-out'' on Step exams.'),
        (v_case_id, 'The Herald Patch is often misdiagnosed as which condition?', '["Eczema","Tinea Corporis (Ringworm)","Psoriasis","Acne"]', 1, 'Because of its annular, scaly appearance, it is frequently mistaken for fungus.');

    ---------------------------------------------------------------------------
    -- CASE 22: The Flushed Face and the Alcohol
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Flushed Face and the Alcohol', 'A 45-year-old female presents with ''flushing'' episodes. She notices her face gets very red and hot after she drinks a glass of red wine or eats spicy food.

Vitals: Normal.
Physical Examination: Central facial erythema and telangiectasias. No papules or pustules. A few small, red ''bumps'' are noted on the conjunctiva.
Laboratory Results: None.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the first-line management for the erythema (redness) of rosacea?', '["Topical steroids","Trigger avoidance and sun protection; consider topical brimonidine or laser therapy for persistent redness","Oral antibiotics","Oral Isotretinoin"]', 1, 'Steroids are avoided as they can cause ''steroid-induced rosacea''.'),
        (v_case_id, 'Which of the following is a common trigger for rosacea flushing?', '["Cold water","Sunlight, heat, alcohol, and spicy foods","Green vegetables","Reading"]', 1, 'These are the classic ''Step'' triggers.'),
        (v_case_id, 'Chronic rosacea can lead to irreversible skin thickening on the nose, called:', '["Rhinophyma","Rosacea totalis","Nasal warts","None"]', 0, 'Rhinophyma is more common in men and may require surgical intervention.');

    ---------------------------------------------------------------------------
    -- CASE 23: The Warty Bumps and the Pool
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Warty Bumps and the Pool', 'A 7-year-old boy presents with dozens of small, ''shiny'' bumps on his trunk and arms. He is on a local swim team.

Vitals: Normal.
Physical Examination: 2-5 mm skin-colored, firm, dome-shaped papules with a central dimple (umbilication).
Laboratory Results: None.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of Molluscum Contagiosum?', '["HPV","Poxvirus","Herpes virus","Bacteria"]', 1, 'It is a highly contagious poxvirus infection.'),
        (v_case_id, 'In an immunocompetent child, what is the best initial management approach?', '["Aggressive cryotherapy","Observation (it typically resolves spontaneously over months to years)","Oral Acyclovir","Topical Steroids"]', 1, 'While treatment (curettage, cryo) is an option, watchful waiting is often preferred in children to avoid pain/scarring.'),
        (v_case_id, 'Extensive, giant, or refractory molluscum in an adult should prompt testing for:', '["Diabetes","HIV","Liver failure","Vitamin deficiency"]', 1, 'Widespread molluscum in an adult is a strong indicator of cellular immunodeficiency.');

    ---------------------------------------------------------------------------
    -- CASE 24: The Painful Mouth and the Tense Blister
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Mouth and the Tense Blister', 'An 80-year-old male presents with widespread, very itchy, large blisters on his thighs and abdomen.

Vitals: Normal.
Physical Examination: Multiple large, tense bullae on an erythematous base. Nikolsky sign is negative. The mouth is unaffected.
Laboratory Results: DIF shows a linear band of IgG and C3 along the basement membrane.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the target of autoantibodies in Bullous Pemphigoid?', '["Desmosomes","Hemidesmosomes (BP180 and BP230)","Type IV Collagen","Basal cells"]', 1, 'BP involves the ''anchor'' of the basal layer to the basement membrane.'),
        (v_case_id, 'How is localized or mild Bullous Pemphigoid typically treated?', '["Systemic chemotherapy","High-potency topical corticosteroids (can be as effective as oral with fewer side effects)","IV Antibiotics","Observation only"]', 1, 'Recent studies favor high-potency topicals over systemic steroids for BP, especially in the elderly.'),
        (v_case_id, 'What is a common PRODROMAL symptom of Bullous Pemphigoid that can precede blisters by months?', '["Fever","Intense generalized itching (pruritus) or urticarial-like plaques","Mouth sores","None"]', 1, 'Elderly patients with ''refractory itch'' should be monitored for BP.');

    ---------------------------------------------------------------------------
    -- CASE 25: The Scaly Scalp and the Red Face
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Scalp and the Red Face', 'A 35-year-old male presents with ''dandruff'' and red, itchy skin in his eyebrows and around his nose.

Vitals: Normal.
Physical Examination: Erythema and ''greasy'' yellow scale on the scalp, eyebrows, nasolabial folds, and chest.
Laboratory Results: None.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which organism is thought to play a role in the pathogenesis of seborrheic dermatitis?', '["Staphylococcus","Malassezia (yeast)","Candida","Dermatophytes"]', 1, 'The yeast triggers an inflammatory response in areas with high sebum production.'),
        (v_case_id, 'What is the best initial treatment for the face and scalp?', '["Topical Metronidazole","Topical antifungals (e.g., Ketoconazole shampoo/cream) and mild topical steroids","Oral Terbinafine","Daily face scrubbing with alcohol"]', 1, 'A combination of antifungal (to reduce Malassezia) and anti-inflammatory (steroid) is most effective.'),
        (v_case_id, 'Severe or ''explosive'' onset of seborrheic dermatitis can be an early sign of which systemic infection?', '["Hepatitis B","HIV","Syphilis","Tuberculosis"]', 1, 'Seborrheic dermatitis is famously more severe and widespread in HIV-positive patients.');

    ---------------------------------------------------------------------------
    -- CASE 26: The Rapidly Growing ''Nodule'' on the Leg
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapidly Growing ''Nodule'' on the Leg', 'A 60-year-old male presents with a painful, firm red nodule on his shin that has grown to 2 cm in just 6 weeks.

Vitals: Normal.
Physical Examination: A dome-shaped, firm, erythematous nodule with a central ''keratinous plug'' (crater-like center).
Laboratory Results: Biopsy shows well-differentiated squamous epithelium.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the characteristic clinical behavior of a Keratoacanthoma?', '["Slowly progressive growth over years","Rapid initial growth over weeks followed by potential spontaneous regression","Never regresses","Metastasizes early"]', 1, 'KAs are known for their ''volcano-like'' rapid growth and potential to disappear, but they are often treated as SCCs.'),
        (v_case_id, 'How should a Keratoacanthoma be managed in clinical practice?', '["Observation to see if it regresses","Complete surgical excision (similar to Squamous Cell Carcinoma)","Cryotherapy only","Topical antibiotics"]', 1, 'Since it is histologically difficult to distinguish KA from a well-differentiated SCC, the standard management is excision.'),
        (v_case_id, 'Which of the following is the most likely risk factor for KA?', '["Smoking","UV radiation and chemical carcinogens","Viruses","Low fiber diet"]', 1, 'Sun exposure is the primary driver.');

    ---------------------------------------------------------------------------
    -- CASE 27: The Itchy Patient with Weight Loss
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Patient with Weight Loss', 'A 70-year-old male presents with generalized itching (pruritus) that has kept him awake at night for 3 months. He has no visible rash. He has also lost 10 lbs.

Vitals: Normal.
Physical Examination: Normal, except for multiple scratch marks (excoriations) on the back and limbs.
Laboratory Results: Hemoglobin 10.0 (Low), Ferritin 8 (Low). Chest X-ray is normal.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'When a patient presents with generalized pruritus WITHOUT a primary skin rash, what is the best initial approach?', '["Start topical steroids","Perform a thorough systemic workup (CBC, BMP, LFTs, TSH, Chest X-ray, and Iron studies)","Assume it''s dry skin and give moisturizers","Biopsy the normal skin"]', 1, 'Generalized pruritus without rash is a ''systemic itch'' and requires evaluation for renal, hepatic, endocrine, or hematologic disease.'),
        (v_case_id, 'The patient''s low iron (iron deficiency anemia) is most commonly associated with which malignancy in an older male?', '["Lung cancer","Colorectal cancer (Gastrointestinal blood loss)","Leukemia","Skin cancer"]', 1, 'Iron deficiency in an older adult is ''colon cancer until proven otherwise''.'),
        (v_case_id, 'Which systemic condition is notoriously associated with ''aquagenic pruritus'' (itching after a hot shower)?', '["Diabetes","Polycythemia Vera","Hypothyroidism","Lupus"]', 1, 'This is a classic USMLE Step 2 ''buzzword'' association.');

    ---------------------------------------------------------------------------
    -- CASE 28: The Purpuric Patient
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Purpuric Patient', 'A 40-year-old woman presents with many small ''purple dots'' on her lower legs. She was recently treated for a sore throat.

Vitals: Normal.
Physical Examination: Multiple 2-4 mm palpable purpura on the bilateral shins and ankles. Abdominal exam is normal.
Laboratory Results: UA shows 2+ blood and 1+ protein. Platelet count is normal.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial Test'' to confirm the diagnosis of small-vessel vasculitis?', '["Blood cultures","Skin biopsy (Punch biopsy)","ANA","Chest X-ray"]', 1, 'A skin biopsy is required to see the characteristic neutrophilic inflammation of the vessel walls (LCV).'),
        (v_case_id, 'Given the urine findings (hematuria/proteinuria), what is the most important next step?', '["More skin biopsies","Evaluation for systemic involvement (Renal workup with Cr and potentially a renal biopsy)","Check for vitamin deficiency","Stop all salt intake"]', 1, 'Purpura + Hematuria suggests a systemic vasculitis affecting both skin and kidneys.'),
        (v_case_id, 'Which type of vasculitis is most associated with Hepatitis C infection?', '["GPA","Mixed Cryoglobulinemia","HSP","Kawasaki"]', 1, 'Cryoglobulinemic vasculitis often presents with purpura and is strongly linked to chronic Hep C.');

    ---------------------------------------------------------------------------
    -- CASE 29: The Sudden Facial Pain and Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Facial Pain and Blisters', 'A 70-year-old male with a history of lymphoma presents with a very painful rash on his forehead that involves the tip of his nose.

Vitals: Normal.
Physical Examination: Clusters of vesicles and crusts in the V1 distribution. A prominent vesicle is seen on the tip of the nose (Hutchinson sign).
Laboratory Results: None.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the significance of the Hutchinson sign (vesicle on the nose tip)?', '["It means the rash is healing","It indicates involvement of the nasociliary nerve, which also supplies the eye","It is caused by a different virus","None"]', 1, 'The nasociliary nerve is a branch of V1; its involvement highly correlates with ocular zoster.'),
        (v_case_id, 'What is the most important immediate step in management?', '["Start oral Valacyclovir","Urgent slit-lamp examination by an ophthalmologist","Topical steroids to the eye","Wait for the rash to crust over"]', 1, 'Identifying early keratitis or uveitis is critical to prevent permanent vision loss.'),
        (v_case_id, 'Which medication should be AVOIDED for the eye unless directed by an ophthalmologist?', '["Artificial tears","Topical corticosteroids (can worsen HSV/VZV keratitis if not monitored)","Topical antibiotics","None"]', 1, 'Indiscriminate use of topical steroids in the eye can be dangerous.');

    ---------------------------------------------------------------------------
    -- CASE 30: The Red Eyes and the Skin Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red Eyes and the Skin Pain', 'A patient presents with a severe rash and ''skin pain'' 2 weeks after starting Carbamazepine. She also has a fever and mouth sores.

Vitals: T 38.8 C, BP 90/60 mmHg.
Physical Examination: Dusky, erythematous macules that are beginning to slough. The lips are severely eroded with bleeding. Nikolsky sign is positive. Approximately 15% of the body surface area (BSA) is involved.
Laboratory Results: None.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most critical first step in management?', '["Give high-dose steroids","Identify and immediately discontinue the suspected offending drug (Carbamazepine)","Wait for a biopsy result","Give IVIG"]', 1, 'Prompt withdrawal of the culprit drug is the single most important factor in survival.'),
        (v_case_id, 'Where should this patient be ideally managed?', '["General medical floor","Intensive Care Unit or Burn Unit","Home with follow-up","Outpatient dermatology clinic"]', 1, 'SJS/TEN requires specialized care for fluid balance, wound management, and infection control, similar to large burns.'),
        (v_case_id, 'What is the major long-term complication of SJS/TEN if the eyes are involved?', '["Glaucoma","Ocular scarring, symblepharon, and blindness","Cataracts","None"]', 1, 'Aggressive ophthalmologic care is required to prevent permanent ocular sequelae.');

    ---------------------------------------------------------------------------
    -- CASE 31: The Symmetric Leg Redness (A Trap)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Symmetric Leg Redness (A Trap)', 'A 60-year-old male with chronic heart failure presents with redness, warmth, and swelling of both lower legs. He has been told he has ''recurrent cellulitis'' that never goes away with antibiotics.

Vitals: Normal.
Physical Examination: Bilateral, symmetric erythema and ''woody'' induration of the lower legs. Pitting edema is present. No fever or elevated WBC.
Laboratory Results: None.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely reason this patient''s ''cellulitis'' is not responding to antibiotics?', '["Resistance to antibiotics","The diagnosis is actually Stasis Dermatitis (due to venous insufficiency), not cellulitis","It is a fungal infection","None"]', 1, 'Cellulitis is almost always unilateral. Bilateral, symmetric redness is a classic ''Step'' trap for stasis dermatitis.'),
        (v_case_id, 'What is the ''Best Next Step'' in management for this patient?', '["Switch to IV antibiotics","Leg elevation and compression stockings","Surgical debridement","Topical antifungals"]', 1, 'Management of the underlying venous hypertension is the primary treatment.'),
        (v_case_id, 'What is the term for the chronic skin changes (thickened, ''inverted champagne bottle'' leg) seen in advanced venous insufficiency?', '["Lipodermatosclerosis","Cellulitis","Erysipelas","Necrotizing fasciitis"]', 0, 'This represents chronic fibrotic changes in the skin and subcutaneous fat.');

    ---------------------------------------------------------------------------
    -- CASE 32: The Itchy Child and the Dog
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Child and the Dog', 'A 10-year-old boy presents with an itchy, scaly rash on his arm. His family recently got a new puppy.

Vitals: Normal.
Physical Examination: An annular erythematous plaque with a scaly, active border on the forearm.
Laboratory Results: KOH prep shows hyphae.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common source of infection in this case?', '["Human-to-human contact","Zoonotic transmission from the new puppy (e.g., Microsporum canis)","Soil","Dirty clothes"]', 1, 'New pets are a frequent source of tinea corporis in children.'),
        (v_case_id, 'What is the best initial treatment?', '["Oral Griseofulvin","Topical Clotrimazole or Terbinafine cream","Topical Nystatin","Topical Betamethasone"]', 1, 'Topical antifungals are first-line for limited tinea corporis.'),
        (v_case_id, 'Should the puppy be evaluated?', '["No, animals don''t get fungus","Yes, the pet should be seen by a veterinarian to prevent reinfection of the family","Only if the dog is scratching","None"]', 1, 'Treating the reservoir is essential for eradication.');

    ---------------------------------------------------------------------------
    -- CASE 33: The Painful Mouth and the Tense Blister (Management)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Mouth and the Tense Blister (Management)', 'An 80-year-old female presents with widespread tense blisters and severe itching. She has multiple comorbidities and is at high risk for infection.

Vitals: Normal.
Physical Examination: Multiple large, tense bullae. Nikolsky negative.
Laboratory Results: Biopsy and DIF confirm Bullous Pemphigoid.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Given her high risk for systemic side effects, what is a preferred first-line treatment for widespread Bullous Pemphigoid?', '["High-dose oral Prednisone","Whole-body application of high-potency topical corticosteroids (e.g., Clobetasol)","Methotrexate","Observation"]', 1, 'Large-scale trials have shown that topical Clobetasol is as effective as oral Prednisone for BP but with significantly lower mortality and fewer side effects.'),
        (v_case_id, 'What is the primary goal of treatment in this elderly patient?', '["Complete cure with no maintenance","Disease control with the minimum effective dose of immunosuppression","Immediate surgical removal of all blisters","None"]', 1, 'BP is often chronic and requires balanced management to avoid iatrogenic complications.'),
        (v_case_id, 'Which medication can be used as a ''steroid-sparing'' agent in chronic Bullous Pemphigoid?', '["Azathioprine or Mycophenolate mofetil","Penicillin","Acyclovir","None"]', 0, 'Steroid-sparing agents help reduce the long-term burden of corticosteroids.');

    ---------------------------------------------------------------------------
    -- CASE 34: The Rapidly Progressing Painful Leg
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapidly Progressing Painful Leg', 'A 45-year-old diabetic male presents with severe pain in his right leg that is ''out of proportion'' to the physical exam. He has a high fever and is feeling dizzy.

Vitals: T 39.5 C, BP 85/50, HR 125.
Physical Examination: The skin is dusky-red and warm, but there is noticeable ''crepitus'' (crunching feeling) on palpation. The area is rapidly becoming necrotic.
Laboratory Results: WBC 30,000. CT shows gas in the deep tissue planes.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Next Step'' in the management of suspected necrotizing fasciitis?', '["Start IV antibiotics and wait for response","Immediate surgical consultation for emergent debridement and exploration","MRI of the leg","Biopsy of the skin"]', 1, 'Necrotizing fasciitis is a surgical emergency. Delaying surgery for imaging or antibiotic response increases mortality.'),
        (v_case_id, 'What does ''pain out of proportion to exam'' classically signify in this context?', '["Malingering","Deep tissue involvement and nerve irritation/necrosis beneath the surface","Anxiety","None"]', 1, 'This is a key early clinical warning sign for necrotizing infections.'),
        (v_case_id, 'The presence of crepitus indicates what?', '["Broken bone","Gas-producing organisms (e.g., Clostridium or polymicrobial infection)","Normal finding","None"]', 1, 'Crepitus reflects gas formation in the soft tissues.');

    ---------------------------------------------------------------------------
    -- CASE 35: The Scaly Patch and the HIV Link
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Patch and the HIV Link', 'A 30-year-old male presents with severe ''dandruff'' and a red, scaly rash on his face. He also mentions having recurrent pneumonia.

Vitals: Normal.
Physical Examination: Greasy, yellow scale on the scalp, eyebrows, and nasolabial folds. The rash is unusually widespread, involving the chest and groin.
Laboratory Results: None.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most appropriate diagnostic step for this patient?', '["Fungal culture of the skin","HIV testing","Skin biopsy","Liver function tests"]', 1, 'Severe, sudden, or refractory seborrheic dermatitis is a classic ''Step 2'' indicator for HIV screening.'),
        (v_case_id, 'What is the first-line treatment for the skin rash?', '["Oral Prednisone","Topical Ketoconazole and low-potency topical steroids","Oral Griseofulvin","None"]', 1, 'Standard treatment for seborrheic dermatitis is still effective, but the underlying immune status must be addressed.'),
        (v_case_id, 'Which other skin condition is commonly seen alongside seborrheic dermatitis in HIV patients?', '["Psoriasis","Oral Hairy Leukoplakia (EBV-related)","Acne","Rosacea"]', 1, 'HIV is associated with a wide range of dermatologic clues.');

    ---------------------------------------------------------------------------
    -- CASE 36: The Suspect Patch on the Leg
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Suspect Patch on the Leg', 'A 60-year-old male presents with a flat, red, scaly patch on his lower leg that has been present for a year and does not respond to moisturizers.

Vitals: Normal.
Physical Examination: A well-demarcated, erythematous scaly plaque. No nodules are felt.
Laboratory Results: Biopsy shows full-thickness keratinocyte atypia without invasion into the dermis.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the diagnosis for SCC that is confined to the epidermis?', '["Actinic Keratosis","Bowen''s Disease (SCC in situ)","Invasive SCC","Basal Cell Carcinoma"]', 1, 'Bowen''s disease is the ''pre-invasive'' form of SCC.'),
        (v_case_id, 'What is the best initial treatment for a single lesion of Bowen''s disease?', '["Topical antibiotics","Surgical excision, Cryotherapy, or Topical 5-Fluorouracil","Chemotherapy","Wait and watch"]', 1, 'There are multiple effective options depending on the site and size.'),
        (v_case_id, 'If the biopsy had shown ''invasion into the dermis'', how would the management change?', '["It wouldn''t","It would require wider margins and evaluation for high-risk features/metastasis","Only topical therapy would be needed","None"]', 1, 'Invasive SCC requires more aggressive management.');

    ---------------------------------------------------------------------------
    -- CASE 37: The Red-Faced Alcoholic
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red-Faced Alcoholic', 'A 50-year-old male with a history of alcohol use disorder presents with a red, ''swollen'' nose that has become lumpy over time.

Vitals: Normal.
Physical Examination: Marked hypertrophy and irregular thickening of the skin of the nose with prominent pores (Rhinophyma). Central facial erythema and telangiectasias.
Laboratory Results: None.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Rhinophyma is a subtype of which condition?', '["Acne","Rosacea (Phymatous subtype)","Skin cancer","Infection"]', 1, 'It represents advanced sebaceous gland hyperplasia and fibrosis in rosacea.'),
        (v_case_id, 'Does medical therapy (e.g., Metronidazole) typically reverse rhinophyma?', '["Yes","No, surgical intervention (e.g., CO2 laser or surgical paring) is usually required for cosmetic correction","Only if combined with alcohol","None"]', 1, 'Fibrotic changes do not respond well to medications.'),
        (v_case_id, 'Is rhinophyma caused by alcohol consumption?', '["Yes, exclusively","No, but alcohol can exacerbate the underlying rosacea and flushing","Alcohol prevents it","None"]', 1, 'The ''drinker''s nose'' is a common misconception; alcohol is a trigger, not the cause.');

    ---------------------------------------------------------------------------
    -- CASE 38: The Itchy Groin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Groin', 'A 20-year-old male presents with an itchy rash in his groin. He has been using over-the-counter Clotrimazole for a week with no improvement.

Vitals: Normal.
Physical Examination: Well-demarcated, reddish-brown patches in the inguinal folds. Under a Wood''s lamp, the area shows a ''coral-red'' fluorescence.
Laboratory Results: KOH prep is negative for hyphae.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative organism of Erythrasma?', '["Trichophyton rubrum (Fungus)","Corynebacterium minutissimum (Bacterium)","Candida albicans","Staphylococcus aureus"]', 1, 'Erythrasma is a superficial bacterial infection, which explains why it doesn''t respond to antifungals.'),
        (v_case_id, 'The ''coral-red'' fluorescence is due to the production of what by the bacteria?', '["Pus","Porphyrins","Chlorophyll","None"]', 1, 'The bacteria produce porphyrins that fluoresce under UVA light.'),
        (v_case_id, 'What is the best initial treatment for Erythrasma?', '["Topical Clotrimazole","Topical Erythromycin or Clindamycin","Oral Fluconazole","Topical Steroids"]', 1, 'Topical antibiotics are highly effective.');

    ---------------------------------------------------------------------------
    -- CASE 39: The Scaly Hand and the Foot
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Hand and the Foot', 'A 40-year-old male presents with scaly skin on his left palm and both of his feet. He has had this for years.

Vitals: Normal.
Physical Examination: Diffuse scaling and thickening (hyperkeratosis) of the left palm and the soles of both feet (Two-foot, one-hand syndrome).
Laboratory Results: KOH prep of the scale shows hyphae.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Two-foot, one-hand syndrome''?', '["A genetic disorder","A classic clinical pattern of dermatophyte infection (Tinea)","A type of eczema","None"]', 1, 'This asymmetric pattern is a high-yield diagnostic clue for fungus.'),
        (v_case_id, 'What is the most common causative organism?', '["Trichophyton rubrum","Candida","Staph aureus","None"]', 0, 'T. rubrum is the leading cause of chronic dermatophytosis.'),
        (v_case_id, 'Which associated condition should be treated to prevent recurrence?', '["Diabetes","Onychomycosis (nail fungus), which often acts as a reservoir","Heart failure","None"]', 1, 'Reservoirs must be cleared to avoid ''re-seeding'' the skin.');

    ---------------------------------------------------------------------------
    -- CASE 40: The Sudden Loss of All Hair
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Loss of All Hair', 'A 25-year-old male with a history of Hashimoto thyroiditis presents with complete loss of all hair on his scalp, eyebrows, and eyelashes over 3 months.

Vitals: Normal.
Physical Examination: Total absence of hair on the scalp and face. The skin is smooth and non-inflammatory.
Laboratory Results: TSH is slightly elevated.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How is this condition classified?', '["Alopecia Areata","Alopecia Totalis (Scalp only)","Alopecia Universalis (Total body hair loss)","Telogen Effluvium"]', 2, 'This is the most severe end of the alopecia areata spectrum.'),
        (v_case_id, 'What is the first-line treatment for such extensive hair loss?', '["Topical Minoxidil","Systemic therapy (e.g., JAK inhibitors, high-dose steroids, or contact immunotherapy) as topicals/injections are usually impractical","Antibiotics","None"]', 1, 'Widespread disease requires systemic approaches. JAK inhibitors have recently shown significant efficacy.'),
        (v_case_id, 'Is there a chance for hair regrowth?', '["Yes, but the prognosis is generally poor for alopecia universalis compared to patchy disease","No, it is permanent","Only if the thyroid is treated","None"]', 0, 'While regrowth can occur, universalis has high recurrence rates and is difficult to treat.');

    ---------------------------------------------------------------------------
    -- CASE 41: The Itchy Shins and the ''Dry Riverbed''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Shins and the ''Dry Riverbed''', 'An 80-year-old male presents with intense itching on his shins during the winter. He showers twice a day with hot water and soap.

Vitals: Normal.
Physical Examination: The skin on his shins looks dry, cracked, and resembles a ''dried-up riverbed'' or ''cracked porcelain''.
Laboratory Results: None.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary cause of Asteatotic Eczema?', '["Allergy","Loss of water/lipids from the stratum corneum (dry skin), often exacerbated by low humidity and over-washing","Fungal infection","None"]', 1, 'It is essentially ''extreme dry skin'' that becomes inflamed.'),
        (v_case_id, 'What is the best initial management step?', '["Topical antibiotics","Reduce bathing frequency, use lukewarm water, and apply thick emollients immediately after drying","Oral steroids","Scrubbing the dry skin off"]', 1, 'Lifestyle changes and aggressive moisturization are the pillars of therapy.'),
        (v_case_id, 'Which medication should be used sparingly if the skin is inflamed?', '["Emollients","Low-to-medium potency topical corticosteroids","Sunscreen","None"]', 1, 'Steroids help with the itch but should be tapered once the barrier is restored.');

    ---------------------------------------------------------------------------
    -- CASE 42: The Painful Tongue and the Weight Loss
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Tongue and the Weight Loss', 'A 50-year-old chronic alcoholic presents with a smooth, red, ''sore'' tongue and cracks at the corners of his mouth.

Vitals: Normal.
Physical Examination: Glossitis (smooth red tongue) and angular cheilitis (cracks at corners of mouth). He also has a scaly, red rash in his groin.
Laboratory Results: Hemoglobin 11.0 (Macrocytic).', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The combination of glossitis and angular cheilitis is a classic sign of which deficiencies?', '["Vitamin C","B-vitamins (especially B2 Riboflavin, B6 Pyridoxine, or B12)","Vitamin D","None"]', 1, 'Oral and perioral findings are hallmark signs of B-complex deficiencies.'),
        (v_case_id, 'Macrocytic anemia in an alcoholic is most likely due to a deficiency in:', '["Iron","Folate or Vitamin B12","Zinc","None"]', 1, 'Alcohol impairs the absorption and metabolism of these vitamins.'),
        (v_case_id, 'What is the first step in management?', '["Oral steroids","Replacement of the deficient vitamins and dietary improvement","Antibiotics for the mouth","None"]', 1, 'Direct replacement resolves the symptoms.');

    ---------------------------------------------------------------------------
    -- CASE 43: The Itchy Hands and the Career
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Hands and the Career', 'A 30-year-old nurse presents with a red, scaly, and itchy rash on the backs of her hands. It improves over the weekend and worsens at work.

Vitals: Normal.
Physical Examination: Erythema, scaling, and small fissures on the dorsal hands and finger webs.
Laboratory Results: Patch testing shows a positive reaction to nickel and fragrance.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Gold Standard'' test for diagnosing allergic contact dermatitis?', '["Skin prick test","Patch testing (delayed hypersensitivity)","RAST (blood test)","Biopsy only"]', 1, 'Patch testing evaluates Type IV hypersensitivity reactions.'),
        (v_case_id, 'How does Allergic Contact Dermatitis differ from Irritant Contact Dermatitis?', '["Allergic is more common","Allergic is an immune-mediated (Type IV) reaction; Irritant is a direct chemical/physical injury and does not require prior sensitization","There is no difference","Irritant is only on the face"]', 1, 'Irritant dermatitis (like from frequent handwashing) is much more common than true allergy.'),
        (v_case_id, 'What is the most important long-term management step?', '["Daily topical steroids","Strict avoidance of the identified allergen","Changing careers","None"]', 1, 'Avoidance is the only way to prevent recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 44: The Sudden Wide Rash (Infection?)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Wide Rash (Infection?)', 'A 5-year-old girl presents with a widespread, fine, red rash that feels like ''sandpaper''. She has a high fever and a sore throat.

Vitals: T 39.2 C.
Physical Examination: Diffuse erythematous rash that blanches. Prominent redness in the skin folds (Pastia lines). Strawberry tongue and bright red tonsils with exudate.
Laboratory Results: Rapid Strep test is positive.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of the rash in Scarlet Fever?', '["Direct bacterial infection of the skin","Erythrogenic toxin produced by Group A Streptococcus","Allergic reaction to cold","None"]', 1, 'The toxin spreads systemically from the site of pharyngeal infection.'),
        (v_case_id, 'What is the ''sandpaper'' texture characteristic of?', '["Psoriasis","Scarlet Fever","Eczema","Measles"]', 1, 'This is a classic ''Step 2'' descriptor for the scarlatiniform rash.'),
        (v_case_id, 'What is the treatment of choice?', '["Topical steroids","Oral Penicillin or Amoxicillin","Acyclovir","None"]', 1, 'Antibiotics treat the infection and prevent complications like Rheumatic Fever.');

    ---------------------------------------------------------------------------
    -- CASE 45: The Painful Bumps and the ''Target''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Bumps and the ''Target''', 'A 25-year-old male develops a sudden eruption of ''target-like'' lesions on his palms 1 week after having a cold sore on his lip.

Vitals: Normal.
Physical Examination: Multiple erythematous papules with a dusky center and a pale ring (target lesions) on the palms and soles.
Laboratory Results: Tzanck smear from the lip sore showed giant cells.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common trigger for Erythema Multiforme Minor?', '["Drugs","Herpes Simplex Virus (HSV) infection","Food allergy","None"]', 1, 'HSV is the most frequent trigger for EM Minor.'),
        (v_case_id, 'How does EM Minor differ from SJS?', '["EM Minor has target lesions and minimal/no mucosal involvement or skin sloughing; SJS is a severe drug reaction with extensive mucosal erosions and skin detachment","They are the same","EM is more dangerous","None"]', 0, 'EM is typically a self-limited, immune-mediated reaction to infection.'),
        (v_case_id, 'What is the management for recurrent EM linked to HSV?', '["Topical steroids only","Suppressive oral antiviral therapy (e.g., Acyclovir)","Chemotherapy","None"]', 1, 'Preventing the HSV flares prevents the EM flares.');

    ---------------------------------------------------------------------------
    -- CASE 46: The Scaly Patch in the Swimmer
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Patch in the Swimmer', 'A 12-year-old boy has a white, scaly patch on his cheek that becomes more noticeable in the summer when he tans.

Vitals: Normal.
Physical Examination: A poorly demarcated, hypopigmented, slightly scaly patch on the face. It does not itch or hurt.
Laboratory Results: KOH is negative.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Pityriasis alba is considered a minor manifestation of which condition?', '["Psoriasis","Atopic Dermatitis (Eczema)","Vitiligo","Tinea"]', 1, 'It is common in children with a history of eczema.'),
        (v_case_id, 'Why does it become ''more noticeable'' in the summer?', '["The rash spreads in the sun","The affected skin fails to tan normally compared to the surrounding healthy skin","It''s an allergy to the sun","None"]', 1, 'Post-inflammatory hypopigmentation becomes apparent when the rest of the skin darkens.'),
        (v_case_id, 'What is the best initial management?', '["Topical antifungals","Sun protection and emollients; sometimes a mild topical steroid if inflamed","Laser therapy","None"]', 1, 'Reassurance and moisturization are usually sufficient as it resolves with time.');

    ---------------------------------------------------------------------------
    -- CASE 47: The Itchy Groin (The Mirror)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Groin (The Mirror)', 'A 35-year-old obese male presents with a very red, ''burning'' rash in his groin. He has a history of poorly controlled diabetes.

Vitals: Normal.
Physical Examination: Bright red ''beefy'' plaques in the skin folds with ''satellite'' pustules at the edges (Mirror lesions).
Laboratory Results: KOH shows pseudohyphae.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the hallmark clinical finding of Candidal Intertrigo?', '["Target lesions","Beefy red plaques with satellite papules/pustules","Silvery scale","None"]', 1, 'The ''satellite'' lesions are a key differentiator from other types of intertrigo.'),
        (v_case_id, 'What is the best initial treatment?', '["Topical Nystatin or Clotrimazole","Topical Mupirocin","Topical Terbinafine","Topical Steroids only"]', 0, 'Candida is highly sensitive to Nystatin and azole antifungals.'),
        (v_case_id, 'Why is it important to check the blood sugar in this patient?', '["It isn''t","Hyperglycemia promotes the overgrowth of Candida in skin folds","Candida causes diabetes","None"]', 1, 'Controlling the underlying diabetes is key to preventing recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 48: The Waxy Bumps on the Eyelid
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Waxy Bumps on the Eyelid', 'An 80-year-old male presents with several skin-colored, waxy ''craters'' on his lower eyelid. He is worried about cancer.

Vitals: Normal.
Physical Examination: Small, flesh-colored, dome-shaped papules with central umbilication. No bleeding or crusting.
Laboratory Results: None.', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a potential ocular complication of molluscum on the eyelid margin?', '["Glaucoma","Chronic follicular conjunctivitis due to viral shedding into the eye","Cataracts","None"]', 1, 'The virus can irritate the conjunctiva if the lesions are on the lid margin.'),
        (v_case_id, 'How does the management differ from trunk molluscum in children?', '["It doesn''t","Eyelid lesions may require referral for removal to prevent the conjunctivitis mentioned above","Wait and watch always","None"]', 1, 'Clinical symptoms may drive the need for active treatment.'),
        (v_case_id, 'Molluscum on the eyelid in a young adult is another red flag for which condition?', '["Diabetes","HIV","Leukemia","None"]', 1, 'Like giant molluscum, atypical locations can signify immunosuppression.');

    ---------------------------------------------------------------------------
    -- CASE 49: The Rapidly spreading ''Infection'' on the Face
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapidly spreading ''Infection'' on the Face', 'A 40-year-old woman presents with a bright red, swollen, and painful area on her right cheek that began 12 hours ago. It has a very sharp, raised border.

Vitals: T 38.8 C.
Physical Examination: Well-demarcated, edematous, erythematous plaque on the face. It feels ''indurated'' (hard). Lymphadenopathy is present.
Laboratory Results: WBC 15,000.', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary difference between Erysipelas and Cellulitis?', '["Erysipelas is deeper","Erysipelas involves the superficial dermis and lymphatic system and has a sharp, well-demarcated border; Cellulitis is deeper and has ill-defined borders","Erysipelas is painless","None"]', 1, 'The ''sharp border'' and ''butterfly'' face distribution are classic for erysipelas.'),
        (v_case_id, 'What is the most common causative organism for Erysipelas?', '["Staph aureus","Streptococcus pyogenes (Group A Strep)","Pseudomonas","E. coli"]', 1, 'GAS is the overwhelming cause of this superficial infection.'),
        (v_case_id, 'What is the best initial treatment?', '["Topical Mupirocin","Oral or IV Penicillin (or Cephalosporin)","Incision and drainage","None"]', 1, 'Erysipelas requires systemic antibiotics targeting Strep.');

    ---------------------------------------------------------------------------
    -- CASE 50: The Sudden Loss of All Hair (Management Follow-up)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Loss of All Hair (Management Follow-up)', 'A patient with Alopecia Universalis fails to respond to topical therapy and steroid injections. He is otherwise healthy.

Vitals: Normal.
Physical Examination: Total body hair loss.
Laboratory Results: None.', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which new class of medication is now FDA-approved for severe alopecia areata/universalis?', '["JAK inhibitors (e.g., Baricitinib)","TNF inhibitors","IL-17 inhibitors","Antibiotics"]', 0, 'JAK inhibitors represent a breakthrough in the treatment of severe, extensive alopecia.'),
        (v_case_id, 'How do JAK inhibitors work in this condition?', '["They kill fungus","They block the signaling pathways used by the T-cells that attack the hair follicle","They increase blood flow","None"]', 1, 'They are targeted immunomodulators.'),
        (v_case_id, 'What is a major counseling point for patients starting JAK inhibitors?', '["They work overnight","They require monitoring for infections (TB, shingles) and laboratory monitoring (CBC/lipids)","They are only for children","None"]', 1, 'Like all systemic immunomodulators, they have specific safety monitoring requirements.');

    ---------------------------------------------------------------------------
    -- CASE 51: The Crusted Patient in the Nursing Home
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Crusted Patient in the Nursing Home', 'An 85-year-old female with advanced dementia in a long-term care facility presents with thick, ''gray-white'' crusts on her hands, feet, and trunk. She does not seem to be itching much.

Vitals: Normal.
Physical Examination: Heavy, hyperkeratotic scaling and crusting, especially in the web spaces and under the nails. Fissuring is present. Thousands of mites are seen on a single skin scraping.
Laboratory Results: None.', 51)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does crusted scabies differ from classic scabies in terms of infectivity?', '["It is less contagious","It is extremely contagious due to the massive burden of mites (millions vs. 10-15 in classic)","It is only spread by pets","None"]', 1, 'A single contact can transmit thousands of mites. Strict isolation is required.'),
        (v_case_id, 'What is the best initial treatment for crusted scabies?', '["Topical Permethrin only","Combined therapy with oral Ivermectin and topical Permethrin (or Sulfur ointment)","Oral Antibiotics","Topical Steroids"]', 1, 'Combination therapy is mandatory for the high mite load in crusted cases.'),
        (v_case_id, 'Why might the patient not be itching despite millions of mites?', '["The mites are dead","Immunosuppression or neurologic impairment prevents the normal hypersensitivity (itch) response","It''s a different species","None"]', 1, 'The lack of itch (anergy) contributes to the delayed diagnosis and massive infestation.');

    ---------------------------------------------------------------------------
    -- CASE 52: The Rose Gardener''''s Bumps
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rose Gardener''''s Bumps', 'A 40-year-old male presents with several red bumps on his right hand and forearm that have been appearing over the last 2 weeks. He is an avid gardener.

Vitals: Normal.
Physical Examination: A series of painless, firm, erythematous nodules following a ''linear'' pattern up the arm (lymphangitic spread). The initial lesion on the finger is slightly ulcerated.
Laboratory Results: Fungal culture shows Sporothrix schenckii.', 52)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic ''buzzword'' clinical pattern seen in this patient?', '["Christmas tree","Nodular lymphangitis (sporotrichoid spread)","Target lesions","None"]', 1, 'Linear spread along lymphatic channels is classic for Sporothrix, but can also be seen in Nocardia or atypical Mycobacteria.'),
        (v_case_id, 'What is the first-line treatment for lymphocutaneous sporotrichosis?', '["Oral Itraconazole for 3-6 months","Oral Penicillin","Topical antifungals","Amphotericin B"]', 0, 'Oral Itraconazole is the standard of care. Potassium iodide (SSKI) is an older alternative.'),
        (v_case_id, 'What was the most likely ''portal of entry'' for this fungus?', '["Inhalation","Traumatic inoculation (e.g., from a rose thorn or contaminated soil)","Ingestion","None"]', 1, 'This is a classic ''Step 2'' occupational history association.');

    ---------------------------------------------------------------------------
    -- CASE 53: The ''Tanned'' Spots that Won''''t Tan
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Tanned'' Spots that Won''''t Tan', 'A 19-year-old male presents with multiple ''white spots'' on his chest and back that appeared after a beach vacation.

Vitals: Normal.
Physical Examination: Multiple small, finely scaly, hypopigmented macules that have coalesced into larger patches. The spots do not tan.
Laboratory Results: KOH prep shows a ''spaghetti and meatballs'' pattern of hyphae and spores.', 53)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative organism of Tinea Versicolor?', '["Trichophyton","Malassezia species (yeast)","Candida","None"]', 1, 'Malassezia is a commensal yeast that becomes pathogenic under certain conditions (heat/humidity).'),
        (v_case_id, 'What is the best initial treatment for widespread Tinea Versicolor?', '["Topical Permethrin","Topical Selenium Sulfide or Ketoconazole shampoo (applied as a wash)","Oral Griseofulvin","Oral Terbinafine"]', 1, 'Topical antifungal washes are highly effective and safer than systemic options for this benign condition.'),
        (v_case_id, 'Does the pigment return immediately after the fungus is killed?', '["Yes","No, the hypopigmentation (due to melanocyte inhibition) can take weeks to months to resolve even after successful treatment","Only in the sun","None"]', 1, 'Managing expectations about the ''lingering'' white spots is key to patient satisfaction.');

    ---------------------------------------------------------------------------
    -- CASE 54: The Splotchy Face and the Pregnancy
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Splotchy Face and the Pregnancy', 'A 30-year-old pregnant female (3rd trimester) presents with symmetric brown patches on her cheeks and forehead.

Vitals: Normal.
Physical Examination: Irregular, hyperpigmented, brown macules in a ''mask-like'' distribution on the face (malar and frontal areas).
Laboratory Results: None.', 54)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are the three most common ''triggers'' for melasma?', '["Cold, diet, exercise","Sunlight (UV), Hormones (Pregnancy/OCPs), and Genetics","Smoking, alcohol, stress","None"]', 1, 'Melasma is often called ''the mask of pregnancy''.'),
        (v_case_id, 'What is the MOST IMPORTANT management step to prevent worsening of melasma?', '["Chemical peels","Strict sun protection (broad-spectrum sunscreen and hats)","Stopping all vitamins","None"]', 1, 'UV radiation is the primary driver of pigment production in melasma.'),
        (v_case_id, 'Will the pigmentation always disappear after delivery?', '["Yes, 100%","It often fades significantly but may persist and require topical therapy (e.g., Hydroquinone)","It gets darker","None"]', 1, 'While it often improves postpartum, it is frequently a chronic, relapsing condition.');

    ---------------------------------------------------------------------------
    -- CASE 55: The ''Dimple'' in the Skin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Dimple'' in the Skin', 'A 35-year-old female presents with a firm, brown bump on her leg that she noticed after a bug bite a year ago.

Vitals: Normal.
Physical Examination: A firm, 5-mm hyperpigmented nodule on the lower leg. When the skin on either side is pinched, the lesion ''dimples'' inward (positive Fitzpatricks/dimple sign).
Laboratory Results: None.', 55)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does a ''Positive Dimple Sign'' indicate?', '["Malignant Melanoma","Dermatofibroma (benign fibrous nodule)","Skin abscess","Basal Cell Carcinoma"]', 1, 'The dimple sign is highly characteristic of dermatofibroma due to its tethering to the underlying dermis.'),
        (v_case_id, 'What is the best management for an asymptomatic dermatofibroma?', '["Excisional biopsy","Observation and reassurance","Cryotherapy","Topical steroids"]', 1, 'As these are benign and leave larger scars if removed, observation is the preferred approach.'),
        (v_case_id, 'Dermatofibromas are often thought to be reactive to what?', '["Infection","Minor trauma or insect bites","Poor diet","None"]', 1, 'A history of a preceding minor injury is common.');

    ---------------------------------------------------------------------------
    -- CASE 56: The Rapidly Bleeding ''Pimple''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapidly Bleeding ''Pimple''', 'A 22-year-old pregnant female presents with a bright red, ''shiny'' bump on her finger that bleeds profusely with even minor contact.

Vitals: Normal.
Physical Examination: A pedunculated, friable, erythematous papule with a ''collarette'' of scale at the base. It is rapidly growing.
Laboratory Results: None.', 56)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial treatment for a pyogenic granuloma?', '["Antibiotics","Surgical excision or shave removal with cautery of the base","Topical steroids","Observation"]', 1, 'Because they bleed easily and don''t resolve on their own, definitive removal is required.'),
        (v_case_id, 'Why is it common in pregnant women?', '["Hormonal influences on vascular proliferation","Low vitamins","Infection","None"]', 0, 'PGs are frequently seen on the gingiva (pregnancy tumors) or skin during pregnancy.'),
        (v_case_id, 'Is a pyogenic granuloma a ''true'' granuloma containing pus?', '["Yes","No, it is a benign vascular proliferation; the name is a misnomer","Only if it is red","None"]', 1, 'It contains neither ''pyo'' (pus) nor ''granuloma'' (the histologic structure).');

    ---------------------------------------------------------------------------
    -- CASE 57: The Itchy Patient and the Purple Bumps (Revisited)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Patient and the Purple Bumps (Revisited)', 'A 45-year-old male with a history of Hepatitis C presents with very itchy, flat-topped purple bumps on his wrists and shins.

Vitals: Normal.
Physical Examination: Polygonal, purple, planar papules (6 P''s). White, lacy lines on the oral mucosa (Wickham striae). He also has ''ridges'' on his nails.
Laboratory Results: None.', 57)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial'' treatment for cutaneous lichen planus?', '["Oral Prednisone","High-potency topical corticosteroids","Oral Acyclovir","UVB light"]', 1, 'Topical steroids are first-line for localized LP.'),
        (v_case_id, 'What is the ''Koebner phenomenon'' in the context of Lichen Planus?', '["Fever","Development of new lesions at sites of skin trauma (like scratches)","Itchiness","None"]', 1, 'This is seen in Psoriasis, Lichen Planus, and Vitiligo.'),
        (v_case_id, 'Oral Lichen Planus carries a small increased risk of which malignancy?', '["BCC","Squamous Cell Carcinoma (SCC)","Melanoma","Lymphoma"]', 1, 'Chronic erosive oral LP requires monitoring for SCC.');

    ---------------------------------------------------------------------------
    -- CASE 58: The Fragile Skin in the Elderly
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Fragile Skin in the Elderly', 'An 85-year-old female presents with multiple ''purple bruises'' and thin, transparent skin on her forearms.

Vitals: Normal.
Physical Examination: Ecchymoses (purpura) on the dorsal hands and forearms. The skin is extremely thin and tears easily (skin tears). No low platelets.
Laboratory Results: CBC normal.', 58)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of actinic purpura?', '["Abuse","Atrophy of the dermal connective tissue due to aging and sun damage, leaving blood vessels poorly supported","Vitamin K deficiency","None"]', 1, 'It is a benign condition of elderly skin fragility.'),
        (v_case_id, 'How should this condition be managed?', '["Vitamin K supplements","Reassurance and trauma prevention (e.g., long sleeves)","Platelet transfusion","None"]', 1, 'There is no ''cure'' for the underlying atrophy.'),
        (v_case_id, 'Do these bruises turn yellow and green like normal bruises as they heal?', '["Yes","No, they often resolve without the typical color progression of heme degradation","Only in children","None"]', 1, 'This is a unique clinical observation in senile purpura.');

    ---------------------------------------------------------------------------
    -- CASE 59: The Scar that Keeps Growing
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scar that Keeps Growing', 'An 18-year-old male with dark skin presents with a large, itchy, firm mass on his earlobe after he got it pierced 6 months ago.

Vitals: Normal.
Physical Examination: A 2-cm, firm, smooth, erythematous nodule that extends well beyond the original boundaries of the piercing.
Laboratory Results: None.', 59)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does a Keloid differ from a Hypertrophic scar?', '["Hypertrophic scars stay within the original wound boundaries; Keloids extend beyond them","Keloids go away; hypertrophic stay","They are the same","None"]', 0, 'This is a critical distinction for prognosis and treatment.'),
        (v_case_id, 'What is the best initial treatment for a symptomatic keloid?', '["Simple surgical excision","Intralesional corticosteroid injections (e.g., Triamcinolone)","Topical antibiotics","None"]', 1, 'Simple excision of a keloid has a very high recurrence rate (often returning larger). Injections are the first step.'),
        (v_case_id, 'If surgery is performed, what should be done to prevent recurrence?', '["Nothing","Adjuvant therapy (e.g., steroid injections, pressure therapy, or radiation)","Sun protection","None"]', 1, 'Surgery alone is almost never recommended for keloids.');

    ---------------------------------------------------------------------------
    -- CASE 60: The Scaly Patch in the ''Rose'' Distribution
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Patch in the ''Rose'' Distribution', 'A 25-year-old female develops a single, large, oval red patch on her abdomen. One week later, she develops dozens of smaller oval patches on her back that follow her ribs.

Vitals: Normal.
Physical Examination: Herald patch followed by Christmas tree distribution of smaller scaly lesions. A negative RPR is noted.
Laboratory Results: None.', 60)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the standard management for an asymptomatic case of Pityriasis Rosea?', '["Oral Antifungals","Observation and reassurance (resolves in 6-8 weeks)","Oral Steroids","Topical Antibiotics"]', 1, 'No treatment is necessary for asymptomatic cases.'),
        (v_case_id, 'If the patient is extremely itchy, what can be used?', '["Topical steroids and oral antihistamines","Acyclovir","Chemotherapy","None"]', 0, 'Supportive care is only for symptom relief.'),
        (v_case_id, 'Is the condition contagious?', '["Yes, very","No, it is not considered contagious despite a suspected viral trigger","Only through water","None"]', 1, 'Isolation is not required.');

    ---------------------------------------------------------------------------
    -- CASE 61: The ''White'' Face in the Dark-Skinned Child
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''White'' Face in the Dark-Skinned Child', 'An 8-year-old boy with dark skin presents with several round, pale patches on his cheeks. He has a history of asthma.

Vitals: Normal.
Physical Examination: Poorly demarcated, hypopigmented macules with a fine scale. No complete loss of pigment.
Laboratory Results: KOH negative.', 61)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How can you clinically distinguish Pityriasis Alba from Vitiligo?', '["Vitiligo is scaly; PA is not","Vitiligo shows complete depigmentation (chalk-white) with sharp borders; PA is hypopigmented (off-white) with blurry borders and fine scale","Vitiligo is only on the hands","None"]', 1, 'The ''depth'' of the pigment loss and the border quality are key.'),
        (v_case_id, 'What is the best initial management for Pityriasis Alba?', '["Oral antifungals","Sun protection and emollients; sometimes a mild topical steroid/calcineurin inhibitor","Chemotherapy","None"]', 1, 'PA is a self-limited form of mild eczema.'),
        (v_case_id, 'What would you expect to see under a Wood''s lamp for Vitiligo?', '["Bright coral-red fluorescence","Bright, fluorescent blue-white depigmentation","Yellow glow","Nothing"]', 1, 'Wood''s lamp accentuates the lack of melanin in vitiligo.');

    ---------------------------------------------------------------------------
    -- CASE 62: The Sudden White Spots on the Hands
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden White Spots on the Hands', 'A 30-year-old woman presents with ''chalk-white'' spots on her fingers and around her mouth. She has a history of autoimmune thyroiditis.

Vitals: Normal.
Physical Examination: Completely depigmented macules and patches with sharp borders (acrofacial vitiligo).
Laboratory Results: Positive Anti-TPO antibodies.', 62)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the first-line treatment for limited vitiligo (especially on the face)?', '["Oral steroids","High-potency topical steroids or topical Calcineurin inhibitors (e.g., Tacrolimus)","Permanent bleaching of the rest of the skin","None"]', 1, 'Topical immunosuppression aims to stop the autoimmune destruction of melanocytes.'),
        (v_case_id, 'What is a major risk factor for patients with vitiligo?', '["Sunburn (due to lack of protective melanin)","Infection","Skin cancer only","None"]', 0, 'Strict sun protection is vital in depigmented areas.'),
        (v_case_id, 'If the disease is widespread (>20% BSA), what is the next step?', '["Surgery","Narrowband UVB phototherapy","IV Antibiotics","None"]', 1, 'Phototherapy is highly effective for stimulating repigmentation.');

    ---------------------------------------------------------------------------
    -- CASE 63: The ''Stuck-On'' Brown Bump
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Stuck-On'' Brown Bump', 'A 70-year-old male presents with a ''worrying'' black bump on his chest.

Vitals: Normal.
Physical Examination: A 1-cm, well-demarcated, hyperpigmented plaque with a ''stuck-on'' appearance and ''waxy'' texture. Small keratin-filled pits are visible with a magnifying lens.
Laboratory Results: None.', 63)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the clinical hallmark of Seborrheic Keratosis?', '["Bleeding and ulceration","A ''stuck-on'' appearance that looks like it could be scraped off with a fingernail","Rapid growth","None"]', 1, 'This is the most common benign tumor in the elderly.'),
        (v_case_id, 'Is treatment necessary for Seborrheic Keratoses?', '["Yes, they turn into cancer","No, they are benign; treatment is only for irritation or cosmetics (e.g., cryotherapy)","Only in children","None"]', 1, 'SKs have zero malignant potential.'),
        (v_case_id, 'The sudden appearance of hundreds of SKs (Leser-Trélat sign) should prompt evaluation for what?', '["Diabetes","Internal malignancy (especially GI)","Heart failure","None"]', 1, 'This is a rare but classic paraneoplastic syndrome.');

    ---------------------------------------------------------------------------
    -- CASE 64: The Blue Node on the Lip
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Blue Node on the Lip', 'A 65-year-old male has a soft, blue-to-purple nodule on his lower lip that disappears when he presses on it with his finger.

Vitals: Normal.
Physical Examination: A 5-mm soft, compressible, dark-blue papule on the lip.
Laboratory Results: None.', 64)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a ''Venous Lake''?', '["A type of cancer","A benign dilated vein (common in the elderly on sun-exposed areas like lips/ears)","A fungal infection","None"]', 1, 'It is a common vascular finding in older patients.'),
        (v_case_id, 'How can you distinguish it from a nodular melanoma?', '["Melanoma is soft","A venous lake is soft and blanchable/compressible (blood is squeezed out); melanoma is firm and does not blanch","They are the same","None"]', 1, 'Blanchability is a key clinical test for vascular vs. pigmented lesions.'),
        (v_case_id, 'Is treatment required for a venous lake?', '["Yes, immediate excision","No, unless for cosmetic reasons (e.g., laser or excision)","Wait and watch always","None"]', 1, 'They are completely benign.');

    ---------------------------------------------------------------------------
    -- CASE 65: The Painful Blue Spot Under the Nail
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Blue Spot Under the Nail', 'A 30-year-old female presents with a small, extremely painful blue-red spot under her fingernail. The pain is triggered by cold or minor pressure.

Vitals: Normal.
Physical Examination: A 2-mm bluish subungual nodule. Severe tenderness to pinpoint pressure (Love''s sign).
Laboratory Results: None.', 65)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a Glomus tumor?', '["A type of cancer","A benign, painful hamartoma of the glomus body (involved in thermoregulation)","A fungal infection","None"]', 1, 'These are classically found in the subungual area.'),
        (v_case_id, 'What is the hallmark symptom?', '["Itch","Severe paroxysmal pain, especially triggered by cold or pressure","Numbness","None"]', 1, 'The ''cold sensitivity'' is a classic Step 2 CK clue.'),
        (v_case_id, 'What is the treatment?', '["Painkillers only","Surgical excision","Topical steroids","None"]', 1, 'Excision is curative and provides immediate relief.');

    ---------------------------------------------------------------------------
    -- CASE 66: The Itchy Groin in the Toddler
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Groin in the Toddler', 'A 3-year-old girl presents with an itchy, scaly rash in her diaper area that has not responded to diaper rash creams.

Vitals: Normal.
Physical Examination: Erythematous patches with a ''beefy'' red color and ''satellite'' pustules. The rash involves the deep skin folds.
Laboratory Results: KOH prep shows yeast.', 66)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does Candidal Diaper Dermatitis differ from Irritant (contact) Diaper Dermatitis?', '["Candida involves the deep folds; Irritant dermatitis typically spares the deep folds (where the diaper doesn''t touch)","Irritant involves the folds; Candida doesn''t","There is no difference","Candida is blue"]', 0, 'Involvement of the inguinal creases is a major diagnostic clue for Candida.'),
        (v_case_id, 'What is the first-line treatment for this infant?', '["Topical Permethrin","Topical Nystatin or Clotrimazole cream","Topical Bacitracin","Topical Steroids only"]', 1, 'Antifungals are required. High-potency steroids should be avoided in the diaper area.'),
        (v_case_id, 'Why are ''satellite lesions'' so important for diagnosis?', '["They aren''t","They are highly characteristic of Candidal infection","They indicate a bacterial allergy","None"]', 1, 'Seeing small red spots away from the main plaque is the ''gold standard'' clinical sign.');

    ---------------------------------------------------------------------------
    -- CASE 67: The Sudden Loss of Skin and the New Drug (Management)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Loss of Skin and the New Drug (Management)', 'A patient develops skin pain and Nikolsky-positive sloughing involving 40% of the body surface area.

Vitals: T 39.0 C, BP 85/50.
Physical Examination: Extensive epidermal detachment (TEN).
Laboratory Results: None.', 67)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Besides drug withdrawal, what is the ''Most Important'' factor for improving survival in TEN?', '["Starting steroids early","Aggressive fluid and electrolyte resuscitation (similar to burn protocols)","Skin grafting","None"]', 1, 'The loss of the skin barrier leads to massive fluid loss and risk of sepsis.'),
        (v_case_id, 'What is the most common cause of death in TEN patients?', '["Heart attack","Sepsis (usually from S. aureus or Pseudomonas)","Liver failure","None"]', 1, 'Infection of the denuded skin and subsequent septicemia is the primary killer.'),
        (v_case_id, 'Which ''Target'' should be managed by a specialist from day 1 to prevent permanent disability?', '["Liver","Eyes (conjunctival erosions/scarring)","Hair","None"]', 1, 'Ophthalmology must be involved to prevent symblepharon and blindness.');

    ---------------------------------------------------------------------------
    -- CASE 68: The Itchy Shin and the ''Step'' Association
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Shin and the ''Step'' Association', 'A 40-year-old female presents with painful, red nodules on her shins. She also has a cough and sore throat.

Vitals: Normal.
Physical Examination: Multiple 2-4 cm tender, erythematous nodules on the pretibial shins. No ulceration.
Laboratory Results: Chest X-ray shows bilateral hilar lymphadenopathy. ASO titer is high.', 68)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Erythema Nodosum (EN) is a ''delayed hypersensitivity'' reaction. What is the most common ''Infectious'' trigger in children?', '["HIV","Group A Streptococcus (ASO positive)","Fungus","None"]', 1, 'Strep infection is the leading cause of EN in the pediatric population.'),
        (v_case_id, 'Which systemic inflammatory condition is famously associated with the EN + Hilar adenopathy pattern?', '["Lupus","Sarcoidosis (Lofgren Syndrome)","Tuberculosis","None"]', 1, 'The triad of EN, hilar nodes, and polyarthritis defines Lofgren syndrome.'),
        (v_case_id, 'Which common medication class is a frequent trigger for EN in women?', '["Antibiotics","Oral Contraceptive Pills (OCPs)","Statins","Aspirin"]', 1, 'Hormonal changes are a significant trigger.');

    ---------------------------------------------------------------------------
    -- CASE 69: The Painful Vulva and the White Skin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Vulva and the White Skin', 'A 65-year-old postmenopausal female presents with severe itching and pain in her genital area. She says it ''burns'' when she uriniates.

Vitals: Normal.
Physical Examination: Thin, ivory-white, ''parchment-like'' plaques on the vulva and perianal area in a ''figure-of-eight'' distribution. Some scarring and loss of the labia minora are seen.
Laboratory Results: None.', 69)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial'' treatment for Lichen Sclerosus?', '["Topical Estrogen","Ultra-potent topical corticosteroids (e.g., Clobetasol) on a tapering schedule","Antifungal cream","Surgical excision"]', 1, 'Aggressive topical steroids are required to stop the scarring and inflammation.'),
        (v_case_id, 'Lichen sclerosus in women carries an increased risk of which malignancy?', '["BCC","Vulvar Squamous Cell Carcinoma (SCC)","Melanoma","None"]', 1, 'Up to 5% of patients with chronic LS can develop SCC, necessitating long-term monitoring.'),
        (v_case_id, 'How does it differ from Lichen Planus in the genital area?', '["LP usually involves the vagina (mucosal surfaces); LS characteristically spares the vagina","LS involves the vagina","They are the same","None"]', 0, 'Vaginal involvement is a key differentiator between the two.');

    ---------------------------------------------------------------------------
    -- CASE 70: The Red-Faced Toddler (Infection)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red-Faced Toddler (Infection)', 'A 2-year-old child presents with a bright red face that looks like he was ''slapped''. He had a mild fever a few days ago.

Vitals: Normal now.
Physical Examination: Bright red erythema on the cheeks (''Slapped-cheek''). A lacy, reticular rash on the trunk and limbs.
Laboratory Results: None.', 70)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative agent of Fifth Disease?', '["Parvovirus B19","Measles","Herpes 6","None"]', 0, 'Parvovirus B19 is the culprit.'),
        (v_case_id, 'What is the major systemic concern for a PREGNANT woman exposed to this child?', '["Nothing","Hydrops fetalis (due to viral destruction of fetal RBC precursors)","SJS","None"]', 1, 'Parvovirus B19 can cause fetal anemia and hydrops if contracted during pregnancy.'),
        (v_case_id, 'In a patient with Sickle Cell Disease, Parvovirus B19 can trigger which emergency?', '["Pain crisis","Aplastic Crisis (sudden drop in hemoglobin)","Stroke","None"]', 1, 'The virus temporarily halts erythropoiesis.');

    ---------------------------------------------------------------------------
    -- CASE 71: The Itchy Elbows (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Elbows (Reasoning)', 'A 25-year-old male with a history of hay fever presents with an itchy rash on his elbows. He says it ''waxes and wanes''.

Vitals: Normal.
Physical Examination: Poorly defined erythematous plaques with some lichenification on the flexural surfaces (antecubital fossae).
Laboratory Results: None.', 71)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The term ''Lichenification'' on physical exam indicates what?', '["Fungal infection","Chronic rubbing and scratching (thickening of the skin)","Acute allergy","None"]', 1, 'Lichenification is a marker of chronic itch-scratch behavior.'),
        (v_case_id, 'What is the ''Atopic Triad''?', '["Eczema, Asthma, and Allergic Rhinitis","Fever, rash, cough","None of the above","Obesity, Diabetes, Hypertension"]', 0, 'These three conditions frequently occur together in predisposed individuals.'),
        (v_case_id, 'Which type of ''Test'' is usually UNNECESSARY for the diagnosis of typical atopic dermatitis?', '["Physical exam","Skin biopsy","Patient history","None"]', 1, 'Atopic dermatitis is a clinical diagnosis; biopsy is rarely specific or necessary.');

    ---------------------------------------------------------------------------
    -- CASE 72: The ''Pearly'' Papule and the Management
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Papule and the Management', 'A 70-year-old male with a pearly papule on his ear. Biopsy confirms Basal Cell Carcinoma.

Vitals: Normal.
Physical Examination: 1-cm pearly lesion on the helix of the ear.
Laboratory Results: None.', 72)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is the EAR considered a ''high-risk'' location for skin cancer?', '["It isn''t","Thin skin over cartilage leads to early deep invasion and higher recurrence rates","It gets more sun","None"]', 1, 'Locations like the ear, nose, and lips have specific surgical management requirements.'),
        (v_case_id, 'What is the preferred surgical method for this high-risk site?', '["Simple excision with narrow margins","Mohs Micrographic Surgery","Cryosurgery","Topical 5-FU"]', 1, 'Mohs ensures negative margins while preserving the delicate ear architecture.'),
        (v_case_id, 'If the patient were 95 years old and not a surgical candidate, what is an alternative?', '["Radiation therapy","Oral antibiotics","Chemotherapy","None"]', 0, 'Radiation is an excellent second-line for non-surgical candidates.');

    ---------------------------------------------------------------------------
    -- CASE 73: The Scaly Patch and the ''Double'' Border
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Patch and the ''Double'' Border', 'A 20-year-old male athlete has an itchy, scaly rash in his groin. He has been using a combination ''steroid and antifungal'' cream (e.g., Lotrisone) for 2 weeks. The rash is now larger and more red.

Vitals: Normal.
Physical Examination: A diffuse, erythematous area in the groin with pustules and a poorly defined border. It no longer looks like a ''ring''.
Laboratory Results: KOH prep shows hyphae.', 73)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What has happened to this patient''s fungal infection?', '["He has an allergy to the cream","The topical steroid in the combination cream suppressed the inflammation but allowed the fungus to grow unchecked (Tinea Incognito)","The fungus is dead","None"]', 1, 'Steroids ''mask'' the infection while making it worse.'),
        (v_case_id, 'What is the best management step?', '["Add more steroids","Stop the combination cream and start a PURE topical antifungal (e.g., Terbinafine)","Start oral Prednisone","IV Antibiotics"]', 1, 'Removing the steroid is critical to allow the immune system to fight the fungus with the help of the antifungal.'),
        (v_case_id, 'Why should combination ''Steroid-Antifungal'' creams generally be avoided?', '["They are too expensive","Risk of Tinea Incognito, skin atrophy in folds, and reduced efficacy","None","They don''t work at all"]', 1, 'Most dermatologists recommend against their use due to these common pitfalls.');

    ---------------------------------------------------------------------------
    -- CASE 74: The Flushed Face and the ''Pimple'' Trap
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Flushed Face and the ''Pimple'' Trap', 'A 30-year-old woman presents with persistent facial redness and ''pimples'' on her cheeks. She says she has ''adult acne''.

Vitals: Normal.
Physical Examination: Central facial erythema and papulopustules. No open or closed comedones. She flushes easily with spicy food.
Laboratory Results: None.', 74)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the key clinical finding that distinguishes Rosacea from Acne?', '["Rosacea has comedones; Acne does not","Acne has comedones (blackheads/whiteheads); Rosacea characteristically lacks comedones","Rosacea is only in teenagers","None"]', 1, 'Comedones are the hallmark of acne; their absence in a patient with inflammatory facial lesions should prompt consideration of rosacea.'),
        (v_case_id, 'If this patient were treated with standard acne medications like Tretinoin, what would happen?', '["It would clear up","The irritation from the retinoid would likely worsen the underlying rosacea and flushing","It wouldn''t matter","None"]', 1, 'Rosacea skin is extremely sensitive; harsh acne treatments are often poorly tolerated.'),
        (v_case_id, 'What is the first-line medical treatment for the inflammatory papules of rosacea?', '["Oral Isotretinoin","Topical Metronidazole, Azelaic Acid, or Ivermectin","Topical Steroids","None"]', 1, 'These agents target the inflammation and potentially the Demodex mites involved in rosacea.');

    ---------------------------------------------------------------------------
    -- CASE 75: The Itchy Eyelids and the Nail Polish
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Eyelids and the Nail Polish', 'A 25-year-old woman presents with a red, scaly, and itchy rash on her eyelids. She does not use any eye makeup.

Vitals: Normal.
Physical Examination: Erythema and fine scale on both upper and lower eyelids. She also has a similar rash on her neck.
Laboratory Results: Patch testing is positive for tosylamide formaldehyde resin (found in nail polish).', 75)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is ''Ectopic'' Contact Dermatitis?', '["A rash in the wrong place","A reaction caused by transferring an allergen (e.g., nail polish) via the hands to a distant site (e.g., the thin skin of the eyelids)","An allergy to the sun","None"]', 1, 'The eyelids are a frequent site of ''transfer'' dermatitis because the skin is so thin and easily sensitized.'),
        (v_case_id, 'Why did she get the rash on her eyelids but not her fingers?', '["She only touches her eyes","The thick skin of the fingers is more resistant to penetration; the thin eyelid skin is highly susceptible to allergens","None","Fingernails don''t have an immune system"]', 1, 'This is a classic diagnostic puzzle in dermatology.'),
        (v_case_id, 'What is the first step in management?', '["Topical steroids to the eyes","Stop using the offending nail polish and avoid touching the face until the nails are dry","Oral steroids","Eye drops"]', 1, 'Removal of the trigger is the priority.');

    ---------------------------------------------------------------------------
    -- CASE 76: The Painful Shins and the Cough (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Shins and the Cough (Reasoning)', 'A patient with painful red nodules on her shins. A chest X-ray shows enlarged hilar lymph nodes.

Vitals: Normal.
Physical Examination: Tender, pretibial nodules.
Laboratory Results: CXR shows bilateral hilar adenopathy.', 76)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'If the ASO titer, TB test, and IBD workup are all negative, what is the most likely diagnosis for the hilar nodes?', '["Lymphoma","Sarcoidosis","Lung cancer","None"]', 1, 'Sarcoidosis is a very common cause of this constellation (Lofgren syndrome).'),
        (v_case_id, 'What is the most appropriate next step to support the sarcoidosis diagnosis?', '["Biopsy of the shin nodule","Serum ACE level or biopsy of a different site (e.g., a skin plaque or lymph node)","Wait for the nodules to go away","None"]', 1, 'Biopsy of an EN lesion is often non-specific (septal panniculitis); biopsying a different sarcoid lesion (like a skin plaque) is more likely to show granulomas.'),
        (v_case_id, 'What is the prognosis for EN associated with sarcoidosis?', '["Poor","Excellent (it usually indicates a self-limited, acute form of sarcoidosis that resolves within months)","It causes permanent lung damage","None"]', 1, 'Lofgren syndrome has a high rate of spontaneous remission.');

    ---------------------------------------------------------------------------
    -- CASE 77: The Ring that Doesn''''t Scale
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Ring that Doesn''''t Scale', 'A 40-year-old female presents with a ring-shaped rash on the back of her hand. It doesn''t itch or hurt.

Vitals: Normal.
Physical Examination: An annular plaque with a ''bumpy'' (papular) border and central clearing. There is NO scale present.
Laboratory Results: KOH prep is negative.', 77)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the key clinical feature that distinguishes Granuloma Annulare from Tinea Corporis?', '["GA is itchy; Tinea is not","GA has no scale; Tinea characteristically has scale at the active border","GA is red; Tinea is blue","None"]', 1, 'The absence of scale is a major clinical differentiator for GA.'),
        (v_case_id, 'What is the management for a single, asymptomatic lesion of GA?', '["Oral antifungals","Reassurance (most resolve spontaneously within 2 years)","Immediate surgical excision","None"]', 1, 'Localized GA is benign and often self-limited.'),
        (v_case_id, 'Generalized GA (hundreds of lesions) has been occasionally associated with which condition?', '["Diabetes Mellitus","Heart failure","Asthma","None"]', 0, 'While controversial, an association with DM is often tested on medical exams.');

    ---------------------------------------------------------------------------
    -- CASE 78: The Yellow Shin Plate
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Yellow Shin Plate', 'A 35-year-old woman with Type 1 Diabetes presents with a ''yellowish'' patch on her shin that has been slowly growing.

Vitals: Normal.
Physical Examination: A well-demarcated, atrophic, yellowish-brown plaque on the pretibial area with prominent telangiectasias (visible vessels) in the center.
Laboratory Results: HbA1c is 8.5%.', 78)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Does tight glucose control typically improve the skin lesions of Necrobiosis Lipoidica?', '["Yes, they disappear","No, NL does not necessarily mirror glycemic control","Only in Type 2 Diabetes","None"]', 1, 'Unlike other complications, NL is notoriously independent of A1c levels.'),
        (v_case_id, 'What is the primary treatment for active, inflammatory NL?', '["Oral antibiotics","Potent topical or intralesional corticosteroids","Insulin only","None"]', 1, 'Steroids help reduce the inflammation at the active borders.'),
        (v_case_id, 'What is a significant risk for the atrophic skin in NL?', '["Infection","Ulceration (which is often difficult to heal)","Turning into a mole","None"]', 1, 'Minor trauma to the thinned skin can lead to painful, chronic ulcers.');

    ---------------------------------------------------------------------------
    -- CASE 79: The Prickly Heat
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Prickly Heat', 'A 5-year-old child is brought in during a heatwave with a ''prickly'' red rash on his back and neck.

Vitals: Normal.
Physical Examination: Multiple tiny (1-2 mm) erythematous papules and vesicles in areas of occlusion (back, neck folds).
Laboratory Results: None.', 79)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the underlying cause of Miliaria?', '["Allergy to sweat","Obstruction of the eccrine sweat ducts","Bacterial infection","None"]', 1, 'Sweat is trapped in the skin, causing inflammation.'),
        (v_case_id, 'What is the best management step?', '["Topical antibiotics","Cooling the environment, wearing loose clothing, and avoiding heavy creams/ointments","Oral steroids","Scrubbing the skin"]', 1, 'Reducing sweating and allowing the ducts to clear is the primary treatment.'),
        (v_case_id, 'Which type of Miliaria presents with ''crystal-like'' tiny clear vesicles that pop easily?', '["Miliaria rubra","Miliaria crystallina","Miliaria profunda","None"]', 1, 'This is the most superficial form of sweat duct obstruction.');

    ---------------------------------------------------------------------------
    -- CASE 80: The Smelly, Pitted Feet
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Smelly, Pitted Feet', 'A 20-year-old athlete presents with extremely smelly feet and ''little holes'' in his soles.

Vitals: Normal.
Physical Examination: Multiple 1-3 mm ''punched-out'' pits in the thickened stratum corneum of the weight-bearing areas of the soles. The area is slimy and has a strong odor.
Laboratory Results: None.', 80)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of Pitted Keratolysis?', '["Fungus","Superficial bacterial infection (e.g., Kytococcus sedentarius) in a moist environment","Acid reflux","None"]', 1, 'Bacteria produce enzymes that digest the keratin of the sole.'),
        (v_case_id, 'What is the best initial treatment?', '["Topical antifungals","Topical antibiotics (e.g., Erythromycin or Clindamycin) and keeping the feet dry","Oral steroids","None"]', 1, 'Topical antibiotics are curative.'),
        (v_case_id, 'What contributes to the characteristic odor?', '["Pus","Sulfur-containing compounds produced by the bacteria","Dirt","None"]', 1, 'The ''rotten egg'' smell is a classic clinical clue.');

    RAISE NOTICE 'Finished populating 80 cases for case-algorithms.';
END $$;

COMMIT;
-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Clinical Case Integration (Step 2 CK)
-- Topic: Pharmacotherapy in clinical context
-- Topic Slug: case-pharmacotherapy
-- Sourced: UWorld, Step-Up to Medicine, MTB Step 2, First Aid Step 2 CK

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-pharmacotherapy' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'case-pharmacotherapy';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 80-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: The Potency Ladder
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Potency Ladder', 'A 40-year-old male with thick, scaly psoriasis plaques on his elbows and knees is prescribed a topical corticosteroid.

Vitals: Normal.
Physical Examination: Large, well-demarcated plaques with silver scale on the extensor surfaces.
Laboratory Results: None.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which class of topical corticosteroid is most appropriate for thick plaques on the elbows?', '["Class 7 (Low potency, e.g., Hydrocortisone 1%)","Class 4 (Medium potency)","Class 1 (Ultra-high potency, e.g., Clobetasol propionate)","No steroids should be used"]', 2, 'Thick, hyperkeratotic plaques require ultra-high potency steroids for effective penetration.'),
        (v_case_id, 'If the patient develops psoriasis in his armpits (inverse psoriasis), what should you change?', '["Use Class 1 steroids","Switch to a low-potency steroid (Class 6 or 7) or a calcineurin inhibitor","Use only systemic therapy","None"]', 1, 'Thin-skinned intertriginous areas are highly susceptible to steroid side effects like atrophy and striae; low potency is required.'),
        (v_case_id, 'What is a common local side effect of chronic, high-potency steroid use on the skin?', '["Skin thickening","Skin atrophy, telangiectasias, and striae","Fungal infection only","None"]', 1, 'Steroids inhibit collagen synthesis, leading to thinning of the dermis.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Retinoid Protocol
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Retinoid Protocol', 'A 20-year-old female with severe, scarring nodulocystic acne is starting oral Isotretinoin.

Vitals: Normal.
Physical Examination: Multiple deep, painful nodules and cysts on the face and back. Significant scarring is noted.
Laboratory Results: Negative pregnancy test.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary mechanism of action of Isotretinoin?', '["Kills bacteria","Reduces sebum production, normalizes keratinization, and has anti-inflammatory effects","Blocks testosterone","None"]', 1, 'Isotretinoin is the only acne medication that targets all four pathogenic factors.'),
        (v_case_id, 'Which laboratory parameter is most commonly elevated during Isotretinoin therapy?', '["Serum Creatinine","Triglycerides","White blood cell count","Potassium"]', 1, 'Hypertriglyceridemia is a frequent side effect requiring monitoring.'),
        (v_case_id, 'What is the most common MUCOCUTANEOUS side effect of Isotretinoin?', '["Hair loss","Cheilitis (dry, cracked lips)","Night blindness","None"]', 1, 'Nearly 100% of patients experience dry lips; its absence often suggests non-compliance.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Biologic Revolution
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Biologic Revolution', 'A 45-year-old male with severe plaque psoriasis (>20% BSA) has failed treatment with Methotrexate. He is being considered for a TNF-alpha inhibitor (e.g., Adalimumab).

Vitals: Normal.
Physical Examination: Extensive erythematous scaly plaques.
Laboratory Results: None.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which screening test is ''Mandatory'' before initiating any TNF-alpha inhibitor?', '["Chest X-ray and Latent TB screening (e.g., PPD or Interferon-gamma release assay)","Liver biopsy","Renal ultrasound","None"]', 0, 'TNF-alpha is critical for granuloma maintenance; blocking it can cause reactivation of latent Tuberculosis.'),
        (v_case_id, 'TNF-alpha inhibitors are contraindicated in patients with which of the following conditions?', '["Diabetes","Congestive Heart Failure (NYHA Class III/IV) or Multiple Sclerosis","Hypertension","Asthma"]', 1, 'TNF inhibitors can worsen CHF and are associated with demyelinating events.'),
        (v_case_id, 'What is a potential ''Paradoxical'' side effect of TNF inhibitors?', '["Weight loss","Development of new-onset psoriasis or palmoplantar pustulosis","Hair growth","None"]', 1, 'Paradoxical psoriasis is a well-recognized adverse event of this drug class.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Antifungal Choice
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Antifungal Choice', 'A 40-year-old male with Type 2 Diabetes presents with a fungal infection of all 10 toenails.

Vitals: Normal.
Physical Examination: Thick, yellow, crumbly nails.
Laboratory Results: Culture confirms Trichophyton rubrum.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Terbinafine?', '["Inhibits ergosterol synthesis by blocking lanosterol demethylase","Inhibits ergosterol synthesis by blocking squalene epoxidase","Binds to ergosterol directly","Inhibits DNA synthesis"]', 1, 'Terbinafine is a squalene epoxidase inhibitor. (Azoles block lanosterol demethylase).'),
        (v_case_id, 'What is the recommended duration of Terbinafine for toenail onychomycosis?', '["1 week","2 weeks","12 weeks","1 year"]', 2, '12 weeks is standard for toenails; 6 weeks for fingernails.'),
        (v_case_id, 'Which uncommon but serious side effect can occur with Terbinafine?', '["Kidney stones","Hepatotoxicity or taste disturbance (dysgeusia)","Hearing loss","None"]', 1, 'LFT monitoring is recommended due to the rare risk of liver injury.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Steroid-Sparing Agent
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Steroid-Sparing Agent', 'A patient with severe atopic dermatitis is starting Methotrexate to reduce her reliance on oral Prednisone.

Vitals: Normal.
Physical Examination: Extensive lichenified eczema.
Laboratory Results: Normal baseline labs.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Methotrexate is an antagonist of which vitamin?', '["Vitamin C","Folic Acid (Folate)","Vitamin B12","Vitamin D"]', 1, 'It inhibits dihydrofolate reductase.'),
        (v_case_id, 'What is commonly co-administered with Methotrexate to reduce GI and hematologic toxicity?', '["Vitamin A","Folic acid (1mg daily or 5mg weekly)","Iron","None"]', 1, 'Folic acid supplementation significantly reduces common side effects.'),
        (v_case_id, 'Which ''Red Flag'' symptom should a patient on Methotrexate report immediately?', '["Dry skin","Dry cough and shortness of breath (suggesting Methotrexate-induced pneumonitis)","Hunger","None"]', 1, 'Pneumonitis is a rare but life-threatening idiosyncratic reaction.');

    ---------------------------------------------------------------------------
    -- CASE 06: The ''Red Man'' and the Vancomycin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Red Man'' and the Vancomycin', 'A patient being treated for a MRSA skin infection develops intense flushing and itching of the face and neck shortly after the start of an IV Vancomycin infusion.

Vitals: BP 110/70, HR 95.
Physical Examination: Erythema of the face, neck, and upper torso. No wheezing or angioedema.
Laboratory Results: None.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of ''Red Man Syndrome'' (now called Vancomycin Flushing Syndrome)?', '["IgE-mediated allergy","Direct, non-immune mast cell degranulation and histamine release","T-cell reaction","Fungal overgrowth"]', 1, 'It is a pseudoallergic reaction related to the rate of infusion.'),
        (v_case_id, 'How should this reaction be managed?', '["Stop infusion and never give Vancomycin again","Slow the infusion rate and pre-treat with antihistamines","Give Epinephrine","None"]', 1, 'Slowing the rate usually prevents the reaction.'),
        (v_case_id, 'Is this a contraindication to future Vancomycin use?', '["Yes","No, it is not a true allergy","Only in children","None"]', 1, 'Unlike anaphylaxis, it does not preclude future use.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Psoriasis Flare and the Steroid
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Psoriasis Flare and the Steroid', 'A patient with stable plaque psoriasis is given a dose of oral Prednisone for a severe poison ivy reaction. Two weeks after stopping the Prednisone, his psoriasis erupts into hundreds of tiny pustules.

Vitals: T 38.5 C.
Physical Examination: Widespread erythema with thousands of small, sterile pustules (von Zumbusch psoriasis).
Laboratory Results: WBC 20,000.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the major danger of using systemic corticosteroids in plaque psoriasis?', '["They don''t work","Risk of life-threatening pustular or erythrodermic flare upon withdrawal","They cause hair loss","None"]', 1, 'This is a classic USMLE ''don''t do'' for psoriasis management.'),
        (v_case_id, 'What is the first-line systemic treatment for acute generalized pustular psoriasis?', '["More Prednisone","Oral Acitretin, Cyclosporine, or Infliximab","Topical antifungals","None"]', 1, 'Rapid-acting systemics are required to stabilize the patient.'),
        (v_case_id, 'What is a major laboratory finding in these patients?', '["Anemia","Hypocalcemia (which can lead to tetany)","High Vitamin D","None"]', 1, 'Hypocalcemia is a recognized metabolic complication of pustular psoriasis.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Antiviral for the Eyes
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Antiviral for the Eyes', 'A patient with suspected Zoster Ophthalmicus is started on oral Valacyclovir.

Vitals: Normal.
Physical Examination: Vesicles in V1 distribution.
Laboratory Results: Elevated Creatinine (Baseline 1.0, now 1.8).', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How do Acyclovir and its derivatives (Valacyclovir) cause kidney injury?', '["Direct tubular necrosis","Crystal-induced nephropathy (precipitation in renal tubules)","Allergic interstitial nephritis","None"]', 1, 'High doses or dehydration can lead to obstructive crystal formation.'),
        (v_case_id, 'What is the best way to prevent this kidney injury?', '["Give the drug with milk","Adequate hydration (IV or oral) during therapy","Combine with a diuretic","None"]', 1, 'Hydration keeps the crystals in solution.'),
        (v_case_id, 'Valacyclovir is a ''prodrug'' of which medication?', '["Ganciclovir","Acyclovir","Foscarnet","None"]', 1, 'It has better oral bioavailability than acyclovir itself.');

    ---------------------------------------------------------------------------
    -- CASE 09: The Eczema and the ''Non-Steroid''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Eczema and the ''Non-Steroid''', 'A 5-year-old child with eczema on the eyelids is prescribed Tacrolimus ointment.

Vitals: Normal.
Physical Examination: Red, scaly eyelids.
Laboratory Results: None.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary advantage of TCIs (Tacrolimus, Pimecrolimus) over topical steroids?', '["They are cheaper","They do not cause skin atrophy, making them safe for thin-skinned areas like eyelids","They work faster","None"]', 1, 'TCIs do not inhibit collagen synthesis.'),
        (v_case_id, 'What is the most common side effect of TCI application?', '["Skin thinning","Burning or stinging sensation upon application","Hair growth","None"]', 1, 'This is a common but transient side effect.'),
        (v_case_id, 'What is the mechanism of action of Tacrolimus?', '["Blocks histamine","Inhibits calcineurin, preventing the activation of T-cells","Kills bacteria","None"]', 1, 'It is a targeted immunomodulator.');

    ---------------------------------------------------------------------------
    -- CASE 10: The ''Sun-Sensitive'' Antibiotic
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Sun-Sensitive'' Antibiotic', 'A 16-year-old male taking Doxycycline for acne develops a severe sunburn after only 20 minutes outside.

Vitals: Normal.
Physical Examination: Bright red erythema and edema on sun-exposed areas (face, arms).
Laboratory Results: None.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which type of reaction did this patient experience?', '["Photoallergic","Phototoxic (a direct chemical-induced sensitivity to UV light)","Allergy to the sun","None"]', 1, 'Tetracyclines (especially Doxycycline and Demeclocycline) are classic phototoxic agents.'),
        (v_case_id, 'Besides photosensitivity, what is a major contraindication for Tetracyclines in children < 8 years old?', '["Kidney failure","Permanent tooth discoloration and inhibition of bone growth","Liver failure","None"]', 1, 'The drug binds to calcium in developing teeth and bones.'),
        (v_case_id, 'What is the ''pill-induced'' complication associated with Tetracyclines if taken right before bed with little water?', '["Stomach ulcer","Pill-induced esophagitis","Kidney stones","None"]', 1, 'Patients should be advised to stay upright and drink plenty of water after taking the pill.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Psoriasis and the ''A'' Vitamin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Psoriasis and the ''A'' Vitamin', 'A woman with plaque psoriasis is prescribed Acitretin.

Vitals: Normal.
Physical Examination: Scaly plaques.
Laboratory Results: None.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How long must a woman avoid pregnancy AFTER stopping Acitretin?', '["1 month","6 months","3 years (due to long half-life and re-esterification to etretinate)","Never"]', 2, 'This is a much longer period than Isotretinoin (which is 1 month).'),
        (v_case_id, 'What common beverage must be strictly avoided during Acitretin therapy to prevent the formation of etretinate?', '["Milk","Alcohol","Grapefruit juice","Coffee"]', 1, 'Alcohol triggers the conversion of acitretin to etretinate, which is stored in fat for years.'),
        (v_case_id, 'Acitretin is most effective when used in combination with which other therapy?', '["Steroids","UVB Phototherapy (Re-UVB)","Antibiotics","None"]', 1, 'Retinoids thin the stratum corneum, allowing better UV penetration.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Itch and the ''Old'' Antihistamine
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itch and the ''Old'' Antihistamine', 'An elderly man takes Diphenhydramine (Benadryl) for itching. His family finds him confused and unable to urinate the next morning.

Vitals: Normal.
Physical Examination: Disoriented, suprapubic fullness (distended bladder).
Laboratory Results: None.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why are first-generation antihistamines (e.g., Diphenhydramine, Hydroxyzine) generally avoided in the elderly?', '["They don''t work","Potent anticholinergic and sedative effects (confusion, dry mouth, urinary retention)","They cause weight loss","None"]', 1, 'These are part of the ''Beers Criteria'' for potentially inappropriate medications in older adults.'),
        (v_case_id, 'Which receptor besides H1 do these drugs block to cause these side effects?', '["Beta receptors","Muscarinic (Acetylcholine) receptors","Alpha receptors","None"]', 1, 'The lack of selectivity leads to the anticholinergic profile.'),
        (v_case_id, 'Which class of antihistamines is preferred for daytime itching in any patient?', '["First-generation","Second-generation (e.g., Cetirizine, Loratadine, Fexofenadine)","None","Steroids"]', 1, 'Second-generation agents are non-sedating and have fewer side effects.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Target and the IL-17
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Target and the IL-17', 'A patient with severe psoriasis is starting Secukinumab.

Vitals: Normal.
Physical Examination: Plaques.
Laboratory Results: None.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which specific inflammatory cytokine is targeted by Secukinumab and Ixekizumab?', '["TNF-alpha","IL-17A","IL-23","IL-4"]', 1, 'These are highly effective modern biologics for psoriasis.'),
        (v_case_id, 'Patients with which underlying condition should avoid IL-17 inhibitors due to the risk of exacerbation?', '["Diabetes","Inflammatory Bowel Disease (Crohn''s/UC)","Asthma","None"]', 1, 'IL-17 inhibition has been linked to the worsening of IBD.'),
        (v_case_id, 'What type of infection is more common in patients taking IL-17 inhibitors?', '["Bacterial","Mucocutaneous Candidiasis","Viral","None"]', 1, 'IL-17 is crucial for host defense against Candida.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Gout Drug and the Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Gout Drug and the Rash', 'A patient with chronic gout starts Allopurinol. Two weeks later, he develops a high fever, a widespread rash, and swollen lymph nodes.

Vitals: T 39.0 C.
Physical Examination: Widespread morbilliform rash, facial edema, and lymphadenopathy.
Laboratory Results: Eosinophilia (WBC 15,000, 15% eosinophils), elevated ALT/AST.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the acronym DRESS stand for?', '["Daily Rash and Every Skin Sore","Drug Reaction with Eosinophilia and Systemic Symptoms","Dermal Redness and Severe Sepsis","None"]', 1, 'It is a severe, life-threatening drug reaction with internal organ involvement.'),
        (v_case_id, 'What is the typical ''Latency'' (time from drug start to rash) for DRESS?', '["1 day","2-8 weeks (longer than simple drug rashes)","1 year","None"]', 1, 'The long latency is a key diagnostic clue.'),
        (v_case_id, 'Which organ is most commonly involved in DRESS?', '["Lungs","Liver (hepatitis)","Kidneys","Brain"]', 1, 'Transaminitis is seen in most cases.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Acne and the ''Blue'' Pigment
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Acne and the ''Blue'' Pigment', 'A 25-year-old male who has been taking Minocycline for acne for 2 years notices his acne scars and shins are turning ''blue-gray''.

Vitals: Normal.
Physical Examination: Blue-gray pigmentation on the shins and within acne scars on the face.
Laboratory Results: None.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which medication is most commonly associated with blue-gray skin and mucosal pigmentation?', '["Doxycycline","Minocycline","Amoxicillin","None"]', 1, 'Minocycline can deposit in various tissues including skin, nails, and bones.'),
        (v_case_id, 'Besides the skin, where else can this pigmentation be seen?', '["Teeth (in adults)","Sclera, ears, and oral mucosa","Hair","None"]', 1, 'It is a widespread deposition phenomenon.'),
        (v_case_id, 'What is the management for minocycline-induced pigmentation?', '["More Minocycline","Discontinue the drug (though pigmentation may persist for a long time)","Topical Steroids","None"]', 1, 'Immediate cessation is required once noticed.');

    ---------------------------------------------------------------------------
    -- CASE 16: The ''Silver'' and the Pregnancy
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Silver'' and the Pregnancy', 'A pregnant woman with a small area of impetigo is asking if she can use topical Mupirocin.

Vitals: Normal.
Physical Examination: Honey-crusted sores.
Laboratory Results: None.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Mupirocin?', '["Inhibits cell wall synthesis","Inhibits bacterial protein synthesis by binding to isoleucyl-tRNA synthetase","Inhibits DNA","None"]', 1, 'This is a unique mechanism of action for this topical agent.'),
        (v_case_id, 'Is topical Mupirocin considered safe in pregnancy?', '["Yes (Category B)","No","Only in the 1st trimester","None"]', 0, 'It is widely used and generally considered safe for limited areas.'),
        (v_case_id, 'Mupirocin is highly effective against which organisms?', '["Gram-negatives only","Gram-positive cocci (including MRSA)","Fungi","Viruses"]', 1, 'It is the drug of choice for decolonizing MRSA from the nares.');

    ---------------------------------------------------------------------------
    -- CASE 17: The ''Old'' Antifungal and the Side Effects
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Old'' Antifungal and the Side Effects', 'A child with tinea capitis is started on oral Griseofulvin.

Vitals: Normal.
Physical Examination: Scaly scalp.
Laboratory Results: None.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How should Griseofulvin be taken to maximize absorption?', '["On an empty stomach","With a fatty meal (e.g., ice cream or whole milk)","With water only","None"]', 1, 'It is highly lipophilic; fat significantly increases bioavailability.'),
        (v_case_id, 'What is a common but annoying side effect of Griseofulvin?', '["Hair loss","Headache and GI upset","Blue skin","None"]', 1, 'Headaches are very common during the first few days of therapy.'),
        (v_case_id, 'Griseofulvin can induce which system in the liver?', '["None","Cytochrome P450 (decreasing the level of drugs like Warfarin or OCPs)","Lactate","None"]', 1, 'It is a known CYP450 inducer.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Itch and the ''New'' Eczema Drug
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itch and the ''New'' Eczema Drug', 'An adult with severe atopic dermatitis is starting Dupilumab (Dupixent).

Vitals: Normal.
Physical Examination: Extensive eczema.
Laboratory Results: None.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Dupilumab is a monoclonal antibody that targets which receptor?', '["TNF-alpha","IL-4 Receptor alpha (blocking both IL-4 and IL-13 signaling)","IL-17","None"]', 1, 'IL-4 and IL-13 are the ''master cytokines'' of Type 2 (Th2) inflammation.'),
        (v_case_id, 'What is the most common specific side effect of Dupilumab?', '["Liver failure","Conjunctivitis (red, itchy eyes)","Pneumonia","None"]', 1, 'Ocular side effects are uniquely common with this biologic.'),
        (v_case_id, 'Is baseline TB screening required for Dupilumab?', '["Yes, for all biologics","No, it is not significantly immunosuppressive in a way that reactivates TB","Only in the elderly","None"]', 1, 'Unlike TNF inhibitors, it does not carry a black box warning for TB.');

    ---------------------------------------------------------------------------
    -- CASE 19: The ''Sulfa'' and the SJS
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Sulfa'' and the SJS', 'A patient develops a blistering rash 10 days after starting TMP-SMX (Bactrim) for a UTI.

Vitals: T 38.0 C.
Physical Examination: Erythematous macules with central dusky areas; some sloughing on the back.
Laboratory Results: None.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Sulfonamides are a ''classic'' trigger for which severe skin reaction?', '["Acne","SJS/TEN","Psoriasis","None"]', 1, 'Along with Allopurinol and Anticonvulsants, Sulfa drugs are top culprits.'),
        (v_case_id, 'What other systemic ''Sulfa'' association is important in patients with G6PD deficiency?', '["Liver failure","Hemolytic anemia","Kidney stones","None"]', 1, 'Oxidative stress from Sulfa drugs triggers hemolysis in G6PD deficient patients.'),
        (v_case_id, 'Can a patient with a ''Sulfa'' allergy safely take Sulfonylureas (for diabetes)?', '["Yes, usually","No, never","Only if they are young","None"]', 0, 'Cross-reactivity between antimicrobial sulfonamides and non-antimicrobial sulfonamides (like diuretics or sulfonylureas) is extremely low and often overrated.');

    ---------------------------------------------------------------------------
    -- CASE 20: The ''Psoriasis'' and the IL-23
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the IL-23', 'A patient is starting Guselkumab (Tremfya).

Vitals: Normal.
Physical Examination: Plaques.
Laboratory Results: None.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which subunit is shared between IL-12 and IL-23, and was the target of the first ''interleukin'' biologic (Ustekinumab)?', '["p19","p40","p35","None"]', 1, 'Ustekinumab targets the p40 subunit.'),
        (v_case_id, 'Newer agents like Guselkumab target which specific subunit of IL-23?', '["p40","p19","p35","None"]', 1, 'Targeting p19 is more specific for IL-23 and doesn''t affect IL-12.'),
        (v_case_id, 'What is the primary advantage of these newer IL-23 inhibitors?', '["They are pills","Long dosing intervals (e.g., every 8-12 weeks) and high efficacy","No side effects","None"]', 1, 'The convenience and efficacy make them popular for long-term psoriasis management.');

    ---------------------------------------------------------------------------
    -- CASE 21: The ''Heart'' and the Antifungal
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Heart'' and the Antifungal', 'An elderly patient with onychomycosis and a history of Congestive Heart Failure is asking for oral Itraconazole.

Vitals: Normal.
Physical Examination: Thickened nails.
Laboratory Results: None.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the FDA Black Box Warning for Itraconazole?', '["Liver failure only","It can cause or exacerbate Congestive Heart Failure (negative inotropic effect)","Kidney failure","None"]', 1, 'This makes it a poor choice for patients with pre-existing heart disease.'),
        (v_case_id, 'Which type of ''Environment'' is required in the stomach for optimal Itraconazole absorption?', '["Alkaline","Acidic (do not take with PPIs or Antacids)","Neutral","None"]', 1, 'Itraconazole requires acid for dissolution.'),
        (v_case_id, 'Itraconazole is a potent inhibitor of which enzyme system?', '["None","CYP3A4 (leading to many drug-drug interactions)","Amylase","None"]', 1, 'It can dangerously increase levels of drugs like Statins or Midazolam.');

    ---------------------------------------------------------------------------
    -- CASE 22: The ''Lupus'' and the Anti-Malarial
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Lupus'' and the Anti-Malarial', 'A 30-year-old woman with Systemic Lupus Erythematosus (SLE) and a malar rash is started on Hydroxychloroquine (Plaquenil).

Vitals: Normal.
Physical Examination: Red ''butterfly'' rash on the face.
Laboratory Results: Positive ANA.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most important ''Long-term'' screening requirement for patients on Hydroxychloroquine?', '["Liver biopsy","Annual Ophthalmologic exam (to screen for retinal toxicity/bull''s eye maculopathy)","Hearing test","None"]', 1, 'Retinal toxicity is dose-dependent and can lead to irreversible vision loss.'),
        (v_case_id, 'Besides the skin, what major benefit does Hydroxychloroquine provide in SLE patients?', '["Weight loss","Decreases the frequency and severity of disease flares and improves overall survival","Cures the disease","None"]', 1, 'It is considered a ''cornerstone'' therapy for SLE.'),
        (v_case_id, 'Is Hydroxychloroquine safe to continue during pregnancy in an SLE patient?', '["No","Yes, and it is usually recommended to continue it to prevent maternal flares","Only in the 3rd trimester","None"]', 1, 'The benefits to the mother usually outweigh the risks.');

    ---------------------------------------------------------------------------
    -- CASE 23: The ''Psoriasis'' and the PDE4
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the PDE4', 'A patient who does not want injections or ''strong'' immunosuppressants is prescribed Apremilast (Otezla) for his psoriasis.

Vitals: Normal.
Physical Examination: Plaques.
Laboratory Results: None.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Apremilast?', '["TNF inhibitor","Phosphodiesterase-4 (PDE4) inhibitor","Steroid","None"]', 1, 'It increases intracellular cAMP, which downregulates inflammatory cytokines.'),
        (v_case_id, 'What is a common GI side effect that often requires a ''Starter Pack'' to slowly titrate the dose?', '["Constipation","Nausea and Diarrhea","Bloating","None"]', 1, 'Titration helps the body adjust to the GI effects.'),
        (v_case_id, 'Which neuropsychiatric side effect is mentioned in the labeling for Apremilast?', '["Mania","Depression and Suicidal ideation","Anxiety","None"]', 1, 'While rare, patients should be monitored for mood changes.');

    ---------------------------------------------------------------------------
    -- CASE 24: The ''Psoriasis'' and the IL-12/23
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the IL-12/23', 'A patient is starting Ustekinumab (Stelara).

Vitals: Normal.
Physical Examination: Plaques.
Laboratory Results: None.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Ustekinumab targets the common p40 subunit of which two interleukins?', '["IL-1 and IL-6","IL-12 and IL-23","IL-17 and IL-23","None"]', 1, 'This was the first ''targeted'' cytokine biologic for psoriasis after the TNF era.'),
        (v_case_id, 'What is the standard maintenance dosing interval for Ustekinumab?', '["Daily","Every week","Every 12 weeks","Once a year"]', 2, 'The long interval is a major advantage for patient compliance.'),
        (v_case_id, 'Like TNF inhibitors, does Ustekinumab require baseline TB screening?', '["No","Yes","Only in the elderly","None"]', 1, 'Screening for latent TB is standard for most systemic biologics used in dermatology.');

    ---------------------------------------------------------------------------
    -- CASE 25: The ''Itch'' and the ''Numb''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Numb''', 'A patient with shingles is asking for a ''patch'' to help with the pain.

Vitals: Normal.
Physical Examination: Healing vesicles.
Laboratory Results: None.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does Lidocaine provide pain relief?', '["Blocks histamine","Blocks voltage-gated sodium channels, preventing nerve conduction","Kills the virus","None"]', 1, 'It provides a local anesthetic effect.'),
        (v_case_id, 'What is the ''12 hours on, 12 hours off'' rule for lidocaine patches meant to prevent?', '["Skin irritation","Systemic lidocaine toxicity","Tolerance","None"]', 1, 'This ensures that systemic levels remain within the safe range.'),
        (v_case_id, 'Can the patch be applied to open, weeping shingles blisters?', '["Yes","No, it should only be applied to intact, healed skin","Only if covered with plastic","None"]', 1, 'Applying to broken skin significantly increases systemic absorption.');

    ---------------------------------------------------------------------------
    -- CASE 26: The ''Psoriasis'' and the Liver
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the Liver', 'A 50-year-old male with long-standing psoriasis has been on Methotrexate for 10 years. He is a social drinker.

Vitals: Normal.
Physical Examination: Minimal psoriasis plaques.
Laboratory Results: AST/ALT are mildly elevated (1.5x normal). Procollagen III peptide is elevated.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the long-term cumulative risk of Methotrexate use?', '["Kidney failure","Hepatic fibrosis and cirrhosis","Hearing loss","None"]', 1, 'Liver toxicity is dose-dependent and cumulative.'),
        (v_case_id, 'Which lifestyle factor significantly increases the risk of MTX-induced liver damage?', '["Smoking","Alcohol consumption","High protein diet","None"]', 1, 'Alcohol and MTX are synergistic hepatotoxins.'),
        (v_case_id, 'What is the ''Gold Standard'' for assessing MTX-induced liver fibrosis (though less commonly used now due to non-invasive tests)?', '["CT scan","Liver Biopsy","Ultrasound","None"]', 1, 'Historically, liver biopsy was required after 1.5-4g cumulative dose.');

    ---------------------------------------------------------------------------
    -- CASE 27: The ''Lupus'' and the ''White'' Blood Cells
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Lupus'' and the ''White'' Blood Cells', 'A patient with systemic lupus is started on Azathioprine.

Vitals: Normal.
Physical Examination: Joint pain and rash.
Laboratory Results: None.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which enzyme must be measured BEFORE starting Azathioprine to prevent life-threatening bone marrow suppression?', '["G6PD","Thiopurine Methyltransferase (TPMT)","Amylase","None"]', 1, 'Patients with low TPMT activity cannot metabolize the drug, leading to toxic levels of 6-TGN.'),
        (v_case_id, 'Azathioprine is a ''prodrug'' that is converted to which active metabolite?', '["6-Mercaptopurine (6-MP)","Methotrexate","Prednisone","None"]', 0, '6-MP is the active compound.'),
        (v_case_id, 'A dangerous drug interaction occurs when Azathioprine is combined with which gout medication?', '["Colchicine","Allopurinol (which inhibits xanthine oxidase, the alternative metabolic pathway)","Probenecid","None"]', 1, 'Allopurinol can increase Azathioprine levels by 4-fold, leading to severe leukopenia.');

    ---------------------------------------------------------------------------
    -- CASE 28: The ''Transplant'' and the Gum Swelling
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Transplant'' and the Gum Swelling', 'A renal transplant patient on Cyclosporine presents with ''swollen gums''.

Vitals: BP 155/95 (High).
Physical Examination: Gingival hyperplasia (overgrowth of the gums). Hirsutism (excess body hair).
Laboratory Results: Elevated Creatinine.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are the two major ''systemic'' side effects of Cyclosporine?', '["Weight loss and diarrhea","Nephrotoxicity and Hypertension","Anemia and hair loss","None"]', 1, 'Renal vasoconstriction leads to both high blood pressure and kidney damage.'),
        (v_case_id, 'The ''Gingival Hyperplasia'' seen with Cyclosporine is shared with which other common drug class?', '["Beta blockers","Calcium Channel Blockers (e.g., Nifedipine) and Phenytoin","Antibiotics","None"]', 1, 'This is a classic ''Step'' association for gum overgrowth.'),
        (v_case_id, 'Which medication is an ''alternative'' to Cyclosporine with less hirsutism and gum hyperplasia, but more risk of hair loss (alopecia)?', '["Azathioprine","Tacrolimus","Methotrexate","None"]', 1, 'Tacrolimus is also a calcineurin inhibitor but has a different side effect profile.');

    ---------------------------------------------------------------------------
    -- CASE 29: The ''Pemphigus'' and the ''Red'' Urine
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Red'' Urine', 'A patient with severe Pemphigus Vulgaris is started on Cyclophosphamide.

Vitals: Normal.
Physical Examination: Blisters.
Laboratory Results: UA shows microscopic hematuria.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common ''Bladder'' complication of Cyclophosphamide therapy?', '["Bladder stones","Hemorrhagic Cystitis (due to the metabolite Acrolein)","Bladder cancer (long-term risk)","Both 1 and 2"]', 3, 'Acrolein is toxic to the urothelium.'),
        (v_case_id, 'What can be given to patients on high-dose IV Cyclophosphamide to prevent this bladder toxicity?', '["Vitamin C","MESNA (2-mercaptoethane sulfonate) and vigorous hydration","Aspirin","None"]', 1, 'MESNA binds Acrolein in the bladder, rendering it non-toxic.'),
        (v_case_id, 'Besides the bladder, which system is frequently affected by Cyclophosphamide, leading to ''Infertility''?', '["Liver","Gonads (Ovarian failure or permanent azoospermia)","Thyroid","None"]', 1, 'Gonadal toxicity is a major counseling point for young patients.');

    ---------------------------------------------------------------------------
    -- CASE 30: The ''Acne'' and the ''Headache''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Headache''', 'A 20-year-old female taking Doxycycline for acne and oral contraceptives starts Isotretinoin. She develops a severe, ''throbbing'' headache and blurry vision.

Vitals: Normal.
Physical Examination: Papilledema (swollen optic discs) on fundoscopy.
Laboratory Results: Normal Brain MRI.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the diagnosis for increased intracranial pressure without a tumor?', '["Meningitis","Pseudotumor Cerebri (Idiopathic Intracranial Hypertension)","Migraine","Stroke"]', 1, 'Drug-induced IIH is a known risk.'),
        (v_case_id, 'The combination of which two drug classes is notoriously linked to this complication?', '["Penicillins and Steroids","Tetracyclines (Doxy/Mino) and Retinoids (Isotretinoin)","Statins and Fibrates","None"]', 1, 'Tetracyclines and Retinoids should NEVER be used together for this reason.'),
        (v_case_id, 'What is the first step in management?', '["Increase the drug dose","Discontinue the offending medications immediately and refer to Neurology/Ophthalmology","Give Aspirin","None"]', 1, 'Immediate cessation is required to prevent permanent vision loss from optic nerve damage.');

    ---------------------------------------------------------------------------
    -- CASE 31: The ''Itch'' and the ''Bone'' Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Bone'' Pain', 'A woman with psoriasis has been on long-term, high-dose oral Prednisone. She develops sudden, severe hip pain.

Vitals: Normal.
Physical Examination: Pain with internal rotation of the hip. No fever.
Laboratory Results: MRI shows ''Avascular Necrosis'' of the femoral head.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Long-term systemic corticosteroids are a major risk factor for which skeletal complication?', '["Osteosarcoma","Avascular Necrosis (Osteonecrosis)","Bone spurs","None"]', 1, 'This is a non-dose-dependent, potentially devastating side effect.'),
        (v_case_id, 'Which metabolic bone disease is almost ''Guaranteed'' with long-term steroid use, requiring prophylactic therapy?', '["Rickets","Steroid-induced Osteoporosis","Paget''s disease","None"]', 1, 'Bisphosphonates, Calcium, and Vitamin D are often started early.'),
        (v_case_id, 'What happens to the ''Sugar'' in a diabetic patient started on systemic steroids?', '["It goes down","It goes up (Hyperglycemia)","It stays the same","None"]', 1, 'Steroids increase gluconeogenesis and decrease insulin sensitivity.');

    ---------------------------------------------------------------------------
    -- CASE 32: The ''Target'' and the ''Yeast''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Yeast''', 'A patient being treated with an IL-17 inhibitor (e.g., Taltz) for psoriasis develops white patches in his mouth.

Vitals: Normal.
Physical Examination: Oral thrush.
Laboratory Results: KOH shows pseudohyphae.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why does blocking IL-17 increase the risk of fungal infections like Candida?', '["It kills white blood cells","IL-17 is essential for the recruitment of neutrophils to fight fungal infections at mucosal surfaces","It makes the mouth dry","None"]', 1, 'The Th17 pathway is the primary defense against extracellular fungi.'),
        (v_case_id, 'Is oral thrush a reason to permanently stop the IL-17 inhibitor?', '["Yes, always","No, it is usually mild and can be managed with standard topical antifungals (e.g., Nystatin) while continuing the biologic","Only in the elderly","None"]', 1, 'The benefit of psoriasis control usually outweighs the manageable side effect.'),
        (v_case_id, 'Which other IL-17 related agent (a receptor blocker) has an even higher rate of candidiasis?', '["Secukinumab","Brodalumab","Ixekizumab","None"]', 1, 'Brodalumab (the receptor blocker) has slightly higher reported rates.');

    ---------------------------------------------------------------------------
    -- CASE 33: The ''Acne'' and the ''Yellow'' Eyes
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Yellow'' Eyes', 'A 16-year-old on Minocycline for 6 months develops fatigue and ''yellow eyes''.

Vitals: Normal.
Physical Examination: Scleral icterus.
Laboratory Results: AST/ALT 800 (very high). Positive Anti-nuclear antibody (ANA) and Anti-smooth muscle antibody (ASMA).', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Minocycline is a recognized trigger for which autoimmune liver condition?', '["Primary Biliary Cholangitis","Drug-induced Autoimmune Hepatitis (DIAH)","Liver cancer","None"]', 1, 'It can mimic idiopathic AIH with positive ANA and ASMA.'),
        (v_case_id, 'What is the management of Minocycline-induced hepatitis?', '["Add Prednisone and stop the Minocycline","Increase the Minocycline dose","Antibiotics","None"]', 0, 'Stopping the drug is mandatory; steroids may be needed if the hepatitis is severe.'),
        (v_case_id, 'Besides the liver, which ''Lupus-like'' syndrome can Minocycline cause?', '["Discoid lupus","Drug-induced Systemic Lupus Erythematosus (DILE)","Neonatal lupus","None"]', 1, 'Minocycline is a classic cause of DILE, along with Hydralazine and Procainamide.');

    ---------------------------------------------------------------------------
    -- CASE 34: The ''Psoriasis'' and the ''Bad Mood''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Bad Mood''', 'A patient on Brodalumab (Siliq) for severe psoriasis mentions he has been ''feeling very down'' and thinking about hurting himself.

Vitals: Normal.
Physical Examination: Plaques are clear.
Laboratory Results: None.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why does Brodalumab have a ''Black Box Warning'' and a REMS (Risk Evaluation and Mitigation Strategy) program?', '["Liver failure","Observed suicidal ideation and behavior in clinical trials","Kidney failure","Heart attacks"]', 1, 'While the causal link is debated, the warning remains part of the mandatory safety protocol.'),
        (v_case_id, 'What should you do if a patient on Brodalumab develops new or worsening depression?', '["Nothing, keep the drug","Refer for psychiatric evaluation and consider discontinuing the drug","Give more psoriasis medicine","None"]', 1, 'Patient safety regarding mood is a priority for this specific medication.'),
        (v_case_id, 'Brodalumab is unique among IL-17 agents because it targets what?', '["The IL-17A cytokine","The IL-17 Receptor A (IL-17RA)","IL-23","None"]', 1, 'It blocks the receptor, thereby blocking signaling from multiple IL-17 isoforms (A, F, A/F, E).');

    ---------------------------------------------------------------------------
    -- CASE 35: The ''Itch'' and the ''Pill'' Absorption
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Pill'' Absorption', 'A patient with high cholesterol taking Cholestyramine is also prescribed oral Terbinafine for onychomycosis.

Vitals: Normal.
Physical Examination: Thick nails.
Laboratory Results: None.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does Cholestyramine affect the absorption of other oral medications?', '["It increases it","It binds to many drugs in the GI tract, significantly decreasing their absorption","It has no effect","None"]', 1, 'It is a non-specific bile acid sequestrant.'),
        (v_case_id, 'What is the best way to avoid this interaction?', '["Take them together","Space the medications out (e.g., take other drugs 1 hour before or 4-6 hours after the resin)","Take with fat","None"]', 1, 'Timing is everything with binding resins.'),
        (v_case_id, 'Which vitamin absorption can also be impaired by chronic resin use?', '["Vitamin C","Fat-soluble vitamins (A, D, E, K)","B-vitamins","None"]', 1, 'Bile is needed for the absorption of fat-soluble vitamins.');

    ---------------------------------------------------------------------------
    -- CASE 36: The ''Blister'' and the ''Dapsone''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Blister'' and the ''Dapsone''', 'A patient with Dermatitis Herpetiformis is started on Dapsone. A few days later, he feels ''short of breath'' and his lips look ''blue-gray''.

Vitals: O2 Sat 88% (on room air, but does not improve with 100% oxygen).
Physical Examination: Cyanosis (blue lips/nails). The blood draw looks ''chocolate-colored''.
Laboratory Results: Normal PaO2 on ABG.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the diagnosis for cyanosis with a normal PaO2 and ''chocolate blood''?', '["Heart failure","Methemoglobinemia","Carbon monoxide poisoning","Anemia"]', 1, 'Dapsone is a powerful oxidizing agent that converts ferrous iron to ferric iron in hemoglobin.'),
        (v_case_id, 'What is the ''Antidote'' for severe, symptomatic methemoglobinemia?', '["Oxygen only","Methylene Blue (which reduces the iron back to the ferrous state)","Vitamin C","None"]', 1, 'Methylene blue is the rapid treatment of choice.'),
        (v_case_id, 'Which enzyme deficiency makes the hemolytic side effects of Dapsone much worse?', '["TPMT","G6PD Deficiency","Amylase","None"]', 1, 'G6PD is needed to protect RBCs from oxidative stress.');

    ---------------------------------------------------------------------------
    -- CASE 37: The ''Lupus'' and the ''Puffy'' Face
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Lupus'' and the ''Puffy'' Face', 'A patient on long-term Prednisone for lupus presents with a ''round'' face and a ''hump'' on her upper back.

Vitals: BP 150/90.
Physical Examination: Moon facies, buffalo hump, and wide purple striae (stretch marks) on the abdomen.
Laboratory Results: None.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of these physical changes?', '["The underlying lupus","Iatrogenic Cushing Syndrome due to chronic exogenous corticosteroid use","Too much salt","None"]', 1, 'Excessive cortisol (synthetic) leads to fat redistribution and skin thinning.'),
        (v_case_id, 'What should be done when a patient has been on high-dose steroids for several weeks and needs to stop?', '["Stop immediately","Taper the dose slowly to allow the suppressed HPA axis (adrenal glands) to recover","Switch to oral antibiotics","None"]', 1, 'Sudden withdrawal can lead to life-threatening adrenal crisis.'),
        (v_case_id, 'Why do the ''striae'' in Cushing''s look purple?', '["They are bruised","The skin is so thin that the underlying blood vessels are visible","It is an allergy","None"]', 1, 'Wide (>1cm), purple striae are highly suggestive of Cushing''s.');

    ---------------------------------------------------------------------------
    -- CASE 38: The ''Pemphigus'' and the ''Rituximab''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Rituximab''', 'A patient with refractory Pemphigus Vulgaris is receiving Rituximab infusions.

Vitals: Normal.
Physical Examination: Eroded skin.
Laboratory Results: None.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Rituximab is a monoclonal antibody that targets which protein on B-cells?', '["CD4","CD20","CD8","None"]', 1, 'Depleting B-cells reduces the production of the pathogenic desmoglein autoantibodies.'),
        (v_case_id, 'What is the major systemic risk during the infusion of Rituximab?', '["Kidney stones","Infusion-related reactions (fever, chills, hypotension) and anaphylaxis","Hair loss","None"]', 1, 'Patients are often pre-medicated with antihistamines and acetaminophen.'),
        (v_case_id, 'Which rare but fatal brain infection can occur with Rituximab (and other immunosuppressants)?', '["Meningitis","Progressive Multifocal Leukoencephalopathy (PML) due to JC virus reactivation","Brain abscess","None"]', 1, 'PML is a serious safety concern for many targeted biologic therapies.');

    ---------------------------------------------------------------------------
    -- CASE 39: The ''Acne'' and the ''Pill'' Safety
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Pill'' Safety', 'A woman on Isotretinoin is using oral contraceptives and condoms for the ''two forms of birth control'' required by iPLEDGE.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: None.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why are progestin-only ''mini-pills'' NOT recommended as a primary form of birth control on Isotretinoin?', '["They cause acne","They have a higher failure rate and are considered less reliable than combined OCPs","They are too expensive","None"]', 1, 'iPLEDGE has specific requirements for ''highly effective'' contraception.'),
        (v_case_id, 'Which common antibiotic used for acne can potentially decrease the efficacy of oral contraceptives (though this is debated)?', '["Tetracyclines","Rifampin (the only one with strong evidence for this)","Penicillin","None"]', 1, 'While commonly taught, only enzyme-inducers like Rifampin have solid evidence for OCP failure.'),
        (v_case_id, 'What is the ''iPLEDGE'' requirement for pregnancy testing?', '["Once a year","Monthly, before each new prescription is issued","Only at the start","None"]', 1, 'Strict monthly adherence is mandatory.');

    ---------------------------------------------------------------------------
    -- CASE 40: The ''Psoriasis'' and the ''Stomach'' Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Stomach'' Pain', 'A patient on Methotrexate for 2 years develops abdominal pain and dark, tarry stools.

Vitals: HR 110, BP 100/60.
Physical Examination: Epigastric tenderness.
Laboratory Results: Hemoglobin 9.0 (Low).', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which common over-the-counter medication class can dangerously increase Methotrexate levels by competing for renal excretion?', '["Acetaminophen","NSAIDs (e.g., Ibuprofen, Naproxen)","Vitamins","None"]', 1, 'NSAIDs can lead to Methotrexate toxicity, including GI ulceration and bone marrow suppression.'),
        (v_case_id, 'What is the primary site of Methotrexate elimination?', '["Liver","Kidneys (Renal excretion)","Lungs","None"]', 1, 'Dosage must be adjusted for renal impairment.'),
        (v_case_id, 'Besides NSAIDs, which other drug class can decrease renal MTX clearance?', '["Statins","Proton Pump Inhibitors (PPIs)","Antibiotics like Penicillin","Both 2 and 3"]', 3, 'Many common drugs can interfere with MTX clearance.');

    ---------------------------------------------------------------------------
    -- CASE 41: The ''Itch'' and the ''Nail'' Polish (Management)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Nail'' Polish (Management)', 'A patient with allergic contact dermatitis to nickel is looking for ways to prevent the rash.

Vitals: Normal.
Physical Examination: Red, itchy rash under the metal button of her jeans.
Laboratory Results: Positive patch test to Nickel.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best ''Non-pharmacologic'' way to prevent nickel dermatitis from clothing?', '["Wash clothes in bleach","Apply a barrier (like a piece of tape or clear nail polish) over the metal button, or wear a shirt tucked in","Take an antihistamine daily","None"]', 1, 'Physical separation of the skin and the allergen is key.'),
        (v_case_id, 'Which chemical test kit can be used to identify nickel in jewelry at home?', '["Wood''s lamp","Dimethylglyoxime test (turns pink in the presence of nickel)","Pregnancy test","None"]', 1, 'This is a practical tool for sensitized patients.'),
        (v_case_id, 'What is the best initial treatment for the ''rash'' itself once it appears?', '["Topical steroids","Topical antibiotics","Oral steroids","None"]', 0, 'Topical steroids treat the acute allergic inflammation.');

    ---------------------------------------------------------------------------
    -- CASE 42: The ''Pemphigus'' and the ''Bone'' Safety
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Bone'' Safety', 'A 60-year-old female is starting a 6-month course of high-dose Prednisone for Pemphigus.

Vitals: Normal.
Physical Examination: Blisters.
Laboratory Results: None.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the recommended baseline screening for this patient?', '["Liver ultrasound","DEXA scan (to measure bone mineral density)","Chest X-ray","None"]', 1, 'Long-term steroids (>3 months) carry a high risk of osteoporosis.'),
        (v_case_id, 'Which supplement combination is standard for prevention?', '["Iron and Zinc","Calcium and Vitamin D","Vitamin C and E","None"]', 1, 'These provide the building blocks for bone maintenance.'),
        (v_case_id, 'Which class of medication is often added if the patient is at high risk for fracture?', '["Statins","Bisphosphonates (e.g., Alendronate)","Antibiotics","None"]', 1, 'Bisphosphonates are first-line for steroid-induced osteoporosis.');

    ---------------------------------------------------------------------------
    -- CASE 43: The ''Acne'' and the ''Birth'' Defects
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Birth'' Defects', 'A woman on Isotretinoin discovers she is pregnant.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: Positive HCG.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Isotretinoin is what Category in pregnancy?', '["Category A","Category X (Teratogenic)","Category B","None"]', 1, 'It is one of the most potent human teratogens known.'),
        (v_case_id, 'What is the characteristic ''Retinoid Embryopathy'' triad of defects?', '["Heart, Brain, and Ears (e.g., microtia)","Lungs, Liver, Kidneys","Skin only","None"]', 0, 'Craniofacial, CNS, and cardiovascular defects are classic.'),
        (v_case_id, 'How many months after stopping Isotretinoin is it safe to conceive?', '["Immediately","1 month (due to the short half-life of 20 hours)","3 years","Never"]', 1, 'This is a key contrast to Acitretin (3 years).');

    ---------------------------------------------------------------------------
    -- CASE 44: The ''Psoriasis'' and the ''Blood'' Pressure
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Blood'' Pressure', 'A 50-year-old male on Cyclosporine for psoriasis has a blood pressure of 160/100.

Vitals: BP 160/100.
Physical Examination: Plaques are better.
Laboratory Results: Creatinine 1.5 (Baseline 0.9).', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary mechanism of Cyclosporine-induced hypertension?', '["Too much salt","Renal afferent arteriolar vasoconstriction","Direct effect on the heart","None"]', 1, 'Reduced blood flow to the kidneys triggers the RAAS system.'),
        (v_case_id, 'Which anti-hypertensive class is often preferred to treat this specific side effect?', '["Beta blockers","Calcium Channel Blockers (e.g., Nifedipine/Amlodipine) as they may help reverse the vasoconstriction","Diuretics","None"]', 1, 'Dihydropyridine CCBs are a logical choice.'),
        (v_case_id, 'What should be done with the Cyclosporine dose if the Creatinine rises >30% above baseline?', '["Increase it","Decrease the dose or discontinue the drug","Keep it the same","None"]', 1, 'Close monitoring of renal function is the cornerstone of safe Cyclosporine use.');

    ---------------------------------------------------------------------------
    -- CASE 45: The ''Itch'' and the ''Light''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Light''', 'A patient with severe eczema is receiving Narrowband UVB therapy.

Vitals: Normal.
Physical Examination: Lichenified skin.
Laboratory Results: None.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the wavelength of Narrowband UVB (NB-UVB)?', '["254 nm","311-313 nm","350 nm","None"]', 1, 'This narrow peak provides the best therapeutic effect with the least burning (erythema).'),
        (v_case_id, 'What is the most common ''Acute'' side effect of phototherapy?', '["Skin cancer","Erythema (sunburn) and itching","Weight gain","None"]', 1, 'Monitoring the Minimal Erythema Dose (MED) is part of the protocol.'),
        (v_case_id, 'What is the long-term risk of excessive phototherapy over many years?', '["Cataracts","Photoaging and increased risk of non-melanoma skin cancer","Liver failure","None"]', 1, 'Cumulative UV exposure is a risk factor for carcinogenesis.');

    ---------------------------------------------------------------------------
    -- CASE 46: The ''Psoriasis'' and the ''Joint'' Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Joint'' Pain', 'A patient with psoriasis develops joint swelling. He is started on Methotrexate.

Vitals: Normal.
Physical Examination: Swollen PIP and DIP joints (Dactylitis/Sausage digits).
Laboratory Results: Negative Rheumatoid Factor.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is Methotrexate often chosen for patients with both skin psoriasis and joint involvement?', '["It''s cheap","It treats both the cutaneous plaques and the underlying inflammatory arthritis","It''s a pill","None"]', 1, 'MTX is a first-line DMARD for psoriatic arthritis.'),
        (v_case_id, 'Which specific joint finding is more common in Psoriatic Arthritis than Rheumatoid Arthritis?', '["Wrist swelling","DIP joint involvement and dactylitis (sausage digits)","Knee pain","None"]', 1, 'DIP involvement is a hallmark of PsA.'),
        (v_case_id, 'If the patient fails Methotrexate, which drug class is usually the next step for psoriatic arthritis?', '["Topical steroids","TNF-alpha inhibitors (e.g., Etanercept, Adalimumab)","Antibiotics","None"]', 1, 'Biologics are highly effective for the axial and peripheral joints in PsA.');

    ---------------------------------------------------------------------------
    -- CASE 47: The ''Acne'' and the ''Mood'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Mood'' (Reasoning)', 'A 17-year-old male on Isotretinoin for 3 months has become withdrawn and is no longer interested in playing soccer with his friends.

Vitals: Normal.
Physical Examination: Acne is improving.
Laboratory Results: None.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Is there a proven causal link between Isotretinoin and depression/suicide?', '["Yes, 100%","It remains controversial; studies show mixed results, but the risk must be taken seriously and monitored","No, it''s impossible","None"]', 1, 'The FDA requires warnings despite the lack of a definitive causative mechanism.'),
        (v_case_id, 'What is the best next step in management for this patient?', '["Increase the dose to clear the acne faster","Screen for depression, involve the parents, and consider discontinuing the drug for evaluation","Give an antidepressant and keep the drug","None"]', 1, 'Clinical safety and mental health take priority over acne clearing.'),
        (v_case_id, 'Which other systemic ''Retinoid'' (used for psoriasis) has a similar warning?', '["Tretinoin","Acitretin","None","Brodalumab (biologic, not a retinoid)"]', 3, 'While Brodalumab has the warning, Acitretin generally does not have the same level of focus on mood as Isotretinoin.');

    ---------------------------------------------------------------------------
    -- CASE 48: The ''Itch'' and the ''Heart'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Heart'' (Reasoning)', 'An elderly patient with onychomycosis is taking Terbinafine. He also takes Digoxin for atrial fibrillation.

Vitals: Normal.
Physical Examination: Brittle nails.
Laboratory Results: None.', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Between Terbinafine and Itraconazole, which has ''Fewer'' cytochrome P450 drug interactions?', '["Itraconazole","Terbinafine","They are the same","None"]', 1, 'Terbinafine is a safer choice for patients on multiple medications (polypharmacy).'),
        (v_case_id, 'Which specific Digoxin-related risk is a concern with Itraconazole (but not Terbinafine)?', '["It makes Digoxin stop working","It can increase Digoxin levels, leading to toxicity","It causes rashes","None"]', 1, 'Itraconazole is a CYP3A4 inhibitor; Terbinafine is a CYP2D6 inhibitor.'),
        (v_case_id, 'What is the preferred management for nail fungus in a patient with multi-organ failure?', '["Oral antifungals","Topical therapy (e.g., Efinaconazole) or conservative nail trimming","Surgery","None"]', 1, 'The risks of systemic therapy often outweigh the benefits in very frail patients.');

    ---------------------------------------------------------------------------
    -- CASE 49: The ''Pemphigus'' and the ''Sugar'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Sugar'' (Reasoning)', 'A diabetic patient with Pemphigus Vulgaris needs a high-dose steroid taper.

Vitals: Normal.
Physical Examination: Blisters.
Laboratory Results: Blood sugar 350.', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the expected effect of Prednisone on insulin requirements?', '["Requirement decreases","Requirement increases (often requiring a significant increase in basal and bolus insulin)","No change","None"]', 1, 'Steroids induce significant insulin resistance.'),
        (v_case_id, 'Which steroid has ''Zero'' mineralocorticoid (salt-retaining) activity, making it safer for patients with heart failure or severe edema?', '["Hydrocortisone","Dexamethasone","Prednisone","None"]', 1, 'Dexamethasone and Betamethasone have purely glucocorticoid activity.'),
        (v_case_id, 'When a patient is on long-term steroids, what happens to their ''WBC'' count?', '["It goes down","It goes up (Leukocytosis with Neutrophilia due to demargination)","It stays the same","None"]', 1, 'This is a benign ''Step'' association; it doesn''t always mean infection.');

    ---------------------------------------------------------------------------
    -- CASE 50: The ''Acne'' and the ''Liver'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Liver'' (Reasoning)', 'A patient on Isotretinoin has an ALT that is 2x the upper limit of normal.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: ALT 80, AST 70 (Normal <40).', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the standard management for a mild ( < 3x normal) elevation of transaminases on Isotretinoin?', '["Stop immediately","Monitor closely and repeat labs; only discontinue if levels exceed 3x normal or the patient becomes symptomatic","Ignore it forever","None"]', 1, 'Minor elevations often stabilize or resolve without stopping the drug.'),
        (v_case_id, 'If the Triglycerides rise to > 500 mg/dL, what is the concern?', '["Heart attack","Risk of acute pancreatitis","Hair loss","None"]', 1, 'Severe hypertriglyceridemia (>800-1000) is a mandatory reason for drug cessation.'),
        (v_case_id, 'What is the effect of Isotretinoin on ''Bone'' in long-term high-dose therapy (e.g., for ichthyosis)?', '["None","Premature epiphyseal closure and DISH (diffuse idiopathic skeletal hyperostosis)","Bone growth","None"]', 1, 'Skeletal toxicity is a concern with multi-year high-dose retinoid use.');

    ---------------------------------------------------------------------------
    -- CASE 51: The Itchy Patient and the Permethrin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Patient and the Permethrin', 'A family of four is treated for scabies with Permethrin 5% cream. One week later, the mother is still itching intensely.

Vitals: Normal.
Physical Examination: No new burrows, but the skin is dry and erythematous.
Laboratory Results: None.', 51)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Itching that persists for up to 2-4 weeks AFTER successful scabies treatment is most likely due to:', '["Re-infection","A hypersensitivity reaction to dead mites and their debris (post-scabietic dermatitis)","Treatment failure","None"]', 1, 'The immune system continues to react to the persistent antigens.'),
        (v_case_id, 'What is the best management for post-scabietic itch?', '["Immediate re-treatment with Permethrin","Topical steroids and oral antihistamines","Oral antibiotics","None"]', 1, 'Re-treatment should be avoided unless new burrows or lesions are seen, as Permethrin itself can be irritating.'),
        (v_case_id, 'When is a patient considered ''non-infectious'' after Permethrin application?', '["Immediately after washing off the first treatment","After 1 week","After 1 month","None"]', 0, 'One thorough application usually kills all active mites.');

    ---------------------------------------------------------------------------
    -- CASE 52: The ''Psoriasis'' and the ''Calcipotriene''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Calcipotriene''', 'A patient with stable plaque psoriasis is prescribed Calcipotriene cream.

Vitals: Normal.
Physical Examination: Plaques.
Laboratory Results: None.', 52)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Calcipotriene?', '["Inhibits keratinocyte proliferation and promotes differentiation","Blocks histamine","Kills bacteria","None"]', 0, 'It binds to the Vitamin D receptor to normalize skin cell growth.'),
        (v_case_id, 'Calcipotriene is most effective when used in combination with which other therapy?', '["Antifungals","Topical corticosteroids (often used as a fixed-combination product)","Antibiotics","None"]', 1, 'The combination (e.g., Taclonex) is more effective and less irritating than either alone.'),
        (v_case_id, 'What is a potential, though rare, systemic side effect of using excessive amounts of Calcipotriene (>100g/week)?', '["Anemia","Hypercalcemia (due to systemic absorption of the Vit D analog)","Liver failure","None"]', 1, 'Strict quantity limits are recommended to avoid metabolic effects.');

    ---------------------------------------------------------------------------
    -- CASE 53: The ''Acne'' and the ''Benzoyl Peroxide''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Benzoyl Peroxide''', 'A 16-year-old is using a benzoyl peroxide wash. He notices his ''towels and shirts'' are developing white spots.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: None.', 53)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary antibacterial mechanism of Benzoyl Peroxide?', '["Blocks tRNA","Releases oxygen (free radicals) that kills anaerobic C. acnes","Inhibits cell wall","None"]', 1, 'It is a potent bactericidal agent with no known resistance.'),
        (v_case_id, 'What should you counsel the patient regarding his clothing and towels?', '["It will cause a rash on the clothes","It can bleach colored fabrics","It makes clothes catch fire","None"]', 1, 'Bleaching of fabric is a classic and very common ''real-world'' counseling point.'),
        (v_case_id, 'How does Benzoyl Peroxide help prevent antibiotic resistance in acne?', '["It doesn''t","When used in combination, it prevents the development of resistant C. acnes strains","It makes the antibiotic stronger","None"]', 1, 'Combination therapy (BP + Antibiotic) is the standard of care for this reason.');

    ---------------------------------------------------------------------------
    -- CASE 54: The ''Lupus'' and the ''Puffy'' Face (Management)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Lupus'' and the ''Puffy'' Face (Management)', 'A patient on Prednisone has been diagnosed with steroid-induced diabetes.

Vitals: Normal.
Physical Examination: Moon facies.
Laboratory Results: Post-prandial blood sugar 250.', 54)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Steroid-induced hyperglycemia typically peaks at what time of day?', '["Fasting (early morning)","Afternoon and evening (due to the morning dosing of steroids)","Middle of the night","None"]', 1, 'Glucocorticoid effects on blood sugar usually follow the dosing schedule.'),
        (v_case_id, 'What is the best initial approach to management in a non-diabetic patient who develops steroid-induced hyperglycemia?', '["Diet only","Oral hypoglycemics or insulin (often NPH is used to match the steroid peak)","Stop steroids immediately","None"]', 1, 'Management must be active if the hyperglycemia is significant.'),
        (v_case_id, 'Will the diabetes resolve after the steroids are stopped?', '["Always","Usually, but it may unmask permanent Type 2 Diabetes in predisposed individuals","Never","None"]', 1, 'The ''steroid stress test'' can reveal underlying metabolic weakness.');

    ---------------------------------------------------------------------------
    -- CASE 55: The ''Wart'' and the ''Podophyllin''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Wart'' and the ''Podophyllin''', 'A patient with genital warts is treated with Podophyllin resin in the office.

Vitals: Normal.
Physical Examination: Condyloma acuminata.
Laboratory Results: None.', 55)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Podophyllin?', '["Immune stimulant","Antimitotic agent (blocks spindle formation in mitosis)","Acid","None"]', 1, 'It is derived from the Mayapple plant.'),
        (v_case_id, 'What is the most important instruction for the patient after an ''in-office'' application of Podophyllin resin?', '["Leave it on for 24 hours","Wash the area thoroughly after 4-6 hours to prevent severe chemical irritation/burn","Apply more at home","None"]', 1, 'Resin application requires strict timing and washing.'),
        (v_case_id, 'Is Podophyllin safe for use in pregnancy?', '["Yes","No (Category X - teratogenic and potential fetal risk)","Only in the 3rd trimester","None"]', 1, 'It is strictly contraindicated in pregnancy.');

    ---------------------------------------------------------------------------
    -- CASE 56: The ''Itch'' and the ''Urea''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Urea''', 'A patient with very dry, scaly feet is prescribed 40% Urea cream.

Vitals: Normal.
Physical Examination: Thick, hyperkeratotic soles.
Laboratory Results: None.', 56)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does Urea help dry, thickened skin?', '["It adds oil","It is a keratolytic (breaks down keratin) and a humectant (draws water into the skin)","It kills fungus","None"]', 1, 'At high concentrations (>20%), it is an effective keratolytic.'),
        (v_case_id, 'Which other condition is high-concentration Urea used for?', '["Acne","Nonsurgical avulsion of a thickened or fungal nail (softens the nail plate)","Itch","None"]', 1, 'It can be used to ''melt'' away a diseased nail.'),
        (v_case_id, 'What is a common side effect of applying high-concentration Urea to cracked or eroded skin?', '["Hair growth","Intense stinging and irritation","Numbness","None"]', 1, 'It should only be applied to intact, thickened skin.');

    ---------------------------------------------------------------------------
    -- CASE 57: The ''Pemphigus'' and the ''Mycophenolate''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Mycophenolate''', 'A patient is starting Mycophenolate Mofetil (CellCept) for a blistering disease.

Vitals: Normal.
Physical Examination: Blisters.
Laboratory Results: None.', 57)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Mycophenolate Mofetil?', '["Blocks TNF","Inhibits inosine monophosphate dehydrogenase (IMPDH), blocking de novo purine synthesis in lymphocytes","Blocks folate","None"]', 1, 'Lymphocytes are particularly dependent on the de novo pathway, making the drug relatively selective.'),
        (v_case_id, 'What is the most common dose-limiting side effect of Mycophenolate?', '["Kidney failure","Gastrointestinal upset (diarrhea, bloating, cramping)","Hair loss","None"]', 1, 'GI symptoms are frequent and often require dose titration or switching to the enteric-coated form.'),
        (v_case_id, 'Is Mycophenolate safe in pregnancy?', '["Yes","No (highly teratogenic; associated with characteristic ''Mycophenolate embryopathy'')","Only for small doses","None"]', 1, 'Strict birth control is required for women of childbearing age.');

    ---------------------------------------------------------------------------
    -- CASE 58: The ''Itch'' and the ''Doxepin'' Trap
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Doxepin'' Trap', 'A patient with chronic eczema is given topical Doxepin cream for severe itching. She develops profound sleepiness.

Vitals: Normal.
Physical Examination: Drowsy.', 58)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What class of medication is Doxepin?', '["Antihistamine","Tricyclic Antidepressant (TCA) with potent H1 and H2 blocking activity","Steroid","None"]', 1, 'It is a TCA used topically for its extremely strong anti-itch properties.'),
        (v_case_id, 'Why can topical Doxepin cause systemic sedation?', '["It smells like sleep medicine","Significant systemic absorption can occur, especially when applied to large areas or broken skin","It''s an allergy","None"]', 1, 'Topicals can have systemic effects.'),
        (v_case_id, 'Which patient population should be especially cautious with topical Doxepin?', '["Children","The elderly (due to anticholinergic side effects and fall risk)","Wrestlers","None"]', 1, 'Like oral TCAs, the side effect profile is problematic in the elderly.');

    ---------------------------------------------------------------------------
    -- CASE 59: The ''Wart'' and the ''Imiquimod''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Wart'' and the ''Imiquimod''', 'A patient is using Imiquimod 5% cream for a basal cell carcinoma on his arm. The area has become bright red, swollen, and crusty.

Vitals: Normal.
Physical Examination: Intense inflammatory reaction at the site of application.
Laboratory Results: None.', 59)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Imiquimod?', '["Toxic to cells","Toll-like receptor 7 (TLR7) agonist that stimulates the innate immune response (IFN-alpha production)","Acid","None"]', 1, 'It is an immune response modifier.'),
        (v_case_id, 'Does the intense inflammatory reaction mean the drug should be stopped immediately?', '["Yes, it''s an allergy","No, the inflammatory response is part of the therapeutic mechanism (the immune system attacking the tumor/virus)","Only if it bleeds","None"]', 1, 'A ''brisk'' reaction often correlates with better clinical outcomes.'),
        (v_case_id, 'What ''Flu-like'' symptoms can occur with widespread Imiquimod use?', '["Fever, malaise, and myalgias (due to systemic cytokine release)","Cough","Diarrhea","None"]', 0, 'Systemic absorption can lead to a systemic cytokine response.');

    ---------------------------------------------------------------------------
    -- CASE 60: The ''Itch'' and the ''Camphor/Menthol''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Camphor/Menthol''', 'A patient with ''winter itch'' uses a lotion containing camphor and menthol.

Vitals: Normal.
Physical Examination: Dry skin.
Laboratory Results: None.', 60)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How do camphor and menthol provide relief from itching?', '["They numb the skin","They stimulate ''cool'' receptors (TRPM8), providing a distracting sensation that suppresses the ''itch'' signal","They kill bacteria","None"]', 1, 'The ''cool'' sensation travels via faster nerve fibers, overriding the slower ''itch'' fibers.'),
        (v_case_id, 'Why should Camphor-containing products be used with extreme caution in young children?', '["They cause rashes","Risk of severe systemic toxicity (seizures, CNS depression) if ingested or absorbed in large amounts","They smell bad","None"]', 1, 'Camphor toxicity is a pediatric emergency.'),
        (v_case_id, 'What is the ''anti-pruritic'' effect of topical Pramoxine?', '["Steroid-like","Local anesthetic (blocks sodium channels)","Antifungal","None"]', 1, 'Pramoxine is a common ingredient in anti-itch lotions like Sarna.');

    ---------------------------------------------------------------------------
    -- CASE 61: The ''Target'' and the ''Biopsy'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Reasoning)', 'A patient with a suspected drug rash is getting a skin biopsy.

Vitals: Normal.
Physical Examination: Rash.
Laboratory Results: None.', 61)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'A ''Shave'' biopsy is generally inappropriate for which suspected condition?', '["Acne","Pigmented lesions suspected of being Melanoma (where depth is key)","Warts","Seborrheic keratosis"]', 1, 'Full-depth information is required for melanoma staging.'),
        (v_case_id, 'What is the ''Best'' location to biopsy an active, expanding skin infection or inflammatory plaque?', '["The center (which may be necrotic or clear)","The active, advancing edge","The normal skin nearby","None"]', 1, 'The edge contains the most active pathologic process.'),
        (v_case_id, 'For Direct Immunofluorescence (DIF) in blistering diseases, where should the biopsy be taken?', '["Directly from a blister","From perilesional (normal-appearing) skin adjacent to a blister","The bottom of the foot","None"]', 1, 'Blistering involves destruction of the proteins being tested; perilesional skin preserves the immunoreactants.');

    ---------------------------------------------------------------------------
    -- CASE 62: The ''Psoriasis'' and the ''Coal Tar''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Coal Tar''', 'A patient is using an ''old-fashioned'' coal tar preparation for his scalp psoriasis.

Vitals: Normal.
Physical Examination: Scaly scalp.
Laboratory Results: None.', 62)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary drawback of coal tar therapy for most patients?', '["It is dangerous","It is messy, has a strong odor, and can stain clothing/hair","It is a pill","None"]', 1, 'Patient compliance is often low due to cosmetic factors.'),
        (v_case_id, 'What is a recognized side effect of tar application on sun-exposed skin?', '["Photosensitivity (and potential tar-UV carcinogenesis in the ''Goeckerman regimen'')","Numbness","Fungus","None"]', 0, 'Tar is a photosensitizer.'),
        (v_case_id, 'What is the ''Goeckerman Regimen''?', '["A diet","The combination of topical crude coal tar and UV light for severe psoriasis","A type of surgery","None"]', 1, 'It is one of the most effective historical treatments for severe psoriasis.');

    ---------------------------------------------------------------------------
    -- CASE 63: The ''Itch'' and the ''Selenium''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Selenium''', 'A patient with tinea versicolor is using 2.5% Selenium Sulfide lotion.

Vitals: Normal.
Physical Examination: White spots.
Laboratory Results: None.', 63)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary action of Selenium Sulfide?', '["Antibiotic","Cytostatic (decreases epidermal turnover) and antifungal (against Malassezia)","Steroid","None"]', 1, 'It is used for both seborrheic dermatitis and tinea versicolor.'),
        (v_case_id, 'What should you warn the patient about regarding jewelry when using Selenium Sulfide?', '["It will break the jewelry","It can tarnish silver jewelry","It turns gold to lead","None"]', 1, 'A common ''real-world'' counseling point.'),
        (v_case_id, 'Can it be used on the scalp for dandruff?', '["No","Yes, it is a common ingredient in OTC and prescription dandruff shampoos","Only if the patient is bald","None"]', 1, 'It is highly effective for seborrheic dermatitis of the scalp.');

    ---------------------------------------------------------------------------
    -- CASE 64: The ''Acne'' and the ''Clindamycin''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Clindamycin''', 'A patient is using a topical clindamycin/benzoyl peroxide gel.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: None.', 64)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why should topical antibiotics for acne NOT be used as monotherapy?', '["They don''t work","High risk of developing bacterial resistance (especially C. acnes)","They are too strong","None"]', 1, 'Monotherapy is a major driver of antibiotic resistance in the community.'),
        (v_case_id, 'What is the most common agent added to topical antibiotics to prevent resistance?', '["Retinoids","Benzoyl Peroxide","Steroids","None"]', 1, 'BP is bactericidal and kills resistant organisms.'),
        (v_case_id, 'Which systemic ''GI'' side effect is extremely rare but theoretically possible with topical Clindamycin absorption?', '["Constipation","Pseudomembranous colitis (C. difficile infection)","Acid reflux","None"]', 1, 'While very rare with topicals, the warning remains due to its systemic profile.');

    ---------------------------------------------------------------------------
    -- CASE 65: The ''Psoriasis'' and the ''Anthralin''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Anthralin''', 'A patient is using Anthralin for a thick plaque of psoriasis.

Vitals: Normal.
Physical Examination: Plaque.
Laboratory Results: None.', 65)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a major counseling point for Anthralin application?', '["Apply and leave on all day","Short-contact therapy (apply for 10-30 minutes and wash off) to avoid severe irritation of surrounding normal skin","It smells like flowers","None"]', 1, 'Anthralin is very irritating to non-lesional skin.'),
        (v_case_id, 'What is the ''staining'' profile of Anthralin?', '["Doesn''t stain","Can cause purple-brown staining of skin, nails, and clothing","Turns skin blue","None"]', 1, 'The staining is a major deterrent for many patients.'),
        (v_case_id, 'Anthralin is a synthetic derivative of what natural substance?', '["Coal","Chrysarobin (from the Araroba tree)","Honey","None"]', 1, 'It has been used for over a century for psoriasis.');

    ---------------------------------------------------------------------------
    -- CASE 66: The ''Itch'' and the ''Lindane'' Trap
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Lindane'' Trap', 'A student asks about using Lindane for head lice.

Vitals: Normal.
Physical Examination: Nits in the hair.
Laboratory Results: None.', 66)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is Lindane now considered a ''Last-Resort'' treatment for lice and scabies?', '["It is too expensive","Significant risk of neurotoxicity (seizures) especially in children, the elderly, and those < 50kg","It doesn''t work","None"]', 1, 'It has been banned in many regions (e.g., California) due to environmental and safety concerns.'),
        (v_case_id, 'Lindane is contraindicated in patients with which underlying condition?', '["Diabetes","Seizure disorders","Asthma","None"]', 1, 'It directly lowers the seizure threshold.'),
        (v_case_id, 'What is the preferred first-line treatment for head lice?', '["Lindane","Permethrin 1% or Pyrethrins","Vinegar only","None"]', 1, 'Less toxic alternatives are always preferred first.');

    ---------------------------------------------------------------------------
    -- CASE 67: The ''Target'' and the ''Steroid'' Taper (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Steroid'' Taper (Reasoning)', 'A patient on 60mg of Prednisone for 4 weeks for a severe drug rash is being tapered off.

Vitals: Normal.
Physical Examination: Rash is gone.
Laboratory Results: None.', 67)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'At what point in steroid therapy is the HPA axis considered ''suppressed'', requiring a taper?', '["After 1 dose","Usually after 2-3 weeks of continuous systemic therapy","After 1 year","None"]', 1, 'Brief courses ( < 10-14 days) can often be stopped without a taper.'),
        (v_case_id, 'What is the primary risk of stopping long-term steroids ''Cold Turkey''?', '["The rash comes back","Acute Adrenal Crisis (hypotension, shock, death)","Weight gain","None"]', 1, 'The body cannot immediately resume endogenous cortisol production.'),
        (v_case_id, 'What is a ''Stress Dose'' of steroids?', '["A very small dose","An increased dose given to patients with HPA suppression during times of physical stress (e.g., surgery, severe infection)","A dose given for anxiety","None"]', 1, 'The suppressed axis cannot respond to the increased demand of stress.');

    ---------------------------------------------------------------------------
    -- CASE 68: The ''Acne'' and the ''Spironolactone''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Spironolactone''', 'A 25-year-old woman with ''hormonal'' acne (worsening before her period, located on the jawline) is starting Spironolactone.

Vitals: Normal.
Physical Examination: Inflammatory papules on the chin and jawline.
Laboratory Results: None.', 68)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of Spironolactone in acne?', '["Antibiotic","Anti-androgen (blocks the androgen receptor and inhibits 5-alpha reductase)","Steroid","None"]', 1, 'It reduces the androgenic stimulation of sebaceous glands.'),
        (v_case_id, 'Which electrolyte must be monitored in older patients or those on other similar medications?', '["Sodium","Potassium (risk of Hyperkalemia)","Calcium","None"]', 1, 'Spironolactone is a potassium-sparing diuretic.'),
        (v_case_id, 'What is a common side effect of Spironolactone in women?', '["Hair loss","Menstrual irregularities and breast tenderness","Weight gain","None"]', 1, 'These are related to its hormonal effects.');

    ---------------------------------------------------------------------------
    -- CASE 69: The ''Psoriasis'' and the ''Cyclosporine'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Cyclosporine'' (Reasoning)', 'A patient on Cyclosporine for severe psoriasis is asking about getting a flu vaccine.

Vitals: Normal.
Physical Examination: Plaques.
Laboratory Results: None.', 69)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which type of vaccine is generally CONTRAINDICATED in patients on potent immunosuppression (e.g., Cyclosporine, Methotrexate, Biologics)?', '["Inactivated vaccines (e.g., standard flu shot)","Live-attenuated vaccines (e.g., MMR, Varicella, Yellow Fever)","mRNA vaccines","None"]', 1, 'The immune system may not be able to contain the live virus, leading to disseminated infection.'),
        (v_case_id, 'Is the ''Inactivated'' (injected) flu shot safe for these patients?', '["No","Yes, but it may be less effective (lower antibody response)","Only if they are young","None"]', 1, 'Inactivated vaccines are safe but efficacy may be reduced.'),
        (v_case_id, 'How long should a patient wait after stopping a biologic before receiving a live vaccine?', '["1 day","Usually 4-12 weeks depending on the drug half-life","1 year","None"]', 1, 'Waiting allows for ''washout'' and immune recovery.');

    ---------------------------------------------------------------------------
    -- CASE 70: The ''Itch'' and the ''Emollient'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Emollient'' (Reasoning)', 'A parent asks about the best type of moisturizer for their child with severe eczema.

Vitals: Normal.
Physical Examination: Eczema.
Laboratory Results: None.', 70)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'In terms of ''water-trapping'' efficacy, which is superior for severe dry skin?', '["Lotion","Ointment (e.g., Petroleum jelly/Vaseline)","Cream","None"]', 1, 'Ointments are occlusive and prevent the most transepidermal water loss.'),
        (v_case_id, 'Why do many children ''hate'' ointments despite their efficacy?', '["They smell bad","They are greasy and sticky","They sting","None"]', 1, 'Greasiness is the major barrier to compliance with ointment therapy.'),
        (v_case_id, 'What is the best time to apply a moisturizer for maximal effect?', '["Right before bed","Immediately after bathing (within 3 minutes) to ''lock in'' the moisture","Whenever it feels dry","None"]', 1, 'This is a key ''Step'' counseling point for atopic dermatitis management.');

    ---------------------------------------------------------------------------
    -- CASE 71: The ''Target'' and the ''Imiquimod'' (Follow-up)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imiquimod'' (Follow-up)', 'A patient using Imiquimod for actinic keratoses on his scalp develops a fever and muscle aches.

Vitals: T 38.2 C.
Physical Examination: Inflammation at the application site.
Laboratory Results: None.', 71)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of the fever in this patient?', '["Infection of the scalp","Systemic absorption and cytokine release (IFN-alpha)","Allergy","None"]', 1, 'Flu-like symptoms are a recognized systemic side effect of topical imiquimod.'),
        (v_case_id, 'What is the best management?', '["IV Antibiotics","Reduce the frequency of application or take a ''drug holiday'' for 1-2 weeks","Give a flu shot","None"]', 1, 'Dosing adjustments usually resolve the systemic symptoms.'),
        (v_case_id, 'Is this reaction more common with large-area application?', '["Yes","No","Only in women","None"]', 0, 'Increased surface area leads to increased absorption.');

    ---------------------------------------------------------------------------
    -- CASE 72: The ''Itch'' and the ''Capsaicin''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Capsaicin''', 'A patient with post-herpetic neuralgia uses a cream containing capsaicin.

Vitals: Normal.
Physical Examination: Healed zoster scars.
Laboratory Results: None.', 72)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Capsaicin is the ''active'' component of which plant?', '["Poppy","Chili peppers","Garlic","None"]', 1, 'It is the substance that makes peppers ''hot''.'),
        (v_case_id, 'What is the mechanism of action for pain relief?', '["It numbs the skin","Depletion of Substance P from local sensory nerve endings after initial stimulation","Blocks sodium channels","None"]', 1, 'After the initial ''burn'', the nerves are temporarily unable to transmit pain.'),
        (v_case_id, 'What is the major side effect?', '["Drowsiness","Intense burning and stinging at the site of application","Numbness","None"]', 1, 'Patients must be warned that it ''gets worse before it gets better''.');

    ---------------------------------------------------------------------------
    -- CASE 73: The ''Acne'' and the ''Laser''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Laser''', 'A patient wants to know if they can get a laser treatment for their acne scars while taking Isotretinoin.

Vitals: Normal.
Physical Examination: Scars.
Laboratory Results: None.', 73)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Historically, how long was it recommended to wait AFTER finishing Isotretinoin before undergoing elective procedures like dermabrasion or laser resurfacing?', '["1 day","6-12 months (due to concern for impaired wound healing and keloid formation)","1 week","None"]', 1, 'While newer evidence suggests some procedures are safe, 6-12 months remains the traditional ''safe'' window in many guidelines.'),
        (v_case_id, 'Why is wound healing a concern with Isotretinoin?', '["It causes infection","It affects the skin''s ability to produce collagen and repair itself correctly","It makes the blood thin","None"]', 1, 'Retinoids significantly alter keratinocyte and fibroblast function.'),
        (v_case_id, 'Is hair removal (waxing) safe on Isotretinoin?', '["Yes","No, it can lead to ''skin lifting'' or tearing because the skin is so fragile","Only if the hair is long","None"]', 1, 'Waxing is strictly avoided during isotretinoin therapy.');

    ---------------------------------------------------------------------------
    -- CASE 74: The ''Pemphigus'' and the ''Azathioprine'' (Follow-up)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Azathioprine'' (Follow-up)', 'A patient on Azathioprine develops a viral upper respiratory infection.

Vitals: Normal.
Physical Examination: Congestion.
Laboratory Results: WBC 2.5 (Low).', 74)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the next step in management for a patient on Azathioprine with a WBC count < 3.0?', '["Keep the dose the same","Hold the medication and monitor blood counts until they recover","Give more Azathioprine","None"]', 1, 'Significant leukopenia is a reason to hold therapy to prevent opportunistic infection.'),
        (v_case_id, 'Should the dose be adjusted if it is restarted?', '["No","Yes, usually restarted at a lower dose after blood count recovery","Only in children","None"]', 1, 'Dose reduction helps prevent recurrence of toxicity.'),
        (v_case_id, 'What is a long-term risk of chronic immunosuppression with Azathioprine?', '["Skin cancer and Lymphoma","Diabetes","Heart disease","None"]', 0, 'Chronic B-cell and T-cell suppression carries a slight increase in malignancy risk.');

    ---------------------------------------------------------------------------
    -- CASE 75: The ''Itch'' and the ''Pimecrolimus''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Pimecrolimus''', 'A 2-year-old child with mild facial eczema is starting Pimecrolimus (Elidel) cream.

Vitals: Normal.
Physical Examination: Eczema.
Laboratory Results: None.', 75)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which topical calcineurin inhibitor is generally considered ''less potent'' and preferred for mild disease?', '["Tacrolimus (Protopic)","Pimecrolimus (Elidel)","They are the same","None"]', 1, 'Pimecrolimus is the ''milder'' of the two TCIs.'),
        (v_case_id, 'What is the ''Black Box Warning'' for both topical calcineurin inhibitors?', '["Kidney failure","Potential (though controversial) risk of malignancy based on high-dose animal studies","Heart attack","None"]', 1, 'The long-term safety regarding skin cancer and lymphoma remains a point of counseling.'),
        (v_case_id, 'Are TCIs effective for ''Acute, weeping'' flares of eczema?', '["Yes","No, they are better for maintenance and ''subacute'' disease; acute flares often require steroids","Only in the sun","None"]', 1, 'Steroids are still faster for acute ''hot'' inflammation.');

    ---------------------------------------------------------------------------
    -- CASE 76: The ''Psoriasis'' and the ''Taper'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Taper'' (Reasoning)', 'A patient with psoriasis and a severe ear infection is given a ''Medrol Dosepak'' (6-day steroid taper).

Vitals: Normal.
Physical Examination: Ear swelling.
Laboratory Results: None.', 76)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Is a short 6-day steroid taper (like a Dosepak) ''safe'' for a patient with extensive plaque psoriasis?', '["Yes, it''s too short to cause problems","No, even short courses can trigger severe rebound psoriasis flares","Only if they take it with milk","None"]', 1, 'Any dose of systemic steroid carries a risk in psoriasis patients.'),
        (v_case_id, 'What is the ''Best'' way to treat an ear infection in a psoriasis patient to avoid this risk?', '["Systemic steroids","Topical antibiotic/steroid drops (which have minimal systemic absorption)","Observation only","None"]', 1, 'Localized therapy is always preferred.'),
        (v_case_id, 'If the patient MUST have systemic steroids for a life-threatening reason (e.g., severe asthma), what should the dermatologist do?', '["Nothing","Monitor closely and prepare to start rapid-acting psoriasis meds (like Cyclosporine) if a flare occurs during the taper","Stop the steroid mid-way","None"]', 1, 'Management of the whole patient requires risk-benefit balancing.');

    ---------------------------------------------------------------------------
    -- CASE 77: The ''Acne'' and the ''Water'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Water'' (Reasoning)', 'A patient is taking Doxycycline for acne. He is confused about why he was told to ''stay upright'' after taking the pill.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: None.', 77)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which specific drug property of Tetracyclines causes esophagitis?', '["They are too large","They are highly acidic when they dissolve, causing direct mucosal injury if they ''get stuck'' in the esophagus","They are bitter","None"]', 1, 'The chemical acidity is the problem.'),
        (v_case_id, 'What is the ''30-minute'' rule for taking these medications?', '["Wait 30 minutes to eat","Do not lie down for at least 30 minutes after taking the pill","Take the pill for 30 minutes","None"]', 1, 'This ensures the pill passes safely into the stomach.'),
        (v_case_id, 'What is the characteristic symptom of pill-induced esophagitis?', '["Cough","Sudden-onset retrosternal chest pain and painful swallowing (odynophagia)","Nausea","None"]', 1, 'This is a classic Step 2 CK clinical presentation.');

    ---------------------------------------------------------------------------
    -- CASE 78: The ''Itch'' and the ''Pramoxine''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Pramoxine''', 'A patient uses a lotion containing 1% Pramoxine for itching.

Vitals: Normal.
Physical Examination: Itchy skin.
Laboratory Results: None.', 78)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does Pramoxine differ from Lidocaine or Benzocaine?', '["It''s a steroid","It is a different class of local anesthetic (ether) that has a lower risk of cross-reactivity and sensitization","It''s an antifungal","None"]', 1, 'Pramoxine is very well-tolerated and commonly used in OTC anti-itch products.'),
        (v_case_id, 'Is Pramoxine effective for ''Deep'' nerve pain (like sciatica)?', '["Yes","No, it is only effective for superficial skin itching and minor pain","Only in large doses","None"]', 1, 'It is a surface-acting anesthetic.'),
        (v_case_id, 'What is the common brand name for a lotion containing Pramoxine?', '["Sarna (Sensitive formulation)","Benadryl","Vaseline","None"]', 0, 'It is a common high-yield ingredient in anti-pruritic lotions.');

    ---------------------------------------------------------------------------
    -- CASE 79: The ''Pemphigus'' and the ''Steroid'' Side Effects (Review)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Steroid'' Side Effects (Review)', 'A patient on Prednisone for 1 year.

Vitals: Normal.
Physical Examination: Weight gain, facial hair, and easy bruising.
Laboratory Results: None.', 79)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which of the following is NOT a classic side effect of long-term systemic corticosteroids?', '["Cataracts","Hypotension","Hyperglycemia","Myopathy (muscle weakness)"]', 1, 'Steroids actually cause hypertension; hypotension is a sign of adrenal insufficiency (withdrawal).'),
        (v_case_id, 'Which type of ''Eye'' problem is uniquely associated with even low-dose steroids (including topical/inhaled)?', '["Glaucoma and Posterior Subcapsular Cataracts","Retinal detachment","Dry eye","None"]', 0, 'Periodic ophthalmologic monitoring is needed for long-term users.'),
        (v_case_id, 'What happens to ''Wound Healing'' in a patient on steroids?', '["It speeds up","It is significantly delayed and the risk of infection is increased","No change","None"]', 1, 'Steroids inhibit the inflammatory and proliferative phases of healing.');

    ---------------------------------------------------------------------------
    -- CASE 80: The ''Acne'' and the ''Azelaic Acid''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Azelaic Acid''', 'A pregnant woman with acne is asking for a safe treatment option.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: None.', 80)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the pregnancy category of Azelaic Acid?', '["Category A","Category B (Considered very safe for both acne and rosacea during pregnancy)","Category X","None"]', 1, 'It is a first-line choice for pregnant patients.'),
        (v_case_id, 'Besides acne, Azelaic acid is also effective for which pigmentary condition?', '["Vitiligo","Post-inflammatory hyperpigmentation (PIH) and Melasma","Albinism","None"]', 1, 'It has mild skin-lightening properties.'),
        (v_case_id, 'What is its mechanism of action?', '["Kills bacteria","Antimicrobial, comedolytic, and inhibits tyrosinase","Acid only","None"]', 1, 'It is a multi-functional agent.');

    RAISE NOTICE 'Finished populating 80 cases for case-pharmacotherapy.';
END $$;

COMMIT;
-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Clinical Case Integration (Step 2 CK)
-- Topic: Surgical vs medical decision making
-- Topic Slug: case-surgical-medical
-- Sourced: UWorld, Step-Up to Medicine, MTB Step 2, First Aid Step 2 CK

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-surgical-medical' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'case-surgical-medical';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 80-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: The Abscess Dilemma
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Abscess Dilemma', 'A 30-year-old male presents with a painful, red lump on his buttock for 3 days.

Vitals: Normal.
Physical Examination: A 3-cm erythematous, warm, fluctuant nodule. There is no surrounding cellulitis.
Laboratory Results: None.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial Management'' for a simple, fluctuant cutaneous abscess?', '["Oral Antibiotics only","Incision and Drainage (I&D) only","Topical Steroids","Needle aspiration"]', 1, 'For a simple abscess, I&D is the definitive treatment and often does not require antibiotics.'),
        (v_case_id, 'In which of the following scenarios should systemic antibiotics be ADDED to I&D?', '["Severe or extensive disease","Systemic signs of infection (fever, tachycardia)","Associated cellulitis","All of the above"]', 3, 'Antibiotics are reserved for complicated cases or those with systemic involvement.'),
        (v_case_id, 'Is a ''culture'' of the pus usually required for a simple abscess in a healthy patient?', '["Yes, always","No, it is usually unnecessary for simple abscesses as the results rarely change management","Only in the elderly","None"]', 1, 'Empiric management after drainage is standard for low-risk patients.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Face ''Pimple'' and the Mohs
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Face ''Pimple'' and the Mohs', 'A 65-year-old male has a biopsy-proven Basal Cell Carcinoma on the tip of his nose.

Vitals: Normal.
Physical Examination: 8-mm pearly papule on the nasal tip.
Laboratory Results: Biopsy shows nodular BCC.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is Mohs Micrographic Surgery preferred over standard Wide Local Excision (WLE) for this patient?', '["It is cheaper","It provides the highest cure rate while maximizing tissue sparing in a cosmetically sensitive area (H-zone)","It doesn''t require anesthesia","None"]', 1, 'Mohs is the gold standard for ''high-risk'' locations like the nose, ears, and eyes.'),
        (v_case_id, 'What is the primary difference in how ''margins'' are checked in Mohs vs. standard excision?', '["In Mohs, 100% of the surgical margin is examined intraoperatively; standard excision uses ''bread-loafing'' which only checks ~1%","There is no difference","Standard excision is more accurate","None"]', 0, 'The horizontal sectioning in Mohs ensures no tumor ''roots'' are missed.'),
        (v_case_id, 'If the tumor were on the back and was < 1cm, what would be an appropriate alternative?', '["Mohs","Standard excision with 4mm margins or Electrodesiccation and Curettage (ED&C)","Chemotherapy","None"]', 1, 'Low-risk sites can be managed with simpler surgical techniques.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Melanoma Depth
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Melanoma Depth', 'A biopsy of a dark mole on the leg shows Malignant Melanoma with a Breslow depth of 0.5 mm. There is no ulceration and no lymphadenopathy.

Vitals: Normal.
Physical Examination: No palpable nodes.
Laboratory Results: Biopsy: 0.5 mm depth, Stage IA.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the required margin for Wide Local Excision (WLE) of a melanoma < 1 mm thick (T1)?', '["0.5 cm","1 cm","2 cm","5 cm"]', 1, 'Standard WLE margin for T1 melanoma is 1 cm.'),
        (v_case_id, 'Is Sentinel Lymph Node Biopsy (SLNB) indicated for this patient (0.5 mm, no ulceration)?', '["Yes","No, it is generally not indicated for depth < 0.8 mm without other high-risk features","Only if the patient is young","None"]', 1, 'SLNB is usually reserved for T1b (ulceration or >0.8mm) or higher.'),
        (v_case_id, 'What is the most important prognostic factor for this patient?', '["Width of the lesion","Breslow thickness","The number of colors","None"]', 1, 'Depth of invasion remains the primary survival predictor.');

    ---------------------------------------------------------------------------
    -- CASE 04: The ''Boils'' that Won''''t Quit
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Boils'' that Won''''t Quit', 'A 28-year-old female with Hurley Stage II Hidradenitis Suppurativa (recurrent abscesses and a few sinus tracts in the axilla) has failed oral antibiotics.

Vitals: Normal.
Physical Examination: Chronic inflammatory nodules and one interconnected sinus tract in the left axilla.
Laboratory Results: None.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'For an acutely painful, fluctuant HS abscess, what is the ''surgical'' procedure of choice for IMMEDIATE relief?', '["Wide radical excision","Incision and Drainage (I&D)","Deroofing of the sinus tract","None"]', 1, 'I&D provides fast symptomatic relief but has a high recurrence rate in HS.'),
        (v_case_id, 'Which surgical technique is preferred for chronic, recurrent HS sinus tracts to minimize recurrence?', '["Simple I&D","Deroofing (unroofing) of the tract or local excision","Liposuction","None"]', 1, 'Deroofing preserves more tissue while removing the epithelialized tract.'),
        (v_case_id, 'When should ''Radical Wide Excision'' be considered?', '["For a single pimple","For severe, diffuse Hurley Stage III disease where medical and limited surgical therapies have failed","Never","Only in children"]', 1, 'Radical excision is a ''last-resort'' surgery for extensive disease.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Leg Ulcer Choice
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Leg Ulcer Choice', 'A 70-year-old male with chronic venous insufficiency presents with a large, shallow ulcer on his medial malleolus.

Vitals: Normal.
Physical Examination: Pitting edema, stasis dermatitis, and a shallow ulcer with irregular borders and ''brawny'' pigmentation.
Laboratory Results: ABI (Ankle-Brachial Index) is 1.0 (Normal).', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Gold Standard'' for the medical management of venous ulcers?', '["Bed rest only","Compression therapy (e.g., bandages, stockings)","Topical antibiotics","Surgical debridement alone"]', 1, 'Compression reverses the underlying venous hypertension.'),
        (v_case_id, 'When should ''Surgical'' intervention (e.g., endovenous ablation of the saphenous vein) be considered?', '["Immediately for all patients","For ulcers that fail to heal with 3-6 months of adequate compression therapy, or to prevent recurrence","Never","Only if the ulcer is infected"]', 1, 'Surgical correction of the underlying reflux is a key ''Step 2'' management point for refractory cases.'),
        (v_case_id, 'What must be ruled out (via ABI) BEFORE applying strong compression?', '["Venous reflux","Peripheral Arterial Disease (PAD)","Diabetes","None"]', 1, 'Compressing a limb with poor arterial supply can lead to necrosis.');

    ---------------------------------------------------------------------------
    -- CASE 06: The Rapid Growth Volcano
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapid Growth Volcano', 'A 60-year-old male has a 2-cm dome-shaped red nodule on his hand that grew over 4 weeks.

Vitals: Normal.
Physical Examination: A firm nodule with a central ''keratin plug''.
Laboratory Results: None.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the standard surgical approach for a suspected Keratoacanthoma?', '["Observation (it might go away)","Excisional biopsy with margins similar to Squamous Cell Carcinoma (SCC)","Shave biopsy only","None"]', 1, 'Since KAs are difficult to distinguish from invasive SCC, they are treated as SCCs.'),
        (v_case_id, 'Why is ''Watchful Waiting'' generally avoided despite the potential for spontaneous regression?', '["It takes too long","The risk of misdiagnosing an invasive SCC and allowing it to metastasize","Insurance reasons","None"]', 1, 'Clinical and histologic overlap with SCC makes observation dangerous.'),
        (v_case_id, 'What is the ''Most Likely'' diagnosis for this rapid-growth nodule?', '["BCC","Keratoacanthoma (often considered a variant of SCC)","Molluscum","Wart"]', 1, 'The ''volcano'' appearance is classic for KA.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Neck Lump and the ''Pore''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Neck Lump and the ''Pore''', 'A 30-year-old male presents with a firm lump on his neck that sometimes expresses ''cheesy, smelly'' material.

Vitals: Normal.
Physical Examination: A 2-cm subcutaneous nodule with a central ''punctum'' (opening).
Laboratory Results: None.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'If the cyst is acutely inflamed, red, and painful, what is the best initial step?', '["Immediate surgical excision of the whole cyst","Incision and Drainage (I&D) or intralesional steroid injection","Oral antibiotics only","None"]', 1, 'Inflamed cysts are difficult to excise cleanly; calming the inflammation first is preferred.'),
        (v_case_id, 'What is REQUIRED for definitive, permanent removal of the cyst?', '["I&D alone","Complete excision of the cyst wall (capsule)","Oral antibiotics","None"]', 1, 'If the wall remains, the cyst will likely recur.'),
        (v_case_id, 'The ''cheesy'' material inside the cyst is composed of what?', '["Pus (bacteria)","Macerated Keratin","Sebum","None"]', 1, 'Epidermoid cysts are lined with stratified squamous epithelium and fill with keratin.');

    ---------------------------------------------------------------------------
    -- CASE 08: The ''Red Flag'' Leg Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Red Flag'' Leg Pain', 'A patient with a ''skin infection'' on the leg has pain that is ''out of proportion'' to the redness. He is now febrile and tachycardic.

Vitals: T 39.8 C, BP 90/60.
Physical Examination: Dusky erythema, crepitus, and extreme tenderness extending beyond the visible redness.
Laboratory Results: WBC 35,000.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the single most important intervention for this patient?', '["IV Antibiotics","Emergent surgical debridement and exploration","Hyperbaric oxygen","Wait for MRI"]', 1, 'Surgery is the only way to stop the spread of necrotizing fasciitis; antibiotics alone are insufficient.'),
        (v_case_id, 'How does the surgeon determine the extent of debridement?', '["Based on the surface redness","By exploring the fascia until healthy, bleeding tissue is reached (''Finger sweep'' test)","Based on the CT scan only","None"]', 1, 'Intraoperative exploration is the gold standard for assessing depth and spread.'),
        (v_case_id, 'What is a characteristic intraoperative finding?', '["Pus-filled pockets","''Dishwater'' fluid and lack of bleeding/resistance of the fascia","Normal tissue","None"]', 1, 'The ''dishwater'' discharge is a hallmark of tissue liquefaction.');

    ---------------------------------------------------------------------------
    -- CASE 09: The Bleeding Bump
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Bleeding Bump', 'A 20-year-old male has a red bump on his lip that bleeds every time he eats.

Vitals: Normal.
Physical Examination: A 5-mm friable, red papule with a collarette of scale.
Laboratory Results: None.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most effective surgical treatment for a pyogenic granuloma?', '["Observation","Shave excision followed by curettage and electrocautery of the base","Topical antibiotics","Cryotherapy"]', 1, 'Deep cautery of the base is needed to prevent high rates of recurrence.'),
        (v_case_id, 'Why is ''Shave'' preferred over ''Punch'' or ''Excision'' for this specific lesion?', '["It''s faster and provides a specimen for pathology to rule out amelanotic melanoma","It doesn''t require numbing","It''s cheaper","None"]', 0, 'Shave allows for quick removal and essential histologic confirmation.'),
        (v_case_id, 'Is this lesion likely to resolve on its own?', '["Yes, after 1 week","No, they usually persist and continue to bleed until treated","Only in children","None"]', 1, 'The chronic bleeding makes active management necessary.');

    ---------------------------------------------------------------------------
    -- CASE 10: The Ear Earlobe Piercing Keloid
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Ear Earlobe Piercing Keloid', 'A 16-year-old female presents with a large keloid on her earlobe 1 year after a piercing.

Vitals: Normal.
Physical Examination: A 2.5-cm firm, rubbery mass extending from the earlobe.
Laboratory Results: None.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the risk of performing ''Simple Surgical Excision'' for a keloid?', '["None","High rate of recurrence (often returning larger than the original)","It heals perfectly","None"]', 1, 'Keloids are notorious for recurring after trauma (including surgery).'),
        (v_case_id, 'What is the preferred management algorithm for this patient?', '["Surgery only","Intralesional steroid injections (first-line) or Surgery combined with adjuvant therapy (steroids, pressure, or radiation)","Topical antibiotics","None"]', 1, 'Combined therapy is required to minimize the risk of a larger recurrence.'),
        (v_case_id, 'Which specific adjuvant therapy is often used on the earlobe specifically?', '["Radiation","Pressure earrings","Chemotherapy","None"]', 1, 'Compression is a recognized tool to prevent keloid regrowth.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Scalp Tumor and the Mohs
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scalp Tumor and the Mohs', 'An 80-year-old male with a 2-cm Squamous Cell Carcinoma (SCC) on his scalp. The skin is tight.

Vitals: Normal.
Physical Examination: Indurated plaque on the vertex scalp.
Laboratory Results: Biopsy shows SCC.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is Mohs surgery indicated for a 2-cm SCC on the scalp?', '["Large size (>2cm) and high-risk location","It''s the only option","It prevents hair loss","None"]', 0, 'Size > 2cm on the scalp is an NCCN criterion for high-risk SCC, making Mohs appropriate.'),
        (v_case_id, 'If the SCC is found to be invading the bone, what is the next step?', '["Continue Mohs","Refer to Surgical Oncology/ENT for multidisciplinary management (e.g., partial calvariectomy)","Topical 5-FU","None"]', 1, 'Bone invasion exceeds the limits of standard outpatient Mohs.'),
        (v_case_id, 'What is the primary benefit of Mohs in ''tight'' skin areas like the scalp?', '["It makes the skin loose","Maximum tissue conservation to allow for easier closure or grafting","No stitches are needed","None"]', 1, 'Sparing every millimeter is critical when there is little redundant skin for repair.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Infantile Hemangioma
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Infantile Hemangioma', 'A 2-month-old infant has a rapidly growing ''strawberry'' mark on the eyelid that is starting to obstruct vision.

Vitals: Normal.
Physical Examination: A bright red, raised plaque on the upper eyelid.
Laboratory Results: None.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''First-Line'' treatment for a vision-threatening infantile hemangioma?', '["Surgical excision","Oral Propranolol","Laser therapy","Wait for spontaneous regression"]', 1, 'Beta-blockers (Propranolol) are the gold standard for shrinking high-risk hemangiomas.'),
        (v_case_id, 'When should surgery be considered for a hemangioma?', '["Day 1 for all lesions","Residual skin changes (fibrofatty tissue) after the involution phase (usually age 4-10) or if medical therapy fails","Never","Only if it is blue"]', 1, 'Early surgery is rarely needed now that medical therapy is so effective.'),
        (v_case_id, 'What is the natural history of most infantile hemangiomas?', '["They grow forever","Rapid proliferation (first 6-9 months) followed by slow spontaneous involution (years)","They disappear overnight","None"]', 1, 'Most will eventually regress without treatment, but high-risk sites (eyes, airway) require intervention.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Burn and the Graft
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Burn and the Graft', 'A patient with a deep partial-thickness burn on the back of the hand. The wound has not healed after 3 weeks.

Vitals: Normal.
Physical Examination: Pale, non-blanching burn wound on the dorsal hand.
Laboratory Results: None.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the indication for skin grafting in a burn patient?', '["All first-degree burns","Full-thickness burns or deep partial-thickness burns that fail to heal within 2-3 weeks","Only for cosmetic reasons","None"]', 1, 'Failure to re-epithelialize within 3 weeks significantly increases the risk of hypertrophic scarring.'),
        (v_case_id, 'What is the primary benefit of ''Early Excision and Grafting''?', '["Less pain","Reduced infection risk, shorter hospital stay, and better functional outcomes","Cheaper","None"]', 1, 'Removing necrotic tissue (eschar) and providing a permanent cover is the pillar of modern burn care.'),
        (v_case_id, 'What is the ''Donor Site''?', '["The area being grafted","The healthy skin area from which the graft is harvested","The hospital","None"]', 1, 'Donor site management is also a critical part of the surgical plan.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Venous Ulcer and the Ablation
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Venous Ulcer and the Ablation', 'A patient with a chronic venous ulcer that has recurred 3 times despite compression.

Vitals: Normal.
Physical Examination: Varicose veins, stasis changes, and a recurrent ulcer.
Laboratory Results: Duplex ultrasound shows severe reflux in the Great Saphenous Vein (GSV).', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best ''Surgical'' next step to prevent further ulcer recurrence?', '["Skin grafting the ulcer only","Endovenous Thermal Ablation (EVTA) of the refluxing saphenous vein","Amputation","None"]', 1, 'Fixing the ''source'' (the venous reflux) is more important than just treating the ''symptom'' (the ulcer).'),
        (v_case_id, 'How does ablation work?', '["It removes the vein","It uses heat (laser or radiofrequency) to seal the incompetent vein, diverting blood to healthy deep veins","It stretches the vein","None"]', 1, 'Modern minimally invasive techniques have largely replaced traditional vein stripping.'),
        (v_case_id, 'Should compression be continued after surgery?', '["No","Yes, it is often still necessary for long-term management of chronic venous insufficiency","Only for 1 day","None"]', 1, 'Surgery treats the reflux, but the overall venous health remains a priority.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Suspicious Subungual Line
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Suspicious Subungual Line', 'A 50-year-old female has a 4-mm dark, longitudinal brown band on her thumbnail that has widened over the last year.

Vitals: Normal.
Physical Examination: Pigmentation involves the proximal nail fold (Hutchinson sign).
Laboratory Results: None.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Next Step'' for a suspicious pigmented nail band?', '["Observation","Nail matrix biopsy (typically a punch or longitudinal excision)","Wait for the nail to grow out","Antifungal cream"]', 1, 'Biopsy of the nail matrix is required to rule out melanoma.'),
        (v_case_id, 'The Hutchinson sign in this context refers to what?', '["Nerve pain","Pigment extending onto the nail fold, highly suggestive of subungual melanoma","Nail pitting","None"]', 1, 'This is a classic ''Step'' clinical sign.'),
        (v_case_id, 'If the biopsy confirms invasive melanoma, what is the standard surgical treatment?', '["Nail removal only","Amputation (at the IP joint for a digit)","WLE of the skin only","None"]', 1, 'Wide margins often necessitate amputation of the distal phalanx.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Pressure Ulcer (Debridement)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pressure Ulcer (Debridement)', 'A bedbound patient has a Stage 4 pressure ulcer on the sacrum with thick, black, leathery tissue in the base.

Vitals: Normal.
Physical Examination: A deep ulcer with visible bone and a ''cap'' of black eschar.
Laboratory Results: None.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the first step in managing the ''Eschar'' (black tissue) in a pressure ulcer (assuming it is NOT on the heel)?', '["Keep it dry","Surgical (sharp) debridement of all necrotic tissue","Topical antibiotics","None"]', 1, 'Necrotic tissue must be removed to allow for granulation and to prevent infection.'),
        (v_case_id, 'Why is ''Stable Eschar'' on the heel sometimes left alone (NOT debrided)?', '["It heals faster","The heel has poor blood supply; the intact eschar acts as a natural biological cover as long as there is no infection","Heels don''t get infected","None"]', 1, 'This is a key exception in wound management protocols.'),
        (v_case_id, 'Is ''Wound Vac'' (Negative Pressure Wound Therapy) used before or after debridement?', '["Before","After (only once the wound bed is clean and free of necrotic tissue)","Instead of debridement","None"]', 1, 'The wound must be ''prepped'' surgically before advanced therapies can work.');

    ---------------------------------------------------------------------------
    -- CASE 17: The Lipoma and the Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Lipoma and the Pain', 'A 40-year-old male has several soft, rubbery lumps under the skin of his arms. One is becoming painful when touched.

Vitals: Normal.
Physical Examination: Multiple 2-4 cm soft, mobile subcutaneous nodules. One nodule on the forearm is tender.
Laboratory Results: None.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the management for an asymptomatic, classic lipoma?', '["Surgical excision","Observation and reassurance","Liposuction only","None"]', 1, 'Benign lipomas do not require removal unless symptomatic or for cosmetic reasons.'),
        (v_case_id, 'A PAINFUL lipoma is often histologically classified as what?', '["Malignant Liposarcoma","Angiolipoma","Fibroma","None"]', 1, 'Angiolipomas contain prominent small vessels and are characteristically tender.'),
        (v_case_id, 'When should a subcutaneous ''fatty'' mass prompt an urgent biopsy/excision?', '["If it is soft","If it is >10 cm, deep (subfascial), rapidly growing, or firm/fixed (risk of Liposarcoma)","If there are many of them","None"]', 1, 'Size and depth are key ''Red Flags'' for malignancy.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Seborrheic Keratosis and the Shave
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Seborrheic Keratosis and the Shave', 'An 80-year-old male has an itchy, ''stuck-on'' brown growth on his back.

Vitals: Normal.
Physical Examination: Classic seborrheic keratosis.
Laboratory Results: None.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial management for a bothersome but benign SK?', '["Wait for it to fall off","Cryotherapy (freezing) or Shave removal","Chemotherapy","None"]', 1, 'Simple destructive or surgical methods are curative.'),
        (v_case_id, 'Why might you choose ''Shave Removal'' over ''Cryotherapy''?', '["It''s faster","It provides a tissue specimen for pathology to confirm the diagnosis (especially if melanoma is in the differential)","It doesn''t hurt","None"]', 1, 'Confirmation is critical if the lesion has atypical features.'),
        (v_case_id, 'Does an SK need margins?', '["Yes, 5mm","No, it is a benign epidermal proliferation; removal of the visible lesion is sufficient","Only in the elderly","None"]', 1, 'SKs are purely superficial.');

    ---------------------------------------------------------------------------
    -- CASE 19: The ''Pearly'' Bump and the Curettage
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the Curettage', 'A 75-year-old male has a small (4mm) pearly papule on his shoulder. Biopsy shows superficial BCC.

Vitals: Normal.
Physical Examination: Small pearly papule on the back.
Laboratory Results: Superficial BCC.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is ''Electrodesiccation and Curettage'' (ED&C)?', '["A type of laser","A technique of scraping away soft tumor tissue and cauterizing the base","A freezing technique","None"]', 1, 'ED&C is effective for low-risk, superficial tumors in non-critical areas.'),
        (v_case_id, 'Why is ED&C NOT recommended for the face?', '["It doesn''t work there","It leaves a ''cigarette-burn'' scar and has higher recurrence rates on the face compared to Mohs/Excision","It causes nerve damage","None"]', 1, 'The cosmetic outcome is generally poor.'),
        (v_case_id, 'How does the surgeon know they have scraped deep enough during ED&C?', '["Based on time","The ''feel'' of the tissue (tumor is soft/mushy; healthy dermis is firm/gritty)","Based on the patient''s scream","None"]', 1, 'This is a ''blind'' procedure that relies on the tactile feedback of the curette.');

    ---------------------------------------------------------------------------
    -- CASE 20: The Warty Foot and the Surgery
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Warty Foot and the Surgery', 'A patient has a large, painful plantar wart on the heel.

Vitals: Normal.
Physical Examination: A thick, hyperkeratotic plaque with black dots.
Laboratory Results: None.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is ''Deep Surgical Excision'' generally AVOIDED for plantar warts?', '["Warts have roots","High risk of painful, permanent scarring on the weight-bearing sole, which can be more bothersome than the wart","The wart will always return","None"]', 1, 'Preserving the architectural integrity of the sole is the priority.'),
        (v_case_id, 'What is the preferred ''Destructive'' management for plantar warts?', '["Topical Salicylic acid or Cryotherapy","Oral antibiotics","IV steroids","None"]', 0, 'Non-scarring methods are first-line.'),
        (v_case_id, 'What are the ''Black Dots'' seen in a wart?', '["Dirt","Thrombosed capillaries","Mites","None"]', 1, 'Paring down the wart to see these dots helps confirm the diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 21: The Dog Bite and the Sutures
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Dog Bite and the Sutures', 'A child is brought in with a jagged laceration on the cheek from a dog bite that happened 2 hours ago.

Vitals: Normal.
Physical Examination: A 3-cm clean laceration on the face.
Laboratory Results: None.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Can a ''Face'' bite be primarily sutured (closed immediately)?', '["No, never","Yes, the excellent blood supply of the face allows for primary closure of clean, early bites with good cosmetic results","Only in adults","None"]', 1, 'The face is an exception to the ''don''t close bites'' rule.'),
        (v_case_id, 'How does this differ from a dog bite to the ''Hand''?', '["Hands are cleaner","Hand bites are generally left open (secondary intention) or loosely closed due to the high risk of infection in the small spaces","There is no difference","None"]', 1, 'Hand infections can be devastating for function.'),
        (v_case_id, 'Which antibiotic is first-line for prophylaxis in an animal bite?', '["Cephalexin","Amoxicillin-Clavulanate (Augmentin)","Doxycycline","None"]', 1, 'It covers Pasteurella and anaerobic organisms.');

    ---------------------------------------------------------------------------
    -- CASE 22: The ''Red'' Leg and the Doppler
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Red'' Leg and the Doppler', 'A patient with unilateral leg swelling and redness. Is it cellulitis or DVT?

Vitals: HR 110.
Physical Examination: Warm, red, swollen right calf. Tender along the deep vein.
Laboratory Results: None.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'When a patient presents with unilateral leg redness and swelling, which ''Surgical'' emergency must be ruled out first?', '["Cellulitis","Deep Vein Thrombosis (DVT)","Fungal infection","None"]', 1, 'A missed DVT can lead to a fatal pulmonary embolism.'),
        (v_case_id, 'What is the ''Best Initial Test'' to rule out DVT in this patient?', '["Blood cultures","Venous Duplex Ultrasound","CT scan","ABI"]', 1, 'Ultrasound is the highly sensitive/specific first step.'),
        (v_case_id, 'If the Ultrasound is negative and the patient has a high fever/WBC, what is the most likely diagnosis?', '["DVT","Cellulitis","Stasis dermatitis","None"]', 1, 'Once a clot is ruled out, the focus shifts to infection.');

    ---------------------------------------------------------------------------
    -- CASE 23: The ''Target'' and the ''Wound'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Wound'' (Reasoning)', 'A patient with a non-healing ulcer is having a ''biopsy'' taken.

Vitals: Normal.
Physical Examination: Ulcer.
Laboratory Results: None.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Marjolin Ulcer''?', '["A type of bedsore","A Squamous Cell Carcinoma arising within a chronic wound or burn scar","A fungal ulcer","None"]', 1, 'Any chronic wound that changes or fails to heal must be biopsied to rule out malignancy.'),
        (v_case_id, 'How many years does it typically take for a Marjolin ulcer to develop?', '["1 week","Decades (typically 20-30 years of chronic inflammation)","1 month","None"]', 1, 'It is a late complication of chronic tissue injury.'),
        (v_case_id, 'Is a Marjolin ulcer more aggressive than a sun-induced SCC?', '["No","Yes, they have a much higher rate of metastasis","Only in the elderly","None"]', 1, 'These are high-risk tumors requiring aggressive surgical management.');

    ---------------------------------------------------------------------------
    -- CASE 24: The ''Pearly'' Papule and the ''Cryo''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Papule and the ''Cryo''', 'A 90-year-old frail female with a small BCC on her forehead. The family wants to avoid surgery.

Vitals: Normal.
Physical Examination: 5-mm BCC.
Laboratory Results: None.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a reasonable ''Non-surgical'' destructive option for a small, low-risk BCC in a very elderly patient?', '["Oral antibiotics","Cryosurgery or Radiation therapy","Topical steroids","None"]', 1, 'Minimizing surgical burden is a valid consideration in the frail elderly.'),
        (v_case_id, 'What is the primary disadvantage of ''Cryosurgery'' for BCC?', '["It hurts","Lack of a tissue specimen to confirm margins","It''s too fast","None"]', 1, 'The surgeon is essentially treating ''blindly''.'),
        (v_case_id, 'Is Topical Imiquimod or 5-FU FDA-approved for INVASIVE BCC?', '["Yes","No, they are only approved for SUPERFICIAL BCC","Only for nodular BCC","None"]', 1, 'Topicals do not penetrate deeply enough for nodular or invasive tumors.');

    ---------------------------------------------------------------------------
    -- CASE 25: The ''Itch'' and the ''Punctum'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Punctum'' (Reasoning)', 'A patient with a ''cyst'' on his back. It is not bothering him, but his wife wants it gone.

Vitals: Normal.
Physical Examination: 2-cm epidermoid cyst.
Laboratory Results: None.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'In the absence of symptoms (pain, inflammation, rapid growth), what is the most appropriate management for an epidermoid cyst?', '["Immediate surgery","Observation and reassurance","Oral antibiotics","None"]', 1, 'Elective removal is only for cosmetic preference or recurrent inflammation.'),
        (v_case_id, 'If the cyst ''ruptures'' internally, what does it look like clinically?', '["It disappears","It looks like an abscess (red, painful, hot) but is often a ''sterile'' inflammatory response to the keratin","It causes cancer","None"]', 1, 'This ''pseudo-abscess'' often requires I&D even if not infected.'),
        (v_case_id, 'Can you ''squeeze'' a cyst out through the punctum safely?', '["Yes","No, this often ruptures the wall internally, leading to severe inflammation","Only with a needle","None"]', 1, 'Squeezing is discouraged due to the risk of internal rupture.');

    ---------------------------------------------------------------------------
    -- CASE 26: The ''Target'' and the ''Burn'' (Size)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Burn'' (Size)', 'A 25-year-old male was in a house fire. He has burns on his entire right arm and the anterior trunk (chest and abdomen).

Vitals: Tachycardic, BP 100/60.
Physical Examination: Blistered, painful burns on the right arm and chest.
Laboratory Results: None.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Using the ''Rule of Nines'', what is the estimated Body Surface Area (BSA) of this patient''s burns?', '["18%","27% (Right arm = 9%, Anterior Trunk = 18%)","36%","45%"]', 1, 'Accurate BSA calculation is critical for fluid resuscitation protocols (Parkland formula).'),
        (v_case_id, 'What is the ''Best Initial Management'' for a patient with >20% BSA burns?', '["Topical antibiotics only","Aggressive IV fluid resuscitation and transfer to a specialized Burn Center","Surgical grafting immediately","None"]', 1, 'Large burns are systemic injuries requiring specialized multi-disciplinary care.'),
        (v_case_id, 'Which ''Surgical'' emergency can occur in a circumferential full-thickness burn of a limb or the chest?', '["Infection","Compartment Syndrome (limb) or Respiratory failure (chest) due to the constricting eschar, requiring Escharotomy","Heart attack","None"]', 1, 'Escharotomy is a life-saving ''surgical'' bedside procedure to relieve pressure.');

    ---------------------------------------------------------------------------
    -- CASE 27: The ''Pearly'' Bump and the ''Radiation''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Radiation''', 'An 85-year-old male with a 1-cm BCC on the eyelid. He is on multiple anticoagulants and is not a candidate for surgery.

Vitals: Normal.
Physical Examination: Pearly papule on the lower eyelid margin.
Laboratory Results: None.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'When is Radiation Therapy considered an appropriate ''Primary'' treatment for BCC?', '["For all young patients","For older patients who are non-surgical candidates or those who refuse surgery","Never","Only for tumors on the back"]', 1, 'Radiation is a valid alternative to surgery in the elderly, with good local control rates.'),
        (v_case_id, 'What is a disadvantage of radiation for skin cancer in a YOUNG patient?', '["It''s too fast","Risk of long-term cosmetic deterioration (atrophy, telangiectasias) and potential for secondary radiation-induced malignancies later in life","It doesn''t work","None"]', 1, 'Surgery is generally preferred in younger patients to avoid these late effects.'),
        (v_case_id, 'How does radiation affect future surgical options in the same area?', '["It makes them easier","It makes future surgery more difficult due to poor wound healing in irradiated tissue","No effect","None"]', 1, 'Prior radiation is a ''high-risk'' feature for any subsequent surgical repair.');

    ---------------------------------------------------------------------------
    -- CASE 28: The ''Target'' and the ''SLNB'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''SLNB'' (Reasoning)', 'A 40-year-old with a 2.5 mm thick melanoma on the back. No nodes are palpable on exam.

Vitals: Normal.
Physical Examination: No clinical lymphadenopathy.
Laboratory Results: None.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary purpose of a Sentinel Lymph Node Biopsy in melanoma?', '["To cure the patient","To provide accurate staging information by checking the ''first'' draining node for microscopic metastasis","To remove all the lymph nodes","None"]', 1, 'SLNB is a staging procedure, not a therapeutic one.'),
        (v_case_id, 'Based on the depth (2.5 mm), is SLNB indicated?', '["Yes, for all melanomas > 1 mm (and some T1b lesions)","No, it is too deep","Only if it is red","None"]', 0, 'Intermediate thickness (1-4 mm) melanomas are the ''sweet spot'' for SLNB indications.'),
        (v_case_id, 'What is the ''Best Next Step'' if the SLNB is POSITIVE (shows microscopic tumor cells)?', '["Immediate amputation","Systemic adjuvant therapy (e.g., immunotherapy or targeted therapy) and close nodal basin monitoring","Radiation only","None"]', 1, 'Modern management has shifted from completion lymph node dissection (CLND) to systemic therapy for positive nodes.');

    ---------------------------------------------------------------------------
    -- CASE 29: The ''Psoriasis'' and the ''Surgical'' Flare
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Surgical'' Flare', 'A patient with psoriasis is undergoing an elective hip replacement. He is worried about his skin reacting to the surgery.

Vitals: Normal.
Physical Examination: Stable plaques.
Laboratory Results: None.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the term for the development of psoriasis at the site of surgical incisions?', '["Infection","Koebner Phenomenon (Isomorphic response)","Allergy to sutures","None"]', 1, 'Trauma to the skin can trigger new psoriatic lesions.'),
        (v_case_id, 'Should this patient''s psoriasis be aggressively controlled BEFORE surgery?', '["No","Yes, to minimize the inflammatory state and reduce the risk of Koebnerization or post-operative infection","Only if it is itchy","None"]', 1, 'Pre-operative optimization is beneficial.'),
        (v_case_id, 'If he developed ''pustules'' after surgery, what would be the concern?', '["Normal healing","Triggering of generalized pustular psoriasis due to surgical stress or medication changes","Allergy to soap","None"]', 1, 'Acute flares must be monitored in the post-operative period.');

    ---------------------------------------------------------------------------
    -- CASE 30: The ''Itch'' and the ''Stitch'' (Allergy)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Stitch'' (Allergy)', 'A patient develops a red, itchy rash exactly where the surgical ''tape'' was applied after an excision.

Vitals: Normal.
Physical Examination: Erythematous, vesicular plaque in a rectangular shape corresponding to the adhesive tape.
Laboratory Results: None.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely diagnosis?', '["Wound infection","Allergic Contact Dermatitis to the adhesive or rubber component of the tape","BCC recurrence","None"]', 1, 'The sharp, geometric shape matching the tape is pathognomonic.'),
        (v_case_id, 'How can you distinguish this from a ''surgical site infection'' (SSI)?', '["SSI has a fever and pus; dermatitis has intense itching and a geometric pattern","They are the same","Dermatitis is more painful","None"]', 0, 'Itch vs. Pain and Pattern vs. Diffuse spreading are key differentiators.'),
        (v_case_id, 'What is the management?', '["IV Antibiotics","Discontinue the specific tape and use a low-potency topical steroid if needed","Give more tape","None"]', 1, 'Avoidance of the allergen is the priority.');

    ---------------------------------------------------------------------------
    -- CASE 31: The ''Bite'' and the ''Delayed'' Closure
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Bite'' and the ''Delayed'' Closure', 'A patient presents with a 12-hour-old human bite wound on the forearm.

Vitals: Normal.
Physical Examination: A deep jagged wound with visible bruising.
Laboratory Results: None.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is primary (immediate) closure of a human bite on the arm generally AVOIDED?', '["It hurts","Extremely high risk of polymicrobial infection due to human oral flora (including Eikenella)","It leaves a bad scar","None"]', 1, 'Closing ''dirty'' wounds traps bacteria and leads to abscess/cellulitis.'),
        (v_case_id, 'What is the ''Best'' management strategy for this wound?', '["Immediate sutures","Irrigation, debridement, antibiotics, and ''Healing by Secondary Intention'' or ''Delayed Primary Closure''","Topical steroids","None"]', 1, 'Letting the wound ''breathe'' and drain while treating the infection is safer.'),
        (v_case_id, 'What is the prophylactic antibiotic of choice?', '["Penicillin only","Amoxicillin-Clavulanate (Augmentin) to cover Eikenella and anaerobes","Ciprofloxacin","None"]', 1, 'Augmentin is the gold standard for bites.');

    ---------------------------------------------------------------------------
    -- CASE 32: The ''Pearly'' Bump and the ''Shave'' (Trap)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Shave'' (Trap)', 'A surgeon performs a ''deep shave'' biopsy of a suspicious mole. The pathology returns ''Malignant Melanoma, at least 0.4 mm, transected at the base''.

Vitals: Normal.
Physical Examination: Shave site on the trunk.
Laboratory Results: Transected melanoma.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why was the ''Shave'' biopsy a suboptimal choice in this case?', '["It''s too fast","It transected the base, making it impossible to determine the true Breslow depth (and thus the stage/prognosis)","It causes too much bleeding","None"]', 1, 'Depth is the most critical staging variable; shave biopsies often cut through the tumor.'),
        (v_case_id, 'What is the ''Best'' next step now that the base is transected?', '["Wait and see","Perform a wider/deeper re-excision (residual depth may still be uncertain) and manage based on the visible features","Give chemotherapy","None"]', 1, 'A ''re-excision'' is mandatory, but the initial staging data is permanently compromised.'),
        (v_case_id, 'What would have been the ''Ideal'' initial biopsy technique?', '["Shave","Excisional biopsy (full-thickness) with narrow (1-3 mm) margins","Needle aspiration","None"]', 1, 'Full-thickness specimens are required for melanoma.');

    ---------------------------------------------------------------------------
    -- CASE 33: The ''Target'' and the ''Graft'' (Success)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Graft'' (Success)', 'A patient has a large skin graft on his leg. Three days later, the graft looks ''purple and boggy''.

Vitals: Normal.
Physical Examination: Fluid collection under the graft.
Laboratory Results: None.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common cause of skin graft ''failure'' in the first 48-72 hours?', '["Infection","Hematoma or Seroma (fluid collection) preventing the graft from adhering to the bed","The patient''s diet","None"]', 1, 'Fluid acts as a physical barrier to revascularization (plasmatic imbibition).'),
        (v_case_id, 'What is the term for the initial stage of graft survival where it ''drinks'' nutrients from the bed?', '["Inosculation","Plasmatic imbibition","Neovascularization","None"]', 1, 'This occurs in the first 24-48 hours.'),
        (v_case_id, 'How do surgeons often prevent fluid collection under a graft?', '["By using lots of tape","Applying a ''bolster'' (Tie-over) dressing or ''pie-crusting'' (making small slits in the graft)","Giving aspirin","None"]', 1, 'Pressure and drainage are essential for graft ''take''.');

    ---------------------------------------------------------------------------
    -- CASE 34: The ''Pearly'' Bump and the ''Lidocaine'' (Toxicity)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Lidocaine'' (Toxicity)', 'During a long Mohs procedure, a patient is given multiple injections of Lidocaine with Epinephrine. She begins to feel ''anxious'' and complains of a ''metallic taste'' and ''numbness around her mouth''.

Vitals: BP 150/90, HR 110.
Physical Examination: Circumoral paresthesias and tremors.
Laboratory Results: None.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic early symptom of lidocaine toxicity?', '["Heart attack","CNS symptoms: metallic taste, tinnitus, circumoral numbness, and lightheadedness","Itch","None"]', 1, 'CNS signs usually precede cardiac toxicity.'),
        (v_case_id, 'What is the maximum recommended dose of Lidocaine WITH Epinephrine for local infiltration?', '["4.5 mg/kg","7 mg/kg","10 mg/kg","None"]', 1, 'Epinephrine allows for a higher dose by slowing absorption; the limit without Epi is 4.5 mg/kg.'),
        (v_case_id, 'What is the ''Antidote'' for severe, life-threatening LAST (seizures/arrhythmia)?', '["Oxygen","Intravenous Lipid Emulsion (20% Intralipid)","Epinephrine","None"]', 1, 'Lipid emulsion acts as a ''sink'' to pull the local anesthetic out of the heart/brain.');

    ---------------------------------------------------------------------------
    -- CASE 35: The ''Bite'' and the ''Rabies'' (Decision)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Bite'' and the ''Rabies'' (Decision)', 'A patient was bitten by a ''stray dog'' that ran away. The wound is on the hand.

Vitals: Normal.
Physical Examination: Small puncture wounds.
Laboratory Results: None.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the management if the biting animal is a healthy domestic dog that can be observed for 10 days?', '["Start PEP immediately","Observe the animal; start PEP only if the animal develops signs of rabies","Give antibiotics only","None"]', 1, 'Healthy domestic animals can be monitored safely.'),
        (v_case_id, 'What if the animal is a ''stray'' that cannot be found or a ''high-risk'' wild animal (e.g., bat, raccoon, skunk)?', '["Wait for symptoms","Immediate Post-Exposure Prophylaxis (PEP) with Rabies Vaccine and RIG","Give Tetanus only","None"]', 1, 'Rabies is 100% fatal once symptoms appear; empiric PEP is mandatory for high-risk exposures.'),
        (v_case_id, 'Where should the Rabies Immune Globulin (RIG) be administered?', '["Intramuscularly in the gluteus","Infiltrated directly into and around the wound site (if possible)","Only in the arm","None"]', 1, 'RIG provides immediate local neutralizing antibodies.');

    ---------------------------------------------------------------------------
    -- CASE 36: The ''Psoriasis'' and the ''Wound'' (Infection)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Wound'' (Infection)', 'A psoriasis patient has an elective excision. Three days later, the wound is red and there is ''pustular'' drainage.

Vitals: T 38.2 C.
Physical Examination: Erythema, warmth, and purulent discharge from the incision.
Laboratory Results: None.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely causative organism for a surgical site infection occurring < 1 week post-op?', '["Pseudomonas","Staphylococcus aureus or Streptococcus pyogenes","Fungus","None"]', 1, 'Skin flora are the primary pathogens.'),
        (v_case_id, 'What is the ''Surgical'' management for a purulent wound infection?', '["More antibiotics only","Opening the wound, drainage of the pus, and potentially packing (healing by secondary intention)","Tighten the stitches","None"]', 1, 'Source control (drainage) is fundamental to managing an infected space.'),
        (v_case_id, 'How does the ''Psoriasis'' history complicate the diagnosis?', '["It doesn''t","Koebnerization or localized pustular flare can mimic infection, but fever and purulence strongly favor infection","It makes it heal faster","None"]', 1, 'The surgeon must distinguish between a ''sterile'' flare and a true infection.');

    ---------------------------------------------------------------------------
    -- CASE 37: The ''Target'' and the ''Flap'' (Decision)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Flap'' (Decision)', 'A surgeon is repairing a defect on the nose. A ''Primary Closure'' would cause the nostril to pull upward.

Vitals: Normal.
Physical Examination: 1-cm defect on the nasal alar rim.
Laboratory Results: None.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Reconstructive Ladder''?', '["A list of tools","A hierarchy of closure techniques from simplest (secondary intention) to most complex (free flap)","A type of surgery","None"]', 1, 'Surgeons should use the simplest technique that provides an optimal outcome.'),
        (v_case_id, 'If primary closure causes ''distal distortion'' (e.g., pulling the eyelid or nostril), what is the next step up the ladder?', '["Skin graft","Local Skin Flap (which recruits adjacent tissue without tension)","Leave it open","None"]', 1, 'Flaps are preferred on the face for better color and texture match compared to grafts.'),
        (v_case_id, 'What is the primary difference between a ''Flap'' and a ''Graft''?', '["Flaps are smaller","A flap maintains its own blood supply (pedicle); a graft is completely severed from its blood supply and must ''take'' from the bed","Grafts are more complex","None"]', 1, 'This is a fundamental principle of plastic and reconstructive surgery.');

    ---------------------------------------------------------------------------
    -- CASE 38: The ''Itch'' and the ''Latex'' (Surgical)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Latex'' (Surgical)', 'During a procedure, a patient suddenly develops hives, wheezing, and hypotension.

Vitals: BP 80/40, HR 130.
Physical Examination: Generalized urticaria, angioedema, and stridor.
Laboratory Results: None.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial Treatment'' for intraoperative anaphylaxis?', '["IV Antihistamines","Intramuscular or IV Epinephrine, aggressive fluids, and removing the trigger","Steroids","Oxygen only"]', 1, 'Epinephrine is the life-saving treatment of choice.'),
        (v_case_id, 'Which common surgical item is a frequent cause of intraoperative Type I hypersensitivity?', '["Scalpels","Latex gloves/catheters","Sutures","None"]', 1, 'Latex allergy is a major safety concern in the OR.'),
        (v_case_id, 'Which ''Fruit'' allergies are associated with a higher risk of Latex allergy?', '["Apples and oranges","Avocado, Banana, Kiwi, and Chestnut (Latex-fruit syndrome)","Grapes","None"]', 1, 'Cross-reactivity between plant proteins and latex is a common ''Step'' association.');

    ---------------------------------------------------------------------------
    -- CASE 39: The ''Pearly'' Bump and the ''Cautery'' (Danger)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Cautery'' (Danger)', 'A surgeon is using electrocautery near a patient''''s pacemaker.

Vitals: Normal.
Physical Examination: BCC on the upper chest.
Laboratory Results: None.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary risk of using MONOPOLAR electrocautery in a patient with a pacemaker or ICD?', '["None","Electromagnetic interference (EMI) that can cause the device to malfunction, inhibit pacing, or trigger a shock","It drains the battery","None"]', 1, 'The current path in monopolar cautery travels through the body.'),
        (v_case_id, 'What is a ''Safer'' electrosurgical alternative for these patients?', '["Lasers","Bipolar electrocautery (where the current only stays between the two tips of the forceps)","None","Burning a candle"]', 1, 'Bipolar cautery minimizes the risk of EMI.'),
        (v_case_id, 'Where should the ''Grounding Pad'' be placed in monopolar surgery to minimize risk?', '["Near the pacemaker","As far as possible from the device, with the operative site located between the pad and the device","It doesn''t matter","None"]', 1, 'Proper pad placement directs the current away from the electronics.');

    ---------------------------------------------------------------------------
    -- CASE 40: The ''Target'' and the ''Adhesive'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Adhesive'' (Reasoning)', 'A patient with a ''wound'' is using a transparent film dressing (e.g., Tegaderm).

Vitals: Normal.
Physical Examination: Clean surgical wound.
Laboratory Results: None.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which type of dressing is best for a ''heavily exudative'' (weeping) wound?', '["Transparent film","Alginates or Foams (which have high absorbent capacity)","Dry gauze only","None"]', 1, 'Matching the dressing to the amount of drainage is key to preventing maceration.'),
        (v_case_id, 'What is the primary function of a ''Hydrocolloid'' dressing?', '["To dry the wound","To maintain a moist environment and provide autolytic debridement","To kill bacteria","None"]', 1, 'Hydrocolloids are excellent for superficial wounds with minimal drainage.'),
        (v_case_id, 'Which dressing should be avoided on ''Infected'' wounds because it creates an occlusive environment?', '["Transparent films and Hydrocolloids","Gauze","Antibiotic ointment","None"]', 0, 'Occlusion can promote bacterial overgrowth in an already infected wound.');

    ---------------------------------------------------------------------------
    -- CASE 41: The ''Bite'' and the ''Tetanus'' (Status)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Bite'' and the ''Tetanus'' (Status)', 'A 40-year-old male has a dirty laceration. His last tetanus shot was 12 years ago.

Vitals: Normal.
Physical Examination: 2-cm dirty wound.
Laboratory Results: None.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'For a ''dirty'' or ''contaminated'' wound, what is the threshold for a tetanus booster if the primary series was completed?', '["Every year","Every 5 years","Every 10 years","None"]', 1, 'For clean wounds, it''s 10 years; for dirty wounds, it''s 5 years.'),
        (v_case_id, 'In which scenario would Tetanus Immune Globulin (TIG) be required?', '["For all dirty wounds","For a dirty wound in a patient with an uncertain or incomplete primary series ( < 3 doses)","Only if they have a fever","None"]', 1, 'Passive immunization is only for those without a foundational primary series.'),
        (v_case_id, 'Is the Tetanus vaccine (Tdap/Td) given in the same syringe as RIG?', '["Yes","No, they should be given in separate syringes and at separate anatomical sites","Only in children","None"]', 1, 'Standard protocol for all vaccine/IG combinations.');

    ---------------------------------------------------------------------------
    -- CASE 42: The ''Pearly'' Bump and the ''Lidocaine'' (Epi)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Lidocaine'' (Epi)', 'A surgeon is injecting lidocaine with epinephrine into a patient''''s ''finger'' to remove a growth.

Vitals: Normal.
Physical Examination: Growth on the distal phalanx.
Laboratory Results: None.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What was the traditional ''Surgical Teaching'' regarding epinephrine in fingers, toes, and the nose?', '["Always use it","Avoid it due to the risk of distal necrosis/ischemia","It makes the heart stop","None"]', 1, 'Historically, students were taught ''no epi'' in end organs.'),
        (v_case_id, 'Is there strong evidence for necrosis when using modern, low-concentration (1:100k) epinephrine in these areas?', '["Yes","No, recent evidence and large studies show it is safe and highly effective at reducing bleeding and prolonging anesthesia","Only in smokers","None"]', 1, 'Many dermatologists and hand surgeons now use epinephrine in digits safely.'),
        (v_case_id, 'Which medication can be used as an ''Antidote'' to reverse local epinephrine-induced vasoconstriction if ischemia is suspected?', '["Lidocaine","Phentolamine (an alpha-blocker)","Aspirin","None"]', 1, 'Phentolamine rescue is the standard reversal agent.');

    ---------------------------------------------------------------------------
    -- CASE 43: The ''Psoriasis'' and the ''Steroid'' (Joint)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Steroid'' (Joint)', 'A patient with psoriasis has a very painful, swollen knee. The surgeon is considering an intra-articular steroid injection.

Vitals: Normal.
Physical Examination: Swollen, warm knee.
Laboratory Results: Joint aspiration shows 50,000 WBCs (mostly neutrophils).', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Most Important'' step before injecting a steroid into a swollen joint?', '["Give oral antibiotics","Perform joint aspiration and gram stain/culture to rule out septic arthritis","Apply ice","None"]', 1, 'Injecting a steroid into an infected joint can be catastrophic.'),
        (v_case_id, 'If the joint shows ''crystals'' but the culture is negative, what is the diagnosis?', '["Septic arthritis","Gout (monosodium urate) or Pseudogout (CPPD)","Psoriatic arthritis","None"]', 1, 'Crystals point to a metabolic inflammatory arthritis.'),
        (v_case_id, 'Psoriatic arthritis can also involve which ''axial'' skeleton location?', '["Cervical spine","Sacroiliac (SI) joints (Sacroiliitis)","Skull","None"]', 1, 'PsA is part of the seronegative spondyloarthropathy family.');

    ---------------------------------------------------------------------------
    -- CASE 44: The ''Itch'' and the ''Biopsy'' (Infection)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Biopsy'' (Infection)', 'A patient with a suspected deep fungal infection (e.g., Sporotrichosis) needs a tissue diagnosis.

Vitals: Normal.
Physical Examination: Linear nodules on the arm.
Laboratory Results: None.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'When biopsying for a suspected deep infection, what should be done with the tissue specimen?', '["Put it all in Formalin","Split the specimen: one part in Formalin (for Histology) and one part in Sterile Saline (for Tissue Culture)","Discard it","None"]', 1, 'Formalin kills organisms; culture requires fresh, sterile tissue.'),
        (v_case_id, 'Why is ''Tissue Culture'' superior to a standard ''Surface Swab'' for deep infections?', '["It''s cheaper","Surface swabs often show colonizing bacteria; tissue culture identifies the actual invading pathogen","It takes less time","None"]', 1, 'Deep tissue is the ''gold standard'' for mycobacterial and fungal infections.'),
        (v_case_id, 'What is the term for the inflammatory pattern seen on pathology in these cases?', '["Granulomatous inflammation","Acne","Hives","None"]', 0, 'Granulomas are a common response to chronic infection or foreign bodies.');

    ---------------------------------------------------------------------------
    -- CASE 45: The ''Bite'' and the ''Cat'' (Danger)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Bite'' and the ''Cat'' (Danger)', 'A 10-year-old girl is bitten on the hand by her pet cat.

Vitals: Normal.
Physical Examination: Small, deep ''puncture'' wounds on the dorsum of the hand.
Laboratory Results: None.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why are ''Cat'' bites considered higher risk for deep infection than ''Dog'' bites?', '["Cats are dirtier","Long, thin fangs create deep puncture wounds that ''inject'' bacteria into joints, tendons, and bone","Cats have more rabies","None"]', 1, 'The ''puncture'' mechanism is more likely to cause tenosynovitis or septic arthritis.'),
        (v_case_id, 'Which specific organism is the ''classic'' culprit in cat bite infections?', '["Staphylococcus","Pasteurella multocida","E. coli","None"]', 1, 'Pasteurella is a fast-growing Gram-negative rod found in feline oral flora.'),
        (v_case_id, 'What is the management for a cat bite on the hand that shows early signs of infection?', '["Oral antibiotics and outpatient follow-up","Hospitalization, IV antibiotics, and potentially surgical exploration/irrigation","Ice only","None"]', 1, 'Hand infections in children can lead to rapid functional loss.');

    ---------------------------------------------------------------------------
    -- CASE 46: The ''Pearly'' Bump and the ''Flap'' (Necrosis)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Flap'' (Necrosis)', 'A patient has a transposition flap on the nose. Three days later, the ''tip'' of the flap looks black.

Vitals: Normal.
Physical Examination: Distal necrosis of the skin flap.
Laboratory Results: None.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely cause of distal flap necrosis?', '["Infection","Excessive tension or inadequate venous/arterial supply to the tip","The patient''s age","None"]', 1, 'Flaps have limited blood supply; tension further compromises perfusion.'),
        (v_case_id, 'Should the ''black'' tissue be surgically debrided immediately?', '["Yes","No, it is often best to allow the ''biological dressing'' (eschar) to declare itself while the underlying tissue heals","Only if it smells","None"]', 1, 'Early debridement can damage potentially viable tissue underneath.'),
        (v_case_id, 'What is the primary factor that determines the maximum length of a skin flap?', '["The surgeon''s skill","The width of the flap base (the pedicle) and the blood supply","The patient''s height","None"]', 1, 'The ''Length-to-Width'' ratio is a fundamental rule in flap design.');

    ---------------------------------------------------------------------------
    -- CASE 47: The ''Itch'' and the ''Silicone''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Silicone''', 'A patient is using silicone sheets to treat a hypertrophic scar.

Vitals: Normal.
Physical Examination: A thick, red, raised scar on the chest.
Laboratory Results: None.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does silicone sheeting help improve the appearance of scars?', '["It bleaches them","By increasing hydration and slightly increasing the temperature of the scar, which modifies collagen remodeling","It kills the scar","None"]', 1, 'Hydration is the primary mechanism.'),
        (v_case_id, 'How many hours a day should the sheets be worn?', '["1 hour","At least 12-24 hours a day for several months","Only at night","None"]', 1, 'Consistency and long duration are required for efficacy.'),
        (v_case_id, 'Is it more effective for ''Old'' or ''New'' scars?', '["Newer scars (usually starting after the wound has fully closed)","Old scars from 20 years ago","Both are equal","None"]', 0, 'Active, remodeling scars respond best.');

    ---------------------------------------------------------------------------
    -- CASE 48: The ''Pearly'' Bump and the ''Complication'' (Hematoma)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Complication'' (Hematoma)', 'Four hours after an excision on the scalp, the patient calls because the dressing is ''soaked with blood'' and the area is ''tight and painful''.

Vitals: Normal.
Physical Examination: A firm, tense, and bulging mass under the incision line.
Laboratory Results: None.', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the immediate management for an expanding, tense hematoma?', '["Apply ice and wait","Open the incision, evacuate the blood, identify and cauterize any bleeding vessels, and re-suture","Give antibiotics","None"]', 1, 'Relieving pressure and stopping the bleed is the priority.'),
        (v_case_id, 'What is the ''Surgical'' risk of an untreated hematoma?', '["None","Pressure necrosis of the skin edges, wound dehiscence, and increased risk of infection","It turns into a cyst","None"]', 1, 'The blood acts as a culture medium and a physical barrier to healing.'),
        (v_case_id, 'Which medication should the patient be asked about as a potential risk factor?', '["Aspirin, Anticoagulants, or certain herbal supplements (Ginkgo, Fish oil)","Acetaminophen","Vitamins","None"]', 0, 'Anti-platelet and anticoagulant agents increase surgical bleeding risk.');

    ---------------------------------------------------------------------------
    -- CASE 49: The ''Target'' and the ''Mesh'' (Grafting)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Mesh'' (Grafting)', 'A surgeon ''meshes'' a skin graft before applying it to a large leg wound.

Vitals: Normal.
Physical Examination: A graft with multiple small slits.
Laboratory Results: None.', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary purpose of ''Meshing'' a skin graft?', '["To make it look better","To allow the graft to expand to cover a larger area and to allow for drainage of fluid (preventing seroma)","To make it thicker","None"]', 1, 'Expansion and drainage are the two main reasons for meshing.'),
        (v_case_id, 'What is the ''Cosmetic'' drawback of a meshed graft?', '["It''s too smooth","The ''chicken-wire'' or ''fish-net'' appearance of the healed graft","It''s too red","None"]', 1, 'Meshed grafts are usually avoided on the face for this reason.'),
        (v_case_id, 'A graft that is NOT meshed is called what?', '["A full graft","A Sheet Graft","A plate graft","None"]', 1, 'Sheet grafts are used in cosmetically sensitive areas like the face and hands.');

    ---------------------------------------------------------------------------
    -- CASE 50: The ''Itch'' and the ''Suture'' (Removal)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Suture'' (Removal)', 'A patient is asking when the stitches on his ''back'' can be removed.

Vitals: Normal.
Physical Examination: 4-cm incision on the upper back.
Laboratory Results: None.', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the standard time for suture removal on the ''Face''?', '["3-5 days","7-10 days","14 days","1 month"]', 0, 'Early removal on the face prevents ''railroad track'' scarring.'),
        (v_case_id, 'How does the ''Back'' or ''Joint'' surfaces differ in timing?', '["It''s the same","Longer duration (usually 10-14 days) due to higher tension and slower healing","Shorter duration","None"]', 1, 'Premature removal in high-tension areas leads to wound dehiscence.'),
        (v_case_id, 'If the sutures are left in too long (e.g., 3 weeks on the face), what occurs?', '["Stronger wound","Suture tracks and ''epithelialized tunnels'' (permanent scarring)","Infection only","None"]', 1, 'The skin grows around the suture, leaving permanent marks.');

    ---------------------------------------------------------------------------
    -- CASE 51: The Scalp Knot
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scalp Knot', 'A 45-year-old female presents with a firm, mobile lump on her scalp that has been present for 5 years.

Vitals: Normal.
Physical Examination: A 3-cm smooth, firm, subcutaneous nodule on the vertex scalp. No punctum is visible.
Laboratory Results: None.', 51)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common location for a Pilar Cyst (Trichilemmal Cyst)?', '["Back","Scalp (90% of cases)","Face","Legs"]', 1, 'Pilar cysts are derived from the hair follicle root sheath.'),
        (v_case_id, 'How does the ''Surgical'' removal of a pilar cyst differ from an epidermoid cyst?', '["Pilar cysts are more fragile","Pilar cysts have a thicker, tougher wall that allows them to be ''popped out'' (enucleated) whole through a small incision","They cannot be removed","None"]', 1, 'The firm wall makes them easier to excise without rupture.'),
        (v_case_id, 'Are these cysts usually associated with hair loss?', '["Yes, permanently","No, but they can cause temporary thinning of the hair overlying the lump","Only in men","None"]', 1, 'Pressure from the cyst can displace follicles.');

    ---------------------------------------------------------------------------
    -- CASE 52: The Ingrown Toenail
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Ingrown Toenail', 'A 15-year-old male has chronic pain and drainage from the side of his big toenail.

Vitals: Normal.
Physical Examination: Erythema, edema, and granulation tissue at the lateral nail fold of the right hallux.
Laboratory Results: None.', 52)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best'' management for an ingrown nail with significant granulation tissue and recurrent infection?', '["Antibiotics only","Partial nail avulsion with chemical matricectomy (e.g., using Phenol or Sodium Hydroxide)","Complete nail removal only","Wait for it to grow out"]', 1, 'Chemical matricectomy destroys the specific part of the nail root that is causing the problem, preventing recurrence.'),
        (v_case_id, 'What should be done for an acute infection (Paronychia) WITHOUT a permanent ingrown component?', '["Surgery","Soaks in warm water/antiseptics and potentially a small incision if an abscess is present","Steroids","None"]', 1, 'Conservative management is sufficient for simple infections.'),
        (v_case_id, 'Why is ''Complete'' nail removal often a poor choice for a chronic ingrown nail?', '["It hurts too much","High recurrence rate once the nail grows back (~70%) and poor cosmetic result","It takes too long","None"]', 1, 'Targeted destruction of the matrix is superior.');

    ---------------------------------------------------------------------------
    -- CASE 53: The ''Red'' Leg and the ''Crepitus''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Red'' Leg and the ''Crepitus''', 'A diabetic patient with a small foot ulcer develops rapid swelling of the scrotum and perineum. He is extremely ill.

Vitals: BP 85/50, T 40.1 C.
Physical Examination: Blackened skin (eschar) on the scrotum with ''crunchy'' air under the skin (crepitus) and a foul odor.
Laboratory Results: WBC 45,000, Glucose 400.', 53)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the diagnosis for necrotizing fasciitis of the perineum and genitalia?', '["Cellulitis","Fournier''s Gangrene","Simple abscess","Fungal infection"]', 1, 'Fournier''s is a urologic/surgical emergency with high mortality.'),
        (v_case_id, 'What is the absolute priority in management?', '["Insulin for the diabetes","Immediate surgical debridement and broad-spectrum IV antibiotics","Urine culture","None"]', 1, 'Delaying surgery for even a few hours significantly increases the risk of death.'),
        (v_case_id, 'The ''Crepitus'' (gas in the tissue) is typically caused by which type of bacteria?', '["Staphylococcus","Anaerobes (e.g., Clostridium, Bacteroides) and Gram-negative gas-producers","Viruses","None"]', 1, 'Gas production is a hallmark of anaerobic metabolism in deep infections.');

    ---------------------------------------------------------------------------
    -- CASE 54: The ''Pearly'' Bump and the ''Liquid Nitrogen''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Liquid Nitrogen''', 'A patient has multiple actinic keratoses on the scalp. The surgeon uses a ''Spray'' of liquid nitrogen.

Vitals: Normal.
Physical Examination: Multiple rough, scaly patches on sun-damaged skin.
Laboratory Results: None.', 54)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the temperature of Liquid Nitrogen?', '["0 C","-196 C","-50 C","None"]', 1, 'It is extremely cold, allowing for rapid freezing and cell death.'),
        (v_case_id, 'What is the ''expected'' clinical course after cryosurgery for an AK?', '["Nothing happens","Redness, followed by a blister (sometimes blood-filled), crusting, and eventual healing in 1-2 weeks","The skin turns black permanently","None"]', 1, 'The blister formation is a sign that the freeze reached the dermal-epidermal junction.'),
        (v_case_id, 'What is the primary risk of ''Over-freezing'' on the lower legs or in dark-skinned patients?', '["Infection","Hypopigmentation (white spots) or chronic non-healing ulcers","Hair growth","None"]', 1, 'Melanocytes are very sensitive to cold; cautious freezing is required in these groups.');

    ---------------------------------------------------------------------------
    -- CASE 55: The ''Target'' and the ''Biopsy'' (Incisional)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Incisional)', 'A patient has a 10-cm soft tissue mass on the thigh. The surgeon needs a diagnosis.

Vitals: Normal.
Physical Examination: Large, deep-seated mass.
Laboratory Results: None.', 55)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'For a very large tumor (>5 cm) where malignancy is suspected, what is the best initial ''Surgical'' diagnostic step?', '["Wide radical excision immediately","Incisional biopsy (taking a small piece of the tumor) to confirm the diagnosis and plan the definitive surgery","Wait and see","None"]', 1, 'Definitive surgery (like amputation or wide limb-sparing excision) requires a tissue-proven diagnosis first.'),
        (v_case_id, 'Where should the biopsy incision be placed?', '["Anywhere","Directly over the mass in a location that can be easily removed during the final definitive surgery","On the other leg","None"]', 1, 'The biopsy tract itself is considered ''contaminated'' and must be excised with the tumor.'),
        (v_case_id, 'Is ''Core Needle Biopsy'' acceptable for soft tissue sarcomas?', '["No","Yes, it is often the preferred initial method as it is minimally invasive","Only for children","None"]', 1, 'Core needle (but NOT fine needle) can provide enough architecture for a diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 56: The ''Itch'' and the ''Skin'' Graft (Donor)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Skin'' Graft (Donor)', 'A patient had a ''Split-Thickness Skin Graft'' (STSG) harvested from her thigh to cover a burn.

Vitals: Normal.
Physical Examination: A raw, weeping area on the thigh.
Laboratory Results: None.', 56)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does an STSG donor site heal?', '["By primary intention (stitches)","By re-epithelialization from the remaining hair follicles and sweat glands (secondary intention)","It never heals","None"]', 1, 'Since only part of the dermis is taken, the skin can regenerate from deep structures.'),
        (v_case_id, 'Which heals FASTER, an STSG donor site or a Full-Thickness (FTSG) donor site?', '["STSG","FTSG (because it is sutured closed)","They are the same","None"]', 1, 'FTSG sites are small and closed primarily; STSG sites are larger and must granulate/re-epithelialize.'),
        (v_case_id, 'What is the major long-term drawback of STSG donor sites?', '["Infection","Potential for permanent pigmentary changes or scarring","Pain only","None"]', 1, 'While they heal, the skin may never look perfectly normal again.');

    ---------------------------------------------------------------------------
    -- CASE 57: The ''Pearly'' Bump and the ''Recurrence''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Recurrence''', 'A patient has a recurrence of a BCC in the same spot where a standard excision was performed 2 years ago.

Vitals: Normal.
Physical Examination: Scar on the cheek with a new pearly edge.
Laboratory Results: Recurrent BCC.', 57)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Gold Standard'' for managing a RECURRENT skin cancer?', '["Another standard excision","Mohs Micrographic Surgery","Radiation","Wait and see"]', 1, 'Recurrent tumors often have ''subclinical'' spread along the scar tissue, making Mohs essential for clear margins.'),
        (v_case_id, 'Why is the cure rate lower for recurrent tumors treated with standard excision?', '["The tumor is stronger","Scar tissue ''masks'' the tumor roots and makes it harder for the pathologist to find them with standard sectioning","Insurance won''t pay","None"]', 1, 'Scarring alters the normal tissue planes.'),
        (v_case_id, 'Does a ''positive margin'' on a previous pathology report increase the risk of recurrence?', '["Yes, significantly","No","Only if the patient is young","None"]', 0, 'Incomplete excision is the primary driver of recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 58: The ''Target'' and the ''Debridement'' (Wound)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Debridement'' (Wound)', 'A patient with a chronic diabetic foot ulcer has thick, dry ''callus'' around the edges.

Vitals: Normal.
Physical Examination: A deep ulcer on the first metatarsal head with a thick ring of hyperkeratosis.
Laboratory Results: None.', 58)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is ''Paring the Callus'' (debridement of the edges) essential for diabetic ulcer healing?', '["It looks better","Callus hides the true extent of the ulcer and prevents the migration of new skin cells across the wound","It stops the smell","None"]', 1, 'Debridement converts a ''stagnant'' chronic wound into an ''active'' acute-like wound.'),
        (v_case_id, 'What must be checked in every diabetic foot ulcer to ensure healing is possible?', '["Blood sugar only","Vascular status (pulses, ABI) and Neuropathy (monofilament test)","Shoe size","None"]', 1, 'Without adequate blood supply, even the best surgical debridement will fail.'),
        (v_case_id, 'Is ''Probe-to-Bone'' a useful clinical test in this setting?', '["No","Yes, it is highly suggestive of underlying Osteomyelitis if a metal probe can touch bone","Only for children","None"]', 1, 'This is a high-yield clinical maneuver for Step 2 CK.');

    ---------------------------------------------------------------------------
    -- CASE 59: The ''Pearly'' Bump and the ''Flap'' (Closure)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Flap'' (Closure)', 'A surgeon is using a ''Rotation Flap'' to close a large defect on the cheek.

Vitals: Normal.
Physical Examination: Large circular defect.
Laboratory Results: None.', 59)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the characteristic shape of a rotation flap?', '["A square","An arc of a circle","A triangle","None"]', 1, 'The flap ''rotates'' around a pivot point.'),
        (v_case_id, 'What is the ''Back-cut'' in a rotation flap used for?', '["To make it bleed","To allow for more rotation and reduce tension at the closure site","To finish the surgery","None"]', 1, 'This increases the mobility of the flap.'),
        (v_case_id, 'What is the ''Dog-ear'' deformity?', '["An infection","A redundant fold of skin that occurs at the pivot point or end of a closure, which may require separate excision","A type of ear surgery","None"]', 1, 'Dog-ears are a common and expected surgical result that often needs ''leveling'' during or after closure.');

    ---------------------------------------------------------------------------
    -- CASE 60: The ''Itch'' and the ''Steroid'' (Surgical)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Steroid'' (Surgical)', 'A patient has a thick, itchy hypertrophic scar. The surgeon is injecting Triamcinolone (Kenalog).

Vitals: Normal.
Physical Examination: Thick, red, raised scar on the chest.
Laboratory Results: None.', 60)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How do intralesional steroids help flatten a scar?', '["By killing the skin","By inhibiting fibroblast activity and reducing collagen production","By adding water","None"]', 1, 'Steroids modify the local wound-healing response.'),
        (v_case_id, 'What is a potential ''Surgical'' complication of injecting too much steroid into the scar?', '["Cancer","Skin atrophy, hypopigmentation, and fat necrosis (indentation)","Hair growth","None"]', 1, 'Precise injection into the scar tissue is required to avoid surrounding atrophy.'),
        (v_case_id, 'How many weeks should be between injections?', '["1 day","4-6 weeks (to allow the steroid effect to be fully realized)","1 year","None"]', 1, 'Serial injections are safer than one massive dose.');

    ---------------------------------------------------------------------------
    -- CASE 61: The ''Target'' and the ''Burn'' (Triage)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Burn'' (Triage)', 'A triage nurse is assessing multiple burn victims. One patient has burns on the face and singed nasal hairs.

Vitals: HR 120, RR 24.
Physical Examination: Singed nasal hairs, soot in the mouth, and a raspy voice.
Laboratory Results: None.', 61)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the MOST URGENT priority for this patient?', '["Calculating BSA","Securing the airway (Early Intubation) before progressive edema makes it impossible","Starting IV fluids","Cleaning the face"]', 1, 'Airway edema can develop rapidly in inhalation injury.'),
        (v_case_id, 'Which gas poisoning must be suspected in victims of house fires?', '["Oxygen","Carbon Monoxide (CO) and Cyanide","Nitrogen","None"]', 1, 'CO poisoning is a leading cause of early death in fire victims.'),
        (v_case_id, 'Does a ''Normal'' Pulse Oximetry reading rule out CO poisoning?', '["Yes","No, pulse ox cannot distinguish between oxyhemoglobin and carboxyhemoglobin; ABG with CO-oximetry is needed","Only in smokers","None"]', 1, 'This is a classic ''Step'' trap.');

    ---------------------------------------------------------------------------
    -- CASE 62: The ''Pearly'' Bump and the ''Laser'' (Vascular)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Laser'' (Vascular)', 'A patient has a large ''Port Wine Stain'' on the face and wants it removed.

Vitals: Normal.
Physical Examination: Large, flat purple patch on the cheek.
Laboratory Results: None.', 62)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Gold Standard'' surgical treatment for a Port Wine Stain?', '["Surgical excision and grafting","Pulsed Dye Laser (PDL)","Cryosurgery","Wait for it to fade"]', 1, 'PDL selectively targets hemoglobin in the blood vessels without damaging the surrounding skin.'),
        (v_case_id, 'Why is ''Early'' treatment (in infancy) preferred for Port Wine Stains?', '["It''s cheaper","Better response due to smaller vessel size and thinner skin, and it prevents the development of nodules/thickening later in life","No reason","None"]', 1, 'Early intervention provides the best long-term results.'),
        (v_case_id, 'What is the characteristic immediate clinical sign of a successful PDL treatment?', '["Bleeding","Purpura (purple bruising) of the treated area","The skin turns white","None"]', 1, 'The laser bursts the vessels, leading to temporary purpura.');

    ---------------------------------------------------------------------------
    -- CASE 63: The ''Itch'' and the ''Punctum'' (Rupture)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Punctum'' (Rupture)', 'A patient has a ruptured epidermoid cyst. It is red, hot, and painful.

Vitals: Normal.
Physical Examination: Erythema, fluctuation, and extreme tenderness over a known cyst site.
Laboratory Results: None.', 63)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial step for a ruptured, acutely inflamed cyst?', '["Definitive excision of the wall","Incision and Drainage (I&D) to relieve pressure","Wait for it to cool down","None"]', 1, 'Acute inflammation makes the wall ''friable'' and impossible to remove cleanly.'),
        (v_case_id, 'Is ''Antibiotic'' therapy mandatory for every ruptured cyst?', '["Yes, for 10 days","No, much of the inflammation is a sterile foreign body reaction to keratin, but antibiotics are used if true infection is suspected","Never","None"]', 1, 'Clinical judgement is needed to distinguish sterile inflammation from sepsis.'),
        (v_case_id, 'When can ''Definitive Excision'' be performed safely after an I&D?', '["The next day","Usually after 4-8 weeks when the inflammation has completely resolved","After 1 year","None"]', 1, 'Resolution of inflammation allows the wall to reform and become exciseable.');

    ---------------------------------------------------------------------------
    -- CASE 64: The ''Pearly'' Bump and the ''Margin'' (SCC)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Margin'' (SCC)', 'A surgeon is performing an excision of a 1.5 cm Squamous Cell Carcinoma on the arm.

Vitals: Normal.
Physical Examination: SCC on the arm.
Laboratory Results: None.', 64)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the standard ''Narrow'' margin for a low-risk SCC (< 2cm)?', '["1 mm","4-6 mm","1 cm","2 cm"]', 1, '4-6 mm is the standard for low-risk SCC; high-risk lesions need 6-10 mm.'),
        (v_case_id, 'If the SCC was ''High-Risk'' (e.g., >2cm or on the ear/lip), what is the preferred method?', '["WLE with 4mm margins","Mohs Micrographic Surgery","Topical 5-FU","None"]', 1, 'Mohs is preferred for all high-risk SCCs.'),
        (v_case_id, 'Does SCC carry a higher risk of ''Metastasis'' than BCC?', '["No","Yes, SCC has a small but real risk of nodal metastasis (especially on the ear/lip), while BCC almost never metastasizes","Only in the elderly","None"]', 1, 'This is a key biological difference between the two most common skin cancers.');

    ---------------------------------------------------------------------------
    -- CASE 65: The ''Target'' and the ''Wound'' (Vacuum)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Wound'' (Vacuum)', 'A patient has a large, deep pressure ulcer that has been debrided. The surgeon starts Negative Pressure Wound Therapy (NPWT/Wound Vac).

Vitals: Normal.
Physical Examination: Deep, clean wound bed.
Laboratory Results: None.', 65)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary mechanism by which NPWT promotes healing?', '["It dries the wound","By removing fluid/exudate, increasing blood flow, and providing ''macro-strain'' which stimulates granulation tissue","It adds bacteria","None"]', 1, 'The mechanical force of the vacuum promotes cell proliferation.'),
        (v_case_id, 'Is NPWT contraindicated in a wound with untreated ''Osteomyelitis''?', '["No","Yes, it should not be used until the underlying infection is addressed","Only in the elderly","None"]', 1, 'Sealing an infection under negative pressure can lead to worsening sepsis.'),
        (v_case_id, 'What is another major contraindication for Wound Vac?', '["Necrotic tissue (eschar), malignancy in the wound, or exposed vital structures (vessels/nerves)","Clean tissue","Age < 20","None"]', 0, 'Debridement must precede NPWT; exposed vessels can rupture under the pressure.');

    ---------------------------------------------------------------------------
    -- CASE 66: The ''Itch'' and the ''Suture'' (Infection)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Suture'' (Infection)', 'One week after an excision, the patient has red ''streaks'' coming from the wound.

Vitals: T 38.5 C.
Physical Examination: Erythema and lymphangitic streaking (red lines) extending proximally from the surgical site.
Laboratory Results: None.', 66)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Lymphangitic streaking'' indicate?', '["Normal healing","Spread of infection (usually Group A Streptococcus) along the lymphatic channels","Allergy to sutures","None"]', 1, 'This is a sign of a spreading infection that requires systemic antibiotics.'),
        (v_case_id, 'Which organism is most commonly associated with rapid, streaking lymphangitis?', '["S. aureus","Group A Streptococcus (S. pyogenes)","Pseudomonas","None"]', 1, 'Streptococcus is famous for its rapid, spreading nature.'),
        (v_case_id, 'What is the management?', '["Topical steroids","Immediate systemic antibiotics and monitoring for sepsis","Ice only","None"]', 1, 'Prompt treatment prevents systemic dissemination.');

    ---------------------------------------------------------------------------
    -- CASE 67: The ''Pearly'' Bump and the ''Mohs'' (Wait)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Mohs'' (Wait)', 'A patient is undergoing Mohs for a BCC on the ear. The first ''layer'' is positive for tumor.

Vitals: Normal.
Physical Examination: Defect on the ear.
Laboratory Results: Positive margin on first layer.', 67)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the Mohs surgeon do next after a ''Positive'' layer?', '["Give up and use radiation","Take another targeted ''layer'' only in the specific area where the tumor remains","Excise 1cm more everywhere","None"]', 1, 'This targeted approach is what makes Mohs so tissue-sparing.'),
        (v_case_id, 'How is the tumor ''mapped''?', '["By memory","By creating a precise map of the specimen and the surgical site, using ink and landmarks to match the two","Using a GPS","None"]', 1, 'The ''Mohs map'' is the key to accuracy.'),
        (v_case_id, 'What is the typical ''turnaround'' time for a single Mohs layer?', '["1 minute","20-60 minutes (while the tissue is frozen, cut, stained, and read)","1 day","None"]', 1, 'Patients spend most of the day waiting for results.');

    ---------------------------------------------------------------------------
    -- CASE 68: The ''Target'' and the ''Burn'' (Nutrition)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Burn'' (Nutrition)', 'A patient with 40% BSA burns is being managed in the ICU.

Vitals: Tachycardic.
Physical Examination: Extensive burns.
Laboratory Results: High urea.', 68)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What happens to the ''Metabolic Rate'' in a patient with large burns?', '["It decreases","It increases dramatically (Hypermetabolic state) to support healing and maintain body temperature","No change","None"]', 1, 'Large burns lead to one of the highest metabolic demands in medicine.'),
        (v_case_id, 'What is the preferred route of nutritional support if the GI tract is functioning?', '["Parenteral (IV)","Enteral (tube feeding) started as early as possible","Wait for the patient to eat","None"]', 1, 'Enteral nutrition helps maintain the GI barrier and is safer than TPN.'),
        (v_case_id, 'Why do burn patients lose so much ''Heat''?', '["They are thin","Loss of the skin''s barrier function leads to massive evaporative heat loss","The hospital is cold","None"]', 1, 'The ICU room is often kept very warm to compensate.');

    ---------------------------------------------------------------------------
    -- CASE 69: The ''Bite'' and the ''Snake'' (Decision)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Bite'' and the ''Snake'' (Decision)', 'A patient was bitten by a ''rattlesnake'' 1 hour ago.

Vitals: HR 120, BP 100/60.
Physical Examination: Two fang marks with rapid swelling, ecchymosis, and pain.
Laboratory Results: Low platelets.', 69)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial Management'' for a venomous snake bite?', '["Sucking out the venom","Applying a tourniquet","Immobilizing the limb at the level of the heart and rapid transport for potential Antivenin (CroFab)","Cutting the wound"]', 2, 'Tourniquets and suction are harmful; stabilization and antivenin are key.'),
        (v_case_id, 'What is a major clinical indication for giving CroFab?', '["If the snake was big","Rapidly progressive local swelling, systemic symptoms, or hematologic abnormalities (e.g., low platelets/fibrinogen)","Any bite, even if dry","None"]', 1, 'Not all bites require antivenin (some are ''dry'' bites).'),
        (v_case_id, 'What is the most common lab abnormality in pit viper (Crotalid) envenomation?', '["High glucose","Coagulopathy and Thrombocytopenia","High potassium","None"]', 1, 'Venom often contains toxins that consume clotting factors.');

    ---------------------------------------------------------------------------
    -- CASE 70: The ''Itch'' and the ''Biopsy'' (Immunofluorescence)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Biopsy'' (Immunofluorescence)', 'A patient has a suspected Bullous Pemphigoid.

Vitals: Normal.
Physical Examination: Large, tense blisters.
Laboratory Results: None.', 70)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'In which ''Medium'' should a biopsy specimen for DIF be transported?', '["Formalin","Michel''s Medium (or Zeus medium) to preserve the immune complexes","Sterile saline","None"]', 1, 'Formalin destroys the proteins needed for fluorescence.'),
        (v_case_id, 'What does DIF detect in Bullous Pemphigoid?', '["Bacteria","Linear IgG and C3 deposition along the basement membrane zone","Fungus","None"]', 1, 'This is the diagnostic gold standard.'),
        (v_case_id, 'Where should the biopsy for DIF be taken from in a patient with blisters?', '["Directly through a blister","Normal-appearing, perilesional skin","The palm of the hand","None"]', 1, 'Blistered skin has lost the architecture needed to see the patterns clearly.');

    ---------------------------------------------------------------------------
    -- CASE 71: The ''Pearly'' Bump and the ''Excision'' (Heel)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Excision'' (Heel)', 'A patient needs an excision on the ''heel''.

Vitals: Normal.
Physical Examination: BCC on the heel.
Laboratory Results: None.', 71)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary surgical challenge on the heel and sole?', '["Too much hair","Lack of skin laxity and high tension, making primary closure difficult and increasing the risk of wound dehiscence","It''s too dark","None"]', 1, 'The skin on the sole is thick and tightly bound to the fascia.'),
        (v_case_id, 'What is a common closure alternative if primary closure is not possible on the heel?', '["Leave it open (Secondary Intention) or use a Full-Thickness Skin Graft","Stretching the skin with a machine","None","Amputation"]', 0, 'Secondary intention is often preferred on the sole as it results in a tough, functional scar.'),
        (v_case_id, 'Should the patient be ''Non-weight bearing'' after a heel surgery?', '["No","Yes, usually for 1-2 weeks to prevent tension-induced wound opening","Only for 1 day","None"]', 1, 'Physical rest is a critical part of the surgical plan.');

    ---------------------------------------------------------------------------
    -- CASE 72: The ''Target'' and the ''Burn'' (Depth)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Burn'' (Depth)', 'A patient has a burn that is ''dry, white, and leathery''. He feels ''nothing'' when the area is poked with a needle.

Vitals: Normal.
Physical Examination: White, charred-looking skin; insensate to pain.
Laboratory Results: None.', 72)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classification of an insensate, leathery burn?', '["First-degree","Second-degree (Partial-thickness)","Third-degree (Full-thickness)","None"]', 2, 'Full-thickness burns destroy the nerves, making them painless.'),
        (v_case_id, 'Will this burn heal on its own without surgery?', '["Yes, after 1 week","No, it will only heal from the edges (very slowly) and requires skin grafting for closure","Only in children","None"]', 1, 'Spontaneous healing is impossible because all epidermal structures are destroyed.'),
        (v_case_id, 'What is the ''Fourth-Degree'' burn?', '["A very bad sunburn","A burn that extends into deeper structures like muscle or bone","A chemical burn","None"]', 1, 'These often require flap reconstruction or amputation.');

    ---------------------------------------------------------------------------
    -- CASE 73: The ''Itch'' and the ''Biopsy'' (Melanoma)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Biopsy'' (Melanoma)', 'A patient has a 2-cm suspicious mole on the back. The surgeon is deciding between a 4-mm punch and a full excision.

Vitals: Normal.
Physical Examination: Large atypical nevus.
Laboratory Results: None.', 73)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is a ''Punch'' biopsy often suboptimal for a large suspicious mole?', '["It hurts more","Sampling error: it may miss the thickest part of the melanoma, leading to under-staging","It takes too long","None"]', 1, 'A small punch only samples a tiny fraction of the lesion''s area.'),
        (v_case_id, 'When is a ''Punch'' biopsy acceptable for a pigmented lesion?', '["Never","Only if the lesion is very large (e.g., a large facial freckle) where a full excision would be disfiguring, to get a ''representative'' sample","For all moles","None"]', 1, 'Incisionals are a last resort for large facial lesions.'),
        (v_case_id, 'If an incisional (punch) biopsy shows melanoma, what is the ''Definitive'' treatment?', '["None","Wide Local Excision of the entire site with appropriate margins","Radiation","None"]', 1, 'Complete removal is the only definitive treatment.');

    ---------------------------------------------------------------------------
    -- CASE 74: The ''Bite'' and the ''Tick'' (Surgery)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Bite'' and the ''Tick'' (Surgery)', 'A patient has a ''tick'' embedded in their skin for 2 days.

Vitals: Normal.
Physical Examination: Tick attached to the scalp.
Laboratory Results: None.', 74)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best ''Surgical'' way to remove a tick?', '["Burning it with a match","Covering it with nail polish","Grasping it close to the skin with tweezers and pulling upward with steady, even pressure","Cutting it out"]', 2, 'Simple mechanical removal is best; avoid ''irritating'' the tick as it may regurgitate pathogens.'),
        (v_case_id, 'What should you do if the ''Head'' (mouthparts) breaks off in the skin?', '["Emergency surgery","Leave it alone and let the skin heal; the head itself does not transmit disease once the body is gone","Dig it out with a needle","None"]', 1, 'Trying to dig it out often causes more trauma than leaving it.'),
        (v_case_id, 'Prophylaxis for Lyme disease (single dose Doxycycline) is indicated if the tick was attached for how long?', '["Any time","At least 36 hours","1 week","None"]', 1, 'It takes significant time for the bacteria to travel from the tick''s gut to the human.');

    ---------------------------------------------------------------------------
    -- CASE 75: The ''Pearly'' Bump and the ''Mohs'' (Nail)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Mohs'' (Nail)', 'A patient has an SCC of the nail bed.

Vitals: Normal.
Physical Examination: Destruction of the nail plate with a subungual growth.
Laboratory Results: SCC.', 75)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Can Mohs surgery be used for nail cancers to avoid amputation?', '["No","Yes, Mohs can sometimes salvage the digit by providing margin control while sparing bone","Only for BCC","None"]', 1, 'Digit-sparing surgery is a major benefit of the Mohs technique.'),
        (v_case_id, 'What is the primary indicator that ''Amputation'' is necessary?', '["The patient is old","Invasion of the tumor into the bone (phalanx)","The nail is ugly","None"]', 1, 'Bone involvement usually precludes a Mohs approach.'),
        (v_case_id, 'SCC of the nail is often associated with which virus?', '["HIV","Human Papillomavirus (HPV) - especially high-risk types","Flu","None"]', 1, 'Subungual SCC is a classic location for HPV-induced malignancy.');

    ---------------------------------------------------------------------------
    -- CASE 76: The ''Target'' and the ''Debridement'' (Biofilm)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Debridement'' (Biofilm)', 'A chronic wound is ''slimy'' and fails to heal despite proper care.

Vitals: Normal.
Physical Examination: A thin, shiny film over the wound bed.
Laboratory Results: None.', 76)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a ''Biofilm'' in a chronic wound?', '["A piece of plastic","A complex community of bacteria protected by a self-produced matrix, which is highly resistant to antibiotics","Normal skin","None"]', 1, 'Biofilms are a major cause of wound chronicity.'),
        (v_case_id, 'What is the most effective way to disrupt a biofilm?', '["Oral antibiotics only","Regular surgical (sharp) debridement to physically break up the matrix","Wait and see","None"]', 1, 'Physical disruption is the only way to expose the bacteria to the immune system and topicals.'),
        (v_case_id, 'Does ''Honey'' have a role in biofilm management?', '["No","Yes, medical-grade honey (e.g., Manuka) has antimicrobial properties that can help prevent and treat biofilms","Only for eating","None"]', 1, 'Medical honey is an approved wound-care adjunct.');

    ---------------------------------------------------------------------------
    -- CASE 77: The ''Itch'' and the ''Suture'' (Reaction)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Suture'' (Reaction)', 'Two weeks after an excision with dissolvable stitches, the patient has several ''red bumps'' along the scar.

Vitals: Normal.
Physical Examination: Small, firm papules directly over the suture line. No fever or pus.
Laboratory Results: None.', 77)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a ''Suture Granuloma''?', '["A cancer","A foreign body reaction to the suture material (often ''spitting'' out through the skin)","An infection","None"]', 1, 'The body attempts to extrude the ''foreign'' suture.'),
        (v_case_id, 'What is the management?', '["IV Antibiotics","Removal of the offending suture material and reassurance","More stitches","None"]', 1, 'Once the material is gone, the reaction resolves.'),
        (v_case_id, 'Is this more common with ''Monofilament'' or ''Braided'' sutures?', '["Monofilament","Braided (like silk or Vicryl) which has more surface area for the body to react to","They are the same","None"]', 1, 'Braided materials generally provoke more tissue reaction.');

    ---------------------------------------------------------------------------
    -- CASE 78: The ''Pearly'' Bump and the ''Flap'' (Safety)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Flap'' (Safety)', 'A surgeon is performing a flap on the forehead of an 80-year-old smoker with heart disease.

Vitals: BP 160/90.
Physical Examination: Poor skin quality.
Laboratory Results: None.', 78)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does smoking affect surgical wound healing?', '["No effect","It causes vasoconstriction and high carbon monoxide levels, leading to tissue hypoxia and high rates of flap necrosis/wound breakdown","It makes it faster","None"]', 1, 'Nicotine is a potent vasoconstrictor.'),
        (v_case_id, 'How many weeks of ''Smoking Cessation'' are generally recommended before a major elective flap surgery?', '["1 day","At least 4 weeks","1 year","None"]', 1, 'This allows for significant recovery of tissue oxygenation.'),
        (v_case_id, 'What is the most likely complication in this specific patient?', '["Infection","Distal flap necrosis (the ''tip'' dies)","Cancer recurrence","None"]', 1, 'The combination of old age, heart disease, and smoking is a ''perfect storm'' for poor perfusion.');

    ---------------------------------------------------------------------------
    -- CASE 79: The ''Target'' and the ''Burn'' (Chemical)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Burn'' (Chemical)', 'A worker is splashed with ''Hydrofluoric Acid'' at a factory.

Vitals: Normal.
Physical Examination: Redness on the hand that is ''incredibly painful'' out of proportion to appearance.
Laboratory Results: None.', 79)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the specific ''Antidote'' for HF acid burns?', '["Water only","Calcium Gluconate (gel or injection) to neutralize the fluoride ions","Vinegar","None"]', 1, 'Fluoride ions leach calcium from bones and nerves, causing deep, excruciating pain.'),
        (v_case_id, 'Why is irrigation alone insufficient for HF acid?', '["It is","The fluoride ion continues to penetrate deep into the tissues even after the surface acid is washed off","Water makes it explode","None"]', 1, 'Chemical neutralization is mandatory.'),
        (v_case_id, 'Which life-threatening electrolyte abnormality can occur with large HF burns?', '["Hypercalcemia","Hypocalcemia and Hyperkalemia (which can cause fatal arrhythmias)","No effect","None"]', 1, 'The fluoride ''eats'' the body''s calcium, leading to systemic depletion.');

    ---------------------------------------------------------------------------
    -- CASE 80: The ''Itch'' and the ''Biopsy'' (Final Review)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Biopsy'' (Final Review)', 'A final question on surgical-medical integration.

Vitals: Normal.
Physical Examination: Patient is ready.
Laboratory Results: None.', 80)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'If a lesion is clinically diagnostic of a benign condition (e.g., a classic skin tag), is a biopsy mandatory?', '["Yes, for everyone","No, clinical diagnosis is sufficient unless the lesion is atypical, bothersome, or the patient requests removal","Only if it is red","None"]', 1, 'Cost-effective care avoids unnecessary procedures.'),
        (v_case_id, 'What is the most important rule of ''Surgical Safety''?', '["Work fast","Verify the patient, the procedure, and the EXACT surgical site (Time-out) before starting","Use the sharpest blade","None"]', 1, 'Wrong-site surgery is a ''never event'' that is prevented by strict protocols.'),
        (v_case_id, 'Which ''Surgical'' technique is both diagnostic and potentially therapeutic?', '["Punch biopsy","Excisional biopsy","Needle aspiration","None"]', 1, 'Excisional biopsy removes the whole lesion while providing a specimen for diagnosis.');

    RAISE NOTICE 'Finished populating 80 cases for case-surgical-medical.';
END $$;

COMMIT;
-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Clinical Case Integration (Step 2 CK)
-- Topic: Interpretation of labs, imaging, biopsies in context
-- Topic Slug: case-labs-imaging
-- Sourced: UWorld, Step-Up to Medicine, MTB Step 2, First Aid Step 2 CK

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-labs-imaging' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'case-labs-imaging';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 80-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: The Glow of the Inner Thigh
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Glow of the Inner Thigh', 'A 40-year-old obese male presents with a macerated, red rash in his groin that doesn''t itch much but is slightly painful.

Vitals: Normal.
Physical Examination: Well-demarcated, reddish-brown patches in the bilateral inguinal folds. No satellite lesions are seen.
Laboratory Results: Wood''''s lamp examination shows ''coral-red'' fluorescence.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative organism for this patient''s condition?', '["Trichophyton rubrum","Corynebacterium minutissimum","Candida albicans","None"]', 1, 'Erythrasma is caused by Corynebacterium minutissimum, which produces porphyrins that fluoresce coral-red.'),
        (v_case_id, 'How would the Wood''s lamp fluorescence differ if this were Tinea Cruris (Jock Itch)?', '["It would be bright green","It would show no fluorescence (usually)","It would be blue","None"]', 1, 'Most common dermatophytes causing jock itch do not fluoresce.'),
        (v_case_id, 'What is the best initial treatment for localized erythrasma?', '["Topical antifungal","Topical antibiotics (e.g., Clindamycin or Erythromycin) or antibacterial washes","Oral steroids","None"]', 1, 'Since it is bacterial, antibiotics are the treatment of choice.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Multinucleated Giant Cell
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Multinucleated Giant Cell', 'A 25-year-old female presents with a cluster of painful vesicles on her lip. The physician performs a ''Tzanck smear'' in the clinic.

Vitals: Normal.
Physical Examination: Grouped vesicles on an erythematous base.
Laboratory Results: Tzanck smear shows ''multinucleated giant cells'' and ''acantholytic'' keratinocytes.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'A positive Tzanck smear (multinucleated giant cells) is seen in which of the following infections?', '["HSV-1 and HSV-2 only","VZV (Chickenpox/Shingles) only","Both HSV and VZV","Human Papillomavirus (HPV)"]', 2, 'The Tzanck smear identifies viral cytopathic effects common to the Herpesviridae family.'),
        (v_case_id, 'Can the Tzanck smear distinguish between HSV and VZV?', '["Yes","No, it only indicates a herpesvirus infection; Viral culture, PCR, or DFA is needed for typing","Only in children","None"]', 1, 'Typing requires more specific molecular or culture methods.'),
        (v_case_id, 'What is the most sensitive and specific modern test for confirming HSV?', '["Tzanck smear","Viral culture","PCR (Polymerase Chain Reaction)","Wood''s lamp"]', 2, 'PCR is now the preferred test due to its high sensitivity.');

    ---------------------------------------------------------------------------
    -- CASE 03: The ''Spaghetti and Meatballs''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Spaghetti and Meatballs''', 'A patient presents with white, non-tanning spots on his back after a vacation in Hawaii.

Vitals: Normal.
Physical Examination: Multiple hypo- and hyper-pigmented finely scaly macules.
Laboratory Results: KOH prep shows ''short hyphae and round spores''.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The ''spaghetti and meatballs'' appearance on KOH prep is pathognomonic for which condition?', '["Tinea Corporis","Tinea Versicolor (Pityriasis versicolor)","Candidiasis","None"]', 1, 'This refers to the short hyphae (spaghetti) and spores (meatballs) of Malassezia furfur.'),
        (v_case_id, 'What is the characteristic Wood''s lamp fluorescence for Tinea Versicolor?', '["Bright green","Yellow-orange or copper-orange","Pink","None"]', 1, 'Malassezia produces metabolites that glow yellow-orange under Wood''s lamp.'),
        (v_case_id, 'What is the best initial topical treatment for this patient?', '["Topical steroids","Selenium sulfide or Ketoconazole shampoo/cream","Topical antibiotics","None"]', 1, 'Anti-seborrheic/anti-fungal agents are effective against Malassezia.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Mite and the Burrow
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mite and the Burrow', 'A 20-year-old student has intense itching between his fingers that is worse at night.

Vitals: Normal.
Physical Examination: Small linear ridges (burrows) and excoriated papules in the finger webs.
Laboratory Results: Skin scraping with mineral oil shows an adult mite and several oval eggs.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Where is the ''Best'' place to scrape for a scabies diagnosis?', '["A red papule","A non-excoriated burrow","Normal skin","The center of the chest"]', 1, 'Mites, eggs, and feces (scybala) are most concentrated within the burrows.'),
        (v_case_id, 'What is the name of the mite that causes scabies?', '["Demodex folliculorum","Sarcoptes scabiei","Pediculus humanus","None"]', 1, 'Sarcoptes scabiei var. hominis is the human itch mite.'),
        (v_case_id, 'If the scraping is negative, but the clinical suspicion is high, should you still treat?', '["No, wait for a positive test","Yes, scabies scrapings have low sensitivity; a clinical diagnosis is often sufficient for treatment","Only if the patient has a fever","None"]', 1, 'Failure to find the mite is common and does not rule out the diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 05: The ''Stuck-On'' Network
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Stuck-On'' Network', 'A physician is examining a dark brown, warty lesion on a patient''s back using a dermatoscope.

Vitals: Normal.
Physical Examination: 1-cm brown, ''stuck-on'' plaque.
Laboratory Results: Dermoscopy shows ''milky-white cysts'' (pseudo-horn cysts) and ''comedo-like openings''.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'These dermoscopic features (horn cysts, comedo-like openings) are highly suggestive of:', '["Melanoma","Seborrheic Keratosis","BCC","None"]', 1, 'Pseudo-horn cysts are a hallmark of benign seborrheic keratoses.'),
        (v_case_id, 'Dermoscopy is primarily used to distinguish between:', '["Infection and allergy","Melanocytic vs. non-melanocytic lesions and benign vs. malignant tumors","Dry vs. oily skin","None"]', 1, 'It allows for visualization of subsurface structures not visible to the naked eye.'),
        (v_case_id, 'A ''pigment network'' seen on dermoscopy is a feature of:', '["BCC","Melanocytic lesions (moles/melanomas)","Warts","None"]', 1, 'The network represents the rete ridges of the epidermis containing melanin.');

    ---------------------------------------------------------------------------
    -- CASE 06: The ''Leaf-Like'' Border
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Leaf-Like'' Border', 'A 60-year-old male has a suspicious translucent bump on his cheek. The physician uses dermoscopy.

Vitals: Normal.
Physical Examination: Pearly papule with telangiectasias.
Laboratory Results: Dermoscopy shows ''arborizing telangiectasias'' and ''leaf-like areas'' at the periphery.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The presence of ''arborizing (tree-like) telangiectasias'' is a classic dermoscopic clue for:', '["SCC","BCC","Melanoma","Psoriasis"]', 1, 'These large, distinct, branching vessels are very common in nodular BCC.'),
        (v_case_id, 'What do ''leaf-like areas'' represent on dermoscopy?', '["Hairs","Basaloid tumor nests at the periphery","Fungus","None"]', 1, 'They are another high-yield dermoscopic feature of BCC.'),
        (v_case_id, 'Is a ''pigment network'' typically seen in BCC?', '["Yes","No, BCC is a non-melanocytic tumor (though pigmented variants exist, they show globule-like structures rather than a network)","Only in children","None"]', 1, 'The absence of a network helps distinguish BCC from a melanocytic nevus.');

    ---------------------------------------------------------------------------
    -- CASE 07: The ABCD and the E
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ABCD and the E', 'A patient is concerned about a changing mole on her arm.

Vitals: Normal.
Physical Examination: A 7-mm mole with irregular borders and two shades of brown.
Laboratory Results: None.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''D'' stand for in the melanoma ABCD criteria?', '["Depth","Diameter (> 6 mm)","Dermal involvement","None"]', 1, 'Asymmetry, Border, Color, Diameter (>6mm), and Evolving are the classic keys.'),
        (v_case_id, 'Which of the ABCD criteria is often considered the MOST important for early detection?', '["Asymmetry","Border","Evolving (changing over time)","Diameter"]', 2, 'Change is the most sensitive indicator of malignancy.'),
        (v_case_id, 'What is the ''Ugly Duckling'' sign?', '["A very pretty mole","A mole that looks significantly different from all the other moles on that specific patient","A mole on the neck","None"]', 1, 'Most people have a ''signature'' mole pattern; the one that doesn''t fit is suspicious.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Scalp Glow
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scalp Glow', 'A 6-year-old child has a patch of hair loss with ''black dots'' and scale.

Vitals: Normal.
Physical Examination: Alopecia with broken hairs.
Laboratory Results: Wood''''s lamp examination shows ''bright yellow-green'' fluorescence along the hair shafts.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which organism is the most likely cause of yellow-green fluorescence in Tinea Capitis?', '["Trichophyton tonsurans","Microsporum canis or Microsporum audouinii","Candida","None"]', 1, 'Microsporum species classically fluoresce; the most common US cause (T. tonsurans) does NOT fluoresce.'),
        (v_case_id, 'If the Wood''s lamp is negative, can you rule out Tinea Capitis?', '["Yes","No, because the most common cause (T. tonsurans) is ''non-fluorescent''","Only in adults","None"]', 1, 'A negative Wood''s lamp does not rule out fungal infection.'),
        (v_case_id, 'What is the ''Gold Standard'' test for confirming Tinea Capitis?', '["Wood''s lamp","Fungal culture of the hair and scale","Tzanck smear","None"]', 1, 'Culture remains the definitive diagnostic test.');

    ---------------------------------------------------------------------------
    -- CASE 09: The ''Linear'' Deposit
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Linear'' Deposit', 'A 50-year-old presents with tense blisters on his shins. A biopsy is taken for Direct Immunofluorescence (DIF).

Vitals: Normal.
Physical Examination: Tense bullae.
Laboratory Results: DIF shows ''Linear IgG and C3'' along the basement membrane zone.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Linear IgG/C3 along the BMZ is the hallmark of which condition?', '["Pemphigus Vulgaris","Bullous Pemphigoid","Lupus","None"]', 1, 'Autoantibodies target the hemidesmosomes (BP180/BP230) in the basement membrane.'),
        (v_case_id, 'How would the DIF pattern differ in Pemphigus Vulgaris?', '["It would be the same","It would show ''Net-like'' or ''Chicken-wire'' (intercellular) IgG deposition in the epidermis","It would be negative","None"]', 1, 'Pemphigus targets the desmosomes between keratinocytes.'),
        (v_case_id, 'Salt-split skin testing is used to distinguish BP from which other condition?', '["Pemphigus","Epidermolysis Bullosa Acquisita (EBA)","Acne","None"]', 1, 'In BP, the antibodies stay on the ''roof'' (epidermal side); in EBA, they stay on the ''floor'' (dermal side).');

    ---------------------------------------------------------------------------
    -- CASE 10: The ''Psoriasiform'' Pattern
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasiform'' Pattern', 'A pathology report for a red, scaly plaque mentions ''regular acanthosis, parakeratosis, and neutrophilic microabscesses''.

Vitals: Normal.
Physical Examination: Silver scaly plaques on the elbows.
Laboratory Results: Biopsy report received.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are the ''Munro microabscesses'' mentioned in the report?', '["Pockets of bacteria","Collections of neutrophils within the stratum corneum","Fungal colonies","None"]', 1, 'Neutrophilic migration into the epidermis is a key feature of psoriasis.'),
        (v_case_id, 'What does ''Acanthosis'' mean in a pathology report?', '["Skin thinning","Thickening of the epidermis (specifically the stratum spinosum)","Skin cancer","None"]', 1, 'Regular, ''test-tube'' like acanthosis is classic for psoriasis.'),
        (v_case_id, 'What happens to the ''Granular Layer'' in psoriasis?', '["It gets thicker","It is absent or significantly thinned (hypogranulosis)","It turns blue","None"]', 1, 'The rapid turnover in psoriasis prevents the formation of a normal granular layer.');

    ---------------------------------------------------------------------------
    -- CASE 11: The ''Interface'' Dermatitis
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Interface'' Dermatitis', 'A patient with a purple, flat-topped rash on his wrist has a biopsy. The report mentions ''interface dermatitis'' and ''Civatte bodies''.

Vitals: Normal.
Physical Examination: Purple, polygonal, planar, pruritic papules (Lichen Planus).
Laboratory Results: Biopsy shows a ''saw-tooth'' rete ridge pattern.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Interface Dermatitis'' describe?', '["Infection","Inflammation/damage localized to the dermal-epidermal junction","A rash on the hands","None"]', 1, 'The ''interface'' is where the epidermis and dermis meet.'),
        (v_case_id, 'What are ''Civatte bodies'' (also called cytoid or colloid bodies)?', '["Bacteria","Apoptotic (dead) keratinocytes","Fungal spores","None"]', 1, 'They are the remnants of keratinocytes damaged by the inflammation.'),
        (v_case_id, 'Which other ''Step'' condition classically shows an interface dermatitis pattern?', '["Lupus Erythematosus","Psoriasis","Acne","None"]', 0, 'Lupus, Lichen Planus, and Erythema Multiforme are the ''big three'' for interface patterns.');

    ---------------------------------------------------------------------------
    -- CASE 12: The ''Wood'' and the ''Ash Leaf''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Wood'' and the ''Ash Leaf''', 'A child with several ''white spots'' on his trunk and a history of seizures is examined with a Wood''''s lamp.

Vitals: Normal.
Physical Examination: Hypopigmented, leaf-shaped macules.
Laboratory Results: Wood''''s lamp makes the spots appear ''bright blue-white''.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is the Wood''s lamp helpful in diagnosing ''Ash-leaf spots'' in fair-skinned children?', '["It turns them red","It enhances the contrast between the hypopigmented spots and normal skin, making them easier to see","It cures the spots","None"]', 1, 'Hypopigmented lesions are often invisible in bright light on fair skin.'),
        (v_case_id, 'What is the ''bright blue-white'' fluorescence in Vitiligo due to?', '["A fungus","The total absence of melanin, which allows for increased reflection and autofluorescence of dermal collagen","A pigment","None"]', 1, 'Wood''s lamp helps distinguish between hypopigmentation (low melanin) and depigmentation (no melanin).'),
        (v_case_id, 'Which other cutaneous sign of Tuberous Sclerosis is typically found on the face?', '["Acne","Angiofibromas (historically called adenoma sebaceum)","Warts","None"]', 1, 'These small, red-to-pink papules are a hallmark of TS.');

    ---------------------------------------------------------------------------
    -- CASE 13: The ''Pearly'' Bump and the ''Palisading''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Palisading''', 'A pathology report for a pearly bump on the face describes ''islands of basaloid cells with peripheral palisading and clefting''.

Vitals: Normal.
Physical Examination: Classic BCC.
Laboratory Results: Histology confirms the diagnosis.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Peripheral Palisading'' describe?', '["Tumor cells arranged in a circle","The outermost layer of tumor cells arranged vertically, like a ''picket fence''","Cells in a line","None"]', 1, 'This is a characteristic architectural feature of BCC.'),
        (v_case_id, 'What is the ''Clefting'' (retraction artifact) seen in BCC histology?', '["A tear in the skin","A space between the tumor nests and the surrounding stroma, often due to tissue processing","A hole in the cell","None"]', 1, 'The ''shrinkage'' away from the stroma is very common in BCC specimens.'),
        (v_case_id, 'Which type of BCC is the most aggressive and likely to recur?', '["Nodular","Superficial","Morpheaform (Sclerosing) or Infiltrative","None"]', 2, 'Infiltrative patterns have ''roots'' that are hard to see clinically.');

    ---------------------------------------------------------------------------
    -- CASE 14: The ''Blue-White'' Veil
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Blue-White'' Veil', 'A dermatologist is examining a dark, irregular mole on a patient''''s leg using dermoscopy.

Vitals: Normal.
Physical Examination: Atypical mole.
Laboratory Results: Dermoscopy shows a ''blue-white veil'' and ''atypical network''.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''Blue-White Veil'' represent on dermoscopy?', '["Fungus","A sign of deep (dermal) melanin and orthokeratosis, often seen in invasive melanoma","Skin oil","None"]', 1, 'This is a high-risk feature for melanoma.'),
        (v_case_id, 'What are ''Chrysalis structures'' (also called shiny white streaks)?', '["Worms","Shiny white lines seen only with polarized dermoscopy, representing altered dermal collagen (common in BCC and Melanoma)","Soap residue","None"]', 1, 'These are a marker of invasive growth and collagen remodeling.'),
        (v_case_id, 'An ''asymmetric'' distribution of structures is characteristic of:', '["Benign moles","Malignant melanoma","Normal skin","None"]', 1, 'Malignancy is characterized by architectural chaos.');

    ---------------------------------------------------------------------------
    -- CASE 15: The ''Target'' and the ''PAS'' Stain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''PAS'' Stain', 'A pathology report for a suspected fungal infection on the foot says ''PAS stain is positive for fungal hyphae in the stratum corneum''.

Vitals: Normal.
Physical Examination: Scaly foot.
Laboratory Results: PAS stain performed.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''PAS'' (Periodic Acid-Schiff) stain highlight?', '["Bacteria","Carbohydrates (specifically the glycogen in fungal cell walls), turning them bright magenta/red","Iron","None"]', 1, 'PAS is the standard stain for detecting dermatophytes in skin and nails.'),
        (v_case_id, 'Which other stain is commonly used to find fungi, turning them black?', '["Gram stain","GMS (Gomori Methenamine Silver)","H&E","None"]', 1, 'GMS provides excellent contrast for identifying fungal morphology.'),
        (v_case_id, 'Is PAS helpful for identifying ''Pityriasis Versicolor''?', '["No","Yes, it highlights the Malassezia organisms very clearly","Only in the sun","None"]', 1, 'While KOH is faster, PAS is very sensitive for Malassezia.');

    ---------------------------------------------------------------------------
    -- CASE 16: The ''Itch'' and the ''Patch'' Test
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Patch'' Test', 'A patient with chronic hand dermatitis undergoes ''Patch testing''.

Vitals: Normal.
Physical Examination: Red, scaly, cracked hands.
Laboratory Results: Patch test is read at 48 and 96 hours. A positive result is seen for Nickel.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What type of hypersensitivity reaction is being tested in ''Patch Testing''?', '["Type I (IgE-mediated)","Type IV (Delayed-type, T-cell mediated)","Type II","None"]', 1, 'Contact allergy is a T-cell mediated process, which is why the test is read days later.'),
        (v_case_id, 'How does this differ from ''Skin Prick'' testing?', '["Prick testing is for Type IV","Prick testing is for Type I (e.g., pollen, food, hives) and is read within 15-20 minutes","They are the same","None"]', 1, 'The timing and mechanism are completely different.'),
        (v_case_id, 'Can you perform a patch test while a patient is on high-dose oral Prednisone?', '["Yes","No, systemic steroids can suppress the T-cell response and lead to false-negative results","Only in adults","None"]', 1, 'Patients must be off or on very low-dose steroids for accurate testing.');

    ---------------------------------------------------------------------------
    -- CASE 17: The ''Pearly'' Bump and the ''Granuloma''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Granuloma''', 'A biopsy of a red bump on the arm shows ''naked, non-caseating granulomas''.

Vitals: Normal.
Physical Examination: Red/brown papules on the skin and a history of a dry cough.
Laboratory Results: ACE (Angiotensin-Converting Enzyme) level is elevated.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Naked'' granuloma mean in the context of Sarcoidosis?', '["It''s visible to the eye","Granulomas with a minimal surrounding ''rim'' of lymphocytes","It has no skin over it","None"]', 1, 'The lack of a significant inflammatory cuff is characteristic of sarcoid granulomas.'),
        (v_case_id, 'What is a ''Caseating'' granuloma characteristic of?', '["Sarcoidosis","Tuberculosis (TB)","Fungus","All of the above"]', 1, 'Caseation (cheese-like necrosis) is the hallmark of TB.'),
        (v_case_id, 'Where is the most common ''non-skin'' location involved in sarcoidosis?', '["Liver","Lungs and Intrathoracic lymph nodes","Brain","None"]', 1, 'Hilar lymphadenopathy is a classic finding on Chest X-ray.');

    ---------------------------------------------------------------------------
    -- CASE 18: The ''Itch'' and the ''Prick'' Test
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Prick'' Test', 'A patient with chronic hives (urticaria) is having ''Skin Prick'' testing for food allergies.

Vitals: Normal.
Physical Examination: Hives appearing and disappearing.
Laboratory Results: A ''wheal and flare'' reaction is seen within 15 minutes to shrimp.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The ''wheal and flare'' reaction is a hallmark of which antibody-mediated response?', '["IgG","IgE","IgM","None"]', 1, 'IgE cross-linking on mast cells leads to immediate histamine release.'),
        (v_case_id, 'What is a mandatory ''Positive Control'' used during skin prick testing?', '["Water","Histamine","Salt","None"]', 1, 'Histamine must cause a wheal to ensure the patient''s skin is responsive (and they aren''t on antihistamines).'),
        (v_case_id, 'Which medication must be stopped at least 3-7 days BEFORE skin prick testing?', '["Antibiotics","Antihistamines","Vitamins","None"]', 1, 'Antihistamines will block the reaction and cause false-negatives.');

    ---------------------------------------------------------------------------
    -- CASE 19: The ''Target'' and the ''Direct'' (Pemphigus)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Direct'' (Pemphigus)', 'A patient with mouth ulcers has a biopsy taken for DIF. The report describes ''Intercellular IgG and C3 in a fish-net pattern''.

Vitals: Normal.
Physical Examination: Painful oral erosions and a positive Nikolsky sign.
Laboratory Results: Histology shows ''acantholysis'' and a ''tombstoning'' pattern.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Tombstoning'' describe on histology?', '["Dead skin","A single layer of basal keratinocytes remaining attached to the basement membrane, while the layers above have separated (acantholysis)","Pus","None"]', 1, 'This is a classic histologic description for Pemphigus Vulgaris.'),
        (v_case_id, 'Which specific protein is the target of autoantibodies in Pemphigus Vulgaris?', '["BP180","Desmoglein 3 (and sometimes 1)","Keratin 5","None"]', 1, 'Anti-desmoglein 3 is responsible for the mucosal-dominant form.'),
        (v_case_id, 'What is the Nikolsky sign?', '["A rash","The sliding away of the top layer of skin when lateral pressure is applied, indicating weak intercellular adhesion","A fever","None"]', 1, 'Nikolsky is positive in Pemphigus but negative in Bullous Pemphigoid.');

    ---------------------------------------------------------------------------
    -- CASE 20: The ''Target'' and the ''Acantholysis''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Acantholysis''', 'A pathology report mentions ''acantholytic keratinocytes'' in a patient with a blistering disease.

Vitals: Normal.
Physical Examination: Blisters.
Laboratory Results: None.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the definition of ''Acantholysis''?', '["Skin thickening","Loss of intercellular adhesion between keratinocytes, leading to ''rounded-up'' individual cells","Infection","None"]', 1, 'It is the fundamental process in Pemphigus.'),
        (v_case_id, 'Besides Pemphigus, which ''viral'' infection classically shows acantholysis on Tzanck smear/biopsy?', '["HPV","HSV/VZV","Flu","None"]', 1, 'Viral damage can also cause cells to lose adhesion and round up.'),
        (v_case_id, 'How does acantholysis differ from ''Spongiosis''?', '["They are the same","Spongiosis is intercellular EDEMA (fluid between cells), seen in eczema; acantholysis is loss of the cellular CONNECTIONS themselves","None","Spongiosis is faster"]', 1, 'Spongiosis looks like ''stretching'' of the desmosomes (the ''sponge'' look), while acantholysis is the complete breakage of those connections.');

    ---------------------------------------------------------------------------
    -- CASE 21: The '' Wood'' and the ''Porphyria''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The '' Wood'' and the ''Porphyria''', 'A patient with blisters on the back of his hands and tea-colored urine has his urine examined with a Wood''''s lamp.

Vitals: Normal.
Physical Examination: Erosions, milia, and scarring on sun-exposed hands.
Laboratory Results: Urine fluoresces ''coral-pink/orange'' under Wood''''s lamp.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The coral-pink fluorescence in the urine is due to the presence of high levels of what?', '["Sugar","Uroporphyrins","Blood","None"]', 1, 'Porphyrins are naturally fluorescent under UV light.'),
        (v_case_id, 'What is the most common underlying liver association with Porphyria Cutanea Tarda (PCT)?', '["Hepatitis B","Hepatitis C (and Chronic Alcohol use)","Fatty liver only","None"]', 1, 'Screening for Hep C is mandatory in new cases of PCT.'),
        (v_case_id, 'What is the best initial treatment for PCT?', '["Steroids","Phlebotomy or low-dose Hydroxychloroquine","Antibiotics","None"]', 1, 'Removing iron (phlebotomy) or increasing porphyrin excretion (hydroxychloroquine) is effective.');

    ---------------------------------------------------------------------------
    -- CASE 22: The ''Target'' and the ''Imaging'' (Ultrasound)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (Ultrasound)', 'A patient has a soft, mobile lump on his forehead. The doctor performs a bedside ultrasound.

Vitals: Normal.
Physical Examination: Soft subcutaneous nodule.
Laboratory Results: Ultrasound shows a ''well-circumscribed, hypoechoic mass with no internal blood flow''.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How can ultrasound help distinguish a Lipoma from a Cyst?', '["It can''t","Lipomas are typically hyperechoic/isoechoic and soft; cysts are often hypoechoic with ''posterior acoustic enhancement'' (due to fluid)","None","Cysts are red"]', 1, 'Ultrasound is excellent for characterizing the nature of subcutaneous lumps.'),
        (v_case_id, 'What does ''Posterior Acoustic Enhancement'' indicate?', '["A tumor","The presence of fluid (the ultrasound waves pass through fluid easily and look brighter behind it)","Bone","None"]', 1, 'This is a classic ultrasound finding for cysts.'),
        (v_case_id, 'Why is checking for ''internal blood flow'' (Doppler) important in a skin tumor?', '["No reason","Increased vascularity can be a sign of malignancy or an inflammatory process","It''s just for fun","None"]', 1, 'High-flow lesions require more cautious management.');

    ---------------------------------------------------------------------------
    -- CASE 23: The ''Itch'' and the ''Congo Red''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Congo Red''', 'A pathology report for a waxy, translucent papule on the eyelid mentions ''apple-green birefringence under polarized light after Congo Red staining''.

Vitals: Normal.
Physical Examination: Waxy papules around the eyes (Pinch purpura is also noted).
Laboratory Results: Biopsy results received.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Apple-green birefringence with Congo Red stain is pathognomonic for:', '["Collagen","Amyloid","Fungus","None"]', 1, 'This is a classic ''Step'' board association for amyloid proteins.'),
        (v_case_id, 'What is ''Pinch Purpura'' in the context of Systemic Amyloidosis?', '["A bug bite","Easy bruising (ecchymosis) of the skin after minor trauma/pinching, especially around the eyes","A rash","None"]', 1, 'Amyloid infiltration of blood vessel walls makes them extremely fragile.'),
        (v_case_id, 'Which organ system must be screened for in a patient with biopsy-proven systemic amyloidosis?', '["Lungs","Heart (restrictive cardiomyopathy) and Kidneys (nephrotic syndrome)","Limb length","None"]', 1, 'Amyloid can infiltrate vital organs, leading to significant morbidity.');

    ---------------------------------------------------------------------------
    -- CASE 24: The ''Pearly'' Bump and the ''SCC'' (Histology)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''SCC'' (Histology)', 'A pathology report for a rough, scaly lesion describes ''full-thickness atypia of the epidermis without invasion into the dermis''.

Vitals: Normal.
Physical Examination: Scaly red patch on sun-damaged skin.
Laboratory Results: Histology report received.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the diagnosis for Squamous Cell Carcinoma that is ''in situ'' (limited to the epidermis)?', '["Actinic Keratosis","Bowen''s Disease (SCC in situ)","Invasive SCC","BCC"]', 1, 'In situ means the basement membrane is intact.'),
        (v_case_id, 'How does Actinic Keratosis differ histologically from SCC in situ?', '["AK is deeper","AK shows ''partial-thickness'' atypia (usually the lower 1/3 of the epidermis), while SCC in situ is ''full-thickness''","No difference","None"]', 1, 'AK is a precursor; SCC in situ is cancer that hasn''t started invading yet.'),
        (v_case_id, 'What are ''Keratin Pearls'' a sign of?', '["BCC","Well-differentiated invasive Squamous Cell Carcinoma","A skin infection","None"]', 1, 'They represent focal areas of keratinization within tumor nests.');

    ---------------------------------------------------------------------------
    -- CASE 25: The ''Target'' and the ''Imaging'' (MRI)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (MRI)', 'A patient with a rapidly spreading leg infection and high fever is being rushed for an MRI.

Vitals: T 39.5, BP 90/60.
Physical Examination: Dusky skin, crepitus.
Laboratory Results: None.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most characteristic MRI finding for necrotizing fasciitis?', '["Bone fracture","Thickening and enhancement of the deep fascia with fluid/gas along the fascial planes","A tumor","None"]', 1, 'MRI is very sensitive for identifying deep fascial involvement.'),
        (v_case_id, 'Should surgery be DELAYED to wait for an MRI if the clinical suspicion is very high?', '["Yes, always confirm first","No, necrotizing fasciitis is a clinical diagnosis; surgery should proceed immediately to prevent death","Only in the elderly","None"]', 1, 'Time is tissue; surgical exploration is the gold standard and the ultimate ''test''.'),
        (v_case_id, 'What is the ''LRINEC'' score used for?', '["Melanoma staging","A laboratory-based scoring system (using WBC, CRP, Sodium, Glucose, etc.) to help identify necrotizing fasciitis","Acne grading","None"]', 1, 'Laboratory Risk Indicator for Necrotizing Fasciitis (LRINEC) is a triage tool.');

    ---------------------------------------------------------------------------
    -- CASE 26: The ''Starry'' Night
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Starry'' Night', 'A dermatologist is examining a dark spot on the face of an 80-year-old woman with extensive sun damage. The lesion is flat and has uneven pigment.

Vitals: Normal.
Physical Examination: 1.5 cm irregular brown macule on the cheek.
Laboratory Results: Dermoscopy shows ''pseudo-network'', ''asymmetric follicular opening pigmentation'', and ''rhomboidal structures''.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The dermoscopic features described (pigmentation around follicular openings) are highly suggestive of what melanoma variant?', '["Nodular melanoma","Lentigo Maligna (Melanoma in situ on sun-damaged skin)","Acral lentiginous melanoma","None"]', 1, 'Melanocytes in Lentigo Maligna classically migrate down the hair follicles.'),
        (v_case_id, 'Why is a ''Punch'' biopsy sometimes preferred over a ''Shave'' for a large facial lesion like this?', '["It''s faster","To get a representative sample of the most suspicious area without causing extensive scarring from a large excision","No reason","None"]', 1, 'While WLE is definitive, a targeted punch helps confirm the diagnosis first in cosmetically sensitive areas.'),
        (v_case_id, 'What is the ''Rhomboidal structure'' in this context?', '["A square","Pigment forming diamond-like shapes around hair follicles, a late sign of LM","A fungus","None"]', 1, 'It is a highly specific dermoscopic indicator for Lentigo Maligna.');

    ---------------------------------------------------------------------------
    -- CASE 27: The ''Target'' and the ''Vasculitis''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Vasculitis''', 'A pathology report for a palpable purpura on the legs describes ''leukocytoclastic vasculitis (LCV) with fibrinoid necrosis and RBC extravasation''.

Vitals: Normal.
Physical Examination: Non-blanching purple spots on the shins.
Laboratory Results: Biopsy results received.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Leukocytoclasis'' refer to histologically?', '["Bacteria","Nuclear dust (fragments of neutrophils) in the vessel wall","Dead skin","None"]', 1, 'LCV is characterized by neutrophil destruction and the resulting ''dust''.'),
        (v_case_id, 'What is ''Fibrinoid Necrosis''?', '["A type of scar","Damage to the blood vessel wall characterized by the deposition of fibrin and protein, making the wall look thick and pink","A clot","None"]', 1, 'This indicates severe inflammatory damage to the vasculature.'),
        (v_case_id, 'What is the ''Most Important'' next step when LCV is found on skin biopsy?', '["Start steroids immediately","Screen for systemic involvement (e.g., UA for hematuria/proteinuria to check for glomerulonephritis)","Apply ice","None"]', 1, 'Skin-limited vasculitis must be distinguished from systemic vasculitis (e.g., GPA or IgA vasculitis).');

    ---------------------------------------------------------------------------
    -- CASE 28: The ''Indirect'' Evidence
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Indirect'' Evidence', 'A patient with suspected Pemphigus Vulgaris has blood drawn for ''Indirect Immunofluorescence (IIF)''.

Vitals: Normal.
Physical Examination: Blisters.
Laboratory Results: IIF is positive on ''monkey esophagus'' substrate.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does ''Indirect'' Immunofluorescence differ from ''Direct'' (DIF)?', '["IIF is on the skin","IIF is a blood test (serum) used to detect circulating autoantibodies; DIF is on the patient''s actual skin tissue","There is no difference","None"]', 1, 'IIF measures the systemic burden of the disease.'),
        (v_case_id, 'What is the ''Substrate'' in IIF?', '["The patient''s skin","Laboratory tissue (e.g., monkey esophagus or human salt-split skin) used as a ''target'' for the patient''s serum antibodies","The microscope","None"]', 1, 'Serum antibodies bind to the substrate and are then visualized.'),
        (v_case_id, 'Which IIF ''Titer'' would correlate with disease activity in Pemphigus?', '["The higher the titer (e.g., 1:160), the more active the disease","Titer doesn''t matter","Lower titers are worse","None"]', 0, 'IIF titers often mirror the clinical severity and treatment response in Pemphigus.');

    ---------------------------------------------------------------------------
    -- CASE 29: The ''Target'' and the ''ELISA''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''ELISA''', 'A patient with suspected Bullous Pemphigoid is tested for anti-BP180 and anti-BP230 antibodies using ELISA.

Vitals: Normal.
Physical Examination: Tense bullae.
Laboratory Results: ELISA shows high levels of anti-BP180.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''ELISA'' stand for?', '["Every Lung Is So Airy","Enzyme-Linked Immunosorbent Assay","Easy Laboratory Internal Safety Audit","None"]', 1, 'It is a highly sensitive and quantitative tool for measuring specific antibodies.'),
        (v_case_id, 'Anti-BP180 antibodies specifically target which part of the skin?', '["Desmosomes","Hemidesmosomes (the transmembrane protein NC16A domain)","Melanocytes","None"]', 1, 'BP180 (Type XVII Collagen) is the primary target in Bullous Pemphigoid.'),
        (v_case_id, 'Is ELISA more specific than DIF for diagnosing Bullous Pemphigoid?', '["No, DIF is the gold standard for the ''pattern'', but ELISA confirms the ''specific'' antigen target","Yes, ELISA is the only test needed","No, ELISA is only for HIV","None"]', 0, 'The tests are complementary; DIF shows where the damage is, ELISA shows what is being attacked.');

    ---------------------------------------------------------------------------
    -- CASE 30: The ''Red'' Face and the ''Demodex''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Red'' Face and the ''Demodex''', 'A 45-year-old with papulopustular rosacea has a ''skin surface biopsy'' with cyanoacrylate (Super Glue) to check for mites.

Vitals: Normal.
Physical Examination: Erythema and papules on the cheeks and nose.
Laboratory Results: Microscopy shows >5 Demodex mites per square centimeter.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Where do Demodex mites normally live in the skin?', '["Sweat glands","Pilosebaceous units (hair follicles and oil glands)","The stratum corneum","None"]', 1, 'They are part of the normal skin flora but are increased in Rosacea.'),
        (v_case_id, 'Which specific type of Rosacea is most associated with Demodex overgrowth?', '["Erythematotelangiectatic","Papulopustular","Phymatous","None"]', 1, 'Inflammation from the mites (and their bacteria) contributes to the papules and pustules.'),
        (v_case_id, 'What is a highly effective ''Topical'' treatment for Demodex in rosacea?', '["Steroids","Ivermectin 1% cream (Soolantra)","Antifungals","None"]', 1, 'Ivermectin is an anti-parasitic agent that reduces mite counts.');

    ---------------------------------------------------------------------------
    -- CASE 31: The ''Target'' and the ''PCR'' (Nails)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''PCR'' (Nails)', 'A patient with thick, yellow toenails has a piece of nail sent for PCR testing for onychomycosis.

Vitals: Normal.
Physical Examination: Onycholysis and subungual hyperkeratosis.
Laboratory Results: PCR is positive for Trichophyton rubrum.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary advantage of PCR over fungal culture for nails?', '["It''s cheaper","Much faster (days vs. weeks) and higher sensitivity (detects DNA even if the fungus won''t grow)","It''s a Wood''s lamp test","None"]', 1, 'Cultures often fail to grow in 30-50% of true nail infections.'),
        (v_case_id, 'Which fungus is the ''Most Common'' cause of toenail onychomycosis worldwide?', '["Candida","Trichophyton rubrum","Aspergillus","None"]', 1, 'T. rubrum is the leading dermatophyte for nail disease.'),
        (v_case_id, 'Is PCR able to distinguish between ''Live'' and ''Dead'' fungus?', '["Yes","No, it only detects the presence of DNA, which can persist after the fungus is killed","Only in the sun","None"]', 1, 'This is a limitation of molecular testing compared to culture.');

    ---------------------------------------------------------------------------
    -- CASE 32: The ''Target'' and the ''Birefringence''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Birefringence''', 'A pathology report for a nodule in a surgical scar describes ''foreign body granulomas with refractile material''.

Vitals: Normal.
Physical Examination: Firm nodule in a 10-year-old scar.
Laboratory Results: Polarized light microscopy shows ''brightly birefringent'' crystals.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Refractile'' or ''Birefringent'' material usually indicate in a biopsy of a scar?', '["Cancer","Foreign material (e.g., suture remnants, silica, talc, or wood) that bends polarized light","Bacteria","None"]', 1, 'Polarized light is the best way to find ''hidden'' foreign bodies in tissue.'),
        (v_case_id, 'Which specific granulomatous disease is NOT birefringent?', '["Sarcoidosis","Suture granuloma","Silica granuloma","Talc granuloma"]', 0, 'Sarcoid is a ''non-caseating'' granuloma of unknown origin, not a reaction to a visible foreign crystal.'),
        (v_case_id, 'What is the term for the giant cells seen in these reactions?', '["Munro microabscesses","Foreign body giant cells (with randomly arranged nuclei)","Langerhans giant cells (with horseshoe-shaped nuclei)","None"]', 1, 'Nuclear arrangement helps distinguish between foreign body and immune (e.g., TB/Sarcoid) reactions.');

    ---------------------------------------------------------------------------
    -- CASE 33: The ''Target'' and the ''Silver'' Stain (Treponemes)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Silver'' Stain (Treponemes)', 'A patient with a ''copper-colored'' rash on the palms and soles is being tested for Syphilis.

Vitals: Normal.
Physical Examination: Widespread maculopapular rash involving the palms.
Laboratory Results: A biopsy of a papule is stained with ''Warthin-Starry'' silver stain.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''Warthin-Starry'' or ''Steiner'' stain highlight in Syphilis?', '["Bacteria","Spirochetes (Treponema pallidum), which look like ''corkscrews''","Fungus","None"]', 1, 'Silver stains are the traditional way to visualize spirochetes in tissue.'),
        (v_case_id, 'What is the more modern and ''Specific'' immunohistochemical (IHC) stain used for Syphilis?', '["PAS","Anti-Treponema pallidum IHC","Gram stain","None"]', 1, 'IHC is much easier to read and has fewer ''false-positive'' silver deposits.'),
        (v_case_id, 'Which non-treponemal blood test is used for initial ''screening'' of syphilis?', '["FTA-ABS","RPR or VDRL","PCR","None"]', 1, 'RPR/VDRL are cheap and sensitive for screening.');

    ---------------------------------------------------------------------------
    -- CASE 34: The ''Target'' and the ''Immunohistochemistry'' (Melanoma)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Immunohistochemistry'' (Melanoma)', 'A pathology report for a suspicious lesion on the back mentions ''Positive staining for S100, HMB-45, and Melan-A''.

Vitals: Normal.
Physical Examination: Atypical mole.
Laboratory Results: IHC results received.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which of these markers is the ''Most Sensitive'' for melanocytic lesions (but less specific)?', '["HMB-45","S100","Melan-A","None"]', 1, 'S100 is almost always positive in melanoma but can also be positive in nerve and fat cells.'),
        (v_case_id, 'Which marker is the ''Most Specific'' for melanocytic differentiation?', '["S100","Melan-A (MART-1) or HMB-45","PAS","None"]', 1, 'These markers are much more selective for melanin-producing cells.'),
        (v_case_id, 'What is ''SOX10''?', '["A shoe brand","A highly sensitive and specific nuclear marker for melanocytes and nerve sheath tumors","A type of UV light","None"]', 1, 'SOX10 is a modern, ''clean'' marker often used to identify melanoma.');

    ---------------------------------------------------------------------------
    -- CASE 35: The ''Target'' and the ''Cytology'' (BCC)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Cytology'' (BCC)', 'A physician performs a ''fine-needle aspiration'' or ''touch prep'' of a pearly nodule.

Vitals: Normal.
Physical Examination: BCC suspected.
Laboratory Results: Cytology shows ''clusters of basaloid cells with little cytoplasm''.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Is cytology (needle aspiration) the ''Standard'' way to diagnose BCC?', '["Yes","No, a punch or shave biopsy (histology) is the standard, but cytology can be used in specialized settings","Only in the elderly","None"]', 1, 'Histology provides architectural context (palisading, clefting) that cytology lacks.'),
        (v_case_id, 'What is ''Touch Imprint'' cytology?', '["Pressing a slide against a freshly cut biopsy","A type of massage","A blood test","None"]', 0, 'It allows for rapid assessment of cells, sometimes used during Mohs surgery.'),
        (v_case_id, 'Can cytology distinguish between the ''Subtypes'' of BCC (e.g., nodular vs. morpheaform)?', '["Yes","No, architecture is needed for subtyping","Only with special stains","None"]', 1, 'The ''growth pattern'' is a histologic feature.');

    ---------------------------------------------------------------------------
    -- CASE 36: The ''Target'' and the ''Cultures'' (Mycobacteria)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Cultures'' (Mycobacteria)', 'A patient with a non-healing nodule on his hand after cleaning a fish tank.

Vitals: Normal.
Physical Examination: Linear nodules (sporotrichoid spread) on the arm.
Laboratory Results: A tissue culture is requested at ''30 degrees Celsius''.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is the culture temperature (30 C) important for M. marinum?', '["It''s the standard temperature","M. marinum is a ''cold-loving'' organism that grows best in the extremities (lower than body temp)","It grows faster at 30 C","None"]', 1, 'Standard 37 C (body temp) cultures may be negative for this organism.'),
        (v_case_id, 'What is the common name for this infection?', '["Fish tank granuloma","Cat scratch disease","Shingles","None"]', 0, 'Exposure to non-chlorinated water (tanks, pools) is a key history point.'),
        (v_case_id, 'Which specific stain is used to find Mycobacteria in tissue?', '["Gram stain","Acid-Fast Bacillus (AFB) stain, such as Ziehl-Neelsen or Fite","PAS","None"]', 1, 'AFB stains highlight the waxy cell walls of mycobacteria.');

    ---------------------------------------------------------------------------
    -- CASE 37: The ''Target'' and the ''Dermoscopy'' (Vascular)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Dermoscopy'' (Vascular)', 'A physician is looking at a small, bright red papule on a patient''''s abdomen.

Vitals: Normal.
Physical Examination: 2-mm bright red papule.
Laboratory Results: Dermoscopy shows ''red lacunae'' (well-demarcated red lakes).', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The presence of ''red lacunae'' is diagnostic for which benign vascular lesion?', '["BCC","Cherry Angioma","Pyogenic Granuloma","Melanoma"]', 1, 'These lakes represent dilated vascular spaces.'),
        (v_case_id, 'How does the dermoscopy of a ''Pyogenic Granuloma'' differ?', '["It''s the same","It shows a ''white collarette'' and ''reddish-pink homogeneous areas'' but lacks the well-defined lacunae of a cherry angioma","It''s blue","None"]', 1, 'The white collarette is a classic clinical and dermoscopic clue for PG.'),
        (v_case_id, 'Are cherry angiomas dangerous?', '["Yes","No, they are benign proliferations of capillaries that increase with age","Only if they bleed","None"]', 1, 'They are extremely common and require no treatment.');

    ---------------------------------------------------------------------------
    -- CASE 38: The ''Target'' and the ''Imaging'' (CT Scan)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (CT Scan)', 'A patient with a large, indurated mass on the neck is having a CT scan with contrast.

Vitals: Normal.
Physical Examination: Fixed, firm 4-cm mass.
Laboratory Results: None.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary goal of CT imaging in a suspected head and neck cancer?', '["To see the skin","To assess the ''depth'' of invasion, involvement of underlying bone/nerves, and to look for lymphadenopathy","To check the lungs only","None"]', 1, 'Imaging is essential for TNM staging.'),
        (v_case_id, 'What is ''Contrast'' used for in this setting?', '["To make the patient feel warm","To highlight vascularity and differentiate between a cystic mass and a solid, necrotic tumor","To clean the blood","None"]', 1, 'Iodinated contrast improves the visualization of tumor margins.'),
        (v_case_id, 'Which specific ''lymph node'' feature on CT is highly suggestive of malignancy?', '["Small size","Central necrosis (a dark hole in the middle of the node)","Round shape","None"]', 1, 'Necrotic nodes are almost always malignant.');

    ---------------------------------------------------------------------------
    -- CASE 39: The ''Target'' and the ''Biopsy'' (Scalp)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Scalp)', 'A patient with scarring hair loss (alopecia) needs a biopsy.

Vitals: Normal.
Physical Examination: Areas of the scalp with no hair follicles and smooth, shiny skin.
Laboratory Results: A ''4-mm punch biopsy'' is taken.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best'' location to biopsy for scarring alopecia?', '["The center of the bald patch","The active, expanding border where hair is still present but looks abnormal","The back of the neck","None"]', 1, 'The center of a scar is just ''fibrosis'' and lacks diagnostic features.'),
        (v_case_id, 'Which specialized histologic processing is often required for scalp biopsies?', '["Vertical sectioning only","Horizontal (transverse) sectioning to allow for the counting of follicles and assessment of hair cycle","None","Freezing only"]', 1, 'Horizontal sections allow for the best assessment of hair density and anatomy.'),
        (v_case_id, 'A biopsy showing ''perifollicular fibrosis'' and ''loss of sebaceous glands'' is characteristic of:', '["Alopecia Areata","Scarring (Cicatricial) Alopecia","Male pattern baldness","None"]', 1, 'Loss of the ''oil gland'' is a very early sign of permanent scarring alopecia.');

    ---------------------------------------------------------------------------
    -- CASE 40: The ''Target'' and the ''Stain'' (Melanin)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Stain'' (Melanin)', 'A pathologist is trying to find ''melanin'' in a poorly differentiated tumor.

Vitals: Normal.
Physical Examination: Large black/grey tumor.
Laboratory Results: A ''Fontana-Masson'' stain is performed.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the Fontana-Masson stain highlight?', '["Fungus","Melanin (it turns it black)","Iron","Fat"]', 1, 'This is a specialized silver stain for melanin.'),
        (v_case_id, 'How can you distinguish Melanin from ''Iron'' (hemosiderin) on histology?', '["They look the same","Use a ''Perls Prussian Blue'' stain; iron turns blue, while melanin does not","Melanin is always blue","None"]', 1, 'Iron stains help distinguish bruising/stasis from true pigment.'),
        (v_case_id, 'What is ''Solar Elastosis''?', '["A type of cancer","The accumulation of fragmented, bluish-gray elastic fibers in the dermis due to chronic sun damage","Skin thinning","None"]', 1, 'This is an ubiquitous finding in biopsies from older, sun-exposed skin.');

    ---------------------------------------------------------------------------
    -- CASE 41: The ''Target'' and the ''Molecular'' (B-RAF)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Molecular'' (B-RAF)', 'A patient with metastatic melanoma is having his tumor tested for ''B-RAF mutations''.

Vitals: Normal.
Physical Examination: Multiple cutaneous and visceral metastases.
Laboratory Results: Tumor is positive for the V600E mutation.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the significance of finding a B-RAF V600E mutation?', '["It''s a bad sign only","It allows for the use of targeted therapy with B-RAF inhibitors (e.g., Vemurafenib) and MEK inhibitors","It means the patient is cured","None"]', 1, 'Targeted therapy is only effective in patients with the specific mutation.'),
        (v_case_id, 'What percentage of cutaneous melanomas carry a B-RAF mutation?', '["1%","40-50%","90%","None"]', 1, 'It is a very common driver mutation in melanoma.'),
        (v_case_id, 'Does finding a B-RAF mutation change the initial ''Surgical'' margin for the primary tumor?', '["Yes","No, surgical margins are based on Breslow depth and stage, not molecular status","Only in children","None"]', 1, 'Molecular status guides systemic therapy, not local excision.');

    ---------------------------------------------------------------------------
    -- CASE 42: The ''Target'' and the ''Dermoscopy'' (Acral)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Dermoscopy'' (Acral)', 'A physician is looking at a pigmented spot on a patient''''s ''sole'' (foot).

Vitals: Normal.
Physical Examination: 8-mm brown macule on the arch of the foot.
Laboratory Results: Dermoscopy shows a ''parallel ridge pattern''.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The ''Parallel Ridge'' pattern (pigment on the ridges of the skin) is highly suggestive of:', '["Benign acral nevus","Acral Lentiginous Melanoma","A wart","None"]', 1, 'Ridges are for ''Bad'' (Melanoma); Furrows are for ''Fine'' (Benign).'),
        (v_case_id, 'What is the ''Parallel Furrow'' pattern?', '["Melanoma","A common benign pattern in acral nevi (moles) where pigment is concentrated in the grooves of the skin","A scar","None"]', 1, 'This is a classic ''Step'' differentiator for foot lesions.'),
        (v_case_id, 'Is ''Hutchinson Sign'' relevant here?', '["No","Yes, pigment on the proximal nail fold is a key clue for subungual melanoma","Only in the eyes","None"]', 1, 'Nail and acral lesions are often grouped in clinical reasoning.');

    ---------------------------------------------------------------------------
    -- CASE 43: The ''Target'' and the ''Stain'' (Mast Cells)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Stain'' (Mast Cells)', 'A child with ''Urticaria Pigmentosa'' has a biopsy. The doctor rubs the skin before the biopsy (Darier sign) and it hives.

Vitals: Normal.
Physical Examination: Widespread brown macules.
Laboratory Results: A ''Tryptase'' stain or ''Leder'' stain is performed.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which stain is commonly used to highlight mast cells in tissue?', '["PAS","Tryptase, Giemsa, or Toluidine Blue","Gram stain","None"]', 1, 'Tryptase is a highly specific marker for mast cell granules.'),
        (v_case_id, 'What is the ''Darier Sign''?', '["A fever","Urtication (hiving) and redness after stroking a lesion, due to mast cell degranulation","Hair loss","None"]', 1, 'This is the classic clinical test for cutaneous mastocytosis.'),
        (v_case_id, 'What systemic lab test should be ordered if systemic mastocytosis is suspected?', '["Blood sugar","Serum Tryptase level","Potassium","None"]', 1, 'Elevated baseline tryptase (>20 ng/mL) is a diagnostic criterion for systemic disease.');

    ---------------------------------------------------------------------------
    -- CASE 44: The ''Target'' and the ''Imaging'' (PET Scan)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (PET Scan)', 'A patient with Stage III melanoma is being monitored for recurrence with periodic PET-CT scans.

Vitals: Normal.
Physical Examination: No clinical recurrence.
Laboratory Results: Scan shows a ''hypermetabolic node'' in the groin.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does a PET (Positron Emission Tomography) scan detect?', '["Blood flow","Increased glucose metabolism (using FDG) in rapidly dividing cells (like cancer)","Bone density","None"]', 1, 'Cancer cells ''eat'' more sugar than normal cells.'),
        (v_case_id, 'Is PET-CT recommended for the ''Initial Staging'' of thin (Stage I) melanomas?', '["Yes, to be safe","No, the risk of metastasis is too low and the rate of false positives is too high","Only in the elderly","None"]', 1, 'Imaging is generally reserved for Stage III and higher.'),
        (v_case_id, 'What can cause a ''False-Positive'' PET scan (besides cancer)?', '["Drinking too much water","Inflammation, recent surgery, or infection (which are also metabolically active)","None","Being too cold"]', 1, 'Clinical correlation is always required with imaging.');

    ---------------------------------------------------------------------------
    -- CASE 45: The ''Target'' and the ''Biopsy'' (Mouth)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Mouth)', 'A patient has a white, lacy patch on his inner cheek (buccal mucosa).

Vitals: Normal.
Physical Examination: Lacy white lines (Wickham striae) on the mucosa.
Laboratory Results: A ''punch'' biopsy is taken.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Most Likely'' diagnosis for lacy white oral lesions?', '["Oral thrush","Oral Lichen Planus","Leukoplakia","Cancer"]', 1, 'The lacy pattern (Wickham striae) is classic for LP.'),
        (v_case_id, 'If the patch were ''thick, white, and could NOT be scraped off'', what would be the concern?', '["Thrush","Leukoplakia (a premalignant lesion requiring biopsy to rule out dysplasia)","None","Food residue"]', 1, 'Leukoplakia is a clinical term for a white patch that doesn''t fit other diagnoses.'),
        (v_case_id, 'How do you distinguish Oral Thrush from Lichen Planus clinically?', '["Thrush can be scraped off, leaving a red/bleeding base; LP cannot be scraped off","LP is redder","Thrush is on the teeth","None"]', 0, 'The ''scraping'' test is a high-yield clinical differentiator.');

    ---------------------------------------------------------------------------
    -- CASE 46: The ''Target'' and the ''Stain'' (Lipids)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Stain'' (Lipids)', 'A pathology report for a yellowish eyelid growth mentions ''Foamy macrophages positive for oil red O stain''.

Vitals: Normal.
Physical Examination: Yellowish plaques on the eyelids (Xanthelasma).
Laboratory Results: Biopsy results received.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''Oil Red O'' stain highlight?', '["Bacteria","Lipids (fats)","Iron","Melanin"]', 1, 'Xanthomas are composed of lipid-laden macrophages.'),
        (v_case_id, 'What is the ''Most Important'' lab test to order for a patient with xanthelasma?', '["Blood sugar","Fast Lipid Panel (to check for dyslipidemia)","Renal panel","None"]', 1, 'Xanthomas are often external markers of internal lipid disorders.'),
        (v_case_id, 'What are ''Foamy Macrophages''?', '["Infected cells","Cells that have eaten so much lipid that their cytoplasm looks bubbly or ''foamy'' on H&E","Dying cells","None"]', 1, 'This is a classic histologic description.');

    ---------------------------------------------------------------------------
    -- CASE 47: The ''Target'' and the ''Culture'' (Deep Tissue)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Culture'' (Deep Tissue)', 'A patient with a chronic, non-healing ulcer on the foot. The physician takes a ''Deep Tissue Culture''.

Vitals: Normal.
Physical Examination: Ulcer.
Laboratory Results: Culture grows 10^5 colony-forming units (CFU) of mixed organisms.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the significance of the ''10^5'' threshold in wound cultures?', '["No significance","It is the standard threshold for ''Infection'' (as opposed to colonization) that impairs healing","It means the patient is healthy","None"]', 1, 'High bacterial loads prevent the wound from moving into the proliferative phase.'),
        (v_case_id, 'Why is ''Curettage'' or ''Biopsy'' culture better than a ''Swab''?', '["It''s faster","It bypasses surface contaminants and finds the organisms actually present in the deep tissue","It''s less painful","None"]', 1, 'Surface swabs are notoriously unreliable for chronic wounds.'),
        (v_case_id, 'Does every ''Positive'' culture require systemic antibiotics?', '["Yes","No, if the wound is healing well and there are no clinical signs of infection, it may just be ''colonized''","Only in the elderly","None"]', 1, 'Treat the patient, not the lab report.');

    ---------------------------------------------------------------------------
    -- CASE 48: The ''Target'' and the ''Dermoscopy'' (Scabies)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Dermoscopy'' (Scabies)', 'A dermatologist uses a dermatoscope to look at a burrow on a patient''s hand.

Vitals: Normal.
Physical Examination: Itchy burrows.
Laboratory Results: Dermoscopy shows a ''Jet with a contrail'' or ''Delta-wing'' sign.', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''Delta-wing'' or ''Jet'' sign represent on dermoscopy?', '["A piece of lint","The triangular head and front legs of the scabies mite at the end of a burrow","A hair","None"]', 1, 'This is a highly specific sign that allows for bedside diagnosis without scraping.'),
        (v_case_id, 'Is dermoscopy more sensitive than a skin scraping for scabies?', '["No","Yes, it allows for the screening of many sites quickly to find the best place to scrape or to make a direct diagnosis","Only in children","None"]', 1, 'It is a powerful triage tool.'),
        (v_case_id, 'What is the ''Contrail''?', '["A cloud","The burrow itself, filled with eggs and feces (scybala)","The mite''s tail","None"]', 1, 'The burrow follows the mite, much like a jet''s trail.');

    ---------------------------------------------------------------------------
    -- CASE 49: The ''Target'' and the ''Biopsy'' (Nail)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Nail)', 'A surgeon is performing a ''Nail Matrix'' biopsy for a dark band.

Vitals: Normal.
Physical Examination: Longitudinal melanonychia.
Laboratory Results: A 3-mm punch is taken from the proximal matrix.', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Where must the biopsy be taken to determine the cause of a longitudinal nail band?', '["The distal nail tip","The nail matrix (where the nail plate is produced)","The skin of the finger","None"]', 1, 'The pigment is produced in the matrix and grows into the plate.'),
        (v_case_id, 'What is the risk of a matrix biopsy?', '["Infection only","Permanent nail dystrophy (scarring or splitting of the nail)","Loss of the finger","None"]', 1, 'The patient must be counseled about permanent nail changes.'),
        (v_case_id, 'Which part of the matrix produces the ''top'' of the nail plate?', '["Distal matrix","Proximal matrix","Nail bed","None"]', 1, 'Biopsying the proximal matrix is more likely to cause a visible defect.');

    ---------------------------------------------------------------------------
    -- CASE 50: The ''Target'' and the ''Imaging'' (Chest X-ray)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (Chest X-ray)', 'A 40-year-old with EN (Erythema Nodosum) is having a Chest X-ray.

Vitals: Normal.
Physical Examination: Painful red nodules on the shins.
Laboratory Results: CXR shows ''bilateral hilar lymphadenopathy''.', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is a Chest X-ray part of the standard workup for Erythema Nodosum?', '["To check for heart disease","To screen for Sarcoidosis (Lofgren syndrome) or Tuberculosis as a cause of the EN","To see the skin","None"]', 1, 'EN is a reactive process; finding the trigger is the goal.'),
        (v_case_id, 'What is ''Lofgren Syndrome''?', '["A type of cancer","The triad of Erythema Nodosum, Bilateral Hilar Lymphadenopathy, and Migratory Polyarthralgia","A skin infection","None"]', 1, 'It is a highly specific, acute presentation of sarcoidosis with a good prognosis.'),
        (v_case_id, 'Does EN itself need a biopsy if it is clinically classic?', '["Yes, always","No, it is a clinical diagnosis; the workup should focus on the underlying trigger (CXR, ASO titer, etc.)","Only in the elderly","None"]', 1, 'The cause is more important than the skin histology in classic EN.');

    ---------------------------------------------------------------------------
    -- CASE 51: The ''Flame'' Figure
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Flame'' Figure', 'A pathology report for an itchy, blistering rash describes ''dermal edema and flame figures (major basic protein surrounding collagen bundles)''.

Vitals: Normal.
Physical Examination: Erythematous plaques with peripheral ''pseudopodia''.
Laboratory Results: Peripheral eosinophilia is noted in the CBC.', 51)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a ''Flame Figure'' characteristic of?', '["Infection","Eosinophilic Dermatitis (e.g., Wells Syndrome)","Psoriasis","None"]', 1, 'Flame figures are formed by degranulated eosinophils.'),
        (v_case_id, 'Which other common condition can occasionally show flame figures?', '["Acne","Arthropod (insect) bites","Warts","None"]', 1, 'Any process with intense eosinophilic infiltrate can produce them.'),
        (v_case_id, 'What is the primary treatment for Wells Syndrome?', '["Antibiotics","Systemic corticosteroids","Antifungals","None"]', 1, 'It is an inflammatory, non-infectious condition.');

    ---------------------------------------------------------------------------
    -- CASE 52: The ''Caterpillar'' Body
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Caterpillar'' Body', 'A pathology report for a subepidermal blister on the hand mentions ''festooning of the dermal papillae'' and ''caterpillar bodies''.

Vitals: Normal.
Physical Examination: Fragile skin and blisters on sun-exposed hands.
Laboratory Results: Biopsy results received.', 52)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are ''Caterpillar Bodies''?', '["Small worms","Linear basement membrane and collagen fragments within the epidermis of a PCT blister","A sign of infection","None"]', 1, 'They are a classic histologic finding in PCT.'),
        (v_case_id, 'What does ''Festooning'' describe in a subepidermal blister?', '["It looks like a party","The preservation of the dermal papillae architecture at the base of the blister","Skin thinning","None"]', 1, 'In PCT, the dermal papillae protrude upward into the blister cavity like ''festoons''.'),
        (v_case_id, 'Why are there no ''neutrophils'' in a PCT blister?', '["They are shy","PCT is a metabolic/phototoxic process, not primarily an inflammatory one","Fungus kills them","None"]', 1, 'The ''cell-poor'' nature of the blister helps distinguish it from Bullous Pemphigoid.');

    ---------------------------------------------------------------------------
    -- CASE 53: The ''Target'' and the ''ENA'' Panel
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''ENA'' Panel', 'A 30-year-old woman with a malar rash and joint pain has a positive ANA (1:1280, speckled). An ''ENA'' (Extractable Nuclear Antigen) panel is ordered.

Vitals: Normal.
Physical Examination: Butterfly rash.
Laboratory Results: ENA is positive for ''Anti-dsDNA'' and ''Anti-Smith''.', 53)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which of these antibodies is ''Most Specific'' for the diagnosis of SLE?', '["Anti-Ro","Anti-Smith and Anti-dsDNA","Anti-La","None"]', 1, 'While ANA is sensitive, Anti-Smith and Anti-dsDNA are highly specific.'),
        (v_case_id, 'Which antibody correlates with the presence of ''Lupus Nephritis'' and disease activity?', '["Anti-Smith","Anti-dsDNA","Anti-Ro","None"]', 1, 'Anti-dsDNA levels often rise during a lupus flare involving the kidneys.'),
        (v_case_id, 'Anti-Ro (SS-A) and Anti-La (SS-B) are most strongly associated with which other condition?', '["Gout","Sjögren Syndrome","Acne","None"]', 1, 'These are classic markers for Sjögren''s.');

    ---------------------------------------------------------------------------
    -- CASE 54: The ''Target'' and the ''Jo-1''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Jo-1''', 'A patient with a purple rash on the eyelids (heliotrope rash) and ''mechanic''''s hands'' (rough, cracked skin on the fingers) has a blood test.

Vitals: Normal.
Physical Examination: Gottron papules on the knuckles.
Laboratory Results: Elevated Creatine Kinase (CK) and positive ''Anti-Jo-1'' antibody.', 54)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The Anti-Jo-1 antibody is associated with which systemic complication in dermatomyositis?', '["Liver failure","Interstitial Lung Disease (Antisynthetase Syndrome)","Brain tumor","None"]', 1, 'Anti-Jo-1 is a marker for lung involvement and a more severe course.'),
        (v_case_id, 'Which other antibody is highly specific for Dermatomyositis specifically (as opposed to polymyositis)?', '["Anti-dsDNA","Anti-Mi-2","Anti-Smith","None"]', 1, 'Anti-Mi-2 is strongly associated with the classic skin findings of DM.'),
        (v_case_id, 'What is the ''Screening'' priority in a newly diagnosed adult with dermatomyositis?', '["Eye exam","Age-appropriate malignancy screening (due to high paraneoplastic risk)","Bone density","None"]', 1, 'Adult-onset DM is frequently associated with an internal malignancy.');

    ---------------------------------------------------------------------------
    -- CASE 55: The ''Target'' and the ''Centromere''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Centromere''', 'A 50-year-old woman with Raynaud phenomenon and tight skin on her fingers has a blood test.

Vitals: Normal.
Physical Examination: Telangiectasias on the face and Sclerodactyly.
Laboratory Results: Positive ''Anti-Centromere'' antibody.', 55)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Anti-Centromere antibody is the hallmark of which variant of Systemic Sclerosis?', '["Diffuse Scleroderma","Limited Scleroderma (CREST Syndrome)","Lupus","None"]', 1, 'CREST stands for Calcinosis, Raynaud, Esophageal dysmotility, Sclerodactyly, and Telangiectasias.'),
        (v_case_id, 'Which antibody is characteristic of ''Diffuse'' Systemic Sclerosis?', '["Anti-Centromere","Anti-Scl-70 (Anti-topoisomerase I)","Anti-Jo-1","None"]', 1, 'Anti-Scl-70 is associated with the more aggressive, diffuse form of the disease.'),
        (v_case_id, 'What is the major ''Renal'' complication of Scleroderma?', '["Kidney stones","Scleroderma Renal Crisis (abrupt onset of malignant hypertension and renal failure)","Glomerulonephritis","None"]', 1, 'This is a life-threatening emergency treated with ACE inhibitors.');

    ---------------------------------------------------------------------------
    -- CASE 56: The ''Target'' and the ''Histone''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Histone''', 'A patient on Hydralazine for high blood pressure develops a malar rash and joint pain. A blood test is performed.

Vitals: Normal.
Physical Examination: Rash.
Laboratory Results: Positive ANA and positive ''Anti-Histone'' antibody. Negative anti-dsDNA.', 56)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The presence of Anti-Histone antibodies (in the absence of Anti-dsDNA) is highly suggestive of:', '["Systemic Lupus (SLE)","Drug-induced Lupus Erythematosus (DILE)","Scleroderma","None"]', 1, 'This is the classic board differentiator for drug-induced lupus.'),
        (v_case_id, 'Which of the following drugs is NOT a classic cause of DILE?', '["Hydralazine","Procainamide","Isoniazid","Penicillin"]', 3, 'Penicillin is not a recognized cause; Minocycline and Anti-TNF agents are newer causes.'),
        (v_case_id, 'What is the best treatment for DILE?', '["More Hydralazine","Discontinue the offending drug","Lifelong steroids","None"]', 1, 'Symptoms and lab abnormalities usually resolve after the drug is stopped.');

    ---------------------------------------------------------------------------
    -- CASE 57: The ''Target'' and the ''Cryptococcus''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Cryptococcus''', 'An HIV patient with a low CD4 count presents with ''umbilicated'' papules on his face that look like Molluscum, but he is also febrile and confused.

Vitals: T 38.8 C.
Physical Examination: Widespread pearly, umbilicated papules.
Laboratory Results: A skin biopsy is performed and stained with ''India Ink'' and ''Mucicarmine''.', 57)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''Mucicarmine'' stain highlight in Cryptococcus?', '["DNA","The thick polysaccharide capsule (turns it red/pink)","The nucleus","None"]', 1, 'The capsule is the hallmark of Cryptococcus neoformans.'),
        (v_case_id, 'The ''India Ink'' preparation of CSF (or tissue) highlights what?', '["The organism itself","The ''halo'' created by the thick capsule that excludes the ink particles","Nothing","None"]', 1, 'The clear halo is diagnostic.'),
        (v_case_id, 'In an immunosuppressed patient, umbilicated facial papules should ALWAYS prompt an evaluation for what?', '["Acne","Disseminated deep fungal infection (e.g., Cryptococcosis, Histoplasmosis)","Normal Molluscum","None"]', 1, 'Molluscum-like lesions can be a ''skin sign'' of a life-threatening systemic infection.');

    ---------------------------------------------------------------------------
    -- CASE 58: The ''Target'' and the ''Prion''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Prion''', 'This is a theoretical question on high-yield infection control.

Vitals: Normal.
Physical Examination: None.
Laboratory Results: None.', 58)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which ''Surgical'' decontamination method is REQUIRED for instruments used on a patient with suspected Prion disease (e.g., CJD)?', '["Standard autoclaving","Extended autoclaving and/or concentrated Sodium Hydroxide (Bleach) exposure","Hand washing","None"]', 1, 'Prions are highly resistant to standard sterilization methods.'),
        (v_case_id, 'Is the skin considered a ''high-risk'' tissue for prion transmission?', '["Yes","No, CNS and lymphoid tissues are high-risk; skin is considered low-risk, but precautions are still taken during biopsies","Only in the elderly","None"]', 1, 'The brain and spinal cord are the most infectious tissues.'),
        (v_case_id, 'What is the pathognomonic feature of Prion disease in a brain biopsy?', '["Inflammation","Spongiform change (vacuolation of the neuropil)","Bacteria","None"]', 1, 'This ''sponge-like'' appearance is diagnostic.');

    ---------------------------------------------------------------------------
    -- CASE 59: The ''Target'' and the ''Grenz'' Zone
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Grenz'' Zone', 'A pathology report mentions a ''Grenz zone'' in a biopsy of a reddish-brown plaque on the nose.

Vitals: Normal.
Physical Examination: Firm, red plaque on the nasal bridge (Granuloma Faciale).
Laboratory Results: Biopsy shows a dense dermal infiltrate.', 59)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a ''Grenz Zone''?', '["A type of cancer","A narrow band of UNINVOLVED (normal) dermis separating the epidermis from an underlying dermal infiltrate","A scar","None"]', 1, 'The ''clear'' space is characteristic of conditions like Granuloma Faciale or Leprosy.'),
        (v_case_id, 'Besides Granuloma Faciale, which classic ''Step'' infection shows a prominent Grenz zone?', '["Staphylococcal infection","Lepromatous Leprosy","Acne","None"]', 1, 'In lepromatous leprosy, the Grenz zone separates the ''foamy'' macrophage infiltrate from the epidermis.'),
        (v_case_id, 'Granuloma Faciale is primarily composed of which cell type?', '["Lymphocytes only","A ''mixed'' infiltrate including many eosinophils and neutrophils","Fungus","None"]', 1, 'The mixed nature of the infiltrate is a key histologic clue.');

    ---------------------------------------------------------------------------
    -- CASE 60: The ''Target'' and the ''Wood'' (Erythrasma Review)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Wood'' (Erythrasma Review)', 'A quick review of Wood''''s lamp basics.

Vitals: Normal.
Physical Examination: None.
Laboratory Results: None.', 60)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which Wood''s lamp color matches Pseudomonas infection in a wound?', '["Coral-red","Bright green (due to Pyoverdin)","Yellow","None"]', 1, 'Pseudomonas produces fluorescent pigments.'),
        (v_case_id, 'Which Wood''s lamp color matches Porphyria Cutanea Tarda (Urine)?', '["Pink/Coral-red","Green","Blue","None"]', 0, 'Porphyrins glow red/pink.'),
        (v_case_id, 'Which Wood''s lamp color matches Vitiligo?', '["Green","Bright blue-white (enhancement, not true fluorescence)","Orange","None"]', 1, 'Total loss of melanin allows UV light to penetrate to the collagen.');

    ---------------------------------------------------------------------------
    -- CASE 61: The ''Target'' and the ''Biopsy'' (Vesicle)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Vesicle)', 'A patient has a suspected dermatitis herpetiformis (DH).

Vitals: Normal.
Physical Examination: Small, extremely itchy vesicles on the elbows.
Laboratory Results: A biopsy is taken for DIF.', 61)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the characteristic DIF pattern for Dermatitis Herpetiformis?', '["Linear IgG","Granular IgA deposits at the tips of the dermal papillae","Net-like IgG","None"]', 1, 'IgA deposition is the diagnostic gold standard for DH.'),
        (v_case_id, 'Dermatitis Herpetiformis is the cutaneous manifestation of which systemic disease?', '["Diabetes","Celiac Disease (Gluten-sensitive enteropathy)","Asthma","None"]', 1, 'Almost all DH patients have some degree of gluten sensitivity.'),
        (v_case_id, 'Where is the ''Best'' place to biopsy for DH?', '["Directly from a vesicle","Perilesional (normal-appearing) skin","The center of a scar","None"]', 1, 'Inflammation within the vesicle destroys the IgA; perilesional skin preserves it.');

    ---------------------------------------------------------------------------
    -- CASE 62: The ''Target'' and the ''Imaging'' (CT in SJS)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (CT in SJS)', 'A patient with Stevens-Johnson Syndrome (SJS) is being evaluated in the ER.

Vitals: T 39.0 C, BP 100/60.
Physical Examination: Skin sloughing and oral erosions.
Laboratory Results: None.', 62)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is a Chest X-ray or CT often performed in SJS/TEN patients?', '["To see the skin","To screen for ''Inhalation'' injury (sloughing of the bronchial epithelium) or pneumonia","To check for broken bones","None"]', 1, 'The ''skin'' sloughing in TEN can involve the entire respiratory tract.'),
        (v_case_id, 'What is the most common cause of death in SJS/TEN?', '["Heart attack","Sepsis (due to loss of the skin barrier)","The drug reaction itself","None"]', 1, 'Infection is the leading killer.'),
        (v_case_id, 'Is ''Nikolsky sign'' positive in SJS?', '["No","Yes, the epidermis is necrolytic and slides easily away from the dermis","Only in the eyes","None"]', 1, 'Nikolsky is a hallmark of epidermal detachment.');

    ---------------------------------------------------------------------------
    -- CASE 63: The ''Target'' and the ''Scabies'' (Norwegian)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Scabies'' (Norwegian)', 'An elderly patient with dementia in a nursing home has ''thick, crusty'' scale on his hands and feet. He doesn''''t itch much.

Vitals: Normal.
Physical Examination: Massive, gray-yellow hyperkeratotic crusting.
Laboratory Results: A single skin scraping shows ''hundreds'' of mites.', 63)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why does the patient NOT itch much despite the massive mite load?', '["He is old","Immunocompromised or debilitated patients may lack the vigorous hypersensitivity response that causes itching","The mites are dead","None"]', 1, 'The lack of itch is common in crusted scabies.'),
        (v_case_id, 'How many mites are typically present in a ''normal'' case of scabies?', '["Thousands","10-15 total","1 million","None"]', 1, 'Normal scabies has very few mites; crusted scabies has millions.'),
        (v_case_id, 'What is the management of choice for crusted scabies?', '["Topical Permethrin only","Combination of oral Ivermectin AND topical Permethrin/Sulfur","Antibiotics","None"]', 1, 'Systemic therapy is mandatory for the high burden of mites.');

    ---------------------------------------------------------------------------
    -- CASE 64: The ''Target'' and the ''Biopsy'' (Depth)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Depth)', 'A patient with a suspected deep fungal infection is having a biopsy.

Vitals: Normal.
Physical Examination: Nodule on the leg.
Laboratory Results: None.', 64)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which specific histologic ''fixative'' is used for standard H&E processing?', '["Michel''s medium","10% Buffered Formalin","Water","None"]', 1, 'Formalin preserves architecture but kills organisms/proteins.'),
        (v_case_id, 'Why is ''splitting'' the biopsy into Formalin and Saline essential for a suspected infection?', '["To be safe","Formalin allows for architecture and specialized stains (PAS/GMS); Saline allows for live tissue culture","No reason","None"]', 1, 'This is a key procedural point for medical exams.'),
        (v_case_id, 'If the PAS/GMS stains are negative, but the culture is positive, which is correct?', '["Pathology","Culture (it is more sensitive for low numbers of organisms)","Both are wrong","None"]', 1, 'Culture can detect a single viable organism; stains require many.');

    ---------------------------------------------------------------------------
    -- CASE 65: The ''Target'' and the ''ANA'' (Pattern)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''ANA'' (Pattern)', 'A patient has a positive ANA with a ''Nucleolar'' pattern.

Vitals: Normal.
Physical Examination: Thick skin on the hands.
Laboratory Results: ANA 1:640, Nucleolar.', 65)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The ''Nucleolar'' ANA pattern is most characteristic of which disease?', '["Lupus","Systemic Sclerosis (Scleroderma)","RA","None"]', 1, 'Specific patterns (homogeneous, speckled, nucleolar, centromere) point toward specific diseases.'),
        (v_case_id, 'Which pattern is classic for Drug-induced Lupus?', '["Nucleolar","Homogeneous (associated with anti-histone antibodies)","Centromere","None"]', 1, 'Homogeneous patterns are common in DILE and SLE.'),
        (v_case_id, 'What does the ''Speckled'' pattern indicate?', '["Lupus","Non-specific (seen in SLE, Sjögren''s, MCTD)","Normal","None"]', 1, 'Speckled is the most common and least specific pattern.');

    ---------------------------------------------------------------------------
    -- CASE 66: The ''Target'' and the ''Porphyrin'' (Screen)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Porphyrin'' (Screen)', 'A quick review of Porphyria screening.

Vitals: Normal.
Physical Examination: None.
Laboratory Results: None.', 66)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial Test'' to screen for Porphyria Cutanea Tarda (PCT)?', '["Total plasma porphyrins or 24-hour urine porphyrins","Liver biopsy","Blood sugar","None"]', 0, 'Plasma/Urine porphyrins will be markedly elevated.'),
        (v_case_id, 'What is the best initial screening test for ''Acute Intermittent Porphyria'' (AIP)?', '["Skin biopsy","Urine Porphobilinogen (PBG) during an attack","Blood pressure","None"]', 1, 'AIP is a neurovisceral porphyria; PBG is the marker.'),
        (v_case_id, 'Which ''Metal'' can worsen porphyria and should be avoided?', '["Zinc","Iron (Overload is common in PCT)","Magnesium","None"]', 1, 'Phlebotomy works by depleting iron stores.');

    ---------------------------------------------------------------------------
    -- CASE 67: The ''Target'' and the ''Dermoscopy'' (Lice)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Dermoscopy'' (Lice)', 'A school nurse uses a dermatoscope to look at a child''''s scalp.

Vitals: Normal.
Physical Examination: Itching scalp.
Laboratory Results: Dermoscopy shows ''oval structures glued to the hair shaft''.', 67)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best way to distinguish between a ''Nit'' and ''Dandruff'' under a dermatoscope?', '["Color","Nits are firmly attached to the hair shaft; dandruff (scale) is loose and can be easily moved","Nits are larger","None"]', 1, 'Attachment is the key differentiator.'),
        (v_case_id, 'What does a ''live'' nit look like compared to an empty one?', '["Live nits are dark and contain a developing nymph; empty ones are white/translucent","No difference","Empty ones are bigger","None"]', 0, 'The presence of a nymph indicates an active infection.'),
        (v_case_id, 'Where should you look for ''Lice'' eggs on the head?', '["On the face","Close to the scalp (within 1cm), especially behind the ears and at the nape of the neck","The top of the head","None"]', 1, 'Heat from the scalp is needed for incubation.');

    ---------------------------------------------------------------------------
    -- CASE 68: The ''Target'' and the ''Biopsy'' (Melanoma Depth)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Melanoma Depth)', 'A final question on melanoma staging.

Vitals: Normal.
Physical Examination: None.
Laboratory Results: None.', 68)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which staging system is currently used to determine T-stage in melanoma?', '["Clark Level (Anatomical level of invasion)","Breslow Thickness (Absolute depth in millimeters)","The mole''s weight","None"]', 1, 'Breslow thickness is the standard for the AJCC staging system.'),
        (v_case_id, 'Breslow thickness is measured from which layer to the deepest tumor cell?', '["Stratum corneum","Granular layer (or ulcer base)","Dermis","None"]', 1, 'The granular layer is the starting point for measurement.'),
        (v_case_id, 'Is ''Ulceration'' considered in the T-staging?', '["No","Yes, the presence of ulceration automatically increases the ''b'' category (e.g., T1a vs T1b)","Only in the elderly","None"]', 1, 'Ulceration is an independent high-risk prognostic feature.');

    ---------------------------------------------------------------------------
    -- CASE 69: The ''Target'' and the ''Imaging'' (Dermal Ultrasound)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imaging'' (Dermal Ultrasound)', 'A patient with a suspected BCC is having ''High-frequency Ultrasound'' (HFUS) in the clinic.

Vitals: Normal.
Physical Examination: BCC.
Laboratory Results: HFUS shows a ''hypoechoic area'' with specific dimensions.', 69)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary clinical use of HFUS in skin cancer management?', '["To cure the cancer","To estimate the ''depth'' and ''lateral margins'' of the tumor before surgery","To see the bone","None"]', 1, 'It is a helpful ''pre-surgical'' mapping tool.'),
        (v_case_id, 'Is HFUS a replacement for a biopsy?', '["Yes","No, it cannot provide the histologic diagnosis needed for treatment","Only for children","None"]', 1, 'Pathology remains the only definitive way to diagnose BCC.'),
        (v_case_id, 'Which specific ''layer'' of the skin does HFUS visualize best?', '["The bone","The dermis and dermo-epidermal junction","The brain","None"]', 1, 'High frequency (20-50 MHz) allows for high-resolution imaging of superficial structures.');

    ---------------------------------------------------------------------------
    -- CASE 70: The ''Itch'' and the ''Scraping'' (Final Tips)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Scraping'' (Final Tips)', 'A final review of lab procedures.

Vitals: Normal.
Physical Examination: Patient is ready.
Laboratory Results: None.', 70)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which ''Prep'' is used to identify the ''Yeast'' form of Candida?', '["Wood''s lamp","KOH prep (showing pseudohyphae and budding yeast)","Gram stain","None"]', 1, 'KOH is the rapid test for all fungi.'),
        (v_case_id, 'Which procedure is used to identify the ''Mite'' in Scabies?', '["Wood''s lamp","Skin scraping with mineral oil","Tzanck smear","None"]', 1, 'Mineral oil prevents the mites from crawling away.'),
        (v_case_id, 'Which procedure is used to identify the ''Cells'' in a suspected bullous disease?', '["Tzanck smear","Biopsy for Histology (H&E)","None","Both 1 and 2"]', 3, 'H&E provides architecture; Tzanck is for rapid bedside cell assessment (especially for virus).');

    ---------------------------------------------------------------------------
    -- CASE 71: The Tzanck Smear (Pemphigus)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Tzanck Smear (Pemphigus)', 'A Tzanck smear is performed on a patient with flaccid blisters.

Vitals: Normal.
Physical Examination: Mouth ulcers and skin erosions.
Laboratory Results: Tzanck smear shows ''acantholytic cells'' (rounded keratinocytes with large nuclei) but NO multinucleated giant cells.', 71)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'In the context of a flaccid blister, acantholytic cells WITHOUT multinucleated giant cells suggest:', '["HSV","Pemphigus Vulgaris","VZV","None"]', 1, 'Acantholysis is the primary process in Pemphigus; viral infections show both acantholysis AND characteristic multinucleation.'),
        (v_case_id, 'What is the ''Tzanck cell'' specifically?', '["A white blood cell","An acantholytic keratinocyte","A fungal spore","None"]', 1, 'These cells lose their connections and become spherical.'),
        (v_case_id, 'Is the Tzanck smear sufficient for a definitive diagnosis of Pemphigus?', '["Yes","No, DIF and Histology are required for confirmation","Only in the mouth","None"]', 1, 'It is a rapid bedside screen, not a definitive test.');

    ---------------------------------------------------------------------------
    -- CASE 72: The ''Dark'' Lacunae
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Dark'' Lacunae', 'A dermoscopic exam of a dark purple, slightly scaly papule on the scrotum.

Vitals: Normal.
Physical Examination: Multiple 2-4 mm dark purple papules on the scrotum.
Laboratory Results: Dermoscopy shows ''large, well-demarcated dark red to blue-black lacunae''.', 72)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The presence of dark lacunae in this location is classic for:', '["Melanoma","Angiokeratoma (of Fordyce)","BCC","Wart"]', 1, 'Angiokeratomas are benign vascular ectasias.'),
        (v_case_id, 'A large number of angiokeratomas in a young patient should prompt screening for which metabolic disorder?', '["Diabetes","Fabry Disease (alpha-galactosidase A deficiency)","Gout","None"]', 1, 'Angiokeratoma corporis diffusum is a hallmark of Fabry disease.'),
        (v_case_id, 'How does the ''scale'' on an angiokeratoma affect the dermoscopic view?', '["It makes it clearer","It can hide the lacunae, requiring the use of ultrasound gel or alcohol to increase transparency","No effect","None"]', 1, 'Interface fluid improves the dermoscopic visualization of vascular structures.');

    ---------------------------------------------------------------------------
    -- CASE 73: The ''Palisaded'' Mucin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Palisaded'' Mucin', 'A pathology report for an annular rash describes ''palisaded granulomas surrounding central mucin and degenerated collagen''.

Vitals: Normal.
Physical Examination: Non-scaly annular plaque on the hand.
Laboratory Results: Biopsy results received.', 73)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The presence of ''mucin'' in the center of a palisaded granuloma is a key feature of:', '["Sarcoidosis","Granuloma Annulare (GA)","Rheumatoid nodules","None"]', 1, 'GA is characterized by interstitial mucin deposition.'),
        (v_case_id, 'How do ''Rheumatoid Nodules'' differ histologically from GA?', '["They have no granulomas","They have a more ''fibrinoid'' center and LACK significant mucin","They are identical","None"]', 1, 'Fibrin vs. Mucin is the classic histologic differentiator.'),
        (v_case_id, 'What is ''Mucin'' on a standard H&E stain?', '["Bright red","Stringy, pale blue or grey material between collagen bundles","Black","None"]', 1, 'Special stains like Alcian Blue can make mucin much easier to see.');

    ---------------------------------------------------------------------------
    -- CASE 74: The ''Tiered'' Granuloma
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Tiered'' Granuloma', 'A pathology report for a yellow shin plaque describes ''tiered, horizontal (sandwich-like) granulomatous inflammation throughout the dermis''.

Vitals: Normal.
Physical Examination: Yellowish-brown plaque on the shin.
Laboratory Results: None.', 74)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Tiered'' or ''Horizontal'' granuloma refer to?', '["Granulomas in a circle","Alternating layers of inflammation and degenerated collagen throughout the thickness of the dermis","A scar","None"]', 1, 'This ''layer-cake'' appearance is classic for NL.'),
        (v_case_id, 'Which specific histologic finding is often seen in the vessels of NL?', '["Vasculitis","Granulomatous vasculitis or wall thickening","Normal vessels","None"]', 1, 'Vascular changes contribute to the tissue degeneration.'),
        (v_case_id, 'Is there mucin in Necrobiosis Lipoidica?', '["Yes, lots","Usually very little or none (unlike GA)","Only in the center","None"]', 1, 'The lack of mucin helps distinguish NL from GA.');

    ---------------------------------------------------------------------------
    -- CASE 75: The ''Dotted'' Vessels
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Dotted'' Vessels', 'A dermoscopic exam of a scaly scalp patch.

Vitals: Normal.
Physical Examination: Red, scaly patch on the scalp.
Laboratory Results: Dermoscopy shows ''regularly distributed dotted vessels'' and ''silver-white scale''.', 75)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Regularly distributed ''dotted'' vessels are highly characteristic of:', '["Seborrheic dermatitis","Psoriasis","Tinea capitis","None"]', 1, 'The vessels represent the elongated dermal papillae seen in psoriasis.'),
        (v_case_id, 'How would ''Seborrheic Dermatitis'' differ on dermoscopy?', '["It would be the same","It shows more ''yellowish'' (greasy) scale and less regular, thinner vessels","It has no vessels","None"]', 1, 'Seb derm has ''greasy'' scale; psoriasis has ''micaceous'' (silver-white) scale.'),
        (v_case_id, 'What is the ''Auspitz sign'' correlating with these vessels?', '["A rash","Pinpoint bleeding after scraping the silver scale, due to the proximity of the dilated vessels to the surface","A fever","None"]', 1, 'Dermoscopy provides the structural explanation for this clinical sign.');

    ---------------------------------------------------------------------------
    -- CASE 76: The ''Punched-Out'' Erosion
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Punched-Out'' Erosion', 'An X-ray of the big toe of a patient with a painful, swollen joint.

Vitals: Normal.
Physical Examination: Swollen, red first MTP joint (Podagra).
Laboratory Results: X-ray shows ''punched-out'' bone erosions with ''overhanging edges''.', 76)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The ''overhanging edge'' (Martel''s sign) on X-ray is classic for:', '["Rheumatoid arthritis","Gout","Osteoarthritis","None"]', 1, 'This is a late finding in chronic tophaceous gout.'),
        (v_case_id, 'How do ''Rheumatoid Arthritis'' erosions differ?', '["They are larger","They are ''marginal'' (at the edges of the joint) and associated with periarticular osteopenia","They don''t exist","None"]', 1, 'The location and quality of the bone help distinguish the two.'),
        (v_case_id, 'What is the ''Gold Standard'' for diagnosing an acute gout flare?', '["X-ray","Joint aspiration showing negatively birefringent needle-shaped crystals","Serum uric acid level","None"]', 1, 'Note: Serum uric acid can be NORMAL during an acute flare.');

    ---------------------------------------------------------------------------
    -- CASE 77: The ''Target'' and the ''Ovarian'' CT
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Ovarian'' CT', 'A 55-year-old woman is diagnosed with Dermatomyositis.

Vitals: Normal.
Physical Examination: Heliotrope rash and proximal muscle weakness.
Laboratory Results: CK is 2000. CT of the abdomen/pelvis is ordered.', 77)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'In an older woman with Dermatomyositis, which cancer has the strongest association?', '["Lung","Ovarian Cancer","Breast Cancer","Colon Cancer"]', 1, 'Ovarian cancer is highly over-represented in female DM patients.'),
        (v_case_id, 'Is malignancy screening recommended for ''Juvenile'' (childhood) Dermatomyositis?', '["Yes, same as adults","No, juvenile DM is generally NOT associated with malignancy","Only if they have a cough","None"]', 1, 'The paraneoplastic risk is primarily in adults.'),
        (v_case_id, 'Besides CT, what is a common ''screening'' test for ovarian cancer in these patients?', '["Blood sugar","Pelvic Ultrasound and CA-125 level","UA","None"]', 1, 'Multi-modal screening is often used.');

    ---------------------------------------------------------------------------
    -- CASE 78: The ''Target'' and the ''ASO'' Titer
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''ASO'' Titer', 'An 8-year-old child presents with dozens of small, scaly ''teardrop'' spots all over his body, two weeks after a sore throat.

Vitals: Normal.
Physical Examination: Guttate (teardrop) psoriasis.
Laboratory Results: An ''ASO'' (Antistreptolysin O) titer is elevated.', 78)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does an elevated ASO titer indicate?', '["Active psoriasis","A recent Group A Streptococcal infection","A fungal infection","None"]', 1, 'Guttate psoriasis is frequently triggered by a preceding Strep throat or skin infection.'),
        (v_case_id, 'What is the most common management for post-streptococcal guttate psoriasis?', '["Chemotherapy","Antibiotics (to treat any remaining Strep) and Phototherapy or topical steroids","Surgery","None"]', 1, 'Clearing the infection often helps the psoriasis resolve.'),
        (v_case_id, 'Will this patient eventually develop ''Chronic Plaque Psoriasis''?', '["No, it always resolves","About 30-40% of guttate cases eventually progress to classic plaque psoriasis","Yes, 100%","None"]', 1, 'The prognosis is variable.');

    ---------------------------------------------------------------------------
    -- CASE 79: The ''Target'' and the ''False'' RPR
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''False'' RPR', 'A pregnant woman with a history of Lupus has a positive RPR screen for Syphilis. Her confirmatory FTA-ABS is NEGATIVE.

Vitals: Normal.
Physical Examination: No lesions.
Laboratory Results: RPR (+), FTA-ABS (-).', 79)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely reason for this patient''s positive RPR?', '["She has syphilis","A ''Biological False Positive'' (BFP) due to her underlying Lupus or Pregnancy","The lab made a mistake","None"]', 1, 'Non-treponemal tests (RPR/VDRL) are not specific and can be triggered by other conditions.'),
        (v_case_id, 'Which antibody in Lupus is most commonly associated with a false-positive RPR?', '["Anti-Smith","Antiphospholipid antibodies (e.g., Lupus Anticoagulant, Anti-cardiolipin)","Anti-Ro","None"]', 1, 'The RPR test uses cardiolipin as an antigen.'),
        (v_case_id, 'Besides Lupus and Pregnancy, what is another common cause of a BFP RPR?', '["Viral infections (e.g., Mono, HIV, Hepatitis)","Eating too much meat","Drinking coffee","None"]', 0, 'Acute viral infections are a frequent cause of transient BFP.');

    ---------------------------------------------------------------------------
    -- CASE 80: The ''Target'' and the ''Hives'' (Histology)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Hives'' (Histology)', 'A biopsy of a classic ''hive'' (urticaria) that has been present for 4 hours.

Vitals: Normal.
Physical Examination: Transient erythematous wheal.
Laboratory Results: Histology shows ''mild dermal edema and a sparse perivascular infiltrate of lymphocytes, eosinophils, and neutrophils''.', 80)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Is there any damage to the ''blood vessel wall'' in classic urticaria?', '["Yes, always","No, the vessels are dilated (edema) but the walls are intact; this distinguishes it from vasculitis","Only if it is red","None"]', 1, 'Vasculitis (LCV) shows fibrinoid necrosis; urticaria does not.'),
        (v_case_id, 'If the ''hive'' stays in the same spot for > 24 hours, what should you suspect?', '["Simple urticaria","Urticarial Vasculitis (which requires a biopsy for confirmation)","A food allergy","None"]', 1, 'Duration > 24 hours and bruising (purpura) are ''Red Flags'' for vasculitis.'),
        (v_case_id, 'What is ''Angioedema'' compared to Urticaria?', '["A different disease","The same process but occurring deeper in the dermis and subcutaneous tissue","Only in the eyes","None"]', 1, 'They often occur together.');

    RAISE NOTICE 'Finished populating 80 cases for case-labs-imaging.';
END $$;

COMMIT;
