-- Batch 11: 31 Child Abuse Recognition MCQs (Questions 311-341)
-- Topic: Differential Diagnosis and Mimics
-- Slug: peds-child-abuse

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which skin condition involves blue-gray, flat macules, usually on the lower back, that are present from birth and are often mistaken for bruises?', 
'["Bruising from abuse", "Mongolian spots (Congenital Dermal Melanocytosis)", "Hemangioma", "Eczema"]'::jsonb, 
1, 
'Mongolian spots are common in infants of African, Asian, and Hispanic descent. They do not fade or change color like bruises and are not tender.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with linear, hyperpigmented marks on the skin that appeared after a picnic. The physician suspects they might be "drip" marks from a chemical burn. What is the most likely medical mimic?', 
'["Cigarette burns", "Phytophotodermatitis", "Impetigo", "Fixed drug eruption"]'::jsonb, 
1, 
'Phytophotodermatitis is a phototoxic reaction to "psoralens" in plants (like limes, lemons, or celery) followed by UV exposure. It creates bizarre, linear, or splash-like marks.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which bone disorder causes "brittle bones," blue sclera, and multiple fractures that can be mistaken for physical abuse?', 
'["Rickets", "Osteogenesis Imperfecta (OI)", "Scurvy", "Leukemia"]'::jsonb, 
1, 
'OI is a genetic defect in Type 1 collagen. While it mimics abuse, a skeletal survey in OI usually shows generalized osteopenia (thin bones), which is NOT a feature of child abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has bruising only on the shins and a "palpable purpuric" rash on the buttocks and lower legs, along with joint pain. What is the diagnosis?', 
'["Child abuse", "Henoch-Schönlein Purpura (HSP)", "Hemophilia", "Leukemia"]'::jsonb, 
1, 
'HSP is a small-vessel vasculitis. The "purpura" can look like bruises, but their distribution (gravity-dependent) and associated symptoms (joint/abdominal pain) are characteristic.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What cultural practice involves rubbing the skin with a coin, leading to linear, symmetric bruising on the back?', 
'["Cupping", "Coining (Cao Gio)", "Moxibustion", "Acupuncture"]'::jsonb, 
1, 
'Coining is a Southeast Asian traditional healing practice. While it causes bruising, it is done with therapeutic intent and follows a specific pattern (usually along the ribs).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with what looks like "scald burns" on the face and neck, but the skin is also "sloughing" off in sheets with a positive Nikolsky sign. What is the diagnosis?', 
'["Abusive scald burn", "Staphylococcal Scalded Skin Syndrome (SSSS)", "Phytophotodermatitis", "Eczema"]'::jsonb, 
1, 
'SSSS is caused by an exfoliative toxin from Staph aureus. It causes widespread erythema and skin peeling, but unlike a burn, it often starts around the mouth or diaper area and is a systemic infection.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which vitamin deficiency causes "periosteal hemorrhage" and bone pain that can be mistaken for the periosteal reaction of a healing fracture?', 
'["Vitamin A", "Vitamin C (Scurvy)", "Vitamin D (Rickets)", "Vitamin K"]'::jsonb, 
1, 
'Scurvy causes fragile capillaries and subperiosteal bleeding. X-rays may show a "Wimberger sign" or "Frankel line," which are distinct from the focal fractures of abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 4-year-old girl has an "hourglass" shaped area of white, thin, "parchment-like" skin around the vulva and anus, with some small bruises. What is the diagnosis?', 
'["Chronic sexual abuse", "Lichen Sclerosus", "Vaginitis", "Labial adhesion"]'::jsonb, 
1, 
'Lichen sclerosus is a non-contagious inflammatory condition. The thin skin is very fragile and bruises easily with normal activity, mimicking trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which systemic infection in an infant can cause "periostitis" (inflammation of the bone lining) and bone lesions on X-ray?', 
'["Congenital Syphilis", "Measles", "Mumps", "Rotavirus"]'::jsonb, 
0, 
'Syphilis can cause symmetric periosteal new bone formation and "Wimberger''s sign" (destruction of the medial proximal tibia), which can be confused with abuse-related fractures.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with a circular, red, scaly rash with central clearing. What is it?', 
'["Cigarette burn", "Tinea corporis (Ringworm)", "Bite mark", "Eczema"]'::jsonb, 
1, 
'Ringworm is a fungal infection. Its circular shape is much more superficial and scaly than a cigarette burn or a bite.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which condition involves a "blistering" rash that can follow the use of certain medications and looks like a severe burn?', 
'["Impetigo", "Stevens-Johnson Syndrome (SJS)", "Psoriasis", "Acne"]'::jsonb, 
1, 
'SJS (and Toxic Epidermal Necrolysis) involves severe mucosal and skin detachment. The history of medication use and involvement of the eyes/mouth help distinguish it from burns.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has "Ehlers-Danlos Syndrome." Why is this relevant in a child abuse evaluation?', 
'["It causes brittle bones", "It causes skin hyperextensibility and easy bruising due to fragile connective tissue", "It causes blindness", "None"]'::jsonb, 
1, 
'Children with EDS can have significant bruising from minimal accidental trauma, which must be considered.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a normal anatomical variant that can be mistaken for a "perianal tear"?', 
'["Anal fissure", "Perianal raphe (the normal midline seam of skin)", "Wart", "Hemorrhoid"]'::jsonb, 
1, 
'A prominent or slightly irregular raphe is a normal finding but can be misinterpreted by an inexperienced examiner.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 2-year-old has "bowing of the legs" and "widening of the wrists" on X-ray. Labs show low Vitamin D and high alkaline phosphatase. This is:', 
'["Abusive fractures", "Nutritional Rickets", "Osteogenesis Imperfecta", "Normal growth"]'::jsonb, 
1, 
'Rickets causes metaphyseal "fraying and cupping" which can be distinguished from the "Classic Metaphyseal Lesion" (CML) of abuse by its generalized, symmetric nature and lab findings.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What cultural practice involves applying heated glass jars to the skin, creating circular, purple bruises?', 
'["Coining", "Cupping", "Moxibustion", "Acupuncture"]'::jsonb, 
1, 
'Cupping (often seen in Traditional Chinese Medicine) creates very distinct, symmetric, circular bruises that are not typically painful.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has several "cafe-au-lait" spots (light brown macules). Could these be bruises?', 
'["Yes, always", "No, they are birthmarks associated with conditions like Neurofibromatosis Type 1; they have smooth borders and do not fade", "Only if they are large", "None"]'::jsonb, 
1, 
'Distinguishing birthmarks from bruises is a fundamental part of the skin exam.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is true about "Bullous Impetigo"?', 
'["It is caused by a burn", "It is a Staphylococcal infection that causes large, fluid-filled blisters that can burst and leave ''scalded'' looking skin", "It is always abuse", "None"]'::jsonb, 
1, 
'Impetigo can mimic cigarette burns or small scalds. The presence of honey-colored crusting is a classic clue.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has "steatocystoma multiplex" (multiple small cysts). These can be mistaken for:', 
'["Cigarette burns", "Warts", "Bite marks", "Bruises"]'::jsonb, 
1, 
'Cysts or nodules can sometimes be mistaken for other skin lesions.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which condition causes "discolored, brittle teeth" and is often seen in Type 1 Osteogenesis Imperfecta?', 
'["Dental neglect", "Dentinogenesis Imperfecta", "Fluorosis", "Scurvy"]'::jsonb, 
1, 
'Dentinogenesis Imperfecta is a vital clue that a child''s fractures may be due to OI rather than abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: "Leukemia" can present with easy bruising and bone pain, mimicking physical abuse.', 
'["True", "False"]'::jsonb, 
0, 
'True. A CBC should be part of the workup for any child with unexplained bruising to rule out malignancy.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes the "redness and swelling" of the skin after contact with an allergen (like poison ivy), which can look like a burn?', 
'["Contact dermatitis", "Psoriasis", "Vitiligo", "None"]'::jsonb, 
0, 
'Linear streaks of contact dermatitis from plants can be mistaken for scratches or burns.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has a "port-wine stain" (Sturge-Weber syndrome). This is a:', 
'["Bruise", "Congenital capillary malformation", "Burn", "Wart"]'::jsonb, 
1, 
'Port-wine stains are present at birth and do not change like bruises.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is "Menkes Disease" and its relevance to child abuse?', 
'["A bone cancer", "A rare X-linked disorder of copper metabolism that causes brittle hair, developmental delay, and ''scalloped'' metaphyses that can mimic fractures", "A type of flu", "None"]'::jsonb, 
1, 
'Menkes (kinky hair disease) is a rare but important differential for skeletal findings in infants.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: If a child has a documented medical condition that causes easy bruising (like Hemophilia), they cannot also be a victim of physical abuse.', 
'["True", "False, children with disabilities or medical conditions are actually at *higher* risk for abuse"]'::jsonb, 
1, 
'Abuse and medical conditions can coexist. A child with Hemophilia who has an ear bruise still needs an abuse evaluation.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which condition causes "multiple, symmetric, non-tender blue-gray patches" on the trunk and extremities?', 
'["Bruising", "Extensive Mongolian spots", "HSP", "None"]'::jsonb, 
1, 
'Mongolian spots can sometimes be widespread, covering the back, buttocks, and even the shoulders.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has "Erythema Multiforme." How does it look?', 
'["A target-like lesion (bulls-eye)", "A solid bruise", "A linear burn", "A square"]'::jsonb, 
0, 
'Target lesions are characteristic of EM and should be distinguished from circular burns or bite marks.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which condition causes "hyperkeratotic" (thickened) skin on the palms and soles and can be mistaken for burns or scarring?', 
'["Psoriasis", "Palmoplantar keratoderma", "Impetigo", "None"]'::jsonb, 
1, 
'Genetic skin conditions can cause bizarre appearances that mimic chronic trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is "Incontinentia Pigmenti"?', 
'["A bladder disorder", "A genetic condition that progresses through stages of blistering, ''wart-like'' lesions, and hyperpigmented streaks", "A type of neglect", "None"]'::jsonb, 
1, 
'The blistering stage of IP can be mistaken for burns or infections.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has "calcified" areas in the soft tissues on X-ray. Could this be from abuse?', 
'["Yes, it could be Myositis Ossificans (bone forming in muscle) after a severe blunt trauma", "No, impossible", "Only if they eat too much calcium", "None"]'::jsonb, 
0, 
'Severe muscle trauma (deep bruising) can lead to heterotopic ossification.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which "mimic" of sexual abuse involves the "fusing" of the labia minora?', 
'["Hymenal tear", "Labial adhesion", "Warts", "None"]'::jsonb, 
1, 
'As mentioned, labial adhesion is a benign, common condition.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In the differential diagnosis of child abuse, what is the most important "tool" for the physician?', 
'["A good lawyer", "A thorough, unbiased history and physical exam, followed by targeted medical and laboratory evaluation", "A crystal ball", "None"]'::jsonb, 
1, 
'Clinical judgment and a systematic approach are essential to distinguishing mimics from maltreatment.')

;
