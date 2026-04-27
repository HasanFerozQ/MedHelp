-- Migration: Systemic Pharmacology Cases Part 4 (31-40) - FIXED SCHEMA
-- Goal: Cover Antimicrobial and Chemotherapy Pharmacology
-- Sources: Lippincott, Katzung, Rang & Dale

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-pharmacology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 31 AND 40);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 31 AND 40;

    -- CASE 31: Beta-Lactam Antibiotics
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Uncomplicated UTI', 'A 24-year-old woman presents with burning on urination and frequency. She is diagnosed with an uncomplicated urinary tract infection (UTI) and prescribed Amoxicillin/Clavulanate.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of Amoxicillin?', '["Inhibition of bacterial protein synthesis at the 50S subunit", "Inhibition of DNA gyrase", "Inhibition of peptidoglycan cross-linking by binding to Penicillin-Binding Proteins (PBPs)", "Inhibition of folic acid synthesis"]', 2, 'Beta-lactams are bactericidal antibiotics that inhibit cell wall synthesis by covalently binding to PBPs (transpeptidases).'),
    (v_case_id, 'Why is Clavulanic acid combined with Amoxicillin?', '["To increase the oral bioavailability of Amoxicillin", "To protect Amoxicillin from degradation by bacterial beta-lactamases", "To provide synergistic inhibition of protein synthesis", "To decrease renal excretion of the drug"]', 1, 'Clavulanate is a beta-lactamase inhibitor. It has no intrinsic antibacterial activity but protects the beta-lactam ring of amoxicillin from destruction by bacterial enzymes.'),
    (v_case_id, 'Which generation of cephalosporins has the broadest spectrum of activity against Gram-negative bacteria, including Pseudomonas aeruginosa?', '["First generation (e.g., Cefazolin)", "Second generation (e.g., Cefuroxime)", "Third generation (e.g., Ceftriaxone) and Fourth generation (Cefepime)", "None of the cephalosporins cover Pseudomonas"]', 2, 'Ceftazidime (3rd gen) and Cefepime (4th gen) have excellent anti-pseudomonal coverage. Cefazolin (1st gen) is mostly for Gram-positives.'),
    (v_case_id, 'If a patient has a severe, anaphylactic allergy to penicillin, which monobactam antibiotic could safely be given for a Gram-negative infection?', '["Aztreonam", "Imipenem", "Ceftriaxone", "Vancomycin"]', 0, 'Aztreonam is a monobactam that only targets Gram-negative rods. It lacks the secondary ring, so there is no cross-reactivity with penicillin allergies.');

    -- CASE 32: Protein Synthesis Inhibitors
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Atypical Pneumonia', 'A 19-year-old college student presents with a dry, hacking cough and fatigue. Chest X-ray reveals diffuse interstitial infiltrates. She is diagnosed with Mycoplasma pneumoniae and is prescribed Azithromycin.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are beta-lactam antibiotics ineffective against Mycoplasma pneumoniae?', '["Mycoplasma produces robust beta-lactamases", "Mycoplasma lacks a peptidoglycan cell wall", "Mycoplasma has mutated its Penicillin-Binding Proteins", "Beta-lactams cannot penetrate the lung tissue"]', 1, 'Mycoplasma naturally lacks a cell wall, making all cell-wall inhibitors (penicillins, cephalosporins, vancomycin) inherently useless.'),
    (v_case_id, 'What is the mechanism of action of Macrolides like Azithromycin?', '["Binds to the 30S ribosomal subunit to cause misreading of mRNA", "Binds to the 50S ribosomal subunit to inhibit translocation", "Inhibits RNA polymerase", "Inhibits DNA topoisomerase"]', 1, 'Macrolides (Azithromycin, Clarithromycin, Erythromycin) bind the 50S subunit and prevent the translocation of the growing peptide chain.'),
    (v_case_id, 'Which of the following protein synthesis inhibitors binds to the 30S subunit and is contraindicated in children under 8 years old due to tooth discoloration?', '["Doxycycline", "Gentamicin", "Clindamycin", "Linezolid"]', 0, 'Tetracyclines (like Doxycycline) bind the 30S subunit. They readily chelate calcium and deposit in newly forming bones and teeth, causing permanent discoloration.'),
    (v_case_id, 'Aminoglycosides (e.g., Gentamicin) also bind the 30S subunit. What are their two most notorious toxicities?', '["Hepatotoxicity and Cardiotoxicity", "Nephrotoxicity and Ototoxicity", "Bone marrow suppression and Neuropathy", "Photosensitivity and Tendon rupture"]', 1, 'Aminoglycosides cause dose-dependent renal tubular necrosis (nephrotoxicity) and permanent damage to cranial nerve VIII (ototoxicity).');

    -- CASE 33: Fluoroquinolones and Antifolates
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Tendon Rupture Risk', 'A 65-year-old man on hemodialysis presents with a severe urinary tract infection. The culture grows a multidrug-resistant E. coli. He is prescribed Ciprofloxacin.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of Ciprofloxacin?', '["Inhibits bacterial RNA polymerase", "Inhibits bacterial DNA gyrase (Topoisomerase II) and Topoisomerase IV", "Inhibits dihydropteroate synthase", "Causes oxidative DNA damage"]', 1, 'Fluoroquinolones inhibit DNA gyrase (relieving supercoiling in Gram-negatives) and Topoisomerase IV (separating daughter chromosomes in Gram-positives).'),
    (v_case_id, 'The patient complains of sudden, severe pain in the back of his ankle while walking down stairs. What is the likely cause?', '["Deep vein thrombosis", "Achilles tendon rupture", "Gout attack", "Peripheral neuropathy"]', 1, 'Fluoroquinolones carry a black box warning for tendinopathy and tendon rupture, especially the Achilles tendon.'),
    (v_case_id, 'If the patient were treated with Trimethoprim-Sulfamethoxazole (TMP-SMX), what sequential pathway would be inhibited?', '["Cell wall cross-linking", "Protein synthesis via 50S and 30S", "Tetrahydrofolic acid (THF) synthesis", "DNA unwinding"]', 2, 'Sulfamethoxazole inhibits dihydropteroate synthase. Trimethoprim inhibits dihydrofolate reductase. Together, they provide a synergistic block of folic acid synthesis.'),
    (v_case_id, 'Which of the following is a classic adverse effect of Sulfonamides?', '["Red man syndrome", "Stevens-Johnson Syndrome (SJS)", "Gray baby syndrome", "Ototoxicity"]', 1, 'Sulfonamides are notorious for causing hypersensitivity reactions, ranging from mild rashes to life-threatening Stevens-Johnson Syndrome.');

    -- CASE 34: Antitubercular Therapy
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Active TB Management', 'A 45-year-old immigrant presents with a chronic cough, night sweats, and weight loss. Sputum AFB stain is positive. He is started on RIPE therapy.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of Isoniazid (INH)?', '["Inhibits RNA polymerase", "Inhibits the synthesis of mycolic acids", "Inhibits arabinosyl transferase", "Lowers intracellular pH"]', 1, 'INH is a prodrug activated by KatG. It specifically blocks the synthesis of mycolic acids, the waxy components of the mycobacterial cell wall.'),
    (v_case_id, 'To prevent the most common neurological side effect of Isoniazid, which supplement MUST be co-administered?', '["Vitamin B6 (Pyridoxine)", "Vitamin B12 (Cobalamin)", "Folic Acid", "Vitamin C"]', 0, 'INH structurally resembles B6 and increases its excretion, leading to peripheral neuropathy. Pyridoxine supplementation prevents this.'),
    (v_case_id, 'The patient notices his urine, sweat, and tears have turned a bright orange-red color. Which medication is responsible?', '["Isoniazid", "Pyrazinamide", "Ethambutol", "Rifampin"]', 3, 'Rifampin (an RNA polymerase inhibitor) causes a harmless red-orange discoloration of body fluids.'),
    (v_case_id, 'Which of the RIPE drugs is known to cause dose-dependent, reversible optic neuropathy?', '["Rifampin", "Isoniazid", "Pyrazinamide", "Ethambutol"]', 3, 'Ethambutol (inhibits arabinosyl transferase) causes optic neuritis. (Mnemonic: E for Eye).');

    -- CASE 35: Antifungals
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Cryptococcal Meningitis', 'A 32-year-old male with HIV/AIDS presents with a severe headache and neck stiffness. Lumbar puncture confirms Cryptococcal Meningitis. He is started on Amphotericin B and Flucytosine.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of Amphotericin B?', '["Inhibits squalene epoxidase", "Binds to ergosterol, forming pores in the fungal cell membrane", "Inhibits the synthesis of ergosterol", "Inhibits beta-glucan synthesis in the fungal cell wall"]', 1, 'Amphotericin B binds to ergosterol, forming pores in the fungal cell membrane. (Mnemonic: Ampho-TERICIN "tears" holes).'),
    (v_case_id, 'Amphotericin B is notoriously toxic. What is its most significant dose-limiting toxicity?', '["Hepatotoxicity", "Severe nephrotoxicity and electrolyte wasting", "Bone marrow suppression", "Ototoxicity"]', 1, 'It damages human kidney tubules, leading to severe renal failure and electrolyte wasting (hypokalemia/hypomagnesemia).'),
    (v_case_id, 'After induction therapy, the patient is transitioned to oral Fluconazole. What is the mechanism of action of Fluconazole?', '["Inhibit fungal cytochrome P450 14-alpha-demethylase", "Bind directly to ergosterol", "Inhibit fungal DNA synthesis", "Inhibit microtubules"]', 0, 'Azoles block the enzyme that converts lanosterol to ergosterol. Because this enzyme is a CYP450, azoles frequently cause drug interactions.'),
    (v_case_id, 'Which antifungal class targets the fungal cell wall (beta-glucan synthesis) rather than the cell membrane?', '["Echinocandins (e.g., Caspofungin)", "Polyenes (e.g., Nystatin)", "Allylamines (e.g., Terbinafine)", "Azoles (e.g., Itraconazole)"]', 0, 'Echinocandins inhibit beta-1,3-D-glucan synthase, disrupting the cell wall of Aspergillus and Candida.');

    -- CASE 36: Antivirals
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Herpes Zoster Flare', 'A 60-year-old woman presents with a painful, vesicular rash in a dermatomal distribution. She is diagnosed with Shingles and prescribed Acyclovir.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Acyclovir become activated to effectively inhibit viral DNA polymerase?', '["It is phosphorylated by human kinases only", "It is activated by reverse transcriptase", "It requires initial phosphorylation by the viral Thymidine Kinase", "It is cleaved by viral protease"]', 2, 'Acyclovir is highly selective because it is only phosphorylated in cells infected with the virus containing the specific viral Thymidine Kinase.'),
    (v_case_id, 'Which antiviral is the drug of choice for severe Cytomegalovirus (CMV) infections?', '["Oseltamivir", "Ganciclovir", "Amantadine", "Ribavirin"]', 1, 'CMV lacks the thymidine kinase that activates acyclovir. Ganciclovir is phosphorylated by a specific CMV viral kinase.'),
    (v_case_id, 'A patient with HIV is started on a HAART regimen including Dolutegravir. What class of drug is Dolutegravir?', '["Nucleoside Reverse Transcriptase Inhibitor (NRTI)", "Non-Nucleoside Reverse Transcriptase Inhibitor (NNRTI)", "Protease Inhibitor", "Integrase Strand Transfer Inhibitor (INSTI)"]', 3, 'Integrase inhibitors (-tegravir) prevent viral DNA from integrating into the host cell chromosome.'),
    (v_case_id, 'Which class of HIV medications is associated with a metabolic syndrome characterized by lipodystrophy?', '["NRTIs", "NNRTIs", "Protease Inhibitors (-navir)", "Fusion Inhibitors"]', 2, 'Protease inhibitors are notorious for causing dyslipidemia, insulin resistance, and fat redistribution.');

    -- CASE 37: Anticancer - Alkylating Agents
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Hemorrhagic Cystitis', 'A 45-year-old woman is undergoing chemotherapy including Cyclophosphamide. She presents with painful urination and gross blood in her urine.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of Cyclophosphamide?', '["It cross-links DNA strands by adding an alkyl group", "It intercalates between DNA base pairs", "It inhibits thymidylate synthase", "It inhibits microtubules"]', 0, 'Alkylating agents form covalent bonds with DNA, causing cross-linking that prevents DNA replication.'),
    (v_case_id, 'What toxic metabolite of Cyclophosphamide accumulates in the bladder to cause hemorrhagic cystitis?', '["Formaldehyde", "Acrolein", "NAPQI", "Oxalic acid"]', 1, 'Cyclophosphamide is metabolized into acrolein, which is highly toxic to the urothelium of the bladder.'),
    (v_case_id, 'Which protective agent should be administered alongside Cyclophosphamide to prevent this toxicity?', '["Leucovorin", "Dexrazoxane", "Mesna", "Amifostine"]', 2, 'Mesna supplies a free thiol group that binds to and inactivates acrolein in the urine.'),
    (v_case_id, 'Another alkylating-like agent, Cisplatin, is famous for causing which severe adverse effects?', '["Pulmonary fibrosis", "Cardiotoxicity", "Severe nephrotoxicity and ototoxicity", "Hemorrhagic cystitis"]', 2, 'Platinum compounds are highly effective but are heavily nephrotoxic and ototoxic.');

    -- CASE 38: Anticancer - Antimetabolites
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Methotrexate vs 5-FU', 'A young child with ALL is receiving Methotrexate. An older man with colorectal cancer is receiving 5-Fluorouracil.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the molecular target of Methotrexate?', '["Thymidylate synthase", "Dihydrofolate reductase (DHFR)", "DNA polymerase", "Ribonucleotide reductase"]', 1, 'Methotrexate is a folic acid analogue that competitively inhibits DHFR, preventing the formation of active tetrahydrofolate.'),
    (v_case_id, 'If a patient receives a potentially lethal dose of Methotrexate, which "rescue" agent is administered?', '["Leucovorin (Folinic acid)", "Vitamin B12", "Mesna", "Dexrazoxane"]', 0, 'Leucovorin is a reduced form of folate that does not require DHFR to participate in DNA synthesis. It rescues normal cells.'),
    (v_case_id, 'What is the molecular target of 5-Fluorouracil (5-FU)?', '["Dihydrofolate reductase", "Thymidylate synthase", "DNA gyrase", "Topoisomerase II"]', 1, '5-FU is a pyrimidine analogue that permanently inhibits thymidylate synthase, causing "thymineless death."'),
    (v_case_id, 'Interestingly, Leucovorin is often given alongside 5-FU. In this context, what is its purpose?', '["To rescue normal cells from 5-FU toxicity", "To prevent nephrotoxicity", "To enhance the binding of 5-FU to thymidylate synthase", "To reverse the effects of 5-FU"]', 2, 'Leucovorin ENHANCES the toxicity of 5-FU by strengthening the covalent bond between 5-FU and thymidylate synthase.');

    -- CASE 39: Anticancer - Microtubule Inhibitors
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Vincristine vs Paclitaxel', 'A patient with Hodgkin''s lymphoma is receiving Vincristine. Another patient with ovarian cancer is receiving Paclitaxel.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of the Vinca alkaloids?', '["They bind to beta-tubulin and prevent polymerization into microtubules", "They bind to microtubules and prevent their depolymerization", "They cross-link DNA", "They inhibit topoisomerase"]', 0, 'Vinca alkaloids halt mitosis in M phase by preventing the assembly of the mitotic spindle.'),
    (v_case_id, 'What is the mechanism of action of the Taxanes (Paclitaxel)?', '["They prevent microtubule assembly", "They hyper-stabilize polymerized microtubules so they cannot break down", "They act as antimetabolites", "They intercalate into DNA"]', 1, 'Taxanes freeze the mitotic spindle in a polymerized state, preventing chromosome separation.'),
    (v_case_id, 'What is the classic, dose-limiting toxicity of Vincristine?', '["Bone marrow suppression", "Cardiomyopathy", "Peripheral sensory and motor neuropathy", "Pulmonary fibrosis"]', 2, 'Microtubules are essential for axonal transport. Vincristine is highly neurotoxic but causes very little bone marrow suppression.'),
    (v_case_id, 'Which drug class generation of free radicals causes dose-dependent dilated cardiomyopathy?', '["Anthracyclines (e.g., Doxorubicin)", "Platinum agents", "Bleomycin", "Vinca alkaloids"]', 0, 'Doxorubicin generation of free radicals destroys cardiac muscle, making heart failure its primary dose-limiting toxicity.');

    -- CASE 40: Immunosuppressants
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Post-Transplant Management', 'A kidney transplant recipient on Cyclosporine and Mycophenolate Mofetil presents with new-onset hypertension and declining renal function.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of Cyclosporine?', '["Inhibits mTOR", "Inhibits inosine monophosphate dehydrogenase", "Binds cyclophilin to inhibit calcineurin, preventing IL-2 transcription", "Monoclonal antibody against the IL-2 receptor"]', 2, 'Cyclosporine inhibits calcineurin, a phosphatase required to activate NFAT, which is necessary for the transcription of IL-2.'),
    (v_case_id, 'What is the major dose-limiting toxicity of both Cyclosporine and Tacrolimus?', '["Bone marrow suppression", "Severe nephrotoxicity", "Hemorrhagic cystitis", "Gingival hyperplasia"]', 1, 'Both cause significant nephrotoxicity via renal vasoconstriction.'),
    (v_case_id, 'How does Mycophenolate Mofetil suppress the immune system?', '["It blocks the IL-2 receptor", "It inhibits calcineurin", "It reversibly inhibits IMP dehydrogenase, preventing de novo purine synthesis", "It cross-links DNA"]', 2, 'Lymphocytes rely entirely on de novo purine synthesis. Mycophenolate specifically starves lymphocytes of purines.'),
    (v_case_id, 'If the patient is switched to Sirolimus (Rapamycin) to avoid nephrotoxicity, what is its mechanism?', '["Calcineurin inhibitor", "Inhibitor of mTOR, preventing the cellular response to IL-2", "Purine synthesis inhibitor", "Corticosteroid receptor agonist"]', 1, 'Sirolimus blocks mTOR. Unlike calcineurin inhibitors that stop production of IL-2, Sirolimus stops the T-cell from responding to it.');

    RAISE NOTICE 'SUCCESS: Systemic Pharmacology Cases Part 4 (31-40) registered with correct schema.';
END $$;

COMMIT;
