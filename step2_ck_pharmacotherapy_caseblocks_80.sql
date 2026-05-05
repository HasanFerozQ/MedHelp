-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Clinical Case Integration (Step 2 CK)
-- Topic: Pharmacotherapy in clinical context
-- Topic Slug: case-pharmacotherapy
-- Sourced: UWorld, Step-Up to Medicine, MTB Step 2, First Aid Step 2 CK

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-pharmacotherapy' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'case-pharmacotherapy';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 80-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: The Potency Ladder
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Potency Ladder', 'A 40-year-old male with thick, scaly psoriasis plaques on his elbows and knees is prescribed a topical corticosteroid.

Vitals: Normal.
Physical Examination: Large, well-demarcated plaques with silver scale on the extensor surfaces.
Laboratory Results: None.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which class of topical corticosteroid is most appropriate for thick plaques on the elbows?', '["Class 7 (Low potency, e.g., Hydrocortisone 1%)","Class 4 (Medium potency)","Class 1 (Ultra-high potency, e.g., Clobetasol propionate)","No steroids should be used"]', 2, 'Thick, hyperkeratotic plaques require ultra-high potency steroids for effective penetration.'),
        (v_case_id, 'If the patient develops psoriasis in his armpits (inverse psoriasis), what should you change?', '["Use Class 1 steroids","Switch to a low-potency steroid (Class 6 or 7) or a calcineurin inhibitor","Use only systemic therapy","None"]', 1, 'Thin-skinned intertriginous areas are highly susceptible to steroid side effects like atrophy and striae; low potency is required.'),
        (v_case_id, 'What is a common local side effect of chronic, high-potency steroid use on the skin?', '["Skin thickening","Skin atrophy, telangiectasias, and striae","Fungal infection only","None"]', 1, 'Steroids inhibit collagen synthesis, leading to thinning of the dermis.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Retinoid Protocol
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Retinoid Protocol', 'A 20-year-old female with severe, scarring nodulocystic acne is starting oral Isotretinoin.

Vitals: Normal.
Physical Examination: Multiple deep, painful nodules and cysts on the face and back. Significant scarring is noted.
Laboratory Results: Negative pregnancy test.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary mechanism of action of Isotretinoin?', '["Kills bacteria","Reduces sebum production, normalizes keratinization, and has anti-inflammatory effects","Blocks testosterone","None"]', 1, 'Isotretinoin is the only acne medication that targets all four pathogenic factors.'),
        (v_case_id, 'Which laboratory parameter is most commonly elevated during Isotretinoin therapy?', '["Serum Creatinine","Triglycerides","White blood cell count","Potassium"]', 1, 'Hypertriglyceridemia is a frequent side effect requiring monitoring.'),
        (v_case_id, 'What is the most common MUCOCUTANEOUS side effect of Isotretinoin?', '["Hair loss","Cheilitis (dry, cracked lips)","Night blindness","None"]', 1, 'Nearly 100% of patients experience dry lips; its absence often suggests non-compliance.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Biologic Revolution
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Biologic Revolution', 'A 45-year-old male with severe plaque psoriasis (>20% BSA) has failed treatment with Methotrexate. He is being considered for a TNF-alpha inhibitor (e.g., Adalimumab).

Vitals: Normal.
Physical Examination: Extensive erythematous scaly plaques.
Laboratory Results: None.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which screening test is ''Mandatory'' before initiating any TNF-alpha inhibitor?', '["Chest X-ray and Latent TB screening (e.g., PPD or Interferon-gamma release assay)","Liver biopsy","Renal ultrasound","None"]', 0, 'TNF-alpha is critical for granuloma maintenance; blocking it can cause reactivation of latent Tuberculosis.'),
        (v_case_id, 'TNF-alpha inhibitors are contraindicated in patients with which of the following conditions?', '["Diabetes","Congestive Heart Failure (NYHA Class III/IV) or Multiple Sclerosis","Hypertension","Asthma"]', 1, 'TNF inhibitors can worsen CHF and are associated with demyelinating events.'),
        (v_case_id, 'What is a potential ''Paradoxical'' side effect of TNF inhibitors?', '["Weight loss","Development of new-onset psoriasis or palmoplantar pustulosis","Hair growth","None"]', 1, 'Paradoxical psoriasis is a well-recognized adverse event of this drug class.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Antifungal Choice
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Antifungal Choice', 'A 40-year-old male with Type 2 Diabetes presents with a fungal infection of all 10 toenails.

Vitals: Normal.
Physical Examination: Thick, yellow, crumbly nails.
Laboratory Results: Culture confirms Trichophyton rubrum.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Terbinafine?', '["Inhibits ergosterol synthesis by blocking lanosterol demethylase","Inhibits ergosterol synthesis by blocking squalene epoxidase","Binds to ergosterol directly","Inhibits DNA synthesis"]', 1, 'Terbinafine is a squalene epoxidase inhibitor. (Azoles block lanosterol demethylase).'),
        (v_case_id, 'What is the recommended duration of Terbinafine for toenail onychomycosis?', '["1 week","2 weeks","12 weeks","1 year"]', 2, '12 weeks is standard for toenails; 6 weeks for fingernails.'),
        (v_case_id, 'Which uncommon but serious side effect can occur with Terbinafine?', '["Kidney stones","Hepatotoxicity or taste disturbance (dysgeusia)","Hearing loss","None"]', 1, 'LFT monitoring is recommended due to the rare risk of liver injury.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Steroid-Sparing Agent
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Steroid-Sparing Agent', 'A patient with severe atopic dermatitis is starting Methotrexate to reduce her reliance on oral Prednisone.

Vitals: Normal.
Physical Examination: Extensive lichenified eczema.
Laboratory Results: Normal baseline labs.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Methotrexate is an antagonist of which vitamin?', '["Vitamin C","Folic Acid (Folate)","Vitamin B12","Vitamin D"]', 1, 'It inhibits dihydrofolate reductase.'),
        (v_case_id, 'What is commonly co-administered with Methotrexate to reduce GI and hematologic toxicity?', '["Vitamin A","Folic acid (1mg daily or 5mg weekly)","Iron","None"]', 1, 'Folic acid supplementation significantly reduces common side effects.'),
        (v_case_id, 'Which ''Red Flag'' symptom should a patient on Methotrexate report immediately?', '["Dry skin","Dry cough and shortness of breath (suggesting Methotrexate-induced pneumonitis)","Hunger","None"]', 1, 'Pneumonitis is a rare but life-threatening idiosyncratic reaction.');

    ---------------------------------------------------------------------------
    -- CASE 06: The ''Red Man'' and the Vancomycin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Red Man'' and the Vancomycin', 'A patient being treated for a MRSA skin infection develops intense flushing and itching of the face and neck shortly after the start of an IV Vancomycin infusion.

Vitals: BP 110/70, HR 95.
Physical Examination: Erythema of the face, neck, and upper torso. No wheezing or angioedema.
Laboratory Results: None.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of ''Red Man Syndrome'' (now called Vancomycin Flushing Syndrome)?', '["IgE-mediated allergy","Direct, non-immune mast cell degranulation and histamine release","T-cell reaction","Fungal overgrowth"]', 1, 'It is a pseudoallergic reaction related to the rate of infusion.'),
        (v_case_id, 'How should this reaction be managed?', '["Stop infusion and never give Vancomycin again","Slow the infusion rate and pre-treat with antihistamines","Give Epinephrine","None"]', 1, 'Slowing the rate usually prevents the reaction.'),
        (v_case_id, 'Is this a contraindication to future Vancomycin use?', '["Yes","No, it is not a true allergy","Only in children","None"]', 1, 'Unlike anaphylaxis, it does not preclude future use.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Psoriasis Flare and the Steroid
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Psoriasis Flare and the Steroid', 'A patient with stable plaque psoriasis is given a dose of oral Prednisone for a severe poison ivy reaction. Two weeks after stopping the Prednisone, his psoriasis erupts into hundreds of tiny pustules.

Vitals: T 38.5 C.
Physical Examination: Widespread erythema with thousands of small, sterile pustules (von Zumbusch psoriasis).
Laboratory Results: WBC 20,000.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the major danger of using systemic corticosteroids in plaque psoriasis?', '["They don''t work","Risk of life-threatening pustular or erythrodermic flare upon withdrawal","They cause hair loss","None"]', 1, 'This is a classic USMLE ''don''t do'' for psoriasis management.'),
        (v_case_id, 'What is the first-line systemic treatment for acute generalized pustular psoriasis?', '["More Prednisone","Oral Acitretin, Cyclosporine, or Infliximab","Topical antifungals","None"]', 1, 'Rapid-acting systemics are required to stabilize the patient.'),
        (v_case_id, 'What is a major laboratory finding in these patients?', '["Anemia","Hypocalcemia (which can lead to tetany)","High Vitamin D","None"]', 1, 'Hypocalcemia is a recognized metabolic complication of pustular psoriasis.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Antiviral for the Eyes
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Antiviral for the Eyes', 'A patient with suspected Zoster Ophthalmicus is started on oral Valacyclovir.

Vitals: Normal.
Physical Examination: Vesicles in V1 distribution.
Laboratory Results: Elevated Creatinine (Baseline 1.0, now 1.8).', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How do Acyclovir and its derivatives (Valacyclovir) cause kidney injury?', '["Direct tubular necrosis","Crystal-induced nephropathy (precipitation in renal tubules)","Allergic interstitial nephritis","None"]', 1, 'High doses or dehydration can lead to obstructive crystal formation.'),
        (v_case_id, 'What is the best way to prevent this kidney injury?', '["Give the drug with milk","Adequate hydration (IV or oral) during therapy","Combine with a diuretic","None"]', 1, 'Hydration keeps the crystals in solution.'),
        (v_case_id, 'Valacyclovir is a ''prodrug'' of which medication?', '["Ganciclovir","Acyclovir","Foscarnet","None"]', 1, 'It has better oral bioavailability than acyclovir itself.');

    ---------------------------------------------------------------------------
    -- CASE 09: The Eczema and the ''Non-Steroid''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Eczema and the ''Non-Steroid''', 'A 5-year-old child with eczema on the eyelids is prescribed Tacrolimus ointment.

Vitals: Normal.
Physical Examination: Red, scaly eyelids.
Laboratory Results: None.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary advantage of TCIs (Tacrolimus, Pimecrolimus) over topical steroids?', '["They are cheaper","They do not cause skin atrophy, making them safe for thin-skinned areas like eyelids","They work faster","None"]', 1, 'TCIs do not inhibit collagen synthesis.'),
        (v_case_id, 'What is the most common side effect of TCI application?', '["Skin thinning","Burning or stinging sensation upon application","Hair growth","None"]', 1, 'This is a common but transient side effect.'),
        (v_case_id, 'What is the mechanism of action of Tacrolimus?', '["Blocks histamine","Inhibits calcineurin, preventing the activation of T-cells","Kills bacteria","None"]', 1, 'It is a targeted immunomodulator.');

    ---------------------------------------------------------------------------
    -- CASE 10: The ''Sun-Sensitive'' Antibiotic
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Sun-Sensitive'' Antibiotic', 'A 16-year-old male taking Doxycycline for acne develops a severe sunburn after only 20 minutes outside.

Vitals: Normal.
Physical Examination: Bright red erythema and edema on sun-exposed areas (face, arms).
Laboratory Results: None.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which type of reaction did this patient experience?', '["Photoallergic","Phototoxic (a direct chemical-induced sensitivity to UV light)","Allergy to the sun","None"]', 1, 'Tetracyclines (especially Doxycycline and Demeclocycline) are classic phototoxic agents.'),
        (v_case_id, 'Besides photosensitivity, what is a major contraindication for Tetracyclines in children < 8 years old?', '["Kidney failure","Permanent tooth discoloration and inhibition of bone growth","Liver failure","None"]', 1, 'The drug binds to calcium in developing teeth and bones.'),
        (v_case_id, 'What is the ''pill-induced'' complication associated with Tetracyclines if taken right before bed with little water?', '["Stomach ulcer","Pill-induced esophagitis","Kidney stones","None"]', 1, 'Patients should be advised to stay upright and drink plenty of water after taking the pill.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Psoriasis and the ''A'' Vitamin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Psoriasis and the ''A'' Vitamin', 'A woman with plaque psoriasis is prescribed Acitretin.

Vitals: Normal.
Physical Examination: Scaly plaques.
Laboratory Results: None.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How long must a woman avoid pregnancy AFTER stopping Acitretin?', '["1 month","6 months","3 years (due to long half-life and re-esterification to etretinate)","Never"]', 2, 'This is a much longer period than Isotretinoin (which is 1 month).'),
        (v_case_id, 'What common beverage must be strictly avoided during Acitretin therapy to prevent the formation of etretinate?', '["Milk","Alcohol","Grapefruit juice","Coffee"]', 1, 'Alcohol triggers the conversion of acitretin to etretinate, which is stored in fat for years.'),
        (v_case_id, 'Acitretin is most effective when used in combination with which other therapy?', '["Steroids","UVB Phototherapy (Re-UVB)","Antibiotics","None"]', 1, 'Retinoids thin the stratum corneum, allowing better UV penetration.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Itch and the ''Old'' Antihistamine
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itch and the ''Old'' Antihistamine', 'An elderly man takes Diphenhydramine (Benadryl) for itching. His family finds him confused and unable to urinate the next morning.

Vitals: Normal.
Physical Examination: Disoriented, suprapubic fullness (distended bladder).
Laboratory Results: None.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why are first-generation antihistamines (e.g., Diphenhydramine, Hydroxyzine) generally avoided in the elderly?', '["They don''t work","Potent anticholinergic and sedative effects (confusion, dry mouth, urinary retention)","They cause weight loss","None"]', 1, 'These are part of the ''Beers Criteria'' for potentially inappropriate medications in older adults.'),
        (v_case_id, 'Which receptor besides H1 do these drugs block to cause these side effects?', '["Beta receptors","Muscarinic (Acetylcholine) receptors","Alpha receptors","None"]', 1, 'The lack of selectivity leads to the anticholinergic profile.'),
        (v_case_id, 'Which class of antihistamines is preferred for daytime itching in any patient?', '["First-generation","Second-generation (e.g., Cetirizine, Loratadine, Fexofenadine)","None","Steroids"]', 1, 'Second-generation agents are non-sedating and have fewer side effects.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Target and the IL-17
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Target and the IL-17', 'A patient with severe psoriasis is starting Secukinumab.

Vitals: Normal.
Physical Examination: Plaques.
Laboratory Results: None.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which specific inflammatory cytokine is targeted by Secukinumab and Ixekizumab?', '["TNF-alpha","IL-17A","IL-23","IL-4"]', 1, 'These are highly effective modern biologics for psoriasis.'),
        (v_case_id, 'Patients with which underlying condition should avoid IL-17 inhibitors due to the risk of exacerbation?', '["Diabetes","Inflammatory Bowel Disease (Crohn''s/UC)","Asthma","None"]', 1, 'IL-17 inhibition has been linked to the worsening of IBD.'),
        (v_case_id, 'What type of infection is more common in patients taking IL-17 inhibitors?', '["Bacterial","Mucocutaneous Candidiasis","Viral","None"]', 1, 'IL-17 is crucial for host defense against Candida.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Gout Drug and the Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Gout Drug and the Rash', 'A patient with chronic gout starts Allopurinol. Two weeks later, he develops a high fever, a widespread rash, and swollen lymph nodes.

Vitals: T 39.0 C.
Physical Examination: Widespread morbilliform rash, facial edema, and lymphadenopathy.
Laboratory Results: Eosinophilia (WBC 15,000, 15% eosinophils), elevated ALT/AST.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the acronym DRESS stand for?', '["Daily Rash and Every Skin Sore","Drug Reaction with Eosinophilia and Systemic Symptoms","Dermal Redness and Severe Sepsis","None"]', 1, 'It is a severe, life-threatening drug reaction with internal organ involvement.'),
        (v_case_id, 'What is the typical ''Latency'' (time from drug start to rash) for DRESS?', '["1 day","2-8 weeks (longer than simple drug rashes)","1 year","None"]', 1, 'The long latency is a key diagnostic clue.'),
        (v_case_id, 'Which organ is most commonly involved in DRESS?', '["Lungs","Liver (hepatitis)","Kidneys","Brain"]', 1, 'Transaminitis is seen in most cases.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Acne and the ''Blue'' Pigment
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Acne and the ''Blue'' Pigment', 'A 25-year-old male who has been taking Minocycline for acne for 2 years notices his acne scars and shins are turning ''blue-gray''.

Vitals: Normal.
Physical Examination: Blue-gray pigmentation on the shins and within acne scars on the face.
Laboratory Results: None.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which medication is most commonly associated with blue-gray skin and mucosal pigmentation?', '["Doxycycline","Minocycline","Amoxicillin","None"]', 1, 'Minocycline can deposit in various tissues including skin, nails, and bones.'),
        (v_case_id, 'Besides the skin, where else can this pigmentation be seen?', '["Teeth (in adults)","Sclera, ears, and oral mucosa","Hair","None"]', 1, 'It is a widespread deposition phenomenon.'),
        (v_case_id, 'What is the management for minocycline-induced pigmentation?', '["More Minocycline","Discontinue the drug (though pigmentation may persist for a long time)","Topical Steroids","None"]', 1, 'Immediate cessation is required once noticed.');

    ---------------------------------------------------------------------------
    -- CASE 16: The ''Silver'' and the Pregnancy
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Silver'' and the Pregnancy', 'A pregnant woman with a small area of impetigo is asking if she can use topical Mupirocin.

Vitals: Normal.
Physical Examination: Honey-crusted sores.
Laboratory Results: None.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Mupirocin?', '["Inhibits cell wall synthesis","Inhibits bacterial protein synthesis by binding to isoleucyl-tRNA synthetase","Inhibits DNA","None"]', 1, 'This is a unique mechanism of action for this topical agent.'),
        (v_case_id, 'Is topical Mupirocin considered safe in pregnancy?', '["Yes (Category B)","No","Only in the 1st trimester","None"]', 0, 'It is widely used and generally considered safe for limited areas.'),
        (v_case_id, 'Mupirocin is highly effective against which organisms?', '["Gram-negatives only","Gram-positive cocci (including MRSA)","Fungi","Viruses"]', 1, 'It is the drug of choice for decolonizing MRSA from the nares.');

    ---------------------------------------------------------------------------
    -- CASE 17: The ''Old'' Antifungal and the Side Effects
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Old'' Antifungal and the Side Effects', 'A child with tinea capitis is started on oral Griseofulvin.

Vitals: Normal.
Physical Examination: Scaly scalp.
Laboratory Results: None.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How should Griseofulvin be taken to maximize absorption?', '["On an empty stomach","With a fatty meal (e.g., ice cream or whole milk)","With water only","None"]', 1, 'It is highly lipophilic; fat significantly increases bioavailability.'),
        (v_case_id, 'What is a common but annoying side effect of Griseofulvin?', '["Hair loss","Headache and GI upset","Blue skin","None"]', 1, 'Headaches are very common during the first few days of therapy.'),
        (v_case_id, 'Griseofulvin can induce which system in the liver?', '["None","Cytochrome P450 (decreasing the level of drugs like Warfarin or OCPs)","Lactate","None"]', 1, 'It is a known CYP450 inducer.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Itch and the ''New'' Eczema Drug
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itch and the ''New'' Eczema Drug', 'An adult with severe atopic dermatitis is starting Dupilumab (Dupixent).

Vitals: Normal.
Physical Examination: Extensive eczema.
Laboratory Results: None.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Dupilumab is a monoclonal antibody that targets which receptor?', '["TNF-alpha","IL-4 Receptor alpha (blocking both IL-4 and IL-13 signaling)","IL-17","None"]', 1, 'IL-4 and IL-13 are the ''master cytokines'' of Type 2 (Th2) inflammation.'),
        (v_case_id, 'What is the most common specific side effect of Dupilumab?', '["Liver failure","Conjunctivitis (red, itchy eyes)","Pneumonia","None"]', 1, 'Ocular side effects are uniquely common with this biologic.'),
        (v_case_id, 'Is baseline TB screening required for Dupilumab?', '["Yes, for all biologics","No, it is not significantly immunosuppressive in a way that reactivates TB","Only in the elderly","None"]', 1, 'Unlike TNF inhibitors, it does not carry a black box warning for TB.');

    ---------------------------------------------------------------------------
    -- CASE 19: The ''Sulfa'' and the SJS
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Sulfa'' and the SJS', 'A patient develops a blistering rash 10 days after starting TMP-SMX (Bactrim) for a UTI.

Vitals: T 38.0 C.
Physical Examination: Erythematous macules with central dusky areas; some sloughing on the back.
Laboratory Results: None.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Sulfonamides are a ''classic'' trigger for which severe skin reaction?', '["Acne","SJS/TEN","Psoriasis","None"]', 1, 'Along with Allopurinol and Anticonvulsants, Sulfa drugs are top culprits.'),
        (v_case_id, 'What other systemic ''Sulfa'' association is important in patients with G6PD deficiency?', '["Liver failure","Hemolytic anemia","Kidney stones","None"]', 1, 'Oxidative stress from Sulfa drugs triggers hemolysis in G6PD deficient patients.'),
        (v_case_id, 'Can a patient with a ''Sulfa'' allergy safely take Sulfonylureas (for diabetes)?', '["Yes, usually","No, never","Only if they are young","None"]', 0, 'Cross-reactivity between antimicrobial sulfonamides and non-antimicrobial sulfonamides (like diuretics or sulfonylureas) is extremely low and often overrated.');

    ---------------------------------------------------------------------------
    -- CASE 20: The ''Psoriasis'' and the IL-23
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the IL-23', 'A patient is starting Guselkumab (Tremfya).

Vitals: Normal.
Physical Examination: Plaques.
Laboratory Results: None.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which subunit is shared between IL-12 and IL-23, and was the target of the first ''interleukin'' biologic (Ustekinumab)?', '["p19","p40","p35","None"]', 1, 'Ustekinumab targets the p40 subunit.'),
        (v_case_id, 'Newer agents like Guselkumab target which specific subunit of IL-23?', '["p40","p19","p35","None"]', 1, 'Targeting p19 is more specific for IL-23 and doesn''t affect IL-12.'),
        (v_case_id, 'What is the primary advantage of these newer IL-23 inhibitors?', '["They are pills","Long dosing intervals (e.g., every 8-12 weeks) and high efficacy","No side effects","None"]', 1, 'The convenience and efficacy make them popular for long-term psoriasis management.');

    ---------------------------------------------------------------------------
    -- CASE 21: The ''Heart'' and the Antifungal
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Heart'' and the Antifungal', 'An elderly patient with onychomycosis and a history of Congestive Heart Failure is asking for oral Itraconazole.

Vitals: Normal.
Physical Examination: Thickened nails.
Laboratory Results: None.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the FDA Black Box Warning for Itraconazole?', '["Liver failure only","It can cause or exacerbate Congestive Heart Failure (negative inotropic effect)","Kidney failure","None"]', 1, 'This makes it a poor choice for patients with pre-existing heart disease.'),
        (v_case_id, 'Which type of ''Environment'' is required in the stomach for optimal Itraconazole absorption?', '["Alkaline","Acidic (do not take with PPIs or Antacids)","Neutral","None"]', 1, 'Itraconazole requires acid for dissolution.'),
        (v_case_id, 'Itraconazole is a potent inhibitor of which enzyme system?', '["None","CYP3A4 (leading to many drug-drug interactions)","Amylase","None"]', 1, 'It can dangerously increase levels of drugs like Statins or Midazolam.');

    ---------------------------------------------------------------------------
    -- CASE 22: The ''Lupus'' and the Anti-Malarial
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Lupus'' and the Anti-Malarial', 'A 30-year-old woman with Systemic Lupus Erythematosus (SLE) and a malar rash is started on Hydroxychloroquine (Plaquenil).

Vitals: Normal.
Physical Examination: Red ''butterfly'' rash on the face.
Laboratory Results: Positive ANA.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most important ''Long-term'' screening requirement for patients on Hydroxychloroquine?', '["Liver biopsy","Annual Ophthalmologic exam (to screen for retinal toxicity/bull''s eye maculopathy)","Hearing test","None"]', 1, 'Retinal toxicity is dose-dependent and can lead to irreversible vision loss.'),
        (v_case_id, 'Besides the skin, what major benefit does Hydroxychloroquine provide in SLE patients?', '["Weight loss","Decreases the frequency and severity of disease flares and improves overall survival","Cures the disease","None"]', 1, 'It is considered a ''cornerstone'' therapy for SLE.'),
        (v_case_id, 'Is Hydroxychloroquine safe to continue during pregnancy in an SLE patient?', '["No","Yes, and it is usually recommended to continue it to prevent maternal flares","Only in the 3rd trimester","None"]', 1, 'The benefits to the mother usually outweigh the risks.');

    ---------------------------------------------------------------------------
    -- CASE 23: The ''Psoriasis'' and the PDE4
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the PDE4', 'A patient who does not want injections or ''strong'' immunosuppressants is prescribed Apremilast (Otezla) for his psoriasis.

Vitals: Normal.
Physical Examination: Plaques.
Laboratory Results: None.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Apremilast?', '["TNF inhibitor","Phosphodiesterase-4 (PDE4) inhibitor","Steroid","None"]', 1, 'It increases intracellular cAMP, which downregulates inflammatory cytokines.'),
        (v_case_id, 'What is a common GI side effect that often requires a ''Starter Pack'' to slowly titrate the dose?', '["Constipation","Nausea and Diarrhea","Bloating","None"]', 1, 'Titration helps the body adjust to the GI effects.'),
        (v_case_id, 'Which neuropsychiatric side effect is mentioned in the labeling for Apremilast?', '["Mania","Depression and Suicidal ideation","Anxiety","None"]', 1, 'While rare, patients should be monitored for mood changes.');

    ---------------------------------------------------------------------------
    -- CASE 24: The ''Psoriasis'' and the IL-12/23
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the IL-12/23', 'A patient is starting Ustekinumab (Stelara).

Vitals: Normal.
Physical Examination: Plaques.
Laboratory Results: None.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Ustekinumab targets the common p40 subunit of which two interleukins?', '["IL-1 and IL-6","IL-12 and IL-23","IL-17 and IL-23","None"]', 1, 'This was the first ''targeted'' cytokine biologic for psoriasis after the TNF era.'),
        (v_case_id, 'What is the standard maintenance dosing interval for Ustekinumab?', '["Daily","Every week","Every 12 weeks","Once a year"]', 2, 'The long interval is a major advantage for patient compliance.'),
        (v_case_id, 'Like TNF inhibitors, does Ustekinumab require baseline TB screening?', '["No","Yes","Only in the elderly","None"]', 1, 'Screening for latent TB is standard for most systemic biologics used in dermatology.');

    ---------------------------------------------------------------------------
    -- CASE 25: The ''Itch'' and the ''Numb''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Numb''', 'A patient with shingles is asking for a ''patch'' to help with the pain.

Vitals: Normal.
Physical Examination: Healing vesicles.
Laboratory Results: None.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does Lidocaine provide pain relief?', '["Blocks histamine","Blocks voltage-gated sodium channels, preventing nerve conduction","Kills the virus","None"]', 1, 'It provides a local anesthetic effect.'),
        (v_case_id, 'What is the ''12 hours on, 12 hours off'' rule for lidocaine patches meant to prevent?', '["Skin irritation","Systemic lidocaine toxicity","Tolerance","None"]', 1, 'This ensures that systemic levels remain within the safe range.'),
        (v_case_id, 'Can the patch be applied to open, weeping shingles blisters?', '["Yes","No, it should only be applied to intact, healed skin","Only if covered with plastic","None"]', 1, 'Applying to broken skin significantly increases systemic absorption.');

    ---------------------------------------------------------------------------
    -- CASE 26: The ''Psoriasis'' and the Liver
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the Liver', 'A 50-year-old male with long-standing psoriasis has been on Methotrexate for 10 years. He is a social drinker.

Vitals: Normal.
Physical Examination: Minimal psoriasis plaques.
Laboratory Results: AST/ALT are mildly elevated (1.5x normal). Procollagen III peptide is elevated.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the long-term cumulative risk of Methotrexate use?', '["Kidney failure","Hepatic fibrosis and cirrhosis","Hearing loss","None"]', 1, 'Liver toxicity is dose-dependent and cumulative.'),
        (v_case_id, 'Which lifestyle factor significantly increases the risk of MTX-induced liver damage?', '["Smoking","Alcohol consumption","High protein diet","None"]', 1, 'Alcohol and MTX are synergistic hepatotoxins.'),
        (v_case_id, 'What is the ''Gold Standard'' for assessing MTX-induced liver fibrosis (though less commonly used now due to non-invasive tests)?', '["CT scan","Liver Biopsy","Ultrasound","None"]', 1, 'Historically, liver biopsy was required after 1.5-4g cumulative dose.');

    ---------------------------------------------------------------------------
    -- CASE 27: The ''Lupus'' and the ''White'' Blood Cells
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Lupus'' and the ''White'' Blood Cells', 'A patient with systemic lupus is started on Azathioprine.

Vitals: Normal.
Physical Examination: Joint pain and rash.
Laboratory Results: None.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which enzyme must be measured BEFORE starting Azathioprine to prevent life-threatening bone marrow suppression?', '["G6PD","Thiopurine Methyltransferase (TPMT)","Amylase","None"]', 1, 'Patients with low TPMT activity cannot metabolize the drug, leading to toxic levels of 6-TGN.'),
        (v_case_id, 'Azathioprine is a ''prodrug'' that is converted to which active metabolite?', '["6-Mercaptopurine (6-MP)","Methotrexate","Prednisone","None"]', 0, '6-MP is the active compound.'),
        (v_case_id, 'A dangerous drug interaction occurs when Azathioprine is combined with which gout medication?', '["Colchicine","Allopurinol (which inhibits xanthine oxidase, the alternative metabolic pathway)","Probenecid","None"]', 1, 'Allopurinol can increase Azathioprine levels by 4-fold, leading to severe leukopenia.');

    ---------------------------------------------------------------------------
    -- CASE 28: The ''Transplant'' and the Gum Swelling
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Transplant'' and the Gum Swelling', 'A renal transplant patient on Cyclosporine presents with ''swollen gums''.

Vitals: BP 155/95 (High).
Physical Examination: Gingival hyperplasia (overgrowth of the gums). Hirsutism (excess body hair).
Laboratory Results: Elevated Creatinine.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are the two major ''systemic'' side effects of Cyclosporine?', '["Weight loss and diarrhea","Nephrotoxicity and Hypertension","Anemia and hair loss","None"]', 1, 'Renal vasoconstriction leads to both high blood pressure and kidney damage.'),
        (v_case_id, 'The ''Gingival Hyperplasia'' seen with Cyclosporine is shared with which other common drug class?', '["Beta blockers","Calcium Channel Blockers (e.g., Nifedipine) and Phenytoin","Antibiotics","None"]', 1, 'This is a classic ''Step'' association for gum overgrowth.'),
        (v_case_id, 'Which medication is an ''alternative'' to Cyclosporine with less hirsutism and gum hyperplasia, but more risk of hair loss (alopecia)?', '["Azathioprine","Tacrolimus","Methotrexate","None"]', 1, 'Tacrolimus is also a calcineurin inhibitor but has a different side effect profile.');

    ---------------------------------------------------------------------------
    -- CASE 29: The ''Pemphigus'' and the ''Red'' Urine
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Red'' Urine', 'A patient with severe Pemphigus Vulgaris is started on Cyclophosphamide.

Vitals: Normal.
Physical Examination: Blisters.
Laboratory Results: UA shows microscopic hematuria.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common ''Bladder'' complication of Cyclophosphamide therapy?', '["Bladder stones","Hemorrhagic Cystitis (due to the metabolite Acrolein)","Bladder cancer (long-term risk)","Both 1 and 2"]', 3, 'Acrolein is toxic to the urothelium.'),
        (v_case_id, 'What can be given to patients on high-dose IV Cyclophosphamide to prevent this bladder toxicity?', '["Vitamin C","MESNA (2-mercaptoethane sulfonate) and vigorous hydration","Aspirin","None"]', 1, 'MESNA binds Acrolein in the bladder, rendering it non-toxic.'),
        (v_case_id, 'Besides the bladder, which system is frequently affected by Cyclophosphamide, leading to ''Infertility''?', '["Liver","Gonads (Ovarian failure or permanent azoospermia)","Thyroid","None"]', 1, 'Gonadal toxicity is a major counseling point for young patients.');

    ---------------------------------------------------------------------------
    -- CASE 30: The ''Acne'' and the ''Headache''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Headache''', 'A 20-year-old female taking Doxycycline for acne and oral contraceptives starts Isotretinoin. She develops a severe, ''throbbing'' headache and blurry vision.

Vitals: Normal.
Physical Examination: Papilledema (swollen optic discs) on fundoscopy.
Laboratory Results: Normal Brain MRI.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the diagnosis for increased intracranial pressure without a tumor?', '["Meningitis","Pseudotumor Cerebri (Idiopathic Intracranial Hypertension)","Migraine","Stroke"]', 1, 'Drug-induced IIH is a known risk.'),
        (v_case_id, 'The combination of which two drug classes is notoriously linked to this complication?', '["Penicillins and Steroids","Tetracyclines (Doxy/Mino) and Retinoids (Isotretinoin)","Statins and Fibrates","None"]', 1, 'Tetracyclines and Retinoids should NEVER be used together for this reason.'),
        (v_case_id, 'What is the first step in management?', '["Increase the drug dose","Discontinue the offending medications immediately and refer to Neurology/Ophthalmology","Give Aspirin","None"]', 1, 'Immediate cessation is required to prevent permanent vision loss from optic nerve damage.');

    ---------------------------------------------------------------------------
    -- CASE 31: The ''Itch'' and the ''Bone'' Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Bone'' Pain', 'A woman with psoriasis has been on long-term, high-dose oral Prednisone. She develops sudden, severe hip pain.

Vitals: Normal.
Physical Examination: Pain with internal rotation of the hip. No fever.
Laboratory Results: MRI shows ''Avascular Necrosis'' of the femoral head.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Long-term systemic corticosteroids are a major risk factor for which skeletal complication?', '["Osteosarcoma","Avascular Necrosis (Osteonecrosis)","Bone spurs","None"]', 1, 'This is a non-dose-dependent, potentially devastating side effect.'),
        (v_case_id, 'Which metabolic bone disease is almost ''Guaranteed'' with long-term steroid use, requiring prophylactic therapy?', '["Rickets","Steroid-induced Osteoporosis","Paget''s disease","None"]', 1, 'Bisphosphonates, Calcium, and Vitamin D are often started early.'),
        (v_case_id, 'What happens to the ''Sugar'' in a diabetic patient started on systemic steroids?', '["It goes down","It goes up (Hyperglycemia)","It stays the same","None"]', 1, 'Steroids increase gluconeogenesis and decrease insulin sensitivity.');

    ---------------------------------------------------------------------------
    -- CASE 32: The ''Target'' and the ''Yeast''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Yeast''', 'A patient being treated with an IL-17 inhibitor (e.g., Taltz) for psoriasis develops white patches in his mouth.

Vitals: Normal.
Physical Examination: Oral thrush.
Laboratory Results: KOH shows pseudohyphae.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why does blocking IL-17 increase the risk of fungal infections like Candida?', '["It kills white blood cells","IL-17 is essential for the recruitment of neutrophils to fight fungal infections at mucosal surfaces","It makes the mouth dry","None"]', 1, 'The Th17 pathway is the primary defense against extracellular fungi.'),
        (v_case_id, 'Is oral thrush a reason to permanently stop the IL-17 inhibitor?', '["Yes, always","No, it is usually mild and can be managed with standard topical antifungals (e.g., Nystatin) while continuing the biologic","Only in the elderly","None"]', 1, 'The benefit of psoriasis control usually outweighs the manageable side effect.'),
        (v_case_id, 'Which other IL-17 related agent (a receptor blocker) has an even higher rate of candidiasis?', '["Secukinumab","Brodalumab","Ixekizumab","None"]', 1, 'Brodalumab (the receptor blocker) has slightly higher reported rates.');

    ---------------------------------------------------------------------------
    -- CASE 33: The ''Acne'' and the ''Yellow'' Eyes
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Yellow'' Eyes', 'A 16-year-old on Minocycline for 6 months develops fatigue and ''yellow eyes''.

Vitals: Normal.
Physical Examination: Scleral icterus.
Laboratory Results: AST/ALT 800 (very high). Positive Anti-nuclear antibody (ANA) and Anti-smooth muscle antibody (ASMA).', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Minocycline is a recognized trigger for which autoimmune liver condition?', '["Primary Biliary Cholangitis","Drug-induced Autoimmune Hepatitis (DIAH)","Liver cancer","None"]', 1, 'It can mimic idiopathic AIH with positive ANA and ASMA.'),
        (v_case_id, 'What is the management of Minocycline-induced hepatitis?', '["Add Prednisone and stop the Minocycline","Increase the Minocycline dose","Antibiotics","None"]', 0, 'Stopping the drug is mandatory; steroids may be needed if the hepatitis is severe.'),
        (v_case_id, 'Besides the liver, which ''Lupus-like'' syndrome can Minocycline cause?', '["Discoid lupus","Drug-induced Systemic Lupus Erythematosus (DILE)","Neonatal lupus","None"]', 1, 'Minocycline is a classic cause of DILE, along with Hydralazine and Procainamide.');

    ---------------------------------------------------------------------------
    -- CASE 34: The ''Psoriasis'' and the ''Bad Mood''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Bad Mood''', 'A patient on Brodalumab (Siliq) for severe psoriasis mentions he has been ''feeling very down'' and thinking about hurting himself.

Vitals: Normal.
Physical Examination: Plaques are clear.
Laboratory Results: None.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why does Brodalumab have a ''Black Box Warning'' and a REMS (Risk Evaluation and Mitigation Strategy) program?', '["Liver failure","Observed suicidal ideation and behavior in clinical trials","Kidney failure","Heart attacks"]', 1, 'While the causal link is debated, the warning remains part of the mandatory safety protocol.'),
        (v_case_id, 'What should you do if a patient on Brodalumab develops new or worsening depression?', '["Nothing, keep the drug","Refer for psychiatric evaluation and consider discontinuing the drug","Give more psoriasis medicine","None"]', 1, 'Patient safety regarding mood is a priority for this specific medication.'),
        (v_case_id, 'Brodalumab is unique among IL-17 agents because it targets what?', '["The IL-17A cytokine","The IL-17 Receptor A (IL-17RA)","IL-23","None"]', 1, 'It blocks the receptor, thereby blocking signaling from multiple IL-17 isoforms (A, F, A/F, E).');

    ---------------------------------------------------------------------------
    -- CASE 35: The ''Itch'' and the ''Pill'' Absorption
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Pill'' Absorption', 'A patient with high cholesterol taking Cholestyramine is also prescribed oral Terbinafine for onychomycosis.

Vitals: Normal.
Physical Examination: Thick nails.
Laboratory Results: None.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does Cholestyramine affect the absorption of other oral medications?', '["It increases it","It binds to many drugs in the GI tract, significantly decreasing their absorption","It has no effect","None"]', 1, 'It is a non-specific bile acid sequestrant.'),
        (v_case_id, 'What is the best way to avoid this interaction?', '["Take them together","Space the medications out (e.g., take other drugs 1 hour before or 4-6 hours after the resin)","Take with fat","None"]', 1, 'Timing is everything with binding resins.'),
        (v_case_id, 'Which vitamin absorption can also be impaired by chronic resin use?', '["Vitamin C","Fat-soluble vitamins (A, D, E, K)","B-vitamins","None"]', 1, 'Bile is needed for the absorption of fat-soluble vitamins.');

    ---------------------------------------------------------------------------
    -- CASE 36: The ''Blister'' and the ''Dapsone''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Blister'' and the ''Dapsone''', 'A patient with Dermatitis Herpetiformis is started on Dapsone. A few days later, he feels ''short of breath'' and his lips look ''blue-gray''.

Vitals: O2 Sat 88% (on room air, but does not improve with 100% oxygen).
Physical Examination: Cyanosis (blue lips/nails). The blood draw looks ''chocolate-colored''.
Laboratory Results: Normal PaO2 on ABG.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the diagnosis for cyanosis with a normal PaO2 and ''chocolate blood''?', '["Heart failure","Methemoglobinemia","Carbon monoxide poisoning","Anemia"]', 1, 'Dapsone is a powerful oxidizing agent that converts ferrous iron to ferric iron in hemoglobin.'),
        (v_case_id, 'What is the ''Antidote'' for severe, symptomatic methemoglobinemia?', '["Oxygen only","Methylene Blue (which reduces the iron back to the ferrous state)","Vitamin C","None"]', 1, 'Methylene blue is the rapid treatment of choice.'),
        (v_case_id, 'Which enzyme deficiency makes the hemolytic side effects of Dapsone much worse?', '["TPMT","G6PD Deficiency","Amylase","None"]', 1, 'G6PD is needed to protect RBCs from oxidative stress.');

    ---------------------------------------------------------------------------
    -- CASE 37: The ''Lupus'' and the ''Puffy'' Face
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Lupus'' and the ''Puffy'' Face', 'A patient on long-term Prednisone for lupus presents with a ''round'' face and a ''hump'' on her upper back.

Vitals: BP 150/90.
Physical Examination: Moon facies, buffalo hump, and wide purple striae (stretch marks) on the abdomen.
Laboratory Results: None.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of these physical changes?', '["The underlying lupus","Iatrogenic Cushing Syndrome due to chronic exogenous corticosteroid use","Too much salt","None"]', 1, 'Excessive cortisol (synthetic) leads to fat redistribution and skin thinning.'),
        (v_case_id, 'What should be done when a patient has been on high-dose steroids for several weeks and needs to stop?', '["Stop immediately","Taper the dose slowly to allow the suppressed HPA axis (adrenal glands) to recover","Switch to oral antibiotics","None"]', 1, 'Sudden withdrawal can lead to life-threatening adrenal crisis.'),
        (v_case_id, 'Why do the ''striae'' in Cushing''s look purple?', '["They are bruised","The skin is so thin that the underlying blood vessels are visible","It is an allergy","None"]', 1, 'Wide (>1cm), purple striae are highly suggestive of Cushing''s.');

    ---------------------------------------------------------------------------
    -- CASE 38: The ''Pemphigus'' and the ''Rituximab''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Rituximab''', 'A patient with refractory Pemphigus Vulgaris is receiving Rituximab infusions.

Vitals: Normal.
Physical Examination: Eroded skin.
Laboratory Results: None.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Rituximab is a monoclonal antibody that targets which protein on B-cells?', '["CD4","CD20","CD8","None"]', 1, 'Depleting B-cells reduces the production of the pathogenic desmoglein autoantibodies.'),
        (v_case_id, 'What is the major systemic risk during the infusion of Rituximab?', '["Kidney stones","Infusion-related reactions (fever, chills, hypotension) and anaphylaxis","Hair loss","None"]', 1, 'Patients are often pre-medicated with antihistamines and acetaminophen.'),
        (v_case_id, 'Which rare but fatal brain infection can occur with Rituximab (and other immunosuppressants)?', '["Meningitis","Progressive Multifocal Leukoencephalopathy (PML) due to JC virus reactivation","Brain abscess","None"]', 1, 'PML is a serious safety concern for many targeted biologic therapies.');

    ---------------------------------------------------------------------------
    -- CASE 39: The ''Acne'' and the ''Pill'' Safety
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Pill'' Safety', 'A woman on Isotretinoin is using oral contraceptives and condoms for the ''two forms of birth control'' required by iPLEDGE.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: None.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why are progestin-only ''mini-pills'' NOT recommended as a primary form of birth control on Isotretinoin?', '["They cause acne","They have a higher failure rate and are considered less reliable than combined OCPs","They are too expensive","None"]', 1, 'iPLEDGE has specific requirements for ''highly effective'' contraception.'),
        (v_case_id, 'Which common antibiotic used for acne can potentially decrease the efficacy of oral contraceptives (though this is debated)?', '["Tetracyclines","Rifampin (the only one with strong evidence for this)","Penicillin","None"]', 1, 'While commonly taught, only enzyme-inducers like Rifampin have solid evidence for OCP failure.'),
        (v_case_id, 'What is the ''iPLEDGE'' requirement for pregnancy testing?', '["Once a year","Monthly, before each new prescription is issued","Only at the start","None"]', 1, 'Strict monthly adherence is mandatory.');

    ---------------------------------------------------------------------------
    -- CASE 40: The ''Psoriasis'' and the ''Stomach'' Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Stomach'' Pain', 'A patient on Methotrexate for 2 years develops abdominal pain and dark, tarry stools.

Vitals: HR 110, BP 100/60.
Physical Examination: Epigastric tenderness.
Laboratory Results: Hemoglobin 9.0 (Low).', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which common over-the-counter medication class can dangerously increase Methotrexate levels by competing for renal excretion?', '["Acetaminophen","NSAIDs (e.g., Ibuprofen, Naproxen)","Vitamins","None"]', 1, 'NSAIDs can lead to Methotrexate toxicity, including GI ulceration and bone marrow suppression.'),
        (v_case_id, 'What is the primary site of Methotrexate elimination?', '["Liver","Kidneys (Renal excretion)","Lungs","None"]', 1, 'Dosage must be adjusted for renal impairment.'),
        (v_case_id, 'Besides NSAIDs, which other drug class can decrease renal MTX clearance?', '["Statins","Proton Pump Inhibitors (PPIs)","Antibiotics like Penicillin","Both 2 and 3"]', 3, 'Many common drugs can interfere with MTX clearance.');

    ---------------------------------------------------------------------------
    -- CASE 41: The ''Itch'' and the ''Nail'' Polish (Management)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Nail'' Polish (Management)', 'A patient with allergic contact dermatitis to nickel is looking for ways to prevent the rash.

Vitals: Normal.
Physical Examination: Red, itchy rash under the metal button of her jeans.
Laboratory Results: Positive patch test to Nickel.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best ''Non-pharmacologic'' way to prevent nickel dermatitis from clothing?', '["Wash clothes in bleach","Apply a barrier (like a piece of tape or clear nail polish) over the metal button, or wear a shirt tucked in","Take an antihistamine daily","None"]', 1, 'Physical separation of the skin and the allergen is key.'),
        (v_case_id, 'Which chemical test kit can be used to identify nickel in jewelry at home?', '["Wood''s lamp","Dimethylglyoxime test (turns pink in the presence of nickel)","Pregnancy test","None"]', 1, 'This is a practical tool for sensitized patients.'),
        (v_case_id, 'What is the best initial treatment for the ''rash'' itself once it appears?', '["Topical steroids","Topical antibiotics","Oral steroids","None"]', 0, 'Topical steroids treat the acute allergic inflammation.');

    ---------------------------------------------------------------------------
    -- CASE 42: The ''Pemphigus'' and the ''Bone'' Safety
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Bone'' Safety', 'A 60-year-old female is starting a 6-month course of high-dose Prednisone for Pemphigus.

Vitals: Normal.
Physical Examination: Blisters.
Laboratory Results: None.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the recommended baseline screening for this patient?', '["Liver ultrasound","DEXA scan (to measure bone mineral density)","Chest X-ray","None"]', 1, 'Long-term steroids (>3 months) carry a high risk of osteoporosis.'),
        (v_case_id, 'Which supplement combination is standard for prevention?', '["Iron and Zinc","Calcium and Vitamin D","Vitamin C and E","None"]', 1, 'These provide the building blocks for bone maintenance.'),
        (v_case_id, 'Which class of medication is often added if the patient is at high risk for fracture?', '["Statins","Bisphosphonates (e.g., Alendronate)","Antibiotics","None"]', 1, 'Bisphosphonates are first-line for steroid-induced osteoporosis.');

    ---------------------------------------------------------------------------
    -- CASE 43: The ''Acne'' and the ''Birth'' Defects
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Birth'' Defects', 'A woman on Isotretinoin discovers she is pregnant.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: Positive HCG.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Isotretinoin is what Category in pregnancy?', '["Category A","Category X (Teratogenic)","Category B","None"]', 1, 'It is one of the most potent human teratogens known.'),
        (v_case_id, 'What is the characteristic ''Retinoid Embryopathy'' triad of defects?', '["Heart, Brain, and Ears (e.g., microtia)","Lungs, Liver, Kidneys","Skin only","None"]', 0, 'Craniofacial, CNS, and cardiovascular defects are classic.'),
        (v_case_id, 'How many months after stopping Isotretinoin is it safe to conceive?', '["Immediately","1 month (due to the short half-life of 20 hours)","3 years","Never"]', 1, 'This is a key contrast to Acitretin (3 years).');

    ---------------------------------------------------------------------------
    -- CASE 44: The ''Psoriasis'' and the ''Blood'' Pressure
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Blood'' Pressure', 'A 50-year-old male on Cyclosporine for psoriasis has a blood pressure of 160/100.

Vitals: BP 160/100.
Physical Examination: Plaques are better.
Laboratory Results: Creatinine 1.5 (Baseline 0.9).', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary mechanism of Cyclosporine-induced hypertension?', '["Too much salt","Renal afferent arteriolar vasoconstriction","Direct effect on the heart","None"]', 1, 'Reduced blood flow to the kidneys triggers the RAAS system.'),
        (v_case_id, 'Which anti-hypertensive class is often preferred to treat this specific side effect?', '["Beta blockers","Calcium Channel Blockers (e.g., Nifedipine/Amlodipine) as they may help reverse the vasoconstriction","Diuretics","None"]', 1, 'Dihydropyridine CCBs are a logical choice.'),
        (v_case_id, 'What should be done with the Cyclosporine dose if the Creatinine rises >30% above baseline?', '["Increase it","Decrease the dose or discontinue the drug","Keep it the same","None"]', 1, 'Close monitoring of renal function is the cornerstone of safe Cyclosporine use.');

    ---------------------------------------------------------------------------
    -- CASE 45: The ''Itch'' and the ''Light''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Light''', 'A patient with severe eczema is receiving Narrowband UVB therapy.

Vitals: Normal.
Physical Examination: Lichenified skin.
Laboratory Results: None.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the wavelength of Narrowband UVB (NB-UVB)?', '["254 nm","311-313 nm","350 nm","None"]', 1, 'This narrow peak provides the best therapeutic effect with the least burning (erythema).'),
        (v_case_id, 'What is the most common ''Acute'' side effect of phototherapy?', '["Skin cancer","Erythema (sunburn) and itching","Weight gain","None"]', 1, 'Monitoring the Minimal Erythema Dose (MED) is part of the protocol.'),
        (v_case_id, 'What is the long-term risk of excessive phototherapy over many years?', '["Cataracts","Photoaging and increased risk of non-melanoma skin cancer","Liver failure","None"]', 1, 'Cumulative UV exposure is a risk factor for carcinogenesis.');

    ---------------------------------------------------------------------------
    -- CASE 46: The ''Psoriasis'' and the ''Joint'' Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Joint'' Pain', 'A patient with psoriasis develops joint swelling. He is started on Methotrexate.

Vitals: Normal.
Physical Examination: Swollen PIP and DIP joints (Dactylitis/Sausage digits).
Laboratory Results: Negative Rheumatoid Factor.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is Methotrexate often chosen for patients with both skin psoriasis and joint involvement?', '["It''s cheap","It treats both the cutaneous plaques and the underlying inflammatory arthritis","It''s a pill","None"]', 1, 'MTX is a first-line DMARD for psoriatic arthritis.'),
        (v_case_id, 'Which specific joint finding is more common in Psoriatic Arthritis than Rheumatoid Arthritis?', '["Wrist swelling","DIP joint involvement and dactylitis (sausage digits)","Knee pain","None"]', 1, 'DIP involvement is a hallmark of PsA.'),
        (v_case_id, 'If the patient fails Methotrexate, which drug class is usually the next step for psoriatic arthritis?', '["Topical steroids","TNF-alpha inhibitors (e.g., Etanercept, Adalimumab)","Antibiotics","None"]', 1, 'Biologics are highly effective for the axial and peripheral joints in PsA.');

    ---------------------------------------------------------------------------
    -- CASE 47: The ''Acne'' and the ''Mood'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Mood'' (Reasoning)', 'A 17-year-old male on Isotretinoin for 3 months has become withdrawn and is no longer interested in playing soccer with his friends.

Vitals: Normal.
Physical Examination: Acne is improving.
Laboratory Results: None.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Is there a proven causal link between Isotretinoin and depression/suicide?', '["Yes, 100%","It remains controversial; studies show mixed results, but the risk must be taken seriously and monitored","No, it''s impossible","None"]', 1, 'The FDA requires warnings despite the lack of a definitive causative mechanism.'),
        (v_case_id, 'What is the best next step in management for this patient?', '["Increase the dose to clear the acne faster","Screen for depression, involve the parents, and consider discontinuing the drug for evaluation","Give an antidepressant and keep the drug","None"]', 1, 'Clinical safety and mental health take priority over acne clearing.'),
        (v_case_id, 'Which other systemic ''Retinoid'' (used for psoriasis) has a similar warning?', '["Tretinoin","Acitretin","None","Brodalumab (biologic, not a retinoid)"]', 3, 'While Brodalumab has the warning, Acitretin generally does not have the same level of focus on mood as Isotretinoin.');

    ---------------------------------------------------------------------------
    -- CASE 48: The ''Itch'' and the ''Heart'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Heart'' (Reasoning)', 'An elderly patient with onychomycosis is taking Terbinafine. He also takes Digoxin for atrial fibrillation.

Vitals: Normal.
Physical Examination: Brittle nails.
Laboratory Results: None.', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Between Terbinafine and Itraconazole, which has ''Fewer'' cytochrome P450 drug interactions?', '["Itraconazole","Terbinafine","They are the same","None"]', 1, 'Terbinafine is a safer choice for patients on multiple medications (polypharmacy).'),
        (v_case_id, 'Which specific Digoxin-related risk is a concern with Itraconazole (but not Terbinafine)?', '["It makes Digoxin stop working","It can increase Digoxin levels, leading to toxicity","It causes rashes","None"]', 1, 'Itraconazole is a CYP3A4 inhibitor; Terbinafine is a CYP2D6 inhibitor.'),
        (v_case_id, 'What is the preferred management for nail fungus in a patient with multi-organ failure?', '["Oral antifungals","Topical therapy (e.g., Efinaconazole) or conservative nail trimming","Surgery","None"]', 1, 'The risks of systemic therapy often outweigh the benefits in very frail patients.');

    ---------------------------------------------------------------------------
    -- CASE 49: The ''Pemphigus'' and the ''Sugar'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Sugar'' (Reasoning)', 'A diabetic patient with Pemphigus Vulgaris needs a high-dose steroid taper.

Vitals: Normal.
Physical Examination: Blisters.
Laboratory Results: Blood sugar 350.', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the expected effect of Prednisone on insulin requirements?', '["Requirement decreases","Requirement increases (often requiring a significant increase in basal and bolus insulin)","No change","None"]', 1, 'Steroids induce significant insulin resistance.'),
        (v_case_id, 'Which steroid has ''Zero'' mineralocorticoid (salt-retaining) activity, making it safer for patients with heart failure or severe edema?', '["Hydrocortisone","Dexamethasone","Prednisone","None"]', 1, 'Dexamethasone and Betamethasone have purely glucocorticoid activity.'),
        (v_case_id, 'When a patient is on long-term steroids, what happens to their ''WBC'' count?', '["It goes down","It goes up (Leukocytosis with Neutrophilia due to demargination)","It stays the same","None"]', 1, 'This is a benign ''Step'' association; it doesn''t always mean infection.');

    ---------------------------------------------------------------------------
    -- CASE 50: The ''Acne'' and the ''Liver'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Liver'' (Reasoning)', 'A patient on Isotretinoin has an ALT that is 2x the upper limit of normal.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: ALT 80, AST 70 (Normal <40).', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the standard management for a mild ( < 3x normal) elevation of transaminases on Isotretinoin?', '["Stop immediately","Monitor closely and repeat labs; only discontinue if levels exceed 3x normal or the patient becomes symptomatic","Ignore it forever","None"]', 1, 'Minor elevations often stabilize or resolve without stopping the drug.'),
        (v_case_id, 'If the Triglycerides rise to > 500 mg/dL, what is the concern?', '["Heart attack","Risk of acute pancreatitis","Hair loss","None"]', 1, 'Severe hypertriglyceridemia (>800-1000) is a mandatory reason for drug cessation.'),
        (v_case_id, 'What is the effect of Isotretinoin on ''Bone'' in long-term high-dose therapy (e.g., for ichthyosis)?', '["None","Premature epiphyseal closure and DISH (diffuse idiopathic skeletal hyperostosis)","Bone growth","None"]', 1, 'Skeletal toxicity is a concern with multi-year high-dose retinoid use.');

    ---------------------------------------------------------------------------
    -- CASE 51: The Itchy Patient and the Permethrin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Patient and the Permethrin', 'A family of four is treated for scabies with Permethrin 5% cream. One week later, the mother is still itching intensely.

Vitals: Normal.
Physical Examination: No new burrows, but the skin is dry and erythematous.
Laboratory Results: None.', 51)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Itching that persists for up to 2-4 weeks AFTER successful scabies treatment is most likely due to:', '["Re-infection","A hypersensitivity reaction to dead mites and their debris (post-scabietic dermatitis)","Treatment failure","None"]', 1, 'The immune system continues to react to the persistent antigens.'),
        (v_case_id, 'What is the best management for post-scabietic itch?', '["Immediate re-treatment with Permethrin","Topical steroids and oral antihistamines","Oral antibiotics","None"]', 1, 'Re-treatment should be avoided unless new burrows or lesions are seen, as Permethrin itself can be irritating.'),
        (v_case_id, 'When is a patient considered ''non-infectious'' after Permethrin application?', '["Immediately after washing off the first treatment","After 1 week","After 1 month","None"]', 0, 'One thorough application usually kills all active mites.');

    ---------------------------------------------------------------------------
    -- CASE 52: The ''Psoriasis'' and the ''Calcipotriene''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Calcipotriene''', 'A patient with stable plaque psoriasis is prescribed Calcipotriene cream.

Vitals: Normal.
Physical Examination: Plaques.
Laboratory Results: None.', 52)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Calcipotriene?', '["Inhibits keratinocyte proliferation and promotes differentiation","Blocks histamine","Kills bacteria","None"]', 0, 'It binds to the Vitamin D receptor to normalize skin cell growth.'),
        (v_case_id, 'Calcipotriene is most effective when used in combination with which other therapy?', '["Antifungals","Topical corticosteroids (often used as a fixed-combination product)","Antibiotics","None"]', 1, 'The combination (e.g., Taclonex) is more effective and less irritating than either alone.'),
        (v_case_id, 'What is a potential, though rare, systemic side effect of using excessive amounts of Calcipotriene (>100g/week)?', '["Anemia","Hypercalcemia (due to systemic absorption of the Vit D analog)","Liver failure","None"]', 1, 'Strict quantity limits are recommended to avoid metabolic effects.');

    ---------------------------------------------------------------------------
    -- CASE 53: The ''Acne'' and the ''Benzoyl Peroxide''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Benzoyl Peroxide''', 'A 16-year-old is using a benzoyl peroxide wash. He notices his ''towels and shirts'' are developing white spots.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: None.', 53)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary antibacterial mechanism of Benzoyl Peroxide?', '["Blocks tRNA","Releases oxygen (free radicals) that kills anaerobic C. acnes","Inhibits cell wall","None"]', 1, 'It is a potent bactericidal agent with no known resistance.'),
        (v_case_id, 'What should you counsel the patient regarding his clothing and towels?', '["It will cause a rash on the clothes","It can bleach colored fabrics","It makes clothes catch fire","None"]', 1, 'Bleaching of fabric is a classic and very common ''real-world'' counseling point.'),
        (v_case_id, 'How does Benzoyl Peroxide help prevent antibiotic resistance in acne?', '["It doesn''t","When used in combination, it prevents the development of resistant C. acnes strains","It makes the antibiotic stronger","None"]', 1, 'Combination therapy (BP + Antibiotic) is the standard of care for this reason.');

    ---------------------------------------------------------------------------
    -- CASE 54: The ''Lupus'' and the ''Puffy'' Face (Management)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Lupus'' and the ''Puffy'' Face (Management)', 'A patient on Prednisone has been diagnosed with steroid-induced diabetes.

