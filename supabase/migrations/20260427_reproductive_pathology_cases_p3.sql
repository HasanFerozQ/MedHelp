-- Migration: Reproductive Pathology Cases Part 3 (21-30)
-- Goal: Cover Male Genital System: Penis, Testis, and Prostate
-- Sources: Pathoma, Robbins, Goljan

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'reproductive-pathology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 21 AND 30);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 21 AND 30;

    -- CASE 21: Hypospadias and Epispadias
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Urethral Opening on the Venter', 'A newborn boy is noted to have a urethral opening on the ventral surface of the penis (the underside).', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this condition called?', '["Epispadias", "Hypospadias", "Phimosis", "Paraphimosis"]', 1, 'Hypospadias is the failure of the urethral folds to close, resulting in a ventral opening.'),
    (v_case_id, 'What embryological defect causes Epispadias?', '["Failure of urethral folds to close", "Abnormal positioning of the genital tubercle", "Failure of descent of the testes", "Failure of the gubernaculum to contract"]', 1, 'Epispadias is a dorsal opening due to an abnormal position of the genital tubercle; it is often associated with bladder exstrophy.'),
    (v_case_id, 'Why is circumcision often delayed in these infants?', '["To prevent infection", "The foreskin is needed for surgical repair of the urethra", "It is too painful", "It is not needed"]', 1, 'The prepuce (foreskin) is used as a graft to reconstruct the urethra.');

    -- CASE 22: Cryptorchidism and Orchitis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Undescended Testis', 'A 2-year-old boy has a routine check-up. The pediatrician is unable to palpate the right testis in the scrotum.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common complication if this is not corrected early?', '["ITP", "Testicular Atrophy and Infertility", "Priapism", "Prostatitis"]', 1, 'Persistent undescended testis leads to atrophy and infertility due to the higher temperature of the inguinal canal or abdomen.'),
    (v_case_id, 'Cryptorchidism significantly increases the risk of which malignancy?', '["Prostate Adenocarcinoma", "Seminoma (and other germ cell tumors)", "Leydig cell tumor", "Rhabdomyosarcoma"]', 1, 'The risk for germ cell tumors remains elevated even after the testis is surgically brought down (orchiopexy).'),
    (v_case_id, 'Which virus is a classic cause of orchitis in teenage boys?', '["HSV", "Mumps", "EBV", "HIV"]', 1, 'Mumps virus infection in post-pubertal males can lead to painful orchitis, which may result in infertility.');

    -- CASE 23: Testicular Torsion
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Sudden Scrotal Pain', 'A 15-year-old boy wakes up with sudden, excruciating pain in his left scrotum. He also has nausea and vomiting. On exam, the left testis is high-riding and the cremasteric reflex is absent.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying anatomical defect that predisposes to this condition?', '["Patent processus vaginalis", "Bell-clapper deformity (high attachment of tunica vaginalis)", "Hydrocele", "Varicocele"]', 1, 'The bell-clapper deformity allows the testis to rotate freely within the scrotum, twisting the spermatic cord.'),
    (v_case_id, 'Why does torsion lead to hemorrhagic infarction?', '["Arteries twist first", "Veins are thin-walled and obstructed first, but thick-walled arteries continue to pump blood into the organ", "It is an autoimmune reaction", "Lack of lymphatics"]', 1, 'Venous congestion occurs first. Pressure builds up until arterial flow is blocked, and the resulting infarct is hemorrhagic because blood was trapped in the organ.'),
    (v_case_id, 'What is the time limit to surgically untwist the testis before permanent damage occurs?', '["1 hour", "6 hours", "24 hours", "48 hours"]', 1, 'Surgical intervention within 6 hours has a high salvage rate; after 12-24 hours, the testis is usually non-viable.');

    -- CASE 24: Varicocele vs Hydrocele
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, '"Bag of Worms"', 'A 25-year-old man presents with a dull ache in his left scrotum. On exam, there is a soft, mass above the testis that feels like a "bag of worms." It increases in size when he stands or coughs.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Hydrocele", "Spermatocele", "Varicocele", "Testicular Tumor"]', 2, 'A varicocele is a dilation of the pampiniform plexus of veins, most commonly on the left side.'),
    (v_case_id, 'Why is a varicocele more common on the left side?', '["The left testis is lower", "The left spermatic vein drains into the left renal vein at a 90-degree angle", "The right spermatic vein drains into the IVC", "Both B and C"]', 3, 'The anatomical difference in drainage (left renal vein vs directly into the IVC) makes the left side more prone to venous backup.'),
    (v_case_id, 'How can you distinguish a Hydrocele from a Testicular Tumor on physical exam?', '["Hydroceles are painful", "Hydroceles will transilluminate with light; solid tumors will not", "Hydroceles are only on the right", "Hydroceles feel firm and nodular"]', 1, 'Transillumination is the key clinical test for fluid-filled sacs like hydroceles.');

    -- CASE 25: Seminoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Solid Scrotal Mass', 'A 30-year-old man presents with a painless, heavy sensation in his right scrotum. Exam reveals a solid, non-tender mass that does NOT transilluminate. Ultrasound confirms a solid mass within the testis.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common malignant testicular germ cell tumor?', '["Yolk Sac Tumor", "Choriocarcinoma", "Seminoma", "Teratoma"]', 2, 'Seminomas are the most common testicular cancer, typically occurring in the 4th decade.'),
    (v_case_id, 'What is the classic histological appearance of a seminoma?', '["Small cells in rosettes", "Large, uniform cells with clear cytoplasm and central nuclei (fried-egg) in a lobulated pattern", "Aggregates of mature skin and teeth", "Sheets of hemorrhagic cells"]', 1, 'The histology of seminoma is identical to dysgerminoma in females.'),
    (v_case_id, 'What is the prognosis for seminoma?', '["Extremely poor", "Excellent; they are highly radiosensitive and have a high cure rate", "Only cured with surgery alone", "They never metastasize"]', 1, 'Seminomas are highly sensitive to radiation and have an excellent prognosis.');

    -- CASE 26: Yolk Sac Tumor (Male)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Testicular Mass in a Toddler', 'A 2-year-old boy presents with a testicular mass. Lab studies show a markedly elevated alpha-fetoprotein (AFP).', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Seminoma", "Yolk Sac Tumor (Endodermal Sinus Tumor)", "Choriocarcinoma", "Embryonal Carcinoma"]', 1, 'Yolk sac tumor is the most common testicular tumor in children under 3 years old.'),
    (v_case_id, 'What characteristic histological structure is seen in this tumor?', '["Call-Exner bodies", "Schiller-Duval bodies", "Psammoma bodies", "Reinke crystals"]', 1, 'Schiller-Duval bodies resemble primitive glomeruli and are characteristic of yolk sac tumors.'),
    (v_case_id, 'Is AFP used to monitor seminomas?', '["Yes", "No, seminomas are typically AFP-negative; elevated AFP suggests a non-seminomatous component", "Only in smokers", "Only in older men"]', 1, 'Seminomas do not produce AFP. If AFP is elevated in a patient with a "seminoma," it is actually a mixed germ cell tumor.');

    -- CASE 27: Testicular Choriocarcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Gynecomastia and High hCG', 'A 25-year-old man presents with a small, palpable testicular mass and breast enlargement (gynecomastia). His serum hCG is extremely high.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Seminoma", "Choriocarcinoma", "Yolk Sac Tumor", "Teratoma"]', 1, 'Choriocarcinoma is a rare, highly aggressive tumor that produces massive amounts of hCG.'),
    (v_case_id, 'Why does this patient have gynecomastia?', '["hCG is toxic to the breasts", "The alpha-subunit of hCG is similar to LH and FSH, stimulating estrogen production", "The tumor produces estrogen directly", "It is a side effect of surgery"]', 1, 'hCG can cross-react with LH/FSH receptors, stimulating the testis to produce estrogen.'),
    (v_case_id, 'How does testicular choriocarcinoma typically spread?', '["Lymphatic spread to inguinal nodes", "Early hematogenous spread to lungs and brain", "Local spread only", "It does not metastasize"]', 1, 'Unlike seminomas, choriocarcinoma spreads early via the bloodstream, often presenting with symptoms of distant metastases (hemoptysis, headache).');

    -- CASE 28: Benign Prostatic Hyperplasia (BPH)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Periurethral Enlargement', 'A 75-year-old man presents with difficulty starting his stream, nocturia, and "dribbling" after urination.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where in the prostate does BPH primarily occur?', '["Peripheral zone", "Central zone", "Transitional (periurethral) zone", "Fibromuscular stroma"]', 2, 'BPH occurs in the transitional zone, which compresses the urethra and leads to obstructive symptoms.'),
    (v_case_id, 'What is the role of 5-alpha-reductase in this condition?', '["It converts DHT to testosterone", "It converts testosterone to DHT in the stromal cells", "It inhibits estrogen", "It promotes apoptosis"]', 1, 'DHT is the primary driver of prostatic hyperplasia. 5-alpha-reductase inhibitors (like finasteride) are used for treatment.'),
    (v_case_id, 'Which of the following is NOT a complication of BPH?', '["Bladder hypertrophy", "Hydronephrosis", "Increased risk of prostate cancer", "Urinary tract infections"]', 2, 'BPH is NOT a precursor to cancer.');

    -- CASE 29: Prostate Adenocarcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Hard, Nodular Prostate', 'An 80-year-old man has a routine digital rectal exam (DRE) that reveals a hard, irregular nodule in the posterior-lateral part of the prostate.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where does prostate adenocarcinoma most commonly arise?', '["Transitional zone", "Central zone", "Peripheral zone", "Urethra"]', 2, 'Prostate cancer typically arises in the peripheral zone, which is why it often does NOT cause early urinary symptoms but IS palpable on DRE.'),
    (v_case_id, 'What is the "Gleason Score" based on?', '["PSA level", "Nuclear atypia", "Architectural pattern of the glands (how well they form tubes)", "Size of the tumor"]', 2, 'The Gleason score is based on glandular architecture, not nuclear features. Grade 1 consists of well-formed glands; Grade 5 shows no gland formation.'),
    (v_case_id, 'Where is the most common site of metastasis for prostate cancer?', '["Lungs", "Liver", "Bone (osteoblastic lesions)", "Brain"]', 2, 'Prostate cancer classically spreads to the lumbar spine and pelvis, causing osteoblastic (bone-forming) metastases and high alkaline phosphatase.');

    -- CASE 30: Prostatitis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Pain on Defecation and Fever', 'A 45-year-old man presents with fever, chills, and perineal pain. He also reports pain with bowel movements. On exam, his prostate is exquisitely tender and "boggy."', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute Prostatitis", "BPH", "Prostate Cancer", "Cystitis"]', 0, 'Acute bacterial prostatitis presents with systemic symptoms (fever/chills) and a very tender prostate.'),
    (v_case_id, 'Which organism is the most common cause in a man over 35?', '["Neisseria gonorrhoeae", "Chlamydia trachomatis", "E. coli", "Staph aureus"]', 2, 'In older men, E. coli and other gram-negatives are common causes. In younger men, Chlamydia and Gonorrhea are more likely.'),
    (v_case_id, 'Why should a DRE be performed gently in suspected acute prostatitis?', '["It is too painful", "Risk of inducing bacteremia/sepsis", "It can break the prostate", "It is not needed for diagnosis"]', 1, 'Vigorous massage or manipulation of an infected prostate can push bacteria into the bloodstream.');

    RAISE NOTICE 'SUCCESS: Reproductive Pathology Cases Part 3 (21-30) registered.';
END $$;

COMMIT;
