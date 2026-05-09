-- Batch 2: 31 Pediatric Nephrology & Endo MCQs (Questions 32-62)
-- Topic: IgA Nephropathy, Alport, HSP, and HUS
-- Slug: peds-nephro-endo

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 14-year-old boy presents with gross hematuria that began 1 day after the onset of a sore throat and low-grade fever. He has had similar episodes in the past following upper respiratory infections. His blood pressure and physical exam are normal. What is the most likely diagnosis?', 
'["Post-streptococcal glomerulonephritis (PSGN)", "IgA nephropathy (Berger disease)", "Minimal change disease", "Alport syndrome"]'::jsonb, 
1, 
'IgA nephropathy is the most common cause of glomerulonephritis worldwide. It characteristically presents as "synpharyngitic hematuria" (hematuria occurring *during* or immediately after an URI), unlike PSGN which has a 1-3 week latent period. Patients are usually asymptomatic between episodes.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the classic finding on immunofluorescence microscopy for a patient with IgA nephropathy?', 
'["Linear IgG along the basement membrane", "Diffuse granular C3 and IgG in a starry-sky pattern", "Mesangial IgA and C3 deposits", "Negative immunofluorescence"]'::jsonb, 
2, 
'IgA nephropathy is defined by the presence of prominent IgA deposits in the mesangium of the glomeruli, often accompanied by C3. PSGN shows granular C3/IgG in a "starry-sky" pattern, and Goodpasture shows linear IgG.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 6-year-old boy presents with a palpable purpuric rash on his buttocks and lower extremities, colicky abdominal pain, and swollen ankles. Urinalysis shows microscopic hematuria and 1+ protein. What is the most likely diagnosis?', 
'["Idiopathic thrombocytopenic purpura (ITP)", "IgA vasculitis (Henoch-Schönlein purpura)", "Post-streptococcal glomerulonephritis", "Meningococcemia"]'::jsonb, 
1, 
'IgA Vasculitis (HSP) is a small-vessel vasculitis characterized by the tetrad of: palpable purpura (without thrombocytopenia), arthritis/arthralgia, abdominal pain (due to bowel wall edema/hemorrhage), and renal disease (hematuria/proteinuria).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is a common gastrointestinal complication of IgA Vasculitis (HSP) that may require surgical intervention?', 
'["Appendicitis", "Intussusception (typically ileo-ileal)", "Pyloric stenosis", "Biliary atresia"]'::jsonb, 
1, 
'Intussusception is a serious complication of HSP, occurring in about 3-5% of cases. In HSP, the "lead point" is usually a submucosal bowel wall hematoma, and the intussusception is frequently ileo-ileal (unlike the common idiopathic ileo-colic type).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the primary management for the majority of children with IgA Vasculitis (HSP)?', 
'["High-dose intravenous methylprednisolone", "Supportive care with hydration and NSAIDs for joint pain", "Immediate renal biopsy", "Plasma exchange"]'::jsonb, 
1, 
'Most cases of HSP are self-limiting and require only supportive care. NSAIDs are used for joint pain. Steroids are sometimes used for severe abdominal pain or significant renal involvement, but they do not prevent the development of chronic kidney disease.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 10-year-old boy presents with persistent microscopic hematuria. His father and paternal uncle both have end-stage renal disease, and his father is also deaf. What is the most likely diagnosis?', 
'["Polycystic kidney disease", "Alport syndrome", "Thin basement membrane disease", "IgA nephropathy"]'::jsonb, 
1, 
'Alport syndrome is an inherited disorder of Type IV collagen (most commonly X-linked). It presents with a triad of: hereditary nephritis (hematuria progressing to ESRD), sensorineural hearing loss, and ocular abnormalities (e.g., anterior lenticonus).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the characteristic electron microscopy finding in Alport syndrome?', 
'["Subepithelial humps", "Foot process effacement", "Irregular thinning and thickening of the GBM with a ''basket-weave'' appearance", "Linear IgG deposition"]'::jsonb, 
2, 
'The defect in Type IV collagen in Alport syndrome leads to a characteristic "basket-weave" appearance on electron microscopy, caused by irregular splitting and lamellation of the glomerular basement membrane (GBM).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 4-year-old girl is brought to the emergency department with a 1-day history of bloody diarrhea, followed by the sudden onset of pallor, irritability, and decreased urine output. Lab results show: Hemoglobin 6.2 g/dL, Platelets 42,000/mm3, and Creatinine 2.8 mg/dL (elevated). What is the most likely diagnosis?', 
'["Disseminated intravascular coagulation (DIC)", "Hemolytic uremic syndrome (HUS)", "Acute lymphoblastic leukemia (ALL)", "Thrombotic thrombocytopenic purpura (TTP)"]'::jsonb, 
1, 
'HUS is characterized by the triad of: microangiopathic hemolytic anemia, thrombocytopenia, and acute kidney injury. The "typical" form is preceded by a prodrome of bloody diarrhea (usually E. coli O157:H7).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following findings on a peripheral blood smear is most characteristic of Hemolytic Uremic Syndrome (HUS)?', 
'["Target cells", "Schistocytes (helmet cells)", "Spherocytes", "Atypical lymphocytes"]'::jsonb, 
1, 
'HUS involves the formation of microthrombi in small vessels. As red blood cells pass through these partially occluded vessels, they are sheared, resulting in schistocytes (fragmented RBCs), which are diagnostic of microangiopathic hemolytic anemia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common causative organism of typical "D-positive" (diarrhea-associated) HUS?', 
'["Salmonella enteritidis", "Shiga toxin-producing Escherichia coli (STEC), particularly O157:H7", "Campylobacter jejuni", "Clostridioides difficile"]'::jsonb, 
1, 
'STEC O157:H7 is the most common cause. The Shiga toxin (or Verotoxin) causes endothelial damage in the glomerular capillaries, leading to platelet activation and microthrombus formation.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Why is the use of antibiotics or anti-motility agents (like loperamide) generally avoided in children with suspected E. coli O157:H7 diarrhea?', 
'["They cause severe constipation", "They may increase the risk of developing HUS by increasing toxin release or exposure", "They are ineffective against E. coli", "They cause severe electrolyte imbalances"]'::jsonb, 
1, 
'Antibiotics may induce the bacteriophage to enter the lytic cycle, releasing more Shiga toxin. Anti-motility agents keep the toxin-producing bacteria in the gut longer. Both are thought to increase the risk of progression to HUS.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with HUS requires a blood transfusion for symptomatic anemia. What is the most appropriate management for his acute kidney injury?', 
'["Immediate administration of systemic corticosteroids", "Supportive care including fluid/electrolyte management and dialysis if necessary", "Plasmapheresis", "Low-dose heparin to prevent thrombi"]'::jsonb, 
1, 
'The management of HUS is primarily supportive. Close monitoring of fluid balance and electrolytes is crucial. Approximately 50% of children with HUS will require temporary peritoneal dialysis or hemodialysis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In "Atypical HUS" (a-HUS), the underlying pathophysiology is usually:', 
'["Shiga toxin ingestion", "Uncontrolled activation of the alternative complement pathway", "Deficiency of ADAMTS13", "An autoimmune reaction to platelets"]'::jsonb, 
1, 
'Atypical HUS is caused by genetic mutations in complement regulatory proteins (e.g., Factor H, Factor I), leading to chronic, uncontrolled complement activation. This is treated with Eculizumab (a C5 inhibitor).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 16-year-old girl with a history of systemic lupus erythematosus (SLE) presents with new-onset hypertension and proteinuria. Which lab test is most specific for assessing the risk of active Lupus Nephritis?', 
'["Antinuclear antibody (ANA)", "Anti-double stranded DNA (anti-dsDNA) and Serum C3/C4 levels", "Anti-Smith antibody", "Rheumatoid factor"]'::jsonb, 
1, 
'Active lupus nephritis is characteristically associated with rising titers of anti-dsDNA antibodies and falling levels of serum complement (C3 and C4).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 5-year-old child presents with persistent microscopic hematuria. An ultrasound of his kidneys is normal. His mother also has microscopic hematuria but normal renal function. What is the most likely diagnosis?', 
'["Alport syndrome", "Thin basement membrane nephropathy (Benign Familial Hematuria)", "PSGN", "IgA nephropathy"]'::jsonb, 
1, 
'Thin basement membrane nephropathy is an autosomal dominant condition characterized by persistent microscopic hematuria with an excellent prognosis (no progression to renal failure, hearing loss, or ocular changes). It is the most common cause of "benign familial hematuria."'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common ocular finding in Alport syndrome?', 
'["Cataracts", "Anterior lenticonus", "Glaucoma", "Retinal detachment"]'::jsonb, 
1, 
'Anterior lenticonus (a cone-shaped protrusion of the lens) is highly specific for Alport syndrome and is often associated with the progressive hearing loss and renal failure.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with IgA Vasculitis (HSP) is found to have severe, nephrotic-range proteinuria. What is the most appropriate next step in management?', 
'["Immediate kidney biopsy", "Start high-dose steroids and consider immunosuppressants", "Continue supportive care only", "Schedule for tonsillectomy"]'::jsonb, 
1, 
'While most HSP is benign, "HSP nephritis" can be severe. If there is significant or persistent proteinuria/hematuria, a biopsy is performed to grade the severity. Aggressive treatment with steroids and sometimes other agents (like ACE inhibitors or cyclophosphamide) is used to prevent progression to CKD.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is true regarding IgA nephropathy vs. IgA Vasculitis (HSP)?', 
'["They have completely different histopathology on renal biopsy", "IgA nephropathy is essentially a form of HSP limited to the kidney", "IgA nephropathy is always preceded by a rash", "HSP only occurs in adults"]'::jsonb, 
1, 
'IgA nephropathy and HSP share similar renal histopathology (mesangial IgA deposits). Many experts consider IgA nephropathy to be a localized, renal-limited form of the systemic vasculitis seen in HSP.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 15-year-old male with Alport syndrome has reached end-stage renal disease and receives a kidney transplant. He subsequently develops severe glomerulonephritis in the *allograft*. What is the likely cause?', 
'["Recurrence of Alport syndrome", "Anti-GBM antibody disease (Goodpasture-like)", "Acute cellular rejection", "Cytomegalovirus infection"]'::jsonb, 
1, 
'Patients with Alport syndrome lack certain collagen chains in their native GBM. When they receive a transplant with a normal GBM, their immune system may recognize the "new" collagen as foreign and develop anti-GBM antibodies, leading to a Goodpasture-like syndrome in the graft.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In Hemolytic Uremic Syndrome (HUS), the Coombs test is typically:', 
'["Positive for IgG", "Positive for C3", "Negative", "Only positive in adolescents"]'::jsonb, 
2, 
'The hemolytic anemia in HUS is *non-immune* (microangiopathic), so the direct and indirect Coombs tests are negative. This helps distinguish HUS from autoimmune hemolytic anemia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with HUS develops sudden, severe neurological symptoms including seizures and altered mental status. What is the likely cause?', 
'["Meningitis", "Hypertensive encephalopathy or microthrombi in the CNS", "Vitamin B12 deficiency", "Side effect of steroids"]'::jsonb, 
1, 
'While the kidney is the primary organ affected, HUS can cause CNS involvement in about 20-30% of cases due to microthrombi or secondary to severe hypertension and uremia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following statements about Alport syndrome is correct regarding gender?', 
'["Only males are affected", "Females are typically carriers but may have microscopic hematuria and occasionally progress to ESRD", "Females are more severely affected than males", "It is an autosomal recessive condition"]'::jsonb, 
1, 
'Since the most common form of Alport is X-linked, males are severely affected. Females (heterozygotes) usually have persistent microscopic hematuria but have a much lower (though not zero) risk of hearing loss and ESRD.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child presents with acute glomerulonephritis, pulmonary hemorrhage (hemoptysis), and linear IgG deposits on renal biopsy. What is the diagnosis?', 
'["Lupus Nephritis", "Goodpasture Syndrome (Anti-GBM Disease)", "Wegener granulomatosis", "Alport syndrome"]'::jsonb, 
1, 
'Goodpasture syndrome is rare in children but classic for the combination of pulmonary hemorrhage and progressive glomerulonephritis, characterized by autoantibodies against the GBM (linear IgG).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of acute kidney injury in a previously healthy child who presents with a gastrointestinal prodrome?', 
'["Acute tubular necrosis", "Hemolytic uremic syndrome", "Prerenal azotemia from dehydration", "Acute interstitial nephritis"]'::jsonb, 
1, 
'While dehydration can cause prerenal AKI, HUS is the most common cause of *intrinsic* AKI in young children following a diarrheal illness.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which form of HUS is associated with Streptococcus pneumoniae infection?', 
'["Typical D-positive HUS", "Pneumococcal-associated HUS (often T-antigen activation)", "Atypical HUS", "None of the above"]'::jsonb, 
1, 
'Pneumococcal HUS occurs in children with invasive pneumococcal disease (pneumonia/meningitis). Neuraminidase produced by the bacteria exposes the "Thomsen-Friedenreich (T) antigen" on RBCs and glomerular cells, leading to hemolysis and kidney injury.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following extra-renal findings is NOT typical of IgA Vasculitis (HSP)?', 
'["Palpable purpura", "Scrotal pain and swelling", "Joint swelling", "Generalized lymphadenopathy"]'::jsonb, 
3, 
'Generalized lymphadenopathy is not a feature of HSP. However, scrotal pain/swelling (mimicking torsion) is a common and important manifestation in males.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In a patient with suspected IgA nephropathy, what is the significance of "persistent" gross hematuria or significant proteinuria?', 
'["It indicates a benign course", "It is a poor prognostic factor for progression to renal failure", "It indicates the patient also has Alport syndrome", "It means the patient needs a splenectomy"]'::jsonb, 
1, 
'While many cases of IgA nephropathy are benign, risk factors for progression to ESRD include: significant proteinuria (>1g/day), hypertension, and impaired GFR at presentation.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'True or False: The rash of IgA Vasculitis (HSP) typically blanches under pressure.', 
'["True", "False", "Only in the first 24 hours", "Only on the face"]'::jsonb, 
1, 
'False. The purpuric lesions of HSP represent small-vessel vasculitis with extravasation of RBCs into the skin; therefore, they are "non-blanching."'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the term for the characteristic biopsy finding in Wegener Granulomatosis (GPA) that distinguishes it from other forms of GN?', 
'["Linear IgG", "Granulomatous inflammation and Pauci-immune crescentic GN", "Mesangial IgA", "Subepithelial humps"]'::jsonb, 
1, 
'GPA (Granulomatosis with polyangiitis) is a small-vessel vasculitis characterized by granulomatous inflammation (often in the respiratory tract) and "pauci-immune" (meaning very little immune-complex deposition) crescentic glomerulonephritis. It is typically ANCA-positive.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with HUS has a platelet count of 25,000/mm3 but is NOT bleeding. What is the recommendation regarding platelet transfusion?', 
'["Transfuse immediately to get count above 100,000", "Platelet transfusion is generally avoided as it may ''fuel the fire'' of microthrombi formation", "Give aspirin instead", "None"]'::jsonb, 
1, 
'In HUS, platelet transfusions are generally avoided unless there is active, clinically significant bleeding, as they may theoretically worsen the microvascular thrombosis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-year-old child presents with microscopic hematuria and a normal C3 level. 2 weeks later, the C3 is still normal. Which of the following is UNLIKELY?', 
'["IgA Nephropathy", "Thin Basement Membrane Disease", "PSGN", "Alport Syndrome"]'::jsonb, 
2, 
'PSGN is almost always associated with a low C3 level in the acute phase. The other conditions mentioned typically have normal complement levels.')

;
