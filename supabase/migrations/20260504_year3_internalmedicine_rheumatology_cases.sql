BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'rheumatology' LIMIT 1;

    -- CASE 01: Rheumatoid Arthritis (RA)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Symmetrical Small Joint Stiffness', 'A 45-year-old female presents with 6 months of pain and stiffness in her hands and wrists. The stiffness is worst in the morning and lasts for about 2 hours. On exam, she has boggy swelling of the MCP and PIP joints symmetrically.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following joint groups is typically SPARED in RA?', '["MCP joints", "PIP joints", "DIP joints", "Wrists"]', 2, 'DIP involvement is characteristic of Osteoarthritis or Psoriatic Arthritis, not RA.'),
    (v_case_id, 'What is the most specific laboratory test for RA?', '["Rheumatoid Factor (RF)", "Anti-Cyclic Citrullinated Peptide (CCP) antibody", "ANA", "ESR"]', 1, 'Anti-CCP is more specific than RF for the diagnosis of RA.'),
    (v_case_id, 'What is the first-line Disease-Modifying Anti-Rheumatic Drug (DMARD)?', '["Prednisone", "Methotrexate", "Infliximab", "Aspirin"]', 1, 'Methotrexate is the gold standard for initial RA therapy.');

    -- CASE 02: Systemic Lupus Erythematosus (SLE)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Malar Rash and Joint Pain', 'A 28-year-old African American female presents with fatigue, joint pain, and a red rash across her cheeks and the bridge of her nose. She also reports sensitivity to sunlight.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best initial screening test for SLE?', '["Anti-dsDNA", "Anti-Smith", "Anti-Nuclear Antibody (ANA)", "Anti-Ro"]', 2, 'ANA is highly sensitive (> 95%) but not very specific.'),
    (v_case_id, 'Which antibody is highly specific for SLE and correlates with disease activity and renal involvement?', '["Anti-Smith", "Anti-dsDNA", "Anti-histone", "Anti-centromere"]', 1, 'Anti-dsDNA levels fluctuate with disease flares and are linked to lupus nephritis.'),
    (v_case_id, 'What is the "Anti-histone" antibody a classic marker for?', '["Systemic Sclerosis", "Drug-induced Lupus", "Sjögren syndrome", "RA"]', 1, 'Seen in lupus triggered by drugs like Hydralazine, Isoniazid, or Procainamide.');

    -- CASE 03: Gout (Acute)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Painful Great Toe after a Steak Dinner', 'A 55-year-old male presents with sudden, exquisite pain and swelling in his right great toe. He attended a party last night where he consumed steak and several beers.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for gout involving the first MTP joint?', '["Podagra", "Chiragra", "Gonagra", "Bursitis"]', 0, 'Podagra is the classic term for 1st MTP gout.'),
    (v_case_id, 'Joint aspiration is performed. What is the characteristic finding on polarized light microscopy?', '["Positively birefringent, rhomboid crystals", "Negatively birefringent, needle-shaped crystals", "Bacteria", "Blood only"]', 1, 'Monosodium urate crystals are yellow when parallel to the compensator.'),
    (v_case_id, 'What is the first-line treatment for an ACUTE gout flare?', '["Allopurinol", "NSAIDS, Colchicine, or Steroids", "Febuxostat", "Probenecid"]', 1, 'Do NOT start urate-lowering therapy like allopurinol during an acute flare, as it can worsen the attack.');

    -- CASE 04: Pseudogout (CPPD)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Knee Pain in an 80-year-old', 'An 82-year-old female presents with acute pain and swelling in her left knee. X-ray shows calcification of the articular cartilage (chondrocalcinosis). Joint aspiration shows rhomboid-shaped crystals.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the composition of the crystals in pseudogout?', '["Monosodium urate", "Calcium Pyrophosphate", "Calcium Oxalate", "Cholesterol"]', 1, 'Calcium pyrophosphate dihydrate (CPPD).'),
    (v_case_id, 'How do these crystals appear under polarized light?', '["Negatively birefringent (yellow)", "Weakly positively birefringent (blue when parallel)", "Non-birefringent", "Opaque"]', 1, 'Distinguishes them from the bright yellow needles of gout.'),
    (v_case_id, 'Pseudogout is associated with which underlying metabolic condition?', '["Hypothyroidism", "Hyperparathyroidism and Hemochromatosis", "Diabetes", "Gout"]', 1, 'Commonly seen in these conditions.');

    -- CASE 05: Ankylosing Spondylitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chronic Low Back Pain Relieved by Exercise', 'A 25-year-old male presents with 2 years of progressive lower back pain and stiffness. The stiffness is worst in the morning and improves with exercise. On exam, he has limited spinal flexion (modified Schober test).', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic radiographic finding in advanced disease?', '["Bamboo Spine", "Lytic lesions", "Osteophytes", "Codman triangle"]', 0, 'Due to fusion of the vertebrae (syndesmophytes).'),
    (v_case_id, 'Which genetic marker is present in > 90% of patients?', '["HLA-DR4", "HLA-B27", "HLA-DQ8", "HLA-B51"]', 1, 'A common feature of the seronegative spondyloarthropathies.'),
    (v_case_id, 'What is a common extra-articular manifestation of ankylosing spondylitis?', '["Malar rash", "Acute Anterior Uveitis", "Glomerulonephritis", "Liver failure"]', 1, 'Sudden-onset painful red eye.');

    -- CASE 06: Reactive Arthritis (Reiter''s Syndrome)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Can''t see, can''t pee, can''t climb a tree"', 'A 24-year-old male presents with a swollen right knee and left ankle. He also notes burning with urination and red, watery eyes. Three weeks ago, he had a "stomach bug" with bloody diarrhea.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic triad of reactive arthritis?', '["Fever, pain, rash", "Urethritis, Uveitis (or Conjunctivitis), and Arthritis", "Hematuria, HTN, Edema", "None"]', 1, 'Triggered by GI (Salmonella, Shigella) or GU (Chlamydia) infections.'),
    (v_case_id, 'What is the name for the scale-like rash on the palms and soles sometimes seen?', '["Keratoderma blennorrhagicum", "Erythema nodosum", "Lupus pernio", "Psoriasis"]', 0, 'A specific dermatological finding in reactive arthritis.'),
    (v_case_id, 'Is the joint fluid usually infected in reactive arthritis?', '["Yes, with bacteria", "No, it is a sterile inflammatory response", "Only in the knee", "None"]', 1, 'The joint is not infected directly; it is an immune reaction.');

    -- CASE 07: Psoriatic Arthritis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Swollen "Sausage" Digits and Pitting Nails', 'A 40-year-old male with a history of silver-scaled plaques on his elbows presents with pain in his distal finger joints. On exam, he has "sausage-like" swelling of several fingers (dactylitis) and pitting of his fingernails.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic radiographic finding in the finger joints?', '["Pencil-in-cup deformity", "Bamboo spine", "Joint space narrowing only", "Lytic lesions"]', 0, 'Classic for psoriatic arthritis.'),
    (v_case_id, 'Which joints are commonly involved in psoriatic arthritis that are SPARED in RA?', '["MCP", "PIP", "DIP", "Wrists"]', 2, 'Distal Interphalangeal (DIP) involvement is a key differentiator.'),
    (v_case_id, 'What is the medical term for "sausage digits"?', '["Synovitis", "Dactylitis", "Enthesitis", "Bursitis"]', 1, 'Inflammation of the entire digit.');

    -- CASE 08: Sjögren Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dry Eyes and Dry Mouth', 'A 50-year-old female complains that her eyes feel "gritty" like there is sand in them. She also mentions having to drink water constantly because her mouth is so dry.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two most common autoantibodies in Sjögren syndrome?', '["Anti-dsDNA and Anti-Smith", "Anti-Ro (SS-A) and Anti-La (SS-B)", "Anti-Jo-1", "c-ANCA"]', 1, 'Highly characteristic for Sjögren''s.'),
    (v_case_id, 'What test is used to measure tear production?', '["Schirmer test", "Rose Bengal stain", "Tonometry", "Slit lamp exam"]', 0, 'Placing a filter paper in the lower eyelid.'),
    (v_case_id, 'Patients with Sjögren syndrome are at a 40-fold increased risk for which malignancy?', '["Lung cancer", "Non-Hodgkin Lymphoma (B-cell)", "Breast cancer", "Thyroid cancer"]', 1, 'Often MALToma or diffuse large B-cell lymphoma.');

    -- CASE 09: Systemic Sclerosis (Limited/CREST)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tight Skin, Heartburn, and Blue Fingers', 'A 45-year-old female presents with fingers that turn white and blue in the cold. She has "tight" skin on her hands and face, and multiple tiny red "spider" veins on her chest. She also has severe heartburn.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the mnemonic "CREST" stand for?', '["Calcinosis, Raynaud, Esophageal dysmotility, Sclerodactyly, Telangiectasia", "Calcium, Renal, Anemia, Skin, Thyroid", "None", "Cough, Rash, Edema, Spleen, Tenderness"]', 0, 'The five key features of limited scleroderma.'),
    (v_case_id, 'Which antibody is highly specific for the LIMITED (CREST) form of systemic sclerosis?', '["Anti-Scl-70 (anti-topoisomerase)", "Anti-centromere antibody", "Anti-Jo-1", "Anti-dsDNA"]', 1, 'Distinguishes it from the diffuse form.'),
    (v_case_id, 'What is the most common cause of death in LIMITED systemic sclerosis?', '["Renal crisis", "Pulmonary Hypertension", "Heart failure", "Infection"]', 1, 'Occurs even without significant lung fibrosis.');

    -- CASE 10: Systemic Sclerosis (Diffuse)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rapidly Progressive Skin Thickening and Dyspnea', 'A 50-year-old female presents with rapid thickening of the skin on her trunk and upper arms. She has also developed a new dry cough and SOB on exertion. CXR shows interstitial lung disease.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which antibody is associated with the DIFFUSE form and increased risk of interstitial lung disease?', '["Anti-centromere", "Anti-Scl-70 (anti-topoisomerase I)", "Anti-Smith", "Anti-histone"]', 1, 'Predicts a more aggressive course with internal organ involvement.'),
    (v_case_id, 'What is a life-threatening complication of systemic sclerosis involving the kidneys?', '["Nephrotic syndrome", "Scleroderma Renal Crisis", "Stones", "Minimal change"]', 1, 'Sudden severe HTN and AKI; treated with ACE inhibitors.'),
    (v_case_id, 'What is the first-line treatment for Raynaud phenomenon?', '["Beta-blockers", "Calcium Channel Blockers (e.g., Nifedipine)", "Aspirin", "Steroids"]', 1, 'Help promote vasodilation.');

    -- CASE 11: Polymyositis and Dermatomyositis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Proximal Weakness and "Heliotrope" Rash', 'A 45-year-old female presents with difficulty rising from a chair and brushing her hair. On exam, she has a purplish rash around her eyelids and red, scaly patches over her knuckles.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the purple eyelid rash?', '["Malar rash", "Heliotrope rash", "Gottron papules", "Lupus pernio"]', 1, 'Pathognomonic for dermatomyositis.'),
    (v_case_id, 'Which enzyme is characteristically elevated in these disorders?', '["Amylase", "Creatine Kinase (CK)", "Alkaline phosphatase", "TSH"]', 1, 'Reflects muscle inflammation/damage.'),
    (v_case_id, 'Which antibody is highly specific for inflammatory myopathy and associated with interstitial lung disease?', '["Anti-dsDNA", "Anti-Jo-1", "Anti-histone", "Anti-centromere"]', 1, 'Anti-synthetase antibody.');

    -- CASE 12: Giant Cell Arteritis (Temporal Arteritis)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Headache and Jaw Pain in an Elderly Female', 'A 72-year-old female presents with a new-onset left-sided headache and pain in her jaw when she chews (jaw claudication). Her ESR is 100 mm/hr.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most feared complication of giant cell arteritis?', '["Stroke", "Permanent blindness (Ischemic optic neuropathy)", "Kidney failure", "Lung mass"]', 1, 'Due to involvement of the ophthalmic artery.'),
    (v_case_id, 'If you strongly suspect this diagnosis, what is the first step?', '["Wait for the biopsy result", "Start high-dose IV/Oral Steroids immediately", "CT Brain", "Antibiotics"]', 1, 'Do NOT wait for the biopsy if vision is at risk.'),
    (v_case_id, 'This condition is strongly associated with which other rheumatologic disorder?', '["RA", "Polymyalgia Rheumatica (PMR)", "SLE", "Gout"]', 1, 'PMR presents with proximal muscle stiffness (shoulders/hips) without weakness.');

    -- CASE 13: Polymyalgia Rheumatica (PMR)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Morning Stiffness in the Shoulders and Hips', 'A 70-year-old male presents with severe stiffness in his shoulders and pelvic girdle that makes it hard to get out of bed. He has NO muscle weakness on exam. His ESR is 80.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is PMR distinguished from Polymyositis?', '["PMR has weakness; Polymyositis does not", "PMR has stiffness but normal strength; Polymyositis has true weakness", "PMR has high CK", "None"]', 1, 'PMR is an inflammatory condition of the joints/bursae, not the muscles.'),
    (v_case_id, 'What is the characteristic response to treatment?', '["Rapid resolution of symptoms within 24-48 hours of starting low-dose steroids", "No response to steroids", "Requires methotrexate", "Needs surgery"]', 0, 'A diagnostic clue.'),
    (v_case_id, 'Does PMR cause permanent joint destruction?', '["Yes", "No", "Only in the hips", "None"]', 1, 'Unlike RA, it typically does not cause erosive disease.');

    -- CASE 14: Polyarteritis Nodosa (PAN)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Livedo Reticularis and Foot Drop in a Hep B Patient', 'A 50-year-old male with chronic Hepatitis B presents with abdominal pain after eating, a "mottled" purple rash on his legs (livedo reticularis), and sudden weakness in his right foot (foot drop).', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of vasculitis is PAN?', '["Large vessel", "Medium vessel", "Small vessel", "Capillary only"]', 1, 'Affects medium-sized muscular arteries.'),
    (v_case_id, 'Which organ is characteristically SPARED in PAN?', '["Kidney", "Heart", "Lungs", "Gut"]', 2, 'Involvement of the pulmonary vessels is extremely rare in PAN (unlike GPA).'),
    (v_case_id, 'What is seen on angiography of the mesenteric or renal vessels?', '["Long strictures", "Multiple small aneurysms and narrowings (string of beads)", "Complete occlusion", "Normal vessels"]', 1, 'Focal necrotizing inflammation weakens the wall.');

    -- CASE 15: Granulomatosis with Polyangiitis (Wegener''s)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sinusitis, Hemoptysis, and Hematuria', 'A 45-year-old male presents with chronic "sinus infections," bloody sputum, and dark urine. CXR shows cavitary nodules in the lungs.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most specific serological marker?', '["p-ANCA", "c-ANCA (Anti-PR3)", "ANA", "Anti-GBM"]', 1, 'Proteinase-3 ANCA.'),
    (v_case_id, 'What is the characteristic histological finding?', '["Non-caseating granulomas and necrotizing vasculitis", "Linear IgG", "Muddy brown casts", "Reed-Sternberg cells"]', 0, 'Affects the nasopharynx, lungs, and kidneys.'),
    (v_case_id, 'How is this distinguished from Goodpasture Syndrome?', '["Goodpasture involves the sinuses; GPA does not", "GPA involves the sinuses and has c-ANCA; Goodpasture spares the sinuses and has anti-GBM", "Both are the same", "None"]', 1, 'Upper airway involvement is a key clue for GPA.');

    -- CASE 16: Microscopic Polyangiitis (MPA)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemoptysis and Hematuria WITHOUT Granulomas', 'A 50-year-old male presents with rapidly progressive glomerulonephritis and pulmonary hemorrhage. He has no sinus symptoms and no granulomas on biopsy. He is p-ANCA positive.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["GPA", "Microscopic Polyangiitis (MPA)", "Goodpasture", "Lupus"]', 1, 'Similar to GPA but spares the upper respiratory tract and has NO granulomas.'),
    (v_case_id, 'Which ANCA is typically associated with MPA?', '["c-ANCA", "p-ANCA (Anti-MPO)", "ANA", "None"]', 1, 'Myeloperoxidase ANCA.'),
    (v_case_id, 'What type of vessels does MPA affect?', '["Large only", "Small vessels (capillaries, venules, arterioles)", "Aorta only", "None"]', 1, 'Small-vessel vasculitis.');

    -- CASE 17: Eosinophilic Granulomatosis with Polyangiitis (Churg-Strauss)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Asthma, Eosinophilia, and Vasculitis', 'A 40-year-old male with long-standing severe asthma presents with a new skin rash and numbness in his hands. Labs show a WBC of 15,000 with 30% eosinophils. He is p-ANCA positive.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["GPA", "Churg-Strauss Syndrome (EGPA)", "MPA", "Loeffler syndrome"]', 1, 'Vasculitis + Asthma + Peripheral Eosinophilia.'),
    (v_case_id, 'What is the most common cause of death in EGPA?', '["Lung failure", "Cardiac involvement (Myocarditis/Infarction)", "Renal failure", "Stroke"]', 1, 'Heart disease is a major complication.'),
    (v_case_id, 'Which antibody is most commonly associated with EGPA?', '["c-ANCA", "p-ANCA", "Anti-dsDNA", "Anti-centromere"]', 1, 'Present in ~50% of cases.');

    -- CASE 18: Takayasu Arteritis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Pulseless" Disease in a Young Female', 'A 25-year-old Asian female presents with fatigue and lightheadedness. On exam, her radial pulses are very weak, and there is a 30 mmHg difference in BP between her right and left arms.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of vasculitis is Takayasu?', '["Large vessel (Aorta and its branches)", "Medium vessel", "Small vessel", "Venous only"]', 0, 'Granulomatous inflammation of the aorta.'),
    (v_case_id, 'How is this distinguished from Giant Cell Arteritis?', '["GCA affects young people", "Takayasu affects young females (< 40); GCA affects elderly (> 50)", "They are the same", "None"]', 1, 'Age is the primary clinical differentiator.'),
    (v_case_id, 'What is the best imaging test for diagnosis?', '["Chest X-ray", "MRA or CT Angiography of the Aorta", "Echo", "Ultrasound of the wrist"]', 1, 'Visualizes narrowing or aneurysms of the large vessels.');

    -- CASE 19: Henoch-Schönlein Purpura (HSP)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Palpable Purpura and Abdominal Pain in a Child', 'A 7-year-old boy presents with a purple, "bumpy" rash on his buttocks and legs, abdominal pain, and swollen ankles. He had a sore throat last week. Urine shows microscopic hematuria.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["ITP", "Henoch-Schönlein Purpura (HSP)", "DIC", "Meningococcemia"]', 1, 'IgA-mediated small-vessel vasculitis.'),
    (v_case_id, 'What is the characteristic histological finding on skin biopsy?', '["Linear IgG", "Leukocytoclastic vasculitis with IgA deposition", "Granulomas", "Nothing"]', 1, 'Immune complexes containing IgA.'),
    (v_case_id, 'What is a common GI complication of HSP?', '["Liver failure", "Intussusception", "Pancreatitis", "Ulcers"]', 1, 'The bowel wall edema can lead to the bowel "telescoping" on itself.');

    -- CASE 20: Beh\u00e7et Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Recurrent Oral and Genital Ulcers', 'A 30-year-old male of Turkish descent presents with painful mouth ulcers for the 5th time this year. He also has painful ulcers on his scrotum and a red, painful eye (uveitis).', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Herpes", "Beh\u00e7et Syndrome", "Syphilis", "Lupus"]', 1, 'Common along the "Silk Road" (Middle East/Asia).'),
    (v_case_id, 'What is the "Pathergy" test?', '["Blood test", "Skin prick that results in a sterile pustule", "Eye test", "None"]', 1, 'Exaggerated inflammatory response to minor trauma.'),
    (v_case_id, 'What is the major cause of morbidity in Beh\u00e7et''s?', '["Mouth ulcers", "Uveitis leading to blindness and CNS involvement", "Liver failure", "Rash"]', 1, 'Ocular and neurological disease are the most serious complications.');

    -- CASE 21: Septic Arthritis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Red, Hot, Swollen Knee with Fever', 'A 60-year-old male with a history of knee replacement presents with a high fever and a red, swollen, exquisitely tender right knee. He cannot move the joint.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important diagnostic step?', '["MRI", "Arthrocentesis (joint aspiration) and fluid analysis", "Blood culture only", "Start antibiotics immediately"]', 1, 'Must analyze the fluid for WBC count, crystals, and Gram stain/culture.'),
    (v_case_id, 'What joint fluid WBC count is typically seen in septic arthritis?', '["< 2,000", "2,000 - 50,000", "> 50,000 (often > 100,000)", "Normal"]', 2, 'Very high leukocyte count with > 90% neutrophils.'),
    (v_case_id, 'What is the most common organism overall for septic arthritis?', '["N. gonorrhoeae", "Staphylococcus aureus", "Streptococcus", "Pseudomonas"]', 1, 'S. aureus is #1; Gonococcus is more common in young, sexually active adults.');

    -- CASE 22: Osteoarthritis (OA)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Knee Pain worse at the End of the Day', 'A 65-year-old overweight female presents with chronic knee pain. The pain is mild in the morning but gets progressively worse with walking and by the evening. She has no morning stiffness.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary pathophysiology of OA?', '["Autoimmune inflammation", "Degeneration of articular cartilage due to \"wear and tear\"", "Crystal deposition", "Infection"]', 1, 'Non-inflammatory "degenerative" joint disease.'),
    (v_case_id, 'What are the bony overgrowths at the DIP joints called?', '["Bouchard nodes", "Heberden nodes", "Rheumatoid nodules", "Tophi"]', 1, 'Heberden = DIP; Bouchard = PIP.'),
    (v_case_id, 'What is the characteristic radiographic finding in OA?', '["Joint space narrowing, osteophytes, and subchondral sclerosis", "Pencil-in-cup", "Bamboo spine", "Erosions"]', 0, 'Asymmetric joint space narrowing.');

    -- CASE 23: Fibromyalgia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Widespread Pain and "Brain Fog"', 'A 35-year-old female presents with 1 year of "aching all over," poor sleep, and fatigue. She feels she can''t concentrate. Labs: ESR, CRP, and ANA are all normal. On exam, she has multiple "tender points" but no joint swelling.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["RA", "SLE", "Fibromyalgia", "Chronic Fatigue Syndrome"]', 2, 'A disorder of central pain processing.'),
    (v_case_id, 'Which of the following is effective for treating fibromyalgia?', '["Prednisone", "Amitriptyline or Duloxetine", "Oxycodone", "Antibiotics"]', 1, 'TCAs, SNRIs, and anticonvulsants (Pregabalin) are used; opioids and steroids are NOT effective.'),
    (v_case_id, 'Fibromyalgia is characterized by:', '["Joint destruction", "Normal labs and no structural damage", "Muscle inflammation", "Skin rash"]', 1, 'It is a clinical diagnosis of exclusion.');

    -- CASE 24: Antiphospholipid Syndrome (Lupus Anticoagulant)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Prolonged PTT but Recurrent Clots', 'A patient with SLE is found to have a prolonged PTT (60 seconds) during routine testing. She has no history of bleeding but has had two DVTs and a stroke at age 35.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of the prolonged PTT?', '["Factor VIII deficiency", "Lupus Anticoagulant", "Heparin", "VWD"]', 1, 'The antibody interferes with the phospholipid in the PTT test kit, but it is pro-thrombotic in the body.'),
    (v_case_id, 'What happens in a "Mixing Study" for this patient?', '["The PTT corrects", "The PTT fails to correct", "The PTT becomes even longer", "None"]', 1, 'Failure to correct with normal plasma indicates an inhibitor (antibody).'),
    (v_case_id, 'What is the treatment for a patient with APS and a history of thrombosis?', '["Aspirin only", "Life-long Warfarin (INR 2-3)", "Prednisone", "No treatment"]', 1, 'Requires indefinite anticoagulation.');

    -- CASE 25: Felty Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'RA, Neutropenia, and Splenomegaly', 'A 60-year-old male with long-standing, erosive Rheumatoid Arthritis is found to have a WBC count of 1,500 (mostly neutropenia). On exam, he has a very large spleen.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Lupus", "Felty Syndrome", "CML", "Still''s Disease"]', 1, 'The triad of RA, Splenomegaly, and Neutropenia.'),
    (v_case_id, 'What is the major risk for these patients?', '["Bleeding", "Recurrent bacterial infections", "Stroke", "Kidney failure"]', 1, 'Due to the low neutrophil count.'),
    (v_case_id, 'How is Felty syndrome typically treated?', '["Splenectomy only", "Optimize RA treatment (e.g., Methotrexate)", "Antibiotics only", "None"]', 1, 'Treating the underlying RA usually improves the neutropenia.');

    -- CASE 26: Mixed Connective Tissue Disease (MCTD)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Features of Lupus, Scleroderma, and Myositis', 'A 35-year-old female presents with Raynaud phenomenon, swollen "puffy" fingers, and muscle weakness. Her labs show a high-titer ANA.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which antibody is the hallmark of MCTD?', '["Anti-dsDNA", "Anti-U1 RNP (Ribonucleoprotein)", "Anti-Smith", "Anti-histone"]', 1, 'Required for the diagnosis.'),
    (v_case_id, 'MCTD is characterized by "overlap" features of which diseases?', '["SLE, Scleroderma, and Polymyositis", "RA and Gout", "Vasculitis and Asthma", "None"]', 0, 'Combines features of several autoimmune diseases.'),
    (v_case_id, 'What is a common serious complication of MCTD?', '["Diabetes", "Pulmonary Hypertension", "Liver failure", "Stones"]', 1, 'A major cause of mortality.');

    -- CASE 27: Adult-Onset Still''s Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Daily Spiking Fevers and a Salmon-Colored Rash', 'A 30-year-old male presents with a 104\u00b0F fever that spikes once a day. Along with the fever, he gets a faint "salmon-colored" rash on his trunk and joint pain. His Ferritin is extremely high (5,000).', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Sepsis", "Adult-Onset Still''s Disease", "Lymphoma", "Lupus"]', 1, 'Characterized by evanescent rash, quotidian fevers, and very high ferritin.'),
    (v_case_id, 'The rash in Still''s disease is typically:', '["Itchy and permanent", "Evanescent (comes and goes with the fever) and non-pruritic", "Vesicular", "None"]', 1, 'A key diagnostic clue.'),
    (v_case_id, 'What is the first-line treatment?', '["Antibiotics", "NSAIDS or Steroids", "Chemotherapy", "Anticoagulation"]', 1, 'Anti-inflammatory therapy.');

    -- CASE 28: Cryoglobulinemic Vasculitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Purpura and Joint Pain in a Hep C Patient', 'A 50-year-old male with chronic Hepatitis C presents with palpable purpura on his legs, joint pain, and fatigue. Labs show low Complement (C4) levels and a positive Rheumatoid Factor.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["PAN", "Essential Mixed Cryoglobulinemia", "Lupus", "RA"]', 1, 'Strongly associated with Hepatitis C infection.'),
    (v_case_id, 'What are cryoglobulins?', '["Crystals", "Proteins that precipitate in the cold", "WBCs", "None"]', 1, 'Immune complexes that deposit in small vessels.'),
    (v_case_id, 'What is the most effective treatment for this patient?', '["Steroids only", "Treat the underlying Hepatitis C", "Splenectomy", "Aspirin"]', 1, 'Clearing the virus removes the stimulus for cryoglobulin production.');

    -- CASE 29: Paget Disease of Bone (Rheumatology)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Isolated Elevated Alk Phos and Bone Pain', 'A 70-year-old male presents with deep aching in his pelvis. Labs: Calcium 9.5 (Normal), Phos 3.5 (Normal), Alk Phos 400 (High). X-ray shows cortical thickening and coarsened trabeculae.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying mechanism of Paget''s?', '["Vitamin D deficiency", "Disorganized bone remodeling with overactive osteoclasts and osteoblasts", "Cancer", "Infection"]', 1, 'High-turnover bone disease.'),
    (v_case_id, 'What is a dangerous but rare late complication of Paget''s?', '["Osteosarcoma", "Leukemia", "Diabetes", "Stroke"]', 0, 'Risk is < 1% but highly aggressive.'),
    (v_case_id, 'What is the treatment of choice?', '["Calcium only", "Bisphosphonates", "Surgery", "Radiation"]', 1, 'To suppress the overactive osteoclasts.');

    -- CASE 30: Sarcoidosis (Rheumatologic manifestations)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'L\u00f6fgren Syndrome', 'A 32-year-old female presents with sudden-onset painful swelling of both ankles, erythema nodosum on her shins, and bilateral hilar lymphadenopathy on CXR.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this specific triad called?', '["Cushing Triad", "L\u00f6fgren Syndrome", "Charcot Triad", "Still Syndrome"]', 1, 'A classic acute presentation of sarcoidosis with a good prognosis.'),
    (v_case_id, 'Is a biopsy required if the full L\u00f6fgren triad is present?', '["Yes, always", "No, it is highly specific and can be diagnosed clinically", "Only if the patient is old", "None"]', 1, 'In the setting of the full triad, the specificity is > 95%.'),
    (v_case_id, 'What is the typical management for L\u00f6fgren syndrome?', '["Life-long steroids", "NSAIDS and supportive care (usually resolves in weeks)", "Chemotherapy", "Antibiotics"]', 1, 'Unlike chronic sarcoidosis, acute L\u00f6fgren''s usually resolves spontaneously.');

    RAISE NOTICE 'SUCCESS: Rheumatology Case Blocks (1-30) registered.';
END $$;

COMMIT;
