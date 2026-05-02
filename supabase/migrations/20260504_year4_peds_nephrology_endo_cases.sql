BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Pediatric Nephrology & Endo
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "peds-nephro-endo" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Minimal Change Disease - MCD (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Puffy Eyes and Swelling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Puffy Eyes and Swelling', 'A 4-year-old child presents with sudden-onset periorbital edema and scrotal swelling. A urinalysis shows 4+ protein.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 4-year-old child presents with sudden-onset periorbital edema and scrotal swelling. A urinalysis shows 4+ protein.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["PSGN", "Minimal Change Disease (MCD)", "IgA Nephropathy", "None"]', 1, 'MCD is the most common cause of nephrotic syndrome in children.'),
    (v_case_id, 'What is the hallmark finding on electron microscopy for MCD?', '["Humps", "Effacement (fusion) of podocyte foot processes", "Thickened GBM", "None"]', 1, 'Foot process effacement is the characteristic ultrastructural finding.'),
    (v_case_id, 'What is the first-line treatment for a child with suspected MCD?', '["Antibiotics", "Corticosteroids (Prednisone)", "ACE inhibitors", "None"]', 1, 'MCD is exquisitely steroid-sensitive in over 90% of pediatric cases.');

    ---------------------------------------------------------------------------
    -- CASE 02: PSGN - Post-Strep Glomerulonephritis (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tea-Colored Urine' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tea-Colored Urine', 'A 7-year-old has dark, \"tea-colored\" urine and hypertension two weeks after a sore throat.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tea-Colored Urine', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Minimal Change", "Post-Streptococcal Glomerulonephritis (PSGN)", "UTI", "None"]', 1, 'PSGN is a nephritic syndrome occurring after a Strep infection.'),
    (v_case_id, 'What classic laboratory finding is seen in the early phase of PSGN?', '["Low C3 complement level", "High C3", "Low Sodium", "None"]', 0, 'Consumption of complement by immune complexes leads to low C3 levels for 6-8 weeks.'),
    (v_case_id, 'Does treatment of the initial Strep infection prevent PSGN?', '["Yes", "No, it prevents rheumatic fever but not PSGN", "Maybe", "None"]', 1, 'PSGN can still occur despite timely antibiotic treatment for the pharyngitis.');

    ---------------------------------------------------------------------------
    -- CASE 03: Hemolytic Uremic Syndrome - HUS (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bloody Diarrhea and Renal Failure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bloody Diarrhea and Renal Failure', 'A 3-year-old had bloody diarrhea 5 days ago and now presents with pallor, low platelets, and oliguria.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bloody Diarrhea and Renal Failure', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic triad of HUS?', '["Fever, Rash, Cough", "Microangiopathic hemolytic anemia, Thrombocytopenia, and Acute Renal Failure", "Pain, Jaundice, Fever", "None"]', 1, 'HUS is most commonly caused by Shiga toxin-producing E. coli (O157:H7).'),
    (v_case_id, 'What is seen on the peripheral blood smear in HUS?', '["Heinz bodies", "Schistocytes (fragmented RBCs)", "Auer rods", "None"]', 1, 'RBCs are sheared as they pass through fibrin-clotted microvasculature.'),
    (v_case_id, 'Should you give antibiotics for E. coli O157:H7 diarrhea?', '["Yes", "No, it may increase the risk of developing HUS by causing toxin release", "Maybe", "None"]', 1, 'Antibiotics and anti-motility agents are avoided in suspected EHEC.');

    ---------------------------------------------------------------------------
    -- CASE 04: Posterior Urethral Valves - PUV (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Neonatal Urinary Obstruction' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Neonatal Urinary Obstruction', 'A newborn male infant has a weak urinary stream and a palpable midline abdominal mass (distended bladder).', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Neonatal Urinary Obstruction', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Wilms Tumor", "Posterior Urethral Valves (PUV)", "Polycystic Kidney", "None"]', 1, 'PUVs are the most common cause of bladder outlet obstruction in male infants.'),
    (v_case_id, 'What is the definitive diagnostic test?', '["Ultrasound", "Voiding Cystourethrogram (VCUG)", "CT scan", "None"]', 1, 'VCUG shows the dilated posterior urethra and the valve obstruction.'),
    (v_case_id, 'What is the primary prenatal ultrasound finding suggestive of PUV?', '["Small heart", "Bilateral hydronephrosis and a \"keyhole\" sign of the bladder", "Large liver", "None"]', 1, 'The dilated urethra and bladder create a keyhole shape on ultrasound.');

    ---------------------------------------------------------------------------
    -- CASE 05: Vesicoureteral Reflux - VUR (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Recurrent UTIs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Recurrent UTIs', 'A 2-year-old girl has had three episodes of pyelonephritis despite being healthy otherwise.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Recurrent UTIs', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely underlying anatomical issue?', '["PUV", "Vesicoureteral Reflux (VUR)", "Stone", "None"]', 1, 'Retrograde flow of urine from the bladder into the ureters increases the risk of kidney infection.'),
    (v_case_id, 'What is the grading system for VUR?', '["A to D", "Grade I to V", "1 to 10", "None"]', 1, 'Grade V is the most severe, with massive dilation and tortuosity.'),
    (v_case_id, 'What is the concern with untreated high-grade VUR and recurrent infections?', '["Weight gain", "Renal scarring and eventual chronic kidney disease", "Diabetes", "None"]', 1, 'Infection in the presence of reflux causes parenchymal damage.');

    ---------------------------------------------------------------------------
    -- CASE 06: Henoch-Schönlein Purpura Nephritis (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The IgA Vasculitis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The IgA Vasculitis', 'A child with a palpable purpuric rash on the legs and joint pain now has hematuria.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The IgA Vasculitis', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying pathology of HSP?', '["IgE allergy", "IgA immune complex deposition in small vessels", "Viral infection", "None"]', 1, 'HSP is a small-vessel vasculitis.'),
    (v_case_id, 'What determines the long-term prognosis in children with HSP?', '["The size of the rash", "The severity of renal involvement (Nephritis)", "The joint pain", "None"]', 1, 'While the rash and joints recover, renal damage can be permanent.'),
    (v_case_id, 'What is seen on kidney biopsy in severe HSP nephritis?', '["Normal", "IgA deposits in the mesangium", "Bacterial growth", "None"]', 1, 'HSP nephritis is histologically identical to IgA nephropathy.');

    ---------------------------------------------------------------------------
    -- CASE 07: Alport Syndrome (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Can''t See, Can''t Pee, Can''t Hear' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Can''t See, Can''t Pee, Can''t Hear', 'An 8-year-old boy has persistent microscopic hematuria and sensorineural hearing loss.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Can''t See, Can''t Pee, Can''t Hear', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["PSGN", "Alport Syndrome", "Minimal Change", "None"]', 1, 'Alport syndrome is a genetic defect in Type IV Collagen.'),
    (v_case_id, 'What is the most common mode of inheritance for Alport Syndrome?', '["Autosomal Dominant", "X-linked Dominant", "Recessive", "None"]', 1, 'X-linked dominant is the most frequent form.'),
    (v_case_id, 'What is seen on the GBM on electron microscopy in Alport?', '["Normal", "Alternating thin and thick areas (\"Basket-weave\" appearance)", "Humps", "None"]', 1, 'The defect in collagen IV leads to progressive thinning and splitting of the basement membrane.');

    ---------------------------------------------------------------------------
    -- CASE 08: Renal Tubular Acidosis - RTA Type 1 (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Failure to Thrive and Acidosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Failure to Thrive and Acidosis', 'A 2-year-old with poor growth has a normal anion gap metabolic acidosis and a high urinary pH (> 5.5).', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Failure to Thrive and Acidosis', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely type of RTA?', '["Type 2", "Type 1 (Distal RTA)", "Type 4", "None"]', 1, 'Distal RTA involves a defect in H+ secretion, leading to alkaline urine despite systemic acidosis.'),
    (v_case_id, 'What is a common skeletal complication of Type 1 RTA?', '["Broken bones", "Nephrocalcinosis and Rickets", "Short fingers", "None"]', 1, 'Alkaline urine and high calcium excretion lead to kidney stones and bone demineralization.'),
    (v_case_id, 'What is the primary treatment for RTA?', '["Antibiotics", "Bicarbonate or Citrate supplementation", "Diuretics", "None"]', 1, 'Replacing the lost base corrects the acidosis and allows for normal growth.');

    ---------------------------------------------------------------------------
    -- CASE 09: Type 1 Diabetes Mellitus (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Three Ps' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Three Ps', 'A 10-year-old child presents with polydipsia, polyuria, polyphagia, and 10 lbs of weight loss.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Three Ps', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Type 2 Diabetes", "Type 1 Diabetes Mellitus (T1DM)", "DI", "None"]', 1, 'T1DM is the most common form of diabetes in children, caused by autoimmune destruction of beta cells.'),
    (v_case_id, 'What antibodies are frequently checked in new-onset T1DM?', '["IgA", "Anti-GAD65, Insulin Autoantibodies (IAA), and IA-2", "Anti-nuclear", "None"]', 1, 'These confirm the autoimmune etiology.'),
    (v_case_id, 'What is the only definitive treatment for T1DM?', '["Metformin", "Exogenous Insulin", "Diet alone", "None"]', 1, 'There is an absolute insulin deficiency.');

    ---------------------------------------------------------------------------
    -- CASE 10: Diabetic Ketoacidosis - DKA (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Fruity Breath and Distress' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Fruity Breath and Distress', 'A child with T1DM presents with vomiting, deep rapid breathing (Kussmaul), and a blood glucose of 450.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Fruity Breath and Distress', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the biochemical definition of DKA?', '["Sugar > 200", "BG > 200, pH < 7.3, and Bicarbonate < 15 with ketonemia/ketonuria", "Ketones in urine only", "None"]', 1, 'DKA is a true metabolic emergency.'),
    (v_case_id, 'What is the most common cause of death in pediatric DKA?', '["Hypoglycemia", "Cerebral Edema", "Infection", "None"]', 1, 'Rapid shifts in osmolality during treatment can trigger brain swelling.'),
    (v_case_id, 'What electrolyte must be carefully monitored and replaced even if serum levels are \"normal\" in DKA?', '["Sodium", "Potassium", "Calcium", "None"]', 1, 'Acidosis shifts K out of cells, so serum K looks normal despite a massive total body deficit.');

    ---------------------------------------------------------------------------
    -- CASE 11: Congenital Hypothyroidism (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Large Tongue and Floppy Baby' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Large Tongue and Floppy Baby', 'An infant who missed her newborn screen has a large tongue (macroglossia), umbilical hernia, and persistent jaundice.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Large Tongue and Floppy Baby', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Down syndrome", "Congenital Hypothyroidism (Cretinism)", "Sepsis", "None"]', 1, 'Early detection via newborn screen is vital for brain development.'),
    (v_case_id, 'What is the most common cause of congenital hypothyroidism?', '["Iodine deficiency", "Thyroid dysgenesis (ectopic or absent gland)", "Maternal meds", "None"]', 1, 'The gland fails to develop or migrate correctly.'),
    (v_case_id, 'What happens if treatment is delayed past the first few weeks of life?', '["Nothing", "Permanent intellectual disability", "Weight loss", "None"]', 1, 'Thyroid hormone is essential for neonatal brain myelination.');

    ---------------------------------------------------------------------------
    -- CASE 12: Congenital Adrenal Hyperplasia - CAH (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ambiguous Genitalia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ambiguous Genitalia', 'A newborn girl has an enlarged clitoris and fused labia. She is found to have low sodium and high potassium.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Ambiguous Genitalia', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common enzyme deficiency in CAH?', '["11-hydroxylase", "21-hydroxylase deficiency", "17-hydroxylase", "None"]', 1, 'It accounts for > 90% of CAH cases.'),
    (v_case_id, 'What hormone is elevated and used for screening in CAH?', '["Cortisol", "17-hydroxyprogesterone (17-OHP)", "Aldosterone", "None"]', 1, 'The block in the pathway leads to accumulation of 17-OHP.'),
    (v_case_id, 'Why is the \"salt-wasting\" form of CAH a medical emergency?', '["It causes rash", "Lack of aldosterone leads to life-threatening hyponatremia, hyperkalemia, and shock", "Fever", "None"]', 1, 'Volume depletion and electrolyte collapse happen rapidly in the first 2 weeks of life.');

    ---------------------------------------------------------------------------
    -- CASE 13: Constitutional Delay of Growth and Puberty - CDGP (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Late Bloomer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Late Bloomer', 'A 14-year-old boy is the shortest in his class. His father had a growth spurt at age 17.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Late Bloomer', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["GH deficiency", "Constitutional Delay of Growth and Puberty (CDGP)", "Turner", "None"]', 1, 'CDGP is a normal variant; the \"late bloomer\" will reach a normal adult height.'),
    (v_case_id, 'What is the characteristic bone age finding in CDGP?', '["Bone age = Chronological age", "Bone age is delayed (behind chronological age)", "Advanced bone age", "None"]', 1, 'A delayed bone age indicates remaining growth potential.'),
    (v_case_id, 'How do you distinguish CDGP from Genetic Short Stature?', '["Blood test", "In CDGP bone age is delayed; in genetic short stature bone age matches chronological age", "Wait", "None"]', 1, 'Genetic short stature children are following their family curve with no delay in maturation.');

    ---------------------------------------------------------------------------
    -- CASE 14: Precocious Puberty (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Puberty too Early' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Puberty too Early', 'A 6-year-old girl has breast development and advanced bone age.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Puberty too Early', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what age is puberty considered \"precocious\" in girls?', '["< 10 years", "< 8 years", "< 12 years", "None"]', 1, 'For boys, the cut-off is 9 years.'),
    (v_case_id, 'What is the difference between Central and Peripheral precocious puberty?', '["Location", "Central is GnRH-dependent (early activation of the axis); Peripheral is GnRH-independent (exogenous/tumor hormone)", "No difference", "None"]', 1, 'Central PP requires brain imaging to rule out hypothalamic tumors.'),
    (v_case_id, 'What is the most common cause of TRUE (Central) precocious puberty in girls?', '["Brain tumor", "Idiopathic (unknown)", "Diet", "None"]', 1, 'In girls, it is mostly idiopathic; in boys, an underlying brain lesion is much more likely.');

    ---------------------------------------------------------------------------
    -- CASE 15: Turner Syndrome - Endocrine (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Short Stature in a Girl' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Short Stature in a Girl', 'A 12-year-old girl has not started puberty and is well below the 3rd percentile for height.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Short Stature in a Girl', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely karyotype?', '["46,XX", "45,X (Turner Syndrome)", "47,XXY", "None"]', 1, 'Turner syndrome is a common cause of short stature and primary amenorrhea.'),
    (v_case_id, 'What is the classic laboratory finding for gonadotropins in Turner Syndrome?', '["Low FSH/LH", "High FSH and LH (Hypergonadotropic hypogonadism)", "Normal", "None"]', 1, 'The ovaries fail (streak ovaries), so the pituitary pumps out more FSH/LH to compensate.'),
    (v_case_id, 'What hormone treatment is started early in Turner syndrome to improve final height?', '["Estrogen", "Growth Hormone (GH)", "Thyroid", "None"]', 1, 'Early GH therapy is standard of care.');

    ---------------------------------------------------------------------------
    -- CASE 16: Rickets - Vitamin D Deficiency (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bowed Legs' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bowed Legs', 'An exclusively breastfed 12-month-old infant has bowing of the legs and a \"beading\" feel to the ribs.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bowed Legs', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Genetic bowing", "Vitamin D Deficiency Rickets", "CP", "None"]', 1, 'Breast milk is low in Vitamin D; infants require 400 IU/day supplementation.'),
    (v_case_id, 'What are the classic radiographic findings of rickets?', '["Broken bones", "Fraying and cupping of the metaphyses", "Cysts", "None"]', 1, 'The growth plates are widened and irregular.'),
    (v_case_id, 'What is the term for the beading of the ribs in rickets?', '["Rib hump", "Rachitic Rosary", "Cough", "None"]', 1, 'It is due to expansion of the costochondral junctions.');

    ---------------------------------------------------------------------------
    -- CASE 17: SIADH in Children (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hyponatremia and CNS issues' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hyponatremia and CNS issues', 'A child with meningitis develops a low serum sodium (125) and high urinary concentration.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hyponatremia and CNS issues', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Dehydration", "Syndrome of Inappropriate Antidiuretic Hormone (SIADH)", "Diabetes Insipidus", "None"]', 1, 'Excess ADH leads to water retention and dilutional hyponatremia.'),
    (v_case_id, 'What is the primary treatment for SIADH?', '["More fluids", "Fluid restriction", "Salt tabs only", "None"]', 1, 'Limiting intake allows the body to clear the excess water.'),
    (v_case_id, 'What is a dangerous complication of rapidly correcting severe hyponatremia?', '["Brain swelling", "Central Pontine Myelinolysis (Osmotic Demyelination Syndrome)", "Seizures", "None"]', 1, 'Correction must be gradual (usually < 10-12 mEq in 24 hours).');

    ---------------------------------------------------------------------------
    -- CASE 18: Diabetes Insipidus - DI (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dilute Urine and Thirst' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dilute Urine and Thirst', 'A child with a brain tumor is constantly drinking water and has a urine specific gravity of 1.001.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dilute Urine and Thirst', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["T1DM", "Diabetes Insipidus (DI)", "SIADH", "None"]', 1, 'Lack of ADH (Central) or response to it (Nephrogenic) leads to inability to concentrate urine.'),
    (v_case_id, 'How do you distinguish Central DI from Nephrogenic DI?', '["Blood test", "Desmopressin (dDAVP) challenge test", "MRI", "None"]', 1, 'Central DI responds to dDAVP (urine becomes concentrated); Nephrogenic DI does not.'),
    (v_case_id, 'What electrolyte abnormality is the hallmark of DI when water intake is restricted?', '["Hyponatremia", "Hypernatremia", "High Potassium", "None"]', 1, 'Loss of free water leads to rising serum sodium levels.');

    ---------------------------------------------------------------------------
    -- CASE 19: Orthostatic Proteinuria (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Protein in the Daytime' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Protein in the Daytime', 'A healthy teenager has protein on a random school urinalysis but none on a first-morning void.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Protein in the Daytime', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Minimal Change", "Orthostatic Proteinuria", "Kidney failure", "None"]', 1, 'This is a benign condition common in adolescents where protein is only excreted when upright.'),
    (v_case_id, 'What is the definitive way to diagnose this?', '["Biopsy", "Split urine collection (morning vs. daytime)", "Blood test", "None"]', 1, 'Absence of protein in the first-morning sample is diagnostic.'),
    (v_case_id, 'What is the long-term prognosis for orthostatic proteinuria?', '["Excellent; it is benign and requires no treatment", "Leads to failure", "Poor", "None"]', 0, 'It does not indicate underlying kidney disease.');

    ---------------------------------------------------------------------------
    -- CASE 20: UTI Workup in Infants (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Febrile Infant' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Febrile Infant', 'A 4-month-old girl has an unexplained fever and a positive urine culture (E. coli).', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Febrile Infant', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first imaging step for any infant with their first febrile UTI?', '["VCUG", "Renal and Bladder Ultrasound (RBUS)", "CT", "None"]', 1, 'RBUS checks for gross anatomical abnormalities like hydronephrosis.'),
    (v_case_id, 'When is a VCUG indicated after a UTI?', '["Always", "If the RBUS is abnormal or if it is a second febrile UTI", "Never", "None"]', 1, 'VCUG is more invasive and reserved for higher-risk cases.'),
    (v_case_id, 'What is the gold standard method for collecting urine in a non-toilet-trained infant?', '["Bag specimen", "Urethral catheterization or suprapubic aspiration", "Wait", "None"]', 1, 'Bag specimens have a very high contamination rate.');

    ---------------------------------------------------------------------------
    -- CASE 21: Gynecomastia (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pubertal Breast Development' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pubertal Breast Development', 'A 14-year-old boy is embarrassed by small, tender mounds under his nipples.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pubertal Breast Development', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is pubertal gynecomastia normal?', '["No", "Yes, it occurs in up to 50% of adolescent boys due to estrogen/androgen imbalance", "Only in obesity", "None"]', 1, 'It is usually transient and benign.'),
    (v_case_id, 'What is the typical natural history of pubertal gynecomastia?', '["Permanent", "Usually resolves spontaneously within 6 to 24 months", "Requires surgery", "None"]', 1, 'Reassurance is the primary management.'),
    (v_case_id, 'What should be checked on physical exam in a boy with severe gynecomastia?', '["Testicular exam (to rule out tumors)", "Head size", "Rash", "None"]', 0, 'Testicular tumors can secrete hormones leading to breast development.');

    ---------------------------------------------------------------------------
    -- CASE 22: Fanconi Syndrome (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Total Proximal Loss' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Total Proximal Loss', 'A child has glucose, amino acids, and phosphate in his urine despite normal blood levels.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Total Proximal Loss', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Diabetes", "Fanconi Syndrome", "MCD", "None"]', 1, 'Fanconi syndrome is a generalized dysfunction of the proximal tubule.'),
    (v_case_id, 'What is a common metabolic bone complication of Fanconi syndrome?', '["Bones too strong", "Hypophosphatemic Rickets", "Broken toe", "None"]', 1, 'Wasting of phosphate leads to poor bone mineralization.'),
    (v_case_id, 'What metabolic disease is the most common cause of inherited Fanconi syndrome in children?', '["Diabetes", "Cystinosis", "Wilson disease", "None"]', 1, 'Accumulation of cystine in the proximal tubule causes the damage.');

    ---------------------------------------------------------------------------
    -- CASE 23: Hashimoto Thyroiditis (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Acquired Hypothyroidism' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Acquired Hypothyroidism', 'A 12-year-old girl has a firm, enlarged thyroid (goiter), dry skin, and slowing growth velocity.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acquired Hypothyroidism', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Graves", "Hashimoto Thyroiditis", "Cancer", "None"]', 1, 'Chronic lymphocytic thyroiditis is the most common cause of goiter and hypothyroidism in children.'),
    (v_case_id, 'What antibodies are typically positive in Hashimoto?', '["Anti-GAD", "Anti-thyroid peroxidase (TPO) and Anti-thyroglobulin", "ANA", "None"]', 1, 'These indicate autoimmune destruction of the gland.'),
    (v_case_id, 'What is the classic lab profile for primary hypothyroidism?', '["High TSH, Low Free T4", "Low TSH, High T4", "Normal labs", "None"]', 0, 'The pituitary is trying to stimulate the failing gland.');

    ---------------------------------------------------------------------------
    -- CASE 24: Graves Disease (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hyperthyroidism' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hyperthyroidism', 'A teenager has a racing heart, weight loss despite increased appetite, and bulging eyes (proptosis).', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hyperthyroidism', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Hashimoto", "Graves Disease", "ADHD", "None"]', 1, 'Autoimmune stimulation of the thyroid gland.'),
    (v_case_id, 'What antibody causes Graves disease?', '["Anti-TPO", "Thyroid Stimulating Immunoglobulin (TSI) / TSH-receptor antibody", "Anti-insulin", "None"]', 1, 'TSI mimics TSH and activates the gland.'),
    (v_case_id, 'What is the first-line medical treatment for Graves in children?', '["Radioactive iodine", "Methimazole", "Propylthiouracil (PTU)", "None"]', 1, 'Methimazole is preferred in children due to the lower risk of liver toxicity compared to PTU.');

    ---------------------------------------------------------------------------
    -- CASE 25: Hypoglycemia in Neonates (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Low Sugar in the Newborn' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Low Sugar in the Newborn', 'A large-for-gestational-age (LGA) infant born to a diabetic mother develops jitteriness and a blood sugar of 30.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Low Sugar in the Newborn', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does this infant have hypoglycemia?', '["No milk", "Hyperinsulinism (maternal hyperglycemia led to fetal islet cell hyperplasia)", "Infection", "None"]', 1, 'The baby is making too much insulin in response to the mother''s high sugar levels.'),
    (v_case_id, 'What is the immediate treatment for symptomatic neonatal hypoglycemia?', '["Feeding", "IV Bolus of 10% Dextrose (D10W)", "Insulin", "None"]', 1, 'Rapid glucose replacement is needed to protect the brain.'),
    (v_case_id, 'What is the most common cause of persistent hypoglycemia in infancy?', '["Diabetes", "Congenital Hyperinsulinism", "Starvation", "None"]', 1, 'Abnormal regulation of insulin secretion from the pancreas.');

    ---------------------------------------------------------------------------
    -- CASE 26: Addison Disease (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Adrenal Insufficiency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Adrenal Insufficiency', 'A child has hyperpigmentation (bronzing) of the skin, salt craving, and fatigue.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Adrenal Insufficiency', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary diagnosis?', '["Cushing", "Addison Disease (Primary Adrenal Insufficiency)", "Hypothyroidism", "None"]', 1, 'Loss of adrenal cortical function leads to low cortisol and aldosterone.'),
    (v_case_id, 'Why is the skin hyperpigmented in primary adrenal insufficiency?', '["Dirt", "High ACTH levels (due to lack of feedback) stimulate melanocytes", "Sunburn", "None"]', 1, 'ACTH and MSH share a common precursor (POMC).'),
    (v_case_id, 'What is the definitive diagnostic test for adrenal insufficiency?', '["Random cortisol", "ACTH Stimulation Test", "Urinalysis", "None"]', 1, 'Failure of cortisol to rise after ACTH injection confirms the diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 27: Growth Hormone Deficiency (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Poor Growth Velocity' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Poor Growth Velocity', 'An 8-year-old is crossing percentiles downward on his growth chart. He has a \"cherubic\" face and increased abdominal fat.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Poor Growth Velocity', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["CDGP", "Growth Hormone (GH) Deficiency", "Malnutrition", "None"]', 1, 'Crossing percentiles downward is a pathological growth pattern.'),
    (v_case_id, 'What screening lab test is used for GH deficiency?', '["Random GH level", "Insulin-like Growth Factor 1 (IGF-1) and IGFBP-3", "TSH", "None"]', 1, 'GH is secreted in pulses, so a random level is useless; IGF-1 is more stable.'),
    (v_case_id, 'What is the treatment for GH deficiency?', '["Pills", "Daily subcutaneous injections of Recombinant Human Growth Hormone", "Surgery", "None"]', 1, 'GH must be replaced by injection.');

    ---------------------------------------------------------------------------
    -- CASE 28: Pheochromocytoma in Peds (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hypertension and Headaches' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hypertension and Headaches', 'A child has episodes of severe sweating, pounding headaches, and extremely high blood pressure.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hypertension and Headaches', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Anxiety", "Pheochromocytoma", "Migraine", "None"]', 1, 'A catecholamine-secreting tumor of the adrenal medulla.'),
    (v_case_id, 'What screening test is done for Pheochromocytoma?', '["Urine culture", "24-hour urinary or plasma Metanephrines", "Blood sugar", "None"]', 1, 'Metanephrines are metabolites of epinephrine and norepinephrine.'),
    (v_case_id, 'What must be given BEFORE surgical removal of a pheochromocytoma?', '["Beta blockers only", "Alpha-blockers (to prevent hypertensive crisis)", "Steroids", "None"]', 1, 'Alpha blockade must come before beta blockade to avoid unopposed alpha-stimulation.');

    ---------------------------------------------------------------------------
    -- CASE 29: Nephrolithiasis (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Colicky Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Colicky Pain', 'A child with a history of recurrent UTIs has sudden-onset flank pain radiating to the groin.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Colicky Pain', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Appendicitis", "Nephrolithiasis (Kidney Stones)", "Asthma", "None"]', 1, 'Hematuria and colicky pain are classic for stones.'),
    (v_case_id, 'What is the most common type of kidney stone in children?', '["Uric acid", "Calcium oxalate / Calcium phosphate", "Cystine", "None"]', 1, 'Calcium stones are the most frequent.'),
    (v_case_id, 'What metabolic workup is required for a child with a first stone?', '["None", "24-hour urine for calcium, oxalate, citrate, and uric acid", "Brain MRI", "None"]', 1, 'Unlike adults, children with stones often have an underlying metabolic abnormality.');

    ---------------------------------------------------------------------------
    -- CASE 30: Renal Artery Stenosis (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Secondary Hypertension' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Secondary Hypertension', 'A 5-year-old has blood pressure of 140/90 and a bruit is heard over the abdomen.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Secondary Hypertension', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely cause of the hypertension?', '["Salt intake", "Renal Artery Stenosis", "Obesity", "None"]', 1, 'Narrowing of the renal artery leads to high renin and high BP.'),
    (v_case_id, 'What vascular disorder is often associated with renal artery stenosis in children?', '["Marfan", "Fibromuscular Dysplasia (FMD)", "Kawasaki", "None"]', 1, 'FMD causes \"string of beads\" appearance on angiography.'),
    (v_case_id, 'In children, is hypertension more likely to be primary (essential) or secondary?', '["Primary", "Secondary (often renal or endocrine)", "Primary", "None"]', 1, 'The younger the child, the more likely there is a specific cause.');

    ---------------------------------------------------------------------------
    -- CASE 31: Klinefelter Syndrome - Endo (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Small Testes and Tall Stature' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Small Testes and Tall Stature', 'A 16-year-old male is tall, has small firm testes, and mild gynecomastia.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Small Testes and Tall Stature', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely karyotype?', '["45,X", "47,XXY (Klinefelter Syndrome)", "47,XYY", "None"]', 1, 'The extra X chromosome leads to testicular dysgenesis.'),
    (v_case_id, 'What is the characteristic hormone profile?', '["Low FSH", "High FSH/LH and Low Testosterone", "Normal", "None"]', 1, 'Hypergonadotropic hypogonadism is the hallmark.'),
    (v_case_id, 'What is a common cognitive finding in Klinefelter?', '["Severe ID", "Learning disabilities, especially in verbal/language domains", "Gifted", "None"]', 1, 'Most have normal intelligence but struggle with specific language skills.');

    ---------------------------------------------------------------------------
    -- CASE 32: DKA - Cerebral Edema (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Neurologic Decline in DKA' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Neurologic Decline in DKA', 'A child being treated for DKA has improving blood sugar but suddenly becomes drowsy and develops bradycardia.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Neurologic Decline in DKA', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most feared complication being described?', '["Hypoglycemia", "Cerebral Edema", "Hypokalemia", "None"]', 1, 'This is the most common cause of DKA-related mortality in children.'),
    (v_case_id, 'What is the immediate treatment for suspected cerebral edema?', '["Insulin", "IV Mannitol or 3% Saline", "Antibiotics", "None"]', 1, 'Osmotic therapy is needed immediately to reduce brain swelling.'),
    (v_case_id, 'What is a risk factor for cerebral edema during DKA management?', '["Over-hydration or rapid drop in serum osmolality", "Eating sugar", "None", "None"]', 0, 'Gentle rehydration and gradual glucose lowering are preventative.');

    ---------------------------------------------------------------------------
    -- CASE 33: ARPKD - Autosomal Recessive Polycystic Kidney Disease (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Large Kidneys in the Newborn' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Large Kidneys in the Newborn', 'A neonate has massive palpable kidneys and respiratory distress at birth.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Large Kidneys in the Newborn', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["ADPKD", "ARPKD", "Wilms", "None"]', 1, 'ARPKD typically presents in the neonatal period.'),
    (v_case_id, 'What other organ is universally involved in ARPKD?', '["Brain", "Liver (Congenital Hepatic Fibrosis)", "Heart", "None"]', 1, 'Portal hypertension is a common long-term complication.'),
    (v_case_id, 'What causes the respiratory distress in these infants?', '["Large lungs", "Potter Sequence (due to oligohydramnios) leading to pulmonary hypoplasia", "Infection", "None"]', 1, 'Lack of fetal urine leads to poor lung development.');

    ---------------------------------------------------------------------------
    -- CASE 34: Hypocalcemia - DiGeorge Link (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Twitching Neonate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Twitching Neonate', 'A neonate with a heart defect (Truncus Arteriosus) develops seizures and is found to have a Calcium of 6.0.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Twitching Neonate', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely syndrome?', '["Down", "DiGeorge Syndrome (22q11 deletion)", "Turner", "None"]', 1, 'CATCH-22: Cardiac, Abnormal face, Thymic hypoplasia, Cleft palate, Hypocalcemia.'),
    (v_case_id, 'Why is the baby hypocalcemic?', '["Bad milk", "Parathyroid gland hypoplasia (Low PTH)", "Vitamin D loss", "None"]', 1, 'The 3rd and 4th pharyngeal pouches (which form the parathyroids and thymus) fail to develop.'),
    (v_case_id, 'What other immune issue should you check for in this baby?', '["No IgA", "T-cell deficiency (due to thymic hypoplasia)", "Low platelets", "None"]', 1, 'A chest X-ray may show an absent thymic shadow.');

    ---------------------------------------------------------------------------
    -- CASE 35: Cushing Syndrome (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Moon Face and Striae' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Moon Face and Striae', 'A child on high-dose steroids for nephrotic syndrome has gained weight, developed a round face and purple stretch marks on his belly.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Moon Face and Striae', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for this cluster of symptoms?', '["Addison", "Cushing Syndrome", "Diabetes", "None"]', 1, 'Hypercortisolism (in this case, iatrogenic) causes these physical changes.'),
    (v_case_id, 'What effect does excess cortisol have on growth?', '["Accelerates it", "Suppresses linear growth (short stature)", "None", "None"]', 1, 'Chronic steroid use is a major cause of growth failure.'),
    (v_case_id, 'Why should steroids be tapered rather than stopped abruptly?', '["To save money", "To allow the suppressed HPA axis to recover and avoid adrenal crisis", "No reason", "None"]', 1, 'Exogenous steroids suppress the body''s own production of cortisol.');

    ---------------------------------------------------------------------------
    -- CASE 36: Prader-Willi - Endocrine (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Always Hungry Child' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Always Hungry Child', 'A 5-year-old with intellectual disability and small hands/feet has developed an insatiable appetite and rapid weight gain.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Always Hungry Child', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the syndrome?', '["Angelman", "Prader-Willi Syndrome", "Beckwith-Wiedemann", "None"]', 1, 'Paternal deletion of 15q11-13 leads to this syndrome.'),
    (v_case_id, 'What was the characteristic feature in this child''s infancy?', '["Hypertonia", "Severe hypotonia (floppy baby) and poor feeding", "Teething", "None"]', 1, 'The switch from poor feeding to hyperphagia occurs in early childhood.'),
    (v_case_id, 'What endocrine treatment is used to improve body composition and height in Prader-Willi?', '["Insulin", "Growth Hormone", "Thyroid", "None"]', 1, 'GH is FDA-approved for PWS and improves lean muscle mass.');

    ---------------------------------------------------------------------------
    -- CASE 37: Acute Kidney Injury - AKI (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Prerenal vs. Intrarenal' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Prerenal vs. Intrarenal', 'A dehydrated child with gastroenteritis has a rising creatinine.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Prerenal vs. Intrarenal', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What calculation helps distinguish prerenal AKI from ATN?', '["BUN only", "Fractional Excretion of Sodium (FENa)", "Sugar", "None"]', 1, 'FENa < 1% suggests prerenal (kidney is conserving sodium); > 1-2% suggests intrinsic damage.'),
    (v_case_id, 'What is the primary treatment for prerenal AKI?', '["Dialysis", "Fluid resuscitation (volume expansion)", "Diuretics", "None"]', 1, 'Restoring perfusion fixes the prerenal state.'),
    (v_case_id, 'What is the term for AKI when there is no urine output?', '["Polyuria", "Anuria", "Oliguria", "None"]', 1, 'Oliguria is < 0.5-1.0 mL/kg/hr depending on age.');

    ---------------------------------------------------------------------------
    -- CASE 38: Precocious Puberty - McCune-Albright (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Spots and Early Puberty' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Spots and Early Puberty', 'A 5-year-old girl has large, irregular café-au-lait spots, bone cysts, and started menstruating early.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Spots and Early Puberty', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the syndrome?', '["NF1", "McCune-Albright Syndrome", "DiGeorge", "None"]', 1, 'It is caused by a mosaic G-protein mutation.'),
    (v_case_id, 'Is the precocious puberty in McCune-Albright central or peripheral?', '["Central", "Peripheral (GnRH-independent)", "Both", "None"]', 1, 'The ovaries produce estrogen autonomously.'),
    (v_case_id, 'What is the name for the bone cysts in this syndrome?', '["Osteosarcoma", "Fibrous Dysplasia", "Rickets", "None"]', 1, 'The triad is precocious puberty, café-au-lait spots (Coast of Maine), and fibrous dysplasia.');

    ---------------------------------------------------------------------------
    -- CASE 39: Renal Tubular Acidosis - RTA Type 2 (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bicarb Wasting' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bicarb Wasting', 'A child with a proximal tubule defect cannot reabsorb bicarbonate.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bicarb Wasting', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this type of RTA?', '["Type 1", "Type 2 (Proximal RTA)", "Type 4", "None"]', 1, 'Failure of the proximal tubule to reabsorb bicarbonate.'),
    (v_case_id, 'Can the distal tubule eventually acidify the urine in Type 2 RTA?', '["No", "Yes, when the blood bicarb drops low enough, the urine pH can become < 5.5", "Maybe", "None"]', 1, 'This distinguishes it from Type 1 RTA.'),
    (v_case_id, 'What generalized syndrome often includes Type 2 RTA?', '["Cushing", "Fanconi Syndrome", "Diabetes", "None"]', 1, 'Proximal bicarb loss is part of the total proximal dysfunction.');

    ---------------------------------------------------------------------------
    -- CASE 40: Micropenis and Cryptorchidism (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Genital Abnormalities' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Genital Abnormalities', 'A newborn boy is found to have an undescended testis on the left and an unusually small penis.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Genital Abnormalities', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for undescended testes?', '["Hydrocele", "Cryptorchidism", "Phimosis", "None"]', 1, 'Most descend by 6 months of age.'),
    (v_case_id, 'Micropenis and undescended testes in a newborn should raise concern for what?', '["Obesity", "Hypopituitarism (lack of LH/FSH and GH)", "Diabetes", "None"]', 1, 'Hypogonadotropic hypogonadism must be ruled out.'),
    (v_case_id, 'What is the risk of an undescended testis if left in the abdomen after age 1?', '["Infertility and increased risk of germ cell tumors", "None", "Infection", "None"]', 0, 'Orchiopexy is typically performed around 6-12 months.');

    ---------------------------------------------------------------------------
    -- CASE 41: CKD - Renal Osteodystrophy (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bone Disease in Kidney Failure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bone Disease in Kidney Failure', 'A child with chronic kidney disease has bone pain and high PTH levels.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bone Disease in Kidney Failure', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does CKD lead to high PTH (Secondary Hyperparathyroidism)?', '["Low sugar", "Hyperphosphatemia and low active Vitamin D (calcitriol)", "Low K", "None"]', 1, 'Failing kidneys cannot excrete phosphate or activate Vitamin D.'),
    (v_case_id, 'What is the name for the bone changes in CKD?', '["Rickets", "Renal Osteodystrophy", "Cancer", "None"]', 1, 'High PTH leaches calcium from the bones.'),
    (v_case_id, 'What is the main strategy to control phosphate in these patients?', '["Diet alone", "Phosphate binders (taken with meals)", "Diuretics", "None"]', 1, 'Binders prevent phosphate absorption in the gut.');

    ---------------------------------------------------------------------------
    -- CASE 42: SIADH vs. Dehydration (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dilutional Hyponatremia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dilutional Hyponatremia', 'A patient is being evaluated for a low sodium of 128.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dilutional Hyponatremia', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What volume status is characteristic of SIADH?', '["Hypovolemic (dehydrated)", "Euvolemic (clinically normal fluid volume)", "Hypervolemic (edematous)", "None"]', 1, 'SIADH patients have slightly increased total water but are not usually edematous.'),
    (v_case_id, 'How do the urinary findings differ in SIADH vs. Dehydration?', '["No difference", "SIADH: High urine sodium (> 20-40); Dehydration: Low urine sodium (< 20)", "None", "None"]', 1, 'Dehydrated kidneys hold onto sodium; SIADH kidneys lose it as they try to manage the water.'),
    (v_case_id, 'What is the serum osmolality in SIADH?', '["High", "Low (< 275 mOsm/kg)", "Normal", "None"]', 1, 'The excess water dilutes the blood.');

    ---------------------------------------------------------------------------
    -- CASE 43: Adrenal Crisis (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Crashing Addisonian' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Crashing Addisonian', 'A child with known adrenal insufficiency develops a fever and suddenly becomes hypotensive and lethargic.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Crashing Addisonian', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Sepsis alone", "Acute Adrenal Crisis", "Stroke", "None"]', 1, 'Stress (like infection) increases the body''s need for cortisol; if not supplied, the patient collapses.'),
    (v_case_id, 'What is the \"stress dose\" rule for steroid patients?', '["Stop meds", "Triple the usual dose of Hydrocortisone during illness or injury", "Double only", "None"]', 1, 'Higher doses are needed to mimic the body''s natural stress response.'),
    (v_case_id, 'What is the immediate treatment for adrenal crisis?', '["IV Saline and high-dose IV Hydrocortisone", "Tylenol", "Antibiotics only", "None"]', 0, 'Both volume and steroids are essential.');

    ---------------------------------------------------------------------------
    -- CASE 44: Obesity and Acanthosis Nigricans (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dark Neck Skin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dark Neck Skin', 'An obese 12-year-old has dark, velvety thickening of the skin on the back of his neck.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dark Neck Skin', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this skin finding called?', '["Dirt", "Acanthosis Nigricans", "Psoriasis", "None"]', 1, 'It is a common clinical sign of insulin resistance.'),
    (v_case_id, 'What condition is this child at high risk for?', '["Type 1 Diabetes", "Type 2 Diabetes Mellitus", "Addison", "None"]', 1, 'Obesity-driven insulin resistance leads to T2DM in children.'),
    (v_case_id, 'What is the primary intervention?', '["Skin cream", "Weight loss through diet and exercise", "Insulin", "None"]', 1, 'Lifestyle modification is the first step; metformin may be added.');

    ---------------------------------------------------------------------------
    -- CASE 45: Vitamin D Metabolism (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Activating the Vitamin' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Activating the Vitamin', 'A medical student is reviewing how Vitamin D is activated.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Activating the Vitamin', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which organ performs the first hydroxylation (to 25-OH Vitamin D)?', '["Skin", "Liver", "Kidney", "None"]', 1, 'The liver makes the storage form.'),
    (v_case_id, 'Which organ performs the final hydroxylation (to 1,25-OH Vitamin D)?', '["Liver", "Kidney", "Skin", "None"]', 1, 'The kidneys make the active form (calcitriol) under the influence of PTH.'),
    (v_case_id, 'Which Vitamin D level is the best marker of total body stores?', '["1,25-OH D", "25-OH Vitamin D", "Dietary D", "None"]', 1, '25-OH D has a longer half-life and reflects stores accurately.');

    ---------------------------------------------------------------------------
    -- CASE 46: SIADH - Hyponatremic Seizure (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Low Sodium Fits' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Low Sodium Fits', 'A child with SIADH has a sodium of 115 and begins having a generalized seizure.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Low Sodium Fits', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate treatment for a hyponatremic seizure?', '["Fluid restriction", "Hypertonic (3%) Saline", "Normal Saline", "None"]', 1, 'Acute symptomatic hyponatremia requires rapid, but controlled, elevation of sodium with 3% saline.'),
    (v_case_id, 'Why is normal saline sometimes contraindicated in SIADH?', '["It is too salty", "The body will retain the water and excrete the salt, worsening the hyponatremia", "No reason", "None"]', 1, 'SIADH patients can experience \"desalination\" if given isotonic fluids.'),
    (v_case_id, 'What is the goal of 3% saline in this emergency?', '["Reach 140", "Raise sodium by 4-6 mEq just enough to stop the seizure", "100%", "None"]', 1, 'The goal is symptom control, not total normalization.');

    ---------------------------------------------------------------------------
    -- CASE 47: Pheochromocytoma - Genetic Link (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pheo and MEN' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pheo and MEN', 'A child with a pheochromocytoma is found to have a family history of medullary thyroid cancer.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pheo and MEN', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What syndrome is likely?', '["MEN 1", "Multiple Endocrine Neoplasia Type 2 (MEN 2)", "Down", "None"]', 1, 'MEN 2 (A and B) includes Medullary Thyroid Cancer and Pheochromocytoma.'),
    (v_case_id, 'What gene is mutated in MEN 2?', '["p53", "RET proto-oncogene", "BRCA1", "None"]', 1, 'A mutation in the RET gene is responsible for these clusters of tumors.'),
    (v_case_id, 'What other physical finding is classic for MEN 2B?', '["Tall", "Mucosal neuromas (bumps on tongue/lips) and Marfanoid habitus", "Rash", "None"]', 1, 'MEN 2B is distinct from 2A due to these features.');

    ---------------------------------------------------------------------------
    -- CASE 48: Renal Vein Thrombosis in Neonates (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bloody Urine in a Newborn' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bloody Urine in a Newborn', 'A neonate born to a diabetic mother has a palpable flank mass and hematuria.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bloody Urine in a Newborn', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Wilms", "Renal Vein Thrombosis", "PSGN", "None"]', 1, 'Infants of diabetic mothers and dehydrated neonates are at higher risk.'),
    (v_case_id, 'What is a common associated lab finding?', '["High WBC", "Thrombocytopenia (platelets are consumed in the clot)", "High sugar", "None"]', 1, 'Platelet consumption occurs within the renal vasculature.'),
    (v_case_id, 'What is the initial diagnostic test of choice?', '["CT", "Doppler Renal Ultrasound", "VCUG", "None"]', 1, 'Doppler can visualize the lack of flow in the renal vein.');

    ---------------------------------------------------------------------------
    -- CASE 49: RTA Type 4 (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'High K and Acidosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'High K and Acidosis', 'A child with sickle cell disease has mild renal insufficiency, hyperkalemia, and metabolic acidosis.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'High K and Acidosis', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of RTA is this?', '["Type 1", "Type 4 (Hypoaldosteronism)", "Type 2", "None"]', 1, 'Type 4 is the only RTA associated with HYPERkalemia.'),
    (v_case_id, 'What is the defect in Type 4 RTA?', '["Bicarb loss", "Aldosterone deficiency or resistance", "H+ loss", "None"]', 1, 'Aldosterone normally promotes K+ and H+ secretion.'),
    (v_case_id, 'What is a common drug-induced cause of Type 4 RTA?', '["Aspirin", "ACE Inhibitors or NSAIDs", "Tylenol", "None"]', 1, 'These drugs interfere with the renin-aldosterone axis.');

    ---------------------------------------------------------------------------
    -- CASE 50: IDM - Infant of Diabetic Mother (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The IDM Profile' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The IDM Profile', 'A medical student is listing potential complications for an IDM.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The IDM Profile', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What cardiac anomaly is common in IDM?', '["VSD", "Hypertrophic Cardiomyopathy (Septal hypertrophy)", "ASD", "None"]', 1, 'Excessive growth of the interventricular septum can cause outflow obstruction.'),
    (v_case_id, 'What skeletal/CNS anomaly is specifically associated with maternal diabetes?', '["Down", "Caudal Regression Syndrome", "None", "None"]', 1, 'A rare but characteristic defect of the lower spine and limbs.'),
    (v_case_id, 'Besides hypoglycemia, what electrolyte abnormality is frequent in IDM?', '["Hyperkalemia", "Hypocalcemia and Hypomagnesemia", "None", "None"]', 1, 'These occur due to maternal-fetal metabolic imbalances during pregnancy.');

    RAISE NOTICE 'SUCCESS: 50 Pediatric Nephrology & Endo Case Blocks registered.';
END $$;

COMMIT;