Vitals: Normal.
Physical Examination: Moon facies.
Laboratory Results: Post-prandial blood sugar 250.', 54)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Steroid-induced hyperglycemia typically peaks at what time of day?', '["Fasting (early morning)","Afternoon and evening (due to the morning dosing of steroids)","Middle of the night","None"]', 1, 'Glucocorticoid effects on blood sugar usually follow the dosing schedule.'),
        (v_case_id, 'What is the best initial approach to management in a non-diabetic patient who develops steroid-induced hyperglycemia?', '["Diet only","Oral hypoglycemics or insulin (often NPH is used to match the steroid peak)","Stop steroids immediately","None"]', 1, 'Management must be active if the hyperglycemia is significant.'),
        (v_case_id, 'Will the diabetes resolve after the steroids are stopped?', '["Always","Usually, but it may unmask permanent Type 2 Diabetes in predisposed individuals","Never","None"]', 1, 'The ''steroid stress test'' can reveal underlying metabolic weakness.');

    ---------------------------------------------------------------------------
    -- CASE 55: The ''Wart'' and the ''Podophyllin''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Wart'' and the ''Podophyllin''', 'A patient with genital warts is treated with Podophyllin resin in the office.

Vitals: Normal.
Physical Examination: Condyloma acuminata.
Laboratory Results: None.', 55)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Podophyllin?', '["Immune stimulant","Antimitotic agent (blocks spindle formation in mitosis)","Acid","None"]', 1, 'It is derived from the Mayapple plant.'),
        (v_case_id, 'What is the most important instruction for the patient after an ''in-office'' application of Podophyllin resin?', '["Leave it on for 24 hours","Wash the area thoroughly after 4-6 hours to prevent severe chemical irritation/burn","Apply more at home","None"]', 1, 'Resin application requires strict timing and washing.'),
        (v_case_id, 'Is Podophyllin safe for use in pregnancy?', '["Yes","No (Category X - teratogenic and potential fetal risk)","Only in the 3rd trimester","None"]', 1, 'It is strictly contraindicated in pregnancy.');

    ---------------------------------------------------------------------------
    -- CASE 56: The ''Itch'' and the ''Urea''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Urea''', 'A patient with very dry, scaly feet is prescribed 40% Urea cream.

