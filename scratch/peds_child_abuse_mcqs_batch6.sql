-- Batch 6: 31 Child Abuse Recognition MCQs (Questions 156-186)
-- Topic: Physical Abuse - Abdominal and Internal Trauma
-- Slug: peds-child-abuse

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most common mechanism of abdominal injury in physical child abuse?', 
'["A fall from a bicycle", "A direct, forceful blow to the abdomen (e.g., a punch or kick)", "Accidental ingestion of a toy", "Choking"]'::jsonb, 
1, 
'Abdominal trauma in child abuse is typically caused by blunt force (punches, kicks, or knees) to the central abdomen. These injuries often lack external bruising because the abdominal wall is flexible.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Abdominal trauma is the second most common cause of death from child abuse after head trauma.', 
'["True", "False"]'::jsonb, 
0, 
'True. While less common than head trauma, abdominal injuries are often fatal because they may be internal and not recognized until the child is in profound shock.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following internal organ injuries is highly characteristic of physical abuse in a young child?', 
'["Appendicitis", "Duodenal hematoma", "Kidney stones", "Gallstones"]'::jsonb, 
1, 
'A duodenal hematoma occurs when a blunt blow crushes the duodenum against the spine. This can cause a high-grade bowel obstruction, presenting with bilious vomiting several days after the injury.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 3-year-old child presents with severe abdominal pain and vomiting. A CT scan shows a laceration of the "Body of the Pancreas." In the absence of a major car accident, what is the most likely cause?', 
'["Type 1 Diabetes", "Physical abuse (blunt trauma to the epigastrium)", "Cystic fibrosis", "Viral pancreatitis"]'::jsonb, 
1, 
'Pancreatic injury in a child is rare and usually requires significant focal force. If there is no history of a high-speed accident or bicycle handlebar injury, abuse is the primary suspect.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a potential "late" complication of an abusive pancreatic injury?', 
'["Pancreatic pseudocyst", "Pancreatic cancer", "Gallstones", "Liver failure"]'::jsonb, 
0, 
'Pancreatic pseudocysts can develop weeks after the initial trauma and may present as a palpable abdominal mass and persistent pain.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 2-year-old child presents with shock and a distended, tender abdomen. A FAST exam (ultrasound) shows free fluid. What is the most common internal injury in this setting?', 
'["Urinary tract infection", "Liver or Spleen laceration", "Constipation", "Aortic aneurysm"]'::jsonb, 
1, 
'Blunt abdominal trauma often results in lacerations to the solid organs (liver and spleen), leading to hemoperitoneum (blood in the abdominal cavity) and hemorrhagic shock.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Most children with abusive abdominal injuries will have visible bruising on their abdominal skin.', 
'["True", "False"]'::jsonb, 
1, 
'False. Because the abdominal wall is soft and compliant, a significant blow can cause severe internal organ damage *without* leaving an external bruise. The lack of a bruise does NOT rule out internal trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which laboratory test is most useful for identifying occult (hidden) liver injury in a child suspected of being abused?', 
'["Serum Amylase", "Serum ALT and AST (transaminases)", "Serum Glucose", "Serum Sodium"]'::jsonb, 
1, 
'Screening transaminases (ALT/AST) are highly sensitive for liver trauma. Levels > 80-100 U/L in a suspicious context warrant further imaging (abdominal CT with contrast).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the significance of "elevated lipase" in a child with abdominal pain and suspected NAT?', 
'["It suggests a urinary tract infection", "It suggests pancreatic trauma", "It is normal in all toddlers", "It means the child is hungry"]'::jsonb, 
1, 
'Elevated amylase and lipase can be markers of pancreatic injury, though they may not be elevated in the first few hours after trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which type of "accidental" injury can mimic the focal blunt force trauma of abuse to the abdomen?', 
'["A fall from a height of 2 feet", "Bicycle handlebar injury (falling onto the end of the handlebar)", "A dog bite", "Swimming"]'::jsonb, 
1, 
'Bicycle handlebar injuries cause focal blunt trauma to the epigastrium and can cause duodenal hematomas or pancreatic lacerations. If this history is not present, abuse is likely.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with a "perforated hollow viscus" (bowel perforation) after a blow to the abdomen. What will be seen on a plain abdominal X-ray?', 
'["Increased stool", "Pneumoperitoneum (free air under the diaphragm)", "Kidney stones", "Nothing"]'::jsonb, 
1, 
'Bowel perforation allows air to escape into the abdominal cavity, which is easily seen on an upright or decubitus X-ray.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the "gold standard" imaging modality for the evaluation of a hemodynamically stable child with suspected abdominal trauma?', 
'["Abdominal Ultrasound", "Contrast-enhanced CT scan of the abdomen and pelvis", "Plain abdominal X-ray", "MRI"]'::jsonb, 
1, 
'CT with IV contrast is the best test to identify lacerations, hematomas, and bowel wall thickening with high precision.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 2-year-old child is brought to the ED with "bilious vomiting" (green vomit). The parents say it started after the child "fell off a chair" 2 days ago. What should be top of the differential?', 
'["Appendicitis", "Duodenal hematoma (Abusive or Accidental)", "Gastroenteritis", "Pyloric stenosis"]'::jsonb, 
1, 
'Bilious vomiting in a toddler after a minor "fall" is a red flag for a duodenal hematoma causing an obstruction.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Injuries to the "mesentery" (the tissue supporting the bowel) are common in abusive blunt trauma.', 
'["True", "False"]'::jsonb, 
0, 
'True. Deceleration forces or direct blows can cause mesenteric tears or hematomas, leading to bowel ischemia or hemorrhage.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes the bruising and hemorrhage *behind* the abdominal cavity (where the kidneys and large vessels are located)?', 
'["Intraperitoneal hemorrhage", "Retroperitoneal hemorrhage", "Pleural effusion", "Ascites"]'::jsonb, 
1, 
'Retroperitoneal injuries can occur with deep blunt trauma, often involving the kidneys or adrenal glands.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child with an abusive abdominal injury presents with "Grey Turner sign" (bruising on the flanks). This suggests:', 
'["Superficial skin infection", "Retroperitoneal hemorrhage (often from the pancreas or kidneys)", "A fall on the side", "None"]'::jsonb, 
1, 
'Grey Turner sign (flank bruising) and Cullen sign (periumbilical bruising) are signs of severe internal bleeding.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Why is it important to check a "Urinalysis" in a child with suspected abdominal trauma?', 
'["To look for a UTI", "To check for hematuria (blood), which could indicate a renal (kidney) or bladder injury", "To check for pregnancy", "To look for ketones"]'::jsonb, 
1, 
'Hematuria is a marker for injury to the urinary tract.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 4-year-old child has a "healing" pancreatic pseudocyst on ultrasound. Does this indicate a recent or an older injury?', 
'["Recent (within hours)", "Older (typically 1-3 weeks old)", "It means the child was born with it", "None"]'::jsonb, 
1, 
'Pseudocysts take time to form after the initial pancreatic ductal injury.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following "extra-abdominal" findings is frequently seen in children who also have abusive abdominal trauma?', 
'["Rib fractures and bruises elsewhere", "Cataracts", "Toe fungus", "Ear wax"]'::jsonb, 
0, 
'Abdominal trauma is often part of a larger pattern of physical assault.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In a case of suspected child abuse, why might a physician order an abdominal CT even if the physical exam is normal?', 
'["To waste money", "Because serious internal injuries can be ''occult'' and present with minimal early symptoms or no bruising", "Because the hospital requires it", "To look for a swallowed coin"]'::jsonb, 
1, 
'Screening with labs (LFTs) and imaging (CT) is necessary because the clinical exam is often unreliable in cases of high-force blunt trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Chylous ascites (milky fluid in the abdomen) can occur after an abusive injury to the mesenteric lymphatics.', 
'["True", "False"]'::jsonb, 
0, 
'True. Trauma to the lymphatic ducts can cause leakage of chyle into the peritoneum.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with "Hemoperitoneum." What is the most immediate life-threatening risk?', 
'["Infection", "Hypovolemic (hemorrhagic) shock", "Constipation", "Jaundice"]'::jsonb, 
1, 
'Rapid internal bleeding into the peritoneal cavity can lead to death within minutes or hours.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes a tear in the liver tissue caused by trauma?', 
'["Hepatitis", "Liver laceration", "Cirrhosis", "Steatosis"]'::jsonb, 
1, 
'Liver lacerations are a common finding in abusive blunt trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child with a duodenal hematoma is usually managed initially with:', 
'["Immediate surgery", "Bowel rest (NPO), Nasogastric (NG) suction, and IV fluids; most resolve spontaneously", "Antibiotics only", "No treatment needed"]'::jsonb, 
1, 
'Most duodenal hematomas are managed non-operatively unless there is a complete obstruction that fails to resolve or a perforation.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the significance of "adrenal hemorrhage" in a child suspected of NAT?', 
'["It is common in all babies", "It can occur as a result of direct blunt trauma to the upper abdomen or flank", "It only happens in CAH", "None"]'::jsonb, 
1, 
'While it can happen at birth, in a toddler, adrenal hemorrhage suggests significant trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Most pediatric liver and spleen lacerations from blunt trauma are managed non-surgically if the child is hemodynamically stable.', 
'["True", "False"]'::jsonb, 
0, 
'True. In children, these solid organ injuries often heal on their own with careful observation and monitoring.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 5-year-old child presents with bruising around the umbilicus (Cullen sign). The parent says the child "hit his stomach on a table." What does this sign usually indicate?', 
'["A superficial bruise", "Intra-abdominal hemorrhage, often related to pancreatitis or other severe trauma", "A birthmark", "An umbilical hernia"]'::jsonb, 
1, 
'Cullen sign is a serious finding indicating retroperitoneal blood has tracked to the periumbilical area.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the role of a "toxicology screen" in a child with unexplained abdominal pain and lethargy?', 
'["To check for food allergies", "To rule out accidental or intentional ingestion of drugs/poisons, which can also cause vomiting and altered mental status", "To check for alcohol", "None"]'::jsonb, 
1, 
'Ingestions (neglect or physical abuse) can mimic the symptoms of internal trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which anatomical structure is most often injured in "seat belt syndrome," which must be distinguished from abusive trauma?', 
'["The lungs", "The lumbar spine and the small bowel (due to compression between the belt and spine)", "The arms", "The skull"]'::jsonb, 
1, 
'Seat belt syndrome in a car accident causes a specific pattern of injury (lumbar fracture + bowel trauma). If this history is absent, the same injury pattern is highly suspicious for NAT.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child with a suspected abusive abdominal injury is "NPO" (nothing by mouth). Why?', 
'["To punish the child", "To prevent complications if surgery is needed and to allow the bowel to rest if an obstruction exists", "Because the hospital is out of food", "To lose weight"]'::jsonb, 
1, 
'Pre-operative and therapeutic bowel rest is standard management for abdominal trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the primary reason why abusive abdominal injuries are so often fatal?', 
'["The organs are made of glass", "The lack of external signs and the resulting delay in seeking care or recognizing the severity of the internal injury", "There are no hospitals", "None"]'::jsonb, 
1, 
'Delayed diagnosis is the biggest risk factor for death in abusive abdominal trauma.')

;
