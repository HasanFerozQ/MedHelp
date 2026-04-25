-- Migration: Year 2 - Endocrine Pharmacology MCQ Bank (PART 4: 211-280)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (Reproductive Pharmacology)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrine-pharmacology' LIMIT 1;

    -- Targeted Delete for THIS PART ONLY
    DELETE FROM mcqs 
    WHERE topic_id = v_topic_id 
    AND question IN (
        'What is the primary mechanism of action of Combined Oral Contraceptives (COCs)?',
        'Which estrogen is most commonly used in oral contraceptive pills?',
        'Tamoxifen is a SERM that acts as an antagonist in the breast and an agonist in the:',
        'The primary side effect of concern with Tamoxifen is:',
        'Raloxifene is preferred over Tamoxifen for osteoporosis prevention because it:',
        'Clomiphene citrate is used for infertility; its mechanism is:',
        'What is a common side effect of Clomiphene?',
        'Which drug is a "Pure" Estrogen Receptor Antagonist (SERD)?',
        'The mechanism of Aromatase Inhibitors (e.g., Anastrozole) is:',
        'Aromatase inhibitors are preferred over Tamoxifen in which group of women?',
        'Which drug is a Progesterone receptor antagonist used for medical abortion?',
        'What is the "Mini-pill"?',
        'Which progestin is known for its anti-androgenic and anti-mineralocorticoid properties?',
        'Combined Oral Contraceptives reduce the risk of which cancers?',
        'Combined Oral Contraceptives INCREASE the risk of which complication?',
        'Which condition is an absolute contraindication for COCs?',
        'The mechanism of Mifepristone in abortion is to:',
        'Which drug is an 5-alpha-reductase inhibitor used for BPH?',
        'Finasteride works by blocking the conversion of Testosterone to:',
        'The mechanism of Flutamide in prostate cancer is:',
        'What is the "Plan B" (Emergency Contraception)?',
        'Ulipristal is a Selective Progesterone Receptor Modulator (SPRM) used for:',
        'Danazol is a synthetic androgen used to treat:',
        'A major side effect of Danazol in women is:',
        'Which drug is used for "Chemical Castration" in advanced prostate cancer?',
        'Spironolactone is used in PCOS for its ability to:',
        'Which hormone is responsible for the closure of epiphyseal plates in both males and females?',
        'The use of Estrogen-only HRT in a woman with an intact uterus increases the risk of:',
        'Which drug is an Estrogen receptor agonist used to treat dyspareunia (painful intercourse)?',
        'The mechanism of Leuprolide in endometriosis is:',
        'Which drug class is used to treat heavy menstrual bleeding in women who do not want hormonal therapy?',
        'Anastrozole and Letrozole increase the risk of which bone issue?',
        'What is the mechanism of action of Flutamide?',
        'Which drug is a competitive antagonist of the androgen receptor used for prostate cancer?',
        'Exemestane is an example of which drug class?'
    );

    -- SECTION 5: REPRODUCTIVE PHARMACOLOGY (211-280)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'What is the primary mechanism of action of Combined Oral Contraceptives (COCs)?', '["Inhibition of implantation", "Suppression of ovulation via negative feedback on FSH and LH", "Thickening of cervical mucus only", "Direct destruction of sperm"]', 1, 'Estrogen suppresses FSH (preventing follicle development), and Progestin suppresses LH (preventing the LH surge/ovulation).'),
    (v_topic_id, 'Which estrogen is most commonly used in oral contraceptive pills?', '["Estradiol", "Estriol", "Ethinyl Estradiol", "Diethylstilbestrol"]', 2, 'Ethinyl Estradiol is a potent synthetic estrogen with high oral bioavailability.'),
    (v_topic_id, 'Tamoxifen is a SERM that acts as an antagonist in the breast and an agonist in the:', '["Bone and Liver only", "Endometrium, Bone, and Liver", "Brain", "Ovary"]', 1, 'Its agonist effect on the endometrium increases the risk of endometrial cancer.'),
    (v_topic_id, 'The primary side effect of concern with Tamoxifen is:', '["Breast cancer", "Endometrial hyperplasia/cancer and thromboembolism", "Osteoporosis", "Weight loss"]', 1, 'Increased risk of uterine cancer and deep vein thrombosis are key concerns.'),
    (v_topic_id, 'Raloxifene is preferred over Tamoxifen for osteoporosis prevention because it:', '["Is more potent", "Acts as an antagonist in both breast and endometrium", "Does not cause hot flashes", "Increases libido"]', 1, 'Raloxifene provides bone benefits without increasing the risk of uterine cancer.'),
    (v_topic_id, 'Clomiphene citrate is used for infertility; its mechanism is:', '["Direct LH agonist", "Estrogen receptor antagonist in the hypothalamus/pituitary", "Progesterone receptor agonist", "GnRH blocker"]', 1, 'By blocking negative feedback, it increases FSH and LH secretion, stimulating ovulation.'),
    (v_topic_id, 'What is a common side effect of Clomiphene?', '["Hypoglycemia", "Multiple pregnancies and ovarian enlargement", "Breast atrophy", "Weight loss"]', 1, 'Increased FSH/LH can lead to the maturation of multiple follicles.'),
    (v_topic_id, 'Which drug is a "Pure" Estrogen Receptor Antagonist (SERD)?', '["Tamoxifen", "Fulvestrant", "Raloxifene", "Clomiphene"]', 1, 'Fulvestrant downregulates the estrogen receptor and is used in resistant breast cancer.'),
    (v_topic_id, 'The mechanism of Aromatase Inhibitors (e.g., Anastrozole) is:', '["Blocking estrogen receptors", "Blocking the conversion of androgens to estrogens", "Inhibiting FSH release", "Stimulating progesterone"]', 1, 'They inhibit the enzyme aromatase (CYP19A1).'),
    (v_topic_id, 'Aromatase inhibitors are preferred over Tamoxifen in which group of women?', '["Premenopausal women", "Postmenopausal women with ER-positive breast cancer", "Pregnant women", "Women with osteoporosis"]', 1, 'In postmenopausal women, the primary source of estrogen is peripheral aromatization of adrenal androgens.'),
    (v_topic_id, 'Which drug is a Progesterone receptor antagonist used for medical abortion?', '["Misoprostol", "Mifepristone", "Methotrexate", "Letrozole"]', 1, 'Mifepristone blocks progesterone, leading to decidual breakdown.'),
    (v_topic_id, 'What is the "Mini-pill"?', '["Low-dose COC", "Progestin-only contraceptive", "Emergency contraceptive", "Estrogen-only pill"]', 1, 'Progestin-only pills are used for women who cannot take estrogen.'),
    (v_topic_id, 'Which progestin is known for its anti-androgenic and anti-mineralocorticoid properties?', '["Levonorgestrel", "Medroxyprogesterone", "Drospirenone", "Norethindrone"]', 2, 'Drospirenone is a spironolactone analog; it can cause hyperkalemia.'),
    (v_topic_id, 'Combined Oral Contraceptives reduce the risk of which cancers?', '["Breast and Cervical", "Endometrial and Ovarian", "Lung and Colon", "Liver"]', 1, 'COCs are significantly protective against endometrial and ovarian cancer.'),
    (v_topic_id, 'Combined Oral Contraceptives INCREASE the risk of which complication?', '["Osteoporosis", "Venous Thromboembolism and Gallstones", "Dyslipidemia", "Diabetes"]', 1, 'Estrogen increases clotting factor synthesis and cholesterol saturation in bile.'),
    (v_topic_id, 'Which condition is an absolute contraindication for COCs?', '["Obesity", "Smoker >35 years of age", "Mild hypertension", "History of depression"]', 1, 'Smoking and age >35 carry a very high risk of stroke and MI when combined with estrogen.'),
    (v_topic_id, 'The mechanism of Mifepristone in abortion is to:', '["Cause uterine contractions", "Block progesterone from maintaining the pregnancy", "Kill the fetus directly", "Stop FSH release"]', 1, 'Progesterone is essential for maintaining the decidua.'),
    (v_topic_id, 'Which drug is an 5-alpha-reductase inhibitor used for BPH?', '["Tamsulosin", "Finasteride", "Flutamide", "Sildenafil"]', 1, 'Finasteride and Dutasteride shrink the prostate by reducing DHT levels.'),
    (v_topic_id, 'Finasteride works by blocking the conversion of Testosterone to:', '["Estradiol", "Dihydrotestosterone (DHT)", "Androstenedione", "Aldosterone"]', 1, 'DHT is the more potent androgen responsible for prostate growth.'),
    (v_topic_id, 'The mechanism of Flutamide in prostate cancer is:', '["Inhibiting testosterone synthesis", "Competitive antagonist at the androgen receptor", "Inhibiting 5-alpha-reductase", "GnRH receptor agonist"]', 1, 'It blocks both endogenous and exogenous androgens.'),
    (v_topic_id, 'What is the "Plan B" (Emergency Contraception)?', '["High-dose Ethinyl Estradiol", "Levonorgestrel", "Mifepristone", "Danazol"]', 1, 'Plan B uses a progestin-only approach to delay ovulation.'),
    (v_topic_id, 'Ulipristal is a Selective Progesterone Receptor Modulator used for:', '["Breast cancer", "Emergency contraception and Uterine fibroids", "Infertility", "Menopause"]', 1, 'Ulipristal is the most effective oral emergency contraceptive.'),
    (v_topic_id, 'Danazol is a synthetic androgen used to treat:', '["Prostate cancer", "Endometriosis and Hereditary Angioedema", "Infertility", "Cushing Syndrome"]', 1, 'It causes "pseudomenopause" by inhibiting LH/FSH surge.'),
    (v_topic_id, 'A major side effect of Danazol in women is:', '["Weight loss", "Virilization", "Hypoglycemia", "Lactic acidosis"]', 1, 'Due to its androgenic structure, it causes significant male-like side effects.'),
    (v_topic_id, 'Which drug is used for "Chemical Castration" in advanced prostate cancer?', '["Finasteride", "Continuous Leuprolide", "Tamoxifen", "Testosterone cypionate"]', 1, 'Continuous GnRH leads to downregulation and total suppression of testosterone.'),
    (v_topic_id, 'Spironolactone is used in PCOS for its ability to:', '["Stimulate ovulation", "Block androgen receptors and inhibit 17-alpha-hydroxylase", "Increase estrogen levels", "Decrease insulin resistance"]', 1, 'It helps treat hirsutism and acne in PCOS.'),
    (v_topic_id, 'Which hormone is responsible for the closure of epiphyseal plates in both males and females?', '["Testosterone", "Growth Hormone", "Estrogen", "Progesterone"]', 2, 'In males, testosterone is aromatized to estrogen to cause plate closure.'),
    (v_topic_id, 'The use of Estrogen-only HRT in a woman with an intact uterus increases the risk of:', '["Breast cancer", "Endometrial cancer", "Ovarian cancer", "Colon cancer"]', 1, 'Unopposed estrogen causes endometrial hyperplasia.'),
    (v_topic_id, 'Which drug is an Estrogen receptor agonist used to treat dyspareunia?', '["Ospemifene", "Tamoxifen", "Fulvestrant", "Letrozole"]', 0, 'Ospemifene is a SERM with agonist activity on the vaginal epithelium.'),
    (v_topic_id, 'The mechanism of Leuprolide in endometriosis is:', '["Stimulating ovulation", "Suppression of estrogen levels via GnRH downregulation", "Directly shrinking the tissue", "Blocking progesterone"]', 1, 'Endometrial tissue is estrogen-dependent; suppressing estrogen causes it to atrophy.'),
    (v_topic_id, 'Which drug class is used to treat heavy menstrual bleeding in women who do not want hormonal therapy?', '["NSAIDs", "Tranexamic Acid", "Aromatase Inhibitors", "Bisphosphonates"]', 1, 'Tranexamic acid prevents the breakdown of clots in the uterus.'),
    (v_topic_id, 'Anastrozole and Letrozole increase the risk of which bone issue?', '["Osteopetrosis", "Osteoporosis and Fractures", "Osteosarcoma", "Rickets"]', 1, 'Since they reduce estrogen to near-zero levels, they cause rapid bone loss.'),
    (v_topic_id, 'What is the mechanism of action of Flutamide?', '["Competitive androgen receptor antagonist", "5-alpha-reductase inhibitor", "Aromatase inhibitor", "GnRH agonist"]', 0, 'Flutamide, Bicalutamide, and Enzalutamide are pure androgen receptor blockers.'),
    (v_topic_id, 'Which drug is a competitive antagonist of the androgen receptor used for prostate cancer?', '["Finasteride", "Enzalutamide", "Abiraterone", "Leuprolide"]', 1, 'Enzalutamide is a 2nd-generation androgen receptor antagonist.'),
    (v_topic_id, 'Exemestane is an example of which drug class?', '["SERM", "Irreversible Aromatase Inhibitor", "Reversible Aromatase Inhibitor", "Androgen agonist"]', 1, 'Anastrozole/Letrozole are reversible; Exemestane is irreversible.'),
    (v_topic_id, 'What is the main side effect of Clomiphene Citrate?', '["Hypothyroidism", "Ovarian Hyperstimulation Syndrome", "Lactic acidosis", "Nephrotoxicity"]', 1, 'Excessive stimulation of the ovaries can lead to OHSS.'),
    (v_topic_id, 'Which drug is used to treat male pattern baldness?', '["Finasteride", "Minoxidil", "Both A and B", "Sildenafil"]', 2, 'Finasteride reduces DHT, while Minoxidil increases blood flow to follicles.'),
    (v_topic_id, 'The "Mini-pill" works primarily by:', '["Blocking ovulation", "Thickening cervical mucus and thinning the endometrium", "Blocking sperm motility", "Inducing abortion"]', 1, 'Ovulation is only suppressed in about 50% of cycles; the mucus change is primary.'),
    (v_topic_id, 'Which drug is a non-steroidal estrogen analog associated with vaginal adenocarcinoma in daughters?', '["Estradiol", "Diethylstilbestrol", "Ethinyl Estradiol", "Premarin"]', 1, 'DES is a classic example of a transgenerational carcinogen.'),
    (v_topic_id, 'What is the mechanism of Bicalutamide?', '["Competitive Androgen receptor blocker", "Estrogen blocker", "Inhibits DHT", "Stimulates LH"]', 0, 'Used for metastatic prostate cancer.'),
    (v_topic_id, 'Which drug is a GnRH antagonist used to treat advanced prostate cancer?', '["Leuprolide", "Degarelix", "Abiraterone", "Flutamide"]', 1, 'Unlike agonists (Leuprolide), antagonists do not cause a testosterone flare.'),
    (v_topic_id, 'The mechanism of Mifepristone in treating Cushing Syndrome is:', '["Inhibition of cortisol synthesis", "Antagonism of the glucocorticoid receptor", "Inhibition of ACTH", "Destruction of the adrenal gland"]', 1, 'Mifepristone blocks the receptor.'),
    (v_topic_id, 'Which drug is used for "Hormone Replacement Therapy" specifically to treat hot flashes?', '["Conjugated Estrogens", "Progesterone", "Testosterone", "Aldosterone"]', 0, 'Estrogen is the most effective treatment for vasomotor symptoms.'),
    (v_topic_id, 'In HRT, why is a progestin added to estrogen for women with a uterus?', '["To prevent weight gain", "To prevent endometrial hyperplasia and cancer", "To increase libido", "To prevent bone loss"]', 1, 'Progestin opposes the proliferative effect of estrogen on the uterus.'),
    (v_topic_id, 'The "Copper IUD" works primarily as a:', '["Hormonal contraceptive", "Spermicide", "Abortifacient", "LH blocker"]', 1, 'It is a non-hormonal, long-acting reversible contraceptive.'),
    (v_topic_id, 'What is the mechanism of Medroxyprogesterone acetate?', '["Daily oral suppression", "Long-acting injectable progestin that inhibits ovulation", "Vaginal ring", "Skin patch"]', 1, 'Depo-Provera is injected every 3 months.'),
    (v_topic_id, 'A major side effect of long-term Depo-Provera use is:', '["Hypertension", "Bone mineral density loss", "Liver failure", "Hirsutism"]', 1, 'The FDA recommends limiting use to 2 years if possible.'),
    (v_topic_id, 'Which drug is used to treat "Endometrial Hyperplasia" caused by unopposed estrogen?', '["Estradiol", "Progestins", "Tamoxifen", "Clomiphene"]', 1, 'Progestins cause secretory transformation and shedding of the endometrium.'),
    (v_topic_id, 'What is the effect of estrogen on the lipid profile?', '["Increases LDL, decreases HDL", "Decreases LDL, increases HDL, and increases triglycerides", "Increases LDL, increases HDL", "No effect"]', 1, 'Estrogen is generally cardioprotective regarding LDL/HDL.'),
    (v_topic_id, 'Which SERM is specifically approved for the treatment of moderate-to-severe "Painful Intercourse"?', '["Tamoxifen", "Raloxifene", "Ospemifene", "Bazedoxifene"]', 2, 'Ospemifene has a tissue-selective effect on the vagina.'),
    (v_topic_id, 'Which drug class inhibits the enzyme that converts Testosterone to Estradiol?', '["5-alpha-reductase inhibitors", "Aromatase inhibitors", "Androgen antagonists", "Progestins"]', 1, 'Aromatase converts T to E2.'),
    (v_topic_id, 'Anabolic steroids are associated with which liver complication?', '["Hepatitis A", "Peliosis hepatis and Hepatic adenomas", "Cirrhosis", "Gallstones"]', 1, 'Oral 17-alkylated steroids are particularly hepatotoxic.'),
    (v_topic_id, 'Which drug is a GnRH agonist used to treat precocious puberty?', '["Leuprolide", "Tamoxifen", "Letrozole", "Finasteride"]', 0, 'Continuous administration suppresses the early onset of the HPG axis.'),
    (v_topic_id, 'What is a common side effect of Aromatase Inhibitors?', '["Weight loss", "Joint pain and Myalgia", "Breast enlargement", "Fluid retention"]', 1, 'Low estrogen levels lead to significant musculoskeletal pain.'),
    (v_topic_id, 'Which drug is a combined Estrogen + SERM used for menopausal symptoms?', '["Duavee", "Premarin", "Tamoxifen", "Letrozole"]', 0, 'Bazedoxifene replaces the need for a progestin.'),
    (v_topic_id, 'The mechanism of Clomiphene Citrate is as a:', '["Partial estrogen agonist in the pituitary", "Complete estrogen agonist", "Progesterone agonist", "FSH analog"]', 0, 'It acts as a partial agonist/antagonist.'),
    (v_topic_id, 'Which hormone increases the body temperature after ovulation?', '["Estrogen", "Progesterone", "LH", "FSH"]', 1, 'Progesterone has a thermogenic effect.'),
    (v_topic_id, 'Side effects of Combined Oral Contraceptives include All EXCEPT:', '["Breakthrough bleeding", "Nausea", "Weight gain", "Decreased risk of stroke"]', 3, 'COCs actually slightly increase the risk of stroke.'),
    (v_topic_id, 'What is the "First-Pass Effect" limitation of natural Estradiol?', '["It is too large", "It is rapidly metabolized by the liver when taken orally", "It is toxic to the stomach", "It is unstable in acid"]', 1, 'This is why synthetic Ethinyl Estradiol is used.'),
    (v_topic_id, 'Which drug is an anti-androgen used to treat Acne and Hirsutism?', '["Cyproterone Acetate", "Spironolactone", "Flutamide", "All of the above"]', 3, 'All these drugs block androgen action.'),
    (v_topic_id, 'Which drug inhibits 17-alpha-hydroxylase and is used for castration-resistant prostate cancer?', '["Finasteride", "Abiraterone", "Leuprolide", "Enzalutamide"]', 1, 'Abiraterone blocks androgen synthesis.'),
    (v_topic_id, 'Common side effect of Abiraterone is:', '["Hypokalemia and hypertension", "Hypoglycemia", "Weight loss", "Hair growth"]', 0, 'Blocking 17-alpha-hydroxylase shunts precursors into the mineralocorticoid pathway.'),
    (v_topic_id, 'To prevent the mineralocorticoid side effects of Abiraterone, what is co-administered?', '["Spironolactone", "Prednisone", "Insulin", "Aspirin"]', 1, 'Low-dose prednisone suppresses ACTH.'),
    (v_topic_id, 'The mechanism of Sildenafil in erectile dysfunction is:', '["Inhibition of PDE-5", "Inhibition of PDE-3", "Stimulation of Nitric Oxide", "Alpha-1 block"]', 0, 'PDE-5 inhibition increases cGMP.'),
    (v_topic_id, 'Which drug is a PDE-5 inhibitor with a very long half-life?', '["Sildenafil", "Vardenafil", "Tadalafil", "Avanafil"]', 2, 'Tadalafil is known as "The Weekend Pill."'),
    (v_topic_id, 'PDE-5 inhibitors are absolutely contraindicated with which medication?', '["Beta-blockers", "Nitrates", "Statins", "Metformin"]', 1, 'Combined use can cause life-threatening hypotension.'),
    (v_topic_id, 'Side effect of Sildenafil involving the eyes is:', '["Blurred vision", "Blue-tinted vision", "Double vision", "Glaucoma"]', 1, 'Due to cross-reactivity with PDE-6 in the retina.'),
    (v_topic_id, 'Which drug is used for symptomatic treatment of BPH by relaxing smooth muscle?', '["Finasteride", "Tamsulosin", "Leuprolide", "Sildenafil"]', 1, 'Alpha-1 blockers provide rapid relief.'),
    (v_topic_id, 'What is the "Floppy Iris Syndrome" associated with Tamsulosin?', '["Permanent blindness", "Complication during cataract surgery", "Increased eye pressure", "Cataracts"]', 1, 'Surgeons must be informed.'),
    (v_topic_id, 'Which drug is a Selective Progesterone Receptor Modulator used to treat Uterine Fibroids?', '["Mifepristone", "Ulipristal Acetate", "Tamoxifen", "Letrozole"]', 1, 'Ulipristal can shrink fibroids.');

    RAISE NOTICE 'SUCCESS: Endocrine Pharmacology MCQ Part 4 (211-280) registered.';
END $$;

COMMIT;
