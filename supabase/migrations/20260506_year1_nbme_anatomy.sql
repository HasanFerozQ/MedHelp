-- Migration for NBME Shelf: Gross Anatomy & Embryology (1st Year)
-- Auto-generated from Test_Pattern.txt

BEGIN;

-- Ensure the topic exists
INSERT INTO topics (id, title, description, category)
VALUES (
    'nbme-shelf-anatomy-1st-year',
    'NBME Shelf: Gross Anatomy & Embryology',
    '110 high-yield questions covering 1st Year Anatomy & Embryology for NBME Shelf preparation.',
    '1st Year'
)
ON CONFLICT (id) DO UPDATE
SET title = EXCLUDED.title, description = EXCLUDED.description, category = EXCLUDED.category;

-- Delete existing questions for this topic to ensure idempotency
DELETE FROM questions WHERE topic_id = 'nbme-shelf-anatomy-1st-year';

INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '23a7345d-8cee-44ed-a36d-652476fd4fd3',
    'nbme-shelf-anatomy-1st-year',
    'A newborn male presents with excessive salivation and choking during feeding.

Physical Examination:
Temp: 36.5°C
HR: 140/min
RR: 40/min
SpO₂: 92%
Abdominal distension
Inability to pass nasogastric tube
Labs:
ABG: Mild respiratory acidosis
Question:

What is the embryological cause of this condition?',
    '["Failure of neural crest migration", "Abnormal tracheoesophageal septum formation", "Persistence of vitelline duct", "Failure of midgut rotation", "Defective cloacal division"]'::jsonb,
    1,
    'Explanation:

Classic esophageal atresia with TE fistula due to improper division of foregut.

Incorrect:
A: Hirschsprung disease
C: Meckel diverticulum
D: Malrotation
E: Urogenital anomalies',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '91d29902-235a-487a-95a6-d09f61d819b5',
    'nbme-shelf-anatomy-1st-year',
    'A 34-year-old female presents after a thyroidectomy with hoarseness.

Physical Exam:
Temp: 37°C
HR: 82/min
BP: 120/76 mmHg
RR: 16/min
Weak voice
Cannot abduct vocal cords
Question:

Which nerve is most likely injured?',
    '["External branch of superior laryngeal nerve", "Internal branch of superior laryngeal nerve", "Recurrent laryngeal nerve", "Glossopharyngeal nerve", "Hypoglossal nerve"]'::jsonb,
    2,
    'Explanation:

Controls all intrinsic laryngeal muscles except cricothyroid.

Incorrect:
A: Pitch control only
B: Sensory above vocal cords
D/E: Not involved in phonation',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'c612ea9b-6a4c-4451-926a-bf08a7b8b334',
    'nbme-shelf-anatomy-1st-year',
    'A 60-year-old male presents with sudden loss of vision in the right eye.

Physical Exam:
Fundoscopy: Cherry red spot
Question:

Which artery is occluded?',
    '["Posterior cerebral artery", "Central retinal artery", "Ophthalmic artery", "Middle cerebral artery", "Anterior cerebral artery"]'::jsonb,
    1,
    'Explanation:

Classic central retinal artery occlusion → painless vision loss.

Incorrect:
C: Would affect orbit more broadly
Others: cortical deficits',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '1a825ea8-7280-487a-83c9-1181afe81d06',
    'nbme-shelf-anatomy-1st-year',
    'A 25-year-old athlete presents with scapular winging after trauma.

Question:

Which muscle is paralyzed?',
    '["Trapezius", "Rhomboid major", "Serratus anterior", "Levator scapulae", "Deltoid"]'::jsonb,
    2,
    'Explanation:

Injury to long thoracic nerve → winged scapula.

Incorrect:
A: Drooping shoulder
B: Retraction weakness
Others unrelated',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '4a040962-da8d-4200-816b-7e72c35fe144',
    'nbme-shelf-anatomy-1st-year',
    'A newborn has cyanosis that improves when crying.

Question:

Most likely diagnosis?',
    '["Tetralogy of Fallot", "Transposition of great vessels", "Choanal atresia", "PDA", "Truncus arteriosus"]'::jsonb,
    2,
    'Explanation:

Cyanosis relieved by crying → nasal obstruction.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'f0e3d706-5d41-47fb-af99-92d792c986fa',
    'nbme-shelf-anatomy-1st-year',
    'A patient presents with inability to extend wrist.

Question:

Which nerve is damaged?',
    '["Median nerve", "Ulnar nerve", "Radial nerve", "Musculocutaneous nerve", "Axillary nerve"]'::jsonb,
    2,
    'Explanation:

Radial nerve → wrist extension.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '8ca9ad69-c5cb-46d3-b50c-6ada343bb52e',
    'nbme-shelf-anatomy-1st-year',
    'Failure of neural crest migration leads to:',
    '["Meckel diverticulum", "Hirschsprung disease", "Omphalocele", "Gastroschisis", "Pyloric stenosis"]'::jsonb,
    1,
    '— Hirschsprung disease',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'dede9752-801a-42bc-adae-349728f0f3d2',
    'nbme-shelf-anatomy-1st-year',
    'A patient cannot invert the foot.

Question:

Which nerve is injured?',
    '["Deep fibular", "Superficial fibular", "Tibial nerve", "Common fibular", "Sural nerve"]'::jsonb,
    2,
    '— Tibial nerve',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '0b6ace4c-c7d0-402b-96fb-138fede6d1cb',
    'nbme-shelf-anatomy-1st-year',
    'A newborn has abdominal contents protruding into umbilical cord.

Question:

Diagnosis?',
    '["Gastroschisis", "Omphalocele", "Meckel diverticulum", "Hernia", "Diastasis recti"]'::jsonb,
    1,
    '— Omphalocele',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '9ad7215a-79e2-4cd1-b318-ce613f854905',
    'nbme-shelf-anatomy-1st-year',
    'A 28-year-old male motorcyclist is brought to the ED after a high-speed crash. His right upper limb is adducted, internally rotated, and extended at the elbow with pronated forearm.

Physical Examination:
Temp: 36.7°C
HR: 110/min
BP: 134/82 mmHg
RR: 20/min
SpO₂: 97%
Loss of shoulder abduction
Loss of elbow flexion
“Waiter’s tip” posture
Labs:
Normal
Question:

Which nerve roots are most likely injured?',
    '["C5\u2013C6", "C7\u2013C8", "C8\u2013T1", "T1\u2013T2", "C6\u2013C7"]'::jsonb,
    0,
    'Explanation:

Classic Erb-Duchenne palsy (upper trunk).
Muscles affected: deltoid, biceps, supraspinatus.

Incorrect:
B: Middle trunk → less classic posture
C: Klumpke palsy (claw hand)
Others not consistent',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '30668eaf-f327-4e9f-8657-391577d952b5',
    'nbme-shelf-anatomy-1st-year',
    'A newborn presents with difficulty swallowing and stridor.

Imaging:
Double aortic arch compressing trachea/esophagus
Question:

Which embryological structure failed to regress?',
    '["Left 4th arch", "Right dorsal aorta", "Left dorsal aorta", "Right 4th arch", "Left 6th arch"]'::jsonb,
    1,
    'Explanation:

Persistence → vascular ring compressing airway.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'ee407253-ef05-4d37-9e10-7383d8a47809',
    'nbme-shelf-anatomy-1st-year',
    'A 63-year-old male presents with:

Right facial paralysis
Decreased lacrimation
Hyperacusis
Question:

Lesion is most likely in which structure?',
    '["Medial medulla", "Lateral medulla", "Pons (facial nucleus)", "Midbrain tectum", "Internal capsule"]'::jsonb,
    2,
    'Explanation:

Facial nerve nucleus located in pons → LMN facial paralysis.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '4d59049e-2d0d-4df6-a22b-88bdf2f81b31',
    'nbme-shelf-anatomy-1st-year',
    'A 45-year-old male presents with a bulge above the inguinal ligament.

Question:

A direct inguinal hernia passes through which structure?',
    '["Deep inguinal ring", "Hesselbach\u2019s triangle", "Femoral canal", "Superficial ring only", "Lacunar ligament"]'::jsonb,
    1,
    'Explanation:

Direct hernias occur medial to inferior epigastric vessels.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '8a95cc55-bbc0-4bd3-adc4-3d1e90306db0',
    'nbme-shelf-anatomy-1st-year',
    'A neonate presents with bilious vomiting.

Imaging:
Corkscrew appearance of intestines
Question:

What is the underlying embryological defect?',
    '["Failure of foregut rotation", "Failure of midgut rotation", "Failure of hindgut migration", "Persistent vitelline duct", "Abnormal cloacal division"]'::jsonb,
    1,
    '— Midgut rotation failure',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '88c90033-4426-4edb-bf9a-b08da27b0c80',
    'nbme-shelf-anatomy-1st-year',
    'A 40-year-old patient cannot dorsiflex the foot.

Question:

Which nerve is injured?',
    '["Tibial nerve", "Deep fibular nerve", "Superficial fibular nerve", "Femoral nerve", "Obturator nerve"]'::jsonb,
    1,
    'Explanation:

Controls anterior compartment → dorsiflexion.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'dda1e1b5-9395-4331-a45c-ad1f9a25ba34',
    'nbme-shelf-anatomy-1st-year',
    'A newborn presents with respiratory distress.

Imaging:
Abdominal organs in thoracic cavity
Question:

Which structure failed to develop properly?',
    '["Septum transversum", "Pleuroperitoneal membranes", "Dorsal mesentery", "Body wall muscles", "Central tendon"]'::jsonb,
    1,
    'Explanation:

Defect → Bochdalek hernia.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'b94f3ee5-81e6-44f7-9461-b76f07625390',
    'nbme-shelf-anatomy-1st-year',
    'A patient cannot abduct the eye.

Question:

Which nerve is affected?',
    '["CN III", "CN IV", "CN VI", "CN V1", "CN II"]'::jsonb,
    2,
    '— CN VI',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '72403c67-1f25-475e-bb92-f5dd5c22ac5c',
    'nbme-shelf-anatomy-1st-year',
    'A fetus has spina bifida with exposed neural tissue.

Question:

Failure of which process?',
    '["Neural crest migration", "Neural tube closure", "Somite differentiation", "Endoderm formation", "Mesoderm segmentation"]'::jsonb,
    1,
    '— Neural tube closure',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '5a7bc5b6-4967-417d-b51a-ea7b8da5a2ce',
    'nbme-shelf-anatomy-1st-year',
    'A patient with cirrhosis develops caput medusae.

Question:

Which veins are involved?',
    '["Superior epigastric + inferior epigastric", "Paraumbilical + superficial epigastric", "Splenic + renal", "Portal + hepatic veins", "Gastric + esophageal"]'::jsonb,
    1,
    'A 47-year-old male presents with diplopia and inability to abduct the right eye. He also has decreased corneal reflex.

Physical Examination:
Temp: 37.1°C
HR: 84/min
BP: 130/78 mmHg
RR: 16/min
SpO₂: 98%
Right lateral rectus paralysis
Loss of sensation over forehead
Labs:
Normal
Question:

Which structure is most likely affected?

A. Internal carotid artery
B. Cavernous sinus
C. Superior orbital fissure only
D. Optic canal
E. Pterygopalatine fossa

Answer: B — Cavernous sinus
Explanation:

CN VI (abduction) + V1 (forehead sensation) involvement → lesion in cavernous sinus, where these structures run together.

Incorrect:
A: ICA alone doesn’t cause V1 sensory loss
C: Would spare some structures
D: Only optic nerve
E: Not involving CN VI',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '135cef9b-5ef4-4325-8560-f707b99300a6',
    'nbme-shelf-anatomy-1st-year',
    'A newborn has facial asymmetry and difficulty chewing.

Question:

Muscles of mastication arise from which pharyngeal arch?',
    '["First arch", "Second arch", "Third arch", "Fourth arch", "Sixth arch"]'::jsonb,
    0,
    'Explanation:

First arch → CN V3 → muscles of mastication.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'accedad6-a34d-4380-b4ba-31743973bb28',
    'nbme-shelf-anatomy-1st-year',
    'A 32-year-old female undergoes lymph node biopsy in the posterior triangle and develops shoulder droop.

Question:

Which nerve was injured?',
    '["Phrenic nerve", "Vagus nerve", "Spinal accessory nerve", "Hypoglossal nerve", "Greater auricular nerve"]'::jsonb,
    2,
    'Explanation:

CN XI innervates trapezius → shoulder elevation.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '258f0aca-9747-491a-ba4a-446b6435ddc1',
    'nbme-shelf-anatomy-1st-year',
    'A patient has a pelvic kidney.

Question:

What caused this anomaly?',
    '["Failure of ureteric bud formation", "Failure of kidney ascent", "Failure of metanephric differentiation", "Abnormal cloacal division", "Persistence of pronephros"]'::jsonb,
    1,
    '— Failure of ascent',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '845f5ba3-2b3d-410a-9600-10f2e9d64562',
    'nbme-shelf-anatomy-1st-year',
    'A patient has an aneurysm causing bitemporal hemianopia.

Question:

Which artery is involved?',
    '["Middle cerebral artery", "Posterior cerebral artery", "Anterior cerebral artery", "Anterior communicating artery", "Basilar artery"]'::jsonb,
    3,
    'Explanation:

Compresses optic chiasm → bitemporal hemianopia.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '7012776b-f691-42e3-9d51-1aff4d29abeb',
    'nbme-shelf-anatomy-1st-year',
    'A newborn has persistent truncus arteriosus.

Question:

Failure of which process?',
    '["Neural crest migration", "Endocardial cushion formation", "Septum primum formation", "Septum secundum formation", "Cardiac looping"]'::jsonb,
    0,
    '— Neural crest migration',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '0122a476-edae-43a9-b714-b9c223102b2e',
    'nbme-shelf-anatomy-1st-year',
    'A patient has inability to extend fingers but wrist extension is weak (not absent).

Question:

Which nerve branch is injured?',
    '["Radial nerve (main trunk)", "Posterior interosseous nerve", "Median nerve", "Ulnar nerve", "Musculocutaneous nerve"]'::jsonb,
    1,
    'Explanation:

Branch of radial nerve → finger extension only.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'b8053f5a-5048-4146-8899-9f04b36fc2fa',
    'nbme-shelf-anatomy-1st-year',
    'Which structure is derived from the midgut?',
    '["Esophagus", "Stomach", "Duodenum (proximal)", "Appendix", "Liver"]'::jsonb,
    3,
    '— Appendix',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '8b4cd804-c29b-47bc-97e8-46feae6bba57',
    'nbme-shelf-anatomy-1st-year',
    'A lesion causes:

Loss of pain and temperature on left side
Motor weakness on right side
Question:

Where is the lesion?',
    '["Left lateral medulla", "Right lateral medulla", "Left spinal cord (hemisection)", "Right spinal cord (hemisection)", "Central cord"]'::jsonb,
    3,
    'Explanation:

Brown-Séquard syndrome.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'cb6a78cd-cd8e-47f4-a016-eacd99aad43c',
    'nbme-shelf-anatomy-1st-year',
    'A newborn has cleft lip.

Question:

Failure of fusion between which structures?',
    '["Maxillary + lateral nasal", "Maxillary + medial nasal", "Mandibular + maxillary", "Frontonasal + mandibular", "Lateral nasal + mandibular"]'::jsonb,
    1,
    '— Maxillary + medial nasal',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '42312ad0-e350-4736-9b9d-58cb3d002a3d',
    'nbme-shelf-anatomy-1st-year',
    'A 62-year-old male undergoes femoral artery catheterization and later develops weakness in knee extension.

Physical Examination:
Temp: 36.9°C
HR: 88/min
BP: 132/84 mmHg
RR: 16/min
SpO₂: 98%
Weak quadriceps
Decreased patellar reflex
Question:

Which structure was most likely injured?',
    '["Femoral nerve", "Obturator nerve", "Sciatic nerve", "Saphenous nerve", "Lateral femoral cutaneous nerve"]'::jsonb,
    0,
    'Explanation:

Femoral nerve lies lateral to femoral artery → supplies quadriceps.

Incorrect:
B: Adductor weakness
C: Posterior thigh
D: Sensory only
E: Lateral thigh sensation',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'c7117063-43b8-47aa-baa6-756cdc46260d',
    'nbme-shelf-anatomy-1st-year',
    'A premature infant has respiratory distress due to lack of surfactant.

Question:

Which embryologic stage is affected?',
    '["Pseudoglandular", "Canalicular", "Saccular", "Alveolar", "Embryonic"]'::jsonb,
    2,
    'Explanation:

Surfactant production begins late canalicular, increases in saccular stage.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '5acf1566-8b8b-4ded-bc12-d94148fa827b',
    'nbme-shelf-anatomy-1st-year',
    'A patient presents with:

Contralateral paralysis
Loss of vibration sense
Tongue deviates toward lesion
Question:

Which artery is occluded?',
    '["Posterior inferior cerebellar artery", "Anterior spinal artery", "Basilar artery", "Superior cerebellar artery", "Vertebral artery"]'::jsonb,
    1,
    '— Anterior spinal artery',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '811a7c9a-3cb4-42d7-aea3-102bbd92aa45',
    'nbme-shelf-anatomy-1st-year',
    'A child has undescended testes.

Question:

Which structure guides testicular descent?',
    '["Processus vaginalis", "Gubernaculum", "Mesonephric duct", "Mullerian duct", "Tunica vaginalis"]'::jsonb,
    1,
    '— Gubernaculum',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '68e82cea-64bf-4654-8a31-c5cdda473edd',
    'nbme-shelf-anatomy-1st-year',
    'A patient suffers injury during venipuncture.

Question:

Which structure lies medial to the brachial artery in the cubital fossa?',
    '["Biceps tendon", "Median nerve", "Radial nerve", "Cephalic vein", "Basilic vein"]'::jsonb,
    1,
    'Explanation:

Order: TAN → Tendon, Artery, Nerve.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '03eb4e4f-2b00-4362-ab71-c5e646c68d80',
    'nbme-shelf-anatomy-1st-year',
    'Which structure is derived from neural crest cells?',
    '["Skeletal muscle", "Melanocytes", "Hepatocytes", "Renal tubules", "Endothelium"]'::jsonb,
    1,
    '— Melanocytes',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '3eb44c08-952a-4287-83cd-58933aeac445',
    'nbme-shelf-anatomy-1st-year',
    'A stroke causes:

Contralateral hemiplegia
No sensory loss
Question:

