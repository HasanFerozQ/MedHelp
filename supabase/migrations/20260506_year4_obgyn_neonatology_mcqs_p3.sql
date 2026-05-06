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

    -- Batch 3: 121-180 (Respiratory and Cardiac Anomalies, Congenital Infections)
    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('121: In neonatal resuscitation, what is the compression to ventilation ratio?', '["30 to 2", "15 to 2", "3 to 1", "5 to 1"]', 2, 'Ensures 90 compressions and 30 breaths per minute. (NRP)'),
    ('122: When suctioning a newborn during resuscitation, what is the correct order?', '["Nose then mouth", "Mouth then nose", "Deep tracheal suction first", "Stomach then mouth"]', 1, '"M" comes before "N". Prevents aspiration of oral secretions when the nose is stimulated. (NRP)'),
    ('123: What is the preferred method for assessing neonatal heart rate during resuscitation?', '["Palpating the umbilical cord", "Auscultating with a stethoscope", "Pulse oximeter", "ECG monitor"]', 3, 'ECG provides the most rapid and accurate heart rate. (NRP)'),
    ('124: At what heart rate should positive pressure ventilation (PPV) be initiated?', '["Below 120 bpm", "Below 100 bpm", "Below 60 bpm", "Below 80 bpm"]', 1, 'PPV is the primary intervention for a heart rate under 100. (NRP)'),
    ('125: When should chest compressions be initiated?', '["Heart rate below 100", "Heart rate below 60 despite at least 30 seconds of effective PPV", "Immediately if baby is apneic", "If baby is cyanotic"]', 1, 'Effective ventilation must be established before starting compressions. (NRP)'),
    ('126: What is the initial dose of intravenous epinephrine (1:10,000) for neonatal resuscitation?', '["0.1 to 0.3 mL/kg", "0.5 to 1 mL/kg", "1 to 2 mL/kg", "0.01 to 0.03 mL/kg"]', 0, 'Given rapidly, followed by a normal saline flush. (NRP)'),
    ('127: A neonate is born at 41 weeks through thick meconium. The baby is vigorous, crying, and HR is 140. Next step?', '["Intubate and suction trachea", "Routine care (dry, warm, skin-to-skin)", "Start PPV", "Administer surfactant"]', 1, 'Vigorous infants born through meconium do not need specialized resuscitation. (NRP)'),
    ('128: A neonate born through meconium is floppy, apneic, and has a HR of 80. Next step?', '["Immediate intubation and tracheal suctioning", "Clear mouth and nose with a bulb syringe, dry, stimulate, and begin PPV", "Start chest compressions", "Give epinephrine"]', 1, 'Current NRP guidelines emphasize initiating PPV rapidly over routine deep tracheal suctioning for non-vigorous infants. (NRP)'),
    ('129: What is the target pre-ductal oxygen saturation at 5 minutes of life?', '["60-65%", "80-85%", "90-95%", "95-100%"]', 1, 'Saturation slowly rises over the first 10 minutes. (NRP)'),
    ('130: What is the most common cause of neonatal respiratory distress?', '["Transient Tachypnea of the Newborn (TTN)", "Respiratory Distress Syndrome (RDS)", "Meconium Aspiration", "Pneumonia"]', 0, 'Especially common in term infants delivered by C-section. (Williams)'),
    ('131: Pathophysiology of TTN involves:', '["Surfactant deficiency", "Delayed resorption of fetal lung fluid", "Bacterial infection", "Meconium blocking airways"]', 1, 'Resolves quickly with supportive care. (Beckmann)'),
    ('132: A premature infant (28 weeks) develops severe respiratory distress shortly after birth. X-ray shows a "ground-glass" appearance and air bronchograms. Diagnosis?', '["TTN", "RDS", "Pneumonia", "Meconium Aspiration"]', 1, 'Classic presentation of surfactant deficiency. (ACOG)'),
    ('133: Surfactant is primarily produced by which cells?', '["Type I pneumocytes", "Type II pneumocytes", "Goblet cells", "Macrophages"]', 1, 'Starts around 24 weeks but peaks much later in gestation. (Williams)'),
    ('134: How does antenatal betamethasone prevent RDS?', '["It kills bacteria", "It accelerates the maturation of Type II pneumocytes and surfactant production", "It dries up lung fluid", "It dilates the bronchi"]', 1, 'Given to mothers at risk of preterm delivery. (ACOG)'),
    ('135: What is the classic X-ray finding in Meconium Aspiration Syndrome?', '["Clear lungs", "Ground glass opacities", "Patchy infiltrates, hyperinflation, and flattening of the diaphragm", "Small lung volumes"]', 2, 'Air trapping occurs due to the ball-valve effect of meconium plugs. (Beckmann)'),
    ('136: A neonate presents with a scaphoid abdomen and severe respiratory distress at birth. Breath sounds are absent on the left. Diagnosis?', '["Pneumothorax", "Congenital Diaphragmatic Hernia (CDH)", "TEF", "RDS"]', 1, 'Bowel herniates into the chest, compressing the lung. (Williams)'),
    ('137: In Congenital Diaphragmatic Hernia, what intervention is strictly contraindicated?', '["Intubation", "Bag-mask ventilation (PPV)", "Gastric tube placement", "Chest X-ray"]', 1, 'PPV inflates the stomach and bowel in the chest, further compressing the lungs. Immediate intubation is required. (ACOG)'),
    ('138: PPHN (Persistent Pulmonary Hypertension of the Newborn) results in what type of shunt?', '["Left-to-right through the PDA and PFO", "Right-to-left through the PDA and PFO", "No shunting", "Bidirectional only"]', 1, 'High pulmonary vascular resistance forces unoxygenated blood into the systemic circulation. (Williams)'),
    ('139: Cyanosis that worsens with feeding and improves with crying is classic for:', '["TEF", "Choanal Atresia", "PPHN", "CDH"]', 1, 'When the infant cries, they breathe through their mouth, bypassing the blocked nasal passages. (Beckmann)'),
    ('140: A newborn has excessive drooling and chokes immediately upon the first feeding. A nasogastric tube cannot be passed. Diagnosis?', '["Pyloric Stenosis", "Esophageal Atresia with Tracheoesophageal Fistula (TEF)", "Duodenal Atresia", "Hirschsprung"]', 1, 'The pouch is blind, and saliva/milk spills over into the trachea. (Williams)'),
    ('141: What X-ray finding is seen in the most common type of TEF (Type C: Esophageal atresia with distal fistula)?', '["Air in the stomach and intestines", "Gasless abdomen", "Double bubble sign", "Pneumatosis intestinalis"]', 0, 'Air passes from the trachea through the distal fistula into the stomach. (Beckmann)'),
    ('142: "VACTERL" association includes anomalies of:', '["Vertebral, Anal, Cardiac, Tracheal, Esophageal, Renal, Limb", "Visual, Auditory, Cardiac, Tracheal, Endocrine, Renal, Liver", "Vaginal, Anal, Cranial, Thyroid, Ear, Rib, Lung", "None"]', 0, 'Infants with TEF should be screened for these other anomalies. (ACOG)'),
    ('143: A term neonate becomes centrally cyanotic on day 2 of life. Oxygen administration does NOT improve the PaO2 significantly. Suspected diagnosis?', '["Pneumonia", "Cyanotic Congenital Heart Disease", "RDS", "TTN"]', 1, 'Failure of the hyperoxia test suggests a fixed anatomical right-to-left shunt. (Williams)'),
    ('144: Which medication is used to keep the ductus arteriosus OPEN in ductal-dependent congenital heart lesions?', '["Indomethacin", "Ibuprofen", "Prostaglandin E1 (Alprostadil)", "Epinephrine"]', 2, 'Maintains ductal patency to ensure systemic or pulmonary blood flow depending on the lesion. (Beckmann)'),
    ('145: Which medication is used to CLOSE a Patent Ductus Arteriosus (PDA) in a premature infant?', '["Prostaglandin E1", "Indomethacin or Ibuprofen", "Acetaminophen", "Albuterol"]', 1, 'NSAIDs inhibit prostaglandin synthesis, promoting closure. (Williams)'),
    ('146: What is the most common cyanotic congenital heart defect presenting in the neonatal period (first few days)?', '["Tetralogy of Fallot", "Transposition of the Great Arteries (TGA)", "VSD", "ASD"]', 1, 'Requires mixing of blood (via PDA or PFO) to survive. (Beckmann)'),
    ('147: The classic X-ray finding of an "egg on a string" heart is seen in:', '["Tetralogy of Fallot", "Transposition of the Great Arteries", "Coarctation of the Aorta", "Ebstein Anomaly"]', 1, 'Narrow mediastinum with a globular heart. (Williams)'),
    ('148: The classic X-ray finding of a "boot-shaped" heart is seen in:', '["Transposition of the Great Arteries", "Tetralogy of Fallot", "VSD", "PDA"]', 1, 'Due to right ventricular hypertrophy and a concave pulmonary artery segment. (Beckmann)'),
    ('149: A newborn has absent femoral pulses and a discrepancy between upper and lower extremity blood pressures. Diagnosis?', '["VSD", "Coarctation of the Aorta", "Tetralogy of Fallot", "PDA"]', 1, 'Narrowing of the aorta usually distal to the left subclavian artery. (Williams)'),
    ('150: A "machine-like" continuous murmur in a premature infant is classic for:', '["VSD", "Patent Ductus Arteriosus (PDA)", "ASD", "Coarctation"]', 1, 'Flow occurs during both systole and diastole. (Beckmann)'),
    ('151: Which screening test is performed on all newborns before discharge to detect critical congenital heart disease (CCHD)?', '["Chest X-ray", "ECG", "Pre-ductal and Post-ductal Pulse Oximetry", "Echocardiogram"]', 2, 'Checks for hypoxia and differential cyanosis (Right hand vs. either foot). (AAP/ACOG)'),
    ('152: Which routine neonatal medication prevents Hemorrhagic Disease of the Newborn?', '["Vitamin K IM", "Vitamin C IV", "Vitamin D drops", "Iron drops"]', 0, 'Newborns lack gut flora to produce Vitamin K, leading to deficiency of factors II, VII, IX, X. (Williams)'),
    ('153: What prophylaxis is given to all newborns to prevent Gonococcal Ophthalmia Neonatorum?', '["Silver nitrate", "Erythromycin ophthalmic ointment", "Oral Azithromycin", "IV Ceftriaxone"]', 1, 'Given shortly after birth. (CDC)'),
    ('154: If an infant develops copious purulent eye discharge on day 3 of life, what is the most likely cause?', '["Chemical conjunctivitis", "Neisseria gonorrhoeae", "Chlamydia trachomatis", "Adenovirus"]', 1, 'Gonorrhea presents early (days 2-5) and is very severe. (Beckmann)'),
    ('155: How is Gonococcal conjunctivitis treated in the neonate?', '["Erythromycin ointment", "A single dose of IM/IV Ceftriaxone", "Oral erythromycin", "Observation"]', 1, 'Requires systemic therapy. (CDC)'),
    ('156: If an infant develops watery to mucopurulent eye discharge on day 10 of life, what is the most likely cause?', '["Neisseria gonorrhoeae", "Chlamydia trachomatis", "Chemical", "HSV"]', 1, 'Chlamydia presents later (days 5-14). (Williams)'),
    ('157: How is Chlamydial conjunctivitis treated in the neonate?', '["Topical erythromycin", "Oral Erythromycin or Azithromycin", "IV Ceftriaxone", "Topical acyclovir"]', 1, 'Systemic therapy is required to clear the infection and prevent chlamydial pneumonia. (CDC)'),
    ('158: Oral erythromycin in neonates carries a known risk of causing:', '["Cataracts", "Infantile Hypertrophic Pyloric Stenosis", "Deafness", "Renal failure"]', 1, 'Macrolides stimulate gut motility receptors and can lead to pyloric hypertrophy. (Beckmann)'),
    ('159: Chemical conjunctivitis from erythromycin ointment typically occurs when?', '["Within 24 hours of birth", "Days 2-5", "Days 5-14", "After 1 month"]', 0, 'Mild, transient, and resolves without treatment. (Williams)'),
    ('160: Routine Hepatitis B vaccination is recommended for all medically stable newborns weighing > 2000g within what timeframe?', '["First 24 hours", "First week", "First month", "At 2 months"]', 0, 'First dose of the series. (AAP)'),
    ('161: If a mother is known to be HBsAg positive, her newborn must receive:', '["HepB vaccine only", "HepB vaccine + HepB Immune Globulin (HBIG) within 12 hours of birth", "HBIG only", "Nothing"]', 1, 'Provides immediate passive and active immunity to prevent vertical transmission. (ACOG/CDC)'),
    ('162: What is the risk of a newborn developing chronic Hepatitis B if infected at birth without prophylaxis?', '["< 5%", "10-20%", "50%", "90%"]', 3, 'Vertical transmission leads to very high rates of chronic infection compared to adult infection. (Williams)'),
    ('163: The newborn metabolic screen (heel prick test) is typically performed at what age?', '["Immediately at birth", "24-48 hours of life", "1 week of life", "1 month"]', 1, 'Allows time for feeding to establish (important for detecting PKU/Galactosemia) but before severe damage occurs. (AAP)'),
    ('164: Untreated Congenital Hypothyroidism leads to:', '["Cretinism (severe intellectual disability and stunted growth)", "Liver failure", "Blindness", "Sepsis"]', 0, 'Maternal thyroid hormone protects the fetus in utero, but symptoms develop after birth. (Beckmann)'),
    ('165: A baby with Galactosemia is absolutely prohibited from:', '["Formula", "Breastfeeding (due to lactose)", "IV fluids", "Iron"]', 1, 'Must use soy or elemental formula. (Williams)'),
    ('166: Physiologic jaundice is primarily unconjugated. It peaks around what day of life in a term infant?', '["Day 1", "Days 3-4", "Day 10", "Day 14"]', 1, 'Resolves entirely by 1-2 weeks. (Beckmann)'),
    ('167: Jaundice occurring within the first 24 hours of life is:', '["Always physiologic", "Always pathologic (warrants immediate workup for hemolysis or sepsis)", "Usually breast milk jaundice", "Harmless"]', 1, 'Requires urgent investigation. (ACOG)'),
    ('168: Breastfeeding jaundice (lack of breast milk jaundice) occurs in the first week and is caused by:', '["Suboptimal intake leading to dehydration and increased enterohepatic circulation", "A factor in the milk", "Hemolysis", "Infection"]', 0, 'Managed by increasing feeding frequency and lactation support. (Williams)'),
    ('169: Breast milk jaundice typically presents when?', '["First 24 hours", "First week", "Second week of life and can last for weeks", "After 2 months"]', 2, 'Thought to be caused by beta-glucuronidases in mature breast milk. (Beckmann)'),
    ('170: Extremely high levels of unconjugated bilirubin can cross the blood-brain barrier and cause:', '["Hydrocephalus", "Kernicterus (Bilirubin encephalopathy)", "Meningitis", "Stroke"]', 1, 'Deposits in the basal ganglia causing permanent choreoathetoid CP and hearing loss. (Williams)'),
    ('171: The primary treatment to lower moderately high unconjugated bilirubin is:', '["Exchange transfusion", "Phototherapy", "Phenobarbital", "IV fluids"]', 1, 'Converts bilirubin to water-soluble isomers that can be excreted. (ACOG)'),
    ('172: If bilirubin levels are dangerously high and approaching neurotoxic levels despite phototherapy, the next step is:', '["Exchange transfusion", "More phototherapy lights", "Stop breastfeeding", "Give antibiotics"]', 0, 'Rapidly removes bilirubin and antibody-coated RBCs from the circulation. (Beckmann)'),
    ('173: ABO incompatibility usually occurs when the mother is type ___ and the baby is type ___ or ___.', '["A, B or O", "O, A or B", "AB, A or B", "Rh-, Rh+"]', 1, 'Maternal anti-A and anti-B IgG antibodies cross the placenta. (Williams)'),
    ('174: A newborn has prolonged jaundice, pale (acholic) stools, dark urine, and an elevated CONJUGATED (direct) bilirubin. Diagnosis?', '["Physiologic jaundice", "Biliary Atresia", "Breast milk jaundice", "ABO incompatibility"]', 1, 'Conjugated hyperbilirubinemia is NEVER physiologic. (Beckmann)'),
    ('175: Treatment for Biliary Atresia?', '["Phototherapy", "Kasai portoenterostomy (ideally before 8 weeks of life)", "Observation", "Ursodiol"]', 1, 'Restores bile flow; many eventually require liver transplant. (Williams)'),
    ('176: Neonatal Hypoglycemia is a major risk for infants of diabetic mothers because of:', '["Maternal insulin crossing the placenta", "Fetal hyperinsulinemia in response to chronic maternal hyperglycemia", "Defective liver enzymes", "None of the above"]', 1, 'When the cord is cut, the glucose supply drops but insulin remains high. (ACOG)'),
    ('177: Typical signs of neonatal hypoglycemia include:', '["Hyperactivity and fever", "Jitters, tremors, lethargy, and poor feeding", "Copious drooling", "Stiff neck"]', 1, 'Can progress to seizures. (Beckmann)'),
    ('178: The first step in managing an asymptomatic neonate with a blood glucose of 35 mg/dL is:', '["Immediate IV D10W bolus", "Enteral feeding (breast/formula) and recheck in 30 minutes", "Glucagon", "Observe"]', 1, 'Feed first if asymptomatic. (AAP)'),
    ('179: The first step in managing a SYMPTOMATIC neonate (e.g., having a seizure) with hypoglycemia is:', '["Feed them", "IV Dextrose bolus (e.g., 2 mL/kg of D10W)", "Glucagon", "Observation"]', 1, 'Requires rapid IV correction. (ACOG)'),
    ('180: Infants of diabetic mothers are also at risk for what hematologic issue due to chronic hypoxia?', '["Anemia", "Polycythemia", "Thrombocytopenia", "Leukemia"]', 1, 'Hypoxia drives EPO production, leading to high RBC mass. (Williams)');

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
