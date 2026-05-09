-- Batch 1: 31 Pediatric Nephrology & Endo MCQs (Questions 1-31)
-- Topic: Nephrotic Syndrome and PSGN
-- Slug: peds-nephro-endo

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 4-year-old boy presents with sudden onset of generalized edema, most prominent in the periorbital region in the morning. His parents also notice his abdomen is becoming "distended." He has no history of fever or recent illness. Urinalysis reveals 4+ protein and no blood. What is the most likely diagnosis?', 
'["Post-streptococcal glomerulonephritis", "Minimal change disease", "Focal segmental glomerulosclerosis", "IgA nephropathy"]'::jsonb, 
1, 
'Minimal Change Disease (MCD) is the most common cause of nephrotic syndrome in children (approx. 80-90% of cases under age 10). It characteristically presents with sudden onset edema and "selective" proteinuria (mostly albumin) without hematuria or hypertension. PSGN, IgA nephropathy, and FSGS are less common in this age group and often present with hematuria.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with suspected Minimal Change Disease (MCD) undergoes a renal biopsy (though usually not required initially). What is the classic finding on electron microscopy?', 
'["Linear IgG deposition along the basement membrane", "Subepithelial humps", "Effacement of podocyte foot processes", "Splitting of the glomerular basement membrane"]'::jsonb, 
2, 
'The hallmark of MCD on electron microscopy is the diffuse effacement (flattening) of the podocyte foot processes. Light microscopy typically appears normal (hence "minimal change"), and immunofluorescence is negative. Linear IgG is seen in Goodpasture syndrome, subepithelial humps in PSGN, and GBM splitting in Alport syndrome.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the first-line treatment for a 5-year-old child with a first episode of uncomplicated nephrotic syndrome, likely Minimal Change Disease?', 
'["Intravenous cyclophosphamide", "Oral prednisone (2 mg/kg/day)", "Plasma exchange", "High-dose intravenous furosemide alone"]'::jsonb, 
1, 
'The standard initial treatment for pediatric nephrotic syndrome (MCD) is a prolonged course of oral corticosteroids (prednisone). Approximately 90% of children with MCD are "steroid-responsive," meaning their proteinuria resolves within weeks of starting therapy. Cyclophosphamide is reserved for steroid-resistant or frequently relapsing cases.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 6-year-old girl with nephrotic syndrome is being treated with prednisone. She suddenly develops severe abdominal pain, fever, and rebound tenderness. What life-threatening complication must be ruled out immediately?', 
'["Acute appendicitis", "Spontaneous bacterial peritonitis (SBP)", "Renal vein thrombosis", "Hypovolemic shock"]'::jsonb, 
1, 
'Children with nephrotic syndrome are at high risk for spontaneous bacterial peritonitis (SBP), most commonly caused by Streptococcus pneumoniae. This risk is due to the loss of immunoglobulins and complement factors in the urine, as well as immunosuppression from steroid therapy. Fever and abdominal pain in a nephrotic child are SBP until proven otherwise.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 10-year-old child with nephrotic syndrome presents with sudden onset of gross hematuria and left-sided flank pain. Physical exam reveals a palpable left-sided abdominal mass. What is the most likely complication?', 
'["Wilms tumor", "Renal vein thrombosis", "Acute pyelonephritis", "Urolithiasis"]'::jsonb, 
1, 
'Nephrotic syndrome is a hypercoagulable state due to the loss of antithrombin III, protein C, and protein S in the urine, as well as increased hepatic production of fibrinogen. Renal vein thrombosis is a classic complication, often presenting with a palpable mass, flank pain, and hematuria.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following laboratory findings is NOT part of the classic definition of nephrotic syndrome?', 
'["Proteinuria (> 40 mg/m2/hr or spot protein/creatinine ratio > 2)", "Hypoalbuminemia (< 2.5 g/dL)", "Hyperlipidemia", "Gross hematuria and hypertension"]'::jsonb, 
3, 
'Nephrotic syndrome is defined by massive proteinuria, hypoalbuminemia, and edema, often accompanied by hyperlipidemia. While microscopic hematuria can occur in a small percentage of MCD cases, gross hematuria and significant hypertension are more characteristic of "nephritic" syndromes (like PSGN).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 4-year-old boy has been on prednisone for 8 weeks for nephrotic syndrome, but his urinalysis continues to show 4+ protein. He is classified as "steroid-resistant." What is the most likely histological diagnosis in this child?', 
'["Minimal change disease", "Focal segmental glomerulosclerosis (FSGS)", "Membranoproliferative glomerulonephritis (MPGN)", "Membranous nephropathy"]'::jsonb, 
1, 
'Focal Segmental Glomerulosclerosis (FSGS) is the second most common cause of nephrotic syndrome in children and is the most common cause of steroid-resistant nephrotic syndrome. Unlike MCD, FSGS carries a higher risk of progression to chronic kidney disease.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 7-year-old girl presents with "cola-colored" urine, periorbital edema, and a blood pressure of 140/95 mmHg. She had a sore throat about 2 weeks ago that resolved without treatment. What is the most likely diagnosis?', 
'["IgA nephropathy", "Post-streptococcal glomerulonephritis (PSGN)", "Alport syndrome", "Minimal change disease"]'::jsonb, 
1, 
'This is the classic presentation of PSGN. The triad of hematuria ("cola-colored"), edema, and hypertension following a streptococcal infection (pharyngitis or impetigo) after a latent period of 1-3 weeks is diagnostic. IgA nephropathy usually lacks a long latent period ("synpharyngitic hematuria").'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In a patient with Post-streptococcal glomerulonephritis (PSGN), which laboratory finding is most characteristically decreased?', 
'["Serum C3 complement level", "Serum C4 complement level", "Anti-streptolysin O (ASO) titer", "Serum albumin"]'::jsonb, 
0, 
'PSGN is an immune-complex mediated disease that characteristically causes a significant decrease in the serum C3 complement level. C4 levels are typically normal. C3 levels usually return to normal within 6-8 weeks; persistence of low C3 suggests other conditions like MPGN or Lupus nephritis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of death in the acute phase of Post-streptococcal glomerulonephritis (PSGN)?', 
'["Renal failure", "Heart failure due to fluid overload and hypertension", "Sepsis", "Pulmonary embolism"]'::jsonb, 
1, 
'The primary management of acute PSGN is supportive, focusing on fluid and salt restriction and blood pressure control. The greatest acute risk is volume overload leading to congestive heart failure or hypertensive encephalopathy.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with nephrotic syndrome is found to have hyperlipidemia. What is the primary mechanism for this finding?', 
'["Inability of the kidney to excrete lipids", "Increased hepatic synthesis of lipids in response to low oncotic pressure", "Excessive dietary intake of fats due to increased appetite", "Loss of lipid-binding proteins in the urine"]'::jsonb, 
1, 
'Hyperlipidemia in nephrotic syndrome is caused by the liver increasing the synthesis of lipoproteins (including cholesterol and triglycerides) as a non-specific response to the low serum oncotic pressure caused by hypoalbuminemia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-year-old adolescent with a history of obesity presents with massive proteinuria and hypertension. Renal biopsy shows scarring in parts of some glomeruli. What is the diagnosis?', 
'["Minimal change disease", "Focal segmental glomerulosclerosis (FSGS)", "IgA nephropathy", "Membranous nephropathy"]'::jsonb, 
1, 
'The biopsy finding of segmental scarring in some (focal) glomeruli is diagnostic of Focal Segmental Glomerulosclerosis (FSGS). FSGS is associated with obesity, HIV, and heroin use, and often presents with nephrotic-range proteinuria and hypertension.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which vaccine is specifically recommended for children with nephrotic syndrome to prevent a common and serious infection?', 
'["Rotavirus vaccine", "Pneumococcal vaccine (PCV13 and PPSV23)", "Meningococcal B vaccine", "Human Papillomavirus (HPV) vaccine"]'::jsonb, 
1, 
'Because children with nephrotic syndrome are at high risk for spontaneous bacterial peritonitis caused by Streptococcus pneumoniae, they should receive both the conjugate (PCV13) and polysaccharide (PPSV23) pneumococcal vaccines once they are in remission.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 5-year-old boy with a history of nephrotic syndrome in remission is exposed to varicella (chickenpox) at school. He is currently taking 1 mg/kg/day of prednisone. What is the appropriate next step?', 
'["Give the Varicella vaccine immediately", "Administer Varicella-Zoster Immune Globulin (VZIG) within 96 hours", "Start oral acyclovir immediately as prophylaxis", "No action needed if he has no symptoms"]'::jsonb, 
1, 
'Immunocompromised children (including those on high-dose steroids for nephrotic syndrome) who are exposed to varicella should receive post-exposure prophylaxis with VZIG (or VariZIG) to prevent severe or disseminated infection. Live vaccines (like Varicella) are contraindicated while on high-dose steroids.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is an indication for a renal biopsy in a child presenting with nephrotic syndrome?', 
'["Age between 2 and 10 years", "Response to steroids within 2 weeks", "Presence of gross hematuria, hypertension, or low C3", "The presence of periorbital edema"]'::jsonb, 
2, 
'Most children aged 2-10 with nephrotic syndrome are presumed to have MCD and are started on steroids without a biopsy. Indications for biopsy include: age < 1 or > 10, steroid resistance, gross hematuria, significant hypertension, or persistently low complement (C3) levels.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 9-year-old child is diagnosed with PSGN. His parents are worried about his siblings. What is the risk of siblings developing PSGN if they have a streptococcal infection?', 
'["Nearly 100%", "Approximately 15-20%", "Less than 1%", "There is no increased risk"]'::jsonb, 
1, 
'While PSGN is not contagious itself, the "nephritogenic" strain of Streptococcus can spread among family members. Siblings have a significant risk (approx. 15-20%) of developing the disease if they contract the same strain.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the typical "latent period" between a streptococcal skin infection (impetigo) and the onset of PSGN?', 
'["1-3 days", "1-2 weeks", "3-6 weeks", "3 months"]'::jsonb, 
2, 
'The latent period for PSGN following a skin infection (impetigo) is typically longer (3-6 weeks) compared to the latent period following pharyngitis (1-3 weeks).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with acute PSGN has severe hypertension. Which of the following is a first-line medication to manage the fluid overload and hypertension?', 
'["Lisinopril", "Furosemide", "Spironolactone", "Hydrochlorothiazide"]'::jsonb, 
1, 
'Since the hypertension in PSGN is primarily due to fluid and salt retention (volume overload), loop diuretics like furosemide are the first-line treatment. ACE inhibitors (like lisinopril) are avoided in the acute phase due to the risk of hyperkalemia in the setting of decreased GFR.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'On renal biopsy of a patient with PSGN, what is the characteristic finding on electron microscopy?', 
'["Linear IgG deposits", "Subepithelial electron-dense \"humps\"", "Tram-track appearance of the GBM", "Foot process effacement"]'::jsonb, 
1, 
'Electron microscopy in PSGN shows large, subepithelial electron-dense "humps," which represent deposits of antigen-antibody complexes. Immunofluorescence shows a "starry sky" or "lumpy-bumpy" pattern of IgG and C3.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 4-year-old child with Minimal Change Disease has been on high-dose prednisone for 4 weeks. He has developed a "moon-face," a "buffalo hump," and abdominal striae. What is the term for this constellation of findings?', 
'["Addisonian crisis", "Iatrogenic Cushing syndrome", "Congenital adrenal hyperplasia", "Metabolic syndrome"]'::jsonb, 
1, 
'Prolonged high-dose corticosteroid use leads to iatrogenic Cushing syndrome, characterized by fat redistribution (moon face, buffalo hump, truncal obesity) and skin changes (striae, easy bruising).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 2-year-old child with nephrotic syndrome presents with periorbital edema that is worse in the morning but seems to "travel" to the ankles by late afternoon. What is the physiologic explanation for this?', 
'["Kidney function improves during the day", "The edema is gravity-dependent", "The child drinks more water in the evening", "It represents an allergic reaction that fades during the day"]'::jsonb, 
1, 
'Nephrotic edema is "pitting" and gravity-dependent. In the morning, after lying flat, it is most prominent in the periorbital region. As the child stands and moves during the day, gravity pulls the fluid down to the lower extremities (pretibial and pedal edema).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In the management of a child with Minimal Change Disease who relapses frequently, which "steroid-sparing" agent is often considered next?', 
'["Amoxicillin", "Cyclophosphamide or Calcineurin inhibitors (e.g., Cyclosporine)", "Growth hormone", "Intravenous immunoglobulin (IVIG)"]'::jsonb, 
1, 
'For children who are steroid-dependent or frequently relapse, alkylating agents (like cyclophosphamide) or calcineurin inhibitors are used to maintain remission and reduce the long-term side effects of chronic steroid use.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following Streptococcal antigens is most specifically associated with the development of PSGN?', 
'["M-protein", "Streptococcal pyrogenic exotoxin B (SpeB) / Nephritis-associated plasmin receptor (NAPlr)", "Streptolysin O", "Hyaluronidase"]'::jsonb, 
1, 
'SpeB and NAPlr are the key nephritogenic antigens currently thought to be responsible for the immune-complex formation in PSGN.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with PSGN is being monitored for recovery. Which finding is usually the LAST to disappear?', 
'["Edema", "Hypertension", "Low serum C3", "Microscopic hematuria"]'::jsonb, 
3, 
'In PSGN, edema and hypertension usually resolve within 1-2 weeks. C3 levels normalize by 6-8 weeks. Microscopic hematuria, however, can persist for 6 months to a year or even longer in some children before completely resolving.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 5-year-old boy with nephrotic syndrome has a serum albumin of 1.8 g/dL. He has significant scrotal and abdominal edema (ascites). What is the risk of using intravenous albumin followed by furosemide in this patient?', 
'["Acute renal failure", "Pulmonary edema due to rapid volume expansion", "Severe hyperkalemia", "Dehydration"]'::jsonb, 
1, 
'IV albumin is occasionally used in severe, symptomatic edema (e.g., respiratory distress from ascites), but it must be used cautiously. It rapidly increases intravascular volume, which can lead to acute heart failure and pulmonary edema if the kidneys cannot excrete the fluid quickly enough.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Membranous nephropathy is rare in young children but more common in adolescents. It is most frequently associated with which of the following infections?', 
'["Hepatitis B", "Group A Streptococcus", "Epstein-Barr Virus", "Varicella"]'::jsonb, 
0, 
'Membranous nephropathy in children is often "secondary" and is classically associated with Hepatitis B infection, systemic lupus erythematosus (SLE), or certain medications.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 3-year-old child with nephrotic syndrome presents with a sudden decrease in urine output and cool extremities. His hematocrit is 52% (elevated from 38%). What is the most likely cause?', 
'["Acute kidney injury (intrinsic)", "Intravascular volume depletion (Shock)", "Renal vein thrombosis", "Congestive heart failure"]'::jsonb, 
1, 
'Despite the generalized edema, nephrotic children often have *intravascular* volume depletion (low effective circulating volume) because the fluid is in the interstitial space (the "third space"). Hemoconcentration (high hematocrit) is a sign of this. They are at risk for pre-renal AKI and shock.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which finding on urinalysis is most characteristic of PSGN?', 
'["Waxy casts", "Dysmorphic red blood cells and RBC casts", "Eosinophiluria", "Heavy pyuria (> 50 WBC/hpf)"]'::jsonb, 
1, 
'RBC casts are the hallmark of "nephritic" syndromes (glomerulonephritis). They indicate that the bleeding is coming from the glomerulus. Dysmorphic RBCs (like acanthocytes) also support a glomerular source of hematuria.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In a patient with PSGN, the ASO (Anti-streptolysin O) titer may be normal in which of the following scenarios?', 
'["Following a pharyngeal infection", "Following a skin infection (impetigo)", "The ASO titer is never normal in PSGN", "In children under 2 years of age"]'::jsonb, 
1, 
'ASO titers are often normal following skin infections (impetigo) because the skin lipids neutralize the streptolysin O. In cases of impetigo-associated PSGN, the "Anti-DNAse B" or "Streptozyme" test is more sensitive.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'True or False: Antibiotic treatment of the initial streptococcal pharyngitis prevents the development of PSGN.', 
'["True", "False", "Only if given intravenously", "Only in children under age 5"]'::jsonb, 
1, 
'False. While treating strep throat prevents acute rheumatic fever, it does NOT prevent the development of Post-streptococcal glomerulonephritis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 5-year-old child with Minimal Change Disease relapses every time the prednisone dose is tapered below 0.5 mg/kg. How is this child classified?', 
'["Steroid-resistant", "Steroid-dependent", "Frequent relapser", "Non-responder"]'::jsonb, 
1, 
'Steroid-dependency is defined as a relapse occurring during the steroid taper or within two weeks of discontinuing steroids. Frequent relapsers have 2+ relapses in 6 months or 4+ in a year, but don''t necessarily require steroids to stay in remission.')

;