Which part is affected?',
    '["Anterior limb", "Genu", "Posterior limb", "Retrolenticular", "Sublenticular"]'::jsonb,
    2,
    '— Posterior limb',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'fe2f3436-9ca5-47b4-b996-ccf2ecdb26ef',
    'nbme-shelf-anatomy-1st-year',
    'Which structure arises from the foregut?',
    '["Appendix", "Transverse colon (distal)", "Liver", "Cecum", "Ascending colon"]'::jsonb,
    2,
    '— Liver',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'ef3ad60d-a9ac-4930-833a-ca5ab0e20e50',
    'nbme-shelf-anatomy-1st-year',
    'A patient cannot externally rotate the shoulder.

Question:

Which muscle is affected?',
    '["Subscapularis", "Teres minor", "Deltoid", "Pectoralis major", "Latissimus dorsi"]'::jsonb,
    1,
    '— Teres minor',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '835ac726-6a90-4b0f-ac17-76ec21ab9fec',
    'nbme-shelf-anatomy-1st-year',
    'Failure of cloacal division results in:',
    '["Hypospadias", "Epispadias", "Persistent cloaca", "Renal agenesis", "Horseshoe kidney"]'::jsonb,
    2,
    '🧠 FINAL SET
Set 5 (Q41–50)',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'bbd7f3d9-256b-48d8-9c3a-3407d1a7d598',
    'nbme-shelf-anatomy-1st-year',
    'A penetrating injury affects the deepest structure.

Question:

Which structure is most posterior/deep?',
    '["Tibial nerve", "Popliteal vein", "Popliteal artery", "Common fibular nerve", "Small saphenous vein"]'::jsonb,
    2,
    '— Popliteal artery',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '6c089ed0-ff0d-4687-a784-733e01e3995d',
    'nbme-shelf-anatomy-1st-year',
    'Annular pancreas results from:',
    '["Failure of ventral bud rotation", "Failure of dorsal bud formation", "Excessive apoptosis", "Neural crest defect", "Cloacal abnormality"]'::jsonb,
    0,
    '— Ventral bud rotation failure',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '4e922d5b-5309-49aa-a508-e8830e18d21d',
    'nbme-shelf-anatomy-1st-year',
    'A lesion proximal to chorda tympani causes:',
    '["Loss of taste anterior 2/3 tongue", "Loss of taste posterior 1/3", "Loss of smell", "Loss of vision", "Loss of gag reflex"]'::jsonb,
    0,
    '— Loss of taste anterior 2/3',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '1757fe26-2b57-412a-b222-6a899711aa53',
    'nbme-shelf-anatomy-1st-year',
    'Patent foramen ovale results from:',
    '["Failure of septum primum", "Failure of septum secundum", "Failure of fusion of septa", "Neural crest defect", "Endocardial cushion defect"]'::jsonb,
    2,
    '— Failure of fusion',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'ff3a3e0c-9170-49d0-9bed-f151e10eb12b',
    'nbme-shelf-anatomy-1st-year',
    'Compression causes:

Weak hand grip
Sensory loss medial forearm
Question:

Which structure is compressed?',
    '["Upper trunk", "Middle trunk", "Lower trunk", "Lateral cord", "Posterior cord"]'::jsonb,
    2,
    '— Lower trunk',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '8e6b3192-fb2c-4479-bdad-f298b00bf6e7',
    'nbme-shelf-anatomy-1st-year',
    'Persistence leads to:',
    '["Omphalocele", "Gastroschisis", "Meckel diverticulum", "Umbilical hernia", "Diaphragmatic hernia"]'::jsonb,
    2,
    '— Meckel diverticulum',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '8abd3aa2-0aea-4fbe-8b72-4d4c7f5f96cc',
    'nbme-shelf-anatomy-1st-year',
    'Which branch arises from the first part?',
    '["Vertebral artery", "Suprascapular artery", "Dorsal scapular artery", "Circumflex scapular artery", "Thoracodorsal artery"]'::jsonb,
    0,
    '— Vertebral artery',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'e1d9507c-dff0-4370-ae03-e715388011fd',
    'nbme-shelf-anatomy-1st-year',
    'Failure of urachus closure results in:',
    '["Vesicoureteral reflux", "Patent urachus", "Meckel diverticulum", "Renal agenesis", "Bladder exstrophy"]'::jsonb,
    1,
    '— Patent urachus',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '054ae373-71e4-4be6-9464-86f43d26c578',
    'nbme-shelf-anatomy-1st-year',
    'A lesion causes ipsilateral ataxia.

Question:

Which structure is affected?',
    '["Cerebellar hemisphere", "Basal ganglia", "Thalamus", "Internal capsule", "Red nucleus"]'::jsonb,
    0,
    '— Cerebellar hemisphere',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '0e395f46-82e6-4cbc-958a-78dbc4bd43f9',
    'nbme-shelf-anatomy-1st-year',
    'Which structure arises from the third pouch?',
    '["Thyroid gland", "Inferior parathyroid", "Superior parathyroid", "Thymus", "Tonsils"]'::jsonb,
    3,
    '— Thymus',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'd9beb85d-1b8b-48d6-8444-933f7d0591c1',
    'nbme-shelf-anatomy-1st-year',
    'A 55-year-old female undergoes axillary lymph node dissection for breast carcinoma. Postoperatively, she has difficulty elevating her arm above the horizontal plane.

Physical Examination:
Temp: 37.0°C
HR: 80/min
BP: 126/78 mmHg
RR: 14/min
SpO₂: 99%
Weak upward rotation of scapula
Shoulder droop
Labs:
Normal
Question:

Which nerve was most likely injured?',
    '["Long thoracic nerve", "Thoracodorsal nerve", "Spinal accessory nerve", "Axillary nerve", "Dorsal scapular nerve"]'::jsonb,
    2,
    'Explanation:

Trapezius (CN XI) → required for elevation above horizontal.

Incorrect:
A: Winged scapula
B: Latissimus dorsi
D: Deltoid (abduction 15–90°)
E: Rhomboids',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'c32faed2-18e6-41f6-b184-72133389b9b8',
    'nbme-shelf-anatomy-1st-year',
    'A neonate has isolated esophageal atresia without fistula.

Question:

Which developmental error occurred?',
    '["Failure of recanalization", "Abnormal tracheoesophageal septum", "Neural crest defect", "Failure of foregut rotation", "Abnormal cloacal division"]'::jsonb,
    0,
    '— Failure of recanalization',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '53b7675a-8f13-4c9e-81ee-a33b9ea594c1',
    'nbme-shelf-anatomy-1st-year',
    'A 40-year-old typist has numbness in the lateral 3½ fingers.

Physical Examination:
Positive Tinel sign
Thenar atrophy
Question:

Which structure is compressed?',
    '["Ulnar nerve", "Radial nerve", "Median nerve", "Flexor carpi ulnaris tendon", "Palmaris longus tendon"]'::jsonb,
    2,
    '— Median nerve',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '08fbbce8-a8a1-4fc9-98e5-8e7d4b7b38f8',
    'nbme-shelf-anatomy-1st-year',
    'A patient has a midline neck cyst that moves with swallowing.

Question:

What is the embryologic origin?',
    '["Second pharyngeal pouch", "Thyroglossal duct", "Neural crest cells", "Third pharyngeal arch", "Endoderm of foregut"]'::jsonb,
    1,
    '— Thyroglossal duct',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'a6d3a076-63e5-40f4-bc6d-6245fdc22b9c',
    'nbme-shelf-anatomy-1st-year',
    'A tumor compresses structures passing through the jugular foramen.

Question:

Which nerve is affected?',
    '["CN V", "CN VII", "CN IX", "CN II", "CN VI"]'::jsonb,
    2,
    '— CN IX',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '09130de9-521b-4af6-ad11-c7e300467112',
    'nbme-shelf-anatomy-1st-year',
    'A fetus shows absence of radius.

Question:

Which signaling center is responsible for anterior-posterior limb patterning?',
    '["Apical ectodermal ridge", "Zone of polarizing activity", "Somites", "Neural crest", "Lateral plate mesoderm"]'::jsonb,
    1,
    '— Zone of polarizing activity',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '6d4c2e3b-1732-42ea-b4e9-49b0405e65e7',
    'nbme-shelf-anatomy-1st-year',
    'An intramuscular injection is improperly given in the medial buttock, leading to foot drop.

Physical Examination:
Loss of dorsiflexion
Sensory loss lateral leg
Question:

Which nerve is injured?',
    '["Superior gluteal nerve", "Inferior gluteal nerve", "Sciatic nerve", "Femoral nerve", "Obturator nerve"]'::jsonb,
    2,
    '— Sciatic nerve',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '33cc96e2-2e70-44bc-87be-fa85d3879217',
    'nbme-shelf-anatomy-1st-year',
    'A defect allows left-to-right shunting between atria.

Question:

Which structure normally closes after birth?',
    '["Ductus arteriosus", "Foramen ovale", "Ductus venosus", "Umbilical vein", "Umbilical arteries"]'::jsonb,
    1,
    '— Foramen ovale',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'd4c90ed1-4350-411c-9c19-0eca88ba545a',
    'nbme-shelf-anatomy-1st-year',
    'A patient has ischemia of the midgut.

Question:

Which artery is occluded?',
    '["Celiac trunk", "Superior mesenteric artery", "Inferior mesenteric artery", "Renal artery", "Splenic artery"]'::jsonb,
    1,
    '— Superior mesenteric artery',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '3632f0a5-b912-4902-9216-fef125054799',
    'nbme-shelf-anatomy-1st-year',
    'Persistence of the second pharyngeal cleft leads to:',
    '["Branchial cyst", "Thyroglossal cyst", "Dermoid cyst", "Lymphangioma", "Hemangioma"]'::jsonb,
    0,
    '— Branchial cyst',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '141b0102-6da0-4e4b-9440-8019a3541309',
    'nbme-shelf-anatomy-1st-year',
    'A 29-year-old man presents after a fall with:

Loss of elbow flexion
Loss of forearm supination
Preserved shoulder abduction
Physical Exam:
Temp: 36.8°C
HR: 76/min
BP: 124/80 mmHg
RR: 14/min
Question:

Which structure is most likely injured?',
    '["Upper trunk (C5\u2013C6)", "Musculocutaneous nerve", "Axillary nerve", "Lateral cord", "Radial nerve"]'::jsonb,
    1,
    'Trap Insight:

Erb palsy would affect shoulder abduction too.
Isolated deficit → distal nerve (musculocutaneous).

Incorrect:
A: Would affect deltoid
C: Deltoid only
D: Broader deficits
E: Extension deficits',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '8a88854a-c118-489a-9535-bb69d9446f29',
    'nbme-shelf-anatomy-1st-year',
    'A neonate has nonrotation of the gut. The colon lies entirely on the left side.

Question:

At what stage did the defect occur?',
    '["90\u00b0 rotation only", "180\u00b0 rotation", "Failure of initial 90\u00b0 rotation", "Failure of return to abdominal cavity", "Failure of fixation"]'::jsonb,
    0,
    'Trap Insight:

NBME loves distinguishing:

Nonrotation = 90° only completed',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '31c36869-bbda-463e-af06-248063e97bc4',
    'nbme-shelf-anatomy-1st-year',
    'A lesion causes:

Ipsilateral facial paralysis
Contralateral body paralysis
Question:

Where is the lesion?',
    '["Medial medulla", "Lateral medulla", "Pons (facial colliculus)", "Midbrain crus cerebri", "Internal capsule"]'::jsonb,
    2,
    'Trap Insight:

“Crossed findings” + facial nerve involvement = pons',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '957a003f-153b-46fa-a02a-1d0c8710b490',
    'nbme-shelf-anatomy-1st-year',
    'Which structure is derived from the left 6th aortic arch?',
    '["Left common carotid", "Left pulmonary artery", "Aortic arch", "Subclavian artery", "Internal carotid artery"]'::jsonb,
    1,
    'Trap Insight:

Left 6th → pulmonary artery + ductus arteriosus',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'ed0ec845-6f5e-4597-b4e3-7fc4e77c5a5e',
    'nbme-shelf-anatomy-1st-year',
    'During hysterectomy, a surgeon accidentally ligates the ureter near the uterine artery.

Question:

Where does this occur?',
    '["At pelvic brim", "Near cervix", "At bladder dome", "At ovarian ligament", "At urethra"]'::jsonb,
    1,
    'Trap Insight:

“Water under the bridge” → ureter under uterine artery.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '43fe68ee-0f31-4460-92a5-39c416e40ac1',
    'nbme-shelf-anatomy-1st-year',
    'Which defect is caused by failure of neural crest migration?',
    '["Ventricular septal defect", "Tetralogy of Fallot", "Atrial septal defect", "Patent ductus arteriosus", "Coarctation of aorta"]'::jsonb,
    1,
    'Trap Insight:

Outflow tract defects = neural crest.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'f81c8e99-2a3d-4847-b1a9-280215d83304',
    'nbme-shelf-anatomy-1st-year',
    'A patient cannot extend MCP joints but can extend wrist.

Question:

Which structure is damaged?',
    '["Radial nerve (axilla)", "Posterior interosseous nerve", "Deep branch of ulnar nerve", "Median nerve", "Musculocutaneous nerve"]'::jsonb,
    1,
    'Trap Insight:

Wrist extension preserved = radial nerve intact proximally.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'b8c1f07c-67cf-4252-9685-3679c80f46eb',
    'nbme-shelf-anatomy-1st-year',
    'Which structure contributes to the central tendon of diaphragm?',
    '["Pleuroperitoneal membrane", "Septum transversum", "Dorsal mesentery", "Body wall", "Somites"]'::jsonb,
    1,
    '— Septum transversum',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'd89f4390-a197-411b-9870-3f024796f03f',
    'nbme-shelf-anatomy-1st-year',
    'An aneurysm causes:

Contralateral lower limb weakness
No upper limb deficit
Question:

Which artery is involved?',
    '["Middle cerebral artery", "Anterior cerebral artery", "Posterior cerebral artery", "Basilar artery", "Anterior communicating artery"]'::jsonb,
    1,
    'Trap Insight:

ACA → lower limb cortex',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '1c9e1c45-bdd9-4141-ba79-e453d26888cf',
    'nbme-shelf-anatomy-1st-year',
    'Which nerve is associated with the 4th pharyngeal arch?',
    '["CN V", "CN VII", "CN IX", "CN X (superior laryngeal)", "CN X (recurrent laryngeal)"]'::jsonb,
    3,
    'Trap Insight:
4th arch → superior laryngeal
6th arch → recurrent laryngeal



-------------------------------------------- --------------------------------------------
-------------------------------------------- --------------------------------------------
-------------------------------------------- --------------------------------------------

A 67-year-old male retired construction worker presents to his primary care physician with a 3-month history of progressive dysphagia to solids, a 12-pound unintentional weight loss, and a persistent cough that worsens when lying down. He has a 40-pack-year smoking history and drinks 2–3 glasses of whiskey nightly. He denies hemoptysis or chest pain.
Physical Examination:
Vital Signs: Temp: 37.1°C, HR: 88/min, BP: 142/88 mmHg, RR: 18/min, SpO₂: 96% on room air.
General: Cachectic-appearing male in no acute distress.
Head & Neck: Left supraclavicular lymphadenopathy (Virchow''s node, ~2 cm, firm, non-tender). No jugular venous distension.
Chest: Dull percussion and decreased breath sounds at the right lung base.
Abdomen: Non-tender, no organomegaly.
Laboratory Results:
Hemoglobin: 10.1 g/dL (Normal: 13.5–17.5)
MCV: 78 fL (Normal: 80–100)
WBC: 9,800/mm³ (Normal: 4,500–11,000)
Albumin: 2.9 g/dL (Normal: 3.5–5.0)
ALT: 38 U/L (Normal: 7–56)
Alkaline Phosphatase: 210 U/L (Normal: 44–147)
Barium swallow: Irregular mucosal narrowing in the mid-esophagus.
Which of the following best explains the presence of the left supraclavicular lymphadenopathy in this patient?
A. Direct extension of the esophageal tumor into adjacent lymphatic channels of the mediastinum.
B. Hematogenous spread of tumor cells via the azygos venous system to the thoracic duct.
C. Lymphatic drainage of the abdominal and thoracic viscera converges into the thoracic duct, which empties near the left subclavian vein, making this the terminal node for distant metastases.
D. The right lymphatic duct drains the esophagus directly into the right subclavian vein, causing preferential right-sided nodal involvement.
E. Retrograde lymphatic flow from mediastinal nodes secondary to elevated right atrial pressure.
Correct Answer: C
Reasoning: The left supraclavicular (Virchow''s) node is the sentinel node for intra-abdominal and thoracic malignancies. This is explained entirely by the anatomy of the thoracic duct (Moore''s Clinically Oriented Anatomy). The thoracic duct begins at the cisterna chyli (L1–L2), ascends through the posterior mediastinum to the right of the aorta, crosses to the left at T4–T5, and empties into the junction of the left internal jugular and left subclavian veins. Because it collects lymph from virtually all of the body below the diaphragm plus the left thorax, metastatic cells traveling via lymphatics preferentially deposit at this terminal node — the left supraclavicular (Virchow''s) node. This finding (Troisier''s sign) signals advanced metastatic disease.
Incorrect Answer Breakdown:
A: Direct local extension would cause mediastinal lymphadenopathy, not a palpable left supraclavicular node. Local extension is a different mechanism than distant nodal metastasis.
B: The azygos system is a venous structure, not lymphatic. Hematogenous spread would seed the liver and lungs before causing a palpable supraclavicular node.
D: The right lymphatic duct drains the right thorax, right arm, and right head/neck — it does NOT specifically drain the esophagus, and right supraclavicular involvement is less classic for esophageal cancer than left-sided Virchow''s node.
E: Retrograde lymphatic flow (as seen in cardiac failure or superior vena cava syndrome) is not the mechanism here. There are no findings of right heart failure (no JVD, no edema), and this mechanism would not explain a firm, discrete, non-tender node.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '5d30c391-6373-42bb-9b9e-0b9b7b922308',
    'nbme-shelf-anatomy-1st-year',
    'A 34-year-old female emergency medicine nurse presents to her physician with a 6-week history of right foot drop that developed insidiously. She reports difficulty walking and frequent tripping. She denies back pain, bowel or bladder incontinence, or trauma. She recalls spending prolonged periods crouching while tending to her garden over the past two months.
