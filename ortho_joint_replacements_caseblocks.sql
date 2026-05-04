-- Orthopedics: Joint replacements — indications & complications
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ortho-joint-replacements

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-joint-replacements' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ortho-joint-replacements';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Primary Hip Osteoarthritis (THA Indications)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bone-on-Bone Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bone-on-Bone Hip', 'A 68-year-old male presents with severe right groin pain that limits his walking distance to one block. He has failed 6 months of physical therapy, NSAIDs, and weight loss.

Vitals: Stable.
Physical Examination: Severely restricted internal rotation and abduction of the right hip. Trendelenburg sign is positive on the right.
Laboratory Results: X-rays show asymmetric joint space narrowing, subchondral sclerosis, and large osteophytes (Kellgren-Lawrence Grade IV).', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old with end-stage OA; failed conservative management.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary absolute indication for Total Hip Arthroplasty (THA) in this patient?', '["Age > 65", "Presence of osteophytes on X-ray", "Debilitating pain and functional limitation that has failed conservative management", "Positive Trendelenburg sign"]', 2, 'Arthroplasty is a quality-of-life procedure; the primary indication is failure of non-operative treatment for severe pain and functional loss.'),
    (v_case_id, 'Which radiographic finding is most characteristic of advanced osteoarthritis?', '["Symmetric joint space narrowing", "Subchondral bone cysts and sclerosis", "Osteopenia", "Soft tissue swelling"]', 1, 'Asymmetric joint space narrowing, subchondral sclerosis, cysts, and osteophytes are the classic radiographic hallmarks of OA.'),
    (v_case_id, 'True or False: Asymptomatic radiographic osteoarthritis is a valid indication for THA.', '["True", "False"]', 1, 'We treat the patient, not the X-ray. Surgery is reserved for symptomatic patients.');

    ---------------------------------------------------------------------------
    -- CASE 02: Avascular Necrosis (AVN) of the Hip
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Steroid-Induced Ache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Steroid-Induced Ache', 'A 35-year-old male with a history of systemic lupus erythematosus (SLE) treated with long-term high-dose steroids presents with deep, boring groin pain.

Vitals: Stable.
Physical Examination: Pain with internal rotation. No visible deformity.
Laboratory Results: Initial X-rays are normal. MRI shows a characteristic "double-line sign" on T2-weighted images in the femoral head.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old on steroids with groin pain; MRI shows AVN.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Crescent Sign" on a lateral hip X-ray?', '["A sign of early infection", "A subchondral fracture representing impending collapse of the femoral head", "A normal finding in young adults", "A sign of a labral tear"]', 1, 'The crescent sign indicates Ficat/Arlet Stage III AVN (subchondral collapse).'),
    (v_case_id, 'Which of the following is NOT a known risk factor for AVN?', '["Alcoholism", "Steroid use", "Sickle Cell Disease", "Vitamin D deficiency"]', 3, 'Steroids, alcohol, and hemoglobinopathies are major risk factors. Vitamin D deficiency causes osteomalacia, not AVN.'),
    (v_case_id, 'In a young patient (e.g., 35 years old) with Ficat Stage II AVN (no collapse), what is a common joint-preserving surgical option?', '["Total Hip Arthroplasty", "Core Decompression", "Girdlestone procedure", "Hemiarthroplasty"]', 1, 'Core decompression aims to reduce intraosseous pressure and promote revascularization before collapse occurs.');

    ---------------------------------------------------------------------------
    -- CASE 03: Rheumatoid Arthritis (Inflammatory Hip)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Protrusio Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Protrusio Hip', 'A 50-year-old female with long-standing Rheumatoid Arthritis presents with bilateral hip pain.

Vitals: Stable.
Physical Examination: Limited range of motion in all planes. Hand examination shows ulnar deviation and swan-neck deformities.
Laboratory Results: X-rays show symmetric joint space narrowing and medial migration of the femoral head beyond the ilioischial line (Protrusio Acetabuli).', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old with RA and Protrusio Acetabuli.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Protrusio Acetabuli"?', '["Lateral displacement of the femoral head", "Medial displacement of the femoral head beyond the ilioischial line", "A fracture of the acetabulum", "None"]', 1, 'It is common in inflammatory arthropathies and requires special attention to cup positioning during THA.'),
    (v_case_id, 'How does the timing of THA in RA patients differ from OA patients?', '["RA patients should wait until they are older", "RA patients often require surgery earlier due to rapid joint destruction and systemic involvement", "THA is contraindicated in RA", "None"]', 1, 'Inflammatory arthritis can lead to much faster joint destruction than degenerative OA.'),
    (v_case_id, 'Which perioperative medication concern is specific to RA patients?', '["Management of DMARDs and Biologics (e.g., Methotrexate, Etanercept) to balance infection risk and disease flares", "Aspirin use", "Vitamin C", "None"]', 0, 'Timing of biologics is critical to minimize the risk of periprosthetic infection.');

    ---------------------------------------------------------------------------
    -- CASE 04: Post-traumatic Arthritis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hardware Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hardware Hip', 'A 55-year-old male underwent Open Reduction Internal Fixation (ORIF) for an acetabular fracture 5 years ago. He now has debilitating hip pain.

Vitals: Stable.
Physical Examination: Surgical scar over the lateral hip. Pain with all motion.
Laboratory Results: X-rays show severe arthritis and several retained screws in the posterior wall of the acetabulum.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old with arthritis after previous acetabular ORIF.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'THA after previous acetabular fracture surgery is associated with:', '["Higher rates of infection and longer operative time", "Better outcomes than primary THA", "Lower risk of nerve injury", "None"]', 0, 'Previous hardware, scarring, and bone loss make these cases more complex.'),
    (v_case_id, 'What is the most important pre-operative step for this patient?', '["Checking for hardware interference and potential infection (ESR/CRP)", "Giving double doses of antibiotics", "Ordering a PET scan", "None"]', 0, 'Hardware may need removal, and silent infection must be ruled out in any "post-traumatic" joint.'),
    (v_case_id, 'True or False: Outcome scores for post-traumatic THA are generally equivalent to primary THA for osteoarthritis.', '["True", "False"]', 1, 'Outcomes are generally good, but slightly inferior to primary OA THA due to complexity.');

    ---------------------------------------------------------------------------
    -- CASE 05: Developmental Dysplasia of the Hip (DDH)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High-Riding Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High-Riding Hip', 'A 40-year-old female presents with severe hip pain. She was born with a "dislocated hip" that was treated with a harness.

Vitals: Stable.
Physical Examination: 3 cm leg length discrepancy (short on the affected side). Trendelenburg gait.
Laboratory Results: X-rays show a shallow acetabulum and a femoral head that is displaced 50% superiorly (Crowe Grade II).', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 40-year-old with DDH (Crowe II); shallow acetabulum and LLD.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The Crowe Classification for DDH is based on:', '["The degree of femoral head subluxation/dislocation relative to the height of the acetabulum", "The age of the patient", "The weight of the patient", "The thickness of the labrum"]', 0, 'Crowe I is <50%, Crowe IV is 100% (complete dislocation).'),
    (v_case_id, 'What is a major surgical challenge in THA for DDH?', '["The acetabulum is often very shallow and deficient in bone", "The femur is too large", "The nerves are in the wrong place", "None"]', 0, 'Bone grafting or special "high hip center" techniques may be needed.'),
    (v_case_id, 'What is the risk of lengthening the leg by more than 3-4 cm in a high-dislocation DDH case?', '["Sciatic nerve palsy", "Instant recovery", "Increased height", "None"]', 0, 'Over-stretching the soft tissues can lead to neurological injury.');

    ---------------------------------------------------------------------------
    -- CASE 06: Pre-operative Templating
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blueprint' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blueprint', 'A surgeon is planning a THA for a patient with a significant Leg Length Discrepancy (LLD).