Vitals: Normal.
Physical Examination: Thick, hyperkeratotic soles.
Laboratory Results: None.', 56)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does Urea help dry, thickened skin?', '["It adds oil","It is a keratolytic (breaks down keratin) and a humectant (draws water into the skin)","It kills fungus","None"]', 1, 'At high concentrations (>20%), it is an effective keratolytic.'),
        (v_case_id, 'Which other condition is high-concentration Urea used for?', '["Acne","Nonsurgical avulsion of a thickened or fungal nail (softens the nail plate)","Itch","None"]', 1, 'It can be used to ''melt'' away a diseased nail.'),
        (v_case_id, 'What is a common side effect of applying high-concentration Urea to cracked or eroded skin?', '["Hair growth","Intense stinging and irritation","Numbness","None"]', 1, 'It should only be applied to intact, thickened skin.');

    ---------------------------------------------------------------------------
    -- CASE 57: The ''Pemphigus'' and the ''Mycophenolate''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Mycophenolate''', 'A patient is starting Mycophenolate Mofetil (CellCept) for a blistering disease.

Vitals: Normal.
Physical Examination: Blisters.
Laboratory Results: None.', 57)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Mycophenolate Mofetil?', '["Blocks TNF","Inhibits inosine monophosphate dehydrogenase (IMPDH), blocking de novo purine synthesis in lymphocytes","Blocks folate","None"]', 1, 'Lymphocytes are particularly dependent on the de novo pathway, making the drug relatively selective.'),
        (v_case_id, 'What is the most common dose-limiting side effect of Mycophenolate?', '["Kidney failure","Gastrointestinal upset (diarrhea, bloating, cramping)","Hair loss","None"]', 1, 'GI symptoms are frequent and often require dose titration or switching to the enteric-coated form.'),
        (v_case_id, 'Is Mycophenolate safe in pregnancy?', '["Yes","No (highly teratogenic; associated with characteristic ''Mycophenolate embryopathy'')","Only for small doses","None"]', 1, 'Strict birth control is required for women of childbearing age.');

    ---------------------------------------------------------------------------
    -- CASE 58: The ''Itch'' and the ''Doxepin'' Trap
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Doxepin'' Trap', 'A patient with chronic eczema is given topical Doxepin cream for severe itching. She develops profound sleepiness.

Vitals: Normal.
Physical Examination: Drowsy.', 58)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What class of medication is Doxepin?', '["Antihistamine","Tricyclic Antidepressant (TCA) with potent H1 and H2 blocking activity","Steroid","None"]', 1, 'It is a TCA used topically for its extremely strong anti-itch properties.'),
        (v_case_id, 'Why can topical Doxepin cause systemic sedation?', '["It smells like sleep medicine","Significant systemic absorption can occur, especially when applied to large areas or broken skin","It''s an allergy","None"]', 1, 'Topicals can have systemic effects.'),
        (v_case_id, 'Which patient population should be especially cautious with topical Doxepin?', '["Children","The elderly (due to anticholinergic side effects and fall risk)","Wrestlers","None"]', 1, 'Like oral TCAs, the side effect profile is problematic in the elderly.');

    ---------------------------------------------------------------------------
    -- CASE 59: The ''Wart'' and the ''Imiquimod''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Wart'' and the ''Imiquimod''', 'A patient is using Imiquimod 5% cream for a basal cell carcinoma on his arm. The area has become bright red, swollen, and crusty.