Physical Examination:
Vital Signs: Temp: 36.8°C, HR: 72/min, BP: 118/74 mmHg, RR: 14/min, SpO₂: 99% on room air.
Neurological: Right-sided weakness of ankle dorsiflexion (0/5), toe extension (1/5), and eversion (2/5). Inversion is intact (4/5). Sensation is decreased over the dorsum of the right foot and lateral leg. Knee jerk (L4) is intact bilaterally. Achilles reflex is intact bilaterally.
Musculoskeletal: Full range of motion at the right hip and knee. No tenderness over the lumbar spine.
Laboratory Results:
CBC: Within normal limits.
CMP: Within normal limits.
Fasting glucose: 88 mg/dL (Normal: 70–99).
ESR: 12 mm/hr (Normal: 0–20).
MRI lumbar spine: No disc herniation or nerve root compression identified.
Which of the following is the most likely site of nerve injury?',
    '["L4\u2013L5 nerve root compression at the intervertebral foramen.", "The sciatic nerve at the level of the greater sciatic notch.", "The common fibular (peroneal) nerve at the fibular head.", "The deep fibular nerve in the lateral compartment of the leg.", ""]'::jsonb,
    2,
    'Reasoning: This is a classic presentation of common fibular (common peroneal) nerve palsy, as described in both Moore''s Clinically Oriented Anatomy and Snell''s Clinical Neuroanatomy. The common fibular nerve wraps around the neck of the fibula superficially, making it highly vulnerable to compression from prolonged crouching, habitual leg-crossing, or external pressure. It divides into: (1) the deep fibular nerve, which supplies the anterior compartment (tibialis anterior, extensor hallucis longus) responsible for dorsiflexion and toe extension, and (2) the superficial fibular nerve, which supplies the lateral compartment (fibularis longus and brevis) responsible for eversion. Both functions are impaired here. Inversion (tibialis posterior, posterior compartment, tibial nerve) is preserved, confirming the lesion is distal to the sciatic nerve. The MRI rules out a central/radicular cause.
Incorrect Answer Breakdown:
A: An L4–L5 radiculopathy would show back pain, possible disc herniation on MRI, and would likely affect knee extension (L4) or involve other dermatomal/myotomal distributions. The normal MRI and absence of back pain make this incorrect.
B: A sciatic nerve injury at the greater sciatic notch would produce combined tibial AND fibular nerve deficits — foot drop plus loss of plantar flexion, plus numbness of the entire foot and posterior leg. Inversion (tibial nerve) would be impaired.
D (first): The superficial fibular nerve supplies only the lateral compartment (eversion) and lateral leg/dorsal foot sensation. A pure superficial fibular lesion would spare dorsiflexion, which is severely affected here.
E: The deep fibular nerve supplies the anterior compartment only. A pure deep fibular palsy would cause foot drop but preserve eversion and spares the lateral leg sensation. Both are affected here, confirming a more proximal common fibular lesion.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '11f29a30-8929-4c0a-889a-8c0d4fb3e83e',
    'nbme-shelf-anatomy-1st-year',
    'A 52-year-old male accountant presents to the emergency department after sudden onset of severe, tearing chest pain that radiates to the interscapular region. He has a history of poorly controlled hypertension and reports a 20-year history of tobacco use (1 pack/day). He denies shortness of breath and is not diaphoretic.
Physical Examination:
Vital Signs: Temp: 37.0°C, HR: 102/min, BP: Right arm 178/104 mmHg, Left arm 143/86 mmHg, RR: 20/min, SpO₂: 97% on room air.
General: Anxious male in moderate distress.
Cardiovascular: S1 and S2 normal; a diastolic decrescendo murmur is heard along the left sternal border. Pulses are diminished in the left upper extremity compared to the right.
Chest: Clear to auscultation bilaterally.
Neurological: Grossly intact.
Laboratory Results:
Hemoglobin: 14.3 g/dL (Normal: 13.5–17.5)
Troponin I: 0.02 ng/mL (Normal: <0.04)
D-dimer: 3,400 ng/mL (Normal: <500)
Creatinine: 1.1 mg/dL (Normal: 0.7–1.3)
ECG: Sinus tachycardia; no ST-segment changes.
CXR: Widened mediastinum.
Which of the following best describes the anatomical structure most directly involved in the pathophysiology of this patient''s condition?',
    '["The right coronary artery, originating from the right aortic sinus of Valsalva.", "The tunica intima and tunica media of the thoracic aorta.", "The pulmonary trunk at its bifurcation into right and left pulmonary arteries.", "The fibrous pericardium and its attachment to the central tendon of the diaphragm.", "The ligamentum arteriosum and its attachment to the aortic isthmus."]'::jsonb,
    1,
    'Reasoning: This patient presents with a Type A aortic dissection (Stanford classification). The pathophysiology involves a tear in the tunica intima, allowing blood to track between the intima and media, creating a false lumen within the tunica media (Gray''s Anatomy for Students; Moore''s Clinically Oriented Anatomy). The key findings are: (1) tearing interscapular pain — classic for posterior mediastinal involvement; (2) blood pressure differential between arms — the dissection flap occludes the left subclavian artery origin; (3) aortic regurgitation murmur — the dissection extends proximally, disrupting aortic valve commissure support; (4) widened mediastinum on CXR — blood expanding the aortic wall or hemopericardium. Troponin is negative, ruling out MI. Elevated D-dimer reflects intravascular clot formation in the false lumen.
Incorrect Answer Breakdown:
A: Right coronary artery involvement could occur if the dissection extends into the right sinus of Valsalva (causing inferior MI), but the negative troponin and absence of ST changes make this a consequence, not the primary structure involved.
C: Pulmonary trunk pathology (e.g., pulmonary embolism) would cause hypoxia, pleuritic chest pain, and a positive D-dimer, but would NOT cause interscapular pain, BP differential between arms, or an aortic regurgitation murmur.
D: The fibrous pericardium and diaphragm are not directly involved in aortic dissection pathophysiology, although hemopericardium (tamponade) is a lethal complication if the dissection ruptures into the pericardial space.
E: The ligamentum arteriosum at the aortic isthmus is the classic site of traumatic aortic injury (sudden deceleration), not hypertension-related dissection. This patient''s chronic hypertension and medial degeneration, not trauma, are the etiology.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '588a5eec-a507-4dfa-adc5-e21531bcdc1e',
    'nbme-shelf-anatomy-1st-year',
    'A 3-day-old male neonate is noted by the nursing staff to have a bluish discoloration of the lips and fingernails immediately after feeding. He was born at 39 weeks gestation via uncomplicated vaginal delivery. APGAR scores were 8 and 9 at 1 and 5 minutes respectively. His mother received routine prenatal care and all screening tests were negative. On examination, a harsh holosystolic murmur is auscultated at the left lower sternal border.
Physical Examination:
Vital Signs: Temp: 37.0°C, HR: 158/min, BP: 68/42 mmHg (right arm), RR: 52/min, SpO₂: 84% on room air.
General: Neonate appears comfortable at rest but becomes visibly cyanotic with feeding.
Cardiovascular: RV heave palpable. Harsh grade IV/VI holosystolic murmur at LLSB. Single S2.
Respiratory: Mild subcostal retractions. Clear to auscultation.
Chest X-ray: Boot-shaped heart ("coeur en sabot"), decreased pulmonary vascular markings.
Laboratory Results:
ABG (room air): pH 7.38, pO₂ 48 mmHg, pCO₂ 36 mmHg, HCO₃ 21 mEq/L
CBC: Within normal limits.
Echocardiogram: Pending.
Which of the following embryological events most directly accounts for the cardiac findings in this patient?',
    '["Failure of the aorticopulmonary septum to spiral during division of the truncus arteriosus.", "Incomplete fusion of the endocardial cushions resulting in a primum atrial septal defect.", "Anterior and superior displacement of the infundibular (outlet) septum during cardiac morphogenesis.", "Failure of the foramen secundum to develop in the septum primum.", "Abnormal neural crest cell migration resulting in truncus arteriosus persistens."]'::jsonb,
    2,
    'Reasoning: This neonate has Tetralogy of Fallot (ToF), the most common cyanotic congenital heart disease presenting beyond the neonatal period. The classic findings are cyanosis, a right ventricular outflow tract obstruction murmur, RV heave, boot-shaped heart (due to RV hypertrophy with an upturned apex), and decreased pulmonary vascularity. Per Langman''s Medical Embryology, all four components of ToF (pulmonary stenosis, VSD, overriding aorta, RVH) are embryologically explained by a single developmental event: anterosuperior displacement of the infundibular (conoventricular) septum. This displaced septum fails to align with the muscular septum, producing the VSD; it narrows the right ventricular outflow tract (pulmonary stenosis); and the overriding aorta results from the malalignment. RVH is a compensatory consequence of the obstruction.
Incorrect Answer Breakdown:
A: Failure of the aorticopulmonary septum to spiral produces Transposition of the Great Arteries (TGA). TGA presents with cyanosis but a normal-shaped heart on CXR ("egg on a string"), parallel great vessels, and no VSD murmur. The spiral nature of normal septation places the aorta posterior-left and pulmonary trunk anterior-right.
B: Incomplete endocardial cushion fusion causes an ostium primum ASD or complete AVSD (atrioventricular septal defect), commonly associated with Down syndrome. This presents with left-to-right shunting and pulmonary overcirculation, not cyanosis and decreased pulmonary markings.
D: Failure of foramen secundum development in the septum primum describes the sequence leading to an ostium primum ASD — again a left-to-right shunt defect, not a cyanotic lesion with right ventricular outflow obstruction.
E: Persistent truncus arteriosus (PTA) results from failed aorticopulmonary septum formation (absent, not malaligned). PTA presents with a single great vessel overriding both ventricles, a single semilunar valve, increased pulmonary blood flow (not decreased), and cardiomegaly — a different clinical picture entirely.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'cf96ba2e-d8f5-495d-8c9d-f1324bc6df0a',
    'nbme-shelf-anatomy-1st-year',
    'A 45-year-old female librarian presents to her ophthalmologist with a 3-week history of painless, progressive ptosis of her left eyelid and diplopia, worse when looking to the right. She also notes that her left pupil appears larger than her right when she checks in the mirror. She denies headache, nausea, or changes in vision beyond the diplopia. Past medical history is notable for hypertension, for which she takes amlodipine. She denies trauma.
Physical Examination:
Vital Signs: Temp: 36.9°C, HR: 76/min, BP: 146/90 mmHg, RR: 14/min, SpO₂: 98% on room air.
Ophthalmological Exam: Left eye ptosis with the eye deviated "down and out." Left pupil: 7 mm, non-reactive to light or accommodation. Right pupil: 3 mm, briskly reactive. No papilledema on fundoscopy.
Neurological: Intact motor and sensory exam of all extremities. No ataxia.
Laboratory Results:
CBC: WNL.
CMP: WNL.
HbA1c: 5.6% (Normal: <5.7%)
MRA of the brain: A 7-mm outpouching at the junction of the left internal carotid artery and posterior communicating artery.
Which of the following is the most accurate anatomical explanation for the pupillary findings in this patient?',
    '["The pupillodilator fibers of CN III are compressed first because they run in the outermost layer of the nerve and are susceptible to extrinsic compression.", "The pupilloconstrictor fibers of CN III travel in the superficial dorsomedial aspect of the nerve and are compressed first by an expanding extrinsic mass.", "Ischemia of the vasa nervorum of CN III selectively damages the centrally located pupilloconstrictor fibers while sparing the peripherally located motor fibers.", "Herniation of the uncus over the tentorium cerebelli directly damages the Edinger-Westphal nucleus in the midbrain.", "Compression of the abducens nerve (CN VI) at Dorello''s canal produces ipsilateral pupil dilation via internuclear connections."]'::jsonb,
    1,
    'Reasoning: This is a "surgical" CN III palsy caused by an expanding posterior communicating artery aneurysm — a neurosurgical emergency. The key distinguishing feature is the mydriatic (dilated, non-reactive) pupil. The Edinger-Westphal nucleus provides pupilloconstrictor (parasympathetic) fibers that travel in the superficial dorsomedial aspect (the outer layer) of CN III (Snell''s Clinical Neuroanatomy; Moore). These fibers receive their blood supply from the pial surface and are therefore most susceptible to extrinsic compression by an aneurysm or herniation. As the aneurysm expands, it first compresses these superficial parasympathetic fibers, resulting in loss of pupillary constriction (mydriasis) before the somatic motor fibers (which innervate the extraocular muscles) are fully compromised. This "pupil-involving" palsy mandates emergent neurovascular imaging.
Incorrect Answer Breakdown:
A: This answer has the fiber type correct (pupilloconstrictor = parasympathetic) but incorrectly names them "pupillodilator." Pupillodilator fibers are sympathetic (via the long ciliary nerve, CN V₁ pathway) and are NOT carried in CN III. This is a factual error.
C: Ischemic (diabetic) CN III palsy spares the pupil because the vasa nervorum supply the central motor fibers, which are the first to become ischemic. The superficial parasympathetic fibers, relying on pial surface vessels rather than vasa nervorum, are spared. This patient''s normal HbA1c makes diabetic palsy unlikely, and the finding of a PCoA aneurysm on MRA confirms the compressive etiology.
D: Uncal herniation is the other common cause of compressive CN III palsy, but it occurs in the context of mass effect (trauma, epidural hematoma, large intracerebral hemorrhage) and would present with ipsilateral pupil dilation, altered consciousness, and contralateral hemiparesis. The isolated findings here, with no altered consciousness and an identified aneurysm, point to the PCoA aneurysm as the cause. The mechanism is also wrong — herniation compresses CN III as it passes between the posterior cerebral artery and the superior cerebellar artery, not via direct nuclear damage.
E: CN VI (abducens) innervates the lateral rectus muscle and has no role in pupillary dilation. CN VI palsy produces medial deviation of the eye (esotropia) and inability to abduct. It has no direct or indirect connection to the Edinger-Westphal nucleus that would cause pupillary dilation.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '1c3b515a-f52e-4d35-819f-c03e20428205',
    'nbme-shelf-anatomy-1st-year',
    'A 58-year-old male postal worker presents to his cardiologist with a 4-month history of exertional chest pressure, dyspnea on exertion after climbing one flight of stairs, and bilateral ankle swelling. He has a history of hypertension and type 2 diabetes. He denies syncope, orthopnea, or palpitations. He was told by his dentist two years ago that he has a heart murmur.
Physical Examination:
Vital Signs: Temp: 37.0°C, HR: 82/min, BP: 108/64 mmHg, RR: 18/min, SpO₂: 95% on room air.
Cardiovascular: Displaced point of maximal impulse (PMI) at the 6th intercostal space, anterior axillary line. A harsh, crescendo-decrescendo systolic ejection murmur is heard best at the right upper sternal border, radiating to the bilateral carotids. S2 is soft and single. A fourth heart sound (S4) is present.
Pulmonary: Bibasilar crackles.
Extremities: 2+ pitting edema bilaterally to the mid-tibia.
Laboratory Results:
BNP: 820 pg/mL (Normal: <100)
Sodium: 133 mEq/L (Normal: 135–145)
Creatinine: 1.4 mg/dL (Normal: 0.7–1.3)
Troponin I: 0.03 ng/mL (Normal: <0.04)
ECG: Left ventricular hypertrophy pattern; no acute ST changes.
Echocardiogram: Aortic valve area of 0.7 cm² (Normal: 3.0–4.0 cm²); mean gradient of 52 mmHg; LV ejection fraction 35%.
Which of the following best describes the embryological origin of the valve most likely affected in this patient?',
    '["The aortic valve develops from the endocardial cushions of the atrioventricular canal.", "The aortic valve develops from the truncal ridges (cushions) of the truncus arteriosus, which are populated by neural crest cells.", "The aortic valve develops from the myocardial cells of the bulbus cordis as they undergo epithelial-to-mesenchymal transition.", "The aortic valve forms from the primary interventricular septum as it expands superiorly to fuse with the aorticopulmonary septum.", "The aortic valve develops from the septum secundum as it grows inferiorly to overlap the foramen ovale."]'::jsonb,
    1,
    'Reasoning: This patient has severe calcific aortic stenosis with low-flow, low-gradient physiology and reduced LVEF — a presentation of advanced outflow obstruction leading to biventricular failure. The question asks about the embryological origin of the aortic valve. Per Langman''s Medical Embryology, the semilunar valves (aortic and pulmonary) develop from the truncal ridges (cushions) of the truncus arteriosus. These ridges are critically populated by cardiac neural crest cells that migrate from the dorsal neural tube (rhombomeres 6–8) through the pharyngeal arches into the cardiac outflow tract. Neural crest cells undergo epithelial-to-mesenchymal transition and form the mesenchymal core of the truncal cushions, which then excavate to form the three cusps of each semilunar valve. This neural crest contribution is distinct from the AV valves.
Incorrect Answer Breakdown:
A: The endocardial cushions of the AV canal form the mitral and tricuspid valves, not the semilunar valves. Defects in AV cushion development result in AV septal defects and valvular dysplasia (e.g., Ebstein anomaly of the tricuspid valve in the context of complete AVSD is a separate mechanism). This is a critical embryological distinction tested frequently.
C: The bulbus cordis contributes to the trabeculated portion of the right ventricle and the outflow tracts (conus arteriosus), not to valve cusp formation. Myocardial-to-mesenchymal transformation is not the mechanism for semilunar valve development; neural crest-populated cushion remodeling is.
D: The primary interventricular septum forms the muscular interventricular septum. It grows superiorly and eventually fuses with the endocardial cushions and the aorticopulmonary septum to close the interventricular foramen. It plays no role in semilunar valve cusp formation.
E: The septum secundum is the atrial structure that grows inferiorly to overlap the foramen primum/secundum, forming the valve of the foramen ovale. It is entirely an atrial partitioning structure with no contribution to the semilunar valves.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'cb042577-b781-4fa9-8514-e52fbf94607b',
    'nbme-shelf-anatomy-1st-year',
    'A 29-year-old female yoga instructor presents to her OB/GYN with a 5-day history of severe right lower quadrant pain, nausea, and a single episode of vomiting. Her last menstrual period was 7 weeks ago. She has a history of pelvic inflammatory disease treated 3 years ago and uses no contraception. She denies vaginal discharge or fever at home. A urine pregnancy test performed at registration is positive.
