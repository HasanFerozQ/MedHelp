-- Batch 5: 31 Child Abuse Recognition MCQs (Questions 125-155)
-- Topic: Abusive Head Trauma (AHT) / Shaken Baby Syndrome
-- Slug: peds-child-abuse

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the current preferred clinical term for injuries formerly known as "Shaken Baby Syndrome"?', 
'["Cranial acceleration injury", "Abusive Head Trauma (AHT)", "Infantile subdural syndrome", "Neonatal concussion"]'::jsonb, 
1, 
'AHT is the broader and more accurate term, as it encompasses injuries from shaking, blunt impact, or a combination of both.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the classic "triad" of findings associated with Abusive Head Trauma?', 
'["Fever, Rash, Vomiting", "Subdural hematoma, Retinal hemorrhages, and Encephalopathy", "Fracture, Bruise, Burn", "Diarrhea, Dehydration, Shock"]'::jsonb, 
1, 
'While not always all present, the combination of subdural hemorrhage, retinal hemorrhage, and signs of brain dysfunction (encephalopathy) is highly characteristic of AHT.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'An 8-month-old infant presents with a bulging fontanelle, increased head circumference, and irritability. A head CT shows "subdural hematomas of varying ages." What does this suggest?', 
'["A single acute fall", "A congenital brain malformation", "Chronic, repeated episodes of head trauma", "A vitamin K deficiency"]'::jsonb, 
2, 
'Subdural hematomas of different ages (e.g., some acute/hyperdense and some chronic/hypodense) indicate multiple traumatic events over time, a classic finding in physical abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is the most sensitive imaging study for identifying acute intracranial hemorrhage in a symptomatic infant?', 
'["Non-contrast Head CT", "MRI of the Brain", "Skull X-ray", "Ultrasound of the head"]'::jsonb, 
0, 
'A non-contrast head CT is the first-line study in an emergency because it is fast and highly sensitive for acute blood (hyperdense). MRI is better for identifying subacute/chronic blood and axonal injury.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 4-month-old infant presents with apnea and is found to have "multilayered retinal hemorrhages" extending to the periphery. What is the significance of this finding?', 
'["Common in accidental falls", "Highly specific for Abusive Head Trauma, especially from vigorous shaking", "A sign of a severe eye infection", "Due to high-dose Vitamin D"]'::jsonb, 
1, 
'While small retinal hemorrhages can occur in other conditions (like severe crush injuries or birth), extensive, multilayered, and peripheral retinal hemorrhages are a hallmark of the rotational forces seen in AHT.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which mechanism of injury is responsible for the intracranial bleeding in AHT?', 
'["Rupture of the carotid artery", "Tearing of the bridging veins between the brain and the dural sinuses due to acceleration-deceleration forces", "Direct penetration of the skull", "A sudden drop in blood pressure"]'::jsonb, 
1, 
'Vigorous shaking or impact causes the brain to move within the skull, stretching and tearing the bridging veins that span the subdural space.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'An infant presents with lethargy, vomiting, and a "tense" fontanelle. The parents say the baby has been "sick with the flu." What is a critical step in the evaluation to rule out NAT?', 
'["A stool culture", "A dilated funduscopic exam by an ophthalmologist", "A chest X-ray", "A skin biopsy"]'::jsonb, 
1, 
'AHT can present with non-specific symptoms like vomiting (mistaken for a GI bug) or lethargy. A dilated eye exam to look for retinal hemorrhages is a vital part of the workup.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Most infants who survive severe Abusive Head Trauma will have long-term neurological disabilities.', 
'["True", "False"]'::jsonb, 
0, 
'True. Survivors of severe AHT often suffer from developmental delay, cerebral palsy, blindness, hearing loss, and seizure disorders.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes the axonal damage caused by the stretching and shearing of nerve fibers during a shaking event?', 
'["Epidural hematoma", "Diffuse Axonal Injury (DAI)", "Hydrocephalus", "Meningitis"]'::jsonb, 
1, 
'DAI is a serious consequence of the rotational forces in AHT and is a major contributor to long-term neurological impairment.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 2-month-old infant presents with a seizure. A CT shows a subdural hematoma. The parents report a "fall from a 2-foot bed onto a rug" 3 hours ago. Does this explain the injury?', 
'["Yes, infants have very thin skulls", "No, short accidental falls almost never cause intracranial hemorrhage in healthy infants", "Only if the baby landed on his face", "None"]'::jsonb, 
1, 
'The lack of an adequate mechanism for a severe intracranial injury is the most common reason for a child abuse consult in the ED.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is an "occult" finding often discovered during the workup of an infant with AHT?', 
'["Rib fractures", "Classic Metaphyseal Lesions (CMLs)", "Healing long-bone fractures", "All of the above"]'::jsonb, 
3, 
'Children with AHT frequently have other signs of physical abuse that were not previously known. A full skeletal survey is mandatory.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the term for the specific type of retinal hemorrhage where the inner layers of the retina are "bunched up" or folded, often seen in AHT?', 
'["Flame hemorrhage", "Retinal folds", "Dot-and-blot hemorrhage", "Cotton-wool spots"]'::jsonb, 
1, 
'Retinal folds (and retinoschisis) are highly specific for the severe vitreoretinal traction that occurs during the acceleration-deceleration of a shaking event.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Retinal hemorrhages from a normal vaginal delivery typically resolve within the first 4-6 weeks of life.', 
'["True", "False"]'::jsonb, 
0, 
'True. While birth can cause small retinal hemorrhages, they resolve quickly. Finding them in a 3-month-old infant is not attributable to birth.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child with suspected AHT has a head CT that shows a "lucency" (dark area) in the brain parenchyma. What does this represent?', 
'["A brain tumor", "Ischemic-hypoxic brain injury or edema", "Normal brain development", "A sinus infection"]'::jsonb, 
1, 
'Ischemia (lack of blood flow) and hypoxia (lack of oxygen) are common in AHT due to apnea or prolonged seizures, and they cause much of the permanent brain damage.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which medical condition can mimic the intracranial bleeding of AHT and should be considered in the differential diagnosis?', 
'["Glutaric Aciduria Type 1", "Menkes disease", "Severe Vitamin K deficiency", "All of the above"]'::jsonb, 
3, 
'These rare metabolic and bleeding disorders can cause "spontaneous" subdural bleeds and must be ruled out through laboratory testing.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most common trigger for a caregiver to shake an infant?', 
'["The baby was sleeping too much", "Inconsolable crying", "The baby was hungry", "The baby was laughing"]'::jsonb, 
1, 
'Inconsolable crying is the most common precipitant for a loss of control by a caregiver leading to a shaking event.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'When an infant with AHT is "shaken and then slammed" against a soft surface like a mattress, which type of injury is commonly seen?', 
'["External bruising of the scalp", "Internal brain injury without external signs of trauma", "Complex skull fractures", "None"]'::jsonb, 
1, 
'A "soft impact" (like a mattress or sofa) may leave no external bruises or skull fractures but can still cause devastating intracranial injury due to the sudden deceleration.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: "Apnea" (stopping breathing) in an infant with head trauma is a sign of severe injury and carry a poor prognosis.', 
'["True", "False"]'::jsonb, 
0, 
'True. Apnea in AHT often results from injury to the brainstem or severe intracranial pressure, and it leads to secondary hypoxic-ischemic damage.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes a hematoma that occurs *between* the skull and the dura mater, usually due to a tear in the middle meningeal artery after a direct blow?', 
'["Subdural hematoma", "Epidural hematoma", "Subarachnoid hemorrhage", "Intracerebral hemorrhage"]'::jsonb, 
1, 
'Epidural hematomas are more commonly associated with accidental trauma (e.g., a direct impact to the side of the head) than subdural hematomas, which are the hallmark of AHT.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In an infant with AHT, what is the significance of a "torn frenulum"?', 
'["It is an unrelated injury", "It is a sign of forced feeding or a blow to the mouth, often occurring alongside other abuse", "It is a normal finding", "It is due to a pacifier"]'::jsonb, 
1, 
'As mentioned previously, a torn frenulum is a marker of physical abuse and is frequently seen in children who also have AHT.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term refers to the "lucid interval" sometimes seen after a head injury before symptoms develop?', 
'["The time when the child is asleep", "A period of normal behavior before the effects of the hemorrhage or edema become clinically apparent", "The time it takes to get to the hospital", "None"]'::jsonb, 
1, 
'In AHT, there is usually no lucid interval; the child is symptomatic immediately after the event. A lucid interval is more classic for an epidural hematoma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'If an infant has a "subdural hematoma" but NO retinal hemorrhages and NO fractures, can abuse still be the cause?', 
'["No, you need the full triad", "Yes, as no single finding is required to make the diagnosis of AHT", "Only if the baby has a bruise", "None"]'::jsonb, 
1, 
'AHT is a clinical diagnosis based on the totality of the findings. The absence of one feature (like retinal hemorrhages) does not rule it out.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Why is it important to perform an MRI of the Brain and *Spine* in a case of suspected AHT?', 
'["To look for a tumor", "To identify ligamentous injury or spinal cord hemorrhage, which can occur during vigorous shaking", "To check for scoliosis", "None"]'::jsonb, 
1, 
'The neck of an infant is weak, and the head is large; shaking can cause severe "whiplash" injuries to the cervical spine and spinal cord.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the primary radiological difference between an "acute" and a "chronic" subdural hematoma on a non-contrast CT?', 
'["Acute blood is white (hyperdense); chronic blood is dark (hypodense)", "Acute blood is dark; chronic blood is white", "There is no difference", "Acute blood is only in the front"]'::jsonb, 
0, 
'This difference in density allows radiologists to date the hemorrhages and identify repeated trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which professional should perform the dilated eye exam in a child with suspected AHT?', 
'["The emergency physician", "An ophthalmologist (ideally a pediatric or forensic ophthalmologist)", "A nurse", "The parents"]'::jsonb, 
1, 
'Dilated fundoscopy in an infant is difficult and requires a specialist to accurately document the type and extent of retinal hemorrhages.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: "Seizures" in the setting of AHT are often associated with a higher risk of permanent brain damage.', 
'["True", "False"]'::jsonb, 
0, 
'True. Post-traumatic seizures can exacerbate brain injury through increased metabolic demand and hypoxia.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 3-year-old child presents with a massive epidural hematoma after a car accident. Is this AHT?', 
'["Yes, it''s a head injury", "No, it is an accidental traumatic brain injury (TBI) with a known high-force mechanism", "Only if the parent was driving", "None"]'::jsonb, 
1, 
'AHT refers specifically to *inflicted* (non-accidental) trauma. Accidental TBI is much more common in older children.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a potential "long-term" consequence of AHT?', 
'["Cortical blindness", "Developmental delay", "Spastic quadriplegia", "All of the above"]'::jsonb, 
3, 
'The morbidity of AHT is extremely high.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In a child with AHT, what does "midline shift" on a head CT indicate?', 
'["Normal brain anatomy", "Significant mass effect and pressure on the brain, often requiring emergency neurosurgical intervention", "A sign of a previous injury", "None"]'::jsonb, 
1, 
'Midline shift occurs when the pressure from a hemorrhage or swelling pushes the brain structures to one side, which can lead to life-threatening herniation.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the "Prevention" strategy known as "The Period of PURPLE Crying"?', 
'["A type of medication", "An evidence-based program to educate parents about normal infant crying and the dangers of shaking", "A way to swaddle a baby", "A surgical procedure"]'::jsonb, 
1, 
'This program is widely used to help parents understand that infant crying is a normal developmental phase and to provide coping strategies to prevent AHT.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'If a child survives an AHT event, why is it critical that they be placed in a safe environment immediately?', 
'["To save money", "Because the risk of repeat abuse (recidivism) is extremely high, and the next event may be fatal", "To punish the parents", "None"]'::jsonb, 
1, 
'Safety planning is the most important outcome of a child abuse investigation.')

;