Vitals: Normal.
Physical Examination: Intense inflammatory reaction at the site of application.
Laboratory Results: None.', 59)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of action of Imiquimod?', '["Toxic to cells","Toll-like receptor 7 (TLR7) agonist that stimulates the innate immune response (IFN-alpha production)","Acid","None"]', 1, 'It is an immune response modifier.'),
        (v_case_id, 'Does the intense inflammatory reaction mean the drug should be stopped immediately?', '["Yes, it''s an allergy","No, the inflammatory response is part of the therapeutic mechanism (the immune system attacking the tumor/virus)","Only if it bleeds","None"]', 1, 'A ''brisk'' reaction often correlates with better clinical outcomes.'),
        (v_case_id, 'What ''Flu-like'' symptoms can occur with widespread Imiquimod use?', '["Fever, malaise, and myalgias (due to systemic cytokine release)","Cough","Diarrhea","None"]', 0, 'Systemic absorption can lead to a systemic cytokine response.');

    ---------------------------------------------------------------------------
    -- CASE 60: The ''Itch'' and the ''Camphor/Menthol''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Camphor/Menthol''', 'A patient with ''winter itch'' uses a lotion containing camphor and menthol.

Vitals: Normal.
Physical Examination: Dry skin.
Laboratory Results: None.', 60)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How do camphor and menthol provide relief from itching?', '["They numb the skin","They stimulate ''cool'' receptors (TRPM8), providing a distracting sensation that suppresses the ''itch'' signal","They kill bacteria","None"]', 1, 'The ''cool'' sensation travels via faster nerve fibers, overriding the slower ''itch'' fibers.'),
        (v_case_id, 'Why should Camphor-containing products be used with extreme caution in young children?', '["They cause rashes","Risk of severe systemic toxicity (seizures, CNS depression) if ingested or absorbed in large amounts","They smell bad","None"]', 1, 'Camphor toxicity is a pediatric emergency.'),
        (v_case_id, 'What is the ''anti-pruritic'' effect of topical Pramoxine?', '["Steroid-like","Local anesthetic (blocks sodium channels)","Antifungal","None"]', 1, 'Pramoxine is a common ingredient in anti-itch lotions like Sarna.');

    ---------------------------------------------------------------------------
    -- CASE 61: The ''Target'' and the ''Biopsy'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Reasoning)', 'A patient with a suspected drug rash is getting a skin biopsy.

Vitals: Normal.
Physical Examination: Rash.
Laboratory Results: None.', 61)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'A ''Shave'' biopsy is generally inappropriate for which suspected condition?', '["Acne","Pigmented lesions suspected of being Melanoma (where depth is key)","Warts","Seborrheic keratosis"]', 1, 'Full-depth information is required for melanoma staging.'),
        (v_case_id, 'What is the ''Best'' location to biopsy an active, expanding skin infection or inflammatory plaque?', '["The center (which may be necrotic or clear)","The active, advancing edge","The normal skin nearby","None"]', 1, 'The edge contains the most active pathologic process.'),
        (v_case_id, 'For Direct Immunofluorescence (DIF) in blistering diseases, where should the biopsy be taken?', '["Directly from a blister","From perilesional (normal-appearing) skin adjacent to a blister","The bottom of the foot","None"]', 1, 'Blistering involves destruction of the proteins being tested; perilesional skin preserves the immunoreactants.');

    ---------------------------------------------------------------------------
    -- CASE 62: The ''Psoriasis'' and the ''Coal Tar''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Coal Tar''', 'A patient is using an ''old-fashioned'' coal tar preparation for his scalp psoriasis.