Physical Examination:
Vital Signs: Temp: 37.6°C, HR: 112/min, BP: 98/62 mmHg, RR: 22/min, SpO₂: 98% on room air.
General: Patient appears uncomfortable and diaphoretic.
Abdomen: Right lower quadrant tenderness with voluntary guarding. No rebound tenderness. Bowel sounds are diminished.
Pelvic: Cervical motion tenderness. Right adnexal tenderness and a palpable mass. Uterus is small and non-tender.
Rectal: No masses.
Laboratory Results:
Serum β-hCG: 2,800 mIU/mL (Normal for 7 weeks: 7,650–229,000 mIU/mL)
Hemoglobin: 9.8 g/dL (Normal: 12.0–16.0)
Hematocrit: 29% (Normal: 36–48%)
WBC: 11,400/mm³ (Normal: 4,500–11,000)
Transvaginal Ultrasound: No intrauterine gestational sac identified; free fluid in the cul-de-sac (pouch of Douglas); a 3.2-cm right adnexal mass.
Which of the following statements most accurately describes the anatomical basis for the accumulation of free fluid in the location identified on ultrasound?',
    '["The rectouterine pouch (of Douglas) is the most inferior reflection of the peritoneum in the female pelvis, representing the lowest point in the peritoneal cavity in the supine position, making it the dependent site for fluid accumulation.", "The vesicouterine pouch is the most inferior peritoneal recess in the female pelvis and collects blood tracking down from the fallopian tube.", "The paravesical fossa is the primary dependent space in the pelvis due to its location lateral to the urinary bladder.", "The ischiorectal (ischioanal) fossa communicates freely with the peritoneal cavity, allowing blood to pool inferiorly.", "The presacral space is continuous with the retroperitoneum and collects fluid via lymphatic channels draining the adnexa."]'::jsonb,
    0,
    'Reasoning: This patient has a ruptured ectopic pregnancy — suggested by positive β-hCG, no intrauterine pregnancy, a right adnexal mass, hemodynamic instability (tachycardia, hypotension), falling hemoglobin, and free fluid on ultrasound. The free fluid on transvaginal ultrasound is in the rectouterine pouch (cul-de-sac of Douglas). Per Moore''s Clinically Oriented Anatomy and Netter''s Atlas, the rectouterine pouch is the peritoneal reflection between the posterior surface of the uterus/cervix and the anterior surface of the rectum. It is the most inferior part of the peritoneal cavity in females in both the standing and supine positions. Blood from a ruptured fallopian tube flows inferiorly along the paracolic gutters and pools in this dependent pouch. Identification of fluid here on transvaginal ultrasound is both the most sensitive and most easily accessible sign of hemoperitoneum in gynecological emergencies.
Incorrect Answer Breakdown:
B: The vesicouterine pouch is the peritoneal reflection between the anterior surface of the uterus and the posterior surface of the urinary bladder. It is more superior and anterior than the rectouterine pouch and is not the most dependent site. Fluid does accumulate here but only after the rectouterine pouch fills — it is not the first or most reliable site.
C: The paravesical fossa is a lateral extraperitoneal space adjacent to the bladder. It is not a peritoneal recess and does not freely communicate with the peritoneal cavity in a way that would collect intraperitoneal hemorrhage first.
D: The ischiorectal (ischioanal) fossa is an extraperitoneal space in the perineum below the levator ani, completely separated from the peritoneal cavity by the pelvic diaphragm. It has no communication with the peritoneum and would not fill with intraperitoneal blood.
E: The presacral space is a retroperitoneal fascial plane between the rectum and the sacrum. It does not communicate with the peritoneal cavity directly and does not collect intraperitoneal hemorrhage. Fluid from a ruptured ectopic would be intraperitoneal, not retroperitoneal.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'd4fb221e-4922-401b-8e12-616f946144dc',
    'nbme-shelf-anatomy-1st-year',
    'A 41-year-old male long-distance truck driver presents to his primary care physician with a 2-month history of progressive hoarseness, mild dysphagia, and a sensation of fullness in his throat. He has a 25-pack-year smoking history and drinks alcohol occasionally. He denies hemoptysis, weight loss, or dyspnea. He reports no recent upper respiratory infection.
Physical Examination:
Vital Signs: Temp: 37.1°C, HR: 78/min, BP: 130/82 mmHg, RR: 14/min, SpO₂: 98% on room air.
General: Well-nourished male in no distress.
Head & Neck: A 2.5-cm, firm, non-tender left neck mass at level IV (between the cricothyroid notch and the clavicle, anterior to the sternocleidomastoid). No tenderness. Trachea is midline.
Laryngoscopy: Left vocal cord is fixed in the paramedian position. Right vocal cord moves normally.
Laboratory Results:
CBC: WNL.
CMP: WNL.
TSH: 2.1 mIU/L (Normal: 0.4–4.0).
CT Neck/Chest with contrast: Left-sided mediastinal mass encasing the aortopulmonary window; enlarged lymph nodes at levels III, IV, and V on the left; no lung parenchymal lesions.
Which of the following best explains the mechanism of the vocal cord paralysis in this patient?',
    '["Direct tumor invasion of the left cricothyroid muscle, which is innervated by the external branch of the superior laryngeal nerve.", "Compression of the left recurrent laryngeal nerve at the level of the aortopulmonary window by the mediastinal mass.", "Invasion of the left vagus nerve at the jugular foramen by a skull base tumor.", "Compression of the left recurrent laryngeal nerve in the tracheoesophageal groove by a thyroid malignancy.", "Direct infiltration of the left arytenoid cartilage causing mechanical fixation of the vocal cord."]'::jsonb,
    1,
    'Reasoning: This patient has left vocal cord paralysis caused by compression of the left recurrent laryngeal nerve (RLN) at the aortopulmonary window — a presentation known as Ortner''s syndrome (cardiovocal syndrome), though here caused by a mediastinal malignancy rather than vascular dilation. The anatomical basis (Moore; Netter; High-Yield Gross Anatomy) is critical: the left RLN branches from the left vagus nerve (CN X) at the level of the aortic arch, hooks under the ligamentum arteriosum/aorticopulmonary window, and ascends in the tracheoesophageal groove to reach the larynx. This long intrathoracic course makes the left RLN uniquely vulnerable to mediastinal pathology (lymphoma, lung cancer, aortic aneurysm, pericardial effusion). The right RLN loops around the right subclavian artery in the neck and has a much shorter intrathoracic course, explaining why unilateral left vocal cord palsy from mediastinal disease is far more common than right-sided.
Incorrect Answer Breakdown:
A: The external branch of the superior laryngeal nerve (eSLN) innervates the cricothyroid muscle only, producing a weak, breathy voice with pitch difficulties but NOT vocal cord fixation or paralysis in the paramedian position. True vocal cord paralysis requires RLN injury.
C: A skull base tumor at the jugular foramen would injure CN IX, X, and XI together (jugular foramen syndrome/Vernet''s syndrome), producing vocal cord palsy along with dysphagia, loss of gag reflex, and ipsilateral trapezius/SCM weakness. There is no skull base finding on this patient''s CT.
D: Left RLN compression in the tracheoesophageal groove by a thyroid mass is a valid and testable cause of left vocal cord palsy, but the CT specifically identifies the mediastinal mass at the aortopulmonary window, and the TSH is normal with no thyroid mass described. The most anatomically accurate explanation given the imaging is mediastinal compression at the aortopulmonary window.
E: Mechanical fixation of the arytenoid by direct tumor infiltration would produce a fixed cord but usually occurs in the setting of direct laryngeal invasion by hypopharyngeal or laryngeal carcinoma. Laryngoscopy would show mucosal irregularity at the arytenoid. This patient''s CT shows a mediastinal mass, not a laryngeal primary.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'c9680d59-8c8a-4ea2-9203-2055fa25b976',
    'nbme-shelf-anatomy-1st-year',
    'A 23-year-old male college rugby player is brought to the emergency department by teammates after sustaining a direct blow to the right lateral knee during a tackle. He felt an immediate "pop" and could not continue playing. He has significant right knee swelling. He denies any prior knee injuries.
Physical Examination:
Vital Signs: Temp: 36.9°C, HR: 94/min, BP: 122/78 mmHg, RR: 16/min, SpO₂: 99%.
Musculoskeletal (Right Knee): 2+ effusion. Full passive range of motion limited by pain. Varus stress test: negative. Valgus stress test at 0° and 30°: grade II laxity with endpoint, significant medial joint line pain. Lachman test: grade II laxity with a soft endpoint, compared to the contralateral knee. Anterior drawer test: grade II positive. Posterior drawer test: negative. McMurray test: positive for medial joint line click with external rotation.
Neurovascular: Intact distal pulses, sensation, and motor function.
Laboratory Results:
No labs indicated.
X-ray (right knee AP, lateral, oblique): No fractures or bony avulsions. Joint space preserved.
MRI Right Knee: Pending.
Which of the following combinations of structures is most likely disrupted based on the examination findings?',
    '["Lateral collateral ligament, iliotibial band, and lateral meniscus.", "Posterior cruciate ligament, posterior oblique ligament, and medial meniscus.", "Anterior cruciate ligament, medial collateral ligament, and medial meniscus (O''Donoghue''s unhappy triad).", "Anterior cruciate ligament, lateral collateral ligament, and lateral meniscus.", "Posterior cruciate ligament, medial collateral ligament, and posterior capsule."]'::jsonb,
    2,
    'Reasoning: This is the classic "unhappy triad" (O''Donoghue triad), described in Moore''s Clinically Oriented Anatomy and Gray''s Anatomy for Students as the most common combined ligamentous injury from a valgus force to the knee (a direct blow to the lateral knee with the foot planted). The medial compartment opens under tension from a valgus force, injuring three structures: (1) the Medial Collateral Ligament (MCL) — positive valgus stress test at 0° and 30°; (2) the Anterior Cruciate Ligament (ACL) — positive Lachman test and anterior drawer test (soft endpoint = complete tear); and (3) the Medial Meniscus — positive McMurray with a medial click on external rotation. The medial meniscus is more vulnerable than the lateral because it is firmly attached to the deep MCL fibers (coronary ligament), making it unable to escape compressive and rotational forces. The lateral meniscus is more mobile and therefore less frequently injured.
Incorrect Answer Breakdown:
A: A lateral compartment injury (LCL, IT band, lateral meniscus) results from a varus stress (blow to the medial knee). The varus stress test would be positive and the valgus stress test negative. This patient''s mechanism (blow to the lateral knee = valgus force) and positive valgus stress test are inconsistent with this answer.
B: A PCL injury produces a positive posterior drawer test (posterior tibial sag). This patient''s posterior drawer is negative. The posterior oblique ligament injury would also not be the primary finding with a valgus mechanism.
D: Combined ACL/LCL/lateral meniscus injury can occur with hyperextension or varus-external rotation mechanisms. The positive valgus stress test specifically indicating MCL laxity, combined with medial McMurray, argues against lateral compartment involvement as the primary injury.
E: PCL with MCL and posterior capsule is a more severe multi-ligament injury typically seen with dashboard injuries (posterior tibial force with knee flexed) or hyperextension. Again, the negative posterior drawer test makes PCL involvement unlikely here.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '134f7f27-d1bd-47e2-9600-71ddbe58a708',
    'nbme-shelf-anatomy-1st-year',
    'A 31-year-old female kindergarten teacher, 28 weeks pregnant with her first child, is referred by her midwife for a fetal anatomical survey after a routine ultrasound revealed polyhydramnios. The patient denies symptoms. She has no significant personal or family medical history and takes only prenatal vitamins.
Physical Examination:
Vital Signs: Temp: 36.8°C, HR: 82/min, BP: 118/72 mmHg, RR: 14/min, SpO₂: 99%.
Obstetric Exam: Fundal height 33 cm (elevated for 28 weeks). Fetal heart tones regular at 144/min.
Laboratory Results:
Maternal serum AFP: 0.4 MoM (Normal: 0.5–2.5 MoM — low AFP; normal is 0.5–2.5)
Glucose challenge test (50g): 128 mg/dL (Normal: <130 mg/dL) — passed.
Maternal karyotype: 46,XX.
Fetal karyotype (amniocentesis): 47,XX,+21.
Targeted fetal ultrasound: Absent gastric bubble. A "double bubble" sign at the level of the duodenum. Echogenic bowel. No cardiac anomaly identified.
Which of the following best describes the embryological mechanism responsible for the specific gastrointestinal finding identified on ultrasound?',
    '["Failure of the midgut to complete its normal 270-degree counterclockwise rotation during return to the abdominal cavity in weeks 10\u201312, resulting in Ladd''s bands obstructing the duodenum.", "Failure of vacuolization and recanalization of the solid-phase duodenum (during weeks 8\u201310) resulting in duodenal atresia.", "Premature return of the midgut to the abdominal cavity before week 10, causing malrotation and internal herniation.", "Abnormal neural crest cell migration into the myenteric and submucosal plexuses of the hindgut, producing an aganglionic segment.", "Incomplete fusion of the pleuroperitoneal folds, allowing herniation of abdominal contents into the thoracic cavity and compressing the developing foregut."]'::jsonb,
    1,
    'Reasoning: The "double bubble" sign on ultrasound represents two air/fluid-filled chambers — the stomach and the proximal duodenum — separated by the pylorus, with no gas beyond the obstruction. This is pathognomonic for duodenal atresia or stenosis. Per Langman''s Medical Embryology, the duodenum (derived from the caudal foregut and cranial midgut) undergoes a solid phase between weeks 5–8 when proliferating epithelium temporarily occludes the lumen. Recanalization occurs by weeks 8–10 through vacuolization (formation and coalescence of vacuoles). Failure of this recanalization results in duodenal atresia. Duodenal atresia has a well-established association with Trisomy 21 (Down syndrome), seen in approximately 30% of cases — confirmed by the fetal karyotype here (47,XX,+21). Polyhydramnios results because the fetus is unable to swallow and absorb amniotic fluid normally past the obstruction.
Incorrect Answer Breakdown:
A: Ladd''s bands from malrotation can extrinsically compress the duodenum and cause obstruction, but malrotation does not produce a classic "double bubble" sign — it more often presents postnatally with bilious vomiting and a "corkscrew" appearance on upper GI series. Malrotation is not associated with Trisomy 21. The mechanism (failure of rotation) is entirely distinct from the intrinsic luminal obstruction of atresia.
C: The midgut normally herniates out of the abdominal cavity at week 6 and returns at weeks 10–12 after rotating 270 degrees counterclockwise. Premature return is not a recognized cause of duodenal obstruction and does not explain the double bubble sign.
D: Failure of neural crest cell migration into the bowel wall causes Hirschsprung''s disease (congenital aganglionic megacolon), which affects the hindgut (rectosigmoid most commonly). Hirschsprung''s presents postnatally with failure to pass meconium, abdominal distension, and a rectal biopsy showing absent ganglion cells — not a prenatal double bubble sign. While Hirschsprung''s has a weak association with Down syndrome, it does not cause the duodenal findings here.
E: Incomplete pleuroperitoneal fold fusion causes a Congenital Diaphragmatic Hernia (CDH), where abdominal organs herniate into the thorax, compressing the ipsilateral lung (pulmonary hypoplasia). CDH presents with respiratory distress and bowel sounds in the chest on the affected side, not with a double bubble sign. The diaphragm and foregut are separate structures, and diaphragmatic defects do not intrinsically cause duodenal atresia.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '599dfd17-c42a-4215-97e4-7e76759d9714',
    'nbme-shelf-anatomy-1st-year',
    'A 19-year-old male college wrestler presents to the student health clinic with a 10-day history of right shoulder pain and progressive weakness. During a match two weeks ago, his right arm was forcefully abducted and externally rotated while being tackled. He denies numbness in his fingers or hand. He notes he cannot initiate abduction of his right arm from his side.
Physical Examination:
Vital Signs: Temp: 36.9°C, HR: 68/min, BP: 116/74 mmHg, RR: 14/min, SpO₂: 99%.
Musculoskeletal: Right shoulder: visible flattening of the deltoid contour laterally. Abduction 0–15° is absent; abduction from 15–90° is possible with assistance. Lateral rotation is weak (2/5). Medial rotation and adduction are full strength (5/5). No tenderness over the acromioclavicular joint or bicipital groove.
Neurological: Decreased sensation over a "regimental badge" distribution on the lateral aspect of the right upper arm. Biceps and brachioradialis reflexes intact bilaterally.
Laboratory Results:
No labs indicated.
MRI Right Shoulder: No rotator cuff tear. No labral tear. No fracture. Mild edema surrounding the quadrilateral space.
Which of the following best describes the boundaries of the space through which the injured nerve travels, and the specific structures it passes alongside?',
    '["The quadrilateral space is bounded superiorly by the teres minor, inferiorly by the teres major, medially by the long head of the triceps, and laterally by the surgical neck of the humerus; it transmits the axillary nerve and the posterior circumflex humeral artery.", "The triangular space is bounded superiorly by the teres minor, inferiorly by the teres major, and laterally by the long head of the triceps; it transmits the axillary nerve and the anterior circumflex humeral artery.", "The quadrilateral space is bounded superiorly by the subscapularis, inferiorly by the teres major, medially by the long head of the biceps, and laterally by the coracobrachialis; it transmits the musculocutaneous nerve and brachial artery.", "The triangular interval is bounded superiorly by the teres major, medially by the long head of the triceps, and laterally by the shaft of the humerus; it transmits the axillary nerve and the circumflex scapular artery.", "The quadrilateral space is bounded superiorly by the teres major, inferiorly by the teres minor, medially by the surgical neck of the humerus, and laterally by the long head of the triceps; it transmits the radial nerve and the profunda brachii artery."]'::jsonb,
    0,
    'Reasoning: This is a classic quadrilateral space syndrome with axillary nerve injury. The mechanism — forced abduction and external rotation — is the classic mechanism for axillary nerve traction injury as it wraps around the surgical neck of the humerus. The axillary nerve (C5–C6, from the posterior cord of the brachial plexus) innervates the deltoid (abduction 15–90°, all three heads) and teres minor (lateral rotation), and provides the superior lateral cutaneous nerve of the arm — the "regimental badge" sensory territory over the lateral deltoid. Per Moore and Netter, the quadrilateral (quadrangular) space boundaries are: superior = teres minor (posteriorly) and subscapularis (anteriorly); inferior = teres major; medial = long head of triceps; lateral = surgical neck of humerus. The axillary nerve and posterior circumflex humeral artery pass through it. MRI edema in this space confirms compression/traction injury here.
Incorrect Answer Breakdown:
A: Correct as stated above.
B: The triangular space (medial triangular space) is bounded by teres minor (superiorly), teres major (inferiorly), and the long head of the triceps (laterally). It transmits the circumflex scapular artery (a branch of the subscapular artery), NOT the axillary nerve. Confusing these two spaces is a frequent USMLE trap.
C: These are entirely incorrect boundaries and contents. The musculocutaneous nerve passes through the coracobrachialis muscle belly directly, not through a fascial space. The long head of the biceps and coracobrachialis do not form boundaries of any named posterior axillary space.
D: This describes the triangular interval (lateral triangular space / lower triangular space), bounded by teres major (superiorly), long head of triceps (medially), and the shaft of the humerus (laterally). It transmits the radial nerve and the profunda brachii (deep brachial) artery — not the axillary nerve. This is another classic distractor.
E: The boundaries are inverted (teres major and minor are switched), and the contents are wrong. The radial nerve and profunda brachii pass through the triangular interval, not the quadrilateral space. The long head of triceps is the medial, not lateral, boundary.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '74a727a3-825e-40a4-868d-2570abcf3b2a',
    'nbme-shelf-anatomy-1st-year',
    'A 62-year-old male retired plumber presents to his urologist with a 3-week history of painless hematuria and a dull ache in his left flank. He has a 35-pack-year smoking history and a history of hypertension managed with lisinopril. He denies dysuria, frequency, or weight loss. A urine cytology performed by his GP was atypical.
