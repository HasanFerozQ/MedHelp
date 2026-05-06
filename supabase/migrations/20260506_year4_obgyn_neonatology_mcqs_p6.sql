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

    -- Batch 6: 301-360 (Advanced Resuscitation, Cardiac, and Congenital Syndromes)
    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('301: In neonatal resuscitation, if the HR is < 100 after 15s of PPV, what is the first troubleshooting step?', '["Start compressions", "Check for chest movement (MR. SOPA)", "Give epinephrine", "Intubate"]', 1, 'Ensure the mask is sealed and the airway is open before escalating. (NRP)'),
    ('302: What is the recommended depth for neonatal chest compressions?', '["1 inch", "One-third of the anterior-posterior diameter of the chest", "Two-thirds of the chest", "2 inches"]', 1, 'Standard depth to provide adequate stroke volume. (NRP)'),
    ('303: Which neonatal heart rate monitor is fastest and most accurate during a code?', '["Pulse oximeter", "Stethoscope", "3-lead ECG", "Palpating cord"]', 2, 'ECG provides a reliable rate within seconds. (NRP)'),
    ('304: At what heart rate threshold do you STOP chest compressions in a neonate?', '["HR > 60 bpm", "HR > 100 bpm", "HR > 120 bpm", "Never"]', 0, 'Once HR is reliably > 60, focus on effective ventilation until HR > 100. (NRP)'),
    ('305: IV Epinephrine dose for neonates?', '["0.01 to 0.03 mg/kg", "0.1 to 0.5 mg/kg", "1 mg/kg", "10 mg/kg"]', 0, 'Concentration 1:10,000 (0.1 mg/mL). (NRP)'),
    ('306: If volume expansion is needed in the delivery room (e.g., due to blood loss), what is the fluid of choice?', '["D5W", "Lactated Ringer", "0.9% Normal Saline (10 mL/kg)", "Albumin"]', 2, 'Crystalloid is the standard for volume expansion. (NRP)'),
    ('307: "Lutembacher Syndrome" involves:', '["ASD and Mitral Stenosis", "VSD and Pulmonary Stenosis", "PDA and ASD", "None"]', 0, 'A specific combination of congenital and acquired heart disease. (Williams)'),
    ('308: What is the most common heart defect in infants with Down Syndrome?', '["VSD", "Atrioventricular Septal Defect (AVSD) / Endocardial Cushion Defect", "ASD", "PDA"]', 1, 'Up to 40-50% of Down syndrome infants have CHD. (Beckmann)'),
    ('309: A "Holosystolic" murmur at the left lower sternal border in a 2-week-old is most likely:', '["ASD", "VSD", "PDA", "Aortic Stenosis"]', 1, 'The most common congenital heart defect overall. (Williams)'),
    ('310: "Eisenmenger Syndrome" occurs when:', '["A left-to-right shunt reverses to right-to-left due to pulmonary hypertension", "A valve closes", "The heart stops", "None"]', 0, 'Results in permanent cyanosis. (Beckmann)'),
    ('311: "Tricuspid Atresia" is a cyanotic defect that REQUIRES what other defects to survive?', '["ASD and VSD", "PDA only", "None", "Bicuspid valve"]', 0, 'Blood must flow from RA to LA (ASD) and then to the lungs (VSD/PDA). (Williams)'),
    ('312: "Total Anomalous Pulmonary Venous Return" (TAPVR) with obstruction presents as:', '["Severe neonatal respiratory distress and cyanosis with a small heart on X-ray", "No symptoms", "Heart failure later", "Murmur only"]', 0, 'A surgical emergency. (Beckmann)'),
    ('313: "Truncus Arteriosus" is associated with which syndrome?', '["Down", "DiGeorge (22q11 deletion)", "Turner", "Fragile X"]', 1, 'Often includes thymus hypoplasia and hypocalcemia. (ACOG)'),
    ('314: DiGeorge Syndrome classic features?', '["CATCH-22: Cardiac defects, Abnormal facies, Thymic hypoplasia, Cleft palate, Hypocalcemia", "Skin rash, Fever", "Obesity", "None"]', 0, 'Due to 3rd and 4th pharyngeal pouch defects. (Williams)'),
    ('315: Newborn with DiGeorge is at risk for seizures due to:', '["Brain bleed", "Hypocalcemia", "Hypoglycemia", "Infection"]', 1, 'Lack of parathyroid glands. (Beckmann)'),
    ('316: "Hypoplastic Left Heart Syndrome" (HLHS) management until surgery?', '["Oxygen", "Prostaglandin E1 to keep the PDA open", "Indomethacin", "Antibiotics"]', 1, 'The PDA is the only source of systemic blood flow. (ACOG)'),
    ('317: Which maternal infection causes fetal "hydrops fetalis" by destroying RBC precursors?', '["Rubella", "Parvovirus B19", "HIV", "CMV"]', 1, 'Causes severe fetal anemia and high-output heart failure. (Williams)'),
    ('318: "Hydrops Fetalis" is defined as fluid in at least _____ fetal compartments.', '["1", "2 (e.g., ascites, pleural effusion, skin edema)", "3", "All"]', 1, 'A sign of severe fetal compromise. (ACOG)'),
    ('319: Immune Hydrops is caused by:', '["Rh alloimmunization", "Infection", "Genetic defect", "Turner syndrome"]', 0, 'Maternal antibodies destroy fetal RBCs. (Beckmann)'),
    ('320: Non-immune Hydrops is most commonly caused by:', '["Rh disease", "Cardiac anomalies, chromosomal defects (e.g., Turner), and infection", "Diabetes", "Smoking"]', 1, 'Now more common than immune hydrops due to RhoGAM. (Williams)'),
    ('321: A neonate with a "double bubble" sign and Down Syndrome should be evaluated for:', '["Duodenal Atresia", "Pyloric Stenosis", "NEC", "Ileus"]', 0, 'Classic association. (Beckmann)'),
    ('322: Most common cause of "Late-onset" bilious vomiting (> 1 week of life)?', '["Duodenal atresia", "Malrotation with midgut volvulus", "Pyloric stenosis", "TEF"]', 1, 'A surgical emergency due to risk of bowel ischemia. (Williams)'),
    ('323: "Intussusception" typically presents when?', '["Birth", "6-24 months of age", "Puberty", "None"]', 1, 'Classic "currant jelly" stools. (Beckmann)'),
    ('324: "Pyloric Stenosis" classically presents with:', '["Bilious vomiting", "Non-bilious, projectile vomiting in a 3-6 week old", "Diarrhea", "Fever"]', 1, 'Vomiting is non-bilious because the obstruction is proximal to the bile duct. (Williams)'),
    ('325: Electrolyte abnormality in Pyloric Stenosis?', '["Metabolic acidosis", "Hypochloremic, hypokalemic metabolic alkalosis", "Hypernatremia", "High potassium"]', 1, 'Due to loss of gastric acid (HCl). (Beckmann)'),
    ('326: Physical exam finding in Pyloric Stenosis?', '["Scaphoid abdomen", "Palpable \"olive-shaped\" mass in the epigastrium", "Bloated belly", "Tender RLQ"]', 1, 'Best felt after the infant has vomited. (Williams)'),
    ('327: "Umbilical Hernia" in a newborn:', '["Needs immediate surgery", "Usually closes spontaneously by age 2-4 years", "Is a sac of bowel", "Is always pathologic"]', 1, 'Common in infants with Down syndrome or hypothyroidism. (Beckmann)'),
    ('328: "Prune Belly Syndrome" (Eagle-Barrett) features?', '["No lungs", "Absent abdominal musculature, undescended testes, and urinary tract anomalies", "High fever", "Rash"]', 1, 'Wrinkled skin on the abdomen. (Williams)'),
    ('329: "Beckwith-Wiedemann Syndrome" features?', '["Small tongue", "Macrosomia, macroglossia, omphalocele, and neonatal hypoglycemia", "Deafness", "Cataracts"]', 1, 'Overgrowth syndrome with risk of Wilms tumor. (ACOG)'),
    ('330: Why does Beckwith-Wiedemann cause hypoglycemia?', '["No liver", "Hyperinsulinism due to pancreatic islet cell hyperplasia", "No sugar in milk", "None"]', 1, 'Fetal/neonatal hyperinsulinemia. (Beckmann)'),
    ('331: Infants with Beckwith-Wiedemann need screening for:', '["Wilms tumor and Hepatoblastoma with abdominal US", "Brain cancer", "Lung cancer", "None"]', 0, 'Screening every 3 months until age 8. (ACOG)'),
    ('332: "Pierre Robin Sequence" features?', '["Big jaw", "Micrognathia (small jaw), glossoptosis (tongue falls back), and cleft palate", "Large ears", "Heart defects"]', 1, 'Can cause severe airway obstruction. (Williams)'),
    ('333: "Potter Sequence" is caused by:', '["Oligohydramnios (usually due to renal agenesis)", "Polyhydramnios", "Infection", "High sugar"]', 0, 'Lack of fluid leads to lung hypoplasia and clubbed feet. (Beckmann)'),
    ('334: Typical facies in Potter Sequence?', '["Small ears", "Flattened nose, recessed chin, and low-set ears (due to compression)", "Big eyes", "None"]', 1, 'Classic description of "Potter facies". (Williams)'),
    ('335: "Wessel''s Rule of Three" defines:', '["Sepsis", "Infantile Colic (crying > 3 hrs/day, > 3 days/week, > 3 weeks)", "Growth", "Apgar"]', 1, 'Diagnosis of exclusion in a healthy, thriving baby. (Beckmann)'),
    ('336: "Meckel Diverticulum" rule of 2s?', '["2% of population, 2 feet from ileocecal valve, 2 inches long, 2 types of tissue, presents by age 2", "2 hearts", "2 lungs", "None"]', 0, 'Most common congenital GI anomaly. (Williams)'),
    ('337: Most common presentation of Meckel Diverticulum in children?', '["Pain", "Painless rectal bleeding (painless hematochezia)", "Vomiting", "Fever"]', 1, 'Due to acid production from ectopic gastric mucosa. (Beckmann)'),
    ('338: "Biliary Atresia" should be suspected in any infant with jaundice persisting beyond:', '["24 hours", "3 days", "2 weeks", "1 month"]', 2, 'Especially if the direct bilirubin is elevated. (ACOG)'),
    ('339: "Alagille Syndrome" features?', '["No bile ducts (paucity), butterfly vertebrae, and peripheral pulmonic stenosis", "Blindness", "Deafness", "None"]', 0, 'Genetic cause of neonatal cholestasis. (Williams)'),
    ('340: Neonatal jaundice and a "positive Coombs test" suggests:', '["Physiologic jaundice", "Immune-mediated hemolysis (ABO or Rh)", "Biliary atresia", "Sepsis"]', 1, 'Antibodies are on the red cells. (Beckmann)'),
    ('341: "Crigler-Najjar Syndrome Type I" is:', '["Mild jaundice", "Total absence of UDP-GT, leading to severe kernicterus and death without transplant", "Biliary blockage", "None"]', 1, 'Autosomal recessive, very rare. (Williams)'),
    ('342: "Gilbert Syndrome" involves:', '["No enzyme", "Mildly reduced UDP-GT activity, causing intermittent unconjugated jaundice during stress", "Liver failure", "None"]', 1, 'Benign condition. (Beckmann)'),
    ('343: "Dubin-Johnson Syndrome" causes:', '["Unconjugated jaundice", "Conjugated hyperbilirubinemia with a black-colored liver", "Liver failure", "None"]', 1, 'Defect in bilirubin excretion into bile. (Williams)'),
    ('344: "Rotor Syndrome" is similar to Dubin-Johnson but the liver is:', '["Black", "Normal in color", "Green", "Red"]', 1, 'Both are benign causes of conjugated hyperbilirubinemia. (Beckmann)'),
    ('345: What is the most common cause of neonatal mortality worldwide?', '["Infection", "Complications of prematurity", "Congenital anomalies", "SIDS"]', 1, 'Preterm birth is the leading cause. (WHO)'),
    ('346: Neonatal "Hypocalcemia" in a term infant is often associated with:', '["Maternal Diabetes or Hypoparathyroidism", "High milk intake", "Sunlight", "None"]', 0, 'Magnesium deficiency can also cause it. (Williams)'),
    ('347: Sign of hypocalcemia?', '["Lethargy", "Jitteriness, tremors, and twitching", "Coma", "Rash"]', 1, 'Can also cause prolonged QT on ECG. (Beckmann)'),
    ('348: "Osteopenia of Prematurity" is due to:', '["Vitamin C deficiency", "Inadequate calcium and phosphorus accretion in the third trimester", "Too much exercise", "None"]', 1, 'Premature infants miss the peak bone loading phase. (Williams)'),
    ('349: "Vitamin D" deficiency in older infants causes:', '["Scurvy", "Rickets (bowed legs, rachitic rosary)", "Beriberi", "Pellagra"]', 1, 'Prevented by 400 IU/day for all breastfed babies. (AAP)'),
    ('350: "Vitamin K" deficiency bleeding (VKDB) "Late" form occurs at:', '["24 hours", "2-7 days", "2 weeks to 6 months", "Puberty"]', 2, 'Often associated with exclusive breastfeeding and failure to give Vitamin K at birth. (ACOG)'),
    ('351: "Anemia of Prematurity" is:', '["Normal", "Normocytic normochromic anemia due to blunted EPO response to hypoxia", "Microcytic", "Hemolytic"]', 1, 'Usually occurs at 4-8 weeks of life. (Williams)'),
    ('352: Most common cause of neonatal "Thyrotoxicosis"?', '["Pituitary tumor", "Maternal Graves disease (transplacental passage of TSI)", "Thyroid cancer", "None"]', 1, 'Usually self-limited as maternal antibodies clear. (Beckmann)'),
    ('353: "Neonatal Lupus" is caused by maternal:', '["Anti-Ro (SSA) and Anti-La (SSB) antibodies", "Anti-dsDNA", "Anti-Smith", "None"]', 0, 'Can cause permanent congenital heart block. (ACOG)'),
    ('354: Most serious complication of Neonatal Lupus?', '["Skin rash (annular)", "Congenital Third-Degree Heart Block", "Anemia", "Liver failure"]', 1, 'Requires permanent pacemaker. (Williams)'),
    ('355: "Diamond-Blackfan Anemia" features:', '["Pure red cell aplasia and thumb anomalies", "Low platelets", "Low WBCs", "None"]', 0, 'Congenital hypoplastic anemia. (Beckmann)'),
    ('356: "Fanconi Anemia" features:', '["Pancytopenia, short stature, and absent/hypoplastic thumbs", "High WBCs", "Big heart", "None"]', 0, 'Risk of AML and other cancers. (Williams)'),
    ('357: "Wiskott-Aldrich Syndrome" triad?', '["Thrombocytopenia, Eczema, and Immunodeficiency", "Fever, Rash, Pain", "None", "Blindness"]', 0, 'X-linked, small platelets. (Beckmann)'),
    ('358: "SCID" (Severe Combined Immunodeficiency) presents with:', '["Chronic diarrhea, failure to thrive, and severe recurrent infections (bacterial, viral, fungal)", "Just a cold", "Obesity", "None"]', 0, 'Absent T cells. A pediatric emergency. (Williams)'),
    ('359: Why should SCID babies NOT receive the Rotavirus vaccine?', '["It doesn''t work", "It is a live vaccine and can cause fatal infection", "It causes diarrhea", "None"]', 1, 'Live vaccines are contraindicated in T-cell deficiency. (ACOG/AAP)'),
    ('360: Newborn with "white pupillary reflex" (leukocoria)?', '["Cataract or Retinoblastoma", "Normal", "Glaucoma", "Myopia"]', 0, 'Needs urgent ophthalmology referral. (Beckmann)');

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
