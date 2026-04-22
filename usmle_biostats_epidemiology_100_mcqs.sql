-- MediHelp: USMLE Step 1 - Biostatistics and Epidemiology (100 MCQs)
-- Idempotent Migration: Ensures clean state for the topic's MCQs.

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    -- 1. Find existing "Biostatistics & Epidemiology" Topic
    SELECT id INTO v_topic_id FROM public.topics 
    WHERE (title ILIKE '%Biostatistics%' OR title ILIKE '%Epidemiology%')
      AND usmle_step = 1 
    LIMIT 1;

    -- 2. Fallback creation if not found
    IF v_topic_id IS NULL THEN
        INSERT INTO public.topics (title, slug, usmle_step, "order")
        VALUES ('Biostatistics & Epidemiology', 'biostatistics-epidemiology-step-1', 1, 15)
        RETURNING id INTO v_topic_id;
    END IF;

    -- 3. CLEAN UP: Remove existing MCQs for this topic to ensure a clean state
    DELETE FROM public.mcqs WHERE topic_id = v_topic_id;

    -- Q1-Q10
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'Researchers identify 2,000 adults without diabetes, classify them by obesity status, and follow them for 10 years to compare development of diabetes. What type of study is this?', to_jsonb(ARRAY['Case-control study', 'Cross-sectional study', 'Cohort study', 'Ecologic study', 'Randomized controlled trial']), 2, 'A cohort study starts with exposure status and follows participants over time for outcomes.'),
    (v_topic_id, 'Investigators select 300 women with breast cancer and 300 women without breast cancer and then assess prior hormone therapy use. Which study design is this?', to_jsonb(ARRAY['Cohort study', 'Case-control study', 'Cross-sectional study', 'Randomized trial', 'Case series']), 1, 'A case-control study starts with disease status and looks back for prior exposures.'),
    (v_topic_id, 'A survey records smoking status and chronic cough in 5,000 factory workers at one point in time. Which design is this?', to_jsonb(ARRAY['Cohort', 'Case-control', 'Cross-sectional', 'Clinical trial', 'Meta-analysis']), 2, 'Cross-sectional studies assess exposure and outcome at the same time.'),
    (v_topic_id, 'A public health report compares average obesity rates and average soda intake across 40 countries. Which study design is this?', to_jsonb(ARRAY['Case-control', 'Cohort', 'Ecologic', 'Cross-over trial', 'Prospective trial']), 2, 'Ecologic studies analyze population-level rather than individual-level data.'),
    (v_topic_id, 'Which study design is best for studying a rare disease?', to_jsonb(ARRAY['Cohort study', 'Case-control study', 'Cross-sectional study', 'Randomized trial', 'Ecologic study']), 1, 'Case-control studies are efficient for rare outcomes.'),
    (v_topic_id, 'Which study design is best for studying a rare exposure?', to_jsonb(ARRAY['Case-control study', 'Cohort study', 'Cross-sectional study', 'Ecologic study', 'Case report']), 1, 'Cohort studies are useful for rare exposures, as participants can be selected by exposure status.'),
    (v_topic_id, 'A researcher wants the strongest design to test efficacy of a new antihypertensive drug. Which is best?', to_jsonb(ARRAY['Cross-sectional study', 'Case-control study', 'Randomized controlled trial', 'Ecologic study', 'Case series']), 2, 'RCTs are the strongest design for testing efficacy because randomization reduces confounding.'),
    (v_topic_id, 'A disease registry reports 500 existing cases of multiple sclerosis in a city of 100,000 residents on January 1. This measure is:', to_jsonb(ARRAY['Incidence', 'Prevalence', 'Attack rate', 'Case fatality rate', 'Relative risk']), 1, 'Prevalence is the proportion of people with a disease at a given point in time.'),
    (v_topic_id, 'During one year, 50 new cases of tuberculosis occur in a city population of 10,000 that was initially disease-free. This is a measure of:', to_jsonb(ARRAY['Prevalence', 'Incidence', 'Mortality', 'Relative risk', 'Odds ratio']), 1, 'Incidence counts new cases occurring over a time period.'),
    (v_topic_id, 'A highly fatal disease suddenly becomes easier to treat, and patients survive much longer without changing incidence. What happens to prevalence?', to_jsonb(ARRAY['Decreases', 'Increases', 'Is unchanged', 'Becomes zero', 'Equals incidence']), 1, 'Prevalence rises when disease duration increases.');

    -- Q11-Q20
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'A disease outbreak causes 40 new cases among 200 wedding guests who ate at the same banquet. The proportion 40/200 is best called:', to_jsonb(ARRAY['Incidence density', 'Attack rate', 'Prevalence ratio', 'Odds ratio', 'Specificity']), 1, 'Attack rate is a form of incidence proportion used in outbreaks.'),
    (v_topic_id, 'A disease kills 20 of 100 infected patients. The proportion of infected patients who die is the:', to_jsonb(ARRAY['Mortality rate', 'Prevalence', 'Case fatality rate', 'Incidence', 'Relative risk']), 2, 'Case fatality rate is the proportion of people with a disease who die from it.'),
    (v_topic_id, 'A screening test detects 90 of 100 people who truly have disease. What is the sensitivity?', to_jsonb(ARRAY['10%', '50%', '80%', '90%', '99%']), 3, 'Sensitivity = true positives / all with disease = 90/100 = 90%.'),
    (v_topic_id, 'Among 900 people without disease, a screening test correctly identifies 720 as negative. What is the specificity?', to_jsonb(ARRAY['20%', '50%', '70%', '80%', '90%']), 3, 'Specificity = true negatives / all without disease = 720/900 = 80%.'),
    (v_topic_id, 'A highly sensitive test is most useful for:', to_jsonb(ARRAY['Ruling in disease when positive', 'Ruling out disease when negative', 'Measuring prevalence', 'Detecting confounding', 'Eliminating all false positives']), 1, 'SnNout: High Sensitivity, Negative result rules OUT.'),
    (v_topic_id, 'A highly specific test is most useful for:', to_jsonb(ARRAY['Ruling out disease when negative', 'Ruling in disease when positive', 'Measuring incidence', 'Estimating prevalence', 'Eliminating all false negatives']), 1, 'SpPin: High Specificity, Positive result rules IN.'),
    (v_topic_id, 'A disease is very rare in the population. Even with a highly sensitive and specific test, which value is most likely to be low?', to_jsonb(ARRAY['Sensitivity', 'Specificity', 'Positive predictive value', 'Negative predictive value', 'Relative risk']), 2, 'PPV decreases when prevalence is low, because more positive tests are false positives.'),
    (v_topic_id, 'As disease prevalence increases, which generally increases?', to_jsonb(ARRAY['Sensitivity', 'Specificity', 'Positive predictive value', 'False negative rate necessarily', 'Type I error']), 2, 'PPV rises with increasing prevalence; NPV falls.'),
    (v_topic_id, 'In a treatment trial, disease occurs in 12% of the control group and 9% of the treatment group. What is the absolute risk reduction?', to_jsonb(ARRAY['3%', '9%', '12%', '25%', '75%']), 0, 'ARR = 12% - 9% = 3%.'),
    (v_topic_id, 'Using the same trial data (Control: 12%, Treatment: 9%), what is the relative risk?', to_jsonb(ARRAY['0.25', '0.5', '0.75', '1.0', '1.33']), 2, 'RR = 9% / 12% = 0.75.');

    -- Q21-Q30
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'Using the same trial data (Control: 12%, Treatment: 9%), what is the relative risk reduction?', to_jsonb(ARRAY['3%', '12%', '25%', '33%', '75%']), 2, 'RRR = ARR / control risk = 3/12 = 25%.'),
    (v_topic_id, 'Using the same trial data (Control: 12%, Treatment: 9%), what is the number needed to treat?', to_jsonb(ARRAY['3', '12', '25', '33', '75']), 3, 'NNT = 1 / ARR = 1 / 0.03 ≈ 33.'),
    (v_topic_id, 'A case-control study reports an odds ratio of 1.0 between an exposure and disease. This means:', to_jsonb(ARRAY['The exposure is protective', 'There is no association detected', 'The disease risk doubles', 'The exposure is strongly harmful', 'The study proves causality']), 1, 'An odds ratio of 1 suggests no association.'),
    (v_topic_id, 'For rare diseases, the odds ratio approximates the:', to_jsonb(ARRAY['Prevalence ratio', 'Relative risk', 'NNT', 'Sensitivity', 'Specificity']), 1, 'In rare diseases, the OR is a good approximation of RR.'),
    (v_topic_id, 'A p-value of 0.04 means:', to_jsonb(ARRAY['There is a 4% chance the alternative hypothesis is true', 'If the null hypothesis were true, the observed data or more extreme would occur 4% of the time', 'The study has 96% power', 'The result is clinically important', 'The null hypothesis is false']), 1, 'Correct interpretation of a p-value.'),
    (v_topic_id, 'A study incorrectly concludes that a treatment works when in reality it does not. This is:', to_jsonb(ARRAY['Type I error', 'Type II error', 'Recall bias', 'Lead-time bias', 'Attrition bias']), 0, 'Type I error is a false positive.'),
    (v_topic_id, 'A study fails to detect a real treatment effect because the sample size is too small. This is:', to_jsonb(ARRAY['Type I error', 'Type II error', 'Confounding', 'Information bias', 'Observer bias']), 1, 'Type II error is a false negative.'),
    (v_topic_id, 'Power is defined as:', to_jsonb(ARRAY['Alpha', 'Beta', '1 - alpha', '1 - beta', 'Specificity x sensitivity']), 3, 'Power = 1 - beta.'),
    (v_topic_id, 'Increasing sample size usually has what effect?', to_jsonb(ARRAY['Increases Type II error', 'Decreases power', 'Increases power', 'Eliminating all confounding', 'Guarantees significance']), 2, 'Larger sample size increases power.'),
    (v_topic_id, 'A 95% confidence interval for a relative risk is 0.9 to 1.4. Which statement is correct?', to_jsonb(ARRAY['The result is statistically significant', 'The result is not statistically significant', 'The RR must equal 1.15', 'The p-value must be <0.05', 'Bias is absent']), 1, 'If the CI includes 1 for a ratio, it is not significant.');

    -- Q31-Q40
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'A 95% confidence interval for a mean difference is -8 to -2. Which statement is correct?', to_jsonb(ARRAY['The result is not statistically significant', 'The result is statistically significant', 'The null value is 1', 'The treatment effect must be -5 exactly', 'The p-value must equal 0.95']), 1, 'For differences, the null value is 0. Since 0 is not in the interval, it is significant.'),
    (v_topic_id, 'Smoking is associated with coffee use and independently increases pancreatic cancer risk. In a study of coffee and pancreatic cancer, smoking is a:', to_jsonb(ARRAY['Mediator', 'Confounder', 'Effect modifier only', 'Dependent variable', 'Reliability measure']), 1, 'A confounder is linked to both exposure and outcome.'),
    (v_topic_id, 'The effect of an exposure differs in men versus women. This is best called:', to_jsonb(ARRAY['Confounding', 'Recall bias', 'Effect modification', 'Selection bias', 'Measurement error']), 2, 'Effect modification means the effect varies across levels of another variable.'),
    (v_topic_id, 'Patients with cancer remember prior pesticide exposure more often than controls, even when records show similar exposure rates. This is:', to_jsonb(ARRAY['Recall bias', 'Attrition bias', 'Berkson bias', 'Lead-time bias', 'Ecologic fallacy']), 0, 'Differential memory based on disease status.'),
    (v_topic_id, 'Hospitalized patients are used as controls in a smoking study, but many were hospitalized for smoking-related illness. This is:', to_jsonb(ARRAY['Recall bias', 'Berkson bias', 'Lead-time bias', 'Length-time bias', 'Simpson paradox']), 1, 'Berkson bias is a type of selection bias from hospital controls.'),
    (v_topic_id, 'A screening test appears to improve survival time, but only because disease is diagnosed earlier, not because death is delayed. This is:', to_jsonb(ARRAY['Length-time bias', 'Recall bias', 'Lead-time bias', 'Attrition bias', 'Observer bias']), 2, 'Lead-time bias falsely inflates survival time due to early diagnosis.'),
    (v_topic_id, 'A screening program preferentially detects slow-growing tumors, making the program seem more beneficial than it truly is. This is:', to_jsonb(ARRAY['Recall bias', 'Length-time bias', 'Lead-time bias', 'Confounding', 'Instrument bias']), 1, 'Length-time bias favors detection of indolent disease.'),
    (v_topic_id, 'Randomization in a clinical trial primarily reduces:', to_jsonb(ARRAY['Recall bias', 'Confounding', 'Publication bias', 'Lead-time bias', 'Attrition bias']), 1, 'Randomization balances known and unknown confounders.'),
    (v_topic_id, 'Blinding in a clinical trial primarily reduces:', to_jsonb(ARRAY['Attrition only', 'Observer and subject bias', 'Incidence', 'Prevalence', 'Confounding by age']), 1, 'Blinding reduces biased assessment.'),
    (v_topic_id, 'Analyzing all randomized participants according to their original assignment, even if they did not adhere, is called:', to_jsonb(ARRAY['Per-protocol analysis', 'Intention-to-treat analysis', 'Stratified sampling', 'Regression dilution', 'Hazard modeling']), 1, 'ITT preserves benefits of randomization.');

    -- Q41-Q50
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'Which study design directly measures both exposure and outcome at the same time?', to_jsonb(ARRAY['Cohort', 'Case-control', 'Cross-sectional', 'Trial', 'Meta-analysis']), 2, 'Cross-sectional studies assess both variables simultaneously.'),
    (v_topic_id, 'Which statistical test is best for comparing the mean serum sodium level between two independent groups?', to_jsonb(ARRAY['Chi-square', 'Student t-test', 'ANOVA', 'Pearson correlation', 'Fisher exact test']), 1, 'A t-test compares the means of two groups for a continuous variable.'),
    (v_topic_id, 'Which statistical test is best for comparing mean systolic blood pressure among three treatment groups?', to_jsonb(ARRAY['Chi-square', 'Student t-test', 'ANOVA', 'Pearson correlation', 'Kaplan-Meier analysis']), 2, 'ANOVA compares means across 3+ groups.'),
    (v_topic_id, 'Which statistical test is best for comparing smoking status (yes/no) between cases and controls?', to_jsonb(ARRAY['Student t-test', 'Chi-square', 'ANOVA', 'Pearson correlation', 'Linear regression']), 1, 'Chi-square is used for comparing categorical variables.'),
    (v_topic_id, 'Which statistic best describes the linear relationship between height and weight?', to_jsonb(ARRAY['Odds ratio', 'Hazard ratio', 'Pearson correlation coefficient', 'Chi-square', 'NNT']), 2, 'Pearson correlation measures linear association between continuous variables.'),
    (v_topic_id, 'A researcher wants to predict systolic blood pressure using age, BMI, and sodium intake. Best method?', to_jsonb(ARRAY['Logistic regression', 'Multiple linear regression', 'Chi-square', 'Kaplan-Meier', 'Fisher exact']), 1, 'Multiple linear regression models a continuous outcome.'),
    (v_topic_id, 'A researcher wants to model mortality (dead/alive) using age, smoking, and diabetes. Best method?', to_jsonb(ARRAY['Multiple linear regression', 'Logistic regression', 'ANOVA', 'Pearson correlation', 'Kaplan-Meier only']), 1, 'Logistic regression is for binary outcomes.'),
    (v_topic_id, 'A study compares survival over time between two chemotherapy regimens. Best display method?', to_jsonb(ARRAY['Scatterplot', 'Boxplot', 'Kaplan-Meier curve', 'Histogram', 'Pie chart']), 2, 'Kaplan-Meier curves display time-to-event data.'),
    (v_topic_id, 'Mammography screening is an example of:', to_jsonb(ARRAY['Primary prevention', 'Secondary prevention', 'Tertiary prevention', 'Quaternary prevention', 'Palliative care']), 1, 'Secondary prevention = early detection.'),
    (v_topic_id, 'Cardiac rehabilitation after myocardial infarction is an example of:', to_jsonb(ARRAY['Primary prevention', 'Secondary prevention', 'Tertiary prevention', 'Population screening', 'Primordial prevention']), 2, 'Tertiary prevention reduces disability after disease occurs.');

    -- Q51-Q60
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'A researcher finds that a blood pressure cuff gives nearly identical readings on repeated measurements in the same stable patient, but the readings are consistently 10 mm Hg higher than the true value. Which statement is correct?', to_jsonb(ARRAY['The measurement is valid and reliable', 'The measurement is reliable but not valid', 'The measurement is valid but not reliable', 'The measurement is neither valid nor reliable', 'The measurement is unbiased']), 1, 'Reproducible results = high reliability; systematic bias = poor validity.'),
    (v_topic_id, 'Which term best describes how closely repeated measurements agree with one another?', to_jsonb(ARRAY['Validity', 'Accuracy', 'Reliability', 'Confounding', 'External validity']), 2, 'Reliability = consistency.'),
    (v_topic_id, 'A questionnaire appears on its surface to measure anxiety well, but no formal validation has been done. This best describes:', to_jsonb(ARRAY['Construct validity', 'Content validity', 'Face validity', 'Criterion validity', 'Reliability']), 2, 'Face validity = surface appearance of measurement.'),
    (v_topic_id, 'A new depression scale correlates strongly with an established gold-standard psychiatric interview. This is best evidence for:', to_jsonb(ARRAY['Recall bias', 'Criterion validity', 'Low specificity', 'Poor reliability', 'Effect modification']), 1, 'Agreement with a gold standard supports criterion validity.'),
    (v_topic_id, 'A researcher wants to know whether a survey truly measures "burnout" rather than depression or anxiety. This is primarily a question of:', to_jsonb(ARRAY['Reliability', 'Construct validity', 'Power', 'Precision', 'Specificity']), 1, 'Construct validity = measuring the intended theoretical concept.'),
    (v_topic_id, 'A researcher wants to compare the average hemoglobin level before and after treatment in the same patients. Which statistical test is most appropriate?', to_jsonb(ARRAY['Chi-square test', 'Unpaired Student t-test', 'Paired Student t-test', 'ANOVA', 'Pearson correlation']), 2, 'Paired t-test is for measurements in the same subjects twice.'),
    (v_topic_id, 'Researchers compare mean LDL cholesterol across four different diet groups. Which test is most appropriate?', to_jsonb(ARRAY['Chi-square', 'Student t-test', 'ANOVA', 'Logistic regression', 'Fisher exact test']), 2, 'ANOVA compares means across 3+ groups.'),
    (v_topic_id, 'A researcher examines the relationship between body mass index and systolic blood pressure in 500 adults. Both are continuous variables. The best initial statistic is:', to_jsonb(ARRAY['Odds ratio', 'Relative risk', 'Pearson correlation coefficient', 'Chi-square', 'NNT']), 2, 'Pearson correlation measures linear relationship between continuous variables.'),
    (v_topic_id, 'A correlation coefficient of -0.7 between exercise time and resting heart rate suggests:', to_jsonb(ARRAY['Strong positive association', 'Weak positive association', 'No association', 'Strong negative association', 'Causation']), 3, 'Value near -1 = strong inverse relationship.'),
    (v_topic_id, 'A study examines whether BMI predicts diabetes after adjusting for age, sex, and family history. Which analytic method is most appropriate if diabetes is coded as yes/no?', to_jsonb(ARRAY['Linear regression', 'Logistic regression', 'Pearson correlation', 'Kaplan-Meier analysis', 'Paired t-test']), 1, 'Binary outcome = Logistic regression.');

    -- Q61-Q70
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'In linear regression, the dependent variable is usually:', to_jsonb(ARRAY['Binary only', 'Continuous', 'Always categorical', 'Time-to-event only', 'Ordinal only']), 1, 'Linear regression models a continuous outcome.'),
    (v_topic_id, 'A survival study reports a hazard ratio of 2.0 for smokers compared with nonsmokers. This means:', to_jsonb(ARRAY['Smokers are twice as prevalent', 'Smokers have twice the instantaneous event rate over time', 'Smokers have exactly twice the cumulative incidence at all times', 'Smoking causes disease in 2% of subjects', 'Odds are doubled only in case-control studies']), 1, 'HR compares instantaneous event rates.'),
    (v_topic_id, 'The best test to compare survival distributions between two groups is the:', to_jsonb(ARRAY['Chi-square test', 'Student t-test', 'Log-rank test', 'Pearson correlation', 'Fisher exact test']), 2, 'Log-rank test compares Kaplan-Meier curves.'),
    (v_topic_id, 'A 95% confidence interval becomes narrower when:', to_jsonb(ARRAY['Sample size decreases', 'Sample size increases', 'Variability increases', 'Bias increases', 'Power decreases']), 1, 'Larger sample sizes improve precision.'),
    (v_topic_id, 'A very wide confidence interval suggests:', to_jsonb(ARRAY['High precision', 'Low precision', 'High validity', 'Low prevalence', 'No confounding']), 1, 'Wide CIs = low precision.'),
    (v_topic_id, 'A p-value of 0.20 means:', to_jsonb(ARRAY['The null hypothesis is true', 'The treatment definitely does not work', 'The observed data are not very unusual if the null hypothesis is true', 'The result is clinically unimportant', 'Type I error has occurred']), 2, 'Higher p-value = data compatible with null.'),
    (v_topic_id, 'If alpha is set to 0.01 instead of 0.05, which is most likely to happen, all else equal?', to_jsonb(ARRAY['Type I error increases', 'Type II error decreases', 'Type I error decreases and Type II error may increase', 'Power increases automatically', 'Confidence intervals narrow']), 2, 'Lowering alpha reduces false positives but can increase false negatives.'),
    (v_topic_id, 'A study with small sample size and high variance is most at risk for:', to_jsonb(ARRAY['Type I error only', 'Type II error', 'Recall bias', 'Ecologic fallacy', 'Berkson bias']), 1, 'Small samples reduce power, increasing false negatives.'),
    (v_topic_id, 'A researcher repeats many subgroup analyses until one p-value is <0.05 and then only reports that result. This most strongly contributes to:', to_jsonb(ARRAY['Recall bias', 'Publication/reporting bias', 'Lead-time bias', 'Berkson bias', 'Confounding by age']), 1, 'Selective reporting distorts findings.'),
    (v_topic_id, 'A funnel plot in meta-analysis is commonly used to assess:', to_jsonb(ARRAY['Confounding', 'Publication bias', 'Randomization quality', 'Specificity', 'NNT']), 1, 'Asymmetry suggests publication bias.');

    -- Q71-Q80
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'A meta-analysis pools several randomized controlled trials and finds substantial heterogeneity among study results. This means:', to_jsonb(ARRAY['The studies are perfectly consistent', 'There is important variation among study effect estimates', 'The pooled result is automatically invalid', 'Randomization failed in all studies', 'Sensitivity is low']), 1, 'Heterogeneity = study results differ more than expected by chance.'),
    (v_topic_id, 'Which of the following best improves external validity?', to_jsonb(ARRAY['Highly selective enrollment criteria', 'Single-center recruitment only', 'Broad and representative sampling', 'Excluding elderly patients', 'Restricting enrollment to one sex unnecessarily']), 2, 'Broad sampling improves generalizability.'),
    (v_topic_id, 'A trial conducted entirely in healthy 20-year-old men may have limited:', to_jsonb(ARRAY['Internal validity', 'Reliability', 'External validity', 'Precision', 'Specificity']), 2, 'Findings may not generalize to other groups.'),
    (v_topic_id, 'Internal validity is primarily concerned with whether:', to_jsonb(ARRAY['Results generalize to other populations', 'The study result is free from major bias and confounding', 'A questionnaire is reliable', 'The disease is common', 'The outcome is binary']), 1, 'Internal validity = trustworthy for study population.'),
    (v_topic_id, 'A diagnostic test result is compared with the definitive gold-standard diagnosis in the same patients. This study is mainly evaluating:', to_jsonb(ARRAY['Reliability', 'Test operating characteristics', 'Effect modification', 'Attrition bias', 'Publication bias']), 1, 'Evaluating sensitivity, specificity, etc.'),
    (v_topic_id, 'A new risk factor is associated with disease in crude analysis, but after stratifying by age, the association disappears in every age stratum. This most suggests:', to_jsonb(ARRAY['Effect modification', 'Confounding by age', 'Recall bias', 'Selection bias', 'Publication bias']), 1, 'If stratification removes association, it was likely confounding.'),
    (v_topic_id, 'A researcher wants to know whether a treatment reduces mortality differently in men and women. This is testing for:', to_jsonb(ARRAY['Attrition', 'Effect modification', 'Recall bias', 'Lead-time bias', 'Spectrum bias']), 1, 'Asking if effect varies by sex.'),
    (v_topic_id, 'A cohort study is most vulnerable to which bias if many participants are lost over time?', to_jsonb(ARRAY['Recall bias', 'Attrition bias', 'Berkson bias', 'Ecologic fallacy', 'Lead-time bias']), 1, 'Loss to follow-up = attrition bias.'),
    (v_topic_id, 'In a randomized trial, analysis according to treatment actually received instead of original assignment most risks:', to_jsonb(ARRAY['Preserving randomization', 'Introducing bias from nonadherence', 'Improving internal validity automatically', 'Eliminating confounding completely', 'Reducing Type II error only']), 1, 'Departing from ITT introduces bias.'),
    (v_topic_id, 'A disease-screening program lowers disease-specific mortality but not overall mortality. Which concern is still reasonable?', to_jsonb(ARRAY['The screening is definitely useless', 'Harms of screening or competing causes of death may offset benefit', 'Specificity must be 100%', 'Incidence always decreases', 'There can be no false positives']), 1, 'Disease-specific benefit != all-cause improvement.');

    -- Q81-Q90
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'A new screening test is compared with standard screening in a randomized population trial. The best outcome to prove benefit is:', to_jsonb(ARRAY['Increased prevalence', 'Increased 5-year survival only', 'Reduced disease-specific mortality', 'More positive test results', 'Higher PPV only']), 2, 'Key benefit = fewer deaths from the disease.'),
    (v_topic_id, 'A disease becomes more common in a population because a new screening test detects many asymptomatic cases, but no change occurs in incidence. Which measure rises immediately?', to_jsonb(ARRAY['Sensitivity', 'Specificity', 'Prevalence', 'Relative risk', 'NNT']), 2, 'Detecting more cases raises prevalence.'),
    (v_topic_id, 'A physician wants to estimate post-test probability after obtaining a test result. The most helpful statistic for this process is:', to_jsonb(ARRAY['Relative risk', 'Likelihood ratio', 'Hazard ratio', 'NNT', 'Prevalence alone']), 1, 'Likelihood ratios update pretest probability.'),
    (v_topic_id, 'A test has LR+ of 1. Which statement is true?', to_jsonb(ARRAY['A positive result strongly rules in disease', 'The test is useless for ruling in disease', 'Specificity must be 100%', 'Prevalence is 1%', 'The test is perfect']), 1, 'LR of 1 = no change in probability.'),
    (v_topic_id, 'A test has LR- close to 0. Which is true?', to_jsonb(ARRAY['A negative result strongly helps rule out disease', 'The test has poor sensitivity', 'A positive result is useless', 'Disease prevalence is zero', 'Specificity must be low']), 0, 'LR- near 0 = strong rule out.'),
    (v_topic_id, 'A public health officer measures deaths per 100,000 population per year from influenza. This is:', to_jsonb(ARRAY['Case fatality rate', 'Mortality rate', 'Prevalence', 'Odds ratio', 'Relative risk']), 1, 'Mortality rate describes deaths in overall population.'),
    (v_topic_id, 'An intervention reduces disease incidence before it develops in the first place. This is:', to_jsonb(ARRAY['Primary prevention', 'Secondary prevention', 'Tertiary prevention', 'Quaternary prevention', 'Palliative care']), 0, 'Primary = preventing occurrence.'),
    (v_topic_id, 'Colonoscopy in asymptomatic adults is best classified as:', to_jsonb(ARRAY['Primary prevention only', 'Secondary prevention', 'Tertiary prevention', 'Quaternary prevention', 'Rehabilitation']), 1, 'Screening = secondary prevention.'),
    (v_topic_id, 'Physical therapy after stroke is best classified as:', to_jsonb(ARRAY['Primary prevention', 'Secondary prevention', 'Tertiary prevention', 'Primordial prevention', 'Screening']), 2, 'Tertiary = reducing disability.'),
    (v_topic_id, 'A disease-screening test is applied to a population with much milder disease than the population in which it was originally validated, and performance changes. This is most consistent with:', to_jsonb(ARRAY['Spectrum bias', 'Recall bias', 'Berkson bias', 'Publication bias', 'Attrition bias']), 0, 'Test performance varies with case mix.');

    -- Q91-Q100
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES
    (v_topic_id, 'A researcher directly observes participants and changes behavior because they know they are being watched. This is:', to_jsonb(ARRAY['Recall bias', 'Hawthorne effect', 'Lead-time bias', 'Simpson paradox', 'Confounding']), 1, 'Hawthorne effect = behavior change due to observation.'),
    (v_topic_id, 'In a public health program, rates are expressed per 10,000 person-years. Person-time denominators are especially useful when:', to_jsonb(ARRAY['Everyone is followed for exactly the same duration', 'Follow-up time varies among participants', 'Prevalence is being measured', 'Sensitivity is being calculated', 'Randomization is absent']), 1, 'Accounts for unequal follow-up lengths.'),
    (v_topic_id, 'Incidence density is best defined as:', to_jsonb(ARRAY['Existing cases divided by total population', 'New cases divided by person-time at risk', 'Deaths among cases', 'New cases divided by all existing cases', 'Exposed cases divided by controls']), 1, 'Incidence density uses person-time in denominator.'),
    (v_topic_id, 'A case-control study cannot directly calculate incidence because:', to_jsonb(ARRAY['It begins with exposure groups', 'It begins with outcome groups rather than a population at risk over time', 'It is always retrospective', 'Controls are always healthy', 'Odds ratios replace all rates']), 1, 'Denominator population at risk over time is not defined.'),
    (v_topic_id, 'Which design best establishes temporality between exposure and outcome?', to_jsonb(ARRAY['Cross-sectional study', 'Cohort study', 'Ecologic study', 'Case series', 'Case report']), 1, 'Cohort study assesses exposure before outcome.'),
    (v_topic_id, 'A patient asks why two studies on the same topic came to different conclusions. One likely reason is random error, which is reduced mainly by:', to_jsonb(ARRAY['Better concealment only', 'Larger sample size', 'Lower prevalence', 'More subgroup analyses', 'Selective reporting']), 1, 'Random error falls as sample size increases.'),
    (v_topic_id, 'Systematic error differs from random error because systematic error:', to_jsonb(ARRAY['Improves precision', 'Cannot bias results', 'Pushes estimates consistently away from the truth', 'Always disappears with larger sample size', 'Is identical to confounding only']), 2, 'Systematic error = bias.'),
    (v_topic_id, 'A study estimates the effect of a drug as RR 0.60. This suggests the drug:', to_jsonb(ARRAY['Increases risk by 60%', 'Reduces risk by 40%', 'Has no effect', 'Is harmful', 'Has ARR of 60%']), 1, 'RR 0.60 = 40% relative reduction.'),
    (v_topic_id, 'A clinician says, "This result is statistically significant but may not be clinically significant." This means:', to_jsonb(ARRAY['The p-value is invalid', 'The observed effect may be too small to matter clinically despite meeting a statistical threshold', 'The confidence interval must include 1', 'The study has no power', 'There is definitely bias']), 1, 'Statistical significance != clinical importance.'),
    (v_topic_id, 'A trial finds blood pressure falls by 1 mm Hg with p < 0.001 in 100,000 subjects. Best interpretation:', to_jsonb(ARRAY['The effect is necessarily clinically important', 'Large sample size can make tiny effects statistically significant', 'The null hypothesis is definitely false', 'The study has low power', 'The confidence interval must be wide']), 1, 'Large samples detect tiny differences.');

END $$;
