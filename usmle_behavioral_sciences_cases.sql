-- MediHelp: USMLE Step 1 - Behavioral Sciences (50 Case Blocks)
-- High-yield clinical cases for Behavioral Sciences with integrated board-style questions.

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Ensure "Behavioral Sciences" Topic exists for USMLE Step 1
    INSERT INTO public.topics (title, slug, usmle_step, "order")
    VALUES ('Behavioral Sciences', 'behavioral-sciences-usmle-1', 1, 10)
    ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title
    RETURNING id INTO v_topic_id;

    -- 2. Ensure Unique Constraint on case_studies to allow for idempotent inserts
    -- (This fixes the error: ERROR: 42P10: there is no unique or exclusion constraint)
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'case_studies_topic_id_title_key'
    ) THEN
        -- Handle potential existing duplicates before adding constraint
        -- (Optional: clean up if duplicates exist, but here we just try to add it)
        BEGIN
            ALTER TABLE public.case_studies ADD CONSTRAINT case_studies_topic_id_title_key UNIQUE (topic_id, title);
        EXCEPTION WHEN OTHERS THEN
            RAISE NOTICE 'Could not add unique constraint on case_studies. Ensure no duplicates exist for (topic_id, title).';
        END;
    END IF;

    -- 3. Insert Cases
    -- Note: We now use ON CONFLICT (topic_id, title)

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 1: GAD
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 1: Excessive Worry', 'A 24-year-old medical student becomes intensely anxious before exams. For 6 months, she has had excessive worry about grades, finances, and family health. She feels restless, fatigued, and has poor concentration. Physical exam and thyroid studies are normal.', 1)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Panic disorder", "Generalized anxiety disorder", "Adjustment disorder", "Obsessive-compulsive disorder", "Illness anxiety disorder"]'::jsonb, 1, 'Excessive uncontrollable worry for >6 months with somatic symptoms suggests GAD.'),
    (v_case_id, 'First-line treatment includes:', '["Haloperidol", "Lithium", "SSRI and psychotherapy", "Clozapine", "Carbamazepine"]'::jsonb, 2, 'First-line for GAD: SSRIs/SNRIs and CBT.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 2: Panic Disorder with Agoraphobia
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 2: Sudden Palpitations', 'A 31-year-old woman has sudden episodes of palpitations, chest tightness, trembling, and fear of dying that peak within minutes. She now avoids malls because she fears another episode.', 2)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Social anxiety disorder", "Panic disorder with agoraphobia", "Specific phobia", "Acute stress disorder", "Separation anxiety disorder"]'::jsonb, 1, 'Recurrent unexpected panic attacks with avoidance behavior indicates panic disorder.'),
    (v_case_id, 'Best long-term treatment?', '["Benzodiazepine only", "SSRI plus CBT", "Buspirone only", "ECT", "Beta-blocker only"]'::jsonb, 1, 'Long-term treatment is SSRI + CBT.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 3: Social Anxiety Disorder
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 3: Public Speaking Fear', 'A 27-year-old man is terrified of public speaking. He knows the fear is excessive but avoids presentations because he fears embarrassment.', 3)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Panic disorder", "Social anxiety disorder", "Delusional disorder", "Avoidant personality disorder", "OCD"]'::jsonb, 1, 'Fear of scrutiny and embarrassment is social anxiety disorder.'),
    (v_case_id, 'Best medication for performance-only situations?', '["Propranolol", "Clozapine", "Phenelzine", "Valproate", "Disulfiram"]'::jsonb, 0, 'Propranolol helps performance-only anxiety by blocking physical symptoms.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 4: Specific Phobia
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 4: Dog Phobia', 'A child becomes extremely distressed around dogs after being bitten once 2 years ago. He avoids parks and cries when he sees one.', 4)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Separation anxiety disorder", "Specific phobia", "PTSD", "ODD", "Autism spectrum disorder"]'::jsonb, 1, 'This is a specific phobia.'),
    (v_case_id, 'Best psychotherapy?', '["Free association", "Exposure therapy", "Supportive therapy only", "Dream analysis", "Aversion therapy"]'::jsonb, 1, 'Best treatment is exposure-based therapy.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 5: OCD
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 5: Contamination Fears', 'A 29-year-old woman has intrusive thoughts that she contaminated her baby and washes her hands dozens of times daily. She recognizes the thoughts are irrational.', 5)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Psychotic disorder", "Illness anxiety disorder", "OCD", "OCPD", "Delusional disorder"]'::jsonb, 2, 'Obsessions + compulsions + insight = OCD.'),
    (v_case_id, 'Best treatment?', '["Exposure and response prevention with SSRI", "Lithium and CBT", "Haloperidol only", "Benzodiazepines only", "Bupropion"]'::jsonb, 0, 'First-line: SSRI + exposure/response prevention.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 6: Acute Stress Disorder
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 6: Witnessing a Crash', 'A 32-year-old man witnessed a fatal car crash 2 weeks ago. He now has nightmares, intrusive memories, hypervigilance, and avoids driving.', 6)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["PTSD", "Acute stress disorder", "Adjustment disorder", "Panic disorder", "Brief psychotic disorder"]'::jsonb, 1, 'Trauma-related symptoms 3 days to 1 month indicate acute stress disorder.'),
    (v_case_id, 'If symptoms persist beyond 1 month, diagnosis becomes:', '["GAD", "PTSD", "Somatic symptom disorder", "Persistent depressive disorder", "Dissociative fugue"]'::jsonb, 1, 'Symptoms >1 month suggest PTSD.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 7: PTSD
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 7: Military Veteran', 'A military veteran has nightmares, flashbacks, exaggerated startle response, irritability, and emotional numbness for 8 months after combat deployment.', 7)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Acute stress disorder", "PTSD", "Adjustment disorder", "Panic disorder", "Cyclothymic disorder"]'::jsonb, 1, 'Persistent trauma symptoms indicate PTSD.'),
    (v_case_id, 'Common associated neurobiologic finding:', '["Increased hippocampal volume", "Decreased norepinephrine activity", "Increased amygdala reactivity", "Increased melatonin secretion", "Increased dopamine"]'::jsonb, 2, 'PTSD is associated with amygdala hyperreactivity.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 8: Adjustment Disorder
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 8: Job Loss', 'A 38-year-old woman develops low mood, tearfulness, and insomnia after losing her job 2 months ago. She remains hopeful and her symptoms do not meet criteria for major depression.', 8)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Adjustment disorder", "MDD", "Persistent depressive disorder", "GAD", "Bereavement only"]'::jsonb, 0, 'Emotional/behavioral symptoms after a stressor that do not fully meet another disorder suggest adjustment disorder.'),
    (v_case_id, 'Core feature distinguishing this from MDD:', '["Presence of suicidal ideation", "Symptoms occur in response to a stressor and are subthreshold", "Delusions", "Duration >2 years", "Mania history"]'::jsonb, 1, 'Adjustment disorder is subthreshold for MDD.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 9: MDD
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 9: Major Depression', 'A 26-year-old woman has depressed mood, anhedonia, guilt, poor sleep, low appetite, and passive suicidal thoughts for 5 weeks.', 9)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Bereavement", "Major depressive disorder", "Cyclothymia", "PMDD", "Adjustment disorder"]'::jsonb, 1, '≥2 weeks of depressive symptoms with impairment suggests MDD.'),
    (v_case_id, 'Neurovegetative symptom most classically associated with depression:', '["Grandiosity", "Decreased need for sleep", "Early morning awakening", "Pressured speech", "Flight of ideas"]'::jsonb, 2, 'Early morning awakening is a classic vegetative sign of depression.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 10: PDD (Dysthymia)
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 10: Chronic Low Mood', 'A 42-year-old man has had chronic low mood, poor self-esteem, and hopelessness “for as long as I can remember,” with no symptom-free period longer than 2 months in 3 years.', 10)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Cyclothymic disorder", "Persistent depressive disorder", "Adjustment disorder", "Bipolar II disorder", "MDD with psychotic features"]'::jsonb, 1, 'Chronic depression for ≥2 years indicates persistent depressive disorder.'),
    (v_case_id, 'Minimum duration in adults?', '["2 weeks", "1 month", "6 months", "2 years", "5 years"]'::jsonb, 3, 'PDD requires 2 years in adults (1 year in children/adolescents).')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 11: Bipolar I (Mania)
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 11: Grandiosity and Shopping', 'A 23-year-old man has 5 days of euphoric mood, grandiosity, pressured speech, risky spending, and only 2 hours of sleep nightly without fatigue. He is hospitalized after trying to buy three cars.', 11)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This episode is:', '["Hypomania", "Mania", "Cyclothymia", "ADHD", "Brief psychotic disorder"]'::jsonb, 1, 'Marked impairment/hospitalization indicates mania.'),
    (v_case_id, 'Most likely overall diagnosis if he also had prior depressive episodes?', '["Bipolar I disorder", "Bipolar II disorder", "Cyclothymia", "Schizoaffective disorder", "Substance use disorder"]'::jsonb, 0, 'Mania defines bipolar I, regardless of depressive history.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 12: Bipolar II (Hypomania)
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 12: Recurrent Depression and Energy', 'A 28-year-old woman has recurrent major depressive episodes and periods of elevated mood with increased energy, decreased sleep, and talkativeness lasting 4 days, but no hospitalization or marked impairment.', 12)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Elevated episodes are:', '["Mania", "Hypomania", "Cyclothymia", "Mixed psychosis", "Dysthymia"]'::jsonb, 1, 'Hypomania lasts ≥4 days and does not require hospitalization.'),
    (v_case_id, 'Most likely diagnosis?', '["Bipolar I disorder", "Bipolar II disorder", "Persistent depressive disorder", "Borderline personality disorder", "PMDD"]'::jsonb, 1, 'Hypomania + major depression = bipolar II disorder.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 13: Cyclothymic Disorder
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 13: Fluctuating Moods', 'A 20-year-old college student has 1 year of fluctuating mild depressive symptoms and brief periods of increased energy that never meet full criteria for major depression or hypomania.', 13)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Cyclothymic disorder", "Bipolar I disorder", "Persistent depressive disorder", "GAD", "Borderline personality disorder"]'::jsonb, 0, 'Chronic subthreshold hypomanic and depressive symptoms suggest cyclothymic disorder.'),
    (v_case_id, 'Cyclothymia is related conceptually to:', '["Schizophrenia", "Bipolar spectrum disorders", "Somatic disorders", "Dissociative disorders", "Eating disorders"]'::jsonb, 1, 'It is on the bipolar spectrum.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 14: Schizophrenia Symptoms
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 14: Thought Insertion', 'A man with schizophrenia has auditory hallucinations, flat affect, avolition, and poor grooming for years. He believes strangers insert thoughts into his head.', 14)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Thought insertion is a:', '["Negative symptom", "First-rank psychotic symptom", "Compulsion", "Dissociative symptom", "Cognitive distortion"]'::jsonb, 1, 'Thought insertion/withdrawal are classic psychotic symptoms.'),
    (v_case_id, 'Negative symptoms include:', '["Delusions and hallucinations", "Avolition and alogia", "Mania and insomnia", "Anxiety and tremor", "Obsessions and compulsions"]'::jsonb, 1, 'Avolition/alogia/affective flattening are negative symptoms.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 15: Schizophreniform
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 15: Psychotic Features for 4 Months', 'A 25-year-old man has 4 months of delusions, auditory hallucinations, disorganized speech, and social withdrawal.', 15)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Schizophreniform disorder", "Schizophrenia", "Brief psychotic disorder", "Delusional disorder", "Schizoaffective disorder"]'::jsonb, 0, 'Symptoms lasting 1–6 months suggest schizophreniform disorder.'),
    (v_case_id, 'Duration required for schizophrenia diagnosis?', '["1 day", "1 week", "1 month", "6 months total disturbance", "2 years"]'::jsonb, 3, 'Schizophrenia requires ≥6 months of continuous disturbance.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 16: Schizoaffective
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 16: Schizoaffective Disorder', 'A 34-year-old woman has chronic schizophrenia and then develops a major depressive episode. There was also a 3-week period of hallucinations when mood symptoms were absent.', 16)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["MDD with psychotic features", "Schizoaffective disorder", "Schizophreniform disorder", "Bipolar I disorder", "Delusional disorder"]'::jsonb, 1, 'Schizoaffective requires psychosis independent of mood episodes.'),
    (v_case_id, 'Key distinguishing feature from mood disorder with psychotic features:', '["Panic attacks", "Psychosis occurs only during mood episodes", "Psychosis also occurs for at least 2 weeks without mood symptoms", "Presence of insomnia", "Presence of catatonia"]'::jsonb, 2, 'Psychosis must occur for ≥2 weeks in the absence of a major mood episode.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 17: Brief Psychotic Disorder
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 17: Postpartum Psychosis', 'A woman develops sudden hallucinations and disorganized speech for 3 days after giving birth. She had no prior psychiatric history and returns to baseline in 2 weeks.', 17)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Brief psychotic disorder", "Schizophrenia", "Delusional disorder", "OCD", "Bipolar II"]'::jsonb, 0, 'Psychosis lasting <1 month with full recovery suggests brief psychotic disorder.'),
    (v_case_id, 'Classic precipitant:', '["Chronic sleep deprivation", "Severe psychosocial stress", "Personality disorder", "Hyperthyroidism", "Alcohol withdrawal"]'::jsonb, 1, 'Brief psychotic disorder is often triggered by severe stress (e.g., bereavement, childbirth).')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 18: Delusional Disorder
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 18: The IRS Spying', 'A 44-year-old accountant believes with fixed conviction that the IRS is spying on him, but he otherwise functions well and has no hallucinations or disorganization.', 18)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Delusional disorder", "Schizophrenia", "Paranoid personality disorder", "OCD", "Illness anxiety disorder"]'::jsonb, 0, 'Delusional disorder involves one or more delusions with relatively preserved functioning.'),
    (v_case_id, 'Hallucinations in this disorder are:', '["Prominent and bizarre", "Required for diagnosis", "Absent or not prominent", "Only visual", "Only tactile"]'::jsonb, 2, 'Hallucinations are not a prominent feature of delusional disorder.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 19: Borderline Personality
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 19: Unstable Relationships', 'A 19-year-old college student has identity disturbance, unstable relationships, recurrent self-cutting, and frantic efforts to avoid abandonment.', 19)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Histrionic personality disorder", "Borderline personality disorder", "Bipolar II disorder", "Dependent personality disorder", "Narcissistic personality disorder"]'::jsonb, 1, 'Classic BPD: unstable mood, self-harm, abandonment fear.'),
    (v_case_id, 'Most effective psychotherapy:', '["Psychoanalysis", "Dialectical behavior therapy", "Exposure therapy", "Aversion therapy", "Hypnosis"]'::jsonb, 1, 'DBT is the gold standard for BPD.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 20: Histrionic Personality
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 20: Dramatic Behavior', 'A 35-year-old man exaggerates emotions, speaks dramatically, and is uncomfortable when not the center of attention. He dresses provocatively and relationships seem more intimate to him than they are.', 20)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Borderline personality disorder", "Histrionic personality disorder", "Narcissistic personality disorder", "Dependent personality disorder", "Antisocial personality disorder"]'::jsonb, 1, 'Histrionic PD: attention seeking, drama, seductive behavior.'),
    (v_case_id, 'Core trait:', '["Restricted affect", "Attention seeking", "Suspiciousness", "Perfectionism", "Social inhibition"]'::jsonb, 1, 'Attention seeking is the hallmark.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 21: Narcissistic Personality
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 21: The Executive', 'A successful executive has grandiosity, needs admiration, and reacts with rage to mild criticism. He lacks empathy for coworkers.', 21)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Narcissistic personality disorder", "Histrionic personality disorder", "OCPD", "Antisocial personality disorder", "Paranoid personality disorder"]'::jsonb, 0, 'Narcissistic PD: grandiosity, lack of empathy, criticism rage.'),
    (v_case_id, 'Defense mechanism commonly seen:', '["Splitting", "Reaction formation", "Projection of self-esteem threats", "Undoing", "Sublimation"]'::jsonb, 2, 'Projecting inadequacy onto others is common in narcissism.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 22: Antisocial Personality
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 22: Manipulation and No Remorse', 'A 27-year-old man repeatedly lies, steals, and manipulates others for profit. He has multiple arrests and shows no remorse. He had conduct problems at age 12.', 22)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Antisocial personality disorder", "Narcissistic personality disorder", "Borderline personality disorder", "ODD", "Intermittent explosive disorder"]'::jsonb, 0, 'Antisocial PD: disregard for rights, no remorse, arrests.'),
    (v_case_id, 'Requirement before age 15:', '["Major depression", "Conduct disorder", "Autism", "ADHD", "Mania"]'::jsonb, 1, 'Antisocial PD requires evidence of Conduct Disorder before age 15.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 23: Avoidant Personality
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 23: Social Inhibition', 'A woman is socially inhibited, feels inadequate, and avoids jobs involving public contact despite wanting close relationships.', 23)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Schizoid personality disorder", "Avoidant personality disorder", "Social anxiety disorder", "Dependent personality disorder", "Paranoid personality disorder"]'::jsonb, 1, 'Avoidant PD: desires relationships but fears rejection/inadequacy.'),
    (v_case_id, 'Distinguishing from schizoid personality:', '["Avoidant patients desire relationships", "Avoidant patients enjoy isolation", "Schizoid patients fear criticism", "Avoidant patients have psychosis", "Schizoid patients are dramatic"]'::jsonb, 0, 'Schizoid patients have no desire for close relationships; Avoidant patients do.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 24: Dependent Personality
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 24: Decision Difficulty', 'A man cannot make everyday decisions without excessive reassurance, tolerates mistreatment to keep support, and urgently seeks a new relationship when one ends.', 24)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Borderline personality disorder", "Dependent personality disorder", "OCPD", "Avoidant personality disorder", "Schizotypal personality disorder"]'::jsonb, 1, 'Dependent PD: need for reassurance, fear of being alone.'),
    (v_case_id, 'Core theme:', '["Odd beliefs", "Need to be taken care of", "Perfectionism", "Grandiosity", "Emotional detachment"]'::jsonb, 1, 'Need to be taken care of is central.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 25: OCPD
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 25: The Perfectionist Physician', 'A physician refuses to delegate tasks because coworkers “never do it correctly.” He is rigid, miserly, perfectionistic, and devoted to rules and lists.', 25)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["OCD", "OCPD", "Narcissistic personality disorder", "GAD", "Autism spectrum disorder"]'::jsonb, 1, 'OCPD: perfectionism, rigidity, ego-syntonic.'),
    (v_case_id, 'Distinguishing feature from OCD:', '["OCPD is ego-syntonic", "OCPD has intrusive obsessions", "OCD lacks distress", "OCPD requires compulsions", "OCD is ego-syntonic"]'::jsonb, 0, 'OCPD is ego-syntonic (patient views it as correct); OCD is ego-dystonic (distressing).')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 26: ADHD
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 26: Fidgeting and Poor Concentration', 'A 6-year-old boy is inattentive, fidgets constantly, interrupts others, and performs poorly at school and home. Symptoms started before age 12.', 26)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["ODD", "Conduct disorder", "ADHD", "Autism spectrum disorder", "Specific learning disorder"]'::jsonb, 2, 'ADHD requires symptoms in 2 settings with onset before age 12.'),
    (v_case_id, 'First-line medication for many school-age children:', '["Fluoxetine", "Methylphenidate", "Haloperidol", "Lithium", "Buspirone"]'::jsonb, 1, 'Stimulants (like Methylphenidate) are first-line.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 27: Specific Learning Disorder
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 27: Reading Struggles', 'An 8-year-old girl has normal intelligence but struggles specifically with reading despite adequate instruction and support.', 27)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["ADHD", "Autism spectrum disorder", "Specific learning disorder", "Intellectual disability", "Language disorder"]'::jsonb, 2, 'A circumscribed academic problem (e.g., dyslexia) suggests specific learning disorder.'),
    (v_case_id, 'Intellectual disability requires deficits in:', '["Reading only", "Social communication only", "Intellectual and adaptive functioning", "Mood regulation only", "Motor coordination only"]'::jsonb, 2, 'ID requires both low IQ (<70) and adaptive deficits.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 28: Autism Spectrum Disorder
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 28: Repetitive Flapping', 'A 4-year-old child has poor eye contact, restricted interests, repetitive hand-flapping, and language delay.', 28)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Social anxiety disorder", "ADHD", "Autism spectrum disorder", "Reactive attachment disorder", "Childhood-onset schizophrenia"]'::jsonb, 2, 'ASD: social communication deficits and repetitive behaviors.'),
    (v_case_id, 'Core diagnostic domains include:', '["Inattention and hyperactivity", "Social communication deficits and restricted repetitive behaviors", "Low IQ and aggression", "Anxiety and obsessions", "Separation anxiety and panic"]'::jsonb, 1, 'Deficits in social-emotional reciprocity and restricted/repetitive patterns are key.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 29: ODD
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 29: Defiant Behavior', 'A 10-year-old boy is argumentative, loses temper, and actively defies adults but has not violated major rights of others.', 29)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Conduct disorder", "ODD", "ADHD", "Antisocial personality disorder", "DMDD"]'::jsonb, 1, 'ODD involves defiant behavior without severe aggression or rights violations.'),
    (v_case_id, 'Which finding would suggest conduct disorder instead?', '["Temper tantrums", "Irritability", "Cruelty to animals", "Argumentativeness", "Blaming others"]'::jsonb, 2, 'Animal cruelty, theft, or fire-setting suggest Conduct Disorder.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 30: Conduct Disorder
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 30: Property Destruction', 'A 14-year-old repeatedly bullies classmates, destroys property, steals, and recently set a small fire.', 30)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["ODD", "Conduct disorder", "ADHD", "Intermittent explosive disorder", "Antisocial personality disorder"]'::jsonb, 1, 'Severe rights violations and aggression indicate conduct disorder.'),
    (v_case_id, 'Adult disorder associated later:', '["Narcissistic personality disorder", "Antisocial personality disorder", "Borderline personality disorder", "Schizotypal personality disorder", "Cyclothymia"]'::jsonb, 1, 'Conduct disorder before age 15 is a prerequisite for Antisocial PD.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 31: 2-Year-Old Milestones
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 31: Toddler Development', 'A mother brings her 2-year-old for a routine visit. The child walks up stairs with both feet on each step, uses 2-word phrases, and imitates household tasks.', 31)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely developmental age?', '["12 months", "18 months", "24 months", "36 months", "48 months"]'::jsonb, 2, '2-word phrases and walking up stairs (both feet) are 24-month milestones.'),
    (v_case_id, 'A typical language milestone at this age:', '["Says only mama/dada", "Uses 2-word sentences", "Counts to 10", "Reads simple words", "Speaks in full paragraphs"]'::jsonb, 1, 'A 2-year-old should have ~50-200 words and 2-word phrases.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 32: Sensorimotor Stage
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 32: Peekaboo', 'A 9-month-old infant plays peekaboo and cries when the mother leaves the room.', 32)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This behavior reflects development of:', '["Conservation", "Object permanence", "Formal operations", "Superego", "Generativity"]'::jsonb, 1, 'Object permanence develops during the sensorimotor stage (birth-2 years).'),
    (v_case_id, 'Piaget stage:', '["Sensorimotor", "Preoperational", "Concrete operational", "Formal operational", "Postconventional"]'::jsonb, 0, 'The first stage of cognitive development.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 33: Preoperational Stage
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 33: Sad Toys', 'A 5-year-old believes the moon follows him and that broken toys are “sad.”', 33)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This illustrates:', '["Conservation", "Abstract reasoning", "Egocentrism and animism", "Object permanence", "Identity diffusion"]'::jsonb, 2, 'Egocentrism (moon follows) and animism (sad toys) are preoperational traits.'),
    (v_case_id, 'Piaget stage:', '["Sensorimotor", "Preoperational", "Concrete operational", "Formal operational", "Latency"]'::jsonb, 1, 'Preoperational stage occurs roughly ages 2-7.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 34: Concrete Operational Stage
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 34: Water Conservation', 'A 9-year-old understands that the amount of water remains the same when poured into a differently shaped glass.', 34)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This demonstrates:', '["Object permanence", "Conservation", "Symbolic play", "Abstract logic", "Moral relativism"]'::jsonb, 1, 'Conservation is the understanding that quantity is independent of shape.'),
    (v_case_id, 'Piaget stage:', '["Sensorimotor", "Preoperational", "Concrete operational", "Formal operational", "Trust vs mistrust"]'::jsonb, 2, 'Concrete operational stage occurs roughly ages 7-11.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 35: Formal Operational Stage
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 35: Hypothetical Scenarios', 'A 16-year-old can reason about hypothetical scenarios and discuss political ideology abstractly.', 35)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Piaget stage?', '["Sensorimotor", "Preoperational", "Concrete operational", "Formal operational", "None"]'::jsonb, 3, 'Formal operational stage starts around age 11.'),
    (v_case_id, 'Characteristic ability:', '["Egocentrism only", "Hypothetical-deductive reasoning", "Object permanence", "Separation individuation", "Stranger anxiety"]'::jsonb, 1, 'The ability to think abstractly and deductively.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 36: Industry vs Inferiority
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 36: School-Age Pride', 'A 7-year-old wants praise from teachers and becomes proud after learning to tie shoes and read independently.', 36)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Erikson stage?', '["Initiative vs guilt", "Industry vs inferiority", "Identity vs role confusion", "Generativity vs stagnation", "Autonomy vs shame"]'::jsonb, 1, 'School age (6-12 years) is focused on industry.'),
    (v_case_id, 'Positive resolution leads to:', '["Fidelity", "Competence", "Hope", "Love", "Wisdom"]'::jsonb, 1, 'Success in this stage yields a sense of competence.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 37: Identity vs Role Confusion
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 37: "Who Am I?"', 'A 16-year-old experiments with clothing styles, peer groups, and career ideas while asking, “Who am I?”', 37)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Erikson stage?', '["Industry vs inferiority", "Identity vs role confusion", "Intimacy vs isolation", "Generativity vs stagnation", "Trust vs mistrust"]'::jsonb, 1, 'Adolescence (12-20 years) centers on identity formation.'),
    (v_case_id, 'Positive outcome yields:', '["Love", "Hope", "Fidelity", "Care", "Purpose"]'::jsonb, 2, 'Resolution leads to fidelity to one’s self.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 38: Integrity vs Despair
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 38: Peaceful Reflection', 'A 68-year-old retired teacher reflects on life with satisfaction and accepts mortality peacefully.', 38)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Erikson stage?', '["Intimacy vs isolation", "Generativity vs stagnation", "Ego integrity vs despair", "Industry vs inferiority", "Identity vs role confusion"]'::jsonb, 2, 'Late adulthood (65+ years) is focused on integrity.'),
    (v_case_id, 'Negative resolution would produce:', '["Guilt", "Despair", "Shame", "Inferiority", "Isolation"]'::jsonb, 1, 'Failure to find meaning leads to despair.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 39: Denial
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 39: Refusal of Diagnosis', 'A patient refuses to acknowledge her new cancer diagnosis and insists the biopsy was mixed up.', 39)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Defense mechanism?', '["Projection", "Denial", "Displacement", "Intellectualization", "Sublimation"]'::jsonb, 1, 'Denial is refusal to accept an external reality.'),
    (v_case_id, 'This defense is generally classified as:', '["Psychotic/immature depending on severity", "Mature only", "Neurotic only", "Always pathological", "Conscious lying"]'::jsonb, 0, 'Denial can be a common initial reaction or a more severe pathological state.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 40: Displacement and Sublimation
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 40: Angry Resident', 'A resident angrily yells at his spouse after being humiliated by his attending.', 40)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Defense mechanism?', '["Sublimation", "Displacement", "Projection", "Reaction formation", "Undoing"]'::jsonb, 1, 'Displacement: shifting emotion from an unsafe to a safe target.'),
    (v_case_id, 'Which would be sublimation instead?', '["Yelling at spouse", "Channeling frustration into intense exercise", "Denying anger", "Attributing anger to others", "Becoming overly affectionate to attending"]'::jsonb, 1, 'Sublimation is channeling impulses into socially acceptable actions.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 41: Reaction Formation
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 41: Excessive Kindness', 'A man who feels hostile toward his brother becomes excessively kind and protective toward him.', 41)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Defense mechanism?', '["Reaction formation", "Suppression", "Splitting", "Rationalization", "Regression"]'::jsonb, 0, 'Reaction formation: transforming an unacceptable impulse into its opposite.'),
    (v_case_id, 'Reaction formation involves:', '["Returning to earlier stage", "Transforming impulse into opposite", "Attributing feelings to others", "Separating emotion from thought", "Postponing attention"]'::jsonb, 1, 'A classic example is a child who picks on a crush.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 42: Intellectualization
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 42: Cold Discussion', 'A surgeon calmly discusses every molecular detail of his spouse’s sudden death but shows no emotion.', 42)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Defense mechanism?', '["Suppression", "Intellectualization", "Undoing", "Projection", "Introjection"]'::jsonb, 1, 'Intellectualization: avoiding emotion by focusing on facts and logic.'),
    (v_case_id, 'Intellectualization differs from suppression because it is:', '["Conscious postponement", "Focus on facts to avoid emotional distress", "Returning to childlike behavior", "Converting feelings into physical symptoms", "Assigning feelings to others"]'::jsonb, 1, 'Suppression is conscious; intellectualization is often subconscious.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 43: Opioid Intoxication
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 43: Pinpoint Pupils', 'A patient with opioid use disorder becomes drowsy with pinpoint pupils and respiratory depression after heroin use.', 43)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely toxidrome?', '["Sympathomimetic", "Anticholinergic", "Opioid intoxication", "Sedative-hypnotic withdrawal", "Serotonin syndrome"]'::jsonb, 2, 'Pinpoint pupils + respiratory depression = Opioid Toxidrome.'),
    (v_case_id, 'Acute treatment?', '["Flumazenil", "Naloxone", "Methadone only", "Naltrexone", "Physostigmine"]'::jsonb, 1, 'Naloxone is an opioid antagonist used for reversal.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 44: Alcohol Withdrawal
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 44: Post-Surgical Tremors', 'A hospitalized patient becomes tremulous, anxious, hypertensive, and diaphoretic 18 hours after his last drink. He later develops visual hallucinations.', 44)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Opioid withdrawal", "Alcohol withdrawal", "Delirium due to infection", "Panic attack", "PCP intoxication"]'::jsonb, 1, 'Tremors/autonomic hyperactivity within 24-48h of last drink suggests withdrawal.'),
    (v_case_id, 'First-line treatment?', '["Haloperidol", "Diazepam or lorazepam", "Naloxone", "Disulfiram", "Fluoxetine"]'::jsonb, 1, 'Benzodiazepines are used to prevent seizures and delirium tremens.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 45: PCP Intoxication
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 45: Violent Agitation', 'A man is brought to the ED agitated and violent. He has vertical nystagmus, hypertension, analgesia, and appears detached from reality.', 45)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely substance?', '["Cocaine", "PCP", "LSD", "Alcohol", "Heroin"]'::jsonb, 1, 'PCP: violence, analgesia, nystagmus.'),
    (v_case_id, 'A common associated finding:', '["Miosis", "Severe respiratory depression", "Nystagmus", "Bradykinesia", "Hyperreflexia"]'::jsonb, 2, 'Vertical or horizontal nystagmus is highly characteristic of PCP.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 46: Cocaine/Amphetamine
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 46: Mydriasis and Paranoia', 'A student uses a stimulant before exams and presents with mydriasis, tachycardia, chest pain, and paranoia.', 46)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely substance?', '["Alcohol", "Heroin", "Cocaine or amphetamine intoxication", "Benzodiazepines", "Cannabis withdrawal"]'::jsonb, 2, 'Stimulants cause sympathomimetic activation and paranoia.'),
    (v_case_id, 'Mechanism of cocaine euphoria:', '["GABA agonism", "Mu-opioid receptor agonism", "Inhibition of monoamine reuptake", "NMDA antagonism", "Serotonin depletion"]'::jsonb, 2, 'Cocaine blocks reuptake of Dopamine, NE, and Serotonin.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 47: Adolescent Sleep
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 47: Night Owl', 'A 15-year-old sleeps about 8.5 hours nightly but struggles to wake early for school and performs better later in the day.', 47)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Best explanation?', '["Adolescents require less sleep than adults", "Normal circadian phase delay in adolescence", "Narcolepsy", "Obstructive sleep apnea", "Delirium"]'::jsonb, 1, 'Teens naturally have a delay in their sleep-wake cycle.'),
    (v_case_id, 'Sleep stage with most vivid dreaming:', '["N1", "N2", "N3", "REM", "Wakefulness only"]'::jsonb, 3, 'REM sleep is characterized by high brain activity and dreaming.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 48: Sleep Apnea
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 48: Loud Snoring', 'A 52-year-old obese man snores loudly, has daytime sleepiness, and his wife reports repeated breathing pauses at night.', 48)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most likely diagnosis?', '["Narcolepsy", "Obstructive sleep apnea", "REM behavior disorder", "Night terrors", "Insomnia disorder"]'::jsonb, 1, 'OSA is common in obese patients with snoring and apnea.'),
    (v_case_id, 'This condition is associated with increased risk of:', '["Hyperthyroidism", "Hypertension", "Huntington disease", "Delirium tremens", "Mania"]'::jsonb, 1, 'OSA is a major secondary cause of hypertension.')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 49: Biostatistics (Sensitivity)
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 49: High Sensitivity Test', 'A screening test for a fatal disease is made highly sensitive. Which effect is most likely?', 49)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Higher sensitivity means:', '["Fewer false positives", "Fewer false negatives", "Lower negative predictive value", "Higher prevalence", "Lower specificity"]'::jsonb, 1, 'Sensitivity = TP / (TP + FN). More sensitive = fewer FN.'),
    (v_case_id, 'A highly sensitive test is useful to:', '["Rule in disease when positive", "Rule out disease when negative", "Calculate prevalence directly", "Increase incidence", "Eliminate lead-time bias"]'::jsonb, 1, 'SnNout: Sensitivity Rules Out (when negative).')
    ON CONFLICT DO NOTHING;

    -- ─────────────────────────────────────────────────────────────────────────────
    -- CASE 50: Biostatistics (ARR/NNT)
    -- ─────────────────────────────────────────────────────────────────────────────
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 50: The Drug Trial', 'A randomized trial finds a new drug reduces 5-year mortality from 10% to 5%.', 50)
    ON CONFLICT (topic_id, title) DO UPDATE SET scenario = EXCLUDED.scenario
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Absolute risk reduction (ARR) is:', '["2%", "5%", "10%", "50%", "100%"]'::jsonb, 1, 'ARR = Control Risk - Treatment Risk = 0.10 - 0.05 = 0.05 (5%).'),
    (v_case_id, 'Number needed to treat (NNT) is:', '["5", "10", "20", "50", "100"]'::jsonb, 2, 'NNT = 1 / ARR = 1 / 0.05 = 20.'),
    (v_case_id, 'Relative risk reduction is:', '["5%", "10%", "20%", "50%", "100%"]'::jsonb, 3, 'RRR = ARR / Control Risk = 0.05 / 0.10 = 0.50 (50%).')
    ON CONFLICT DO NOTHING;

END $$;
