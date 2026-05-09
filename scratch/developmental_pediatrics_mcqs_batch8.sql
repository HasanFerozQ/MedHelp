-- Batch 8: 30 Developmental Pediatrics MCQs (Questions 211-240)
-- Topic: Pulmonology, Allergy/Immunology, Neurology, and Rheumatology

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-year-old child with a known history of asthma presents to the clinic for a follow-up. He experiences daytime wheezing and coughing about 3-4 days per week and wakes up coughing at night 3 times a month. He uses his albuterol inhaler roughly 3 days a week. His FEV1 is 85% of predicted. How is his asthma severity classified, and what is the preferred step-up therapy?', 
'["Mild Intermittent; continue short-acting beta-agonist (SABA) as needed only", "Mild Persistent; add a daily low-dose inhaled corticosteroid (ICS)", "Moderate Persistent; add a daily medium-dose inhaled corticosteroid (ICS)", "Severe Persistent; add a daily oral corticosteroid"]'::jsonb, 
1, 
'This child meets the criteria for Mild Persistent Asthma (symptoms >2 days/week but not daily, nighttime awakenings 3-4 times/month, minor limitation with normal PFTs). The step-up therapy from intermittent (SABA PRN) to mild persistent is the initiation of a daily low-dose Inhaled Corticosteroid (ICS) as controller medication, alongside the as-needed SABA for rescue.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 10-year-old boy presents to the emergency department with a severe asthma exacerbation. He is tachypneic, hypoxic (SpO2 88% on room air), and speaking in single words. Which of the following physical exam findings would be the most ominous sign indicating impending respiratory failure?', 
'["Loud, diffuse expiratory wheezing", "Severe intercostal and supraclavicular retractions", "A \"silent chest\" with no audible wheezing or breath sounds", "A prolonged expiratory phase"]'::jsonb, 
2, 
'While retractions and hypoxia are concerning, a "silent chest" (the sudden disappearance of wheezing with diminished or absent breath sounds in a patient who is visibly struggling to breathe) is the most ominous sign. It indicates that airway obstruction is so severe that there is insufficient airflow to generate a wheeze. This requires immediate aggressive intervention, often including magnesium sulfate, IV steroids, and potential intubation.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An infant presents with a history of meconium ileus at birth and subsequent recurrent, severe pulmonary infections with Pseudomonas aeruginosa. The infant also has failure to thrive due to pancreatic exocrine insufficiency. What is the gold standard diagnostic test for this condition?', 
'["High-resolution CT scan of the chest", "Sweat chloride test", "Fecal elastase measurement", "Bronchoscopy"]'::jsonb, 
1, 
'This is the classic presentation of Cystic Fibrosis (CF). While genetic testing can identify mutations in the CFTR gene, the gold standard physiological diagnostic test is the Sweat Chloride Test (using quantitative pilocarpine iontophoresis). A chloride concentration ≥ 60 mmol/L is diagnostic of CF.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 12-month-old infant is evaluated for a history of recurrent, severe sinopulmonary infections (pneumonia, otitis media) starting around 6 months of age. Infections are mostly caused by encapsulated bacteria (S. pneumoniae, H. influenzae). The infant is male. His tonsils and lymph nodes are notably very small or absent on exam. Laboratory testing shows profoundly low levels of IgG, IgA, and IgM. What is the diagnosis?', 
'["X-linked Agammaglobulinemia (Bruton Agammaglobulinemia)", "Severe Combined Immunodeficiency (SCID)", "Common Variable Immunodeficiency (CVID)", "DiGeorge Syndrome"]'::jsonb, 
0, 
'This is X-linked Agammaglobulinemia (XLA). It is caused by a mutation in the BTK gene, preventing B-cell maturation. Patients are boys who present with recurrent bacterial infections once maternal IgG wanes (around 6 months). Key features are the near-total absence of all immunoglobulins and the physical absence of mature B-cell tissues (e.g., small/absent tonsils and lymph nodes). Treatment is lifelong IVIG.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An infant presents with recurrent, severe fungal (Candida), viral (CMV, RSV), and bacterial infections starting in the first few weeks of life. He also has chronic diarrhea and failure to thrive. Laboratory tests reveal an absence of functional T-cells and severely depressed B-cell function. What is the most definitive, curative treatment for this condition?', 
'["Intravenous Immunoglobulin (IVIG) therapy every 3 weeks", "Hematopoietic stem cell transplantation (Bone Marrow Transplant)", "Lifelong prophylactic antibiotics, antivirals, and antifungals", "Enzyme replacement therapy"]'::jsonb, 
1, 
'This is Severe Combined Immunodeficiency (SCID), a pediatric emergency. Infants completely lack functional T-cells (and often B and NK cells), making them susceptible to all types of pathogens (viral, fungal, bacterial, opportunistic). Without a functional immune system, SCID is uniformly fatal in infancy. The only definitive, curative treatment is a Hematopoietic Stem Cell Transplant (Bone Marrow Transplant), ideally performed as early as possible.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old child experiences a generalized tonic-clonic seizure that lasts for 2 minutes. The seizure occurred shortly after the child developed a rapid fever of 103°F (39.4°C) due to a viral upper respiratory infection. By the time the child arrives at the ER, he is sleepy but easily arousable and has a normal neurological exam. He has no prior history of seizures. What is the most appropriate management?', 
'["Order an urgent EEG and MRI of the brain", "Perform a lumbar puncture to rule out meningitis", "Initiate daily anti-epileptic medication (e.g., levetiracetam) to prevent recurrence", "Reassure the parents, treat the fever with antipyretics, and discharge home"]'::jsonb, 
3, 
'This describes a Simple Febrile Seizure (generalized, lasts < 15 minutes, does not recur within 24 hours, occurs in a neurologically normal child aged 6 months to 5 years). Simple febrile seizures are benign and do not increase the risk of subsequent epilepsy or cognitive decline. Extensive workups (EEG, MRI, LP) and daily anti-epileptic drugs are not indicated. Reassurance and fever control are the mainstays of management.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 7-year-old girl is brought to the clinic because her teacher notes she frequently "daydreams" in class. During these episodes, which last 5 to 10 seconds, she stares blankly, stops talking, and may flutter her eyelids. She does not fall over and has no post-ictal confusion. An EEG shows generalized 3-Hz spike-and-wave discharges. What is the diagnosis, and what is the first-line treatment?', 
'["Complex partial seizures; treat with carbamazepine", "Absence seizures; treat with ethosuximide", "Attention-Deficit/Hyperactivity Disorder; treat with methylphenidate", "Atonic seizures; treat with valproic acid"]'::jsonb, 
1, 
'This is the classic presentation of Childhood Absence Epilepsy. The hallmark EEG finding is 3-Hz generalized spike-and-wave discharges. Ethosuximide is the traditional first-line treatment, specifically targeting the T-type calcium channels involved in these seizures. Valproic acid is also effective and may be used if the child also has generalized tonic-clonic seizures.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-month-old infant presents with clusters of sudden, brief, symmetric muscle contractions where he forcefully flexes his head, trunk, and arms (often described as "jackknife" or "salaam" attacks). These occur mainly when waking up. He has recently stopped smiling and lost the ability to roll over. An EEG reveals a chaotic, disorganized pattern of high-voltage slow waves and spikes known as hypsarrhythmia. What is the diagnosis?', 
'["Benign neonatal convulsions", "Lennox-Gastaut syndrome", "Infantile Spasms (West Syndrome)", "Juvenile myoclonic epilepsy"]'::jsonb, 
2, 
'This is the classic triad of Infantile Spasms (West Syndrome): 1) the characteristic spasms (often flexor), 2) developmental regression, and 3) hypsarrhythmia on EEG. It is a severe epileptic encephalopathy of infancy. Prompt diagnosis and treatment are critical to salvage cognitive development. First-line treatments are Adrenocorticotropic hormone (ACTH), oral corticosteroids, or Vigabatrin (especially if associated with Tuberous Sclerosis).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old boy born prematurely at 28 weeks gestation presents with delayed motor milestones. He did not sit until 12 months and is not walking. Examination reveals hypertonia (spasticity) and hyperreflexia, which is much more pronounced in his legs than his arms. He walks on his toes with a "scissoring" gait. What is the most likely diagnosis?', 
'["Spinal Muscular Atrophy (SMA)", "Duchenne Muscular Dystrophy", "Spastic Diplegic Cerebral Palsy", "Guillain-Barré Syndrome"]'::jsonb, 
2, 
'This presentation is classic for Spastic Diplegic Cerebral Palsy, a non-progressive motor disorder. It is strongly associated with prematurity, specifically caused by periventricular leukomalacia (ischemic injury to the white matter tracts descending to the legs). The hallmark is spasticity affecting the lower extremities more than the upper extremities, leading to toe-walking and a scissoring gait due to tight adductors.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 15-year-old boy suffers a concussion during a football game. He lost consciousness for 10 seconds and was confused for 10 minutes. He currently has a mild headache but normal neurological exam. According to current return-to-play guidelines, when can he safely return to competitive football?', 
'["He can return in the second half of the same game if his headache resolves", "He can return the next day if he feels completely normal", "He must rest and then complete a graduated, step-wise return-to-play protocol over several days, only advancing if asymptomatic at each step", "He must sit out the rest of the season to prevent second impact syndrome"]'::jsonb, 
2, 
'Current concussion guidelines strictly forbid same-day return to play for any athlete diagnosed with a concussion, regardless of how quickly symptoms resolve. They must first have a period of physical and cognitive rest (24-48 hours), followed by a supervised, gradual, step-wise return-to-play protocol. They can only progress to the next step (e.g., light aerobic exercise -> sport-specific exercise -> non-contact drills -> full contact) if they remain completely asymptomatic. This protects against the potentially fatal Second Impact Syndrome.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-month-old infant presents with severely itchy, erythematous, weeping, and crusted plaques on his cheeks, scalp, and the extensor surfaces of his arms and legs. The diaper area is completely spared. His mother has asthma and allergic rhinitis. What is the most likely diagnosis?', 
'["Seborrheic dermatitis", "Atopic dermatitis (Eczema)", "Contact dermatitis", "Psoriasis"]'::jsonb, 
1, 
'This is the classic presentation of Atopic Dermatitis (Eczema) in an infant. The distribution in infants classically involves the face (cheeks), scalp, and extensor surfaces, while strictly sparing the diaper area (which protects the skin from scratching and environmental triggers). It is extremely pruritic ("the itch that rashes"). There is often a strong family history of the "atopic triad" (eczema, asthma, allergic rhinitis).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-week-old infant is brought to the clinic for a non-pruritic, greasy, yellow, scaly rash on the scalp ("cradle cap") and within the skin folds of the neck and axillae. The infant is otherwise healthy and unbothered. What is the appropriate management?', 
'["Prescribe a high-potency topical corticosteroid", "Reassure parents that this is seborrheic dermatitis and recommend gentle washing with baby shampoo and applying mineral oil", "Prescribe an oral antifungal medication", "Evaluate for an underlying immunodeficiency"]'::jsonb, 
1, 
'This is Seborrheic Dermatitis. Unlike atopic dermatitis, it is typically non-pruritic, involves the skin folds (intertriginous areas) and sebum-rich areas (scalp, eyebrows), and features greasy, yellow scales. It is a benign, self-limiting condition in infants. Management involves reassurance, gentle washing, and sometimes mild topical antifungals or low-potency steroids if severe, but aggressive treatment is unnecessary.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-year-old child presents with a patch of alopecia (hair loss) on the scalp. The area is scaly and contains "black dots" (broken hair shafts). The child also has enlarged posterior cervical lymph nodes. What is the diagnosis, and what is the required treatment route?', 
'["Alopecia areata; treat with topical steroids", "Tinea capitis; treat with oral antifungals (e.g., Griseofulvin)", "Tinea capitis; treat with topical antifungal cream", "Trichotillomania; treat with behavioral therapy"]'::jsonb, 
1, 
'This is Tinea Capitis (ringworm of the scalp). It classically presents as scaly patches of alopecia with "black dots" (hairs broken at the scalp surface) and is often associated with posterior cervical or occipital lymphadenopathy. Because the dermatophyte infects the hair shaft and follicle, topical antifungal creams are INEFFECTIVE. Systemic (oral) antifungal therapy (classically Griseofulvin, or Terbinafine) for several weeks is strictly required.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 5-year-old child develops a rash around the nose and mouth. It began as small vesicles that ruptured, leaving behind "honey-colored" crusts. The child is otherwise well. What is the diagnosis and the most common causative organism?', 
'["Herpes simplex virus (Cold sores)", "Varicella zoster virus (Chickenpox)", "Non-bullous Impetigo; Staphylococcus aureus or Streptococcus pyogenes", "Contact dermatitis; Poison ivy"]'::jsonb, 
2, 
'This is the classic presentation of Non-bullous Impetigo. The hallmark finding is the honey-colored crusts over an erythematous base, most commonly on the face. It is a highly contagious superficial bacterial skin infection, most frequently caused by Staphylococcus aureus or Group A Streptococcus (S. pyogenes). Localized infection is treated with topical antibiotics (like Mupirocin).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An 8-year-old girl complains of intensely itchy lesions between her fingers, on her wrists, and around her umbilicus. The itching is significantly worse at night. Several other family members are also itching. Examination reveals small erythematous papules and fine, linear burrows in the web spaces of her fingers. What is the treatment of choice?', 
'["Topical Permethrin 5% cream applied to the entire body from the neck down, washed off after 8-14 hours", "Oral Ivermectin alone", "Topical hydrocortisone cream", "Topical Ketoconazole cream"]'::jsonb, 
0, 
'This is Scabies, an infestation by the Sarcoptes scabiei mite. The classic presentation involves intense nocturnal pruritus, a history of affected contacts, and linear burrows, especially in the web spaces of the hands, wrists, and waistline. The first-line treatment is topical Permethrin 5% cream. Crucially, all household contacts must be treated simultaneously, and bedding/clothing washed in hot water.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old girl presents with a daily spiking fever (often >103°F/39.4°C) occurring every evening for the past 3 weeks. The fever is accompanied by a salmon-colored, macular rash on her trunk that fades when the fever resolves. She also complains of knee and wrist pain and has hepatosplenomegaly. What is the most likely diagnosis?', 
'["Acute Lymphoblastic Leukemia (ALL)", "Systemic-onset Juvenile Idiopathic Arthritis (sJIA)", "Kawasaki Disease", "Rheumatic Fever"]'::jsonb, 
1, 
'This is the classic presentation of Systemic-onset Juvenile Idiopathic Arthritis (formerly Still''s disease). The hallmarks are the high, daily "quotidian" spiking fevers, the evanescent (transient) salmon-colored rash that appears with the fever, arthritis (often polyarticular), and systemic inflammation (hepatosplenomegaly, lymphadenopathy). It is a diagnosis of exclusion after ruling out malignancy and infection.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old girl presents with a limp and a swollen, warm right knee. She has no fever and feels well otherwise. The swelling has been present for 8 weeks. No other joints are involved. She has a positive Antinuclear Antibody (ANA) test. What is the most critical complication that she must be routinely screened for?', 
'["Coronary artery aneurysms", "Chronic anterior uveitis (iridocyclitis) leading to blindness", "Progressive renal failure", "Pulmonary fibrosis"]'::jsonb, 
1, 
'This patient has Oligoarticular Juvenile Idiopathic Arthritis (involves ≤4 joints, usually large joints like the knee). Patients who are young females and ANA positive are at a very high risk for developing asymptomatic chronic anterior uveitis (iridocyclitis). If undetected and untreated, it can cause severe scarring and blindness. Therefore, routine screening by a pediatric ophthalmologist using a slit-lamp is mandatory.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 14-year-old girl presents with fatigue, joint pain, and a photosensitive, erythematous rash across her cheeks and the bridge of her nose (sparing the nasolabial folds). Laboratory testing reveals a low white blood cell count, mild anemia, and proteinuria. Which autoantibody is most specific for confirming her likely diagnosis?', 
'["Antinuclear antibody (ANA)", "Anti-double-stranded DNA (anti-dsDNA) antibody", "Rheumatoid factor (RF)", "Anti-cyclic citrullinated peptide (anti-CCP) antibody"]'::jsonb, 
1, 
'This patient has classic signs of Systemic Lupus Erythematosus (SLE), including the malar ("butterfly") rash, arthritis, cytopenias, and nephritis. While the ANA test is highly sensitive (a negative ANA essentially rules out SLE), it is not specific. The Anti-dsDNA and Anti-Smith antibodies are highly specific for SLE. Anti-dsDNA levels also often correlate with disease activity, especially lupus nephritis.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 5-year-old boy presents with progressive proximal muscle weakness. He struggles to comb his hair and climb stairs. On exam, he has a violaceous (heliotrope) rash over his upper eyelids and scaly, erythematous plaques over the knuckles of his hands (Gottron papules). What is the diagnosis?', 
'["Duchenne Muscular Dystrophy", "Juvenile Dermatomyositis", "Systemic Lupus Erythematosus", "Atopic Dermatitis"]'::jsonb, 
1, 
'This is Juvenile Dermatomyositis (JDM), an autoimmune inflammatory myopathy affecting skin and muscle. The symmetric, proximal muscle weakness (struggling with stairs/brushing hair) is characteristic. The pathognomonic skin findings are the heliotrope rash (periorbital violaceous erythema/edema) and Gottron papules (erythematous scaling over the extensor surfaces of the metacarpophalangeal and interphalangeal joints).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 16-year-old male athlete presents with a severe, throbbing pain in his left distal femur that wakes him up at night. He has noticed a hard swelling in the area. An X-ray shows a destructive lesion in the metaphysis of the distal femur with a "sunburst" pattern of periosteal reaction and Codman''s triangle. What is the most likely diagnosis?', 
'["Ewing sarcoma", "Osteosarcoma", "Osteomyelitis", "Osteoid osteoma"]'::jsonb, 
1, 
'This is the classic presentation of Osteosarcoma, the most common primary malignant bone tumor in children and adolescents. It typically occurs during the adolescent growth spurt and classically arises in the metaphysis of long bones around the knee (distal femur, proximal tibia). The "sunburst" pattern and Codman''s triangle (elevation of the periosteum by the rapidly growing tumor) are characteristic radiological signs.')

;