Vitals: N/A.
Physical Examination: Affected leg is 2 cm shorter.
Laboratory Results: AP Pelvis X-ray with a magnification marker is used for digital templating.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pre-operative templating for THA with LLD.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the purpose of a "magnification marker" (e.g., a 25mm ball) during templating?', '["To keep the patient still", "To calibrate the digital software to account for X-ray magnification", "To measure the patient''s weight", "None"]', 1, 'Without calibration, the implant sizes will be incorrect.'),
    (v_case_id, 'What is "Offset" in THA?', '["The length of the leg", "The horizontal distance from the center of the femoral head to the anatomical axis of the femur", "The angle of the cup", "None"]', 1, 'Restoring offset is critical for hip stability and abductor muscle function.'),
    (v_case_id, 'If a patient perceives their leg as "too long" immediately after surgery, what is the first management step?', '["Immediate revision surgery", "Reassurance and use of a shoe lift on the other side if necessary (most settle after 6-12 weeks)", "Traction", "None"]', 1, 'Many patients have "apparent" LLD due to pelvic tilt that resolves with therapy.');

    ---------------------------------------------------------------------------
    -- CASE 07: Cemented vs. Uncemented THA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fixation Choice' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fixation Choice', 'An 85-year-old female with severe osteoporosis (Dorr Type C femur) requires THA.

Vitals: Stable.
Physical Examination: Frail patient, poor bone quality.
Laboratory Results: X-rays show a "stove-pipe" femur with very thin cortices.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 85-year-old with poor bone quality; choosing fixation.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is a cemented femoral stem often preferred in this 85-year-old patient?', '["It is cheaper", "Osteoporotic bone may not provide reliable \"press-fit\" or biological ingrowth for an uncemented stem", "Cement is stronger than bone", "None"]', 1, 'Cement provides immediate stability in poor quality bone.'),
    (v_case_id, 'What is the "Dorr Classification"?', '["A way to classify hip fractures", "A classification of femoral bone quality and shape (Type A, B, C)", "A nerve injury scale", "None"]', 1, 'Dorr Type A is "champagne flute" (thick cortex), Type C is "stove-pipe" (thin cortex).'),
    (v_case_id, 'Which complication is more common with uncemented stems in elderly patients with poor bone?', '["Periprosthetic fracture during insertion", "Infection", "Allergy to the metal", "None"]', 0, 'Wedging an uncemented stem into fragile bone can cause the femur to crack.');

    ---------------------------------------------------------------------------
    -- CASE 08: THA Bearing Surfaces
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Squeaky Joint' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Squeaky Joint', 'A 45-year-old patient receives a THA with a Ceramic-on-Ceramic (CoC) bearing.

Vitals: N/A.
Physical Examination: Normal gait. Patient reports an occasional audible "squeak."
Laboratory Results: X-rays show well-fixed components.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old with CoC bearing and audible squeaking.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary advantage of Ceramic-on-Ceramic (CoC) or Ceramic-on-Poly bearings?', '["They are the cheapest", "Extremely low wear rates, making them ideal for younger, active patients", "They never break", "None"]', 1, 'Minimizing polyethylene wear particles reduces the risk of osteolysis and loosening.'),
    (v_case_id, 'Which bearing surface is associated with the highest risk of "catastrophic fracture" of the component?', '["Metal", "Ceramic", "Polyethylene", "None"]', 1, 'While modern ceramics are very tough, they are brittle and can shatter if struck with extreme force.'),
    (v_case_id, 'What is "Osteolysis" in the context of arthroplasty?', '["Bone growth", "Bone loss caused by a chronic inflammatory response to wear debris (usually polyethylene)", "A type of infection", "None"]', 1, 'Macrophages ingest wear particles and release cytokines that activate osteoclasts.');

    ---------------------------------------------------------------------------
    -- CASE 09: Surgical Approaches (Anterior vs. Posterior)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Way In' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Way In', 'A patient is discussing the Direct Anterior Approach (DAA) vs. the Posterior Approach for his THA.

Vitals: Stable.
Physical Examination: N/A.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Comparison of THA surgical approaches.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve is at unique risk during the Direct Anterior Approach (DAA)?', '["Sciatic nerve", "Lateral Femoral Cutaneous Nerve (LFCN)", "Obturator nerve", "Ulnar nerve"]', 1, 'The LFCN is often encountered or stretched during the DAA incision.'),
    (v_case_id, 'The Posterior Approach involves splitting which major muscle?', '["Gluteus Maximus", "Gluteus Medius", "Quadriceps", "Psoas"]', 0, 'It also requires releasing the short external rotators (which are then repaired).'),
    (v_case_id, 'True or False: Long-term outcomes (at 1-2 years) are generally the same regardless of the surgical approach used.', '["True", "False"]', 0, 'While early recovery may differ, long-term function and implant survival are comparable.');

    ---------------------------------------------------------------------------
    -- CASE 10: Dual Mobility Components
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High-Risk Dislocator' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High-Risk Dislocator', 'A 75-year-old with Parkinson''s disease and severe lumbar spine fusion (stiff spine) requires THA.

Vitals: Stable.
Physical Examination: Significant tremors and poor balance.
Laboratory Results: X-rays show severe hip OA.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A high-risk patient (Parkinson''s, stiff spine) receiving a dual-mobility cup.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "Dual Mobility" cup?', '["A cup with two screws", "A design with two moving interfaces (a small head inside a large poly liner that also moves in the metal shell)", "A cup that can be used for both hip and knee", "None"]', 1, 'This design significantly increases the "jump distance" required for dislocation.'),
    (v_case_id, 'Why is a stiff/fused lumbar spine a risk factor for THA dislocation?', '["The patient can''t sit down", "The pelvis cannot tilt to accommodate hip motion, leading to impingement and dislocation", "It causes nerve pain", "None"]', 1, 'Normal "spinal-pelvic" motion is crucial for maintaining cup coverage during activities.'),
    (v_case_id, 'Which patient population would benefit MOST from a dual mobility implant?', '["A 20-year-old athlete", "A patient with neuromuscular disorders or high risk for instability", "A patient with an infection", "None"]', 1, 'Neuro-compromised patients have higher dislocation rates and benefit from the added stability.');

    ---------------------------------------------------------------------------
    -- CASE 11: THA Dislocation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Popped Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Popped Hip', 'A 72-year-old female presents to the ED 4 weeks after a posterior approach THA. She felt a "pop" while reaching down to pick up a cat. Her leg is now shortened and internally rotated.

Vitals: Stable but in pain.
Physical Examination: Hip is "locked" in internal rotation.
Laboratory Results: X-ray shows the femoral head displaced posterior and superior to the acetabular cup.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old with a posterior dislocation 4 weeks post-THA.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common direction of dislocation after a posterior approach THA?', '["Anterior", "Posterior", "Inferior", "Medial"]', 1, 'Posterior dislocation occurs more frequently with the posterior approach, especially if the posterior capsule and rotators are not adequately repaired.'),
    (v_case_id, 'Initial management of an acute, first-time THA dislocation is:', '["Immediate revision surgery", "Closed reduction under sedation/anesthesia", "Bed rest for 2 weeks", "None"]', 1, 'Most first-time dislocations can be managed with closed reduction and temporary precautions/bracing.'),
    (v_case_id, 'Which of the following increases the risk of recurrent dislocation?', '["Component malposition (e.g., excessive cup retroversion)", "Neuromuscular conditions (e.g., Parkinson''s)", "Prior hip surgery", "All of the above"]', 3, 'Dislocation is often multifactorial, involving patient factors, surgical approach, and component positioning.');

    ---------------------------------------------------------------------------
    -- CASE 12: Periprosthetic Fracture (Vancouver Classification)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fracture Around the Stem' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fracture Around the Stem', 'An 80-year-old male with a 10-year-old THA falls and sustains a femoral fracture.

Vitals: Stable.
Physical Examination: Swelling and deformity of the mid-thigh.
Laboratory Results: X-rays show a spiral fracture around the tip of the femoral stem. The stem appears to have shifted (is loose).', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 80-year-old with a Vancouver B2 fracture around a loose THA stem.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the Vancouver Classification, a fracture around or just distal to the stem where the stem is LOOSE is classified as:', '["Type A", "Type B1", "Type B2", "Type C"]', 2, 'Vancouver B1 is a stable stem; B2 is a loose stem; B3 is a loose stem with poor bone stock.'),
    (v_case_id, 'What is the treatment for a Vancouver B2 periprosthetic fracture?', '["ORIF with plates and screws, leaving the stem in place", "Revision to a longer, bypass femoral stem plus ORIF", "Non-operative management in a cast", "None"]', 1, 'If the stem is loose (B2/B3), it must be revised to a stable implant that bypasses the fracture.'),
    (v_case_id, 'Where is a Vancouver Type A fracture located?', '["At the tip of the stem", "In the trochanteric region (greater or lesser trochanter)", "Distal to the stem", "None"]', 1, 'Type A fractures are in the trochanteric region.');

    ---------------------------------------------------------------------------
    -- CASE 13: Periprosthetic Joint Infection (PJI)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Red, Hot Hip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Red, Hot Hip', 'A patient presents 2 years after THA with worsening hip pain and a low-grade fever.