Physical Examination:
Vital Signs: Temp: 37.0°C, HR: 80/min, BP: 152/92 mmHg, RR: 16/min, SpO₂: 98%.
Abdomen: Non-tender. A vague fullness is palpable in the left flank. No bruit over the renal arteries.
Genitourinary: No costovertebral angle tenderness on the right. Mild left CVA tenderness. Left-sided varicocele present, non-reducible in the supine position.
Laboratory Results:
Hemoglobin: 18.4 g/dL (Normal: 13.5–17.5) — polycythemia
Creatinine: 1.1 mg/dL (Normal: 0.7–1.3)
Calcium: 11.4 mg/dL (Normal: 8.5–10.2) — hypercalcemia
Urinalysis: 3+ blood, no casts, no bacteria.
CT Abdomen/Pelvis with contrast: 8.2-cm heterogeneous, enhancing left renal mass with central necrosis. Left renal vein thrombus extending into the inferior vena cava.
Which of the following best explains the anatomical basis for the non-reducible left-sided varicocele in this patient?',
    '["The left testicular vein drains directly into the left renal vein at a right angle, lacking competent valves; left renal vein obstruction by tumor thrombus raises venous pressure in the left testicular vein, causing varicocele formation.", "The left testicular vein drains directly into the inferior vena cava at an oblique angle, which is obstructed by the IVC thrombus.", "The right testicular vein drains into the left renal vein, and the IVC thrombus raises pressure retrogradely through the left renal vein into the right testicular circulation.", "The left testicular vein drains into the left common iliac vein; IVC obstruction raises iliac venous pressure and causes retrograde varicocele.", "The left testicular artery is compressed by the left renal vein, causing venous congestion by arteriovenous fistula formation."]'::jsonb,
    0,
    'Reasoning: This patient has a classic presentation of renal cell carcinoma (RCC) — painless hematuria, flank mass, polycythemia (ectopic EPO production), hypercalcemia (PTHrP secretion), and left renal vein/IVC thrombus. The non-reducible left varicocele is explained entirely by anatomy (Moore; Netter; High-Yield Gross Anatomy): the left testicular (gonadal) vein drains superiorly into the left renal vein (not the IVC) at a near-right angle, creating relatively high venous pressure even under normal conditions. The right testicular vein, by contrast, drains directly into the IVC at an oblique angle. When a left renal tumor invades and thromboses the left renal vein, venous outflow from the left testicular vein is obstructed, causing a sudden-onset, non-reducible (fails to decompress in the supine position) left varicocele. This is a key clinical sign suggesting underlying renal malignancy rather than idiopathic varicocele.
Incorrect Answer Breakdown:
B: The left testicular vein does NOT drain into the IVC — it drains into the left renal vein. This is a high-yield anatomical fact. Confusing left (→ renal vein) and right (→ IVC) testicular vein drainage is the most common error tested on this topic.
C: The right testicular vein drains into the IVC, not into the left renal vein. The anatomical drainage patterns are side-specific and asymmetric. There is no scenario in which the right testicular vein drains into the left renal vein under normal anatomy.
D: The left testicular vein does not drain into the left common iliac vein. It ascends from the inguinal canal retroperitoneally to drain into the left renal vein. Common iliac venous obstruction would produce left lower limb edema, not a varicocele.
E: The "nutcracker phenomenon" describes compression of the left renal vein between the aorta and the superior mesenteric artery, which can produce a left-sided varicocele by obstructing left renal vein outflow. However, the mechanism is purely venous pressure elevation — not arteriovenous fistula formation. Furthermore, this patient has a documented left renal vein thrombus from RCC invasion, which is a more direct and complete explanation.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '020f6999-7b30-4b04-9ea2-23caeced898e',
    'nbme-shelf-anatomy-1st-year',
    'A 55-year-old female executive is seen in the neurology clinic for progressive difficulty swallowing and dysarthria over 6 months. She reports that her voice has become nasal and she frequently chokes on liquids. She denies limb weakness, sensory changes, or visual disturbances. She has a history of well-controlled hypertension.
Physical Examination:
Vital Signs: Temp: 37.0°C, HR: 76/min, BP: 138/84 mmHg, RR: 14/min, SpO₂: 97%.
Cranial Nerves: CN II–VII intact bilaterally. CN IX/X: Uvula deviates to the right on phonation; gag reflex absent bilaterally; palate elevates asymmetrically (left side fails to elevate). CN XI: Sternocleidomastoid and trapezius strength 5/5 bilaterally. CN XII: Tongue midline at rest; no fasciculations; mild tongue weakness bilaterally.
Motor: 5/5 throughout all four extremities. Normal tone.
Sensory: Intact to all modalities.
Reflexes: 3+ bilateral biceps, triceps, brachioradialis, and patellar reflexes. Bilateral Babinski sign present.
Laboratory Results:
CBC: WNL. CMP: WNL. TSH: 1.8 mIU/L.
MRI Brain/Brainstem: No infarct, no mass, no demyelinating lesion.
EMG/Nerve Conduction Studies: Normal sensory and motor conduction velocities.
The pattern of uvular deviation to the right, absent gag reflex, and brisk hyperreflexia with Babinski signs without limb weakness most likely represents injury to which of the following anatomical structures?',
    '["Left nucleus ambiguus and right corticobulbar fibers producing a combined lower and upper motor neuron lesion of CN X.", "Bilateral corticobulbar tracts above the level of the brainstem nuclei, producing pseudobulbar palsy, combined with lower motor neuron degeneration of the nucleus ambiguus bilaterally.", "Right vagus nerve at the jugular foramen, producing ipsilateral soft palate paresis with contralateral hyperreflexia from a separate cortical lesion.", "Left hypoglossal nucleus and bilateral corticospinal tracts at the level of the pyramidal decussation.", "Bilateral superior laryngeal nerves compressing the pharyngeal constrictors from an external mass at the skull base."]'::jsonb,
    1,
    'Reasoning: This clinical picture is pathognomonic for ALS (Amyotrophic Lateral Sclerosis) with combined upper motor neuron (UMN) and lower motor neuron (LMN) involvement of the bulbar musculature. Per Snell''s Clinical Neuroanatomy and Moore: uvular deviation to the right means the left vagus nerve (CN X) / nucleus ambiguus is weak (lower motor neuron sign); the absent gag reflex and dysphonia confirm bilateral LMN bulbar involvement (bulbar palsy component). Simultaneously, the brisk hyperreflexia (3+), bilateral Babinski signs, and spastic tone in a patient without sensory deficits or imaging abnormalities are the UMN signs (pseudobulbar palsy component). The combination of bilateral corticobulbar (UMN) degeneration and bilateral nucleus ambiguus (LMN) degeneration, in the absence of a structural lesion, is the hallmark of ALS with bulbar onset. The normal EMG/NCS rules out peripheral neuropathy.
Incorrect Answer Breakdown:
A: A single left nucleus ambiguus lesion plus right corticobulbar injury could produce unilateral bulbar findings, but would not explain bilateral absent gag reflexes, bilateral Babinski signs, and diffuse hyperreflexia. A combination of single discrete lesions is less parsimonious than a systemic degenerative process.
C: A unilateral right vagus nerve lesion at the jugular foramen (e.g., glomus jugulare tumor) would cause ipsilateral palate droop (uvula deviates away from the lesion = uvula deviates LEFT if the RIGHT CN X is injured). The uvula here deviates RIGHT, indicating LEFT CN X dysfunction. Furthermore, a unilateral vagal lesion would not produce bilateral hyperreflexia and Babinski signs without a separate intracranial lesion, making this a two-lesion explanation where one suffices.
D: The left hypoglossal nucleus injury would produce left tongue weakness with deviation toward the left on protrusion. The tongue here is midline and without fasciculations, making an isolated hypoglossal nucleus lesion the primary pathology unlikely. The pyramidal decussation is in the medulla and bilateral tract lesions there would produce crossed motor deficits with sensory changes — not seen here.
E: The superior laryngeal nerve is a branch of CN X supplying the cricothyroid muscle and supraglottic laryngeal sensation. It does not innervate the pharyngeal constrictors (which receive pharyngeal plexus input from CN IX/X). External skull base compression sufficient to cause bilateral SLN palsy would produce palpable masses and structural findings on MRI, which are absent.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '1d988f4d-f217-431a-a99c-85846d71ee1f',
    'nbme-shelf-anatomy-1st-year',
    'A 38-year-old female yoga instructor presents to her gynecologist for her annual visit. She mentions that during her last pelvic exam three years ago, she was told she had a "retroverted uterus." She has no complaints. She is G2P2 with two uncomplicated vaginal deliveries. She is sexually active with one male partner and uses copper IUD contraception.
Subsequently, she returns to the emergency department 2 weeks later with acute onset severe pelvic pain, inability to void, and urge to defecate without result (tenesmus). Pelvic ultrasound shows a 6-cm left adnexal cystic mass with internal echoes and a fluid-filled posterior cul-de-sac.
Physical Examination:
Vital Signs: Temp: 37.3°C, HR: 104/min, BP: 108/70 mmHg, RR: 20/min, SpO₂: 98%.
Abdomen: Diffuse lower abdominal and pelvic tenderness. No peritoneal signs in the upper abdomen.
Pelvic: Extreme posterior fornix tenderness. A tense, bulging, exquisitely tender mass is palpable through the posterior vaginal fornix.
Which of the following accurately describes the peritoneal anatomy that makes the physical examination finding through the posterior fornix possible, and the anatomical basis of the urinary and rectal symptoms?',
    '["The posterior vaginal fornix is directly adjacent to the vesicouterine pouch; cystic fluid compresses the bladder trigone (inability to void) and sigmoid colon (tenesmus).", "The posterior vaginal fornix is separated from the rectouterine pouch (of Douglas) only by the posterior vaginal wall and peritoneum; a mass in this space compresses the bladder base anteriorly and the rectum posteriorly.", "The posterior fornix lies immediately below the uterosacral ligaments; torsion of these ligaments compresses the ureter (causing urinary retention) and the obturator nerve (causing rectal tenesmus).", "The posterior fornix communicates directly with the peritoneal cavity via a congenital patent processus vaginalis, allowing fluid to flow freely between the peritoneum and vaginal lumen.", "The posterior fornix is adjacent to the pararectal fossa; infected fluid from the left ovarian cyst has tracked along the broad ligament to compress the left uterine artery, causing uterine ischemia and referred rectal pain."]'::jsonb,
    1,
    'Reasoning: This patient has a hemorrhagic or torsed left ovarian cyst with secondary hemoperitoneum pooling in the rectouterine pouch (of Douglas). The critical anatomy (Moore; Netter; Gray''s Anatomy for Students): the rectouterine pouch is the most inferior part of the peritoneal cavity in women and lies directly posterior to the uterus and vaginal vault. The posterior vaginal fornix is separated from this peritoneal pouch by only the thin posterior vaginal wall and the parietal peritoneum. This is precisely why culdocentesis (needle aspiration through the posterior fornix) can access intraperitoneal fluid, and why a pelvic abscess or hematoma in the cul-de-sac produces a palpable, tender, bulging mass through the posterior fornix. The mass in the rectouterine pouch compresses the bladder base and urethra anteriorly (urinary retention/urgency) and the rectum posteriorly (tenesmus — sensation of incomplete evacuation).
