-- Batch 3: 31 Child Abuse Recognition MCQs (Questions 63-93)
-- Topic: Physical Abuse - Burns and Bite Marks
-- Slug: peds-child-abuse

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most common type of burn seen in children overall (both accidental and non-accidental)?', 
'["Flame burns", "Scald burns (hot liquids/tap water)", "Chemical burns", "Electrical burns"]'::jsonb, 
1, 
'Scald burns are the most frequent type of burn injury in children. Distinguishing accidental spills from intentional immersion is a critical clinical skill.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following burn patterns is highly suggestive of intentional immersion in hot water?', 
'["Asymmetric splash marks on the chest and face", "Stocking or glove distribution with a sharp ''water-line'' and sparing of the skin folds", "A single round burn on the arm", "A burn on the palm from a stove"]'::jsonb, 
1, 
'Intentional immersion (forced holding in hot water) typically results in a symmetric burn with clear margins ("glove and stocking"). The "sparing" of skin folds (e.g., the groin in a "donut" pattern) occurs where the skin was compressed against the bottom of the tub or flexed, preventing contact with the hot water.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is meant by the "Donut Sparing" pattern in an abusive scald burn?', 
'["A burn shaped like a donut", "Sparing of the central buttocks and skin folds where they were pressed against the cool surface of a bathtub during forced immersion", "A burn on the head", "None"]'::jsonb, 
1, 
'In a "sit-down" immersion burn, the central part of the buttocks is often spared because it was pressed against the relatively cool bottom of the tub, protecting it from the hot water. This pattern is pathognomonic for intentional immersion.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 2-year-old child presents with a burn on the back of the hand that has the clear impression of a "triangular" shape with three small holes. What object was likely used?', 
'["A cigarette", "A steam iron", "A curling iron", "A fork"]'::jsonb, 
1, 
'Patterned contact burns reflect the shape of the object. A steam iron leaves a characteristic triangular burn, often with small circular areas of deeper burning from the steam vents.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following features is most characteristic of an *accidental* scald burn (e.g., from a spilled cup of hot coffee)?', 
'["Sharp, clear margins", "Splash marks and ''arrowhead'' patterns showing the direction of the flow", "Uniform depth of the burn", "Glove and stocking distribution"]'::jsonb, 
1, 
'Accidental scalds are characterized by irregular margins, splash marks, and varying depths of the burn as the liquid cools and flows down the body (the "arrowhead" pattern).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 4-year-old child presents with several small, circular, deep, 8-10 mm burns on the soles of the feet. What is the most likely cause?', 
'["Stepping on a hot sidewalk", "Cigarette burns", "Varicella (Chickenpox)", "Impetigo"]'::jsonb, 
1, 
'Cigarette burns are characteristically 8-10 mm in diameter, circular, and of uniform depth. When found on the soles of the feet, palms, or genitals, they are almost certainly non-accidental.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the term for a burn caused by a hot liquid that has been *thrown* at a child?', 
'["Immersion burn", "Contact burn", "Splash/Splatter burn", "Flash burn"]'::jsonb, 
2, 
'Splash/Splatter burns result from hot liquids being thrown or poured. They are distinguished from immersion burns by their irregular distribution and "satellite" splash marks.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with a linear, 1-inch wide burn that wraps around the forearm. What object might have caused this?', 
'["A cigarette", "A curling iron", "A lighter", "A kitchen stove"]'::jsonb, 
1, 
'A curling iron or a hair straightener can leave a distinct linear or rectangular patterned burn if pressed against the skin.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'At what temperature will tap water cause a full-thickness (3rd degree) burn in just 1 second in a young child?', 
'["120°F (49°C)", "140°F (60°C)", "160°F (71°C)", "100°F (38°C)"]'::jsonb, 
2, 
'At 140°F, it takes 3 seconds to cause a deep burn in a child. At 156°F-160°F, a deep burn occurs in just 1 second. Many home water heaters are set dangerously high.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Accidental contact burns in toddlers are most commonly found on the palms of the hands.', 
'["True", "False"]'::jsonb, 
0, 
'True. Toddlers exploring their environment often touch hot surfaces (stoves, heaters) with their palms. However, a burn on the *back* of the hand is much more likely to be non-accidental (defensive or inflicted).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which skin condition involves a phototoxic reaction to plant juices (like lime or celery) followed by sun exposure, leading to blistering that can mimic a burn?', 
'["Bullous impetigo", "Phytophotodermatitis", "Stevens-Johnson syndrome", "Contact dermatitis"]'::jsonb, 
1, 
'Phytophotodermatitis can create irregular, linear, or splash-like marks that look like burns or bruises. A careful history of contact with citrus fruits or weeds and sun exposure is key.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the distinguishing feature of an "adult" human bite mark compared to a "child" bite mark?', 
'["The adult bite is always on the neck", "The intercanine distance (distance between the upper canine teeth) is typically > 3 cm in adults", "Adult bites never bruise", "Adult bites are always circular"]'::jsonb, 
1, 
'A distance greater than 3.0 cm between the canine marks is generally considered an adult bite. Forensic odontologists can help analyze these marks.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'When a human bite mark is identified on a child, what is the most important first step for forensic evidence collection?', 
'["Wash the area with soap and water", "Swab the area for DNA (saliva) before the child is cleaned", "Wait for the mark to fade", "Take a photo without a ruler"]'::jsonb, 
1, 
'Saliva contains DNA. Swabbing the bite mark is a critical step in identifying the perpetrator before the evidence is lost.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with "circular" marks that look like cigarette burns but are actually caused by a circular medical device used in traditional medicine. What is this practice called?', 
'["Coining (Cao Gio)", "Cupping", "Moxibustion", "Acupuncture"]'::jsonb, 
2, 
'Moxibustion (burning of herbs on the skin) can leave circular burns. Cupping leaves circular bruises. These cultural practices should be recognized but are not typically considered "abuse" if performed with healing intent, though they must still be documented.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has a human bite mark on the arm. If the skin is broken, what is the most appropriate medical management?', 
'["Topical steroids", "Irrigation and prophylactic antibiotics (e.g., Amoxicillin-Clavulanate)", "Only a bandage", "Suturing the wound tightly"]'::jsonb, 
1, 
'Human bites have a high risk of infection due to oral flora (e.g., Eikenella corrodens). Prophylactic antibiotics and thorough irrigation are necessary.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which type of burn is most commonly associated with a "history of a spill" but shows a distribution that is too symmetric or deep to be accidental?', 
'["Immersion scald", "Flash burn", "Chemical burn", "Electrical burn"]'::jsonb, 
0, 
'A common lie for an immersion burn is that the child "knocked over a pot of water." However, a spill would create splash marks, not a symmetric glove-and-stocking pattern.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes a burn caused by a cigarette being *pressed* against the skin, rather than just an accidental "brush" by a moving cigarette?', 
'["Brush burn", "Crater burn", "Flash burn", "None"]'::jsonb, 
1, 
'Deliberate cigarette burns are often deep, circular "craters." Accidental brushes are typically more superficial, eccentric, or linear.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the role of a "Skeletal Survey" in a child under age 2 who presents with an abusive-appearing burn?', 
'["None, burns don''t affect bones", "Mandatory, as children with one form of abuse often have occult (hidden) fractures", "Only if the child is limping", "Only if the burn is on the chest"]'::jsonb, 
1, 
'Polytrauma is common in child abuse. A skeletal survey is standard for any child under 2 years old with a suspicious injury, including burns.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In a case of suspected abusive burning, which of the following is a major "red flag" regarding the caregiver''s behavior?', 
'["Crying and appearing upset", "Delay in seeking medical care (e.g., waiting 24 hours for a severe burn)", "Asking for pain medication for the child", "Knowing the temperature of the water"]'::jsonb, 
1, 
'Delay in seeking care for a painful, obvious injury is a major red flag in child abuse cases.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'An infant has a "u-shaped" burn on the back. This might be caused by which of the following?', 
'["A spoon", "Contact with a heated metal coat hanger", "A hot water bottle", "Spilled soup"]'::jsonb, 
1, 
'Unusually shaped patterned burns suggest the use of household items as weapons.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the "Waterline" in an immersion burn?', 
'["A type of boat", "The sharp, horizontal boundary between burned and unburned skin, indicating the child was held still in the water", "A splash mark", "A sign of healing"]'::jsonb, 
1, 
'A sharp waterline indicates the limb was held stationary in the liquid, which does not happen in an accidental splash where the child would be moving away.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which anatomical site is particularly suspicious for abusive burns?', 
'["The palms", "The soles of the feet, the buttocks, and the genitals", "The knees", "The forehead"]'::jsonb, 
1, 
'While accidental burns can happen on the feet, symmetric burns of the soles or burns to the perineum/buttocks are highly suspicious.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with a burn that looks like a "grill" or "grate." What might have caused this?', 
'["A radiator or a floor heating grate", "Spilled noodles", "A lighter", "A hot pan"]'::jsonb, 
0, 
'Forcing a child''s face or body onto a heating grate or radiator can cause patterned burns that match the object''s grid.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term refers to the deliberate "branding" of a child using a heated metal object?', 
'["Contact burn", "Branding", "Flash burn", "Chemical burn"]'::jsonb, 
1, 
'Branding is a form of contact burn where an object is specifically heated to leave a mark or pattern on the skin.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 56-year-old grandfather is caring for a 1-year-old. He says he "didn''t realize the water was so hot" when he put the baby in the bath. What should be investigated?', 
'["The grandfather''s mental health", "The water heater setting at the home and the distribution of the burn", "The child''s weight", "Nothing, it was an accident"]'::jsonb, 
1, 
'Even if it was an "accident" due to negligence (not realizing the heat), it still requires a report and a home safety investigation.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What type of burn is caused by a child biting an electrical cord?', 
'["Chemical burn", "Commissure burn (at the corner of the mouth)", "Flash burn", "Scald"]'::jsonb, 
1, 
'Electrical burns to the mouth can occur in toddlers who bite cords. While often accidental, they require careful evaluation of the home environment.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'When photographing a bite mark, why is it important to use a specialized "ABFO No. 2" scale?', 
'["It makes the photo look professional", "It provides precise measurement and corrects for camera angle distortion for forensic comparison", "It is required by the hospital", "None"]'::jsonb, 
1, 
'Forensic odontologists use the scale to perform "bite mark analysis" to match the mark to a suspect''s dentition.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has several 1-cm, circular, reddish lesions on the back. They are flat and have no scarring. Could these be cigarette burns?', 
'["Yes, they always look like that", "No, cigarette burns are typically scarred, deep, or ulcerated; flat lesions are more likely to be an inflammatory skin condition or birthmarks", "Only if the child has a cough", "None"]'::jsonb, 
1, 
'Cigarette burns are painful, third-degree burns that leave a distinct scar. Flat, non-tender spots are more likely to be medical in origin.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which common household cleaning agent can cause severe chemical burns if applied to a child''s skin as "punishment"?', 
'["Dish soap", "Bleach or Oven cleaner", "Shampoo", "Toothpaste"]'::jsonb, 
1, 
'Strong alkalis (like lye or bleach) cause liquefactive necrosis and deep tissue damage.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: A child who is old enough to talk will always tell the truth about how they were burned.', 
'["True", "False, as they may be coached, threatened, or developmentally unable to explain", "Only if the parent is not in the room", "Only if they are over age 10"]'::jsonb, 
1, 
'Children may be too afraid to speak or may have been "coached" by the perpetrator to give a specific false history.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the clinical significance of a "microwave burn" in child abuse?', 
'["It is a common accidental injury", "It is an extremely severe form of abuse where the child is placed inside a microwave, leading to internal heating and deep burns", "It only happens to popcorn", "It is impossible"]'::jsonb, 
1, 
'Microwave burns are rare but represent a horrific and highly lethal form of child abuse.')

;