Vitals: Temp 100.2 F.
Physical Examination: Scar is healed, but the hip is tender to deep palpation and motion.
Laboratory Results: ESR 85 mm/hr, CRP 42 mg/L. Hip aspiration shows 50,000 WBCs with 90% neutrophils.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient 2 years post-THA with elevated inflammatory markers and positive aspiration (PJI).', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Gold Standard" treatment for a chronic PJI (symptoms > 4 weeks) in the United States?', '["Life-long antibiotics", "DAIR (Debridement, Antibiotics, and Implant Retention)", "Two-stage exchange (removal of implants, antibiotic spacer, then re-implantation weeks later)", "Amputation"]', 2, 'Two-stage exchange has the highest success rate for eradicating chronic infection.'),
    (v_case_id, 'What is a "DAIR" procedure?', '["Doing All In Reverse", "Debridement, Antibiotics, and Implant Retention (usually involving a polyethylene liner change)", "Double Antibiotic Intra-articular Rinse", "None"]', 1, 'DAIR is typically reserved for acute infections (<3-4 weeks) or acute hematogenous spread.'),
    (v_case_id, 'Why are biofilms significant in PJI?', '["They make the bacteria more visible", "They protect bacteria from the host immune system and antibiotics, making the hardware impossible to \"sterilize\" without removal", "They are harmless", "None"]', 1, 'Bacteria on metal/plastic surfaces form protective slime layers (biofilms).');

    ---------------------------------------------------------------------------
    -- CASE 14: Aseptic Loosening & Osteolysis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shifting Stem' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shifting Stem', 'A patient with a 15-year-old THA presents with "start-up" pain in the thigh that is relieved after a few steps.

Vitals: Stable.
Physical Examination: Pain with resisted hip flexion.
Laboratory Results: X-rays show a 2mm radiolucent line around the femoral stem (Gruen Zone 1 and 7) and eccentric wear of the polyethylene liner.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a 15-year-old THA, start-up pain, and radiolucency on X-ray.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of this patient''s bone loss (osteolysis)?', '["Infection", "Reaction to polyethylene wear particles", "A tumor", "Lack of calcium"]', 1, 'Wear particles trigger an inflammatory cascade that leads to periprosthetic bone resorption.'),
    (v_case_id, 'A radiolucent line > 2mm or progressive widening around an implant is a sign of:', '["Normal healing", "Aseptic loosening", "Excessive exercise", "None"]', 1, 'This indicates the implant is no longer biologically or mechanically bonded to the bone.'),
    (v_case_id, 'Where are "Gruen Zones" located?', '["On the acetabular cup", "On the femoral side (dividing the stem interface into 7 zones)", "In the knee", "None"]', 1, 'Gruen zones help surgeons communicate the exact location of radiolucencies on the femoral side.');

    ---------------------------------------------------------------------------
    -- CASE 15: Sciatic Nerve Injury
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Foot Drop After THA' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Foot Drop After THA', 'Immediately after a complex revision THA via a posterior approach, the patient is unable to dorsiflex his foot.

Vitals: Stable.
Physical Examination: Complete "Foot Drop" on the surgical side. Numbness on the lateral calf and dorsal foot.
Laboratory Results: Post-op X-rays show good component position.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with foot drop and numbness after revision THA.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve is most commonly injured during THA, particularly with the posterior approach or during leg lengthening?', '["Femoral nerve", "Sciatic nerve (Peroneal division)", "Obturator nerve", "Radial nerve"]', 1, 'The peroneal division of the sciatic nerve is the most sensitive to stretch or compression.'),
    (v_case_id, 'If a nerve injury is suspected in the recovery room, what is the first management step?', '["Immediate return to OR", "Loosen tight dressings and place the hip/knee in a slightly flexed position to reduce tension on the nerve", "Wait 6 months", "None"]', 1, 'Reducing tension on the nerve is the immediate priority.'),
    (v_case_id, 'What is the typical prognosis for a neurapraxia (stretch injury) after THA?', '["Permanent paralysis", "Most show significant or complete recovery over several months", "Requires immediate nerve graft", "None"]', 1, 'Recovery is common but can be slow and sometimes incomplete.');

    ---------------------------------------------------------------------------
    -- CASE 16: Vascular Injury
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pelvic Bleed' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pelvic Bleed', 'During the reaming of the acetabulum, there is a sudden, brisk gush of arterial blood from the medial wall.

Vitals: BP drops to 80/40, HR 120.
Physical Examination: Acute hypotension.
Laboratory Results: N/A.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Intra-operative vascular injury during acetabular reaming.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which major vessel is most at risk during acetabular reaming or screw placement in the anterior-superior quadrant?', '["External Iliac Artery/Vein", "Sciatic nerve", "Profunda femoris", "None"]', 0, 'The anterior-superior quadrant of the acetabulum is the "danger zone" for vascular structures.'),
    (v_case_id, 'What is the safest quadrant for acetabular screw placement?', '["Anterior-Superior", "Anterior-Inferior", "Posterior-Superior", "None"]', 2, 'The posterior-superior and posterior-inferior quadrants provide the safest bone for screw purchase away from major vessels and nerves.'),
    (v_case_id, 'Immediate management of a major intra-operative vascular injury includes:', '["Packing the wound, notifying the anesthesiologist, and calling for a vascular surgeon", "Closing the skin and hoping it stops", "Applying a tourniquet to the waist", "None"]', 0, 'This is a life-threatening emergency requiring immediate multidisciplinary action.');

    ---------------------------------------------------------------------------
    -- CASE 17: Heterotopic Ossification (HO)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bone in the Muscle' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bone in the Muscle', 'A patient presents 6 months after THA with stiffness and a "hard" feeling in the soft tissues around the hip.

Vitals: Stable.
Physical Examination: Severely restricted ROM.
Laboratory Results: X-rays show islands of mature bone forming in the soft tissues, nearly bridging the gap between the femur and the pelvis.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with post-operative HO and restricted ROM.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for bone formation in non-osseous tissues after surgery?', '["Osteosarcoma", "Heterotopic Ossification (HO)", "Osteopetrosis", "None"]', 1, 'HO is a common phenomenon after major hip surgery.'),
    (v_case_id, 'What is the "Brooker Classification" used for?', '["Hip fractures", "Grading the severity of Heterotopic Ossification around the hip", "Nerve palsy", "None"]', 1, 'Brooker Class IV represents complete bony ankylosis (the joint is "fused" by the HO).'),
    (v_case_id, 'What are common prophylactic measures for patients at high risk for HO (e.g., those with prior HO or ankylosing spondylitis)?', '["NSAIDs (e.g., Indomethacin) or a single dose of radiation therapy", "Vitamin D", "Antibiotics", "None"]', 0, 'Indomethacin for 7-14 days or post-op radiation are standard prophylaxis.');

    ---------------------------------------------------------------------------
    -- CASE 18: Metallosis / ALTR
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Gray Tissue' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Gray Tissue', 'A patient with a Metal-on-Metal (MoM) THA presents with hip swelling and pain.