Incorrect Answer Breakdown:
A: The vesicouterine pouch is anterior (between the uterus and bladder), not posterior. The posterior fornix is in anatomical contact with the POSTERIOR peritoneal recess (rectouterine pouch), not the anterior one. A mass in the vesicouterine pouch would be palpable through the anterior fornix, not the posterior fornix.
C: The uterosacral ligaments run from the posterior cervix to the sacrum, flanking the rectouterine pouch. They do not directly compress the ureter in this setting. The ureter runs lateral to the cervix (approximately 1–2 cm lateral at the level of the uterine artery — "water under the bridge" — and is not in the path of a posteriorly located cyst. Tenesmus is rectal in origin (rectal compression), not from obturator nerve irritation.
D: A patent processus vaginalis is an embryological remnant relevant to inguinal hernias and hydroceles of the canal of Nuck in females. It does not connect the peritoneal cavity to the vaginal lumen, and its persistence in adults is rare and not relevant to acute pelvic pain of this nature.
E: The broad ligament contains the uterine tubes, round ligaments, ovarian ligaments, uterine vessels, and ureters within its layers. While ovarian cysts arise within the broad ligament''s mesovarium, the physical exam finding of posterior fornix bulging is explained by cul-de-sac fluid, not broad ligament tracking. Uterine artery compression causing ischemia is not a recognized mechanism for this clinical presentation.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '44e83b66-b498-497a-b306-2e14f8da2c96',
    'nbme-shelf-anatomy-1st-year',
    'A 2-day-old male neonate in the NICU is noted to have respiratory distress since delivery. He was born at 37 weeks via cesarean section due to fetal distress. APGAR scores were 5 and 7 at 1 and 5 minutes. The mother had normal prenatal care; second-trimester ultrasound was reported as normal (though limited by fetal positioning). Initial resuscitation with bag-mask ventilation failed to improve oxygen saturation.
Physical Examination:
Vital Signs: HR: 168/min, RR: 68/min, BP: 52/32 mmHg, Temp: 36.6°C, SpO₂: 74% on 100% FiO₂.
General: Cyanotic, grunting, and using accessory muscles of respiration. Barrel-shaped chest. Scaphoid abdomen.
Chest Auscultation: Decreased breath sounds over the left hemithorax. Bowel sounds audible over the left chest. Heart sounds heard best on the right side of the chest.
Abdomen: Scaphoid (concave), soft.
Laboratory Results:
ABG: pH 7.18, pO₂ 38 mmHg, pCO₂ 62 mmHg, HCO₃ 18 mEq/L.
CXR: Loops of bowel in the left hemithorax; cardiac silhouette shifted to the right; absent left hemidiaphragm shadow.
Which of the following embryological events and the specific week of development most accurately explains the pathogenesis of this neonate''s condition?',
    '["Failure of closure of the pleuropericardial folds during week 5, allowing pericardial contents to herniate into the left pleural cavity.", "Failure of fusion of the pleuroperitoneal folds (Bochdalek defect) during weeks 6\u20138, before completion of midgut rotation, allowing abdominal viscera to occupy the left pleural space and impair ipsilateral lung development.", "Failure of the septum transversum to fuse with the esophageal mesentery during week 4, creating a central tendon defect through which the stomach herniates.", "Incomplete muscularization of the posterolateral diaphragm from the body wall mesoderm during weeks 12\u201316, occurring after the bowel has returned to the abdomen.", "Abnormal partitioning of the coelomic cavity by the pleuropericardial folds during week 7, creating a communication between the pericardial and peritoneal cavities."]'::jsonb,
    1,
    'Reasoning: This neonate has a left-sided Congenital Diaphragmatic Hernia (CDH) through the foramen of Bochdalek — the most common type (>85% of CDH), occurring posterolaterally on the left side. Per Langman''s Medical Embryology, the diaphragm has four embryological contributions: (1) septum transversum → central tendon; (2) pleuroperitoneal folds → posterolateral portions; (3) esophageal mesentery → crura; (4) body wall mesoderm → peripheral muscular portion. The pleuroperitoneal folds close between weeks 6–8. If closure is delayed, the midgut — which herniates into the umbilical cord at week 6 and returns at weeks 10–12 — finds the pleural cavity open and occupies it instead of the abdomen. The herniated viscera compress the developing ipsilateral lung, causing pulmonary hypoplasia (the primary cause of mortality). The scaphoid abdomen, dextrocardia (mediastinal shift), and bowel sounds in the left chest are the classic clinical triad.
Incorrect Answer Breakdown:
A: The pleuropericardial folds separate the pericardial cavity from the pleural cavities (not the peritoneal cavity). Their failure would create a pleuropericardial communication — a pericardial defect — not a diaphragmatic hernia with bowel in the chest. This is a fundamentally different structure from the pleuroperitoneal folds.
C: The septum transversum forms the central tendon of the diaphragm and the ventral mesentery of the foregut. Its failure to fuse with the esophageal mesentery would produce a central diaphragmatic hernia (rare) through which the esophagus/stomach protrudes — not the posterolateral Bochdalek hernia filled with midgut loops. Furthermore, this mechanism does not produce pulmonary hypoplasia.
D: Muscularization from body wall mesoderm completes after the pleuroperitoneal fold fusion. If the fold fuses on time, bowel has already returned to the abdomen (weeks 10–12) and the pleural space is closed before muscularization completes. A muscularization failure occurring after week 12 would produce an eventration of the diaphragm (thin, elevated hemidiaphragm) — not an open pleuroperitoneal connection. Timing is the critical distinction Langman''s tests.
E: The pleuropericardial folds are atrial-level structures separating the pericardial and pleural cavities. Their abnormal partitioning describes pericardial defects, not diaphragmatic hernias. CDH is a pleuroperitoneal (not pleuropericardial) fold failure.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'e10452de-6bf9-4c6f-a411-fb49ac901269',
    'nbme-shelf-anatomy-1st-year',
    'A 47-year-old female school teacher presents to her internist with a 4-month history of progressive fatigue, dysphagia to solids and occasionally liquids, and a 10-pound weight loss. She also reports difficulty raising her right arm above her head over the past 6 weeks and has noticed that her right eyelid droops slightly, most noticeable in the evening. She has a 30-pack-year smoking history.
Physical Examination:
Vital Signs: Temp: 36.9°C, HR: 82/min, BP: Right arm 104/68 mmHg, Left arm 122/78 mmHg, RR: 16/min, SpO₂: 96%.
Head & Neck: Right-sided partial ptosis, miosis (right pupil 2 mm, left pupil 4 mm), and enophthalmos. No anhidrosis appreciated.
Neurological: Right deltoid and supraspinatus 3/5 weakness. Right biceps reflex diminished (1+). Right C5–T1 dermatomal paresthesias. Sensation intact to pinprick in bilateral lower extremities.
Cardiovascular: Diminished right radial pulse. No right carotid bruit.
CXR: Apical right lung mass with rib destruction.
Laboratory Results:
CBC: WNL. LFTs: WNL.
Calcium: 10.0 mg/dL (Normal: 8.5–10.2).
CT Chest with contrast: 5.8-cm right apical lung mass with invasion of the right first and second ribs, right subclavian artery encasement, and involvement of the right brachial plexus (C8–T1).
Which of the following best describes the anatomical pathway of the sympathetic fibers whose disruption accounts for the ocular findings in this patient?',
    '["First-order neuron from the hypothalamus descends ipsilaterally in the lateral tegmentum of the brainstem and lateral funiculus of the spinal cord to synapse in the ciliospinal center of Budge (C8\u2013T2); second-order neuron exits the spinal cord, crosses the midline at T1, and ascends over the lung apex; third-order neuron travels with the ophthalmic division of CN V to the orbit.", "First-order neuron from the hypothalamus descends ipsilaterally to synapse in the ciliospinal center of Budge (C8\u2013T2); second-order (preganglionic) neuron exits via the ventral ramus, passes over the lung apex and subclavian artery, and synapses in the superior cervical ganglion; third-order (postganglionic) neuron travels with the internal carotid artery plexus and ophthalmic division of CN V to reach the dilator pupillae, superior tarsal muscle, and lower lid retractor.", "First-order neuron from the Edinger-Westphal nucleus descends to C8\u2013T2; second-order neuron travels with the phrenic nerve over the lung apex; third-order neuron joins the facial nerve (CN VII) to reach the orbicularis oculi.", "First-order neuron from the hypothalamus synapses bilaterally in the Edinger-Westphal nucleus; second-order neuron travels with CN III; third-order neuron synapses in the ciliary ganglion supplying the dilator pupillae.", "The sympathetic fibers originate in the dorsal motor nucleus of the vagus, descend to the T1 ventral horn, exit via the dorsal ramus, and pass posterior to the lung apex to synapse in the middle cervical ganglion."]'::jsonb,
    1,
    'Reasoning: This patient has a Pancoast (superior sulcus) tumor — an apical lung malignancy that classically invades the brachial plexus (C8–T1: hand/wrist intrinsic muscle weakness, C5–C6: deltoid/biceps weakness from superior spread), subclavian vessels (diminished right radial pulse, BP differential), and the sympathetic chain, producing Horner''s syndrome (ptosis, miosis, enophthalmos). Per Snell''s Clinical Neuroanatomy and Moore, the three-neuron sympathetic pathway to the eye is: (1) First-order (central) neuron: hypothalamus → descends ipsilaterally through the lateral tegmentum of brainstem → lateral funiculus of the cervicothoracic spinal cord → synapses in the ciliospinal center of Budge (C8–T2); (2) Second-order (preganglionic) neuron: exits via the T1 ventral root → white rami communicantes → passes over the lung apex and loops around the subclavian artery → ascends to synapse in the superior cervical ganglion; (3) Third-order (postganglionic) neuron: travels along the internal carotid artery → through the cavernous sinus → joins CN V₁ (nasociliary branch) → reaches the orbit to innervate dilator pupillae (miosis when damaged), superior tarsal muscle of Müller (ptosis when damaged), and inferior tarsal muscle (enophthalmos when damaged). The Pancoast tumor interrupts the second-order neuron as it arches over the lung apex.
Incorrect Answer Breakdown:
A: This answer incorrectly states the second-order neuron "crosses the midline at T1." The entire sympathetic pathway to the eye is ipsilateral — there is no midline crossing anywhere in the three-neuron arc. This is a classic distractor and a frequently tested fact.
C: The Edinger-Westphal nucleus is the parasympathetic nucleus of CN III, responsible for pupilloconstriction — the opposite of sympathetic function. It has no role in Horner''s syndrome. The phrenic nerve (C3–C5) innervates the diaphragm and has no role in transmitting sympathetic fibers to the orbit. The facial nerve innervates the orbicularis oculi (eye closure via parasympathetics to the lacrimal gland), not the tarsal muscles.
D: This answer again incorrectly invokes the Edinger-Westphal nucleus (parasympathetic) and CN III for a sympathetic pathway. Furthermore, the dilator pupillae is a sympathetically innervated muscle — it is never innervated via the ciliary ganglion (which is a parasympathetic ganglion supplying the sphincter pupillae and ciliary muscle). This answer confuses parasympathetic and sympathetic eye anatomy.
E: The dorsal motor nucleus of the vagus is the parasympathetic preganglionic nucleus for thoracic and abdominal viscera — it has no role in pupillary or palpebral sympathetic innervation. The sympathetic pathway exits via the ventral (not dorsal) ramus. The middle cervical ganglion (at C6) is not the synapse point for the ocular sympathetic pathway — that is the superior cervical ganglion.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '0041d7a5-4b54-4a90-a7e6-18503aa0ee32',
    'nbme-shelf-anatomy-1st-year',
    'A 44-year-old male construction contractor presents to the emergency department complaining of sudden onset of severe low back pain that began while lifting a heavy beam 6 hours ago. He reports the pain radiates from his right buttock down the posterior thigh and lateral leg to the dorsum of his right foot. He has difficulty walking on his heels and notes numbness over the dorsum of his right foot.
Physical Examination:
Vital Signs: Temp: 37.0°C, HR: 88/min, BP: 134/84 mmHg, RR: 16/min, SpO₂: 99%.
Musculoskeletal: Lumbar paraspinal muscle spasm. Limited lumbar flexion due to pain.
Neurological: Right ankle dorsiflexion 2/5. Right extensor hallucis longus 1/5. Right peroneal eversion 3/5. Right plantar flexion 5/5. Sensation decreased over the right dorsal foot and first web space. Right patellar reflex 2+ (intact). Right Achilles reflex 2+ (intact). Straight leg raise: positive at 40° on the right, reproducing right leg pain.
Laboratory Results:
CBC: WNL. CMP: WNL.
MRI Lumbar Spine: Right paracentral disc herniation at L4–L5 with compression of the traversing right L5 nerve root.
Which of the following correctly describes the full myotomal and dermatomal territory of the compressed nerve root, and why the specific reflexes tested are preserved in this patient?',
    '["L5 innervates the tibialis anterior (dorsiflexion), extensor hallucis longus, and fibularis (peroneus) longus and brevis (eversion). Its dermatomal territory covers the lateral leg, dorsum of the foot, and first web space. No standard deep tendon reflex is reliably mediated by L5; the patellar reflex tests L2\u2013L4 and the Achilles tests S1\u2013S2 \u2014 hence both reflexes are preserved.", "L5 innervates the gastrocnemius and soleus (plantar flexion) and flexor hallucis longus. Its dermatomal territory covers the sole of the foot and the lateral ankle. The absent Achilles reflex is the hallmark of L5 radiculopathy.", "L5 innervates the tibialis anterior (dorsiflexion) and has a dermatomal territory covering the medial leg and medial foot. The patellar reflex (L4) is impaired because L4 and L5 share the same reflex arc.", "L5 innervates the hip abductors (gluteus medius and minimus) exclusively; dorsiflexion weakness is caused by simultaneous L4 root compression. The medial hamstring reflex tests L5 and would be absent.", "L5 innervates the quadriceps femoris and the tibialis posterior; dorsiflexion weakness reflects anterior compartment ischemia. The Achilles reflex is absent because S1 and L5 share a common reflex arc."]'::jsonb,
    0,
    'Reasoning: Per Moore''s Clinically Oriented Anatomy, Snell''s Clinical Neuroanatomy, and High-Yield Gross Anatomy, the L5 nerve root myotome includes: tibialis anterior (primary dorsiflexor), extensor hallucis longus (great toe extension), extensor digitorum longus and brevis, fibularis (peroneus) longus and brevis (eversion), gluteus medius and minimus (hip abduction), and semi-membranosus/semi-tendinosus (medial hamstrings). Its dermatome covers the lateral leg, dorsal foot, and first web space (the classic L5 territory, distinct from S1 which covers the lateral foot and sole). The critical examination point: there is NO reliably testable standard deep tendon reflex for L5. The patellar reflex is L2–L4 (femoral nerve; primarily L4), and the Achilles reflex is S1–S2 (tibial nerve). L5 is the "reflex-absent" radiculopathy — making it harder to detect clinically without imaging, since both standard reflexes remain intact even with complete L5 root compression.
Incorrect Answer Breakdown:
B: Gastrocnemius and soleus (plantar flexion) and the Achilles reflex are S1–S2 functions, not L5. The Achilles reflex is the hallmark of S1 radiculopathy (most commonly from L5–S1 disc herniation). The dermatomal territory described (sole of foot, lateral ankle) is S1, not L5. This entire answer describes S1 radiculopathy.
C: The medial leg and medial foot dermatomal territory belongs to the saphenous nerve (L3–L4 distribution), not L5. L4 and L5 do not share a common reflex arc — each segmental level has anatomically distinct reflex pathways. The patellar reflex (L2–L4) tests primarily L4 and would be diminished in L4 radiculopathy, but L5 root compression does not affect the L4 reflex arc.
D: While L5 does contribute to hip abduction via gluteus medius/minimus, the primary myotomal deficit is dorsiflexion — this cannot be attributed "exclusively" to a separate simultaneous L4 compression without imaging evidence. The medial hamstring reflex is an inconsistently elicited reflex that does test L5 but is not a standard clinical examination reflex. This answer is partially correct but misleading in attributing dorsiflexion weakness solely to L4.
E: The quadriceps (knee extension) is innervated by L2–L4 via the femoral nerve, not L5. Tibialis posterior is primarily L4–L5 (tibial nerve) but plantar flexes/inverts the foot. S1 and L5 do NOT share a reflex arc — they are entirely separate segmental levels with distinct motor and sensory territories. Attributing dorsiflexion weakness to anterior compartment ischemia is factually incorrect.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'c047b2e1-1573-4b61-b97c-8f293d8af3cb',
    'nbme-shelf-anatomy-1st-year',
    'A 26-year-old male first-year medical student is brought to the emergency department by his roommate after sudden onset of the "worst headache of his life" that began while studying approximately 90 minutes ago. He vomited twice. He has no significant past medical history and takes no medications. He denies trauma.
Physical Examination:
Vital Signs: Temp: 37.4°C, HR: 98/min, BP: 168/102 mmHg, RR: 18/min, SpO₂: 99%.
General: Distressed young male, photophobic, holding his head.
Neurological: Alert and oriented ×4. Cranial nerves II–XII grossly intact. No focal motor or sensory deficits. Kernig''s sign positive. Brudzinski''s sign positive. No papilledema on fundoscopy.
CT Head (non-contrast): No intracranial hemorrhage identified (sensitivity ~98% within 6 hours). No midline shift.
Lumbar Puncture: Opening pressure 280 mmHg (Normal: 70–180). CSF: uniformly bloody in all four tubes; xanthochromia present on spectrophotometry.
The lumbar puncture was performed at the L4–L5 interspace. Which of the following accurately describes all relevant structures penetrated by the needle, in order from superficial to deep, and the embryological origin of the innermost layer entered?',
    '["Skin \u2192 subcutaneous fat \u2192 supraspinous ligament \u2192 interspinous ligament \u2192 ligamentum flavum \u2192 epidural space \u2192 dura mater \u2192 subdural space \u2192 arachnoid mater \u2192 subarachnoid space. The pia mater (not entered) and arachnoid mater are derived from neural crest cells.", "Skin \u2192 subcutaneous fat \u2192 supraspinous ligament \u2192 interspinous ligament \u2192 ligamentum flavum \u2192 dura mater \u2192 subdural space \u2192 arachnoid mater \u2192 subarachnoid space. The arachnoid and pia are derived from mesoderm.", "Skin \u2192 subcutaneous fat \u2192 posterior longitudinal ligament \u2192 interspinous ligament \u2192 ligamentum flavum \u2192 epidural space \u2192 dura mater \u2192 arachnoid mater \u2192 subarachnoid space. The dura mater is derived from neural crest cells.", "Skin \u2192 subcutaneous fat \u2192 supraspinous ligament \u2192 interspinous ligament \u2192 ligamentum flavum \u2192 epidural space \u2192 dura mater \u2192 epidural space \u2192 arachnoid mater \u2192 subarachnoid space (CSF obtained here). The arachnoid and pia mater (leptomeninges) are derived from neural crest cells.", "Skin \u2192 subcutaneous fat \u2192 supraspinous ligament \u2192 ligamentum flavum \u2192 epidural fat \u2192 dura mater \u2192 subarachnoid space \u2192 pia mater. The dura is of mesodermal origin; the leptomeninges are of ectodermal (surface ectoderm) origin."]'::jsonb,
    3,
    'Reasoning: This patient has a subarachnoid hemorrhage (SAH) — "thunderclap" headache, bloody CSF uniform across all tubes (distinguishing it from a traumatic tap where blood clears), and xanthochromia (yellow pigmentation from bilirubin from lysed red cells, seen >2 hours post-bleed). The LP needle traverses (per Moore; Gray''s Anatomy for Students): skin → subcutaneous fat → supraspinous ligament → interspinous ligament → ligamentum flavum → epidural space (containing fat and epidural venous plexus) → dura mater → arachnoid mater → subarachnoid space (where CSF is collected). Note: the subdural space is a potential space, not a true traversable layer during LP. The interspinous ligament is absent in the cervical region but present at L4–L5. Per Langman''s Medical Embryology, the leptomeninges (arachnoid mater + pia mater) are derived from neural crest cells that migrate into the head region. The dura mater has a dual origin — cranially from neural crest, spinally from mesoderm.
Incorrect Answer Breakdown:
B: This answer omits the epidural space, which is a real anatomical space traversed by the needle (it contains fat and the internal vertebral venous plexus). The epidural space must be listed between the ligamentum flavum and the dura mater. Additionally, stating arachnoid and pia are mesodermal is incorrect — they are neural crest derivatives (leptomeninges).
C: The posterior longitudinal ligament runs on the posterior surface of the vertebral bodies inside the spinal canal (anterior to the dural sac). A midline LP needle does not penetrate it — it stays in the posterior midline, passing through the supraspinous and interspinous ligaments and ligamentum flavum. Stating the dura is from neural crest is partially correct intracranially, but the spinal dura is mesodermal — this is a distinction Langman''s tests specifically.
D: Correct, as explained above. The epidural space appears once, between the ligamentum flavum and the dura mater.
E: This answer omits the interspinous ligament (present at L4–L5) and also incorrectly names the leptomeninges as "surface ectoderm" derivatives. Surface ectoderm gives rise to skin, hair, nails, and lens — not meninges. The leptomeninges are neural crest (neuroectoderm), not surface ectoderm.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '73ebad74-7f9a-42b7-b71f-3d952cba0224',
    'nbme-shelf-anatomy-1st-year',
    'A 4-week-old male infant is brought to the pediatrician by his parents due to non-bilious, projectile vomiting after every feeding for the past 10 days. He is first-born, and his parents report he appears hungry immediately after vomiting. He has had progressively fewer wet diapers and his fontanelle appears slightly sunken.
Physical Examination:
Vital Signs: Temp: 37.0°C, HR: 162/min, BP: 70/42 mmHg, RR: 40/min, SpO₂: 98%.
General: Fussy but consolable; visibly dehydrated.
Abdomen: A firm, 1.5-cm, mobile, non-tender, olive-shaped mass is palpable in the right upper quadrant (epigastrium) after feeding. Visible peristaltic waves passing from left to right across the upper abdomen.
No jaundice. No organomegaly.
Laboratory Results:
Sodium: 131 mEq/L (Normal: 135–145)
Potassium: 3.1 mEq/L (Normal: 3.5–5.0)
Chloride: 88 mEq/L (Normal: 98–108)
Bicarbonate: 31 mEq/L (Normal: 22–29)
BUN: 22 mg/dL (Normal: 5–18)
pH (venous): 7.52 (Normal: 7.35–7.45)
Ultrasound abdomen: Pyloric muscle thickness 5 mm (Normal: <3 mm); pyloric channel length 20 mm (Normal: <16 mm).
Which of the following correctly identifies the embryological origin of the affected structure, its normal adult anatomical position relative to the transpyloric plane, and the mechanism of the electrolyte abnormality?',
    '["The pylorus develops from the endodermal lining of the foregut with a mesodermal muscular wall; it lies at the transpyloric plane (L1) along with the duodenojejunal junction; hypertrophy obstructs gastric outflow, causing loss of HCl and resulting in hypochloremic, hypokalemic metabolic alkalosis.", "The pylorus develops entirely from neural crest cells that migrate into the foregut wall; it lies below the transpyloric plane at L2; obstruction causes loss of bicarbonate-rich pancreatic secretions, producing metabolic acidosis.", "The pylorus develops from splanchnic mesoderm only; it lies at the subhepatic angle below the right costal margin; the metabolic alkalosis results from compensatory renal bicarbonate retention to correct the alkalosis.", "The pylorus develops from the endodermal lining and splanchnic mesodermal wall of the caudal foregut; it normally lies at the transpyloric plane (L1), to the right of the midline; projectile vomiting expels gastric acid (HCl), leading to hypochloremic, hypokalemic metabolic alkalosis through direct acid loss and secondary renal potassium wasting.", "The pylorus develops from the midgut endoderm caudal to the Meckel''s diverticulum remnant; it lies at the level of L3; vomiting expels bile-stained secretions, producing hyperchloremic metabolic acidosis."]'::jsonb,
    3,
    'Reasoning: This is classic hypertrophic pyloric stenosis (HPS) — the most common cause of surgical obstruction in infants, presenting at 3–6 weeks of age with non-bilious (pre-ampullary) projectile vomiting, a palpable "olive," visible left-to-right peristaltic waves, and hypochloremic, hypokalemic metabolic alkalosis. Per Langman''s Medical Embryology, the stomach and pylorus develop from the caudal foregut endoderm (luminal epithelium) with a surrounding splanchnic mesodermal wall (smooth muscle layers). The pylorus lies at the transpyloric plane (L1), at the level of the 9th costal cartilages, to the right of the midline — a key anatomical landmark (Moore; Netter). The metabolic derangement: repeated vomiting → loss of H⁺ and Cl⁻ from gastric HCl → metabolic alkalosis and hypochloremia. The kidneys attempt to maintain volume by retaining Na⁺ and excreting K⁺ and H⁺ (paradoxical aciduria), worsening hypokalemia. This "hypochloremic, hypokalemic, metabolic alkalosis" is the pathognomonic biochemical signature of HPS.
Incorrect Answer Breakdown:
A: This answer is partially correct (foregut endoderm with mesodermal wall, transpyloric plane location, and correct alkalosis mechanism) but states the duodenojejunal junction lies at the transpyloric plane alongside the pylorus. The DJ junction (ligament of Treitz) actually lies at the L2 level, slightly below and to the left — the transpyloric plane (L1) landmarks include the pylorus, the neck of the pancreas, the hilum of the kidneys, the origin of the superior mesenteric artery, and the duodenum at the L1 level. This anatomical inaccuracy makes D the better, more precise answer.
B: Neural crest cells contribute to the enteric nervous system (Auerbach''s and Meissner''s plexuses) within the gut wall but do NOT form the structural smooth muscle of the pylorus. An entirely neural crest-derived pylorus is factually incorrect. Furthermore, pyloric stenosis blocks gastric (acid) outflow, not pancreatic (alkaline) outflow — obstruction of pancreatic secretions would require a more distal obstruction and would produce metabolic acidosis, not alkalosis.
C: Splanchnic mesoderm gives rise to the smooth muscle and connective tissue layers of the gut, but the luminal epithelium is endodermal. Saying the pylorus is "mesodermal only" omits the endodermal contribution. The anatomical location described (subhepatic angle, right costal margin) is the position of the gallbladder fundus, not the pylorus.
E: The pylorus is a foregut derivative, not midgut. The midgut extends from just below the ampulla of Vater to the mid-transverse colon. Meckel''s diverticulum is a remnant of the vitelline (omphalomesenteric) duct in the distal ileum — an entirely different structure. Non-bilious vomiting confirms the obstruction is proximal to the ampulla (pre-bile duct entry), consistent with a pyloric (foregut) obstruction, not a midgut lesion.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '18637082-a577-4ef9-954e-4fdb680c0979',
    'nbme-shelf-anatomy-1st-year',
    'A 68-year-old male retired electrician with a history of atrial fibrillation (on warfarin, last INR 1.6 — subtherapeutic) presents to the emergency department with sudden onset right-sided facial droop, slurred speech, and difficulty swallowing that began 2 hours ago. His wife reports he also suddenly complained of dizziness and "the room spinning." He denies headache or loss of consciousness.
Physical Examination:
Vital Signs: Temp: 37.1°C, HR: 88/min (irregularly irregular), BP: 164/96 mmHg, RR: 16/min, SpO₂: 96%.
Cranial Nerves: Right-sided facial pain and temperature loss (CN V territory). Right-sided palate droop and absent gag reflex (CN IX/X). Right vocal cord paresis (hoarse voice). Right CN XI weakness (trapezius/SCM).
Motor: Left-sided arm and leg weakness (4/5).
Sensory: Left-sided decreased pain and temperature sensation in the arm and leg.
Cerebellar: Right-sided finger-nose ataxia. Right-sided dysdiadochokinesia.
Pupils: Right-sided ptosis, miosis, and enophthalmos (Horner''s syndrome).
Which of the following arterial territories, and the specific brainstem tract or nucleus most accurately accounts for each individual finding in this patient?',
    '["Left anterior inferior cerebellar artery (AICA) occlusion: ipsilateral CN V loss = spinal trigeminal nucleus; ipsilateral CN IX/X/XI = nucleus ambiguus; ipsilateral Horner = descending sympathetic fibers; contralateral hemibody pain/temp loss = lateral spinothalamic tract; ipsilateral cerebellar signs = inferior cerebellar peduncle.", "Right posterior inferior cerebellar artery (PICA) occlusion (Wallenberg syndrome): ipsilateral CN V loss = spinal trigeminal nucleus and tract; ipsilateral CN IX/X/XI = nucleus ambiguus; ipsilateral Horner = descending hypothalamospinal sympathetic fibers; contralateral hemibody pain/temp loss = lateral spinothalamic tract; ipsilateral cerebellar signs = inferior cerebellar peduncle/restiform body.", "Right superior cerebellar artery (SCA) occlusion: ipsilateral CN V loss = chief sensory nucleus; ipsilateral CN IX/X/XI = dorsal motor nucleus of vagus; contralateral hemibody loss = medial lemniscus; ipsilateral cerebellar signs = superior cerebellar peduncle.", "Left posterior inferior cerebellar artery (PICA) occlusion: ipsilateral CN V loss = mesencephalic trigeminal nucleus; contralateral CN IX/X = nucleus ambiguus crossing in the medulla; contralateral Horner = descending sympathetic fibers decussating at C3; ipsilateral limb weakness = lateral corticospinal tract.", "Basilar artery occlusion: bilateral CN V loss = bilateral spinal trigeminal nuclei; bilateral CN IX/X/XI = bilateral nucleus ambiguus; bilateral Horner = bilateral descending sympathetic fibers; bilateral hemibody loss = bilateral lateral spinothalamic tracts; bilateral cerebellar signs = bilateral inferior cerebellar peduncles."]'::jsonb,
    1,
    'Reasoning: This is a textbook presentation of Wallenberg syndrome (lateral medullary syndrome), caused by occlusion of the right posterior inferior cerebellar artery (PICA) or right vertebral artery, infarting the lateral medulla. Per Snell''s Clinical Neuroanatomy and Moore, each finding maps to a specific structure in the lateral medulla: (1) Ipsilateral face pain/temp loss → spinal trigeminal nucleus and tract (CN V); (2) Ipsilateral dysphagia, absent gag, hoarseness, palatal droop → nucleus ambiguus (CN IX, X, XI); (3) Ipsilateral Horner''s syndrome (ptosis, miosis, enophthalmos) → descending hypothalamospinal sympathetic fibers passing through the lateral tegmentum of the medulla; (4) Contralateral body pain/temperature loss → lateral spinothalamic tract (already crossed from the contralateral side); (5) Ipsilateral cerebellar signs (ataxia, dysdiadochokinesia) → inferior cerebellar peduncle (restiform body) and/or direct cerebellar involvement. The crossed sensory pattern — ipsilateral face, contralateral body — is pathognomonic for a lateral medullary lesion and is the USMLE hallmark of this syndrome.
Incorrect Answer Breakdown:
A: AICA supplies the lateral pons and anterior inferior cerebellum. An AICA infarct (lateral pontine syndrome) produces similar crossed findings but at the pontine level: ipsilateral CN VI (lateral gaze palsy), ipsilateral CN VII (LMN facial weakness), ipsilateral sensorineural hearing loss (cochlear nuclei/CN VIII), and ipsilateral Horner. It does not produce CN IX/X/XI deficits (nucleus ambiguus is in the medulla, not pons). Furthermore, the laterality is described as "left AICA" when the patient''s findings are all right-sided (ipsilateral face, left body = RIGHT lateral medulla lesion).
C: The superior cerebellar artery (SCA) supplies the superior cerebellum and upper dorsal pons. SCA occlusion causes ipsilateral cerebellar signs and contralateral pain/temperature loss from the spinothalamic tract, but the CN deficits are upper pontine (CN IV, partial CN V). The nucleus ambiguus is a medullary structure; the dorsal motor nucleus of the vagus does not mediate the gag reflex and palatal elevation (that is nucleus ambiguus). The medial lemniscus carries proprioception and vibration (dorsal column modalities), not pain/temperature — this answer confuses spinothalamic and lemniscal tract functions.
D: A left PICA occlusion would produce LEFT-sided ipsilateral face findings and RIGHT-sided body findings. This patient has right-sided face findings and left-sided body findings, localizing the lesion to the RIGHT lateral medulla. The hypothalamospinal sympathetic fibers do not decussate — they descend ipsilaterally throughout their entire course (from hypothalamus to ciliospinal center). "Decussating at C3" is anatomically incorrect and does not exist in any neuroanatomy reference.
E: Basilar artery occlusion (locked-in syndrome if complete) produces bilateral pontine and cerebellar infarction with bilateral motor and sensory deficits, quadriplegia, and preserved vertical gaze. The entirely unilateral constellation of this patient''s findings is inconsistent with basilar occlusion. Bilateral PICA territory infarction from a single basilar occlusion is a different, more catastrophic presentation.

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '8ac2995c-1d26-49e9-8d48-968fefe6a0e0',
    'nbme-shelf-anatomy-1st-year',
    'A 28-year-old male construction worker is brought to the emergency department after falling 15 feet from a ladder, landing on his feet before falling onto his right side. He complains of severe pain in his right mid-thigh. He has no prior medical history.

Physical Examination:

Vital Signs: BP: 105/65 mmHg, HR: 112/min, RR: 20/min, Temp: 37.0°C, $SpO_2$: 98% on RA.

Musculoskeletal: Significant swelling and deformity of the right mid-thigh. Pulsatile bleeding is absent, but the thigh is tense.

Neurological: Diminished sensation over the anterior thigh and medial aspect of the leg down to the medial malleolus. Loss of knee extension and absent patellar reflex.

Laboratory Data:

Hemoglobin: 10.5 g/dL (Normal: 13.5–17.5)

Creatine Kinase: 800 U/L (Normal: 22–198)

Which of the following nerves was most likely injured?',
    '["Obturator nerve", "Femoral nerve", "Sciatic nerve", "Lateral femoral cutaneous nerve", "Common fibular nerve"]'::jsonb,
    1,
    'Detailed Explanation: The femoral nerve (L2–L4) innervates the anterior compartment of the thigh (quadriceps femoris). Injury results in loss of knee extension and the patellar reflex. Its sensory branches (anterior cutaneous branches and the saphenous nerve) provide sensation to the anterior thigh and the medial leg down to the foot.

A: The obturator nerve innervates the medial (adductor) compartment; injury causes weakness in hip adduction.

C: Sciatic nerve injury would cause weakness in knee flexion and all movements of the foot/ankle.

D: This nerve is purely sensory to the lateral thigh; it has no motor component.

E: Common fibular nerve injury causes "foot drop" (loss of dorsiflexion/eversion).',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '79338685-d1a2-4e10-ae39-566747c1ab9a',
    'nbme-shelf-anatomy-1st-year',
    'A newborn female is examined in the nursery. The mother, a 32-year-old G1P1, had limited prenatal care but reports no alcohol or drug use. The infant was born at 39 weeks via spontaneous vaginal delivery.

Physical Examination:

Vital Signs: BP: 64/42 mmHg, HR: 140/min, RR: 45/min, Temp: 36.8°C.

General: A large, midline abdominal wall defect is noted at the base of the umbilical cord. The defect is covered by a translucent sac containing loops of small bowel and a portion of the liver.

Laboratory Data:

Maternal AFP (at 16 weeks): Elevated.

Which of the following embryological processes failed to occur correctly?',
    '["Fusion of the lateral body folds.", "Involution of the vitelline duct.", "Return of the physiological midgut herniation.", "Migration of neural crest cells to the gut wall.", "Canalization of the duodenum."]'::jsonb,
    2,
    'Detailed Explanation: This is an Omphalocele. During the 6th week, the midgut physiologically herniates into the umbilical cord. By the 10th week, it should return to the abdominal cavity. Failure of this return results in an omphalocele, which is notably covered by peritoneum/amnion.

A: Failure of lateral fold fusion results in gastroschisis, where the bowel protrudes to the right of the umbilicus without a covering sac.

B: Failure of vitelline duct involution leads to Meckel’s diverticulum.

D: Results in Hirschsprung disease.

E: Results in duodenal atresia.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '4a69b748-4845-4d24-88d0-d92f4df1611f',
    'nbme-shelf-anatomy-1st-year',
    'A 64-year-old male retired smoker presents with a 4-month history of hoarseness. He denies dysphagia or weight loss. He has a history of hypertension and a recently diagnosed 4.5 cm thoracic aortic aneurysm.

Physical Examination:

Vital Signs: BP: 148/90 mmHg, HR: 78/min, RR: 14/min, Temp: 36.6°C.

Laryngoscopy: The left vocal fold is fixed in an adducted position during attempted abduction. The right vocal fold moves normally.

Laboratory Data:

CXR: Widened mediastinal silhouette.

The structure responsible for this patient’s hoarseness loops around which of the following?',
    '["Right subclavian artery", "Arch of the aorta", "Ligamentum arteriosum", "Common carotid artery", "Root of the left lung"]'::jsonb,
    1,
    'Detailed Explanation: The left recurrent laryngeal nerve branches from the vagus nerve, loops under the arch of the aorta (lateral to the ligamentum arteriosum), and ascends in the tracheoesophageal groove. Aneurysms of the aortic arch can compress this nerve, causing left vocal cord paralysis (Ortner syndrome).

A: The right recurrent laryngeal nerve loops around the right subclavian artery.

C: While the nerve is lateral to the ligamentum, the "looping" landmark for the arch is the primary anatomical relation in Moore/Netter.

D: The vagus runs with the carotid, but doesn''t loop around it.

E: It passes posterior to the root of the lung but loops specifically around the arch.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'c0d24450-b2ca-438c-8936-e973673d7689',
    'nbme-shelf-anatomy-1st-year',
    'A 42-year-old female secretary presents with "pins and needles" in her right hand for the past 6 months. The symptoms are worse at night and while typing. She has no history of trauma.

Physical Examination:

Vital Signs: BP: 120/75 mmHg, HR: 70/min, RR: 12/min.

Hands: Atrophy of the thenar eminence. Sensation is decreased over the palmar aspect of the thumb, index, and middle fingers, but is normal over the central palm (thenar crease).

Tests: Positive Phalen and Tinel signs at the wrist.

Which of the following anatomical structures provides sensory innervation to the area of the palm that is spared in this patient?',
    '["Recurrent branch of the median nerve", "Palmar cutaneous branch of the median nerve", "Palmar branch of the ulnar nerve", "Superficial branch of the radial nerve", "Deep branch of the ulnar nerve"]'::jsonb,
    1,
    'Detailed Explanation: This is Carpal Tunnel Syndrome. The median nerve passes through the tunnel, but its palmar cutaneous branch arises proximal to the carpal transverse ligament and passes superficial to it. Therefore, sensation to the central palm is spared despite compression of the main nerve in the tunnel.

A: This is a motor branch to the thenar muscles; it has no sensory component.

C: Provides sensation to the medial palm (pinky side).

D: Provides sensation to the dorsal web space of the thumb.

E: Purely motor branch of the ulnar nerve.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '71eddf4a-f3ca-4310-80a1-bec39b610984',
    'nbme-shelf-anatomy-1st-year',
    'A 19-year-old male is brought to the ED after being struck in the temple by a baseball. He was briefly unconscious, then awoke and felt fine for an hour, but is now becoming increasingly somnolent.

Physical Examination:

Vital Signs: BP: 160/90 mmHg, HR: 55/min, RR: 10/min (Cushing triad).

Neuro: Blown right pupil (mydriasis and fixed).

Laboratory Data:

CT Head: Biconvex (lens-shaped) hyperdense collection.

The vessel injured in this patient enters the skull through which opening?',
    '["Foramen ovale", "Foramen rotundum", "Foramen spinosum", "Foramen lacerum", "Jugular foramen"]'::jsonb,
    2,
    'Detailed Explanation: The patient has an epidural hematoma caused by a rupture of the middle meningeal artery. As detailed in Snell’s Clinical Neuroanatomy, this artery is a branch of the maxillary artery and enters the cranium through the foramen spinosum.

A: Transmits the mandibular nerve ($V_3$).

B: Transmits the maxillary nerve ($V_2$).

D: Filled with cartilage in life; nothing significant passes through it.

E: Transmits CN IX, X, XI and the internal jugular vein.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '21c72f6e-2e66-492a-9b63-6f0d44214efa',
    'nbme-shelf-anatomy-1st-year',
    'A 3-day-old infant is evaluated for projectile, non-bilious vomiting after every feeding. The infant appears hungry and eager to feed again immediately after vomiting.

Physical Examination:

Vital Signs: BP: 70/45 mmHg, HR: 155/min, RR: 30/min, Temp: 37.1°C.

Abdomen: A small, firm, "olive-like" mass is palpable in the epigastrium.

Laboratory Data:

Sodium: 132 mEq/L

Potassium: 3.1 mEq/L (Low)

Chloride: 88 mEq/L (Low)

Bicarbonate: 34 mEq/L (High)

Which of the following is the most likely pathophysiological mechanism?',
    '["Failure of the pleuroperitoneal folds to close.", "Hypertrophy of the circular muscle layer of the pylorus.", "Failure of the ventral pancreatic bud to rotate.", "Persistence of the vitelline duct.", "Incomplete recanalization of the intestinal lumen."]'::jsonb,
    1,
    'Detailed Explanation: This is Hypertrophic Pyloric Stenosis. It typically presents at 2–6 weeks (though can be earlier) with non-bilious projectile vomiting and a palpable olive mass. The underlying cause is hypertrophy of the pyloric sphincter muscle.

A: Leads to diaphragmatic hernia.

C: Leads to an Annular Pancreas, which causes bilious vomiting as it obstructs the second part of the duodenum.

D: Leads to Meckel’s Diverticulum.

E: Leads to duodenal atresia (associated with Down Syndrome and "double bubble" on X-ray).',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'a28a7633-e116-415d-9e49-dfc103921e90',
    'nbme-shelf-anatomy-1st-year',
    'A 45-year-old male presents to the clinic with chronic "heartburn" and difficulty swallowing. He has a history of GERD and a BMI of 34.

Physical Examination:

Vital Signs: BP: 135/85 mmHg, HR: 72/min.

General: Mild epigastric tenderness.

Laboratory Data:

Barium Swallow: Protrusion of the stomach through the esophageal hiatus into the posterior mediastinum.

Which of the following structures normally passes through the same diaphragmatic opening as the esophagus?',
    '["Azygos vein", "Phrenic nerve", "Vagus nerves", "Thoracic duct", "Inferior vena cava"]'::jsonb,
    2,
    'Detailed Explanation: The esophageal hiatus is at the level of T10. It transmits the esophagus and the anterior and posterior vagal trunks.

A & D: The azygos vein and thoracic duct pass through the aortic hiatus at T12.

B: The left phrenic nerve pierces the diaphragm directly; the right phrenic nerve passes through the caval opening at T8.

E: The IVC passes through the caval opening at T8.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'c9faff96-c0ad-4e40-a655-2dd8a520bcb8',
    'nbme-shelf-anatomy-1st-year',
    'A 58-year-old female presents with sudden onset of "the worst headache of her life." She has a history of smoking and autosomal dominant polycystic kidney disease (ADPKD).

Physical Examination:

Vital Signs: BP: 170/105 mmHg, HR: 95/min, RR: 18/min.

Neuro: Nuchal rigidity is present. No focal deficits.

Laboratory Data:

Lumbar Puncture: Xanthochromia present in CSF.

The most common site for the vascular abnormality causing this condition is the junction of which two vessels?',
    '["Internal carotid and ophthalmic arteries", "Anterior communicating and anterior cerebral arteries", "Posterior communicating and internal carotid arteries", "Vertebral and basilar arteries", "Middle cerebral and internal carotid arteries"]'::jsonb,
    1,
    'Detailed Explanation: This is a Subarachnoid Hemorrhage (SAH) likely due to a ruptured Berry aneurysm. ADPKD is a major risk factor. The most common site for these aneurysms is the Anterior Communicating Artery ($ACom$) junction within the Circle of Willis.

A, C, D, E: These are possible sites for Berry aneurysms, but $ACom$ is statistically the most frequent (approx. 35%).',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'bacbb61e-28dd-4c02-8630-3b13a8db1e25',
    'nbme-shelf-anatomy-1st-year',
    'A 50-year-old male is undergoing an emergency repair of a perforated duodenal ulcer. During the surgery, the surgeon must ligate the artery supplying the first part of the duodenum to control bleeding.

Physical Examination:

Intraoperative: Bleeding is identified from the posterior wall of the duodenal bulb.

Which artery is most likely responsible for the hemorrhage?',
    '["Left gastric artery", "Splenic artery", "Gastroduodenal artery", "Proper hepatic artery", "Superior mesenteric artery"]'::jsonb,
    2,
    'Detailed Explanation: Posterior duodenal ulcers frequently erode into the gastroduodenal artery, which runs directly behind the first part of the duodenum. This is a common surgical anatomy "pimp" question in Moore''s.

A: Supplies the lesser curvature of the stomach.

B: Runs along the superior border of the pancreas to the spleen.

D: Gives off the right gastric and then enters the hepatoduodenal ligament.

E: Supplies the gut from the distal duodenum to the proximal two-thirds of the transverse colon.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '36c35194-9add-4a9a-9946-65238a7fc086',
    'nbme-shelf-anatomy-1st-year',
    'A 22-year-old male athlete presents with a "heavy" feeling in his scrotum. He notes it feels like a "bag of worms" when he stands, but the sensation improves when he lies down.

Physical Examination:

Genitalia: Soft, palpable mass superior to the left testis that disappears in the supine position. The right side is normal.

Laboratory Data:

Semen Analysis: Mild oligospermia.

Which anatomical feature explains why this condition occurs more frequently on the left side?',
    '["The left testicular vein drains into the inferior vena cava at an acute angle.", "The left testicular vein drains into the left renal vein at a 90-degree angle.", "The right testicular vein is longer than the left.", "The left testicular artery is compressed by the SMA.", "The left pampiniform plexus lacks valves."]'::jsonb,
    1,
    'Detailed Explanation: This is a Varicocele. They occur on the left side in 90% of cases because the left testicular vein drains into the left renal vein at a perpendicular (90-degree) angle. This creates higher pressure compared to the right testicular vein, which drains directly into the IVC at an oblique angle.

A: This describes the right side (oblique/acute angle into IVC).

C: The left vein is actually longer because it has to reach the renal vein.

D: This describes "Nutcracker Syndrome" (compression of the left renal vein between SMA and Aorta), which causes the varicocele, but the anatomy of the drainage (Choice B) is the primary reason for the side preference.

E: Both sides have valves (though they may be incompetent in varicocele).',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '87299225-75dd-4cc5-b293-7dc668cf0c04',
    'nbme-shelf-anatomy-1st-year',
    'A 32-year-old female G2P1 at 19 weeks gestation undergoes a routine fetal anatomy scan. The radiologist identifies that the fetal heart is located entirely outside of the thoracic cavity, protruding through a midline defect in the chest wall.

Physical Examination:

Maternal Vitals: BP: 118/74 mmHg, HR: 76/min.

Laboratory Data:

Maternal Serum AFP: Significantly elevated.

Which of the following embryological failures is the most likely cause of this condition?',
    '["Failure of the pleuroperitoneal folds to close.", "Failure of the lateral body folds to fuse in the thoracic region.", "Failure of neural crest cell migration into the truncated arteriosus.", "Abnormal signaling during the looping of the heart tube.", "Defective development of the septum transversum."]'::jsonb,
    1,
    'Detailed Explanation: This is Ectopia Cordis, a rare condition where the heart is located outside the thorax. According to Langman’s Medical Embryology, this occurs due to the failure of the lateral body folds to fuse in the midline to form the thoracic wall during the fourth week of development.

A: Leads to congenital diaphragmatic hernia.

C: Leads to conotruncal heart defects (e.g., Tetralogy of Fallot).

D: Leads to dextrocardia or situs inversus.

E: Contributes to the diaphragm and the fibrous pericardium, but not the primary chest wall closure.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'e141942f-1dc3-4641-a8ba-dd04ac388c96',
    'nbme-shelf-anatomy-1st-year',
    'A 45-year-old male presents to the ED with severe, tearing chest pain that radiates to his back between the scapulae. He has a history of uncontrolled hypertension.

Physical Examination:

Vital Signs: BP: 180/110 mmHg (Right arm), 140/90 mmHg (Left arm), HR: 105/min, RR: 22/min.

Heart: A new high-pitched, blowing diastolic murmur is heard at the right sternal border.

Laboratory Data:

Chest CT Angiography: Reveal an intimal tear in the ascending aorta extending to the aortic arch.

The murmur heard on examination is most likely due to the involvement of which anatomical structure?',
    '["Mitral valve annulus", "Aortic root dilation", "Pulmonary valve stenosis", "Left atrium", "Chordae tendineae"]'::jsonb,
    1,
    'Detailed Explanation: The patient has a Stanford Type A Aortic Dissection. As described in Moore''s Clinically Oriented Anatomy, dissection of the ascending aorta can propagate retrograde toward the heart, causing aortic root dilation and subsequent aortic valve insufficiency. This manifests as a diastolic murmur.

A & E: Related to mitral regurgitation, which would produce a systolic murmur at the apex.

C: Produces a systolic crescendo-decrescendo murmur at the left second intercostal space.

D: Not directly responsible for the valvular murmur in the context of dissection.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '259c3c48-963a-415f-87c5-4e7224fdd9ff',
    'nbme-shelf-anatomy-1st-year',
    'A 28-year-old male professional baseball pitcher presents with numbness and tingling in the ring and little fingers of his left hand. He also notes weakness when trying to grip a baseball.

Physical Examination:

Vital Signs: Stable.

Hands: Wasting of the hypothenar eminence. When asked to grip a piece of paper between his thumb and index finger (Froment''s sign), he compensates by flexing the IP joint of the thumb.

Neuro: Sensation is decreased over the medial 1.5 fingers on both the palmar and dorsal surfaces.

What is the most likely site of nerve compression?',
    '["Carpal tunnel", "Guyon canal", "Cubital tunnel", "Pronator teres muscle", "Spiral groove of the humerus"]'::jsonb,
    2,
    'Detailed Explanation: The patient has an ulnar nerve injury. Because the sensory loss involves the dorsal aspect of the medial 1.5 fingers, the lesion must be proximal to the wrist (the dorsal cutaneous branch of the ulnar nerve arises in the forearm). Therefore, the cubital tunnel at the elbow is the most likely site.

A: Involves the median nerve.

B: Compression at the wrist (Guyon canal) would spare the dorsal sensation of the hand.

D: Site for median nerve compression (Pronator syndrome).

E: Site for radial nerve compression (Wrist drop).',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '61519895-35d5-40c3-b33e-08faf505c603',
    'nbme-shelf-anatomy-1st-year',
    'A 60-year-old male is undergoing an emergency repair of a ruptured abdominal aortic aneurysm (AAA). The surgeon notes the aneurysm is located just inferior to the origin of the renal arteries.

Physical Examination:

Intraoperative: The surgeon identifies the left renal vein crossing anterior to the aorta.

The left renal vein typically passes posterior to which of the following arteries?',
    '["Celiac trunk", "Superior mesenteric artery", "Inferior mesenteric artery", "Common iliac artery", "Gonadal artery"]'::jsonb,
    1,
    'Detailed Explanation: As illustrated in Netter’s Atlas of Human Anatomy, the left renal vein travels from the left kidney to the IVC by passing between the superior mesenteric artery (SMA) anteriorly and the aorta posteriorly. Compression at this site is known as "Nutcracker Syndrome."

A: Located superior to the renal veins.

C: Located inferior to the renal veins.

D: Located much further down in the pelvis.

E: The gonadal vein drains into the renal vein on the left; the artery does not cross anterior to it in this specific relational context.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'cd166bbd-6cc5-4c70-99d5-5a5f65f239ea',
    'nbme-shelf-anatomy-1st-year',
    'A 1-day-old male infant is found to have an opening on the ventral surface of the penis. The urethral opening is located at the mid-shaft of the penis.

Physical Examination:

Genitalia: The penis is curved ventrally (chordee). Both testes are descended in the scrotum.

Laboratory Data:

Karyotype: 46, XY.

Failure of which embryological structure to fuse is responsible for this condition?',
    '["Genital swellings", "Urogenital folds", "Genital tubercle", "Paramesonephric ducts", "Processus vaginalis"]'::jsonb,
    1,
    'Detailed Explanation: This is Hypospadias. According to Langman’s, the definitive spongy urethra in males is formed by the fusion of the urogenital (urethral) folds. Failure of these folds to fuse results in an opening on the ventral (underside) surface of the penis.

A: Fusion of the genital swellings forms the scrotum.

C: Forms the glans penis and the phallus.

D: These regress in males; in females, they form the uterus and fallopian tubes.

E: Leads to hydrocele or inguinal hernia.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '1233f12b-a55e-47b5-be5a-00fdf1e3cafc',
    'nbme-shelf-anatomy-1st-year',
    'A 50-year-old female presents with sudden onset of "double vision" and a drooping eyelid. She has a history of heavy smoking.

Physical Examination:

Vital Signs: BP: 140/85 mmHg, HR: 80/min.

Neuro: Complete ptosis of the right eye. The right eye is deviated "down and out." The right pupil is dilated and non-reactive to light.

An aneurysm at the junction of which two vessels is the most likely cause?',
    '["Anterior communicating and anterior cerebral", "Posterior communicating and internal carotid", "Middle cerebral and internal carotid", "Basilar and superior cerebellar", "Posterior cerebral and basilar"]'::jsonb,
    1,
    'Detailed Explanation: This is a Cranial Nerve III (Oculomotor) palsy. Because the pupil is involved (dilated/fixed), it suggests external compression of the nerve. Snell’s Clinical Neuroanatomy emphasizes that the CN III travels between the posterior cerebral artery and the superior cerebellar artery, but it is most commonly compressed by an aneurysm at the junction of the Posterior Communicating Artery ($PCom$) and the Internal Carotid Artery.

A: Causes visual field defects (bitemporal hemianopsia) or is asymptomatic until rupture.

C: Usually presents with stroke symptoms (hemiparesis).

D & E: While CN III passes between these, the $PCom$ aneurysm is the classic high-yield association for surgical CN III palsy.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'fe18576c-f746-4bd8-b2c4-b8ed6eb03041',
    'nbme-shelf-anatomy-1st-year',
    'A 35-year-old male is brought to the ED after a motor vehicle accident where he sustained a "dashboard injury" to his flexed knee. He complains of severe pain and instability in his right knee.

Physical Examination:

Knee: With the knee flexed at 90 degrees, the tibia can be displaced posteriorly relative to the femur (Positive Posterior Drawer Sign).

Which of the following ligamentous structures is most likely damaged?',
    '["Anterior cruciate ligament", "Posterior cruciate ligament", "Medial collateral ligament", "Lateral collateral ligament", "Medial meniscus"]'::jsonb,
    1,
    'Detailed Explanation: Gray’s Anatomy for Students identifies the Posterior Cruciate Ligament (PCL) as the primary stabilizer against posterior translation of the tibia. The "dashboard injury" (force applied to the anterior tibia while the knee is flexed) is the classic mechanism for PCL rupture.

A: Would result in a positive Anterior Drawer Sign or Lachman test.

C & D: Result from valgus/varus stress, respectively.

E: Usually involves locking or popping with twisting motions (McMurray test).',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'decacbdc-74ce-442c-a90a-b9d3e30425e9',
    'nbme-shelf-anatomy-1st-year',
    'A 22-year-old female presents with a small, painless lump in her neck that moves when she swallows. She has no other symptoms.

Physical Examination:

Neck: A 1.5 cm mobile mass is palpated in the midline, just superior to the thyroid cartilage.

Laboratory Data:

Biopsy: Shows normal thyroid tissue.

This ectopic tissue is most likely a remnant of which embryological structure?',
    '["First pharyngeal pouch", "Thyroglossal duct", "Second pharyngeal cleft", "Ultramobranchial body", "Foramen cecum"]'::jsonb,
    1,
    'Detailed Explanation: Langman’s states that the thyroid gland descends from the foramen cecum of the tongue to its final position in the neck. The thyroglossal duct is the path of descent. Remnants of thyroid tissue can be left anywhere along this path, often forming a thyroglossal duct cyst in the midline.

A: Forms the epithelial lining of the auditory tube and middle ear.

C: Forms the cervical sinus (which normally disappears).

D: Gives rise to parafollicular (C) cells of the thyroid.

E: The point of origin, but the remnant itself is found along the duct.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'a4118ff2-007e-4831-a528-1b0b1514beab',
    'nbme-shelf-anatomy-1st-year',
    'A 70-year-old male presents with difficulty starting his urinary stream and frequent nighttime urination.

Physical Examination:

DRE: The prostate is enlarged, rubbery, and non-tender. The median sulcus is palpable.

The enlargement in Benign Prostatic Hyperplasia (BPH) primarily involves which zone of the prostate?',
    '["Peripheral zone", "Central zone", "Transition zone", "Anterior muscular stroma", "Fibrous capsule"]'::jsonb,
    2,
    'Detailed Explanation: As noted in Moore’s, BPH typically involves the Transition Zone, which surrounds the urethra. This is why BPH commonly causes obstructive urinary symptoms. Prostate cancer, conversely, most often arises in the Peripheral Zone.

A: Site for most prostate cancers.

B: Surrounds the ejaculatory ducts.

D & E: Not the primary sites for glandular hyperplasia.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '59612053-a6e3-44db-9d91-27f3e1e27e4a',
    'nbme-shelf-anatomy-1st-year',
    'A 42-year-old female undergoes a thyroidectomy for a large multinodular goiter. Postoperatively, she notices that her voice is weak and she can no longer reach high-pitched notes when singing.

Physical Examination:

Laryngoscopy: The vocal folds adduct and abduct normally, but the left vocal fold appears "limp" and lacks tension.

Which nerve was most likely injured during the surgery?',
    '["Recurrent laryngeal nerve", "Internal branch of the superior laryngeal nerve", "External branch of the superior laryngeal nerve", "Glossopharyngeal nerve", "Ansa cervicalis"]'::jsonb,
    2,
    'Detailed Explanation: The external branch of the superior laryngeal nerve innervates the cricothyroid muscle, which tenses the vocal folds to increase pitch. Injury to this nerve (often during ligation of the superior thyroid artery) results in an inability to produce high-pitched sounds.

A: Would cause vocal fold paralysis (hoarseness or airway obstruction).

B: Provides sensory innervation to the larynx above the vocal folds.

D: Provides sensation to the posterior third of the tongue and oropharynx.

E: Innervates the infrahyoid (strap) muscles.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'f0018ee2-58ab-4653-9fea-555b6a747f40',
    'nbme-shelf-anatomy-1st-year',
    'A 45-year-old male is brought to the emergency department after a high-speed motor vehicle accident. He was the restrained driver and hit the steering wheel with his chest. He complains of severe retrosternal pain.

Physical Examination:

Vital Signs: BP: 90/60 mmHg, HR: 120/min, RR: 24/min, $SpO_2$: 94% on RA.

Heart: Muffled heart sounds; jugular venous distension is noted.

Lungs: Clear to auscultation bilaterally.

Laboratory Data:

FAST Exam: Shows a layer of fluid within the pericardial sac.

To perform an emergency pericardiocentesis, the needle should be inserted in which of the following locations to avoid the pleura and lungs?',
    '["Left 2nd intercostal space, midclavicular line", "Right 4th intercostal space, parasternal line", "Left 5th intercostal space, just lateral to the sternum", "Right 5th intercostal space, midclavicular line", "Left 6th intercostal space, midaxillary line"]'::jsonb,
    2,
    'Detailed Explanation: According to Moore''s Clinically Oriented Anatomy, the "bare area" of the pericardium is located in the left 5th or 6th intercostal space immediately lateral to the sternum. In this region, the pericardium is not covered by pleura or lung due to the cardiac notch of the left lung.

A: Site for needle decompression of a tension pneumothorax.

B: Risk of entering the right pleura and lung.

D: Midclavicular line would likely pierce the lung/pleura.

E: This is a common site for a chest tube (midaxillary line), not pericardiocentesis.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'ee9a20dc-5bb5-4be2-bbd9-a895f35ae1bc',
    'nbme-shelf-anatomy-1st-year',
    'A newborn male is noted to have a constant dribbling of urine from his umbilicus. The infant is otherwise healthy and was born at term.

Physical Examination:

Vital Signs: Stable.

Abdomen: Clear fluid is seen leaking from the umbilical stump. No masses are palpated.

Laboratory Data:

Creatinine (Fluid): High (consistent with urine).

This condition is caused by the persistence of a structure derived from which embryological organ?',
    '["Vitelline duct", "Allantois", "Mesonephric duct", "Paramesonephric duct", "Cloacal membrane"]'::jsonb,
    1,
    'Detailed Explanation: This is a Urachal Fistula. Langman’s Medical Embryology explains that the allantois connects the fetal bladder to the umbilicus. Normally, it obliterates to become the urachus (median umbilical ligament). If the entire lumen remains patent, urine can leak from the umbilicus.

A: Persistence leads to a vitelline fistula, which leaks fecal matter, not urine.

C: Forms male reproductive structures (epididymis, vas deferens).

D: Forms female reproductive structures (uterus, tubes).

E: The membrane that ruptures to form the urogenital and anal openings.',
    'Medium'
);
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    'b9f80739-eaec-4152-afa7-4842c74472ff',
    'nbme-shelf-anatomy-1st-year',
    'A 68-year-old male with a history of heavy alcohol use and cirrhosis is brought to the ED after vomiting a large amount of bright red blood.

Physical Examination:

Vital Signs: BP: 85/55 mmHg, HR: 115/min.

General: Jaundiced with visible "caput medusae" on the abdomen.

Laboratory Data:

INR: 1.9

Albumin: 2.4 g/dL

The "caput medusae" observed on the abdomen represents an anastomosis between which two venous systems?',
    '["Left gastric vein and Azygos vein", "Superior rectal vein and Inferior rectal vein", "Paraumbilical veins and Superficial epigastric veins", "Splenic vein and Short gastric veins", "Inferior mesenteric vein and Renal vein"]'::jsonb,
    2,
    'Detailed Explanation: High-Yield Gross Anatomy describes the portosystemic anastomoses that occur in portal hypertension. Caput medusae involves the paraumbilical veins (portal) and the superficial epigastric veins (systemic).

A: These form esophageal varices.

B: These form internal hemorrhoids.

D: These are involved in gastric varices.

E: This is not a standard portosystemic anastomosis site mentioned in major texts.',
    'Medium'
);

COMMIT;