Vitals: Normal.
Physical Examination: Scaly scalp.
Laboratory Results: None.', 62)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary drawback of coal tar therapy for most patients?', '["It is dangerous","It is messy, has a strong odor, and can stain clothing/hair","It is a pill","None"]', 1, 'Patient compliance is often low due to cosmetic factors.'),
        (v_case_id, 'What is a recognized side effect of tar application on sun-exposed skin?', '["Photosensitivity (and potential tar-UV carcinogenesis in the ''Goeckerman regimen'')","Numbness","Fungus","None"]', 0, 'Tar is a photosensitizer.'),
        (v_case_id, 'What is the ''Goeckerman Regimen''?', '["A diet","The combination of topical crude coal tar and UV light for severe psoriasis","A type of surgery","None"]', 1, 'It is one of the most effective historical treatments for severe psoriasis.');

    ---------------------------------------------------------------------------
    -- CASE 63: The ''Itch'' and the ''Selenium''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Selenium''', 'A patient with tinea versicolor is using 2.5% Selenium Sulfide lotion.

Vitals: Normal.
Physical Examination: White spots.
Laboratory Results: None.', 63)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary action of Selenium Sulfide?', '["Antibiotic","Cytostatic (decreases epidermal turnover) and antifungal (against Malassezia)","Steroid","None"]', 1, 'It is used for both seborrheic dermatitis and tinea versicolor.'),
        (v_case_id, 'What should you warn the patient about regarding jewelry when using Selenium Sulfide?', '["It will break the jewelry","It can tarnish silver jewelry","It turns gold to lead","None"]', 1, 'A common ''real-world'' counseling point.'),
        (v_case_id, 'Can it be used on the scalp for dandruff?', '["No","Yes, it is a common ingredient in OTC and prescription dandruff shampoos","Only if the patient is bald","None"]', 1, 'It is highly effective for seborrheic dermatitis of the scalp.');

    ---------------------------------------------------------------------------
    -- CASE 64: The ''Acne'' and the ''Clindamycin''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Clindamycin''', 'A patient is using a topical clindamycin/benzoyl peroxide gel.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: None.', 64)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why should topical antibiotics for acne NOT be used as monotherapy?', '["They don''t work","High risk of developing bacterial resistance (especially C. acnes)","They are too strong","None"]', 1, 'Monotherapy is a major driver of antibiotic resistance in the community.'),
        (v_case_id, 'What is the most common agent added to topical antibiotics to prevent resistance?', '["Retinoids","Benzoyl Peroxide","Steroids","None"]', 1, 'BP is bactericidal and kills resistant organisms.'),
        (v_case_id, 'Which systemic ''GI'' side effect is extremely rare but theoretically possible with topical Clindamycin absorption?', '["Constipation","Pseudomembranous colitis (C. difficile infection)","Acid reflux","None"]', 1, 'While very rare with topicals, the warning remains due to its systemic profile.');

    ---------------------------------------------------------------------------
    -- CASE 65: The ''Psoriasis'' and the ''Anthralin''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Anthralin''', 'A patient is using Anthralin for a thick plaque of psoriasis.

Vitals: Normal.
Physical Examination: Plaque.
Laboratory Results: None.', 65)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a major counseling point for Anthralin application?', '["Apply and leave on all day","Short-contact therapy (apply for 10-30 minutes and wash off) to avoid severe irritation of surrounding normal skin","It smells like flowers","None"]', 1, 'Anthralin is very irritating to non-lesional skin.'),
        (v_case_id, 'What is the ''staining'' profile of Anthralin?', '["Doesn''t stain","Can cause purple-brown staining of skin, nails, and clothing","Turns skin blue","None"]', 1, 'The staining is a major deterrent for many patients.'),
        (v_case_id, 'Anthralin is a synthetic derivative of what natural substance?', '["Coal","Chrysarobin (from the Araroba tree)","Honey","None"]', 1, 'It has been used for over a century for psoriasis.');

    ---------------------------------------------------------------------------
    -- CASE 66: The ''Itch'' and the ''Lindane'' Trap
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Lindane'' Trap', 'A student asks about using Lindane for head lice.

Vitals: Normal.
Physical Examination: Nits in the hair.
Laboratory Results: None.', 66)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is Lindane now considered a ''Last-Resort'' treatment for lice and scabies?', '["It is too expensive","Significant risk of neurotoxicity (seizures) especially in children, the elderly, and those < 50kg","It doesn''t work","None"]', 1, 'It has been banned in many regions (e.g., California) due to environmental and safety concerns.'),
        (v_case_id, 'Lindane is contraindicated in patients with which underlying condition?', '["Diabetes","Seizure disorders","Asthma","None"]', 1, 'It directly lowers the seizure threshold.'),
        (v_case_id, 'What is the preferred first-line treatment for head lice?', '["Lindane","Permethrin 1% or Pyrethrins","Vinegar only","None"]', 1, 'Less toxic alternatives are always preferred first.');

    ---------------------------------------------------------------------------
    -- CASE 67: The ''Target'' and the ''Steroid'' Taper (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Steroid'' Taper (Reasoning)', 'A patient on 60mg of Prednisone for 4 weeks for a severe drug rash is being tapered off.

Vitals: Normal.
Physical Examination: Rash is gone.
Laboratory Results: None.', 67)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'At what point in steroid therapy is the HPA axis considered ''suppressed'', requiring a taper?', '["After 1 dose","Usually after 2-3 weeks of continuous systemic therapy","After 1 year","None"]', 1, 'Brief courses ( < 10-14 days) can often be stopped without a taper.'),
        (v_case_id, 'What is the primary risk of stopping long-term steroids ''Cold Turkey''?', '["The rash comes back","Acute Adrenal Crisis (hypotension, shock, death)","Weight gain","None"]', 1, 'The body cannot immediately resume endogenous cortisol production.'),
        (v_case_id, 'What is a ''Stress Dose'' of steroids?', '["A very small dose","An increased dose given to patients with HPA suppression during times of physical stress (e.g., surgery, severe infection)","A dose given for anxiety","None"]', 1, 'The suppressed axis cannot respond to the increased demand of stress.');

    ---------------------------------------------------------------------------
    -- CASE 68: The ''Acne'' and the ''Spironolactone''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Spironolactone''', 'A 25-year-old woman with ''hormonal'' acne (worsening before her period, located on the jawline) is starting Spironolactone.