Vitals: Stable.
Physical Examination: Palpable "pseudotumor" around the hip.
Laboratory Results: Blood tests show elevated Cobalt and Chromium levels. MRI shows a large cystic mass (ALTR).', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with MoM THA, pseudotumor, and elevated metal ions.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does ALTR stand for?', '["Allergic Local Tissue Reaction", "Adverse Local Tissue Reaction", "Always Look Towards Revision", "None"]', 1, 'ALTR is a tissue response to metal wear particles, typically from MoM bearings or "trunnionosis."'),
    (v_case_id, 'Which metal ions are typically measured in these patients?', '["Iron and Zinc", "Cobalt and Chromium", "Gold and Silver", "None"]', 1, 'Elevated Co/Cr levels are markers of metal wear and corrosion.'),
    (v_case_id, 'What is "Trunnionosis"?', '["A type of infection", "Wear/corrosion at the head-neck junction (the trunnion) of the femoral stem", "A bone tumor", "None"]', 1, 'This can occur even in Ceramic-on-Poly THAs if the metal-to-metal junction at the stem neck corrodes.');

    ---------------------------------------------------------------------------
    -- CASE 19: Leg Length Discrepancy (LLD)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Long Leg' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Long Leg', 'A patient is very upset after her THA because her surgical leg feels 1 cm longer than the other side.

Vitals: Stable.
Physical Examination: True LLD is measured at 8mm.
Laboratory Results: Normal X-rays.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with an 8mm LLD after THA.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common reason for a surgeon intentionally "lengthening" a leg during THA?', '["To make the patient taller", "To increase soft tissue tension and improve hip stability (reduce dislocation risk)", "Because they ran out of small parts", "None"]', 1, 'Stability often requires adequate tension of the abductor muscles.'),
    (v_case_id, 'What is the difference between "True" and "Apparent" LLD?', '["There is no difference", "True LLD is an actual difference in bone length; Apparent LLD is due to pelvic tilt or contractures", "True is from the hip, Apparent is from the knee", "None"]', 1, 'Apparent LLD often resolves after the patient''s gait and pelvic muscles adjust to the new joint.'),
    (v_case_id, 'Most LLDs under _____ cm are well-tolerated or can be managed with a simple shoe lift.', '["0.1 cm", "0.5 cm", "1.5-2.0 cm", "5.0 cm"]', 2, 'Small discrepancies are very common and usually not clinically significant for the patient.');

    ---------------------------------------------------------------------------
    -- CASE 20: Ceramic Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shattered Bearing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shattered Bearing', 'A patient with a CoC bearing THA was involved in a high-energy fall. He felt a loud "crack" and can no longer bear weight.

Vitals: Stable.
Physical Examination: Severe pain with any hip motion. Audible "grinding" or "crunching."
Laboratory Results: X-rays show multiple sharp fragments of ceramic in the joint space.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with a fractured ceramic bearing after a fall.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Revision for a fractured ceramic bearing requires:', '["A simple cleaning", "Extensive synovectomy and removal of ALL ceramic fragments to prevent \"third-body wear\" of the new implants", "Amputation", "None"]', 1, 'Remaining ceramic \"dust\" is extremely abrasive and will quickly destroy any new metal or poly surfaces.'),
    (v_case_id, 'What is "Third-Body Wear"?', '["Wear from a third person", "Wear caused by hard particles (like ceramic shards or bone) caught between the two primary bearing surfaces", "Wear on the skin", "None"]', 1, 'This is a major concern in revision arthroplasty.'),
    (v_case_id, 'True or False: Modern "Delta" ceramics have a much lower fracture rate than older alumina ceramics.', '["True", "False"]', 0, 'Modern ceramics are toughened with zirconia and have very low fracture rates (<0.1%).');

    ---------------------------------------------------------------------------
    -- CASE 21: Primary Knee Osteoarthritis (TKA Indications)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bone-on-Bone Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bone-on-Bone Knee', 'A 70-year-old female presents with severe "bone-on-bone" pain in her left knee. She has failed physical therapy, injections (corticosteroid and HA), and NSAIDs.

Vitals: Stable.
Physical Examination: Fixed 10-degree flexion contracture. Pain with all motion.
Laboratory Results: X-rays show tri-compartmental joint space narrowing, subchondral sclerosis, and large osteophytes.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old with end-stage knee OA; failed conservative treatment.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common indication for Total Knee Arthroplasty (TKA)?', '["To improve athletic performance", "Severe pain and functional limitation from osteoarthritis that has failed non-operative treatment", "A minor meniscus tear", "None"]', 1, 'TKA is primarily a pain-relief procedure.'),
    (v_case_id, 'Which of the following is an ABSOLUTE contraindication to TKA?', '["Age > 80", "Active or recent systemic or local infection", "Obesity", "Diabetes"]', 1, 'Active infection is a major contraindication to any elective joint replacement.'),
    (v_case_id, 'True or False: A "fixed flexion contracture" of 10 degrees is a common finding in end-stage knee OA.', '["True", "False"]', 0, 'Patients often lose full extension as the joint degenerates.');

    ---------------------------------------------------------------------------
    -- CASE 22: Varus Knee Correction
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bow-Legged Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bow-Legged Knee', 'A 65-year-old male with severe medial compartment OA presents with a 15-degree varus deformity.

Vitals: Stable.
Physical Examination: Bow-legged (varus) alignment. Medial joint line tenderness.
Laboratory Results: X-rays confirm severe medial joint space loss.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old with a 15-degree varus deformity due to OA.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In a varus knee, which side of the knee has tight soft tissues that may require release?', '["Lateral side", "Medial side", "Posterior side", "None"]', 1, 'The medial structures (MCL, pes tendons, etc.) are often contracted in a varus knee.'),
    (v_case_id, 'Correcting a varus deformity during TKA typically involves:', '["Medial soft tissue release and potentially more bone resection from the medial tibial plateau", "Lateral release", "Removing the patella", "None"]', 0, 'Restoring neutral mechanical alignment is the goal.'),
    (v_case_id, 'What is the "Mechanical Axis" of the lower limb?', '["A line from the center of the femoral head to the center of the ankle joint", "The line of the femur bone", "The line of the skin", "None"]', 0, 'In a normal knee, this line should pass through or slightly medial to the center of the knee joint.');

    ---------------------------------------------------------------------------
    -- CASE 23: Valgus Knee Correction
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Knock-Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Knock-Knee', 'A 60-year-old female with lateral compartment OA presents with a significant valgus deformity.

Vitals: Stable.
Physical Examination: "Knock-knee" (valgus) alignment.
Laboratory Results: X-rays show lateral joint space narrowing and bone loss on the lateral femoral condyle.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old with a valgus deformity due to lateral OA.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which structures are often tight in a valgus knee?', '["Medial Collateral Ligament (MCL)", "Lateral Collateral Ligament (LCL), Iliotibial (IT) band, and Popliteus", "Sartorius", "None"]', 1, 'Lateral structures become contracted in chronic valgus alignment.'),
    (v_case_id, 'What nerve is most at risk when correcting a severe valgus deformity?', '["Femoral nerve", "Common Peroneal Nerve", "Tibial nerve", "Obturator nerve"]', 1, 'Straightening the knee can stretch the common peroneal nerve as it wraps around the fibular head.'),
    (v_case_id, 'A "Pie-Crusting" technique is used for:', '["Making bread", "Sequential, controlled release of tight ligaments (like the IT band or LCL) using a needle or blade", "Fixing a fracture", "None"]', 1, 'It allows for fine-tuning of the ligament balance.');

    ---------------------------------------------------------------------------
    -- CASE 24: Unicompartmental Knee Arthroplasty (UKA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Partial Replacement' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Partial Replacement', 'A 55-year-old patient has pain strictly on the medial side of the knee. The ACL is intact, and the lateral and patellofemoral compartments appear normal on X-ray and MRI.

Vitals: Stable.
Physical Examination: Medial joint line tenderness. Full extension and 130 degrees of flexion.
Laboratory Results: X-rays show isolated medial OA.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old candidate for UKA (medial compartment OA).', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is a classic "Kozinn & Scott" criterion for UKA?', '["Intact ACL", "Age > 80", "Severe obesity", "Inflammatory arthritis"]', 0, 'An intact ACL is crucial for the stability of a UKA.'),
    (v_case_id, 'What is the primary advantage of UKA over TKA?', '["It lasts longer", "Faster recovery, better range of motion, and feels \"more like a natural knee\"", "It is easier to perform", "None"]', 1, 'Preserving the ACL, PCL, and the other compartments maintains better kinematics.'),
    (v_case_id, 'True or False: UKA has a higher revision rate than TKA in most national registries.', '["True", "False"]', 0, 'While patients often prefer the "feel" of a UKA, they generally don''t last as long as TKAs.');

    ---------------------------------------------------------------------------
    -- CASE 25: Patellofemoral Arthroplasty
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pain Behind the Kneecap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pain Behind the Kneecap', 'A 48-year-old female presents with severe pain when climbing stairs or rising from a chair. Her medial and lateral joint lines are not tender.

