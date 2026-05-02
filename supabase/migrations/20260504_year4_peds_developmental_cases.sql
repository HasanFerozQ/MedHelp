BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Developmental Pediatrics
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'peds-developmental' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "peds-developmental" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: 2-Month Milestones (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The First Smile' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The First Smile', 'A mother brings her 2-month-old for a well-child check. The infant smiles when spoken to and coos.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A mother brings her 2-month-old for a well-child check. The infant smiles when spoken to and coos.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hallmark social milestone for a 2-month-old?', '["Joint attention", "Social smile", "Stranger anxiety", "None"]', 1, 'The social smile usually emerges by 6-8 weeks of age.'),
    (v_case_id, 'What is the typical language milestone at this age?', '["Babbles", "Coos (vowel sounds)", "Mama/Dada", "None"]', 1, 'Coos are the first non-crying vocalizations.'),
    (v_case_id, 'In terms of motor skills, what should a 2-month-old be able to do when prone?', '["Roll over", "Lift head to 45 degrees", "Sit up", "None"]', 1, 'Head control begins with lifting the head off the surface while prone.');

    ---------------------------------------------------------------------------
    -- CASE 02: 4-Month Milestones (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rolling and Laughing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rolling and Laughing', 'A 4-month-old infant is being evaluated. He laughs out loud and has started rolling.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rolling and Laughing', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In which direction does a 4-month-old usually roll first?', '["Back to front", "Front to back", "They don''t roll", "None"]', 1, 'Rolling from the prone to the supine position (front to back) typically occurs around 4 months.'),
    (v_case_id, 'What fine motor skill is emerging at 4 months?', '["Pincer grasp", "Reaches for and grasps objects (palmar grasp)", "Stacks 2 blocks", "None"]', 1, 'Intentional reaching and grasping are key 4-month milestones.'),
    (v_case_id, 'What is the milestone for head control at 4 months?', '["Head lag present", "No head lag when pulled to sit", "Cannot lift head", "None"]', 1, 'By 4 months, there should be no head lag when the infant is pulled from a supine to a sitting position.');

    ---------------------------------------------------------------------------
    -- CASE 03: 6-Month Milestones (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sitting and Babbling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sitting and Babbling', 'A 6-month-old can sit with some support and is making consonant sounds like \"ba\" and \"da\".', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sitting and Babbling', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic language milestone at 6 months?', '["Single words", "Babbling (consonant-vowel combinations)", "Cooing only", "None"]', 1, 'Babbling involves strings of consonants like \"bababa\" or \"dadada\".'),
    (v_case_id, 'What gross motor milestone is expected at 6 months?', '["Crawling", "Sits with support (tripod sit)", "Stands alone", "None"]', 1, 'Sitting briefly without support or with a wide base (tripod) is a 6-month milestone.'),
    (v_case_id, 'How does a 6-month-old typically interact with toys?', '["Stacks them", "Transfers objects from one hand to the other", "Points at them", "None"]', 1, 'Hand-to-hand transfer is a critical 6-month fine motor skill.');

    ---------------------------------------------------------------------------
    -- CASE 04: 9-Month Milestones (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pincer Grasp and Peeking' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pincer Grasp and Peeking', 'A 9-month-old can pull himself to a standing position and enjoys playing \"peek-a-boo\".', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pincer Grasp and Peeking', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic fine motor milestone at 9 months?', '["Palmar grasp", "Immature pincer grasp (using the side of the finger)", "Stacking 4 blocks", "None"]', 1, 'The pincer grasp develops around 9-10 months.'),
    (v_case_id, 'What cognitive concept is demonstrated by the enjoyment of peek-a-boo?', '["Conservation", "Object Permanence", "Symbolic play", "None"]', 1, 'Object permanence is the understanding that things exist even when out of sight.'),
    (v_case_id, 'What gross motor skill is typical for a 9-month-old?', '["Running", "Pulling to stand and crawling", "Walking alone", "None"]', 1, 'Crawling and pulling up on furniture (cruising) are common at this age.');

    ---------------------------------------------------------------------------
    -- CASE 05: 12-Month Milestones (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The First Birthday' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The First Birthday', 'A 1-year-old child says his first specific word (\"Mama\") and takes his first few steps independently.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The First Birthday', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How many words (besides Mama/Dada) does a typical 12-month-old have?', '["0", "1 to 3 words", "10 words", "None"]', 1, 'The first meaningful words (usually 1-3) appear around the first birthday.'),
    (v_case_id, 'What is the fine motor milestone for a 12-month-old?', '["Draws a circle", "Mature pincer grasp and releasing objects into a cup", "Stacking 6 blocks", "None"]', 1, 'They can now pick up small items cleanly with the tips of the thumb and index finger.'),
    (v_case_id, 'What is the social milestone for a 12-month-old regarding simple requests?', '["Ignores them", "Follows a simple one-step command with a gesture", "Reads", "None"]', 1, 'Following \"Give it to me\" while holding out a hand is a classic 1-year milestone.');

    ---------------------------------------------------------------------------
    -- CASE 06: 18-Month Milestones (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Running and Building' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Running and Building', 'An 18-month-old is running around the exam room and can stack 3 to 4 blocks.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Running and Building', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How many words should an 18-month-old typically have?', '["3 words", "10 to 25 words", "50 words", "None"]', 1, 'The vocabulary is expanding, though it varies significantly.'),
    (v_case_id, 'What gross motor milestone is expected regarding stairs at 18 months?', '["Walks up stairs with one hand held", "Runs up stairs", "Cannot do stairs", "None"]', 0, 'Most can navigate stairs with some assistance.'),
    (v_case_id, 'What type of play is characteristic at 18 months?', '["Complex games", "Imitative play (e.g., \"feeding\" a doll or using a phone)", "Team sports", "None"]', 1, 'Pretend play often begins with simple imitative actions.');

    ---------------------------------------------------------------------------
    -- CASE 07: 2-Year Milestones (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Two-Word Phrase' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Two-Word Phrase', 'A 2-year-old child points to a dog and says \"Big dog!\".', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Two-Word Phrase', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic language milestone for a 2-year-old?', '["Single words", "2-word phrases (subject + verb/adjective)", "Full stories", "None"]', 1, 'Combining words into short phrases is a hallmark of age 2.'),
    (v_case_id, 'How many words should a 2-year-old have in their vocabulary?', '["50 or more", "10", "1000", "None"]', 0, 'A vocabulary of at least 50 words is the standard benchmark.'),
    (v_case_id, 'What percentage of a 2-year-old''s speech should be intelligible to strangers?', '["25%", "50%", "100%", "None"]', 1, 'Roughly half of what they say should be understandable to someone who doesn''t know them well.');

    ---------------------------------------------------------------------------
    -- CASE 08: 3-Year Milestones (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tricycle Rider' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tricycle Rider', 'A 3-year-old can ride a tricycle and stack 9 blocks.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Tricycle Rider', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What shape can a 3-year-old typically copy?', '["A square", "A circle", "A triangle", "None"]', 1, 'Drawing a circle is a 3-year fine motor milestone.'),
    (v_case_id, 'What is the typical language structure at 3 years?', '["3-word sentences", "2-word phrases", "Single words", "None"]', 0, 'They often speak in short sentences.'),
    (v_case_id, 'What percentage of a 3-year-old''s speech should be intelligible to strangers?', '["50%", "75%", "100%", "None"]', 1, 'By age 3, three-quarters of their speech should be clear to others.');

    ---------------------------------------------------------------------------
    -- CASE 09: 4-Year Milestones (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Imaginative Child' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Imaginative Child', 'A 4-year-old can hop on one foot and draw a person with 3 parts.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Imaginative Child', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What shape can a 4-year-old typically copy?', '["A circle", "A cross or a square", "A triangle", "None"]', 1, 'The cross and square are typical 4-year milestones.'),
    (v_case_id, 'What is the intelligible speech benchmark for a 4-year-old?', '["75%", "100%", "50%", "None"]', 1, 'strangers should understand essentially everything a 4-year-old says.'),
    (v_case_id, 'What is a characteristic social/cognitive milestone at 4 years?', '["Parallel play", "Imaginative/Cooperative play and telling stories", "Team sports", "None"]', 1, '4-year-olds often have a rich fantasy life and play together with others.');

    ---------------------------------------------------------------------------
    -- CASE 10: 5-Year Milestones (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ready for School' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ready for School', 'A 5-year-old can skip, tie his shoes, and count to 10.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Ready for School', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What shape can a 5-year-old typically copy?', '["A circle", "A triangle", "A cross", "None"]', 1, 'The triangle is the classic 5-year shape.'),
    (v_case_id, 'How many parts can a 5-year-old typically draw on a person?', '["1", "6 or more", "3", "None"]', 1, 'Their drawings become much more detailed.'),
    (v_case_id, 'What gross motor skill emerges at 5 years?', '["Jumping", "Skipping or walking backward heel-to-toe", "Hopping", "None"]', 1, 'Skipping is a coordinated 5-year milestone.');

    ---------------------------------------------------------------------------
    -- CASE 11: Autism - Early Red Flags (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Quiet Toddler' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Quiet Toddler', 'An 18-month-old does not point to things he wants, makes poor eye contact, and does not respond to his name.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Quiet Toddler', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Deafness", "Autism Spectrum Disorder (ASD)", "ADHD", "None"]', 1, 'Deficits in social communication and interaction are core features of ASD.'),
    (v_case_id, 'What is \"Joint Attention\"?', '["Paying attention to a toy", "Sharing an interest in an object with another person (e.g., pointing to show)", "Watching TV", "None"]', 1, 'The lack of joint attention is a major red flag for ASD.'),
    (v_case_id, 'At what ages is formal screening for ASD recommended for ALL children?', '["6 months", "18 and 24 months", "5 years", "None"]', 1, 'The AAP recommends universal screening twice during toddlerhood.');

    ---------------------------------------------------------------------------
    -- CASE 12: ASD - Diagnostic Criteria (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Repetitive Patterns' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Repetitive Patterns', 'A 4-year-old with delayed speech obsessively lines up his toy cars and has intense tantrums if their order is disturbed.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Repetitive Patterns', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Besides social communication deficits, what is the other core domain of ASD symptoms?', '["Hyperactivity", "Restricted, repetitive patterns of behavior, interests, or activities", "Low IQ", "None"]', 1, 'Both domains must be present for a diagnosis.'),
    (v_case_id, 'What is \"Echolalia\"?', '["Repeating the words of others", "Speaking loudly", "Not speaking", "None"]', 0, 'Echolalia is a common language feature in children with ASD.'),
    (v_case_id, 'Does ASD require a co-occurring intellectual disability for diagnosis?', '["Yes", "No, though it frequently occurs", "Always", "None"]', 1, 'ASD is a spectrum and can occur in individuals with superior intelligence.');

    ---------------------------------------------------------------------------
    -- CASE 13: ADHD - Inattentive (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Daydreamer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Daydreamer', 'A 9-year-old girl is struggling in school. She doesn''t cause trouble but often loses her homework and forgets instructions.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Daydreamer', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely subtype of ADHD?', '["Hyperactive", "Predominantly Inattentive", "Combined", "None"]', 1, 'Inattentive ADHD is often overlooked because it is not disruptive.'),
    (v_case_id, 'What is a requirement for the diagnosis of ADHD regarding the setting of symptoms?', '["Only at home", "Symptoms must be present in two or more settings (e.g., home and school)", "Only at school", "None"]', 1, 'Pervasiveness across settings is key.'),
    (v_case_id, 'What is the age cut-off for the onset of several ADHD symptoms?', '["By age 5", "By age 12", "By age 18", "None"]', 1, 'DSM-5 requires several symptoms to be present prior to age 12.');

    ---------------------------------------------------------------------------
    -- CASE 14: ADHD - Management (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Stimulant Therapy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Stimulant Therapy', 'A 7-year-old with ADHD-Combined type is started on Methylphenidate.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Stimulant Therapy', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line medication class for school-aged children with ADHD?', '["Antidepressants", "Stimulants (e.g., Methylphenidate, Amphetamines)", "Antipsychotics", "None"]', 1, 'Stimulants have the strongest evidence for efficacy.'),
    (v_case_id, 'What are the two most common side effects of stimulant medications?', '["Sleepiness and Weight gain", "Appetite suppression and Insomnia", "Diarrhea and Rash", "None"]', 1, 'Weight and height should be monitored regularly.'),
    (v_case_id, 'What non-pharmacological intervention is vital for ADHD management?', '["Diet only", "Behavioral therapy and environmental modifications", "Pills only", "None"]', 1, 'A multi-modal approach is most effective.');

    ---------------------------------------------------------------------------
    -- CASE 15: Cerebral Palsy - Spastic (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hypertonia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hypertonia', 'A 9-month-old infant born prematurely at 28 weeks has stiff legs, scissoring posture, and has not started to sit.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hypertonia', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Muscular dystrophy", "Spastic Cerebral Palsy (CP)", "Spinal cord injury", "None"]', 1, 'CP is a non-progressive disorder of movement and posture due to an insult to the developing brain.'),
    (v_case_id, 'What is a major risk factor for CP?', '["Large birth weight", "Prematurity and Periventricular Leukomalacia (PVL)", "Breastfeeding", "None"]', 1, 'Ischemic injury to the white matter around the ventricles (PVL) often leads to spastic diplegia.'),
    (v_case_id, 'What physical exam finding is typical for spastic CP?', '["Low muscle tone", "Increased muscle tone (hypertonia) and brisk reflexes", "No reflexes", "None"]', 1, 'Hypertonia and hyperreflexia are signs of an upper motor neuron lesion.');

    ---------------------------------------------------------------------------
    -- CASE 16: Down Syndrome - Development (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Extra Chromosome' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Extra Chromosome', 'An infant with Trisomy 21 is being followed. He has generalized hypotonia and delayed motor milestones.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Extra Chromosome', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of motor delay in infants with Down Syndrome?', '["Large head", "Generalized Hypotonia (Low muscle tone)", "Muscle weakness", "None"]', 1, 'Hypotonia makes it harder for them to reach motor benchmarks on time.'),
    (v_case_id, 'Are cognitive milestones usually more or less delayed than motor milestones in Down Syndrome?', '["Less", "More (Global Developmental Delay is the rule)", "Not delayed", "None"]', 1, 'Children with DS typically have mild to moderate intellectual disability.'),
    (v_case_id, 'What is a vital screening test for children with Down Syndrome before they start sports like gymnastics?', '["Blood test", "Cervical spine X-ray (for Atlantoaxial Instability)", "Brain MRI", "None"]', 1, 'Ligamentous laxity can lead to instability between C1 and C2.');

    ---------------------------------------------------------------------------
    -- CASE 17: Fragile X Syndrome (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Genetic Gap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Genetic Gap', 'A 5-year-old boy has intellectual disability, large prominent ears, a long face, and avoidant eye contact.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Genetic Gap', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common inherited cause of intellectual disability?', '["Down Syndrome", "Fragile X Syndrome", "Fetal Alcohol Syndrome", "None"]', 1, 'Down is the most common genetic cause overall, but Fragile X is the most common *inherited* one.'),
    (v_case_id, 'What is the classic physical finding in post-pubertal males with Fragile X?', '["Small testes", "Macro-orchidism (large testes)", "Baldness", "None"]', 1, 'This finding appears after puberty.'),
    (v_case_id, 'What is the genetic mechanism of Fragile X?', '["Trisomy", "CGG Trinucleotide repeat expansion in the FMR1 gene", "Deletion", "None"]', 1, 'Full mutation (> 200 repeats) leads to silencing of the gene.');

    ---------------------------------------------------------------------------
    -- CASE 18: Fetal Alcohol Syndrome - FAS (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Teratogen' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Teratogen', 'A child has growth retardation, microcephaly, and distinct facial features: thin upper lip, smooth philtrum, and short palpebral fissures.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Teratogen', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Down Syndrome", "Fetal Alcohol Syndrome (FAS)", "Williams Syndrome", "None"]', 1, 'FAS is a leading preventable cause of intellectual disability.'),
    (v_case_id, 'What is the philtrum?', '["The upper lip", "The vertical groove between the nose and the upper lip", "The chin", "None"]', 1, 'A smooth philtrum is a classic FAS facial feature.'),
    (v_case_id, 'What is a common neurodevelopmental consequence of FAS?', '["Hyperactivity and impulsivity (mimicking ADHD)", "Perfect memory", "No issues", "None"]', 0, 'Children with FAS often struggle with executive function and behavior.');

    ---------------------------------------------------------------------------
    -- CASE 19: Rett Syndrome (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hand Wringing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hand Wringing', 'A 2-year-old girl who was developing normally now is losing her language and motor skills and constantly wrings her hands.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hand Wringing', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Autism", "Rett Syndrome", "Cerebral Palsy", "None"]', 1, 'Rett syndrome is characterized by a period of normal development followed by regression.'),
    (v_case_id, 'Which population is almost exclusively affected by Rett Syndrome?', '["Males", "Females", "Both equally", "None"]', 1, 'It is an X-linked dominant condition that is usually lethal in males.'),
    (v_case_id, 'What is the characteristic hand movement in Rett Syndrome?', '["Pointing", "Repetitive midline hand-wringing or hand-washing movements", "Tremor", "None"]', 1, 'Loss of purposeful hand use is replaced by these stereotypies.');

    ---------------------------------------------------------------------------
    -- CASE 20: Global Developmental Delay - GDD (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Delay in All Areas' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Delay in All Areas', 'A 3-year-old is not yet walking, says no words, and does not follow commands.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Delay in All Areas', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for significant delay in 2 or more developmental domains?', '["Autism", "Global Developmental Delay (GDD)", "ADHD", "None"]', 1, 'GDD is used for children under age 5 who show broad-based delays.'),
    (v_case_id, 'What is the first step in the medical evaluation of a child with broad delays?', '["Brain MRI", "Thorough history and physical exam + hearing/vision screening", "Genetic testing", "None"]', 1, 'Always rule out sensory deficits first.'),
    (v_case_id, 'What is the first-line genetic test for an unexplained developmental delay?', '["Karyotype", "Chromosomal Microarray (CMA)", "Whole exome sequencing", "None"]', 1, 'CMA has the highest diagnostic yield for identifying small deletions or duplications.');

    ---------------------------------------------------------------------------
    -- CASE 21: Enuresis - Bedwetting (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wet Bed' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wet Bed', 'A 7-year-old child has never been dry at night.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Wet Bed', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what age is bedwetting considered clinically significant?', '["3 years", "5 years", "10 years", "None"]', 1, 'Enuresis is defined as bedwetting at age 5 or older.'),
    (v_case_id, 'What is the most effective long-term treatment for nocturnal enuresis?', '["Desmopressin", "Bed-wetting alarm (Enuresis alarm)", "Punishment", "None"]', 1, 'Alarms use conditioning to wake the child and have the lowest relapse rate.'),
    (v_case_id, 'What medication can be used for short-term success (e.g., a sleepover)?', '["Antibiotics", "Desmopressin (DDAVP)", "Ritalin", "None"]', 1, 'DDAVP reduces urine production overnight.');

    ---------------------------------------------------------------------------
    -- CASE 22: Encopresis (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Soiling' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Soiling', 'An 8-year-old boy has daily fecal staining in his underwear but denies being constipated.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Soiling', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of encopresis?', '["Behavioral defiance", "Chronic constipation with overflow incontinence", "Poor training", "None"]', 1, 'Liquid stool leaks around a large, hard impaction in the rectum.'),
    (v_case_id, 'Why does the child often deny feeling the need to go?', '["He is lying", "Chronic distention of the rectum leads to loss of sensation (anorectal desensitization)", "He is lazy", "None"]', 1, 'The nerves stop sending signals due to constant stretching.'),
    (v_case_id, 'What is the mainstay of treatment?', '["Punishment", "Cleanout followed by long-term laxatives and scheduled toilet sits", "Surgery", "None"]', 1, 'Treatment requires months of soft stools to allow the rectum to return to normal size.');

    ---------------------------------------------------------------------------
    -- CASE 23: Breath-Holding Spells (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Scary Spells' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Scary Spells', 'A 2-year-old gets angry, stops breathing, turns blue, and briefly faints.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Scary Spells', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Are breath-holding spells dangerous or indicative of a future seizure disorder?', '["Yes", "No, they are benign and resolve spontaneously by school age", "Maybe", "None"]', 1, 'They are involuntary reactions to frustration or pain.'),
    (v_case_id, 'What is the likely type of spell if the child turns blue (cyanotic)?', '["Cyanotic breath-holding spell", "Pallid breath-holding spell", "Seizure", "None"]', 0, 'Cyanotic spells are usually triggered by anger or frustration.'),
    (v_case_id, 'What deficiency has been linked to an increased frequency of these spells?', '["Vitamin D", "Iron deficiency anemia", "Zinc", "None"]', 1, 'Treating iron deficiency often reduces the number of spells.');

    ---------------------------------------------------------------------------
    -- CASE 24: Sleep Terrors vs. Nightmares (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Midnight Scream' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Midnight Scream', 'A 5-year-old screams in the middle of the night, appears terrified, but cannot be awakened and has no memory of it the next day.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Midnight Scream', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this a nightmare or a sleep terror?', '["Nightmare", "Sleep Terror (Pavor Nocturnus)", "Seizure", "None"]', 1, 'Sleep terrors occur during non-REM sleep; the child is not truly awake and doesn''t remember the event.'),
    (v_case_id, 'During which part of the night do sleep terrors usually occur?', '["Late morning", "First third of the night", "Middle of the day", "None"]', 1, 'They happen during the transition from deep non-REM to REM sleep.'),
    (v_case_id, 'What is the recommended management for sleep terrors?', '["Waking the child up", "Reassurance and ensuring safety during the event", "Sleeping pills", "None"]', 1, 'Waking the child can actually prolong the episode.');

    ---------------------------------------------------------------------------
    -- CASE 25: Temper Tantrums (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Terrible Twos' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Terrible Twos', 'A 2-year-old throws himself on the floor and screams when he doesn''t get a cookie.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Terrible Twos', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Are temper tantrums normal at age 2?', '["No", "Yes, they are a normal part of developing autonomy and coping with frustration", "Only in boys", "None"]', 1, 'Toddlers have big emotions but limited verbal skills and self-regulation.'),
    (v_case_id, 'What is the best way to manage a typical tantrum?', '["Giving the cookie", "Ignoring the behavior (as long as safe) and remaining calm", "Spanking", "None"]', 1, 'Giving in reinforces that the tantrum \"works\".'),
    (v_case_id, 'When should tantrums be a cause for concern?', '["Always", "If they last > 15 minutes, happen > 5 times daily, or involve injury", "If they happen at 2 years", "None"]', 1, 'Severe or excessively frequent tantrums warrant further behavioral evaluation.');

    ---------------------------------------------------------------------------
    -- CASE 26: Dyslexia (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Difficulty Reading' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Difficulty Reading', 'A 7-year-old with normal intelligence is struggling to learn to read and confuses letters like ''b'' and ''d''.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Difficulty Reading', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Intellectual disability", "Dyslexia (Specific Learning Disorder with impairment in reading)", "ADHD", "None"]', 1, 'Dyslexia involves difficulty with phonological processing (mapping sounds to letters).'),
    (v_case_id, 'Is letter reversal (e.g., b/d) diagnostic of dyslexia in a 1st grader?', '["Yes", "No, it is common and normal up to age 7", "Always", "None"]', 1, 'It only becomes concerning if it persists past the early learning phase.'),
    (v_case_id, 'What is the goal of an IEP (Individualized Education Program)?', '["To give a diagnosis", "To provide tailored educational supports and accommodations for a child with a disability", "To fail the student", "None"]', 1, 'An IEP is a legal document in the US ensuring educational access.');

    ---------------------------------------------------------------------------
    -- CASE 27: Separation Anxiety (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'School Refusal' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'School Refusal', 'A 6-year-old cries hysterically and develops stomach aches every morning when it is time to go to school.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'School Refusal', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Stomach flu", "Separation Anxiety Disorder", "Bullying only", "None"]', 1, 'Physical symptoms (somatic complaints) are common ways for children to express anxiety.'),
    (v_case_id, 'What is the most important step in managing school refusal?', '["Keeping the child home", "Returning the child to school as soon as possible", "Wait and see", "None"]', 1, 'Prolonged absence makes the anxiety worse.'),
    (v_case_id, 'At what age is separation anxiety from parents a NORMAL developmental milestone?', '["6 months", "9 to 18 months", "5 years", "None"]', 1, 'Stranger/separation anxiety is expected in toddlers but should resolve.');

    ---------------------------------------------------------------------------
    -- CASE 28: Selective Mutism (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Silent at School' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Silent at School', 'A 5-year-old child talks normally at home but has not spoken a single word to her teacher or peers in 3 months.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Silent at School', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Autism", "Selective Mutism", "Language delay", "None"]', 1, 'Selective mutism is an anxiety disorder where a child is unable to speak in specific social settings.'),
    (v_case_id, 'How long must the failure to speak persist for a diagnosis?', '["1 week", "At least 1 month (not limited to the first month of school)", "1 year", "None"]', 1, 'A period of adjustment is normal, but persistent silence is not.'),
    (v_case_id, 'Is this child choosing to be defiant?', '["Yes", "No, it is an involuntary freezing response due to severe anxiety", "Maybe", "None"]', 1, 'It is not a form of oppositional behavior.');

    ---------------------------------------------------------------------------
    -- CASE 29: Williams Syndrome (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Friendly Face' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Friendly Face', 'A child has a very outgoing \"cocktail party\" personality, an \"elfin\" facial appearance, and an intellectual disability.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Friendly Face', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Down", "Williams Syndrome", "Fragile X", "None"]', 1, 'They are characteristically hyper-social but have developmental delays.'),
    (v_case_id, 'What cardiac lesion is specifically associated with Williams Syndrome?', '["VSD", "Supravalvular Aortic Stenosis", "ASD", "None"]', 1, 'This is a high-yield cardiac-syndrome link.'),
    (v_case_id, 'What electrolyte abnormality can occur in infants with Williams?', '["Low Ca", "Hypercalcemia", "High K", "None"]', 1, 'Transient idiopathic hypercalcemia can occur in infancy.');

    ---------------------------------------------------------------------------
    -- CASE 30: Tourette Syndrome (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tics and Sounds' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tics and Sounds', 'A 10-year-old has been blinking his eyes excessively and making throat-clearing sounds for over a year.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tics and Sounds', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is required for a diagnosis of Tourette Syndrome?', '["Motor tics only", "Both multiple motor tics AND at least one vocal tic", "Vocal tics only", "None"]', 1, 'Both must be present, though not necessarily at the same time.'),
    (v_case_id, 'How long must tics persist for a Tourette diagnosis?', '["1 month", "At least 1 year", "5 years", "None"]', 1, 'Chronic tics are those lasting > 1 year.'),
    (v_case_id, 'What other conditions are frequently comorbid with Tourette?', '["Down syndrome", "ADHD and OCD", "Diabetes", "None"]', 1, 'Behavioral comorbidities are often more disruptive than the tics themselves.');

    ---------------------------------------------------------------------------
    -- CASE 31: Parallel Play (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Side-by-Side' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Side-by-Side', 'Two 2-year-olds are playing near each other with similar toys but are not interacting or sharing.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Side-by-Side', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this stage of play called?', '["Cooperative play", "Parallel play", "Solitary play", "None"]', 1, 'Parallel play is normal and expected for 2-year-olds.'),
    (v_case_id, 'At what age does \"Cooperative Play\" (playing together with shared goals) typically emerge?', '["1 year", "4 years", "6 months", "None"]', 1, 'Preschoolers start to play *with* each other.'),
    (v_case_id, 'Is a lack of sharing at age 2 a sign of a developmental problem?', '["Yes", "No, it is developmentally appropriate for this age", "Always", "None"]', 1, 'Toddlers are egocentric by nature.');

    ---------------------------------------------------------------------------
    -- CASE 32: Oppositional Defiant Disorder - ODD (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Defiance' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Defiance', 'A 10-year-old frequently loses his temper, argues with his parents, and refuses to follow rules, but he does not hurt people or animals.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Defiance', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Conduct Disorder", "Oppositional Defiant Disorder (ODD)", "ADHD", "None"]', 1, 'ODD involves defiance and irritability without the severe violations of rights seen in Conduct Disorder.'),
    (v_case_id, 'How is ODD typically managed?', '["Stimulants", "Parent Management Training (PMT) and family therapy", "Wait", "None"]', 1, 'Improving parent-child interactions is the first step.'),
    (v_case_id, 'Does ODD always lead to Conduct Disorder?', '["Yes", "No, but it is a significant risk factor", "Always", "None"]', 1, 'Many children with ODD do not progress to CD.');

    ---------------------------------------------------------------------------
    -- CASE 33: Conduct Disorder (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Breaking Rules' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Breaking Rules', 'A 14-year-old has a history of setting fires, cruelty to animals, and stealing.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Breaking Rules', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["ODD", "Conduct Disorder", "Autism", "None"]', 1, 'Conduct disorder involves repetitive patterns of violating the rights of others or major societal rules.'),
    (v_case_id, 'What adult diagnosis is linked to a childhood history of Conduct Disorder?', '["Bipolar", "Antisocial Personality Disorder", "Depression", "None"]', 1, 'Conduct disorder before age 15 is a prerequisite for ASPD in adults.'),
    (v_case_id, 'Are these behaviors typically considered a form of \"normal teenage rebellion\"?', '["Yes", "No, they are severe and pervasive", "Maybe", "None"]', 1, 'They go far beyond typical adolescent testing of boundaries.');

    ---------------------------------------------------------------------------
    -- CASE 34: Hearing Loss and Speech (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Non-Verbal 2-Year-Old' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Non-Verbal 2-Year-Old', 'A child is brought in because he has no words at age 2. He is otherwise social and interactive.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Non-Verbal 2-Year-Old', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first and most essential test for any child with a language delay?', '["Brain CT", "Audiology (Hearing) evaluation", "Karyotype", "None"]', 1, 'A child who cannot hear cannot learn to speak normally.'),
    (v_case_id, 'What type of hearing loss is commonly caused by chronic middle ear effusions?', '["Sensorineural", "Conductive", "Central", "None"]', 1, 'Fluid in the middle ear blocks the physical transmission of sound waves.'),
    (v_case_id, 'If hearing is normal, what is the next step for a 2-year-old with no words?', '["Wait 6 months", "Referral for Speech-Language Therapy and early intervention", "None", "None"]', 1, 'Early intervention is critical for better outcomes.');

    ---------------------------------------------------------------------------
    -- CASE 35: Toilet Training Readiness (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Potty Training' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Potty Training', 'A mother asks when she should start toilet training her 20-month-old.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Potty Training', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a sign of physical readiness for toilet training?', '["Walking", "Staying dry for 2 hours and showing interest in the bathroom", "Talking", "None"]', 1, 'Bladder capacity and awareness of the urge are necessary.'),
    (v_case_id, 'At what age are most children in the US successfully toilet trained?', '["18 months", "Between 2 and 3 years", "5 years", "None"]', 1, 'There is wide variation, but readiness usually peaks in the mid-2s.'),
    (v_case_id, 'What should a parent do if a child strongly resists toilet training?', '["Force it", "Stop and try again in a few months", "Punishment", "None"]', 1, 'Forcing can lead to stool withholding and chronic constipation.');

    ---------------------------------------------------------------------------
    -- CASE 36: Angelman vs. Prader-Willi (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Genomic Imprinting' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Genomic Imprinting', 'A child with intellectual disability is being evaluated for a deletion on chromosome 15.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Genomic Imprinting', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis if the deletion is on the MATERNAL chromosome?', '["Prader-Willi", "Angelman Syndrome", "Down", "None"]', 1, 'Angelman is characterized by \"happy puppet\" behavior, ataxia, and severe ID.'),
    (v_case_id, 'What is the diagnosis if the deletion is on the PATERNAL chromosome?', '["Angelman", "Prader-Willi Syndrome", "Turner", "None"]', 1, 'Prader-Willi involves hypotonia in infancy followed by hyperphagia and obesity.'),
    (v_case_id, 'What is this phenomenon called where the phenotype depends on the parent of origin?', '["Dominance", "Genomic Imprinting", "Mutation", "None"]', 1, 'Genes are silenced differently in eggs vs sperm.');

    ---------------------------------------------------------------------------
    -- CASE 37: Pervasive Developmental Disorder (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Spectrum' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Spectrum', 'A 4-year-old child meets criteria for ASD but has very high language skills.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Spectrum', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Under DSM-5, what happened to the diagnosis of \"Asperger Syndrome\"?', '["It was renamed", "It was folded into the single diagnosis of Autism Spectrum Disorder (ASD)", "It was deleted", "None"]', 1, 'ASD now encompasses a wide range of functioning levels.'),
    (v_case_id, 'What determines the \"Level\" (1, 2, or 3) of an ASD diagnosis?', '["Intelligence", "The amount of support required for daily functioning", "Age", "None"]', 1, 'Level 1 requires support; Level 3 requires very substantial support.'),
    (v_case_id, 'Are children with ASD at higher risk for seizures?', '["No", "Yes, up to 30% may develop epilepsy", "Only boys", "None"]', 1, 'There is a strong neurobiological link between the two.');

    ---------------------------------------------------------------------------
    -- CASE 38: Stuttering (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dysfluency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dysfluency', 'A 3-year-old is repeating the first syllable of words when he is excited.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dysfluency', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is mild dysfluency normal in a preschooler?', '["No", "Yes, it is often a normal part of rapid language acquisition", "Only in girls", "None"]', 1, 'It typically resolves without intervention if parents remain patient.'),
    (v_case_id, 'What is a red flag for true stuttering (Childhood-Onset Fluency Disorder)?', '["Repeated words", "Visible struggle, facial tension, or tics while speaking", "Fast talking", "None"]', 1, 'Physical tension suggests a more significant dysfluency.'),
    (v_case_id, 'Should parents finish the child''s sentences to help them?', '["Yes", "No, this can increase pressure and worsen the stutter", "Maybe", "None"]', 1, 'Patience and modeling slow speech are better strategies.');

    ---------------------------------------------------------------------------
    -- CASE 39: Tic Disorders - Provisional (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Blinking Tics' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Blinking Tics', 'An 8-year-old has developed frequent eye blinking over the last 2 months.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Blinking Tics', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis if tics have lasted < 1 year?', '["Tourette", "Provisional Tic Disorder", "Epilepsy", "None"]', 1, 'Many childhood tics are transient.'),
    (v_case_id, 'Can tics be suppressed?', '["No", "Yes, briefly, but it is often followed by a \"rebound\" release", "Always", "None"]', 1, 'Tics are semi-voluntary; children can hold them in but it feels like a growing urge.'),
    (v_case_id, 'Do most childhood tics require medication?', '["Yes", "No, education and reassurance are usually sufficient unless they cause significant distress", "Never", "None"]', 1, 'Mild tics should be ignored to avoid drawing negative attention.');

    ---------------------------------------------------------------------------
    -- CASE 40: IEP vs. 504 Plan (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'School Support' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'School Support', 'A child with ADHD is having trouble finishing tests on time.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'School Support', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which plan provides ACCOMMODATIONS (like extra time) without necessarily needing specialized instruction?', '["IEP", "504 Plan", "Detention", "None"]', 1, '504 plans are for children who can follow the standard curriculum but need adjustments.'),
    (v_case_id, 'Which plan is required for a child who needs SPECIALIZED INSTRUCTION (e.g., a resource room)?', '["504 Plan", "IEP (Individualized Education Program)", "None", "None"]', 1, 'IEPs are for children with disabilities that impact their ability to learn the standard curriculum.'),
    (v_case_id, 'What is the \"Least Restrictive Environment\" (LRE)?', '["Home", "Education with non-disabled peers to the maximum extent appropriate", "A hospital", "None"]', 1, 'LRE is a core principle of special education law.');

    ---------------------------------------------------------------------------
    -- CASE 41: Reactive Attachment Disorder - RAD (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Early Neglect' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Early Neglect', 'A 4-year-old who was severely neglected in an orphanage rarely seeks comfort and shows very little emotional response to his foster parents.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Early Neglect', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Autism", "Reactive Attachment Disorder (RAD)", "ADHD", "None"]', 1, 'RAD is a consequence of inadequate care and lack of attachment in early life.'),
    (v_case_id, 'How is RAD differentiated from Autism?', '["Autism has no eye contact", "RAD is usually associated with a history of severe social neglect; Autism is not", "IQ", "None"]', 1, 'History is key for identifying attachment-related disorders.'),
    (v_case_id, 'What is the primary treatment for RAD?', '["Pills", "Providing a stable, nurturing, and predictable caregiving environment", "Boot camp", "None"]', 1, 'Healing occurs through the development of a secure attachment.');

    ---------------------------------------------------------------------------
    -- CASE 42: Dyscalculia (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Math Difficulty' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Math Difficulty', 'A 9-year-old reads well but cannot grasp basic concepts like addition or telling time.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Math Difficulty', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the specific learning disorder for mathematics?', '["Dyslexia", "Dyscalculia", "Dysgraphia", "None"]', 1, 'It involves severe difficulty in learning or comprehending arithmetic.'),
    (v_case_id, 'Is this due to low intelligence?', '["Yes", "No, specific learning disorders occur in children with average or above-average intelligence", "Always", "None"]', 1, 'There is a discrepancy between overall ability and specific math achievement.'),
    (v_case_id, 'What is a common sign of dyscalculia in older children?', '["Confusion with numbers and symbols, and difficulty with word problems", "Bad handwriting", "Cannot read", "None"]', 0, 'Basic number sense is often impaired.');

    ---------------------------------------------------------------------------
    -- CASE 43: Hand Dominance (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Left-Handed Baby' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Left-Handed Baby', 'A mother is excited because her 8-month-old baby already prefers using his left hand for everything.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Left-Handed Baby', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'At what age should hand dominance typically develop?', '["Birth", "After age 18-24 months", "6 months", "None"]', 1, 'Consistent hand preference before age 1 is abnormal.'),
    (v_case_id, 'What is the concern if a baby has a strong hand preference at 8 months?', '["He is a genius", "Weakness or motor deficit in the OTHER hand (e.g., hemiparetic CP)", "Nothing", "None"]', 1, 'Early handedness often suggests the child is only using one side because the other is impaired.'),
    (v_case_id, 'What is the physical exam term for the stiffness in the unused arm?', '["Flaccidity", "Spasticity", "Atrophy", "None"]', 1, 'Spasticity in a single limb or side points to cerebral palsy.');

    ---------------------------------------------------------------------------
    -- CASE 44: Toilet Training - Stool Withholding (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Potty Protest' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Potty Protest', 'A 3-year-old is being toilet trained but now refuses to poop and hides in a corner when he has to go.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Potty Protest', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of this behavior?', '["Anger", "Fear of painful defecation (Stool Withholding)", "Bad food", "None"]', 1, 'One painful bowel movement can lead to a cycle of withholding and worsening constipation.'),
    (v_case_id, 'What is the physical sign of withholding?', '["Diarrhea", "Posturing (crossing legs, standing on tiptoes, or hiding)", "Vomiting", "None"]', 1, 'The child is actively trying to keep the poop in.'),
    (v_case_id, 'How should parents respond?', '["Force the child on the toilet", "Stop training and treat the constipation with softeners", "Ignore it", "None"]', 1, 'The poop must be soft for training to be successful.');

    ---------------------------------------------------------------------------
    -- CASE 45: ADHD - Hyperactive (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Driven by a Motor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Driven by a Motor', 'A 6-year-old boy cannot sit still in his chair, constantly interrupts others, and acts as if \"driven by a motor\".', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Driven by a Motor', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Autism", "ADHD-Hyperactive/Impulsive type", "ODD", "None"]', 1, 'These are the core symptoms of hyperactivity and impulsivity.'),
    (v_case_id, 'Is it common for children to have BOTH inattentive and hyperactive symptoms?', '["No", "Yes, this is called the Combined type", "Always", "None"]', 1, 'Combined type is the most frequent presentation in clinical practice.'),
    (v_case_id, 'What is a common social consequence of hyperactive ADHD?', '["Being very popular", "Peer rejection due to intrusive or disruptive behavior", "No issues", "None"]', 1, 'ADHD often impacts a child''s ability to make and keep friends.');

    ---------------------------------------------------------------------------
    -- CASE 46: Intellectual Disability - ID (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Adaptive Functioning' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Adaptive Functioning', 'A teenager has an IQ of 65 but is able to hold a simple job and manage his own self-care.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Adaptive Functioning', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two criteria for a diagnosis of Intellectual Disability?', '["Low IQ only", "IQ < 70 AND deficits in adaptive functioning", "Poor grades", "None"]', 1, 'Both cognitive and practical life skills must be impaired.'),
    (v_case_id, 'What is \"Adaptive Functioning\"?', '["The ability to do math", "How well a person meets community standards of personal independence and social responsibility", "IQ score", "None"]', 1, 'It covers conceptual, social, and practical domains.'),
    (v_case_id, 'What is the classification for an IQ between 50 and 70?', '["Severe ID", "Mild Intellectual Disability", "Normal", "None"]', 1, 'Mild ID is the most common level.');

    ---------------------------------------------------------------------------
    -- CASE 47: Sensory Processing (BRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sensory Overload' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sensory Overload', 'A child screams and covers his ears at the sound of a vacuum cleaner and refuses to wear clothes with tags.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sensory Overload', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this phenomenon called?', '["Defiance", "Sensory Over-responsivity", "Loudness", "None"]', 1, 'The brain over-responds to sensory input.'),
    (v_case_id, 'Which developmental disorder is most frequently associated with sensory sensitivities?', '["ADHD", "Autism Spectrum Disorder", "Dyslexia", "None"]', 1, 'Sensory issues are now part of the diagnostic criteria for ASD.'),
    (v_case_id, 'What type of therapy is often recommended for sensory issues?', '["Speech therapy", "Occupational Therapy (OT)", "Physical therapy", "None"]', 1, 'OTs help children regulate and respond to sensory input.');

    ---------------------------------------------------------------------------
    -- CASE 48: Nightmares (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Scary Dream' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Scary Dream', 'A 6-year-old wakes up crying at 4 AM and can vividly describe a scary monster that was chasing her.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Scary Dream', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this a nightmare or a sleep terror?', '["Sleep terror", "Nightmare", "Seizure", "None"]', 1, 'Nightmares occur during REM sleep, are vividly remembered, and the child is easily comforted.'),
    (v_case_id, 'During which part of the night do nightmares usually occur?', '["Early night", "Late night / Early morning", "Nap time only", "None"]', 1, 'REM sleep is more frequent toward the end of the night.'),
    (v_case_id, 'Does the child remember a nightmare the next morning?', '["No", "Yes", "Maybe", "None"]', 1, 'Memory of the dream is a key differentiator from sleep terrors.');

    ---------------------------------------------------------------------------
    -- CASE 49: Intellectual Disability - Most Common (Nelson)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Most Common Cause' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Most Common Cause', 'A student is reviewing the etiology of intellectual disability.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Most Common Cause', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common GENETIC cause of intellectual disability?', '["Fragile X", "Down Syndrome (Trisomy 21)", "FAS", "None"]', 1, 'Trisomy 21 is the leading chromosomal cause.'),
    (v_case_id, 'In many cases of mild intellectual disability, what is the identified cause?', '["Genetic mutation", "Unknown / Multifactorial", "Birth injury", "None"]', 1, 'In about 50% of mild cases, no specific medical cause is found.'),
    (v_case_id, 'What is the importance of early intervention in ID?', '["It cures the ID", "It maximizes the child''s potential and prevents secondary complications", "No importance", "None"]', 1, 'Early support leads to better long-term outcomes.');

    ---------------------------------------------------------------------------
    -- CASE 50: Development - Red Flag for Regression (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Losing Skills' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Losing Skills', 'A mother reports that her 15-month-old, who was saying 5 words, now says nothing at all.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Losing Skills', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most concerning developmental finding?', '["Delayed walking", "Regression (loss of previously acquired skills)", "Slow speech", "None"]', 1, 'Regression is always a red flag and requires urgent evaluation.'),
    (v_case_id, 'What are the two most common conditions associated with developmental regression?', '["ADHD and Asthma", "Autism Spectrum Disorder and Metabolic/Neurologic disorders", "Cold", "None"]', 1, 'Regression is a hallmark of many rare but serious conditions.'),
    (v_case_id, 'Should you ever \"wait and see\" when a child loses a skill?', '["Yes", "No, immediate evaluation is necessary", "Sometimes", "None"]', 1, 'Time is of the essence when regression occurs.');

    RAISE NOTICE 'SUCCESS: 50 Developmental Pediatrics Case Blocks registered.';
END $$;

COMMIT;
