-- Batch 4: 31 Child Abuse Recognition MCQs (Questions 94-124)
-- Topic: Physical Abuse - Fractures and Skeletal Surveys
-- Slug: peds-child-abuse

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the "Classic Metaphyseal Lesion" (CML) and why is it significant?', 
'["A common sports injury", "A fracture of the growth plate caused by shearing forces (e.g., shaking or pulling), highly specific for child abuse", "A bone tumor", "A normal variation of bone growth"]'::jsonb, 
1, 
'CMLs (also called "corner" or "bucket-handle" fractures) result from torsional or shearing forces on the fragile metaphysis of an infant''s long bones. They are virtually pathognomonic for non-accidental trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following fracture types is most commonly seen in children who have been physically abused?', 
'["Clavicle fractures", "Transverse fractures of the long bones", "Spiral fractures", "No single type is ''most common,'' but certain types are highly specific"]'::jsonb, 
3, 
'While simple transverse fractures are common in both accidents and abuse, specificity matters more. High-specificity fractures (CML, rib, scapular) are the strongest indicators of abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Posterior rib fractures in an infant are most likely caused by which mechanism?', 
'["A fall from a high chair", "CPR performed by a trained professional", "Squeezing the chest forcefully (e.g., during shaking)", "Laying the baby on a hard surface"]'::jsonb, 
2, 
'Posterior rib fractures occur where the rib articulates with the vertebrae. They are caused by forceful compression/squeezing of the chest, which leverages the rib over the transverse process of the spine. They are highly specific for abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the mandatory imaging evaluation for any child under age 2 with suspected physical abuse?', 
'["A single chest X-ray", "A full Skeletal Survey (approx. 20-21 specialized views)", "A whole-body bone scan", "An MRI of the brain"]'::jsonb, 
1, 
'A formal skeletal survey is the gold standard to identify occult (hidden) or healing fractures in young children. A "babygram" (single view of the whole body) is insufficient and unacceptable.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: A "spiral" fracture of the femur in a 10-month-old who is not yet walking is highly concerning for abuse.', 
'["True", "False"]'::jsonb, 
0, 
'True. A spiral fracture is caused by a twisting (torsional) force. In a non-ambulatory child, there is no accidental mechanism to explain such an injury.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is a "Toddler''s Fracture"?', 
'["A severe femur fracture from abuse", "A non-displaced spiral fracture of the distal tibia in a young child, often caused by a minor accidental trip or twist", "A skull fracture", "A broken wrist from a fall"]'::jsonb, 
1, 
'A Toddler''s fracture is a common accidental injury in children who are learning to walk. It must be distinguished from more suspicious fractures by the history and the child''s developmental level.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'When is a "follow-up" (repeat) skeletal survey typically performed, and why?', 
'["Never, one is enough", "In 10-14 days, to identify new bone formation (callus) that makes subtle or acute fractures more visible", "Every month for a year", "Only if the child breaks another bone"]'::jsonb, 
1, 
'Repeat skeletal surveys are highly effective at identifying fractures that were "too fresh" to see on the initial X-rays. Healing (callus formation) becomes apparent after 1-2 weeks.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which bone is the most common site for a "Classic Metaphyseal Lesion" (CML)?', 
'["Distal femur and proximal tibia", "Ribs", "Skull", "Vertebrae"]'::jsonb, 
0, 
'CMLs are most frequently found at the distal femur, proximal tibia, and distal tibia.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 3-month-old presents with multiple rib fractures in various stages of healing (some with large calluses, some acute). What does this indicate?', 
'["The child has very soft bones", "Chronic, repeated episodes of physical abuse", "A single severe accident", "Birth trauma"]'::jsonb, 
1, 
'Fractures of different ages prove that the trauma was not a single event but a pattern of ongoing abuse over time.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which medical condition is the most common differential diagnosis for multiple fractures in an infant?', 
'["Rickets", "Osteogenesis Imperfecta (OI)", "Leukemia", "Scurvy"]'::jsonb, 
1, 
'OI (brittle bone disease) must be considered. However, OI is rare, and child abuse is much more common. Most children with OI will have other signs like blue sclera, a family history, or generalized osteopenia on X-ray.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Skull fractures from *accidental* falls (e.g., off a bed) are typically:', 
'["Multiple and complex", "Single, linear, and less than 3 mm wide", "Depressed and stellate", "Located at the base of the skull"]'::jsonb, 
1, 
'Accidental skull fractures in infants are usually simple, non-displaced, linear fractures. Complex, branching, or depressed fractures suggest high-impact force consistent with abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A "scapular fracture" in a child who has not been in a high-speed motor vehicle accident is:', 
'["A common injury from a fall on the arm", "Highly specific for child abuse, as the scapula is well-protected by muscle", "Always accidental", "None"]'::jsonb, 
1, 
'The scapula is very difficult to break without massive force. In the absence of a major accident, a scapular fracture is a red flag for abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which imaging modality is most sensitive for detecting very early rib fractures or subtle periosteal reactions in a suspected abuse case?', 
'["CT scan", "MRI", "Bone scan (Scintigraphy)", "Ultrasound"]'::jsonb, 
2, 
'A bone scan can be more sensitive than X-rays for acute rib fractures, though it is less specific and more difficult to perform in infants. A repeat skeletal survey is generally preferred.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In a skeletal survey, what does "periosteal new bone formation" (periostitis) indicate?', 
'["Active infection", "A healing response to a previous injury (fracture or subperiosteal hemorrhage)", "A normal stage of puberty", "Vitamin D deficiency"]'::jsonb, 
1, 
'Periosteal reaction is a sign that the bone was traumatized and is now healing. It usually appears 7-14 days after the injury.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is a "Bucket-Handle" fracture?', 
'["A fracture of the pelvis", "A CML where the avulsed metaphyseal fragment appears as a thin crescent of bone on the X-ray", "A type of rib fracture", "A skull fracture"]'::jsonb, 
1, 
'The "bucket-handle" and "corner" fractures are two different radiological appearances of the same injury: the Classic Metaphyseal Lesion.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 2-month-old infant is found to have a humeral shaft fracture. The father says he was "changing the baby''s diaper and the baby kicked his arm against the table." Is this history plausible?', 
'["Yes, babies are very strong", "No, infants this age cannot generate the force required to break a long bone shaft", "Only if the baby has rickets", "Only if the table is made of metal"]'::jsonb, 
1, 
'Long bone fractures in non-ambulatory infants are almost never accidental. Diaper changing is a common "stressful" time when abusive injuries occur, but the mechanism provided is impossible.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: "Birth-related" fractures (like a clavicle fracture during a difficult delivery) are usually healed and not visible on X-ray by 4-6 weeks of age.', 
'["True", "False, they are still very visible", "Only if the baby is breastfed", "None"]'::jsonb, 
0, 
'True. Birth fractures typically heal very quickly. A new fracture found at 2 months of age cannot be attributed to birth trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following vertebral injuries is highly concerning for abuse?', 
'["Compression fractures of multiple vertebrae", "Spondylolysis", "A single tailbone fracture", "None"]'::jsonb, 
0, 
'Vertebral compression fractures in a child without a history of a massive fall (e.g., from a 3rd story window) suggest forceful "slamming" of the child in a seated position.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'When evaluating for Osteogenesis Imperfecta (OI) as a mimic of abuse, which lab test is part of the initial workup?', 
'["Calcium and Phosphorus", "Skin biopsy for collagen analysis or genetic testing for COL1A1/COL1A2 mutations", "CBC", "Urine analysis"]'::jsonb, 
1, 
'Genetic testing is the definitive way to diagnose the most common forms of OI.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child with rickets has "fraying and cupping" of the metaphyses. How does this differ from a "Classic Metaphyseal Lesion"?', 
'["It doesn''t, they look the same", "Rickets involves generalized changes at all growth plates, whereas CML is a focal fracture line", "Rickets is only in the legs", "CML is only in the arms"]'::jsonb, 
1, 
'Rickets is a systemic metabolic disease and will show symmetric, generalized changes across multiple growth plates, along with characteristic lab abnormalities (low Ca/Phos, high ALP).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which type of skull fracture is *most* concerning for an "inflicted" injury?', 
'["Linear parietal fracture", "Depressed fracture from a direct blow", "Fracture crossing a suture line", "A complex or stellate fracture"]'::jsonb, 
3, 
'Complex, stellate (star-shaped), or multi-fragmentary skull fractures require significant force, far exceeding what is seen in a short accidental fall.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 12-month-old child has a "mid-shaft" fracture of the femur. The parent says the child "was running and tripped over a rug." Is this plausible?', 
'["Yes, toddlers are clumsy", "Maybe, but a femoral shaft fracture usually requires more force than a simple trip; further evaluation is needed", "No, impossible", "Only if the rug was wet"]'::jsonb, 
1, 
'While "Toddler''s fractures" of the tibia are common from trips, a mid-shaft femur fracture is less common and warrants a careful review of the mechanics and a search for other injuries.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the significance of a "sternal fracture" in a child?', 
'["Common from falls on the chest", "Highly suspicious for abuse, usually from a direct, forceful blow to the chest", "Always from CPR", "None"]'::jsonb, 
1, 
'Sternal fractures are rare in children and highly suggestive of non-accidental trauma in the absence of a major motor vehicle accident.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: A skeletal survey is not necessary for a child over age 5 with suspected abuse.', 
'["True, as older children can usually explain their injuries and have stronger bones", "False, it should be done in every child", "Only if they have a bruise", "None"]'::jsonb, 
0, 
'True. The yield of a skeletal survey for occult fractures is very high under age 2, moderate between 2-5, and very low after age 5.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which fracture location is included in the "High Specificity" category for child abuse?', 
'["Ribs (especially posterior)", "CML (Metaphyseal lesions)", "Scapula and Spinous processes", "All of the above"]'::jsonb, 
3, 
'All of these are high-specificity fractures that should immediately trigger a report and a full child abuse evaluation.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'How many views are typically included in a proper, high-quality pediatric Skeletal Survey?', 
'["2", "10", "20-21", "5"]'::jsonb, 
2, 
'A complete survey includes separate views of the skull, chest (AP/lateral/oblique ribs), spine, pelvis, and all long bones (including hands and feet).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes the "lifting" of the periosteum from the bone by a hemorrhage, often seen in healing fractures?', 
'["Subperiosteal hemorrhage", "Callus", "Sclerosis", "Osteitis"]'::jsonb, 
0, 
'Tearing of the periosteum from the bone leads to a subperiosteal hemorrhage, which then mineralizes to form the "periosteal new bone" seen on X-ray.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 6-month-old infant has a "claver fracture" (distal clavicle). The mother says she "pulled the baby out of the car seat too fast." Is this concerning?', 
'["No, it''s a common accident", "Yes, distal clavicle fractures can be caused by pulling/yanking the arm, which is a mechanism of abuse", "Only if the car seat was broken", "None"]'::jsonb, 
1, 
'Yanking an infant''s arm can cause CMLs at the shoulder or a distal clavicle fracture. This mechanism is concerning for physical maltreatment.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'When interpreting a skeletal survey, why is it important to have it read by a pediatric radiologist?', 
'["They are faster", "Subtle fractures (like CMLs) are difficult to identify and require specialized expertise in pediatric bone development", "They charge more", "They are required by law"]'::jsonb, 
1, 
'Missed fractures can lead to a child being returned to an unsafe environment. Expert radiological review is a critical safety measure.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has multiple fractures. The physician notes "blue sclera" and "dentinogenesis imperfecta" (discolored, brittle teeth). What is the most likely diagnosis?', 
'["Child abuse", "Osteogenesis Imperfecta (Type 1)", "Rickets", "Syphilis"]'::jsonb, 
1, 
'These are classic extra-skeletal findings of OI Type 1. While abuse must still be ruled out, these findings point strongly toward a medical etiology.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In a healing fracture, what is the first radiological sign that a bone is being repaired?', 
'["The fracture disappears", "Soft tissue swelling decreases", "Periosteal new bone formation (callus)", "The bone becomes blacker"]'::jsonb, 
2, 
'The appearance of a periosteal reaction or "callus" is the first sign of healing on an X-ray.')

;
