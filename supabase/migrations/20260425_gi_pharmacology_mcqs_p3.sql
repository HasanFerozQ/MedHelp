-- Migration: Year 2 - GI Pharmacology MCQ Bank (PART 3: 141-210)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (IBD Pharmacology)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'gi-pharmacology' LIMIT 1;

    -- SECTION 5: INFLAMMATORY BOWEL DISEASE (141-175)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which drug is a 5-ASA (Aminosalicylate) derivative used primarily for maintaining remission in Ulcerative Colitis?', '["Azathioprine", "Mesalamine", "Infliximab", "Methotrexate"]', 1, 'Mesalamine (5-ASA) is the active anti-inflammatory moiety in the gut lumen.'),
    (v_topic_id, 'Sulfasalazine consists of 5-ASA linked to Sulfapyridine by what type of bond?', '["Peptide bond", "Azo bond", "Ester bond", "Glycosidic bond"]', 1, 'Bacteria in the colon break the azo bond to release the 5-ASA.'),
    (v_topic_id, 'Which component of Sulfasalazine is responsible for most of its side effects (e.g., rash, hemolytic anemia)?', '["5-ASA", "Sulfapyridine", "Both", "None"]', 1, 'Sulfapyridine is the "carrier" molecule and causes most of the systemic toxicity.'),
    (v_topic_id, 'Why is Mesalamine (5-ASA) formulated as delayed-release or pH-sensitive tablets?', '["To prevent stomach upset", "To ensure the drug reaches the distal small intestine or colon before being absorbed", "To increase potency", "To prevent liver metabolism"]', 1, 'Raw 5-ASA is absorbed in the upper GI tract; IBD is usually in the lower GI.'),
    (v_topic_id, 'A patient on Sulfasalazine develops a deficiency of which vitamin due to inhibited absorption?', '["Vitamin B12", "Folic Acid", "Vitamin D", "Vitamin K"]', 1, 'Sulfasalazine interferes with folate absorption; patients should take supplements.'),
    (v_topic_id, 'Which 5-ASA formulation consists of two 5-ASA molecules linked together?', '["Mesalamine", "Olsalazine", "Balsalazide", "Sulfasalazine"]', 1, 'Olsalazine is a "dimer" of 5-ASA.'),
    (v_topic_id, 'Which corticosteroid is used for IBD because it has a high first-pass effect, limiting systemic side effects?', '["Prednisone", "Hydrocortisone", "Budesonide", "Dexamethasone"]', 2, 'Budesonide acts locally in the ileum/colon and is then rapidly inactivated by the liver.'),
    (v_topic_id, 'What is the primary role of corticosteroids in the treatment of IBD?', '["Maintaining remission", "Inducing remission during acute flares", "Preventing colorectal cancer", "Treating infection"]', 1, 'Steroids are for short-term control of flares, not for long-term maintenance.'),
    (v_topic_id, 'Azathioprine and 6-Mercaptopurine are categorized as which type of drugs?', '["Biologics", "Thiopurine Immunomodulators", "Aminosalicylates", "Antibiotics"]', 1, 'They are purine analogs that inhibit T-cell proliferation.'),
    (v_topic_id, 'Which enzyme must be checked before starting Azathioprine to prevent severe bone marrow suppression?', '["G6PD", "Thiopurine Methyltransferase (TPMT)", "ALT/AST", "Amylase"]', 1, 'Low TPMT activity leads to toxic levels of 6-TGN metabolites.'),
    (v_topic_id, 'Infliximab is a monoclonal antibody that targets which cytokine?', '["IL-6", "TNF-alpha", "IL-1", "IL-12/23"]', 1, 'Anti-TNF agents are used for moderate-to-severe IBD.'),
    (v_topic_id, 'What is a major risk associated with Anti-TNF therapy (e.g., Infliximab, Adalimumab)?', '["Reactivation of latent Tuberculosis", "Hypothyroidism", "Renal failure", "Liver failure"]', 0, 'TNF is required for granuloma maintenance; blocking it allows TB to spread.'),
    (v_topic_id, 'Which biologic drug blocks the alpha-4-beta-7 integrin to prevent leukocyte migration specifically to the gut?', '["Infliximab", "Vedolizumab", "Ustekinumab", "Natalizumab"]', 1, 'Vedolizumab is gut-selective, which reduces systemic immunosuppression risk.'),
    (v_topic_id, 'Natalizumab carries a risk of which rare but fatal brain infection?', '["Meningitis", "Progressive Multifocal Leukoencephalopathy (PML)", "Encephalitis", "Brain abscess"]', 1, 'PML is caused by the JC virus in immunocompromised patients.'),
    (v_topic_id, 'Which biologic targets the p40 subunit of IL-12 and IL-23?', '["Adalimumab", "Ustekinumab", "Vedolizumab", "Golimumab"]', 1, 'Ustekinumab is used for Crohn''s and Ulcerative Colitis.'),
    (v_topic_id, 'Methotrexate is used in Crohn''s disease. What is its mechanism of action?', '["TNF block", "Dihydrofolate reductase inhibition", "Integrin block", "JAK inhibition"]', 1, 'It interferes with DNA synthesis and has anti-inflammatory properties.'),
    (v_topic_id, 'Which side effect is common with Methotrexate?', '["Nausea, liver toxicity, and bone marrow suppression", "Weight gain", "Hypertension", "Constipation"]', 0, 'Folate supplementation helps reduce these side effects.'),
    (v_topic_id, 'Which drug is a JAK inhibitor approved for Ulcerative Colitis?', '["Tofacitinib", "Infliximab", "Mesalamine", "Azathioprine"]', 0, 'JAK inhibitors are oral small molecules, not injectables.'),
    (v_topic_id, 'Cyclosporine is used in IBD for which specific scenario?', '["Mild UC", "Severe, steroid-refractory Ulcerative Colitis", "Maintenance of Crohn''s", "Fistulas"]', 1, 'It is a potent rescue therapy for severe UC flares.'),
    (v_topic_id, 'Side effect of Thiopurines (Azathioprine/6-MP) includes All EXCEPT:', '["Leukopenia", "Pancreatitis", "Increased risk of lymphoma", "Weight gain"]', 3, 'Weight gain is not a side effect; bone marrow and pancreas issues are.'),
    (v_topic_id, 'Antibiotics like Ciprofloxacin and Metronidazole are most commonly used in which IBD manifestation?', '["Mild UC", "Perianal Crohn''s disease and fistulas", "Ulcerative Proctitis", "Toxic megacolon only"]', 1, 'They treat associated infections and abscesses.'),
    (v_topic_id, 'What is the "Step-up" vs "Top-down" approach in IBD?', '["Using oral vs IV drugs", "Starting with mild drugs vs starting with Biologics immediately", "Using surgery first", "None"]', 1, 'Top-down therapy uses biologics early to prevent bowel damage.'),
    (v_topic_id, 'Which drug formulation is preferred for Ulcerative Proctitis (inflammation of the rectum)?', '["Oral tablets", "Suppositories or Enemas", "IV infusion", "Inhalation"]', 1, 'Local therapy provides high drug concentration at the site with minimal systemic absorption.'),
    (v_topic_id, 'Ustekinumab targets which part of the immune system?', '["B-cells", "T-cell trafficking", "IL-12 and IL-23 cytokines", "TNF-alpha"]', 2, 'It blocks the cytokines that drive the Th1 and Th17 response.'),
    (v_topic_id, 'Which drug is a Sphingosine-1-phosphate (S1P) receptor modulator for UC?', '["Ozanimod", "Tofacitinib", "Mesalamine", "Infliximab"]', 0, 'Ozanimod prevents lymphocytes from leaving lymph nodes.'),
    (v_topic_id, 'A patient on Infliximab develops a "loss of response" over time. What is the most likely cause?', '["Drug was absorbed", "Formation of Anti-Drug Antibodies (ADA)", "The disease was cured", "The dose was too high"]', 1, 'The immune system can neutralize biologic proteins over time.'),
    (v_topic_id, 'How can the risk of Anti-Drug Antibody formation be reduced?', '["Giving the drug more frequently", "Combining the biologic with an immunomodulator (e.g., Azathioprine)", "Giving the drug only during flares", "Switching to oral drugs"]', 1, 'Combination therapy is standard for high-risk patients.'),
    (v_topic_id, 'What is the "Anti-TNF induced lupus" syndrome?', '["A new autoimmune disease", "Drug-induced lupus with positive ANA/anti-dsDNA antibodies", "Skin cancer", "Liver failure"]', 1, 'A rare side effect where the body reacts to the anti-TNF agent.'),
    (v_topic_id, 'Which 5-ASA is a pro-drug where 5-ASA is linked to an inert polymer?', '["Sulfasalazine", "Balsalazide", "Olsalazine", "Pentasa"]', 1, 'Balsalazide uses 4-aminobenzoyl-beta-alanine as a carrier.'),
    (v_topic_id, 'Pentasa is a form of Mesalamine that works where?', '["Only the colon", "Entire GI tract from stomach to colon", "Only the rectum", "Only the esophagus"]', 1, 'It uses microgranules that release throughout the bowel.'),
    (v_topic_id, 'What is a major contraindication for the use of Live Vaccines in IBD patients?', '["They are on any medication", "They are on immunosuppressants or biologics", "They have ever had surgery", "They are over 50"]', 1, 'Immunosuppressed patients are at risk of disseminated infection from live vaccines.'),
    (v_topic_id, 'Which drug is used specifically for the treatment of "Pouchitis" after surgery for UC?', '["Azathioprine", "Antibiotics (Metronidazole/Cipro) and Probiotics (VSL#3)", "Mesalamine", "Steroids"]', 1, 'Pouchitis is often bacterial in origin.'),
    (v_topic_id, 'Side effect of Sulfasalazine in men?', '["Gynecomastia", "Reversible Oligospermia (low sperm count)", "Priapism", "Hirsutism"]', 1, 'This is reversible upon stopping the drug.'),
    (v_topic_id, 'Which immunomodulator is associated with "Nausea and Vomiting" in up to 15% of patients?', '["Azathioprine", "Infliximab", "Mesalamine", "Budesonide"]', 0, 'GI intolerance is a common reason for stopping thiopurines.'),
    (v_topic_id, 'Methotrexate is administered how frequently for IBD?', '["Daily", "Weekly", "Monthly", "Twice daily"]', 1, 'It is always a weekly dose.'),

    -- SECTION 6: IBD & ADVANCED TOPICS (176-210)
    (v_topic_id, 'The mechanism of Tofacitinib involves the inhibition of which signaling pathway?', '["NF-kappaB", "JAK-STAT", "mTOR", "MAP Kinase"]', 1, 'JAK inhibitors block the signaling of multiple pro-inflammatory cytokines.'),
    (v_topic_id, 'Which biologic is fully human, as opposed to Infliximab which is chimeric (mouse/human)?', '["Adalimumab", "Infliximab", "Rituximab", "Cetuximab"]', 0, 'Fully human antibodies (Adalimumab, Golimumab) generally have lower rates of antibody formation.'),
    (v_topic_id, 'What is the role of 5-ASA in Crohn''s disease?', '["Standard of care for all cases", "Limited efficacy; mainly used for mild, colonic Crohn''s", "First-line for severe Crohn''s", "Never used"]', 1, '5-ASA is much more effective in UC than in Crohn''s.'),
    (v_topic_id, 'Chronic use of Budesonide still carries a risk of which complication, despite high first-pass metabolism?', '["Cataracts and Osteoporosis", "Heart failure", "Liver failure", "Bladder cancer"]', 0, 'Some systemic absorption still occurs over long periods.'),
    (v_topic_id, 'Which drug is an S1P modulator that requires an EKG before starting due to the risk of bradycardia?', '["Ozanimod", "Tofacitinib", "Mesalamine", "Vedolizumab"]', 0, 'The first dose can slow the heart rate.'),
    (v_topic_id, 'Infliximab is given by which route?', '["Subcutaneous injection", "Intravenous infusion", "Oral", "Rectal enema"]', 1, 'Infliximab is always IV; Adalimumab is SubQ.'),
    (v_topic_id, 'What is the "Black Box Warning" for JAK inhibitors (Tofacitinib)?', '["Heart Failure", "Thrombosis (Blood clots), MACE, and Malignancy", "Kidney stones", "Lung fibrosis"]', 1, 'Especially at higher doses used for IBD.'),
    (v_topic_id, 'Patients on Thiopurines have an increased risk of which skin cancer?', '["Melanoma", "Non-melanoma skin cancer (Basal/Squamous cell)", "Sarcoma", "None"]', 1, 'Sun protection is advised.'),
    (v_topic_id, 'Which 5-ASA formulation is designed to release specifically in the ileum and right colon?', '["Asacol", "Rowasa", "Pentasa", "Balsalazide"]', 0, 'Asacol has a pH-dependent coating that dissolves at pH > 7.'),
    (v_topic_id, 'Which drug is a potent inhibitor of Inosine Monophosphate Dehydrogenase (IMPDH) used off-label for IBD?', '["Methotrexate", "Mycophenolate Mofetil", "Cyclosporine", "Azathioprine"]', 1, 'Sometimes used when thiopurines are not tolerated.'),
    (v_topic_id, 'The "Phoenix" phenomenon in IBD treatment refers to:', '["A sudden recovery", "A flare of disease after stopping a biologic", "Cancer growth", "None of the above"]', 1, 'Abruptly stopping biologics can cause severe rebound flares.'),
    (v_topic_id, 'Which biologic is a "Pegylated" anti-TNF agent?', '["Infliximab", "Certolizumab Pegol", "Adalimumab", "Golimumab"]', 1, 'Pegylation increases the half-life and eliminates the Fc portion (no placental transfer).'),
    (v_topic_id, 'Certolizumab is often preferred in which patient group?', '["Elderly", "Pregnant women", "Children", "Patients with liver disease"]', 1, 'Lack of placental transfer makes it safer during pregnancy.'),
    (v_topic_id, 'What is the role of surgery in Ulcerative Colitis?', '["Always avoided", "Curative (Total proctocolectomy)", "Only for Crohn''s", "Never curative"]', 1, 'Since UC is limited to the colon/rectum, removing them "cures" the disease.'),
    (v_topic_id, 'Why is surgery NOT curative in Crohn''s disease?', '["Crohn''s is too aggressive", "Crohn''s can affect any part of the GI tract from mouth to anus", "Crohn''s is a blood disorder", "None"]', 1, 'Crohn''s can recur anywhere in the bowel after surgery.'),
    (v_topic_id, 'Which drug is used to treat "Biliary Sludge" in patients on long-term TPN?', '["Mesalamine", "Ursodeoxycholic Acid", "Octreotide", "Metoclopramide"]', 1, 'It helps thin the bile.'),
    (v_topic_id, 'Side effect of Vedolizumab includes All EXCEPT:', '["Nasopharyngitis", "Headache", "Arthralgia", "PML (Progressive Multifocal Leukoencephalopathy)"]', 3, 'Unlike Natalizumab, Vedolizumab is gut-selective and does not cause PML.'),
    (v_topic_id, 'Which drug is an Anti-TNF agent given as a Subcutaneous injection every 2 weeks?', '["Infliximab", "Adalimumab", "Tofacitinib", "Mesalamine"]', 1, 'Adalimumab (Humira) is self-injected.'),
    (v_topic_id, 'What is the risk of "Thiopurine-induced Pancreatitis"?', '["It is dose-dependent", "It is an idiosyncratic (allergic) reaction that occurs early", "It only happens in children", "It is caused by alcohol"]', 1, 'It usually happens in the first 4 weeks and requires stopping the drug permanently.'),
    (v_topic_id, 'Which 5-ASA drug has the highest risk of interstitial nephritis (kidney damage)?', '["Mesalamine", "Sulfasalazine", "They all carry a small, equal risk", "None"]', 2, 'All 5-ASAs require regular monitoring of serum creatinine.'),
    (v_topic_id, 'What is "Mucosal Healing" in IBD?', '["The patient feels better", "The endoscopist sees no ulcers or inflammation", "The blood tests are normal", "The patient is on a diet"]', 1, 'This is the "Gold Standard" goal of modern IBD therapy.'),
    (v_topic_id, 'Which drug is used for refractory Crohn''s disease and is a "Chimeric" antibody against IL-12/23?', '["Ustekinumab", "Infliximab", "Vedolizumab", "None (Ustekinumab is human)"]', 3, 'Ustekinumab is a fully human antibody.'),
    (v_topic_id, 'The "Lémann Index" is used in Crohn''s to measure:', '["Pain", "Cumulative structural bowel damage", "Read counts", "Weight loss"]', 1, 'It tracks the progression of the disease over time.'),
    (v_topic_id, 'Which drug is an IL-23 specific (p19 subunit) inhibitor recently approved for IBD?', '["Risankizumab", "Ustekinumab", "Infliximab", "Tofacitinib"]', 0, 'Risankizumab and Mirikizumab are the newest p19 inhibitors.'),
    (v_topic_id, 'In severe UC, which test must be performed before starting Cyclosporine or Infliximab to rule out a viral infection?', '["Hepatitis C", "Cytomegalovirus (CMV) via biopsy", "HIV", "COVID-19"]', 1, 'CMV infection can mimic a severe UC flare and will worsen with immunosuppression.'),
    (v_topic_id, 'What is the role of Fecal Microbiota Transplant (FMT) in IBD?', '["Standard of care", "Experimental; showing promise in Ulcerative Colitis but not yet first-line", "First-line for Crohn''s", "Never used"]', 1, 'FMT is primarily for C. diff but is being studied for UC.'),
    (v_topic_id, 'Which IBD drug is associated with a risk of "Melanoma"?', '["Anti-TNF agents", "Thiopurines", "5-ASA", "Steroids"]', 0, 'Biologics have a slight association with melanoma.'),
    (v_topic_id, 'The mechanism of Methotrexate involves the inhibition of which enzyme in the context of IBD?', '["AICAR transformylase", "DHFR", "Both", "None"]', 2, 'AICAR transformylase inhibition leads to increased Adenosine, which is anti-inflammatory.'),
    (v_topic_id, 'Which drug is a steroid enema used for distal UC?', '["Prednisone", "Budesonide or Hydrocortisone enemas", "Dexamethasone", "Mesalamine"]', 1, 'Local steroid therapy.'),
    (v_topic_id, 'Which side effect is unique to Infliximab during the actual infusion?', '["Anaphylaxis or Infusion Reactions", "Constipation", "Insomnia", "Hair loss"]', 0, 'Since it is chimeric (contains mouse protein), it is more likely to trigger an allergic reaction.'),
    (v_topic_id, 'What is the "Window of Opportunity" in Crohn''s disease?', '["The time before surgery", "The early phase of disease before irreversible damage occurs", "When the patient is sleeping", "None"]', 1, 'Aggressive treatment during this window can change the disease course.'),
    (v_topic_id, 'Which drug class is generally avoided in IBD patients due to the risk of triggering a flare?', '["Acetaminophen", "NSAIDs (e.g., Ibuprofen)", "Antibiotics", "Statins"]', 1, 'NSAIDs can irritate the gut and cause a relapse of IBD.'),
    (v_topic_id, 'What is the "Dose-Escalation" strategy for biologics?', '["Decreasing the dose", "Increasing the dose or shortening the interval when a patient loses response", "Adding more drugs", "Stopping the drug"]', 1, 'Commonly done if blood levels of the drug are low.'),
    (v_topic_id, 'Which drug is a "Maintenance of remission" choice for a patient with Crohn''s who was induced with Infliximab?', '["Prednisone", "Infliximab (continue indefinitely)", "Antacids", "5-ASA"]', 1, 'Biologics are continued as long-term maintenance.'),
    (v_topic_id, 'In IBD, "Remission" is usually defined by a score called:', '["BMI", "CDAI (Crohn''s Disease Activity Index) or Mayo Score for UC", "GCS", "NYHA"]', 1, 'These scores track symptoms and lab findings.');

    RAISE NOTICE 'SUCCESS: GI Pharmacology MCQ Part 3 (141-210) registered.';
END $$;

COMMIT;