Vitals: Stable.
Physical Examination: Severe patellofemoral crepitus and pain.
Laboratory Results: Merchant and Skyline X-ray views show bone-on-bone contact between the patella and the trochlea, with normal medial/lateral compartments.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 48-year-old with isolated patellofemoral OA.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Isolated patellofemoral arthroplasty is indicated when:', '["The whole knee is arthritic", "Osteoarthritis is strictly limited to the patellofemoral joint", "The patient has a meniscus tear", "None"]', 1, 'It is a specialized partial knee replacement.'),
    (v_case_id, 'What is the main concern with PF arthroplasty in young patients?', '["Risk of progression of arthritis to the other compartments (medial/lateral)", "The metal will rust", "It causes weight gain", "None"]', 0, 'If the other compartments become arthritic later, the PF replacement must be revised to a TKA.'),
    (v_case_id, 'True or False: Obesity is a relative contraindication for PF arthroplasty.', '["True", "False"]', 0, 'High mechanical loads on the patellofemoral joint can lead to early failure in obese patients.');

    ---------------------------------------------------------------------------
    -- CASE 26: CR vs. PS TKA Designs
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'To Keep or Not to Keep the PCL' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'To Keep or Not to Keep the PCL', 'A surgeon is choosing between a Cruciate Retaining (CR) and a Posterior Stabilized (PS) TKA design for a patient.

Vitals: N/A.
Physical Examination: Stable PCL on posterior drawer test.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Comparison of CR vs. PS TKA designs.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the "Post-and-Cam" mechanism in a PS TKA do?', '["It replaces the function of the PCL by preventing the tibia from sliding too far forward", "It replaces the function of the PCL by preventing the tibia from sliding too far backward (posterior sag) and promoting \"femoral roll-back\"", "It locks the knee in extension", "None"]', 1, 'Femoral roll-back is essential for maximizing flexion.'),
    (v_case_id, 'An absolute indication for a PS TKA (over CR) is:', '["Prior patellectomy", "Incompetent or absent PCL", "Severe inflammatory arthritis with PCL attenuation", "All of the above"]', 3, 'If the PCL cannot do its job, a PS design is mandatory.'),
    (v_case_id, 'True or False: CR TKAs require less bone resection from the femoral notch than PS TKAs.', '["True", "False"]', 0, 'PS designs require a "box" to be cut in the femur to accommodate the cam mechanism.');

    ---------------------------------------------------------------------------
    -- CASE 27: Gap Balancing vs. Measured Resection
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mind the Gap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mind the Gap', 'During a TKA, the surgeon finds that the knee is tight in extension but balanced in flexion.

Vitals: N/A.
Physical Examination: N/A.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Intra-operative balancing: tight extension gap.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In TKA, the goal is to create "Gaps" that are:', '["Larger in flexion than extension", "Equal and rectangular in both flexion and extension", "Smaller in flexion", "None"]', 1, 'Symmetric gaps are essential for a stable knee throughout the ROM.'),
    (v_case_id, 'If the knee is tight in extension but balanced in flexion, what is a common solution?', '["Resect more distal femur", "Resect more proximal tibia", "Use a thicker polyethylene liner", "None"]', 0, 'Resecting more distal femur "opens up" the extension gap without affecting the flexion gap.'),
    (v_case_id, 'What is the "Flexion Gap" primarily determined by?', '["Distal femoral cut", "Posterior femoral cuts and tibial cut", "Patellar cut", "None"]', 1, 'Flexion gap is affected by the posterior condylar resection and the tibial resection.');

    ---------------------------------------------------------------------------
    -- CASE 28: Robotics and CAS
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High-Tech Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High-Tech Knee', 'A patient asks about the benefits of Robotic-Assisted TKA.

Vitals: N/A.
Physical Examination: N/A.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Discussion of Robotic-Assisted TKA.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the main theoretical advantage of Robotic-Assisted Arthroplasty?', '["The robot does the surgery alone", "Increased precision in bone cuts and soft tissue balancing", "It is faster", "None"]', 1, 'Precision and reproducibility are the key goals.'),
    (v_case_id, 'What is "Haptic Feedback" in robotic surgery?', '["The robot makes a noise", "Physical feedback or resistance from the robot that prevents the surgeon from moving the saw outside a pre-defined \"safe zone\"", "A type of screen", "None"]', 1, 'Haptics protect the collateral ligaments and other soft tissues.'),
    (v_case_id, 'True or False: To date, there is definitive long-term (20-year) evidence that robotic TKA has better implant survival than manual TKA.', '["True", "False"]', 1, 'While short-term precision is improved, long-term survival data is still being collected.');

    ---------------------------------------------------------------------------
    -- CASE 29: Patellar Resurfacing
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Kneecap Debate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Kneecap Debate', 'A surgeon is deciding whether to resurface the patella (add a plastic button) during a TKA.

Vitals: N/A.
Physical Examination: Patellofemoral arthritis visible intra-operatively.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The decision-making process for patellar resurfacing in TKA.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary risk of NOT resurfacing the patella?', '["The patella will disappear", "Increased risk of persistent anterior knee pain and potential need for secondary surgery", "The knee will lock", "None"]', 1, 'Anterior knee pain is the most common reason for dissatisfaction after TKA.'),
    (v_case_id, 'What is the primary risk OF resurfacing the patella?', '["Patellar fracture or osteonecrosis (if blood supply is compromised)", "The plastic will melt", "Infection is impossible", "None"]', 0, 'Thinning the patella too much increases fracture risk.'),
    (v_case_id, 'Which patient group is most likely to benefit from resurfacing?', '["Patients with inflammatory arthritis or obvious patellar chondromalacia", "Young athletes", "Patients with no pain", "None"]', 0, 'Inflammatory disease often affects all surfaces.');

    ---------------------------------------------------------------------------
    -- CASE 30: Mobile Bearing TKA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rotating Platform' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rotating Platform', 'A surgeon is using a "Rotating Platform" (Mobile Bearing) TKA.

Vitals: N/A.
Physical Examination: N/A.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Introduction to Mobile Bearing/Rotating Platform TKA.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does a mobile bearing TKA differ from a fixed bearing TKA?', '["The metal parts move", "The polyethylene liner can rotate or slide on the tibial tray", "The whole knee is loose", "None"]', 1, 'This allows the knee to "self-align" and potentially reduces polyethylene wear.'),
    (v_case_id, 'What is a "Spin-out"?', '["A car accident", "A rare complication where the mobile polyethylene liner dislocates from the tibial tray", "A type of exercise", "None"]', 1, 'Spin-out is a unique complication of mobile bearing designs.'),
    (v_case_id, 'True or False: Mobile bearing TKAs have been proven to have significantly better clinical outcomes than fixed bearing TKAs in meta-analyses.', '["True", "False"]', 1, 'Most studies show no clinical difference between the two designs.');

    ---------------------------------------------------------------------------
    -- CASE 31: Arthrofibrosis (Stiffness)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stiff Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stiff Knee', 'A patient presents 3 months after TKA with only 70 degrees of flexion despite aggressive physical therapy.

Vitals: Stable.
Physical Examination: Range of motion is 5-70 degrees. Significant "woody" induration of the soft tissues.
Laboratory Results: Inflammatory markers (ESR/CRP) are normal. X-rays show good component position.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with post-operative stiffness (arthrofibrosis) 3 months post-TKA.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the initial management for a knee that is significantly stiffer than expected at 6-12 weeks post-op?', '["Immediate revision surgery", "Manipulation Under Anesthesia (MUA)", "Give up on therapy", "None"]', 1, 'MUA is most effective when performed within the first 3 months.'),
    (v_case_id, 'What is "Arthrofibrosis"?', '["A type of infection", "Excessive scar tissue formation within the joint that restricts motion", "Bone growth", "None"]', 1, 'It can be idiopathic or related to poor pre-op ROM, infection, or technical errors.'),
    (v_case_id, 'True or False: Pre-operative range of motion is the strongest predictor of post-operative range of motion.', '["True", "False"]', 0, 'If a patient has a very stiff knee before surgery, it is difficult to achieve a "normal" range afterward.');

    ---------------------------------------------------------------------------
    -- CASE 32: PJI in TKA
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Draining Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Draining Knee', 'A patient presents 2 weeks after TKA with persistent serosanguinous drainage from the incision and increasing pain.

