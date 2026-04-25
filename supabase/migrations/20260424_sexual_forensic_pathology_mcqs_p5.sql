-- Migration: Year 2 - Sexual & Forensic Pathology MCQs Part 5 (156-195)
-- Date: 2026-04-24

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    INSERT INTO topics (title, slug, semester_id, year_id, "order")
    VALUES ('Sexual & Forensic Pathology', 'sexual-forensic-pathology', 3, 2, 62)
    ON CONFLICT (slug) DO UPDATE SET year_id = 2, semester_id = 3
    RETURNING id INTO v_topic_id;

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES

    -- ENDOMETRIAL HYPERPLASIA & CARCINOMA (156-165)
    (v_topic_id, 'What is the most important risk factor for the development of Endometrial Hyperplasia and Type I Endometrial Carcinoma?', '["HPV infection", "Unopposed estrogen exposure (e.g., obesity, PCOS, early menarche, late menopause, hormone replacement therapy)", "Multiple pregnancies", "Cigarette smoking"]', 1, 'Endometrial hyperplasia and Type I (endometrioid) carcinoma are driven by excess estrogen. Adipose tissue converts androgens to estrone (estrogen), which is why obesity is a major risk factor. Smoking, paradoxically, slightly decreases the risk by lowering estrogen levels.'),
    (v_topic_id, 'Type II Endometrial Carcinoma (Serous) differs from Type I in that it?', '["Is associated with estrogen", "Arises in an atrophic uterus, is not estrogen-dependent, and is associated with TP53 mutations", "Has a very good prognosis", "Occurs in younger women"]', 1, 'Serous carcinoma (Type II) is more aggressive and typically occurs in older women with an atrophic endometrium. It is characterized by high-grade cytology, psammoma bodies, and mutations in the TP53 gene.'),
    (v_topic_id, 'The "Complex Hyperplasia with Atypia" classification is important because it carries high risk for?', '["Leiomyoma", "Progression to endometrial adenocarcinoma (up to 30% of cases)", "Adenomyosis", "Asherman syndrome"]', 1, 'Hyperplasia with cellular atypia (nuclear pleomorphism, loss of polarity) is the immediate precursor to invasive carcinoma. Complex architectural crowding plus atypia has the highest progression rate.'),
    (v_topic_id, 'What is the classic clinical presentation of endometrial carcinoma?', '["Amenorrhea", "Postmenopausal vaginal bleeding", "Severe pelvic pain only", "Weight loss without bleeding"]', 1, 'Postmenopausal bleeding is endometrial cancer until proven otherwise. It requires prompt evaluation with transvaginal ultrasound (to check endometrial thickness) and endometrial biopsy.'),

    -- OVARIAN TUMORS (166-185)
    (v_topic_id, 'Polycystic Ovary Syndrome (PCOS) is associated with which hormonal pattern?', '["High FSH, Low LH", "Increased LH and decreased FSH (LH:FSH ratio > 3), increased androgens, and insulin resistance", "Normal LH and FSH", "Low estrogen and low progesterone"]', 1, 'PCOS involves a high LH:FSH ratio. High LH stimulates theca cells to produce androgens (causing hirsutism), and low FSH prevents follicle maturation. This leads to chronic anovulation and multiple subepithelial cysts.'),
    (v_topic_id, 'Surface epithelial tumors are the most common type of ovarian cancer. What is the most common subtype?', '["Mucinous cystadenocarcinoma", "Serous cystadenocarcinoma (often bilateral and associated with BRCA1 mutations)", "Endometrioid tumor", "Brenner tumor"]', 1, 'Serous tumors are the most frequent. High-grade serous carcinomas are often bilateral and frequently involve the fallopian tubes. BRCA1 carriers have a significantly increased lifetime risk.'),
    (v_topic_id, 'Psammoma bodies (concentric calcifications) are frequently seen in which ovarian tumor?', '["Yolk sac tumor", "Serous cystadenocarcinoma", "Dysgerminoma", "Fibroma"]', 1, 'Psammoma bodies are characteristic of serous tumors (both ovarian and endometrial) and are also seen in papillary thyroid carcinoma and meningioma.'),
    (v_topic_id, 'A Brenner tumor of the ovary is characterized by?', '["Thyroid tissue", "Urothelial (bladder-like) epithelium within a fibrous stroma", "Mucus-secreting cells", "Clear cells"]', 1, 'Brenner tumors are usually benign and contain "Walthard cell nests" (urothelial-like cells). They are often solid and yellowish-white.'),
    (v_topic_id, 'Dermoid Cyst (Mature Cystic Teratoma) is the most common germ cell tumor. Why is it unique?', '["It is always malignant", "It contains tissue from all three germ layers (e.g., hair, teeth, sebum, brain tissue)", "It produces AFP", "It occurs only in postmenopausal women"]', 1, 'Mature teratomas are benign in females (unlike in males where they are malignant). They contain various tissues. A rare complication is "Struma ovarii," where the teratoma consists primarily of functional thyroid tissue, potentially causing hyperthyroidism.'),
    (v_topic_id, 'What is the ovarian equivalent of a testicular seminoma?', '["Yolk sac tumor", "Dysgerminoma (large cells with clear cytoplasm and central nuclei; associated with Turner syndrome and elevated LDH)", "Choriocarcinoma", "Granulosa cell tumor"]', 1, 'Dysgerminoma is the most common malignant germ cell tumor in females. It is histologically identical to seminoma. LDH (Lactate Dehydrogenase) is its serum tumor marker.'),
    (v_topic_id, 'Markedly elevated Alpha-Fetoprotein (AFP) in a young woman with an ovarian mass and Schiller-Duval bodies on histology suggests?', '["Endodermal Sinus Tumor (Yolk Sac Tumor)", "Dysgerminoma", "Teratoma", "Serous tumor"]', 0, 'Yolk sac tumors are highly malignant and secrete AFP. Schiller-Duval bodies (glomeruloid-like structures) are the pathognomonic histological feature.'),
    (v_topic_id, 'Granulosa Cell Tumors are sex cord-stromal tumors that produce?', '["Androgens", "Estrogen (leading to precocious puberty in girls or endometrial hyperplasia/bleeding in adults)", "Thyroid hormone", "Beta-hCG"]', 1, 'Granulosa cells normally produce estrogen. Tumors secrete excess estrogen. Histologically, "Call-Exner bodies" (small gland-like follicles filled with eosinophilic material) are seen.'),
    (v_topic_id, 'Sertoli-Leydig Cell Tumors of the ovary typically cause?', '["Precocious puberty", "Virilization (hirsutism, deepening of voice, clitoral enlargement) due to androgen production", "Weight gain", "Painless mass only"]', 1, 'These tumors secrete androgens, leading to masculinization in females. Reinke crystals may be seen in the Leydig cell component.'),
    (v_topic_id, 'Meigs Syndrome is a triad consisting of?', '["Fever, rash, and joint pain", "Ovarian fibroma, ascites, and pleural effusion", "Anemia, jaundice, and splenomegaly", "Hirsutism, obesity, and infertility"]', 1, 'Meigs syndrome is associated with ovarian fibromas (benign spindle-cell tumors). The ascites and pleural effusion typically resolve after the tumor is removed.'),
    (v_topic_id, 'A Krukenberg tumor is a metastatic tumor to the ovary. Where is the primary site most often located?', '["Lung", "Gastrointestinal tract (classically the stomach, showing signet ring cells on biopsy)", "Breast", "Kidney"]', 1, 'Krukenberg tumors are characteristically bilateral metastases of mucin-producing signet ring cells. The stomach is the most common primary source.'),
    (v_topic_id, 'Pseudomyxoma peritonei ("jelly belly") is massive intraperitoneal accumulation of gelatinous material. It most often arises from which primary site?', '["Ovary", "Appendix (mucinous tumor)", "Liver", "Pancreas"]', 1, 'While it involves the ovaries, the primary source is usually a mucinous tumor of the appendix that has ruptured and seeded the peritoneum.'),

    -- GESTATIONAL PATHOLOGY (186-195)
    (v_topic_id, 'An Ectopic Pregnancy most commonly occurs in the?', '["Ovary", "Fallopian tube (classically the ampulla)", "Abdominal cavity", "Cervix"]', 1, 'Most ectopic pregnancies occur in the fallopian tube. Risk factors include scarring from prior PID or surgery. It presents with lower abdominal pain and a positive pregnancy test; rupture is a surgical emergency.'),
    (v_topic_id, 'A Complete Hydatidiform Mole results from?', '["Fertilization of a normal egg by two sperm", "Fertilization of an ''empty'' egg (no maternal DNA) by one or two sperm, resulting in 46,XX or 46,XY (paternal DNA only)", "Partial fertilization of a fetus", "Advanced maternal age"]', 1, 'In a complete mole, all genetic material is paternal. There is no fetal tissue. It is associated with a "snowstorm" appearance on ultrasound, "bunch of grapes" gross appearance, and markedly elevated beta-hCG.'),
    (v_topic_id, 'What is the risk of a Complete Hydatidiform Mole progressing to Choriocarcinoma?', '["None", "Approximately 2-3%", "Nearly 50%", "10%"]', 1, 'Complete moles have a higher risk of gestational trophoblastic neoplasia (invade/persist) or choriocarcinoma compared to partial moles.'),
    (v_topic_id, 'A Partial Hydatidiform Mole is characterized by?', '["No fetal tissue", "Fetal tissue present, fertilization of a normal egg by two sperm (69,XXX or 69,XXY), and only partial swelling of villi", "Normal hCG levels", "Complete paternal DNA"]', 1, 'Partial moles have some fetal parts. They are triploid. The risk of malignancy is lower than with complete moles.'),
    (v_topic_id, 'Gestational Choriocarcinoma is a highly malignant tumor that secretes very high levels of?', '["AFP", "Beta-hCG", "Estrogen", "Testosterone"]', 1, 'Choriocarcinoma is a tumor of trophoblasts (syncytiotrophoblasts and cytotrophoblasts). It metastasizes early and hematogenously (classically to the "cannonball" metastases in the lungs). It is remarkably sensitive to chemotherapy (methotrexate).')

    ON CONFLICT DO NOTHING;

END $$;

COMMIT;
