-- ==========================================
-- Topic: Systemic Embryology - 25 Clinical Cases
-- Semester 2 First Year
-- ==========================================

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Get or Create Topic ID
    SELECT id INTO v_topic_id FROM topics WHERE title = 'Systemic Embryology' AND semester_id = 2;
    
    IF v_topic_id IS NULL THEN
        INSERT INTO topics (semester_id, title, slug, "order", usmle_step)
        VALUES (2, 'Systemic Embryology', 'systemic-embryology', 10, 1)
        RETURNING id INTO v_topic_id;
    END IF;

    -- 2. Cleanup existing cases for this topic
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    -- CASE 1: Neurulation and Neural Tube Defect
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Neurulation and Neural Tube Defect', 
        'A newborn is delivered with a lumbosacral cystic swelling. The lesion transilluminates, and imaging shows protrusion of meninges and neural tissue through a vertebral defect.',
        1
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The embryologic event that failed most directly is:', '["Neural crest migration", "Neural tube closure", "Somite segmentation", "Notochord degeneration", "Cloacal membrane rupture"]', 1, 'Meningomyelocele is a failure of the neural tube to close properly at the caudal end.'),
    (v_case_id, 'Closure of the caudal neuropore normally occurs during:', '["End of week 1", "Week 2", "Week 4", "Week 8", "Week 12"]', 2, 'The cranial neuropore closes around day 25, and the caudal neuropore around day 27-28 (end of week 4).'),
    (v_case_id, 'Maternal deficiency of which vitamin is strongly associated with this defect?', '["Vitamin C", "Folate", "Vitamin D", "Vitamin K", "Vitamin B12 only"]', 1, 'Folate (Vitamin B9) supplementation reduces the risk of NTDs by up to 70%.'),
    (v_case_id, 'The structure that induces overlying ectoderm to form the neural plate is the:', '["Primitive streak", "Notochord", "Allantois", "Amnion", "Septum transversum"]', 1, 'The notochord induces the overlying surface ectoderm to differentiate into neuroectoderm.');

    -- CASE 2: Neural Crest Derivatives
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Neural Crest Derivatives', 
        'An infant has conotruncal cardiac abnormalities and craniofacial defects. A lecturer asks about abnormal neural crest development.',
        2
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Neural crest cells are derived from:', '["Endoderm", "Surface ectoderm only", "Neuroectoderm at the edge of the neural folds", "Intermediate mesoderm", "Lateral plate mesoderm"]', 2, 'They arise from the margins of the neural folds as they fuse to form the neural tube.'),
    (v_case_id, 'Which of the following is a neural crest derivative?', '["Skeletal muscle of limbs", "Adrenal medulla", "Hepatocytes", "Nephron epithelium", "Endocardial cushions only from endoderm"]', 1, 'Chromaffin cells of the adrenal medulla are modified postganglionic sympathetic neurons derived from neural crest.'),
    (v_case_id, 'Neural crest contributes importantly to partitioning of the:', '["Primitive atrium only", "Conotruncal outflow tract", "Vitelline duct", "Foregut lumen", "Pleuropericardial folds only"]', 1, 'Neural crest cells migrate to the heart to form the aorticopulmonary septum.');

    -- CASE 3: Somites and Sclerotome
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Somites and Sclerotome', 
        'A fetus has congenital vertebral anomalies. A student is asked about somite derivatives.',
        3
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Vertebrae develop primarily from the:', '["Dermatome", "Myotome", "Sclerotome", "Lateral plate mesoderm", "Neural crest only"]', 2, 'Somites differentiate into sclerotome (bone), myotome (muscle), and dermatome (dermis).'),
    (v_case_id, 'Skeletal muscles of the trunk arise mainly from the:', '["Sclerotome", "Myotome", "Endoderm", "Neural tube", "Surface ectoderm"]', 1, 'The myotome part of the somite gives rise to skeletal muscle.'),
    (v_case_id, 'Dermis of the back arises largely from the:', '["Dermatome", "Myotome", "Septum transversum", "Endocardial cushion", "Neural crest only"]', 0, 'Dermatome provides the connective tissue of the skin for the back.');

    -- CASE 4: Pharyngeal Apparatus Basics
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Pharyngeal Apparatus Basics', 
        'A child has a congenital neck sinus along the anterior border of the sternocleidomastoid muscle.',
        4
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This lesion most likely results from persistence of the:', '["First pharyngeal cleft", "Second pharyngeal cleft/cervical sinus", "First pharyngeal pouch", "Thyroglossal duct", "Primitive streak"]', 1, 'Failure of the 2nd pharyngeal cleft to obliterate results in a branchial cyst or sinus.'),
    (v_case_id, 'The pharyngeal arches are composed of mesenchyme derived mainly from:', '["Endoderm only", "Mesoderm with neural crest contribution", "Surface ectoderm only", "Intermediate mesoderm only", "Yolk sac endoderm"]', 1, 'Arches contain mesoderm (muscles/arteries) and neural crest (bones/cartilage).'),
    (v_case_id, 'The internal lining of pharyngeal pouches is derived from:', '["Surface ectoderm", "Endoderm", "Neural crest", "Somatic mesoderm", "Extraembryonic mesoderm"]', 1, 'Pharyngeal pouches are outpocketings of the foregut endoderm.');

    -- CASE 5: First Pharyngeal Arch
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'First Pharyngeal Arch', 
        'A newborn has mandibular hypoplasia and malformed malleus/incus.',
        5
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The affected structures are primarily derivatives of the:', '["First arch", "Second arch", "Third arch", "Fourth arch", "Sixth arch"]', 0, 'The 1st arch (Mandibular arch) gives rise to Meckel cartilage, malleus, incus, and the mandible.'),
    (v_case_id, 'The nerve associated with the first arch is:', '["Facial nerve", "Glossopharyngeal nerve", "Trigeminal nerve", "Vagus nerve superior laryngeal branch only", "Hypoglossal nerve"]', 2, 'CN V (Trigeminal) is the nerve of the 1st arch.'),
    (v_case_id, 'A major muscle derivative of the first arch is:', '["Stapedius", "Muscles of mastication", "Stylopharyngeus", "Cricothyroid", "Intrinsic laryngeal muscles"]', 1, 'Muscles of mastication, anterior belly of digastric, and tensor tympani/palatini are 1st arch derivatives.');

    -- CASE 6: Second and Third Arch Derivatives
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Second and Third Arch Derivatives', 
        'A professor asks students to compare arch derivatives.',
        6
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The stapes and styloid process are primarily derived from the:', '["First arch", "Second arch", "Third arch", "Fourth arch", "Sixth arch"]', 1, 'The 2nd arch (Hyoid arch) gives rise to the stapes, styloid process, and lesser horn of the hyoid.'),
    (v_case_id, 'The nerve of the second arch is:', '["Trigeminal", "Facial", "Glossopharyngeal", "Vagus", "Accessory"]', 1, 'CN VII (Facial) is the nerve of the 2nd arch.'),
    (v_case_id, 'Stylopharyngeus is a muscle derivative of the:', '["First arch", "Second arch", "Third arch", "Fourth arch", "Sixth arch"]', 2, 'The 3rd arch gives rise to the stylopharyngeus muscle and common/internal carotids.');

    -- CASE 7: Aortic Arch Derivatives
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Aortic Arch Derivatives', 
        'A fetus has a vascular anomaly involving the great arteries.',
        7
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The third aortic arch contributes primarily to the:', '["Pulmonary arteries", "Common carotid arteries", "Ductus arteriosus", "Arch of aorta only", "Subclavian arteries only"]', 1, '3rd arch = Carotids.'),
    (v_case_id, 'The left fourth aortic arch contributes to part of the:', '["Arch of aorta", "Right pulmonary artery", "Ductus venosus", "Coronary sinus", "Umbilical artery only"]', 0, 'Left 4th arch forms part of the aortic arch; Right 4th arch forms proximal R subclavian.'),
    (v_case_id, 'The sixth aortic arch contributes to the:', '["Coronary arteries", "Pulmonary arteries and ductus arteriosus on the left", "Internal carotid only", "Vitelline arteries", "Hepatic sinusoids"]', 1, '6th arch = Pulmonary arteries and (on left) ductus arteriosus.');

    -- CASE 8: Cardiac Tube and Looping
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Cardiac Tube and Looping', 
        'An embryo has malposition of the heart from abnormal looping.',
        8
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The primitive heart begins as:', '["A single venous plexus", "Two endocardial tubes that fuse", "A neural crest-derived chamber", "A foregut diverticulum", "A mesonephric duct derivative"]', 1, 'Bilateral endocardial tubes fuse mid-line in the 3rd week.'),
    (v_case_id, 'Normal cardiac looping usually bends the heart tube toward the:', '["Left", "Right", "Dorsal midline only", "Caudal pole", "Yolk sac"]', 1, 'Dextra-looping (to the right) is normal.'),
    (v_case_id, 'Failure of normal looping can contribute to:', '["Dextrocardia", "Omphalocele", "Tracheoesophageal fistula", "Pyloric stenosis", "Horseshoe kidney"]', 0, 'Leve-looping (to the left) results in dextrocardia (heart on the right side).');

    -- CASE 9: Septation of the Atria
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Septation of the Atria', 
        'A child has an atrial septal defect. A student is asked how the atrial septum forms.',
        9
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The first septum to descend toward the endocardial cushions is the:', '["Septum secundum", "Septum primum", "Aorticopulmonary septum", "Interventricular septum", "Pleuroperitoneal membrane"]', 1, 'Septum primum grows first, with an opening (ostium primum) that eventually closes.'),
    (v_case_id, 'Before birth, the foramen ovale allows blood flow from:', '["Left atrium to right atrium", "Right atrium to left atrium", "Right ventricle to left ventricle", "Pulmonary artery to aorta directly", "Umbilical vein to IVC only"]', 1, 'Fetal circulation bypasses the lungs via the foramen ovale (R to L).'),
    (v_case_id, 'Functional closure of the foramen ovale after birth occurs because:', '["Right atrial pressure exceeds left atrial pressure", "Left atrial pressure exceeds right atrial pressure", "Ductus arteriosus remains open", "Umbilical vein flow increases", "Pulmonary vascular resistance rises"]', 1, 'Decreased pulmonary resistance and increased L atrial pressure push the septum primum against the septum secundum.');

    -- CASE 10: Ventricular Septation and Conotruncal Defects
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Ventricular Septation and Conotruncal Defects', 
        'A newborn has an overriding aorta and ventricular septal defect.',
        10
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Proper partitioning of the truncus arteriosus depends importantly on:', '["Intermediate mesoderm only", "Neural crest migration", "Surface ectoderm", "Septum primum only", "Pronephric ducts"]', 1, 'Neural crest cells form the spiral aorticopulmonary septum.'),
    (v_case_id, 'The muscular part of the interventricular septum arises mainly from:', '["Endocardial cushions only", "Growth upward from ventricular floor", "Neural crest only", "Aortic arches", "Pleuropericardial folds"]', 1, 'The muscular fold grows from the apex toward the cushions.'),
    (v_case_id, 'The membranous part of the interventricular septum forms from contribution of:', '["Endocardial cushions and conotruncal septum", "Somites only", "Septum primum only", "Hepatic diverticulum", "Umbilical arteries"]', 0, 'MEMBRANOUS septum is the site of most VSDs; it derives from endocardial cushions and the bulbar septum.');

    -- CASE 11: Foregut and Tracheoesophageal Partitioning
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Foregut and Tracheoesophageal Partitioning', 
        'A newborn has coughing and cyanosis with feeds. A tracheoesophageal fistula is suspected.',
        11
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This anomaly results from abnormal partitioning of the:', '["Midgut", "Foregut", "Hindgut", "Cloaca", "Allantois"]', 1, 'The esophagus and trachea both arise from the primitive foregut.'),
    (v_case_id, 'The trachea and esophagus are separated by formation of the:', '["Pleuroperitoneal membrane", "Tracheoesophageal septum", "Septum transversum", "Aorticopulmonary septum", "Dorsal mesentery only"]', 1, 'Failure of the tracheoesophageal folds to fuse results in a fistula.'),
    (v_case_id, 'Failure of this process commonly leads to:', '["Polyhydramnios prenatally", "Oligohydramnios only", "Renal agenesis", "Imperforate anus", "Diaphragmatic eventration only"]', 0, 'Inability of the fetus to swallow amniotic fluid leads to polyhydramnios.');

    -- CASE 12: Midgut Rotation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Midgut Rotation', 
        'An infant presents with bilious vomiting due to malrotation.',
        12
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The midgut normally herniates into the umbilical cord because:', '["Liver is too small", "Abdominal cavity is temporarily too small", "Neural tube fails to close", "Cloaca does not divide", "Pancreas blocks descent"]', 1, 'In the 6th week, rapid growth of the midgut and liver forces the intestines into the cord.'),
    (v_case_id, 'The total normal rotation of the midgut is:', '["90° clockwise", "180° clockwise", "270° counterclockwise", "360° clockwise", "180° counterclockwise"]', 2, 'The midgut rotates 90° CCW during herniation and 180° CCW during return (Total 270° CCW).'),
    (v_case_id, 'Malrotation predisposes to:', '["Volvulus", "Pyloric atresia only", "Tracheoesophageal fistula", "Dextrocardia", "Cleft palate"]', 0, 'Abnormal fixation leads to a narrow mesenteric base, allowing the gut to twist (volvulus).');

    -- CASE 13: Vitelline Duct Remnant
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Vitelline Duct Remnant', 
        'A child has painless rectal bleeding from ectopic gastric mucosa in a small intestinal diverticulum.',
        13
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The most likely diagnosis is:', '["Omphalocele", "Meckel diverticulum", "Duodenal atresia", "Hirschsprung disease", "Annular pancreas"]', 1, 'Meckel Diverticulum is a common remnant of the vitelline duct.'),
    (v_case_id, 'This lesion results from persistence of the:', '["Urachus", "Vitelline duct", "Allantois", "Ductus venosus", "Mesonephric duct"]', 1, 'Also called the omphalomesenteric duct; failure to obliterate usually leaves a blind pouch.'),
    (v_case_id, 'Meckel diverticulum is located on the:', '["Anti-mesenteric border of ileum", "Mesenteric border of jejunum", "Duodenal wall near ampulla", "Colon only", "Stomach greater curvature"]', 0, 'Rule of 2s: 2 inches long, 2 feet from ileocecal valve, 2% of population.');

    -- CASE 14: Hindgut and Cloacal Partitioning
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Hindgut and Cloacal Partitioning', 
        'A newborn has an anorectal malformation with fistulous communication to the urinary tract.',
        14
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The cloaca is normally divided by the:', '["Septum transversum", "Urorectal septum", "Tracheoesophageal septum", "Aorticopulmonary septum", "Interventricular septum"]', 1, 'The urorectal septum divides the cloaca into the urogenital sinus and the anorectal canal.'),
    (v_case_id, 'The hindgut contributes to development of the:', '["Distal one-third of transverse colon to upper anal canal", "Stomach and proximal duodenum", "Esophagus only", "Trachea only", "Liver and pancreas"]', 0, 'Hindgut = distal 1/3 transverse colon, descending, sigmoid, rectum, upper anal canal.'),
    (v_case_id, 'The lower anal canal is derived from:', '["Endoderm of hindgut", "Ectoderm of proctodeum", "Neural crest", "Intermediate mesoderm", "Yolk sac endoderm"]', 1, 'The anal canal has dual origin: upper endoderm, lower ectoderm (below pectinate line).');

    -- CASE 15: Liver, Gallbladder, and Pancreas
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Liver, Gallbladder, and Pancreas', 
        'A lecturer asks about foregut derivatives.',
        15
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The liver and biliary apparatus arise from the:', '["Midgut loop", "Hepatic diverticulum from foregut endoderm", "Neural crest", "Somites", "Mesonephric ridge"]', 1, 'The hepatic bud grows into the septum transversum.'),
    (v_case_id, 'The ventral pancreatic bud contributes mainly to the:', '["Body and tail of pancreas", "Uncinate process and inferior head", "Entire pancreas alone", "Spleen", "Gallbladder only"]', 1, 'The dorsal bud forms most of the pancreas; the ventral bud forms the uncinate process.'),
    (v_case_id, 'Annular pancreas results from abnormal:', '["Fusion of pleuroperitoneal membranes", "Rotation/migration of the ventral pancreatic bud", "Neural tube closure", "Cloacal septation", "Vitelline duct regression"]', 1, 'A bifid ventral bud or abnormal rotation can encircle the duodenum.');

    -- CASE 16: Respiratory System Development
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Respiratory System Development', 
        'A premature infant has respiratory distress from surfactant deficiency.',
        16
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The respiratory diverticulum arises from the:', '["Midgut", "Foregut endoderm", "Hindgut", "Surface ectoderm", "Intermediate mesoderm"]', 1, 'The lung bud appears as an outgrowth of the ventral wall of the foregut.'),
    (v_case_id, 'The epithelium of the trachea and bronchi is derived from:', '["Splanchnic mesoderm", "Endoderm", "Neural crest", "Somatic mesoderm", "Surface ectoderm"]', 1, 'Internal linings are endoderm; smooth muscle and cartilage are splanchnic mesoderm.'),
    (v_case_id, 'Surfactant is produced by:', '["Type I pneumocytes", "Type II pneumocytes", "Alveolar macrophages", "Clara cells only", "Ciliated columnar cells"]', 1, 'Type II cells produce phospholipid-rich surfactant to lower surface tension.'),
    (v_case_id, 'Surfactant production increases significantly late in gestation, especially during:', '["Embryonic period only", "Saccular stage", "Gastrulation only", "Neurulation only", "Pre-implantation period"]', 1, 'Viability is usually possible after ~24-26 weeks when terminal sacs form.');

    -- CASE 17: Diaphragm Development
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Diaphragm Development', 
        'A newborn has severe respiratory distress and bowel sounds in the thorax due to a congenital diaphragmatic hernia.',
        17
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The most common congenital diaphragmatic hernia is due to failure of closure of the:', '["Foramen of Morgagni", "Pleuroperitoneal canal", "Esophageal hiatus only", "Umbilical ring", "Aortic hiatus"]', 1, 'Bochdalek hernia usually occurs on the left side.'),
    (v_case_id, 'A major embryologic component of the diaphragm is the:', '["Septum transversum", "Neural crest", "Pronephros", "Vitelline duct", "Truncus arteriosus"]', 0, 'The diaphragm forms from: Septum transversum, Pleuroperitoneal membranes, Mesal mesentery of esophagus, and Body wall.'),
    (v_case_id, 'The phrenic nerve roots (C3–C5) reflect origin of the diaphragm near the:', '["Pelvic region", "Cervical region", "Sacral region", "Lumbar region", "Coccygeal region"]', 1, 'Initial development occurs in the neck; as the lungs grow, the diaphragm descends, pulling its nerves with it.');

    -- CASE 18: Kidney Development
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Kidney Development', 
        'A fetus is found to have unilateral renal agenesis.',
        18
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Definitive kidneys develop from the:', '["Pronephros", "Mesonephros", "Metanephros", "Paramesonephros", "Neural crest"]', 2, 'Definitive kidney = Metanephros (appears in 5th week).'),
    (v_case_id, 'The ureteric bud arises from the:', '["Paramesonephric duct", "Mesonephric duct", "Allantois", "Hindgut", "Cloacal membrane"]', 1, 'The bud grows into the metanephric blastema.'),
    (v_case_id, 'Reciprocal induction between the ureteric bud and which tissue is essential for nephron development?', '["Surface ectoderm", "Metanephric mesenchyme", "Sclerotome", "Septum transversum", "Neural tube"]', 1, 'The bud forms the collecting system; the blastema forms the nephrons.');

    -- CASE 19: Lower Urinary Tract and Urachus
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Lower Urinary Tract and Urachus', 
        'A child has clear fluid draining from the umbilicus due to a patent urachus.',
        19
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The urachus is a remnant of the:', '["Vitelline duct", "Allantois", "Mesonephric duct", "Müllerian duct", "Ductus venosus"]', 1, 'The allantois becomes the fibrous urachus (median umbilical ligament) in the adult.'),
    (v_case_id, 'The urinary bladder develops mainly from the:', '["Foregut", "Urogenital sinus", "Neural crest", "Pronephric duct", "Surface ectoderm"]', 1, 'The vesical part of the UG sinus forms most of the bladder.'),
    (v_case_id, 'The trigone of the bladder is derived embryologically from incorporation of:', '["Müllerian ducts", "Mesonephric ducts", "Vitelline veins", "Allantoic stalk only", "Cloacal membrane only"]', 1, 'Caudal parts of the mesonephric ducts are absorbed into the bladder wall.');

    -- CASE 20: Gonadal Differentiation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Gonadal Differentiation', 
        'A fetus with an XY karyotype develops testes.',
        20
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The indifferent gonad differentiates into a testis under influence of the:', '["SOX2 gene", "SRY gene", "HOX gene cluster only", "CFTR gene", "PAX6 gene"]', 1, 'TDF (Testis Determining Factor) is encoded by SRY on the Y chromosome.'),
    (v_case_id, 'Sertoli cells secrete:', '["Testosterone", "Anti-Müllerian hormone", "DHT", "hCG", "Progesterone"]', 1, 'AMH causes Müllerian duct regression in males.'),
    (v_case_id, 'Leydig cells secrete:', '["AMH", "Testosterone", "Estrogen only", "FSH", "Oxytocin"]', 1, 'Leydig cells provide the androgens for Wolffian maintenance/masculinization.');

    -- CASE 21: Duct System Differentiation
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Duct System Differentiation', 
        'A fetus has normal testes but failure of male internal duct development.',
        21
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Male internal genital ducts develop from the:', '["Paramesonephric ducts", "Mesonephric ducts", "Allantois", "Cloaca", "Vitelline duct"]', 1, 'Wolffian (mesonephric) ducts = Male; Müllerian (paramesonephric) ducts = Female.'),
    (v_case_id, 'Maintenance of the mesonephric ducts requires:', '["AMH", "Testosterone", "DHT only", "Estrogen", "hCG only"]', 1, 'High local testosterone concentration is needed to prevent Wolffian regression.'),
    (v_case_id, 'Female internal reproductive structures such as the uterus develop mainly from the:', '["Mesonephric ducts", "Paramesonephric ducts", "Ureteric buds", "Allantois", "Neural crest"]', 1, 'Uterus, tubes, and upper vagina form from fused Müllerian ducts.');

    -- CASE 22: External Genitalia and DHT
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'External Genitalia and DHT', 
        'A 46,XY infant has ambiguous external genitalia due to impaired DHT production.',
        22
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'DHT is produced from testosterone by:', '["Aromatase", "5-alpha reductase", "21-hydroxylase", "11-beta hydroxylase", "Thyroid peroxidase"]', 1, '5-alpha reductase converts T to the more potent DHT.'),
    (v_case_id, 'DHT is especially required for development of the:', '["Wolffian ducts", "External male genitalia and prostate", "Müllerian ducts", "Testes only", "Kidneys"]', 1, 'T-Wolffian; DHT-External/Prostate.'),
    (v_case_id, 'In female development, external genitalia form in the relative absence of:', '["Estrogen", "DHT", "Progesterone", "AMH", "Inhibin"]', 1, 'The default pattern is female until androgens (especially DHT) intervene.');

    -- CASE 23: Limb Development
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Limb Development', 
        'A fetus exposed to teratogenic medication has limb reduction defects.',
        23
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Limb buds appear during:', '["Week 2", "Week 4", "Week 10", "Week 16", "Week 20"]', 1, ' Limb development begins late in the 4th week.'),
    (v_case_id, 'The apical ectodermal ridge is essential for:', '["Neural crest migration", "Proximodistal growth of the limb", "Formation of somites", "Separation of trachea and esophagus", "Cloacal partitioning"]', 1, 'The AER exerts inductive influence on the underlying mesenchyme.'),
    (v_case_id, 'Failure of apoptosis between digital rays can result in:', '["Amelia", "Syndactyly", "Meromelia", "Polydactyly only", "Gastroschisis"]', 1, 'Webbed fingers/toes result from failure of programed cell death in the hand/foot plates.');

    -- CASE 24: Face and Palate Development
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Face and Palate Development', 
        'A newborn has a cleft lip and palate.',
        24
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Cleft lip usually results from failure of fusion between the:', '["Maxillary prominence and medial nasal prominence", "Mandibular prominences", "Lateral nasal prominences only", "First and second pharyngeal arches entirely", "Palatine shelves only"]', 0, 'Lateral cleft lip is a common facial developmental anomaly.'),
    (v_case_id, 'The secondary palate forms from fusion of the:', '["Frontonasal prominence only", "Lateral palatine shelves", "Mandibular arch only", "Thyroglossal duct", "Foramen cecum"]', 1, 'The secondary palate is the part of the palate that forms the roof of the mouth.'),
    (v_case_id, 'Failure of palatal shelf fusion results in:', '["Bifid uvula only never cleft palate", "Cleft palate", "Branchial fistula", "Choanal atresia only", "Tracheoesophageal fistula"]', 1, 'The shelves must rotate and fuse in the midline.');

    -- CASE 25: Eye and Ear Development
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES (
        v_topic_id, 
        'Eye and Ear Development', 
        'A lecturer asks about special sense organ embryology.',
        25
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The retina develops from the:', '["Surface ectoderm", "Neuroectoderm of the optic cup", "Endoderm", "Neural crest only", "Mesoderm only"]', 1, 'The optic vesicle invaginates to form a double-layered optic cup (future retina).'),
    (v_case_id, 'The lens develops from the:', '["Endoderm", "Surface ectoderm", "Neural crest", "Splanchnic mesoderm", "Somites"]', 1, 'The lens placode forms from surface ectoderm.'),
    (v_case_id, 'The inner ear develops from the:', '["Optic vesicle", "Otic placode", "First pharyngeal pouch", "Third arch", "Urogenital sinus"]', 1, 'The otic placode (surface ectoderm) invaginates to form the otocyst.'),
    (v_case_id, 'The middle ear cavity is derived mainly from the:', '["First pharyngeal cleft", "First pharyngeal pouch", "Second pharyngeal pouch", "Otic placode", "Surface ectoderm only"]', 1, 'The tubotympanic recess arises from the 1st pouch endoderm.');

    RAISE NOTICE 'Systemic Embryology Cases Migration Completed (25 Cases).';
END $$;