Vitals: Temp 101.0 F.
Physical Examination: Erythema, warmth, and a 2cm area of the wound that is "leaking" clear fluid.
Laboratory Results: CRP 150 mg/L (elevated for 2 weeks post-op). Aspiration shows 80,000 WBCs.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acute PJI 2 weeks post-TKA; wound drainage and fever.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'For an acute PJI (< 4 weeks from surgery) with stable implants, what is the preferred surgical treatment?', '["Two-stage exchange", "DAIR (Debridement, Antibiotics, and Implant Retention) with polyethylene liner change", "Amputation", "None"]', 1, 'DAIR has a reasonable success rate if performed early before a mature biofilm forms.'),
    (v_case_id, 'What is the "Alpha-Defensin" test?', '["A test for blood type", "A highly sensitive and specific biomarker test of synovial fluid for PJI", "A type of X-ray", "None"]', 1, 'Alpha-defensin is an antimicrobial peptide released by neutrophils in response to pathogens.'),
    (v_case_id, 'True or False: If a wound continues to drain for more than 5-7 days after surgery, it should be surgically explored.', '["True", "False"]', 0, 'Persistent drainage is a high risk for seeding the deep joint and should be addressed aggressively.');

    ---------------------------------------------------------------------------
    -- CASE 33: Periprosthetic Femur Fracture (TKA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Above-the-Knee Break' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Above-the-Knee Break', 'A 78-year-old female with a 5-year-old TKA falls and sustains a supracondylar femur fracture just above the femoral component.

Vitals: Stable.
Physical Examination: Swelling and deformity above the knee.
Laboratory Results: X-rays show a displaced fracture. The femoral component appears well-fixed to the bone.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A supracondylar femur fracture above a well-fixed TKA component.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'According to the Lewis and Rorabeck classification, a fracture above a stable TKA component is treated with:', '["Revision TKA", "Internal fixation (e.g., retrograde intramedullary nail or distal femoral locking plate)", "A cast", "None"]', 1, 'If the component is stable, the fracture is treated like a standard supracondylar fracture.'),
    (v_case_id, 'If the femoral component were LOOSE in this patient, what would be the treatment?', '["Plate fixation", "Revision to a distal femoral replacement (megaprosthesis) or a long-stemmed revision component", "Bed rest", "None"]', 1, 'A loose component requires revision to a more constrained/stable implant.'),
    (v_case_id, 'True or False: "Notching" of the anterior femoral cortex during the initial TKA increases the risk of supracondylar fracture.', '["True", "False"]', 0, 'Notching creates a stress riser that can predispose to fracture.');

    ---------------------------------------------------------------------------
    -- CASE 34: Extensor Mechanism Rupture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sudden Fall' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sudden Fall', 'A patient is 6 months post-TKA and experiences a sudden "giving way" of the knee while walking down stairs.

Vitals: Stable.
Physical Examination: The patient is unable to perform an active straight leg raise (extensor lag). A "gap" is palpable below the patella.
Laboratory Results: X-rays show "Patella Alta" (the patella is high-riding).', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-TKA patellar tendon rupture; unable to extend the knee.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What structure has likely ruptured?', '["ACL", "Patellar tendon", "MCL", "None"]', 1, 'Patella alta and loss of extension are classic for patellar tendon rupture.'),
    (v_case_id, 'Extensor mechanism rupture after TKA is:', '["A minor issue", "A catastrophic complication that often requires complex reconstruction (e.g., allograft or synthetic mesh)", "Treated with a simple brace", "None"]', 1, 'Repairing a tendon rupture in the setting of a TKA is technically difficult and has high failure rates.'),
    (v_case_id, 'Which of the following is a risk factor for extensor mechanism failure?', '["Previous knee surgery", "Chronic steroid use", "Malalignment of the components", "All of the above"]', 3, 'Patient and surgical factors both contribute.');

    ---------------------------------------------------------------------------
    -- CASE 35: Patellar Tracking Issues
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tilting Patella' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tilting Patella', 'A patient presents with anterior knee pain and a "catching" sensation 1 year after TKA.

Vitals: Stable.
Physical Examination: Patella feels like it is "jumping" during flexion.
Laboratory Results: Merchant X-ray view shows the patella is tilted and subluxed laterally.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-TKA patellar maltracking and lateral subluxation.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Internal rotation of the femoral or tibial components leads to:', '["Better stability", "Lateral patellar maltracking (increased Q-angle)", "Medial maltracking", "None"]', 1, 'Component rotation is a primary cause of patellar tracking problems.'),
    (v_case_id, 'What is the "Q-angle"?', '["The angle between the quadriceps and the patellar tendon", "The angle of the hip", "The angle of the foot", "None"]', 0, 'A larger Q-angle increases the lateral pull on the patella.'),
    (v_case_id, 'Treatment for severe patellar maltracking due to component malposition is:', '["More physical therapy", "Revision surgery to correct component rotation", "Adding more plastic", "None"]', 1, 'Technical errors must be corrected surgically.');

    ---------------------------------------------------------------------------
    -- CASE 36: Popliteus Tendon Impingement
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lateral Snapping' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lateral Snapping', 'A patient reports a "snapping" sensation and pain on the lateral side of the knee when walking or descending stairs after TKA.

Vitals: Stable.
Physical Examination: Tenderness over the lateral femoral condyle. A "snap" can be felt when the knee moves from 80 to 90 degrees of flexion.
Laboratory Results: Normal X-rays.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Lateral snapping and pain post-TKA due to popliteus impingement.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What structure is most likely "snapping" over the femoral component?', '["LCL", "Popliteus tendon", "IT band", "None"]', 1, 'The popliteus tendon can catch on the edge of the femoral component if it is oversized or malpositioned.'),
    (v_case_id, 'Initial management of suspected popliteus impingement:', '["Physical therapy and NSAIDs", "Immediate revision", "Amputation", "None"]', 0, 'Conservative management is usually tried first.'),
    (v_case_id, 'If conservative management fails, what is a surgical option?', '["Popliteus tendon release/tenotomy", "Total revision", "Fibular head resection", "None"]', 0, 'Releasing the tendon can resolve the mechanical snapping.');

    ---------------------------------------------------------------------------
    -- CASE 37: Common Peroneal Nerve Palsy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Foot Drop After Valgus Correction' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Foot Drop After Valgus Correction', 'A patient with a severe 20-degree valgus deformity underwent TKA. In the recovery room, she is unable to dorsiflex her ankle.

