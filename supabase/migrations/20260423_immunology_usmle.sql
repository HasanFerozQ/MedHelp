-- Migration: Immunology Curriculum (70 High-Yield Blocks)
-- Category: USMLE Step 1
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Create or Get Topic for Immunology
    INSERT INTO topics (semester_id, title, slug, "order", usmle_step)
    VALUES (1, 'Immunology', 'immunology', 10, 1)
    ON CONFLICT (slug) DO UPDATE 
    SET usmle_step = 1, semester_id = 1, title = EXCLUDED.title
    RETURNING id INTO v_topic_id;

    -- 2. Clear existing data for this topic to ensure clean migration
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    -- 3. Populate 70 Blocks (Case Studies)

    -- CASE 1: CGD
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 1: Recurrent Infections', 'A 4-year-old boy has recurrent skin abscesses, pneumonia, and osteomyelitis caused by catalase-positive organisms. Neutrophil count is normal. Nitroblue tetrazolium test is negative.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Leukocyte adhesion deficiency type 1", "Chronic granulomatous disease", "Chediak-Higashi syndrome", "Severe combined immunodeficiency", "Bruton''s agammaglobulinemia"]'::jsonb, 1, 'Chronic granulomatous disease (CGD) involves defective NADPH oxidase, leading to impaired respiratory burst and susceptibility to catalase-positive organisms.'),
    (v_case_id, 'What is the underlying mechanism?', '["Failure of phagolysosome fusion", "Defective NADPH oxidase and impaired respiratory burst", "Absence of CD18 integrin", "Deficiency of adenosine deaminase", "Failure of B-cell maturation"]'::jsonb, 1, 'NADPH oxidase deficiency prevents neutrophils from creating superoxide radicals, which are essential for killing catalase-positive bacteria.'),
    (v_case_id, 'Which organisms are classically associated?', '["Catalase-negative organisms only", "Encapsulated viruses", "Catalase-positive bacteria and fungi", "Acid-fast bacilli only", "Protozoa only"]'::jsonb, 2, 'Catalase-positive organisms (e.g., S. aureus, Aspergillus, Serratia) can neutralize the small amount of H2O2 they produce, requiring a host respiratory burst for clearance.');

    -- CASE 2: LAD
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 2: Delayed Cord Separation', 'A newborn has delayed separation of the umbilical cord, recurrent bacterial infections, marked neutrophilia, and absent pus formation.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Chediak-Higashi syndrome", "Leukocyte adhesion deficiency", "Job syndrome", "Bruton''s agammaglobulinemia", "DiGeorge syndrome"]'::jsonb, 1, 'Leukocyte adhesion deficiency (LAD) type 1 is characterized by delayed umbilical cord separation and absent pus formation despite high blood neutrophil counts.'),
    (v_case_id, 'Which molecule is deficient?', '["CD3", "CD18", "CD40L", "MHC II", "IgA"]'::jsonb, 1, 'LAD type 1 is caused by a defect in LFA-1 integrin (CD18), which is necessary for neutrophils to adhere to vascular endothelium and migrate into tissues.'),
    (v_case_id, 'Why is there no pus?', '["Neutrophils cannot produce ROS", "Neutrophils cannot adhere and migrate into tissues", "B cells are absent", "Macrophages cannot present antigen", "Complement is absent"]'::jsonb, 1, 'Pus is composed of accumulated neutrophils and dead tissue. Without adhesion and diapedesis, neutrophils cannot reach the site of infection.');

    -- CASE 3: Bruton's
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 3: Recurrent Sinopulmonary Infections', 'A young child has recurrent sinopulmonary infections beginning after 6 months of age. Labs show very low levels of all immunoglobulin classes and absent mature B cells.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Common variable immunodeficiency", "Selective IgA deficiency", "Bruton''s agammaglobulinemia", "Hyper-IgM syndrome", "Wiskott-Aldrich syndrome"]'::jsonb, 2, 'X-linked agammaglobulinemia (Bruton''s) involves a failure of B-cell maturation, leading to pan-hypogammaglobulinemia and absent B cells.'),
    (v_case_id, 'What is the underlying defect?', '["BTK mutation causing failed B-cell maturation", "CD40L deficiency on T cells", "WAS gene mutation", "Defective thymic development", "Terminal complement deficiency"]'::jsonb, 0, 'A mutation in Bruton tyrosine kinase (BTK) prevents pre-B cells from maturing into mature B cells.'),
    (v_case_id, 'Why do symptoms begin after 6 months?', '["T-cell immunity fails at 6 months", "Maternal IgG initially provides protection", "IgM does not cross placenta", "IgA becomes the dominant antibody then", "Complement becomes deficient later"]'::jsonb, 1, 'Maternal IgG crosses the placenta and provides passive immunity for the first few months of life.');

    -- CASE 4: Selective IgA
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 4: Mucosal Immunity', 'A child has recurrent respiratory and gastrointestinal infections. Labs show low IgA, but normal IgG and IgM.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Common variable immunodeficiency", "Selective IgA deficiency", "Bruton''s agammaglobulinemia", "SCID", "DiGeorge syndrome"]'::jsonb, 1, 'Selective IgA deficiency is the most common primary immunodeficiency and is characterized by isolated low IgA.'),
    (v_case_id, 'What additional risk is increased in this patient?', '["Neisseria meningitidis sepsis", "Anaphylactic transfusion reaction", "Disseminated fungal infections", "Chronic granuloma formation", "Loss of delayed hypersensitivity"]'::jsonb, 1, 'Patients with selective IgA deficiency can develop anti-IgA antibodies and are at risk for anaphylaxis when given blood products containing IgA.'),
    (v_case_id, 'What is the mechanism of the transfusion reaction?', '["Anti-IgA antibodies recognize donor IgA", "IgE against donor RBC antigens", "Type II cytotoxicity against platelets", "Complement consumption", "CD8 T-cell attack on donor leukocytes"]'::jsonb, 0, 'Preformed IgE or IgG antibodies against IgA react with the IgA in the donor blood product.');

    -- CASE 5: SCID
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 5: Severe Infections', 'An infant has chronic diarrhea, thrush, recurrent viral and bacterial infections, and failure to thrive. Flow cytometry shows markedly reduced T cells and B-cell dysfunction.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["SCID", "DiGeorge syndrome", "Ataxia-telangiectasia", "Hyper-IgM syndrome", "Bruton''s agammaglobulinemia"]'::jsonb, 0, 'Severe combined immunodeficiency (SCID) presents with both T-cell and B-cell dysfunction, leading to susceptibility to all types of infections.'),
    (v_case_id, 'Which mechanism can cause this disorder?', '["BTK mutation", "ADA deficiency", "Lack of CD18", "IL-5 deficiency", "Factor D deficiency"]'::jsonb, 1, 'Adenosine deaminase (ADA) deficiency is a common autosomal recessive cause of SCID, leading to toxic accumulation of dATP in lymphocytes.'),
    (v_case_id, 'What treatment is definitive?', '["IVIG only", "Corticosteroids", "Bone marrow transplantation", "Thymectomy", "Splenectomy"]'::jsonb, 2, 'Hematopoietic stem cell transplantation (HSCT) is required to restore immune function in SCID patients.');

    -- CASE 6: DiGeorge
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 6: Hypocalcemia and Heart Defects', 'A newborn has congenital heart defects, hypocalcemia, and recurrent viral/fungal infections. Chest x-ray shows absent thymic shadow.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["DiGeorge syndrome", "SCID", "Bruton''s agammaglobulinemia", "Job syndrome", "Common variable immunodeficiency"]'::jsonb, 0, 'DiGeorge syndrome (22q11.2 deletion) involves failure of the 3rd and 4th pharyngeal pouches to develop.'),
    (v_case_id, 'What embryologic structure failed to develop properly?', '["First pharyngeal pouch", "Second pharyngeal pouch", "Third and fourth pharyngeal pouches", "Neural crest migration into limb buds", "Dorsal mesentery"]'::jsonb, 2, 'The 3rd and 4th pharyngeal pouches give rise to the thymus and parathyroid glands.'),
    (v_case_id, 'What immune defect predominates?', '["B-cell deficiency", "T-cell deficiency", "Complement deficiency", "Neutrophil adhesion defect", "Phagolysosome fusion defect"]'::jsonb, 1, 'Thymic aplasia leads to a profound deficiency in mature T cells.');

    -- CASE 7: WAS
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 7: Eczema and Thrombocytopenia', 'A boy has eczema, recurrent infections, and thrombocytopenia. Platelets are small.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Wiskott-Aldrich syndrome", "Chediak-Higashi syndrome", "Job syndrome", "Selective IgA deficiency", "Hyper-IgM syndrome"]'::jsonb, 0, 'Wiskott-Aldrich syndrome is characterized by the triad of eczema, thrombocytopenia (small platelets), and recurrent infections.'),
    (v_case_id, 'The defective protein normally functions in:', '["B-cell receptor recombination", "Cytoskeletal reorganization in immune cells", "Oxidative burst", "MHC I expression", "Complement activation"]'::jsonb, 1, 'The WASP protein is involved in actin cytoskeleton remodeling, which is critical for immune cell migration and signaling.'),
    (v_case_id, 'Typical immunoglobulin pattern?', '["Low IgE, high IgA", "High IgM only", "Increased IgA and IgE, low IgM", "Low all immunoglobulins", "Isolated low IgA"]'::jsonb, 2, 'Wiskott-Aldrich typically presents with elevated IgA and IgE, but low IgM.');

    -- CASE 8: Hyper-IgM
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 8: Elevated IgM', 'A young boy has recurrent pyogenic infections with normal B-cell numbers but elevated or normal IgM and low IgG, IgA, and IgE.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Hyper-IgM syndrome", "Bruton''s agammaglobulinemia", "CVID", "Selective IgA deficiency", "DiGeorge syndrome"]'::jsonb, 0, 'Hyper-IgM syndrome involves a defect in class-switch recombination.'),
    (v_case_id, 'What is the key mechanism?', '["Failure of VDJ recombination", "Defective class switching due to CD40L deficiency", "Defective thymic epithelium", "Deficient NADPH oxidase", "Absence of MHC I"]'::jsonb, 1, 'X-linked hyper-IgM is most commonly due to a defect in CD40L on T cells, preventing B cells from switching from IgM to other classes.'),
    (v_case_id, 'Which opportunistic infection may also occur?', '["Aspergillus fumigatus", "Pneumocystis jirovecii", "Neisseria gonorrhoeae", "Histoplasma only in adults", "Enterobius vermicularis"]'::jsonb, 1, 'CD40L deficiency also impairs T-cell mediated macrophage activation, increasing susceptibility to Pneumocystis jirovecii.');

    -- CASE 9: Job
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 9: Coarse Facies', 'A child has recurrent abscesses, coarse facies, eczema, and retained primary teeth. Labs show high IgE and eosinophilia.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Wiskott-Aldrich syndrome", "Job syndrome", "Hyper-IgM syndrome", "Ataxia-telangiectasia", "LAD"]'::jsonb, 1, 'Job syndrome (Autosomal dominant hyper-IgE syndrome) is characterized by "FATED" features: Facies (coarse), Abscesses (cold), Teeth (retained), IgE (high), and Dermatologic (eczema).'),
    (v_case_id, 'What is the underlying defect?', '["Defective Th17 differentiation", "Defective BTK signaling", "Loss of perforin", "Absent complement C5-C9", "MHC II deficiency"]'::jsonb, 0, 'Job syndrome is typically due to a STAT3 mutation, leading to impaired Th17 differentiation and neutrophil recruitment.'),
    (v_case_id, 'Which finding helps distinguish it from CGD?', '["High neutrophil count", "Abnormal oxidative burst testing", "Cold abscesses with high IgE", "Delayed cord separation", "Absent B cells"]'::jsonb, 2, 'Job syndrome features "cold" (non-inflamed) staphylococcal abscesses and extremely high IgE levels.');

    -- CASE 10: Chediak
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 10: Albinism and Giant Granules', 'A child has oculocutaneous albinism, peripheral neuropathy, recurrent pyogenic infections, and giant granules in neutrophils.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Chediak-Higashi syndrome", "Wiskott-Aldrich syndrome", "CGD", "LAD", "DiGeorge syndrome"]'::jsonb, 0, 'Chediak-Higashi syndrome involves defective lysosomal trafficking.'),
    (v_case_id, 'Defect involves:', '["Phagocyte adhesion", "Lysosomal trafficking and phagolysosome formation", "T-cell receptor signaling", "Immunoglobulin class switching", "Complement factor B"]'::jsonb, 1, 'A mutation in the LYST gene causes failure of phagosome-lysosome fusion.'),
    (v_case_id, 'Giant granules result from abnormal:', '["Mitochondrial fusion", "Lysosome trafficking", "Nuclear segmentation", "Complement coating", "Platelet aggregation"]'::jsonb, 1, 'Failure of microtubule-mediated trafficking leads to the fusion of primary granules into giant inclusions.');

    -- CASE 11: C5-C9
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 11: Recurrent Meningitis', 'A teenager has recurrent episodes of meningococcal meningitis.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which immune deficiency is most likely?', '["C1 esterase inhibitor deficiency", "C3 deficiency", "C5-C9 deficiency", "IgA deficiency", "MPO deficiency"]'::jsonb, 2, 'Terminal complement (C5-C9) deficiency specifically increases risk for disseminated Neisseria infections.'),
    (v_case_id, 'Why does this predispose to Neisseria?', '["Loss of opsonization", "Defective membrane attack complex formation", "Defective chemotaxis", "Reduced histamine release", "Decreased IgE"]'::jsonb, 1, 'Neisseria species are uniquely susceptible to lysis by the membrane attack complex (MAC).'),
    (v_case_id, 'Which process is directly impaired?', '["Opsonization of bacteria", "Lysis of gram-negative bacteria", "Antigen presentation", "Somatic hypermutation", "Diapedesis"]'::jsonb, 1, 'Without the MAC, the immune system cannot effectively lyse gram-negative bacteria.');

    -- CASE 12: C3
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 12: Encapsulated Organisms', 'A child has severe recurrent pyogenic infections with encapsulated organisms. Labs show low C3.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is this patient especially vulnerable to encapsulated bacteria?', '["Encapsulated bacteria resist phagocytosis unless opsonized", "They require T-cell killing", "They are eliminated by IgE-mediated eosinophils", "They avoid antibody production", "They only activate the alternative pathway"]'::jsonb, 0, 'Encapsulated bacteria like S. pneumoniae require opsonization (C3b, IgG) for efficient phagocytosis.'),
    (v_case_id, 'The most important complement function affected is:', '["MAC formation only", "Opsonization", "Histamine release", "ADCC", "MHC loading"]'::jsonb, 1, 'C3 is the central point of all complement pathways and C3b is the primary opsonin.'),
    (v_case_id, 'Which fragment is a major opsonin?', '["C2a", "C3b", "C4a", "C5a", "C9"]'::jsonb, 1, 'C3b acts as an opsonin by binding to bacteria and being recognized by CR1 receptors on phagocytes.');

    -- CASE 13: Hereditary Angioedema
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 13: Facial Swelling', 'A man has recurrent episodes of facial swelling and abdominal pain without urticaria. Symptoms worsen after stress.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Type I hypersensitivity", "Hereditary angioedema", "Serum sickness", "Contact dermatitis", "CVID"]'::jsonb, 1, 'Hereditary angioedema is characterized by non-pruritic swelling and absence of urticaria.'),
    (v_case_id, 'Underlying defect?', '["Lack of C1 esterase inhibitor", "Lack of C3", "Excess IgE", "Mast cell deficiency", "CD40L mutation"]'::jsonb, 0, 'Deficiency in C1 esterase inhibitor leads to uncontrolled activation of C1 and the kallikrein-kinin system.'),
    (v_case_id, 'Mediator responsible for edema?', '["Histamine only", "Bradykinin", "Prostaglandin E2 only", "TNF-alpha", "Interferon-gamma"]'::jsonb, 1, 'Unregulated kallikrein leads to excessive bradykinin, which causes vascular permeability and edema.');

    -- CASE 14: Type I
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 14: Peanut Allergy', 'A 19-year-old develops wheezing, urticaria, and hypotension minutes after eating peanuts.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of hypersensitivity is this?', '["Type I", "Type II", "Type III", "Type IV", "Autoimmune cytotoxicity"]'::jsonb, 0, 'Type I hypersensitivity is immediate, IgE-mediated, and involves mast cell degranulation.'),
    (v_case_id, 'Which antibody mediates this reaction?', '["IgA", "IgG", "IgM", "IgE", "IgD"]'::jsonb, 3, 'IgE is the primary antibody involved in type I hypersensitivity.'),
    (v_case_id, 'What is the immediate mechanism?', '["Immune complex deposition", "T-cell mediated macrophage activation", "Antigen cross-linking of IgE on mast cells", "IgG-mediated opsonization", "Complement-mediated hemolysis"]'::jsonb, 2, 'Antigen cross-linking of IgE molecules on mast cell surfaces triggers degranulation.');

    -- CASE 15: Pollen
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 15: Seasonal Allergies', 'A patient with seasonal allergies develops sneezing and rhinorrhea when exposed to pollen.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which cytokine promotes class switching to the main antibody involved?', '["IL-2", "IL-4", "IFN-gamma", "IL-17", "TGF-beta only"]'::jsonb, 1, 'IL-4 stimulates B-cell class switching to IgE.'),
    (v_case_id, 'Which cells are central to late-phase allergic inflammation?', '["Basophils only", "Eosinophils", "Neutrophils", "Plasma cells only", "NK cells"]'::jsonb, 1, 'Eosinophils are recruited during the late phase (hours later) by IL-5.'),
    (v_case_id, 'Which mediator from mast cells causes immediate vasodilation and increased vascular permeability?', '["Histamine", "IL-2", "IFN-alpha", "C3b", "Bradykinin from mast cells"]'::jsonb, 0, 'Histamine is the primary preformed mediator in mast cell granules.');

    -- CASE 16: Penicillin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 16: Drug-Induced Hemolysis', 'A child develops hemolytic anemia after receiving penicillin. Direct Coombs test is positive.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 1, 'Type II hypersensitivity involves antibodies binding to antigens on cell surfaces.'),
    (v_case_id, 'Mechanism?', '["IgE-mediated mast cell degranulation", "Antibody-mediated destruction of cells", "Immune complex deposition in tissues", "Delayed T-cell reaction", "Granulomatous inflammation"]'::jsonb, 1, 'Antibodies bind to cells (or drugs on cells) and trigger destruction via complement or phagocytosis.'),
    (v_case_id, 'Which antibodies are usually involved in type II reactions?', '["IgA and IgE", "IgG or IgM", "IgD only", "Secretory IgA only", "No antibodies involved"]'::jsonb, 1, 'IgG and IgM are the primary mediators of type II hypersensitivity.');

    -- CASE 17: Rh
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 17: Erythroblastosis Fetalis', 'A newborn develops jaundice and anemia. The mother is Rh-negative and previously had a pregnancy with an Rh-positive fetus.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism?', '["Maternal IgM crosses placenta and lyses fetal RBCs", "Maternal IgG crosses placenta and causes hemolysis", "Fetal IgE activates mast cells", "Maternal T cells cross placenta", "C1 esterase inhibitor deficiency"]'::jsonb, 1, 'Maternal IgG (anti-D) crosses the placenta and destroys fetal Rh+ erythrocytes.'),
    (v_case_id, 'Which hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "Type V only"]'::jsonb, 1, 'This is a classic example of type II hypersensitivity.'),
    (v_case_id, 'Prevention is with:', '["Maternal anti-D immune globulin", "Fetal exchange of IgM", "Maternal corticosteroids only", "C5 inhibitor", "Live vaccine"]'::jsonb, 0, 'Anti-D (RhoGAM) given to the mother at 28 weeks and after delivery prevents sensitization.');

    -- CASE 18: Goodpasture
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 18: Hematuria and Hemoptysis', 'A patient develops hematuria and hemoptysis. Immunofluorescence shows linear IgG deposition along the basement membrane.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Poststreptococcal glomerulonephritis", "Goodpasture syndrome", "Polyarteritis nodosa", "SLE nephritis", "IgA nephropathy"]'::jsonb, 1, 'Goodpasture syndrome involves antibodies against the glomerular basement membrane (GBM).'),
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 1, 'Anti-GBM antibodies represent type II hypersensitivity.'),
    (v_case_id, 'Target antigen is in:', '["Mesangial matrix", "Type IV collagen in basement membranes", "DNA-histone complex", "Myeloperoxidase", "Smooth muscle"]'::jsonb, 1, 'The target is the alpha-3 chain of type IV collagen.');

    -- CASE 19: Graves
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 19: Hyperthyroidism', 'A woman with Graves disease has weight loss, heat intolerance, and exophthalmos.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Pathogenesis involves:', '["Destructive anti-thyroid antibodies only", "Stimulating IgG autoantibodies to TSH receptor", "IgM-mediated thyroid lysis", "T-cell destruction only", "Immune complex deposition"]'::jsonb, 1, 'Thyroid-stimulating immunoglobulin (TSI) mimics TSH and stimulates the receptor.'),
    (v_case_id, 'This is best categorized as:', '["Type II hypersensitivity with receptor stimulation", "Type III hypersensitivity", "Type IV hypersensitivity", "Type I hypersensitivity", "Immunodeficiency"]'::jsonb, 0, 'Graves is a variation of type II hypersensitivity where the antibody is stimulatory.'),
    (v_case_id, 'Which antibody class can cross the placenta and may affect the fetus?', '["IgA", "IgD", "IgE", "IgG", "IgM"]'::jsonb, 3, 'IgG crosses the placenta, which can cause transient neonatal hyperthyroidism.');

    -- CASE 20: MG
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 20: Fatiguing Weakness', 'A patient develops weakness that worsens with use. Autoantibodies target postsynaptic acetylcholine receptors.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Diagnosis?', '["Lambert-Eaton syndrome", "Myasthenia gravis", "Multiple sclerosis", "Guillain-Barré syndrome", "Botulism"]'::jsonb, 1, 'Myasthenia gravis involves fatiguing muscle weakness.'),
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 1, 'Antibodies targeting the ACh receptor is a type II hypersensitivity.'),
    (v_case_id, 'Mechanism of weakness?', '["Immune complex deposition at NMJ", "Antibody-mediated receptor blockade/destruction", "Mast-cell degranulation at NMJ", "CD8 T-cell attack on motor neurons", "Complement deficiency"]'::jsonb, 1, 'Antibodies block and internalize ACh receptors, reducing the number available for signaling.');

    -- CASE 21: Serum Sickness
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 21: Foreign Antiserum Reaction', 'A patient develops fever, urticaria, arthralgias, and proteinuria one week after receiving foreign antiserum.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Anaphylaxis", "Serum sickness", "Contact dermatitis", "Autoimmune hemolysis", "Hyperacute rejection"]'::jsonb, 1, 'Serum sickness is a systemic type III hypersensitivity response to foreign proteins.'),
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "Mixed II/IV"]'::jsonb, 2, 'Type III hypersensitivity involves circulating immune complexes.'),
    (v_case_id, 'Mechanism?', '["IgE-mediated mast cell degranulation", "Antibody against cell surface antigens", "Circulating immune complex deposition with complement activation", "T-cell mediated apoptosis", "NK-cell attack"]'::jsonb, 2, 'Soluble immune complexes deposit in tissues (vessels, joints, kidneys) and activate complement.');

    -- CASE 22: PSGN
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 22: Poststreptococcal Glomerulonephritis', 'A child develops hematuria, edema, and hypertension two weeks after streptococcal pharyngitis.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely pathogenesis?', '["Antibody against GBM", "Immune complex deposition after infection", "Direct toxin-mediated tubular injury", "IgE-mediated renal allergy", "T-cell destruction of glomeruli"]'::jsonb, 1, 'PSGN is caused by immune complexes containing streptococcal antigens.'),
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 2, 'Poststreptococcal glomerulonephritis is a type III hypersensitivity.'),
    (v_case_id, 'Immunofluorescence typically shows:', '["Linear pattern", "Granular pattern", "No immunoglobulin deposition", "Only C9 deposition", "IgE along mesangium"]'::jsonb, 1, 'A granular ("lumpy-bumpy") pattern indicates immune complex deposition.');

    -- CASE 23: SLE
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 23: Systemic Lupus Erythematosus', 'A woman with butterfly rash, photosensitivity, arthritis, and renal disease has positive anti-dsDNA antibodies.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which hypersensitivity mechanism is central to much of this disease?', '["Type I", "Type II", "Type III", "Type IV", "Pure complement deficiency only"]'::jsonb, 2, 'SLE is the prototype of systemic type III hypersensitivity.'),
    (v_case_id, 'Anti-dsDNA antibodies are most associated with:', '["Hemolytic anemia only", "Lupus nephritis activity", "Drug-induced lupus", "Sjögren syndrome", "Ankylosing spondylitis"]'::jsonb, 1, 'Anti-dsDNA levels often track with disease activity, especially renal involvement.'),
    (v_case_id, 'Which antibody is most sensitive for SLE?', '["Anti-histone", "Anti-centromere", "ANA", "Anti-Scl-70", "Anti-CCP"]'::jsonb, 2, 'ANA is highly sensitive (95%+) but not specific.');

    -- CASE 24: Poison Ivy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 24: Contact Dermatitis', 'A patient develops a local skin rash 48 hours after contact with poison ivy.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "Cytotoxic allergy"]'::jsonb, 3, 'Contact dermatitis is a type IV (delayed) hypersensitivity.'),
    (v_case_id, 'Main mediator?', '["IgE and mast cells", "IgG and complement", "Immune complexes", "Sensitized T lymphocytes", "IgM only"]'::jsonb, 3, 'Type IV reactions are cell-mediated, not antibody-mediated.'),
    (v_case_id, 'Why is the reaction delayed?', '["Time required for mast cell synthesis", "Time required for T-cell recruitment and cytokine-mediated inflammation", "Complement must be generated in liver", "IgM must switch to IgG", "Neutrophils need to mature"]'::jsonb, 1, 'The delay represents the time needed for T cells to find the antigen and mount a cytokine response.');

    -- CASE 25: PPD
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 25: Tuberculin Skin Test', 'A patient has a positive PPD skin test 72 hours after tuberculosis testing.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This reaction is mediated primarily by:', '["IgE and eosinophils", "Immune complexes", "Th1 cells and macrophages", "IgM and complement", "NK cells and IgG"]'::jsonb, 2, 'The PPD test uses the delayed hypersensitivity mechanism (Type IV).'),
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 3, 'Tuberculin reaction is the classic example of type IV hypersensitivity.'),
    (v_case_id, 'Key cytokine in macrophage activation here?', '["IL-4", "IL-5", "IFN-gamma", "IL-10", "TGF-beta"]'::jsonb, 2, 'IFN-gamma produced by Th1 cells is the major activator of macrophages.');

    -- CASE 26: Hyperacute
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 26: Immediate Graft Failure', 'A kidney transplant recipient develops graft cyanosis and loss of function within minutes of reperfusion.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely mechanism?', '["T-cell mediated chronic fibrosis", "Preformed antibodies against donor antigens", "Immune complex deposition over months", "Delayed-type hypersensitivity", "IgA-mediated rejection"]'::jsonb, 1, 'Hyperacute rejection is caused by preformed anti-donor antibodies.'),
    (v_case_id, 'Type of rejection?', '["Hyperacute", "Acute cellular", "Chronic", "Graft-versus-host", "Late antibody tolerance"]'::jsonb, 0, 'Rejection occurring within minutes is hyperacute.'),
    (v_case_id, 'Histologically, this is associated with:', '["Granulomas", "Fibrinoid necrosis and thrombosis", "Eosinophilic infiltration only", "Caseous necrosis", "Neural degeneration"]'::jsonb, 1, 'Antibody-mediated complement activation leads to vascular damage and thrombosis.');

    -- CASE 27: Acute Cellular
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 27: Graft Dysfunction', 'A renal transplant recipient develops graft dysfunction 2 weeks after transplantation. Biopsy shows lymphocytic infiltrates.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely mechanism?', '["Preformed antibody against donor ABO", "T-cell mediated attack on donor tissue", "Immune complex deposition", "Mast-cell degranulation", "C1 inhibitor deficiency"]'::jsonb, 1, 'Acute cellular rejection is mediated by host T cells recognizing donor MHC.'),
    (v_case_id, 'Type of rejection?', '["Hyperacute", "Acute cellular", "Chronic", "Syngeneic", "GVHD"]'::jsonb, 1, 'Acute rejection usually occurs within weeks to months.'),
    (v_case_id, 'Hypersensitivity analog?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 3, 'This cell-mediated response is analogous to type IV hypersensitivity.');

    -- CASE 28: Chronic
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 28: Progressive Vascular Narrowing', 'Years after a heart transplant, a patient develops progressive graft vascular narrowing and fibrosis.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This is:', '["Hyperacute rejection", "Acute rejection", "Chronic rejection", "GVHD", "Type I allergy"]'::jsonb, 2, 'Chronic rejection occurs over months to years.'),
    (v_case_id, 'Mechanism is best described as:', '["IgE-mediated vasculitis", "Ongoing low-grade immune-mediated vascular injury", "Preformed donor antibodies only", "Pure infection", "Neutrophil oxidase deficiency"]'::jsonb, 1, 'Chronic rejection involves combined T and B cell responses leading to gradual vessel occlusion.'),
    (v_case_id, 'Typical pathology includes:', '["Necrotizing granulomas", "Obliterative intimal fibrosis", "Diffuse eosinophilia", "Linear IgG staining", "Mesangial proliferation only"]'::jsonb, 1, 'Vascular intimal proliferation and fibrosis are hallmarks of chronic rejection.');

    -- CASE 29: GVHD
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 29: Jaundice and Rash', 'A bone marrow transplant recipient develops jaundice, severe diarrhea, and diffuse rash.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Diagnosis?', '["Hyperacute rejection", "Host-versus-graft disease", "Graft-versus-host disease", "Serum sickness", "Anaphylaxis"]'::jsonb, 2, 'Graft-versus-host disease (GVHD) occurs when donor T cells attack the host.'),
    (v_case_id, 'Main effector cells?', '["Donor T cells attacking recipient tissues", "Recipient B cells attacking graft", "NK cells only", "Donor neutrophils", "Recipient eosinophils"]'::jsonb, 0, 'Donor lymphocytes (graft) recognize the recipient (host) as foreign.'),
    (v_case_id, 'Which tissues are classically involved?', '["Brain, muscle, bone", "Skin, liver, GI tract", "Heart, kidney, pancreas only", "Eye and thymus only", "Thyroid and adrenal only"]'::jsonb, 1, 'The skin (rash), liver (jaundice), and GI tract (diarrhea) are the most common targets.');

    -- CASE 30: CVID
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 30: Common Variable Immunodeficiency', 'An infant with recurrent respiratory infections has very low levels of IgA, IgG, and IgM despite normal B-cell counts. Plasma cells are decreased.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["CVID", "Bruton''s agammaglobulinemia", "Selective IgA deficiency", "Hyper-IgM syndrome", "DiGeorge syndrome"]'::jsonb, 0, 'Common variable immunodeficiency (CVID) involves low Igs but normal B cell counts.'),
    (v_case_id, 'Pathogenesis involves:', '["Failed B-cell maturation at pre-B stage", "Defective differentiation into plasma cells", "Absent thymic development", "Absent CD18", "Defective oxidative burst"]'::jsonb, 1, 'The defect in CVID is a failure of B cells to differentiate into antibody-producing plasma cells.'),
    (v_case_id, 'Long-term risk is increased for:', '["Neisseria meningitidis only", "Autoimmune disease and lymphoma", "Pure T-cell lymphoma only", "Angioedema only", "Hemophilia"]'::jsonb, 1, 'CVID patients have a high risk of autoimmune disorders and lymphomas.');

    -- CASE 31: IgA Giardia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 31: Giardia and Sinusitis', 'A patient with recurrent Giardia infections and chronic sinusitis is found to have an antibody deficiency affecting mucosal immunity.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which antibody is most important at mucosal surfaces?', '["IgD", "IgE", "IgA", "IgG4", "IgM only"]'::jsonb, 2, 'IgA is the primary secretory antibody.'),
    (v_case_id, 'Secretory IgA primarily functions by:', '["Activating strong complement-mediated lysis", "Neutralizing pathogens at mucosal surfaces", "Crossing placenta", "Binding mast cells", "Opsonizing RBCs"]'::jsonb, 1, 'IgA neutralizes toxins and prevents pathogen attachment (immune exclusion).'),
    (v_case_id, 'Secretory component helps IgA:', '["Cross placenta", "Resist proteolysis in secretions", "Activate classical complement", "Bind Fc receptors on NK cells", "Enter nucleus"]'::jsonb, 1, 'The secretory component protects dimeric IgA from degradation in harsh mucosal environments.');

    -- CASE 32: IgG
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 32: Passive Immunity', 'A pregnant woman asks which antibody provides passive immunity to the fetus through the placenta.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Correct answer?', '["IgA", "IgD", "IgE", "IgG", "IgM"]'::jsonb, 3, 'IgG is the only antibody class that crosses the placenta.'),
    (v_case_id, 'Best additional function of IgG?', '["Primary B-cell receptor", "Opsonization and neutralization", "Potent binding to mast cells", "Mucosal secretion", "Earliest antibody made in primary response only"]'::jsonb, 1, 'IgG is the main antibody of the secondary response and is excellent for opsonization.'),
    (v_case_id, 'Which antibody is the first produced in primary immune response?', '["IgA", "IgD", "IgE", "IgG", "IgM"]'::jsonb, 4, 'IgM is the first antibody produced by B cells during a new infection.');

    -- CASE 33: IgM
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 33: Acute Infection', 'A patient with acute hepatitis has a positive anti-HAV IgM.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does IgM positivity usually suggest?', '["Past resolved infection only", "Chronic latent state", "Recent or acute infection", "Vaccination only", "Mucosal reinfection only"]'::jsonb, 2, 'IgM indicates an acute or very recent immune response.'),
    (v_case_id, 'IgM structure is best described as:', '["Monomer", "Dimer", "Pentamer", "Trimer", "Membrane-only form"]'::jsonb, 2, 'Secreted IgM is a large pentamer linked by a J-chain.'),
    (v_case_id, 'Why is IgM efficient at activating complement?', '["It is smallest", "Its pentameric structure strongly activates classical pathway", "It is secretory", "It binds eosinophils", "It crosses placenta"]'::jsonb, 1, 'The pentameric structure provides many binding sites for C1q, activating the classical complement pathway.');

    -- CASE 34: Naive B
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 34: Mature B Cells', 'A naïve mature B cell is examined in a lymph node before antigen exposure.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which antibodies are normally found on its surface?', '["IgG and IgA", "IgE and IgA", "IgM and IgD", "IgG and IgM only after class switching", "IgA only"]'::jsonb, 2, 'Mature naive B cells express both IgM and IgD.'),
    (v_case_id, 'Main function of surface immunoglobulin on naïve B cells?', '["Complement fixation", "B-cell antigen recognition", "Placental transfer", "Mast-cell sensitization", "Mucosal transport"]'::jsonb, 1, 'Surface Ig serves as the B-cell receptor (BCR).'),
    (v_case_id, 'Class switching changes:', '["Antigen specificity of variable region", "Heavy-chain constant region effector function", "Light-chain type from kappa to lambda only", "MHC restriction", "Affinity immediately without T-cell help"]'::jsonb, 1, 'Isotype switching changes the constant region (Fc) while maintaining the same variable region.');

    -- CASE 35: Helminth
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 35: Parasitic Defense', 'A patient with helminth infection has marked eosinophilia.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which antibody is most associated with defense against helminths?', '["IgA", "IgD", "IgE", "IgG4 only", "IgM"]'::jsonb, 2, 'IgE is central to the anti-parasitic response.'),
    (v_case_id, 'Which cells bind IgE and help kill parasites?', '["Neutrophils", "Eosinophils", "Platelets", "Erythrocytes", "Fibroblasts"]'::jsonb, 1, 'Eosinophils use IgE to target and degranulate on parasites (ADCC).'),
    (v_case_id, 'Which cytokine is especially important in eosinophil activation?', '["IL-1", "IL-2", "IL-5", "IL-10", "IFN-alpha"]'::jsonb, 2, 'IL-5 produced by Th2 cells activates and recruits eosinophils.');

    -- CASE 36: Affinity
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 36: Germinal Centers', 'A researcher studies antibody diversification within germinal centers after antigen exposure.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which process improves antibody affinity over time?', '["Class switching", "Somatic hypermutation with selection", "VDJ recombination in bone marrow", "Alternative splicing only", "Central tolerance"]'::jsonb, 1, 'Somatic hypermutation introduces mutations in the variable region; selection keeps the best binders.'),
    (v_case_id, 'This process occurs mainly in:', '["Thymic cortex", "Bone marrow only", "Germinal centers", "Spleen red pulp only", "Liver"]'::jsonb, 2, 'Germinal centers of lymph nodes are the sites of affinity maturation.'),
    (v_case_id, 'Which enzyme is crucial for class switching and somatic hypermutation?', '["RAG1/2", "TdT", "AID", "ADA", "BTK"]'::jsonb, 2, 'Activation-induced cytidine deaminase (AID) is required for both SHM and CSR.');

    -- CASE 37: MHC II
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 37: MHC II Deficiency', 'An infant has absent MHC II expression, recurrent infections, and severely impaired CD4 T-cell activation.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Main antigen-presentation defect affects activation of:', '["CD8 T cells", "CD4 T cells", "NK cells only", "Neutrophils", "Plasma cells directly"]'::jsonb, 1, 'MHC II is required for presenting antigen to CD4+ T helper cells.'),
    (v_case_id, 'Which cells normally express MHC II?', '["All nucleated cells", "RBCs and platelets", "APCs such as dendritic cells, macrophages, B cells", "Skeletal muscle only", "Neurons only"]'::jsonb, 2, 'MHC II is expressed by Professional Antigen Presenting Cells.'),
    (v_case_id, 'Loss of CD4 T-cell help especially impairs:', '["Mast cell granule storage", "B-cell class switching and macrophage activation", "Neutrophil diapedesis", "Complement synthesis", "RBC maturation"]'::jsonb, 1, 'CD4+ T cells are required for B-cell help and activating macrophages.');

    -- CASE 38: MHC I
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 38: Viral Susceptibility', 'A patient has recurrent viral infections due to deficiency in MHC I expression.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which lymphocytes fail to mature properly?', '["CD4 T cells", "CD8 T cells", "B cells", "Plasma cells", "Neutrophils"]'::jsonb, 1, 'Lack of MHC I prevents the positive selection of CD8+ T cells in the thymus.'),
    (v_case_id, 'MHC I normally presents antigen to:', '["B cells", "CD4 T cells", "CD8 T cells", "Eosinophils", "Mast cells"]'::jsonb, 2, 'MHC I presents endogenous antigens to CD8+ cytotoxic T cells.'),
    (v_case_id, 'MHC I is normally found on:', '["APCs only", "All nucleated cells", "RBCs only", "Plasma cells only", "Hepatocytes only during inflammation"]'::jsonb, 1, 'MHC I is expressed on almost all nucleated cells to signal health or infection to the immune system.');

    -- CASE 39: Bee Sting
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 39: Anaphylaxis', 'A patient is stung by a bee and develops immediate anaphylaxis. He is treated emergently.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Best immediate treatment?', '["Prednisone orally", "Diphenhydramine only", "Intramuscular epinephrine", "Inhaled corticosteroid", "Montelukast only"]'::jsonb, 2, 'Epinephrine is the first-line treatment for anaphylaxis.'),
    (v_case_id, 'Why is epinephrine effective?', '["It destroys IgE", "It reverses bronchoconstriction and supports blood pressure", "It blocks class switching", "It depletes mast cells", "It activates complement"]'::jsonb, 1, 'Epinephrine provides alpha-1 (vasoconstriction) and beta-2 (bronchodilation) effects.'),
    (v_case_id, 'This reaction is initiated by degranulation of:', '["Plasma cells", "Mast cells", "Neutrophils", "Macrophages", "Fibroblasts"]'::jsonb, 1, 'Mast cells release histamine, leukotrienes, and other mediators.');

    -- CASE 40: Asthma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 40: Episodic Wheezing', 'A child with asthma has episodic wheezing triggered by allergens.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which hypersensitivity type contributes most directly to allergic asthma?', '["Type I", "Type II", "Type III", "Type IV", "No immune basis"]'::jsonb, 0, 'Allergic asthma is a type I hypersensitivity reaction in the airways.'),
    (v_case_id, 'Which cells are especially prominent in bronchial secretions in allergic asthma?', '["Eosinophils", "Basophilic erythrocytes", "Plasma blasts only", "Osteoclasts", "Hepatocytes"]'::jsonb, 0, 'Eosinophils are a hallmark of allergic inflammation.'),
    (v_case_id, 'Which cytokine profile is most associated?', '["Th1 with IFN-gamma dominant", "Th2 with IL-4, IL-5, IL-13", "Th17 only", "Treg only", "CD8 perforin only"]'::jsonb, 1, 'A Th2 response drives IgE production and eosinophil recruitment.');

    -- CASE 41: Spherocytes
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 41: Autoimmune Hemolysis', 'A woman with autoimmune hemolytic anemia has spherocytes and a positive direct Coombs test.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 1, 'AIHA is a type II hypersensitivity.'),
    (v_case_id, 'Direct Coombs test detects:', '["Free serum antibodies only", "Antibodies or complement bound to patient RBCs", "T cells bound to RBCs", "Serum immune complexes", "IgE on mast cells"]'::jsonb, 1, 'The direct test identifies the antibody actually present on the cell surface.'),
    (v_case_id, 'Mechanism of anemia?', '["Mast cell-mediated hemolysis", "Antibody-mediated RBC destruction", "Immune complex nephritis", "T-cell marrow suppression only", "Iron deficiency"]'::jsonb, 1, 'RBCs are destroyed by splenic macrophages (extravascular) or complement (intravascular).');

    -- CASE 42: Pemphigus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 42: Blistering Disease', 'A patient with pemphigus vulgaris has flaccid bullae and antibodies against desmogleins.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "Mixed I/III"]'::jsonb, 1, 'Type II hypersensitivity involves antibodies against fixed tissue antigens.'),
    (v_case_id, 'Pathogenesis involves:', '["Antibody against cell adhesion proteins", "Immune complex vasculitis", "Delayed T-cell granulomas", "IgE-mediated epidermal edema", "Neutrophil oxidase deficiency"]'::jsonb, 0, 'Autoantibodies against desmoglein-3 cause loss of cell-cell adhesion (acantholysis).'),
    (v_case_id, 'Another blistering disease with antibodies to hemidesmosomes is:', '["Dermatitis herpetiformis", "Bullous pemphigoid", "Psoriasis", "Erythema multiforme", "Scleroderma"]'::jsonb, 1, 'Bullous pemphigoid affects the basement membrane attachment.');

    -- CASE 43: Farmer Lung
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 43: Farmer''s Lung', 'A farmer develops cough, fever, and dyspnea hours after exposure to moldy hay. This recurs with repeated exposure.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely mechanism?', '["IgE-mediated mast-cell degranulation", "Immune complex-mediated alveolitis", "CD8-mediated direct cytotoxicity only", "Autoantibody against basement membrane", "Complement MAC deficiency"]'::jsonb, 1, 'Hypersensitivity pneumonitis is a type III hypersensitivity (Arthus-like reaction).'),
    (v_case_id, 'Hypersensitivity type classically involved?', '["Type I", "Type II", "Type III", "Type IV only", "None"]'::jsonb, 2, 'Serum antibodies react with inhaled antigens in the lung.'),
    (v_case_id, 'Typical disease association?', '["Goodpasture syndrome", "Hypersensitivity pneumonitis", "Asthma", "Sarcoidosis", "Cystic fibrosis"]'::jsonb, 1, 'Farmer''s lung is the classic example of HP.');

    -- CASE 44: Nickel
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 44: Nickel Jewelry Rash', 'A patient develops an itchy rash where nickel-containing jewelry touched the skin.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "Antibody deficiency"]'::jsonb, 3, 'Nickel allergy is a type IV (delayed) cell-mediated response.'),
    (v_case_id, 'Which cells recognize hapten-modified proteins?', '["Plasma cells", "Sensitized T cells", "Eosinophils", "Mast cells", "RBCs"]'::jsonb, 1, 'T cells are sensitized during the first exposure and react during the second.'),
    (v_case_id, 'Which disease uses a similar immune mechanism?', '["Myasthenia gravis", "Contact dermatitis", "Hemolytic disease of newborn", "Serum sickness", "Graves disease"]'::jsonb, 1, 'Contact dermatitis is the clinical manifestation of this mechanism.');

    -- CASE 45: Bruton's II
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 45: Absent Germinal Centers', 'A child has recurrent sinopulmonary infections and absent germinal centers in lymph nodes.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which disease best fits?', '["Bruton''s agammaglobulinemia", "DiGeorge syndrome", "LAD", "CGD", "Hereditary angioedema"]'::jsonb, 0, 'Bruton''s involves a total lack of mature B cells, hence no germinal centers.'),
    (v_case_id, 'Why are germinal centers absent?', '["No T cells exist", "B cells fail to mature", "Complement is missing", "Phagocytes cannot migrate", "NK cells destroy follicles"]'::jsonb, 1, 'Germinal centers are primarily formed by proliferating B cells.'),
    (v_case_id, 'Which organisms are common?', '["Encapsulated bacterial pathogens", "Helminths only", "Neisseria only", "Fungi only", "Protozoa only"]'::jsonb, 0, 'S. pneumoniae and H. influenzae are common due to loss of humoral immunity.');

    -- CASE 46: X-linked SCID
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 46: IL-2 Receptor Gamma Chain', 'An infant has severe thrush, chronic diarrhea, and absent thymic shadow. Genetic testing shows IL-2 receptor gamma chain mutation.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This causes:', '["X-linked SCID", "DiGeorge syndrome", "Hyper-IgM syndrome", "Wiskott-Aldrich syndrome", "CVID"]'::jsonb, 0, 'The common gamma chain (CD132) is shared by receptors for IL-2, IL-4, IL-7, IL-9, IL-15, and IL-21.'),
    (v_case_id, 'Which cytokine receptors are affected through the common gamma chain?', '["Only IL-1", "Multiple interleukins including IL-2 family signaling", "Only IFN-gamma", "Only TGF-beta", "Only IL-17"]'::jsonb, 1, 'Loss of IL-7 signaling specifically prevents T-cell development.'),
    (v_case_id, 'Lymphocyte profile classically is:', '["Absent B cells, normal T cells", "Low T cells with dysfunctional B cells", "High NK cells with absent neutrophils", "High eosinophils only", "Isolated low CD8 cells"]'::jsonb, 1, 'T cells are absent (T-); B cells are present but non-functional without T-cell help (B+).');

    -- CASE 47: Ataxia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 47: Ataxia and Telangiectasias', 'A patient with recurrent infections has ataxia, telangiectasias, and elevated AFP.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Ataxia-telangiectasia", "Wiskott-Aldrich syndrome", "Job syndrome", "LAD", "DiGeorge syndrome"]'::jsonb, 0, 'Ataxia-telangiectasia features neurologic, vascular, and immune defects.'),
    (v_case_id, 'Underlying defect?', '["Defective DNA repair due to ATM mutation", "Defective class switching due to CD40L deficiency", "Failure of B-cell maturation", "Defective ROS generation", "C1 inhibitor deficiency"]'::jsonb, 0, 'ATM gene encodes a kinase sensitive to double-strand DNA breaks.'),
    (v_case_id, 'Which immunologic abnormality is common?', '["High IgA only", "IgA deficiency or low immunoglobulins", "High IgM only", "Absent complement", "Absent eosinophils"]'::jsonb, 1, 'IgA deficiency and low T cell numbers are common findings.');

    -- CASE 48: Neisseria
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 48: Neisseria Infections', 'A child has recurrent Neisseria infections but normal immunoglobulins and normal neutrophil function.', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely deficiency?', '["C3", "C5-C9", "IgA", "BTK", "CD40L"]'::jsonb, 1, 'Terminal complement is required for MAC formation.'),
    (v_case_id, 'Which structure fails to form?', '["C3 convertase", "Membrane attack complex", "B-cell receptor", "Phagolysosome", "TCR-CD3 complex"]'::jsonb, 1, 'C5b recruits C6, C7, C8, and C9 to form the MAC.'),
    (v_case_id, 'The major role of the deficient system here is:', '["Viral neutralization", "Lysis of certain bacteria", "Helminth killing", "Placental immunity", "Somatic hypermutation"]'::jsonb, 1, 'Direct lysis is required for Neisseria clearance.');

    -- CASE 49: Rituximab
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 49: B-Cell Depletion', 'A patient is given rituximab therapy targeting CD20-positive B cells.', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which cells are directly depleted?', '["Plasma cells only", "Mature B cells", "T helper cells", "Neutrophils", "NK cells"]'::jsonb, 1, 'Rituximab targets CD20, which is expressed from pre-B stages to mature B cells.'),
    (v_case_id, 'Immediate immunologic consequence is most related to reduced:', '["Cell-mediated cytotoxicity", "Antibody production capacity", "Complement synthesis", "Histamine release", "Diapedesis"]'::jsonb, 1, 'While plasma cells (the actual producers) are spared, the pool of B cells available to become new plasma cells is gone.'),
    (v_case_id, 'Plasma cells are relatively spared because they:', '["Do not derive from B cells", "Lack CD20 expression", "Express only IgE", "Are in thymus only", "Are neutrophil-derived"]'::jsonb, 1, 'Plasma cells downregulate CD20, making them resistant to rituximab.');

    -- CASE 50: Memory
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 50: Booster Response', 'A child receives a protein vaccine and later shows strong secondary antibody response after booster dose.', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which antibody predominates in a mature secondary response?', '["IgD", "IgM only", "High-affinity IgG", "IgE only", "Secretory IgA only in all tissues"]'::jsonb, 2, 'The secondary response is dominated by high-affinity IgG.'),
    (v_case_id, 'Why is the secondary response faster and stronger?', '["Complement memory", "Presence of memory B cells generated after first exposure", "Mast cells expand permanently", "IgM crosses placenta", "Neutrophils retain antigen"]'::jsonb, 1, 'Memory cells respond much more rapidly than naive cells.'),
    (v_case_id, 'This improved response depends on:', '["No T-cell involvement", "Affinity maturation and class switching", "Loss of plasma cells", "Reduced APC function", "Terminal complement deficiency"]'::jsonb, 1, 'The germinal center reaction (T-cell dependent) generates high-affinity memory.');

    -- CASE 51: Set 2 - Neisseria
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 51: CH50 Deficiency', 'A 9-year-old boy has recurrent infections with Neisseria meningitidis. CBC is normal, neutrophil oxidative burst is normal, and immunoglobulin levels are normal. Total hemolytic complement (CH50) is absent.', 51)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which deficiency is most likely?', '["C1 inhibitor deficiency", "C3 deficiency", "C5–C9 deficiency", "Factor D deficiency", "Properdin deficiency"]'::jsonb, 2, 'Recurrent Neisseria with zero CH50 is diagnostic for terminal complement deficiency.'),
    (v_case_id, 'What immune function is primarily impaired?', '["Opsonization", "B-cell maturation", "Membrane attack complex formation", "Antigen presentation", "Neutrophil chemotaxis"]'::jsonb, 2, 'C5-C9 are required for MAC formation.'),
    (v_case_id, 'Which process is directly affected?', '["Lysis of gram-negative bacteria", "IgA secretion", "T-cell activation", "Mast-cell degranulation", "Somatic hypermutation"]'::jsonb, 0, 'Neisseria require MAC-mediated lysis for elimination.');

    -- CASE 52: Set 2 - Angioedema
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 52: Non-Pruritic Swelling', 'A young man develops recurrent nonpruritic facial swelling and abdominal pain after stress. There is no urticaria. Family history is positive.', 52)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Anaphylaxis", "Hereditary angioedema", "Serum sickness", "Contact dermatitis", "Mastocytosis"]'::jsonb, 1, 'Non-pruritic swelling without hives is the hallmark of HAE.'),
    (v_case_id, 'Which molecule is deficient?', '["C3 convertase", "C1 esterase inhibitor", "C5a", "Properdin", "Factor B"]'::jsonb, 1, 'HAE is caused by C1 esterase inhibitor deficiency.'),
    (v_case_id, 'Main mediator of swelling?', '["Histamine", "IL-5", "Bradykinin", "Prostaglandin D2", "IFN-gamma"]'::jsonb, 2, 'Bradykinin mediates the vascular leakage in HAE.');

    -- CASE 53: Set 2 - C3
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 53: Recurrent Pyogenic Infections', 'A child has recurrent severe infections with encapsulated organisms. C3 is markedly reduced.', 53)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which complement function is most impaired?', '["Viral neutralization", "Opsonization", "Mast-cell activation", "IgE class switching", "Antigen presentation"]'::jsonb, 1, 'C3b is the primary opsonin for encapsulated bacteria.'),
    (v_case_id, 'Which complement fragment is the major opsonin?', '["C2a", "C3b", "C4a", "C5a", "C9"]'::jsonb, 1, 'C3b binds to pathogens and is recognized by CR1 on phagocytes.'),
    (v_case_id, 'Which organism is especially common?', '["Streptococcus pneumoniae", "Mycobacterium tuberculosis", "Candida albicans", "Giardia lamblia", "Plasmodium falciparum"]'::jsonb, 0, 'S. pneumoniae is the most common encapsulated pathogen.');

    -- CASE 54: Set 2 - CGD
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 54: Catalase-Positive Infections', 'A 6-year-old has recurrent skin abscesses caused by catalase-positive organisms. Nitroblue tetrazolium test is abnormal.', 54)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["LAD", "CGD", "Chediak-Higashi", "Hyper-IgM syndrome", "SCID"]'::jsonb, 1, 'Catalase-positive infections + abnormal NBT = CGD.'),
    (v_case_id, 'Defective enzyme?', '["Myeloperoxidase", "NADPH oxidase", "BTK", "AID", "CD40L"]'::jsonb, 1, 'NADPH oxidase deficiency prevents ROS generation.'),
    (v_case_id, 'Main immune defect?', '["Defective respiratory burst", "Defective class switching", "T-cell deficiency", "Complement deficiency", "Defective adhesion"]'::jsonb, 0, 'Respiratory burst is the essential first step in oxygen-dependent killing.');

    -- CASE 55: Set 2 - LAD
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 55: Neutrophilia and No Pus', 'A newborn has delayed separation of umbilical cord, recurrent bacterial infections, and absent pus formation.', 55)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["LAD", "CGD", "Wiskott-Aldrich", "Job syndrome", "Bruton''s disease"]'::jsonb, 0, 'Delayed cord separation is pathognomonic for LAD type 1.'),
    (v_case_id, 'Which molecule is deficient?', '["CD18", "CD40L", "BTK", "CD3", "C3"]'::jsonb, 0, 'CD18 is the beta-2 integrin subunit.'),
    (v_case_id, 'Why is pus absent?', '["No B cells", "Neutrophils cannot migrate into tissue", "No oxidative burst", "No complement activation", "No mast cells"]'::jsonb, 1, 'Pus requires neutrophil accumulation, which is impossible without adhesion.');

    -- CASE 56: Set 2 - WAS
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 56: Triad of Symptoms', 'A child has eczema, recurrent infections, thrombocytopenia, and small platelets.', 56)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Diagnosis?', '["Wiskott-Aldrich syndrome", "Job syndrome", "Hyper-IgM syndrome", "DiGeorge syndrome", "SCID"]'::jsonb, 0, 'The combination of eczema and small platelets is unique to WAS.'),
    (v_case_id, 'Defective gene?', '["BTK", "WAS", "ATM", "AIRE", "ADA"]'::jsonb, 1, 'The WAS gene encodes the WASP protein.'),
    (v_case_id, 'Typical immunoglobulin pattern?', '["High IgM only", "Low IgA only", "Increased IgA/IgE, low IgM", "Low all immunoglobulins", "Increased IgG only"]'::jsonb, 2, 'IgA and IgE are high; IgM is low in WAS.');

    -- CASE 57: Set 2 - Job
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 57: STAT3 Mutation', 'A child has retained primary teeth, coarse facies, eczema, and recurrent cold abscesses. IgE is elevated.', 57)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Diagnosis?', '["Job syndrome", "CGD", "LAD", "SCID", "DiGeorge syndrome"]'::jsonb, 0, 'The clinical features describe AD-Hyper IgE syndrome.'),
    (v_case_id, 'Mechanism?', '["Defective Th17 differentiation", "Defective BTK", "Defective complement", "Defective CD40L", "Defective MHC II"]'::jsonb, 0, 'Loss of STAT3 prevents Th17 development.'),
    (v_case_id, 'Which finding distinguishes it from CGD?', '["Catalase-positive infections", "High neutrophils", "High IgE with retained primary teeth", "Recurrent pneumonia", "Skin abscesses"]'::jsonb, 2, 'Teeth and IgE are not part of CGD.');

    -- CASE 58: Set 2 - Chediak
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 58: LYST Gene', 'A child has albinism, recurrent pyogenic infections, neuropathy, and giant granules in neutrophils.', 58)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Diagnosis?', '["Chediak-Higashi syndrome", "Wiskott-Aldrich", "CGD", "LAD", "Hyper-IgM"]'::jsonb, 0, 'Albinism + giant granules = Chediak-Higashi.'),
    (v_case_id, 'Defect involves?', '["Lysosomal trafficking", "Class switching", "Oxidative burst", "Complement fixation", "TCR signaling"]'::jsonb, 0, 'Microtubule-mediated trafficking is broken.'),
    (v_case_id, 'Main functional consequence?', '["Defective phagolysosome formation", "No B cells", "No T cells", "No complement", "No IgA"]'::jsonb, 0, 'Lysosomes cannot fuse with phagosomes to kill bacteria.');

    -- CASE 59: Set 2 - Hyper-IgM
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 59: Class Switching Defect', 'An infant has recurrent pneumonia and PCP infection. IgM is high, IgG and IgA are low.', 59)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Diagnosis?', '["Hyper-IgM syndrome", "Bruton''s disease", "Selective IgA deficiency", "CVID", "DiGeorge syndrome"]'::jsonb, 0, 'The high IgM despite low others indicates a class-switch defect.'),
    (v_case_id, 'Most likely defect?', '["CD40L deficiency", "BTK mutation", "ADA deficiency", "WAS mutation", "C3 deficiency"]'::jsonb, 0, 'X-linked CD40L deficiency is the most common cause.'),
    (v_case_id, 'Mechanism?', '["Failure of class switching", "Failure of oxidative burst", "Failure of B-cell maturation", "Failure of T-cell maturation", "Failure of complement activation"]'::jsonb, 0, 'B cells cannot receive the "second signal" from T cells to switch isotypes.');

    -- CASE 60: Set 2 - DiGeorge
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 60: 22q11.2 Deletion', 'A newborn has tetany, recurrent fungal infections, and congenital heart disease. No thymic shadow is seen.', 60)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Diagnosis?', '["DiGeorge syndrome", "SCID", "Bruton''s disease", "CVID", "LAD"]'::jsonb, 0, 'Hypocalcemia (tetany) + absent thymus shadow = DiGeorge.'),
    (v_case_id, 'Embryologic defect?', '["First pouch", "Third and fourth pharyngeal pouches", "Neural tube closure", "Endocardial cushion", "Neural crest to limb buds"]'::jsonb, 1, 'The 3rd and 4th pouches form the parathyroids and thymus.'),
    (v_case_id, 'Main immune defect?', '["B-cell deficiency", "T-cell deficiency", "Complement deficiency", "Neutrophil defect", "NK-cell deficiency"]'::jsonb, 1, 'No thymus means no site for T-cell maturation.');

    -- CASE 61: Set 2 - Type I
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 61: Immediate Hypersensitivity', 'A patient develops hypotension, wheezing, and urticaria immediately after peanut exposure.', 61)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "Autoimmune"]'::jsonb, 0, 'Immediate systemic response is Type I.'),
    (v_case_id, 'Antibody involved?', '["IgG", "IgM", "IgA", "IgE", "IgD"]'::jsonb, 3, 'IgE is the primary mediator.'),
    (v_case_id, 'Immediate mechanism?', '["Immune complex deposition", "Cross-linking of IgE on mast cells", "CD8 T-cell activation", "Complement MAC formation", "Antibody-mediated hemolysis"]'::jsonb, 1, 'Cross-linking triggers degranulation.');

    -- CASE 62: Set 2 - Penicillin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 62: Penicillin Hemolysis', 'A patient develops hemolytic anemia after penicillin use. Direct Coombs is positive.', 62)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 1, 'Drug-induced hemolysis is Type II.'),
    (v_case_id, 'Mechanism?', '["IgE-mediated allergy", "Antibody-mediated destruction of cells", "Immune complex deposition", "T-cell mediated inflammation", "Granuloma formation"]'::jsonb, 1, 'Antibodies target the cell surface.'),
    (v_case_id, 'Main antibodies?', '["IgE", "IgA", "IgG/IgM", "IgD", "Secretory IgA"]'::jsonb, 2, 'IgG and IgM mediate Type II.');

    -- CASE 63: Set 2 - SLE
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 63: Immune Complex Disease', 'A woman with SLE develops nephritis and arthritis.', 63)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Hypersensitivity type most responsible?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 2, 'SLE manifestations like nephritis are Type III.'),
    (v_case_id, 'Mechanism?', '["IgE-mediated mast cells", "Immune complex deposition", "T-cell granulomas", "Receptor stimulation", "Complement absence"]'::jsonb, 1, 'Complexes deposit in tissues.'),
    (v_case_id, 'Most specific antibody?', '["ANA", "Anti-dsDNA", "Anti-histone", "Anti-centromere", "RF"]'::jsonb, 1, 'Anti-dsDNA and Anti-Smith are highly specific.');

    -- CASE 64: Set 2 - Poison Ivy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 64: Delayed Rash', 'A patient develops rash 48 hours after poison ivy exposure.', 64)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "Type V"]'::jsonb, 3, 'Delayed rash is Type IV.'),
    (v_case_id, 'Main mediator?', '["IgE", "IgG", "Immune complexes", "Sensitized T cells", "Mast cells"]'::jsonb, 3, 'T cells mediate delayed responses.'),
    (v_case_id, 'Why delayed?', '["Need for T-cell recruitment", "Slow IgE production", "Complement synthesis delay", "Slow neutrophil formation", "Delayed mast cell degranulation"]'::jsonb, 0, 'Cell recruitment takes time.');

    -- CASE 65: Set 2 - Graves
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 65: Receptor Stimulation', 'A patient with Graves disease has heat intolerance and exophthalmos.', 65)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Mechanism?', '["Destructive antibodies", "Stimulating IgG against TSH receptor", "T-cell destruction", "Immune complex deposition", "IgE-mediated stimulation"]'::jsonb, 1, 'Autoantibodies act as agonists.'),
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 1, 'Receptor stimulation is a type II variant.'),
    (v_case_id, 'Which antibody crosses placenta?', '["IgA", "IgM", "IgD", "IgG", "IgE"]'::jsonb, 3, 'Only IgG crosses the placenta.');

    -- CASE 66: Set 2 - Goodpasture
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 66: Anti-Glomerular Basement Membrane', 'A patient has hemoptysis and hematuria. IF shows linear IgG deposition along basement membrane.', 66)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Diagnosis?', '["PSGN", "Goodpasture syndrome", "IgA nephropathy", "PAN", "SLE"]'::jsonb, 1, 'Lung + Kidney + Linear IF = Goodpasture.'),
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 1, 'Anti-BM is Type II.'),
    (v_case_id, 'Target antigen?', '["Type IV collagen", "dsDNA", "MPO", "PR3", "Smooth muscle"]'::jsonb, 0, 'Collagen in the BM is the target.');

    -- CASE 67: Set 2 - Serum Sickness
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 67: Immune Complex Arthritis', 'A patient receives foreign antiserum and develops fever, rash, arthralgia, and proteinuria after 1 week.', 67)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Diagnosis?', '["Serum sickness", "Anaphylaxis", "Contact dermatitis", "Myasthenia gravis", "Hemolytic anemia"]'::jsonb, 0, 'Foreign serum reaction is serum sickness.'),
    (v_case_id, 'Hypersensitivity type?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 2, 'Soluble complexes cause type III.'),
    (v_case_id, 'Mechanism?', '["Immune complex deposition", "Mast cell degranulation", "Antibody against receptor", "T-cell mediated damage", "NK-cell killing"]'::jsonb, 0, 'Systemic deposition of complexes.');

    -- CASE 68: Set 2 - Hyperacute
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 68: Preformed Antibodies', 'A transplant recipient develops immediate graft thrombosis after reperfusion.', 68)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Type of rejection?', '["Hyperacute", "Acute", "Chronic", "GVHD", "Delayed"]'::jsonb, 0, 'Immediate rejection is hyperacute.'),
    (v_case_id, 'Mechanism?', '["T-cell mediated", "Preformed antibodies", "Immune complexes", "Mast-cell activation", "IgA deposition"]'::jsonb, 1, 'Pre-existing antibodies trigger the response.'),
    (v_case_id, 'Histology?', '["Granulomas", "Fibrinoid necrosis", "Giant cells", "Caseation", "Eosinophilic infiltrates"]'::jsonb, 1, 'Vascular damage leads to fibrinoid necrosis.');

    -- CASE 69: Set 2 - Acute Cellular
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 69: T-Cell Mediated Rejection', 'A renal transplant patient develops dysfunction after 2 weeks. Biopsy shows lymphocytes.', 69)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Rejection type?', '["Hyperacute", "Acute cellular", "Chronic", "GVHD", "Serum sickness"]'::jsonb, 1, 'Cellular infiltrate indicates acute cellular rejection.'),
    (v_case_id, 'Main mechanism?', '["Preformed antibodies", "T-cell attack", "Immune complexes", "IgE", "Complement deficiency"]'::jsonb, 1, 'T cells attack the graft MHC.'),
    (v_case_id, 'Hypersensitivity analog?', '["Type I", "Type II", "Type III", "Type IV", "None"]'::jsonb, 3, 'Analogous to delayed hypersensitivity.');

    -- CASE 70: Set 2 - Chronic
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Case 70: Obliterative Intimal Fibrosis', 'Years after transplant, graft vessels progressively narrow.', 70)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Rejection type?', '["Hyperacute", "Acute", "Chronic", "GVHD", "Type I allergy"]'::jsonb, 2, 'Narrowing over years is chronic rejection.'),
    (v_case_id, 'Pathology?', '["Obliterative intimal fibrosis", "Linear IgG", "Granulomas", "Massive eosinophilia", "Cold abscesses"]'::jsonb, 0, 'Intimal thickening is the classic finding.'),
    (v_case_id, 'Mechanism?', '["Low-grade immune vascular injury", "Mast-cell activation", "C1 inhibitor deficiency", "IgE reaction", "Direct bacterial infection"]'::jsonb, 0, 'Gradual destruction by low-grade immune activity.');

END $$;

COMMIT;
