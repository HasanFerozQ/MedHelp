import json
import random

topic_slug = 'derm-autoimmune'

templates = [
    # ─── 1. PEMPHIGUS VULGARIS (PV) ───
    {
        "q": "A {age}-old {gender} presents with a 4-month history of painful, non-healing mouth ulcers that make eating difficult, followed by the development of flaccid blisters on their chest and back. Physical examination reveals extensive oral mucosal erosions and flaccid cutaneous bullae that rupture easily with lateral pressure. What is the molecular target of the autoantibodies driving this condition?",
        "options": [
            "Desmoglein 3 and Desmoglein 1",
            "BP180 (Type XVII Collagen) and BP230",
            "Type VII Collagen in anchoring fibrils",
            "Laminin-332 (epiligrin) in the lamina lucida",
            "Integrin alpha-6 beta-4 in hemidesmosomes"
        ],
        "answer": 0,
        "exp": "Pemphigus vulgaris (PV) is an autoimmune intraepidermal blistering disease characterized by flaccid bullae and painful mucosal erosions. Oral lesions precede cutaneous lesions in over 60% of cases. The pathology is driven by IgG autoantibodies targeting Desmoglein 3 (expressed primarily in mucosa) and Desmoglein 1 (expressed in skin). This leads to loss of cell-to-cell adhesion (acantholysis)."
    },
    {
        "q": "A {age}-old {gender} is evaluated for multiple flaccid vesicles and weeping erosions on the scalp, trunk, and groin. Stroking apparently normal skin adjacent to an active lesion causes easy sloughing of the epidermis. A punch biopsy of an active lesion is performed. What is the classic histologic finding expected on hematoxylin and eosin (H&E) staining?",
        "options": [
            "Intraepidermal acantholysis with a 'tombstone' appearance of the basal layer",
            "Subepidermal clefting with numerous eosinophils in the blister cavity",
            "Subcorneal acantholysis with cleavage within the granular layer",
            "Subepidermal clefting with neutrophilic microabscesses at the dermal papillary tips",
            "Interface dermatitis with vacuolar degeneration of the basal layer and colloid bodies"
        ],
        "answer": 0,
        "exp": "The clinical sign described (easy sloughing of epidermis with friction) is Nikolsky's sign, classic for pemphigus. Histopathology of pemphigus vulgaris demonstrates suprabasal intraepidermal acantholysis (loss of cohesion between keratinocytes). The basal layer remains attached to the basement membrane zone via intact hemidesmosomes, presenting as a single layer of basal cells lining the floor of the cavity, known as a 'tombstone' appearance."
    },
    {
        "q": "A {age}-old {gender} presents with flaccid, fluid-filled blisters on the trunk and painful oral erosions. A punch biopsy for direct immunofluorescence (DIF) is performed on perilesional skin. What immunofluorescence pattern is diagnostic for this patient's disease?",
        "options": [
            "Intercellular IgG and C3 deposition in a 'fishnet' or reticular pattern throughout the epidermis",
            "Linear band of IgG and C3 deposition along the basement membrane zone",
            "Granular IgA deposition concentrated at the tips of the dermal papillae",
            "Linear IgA deposition along the dermo-epidermal junction",
            "Shaggy deposition of fibrinogen at the dermo-epidermal junction without immunoglobulins"
        ],
        "answer": 0,
        "exp": "Direct immunofluorescence (DIF) of perilesional skin in pemphigus vulgaris reveals intercellular deposition of IgG and C3 throughout the epidermis in a net-like, reticular, or 'fishnet' pattern, reflecting autoantibodies bound to desmogleins in the desmosomes."
    },
    {
        "q": "A {age}-old {gender} with severe pemphigus vulgaris is hospitalized due to widespread cutaneous denudation and severe pain. Which of the following immunotherapies is first-line, gold-standard therapy to induce rapid remission in combination with systemic corticosteroids?",
        "options": [
            "Rituximab (anti-CD20 monoclonal antibody)",
            "Dapsone therapy",
            "Strict gluten-free diet",
            "Oral Doxycycline and Nicotinamide",
            "Intravenous Cyclosporine"
        ],
        "answer": 0,
        "exp": "Rituximab, a chimeric monoclonal antibody targeting CD20 on B-lymphocytes, is now established as first-line therapy (in combination with a tapering course of systemic corticosteroids) for moderate-to-severe pemphigus vulgaris. It leads to rapid depletion of antibody-producing B-cell clones, achieving higher and faster remission rates compared to corticosteroids alone."
    },

    # ─── 2. PEMPHIGUS FOLIACEUS (PF) ───
    {
        "q": "A {age}-old {gender} presents with a 6-month history of superficial, crusty, and scaly plaques on their face, scalp, and upper back in a 'seborrheic' distribution. The patient reports that these lesions originally began as fragile, fluid-filled blisters that ruptured immediately. Mucous membranes are completely spared. What is the autoantigen targeted in this condition?",
        "options": [
            "Desmoglein 1 only",
            "Desmoglein 3 only",
            "BP180 (Type XVII Collagen)",
            "Laminin-332 (epiligrin)",
            "Desmoplakin and Envoplakin"
        ],
        "answer": 0,
        "exp": "Pemphigus foliaceus (PF) is a superficial variant of pemphigus. Because the target autoantigen is Desmoglein 1 (which is only expressed in the superficial epidermis and is not present in mucous membranes), patients present with superficial, flaccid blisters that rupture easily, leaving hyperkeratotic, crusty plaques resembling 'cornflakes.' Mucosal involvement is characteristically absent because Desmoglein 3 compensates in mucosal tissue."
    },
    {
        "q": "A patient from rural Brazil presents with multiple crusted, erythematous plaques on their face and chest, accompanied by a severe burning sensation. Widespread endemics of this condition occur in certain regions of Brazil, where it is known as 'fogo selvagem'. What is the primary environmental trigger or vector suspected in its pathogenesis?",
        "options": [
            "Bites from the black fly (Simulium nigrimanum)",
            "Ingestion of high-gluten grain products",
            "Chronic exposure to ultraviolet B (UVB) radiation",
            "Reactivation of latent Varicella Zoster Virus",
            "Infestation by Sarcoptes scabiei mites"
        ],
        "answer": 0,
        "exp": "Fogo selvagem is an endemic form of pemphigus foliaceus found in rural parts of Brazil (particularly near rivers). Epidemiological evidence strongly links it to environmental triggers, specifically autoantibody cross-reactivity initiated by salivary antigens from the black fly (Simulium nigrimanum) vector."
    },
    {
        "q": "A {age}-old {gender} presents with multiple superficial, oozing, and crusted erosions on their chest and upper back. A punch biopsy of an active lesion is performed. H&E histopathology reveals very superficial intraepidermal acantholysis with cleavage localized to the subcorneal or granular layer. What is the diagnosis?",
        "options": [
            "Pemphigus Foliaceus",
            "Pemphigus Vulgaris",
            "Bullous Pemphigoid",
            "Dermatitis Herpetiformis",
            "Epidermolysis Bullosa Acquisita"
        ],
        "answer": 0,
        "exp": "In pemphigus foliaceus, acantholysis occurs superficially, classically in the subcorneal or granular layer of the epidermis. This is because Desmoglein 1 (the target of the autoantibodies) is concentrated in the superficial layers of the epidermis, leading to very superficial blister roof breakdown."
    },

    # ─── 3. BULLOUS PEMPHIGOID (BP) ───
    {
        "q": "A {age}-old {gender} presents with severe, generalized itching for 3 months, followed by the sudden eruption of multiple large, firm, tense fluid-filled blisters (bullae) on the abdomen, thighs, and flexor forearms. Stroking of normal skin adjacent to the blisters does not cause epidermal sloughing (negative Nikolsky sign). What is the molecular target of the autoantibodies in this patient's condition?",
        "options": [
            "BP180 (Type XVII Collagen) and BP230",
            "Desmogleins 1 and 3",
            "Type VII Collagen (anchoring fibrils)",
            "Laminin-332 (epiligrin)",
            "Desmoplakin and Periplakin"
        ],
        "answer": 0,
        "exp": "Bullous pemphigoid (BP) is the most common autoimmune subepidermal blistering disease, classically affecting elderly patients. It presents with tense bullae arising on normal or urticarial skin, accompanied by intense pruritus, and exhibits a negative Nikolsky sign. Autoantibodies target hemidesmosomal proteins: BP180 (Type XVII Collagen, a transmembrane protein) and BP230 (an intracellular plakin family protein)."
    },
    {
        "q": "A {age}-old {gender} is evaluated for a severe pruritic eruption featuring tense cutaneous blisters. A biopsy of an early blister reveals subepidermal clefting with a dense inflammatory infiltrate composed predominantly of which cell type?",
        "options": [
            "Eosinophils",
            "Neutrophils",
            "Lymphocytes",
            "Mast cells",
            "Plasma cells"
        ],
        "answer": 0,
        "exp": "Histopathology of bullous pemphigoid characteristically demonstrates subepidermal clefting (split at the dermo-epidermal junction) accompanied by a prominent dermal inflammatory infiltrate rich in eosinophils. Eosinophils are also found abundantly within the blister cavity."
    },
    {
        "q": "A {age}-old {gender} is diagnosed with bullous pemphigoid. A skin biopsy is processed for direct immunofluorescence (DIF). What pattern of deposition along the basement membrane zone (BMZ) is diagnostic?",
        "options": [
            "Linear deposition of IgG and C3 along the dermo-epidermal junction",
            "Granular IgA deposition clustered in the dermal papillae",
            "Intercellular net-like IgG throughout the spinous layer",
            "Linear IgA deposition along the basement membrane",
            "Linear IgM and C3 deposition in a shaggy pattern"
        ],
        "answer": 0,
        "exp": "Direct immunofluorescence (DIF) of perilesional skin in bullous pemphigoid reveals a continuous, bright linear band of IgG and C3 deposition along the basement membrane zone (dermo-epidermal junction)."
    },
    {
        "q": "A {age}-old {gender} presenting with tense bullae undergoes indirect immunofluorescence (IIF) utilizing salt-split human skin. This test shows autoantibody deposition localized to the roof (epidermal side) of the split. What is the most likely diagnosis?",
        "options": [
            "Bullous Pemphigoid",
            "Epidermolysis Bullosa Acquisita (EBA)",
            "Pemphigus Vulgaris",
            "Pemphigus Foliaceus",
            "Dermatitis Herpetiformis"
        ],
        "answer": 0,
        "exp": "Salt-split skin indirect immunofluorescence (IIF) is a crucial test to differentiate bullous pemphigoid (BP) from epidermolysis bullosa acquisita (EBA). Human skin is split through the lamina lucida using 1M sodium chloride. In BP, the autoantibodies target BP180/BP230 which remain on the roof (epidermal side) of the split. In EBA, the antibodies target Type VII Collagen which remains on the floor (dermal side) of the split."
    },
    {
        "q": "An elderly {gender} presents with tense blisters on their trunk. They recently started taking a new medication. Which of the following drugs is most strongly associated with triggering drug-induced Bullous Pemphigoid?",
        "options": [
            "Dipeptidyl peptidase-4 (DPP-4) inhibitors (e.g., Linagliptin, Vildagliptin)",
            "D-Penicillamine",
            "Vancomycin",
            "Sulfonamide antibiotics",
            "Systemic glucocorticoids"
        ],
        "answer": 0,
        "exp": "Dipeptidyl peptidase-4 (DPP-4) inhibitors (gliptins), commonly used for type 2 diabetes, are well-documented triggers for drug-induced bullous pemphigoid. Other classic drug triggers include loop diuretics (furosemide) and beta-blockers. D-Penicillamine is classically associated with drug-induced pemphigus, while Vancomycin triggers linear IgA bullous dermatosis."
    },

    # ─── 4. MUCOUS MEMBRANE PEMPHIGOID (MMP) ───
    {
        "q": "A {age}-old {gender} presents with progressive ocular irritation, severe conjunctival injection, symblepharon (fusion of conjunctiva), and scarring of the oral mucosa. Biopsy of the conjunctiva shows subepidermal clefting with linear IgG/C3 at the basement membrane. Autoantibodies in this cicatricial condition are most commonly directed against which target?",
        "options": [
            "BP180 (C-terminus), Laminin-332 (epiligrin), or Integrin alpha-6 beta-4",
            "Desmoglein 3 and Desmoglein 1",
            "Type VII Collagen in anchoring fibrils",
            "Granular IgA at the dermal papillae tips",
            "Desmoplakin and Envoplakin"
        ],
        "answer": 0,
        "exp": "Mucous membrane pemphigoid (cicatricial pemphigoid) is a chronic autoimmune subepidermal blistering disease characterized by mucosal inflammation and scarring (cicatrization). Classic manifestations include symblepharon (adhesion of eyelids to eyeball), mucosal erosions, and progressive blindness. Autoantibodies target several basement membrane zone proteins, most commonly the distal C-terminus of BP180, Laminin-332 (epiligrin), or Integrin alpha-6 beta-4."
    },
    {
        "q": "A {age}-old {gender} with mucous membrane pemphigoid is found to have high titers of autoantibodies targeting Laminin-332 (epiligrin). What is the critical clinical implication of this specific subtype of pemphigoid?",
        "options": [
            "Significantly increased risk of an underlying solid malignancy (e.g., adenocarcinomas)",
            "Excellent response to Dapsone without systemic steroids",
            "Association with HLA-DQ2 and Celiac Disease",
            "Rapid progression to acute respiratory distress syndrome",
            "Spontaneous resolution without scarring"
        ],
        "answer": 0,
        "exp": "Anti-Laminin-332 (epiligrin) mucous membrane pemphigoid is strongly associated with an increased risk of an underlying solid organ malignancy, particularly adenocarcinomas of the gastrointestinal or genitourinary tracts. Patients diagnosed with this subtype require age-appropriate cancer screenings."
    },

    # ─── 5. EPIDERMOLYSIS BULLOSA ACQUISITA (EBA) ───
    {
        "q": "A {age}-old {gender} presents with tense blisters arising on trauma-prone areas (elbows, knees, and hands) that heal leaving significant scarring, milia, and dystrophic nails. Salt-split skin indirect immunofluorescence shows linear IgG deposition on the floor (dermal side) of the split. What is the target antigen in this condition?",
        "options": [
            "Type VII Collagen (anchoring fibrils)",
            "BP180 (Type XVII Collagen)",
            "Desmogleins 1 and 3",
            "Laminin-332 (epiligrin)",
            "Keratin 5 and Keratin 14"
        ],
        "answer": 0,
        "exp": "Epidermolysis bullosa acquisita (EBA) is an acquired autoimmune mechanobullous disease characterized by tense blisters on trauma-prone skin that heal with scarring, milia, and nail dystrophy. It is caused by autoantibodies targeting Type VII Collagen, which forms the anchoring fibrils that attach the basement membrane to the underlying dermis. Salt-split skin immunofluorescence shows dermal (floor) deposition."
    },

    # ─── 6. DERMATITIS HERPETIFORMIS (DH) ───
    {
        "q": "A {age}-old {gender} presents with an intensely pruritic, stinging, and burning symmetric rash consisting of grouped papulovesicles located on the extensor surfaces of their elbows, knees, and buttocks. They report a history of chronic abdominal bloating and diarrhea. What diagnostic finding on direct immunofluorescence (DIF) is pathognomonic for this condition?",
        "options": [
            "Granular IgA deposition concentrated within the dermal papillae tips",
            "Linear IgG and C3 deposition along the basement membrane zone",
            "Intercellular IgG in a 'fishnet' pattern in the epidermis",
            "Linear IgA deposition along the dermo-epidermal junction",
            "Deposition of IgE along the hair follicles"
        ],
        "answer": 0,
        "exp": "Dermatitis Herpetiformis (DH) is an intensely pruritic, symmetric autoimmune blistering disorder strongly associated with Celiac Disease (gluten-sensitive enteropathy). Direct immunofluorescence (DIF) of perilesional skin is the gold standard and reveals granular IgA deposition concentrated at the tips of the dermal papillae."
    },
    {
        "q": "A {age}-old {gender} with Dermatitis Herpetiformis is prescribed Dapsone, which leads to rapid improvement in their severe skin itching. Which of the following is the most critical screening step required PRIOR to initiating Dapsone therapy?",
        "options": [
            "Glucose-6-Phosphate Dehydrogenase (G6PD) activity level",
            "Human Immunodeficiency Virus (HIV) serology",
            "HLA-B*5701 genetic testing",
            "Thiopurine methyltransferase (TPMT) activity",
            "Serum IgA tissue transglutaminase (tTG) level"
        ],
        "answer": 0,
        "exp": "Before starting Dapsone, it is mandatory to screen patients for Glucose-6-Phosphate Dehydrogenase (G6PD) deficiency. Dapsone causes oxidative stress on red blood cells, which can trigger severe hemolytic anemia and methemoglobinemia in G6PD-deficient individuals."
    },
    {
        "q": "A {age}-old {gender} presenting with symmetric, intensely itchy grouped vesicles on their elbows is diagnosed with Dermatitis Herpetiformis. While Dapsone successfully controls their skin symptoms, what long-term therapy is essential to prevent bowel complications and resolve the disease completely?",
        "options": [
            "Strict lifelong gluten-free diet",
            "Long-term oral Prednisone therapy",
            "Chronic treatment with Rituximab",
            "Avoidance of sun exposure and hot baths",
            "Avoidance of thiol-containing foods"
        ],
        "answer": 0,
        "exp": "While Dapsone is highly effective for rapidly clearing the pruritic cutaneous lesions of Dermatitis Herpetiformis, it does not treat the underlying enteropathy. A strict lifelong gluten-free diet is the essential, disease-modifying therapy. It eventually allows Dapsone to be discontinued and protects against intestinal lymphoma risk."
    },

    # ─── 7. LINEAR IgA BULLOUS DERMATOSIS (LABD) ───
    {
        "q": "A {age}-old {gender} hospitalized for osteomyelitis is treated with intravenous Vancomycin. On day 8 of therapy, they develop a sudden eruption of tense vesicles and bullae arranged in an annular, rosette-like configuration ('crown of jewels' or 'string of pearls') on the trunk and thighs. Direct immunofluorescence (DIF) shows linear IgA deposition along the basement membrane zone. What is the first-line management?",
        "options": [
            "Discontinue Vancomycin immediately and start Dapsone if needed",
            "Initiate high-dose systemic Prednisone while continuing Vancomycin",
            "Apply high-potency topical Clobetasol cream and continue Vancomycin",
            "Initiate urgent intravenous Rituximab",
            "Administer high-dose Intravenous Immunoglobulin (IVIG)"
        ],
        "answer": 0,
        "exp": "Linear IgA Bullous Dermatosis (LABD) can be idiopathic or drug-induced, with Vancomycin being the classic and most common drug trigger. Drug-induced LABD classically presents with a 'string of pearls' or 'crown of jewels' arrangement of vesicles. The most critical first-line action is immediate discontinuation of the offending drug (Vancomycin), which often leads to complete clearing of lesions."
    },

    # ─── 8. PARANEOPLASTIC PEMPHIGUS (PNP) ───
    {
        "q": "A {age}-old {gender} with a history of Non-Hodgkin Lymphoma presents with extremely painful, intractable oral mucosal ulcerations, severe conjunctival erosions, and polymorphous skin lesions including targetoid macules and flaccid bullae. Indirect immunofluorescence (IIF) is positive on rat bladder transitional epithelium. What autoantigens are characteristically targeted in this condition?",
        "options": [
            "Plakin proteins (Envoplakin, Periplakin, Desmoplakin) and Desmogleins",
            "BP180 and BP230 hemidesmosomal proteins",
            "Type VII Collagen of the anchoring fibrils",
            "Tissue transglutaminase and epidermal transglutaminase",
            "Laminin-332 and Integrin alpha-6 beta-4"
        ],
        "answer": 0,
        "exp": "Paraneoplastic Pemphigus (PNP) is a severe, life-threatening autoimmune blistering disease associated with underlying malignancies, most commonly Non-Hodgkin Lymphoma, Chronic Lymphocytic Leukemia, or Castleman disease. Patients present with severe, intractable stomatitis and mucosal erosions. The autoantibodies target plakin proteins (envoplakin, periplakin, desmoplakin, plectin) as well as desmogleins. Indirect immunofluorescence on rat bladder epithelium is highly specific because it contains plakin-rich transitional cells but lacks desmogleins."
    },

    # ─── 9. PEMPHIGOID GESTATIONIS (PG) ───
    {
        "q": "A {age}-old pregnant {gender} in their third trimester presents with severe abdominal itching and an eruption of intensely pruritic urticarial plaques that start in the periumbilical area and progress to form tense vesicles and bullae. The umbilical ring itself is involved. What diagnostic finding on direct immunofluorescence (DIF) is characteristic of this condition?",
        "options": [
            "Linear C3 deposition along the basement membrane zone (with or without IgG)",
            "Granular IgA deposition at the tips of the dermal papillae",
            "Intercellular IgG in a reticular epidermal pattern",
            "Linear IgA along the dermo-epidermal junction",
            "Linear IgE along the outer root sheath of hair follicles"
        ],
        "answer": 0,
        "exp": "Pemphigoid Gestationis (historically called herpes gestationis) is a rare pregnancy-associated autoimmune subepidermal blistering disease. It typically arises in the 2nd/3rd trimester or immediate postpartum. Lesions classically begin in the periumbilical region (involving the umbilicus, unlike PUPPP which spares the umbilicus). Direct immunofluorescence shows linear C3 deposition along the basement membrane zone (IgG is also present but often at levels below direct detection, though it can be detected in the serum via the 'HG factor' complement fixation test)."
    }
]