Vitals: Stable.
Physical Examination: Foot drop; inability to evert the foot. Numbness in the 1st dorsal webspace.
Laboratory Results: X-rays show excellent alignment.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-TKA foot drop after correction of a severe valgus deformity.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is valgus correction a risk factor for peroneal nerve injury?', '["The nerve is cut during the lateral release", "The nerve is stretched as the knee is brought from a shortened valgus position to a straight alignment", "The nerve is tied in a knot", "None"]', 1, 'Stretch-induced neurapraxia is the most common mechanism.'),
    (v_case_id, 'Management includes:', '["Revising the knee to a valgus position", "Removing any tight bandages/splints, flexing the knee slightly, and observation (most recover)", "Immediate nerve exploration", "None"]', 1, 'Conservative measures and time usually lead to recovery.'),
    (v_case_id, 'True or False: Nerve injury is more common in patients with a pre-existing neuropathy (e.g., from Diabetes).', '["True", "False"]', 0, '"Double crush" theory suggests these nerves are more sensitive to injury.');

    ---------------------------------------------------------------------------
    -- CASE 38: Aseptic Loosening (TKA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sinking Tibia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sinking Tibia', 'A patient presents 12 years after TKA with increasing pain on weight-bearing.

Vitals: Stable.
Physical Examination: Pain localized to the proximal tibia.
Laboratory Results: X-rays show the tibial component has tilted into varus and there is a 3mm radiolucent line in all 7 "Knee Society" zones under the tibial tray.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Aseptic loosening of the tibial component 12 years post-TKA.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which component of a TKA is more likely to loosen over time?', '["Femoral", "Tibial", "Patellar", "None"]', 1, 'The tibial component typically faces higher shear forces and is the more common site of aseptic loosening.'),
    (v_case_id, 'The "Knee Society" radiographic zones are used to:', '["Measure the patella", "Standardize the description of radiolucencies around TKA components", "Grade infection", "None"]', 1, 'Standardized zones help track progression of loosening over time.'),
    (v_case_id, 'True or False: Aseptic loosening is always associated with fever and high ESR.', '["True", "False"]', 1, '"Aseptic" means without infection; inflammatory markers should be normal.');

    ---------------------------------------------------------------------------
    -- CASE 39: Complex Regional Pain Syndrome (CRPS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Burning Knee' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Burning Knee', 'A patient presents 6 months post-TKA with severe, burning pain that is out of proportion to any physical findings.

Vitals: Stable.
Physical Examination: Extreme sensitivity to light touch (allodynia). The skin is shiny, mottled, and there is increased hair growth around the knee.
Laboratory Results: X-rays and labs are normal.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-TKA CRPS; burning pain, allodynia, and skin changes.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Infection", "CRPS (formerly known as Reflex Sympathetic Dystrophy)", "Loosening", "None"]', 1, 'CRPS is a rare but debilitating complication characterized by autonomic dysfunction and neuropathic pain.'),
    (v_case_id, 'The first-line management of CRPS involves:', '["More surgery", "Multidisciplinary approach including specialized physical therapy, pain management (gabapentin/amitriptyline), and potentially nerve blocks", "Casting the leg", "None"]', 1, 'Early recognition and specialized therapy are key.'),
    (v_case_id, 'What is "Allodynia"?', '["Pain that is relieved by rest", "Pain due to a stimulus that does not normally provoke pain (like a light breeze or a bedsheet)", "A type of fracture", "None"]', 1, 'Allodynia is a hallmark of neuropathic pain conditions.');

    ---------------------------------------------------------------------------
    -- CASE 40: Metal Hypersensitivity
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Chronic Rash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Chronic Rash', 'A patient with a history of "jewelry allergy" presents with persistent knee swelling and a localized dermatitis over the surgical site 1 year after TKA.

Vitals: Stable.
Physical Examination: Eczematous rash over the knee.
Laboratory Results: Negative workup for infection. Patch testing is positive for Nickel and Cobalt.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-TKA metal hypersensitivity in a patient with a jewelry allergy.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which metal is the most common cause of skin hypersensitivity?', '["Titanium", "Nickel", "Gold", "Zirconium"]', 1, 'Nickel is the most common metal allergen.'),
    (v_case_id, 'If a patient has a proven severe Nickel allergy, what type of TKA implant should be used?', '["Standard Cobalt-Chrome", "Nickel-free options like Titanium or Oxinium (oxidized zirconium) components", "Plastic only", "None"]', 1, 'Hypoallergenic implants avoid the standard Cr-Co-Ni alloys.'),
    (v_case_id, 'True or False: Every patient with a skin allergy to jewelry needs a hypoallergenic joint replacement.', '["True", "False"]', 1, 'Most patients with simple skin sensitivity tolerate standard implants well; the decision is made on a case-by-case basis.');

    ---------------------------------------------------------------------------
    -- CASE 41: Anatomic Total Shoulder Arthroplasty (aTSA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Concentric Shoulder' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Concentric Shoulder', 'A 62-year-old male presents with chronic shoulder pain and loss of motion. He has an intact rotator cuff on MRI.

Vitals: Stable.
Physical Examination: Global loss of range of motion. No weakness in supraspinatus or subscapularis testing.
Laboratory Results: X-rays show glenohumeral joint space narrowing, subchondral sclerosis, and a large "goat''s beard" osteophyte on the humeral head. The humeral head is centered on the glenoid.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 62-year-old with primary shoulder OA and an intact rotator cuff.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary requirement for a successful ANATOMIC TSA?', '["A broken bone", "A functional and intact rotator cuff", "Age > 70", "None"]', 1, 'An anatomic TSA relies on the rotator cuff to move the joint.'),
    (v_case_id, 'Which radiographic finding is most characteristic of shoulder OA?', '["Superior migration of the humeral head", "Inferior humeral head osteophyte (Goat''s beard)", "Soft tissue swelling", "None"]', 1, 'The inferior osteophyte is a classic hallmark of concentric shoulder OA.'),
    (v_case_id, 'True or False: aTSA provides better pain relief and range of motion than hemiarthroplasty for primary OA.', '["True", "False"]', 0, 'Resurfacing both sides of the joint (total) is generally superior to resurfacing only one side (hemi).');

    ---------------------------------------------------------------------------
    -- CASE 42: Reverse Total Shoulder Arthroplasty (rTSA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cuff Tear Arthropathy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cuff Tear Arthropathy', 'A 75-year-old female presents with severe shoulder pain and "pseudoparalysis" (unable to lift her arm). She has a long-standing massive rotator cuff tear.

Vitals: Stable.
Physical Examination: Unable to actively abduct the arm above 30 degrees. Passive ROM is relatively preserved.
Laboratory Results: X-rays show superior migration of the humeral head, "acetabularization" of the acromion, and severe glenohumeral arthritis.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old with a massive cuff tear and secondary arthritis (Cuff Tear Arthropathy).', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary indication for a REVERSE TSA in this patient?', '["A simple fracture", "Rotator cuff tear arthropathy (massive cuff tear + arthritis)", "A small labral tear", "None"]', 1, 'The reverse design shifts the center of rotation and allows the Deltoid to compensate for the missing rotator cuff.'),
    (v_case_id, 'What is the unique biomechanical principle of the rTSA?', '["It makes the shoulder smaller", "It medializes and distalizes the center of rotation, increasing the lever arm of the deltoid", "It uses magnets", "None"]', 1, 'This "Grammont principle" is the foundation of modern rTSA.'),
    (v_case_id, 'True or False: rTSA is now also commonly used for complex proximal humerus fractures in the elderly.', '["True", "False"]', 0, 'It often provides more predictable results than ORIF or hemiarthroplasty in frail bone.');

    ---------------------------------------------------------------------------
    -- CASE 43: Shoulder PJI (C. acnes)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Indolent Infection' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Indolent Infection', 'A patient presents 1 year after TSA with "unexplained" pain. The incision looks perfect.

Vitals: Stable. No fever.
Physical Examination: Pain with internal rotation. No redness or warmth.
Laboratory Results: ESR and CRP are only mildly elevated. Aspiration cultures are negative at 48 hours, but the surgeon decides to hold them for 14 days.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient with unexplained pain post-TSA; suspecting C. acnes infection.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common organism in shoulder PJI?', '["Staphylococcus aureus", "Cutibacterium acnes (formerly Propionibacterium acnes)", "E. coli", "None"]', 1, 'C. acnes is a slow-growing anaerobe that is part of the normal skin flora of the shoulder and axilla.'),
    (v_case_id, 'Why must cultures be held for 10-14 days in suspected shoulder PJI?', '["Because the lab is busy", "C. acnes is a very slow-growing organism and may not show up on standard 2-5 day cultures", "To save money", "None"]', 1, 'Prematurely discarding cultures can lead to missed diagnoses.'),
    (v_case_id, 'True or False: Shoulder PJI often presents WITHOUT classic signs like fever, redness, or significantly elevated ESR/CRP.', '["True", "False"]', 0, 'It is often a "silent" infection presenting only as persistent pain or loosening.');

    ---------------------------------------------------------------------------
    -- CASE 44: Total Elbow Arthroplasty (TEA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rheumatoid Elbow' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rheumatoid Elbow', 'A 58-year-old female with severe RA presents with an elbow that is "giving way" and extremely painful.

Vitals: Stable.
Physical Examination: Gross instability of the elbow. Unable to perform activities of daily living (ADLs).
Laboratory Results: X-rays show complete destruction of the ulnohumeral joint (Mayo Grade IV).', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 58-year-old with end-stage RA of the elbow.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common indication for Total Elbow Arthroplasty (TEA)?', '["Weightlifting injury", "Rheumatoid Arthritis and complex distal humerus fractures in the elderly", "Tennis elbow", "None"]', 1, 'RA was the classic indication, though trauma is now also common.'),
    (v_case_id, 'What is the difference between a "Linked" and "Unlinked" TEA?', '["Linked involves a physical hinge/pin connecting the components; Unlinked relies on ligaments for stability", "One is for the right arm, one for the left", "One is plastic, one is metal", "None"]', 0, 'Linked (semi-constrained) designs are more common when ligaments are deficient.'),
    (v_case_id, 'What is the lifetime "weight-lifting limit" typically given to TEA patients?', '["50 lbs", "5-10 lbs (roughly the weight of a gallon of milk)", "No limit", "None"]', 1, 'High loads lead to rapid loosening and failure of the elbow joint.');

    ---------------------------------------------------------------------------
    -- CASE 45: TEA Complications
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Numb Pinky' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Numb Pinky', 'Immediately after a TEA, the patient reports numbness in his small finger.

Vitals: Stable.
Physical Examination: Numbness in the small finger and ulnar half of the ring finger. Weakness in finger abduction (interossei).
Laboratory Results: N/A.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Ulnar neuropathy following TEA.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve is most commonly injured during elbow arthroplasty?', '["Radial nerve", "Ulnar nerve", "Median nerve", "None"]', 1, 'The ulnar nerve is directly adjacent to the surgical field and often requires transposition.'),
    (v_case_id, 'What is the "Bushy" or "Coonrad-Morrey" type of TEA?', '["A non-hinged design", "A semi-constrained, linked hinge design", "A type of fracture", "None"]', 1, 'This is one of the most widely used elbow implants.'),
    (v_case_id, 'True or False: TEA has a higher complication rate than THA or TKA.', '["True", "False"]', 0, 'Infection, loosening, and nerve injury are more common in the elbow than in the hip or knee.');

    ---------------------------------------------------------------------------
    -- CASE 46: Total Ankle Arthroplasty (TAA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Modern Ankle' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Modern Ankle', 'A 55-year-old active male with post-traumatic ankle arthritis is considering surgery.

Vitals: Stable.
Physical Examination: Severe ankle pain, preserved subtalar motion.
Laboratory Results: X-rays show end-stage tibiotalar arthritis.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old considering TAA vs. Ankle Fusion.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the main advantage of TAA over Ankle Arthrodesis (Fusion)?', '["It is cheaper", "Preservation of motion and reduced risk of secondary arthritis in the adjacent joints (subtalar/midfoot)", "It never fails", "None"]', 1, 'Fusion protects the ankle but puts more stress on the surrounding small joints of the foot.'),
    (v_case_id, 'A major contraindication to TAA is:', '["Patient age < 40", "Severe deformity, neuropathy (Charcot), or poor skin/soft tissue envelope", "Obesity", "None"]', 1, 'TAA requires stable ligaments and good skin to succeed.'),
    (v_case_id, 'True or False: Most ankle arthritis is primary osteoarthritis (like the hip/knee).', '["True", "False"]', 1, 'Most ankle arthritis (up to 80%) is post-traumatic (after old fractures or sprains).');

    ---------------------------------------------------------------------------
    -- CASE 47: Revision Arthroplasty Basics
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Dealing with Bone Loss' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Dealing with Bone Loss', 'During a revision TKA, the surgeon finds a large (3cm) cavitary defect in the medial tibial plateau.

Vitals: N/A.
Physical Examination: N/A.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Managing bone loss during revision arthroplasty.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How are large bone defects typically managed in revision surgery?', '["Just filling with cement", "Using metal augments, cones (e.g., tantalum), or bone graft", "Ignoring the defect", "None"]', 1, 'Restoring the joint line and achieving stable fixation in healthy bone is the priority.'),
    (v_case_id, 'What is "Porous Tantalum"?', '["A type of plastic", "A highly porous metal (\"trabecular metal\") that allows for excellent bone ingrowth", "A liquid cement", "None"]', 1, 'Tantalum cones are often used to fill large \"metaphyseal\" voids.'),
    (v_case_id, 'True or False: Revision implants often require "stems" to bypass deficient bone and transfer load further down the shaft.', '["True", "False"]', 0, 'Long stems provide essential supplemental stability in revision cases.');

    ---------------------------------------------------------------------------
    -- CASE 48: VTE Prophylaxis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blood Clot Question' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blood Clot Question', 'A 60-year-old healthy male is undergoing elective THA. He has no history of blood clots.

Vitals: Stable.
Physical Examination: N/A.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'VTE prophylaxis strategy for a low-risk arthroplasty patient.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the current trend for VTE prophylaxis in LOW-RISK patients after joint replacement?', '["No prophylaxis", "Aspirin (often 81mg BID)", "6 months of Warfarin", "None"]', 1, 'Aspirin is increasingly preferred for low-risk patients due to its low bleeding risk compared to potent anticoagulants.'),
    (v_case_id, 'Which of the following would make a patient HIGH-RISK for VTE?', '["Prior history of DVT or PE", "Active malignancy", "Known thrombophilia (e.g., Factor V Leiden)", "All of the above"]', 3, 'High-risk patients require more aggressive anticoagulation (e.g., Enoxaparin or DOACs).'),
    (v_case_id, 'True or False: Early mobilization (walking on the day of surgery) is one of the most effective ways to prevent DVT.', '["True", "False"]', 0, 'Mechanical prophylaxis (walking, foot pumps) is a critical component of VTE prevention.');

    ---------------------------------------------------------------------------
    -- CASE 49: Rapid Recovery / Outpatient Arthroplasty
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Home the Same Day' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Home the Same Day', 'A healthy 55-year-old is scheduled for TKA at an Ambulatory Surgery Center (ASC).

Vitals: Healthy.
Physical Examination: N/A.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Outpatient joint replacement and rapid recovery protocols.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "ERAS" in the context of surgery?', '["Emergency Room Arthroplasty Service", "Enhanced Recovery After Surgery (multimodal protocols to reduce pain, nausea, and length of stay)", "Early Revision of Arthroplasty", "None"]', 1, 'ERAS protocols involve anesthesia, nursing, and PT to optimize recovery.'),
    (v_case_id, 'What is the benefit of "multimodal" analgesia?', '["Using only one strong drug", "Using multiple medications that work on different pain pathways (e.g., Celebrex, Tylenol, Gabapentin, local blocks) to reduce opioid use", "It is cheaper", "None"]', 1, 'Reducing opioid consumption minimizes side effects like nausea, constipation, and confusion.'),
    (v_case_id, 'True or False: Outpatient joint replacement is safe for all patients regardless of medical comorbidities.', '["True", "False"]', 1, 'Patient selection is critical; high-risk patients still require inpatient monitoring.');

    ---------------------------------------------------------------------------
    -- CASE 50: Bio-tribology & Future Directions
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Future of Joints' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Future of Joints', 'A researcher is discussing the next generation of "Smart Implants."

Vitals: N/A.
Physical Examination: N/A.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Discussion of future trends in arthroplasty (3D printing, sensors).', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the benefit of 3D-printed (additive manufacturing) implants?', '["They are faster to make", "Allows for complex, highly porous structures that mimic bone architecture for better biological fixation", "They are made of paper", "None"]', 1, '3D printing allows for "custom" shapes and advanced porous surfaces.'),
    (v_case_id, 'What could a "Smart Implant" potentially monitor?', '["Infection (via pH sensors)", "Load/activity levels", "Wear rates", "All of the above"]', 3, 'Embedded sensors are an active area of research to improve long-term monitoring.'),
    (v_case_id, 'True or False: The goal of modern "Bio-tribology" is to create bearing surfaces that last for the lifetime of a 40-year-old patient.', '["True", "False"]', 0, 'As joint replacements are performed in younger patients, longevity is the ultimate goal.');

END $$;

COMMIT;
