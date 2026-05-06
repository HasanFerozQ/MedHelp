BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-neonatology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-neonatology not found.';
    END IF;

    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    -- Batch 4: 181-240 (Polycythemia, Sepsis, and TORCH Infections)
    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('181: Polycythemia in the newborn is defined as a central venous hematocrit greater than:', '["55%", "65%", "75%", "85%"]', 1, 'High RBC mass increases blood viscosity. (Beckmann)'),
    ('182: Hyperviscosity syndrome secondary to polycythemia presents with:', '["Pallor and shock", "Plethora (ruddy skin), lethargy, and respiratory distress", "Jaundice only", "Fever"]', 1, 'Sludging of blood impairs microcirculation. (Williams)'),
    ('183: What is the treatment for severe, symptomatic polycythemia in a neonate?', '["Blood transfusion", "Partial exchange transfusion with normal saline", "Diuretics", "Iron"]', 1, 'Dilutes the red blood cell concentration. (ACOG)'),
    ('184: What is the most common organism responsible for Early-Onset (< 72 hours) Neonatal Sepsis?', '["E. coli", "Group B Streptococcus (GBS)", "Listeria monocytogenes", "Staphylococcus aureus"]', 1, 'GBS is the most common, closely followed by E. coli. (CDC)'),
    ('185: Early-onset neonatal sepsis is most commonly acquired via:', '["Vertical transmission (ascending infection from vaginal flora)", "Horizontal transmission in the NICU", "Breast milk", "Blood transfusion"]', 0, 'Risk factors include prolonged ROM, maternal fever, and GBS colonization. (Williams)'),
    ('186: The standard empiric antibiotic regimen for suspected early-onset neonatal sepsis is:', '["Ampicillin and Gentamicin", "Ceftriaxone and Azithromycin", "Vancomycin and Cefepime", "Penicillin alone"]', 0, 'Ampicillin covers GBS/Listeria; Gentamicin covers E. coli. (ACOG)'),
    ('187: Listeria monocytogenes infection in the neonate classically presents with:', '["Conjunctivitis", "Granulomatosis infantiseptica (disseminated abscesses) and meningitis", "Heart block", "Cataracts"]', 1, 'Associated with maternal consumption of unpasteurized dairy. (Beckmann)'),
    ('188: Late-onset neonatal sepsis (> 72 hours) is most commonly caused by:', '["GBS", "Coagulase-negative Staphylococci (e.g., S. epidermidis)", "E. coli", "Listeria"]', 1, 'Usually a hospital-acquired infection (nosocomial) related to indwelling lines. (Williams)'),
    ('189: A neonate with suspected sepsis presents with fever, lethargy, and poor feeding. Are classic meningeal signs (stiff neck, Kernig) usually present if meningitis is occurring?', '["Yes", "No", "Only if preterm", "Only if > 1 month old"]', 1, 'Signs of neonatal meningitis are highly non-specific. (ACOG)'),
    ('190: What diagnostic procedure is mandatory in the workup of a stable neonate with suspected sepsis to rule out meningitis?', '["CT head", "Lumbar Puncture", "MRI", "EEG"]', 1, 'Blood cultures alone are insufficient to rule out CNS involvement. (AAP)'),
    ('191: The classic triad of Congenital Rubella Syndrome includes:', '["Sensorineural hearing loss, cataracts, and congenital heart disease (e.g., PDA)", "Chorioretinitis, hydrocephalus, and intracranial calcifications", "Microcephaly, seizures, and rash", "Bone lesions, snuffles, and rash"]', 0, 'Also known to cause a "blueberry muffin" rash. (Williams)'),
    ('192: The classic triad of Congenital Toxoplasmosis includes:', '["Deafness, cataracts, PDA", "Chorioretinitis, hydrocephalus, and diffuse intracranial calcifications", "Skin scarring, limb hypoplasia", "Hutchinson teeth, saber shins"]', 1, 'Contracted from cat feces or undercooked meat. (Beckmann)'),
    ('193: What is the most common congenital viral infection?', '["Rubella", "Cytomegalovirus (CMV)", "Herpes Simplex Virus (HSV)", "Zika"]', 1, 'Leading non-genetic cause of childhood hearing loss. (ACOG)'),
    ('194: Classic findings of Congenital CMV include:', '["Periventricular calcifications, microcephaly, sensorineural hearing loss", "Diffuse calcifications, hydrocephalus", "Cataracts, PDA", "Bone lesions, snuffles"]', 0, 'Calcifications outline the ventricles. (Williams)'),
    ('195: Early signs (< 2 years) of Congenital Syphilis include:', '["Hutchinson teeth, saddle nose", "Snuffles (syphilitic rhinitis), maculopapular rash on palms/soles, hepatosplenomegaly", "Cataracts, PDA", "Hydrocephalus, chorioretinitis"]', 1, 'Late signs include the classic bone and tooth deformities. (Beckmann)'),
    ('196: What is the treatment for a newborn with Congenital Syphilis?', '["Aqueous Crystalline Penicillin G IV for 10 days", "Erythromycin", "Ceftriaxone", "Observation"]', 0, 'Standard of care for all confirmed or highly suspected cases. (CDC)'),
    ('197: Congenital Varicella Syndrome is most likely if maternal infection occurs during:', '["First or second trimester (< 20 weeks)", "Third trimester", "During delivery", "Postpartum"]', 0, 'Presents with cicatricial skin scarring, limb hypoplasia, and eye defects. (Williams)'),
    ('198: If a mother develops Varicella 5 days before to 2 days after delivery, the neonate must receive:', '["Acyclovir", "Varicella Zoster Immune Globulin (VZIG)", "Varicella vaccine", "Nothing"]', 1, 'Provides immediate passive immunity to prevent severe neonatal varicella. (ACOG)'),
    ('199: To prevent neonatal Herpes Simplex Virus (HSV) infection, what is recommended if the mother has active genital lesions at the time of labor?', '["IV Acyclovir for the baby", "Cesarean delivery", "Vaginal Betadine wash", "Oral valacyclovir for the baby"]', 1, 'Prevents direct contact with the virus in the birth canal. (ACOG)'),
    ('200: A "Blueberry Muffin" rash in a neonate is caused by:', '["Extramedullary hematopoiesis in the skin", "Malignant melanoma", "Petechiae from thrombocytopenia", "Allergic reaction"]', 0, 'Classically seen in congenital Rubella and CMV. (Beckmann)'),
    ('201: Neonatal Abstinence Syndrome (NAS) is primarily caused by maternal use of:', '["Cocaine", "Opiates (Heroin, Methadone, Buprenorphine)", "Marijuana", "Alcohol"]', 1, 'A withdrawal syndrome seen in the first days of life. (Williams)'),
    ('202: Clinical presentation of Opiate withdrawal in a neonate (NAS)?', '["Lethargy and hypotonia", "High-pitched cry, tremors, hyperactive reflexes, poor feeding, diarrhea", "Seizures and microcephaly", "Blindness"]', 1, 'Scored using the Finnegan scoring system. (ACOG)'),
    ('203: First-line pharmacologic treatment for severe Neonatal Abstinence Syndrome?', '["Naloxone", "Morphine or Methadone taper", "Phenobarbital", "Diazepam"]', 1, 'Naloxone is strictly contraindicated as it precipitates acute, severe withdrawal and seizures. (AAP)'),
    ('204: Classic facial features of Fetal Alcohol Syndrome (FAS) include:', '["Macrocephaly, prominent jaw", "Smooth philtrum, thin upper lip, short palpebral fissures", "Cleft lip/palate", "Large ears"]', 1, 'Also causes severe growth restriction and cognitive impairment. (Beckmann)'),
    ('205: Maternal Cocaine use is classically associated with which obstetric/fetal complication?', '["Macrosomia", "Placental abruption and severe fetal growth restriction (FGR)", "Congenital heart defects", "Neural tube defects"]', 1, 'Cocaine is a potent vasoconstrictor causing severe placental insufficiency. (Williams)'),
    ('206: "Omphalocele" is an abdominal wall defect characterized by:', '["Bowel herniating to the right of the umbilicus with NO sac", "Bowel herniating through the umbilicus COVERED by a protective membranous sac", "A defect covered by skin", "Herniation into the chest"]', 1, 'Highly associated with chromosomal abnormalities (Trisomy 13, 18). (ACOG)'),
    ('207: "Gastroschisis" is an abdominal wall defect characterized by:', '["Bowel herniating through the umbilicus in a sac", "Bowel herniating typically to the RIGHT of the umbilicus with NO protective sac", "Covered by skin", "Herniation into the scrotum"]', 1, 'Bowel is exposed to amniotic fluid. Usually isolated, not associated with chromosomal defects. (Beckmann)'),
    ('208: Immediate delivery room management of an infant with Gastroschisis includes:', '["Immediate surgery", "Wrapping the exposed bowel in sterile saline-soaked gauze/plastic to prevent fluid loss and infection", "Applying a tight binder", "Observation"]', 1, 'Fluid loss and hypothermia are major immediate risks. (Williams)'),
    ('209: "Necrotizing Enterocolitis" (NEC) is an ischemic necrosis of the bowel wall that primarily affects:', '["Term infants", "Post-term infants", "Premature infants", "Infants of diabetic mothers"]', 2, 'The most common GI emergency in the NICU. (ACOG)'),
    ('210: The classic abdominal X-ray finding in NEC is:', '["Double bubble sign", "Pneumatosis intestinalis (gas in the bowel wall)", "Clear abdomen", "Multiple air-fluid levels"]', 1, 'Can progress to portal venous gas and perforation (pneumoperitoneum). (Beckmann)'),
    ('211: If a neonate with NEC develops pneumoperitoneum (free air under the diaphragm), the management is:', '["Antibiotics only", "Immediate exploratory laparotomy", "Barium enema", "Observation"]', 1, 'Indicates bowel perforation, requiring surgical resection of the necrotic segment. (Williams)'),
    ('212: "Duodenal Atresia" is strongly associated with which genetic syndrome?', '["Turner syndrome", "Down syndrome (Trisomy 21)", "Cystic Fibrosis", "Marfan syndrome"]', 1, 'Presents with bilious vomiting on the first day of life. (ACOG)'),
    ('213: The classic X-ray finding for Duodenal Atresia is:', '["Pneumatosis intestinalis", "Double bubble sign (gas in the stomach and proximal duodenum)", "Free air", "Gasless abdomen"]', 1, 'No gas passes beyond the atretic duodenum. (Beckmann)'),
    ('214: "Meconium Ileus" (failure to pass meconium due to thick, sticky meconium) is virtually pathognomonic for:', '["Down syndrome", "Cystic Fibrosis", "Hirschsprung disease", "Hypothyroidism"]', 1, 'Often the earliest manifestation of CF. (Williams)'),
    ('215: "Hirschsprung Disease" presents with failure to pass meconium in the first 48 hours and is caused by:', '["Thick meconium", "Absence of ganglion cells in the distal colon/rectum preventing relaxation", "Atresia of the colon", "Viral infection"]', 1, 'The aganglionic segment is tonically contracted. (ACOG)'),
    ('216: How is Hirschsprung Disease definitively diagnosed?', '["Barium enema", "Rectal suction biopsy showing absent ganglion cells", "CT scan", "Ultrasound"]', 1, 'Biopsy is the gold standard. (Beckmann)'),
    ('217: The most effective intervention to reduce the risk of Sudden Infant Death Syndrome (SIDS) is:', '["Prone sleeping", "Supine sleeping (on the back)", "Co-sleeping", "Using soft blankets"]', 1, 'The "Back to Sleep" campaign significantly reduced SIDS rates. (AAP)'),
    ('218: Which of the following is protective against SIDS?', '["Maternal smoking", "Pacifier use at bedtime and breastfeeding", "Overheating the room", "Soft mattresses"]', 1, 'Room-sharing (but NOT bed-sharing) is also protective. (AAP)'),
    ('219: What is the normal trajectory for newborn weight in the first two weeks?', '["Gain 10% then lose 5%", "Lose up to 10% in the first few days, then regain birth weight by 10-14 days", "Weight remains exactly stable", "Lose up to 20%"]', 1, 'Normal physiologic weight loss due to fluid shifts and establishing feeding. (Williams)'),
    ('220: Caput Succedaneum is a scalp swelling that:', '["Does not cross suture lines", "Crosses suture lines", "Is an emergency", "Requires surgery"]', 1, 'It is simply soft tissue edema. (Beckmann)'),
    ('221: Cephalohematoma is a subperiosteal hemorrhage that:', '["Crosses suture lines", "Does not cross suture lines", "Is harmless", "Requires drainage"]', 1, 'Bound by periosteal attachments. (ACOG)'),
    ('222: Subgaleal Hemorrhage is a dangerous bleed that:', '["Does not cross suture lines", "Crosses suture lines and can cause massive blood loss and hemorrhagic shock", "Is benign", "Resolves in 1 day"]', 1, 'Blood accumulates in the loose subaponeurotic space. (Williams)'),
    ('223: Erb-Duchenne palsy involves nerves C5-C6 and presents as:', '["Claw hand", "Arm internally rotated and pronated (Waiter''s tip posture)", "Facial paralysis", "Diaphragmatic paralysis"]', 1, 'Most common brachial plexus injury from shoulder dystocia. (Beckmann)'),
    ('224: Klumpke palsy involves nerves C8-T1 and presents as:', '["Waiter''s tip", "Absent grasp reflex (Claw hand)", "Horner syndrome only", "None of the above"]', 1, 'Can be associated with ipsilateral Horner syndrome. (ACOG)'),
    ('225: The majority of brachial plexus injuries sustained at birth:', '["Require immediate surgery", "Resolve spontaneously within a few months with physical therapy", "Are permanent", "Require amputation"]', 1, 'Conservative management is the initial approach. (Williams)'),
    ('226: A newborn has crepitus over the shoulder and an asymmetric Moro reflex following a difficult vaginal delivery. Diagnosis?', '["Humerus fracture", "Clavicle fracture", "Erb palsy", "Brachial plexus avulsion"]', 1, 'Usually heals spontaneously without intervention. (Beckmann)'),
    ('227: Normal newborn respiratory rate is:', '["20-30 bpm", "40-60 bpm", "60-80 bpm", "12-20 bpm"]', 1, 'Tachypnea is > 60 bpm. (ACOG)'),
    ('228: Normal newborn resting heart rate is:', '["60-100 bpm", "110-160 bpm", "160-200 bpm", "80-120 bpm"]', 1, 'Lower rates (bradycardia) require stimulation or resuscitation. (NRP)'),
    ('229: An infant born at 39 weeks has central cyanosis. Pulse oximetry reads 80% on room air. 100% oxygen is administered for 10 minutes via a hood, but the PaO2 only rises from 40 to 45 mmHg. What is the most likely category of disease?', '["Pulmonary disease (e.g., RDS)", "Cyanotic Congenital Heart Disease (fixed right-to-left shunt)", "Neurologic disease", "Normal transition"]', 1, 'This is a failed "Hyperoxia Test". (Williams)'),
    ('230: In a newborn, a scaphoid abdomen and respiratory distress should immediately prompt suspicion for:', '["Pneumothorax", "Congenital Diaphragmatic Hernia", "TEF", "Choanal Atresia"]', 1, 'The abdominal contents are in the chest cavity. (Beckmann)'),
    ('231: The definitive diagnosis of Choanal Atresia is typically made by:', '["Inability to pass a catheter through the nares", "CT scan of the head/face", "X-ray of the chest", "Blood culture"]', 1, 'Often confirmed later with CT or endoscopy, but catheter failure is the clinical test. (ACOG)'),
    ('232: "Tracheomalacia" presents with:', '["Cyanosis", "Stridor that worsens with agitation and improves when prone", "Vomiting", "Diarrhea"]', 1, 'Due to a floppy trachea that collapses during respiration. (Williams)'),
    ('233: A 2-week-old infant, born prematurely at 28 weeks, develops temperature instability, abdominal distension, and bloody stools. Diagnosis?', '["Necrotizing Enterocolitis (NEC)", "Intussusception", "Volvulus", "Gastroenteritis"]', 0, 'Classic presentation of NEC in a premature infant. (Beckmann)'),
    ('234: Which vitamin is given prophylactically to prevent hemorrhagic disease of the newborn?', '["Vitamin A", "Vitamin K", "Vitamin E", "Vitamin D"]', 1, 'Routine IM injection at birth. (ACOG)'),
    ('235: The primary purpose of applying Erythromycin ointment to a newborn''s eyes is to prevent:', '["Viral conjunctivitis", "Gonococcal ophthalmia neonatorum", "Chlamydial conjunctivitis", "Cataracts"]', 1, 'It is not reliable for preventing Chlamydial infection. (CDC)'),
    ('236: If an infant is born to an HIV-positive mother who has an undetectable viral load on ART, what is the infant''s immediate management?', '["Nothing", "Zidovudine (AZT) prophylaxis for 4 weeks", "Multi-drug ART", "Immediate HIV testing"]', 1, 'Standard prophylaxis for low-risk HIV exposure. (ACOG)'),
    ('237: If an infant is born to an HIV-positive mother who received NO prenatal care or ART, what is the infant''s management?', '["Zidovudine alone", "Multi-drug antiretroviral prophylaxis (e.g., Zidovudine + Lamivudine + Nevirapine)", "Nothing", "Vaccine"]', 1, 'High-risk exposure requires presumptive HIV therapy. (Williams)'),
    ('238: Can an HIV-positive mother breastfeed in the United States?', '["Yes, always", "No, it is generally not recommended in the US where safe formula is available", "Only if her viral load is zero", "Yes, if she takes AZT"]', 1, 'Risk of transmission through breast milk is avoided if safe alternatives exist. (AAP/ACOG)'),
    ('239: Can a Hepatitis B-positive mother breastfeed?', '["Yes, once the infant receives the HepB vaccine and HBIG", "No, it is strictly contraindicated", "Only if her viral load is low", "Only after 6 months"]', 0, 'Breastfeeding is safe once prophylaxis is administered. (AAP)'),
    ('240: Can a mother with active Hepatitis C breastfeed?', '["No", "Yes, unless her nipples are cracked and bleeding", "Only if she is on antiviral therapy", "Never"]', 1, 'HCV is not transmitted through intact breast milk. (ACOG)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;
END $$;
COMMIT;
