-- Migration: Year 3 - Hematology/Oncology MCQ Bank (PART 1: 1-88)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'hematology-oncology' LIMIT 1;

    -- SECTION 1: MICROCYTIC ANEMIAS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '1: What is the most common cause of anemia worldwide?', '["Vitamin B12 deficiency", "Iron Deficiency Anemia", "Folate deficiency", "Sickle Cell"]', 1, 'Usually due to chronic blood loss or inadequate intake. (Harrison''s Ch. 93)'),
    (v_topic_id, '2: "Pica" (craving for non-food items like ice or dirt) and "Koilonychia" (spoon nails) are signs of:', '["Hemolysis", "Severe Iron Deficiency", "Lead poisoning", "Thalassemia"]', 1, 'Physical signs of chronic iron depletion. (Step-Up)'),
    (v_topic_id, '3: In Iron Deficiency Anemia, the Total Iron Binding Capacity (TIBC) is typically:', '["Low", "High", "Normal", "None"]', 1, 'The body produces more transferrin to capture any available iron. (Pocket Medicine)'),
    (v_topic_id, '4: What is the most common cause of iron deficiency in an elderly patient until proven otherwise?', '["Diet", "Gastrointestinal Malignancy/Blood loss", "Pregnancy", "Malabsorption"]', 1, 'Requires workup with Colonoscopy/EGD. (Harrison''s Ch. 93)'),
    (v_topic_id, '5: "Plummer-Vinson Syndrome" includes iron deficiency anemia, glossitis, and:', '["Esophageal webs", "Stomach cancer", "Diarrhea", "Leg cramps"]', 0, 'Associated with an increased risk of squamous cell esophageal cancer. (Step-Up)'),
    (v_topic_id, '6: "Anemia of Chronic Disease" is primarily mediated by which hormone/protein produced in the liver?', '["Erythropoietin", "Hepcidin", "Ferritin", "Albumin"]', 1, 'Hepcidin traps iron in macrophages and reduces absorption. (Pocket Medicine)'),
    (v_topic_id, '7: Unlike Iron Deficiency, Anemia of Chronic Disease typically has a ____ TIBC and a ____ Ferritin.', '["High; Low", "Low; Normal/High", "High; High", "Low; Low"]', 1, 'Iron stores are present but "trapped." (Harrison''s Ch. 93)'),
    (v_topic_id, '8: "Lead Poisoning" shows which classic finding on a peripheral blood smear?', '["Target cells", "Basophilic stippling", "Schistocytes", "Heinz bodies"]', 1, 'Due to inhibition of rRNA degradation. (Step-Up)'),
    (v_topic_id, '9: "Sideroblastic Anemia" is characterized by a failure to incorporate iron into heme. "Ringed sideroblasts" are found in the:', '["Peripheral blood", "Bone marrow", "Liver", "Spleen"]', 1, 'Iron-laden mitochondria encircling the nucleus. (Pocket Medicine)'),
    (v_topic_id, '10: "Mentzer Index" (MCV/RBC count) < 13 suggests ____, while > 13 suggests ____.', '["Iron deficiency; Thalassemia", "Thalassemia; Iron deficiency", "Hemolysis; Blood loss", "None"]', 1, 'Thalassemia has a high RBC count relative to the low MCV. (Harrison''s Ch. 93)');

    -- SECTION 2: THALASSEMIAS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '11: Alpha-thalassemia is primarily caused by gene ____, while Beta-thalassemia is caused by gene ____.', '["Mutation; Deletion", "Deletion; Mutation", "Duplication; Deletion", "None"]', 1, 'Alpha has 4 genes; Beta has 2. (Step-Up)'),
    (v_topic_id, '12: A patient with deletion of 3 alpha genes has "Hemoglobin H disease," which shows ____ on electrophoresis.', '["HbA2", "HbH (Beta-4 tetramers)", "HbF", "HbBart''s"]', 1, 'HbH is unstable and causes hemolysis. (Pocket Medicine)'),
    (v_topic_id, '13: "Hydrops Fetalis" occurs when ____ alpha genes are deleted.', '["One", "Two", "Three", "Four (Hb Bart''s)"]', 3, 'Incompatible with life; Gamma-4 tetramers have too high oxygen affinity. (Harrison''s Ch. 94)'),
    (v_topic_id, '14: "Beta-Thalassemia Major" (Cooley''s Anemia) becomes symptomatic at 6 months of life when ____ decreases.', '["HbA", "HbF (Fetal Hemoglobin)", "HbA2", "HbS"]', 1, 'Gamma chain production switches to Beta. (Step-Up)'),
    (v_topic_id, '15: "Chipmunk facies" and "Crew-cut" appearance on X-ray in Thalassemia are due to:', '["Infection", "Extramedullary hematopoiesis and marrow expansion", "Cancer", "Malnutrition"]', 1, 'The body is desperately trying to make more RBCs. (Pocket Medicine)'),
    (v_topic_id, '16: What is the most common cause of death in patients with Beta-Thalassemia Major receiving chronic transfusions?', '["Anemia", "Iron Overload (Hemochromatosis) causing heart failure", "Infection", "Stroke"]', 1, 'Requires aggressive iron chelation therapy. (Harrison''s Ch. 94)'),
    (v_topic_id, '17: Thalassemia peripheral smear classically shows which cell type?', '["Schistocytes", "Target cells", "Spherocytes", "Bite cells"]', 1, 'Due to relative membrane excess. (Step-Up)'),
    (v_topic_id, '18: "Hemoglobin A2" (Alpha-2, Delta-2) is elevated in which condition?', '["Alpha-thalassemia", "Beta-thalassemia minor", "Sickle cell", "Iron deficiency"]', 1, 'Used as a diagnostic marker on electrophoresis. (Pocket Medicine)'),
    (v_topic_id, '19: Patients with Thalassemia trait are often misdiagnosed as having:', '["B12 deficiency", "Iron Deficiency Anemia", "Leukemia", "None"]', 1, 'Both have low MCV, but Thalassemia has normal/high iron. (Harrison''s Ch. 94)'),
    (v_topic_id, '20: What is the definitive treatment for Thalassemia Major?', '["Iron pills", "Allogeneic Bone Marrow Transplant", "Splenectomy only", "Folate"]', 1, 'Can be curative in young patients. (Step-Up)');

    -- SECTION 3: MACROCYTIC ANEMIAS (MEGALOBLASTIC)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '21: Megaloblastic anemia is characterized by which finding on a blood smear?', '["Target cells", "Hypersegmented Neutrophils (>5 lobes)", "Schistocytes", "Spherocytes"]', 1, 'Sign of impaired DNA synthesis. (Harrison''s Ch. 95)'),
    (v_topic_id, '22: Which vitamin deficiency causes megaloblastic anemia AND neurological symptoms (ataxia, paresthesias)?', '["Folate (B9)", "Vitamin B12 (Cobalamin)", "Vitamin C", "Vitamin D"]', 1, 'B12 is required for myelin maintenance. (Step-Up)'),
    (v_topic_id, '23: "Subacute Combined Degeneration" of the spinal cord in B12 deficiency involves the:', '["Anterior horns", "Dorsal columns and Lateral corticospinal tracts", "Occipital lobe", "Cerebellum"]', 1, 'Causes loss of vibration/position sense. (Pocket Medicine)'),
    (v_topic_id, '24: "Pernicious Anemia" is an autoimmune destruction of ____ cells in the stomach, leading to a lack of ____.', '["Goblet; Acid", "Parietal; Intrinsic Factor", "Chief; Pepsin", "Mucous; Bicarb"]', 1, 'Intrinsic factor is required for B12 absorption in the ileum. (Harrison''s Ch. 95)'),
    (v_topic_id, '25: "Folate deficiency" is most commonly seen in which population?', '["Athletes", "Chronic Alcoholics and Malnourished", "Children", "Elderly smokers"]', 1, 'Folate stores are small (only last 3-4 months). (Step-Up)'),
    (v_topic_id, '26: Which lab value is elevated in B12 deficiency but NORMAL in folate deficiency?', '["Homocysteine", "Methylmalonic Acid (MMA)", "Ferritin", "Bilirubin"]', 1, 'Specific marker for B12 metabolic pathway. (Pocket Medicine)'),
    (v_topic_id, '27: "Diphyllobothrium latum" (fish tapeworm) can cause deficiency of which vitamin?', '["Vitamin A", "Vitamin B12", "Vitamin E", "Vitamin K"]', 1, 'Competes with the host for B12 in the gut. (Harrison''s Ch. 95)'),
    (v_topic_id, '28: Large doses of Folate can "mask" a B12 deficiency by fixing the anemia but allowing ____ to progress.', '["Vision loss", "Neurological damage", "Liver failure", "Kidney failure"]', 1, 'Never treat macrocytic anemia with folate alone until B12 is checked. (Step-Up)'),
    (v_topic_id, '29: "Howell-Jolly bodies" in the blood suggest:', '["Iron deficiency", "Functional or surgical Asplenia", "Hemolysis", "B12 deficiency"]', 1, 'Nuclear remnants normally cleared by the spleen. (Pocket Medicine)'),
    (v_topic_id, '30: A "non-megaloblastic" macrocytic anemia (without hypersegmented neutrophils) can be seen in:', '["B12 deficiency", "Liver disease, Hypothyroidism, or Alcohol use", "Folate deficiency", "None"]', 1, 'Often due to lipid changes in the RBC membrane. (Harrison''s Ch. 95)');

    -- SECTION 4: HEMOLYTIC ANEMIAS (GENERAL & INTRINSIC)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '31: Which of the following is a sign of INTRAVASCULAR hemolysis?', '["Jaundice", "Hemoglobinuria and Low Haptoglobin", "Splenomegaly", "Gallstones"]', 1, 'Haptoglobin binds free hemoglobin released into the blood. (Step-Up)'),
    (v_topic_id, '32: "Hereditary Spherocytosis" is caused by a defect in RBC membrane proteins, most commonly:', '["Hemoglobin", "Ankyrin or Spectrin", "G6PD", "Iron"]', 1, 'Leads to spherical cells that are trapped in the spleen. (Pocket Medicine)'),
    (v_topic_id, '33: The screening test for Hereditary Spherocytosis is:', '["Coombs test", "Osmotic Fragility Test or EMA binding", "Electrophoresis", "Iron studies"]', 1, 'Spherocytes burst easily in hypotonic solutions. (Harrison''s Ch. 94)'),
    (v_topic_id, '34: What is the definitive treatment for symptomatic Hereditary Spherocytosis?', '["Iron", "Splenectomy", "Transfusion only", "Steroids"]', 1, 'Does not fix the cells but stops their destruction. (Step-Up)'),
    (v_topic_id, '35: "G6PD Deficiency" causes hemolysis when RBCs are exposed to:', '["Cold", "Oxidative stress (e.g., Fava beans, Sulfa drugs, Infection)", "Sugar", "Fat"]', 1, 'RBCs cannot regenerate glutathione to protect against ROS. (Pocket Medicine)'),
    (v_topic_id, '36: "Heinz bodies" and "Bite cells" on a smear are characteristic of:', '["Thalassemia", "G6PD Deficiency", "Sickle cell", "B12 deficiency"]', 1, 'Heinz bodies are precipitated hemoglobin; splenic macrophages "bite" them out. (Harrison''s Ch. 94)'),
    (v_topic_id, '37: "Paroxysmal Nocturnal Hemoglobinuria" (PNH) is due to a deficiency of:', '["Iron", "GPI-anchored proteins (CD55/CD59)", "Heme", "Vitamin C"]', 1, 'Leaves RBCs vulnerable to complement-mediated destruction. (Step-Up)'),
    (v_topic_id, '38: PNH classically presents with "cola-colored" urine in the morning and a high risk of:', '["Bleeding", "Venous Thrombosis (e.g., Budd-Chiari syndrome)", "Infection", "Heart failure"]', 1, 'Leading cause of death in PNH. (Pocket Medicine)'),
    (v_topic_id, '39: The primary treatment for PNH is ____, which blocks the complement cascade.', '["Steroids", "Eculizumab", "Warfarin", "Iron"]', 1, 'Monoclonal antibody against C5. (Harrison''s Ch. 94)'),
    (v_topic_id, '40: "Direct Antiglobulin Test (DAT/Coombs)" is POSITIVE in which condition?', '["G6PD deficiency", "Autoimmune Hemolytic Anemia (AIHA)", "Hereditary Spherocytosis", "Thalassemia"]', 1, 'Detects antibodies or complement already bound to RBCs. (Step-Up)');

    -- SECTION 5: SICKLE CELL DISEASE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '41: Sickle Cell Disease is caused by a point mutation (Valine for Glutamic acid) in the ____ chain.', '["Alpha", "Beta", "Gamma", "Delta"]', 1, 'HbS polymerizes when deoxygenated. (Harrison''s Ch. 94)'),
    (v_topic_id, '42: "Autosplenectomy" (shrunken, fibrotic spleen) in Sickle Cell patients is caused by:', '["Infection", "Repeated splenic infarctions", "Cancer", "None"]', 1, 'Usually complete by age 5. (Step-Up)'),
    (v_topic_id, '43: Sickle Cell patients are at increased risk of sepsis from which type of bacteria?', '["Gram-negative rods", "Encapsulated bacteria (S. pneumoniae, H. influenzae, N. meningitidis)", "Anaerobes", "Fungi"]', 1, 'Due to functional asplenia. (Pocket Medicine)'),
    (v_topic_id, '44: "Acute Chest Syndrome" in Sickle Cell is a leading cause of death and presents with:', '["Abdominal pain", "Fever, chest pain, and new lung infiltrate", "Headache", "Swollen joints"]', 1, 'Emergency; may require exchange transfusion. (Harrison''s Ch. 94)'),
    (v_topic_id, '45: "Dactylitis" (hand-foot syndrome) is often the first sign of SCD in infants, presenting with:', '["Rash", "Symmetric swelling and pain of hands and feet", "Blindness", "Cough"]', 1, 'Due to microvascular occlusion. (Step-Up)'),
    (v_topic_id, '46: Which medication increases "Hemoglobin F" levels and reduces the frequency of sickle crises?', '["Aspirin", "Hydroxyurea", "Penicillin", "Iron"]', 1, 'HbF interferes with HbS polymerization. (Pocket Medicine)'),
    (v_topic_id, '47: Sickle Cell patients with a sudden drop in hemoglobin and LOW reticulocyte count likely have:', '["Vaso-occlusive crisis", "Aplastic Crisis (usually from Parvovirus B19)", "Splenic sequestration", "Hemolysis"]', 1, 'The virus stops RBC production. (Harrison''s Ch. 94)'),
    (v_topic_id, '48: "Osteomyelitis" in a Sickle Cell patient is classically associated with which organism?', '["Staph aureus", "Salmonella", "Pseudomonas", "E. coli"]', 1, 'S. aureus is still common, but Salmonella is a high-yield association. (Step-Up)'),
    (v_topic_id, '49: "Papillary Necrosis" in the kidney causing hematuria is a common complication of:', '["Iron deficiency", "Sickle Cell Trait or Disease", "B12 deficiency", "None"]', 1, 'Vaso-occlusion in the renal medulla. (Pocket Medicine)'),
    (v_topic_id, '50: "Target cells" and "Howell-Jolly bodies" on a smear of a 10-year-old SCD patient suggest:', '["Recovery", "Functional asplenia", "Active infection", "Iron overdose"]', 1, 'The spleen is no longer filtering these cells. (Harrison''s Ch. 94)');

    -- SECTION 6: COAGULATION BASICS (PLATELETS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '51: "Primary Hemostasis" involves the formation of the:', '["Fibrin clot", "Platelet plug", "Thrombus", "Scab"]', 1, 'Defects lead to mucosal bleeding (epistaxis, petechiae). (Step-Up)'),
    (v_topic_id, '52: What is the most common inherited bleeding disorder?', '["Hemophilia A", "von Willebrand Disease (vWD)", "Hemophilia B", "Factor V Leiden"]', 1, 'Deficiency or dysfunction of vWF. (Pocket Medicine)'),
    (v_topic_id, '53: "von Willebrand Factor" (vWF) is required for platelet ____ to the subendothelium.', '["Aggregation", "Adhesion", "Activation", "Production"]', 1, 'Acts as a "bridge" via GpIb receptors. (Harrison''s Ch. 122)'),
    (v_topic_id, '54: "Immune Thrombocytopenic Purpura" (ITP) is characterized by isolated low platelets due to:', '["Marrow failure", "Autoantibodies against platelets", "Splenomegaly", "Infection"]', 1, 'Usually a diagnosis of exclusion. (Step-Up)'),
    (v_topic_id, '55: "Thrombotic Thrombocytopenic Purpura" (TTP) is caused by a deficiency of which enzyme?', '["G6PD", "ADAMTS13", "Protein C", "Antithrombin"]', 1, 'Leads to large vWF multimers and microthrombi. (Pocket Medicine)'),
    (v_topic_id, '56: The classic TTP pentad includes Fever, Microangiopathic Hemolytic Anemia (MAHA), Thrombocytopenia, Renal failure, and:', '["Joint pain", "Neurological symptoms (e.g., confusion, stroke)", "Rash", "Cough"]', 1, 'MAHA + Thrombocytopenia is enough to trigger urgent treatment. (Harrison''s Ch. 122)'),
    (v_topic_id, '57: What is the emergency treatment for TTP?', '["Platelet transfusion", "Plasmapheresis (Plasma exchange)", "Antibiotics", "Heparin"]', 1, 'NEVER give platelets as it can "fuel the fire." (Step-Up)'),
    (v_topic_id, '58: "Schistocytes" (helmet cells) on a blood smear are a hallmark of:', '["Iron deficiency", "Microangiopathic Hemolytic Anemia (e.g., TTP, HUS, DIC)", "Sickle cell", "Spherocytosis"]', 1, 'RBCs are sheared as they pass through fibrin mesh. (Pocket Medicine)'),
    (v_topic_id, '59: "Hemolytic Uremic Syndrome" (HUS) is classically associated with which infection in children?', '["Staph aureus", "E. coli O157:H7 (Shiga toxin)", "Salmonella", "Streptococcus"]', 1, 'Presents after a prodrome of bloody diarrhea. (Harrison''s Ch. 122)'),
    (v_topic_id, '60: "Bernard-Soulier Syndrome" is a defect in platelet ____ (GpIb receptor).', '["Aggregation", "Adhesion", "Secretion", "None"]', 1, 'Shows large platelets on smear. (Step-Up)');

    -- SECTION 7: COAGULATION BASICS (CLOTTING FACTORS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '61: "Secondary Hemostasis" involves the coagulation cascade to form a stable ____ clot.', '["Platelet", "Fibrin", "Albumin", "Heme"]', 1, 'Defects lead to deep tissue bleeding (hemarthrosis). (Pocket Medicine)'),
    (v_topic_id, '62: "Prothrombin Time" (PT/INR) evaluates the ____ pathway.', '["Intrinsic", "Extrinsic", "Common", "Platelet"]', 1, 'Mainly Factor VII. (Harrison''s Ch. 122)'),
    (v_topic_id, '63: "Activated Partial Thromboplastin Time" (aPTT) evaluates the ____ pathway.', '["Extrinsic", "Intrinsic", "Platelet", "Fibrin"]', 1, 'Factors XII, XI, IX, VIII. (Step-Up)'),
    (v_topic_id, '64: "Hemophilia A" is a deficiency of Factor ____.', '["VII", "VIII", "IX", "XI"]', 1, 'X-linked recessive inheritance. (Pocket Medicine)'),
    (v_topic_id, '65: "Hemophilia B" (Christmas Disease) is a deficiency of Factor ____.', '["VIII", "IX", "X", "V"]', 1, 'Clinically indistinguishable from Hemophilia A. (Harrison''s Ch. 122)'),
    (v_topic_id, '66: Which vitamin is required for the synthesis of Factors II, VII, IX, X, Protein C, and Protein S?', '["Vitamin A", "Vitamin K", "Vitamin C", "Vitamin D"]', 1, 'Warfarin inhibits this vitamin''s recycling. (Step-Up)'),
    (v_topic_id, '67: "Disseminated Intravascular Coagulation" (DIC) is characterized by both widespread ____ and ____.', '["Fever; Chills", "Clotting; Bleeding", "Anemia; Leukemia", "None"]', 1, 'Consumptive coagulopathy. (Pocket Medicine)'),
    (v_topic_id, '68: In DIC, PT, aPTT, and D-dimer are ____, while Fibrinogen is ____.', '["Low; High", "High; Low", "Normal; Normal", "None"]', 1, 'Fibrinogen is consumed in the clotting process. (Harrison''s Ch. 122)'),
    (v_topic_id, '69: "Vitamin K deficiency" is common in newborns, which is why they receive an IM injection at birth to prevent:', '["Infection", "Vitamin K Deficiency Bleeding (VKDB)", "Jaundice", "Diarrhea"]', 1, 'Liver stores are low and gut flora is absent. (Step-Up)'),
    (v_topic_id, '70: "Mixing Study" that fails to correct the aPTT suggests the presence of a/an:', '["Factor deficiency", "Inhibitor (e.g., Lupus anticoagulant, Factor antibody)", "Infection", "None"]', 1, 'If it corrects, it was a deficiency. (Pocket Medicine)');

    -- SECTION 8: HYPERCOAGULABLE STATES (THROMBOPHILIA)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '71: What is the most common inherited cause of hypercoagulability (thrombophilia)?', '["Protein C deficiency", "Factor V Leiden", "Antithrombin deficiency", "Prothrombin mutation"]', 1, 'Factor V is resistant to inactivation by Protein C. (Harrison''s Ch. 123)'),
    (v_topic_id, '72: "Protein C" and "Protein S" are natural ____.', '["Clotting factors", "Anticoagulants", "Antibodies", "Platelets"]', 1, 'They inactivate Factors Va and VIIIa. (Step-Up)'),
    (v_topic_id, '73: "Antiphospholipid Syndrome" (APS) presents with recurrent thrombosis and:', '["Fever", "Pregnancy loss", "Weight gain", "Bleeding"]', 1, 'Associated with Lupus anticoagulant and Anticardiolipin antibodies. (Pocket Medicine)'),
    (v_topic_id, '74: "Heparin-Induced Thrombocytopenia" (HIT) is caused by antibodies against:', '["Platelets only", "Heparin-Platelet Factor 4 (PF4) complex", "Factor X", "Thrombin"]', 1, 'Paradoxically increases the risk of thrombosis. (Harrison''s Ch. 123)'),
    (v_topic_id, '75: What is the FIRST step when HIT is suspected?', '["Give more heparin", "Stop all heparin and start a non-heparin anticoagulant (e.g., Argatroban)", "Give platelets", "Warfarin only"]', 1, 'Crucial to prevent catastrophic thrombosis. (Step-Up)'),
    (v_topic_id, '76: "Warfarin-induced skin necrosis" can occur in patients with an underlying deficiency of:', '["Iron", "Protein C or S", "Factor VIII", "Vitamin C"]', 1, 'Warfarin initially creates a pro-thrombotic state as Protein C drops first. (Pocket Medicine)'),
    (v_topic_id, '77: Which hypercoagulable state is most strongly associated with venous AND arterial clots?', '["Factor V Leiden", "Antiphospholipid Syndrome", "Protein C deficiency", "Prothrombin G20210A"]', 1, 'Most others are primarily venous. (Harrison''s Ch. 123)'),
    (v_topic_id, '78: "Antithrombin III" deficiency makes the patient resistant to the action of:', '["Warfarin", "Heparin", "Aspirin", "Clopidogrel"]', 1, 'Heparin requires Antithrombin to work. (Step-Up)'),
    (v_topic_id, '79: A 25-year-old with a DVT and a positive family history should be screened for:', '["Infection", "Thrombophilia (Hypercoagulable states)", "Diabetes", "Asthma"]', 1, 'Workup usually performed after the acute event resolves. (Pocket Medicine)'),
    (v_topic_id, '80: "Virchow''s Triad" for thrombosis includes Stasis, Hypercoagulability, and:', '["Fever", "Endothelial Injury", "Obesity", "Smoking"]', 1, 'Classic framework for understanding DVT/PE risk. (Harrison''s Ch. 123)');

    -- SECTION 9: TRANSFUSION MEDICINE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '81: "TRALI" (Transfusion-Related Acute Lung Injury) is characterized by sudden pulmonary edema and ____ within 6 hours.', '["High fever", "Hypotension", "Hypertension", "None"]', 1, 'Due to donor antibodies reacting with recipient neutrophils. (Harrison''s Ch. 119)'),
    (v_topic_id, '82: "TACO" (Transfusion-Associated Circulatory Overload) presents with pulmonary edema and ____.', '["Low BP", "Hypertension and high JVP", "Fever", "Rash"]', 1, 'Simply a volume overload problem; treated with diuretics. (Step-Up)'),
    (v_topic_id, '83: "Acute Hemolytic Transfusion Reaction" is most commonly due to ____ incompatibility.', '["Rh", "ABO (clerical error)", "HLA", "IgA"]', 1, 'Presents with fever, flank pain, and DIC. (Pocket Medicine)'),
    (v_topic_id, '84: "Febrile Non-hemolytic Transfusion Reaction" (FNHTR) is a benign rise in temp caused by:', '["Bacteria", "Cytokines released from donor WBCs during storage", "Virus", "None"]', 1, 'The most common transfusion reaction. (Harrison''s Ch. 119)'),
    (v_topic_id, '85: An IgA-deficient patient is at risk for ____ during blood transfusion.', '["Fever", "Anaphylaxis", "Heart failure", "None"]', 1, 'Requires washed RBCs. (Step-Up)'),
    (v_topic_id, '86: "Delayed Hemolytic Transfusion Reaction" occurs 1-2 weeks later due to a/an ____ response.', '["Infection", "Anamnestic antibody response (often Rh or Kidd)", "Allergy", "None"]', 1, 'Presents with a drop in hemoglobin and mild jaundice. (Pocket Medicine)'),
    (v_topic_id, '87: "Cryoprecipitate" is used primarily to replace:', '["Albumin", "Fibrinogen and Factor VIII/vWF", "Platelets", "RBCs"]', 1, 'Often used in DIC or massive hemorrhage. (Harrison''s Ch. 119)'),
    (v_topic_id, '88: "Fresh Frozen Plasma" (FFP) contains:', '["Only Factor VIII", "All clotting factors and proteins", "Platelets", "None"]', 1, 'Used to reverse Warfarin or in multiple factor deficiencies. (Step-Up)');

    RAISE NOTICE 'SUCCESS: Hematology/Oncology MCQ Part 1 (1-88) registered.';
END $$;

COMMIT;