Vitals: Normal.
Physical Examination: Inflammatory papules on the chin and jawline.
Laboratory Results: None.', 68)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the mechanism of Spironolactone in acne?', '["Antibiotic","Anti-androgen (blocks the androgen receptor and inhibits 5-alpha reductase)","Steroid","None"]', 1, 'It reduces the androgenic stimulation of sebaceous glands.'),
        (v_case_id, 'Which electrolyte must be monitored in older patients or those on other similar medications?', '["Sodium","Potassium (risk of Hyperkalemia)","Calcium","None"]', 1, 'Spironolactone is a potassium-sparing diuretic.'),
        (v_case_id, 'What is a common side effect of Spironolactone in women?', '["Hair loss","Menstrual irregularities and breast tenderness","Weight gain","None"]', 1, 'These are related to its hormonal effects.');

    ---------------------------------------------------------------------------
    -- CASE 69: The ''Psoriasis'' and the ''Cyclosporine'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Cyclosporine'' (Reasoning)', 'A patient on Cyclosporine for severe psoriasis is asking about getting a flu vaccine.

Vitals: Normal.
Physical Examination: Plaques.
Laboratory Results: None.', 69)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which type of vaccine is generally CONTRAINDICATED in patients on potent immunosuppression (e.g., Cyclosporine, Methotrexate, Biologics)?', '["Inactivated vaccines (e.g., standard flu shot)","Live-attenuated vaccines (e.g., MMR, Varicella, Yellow Fever)","mRNA vaccines","None"]', 1, 'The immune system may not be able to contain the live virus, leading to disseminated infection.'),
        (v_case_id, 'Is the ''Inactivated'' (injected) flu shot safe for these patients?', '["No","Yes, but it may be less effective (lower antibody response)","Only if they are young","None"]', 1, 'Inactivated vaccines are safe but efficacy may be reduced.'),
        (v_case_id, 'How long should a patient wait after stopping a biologic before receiving a live vaccine?', '["1 day","Usually 4-12 weeks depending on the drug half-life","1 year","None"]', 1, 'Waiting allows for ''washout'' and immune recovery.');

    ---------------------------------------------------------------------------
    -- CASE 70: The ''Itch'' and the ''Emollient'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Emollient'' (Reasoning)', 'A parent asks about the best type of moisturizer for their child with severe eczema.

