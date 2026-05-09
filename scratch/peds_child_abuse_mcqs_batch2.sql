-- Batch 2: 31 Child Abuse Recognition MCQs (Questions 32-62)
-- Topic: Physical Abuse - Skin (Bruises and Patterns)
-- Slug: peds-child-abuse

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most common presenting sign of physical abuse in children?', 
'["Fractures", "Bruising", "Burns", "Head injury"]'::jsonb, 
1, 
'Bruising is the most common clinical manifestation of physical abuse, though it is often under-recognized or attributed to "normal childhood accidents."'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'According to the "TEN-4-FACES-P" bruising clinical decision rule, which of the following bruising locations in a child < 4 years old is highly suggestive of abuse?', 
'["Shins", "Forehead", "Ear", "Elbow"]'::jsonb, 
2, 
'The "E" in TEN-4 stands for Ear. Bruising to the ear is very rare in accidental trauma (e.g., falls) and is highly predictive of physical abuse, often resulting from a slap or blow to the side of the head.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 3-month-old infant is found to have a 1-cm bruise on the trunk during a well-child check. The infant is not yet rolling. What is the likelihood that this is an accidental injury?', 
'["Common (~20%)", "Very rare (< 1%)", "Normal in all babies", "Likely due to the car seat"]'::jsonb, 
1, 
'Bruising in an infant who is not yet ambulatory (non-mobile) is extremely rare (< 1%) and should be considered a sentinel sign of abuse until proven otherwise. "Those who don''t cruise, don''t bruise."'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following describes a "patterned" bruise caused by a slap with an open hand?', 
'["A solid, round bruise", "Parallel linear bruises with a central area of sparing", "A cluster of petechiae on the forehead", "A single vertical line"]'::jsonb, 
1, 
'A forceful slap often leaves "tram-track" or parallel linear bruises. The skin compressed by the fingers is spared, while the blood is forced to the margins of the fingers, creating two parallel lines.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with multiple bruises on the buttocks and lower back. They are described as U-shaped or "loop-shaped." What object was likely used to inflict these injuries?', 
'["A belt buckle", "A folded electrical cord or wire", "A hairbrush", "A flat hand"]'::jsonb, 
1, 
'Loop marks are pathognomonic for a blow from a flexible object that was doubled over, such as an extension cord, jump rope, or wire.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Can a physician accurately determine the *exact* age of a bruise (e.g., "this bruise is 48 hours old") based on its color?', 
'["Yes, yellow means 3 days old", "No, color changes vary widely between individuals and the depth of the injury", "Yes, purple means it just happened", "Only if the child has fair skin"]'::jsonb, 
1, 
'While color changes (purple to green/yellow) occur as hemoglobin breaks down, studies have shown that visual dating of bruises is highly unreliable. A physician should never testify to the exact age of a bruise based solely on color.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 2-year-old child presents with a bruised and swollen upper lip. Upon examination, the physician finds a "torn maxillary labial frenulum." What should be suspected?', 
'["Aggressive toothbrushing", "A fall onto a flat floor", "Forced feeding or a blow to the mouth", "Normal developmental finding"]'::jsonb, 
2, 
'A torn frenulum (the tissue connecting the lip to the gum) in a young child can occur accidentally but is frequently a sign of abuse, resulting from a blow to the face or forced insertion of a bottle or spoon.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following "accidental" sites is most common for bruising in a 5-year-old active child?', 
'["Inner thighs", "Shins (anterior lower legs)", "Neck", "Genitals"]'::jsonb, 
1, 
'The shins, forehead, and chin are "bony prominences" that frequently sustain minor bruises during normal play.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with a bruise on the cheek that has the clear impression of four fingers. This is an example of:', 
'["Accidental trauma", "Patterned injury", "Birthmark", "Allergic reaction"]'::jsonb, 
1, 
'A hand-print or finger-mark bruise is a patterned injury and is highly specific for physical abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What do "petechiae" on the neck or around the eyes (periorbital) suggest in a child suspected of being abused?', 
'["Severe coughing", "Strangulation or forceful compression of the neck/chest", "Low platelet count only", "Allergy to laundry detergent"]'::jsonb, 
1, 
'While coughing or vomiting can cause facial petechiae, in a suspicious context, petechiae on the neck or above a ligature mark suggest mechanical obstruction of venous return, often due to strangulation.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 3-year-old child has several circular, hyperpigmented scars on the thighs. The mother says they were "mosquito bites that he picked at." What is the main differential in a child abuse evaluation?', 
'["Cigarette burns", "Impetigo", "Eczema", "Varicella"]'::jsonb, 
0, 
'Circular, deep, well-demarcated scars (approx. 8-10 mm in diameter) are highly suspicious for cigarette burns. They should be distinguished from healing infected bites or impetigo.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which bruising location is part of the "FACES" mnemonic for suspicious bruising in children?', 
'["Feet", "Frenulum, Angle of jaw, Cheek, Eyelids, or Sclera", "Forehead", "Fingers"]'::jsonb, 
1, 
'The "FACES" part of the TEN-4-FACES-P rule refers to specific facial areas that are rarely bruised accidentally but often targeted in abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In an infant under 4 months of age, any bruise anywhere on the body carries what significance?', 
'["It is almost always accidental", "It is highly suggestive of abuse and requires a full evaluation", "It is usually a birthmark", "It means the baby is ready to walk"]'::jsonb, 
1, 
'The rule "Those who don''t cruise, don''t bruise" means any bruise in a 0-4 month old is a major red flag for non-accidental trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has bruising only on the "protected" areas of the body, such as the inner arms and the soft tissue of the cheeks. Is this concerning?', 
'["No, these are common injury sites", "Yes, these areas are shielded from accidental falls and are common targets in physical abuse", "Only if the child is underweight", "Only if the father is the caregiver"]'::jsonb, 
1, 
'Accidental falls typically involve the "outward" parts of the body (shins, forehead). Injuries to "protected" areas like the neck, ears, and inner thighs are much more likely to be inflicted.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the term for a bruising pattern that wraps around an extremity, such as the upper arm, suggesting a forceful "grip"?', 
'["Linear bruising", "Grab marks (Grip marks)", "Skeining", "Ecchymosis"]'::jsonb, 
1, 
'Grip marks often appear as clusters of small, oval bruises on the medial and lateral surfaces of an arm or leg where the fingers and thumb compressed the tissue.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which laboratory test should be performed in a child with extensive or unusual bruising to rule out a medical mimic?', 
'["CBC, PT, PTT, and possibly Von Willebrand studies", "Serum glucose", "TSH", "Urine culture"]'::jsonb, 
0, 
'Coagulation studies are essential to rule out bleeding disorders that could explain easy bruising or hemorrhage.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with bruising and swelling of the "Pinna" (the outer ear). This injury is frequently associated with what other occult injury?', 
'["Kidney stones", "Intracranial hemorrhage (subdural or epidural)", "Broken toe", "Asthma"]'::jsonb, 
1, 
'A blow to the ear is often part of a larger impact to the head. Any child with ear bruising or trauma should be evaluated for traumatic brain injury.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most concerning feature of a bruise that a parent claims was caused by a fall from a couch?', 
'["The color is green", "The bruise is on the child''s buttock", "The bruise is 2 cm in size", "The child did not cry"]'::jsonb, 
1, 
'Falls from low heights typically do not result in bruising of the buttocks, neck, or ears. This is a history-location mismatch.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In a child with dark skin, how might bruising appear differently than in a child with fair skin?', 
'["It may be more easily visible", "It may appear as areas of darker pigmentation or swelling and may be more difficult to see without good lighting", "It always appears bright red", "It is never visible"]'::jsonb, 
1, 
'Bruising can be subtle in darkly pigmented skin. Careful palpation for swelling/tenderness and the use of specialized lighting (like a Wood''s lamp in some forensic settings) can be helpful.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 10-year-old child has several linear, reddish streaks on the back that follow the lines of the ribs. The mother says he was "wrestling." What should the physician consider?', 
'["Child abuse from a whip", "Phytophotodermatitis", "Stretch marks (Striae)", "Tinea corporis"]'::jsonb, 
2, 
'Linear streaks on the back of an adolescent can be physiological striae (stretch marks) from rapid growth. These are not tender and have no associated bruising.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with a bruise that has a distinct "geometric" shape (e.g., a perfect rectangle). This is highly suggestive of:', 
'["A fall onto a toy", "Contact with a specific object used as a weapon", "A rare skin disease", "A birthmark"]'::jsonb, 
1, 
'Geometric shapes are rarely accidental. They suggest the child was struck by a specific object (e.g., a wooden board, a belt, a kitchen utensil).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is true regarding "Bite Marks" in children?', 
'["They are always accidental from other children", "An adult bite mark can be distinguished by the distance between the maxillary canine teeth (> 3 cm)", "They only happen on the hands", "They never leave a mark"]'::jsonb, 
1, 
'Adult bites are larger and often more forceful than child bites. A distance of > 3 cm between canine marks is highly suggestive of an adult perpetrator.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 6-year-old presents with petechiae on the forehead and cheeks. The mother says he has been "vomiting all night" due to a stomach bug. Is this history plausible?', 
'["No, vomiting never causes petechiae", "Yes, the sudden increase in intrathoracic/cephalic pressure during vomiting can cause facial petechiae", "Only if he has a fever", "Only if he is dehydrated"]'::jsonb, 
1, 
'Vomiting or severe coughing can cause petechiae above the nipple line. However, if petechiae are found in other areas (neck, behind ears) or with other injuries, abuse must be suspected.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Multiple bruises of "different ages" (different colors) are a definitive proof of ongoing physical abuse.', 
'["True", "False, as some children are naturally active and may have multiple accidental bruises at various stages of healing", "Only in children under 1 year", "Only in females"]'::jsonb, 
1, 
'False. While multiple bruises of varying ages *can* suggest ongoing abuse, this finding alone is not definitive, as active, clumsy children often have several accidental bruises in different stages of healing (especially on the shins).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the clinical significance of a "bruised scrotum" in a 2-year-old?', 
'["It is a common site for diaper rash", "It is highly suspicious for direct trauma (e.g., a kick or squeeze) and is a red flag for abuse", "It is usually due to a hernia", "It is normal in toilet training"]'::jsonb, 
1, 
'The genitals are a "protected" area. Bruising to the scrotum or labia is highly concerning for physical or sexual abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which skin condition can be mistaken for a "ligature mark" (strangulation mark) on the neck of an infant?', 
'["Eczema", "Intertrigo (in the neck folds)", "A birthmark", "Urticaria"]'::jsonb, 
1, 
'Severe intertrigo or a deep skin fold in a chubby infant can appear as a red line around the neck, which might be mistaken for a mark from a cord.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with a bruise on the scalp but NO history of head trauma. What is a "forensic" reason to be concerned?', 
'["Scalp bruises are always accidental", "The hair can hide more significant trauma, and scalp bruises in children are less common than facial bruises", "Scalp bruises cause hair loss", "None"]'::jsonb, 
1, 
'Scalp bruising is less common accidentally than forehead bruising and can be a sign of a blow to the head or hair-pulling.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes a bruise that results from the "pinching" of the skin between the thumb and forefinger?', 
'["Linear bruise", "Oval/Crush bruise", "Laceration", "Abrasion"]'::jsonb, 
1, 
'Pinch marks often appear as two small, symmetric bruises with a space in between.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most appropriate action for a physician who finds a single, small bruise on the ear of an 18-month-old child?', 
'["Ignore it if the child is not crying", "Make a report to CPS and perform a full workup", "Wait and see if another bruise appears", "Ask the child what happened"]'::jsonb, 
1, 
'Ear bruising is a high-specificity marker for abuse (part of the TEN-4 rule) and warrants a full investigation even if it is the only visible injury.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has "Mongolian spots" on the lower back. How can a physician distinguish them from bruises?', 
'["By the color only", "Mongolian spots have indistinct borders, a stable color over time, and are not tender", "By doing a biopsy", "By applying ice"]'::jsonb, 
1, 
'Mongolian spots (Congenital Dermal Melanocytosis) are flat, blue-gray, and do not change or fade over a few days like a bruise would.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'When documenting bruises, which of the following is most helpful for future legal proceedings?', 
'["Describing the bruise as ''old''", "Detailed description of location, size, shape, color, and any associated tenderness or swelling", "Drawing a smiley face next to the note", "Recording only the most severe bruise"]'::jsonb, 
1, 
'Precise documentation is key. Using a body map to show locations and descriptive terms (e.g., "3 cm circular green-yellow bruise on left upper arm") is best.')

;
