-- MediHelp: USMLE Step 1 - Biostatistics and Epidemiology (50 Case Blocks)
-- Idempotent Migration: Locates existing topic and ensures a clean state.

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Find existing "Biostatistics & Epidemiology" Topic for USMLE Step 1
    SELECT id INTO v_topic_id FROM public.topics 
    WHERE (title ILIKE '%Biostatistics%' OR title ILIKE '%Epidemiology%')
      AND usmle_step = 1 
    LIMIT 1;

    -- 2. If not found, create it (fallback)
    IF v_topic_id IS NULL THEN
        INSERT INTO public.topics (title, slug, usmle_step, "order")
        VALUES ('Biostatistics & Epidemiology', 'biostatistics-epidemiology-step-1', 1, 15)
        RETURNING id INTO v_topic_id;
    END IF;

    -- 3. CLEAN UP: Remove existing cases for this topic to ensure a clean state
    -- Cascading delete should handle case_questions if schema is set up, 
    -- but we target case_studies linked to this topic_id.
    DELETE FROM public.case_studies WHERE topic_id = v_topic_id;

    -- CASE 1
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Screening Test Evaluation', 'A screening test for colon cancer is evaluated in 1,000 asymptomatic adults. Of 100 people who truly have cancer, 90 test positive. Of 900 without cancer, 180 test positive.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'What is the sensitivity?', to_jsonb(ARRAY['10%', '20%', '50%', '80%', '90%']), 4, 'Sensitivity = 90/100 = 90%.'),
    (v_case_id, 'What is the specificity?', to_jsonb(ARRAY['20%', '50%', '80%', '90%', '98%']), 2, 'Specificity = 720/900 = 80%.'),
    (v_case_id, 'Which statement is most accurate?', to_jsonb(ARRAY['A negative test is poor for ruling out disease', 'A positive test is highly definitive because specificity is highest', 'The test is good for ruling out disease because sensitivity is high', 'Disease prevalence does not affect predictive values', 'This test has no false positives']), 2, 'High sensitivity makes a negative result useful for ruling out disease (SnNout).');

    -- CASE 2
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Prevalence and Predictive Values', 'A disease has a prevalence of 1% in the general population. A test has 99% sensitivity and 99% specificity. The physician is surprised that many positive tests are false positives.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which property is most strongly reduced in low-prevalence settings?', to_jsonb(ARRAY['Sensitivity', 'Specificity', 'Positive predictive value', 'Negative likelihood ratio', 'Relative risk']), 2, 'PPV falls when prevalence is low, even if sensitivity and specificity are excellent.'),
    (v_case_id, 'If disease prevalence rises, which usually rises as well?', to_jsonb(ARRAY['NPV', 'PPV', 'Specificity', 'Sensitivity', 'Type II error']), 1, 'Predictive values depend on prevalence; PPV increases with prevalence.'),
    (v_case_id, 'Which best explains this result?', to_jsonb(ARRAY['Prevalence strongly affects predictive values', 'Specificity changes with prevalence', 'Sensitivity falls in low-prevalence settings', 'Odds ratio becomes invalid', 'Incidence equals prevalence in rare disease']), 0, 'Predictive values depend on prevalence.');

    -- CASE 3
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Treatment Efficacy Measures', 'A trial of a new antihypertensive compares 5-year stroke risk. Stroke occurs in 12% of the control group and 8% of the treatment group.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'What is the absolute risk reduction?', to_jsonb(ARRAY['2%', '4%', '8%', '12%', '33%']), 1, 'ARR = 12% - 8% = 4%.'),
    (v_case_id, 'What is the relative risk reduction?', to_jsonb(ARRAY['4%', '12%', '25%', '33%', '50%']), 3, 'RRR = 4/12 = 33%.'),
    (v_case_id, 'What is the number needed to treat?', to_jsonb(ARRAY['8', '12', '20', '25', '33%']), 3, 'NNT = 1/0.04 = 25.');

    -- CASE 4
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Randomized Trial Metrics', 'In a randomized controlled trial, mortality is 20% in the placebo group and 10% in the treatment group.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'What is the relative risk?', to_jsonb(ARRAY['0.25', '0.5', '1.0', '2.0', '10']), 1, 'RR = 10% / 20% = 0.5.'),
    (v_case_id, 'What is the absolute risk reduction?', to_jsonb(ARRAY['5%', '10%', '20%', '50%', '100%']), 1, 'ARR = 20% - 10% = 10%.'),
    (v_case_id, 'The number needed to treat is:', to_jsonb(ARRAY['5', '10', '20', '50', '100']), 1, 'NNT = 1/0.10 = 10.');

    -- CASE 5
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Cohort Study Design', 'Researchers identify 500 smokers and 500 nonsmokers and follow them for 20 years to compare lung cancer incidence.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'What type of study is this?', to_jsonb(ARRAY['Case report', 'Cross-sectional study', 'Case-control study', 'Cohort study', 'Ecologic study']), 3, 'A cohort study starts with exposure status and follows for outcome.'),
    (v_case_id, 'Which measure can be directly calculated?', to_jsonb(ARRAY['Odds ratio only', 'Relative risk', 'Positive predictive value', 'Attributable risk cannot be calculated', 'Specificity']), 1, 'Cohort studies can directly estimate incidence and relative risk.'),
    (v_case_id, 'This design is especially good for:', to_jsonb(ARRAY['Rare diseases only', 'Rare exposures', 'Immediate causation proof', 'Measuring only prevalence', 'Eliminating all confounding']), 1, 'Cohort studies are efficient for rare exposures.');

    -- CASE 6
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Case-Control Study Design', 'Investigators select 300 women with ovarian cancer and 300 women without ovarian cancer and look backward to determine past talc use.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'What type of study is this?', to_jsonb(ARRAY['Cohort', 'Cross-sectional', 'Case-control', 'Clinical trial', 'Ecologic']), 2, 'Case-control studies begin with disease status and look back for exposures.'),
    (v_case_id, 'Which measure is typically calculated?', to_jsonb(ARRAY['Relative risk', 'Odds ratio', 'Incidence rate', 'Prevalence ratio', 'NNT']), 1, 'Case-control studies usually yield an odds ratio.'),
    (v_case_id, 'This design is especially useful for:', to_jsonb(ARRAY['Rare outcomes', 'Rare exposures', 'Measuring incidence directly', 'Proving treatment benefit', 'Calculating sensitivity']), 0, 'Case-control studies are efficient for rare outcomes.');

    -- CASE 7
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Cross-Sectional Survey', 'A physician surveys 2,000 adults one time to record smoking status and current chronic cough.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'What type of study is this?', to_jsonb(ARRAY['Cohort', 'Randomized trial', 'Cross-sectional', 'Case-control', 'Meta-analysis']), 2, 'Cross-sectional studies assess exposure and outcome at one point in time.'),
    (v_case_id, 'Which is directly measured?', to_jsonb(ARRAY['Incidence', 'Prevalence', 'Relative risk', 'Hazard ratio', 'Survival time']), 1, 'They measure prevalence.'),
    (v_case_id, 'Major limitation:', to_jsonb(ARRAY['Too expensive for common diseases', 'Temporal relationship is often unclear', 'Cannot assess any association', 'Only useful for interventions', 'Requires decades of follow-up']), 1, 'Temporal relationship is often unclear.');

    -- CASE 8
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Ecologic Study Design', 'A public health team compares average obesity rates and average soda consumption across 30 countries.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'What type of study is this?', to_jsonb(ARRAY['Case-control', 'Cohort', 'Ecologic', 'Cross-over trial', 'Randomized trial']), 2, 'Ecologic studies use group-level data.'),
    (v_case_id, 'A major limitation is:', to_jsonb(ARRAY['Impossible to study group data', 'Ecologic fallacy', 'Lead-time bias', 'Berkson bias only', 'Observer-expectancy bias only']), 1, 'They are prone to the ecologic fallacy.'),
    (v_case_id, 'Ecologic fallacy means:', to_jsonb(ARRAY['Group-level associations may not hold at the individual level', 'Individuals are randomized improperly', 'Outcomes are recalled poorly', 'Exposure is measured too precisely', 'Confounding never occurs']), 0, 'Group-level associations may not hold at the individual level.');

    -- CASE 9
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Randomized Controlled Trial', 'A randomized clinical trial assigns 1,000 patients to a new anticoagulant or standard therapy using computer-generated allocation.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Randomization primarily helps reduce:', to_jsonb(ARRAY['Recall bias', 'Confounding', 'Lead-time bias', 'Type I error', 'Publication bias']), 1, 'Randomization balances known and unknown confounders.'),
    (v_case_id, 'Blinding primarily reduces:', to_jsonb(ARRAY['Incidence', 'Observer and subject bias', 'Prevalence', 'Confounding from age only', 'Selection bias before enrollment only']), 1, 'Blinding reduces biased behavior and assessment.'),
    (v_case_id, 'The strongest design for testing efficacy is:', to_jsonb(ARRAY['Cross-sectional study', 'Case-control study', 'Randomized controlled trial', 'Ecologic study', 'Case series']), 2, 'RCT is the gold standard for efficacy.');

    -- CASE 10
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Loss to Follow-up', 'A trial comparing two diabetes drugs loses 30% of participants in one arm and 5% in the other.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This threatens validity mainly through:', to_jsonb(ARRAY['Lead-time bias', 'Attrition bias', 'Recall bias', 'Ecologic fallacy', 'Simpson paradox']), 1, 'Differential loss to follow-up creates attrition bias.'),
    (v_case_id, 'A useful analytic safeguard is:', to_jsonb(ARRAY['Intention-to-treat analysis', 'Odds ratio elimination', 'Removing difficult patients after randomization', 'Increasing alpha', 'Switching to case-control design']), 0, 'Intention-to-treat analysis helps preserve randomization.'),
    (v_case_id, 'Intention-to-treat means:', to_jsonb(ARRAY['Analyze only patients who completed treatment', 'Analyze patients according to original group assignment', 'Exclude nonadherent participants', 'Analyze only severe cases', 'Analyze only blinded participants']), 1, 'Analyze patients according to original group assignment.');

    -- CASE 11
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Highly Sensitive Test', 'A new rapid HIV test has 99% sensitivity.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'A highly sensitive test has:', to_jsonb(ARRAY['Few false positives', 'Few false negatives', 'High PPV regardless of prevalence', 'High specificity by definition', 'No bias']), 1, 'Sensitivity = TP / (TP + FN). High sensitivity means few false negatives.'),
    (v_case_id, 'Such a test is especially useful to:', to_jsonb(ARRAY['Rule in disease when positive', 'Rule out disease when negative', 'Calculate prevalence', 'Estimate hazard ratio', 'Detect confounding']), 1, 'High sensitivity makes a negative result useful for ruling out disease (SnNout).'),
    (v_case_id, 'The mnemonic is:', to_jsonb(ARRAY['SpPin', 'SnNout', 'RRR', 'NNT', 'CI95']), 1, 'SnNout: High Sensitivity, Negative result rules OUT.');

    -- CASE 12
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Highly Specific Test', 'A test for a rare endocrine tumor has 99% specificity.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'A highly specific test has:', to_jsonb(ARRAY['Few false negatives', 'Few false positives', 'Higher incidence', 'Lower prevalence', 'Lower sensitivity always']), 1, 'Specificity = TN / (TN + FP). High specificity means few false positives.'),
    (v_case_id, 'A positive result is best used to:', to_jsonb(ARRAY['Rule out disease', 'Rule in disease', 'Estimate survival time', 'Detect recall bias', 'Reduce confounding']), 1, 'High specificity means few false positives, so a positive result helps rule in disease (SpPin).'),
    (v_case_id, 'The mnemonic is:', to_jsonb(ARRAY['SnNout', 'SpPin', 'NPVonly', 'ARR', 'RRR']), 1, 'SpPin: High Specificity, Positive result rules IN.');

    -- CASE 13
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Outbreak Investigation', 'An outbreak investigation finds 40 new cases of salmonella among 200 picnic attendees over 2 days.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This measure is best described as:', to_jsonb(ARRAY['Prevalence', 'Incidence proportion (attack rate)', 'Odds ratio', 'Hazard ratio', 'Negative predictive value']), 1, 'Attack rate is a form of incidence proportion used in outbreaks.'),
    (v_case_id, 'The attack rate is:', to_jsonb(ARRAY['5%', '10%', '20%', '40%', '80%']), 2, 'Attack rate = 40/200 = 20%.'),
    (v_case_id, 'Attack rate is most useful in:', to_jsonb(ARRAY['Chronic disease follow-up', 'Outbreak investigations', 'Meta-analysis only', 'Case reports', 'Survival studies only']), 1, 'Commonly used in acute outbreaks.');

    -- CASE 14
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Chronic Disease Dynamics', 'A chronic disease becomes easier to treat, and patients live much longer with it, while incidence remains unchanged.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'What happens to prevalence?', to_jsonb(ARRAY['Decreases', 'Increases', 'Unchanged', 'Becomes zero', 'Equals incidence']), 1, 'Longer survival increases the pool of existing cases.'),
    (v_case_id, 'Why?', to_jsonb(ARRAY['Prevalence depends partly on disease duration', 'Prevalence is independent of duration', 'Incidence always rises with survival', 'Mortality determines prevalence alone', 'Bias causes all prevalence changes']), 0, 'Prevalence ≈ Incidence x Duration.'),
    (v_case_id, 'Which statement is true?', to_jsonb(ARRAY['Incidence = deaths/population', 'Incidence measures existing cases', 'Prevalence measures existing cases', 'Prevalence ignores duration', 'Incidence is always higher than prevalence']), 2, 'Prevalence measures existing cases at a point in time.');

    -- CASE 15
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Odds Ratio Interpretation', 'A case-control study reports an odds ratio of 4.0 for asbestos exposure among mesothelioma patients compared with controls.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This means:', to_jsonb(ARRAY['Exposure is 4 times more common among cases relative to controls', 'Risk is directly proven to be 4-fold', 'Incidence is 4%', 'There is no association', 'The study is randomized']), 0, 'In case-control studies, OR describes exposure odds.'),
    (v_case_id, 'In rare diseases, the odds ratio approximates:', to_jsonb(ARRAY['Prevalence', 'Relative risk', 'Sensitivity', 'Specificity', 'NNT']), 1, 'For rare diseases, OR approximates RR.'),
    (v_case_id, 'If the 95% CI for the OR is 1.5–8.0, the result is:', to_jsonb(ARRAY['Not significant', 'Significant because CI excludes 1', 'Significant because CI includes 0', 'Impossible to interpret', 'Equivalent to RR = 8']), 1, 'A CI excluding 1 suggests statistical significance.');

    -- CASE 16
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Relative Risk Interpretation', 'A cohort study reports a relative risk of 1.0 for a new exposure-outcome association.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The best interpretation is:', to_jsonb(ARRAY['Strong positive association', 'Strong negative association', 'No association detected', 'Exposure is protective', 'Exposure doubles risk']), 2, 'RR of 1.0 means no difference in risk between groups.'),
    (v_case_id, 'A relative risk < 1 suggests:', to_jsonb(ARRAY['Harmful exposure', 'Protective exposure', 'No association', 'Randomization only', 'No confounding']), 1, 'RR below 1 suggests a protective effect.'),
    (v_case_id, 'If RR = 2.0, disease risk in exposed is:', to_jsonb(ARRAY['Half that of unexposed', 'Equal to unexposed', 'Twice that of unexposed', 'Two percent', 'Impossible to compare']), 2, 'Risk is 2.0 times higher in the exposed group.');

    -- CASE 17
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'P-Value Understanding', 'A paper reports a p-value of 0.03 for the primary outcome.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which is the best interpretation?', to_jsonb(ARRAY['There is a 3% chance the alternative hypothesis is true', 'If the null hypothesis were true, results this extreme would occur about 3% of the time', 'The treatment definitely works', 'The study has 97% power', 'Clinical significance is guaranteed']), 1, 'A p-value reflects how unusual the data are if the null were true.'),
    (v_case_id, 'Assuming alpha = 0.05, this result is:', to_jsonb(ARRAY['Not statistically significant', 'Statistically significant', 'Proof of causality', 'Type II error', 'Invalid without RR']), 1, '0.03 < 0.05, so we reject the null.'),
    (v_case_id, 'A p-value does NOT tell you:', to_jsonb(ARRAY['Whether observed data are unusual under the null', 'Magnitude of effect alone', 'Whether result crosses significance threshold', 'Sampling rarity under null', 'That null may be rejected at alpha 0.05']), 1, 'P-values do not measure clinical importance or effect size directly.');

    -- CASE 18
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Beta Error and Power', 'A study fails to detect a real difference because the sample size is too small.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This is:', to_jsonb(ARRAY['Type I error', 'Type II error', 'Recall bias', 'Lead-time bias', 'Publication bias']), 1, 'Missing a true effect is a Type II error.'),
    (v_case_id, 'Type II error is also called:', to_jsonb(ARRAY['Alpha error', 'False positive', 'Beta error', 'Selection error', 'Design effect']), 2, 'Type II error probability is Beta.'),
    (v_case_id, 'Increasing sample size generally:', to_jsonb(ARRAY['Increases beta', 'Decreases power', 'Increases power', 'Eliminating all bias', 'Forces p to 0']), 2, 'Larger sample sizes increase power (1 - Beta).');

    -- CASE 19
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Type I Error', 'A study claims a positive effect, but in truth no effect exists.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This is:', to_jsonb(ARRAY['Type I error', 'Type II error', 'Confounding', 'Berkson bias', 'Length bias']), 0, 'A false positive is a Type I error.'),
    (v_case_id, 'The probability of this error is:', to_jsonb(ARRAY['Power', 'Beta', 'Alpha', 'Prevalence', 'Hazard ratio']), 2, 'The significance level Alpha is the risk of Type I error.'),
    (v_case_id, 'If alpha is reduced from 0.05 to 0.01, Type I error risk:', to_jsonb(ARRAY['Increases', 'Decreases', 'Is unchanged', 'Becomes power', 'Equals beta']), 1, 'Lowering alpha makes it harder to reject the null incorrectly.');

    -- CASE 20
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Study Power', 'A study has 80% power.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Power equals:', to_jsonb(ARRAY['Alpha', '1 - alpha', '1 - beta', 'Prevalence', 'Specificity']), 2, 'Power = 1 - Beta.'),
    (v_case_id, 'A study with higher power is:', to_jsonb(ARRAY['Less able to detect true differences', 'More able to detect true differences', 'More biased', 'Less generalizable by definition', 'Necessarily randomized']), 1, 'Higher power increases the probability of finding a true effect.'),
    (v_case_id, 'Which usually increases power?', to_jsonb(ARRAY['Smaller sample size', 'Smaller effect size', 'Larger sample size', 'Lower event rate only', 'Greater confounding']), 2, 'Larger sample sizes increase study power.');

    -- CASE 21
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Confidence Intervals (Ratio)', 'A paper reports a 95% confidence interval for RR of 0.8 to 1.4.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which statement is most accurate?', to_jsonb(ARRAY['The result is statistically significant', 'The null value is excluded', 'The result is not statistically significant', 'RR must equal 1.1 exactly', 'The p-value must be <0.01']), 2, 'For ratios, if the CI includes 1.0, it is not significant.'),
    (v_case_id, 'For relative risk, the null value is:', to_jsonb(ARRAY['0', '0.5', '1', '2', '100']), 2, 'A ratio of 1 means no difference.'),
    (v_case_id, 'Narrower confidence intervals generally indicate:', to_jsonb(ARRAY['Less precision', 'More precision', 'More bias', 'Less validity', 'More confounding']), 1, 'Narrower intervals indicate better precision.');

    -- CASE 22
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Confidence Intervals (Difference)', 'A trial reports a mean blood pressure difference of −6 mm Hg with a 95% CI of −10 to −2.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The result is statistically significant because:', to_jsonb(ARRAY['The CI includes 0', 'The CI excludes 0', 'The mean is negative', 'The sample is large', 'Variance is high']), 1, 'For differences, if the CI excludes 0, it is significant.'),
    (v_case_id, 'For a difference in means, the null value is:', to_jsonb(ARRAY['0', '1', '-1', '100', 'RR']), 0, 'A difference of 0 means no change.'),
    (v_case_id, 'Which interpretation is correct?', to_jsonb(ARRAY['No difference is plausible', 'A true reduction of 6 mm Hg is guaranteed', 'Values from -10 to -2 are compatible with the data at the 95% level', 'Bias is absent', 'The p-value must equal 0.95']), 2, 'The interval gives a range of plausible values.');

    -- CASE 23
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Confounding Example', 'Researchers study whether coffee consumption and pancreatic cancer are associated, but smoking is linked to both.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Smoking is acting as a:', to_jsonb(ARRAY['Effect modifier only', 'Confounder', 'Mediator only', 'Outcome variable', 'Recall variable']), 1, 'A confounder is linked to both exposure and outcome.'),
    (v_case_id, 'A confounder is associated with:', to_jsonb(ARRAY['Exposure only', 'Outcome only', 'Exposure and outcome', 'Neither exposure nor outcome', 'P-value only']), 2, 'It distorts the primary association.'),
    (v_case_id, 'Randomization helps because it:', to_jsonb(ARRAY['Creates confounding', 'Balances confounders between groups', 'Eliminating all measurement error', 'Forces significance', 'Increases recall bias']), 1, 'Balances known and unknown confounders.');

    -- CASE 24
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Effect Modification', 'A study finds a stronger smoking-lung cancer association in asbestos workers than in non-asbestos workers.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This suggests:', to_jsonb(ARRAY['Confounding only', 'Effect modification (interaction)', 'Selection bias', 'Recall bias', 'Lead-time bias']), 1, 'Effect modification exists when the effect size changes across strata of another variable.'),
    (v_case_id, 'Effect modification means:', to_jsonb(ARRAY['The effect differs across levels of another variable', 'Exposure was measured incorrectly', 'Cases remember differently', 'Randomization failed', 'Results are always invalid']), 0, 'It is a biological interaction, not a bias.'),
    (v_case_id, 'In stratified analysis, true effect modification is usually:', to_jsonb(ARRAY['Hidden and ignored', 'Reported rather than "adjusted away"', 'Always a sign of bias', 'Impossible in epidemiology', 'Equivalent to prevalence']), 1, 'It should be reported because it provides meaningful insight.');

    -- CASE 25
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Recall Bias', 'Cancer patients in a case-control study remember past pesticide exposures more vividly than controls.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This is:', to_jsonb(ARRAY['Recall bias', 'Berkson bias', 'Lead-time bias', 'Attrition bias', 'Observer-expectancy bias only']), 0, 'Differential memory based on disease status.'),
    (v_case_id, 'This bias is especially common in:', to_jsonb(ARRAY['Randomized trials', 'Case-control studies', 'Cross-over trials', 'Kaplan-Meier analysis', 'Meta-analysis']), 1, 'Common in retrospective designs.'),
    (v_case_id, 'Best description:', to_jsonb(ARRAY['Exposure misclassification related to disease status', 'Outcome misclassification from blinding', 'Increased prevalence from survival', 'Group-level inference error', 'Differential treatment assignment']), 0, 'It is a form of information bias.');

    -- CASE 26
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Berkson Bias', 'Hospitalized controls are selected for a case-control study of smoking and heart disease, but many controls are hospitalized for smoking-related conditions.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This is:', to_jsonb(ARRAY['Berkson bias', 'Lead-time bias', 'Attrition bias', 'Hawthorne effect', 'Recall bias']), 0, 'A selection bias from using hospitalized patients.'),
    (v_case_id, 'Berkson bias is a type of:', to_jsonb(ARRAY['Information bias', 'Selection bias', 'Confounding', 'Measurement error only', 'Random error']), 1, 'Selection bias.'),
    (v_case_id, 'Main problem:', to_jsonb(ARRAY['Hospital controls may not represent the source population properly', 'Exposure is too accurate', 'Cases are too healthy', 'No outcome definition exists', 'Specificity falls']), 0, 'Controls are not representative of the general population.');

    -- CASE 27
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Lead-Time Bias', 'A screening program seems to improve 5-year survival, but mortality is unchanged because diagnosis was simply made earlier.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This is:', to_jsonb(ARRAY['Recall bias', 'Lead-time bias', 'Length-time bias', 'Confounding', 'Spectrum bias']), 1, 'Falsely inflated survival time due to early detection.'),
    (v_case_id, 'Lead-time bias makes survival seem:', to_jsonb(ARRAY['Shorter', 'Longer', 'Unchanged', 'Random', 'Impossible to measure']), 1, 'Survival seems longer from the point of diagnosis.'),
    (v_case_id, 'Best way to assess screening benefit is by:', to_jsonb(ARRAY['5-year survival alone', 'Disease-specific mortality reduction', 'Increased prevalence alone', 'Increased test sensitivity only', 'Number of biopsies performed']), 1, 'Mortality reduction is the only true measure.');

    -- CASE 28
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Length-Time Bias', 'A screening test disproportionately detects slow-growing tumors with longer preclinical phases.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This is:', to_jsonb(ARRAY['Length-time bias', 'Recall bias', 'Hawthorne effect', 'Berkson bias', 'Detection bias only always']), 0, 'Screening detects slow cases more easily.'),
    (v_case_id, 'It makes screening appear:', to_jsonb(ARRAY['Less effective', 'More effective than it really is', 'Unrelated to mortality', 'Impossible to interpret at all', 'Randomized']), 1, 'Exaggerates benefit by ignoring rapid/aggressive cases.'),
    (v_case_id, 'Which tumors are more likely detected?', to_jsonb(ARRAY['Aggressive rapidly fatal tumors', 'Slower-growing tumors', 'Nonexistent tumors only', 'Only benign lesions', 'Only metastatic tumors']), 1, 'Indolent disease stays in the screening window longer.');

    -- CASE 29
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Measurement Bias', 'A researcher records blood pressure manually and consistently rounds high values upward.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This is an example of:', to_jsonb(ARRAY['Random error', 'Systematic measurement bias', 'Confounding', 'Effect modification', 'Attrition bias']), 1, 'Systematic error in measurement.'),
    (v_case_id, 'Systematic measurement error primarily affects:', to_jsonb(ARRAY['Accuracy', 'Precision only', 'Power only', 'Prevalence only', 'Randomization only']), 0, 'It shifts values away from the truth (lowers accuracy).'),
    (v_case_id, 'Precision refers to:', to_jsonb(ARRAY['Closeness to truth', 'Reproducibility/consistency', 'Internal validity only', 'External validity only', 'Clinical significance']), 1, 'Reliability/Consistency.');

    -- CASE 30
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Precision vs Accuracy', 'Repeated lab assays give very similar values, but all are far from the true value.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The assay is:', to_jsonb(ARRAY['Accurate and precise', 'Accurate but imprecise', 'Precise but inaccurate', 'Neither accurate nor precise', 'Uninterpretable']), 2, 'Reliable (tight clusters) but biased (far from truth).'),
    (v_case_id, 'Precision means:', to_jsonb(ARRAY['Near the true value', 'Little variability among repeated measurements', 'No bias', 'No confounding', 'No false positives']), 1, 'Reproducibility.'),
    (v_case_id, 'Accuracy means:', to_jsonb(ARRAY['Reproducibility only', 'Closeness to the true value', 'Small sample size', 'Statistical significance', 'High power only']), 1, 'Closeness to the truth.');

    -- CASE 31
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'T-Test vs ANOVA', 'Researchers want to compare mean fasting glucose between two independent treatment groups.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Best statistical test:', to_jsonb(ARRAY['Chi-square', 'Student t-test', 'ANOVA only', 'Pearson correlation', 'Kaplan-Meier']), 1, 'Compares means of two groups.'),
    (v_case_id, 'The dependent variable is:', to_jsonb(ARRAY['Categorical nominal', 'Continuous', 'Ordinal only', 'Binary only', 'Time-to-event only']), 1, 'Glucose is a continuous scale.'),
    (v_case_id, 'If there were three treatment groups instead of two, best test would be:', to_jsonb(ARRAY['t-test', 'ANOVA', 'Chi-square', 'Fisher exact only', 'Logistic regression only']), 1, 'ANOVA compares 3+ means.');

    -- CASE 32
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Chi-Square Analysis', 'Researchers compare smoking status (yes/no) between patients with stroke and matched controls.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Best statistical test:', to_jsonb(ARRAY['Student t-test', 'Chi-square', 'ANOVA', 'Pearson correlation', 'Linear regression']), 1, 'Categorical vs Categorical.'),
    (v_case_id, 'This test is for:', to_jsonb(ARRAY['Two continuous variables', 'Categorical variables', 'Survival data', 'Paired continuous data only', 'Time series only']), 1, 'Compares frequencies.'),
    (v_case_id, 'If expected cell counts are very small, an alternative is:', to_jsonb(ARRAY['Fisher exact test', 'ANOVA', 'Logistic regression only impossible', 'Z-test only', 'Kaplan-Meier']), 0, 'Fisher exact test is used for small sample sizes.');

    -- CASE 33
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Correlation', 'Investigators examine the linear relationship between hours studied and exam score.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Best statistic:', to_jsonb(ARRAY['Chi-square', 'Pearson correlation coefficient', 'Odds ratio', 'Kaplan-Meier', 'Hazard ratio']), 1, 'Measures linear association.'),
    (v_case_id, 'A correlation coefficient of +0.8 suggests:', to_jsonb(ARRAY['Strong negative linear relationship', 'Strong positive linear relationship', 'No relationship', 'Causation', 'Randomization']), 1, '+1 is perfect positive correlation.'),
    (v_case_id, 'Correlation alone cannot prove:', to_jsonb(ARRAY['Association', 'Causation', 'Direction of slope', 'Strength of linear fit', 'Statistical significance']), 1, 'Correlation does not equal causation.');

    -- CASE 34
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Linear Regression', 'A researcher wants to predict systolic blood pressure from age, BMI, and sodium intake.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Best analytic method:', to_jsonb(ARRAY['Chi-square', 'Multiple linear regression', 'Kaplan-Meier', 'Fisher exact', 'ANOVA only']), 1, 'Used to predict a continuous outcome.'),
    (v_case_id, 'The outcome variable is:', to_jsonb(ARRAY['Binary', 'Continuous', 'Ordinal only', 'Time-to-event', 'Nominal']), 1, 'Blood pressure is continuous.'),
    (v_case_id, 'Regression can help:', to_jsonb(ARRAY['Adjust for multiple variables simultaneously', 'Eliminate all bias', 'Prove randomization', 'Replace blinding', 'Measure prevalence directly only']), 0, 'Can control for confounders.');

    -- CASE 35
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Survival Analysis', 'A survival study compares time to death between two chemotherapy regimens over 5 years.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Best method to display survival over time:', to_jsonb(ARRAY['Scatterplot', 'Kaplan-Meier curve', 'Histogram', 'Boxplot', 'Forest plot only']), 1, 'Classically used for survival curves.'),
    (v_case_id, 'Best statistic for comparing instantaneous event rates:', to_jsonb(ARRAY['Odds ratio', 'Hazard ratio', 'Relative risk only', 'NNT', 'Specificity']), 1, 'Hazard ratio is the survival equivalent of RR.'),
    (v_case_id, 'Censoring occurs when:', to_jsonb(ARRAY['Exposure is misclassified', 'Follow-up ends before event occurs in some participants', 'Randomization fails', 'Test specificity drops', 'Bias is removed']), 1, 'Outcome is unobserved by study end.');

    -- CASE 36
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Logistic Regression', 'A logistic regression model is used with mortality (dead/alive) as the outcome.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Best reason logistic regression is appropriate:', to_jsonb(ARRAY['Outcome is continuous', 'Outcome is binary', 'Outcome is time-to-event', 'Exposure is categorical only', 'It calculates prevalence directly only']), 1, 'Used for binary outcomes.'),
    (v_case_id, 'Logistic regression often yields:', to_jsonb(ARRAY['Mean difference', 'Odds ratio', 'Hazard ratio', 'Correlation coefficient', 'Sensitivity only']), 1, 'Reports ORs.'),
    (v_case_id, 'If the dependent variable were continuous instead, preferred model would be:', to_jsonb(ARRAY['Logistic regression', 'Linear regression', 'Chi-square', 'Fisher exact', 'Survival analysis']), 1, 'Linear regression for continuous variables.');

    -- CASE 37
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Multivariable Adjustment', 'A smoking cessation campaign is evaluated. Researchers record whether participants quit smoking 1 year later and adjust for age, sex, and baseline smoking intensity.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Adjusting for age, sex, and smoking intensity mainly addresses:', to_jsonb(ARRAY['Random error', 'Confounding', 'Lead-time bias', 'Recall bias', 'Publication bias']), 1, 'Addresses baseline differences between groups.'),
    (v_case_id, 'Variables controlled in analysis are often called:', to_jsonb(ARRAY['Outcomes', 'Covariates', 'Endpoints only', 'False positives', 'Placebos']), 1, 'Predictor variables in models are covariates.'),
    (v_case_id, 'If "quit smoking" is binary, best multivariable model:', to_jsonb(ARRAY['Linear regression', 'Logistic regression', 'ANOVA', 'Pearson correlation', 't-test']), 1, 'Binary outcome = Logistic regression.');

    -- CASE 38
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Reliability', 'Researchers use a new depression questionnaire twice in stable patients and get nearly identical scores both times.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This reflects high:', to_jsonb(ARRAY['Accuracy', 'Reliability', 'Validity only', 'Specificity', 'Sensitivity']), 1, 'Consistency is reliability.'),
    (v_case_id, 'Reliability refers to:', to_jsonb(ARRAY['Measuring the intended construct correctly', 'Reproducibility/consistency', 'Bias removal', 'Disease prevalence', 'Generalizability only']), 1, 'Repeatability.'),
    (v_case_id, 'A test can be reliable but:', to_jsonb(ARRAY['Never valid', 'Still invalid', 'Always specific', 'Always sensitive', 'Impossible to interpret']), 1, 'Can be consistent but wrong.');

    -- CASE 39
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Validity', 'A depression questionnaire accurately measures depression severity.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This reflects:', to_jsonb(ARRAY['Reliability', 'Validity', 'Precision only', 'Sampling error', 'Spectrum bias']), 1, 'Closeness to the intended truth.'),
    (v_case_id, 'Validity refers to:', to_jsonb(ARRAY['Closeness to the intended truth/construct', 'Repeatability only', 'Sample size', 'Study power', 'Prevalence dependency']), 0, 'Measuring what it is supposed to measure.'),
    (v_case_id, 'Face validity means:', to_jsonb(ARRAY['The test obviously appears to measure what it should', 'It has highest specificity', 'It proves causality', 'It has p < 0.05', 'It eliminates confounding']), 0, 'Surface appearance of measuring the construct.');

    -- CASE 40
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Prevention Levels', 'A mammography program is designed to detect breast cancer before symptoms develop.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This is an example of:', to_jsonb(ARRAY['Primary prevention', 'Secondary prevention', 'Tertiary prevention', 'Quaternary prevention', 'Palliative care only']), 1, 'Secondary = screening/early detection.'),
    (v_case_id, 'Vaccination is an example of:', to_jsonb(ARRAY['Primary prevention', 'Secondary prevention', 'Tertiary prevention', 'Case-finding only', 'Rehabilitation']), 0, 'Primary = preventing onset.'),
    (v_case_id, 'Cardiac rehabilitation after MI is:', to_jsonb(ARRAY['Primary prevention', 'Secondary prevention', 'Tertiary prevention', 'Screening', 'No prevention category']), 2, 'Tertiary = reducing disability.');

    -- CASE 41
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Quality Improvement', 'A hospital introduces a catheter checklist and central line infections drop sharply.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This is best categorized as:', to_jsonb(ARRAY['Basic science trial', 'Quality improvement initiative', 'Case-control study', 'Ecologic fallacy', 'Meta-analysis']), 1, 'Improving care processes.'),
    (v_case_id, 'The main goal is:', to_jsonb(ARRAY['Increase prevalence', 'Improve care processes and outcomes', 'Randomize patients', 'Reduce external validity', 'Publish subgroup analyses']), 1, 'Better outcomes through process changes.'),
    (v_case_id, 'A common quality metric here is:', to_jsonb(ARRAY['Incidence of line infection per catheter-days', 'Odds ratio only', 'Sensitivity of checklist', 'Specificity of checklist', 'PPV of infection']), 0, 'Normalized rates (e.g. per device-days).');

    -- CASE 42
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'QI Rate Changes', 'A new hospital policy reduces falls from 8 per 1,000 patient-days to 4 per 1,000 patient-days.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The relative reduction is:', to_jsonb(ARRAY['25%', '50%', '75%', '100%', '4%']), 1, '4/8 = 50%.'),
    (v_case_id, 'The absolute reduction is:', to_jsonb(ARRAY['4 per 1,000 patient-days', '8 per 1,000 patient-days', '50 per 1,000 patient-days', '2 per 1,000 patient-days', '0.5 per 1,000 patient-days']), 0, '8 - 4 = 4 per 1000.'),
    (v_case_id, 'Which statement is correct?', to_jsonb(ARRAY['Relative reductions can appear large even when absolute changes are modest', 'Absolute and relative reductions are identical concepts', 'Relative risk cannot be calculated from rates', 'Falls cannot be expressed per patient-day', 'This must be a randomized trial']), 0, 'Always consider absolute impact.');

    -- CASE 43
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Misleading Statistics', 'A physician tells a patient, "This screening test reduces mortality by 20%." The patient wants to know the absolute benefit. Mortality falls from 10 per 1,000 to 8 per 1,000.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The absolute risk reduction is:', to_jsonb(ARRAY['0.2 per 1,000', '2 per 1,000', '8 per 1,000', '20 per 1,000', '25%']), 1, '10 - 8 = 2 per 1000.'),
    (v_case_id, 'The relative risk reduction is:', to_jsonb(ARRAY['2%', '10%', '20%', '25%', '50%']), 2, '2/10 = 20%.'),
    (v_case_id, 'This illustrates why reporting only relative risk reduction can:', to_jsonb(ARRAY['Be misleadingly impressive', 'Eliminate confounding', 'Increase specificity', 'Lower prevalence', 'Remove false positives']), 0, 'Relative change ignores the baseline risk.');

    -- CASE 44
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Fatality vs Mortality', 'During a disease outbreak, a public health official asks for the "case fatality rate."')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This is best defined as:', to_jsonb(ARRAY['Deaths in total population per year', 'Deaths among people with the disease', 'New cases/population', 'Existing cases/population', 'Surviving cases/controls']), 1, 'Severity among the sick.'),
    (v_case_id, 'A high case fatality rate suggests:', to_jsonb(ARRAY['Disease is highly contagious only', 'Disease is more severe among affected patients', 'Prevalence is always high', 'Incidence is zero', 'Sensitivity is high']), 1, 'Describes virulence/severity.'),
    (v_case_id, 'Mortality rate differs because it refers to:', to_jsonb(ARRAY['Deaths among cases only', 'Deaths in the overall population', 'Surviving exposed patients only', 'Exposure prevalence', 'Test performance']), 1, 'Refers to total population.');

    -- CASE 45
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'External Validity', 'An investigator selects participants by convenience from a single clinic and worries the findings may not apply elsewhere.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This most threatens:', to_jsonb(ARRAY['Internal validity only', 'External validity/generalizability', 'Reliability only', 'Precision only', 'Specificity only']), 1, 'Generalizability.'),
    (v_case_id, 'External validity refers to:', to_jsonb(ARRAY['Freedom from confounding', 'Ability to generalize findings to other populations', 'Accuracy of laboratory test', 'Repeatability of a tool', 'Correct p-value interpretation']), 1, 'Real-world applicability.'),
    (v_case_id, 'Narrow sampling from one clinic may produce:', to_jsonb(ARRAY['Better generalizability', 'Limited generalizability', 'No association ever', 'Guaranteed bias-free estimates', 'Zero random error']), 1, 'Convenience samples are rarely generalizable.');

    -- CASE 46
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Selection Bias Mechanism', 'Researchers study a disease only among clinic visitors, but healthier people in the community rarely visit clinics.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'This is most closely related to:', to_jsonb(ARRAY['Selection bias', 'Recall bias', 'Lead-time bias', 'Information bias only', 'Simpson paradox']), 0, 'Bias from sampling method.'),
    (v_case_id, 'Selection bias occurs when:', to_jsonb(ARRAY['Measurement is random', 'The relationship between exposure and disease differs for those selected vs not selected', 'p-values are too small', 'Blinding is too strict', 'Confidence intervals narrow']), 1, 'Sampling distorts the association.'),
    (v_case_id, 'A major consequence is:', to_jsonb(ARRAY['Lower prevalence always', 'Distorted association estimates', 'Better reliability', 'Higher specificity', 'Better randomization']), 1, 'Compromises internal validity.');

    -- CASE 47
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Meta-Analysis', 'A meta-analysis pools results from multiple randomized trials.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Main purpose:', to_jsonb(ARRAY['Decrease external validity', 'Increase overall precision and summarize evidence', 'Replace all primary data', 'Eliminate heterogeneity entirely', 'Prevent publication bias automatically']), 1, 'Increases statistical power and precision.'),
    (v_case_id, 'A forest plot commonly displays:', to_jsonb(ARRAY['Individual study effect estimates and pooled estimate', 'Only p-values', 'Only sample sizes', 'Survival curves', 'Histograms']), 0, 'Shows weights and effects.'),
    (v_case_id, 'A funnel plot is often used to assess:', to_jsonb(ARRAY['Recall bias', 'Publication bias', 'Lead-time bias', 'Specificity', 'Tertiary prevention']), 1, 'Asymmetry suggests publication bias.');

    -- CASE 48
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Time-to-Event Hazards', 'A clinician follows a group of patients from treatment initiation until death or censoring. Some patients are lost to follow-up.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Appropriate analysis for time-to-event data:', to_jsonb(ARRAY['Chi-square', 'Kaplan-Meier and Cox regression', 't-test only', 'Pearson correlation', 'Fisher exact']), 1, 'Standard for survival analysis.'),
    (v_case_id, 'Cox proportional hazards modeling estimates:', to_jsonb(ARRAY['Odds ratio', 'Hazard ratio', 'Relative risk only from cross-section', 'Specificity', 'PPV']), 1, 'Reports HRs.'),
    (v_case_id, 'Hazard ratio compares:', to_jsonb(ARRAY['Mean event counts only', 'Instantaneous event rates over time', 'Prevalence', 'Exposure frequency only', 'Test performance']), 1, 'Measures risk over time.');

    -- CASE 49
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Quasi-Experimental Design', 'A public health team introduces a smoking ban in restaurants and then compares asthma exacerbation rates before and after the policy.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Best described as:', to_jsonb(ARRAY['Randomized trial', 'Quasi-experimental / before-after intervention study', 'Case-control study', 'Cross-sectional study only', 'Meta-analysis']), 1, 'Natural experiment / policy eval.'),
    (v_case_id, 'Major challenge in interpretation:', to_jsonb(ARRAY['No outcomes can be measured', 'Secular trends and cointerventions may confound observed changes', 'Odds ratios are impossible', 'Incidence cannot be tracked', 'Bias never occurs in policy studies']), 1, 'Hard to isolate the intervention effect.'),
    (v_case_id, 'Such designs are often useful when:', to_jsonb(ARRAY['Randomization is impractical or impossible', 'Disease is fictional', 'Outcomes are binary only', 'Sample size is 1', 'There is no intervention']), 0, 'Used for population-level interventions.');

    -- CASE 50
    INSERT INTO public.case_studies (topic_id, title, scenario)
    VALUES (v_topic_id, 'Likelihood Ratios', 'A physician tells a patient that a diagnostic test has likelihood ratio positive (LR+) of 10 and likelihood ratio negative (LR-) of 0.1.')
    RETURNING id INTO v_case_id;
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which statement is most accurate?', to_jsonb(ARRAY['The positive result modestly changes probability', 'The test is useful because positive results strongly increase and negative results strongly decrease disease probability', 'Likelihood ratios are unrelated to sensitivity and specificity', 'LR+ of 10 means prevalence is 10%', 'LR- of 0.1 is poor for ruling out disease']), 1, 'LR+ > 10 is strong, LR- < 0.1 is strong.'),
    (v_case_id, 'A very low LR- is useful for:', to_jsonb(ARRAY['Ruling in disease', 'Ruling out disease', 'Measuring incidence', 'Assessing confounding', 'Calculating ARR']), 1, 'Low LR- helps rule out.'),
    (v_case_id, 'Likelihood ratios are helpful because they:', to_jsonb(ARRAY['Can be applied to pretest probability to estimate posttest probability', 'Ignore test characteristics', 'Replace all clinical judgment', 'Equal p-values', 'Are the same as odds ratio']), 0, 'Allows Bayesian updating of probability.');

END $$;