Vitals: Normal.
Physical Examination: Eczema.
Laboratory Results: None.', 70)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'In terms of ''water-trapping'' efficacy, which is superior for severe dry skin?', '["Lotion","Ointment (e.g., Petroleum jelly/Vaseline)","Cream","None"]', 1, 'Ointments are occlusive and prevent the most transepidermal water loss.'),
        (v_case_id, 'Why do many children ''hate'' ointments despite their efficacy?', '["They smell bad","They are greasy and sticky","They sting","None"]', 1, 'Greasiness is the major barrier to compliance with ointment therapy.'),
        (v_case_id, 'What is the best time to apply a moisturizer for maximal effect?', '["Right before bed","Immediately after bathing (within 3 minutes) to ''lock in'' the moisture","Whenever it feels dry","None"]', 1, 'This is a key ''Step'' counseling point for atopic dermatitis management.');

    ---------------------------------------------------------------------------
    -- CASE 71: The ''Target'' and the ''Imiquimod'' (Follow-up)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Imiquimod'' (Follow-up)', 'A patient using Imiquimod for actinic keratoses on his scalp develops a fever and muscle aches.

Vitals: T 38.2 C.
Physical Examination: Inflammation at the application site.
Laboratory Results: None.', 71)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of the fever in this patient?', '["Infection of the scalp","Systemic absorption and cytokine release (IFN-alpha)","Allergy","None"]', 1, 'Flu-like symptoms are a recognized systemic side effect of topical imiquimod.'),
        (v_case_id, 'What is the best management?', '["IV Antibiotics","Reduce the frequency of application or take a ''drug holiday'' for 1-2 weeks","Give a flu shot","None"]', 1, 'Dosing adjustments usually resolve the systemic symptoms.'),
        (v_case_id, 'Is this reaction more common with large-area application?', '["Yes","No","Only in women","None"]', 0, 'Increased surface area leads to increased absorption.');

    ---------------------------------------------------------------------------
    -- CASE 72: The ''Itch'' and the ''Capsaicin''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Capsaicin''', 'A patient with post-herpetic neuralgia uses a cream containing capsaicin.

Vitals: Normal.
Physical Examination: Healed zoster scars.
Laboratory Results: None.', 72)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Capsaicin is the ''active'' component of which plant?', '["Poppy","Chili peppers","Garlic","None"]', 1, 'It is the substance that makes peppers ''hot''.'),
        (v_case_id, 'What is the mechanism of action for pain relief?', '["It numbs the skin","Depletion of Substance P from local sensory nerve endings after initial stimulation","Blocks sodium channels","None"]', 1, 'After the initial ''burn'', the nerves are temporarily unable to transmit pain.'),
        (v_case_id, 'What is the major side effect?', '["Drowsiness","Intense burning and stinging at the site of application","Numbness","None"]', 1, 'Patients must be warned that it ''gets worse before it gets better''.');

    ---------------------------------------------------------------------------
    -- CASE 73: The ''Acne'' and the ''Laser''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Laser''', 'A patient wants to know if they can get a laser treatment for their acne scars while taking Isotretinoin.

