-- Orthopedics: Part 5 (Questions 201-250)
-- Topic: Sports medicine & soft tissue injuries (Ankle, Foot & Stress Fractures)
-- US MD / MBBS / USMLE Step 3
-- Target: Supabase (PostgreSQL)
-- Topic Slug: ortho-sports-medicine

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-sports-medicine' LIMIT 1;

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    -- ANKLE: LIGAMENTS (LATERAL)
    (v_topic_id, 'Which of the lateral ankle ligaments is the most commonly injured in a typical inversion sprain?', '["Anterior Talofibular Ligament (ATFL)", "Calcaneofibular Ligament (CFL)", "Posterior Talofibular Ligament (PTFL)", "Deltoid ligament"]', 0, 'The ATFL is the weakest and first to fail during inversion/plantarflexion.'),
    (v_topic_id, 'Which lateral ankle ligament is tight in "Dorsiflexion" and is usually the second to tear after the ATFL?', '["ATFL", "CFL", "PTFL", "None"]', 1, 'The CFL is stressed in inversion when the ankle is neutral or dorsiflexed.'),
    (v_topic_id, 'The "Anterior Drawer" test of the ankle primarily assesses the integrity of the:', '["ATFL", "CFL", "Deltoid", "AITFL"]', 0, 'Greater than 5-8mm of translation compared to the other side suggests an ATFL tear.'),

    -- ANKLE: SYNDESMOSIS (HIGH ANKLE SPRAIN)
    (v_topic_id, 'Which structure is the primary restraint to "External Rotation" and "Diastasis" of the syndesmosis?', '["ATFL", "Anterior Inferior Tibiofibular Ligament (AITFL)", "Deltoid", "None"]', 1, 'The AITFL is the first line of defense in a high ankle sprain.'),
    (v_topic_id, 'The "Squeeze Test" for a syndesmosis injury involves squeezing which two bones together at the mid-calf?', '["Tibia and Fibula", "Femur and Tibia", "Talus and Calcaneus", "None"]', 0, 'Squeezing the tibia and fibula at the mid-calf reproduces pain at the syndesmosis.'),
    (v_topic_id, 'What is a "Maisonneuve Fracture"?', '["A distal fibula fracture", "A proximal fibula fracture associated with a syndesmosis injury and medial malleolus/deltoid injury", "A calcaneus fracture", "None"]', 1, 'It is a critical injury that requires recognition of the distal instability.'),

    -- ANKLE: TENDONS
    (v_topic_id, 'Which clinical test is most reliable for diagnosing an acute "Achilles Tendon Rupture"?', '["Ankle drawer test", "Thompson test (Simmonds'' test)", "Mulder click", "Tinel sign"]', 1, 'Squeezing the calf should result in passive plantarflexion; if it doesn''t, the Achilles is likely ruptured.'),
    (v_topic_id, 'Where is the "Watershed Area" of the Achilles tendon (the area with the poorest blood supply)?', '["At the insertion", "2-6 cm proximal to the calcaneal insertion", "At the musculotendinous junction", "None"]', 1, 'Most ruptures occur in this hypovascular zone.'),
    (v_topic_id, 'What is the "Matles Test"?', '["Test for ACL", "Observation of resting ankle position; a ruptured Achilles leads to a more dorsiflexed resting position", "Test for meniscus", "None"]', 1, 'With the patient prone and knees flexed to 90, the affected foot will sag into neutral/dorsiflexion.'),

    -- ANKLE: PERONEAL TENDONS
    (v_topic_id, 'Which peroneal tendon is more likely to develop a longitudinal "Split Tear" as it wraps around the fibula?', '["Peroneus longus", "Peroneus brevis", "Peroneus tertius", "None"]', 1, 'The brevis is compressed between the longus and the fibula.'),
    (v_topic_id, 'Recurrent subluxation of the peroneal tendons is caused by a deficiency of which structure?', '["Deltoid ligament", "Superior Peroneal Retinaculum (SPR)", "ATFL", "None"]', 1, 'The SPR keeps the tendons in the retro-malleolar groove.'),

    -- FOOT: LISFRANC
    (v_topic_id, 'The "Lisfranc Ligament" connects which two bones?', '["Medial cuneiform and 2nd metatarsal base", "1st and 2nd metatarsals", "Talus and Navicular", "Calcaneus and Cuboid"]', 0, 'There is no ligament between the 1st and 2nd metatarsal bases, making the Lisfranc ligament the key stabilizer.'),
    (v_topic_id, 'A "Fleck Sign" on an AP X-ray of the foot is diagnostic for:', '["Stress fracture", "Lisfranc injury (avulsion of the Lisfranc ligament from the 2nd metatarsal base)", "Jones fracture", "None"]', 1, 'It indicates a significant midfoot instability.'),

    -- FOOT: FIFTH METATARSAL
    (v_topic_id, 'A "Jones Fracture" occurs in which zone of the 5th metatarsal?', '["Zone 1 (Tuberosity)", "Zone 2 (Metaphyseal-diaphyseal junction)", "Zone 3 (Proximal diaphysis)", "None"]', 1, 'Zone 2 is the classic Jones fracture area, prone to non-union due to poor blood supply.'),
    (v_topic_id, 'A fracture in "Zone 1" (avulsion of the tuberosity) of the 5th metatarsal is often caused by the pull of which structure?', '["Peroneus longus", "Lateral band of the plantar fascia and/or Peroneus brevis", "Achilles", "None"]', 1, 'It is often treated non-operatively in a hard-sole shoe.'),

    -- FOOT: STRESS FRACTURES
    (v_topic_id, 'Which bone is the most common site for stress fractures in runners?', '["Tibia", "Fibula", "Femur", "Metatarsals"]', 0, 'The tibia is the #1 site overall.'),
    (v_topic_id, 'Which stress fracture is considered a "Surgical Emergency" or high-risk due to risk of non-union?', '["2nd metatarsal", "Navicular", "Fibula", "Calcaneus"]', 1, 'Navicular stress fractures have a high rate of non-union and often require non-weight bearing or fixation.'),
    (v_topic_id, 'A "March Fracture" refers to a stress fracture of which bone?', '["Calcaneus", "Metatarsal (typically 2nd or 3rd)", "Tibia", "Navicular"]', 1, 'Named after soldiers who developed them during long marches.'),

    -- FOOT: NAVICULAR
    (v_topic_id, 'What is the "N-Spot" in the foot?', '["The navicular tuberosity", "The dorsal-central aspect of the navicular (site of maximal tenderness in stress fractures)", "None", "None"]', 1, 'Tenderness at the N-spot is highly suggestive of a navicular stress fracture.'),

    -- FOOT: SESAMOIDITIS
    (v_topic_id, 'Which sesamoid (Medial/Tibial or Lateral/Fibular) is more commonly involved in pathology/fracture?', '["Medial (Tibial) sesamoid", "Lateral (Fibular) sesamoid", "Both equally", "None"]', 0, 'The medial sesamoid bears more weight under the 1st metatarsal head.'),
    (v_topic_id, 'What is "Turf Toe"?', '["A fungal infection", "Sprain/tear of the plantar plate-sesamoid complex of the 1st MTP joint", "Stress fracture of the 5th metatarsal", "None"]', 1, 'It is caused by forced hyperextension (dorsiflexion) of the great toe.'),

    -- FOOT: PLANTAR FASCIA
    (v_topic_id, 'What is the "Windlass Mechanism"?', '["A type of fracture", "The tightening of the plantar fascia as the toes are dorsiflexed, which elevates the longitudinal arch", "A surgical technique", "None"]', 1, 'It is critical for creating a rigid lever during the push-off phase of gait.'),
    (v_topic_id, 'Where is the pain typically located in "Plantar Fasciitis"?', '["At the calcaneal origin of the fascia (medial tubercle)", "At the metatarsal heads", "On the dorsal foot", "None"]', 0, 'Pain is worst with the first steps in the morning.'),

    -- ANKLE: NERVES
    (v_topic_id, '"Tarsal Tunnel Syndrome" involves compression of which nerve?', '["Deep peroneal", "Posterior tibial nerve", "Sural nerve", "Saphenous nerve"]', 1, 'Symptoms occur posterior to the medial malleolus and on the plantar foot.'),
    (v_topic_id, '"Morton''s Neuroma" most commonly occurs between which two metatarsal heads?', '["1st and 2nd", "2nd and 3rd", "3rd and 4th", "4th and 5th"]', 2, 'The 3rd webspace is the most frequent location.'),

    -- ANKLE: OSTEOCHONDRAL LESIONS (OLT)
    (v_topic_id, 'What are the two most common locations for Osteochondral Lesions of the Talus (OLT)?', '["Anterolateral and Posteromedial", "Anteromedial and Posterolateral", "Superior and Inferior", "None"]', 0, 'Anterolateral lesions are usually traumatic/shallow; posteromedial are often atraumatic/deeper.'),

    -- ANKLE: MISC
    (v_topic_id, 'What is the "Os Trigonum"?', '["A fracture", "An accessory ossicle posterior to the talus that can cause posterior impingement", "A tumor", "None"]', 1, 'Common in ballet dancers due to repetitive plantarflexion.'),
    (v_topic_id, 'The "Coleman Block Test" evaluates for:', '["Ankle stability", "Hindfoot flexibility in the setting of a cavus foot", "Meniscus tear", "None"]', 1, 'It determines if the hindfoot varus is flexible or fixed.'),
    (v_topic_id, 'What is "Haglund''s Deformity"?', '["A bunion", "A bony enlargement on the posterior calcaneus (Pump Bump)", "A toe deformity", "None"]', 1, 'It can cause retrocalcaneal bursitis.'),

    -- ADDITIONAL 20+
    (v_topic_id, 'Which muscle is the primary "Invertor" of the foot?', '["Peroneus longus", "Tibialis posterior", "Extensor digitorum", "Gastrocnemius"]', 1, 'Tibialis posterior also provides support to the medial arch.'),
    (v_topic_id, 'The "Too Many Toes" sign is associated with:', '["Clubfoot", "Posterior Tibial Tendon Dysfunction (PTTD)", "Ankle sprain", "None"]', 1, 'As the arch collapses, the forefoot abducts, making more toes visible from behind.'),
    (v_topic_id, 'Which nerve supplies the "Anterior" compartment of the leg (Dorsiflexors)?', '["Superficial peroneal", "Deep peroneal", "Tibial", "Sural"]', 1, 'Injury to this nerve causes "Foot Drop."'),
    (v_topic_id, 'The "Sural Nerve" provides sensation to which part of the foot?', '["Medial side", "Lateral side", "Dorsum", "Plantar surface"]', 1, 'It runs along the lateral border of the Achilles.'),
    (v_topic_id, 'Which tendon passes through the "Susentaculum Tali"?', '["Flexor Hallucis Longus (FHL)", "Tibialis posterior", "Peroneus brevis", "None"]', 0, 'FHL is the "constant" tendon on the medial side.'),
    (v_topic_id, 'What is "Sinus Tarsi Syndrome"?', '["An infection", "Pain in the lateral ankle cavity (sinus tarsi) after inversion injuries, often involving the interosseous ligaments", "A fracture", "None"]', 1, 'It is characterized by localized lateral pain and instability.'),
    (v_topic_id, 'A "Sandwich" injury in the foot typically refers to:', '["A fracture of both metatarsals", "Crush injury with compartment syndrome", "A type of bandage", "None"]', 1, 'The foot has multiple compartments (up to 9) that can develop compartment syndrome.'),
    (v_topic_id, 'The "Mule-Kick" sensation is a classic description of:', '["ACL tear", "Achilles tendon rupture", "Hamstring strain", "Biceps rupture"]', 1, 'Patients often feel as if they were kicked or hit with a ball.'),
    (v_topic_id, 'Which ligament is the primary stabilizer of the "Medial" ankle?', '["ATFL", "Deltoid ligament", "CFL", "AITFL"]', 1, 'The deltoid is extremely strong and prevents eversion/valgus stress.'),
    (v_topic_id, 'True or False: Total ankle arthroplasty (replacement) is generally preferred over arthrodesis (fusion) in young, high-impact athletes.', '["True", "False"]', 1, 'Fusion is still often preferred for high-demand younger patients as replacements have higher failure rates in this group.'),
    (v_topic_id, 'What is "Kohler''s Disease"?', '["AVN of the scaphoid", "Osteochondrosis of the tarsal navicular in children", "A spine condition", "None"]', 1, 'It usually resolves with casting/rest and has a good prognosis.'),
    (v_topic_id, 'What is "Freiberg''s Infraction"?', '["AVN of the lunate", "Osteochondrosis of the metatarsal head (usually the 2nd)", "A hip injury", "None"]', 1, 'Common in adolescent female dancers/athletes.'),
    (v_topic_id, 'The "Silfverskiold Test" differentiates between:', '["MCL and LCL", "Gastrocnemius tightness and Achilles tendon tightness", "ACL and PCL", "None"]', 1, 'If dorsiflexion increases when the knee is flexed, the tightness is in the gastroc (which crosses the knee).'),
    (v_topic_id, 'Which fracture of the talus is known as "Aviator''s Astragalus"?', '["Talar head", "Talar neck", "Talar body", "Lateral process"]', 1, 'Caused by high-energy dorsiflexion (e.g., foot on the rudder during a crash).'),
    (v_topic_id, 'What is the "Hawkins Classification" used for?', '["Ankle sprains", "Talar neck fractures (risk of AVN)", "Lisfranc injuries", "None"]', 1, 'Grade IV talar neck fractures have nearly 100% risk of AVN.'),
    (v_topic_id, 'Which metatarsal is the MOST common site for stress fractures in *non-runners* (e.g., military)?', '["1st", "2nd", "3rd", "5th"]', 1, 'The 2nd metatarsal is the longest and most rigid.'),
    (v_topic_id, 'In the "Ottawa Ankle Rules," an X-ray is required if there is bone tenderness at which location?', '["Lateral malleolus tip", "Medial malleolus tip", "Navicular or 5th metatarsal base", "All of the above"]', 3, 'These rules help avoid unnecessary X-rays for simple sprains.'),
    (v_topic_id, 'Which ankle ligament is the primary restraint to "Anterior" translation of the talus?', '["ATFL", "CFL", "PTFL", "Deltoid"]', 0, 'ATFL is the main anterior stabilizer.'),
    (v_topic_id, 'True or False: A "Talar Tilt" >10 degrees compared to the other side indicates a tear of both the ATFL and CFL.', '["True", "False"]', 0, 'Talar tilt test primarily assesses the CFL after the ATFL is already gone.'),
    (v_topic_id, 'What is the "Thurston Holland" sign?', '["A type of knee injury", "A triangular metaphyseal fragment seen in Salter-Harris II fractures", "A spine sign", "None"]', 1, 'It is characteristic of SH II fractures, which are common in adolescent sports injuries.'),
    (v_topic_id, 'Final Question Part 5: What is the "Bohler''s Angle"?', '["An angle in the hip", "A radiographic measurement of the calcaneus; a decrease suggests a depressed calcaneal fracture", "A knee measurement", "None"]', 1, 'A normal Bohler''s angle is 20-40 degrees.')
    ;
END $$;