genders_pool = [
    {"gender": "female", "pronoun": "she", "possessive": "her"},
    {"gender": "male", "pronoun": "he", "possessive": "his"},
    {"gender": "woman", "pronoun": "she", "possessive": "her"},
    {"gender": "man", "pronoun": "he", "possessive": "his"},
    {"gender": "lady", "pronoun": "she", "possessive": "her"},
    {"gender": "gentleman", "pronoun": "he", "possessive": "his"}
]

mcqs = []
counter = 0

# Target: 300 MCQs
while counter < 300:
    for t in templates:
        if counter >= 300:
            break
            
        age = random.randint(22, 84)
        gp = random.choice(genders_pool)
        
        q_text = t['q'].format(age=age, gender=gp['gender'])
        
        # Shuffling options
        opts = list(t['options'])
        correct_opt = opts[t['answer']]
        random.shuffle(opts)
        new_ans_idx = opts.index(correct_opt)
        
        # Double check character replacements
        q_text_escaped = q_text.replace("'", "''")
        opts_json_escaped = json.dumps(opts).replace("'", "''")
        exp_escaped = t['exp'].replace("'", "''")
        
        mcq_str = f"    (v_topic_id, '{q_text_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if mcq_str not in mcqs:
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_derm_autoimmune_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Dermatology: Autoimmune skin conditions\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'derm-autoimmune' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write(f"        RAISE EXCEPTION 'Topic {topic_slug} not found.';\n")
    f.write("    END IF;\n\n")
    
    f.write("    -- Clear existing MCQs for this topic to avoid duplicates\n")
    f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
    
    f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
    
    for i, m in enumerate(mcqs):
        if i < len(mcqs) - 1:
            f.write(m + ",\n")
        else:
            f.write(m + ";\n")
            
    f.write("END $$;\n")
    f.write("COMMIT;\n")

print(f"Generated {len(mcqs)} MCQs to {out_file}")