Vitals: Normal.
Physical Examination: Scars.
Laboratory Results: None.', 73)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Historically, how long was it recommended to wait AFTER finishing Isotretinoin before undergoing elective procedures like dermabrasion or laser resurfacing?', '["1 day","6-12 months (due to concern for impaired wound healing and keloid formation)","1 week","None"]', 1, 'While newer evidence suggests some procedures are safe, 6-12 months remains the traditional ''safe'' window in many guidelines.'),
        (v_case_id, 'Why is wound healing a concern with Isotretinoin?', '["It causes infection","It affects the skin''s ability to produce collagen and repair itself correctly","It makes the blood thin","None"]', 1, 'Retinoids significantly alter keratinocyte and fibroblast function.'),
        (v_case_id, 'Is hair removal (waxing) safe on Isotretinoin?', '["Yes","No, it can lead to ''skin lifting'' or tearing because the skin is so fragile","Only if the hair is long","None"]', 1, 'Waxing is strictly avoided during isotretinoin therapy.');

    ---------------------------------------------------------------------------
    -- CASE 74: The ''Pemphigus'' and the ''Azathioprine'' (Follow-up)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Azathioprine'' (Follow-up)', 'A patient on Azathioprine develops a viral upper respiratory infection.

Vitals: Normal.
Physical Examination: Congestion.
Laboratory Results: WBC 2.5 (Low).', 74)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the next step in management for a patient on Azathioprine with a WBC count < 3.0?', '["Keep the dose the same","Hold the medication and monitor blood counts until they recover","Give more Azathioprine","None"]', 1, 'Significant leukopenia is a reason to hold therapy to prevent opportunistic infection.'),
        (v_case_id, 'Should the dose be adjusted if it is restarted?', '["No","Yes, usually restarted at a lower dose after blood count recovery","Only in children","None"]', 1, 'Dose reduction helps prevent recurrence of toxicity.'),
        (v_case_id, 'What is a long-term risk of chronic immunosuppression with Azathioprine?', '["Skin cancer and Lymphoma","Diabetes","Heart disease","None"]', 0, 'Chronic B-cell and T-cell suppression carries a slight increase in malignancy risk.');

    ---------------------------------------------------------------------------
    -- CASE 75: The ''Itch'' and the ''Pimecrolimus''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Pimecrolimus''', 'A 2-year-old child with mild facial eczema is starting Pimecrolimus (Elidel) cream.

Vitals: Normal.
Physical Examination: Eczema.
Laboratory Results: None.', 75)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which topical calcineurin inhibitor is generally considered ''less potent'' and preferred for mild disease?', '["Tacrolimus (Protopic)","Pimecrolimus (Elidel)","They are the same","None"]', 1, 'Pimecrolimus is the ''milder'' of the two TCIs.'),
        (v_case_id, 'What is the ''Black Box Warning'' for both topical calcineurin inhibitors?', '["Kidney failure","Potential (though controversial) risk of malignancy based on high-dose animal studies","Heart attack","None"]', 1, 'The long-term safety regarding skin cancer and lymphoma remains a point of counseling.'),
        (v_case_id, 'Are TCIs effective for ''Acute, weeping'' flares of eczema?', '["Yes","No, they are better for maintenance and ''subacute'' disease; acute flares often require steroids","Only in the sun","None"]', 1, 'Steroids are still faster for acute ''hot'' inflammation.');

    ---------------------------------------------------------------------------
    -- CASE 76: The ''Psoriasis'' and the ''Taper'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Taper'' (Reasoning)', 'A patient with psoriasis and a severe ear infection is given a ''Medrol Dosepak'' (6-day steroid taper).

Vitals: Normal.
Physical Examination: Ear swelling.
Laboratory Results: None.', 76)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Is a short 6-day steroid taper (like a Dosepak) ''safe'' for a patient with extensive plaque psoriasis?', '["Yes, it''s too short to cause problems","No, even short courses can trigger severe rebound psoriasis flares","Only if they take it with milk","None"]', 1, 'Any dose of systemic steroid carries a risk in psoriasis patients.'),
        (v_case_id, 'What is the ''Best'' way to treat an ear infection in a psoriasis patient to avoid this risk?', '["Systemic steroids","Topical antibiotic/steroid drops (which have minimal systemic absorption)","Observation only","None"]', 1, 'Localized therapy is always preferred.'),
        (v_case_id, 'If the patient MUST have systemic steroids for a life-threatening reason (e.g., severe asthma), what should the dermatologist do?', '["Nothing","Monitor closely and prepare to start rapid-acting psoriasis meds (like Cyclosporine) if a flare occurs during the taper","Stop the steroid mid-way","None"]', 1, 'Management of the whole patient requires risk-benefit balancing.');

    ---------------------------------------------------------------------------
    -- CASE 77: The ''Acne'' and the ''Water'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Water'' (Reasoning)', 'A patient is taking Doxycycline for acne. He is confused about why he was told to ''stay upright'' after taking the pill.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: None.', 77)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which specific drug property of Tetracyclines causes esophagitis?', '["They are too large","They are highly acidic when they dissolve, causing direct mucosal injury if they ''get stuck'' in the esophagus","They are bitter","None"]', 1, 'The chemical acidity is the problem.'),
        (v_case_id, 'What is the ''30-minute'' rule for taking these medications?', '["Wait 30 minutes to eat","Do not lie down for at least 30 minutes after taking the pill","Take the pill for 30 minutes","None"]', 1, 'This ensures the pill passes safely into the stomach.'),
        (v_case_id, 'What is the characteristic symptom of pill-induced esophagitis?', '["Cough","Sudden-onset retrosternal chest pain and painful swallowing (odynophagia)","Nausea","None"]', 1, 'This is a classic Step 2 CK clinical presentation.');

    ---------------------------------------------------------------------------
    -- CASE 78: The ''Itch'' and the ''Pramoxine''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Pramoxine''', 'A patient uses a lotion containing 1% Pramoxine for itching.

Vitals: Normal.
Physical Examination: Itchy skin.
Laboratory Results: None.', 78)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does Pramoxine differ from Lidocaine or Benzocaine?', '["It''s a steroid","It is a different class of local anesthetic (ether) that has a lower risk of cross-reactivity and sensitization","It''s an antifungal","None"]', 1, 'Pramoxine is very well-tolerated and commonly used in OTC anti-itch products.'),
        (v_case_id, 'Is Pramoxine effective for ''Deep'' nerve pain (like sciatica)?', '["Yes","No, it is only effective for superficial skin itching and minor pain","Only in large doses","None"]', 1, 'It is a surface-acting anesthetic.'),
        (v_case_id, 'What is the common brand name for a lotion containing Pramoxine?', '["Sarna (Sensitive formulation)","Benadryl","Vaseline","None"]', 0, 'It is a common high-yield ingredient in anti-pruritic lotions.');

    ---------------------------------------------------------------------------
    -- CASE 79: The ''Pemphigus'' and the ''Steroid'' Side Effects (Review)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pemphigus'' and the ''Steroid'' Side Effects (Review)', 'A patient on Prednisone for 1 year.

Vitals: Normal.
Physical Examination: Weight gain, facial hair, and easy bruising.
Laboratory Results: None.', 79)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which of the following is NOT a classic side effect of long-term systemic corticosteroids?', '["Cataracts","Hypotension","Hyperglycemia","Myopathy (muscle weakness)"]', 1, 'Steroids actually cause hypertension; hypotension is a sign of adrenal insufficiency (withdrawal).'),
        (v_case_id, 'Which type of ''Eye'' problem is uniquely associated with even low-dose steroids (including topical/inhaled)?', '["Glaucoma and Posterior Subcapsular Cataracts","Retinal detachment","Dry eye","None"]', 0, 'Periodic ophthalmologic monitoring is needed for long-term users.'),
        (v_case_id, 'What happens to ''Wound Healing'' in a patient on steroids?', '["It speeds up","It is significantly delayed and the risk of infection is increased","No change","None"]', 1, 'Steroids inhibit the inflammatory and proliferative phases of healing.');

    ---------------------------------------------------------------------------
    -- CASE 80: The ''Acne'' and the ''Azelaic Acid''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Acne'' and the ''Azelaic Acid''', 'A pregnant woman with acne is asking for a safe treatment option.

Vitals: Normal.
Physical Examination: Acne.
Laboratory Results: None.', 80)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the pregnancy category of Azelaic Acid?', '["Category A","Category B (Considered very safe for both acne and rosacea during pregnancy)","Category X","None"]', 1, 'It is a first-line choice for pregnant patients.'),
        (v_case_id, 'Besides acne, Azelaic acid is also effective for which pigmentary condition?', '["Vitiligo","Post-inflammatory hyperpigmentation (PIH) and Melasma","Albinism","None"]', 1, 'It has mild skin-lightening properties.'),
        (v_case_id, 'What is its mechanism of action?', '["Kills bacteria","Antimicrobial, comedolytic, and inhibits tyrosinase","Acid only","None"]', 1, 'It is a multi-functional agent.');

    RAISE NOTICE 'Finished populating 80 cases for case-pharmacotherapy.';
END $$;

COMMIT;
