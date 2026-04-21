-- ==========================================
-- Reproductive Physiology Clinical Cases Migration
-- 25 Scenarios | Semester 2 First Year
-- ==========================================

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Get Topic ID
    SELECT id INTO v_topic_id FROM public.topics 
    WHERE title = 'Reproductive Physiology' AND (semester_id = 2 OR usmle_step = 1) 
    LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "Reproductive Physiology" not found.';
    END IF;

    -- 2. Clear existing cases for this topic
    DELETE FROM public.case_studies WHERE topic_id = v_topic_id;

    -- CASE 1
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypothalamic-Pituitary-Gonadal Axis', 'A 17-year-old student is asked to explain the hormonal control of puberty and reproductive function.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'GnRH is secreted by the:', '["Anterior pituitary", "Posterior pituitary", "Hypothalamus", "Gonads", "Adrenal cortex"]', 2, 'Gonadotropin-releasing hormone is a hypothalamic product.'),
    (v_case_id, 'GnRH stimulates secretion of which two anterior pituitary hormones?', '["ACTH and TSH", "FSH and LH", "Prolactin and GH", "ADH and oxytocin", "T3 and T4"]', 1, 'FSH and LH are the gonadotropins.'),
    (v_case_id, 'GnRH is most effective when secreted in a:', '["Constant continuous pattern", "Pulsatile pattern", "Yearly burst", "Stress-dependent pattern only", "Meal-dependent pattern only"]', 1, 'Pulsatility prevents receptor downregulation.'),
    (v_case_id, 'Continuous GnRH exposure tends to:', '["Increase gonadotropin release indefinitely", "Suppress gonadotropin release after initial stimulation", "Increase prolactin only", "Increase oxytocin only", "Stimulate testosterone independently of pituitary"]', 1, 'Chronic GnRH exposure causes desensitization of gonadotrophs.');

    -- CASE 2
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Male Gonadal Regulation', 'A healthy 20-year-old man undergoes hormonal evaluation in a physiology lab.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'LH primarily stimulates:', '["Sertoli cells", "Leydig cells", "Prostate gland", "Epididymis", "Seminal vesicles"]', 1, 'LH acts on Leydig cells to produce testosterone.'),
    (v_case_id, 'Leydig cells mainly produce:', '["Inhibin", "Testosterone", "FSH", "Prolactin", "Estrogen only"]', 1, 'Primary androgen source in males.'),
    (v_case_id, 'FSH primarily acts on:', '["Leydig cells", "Sertoli cells", "Adrenal medulla", "Corpus luteum", "Oocytes"]', 1, 'FSH supports spermatogenesis via the Sertoli cells.'),
    (v_case_id, 'Sertoli cells produce which hormone that suppresses FSH?', '["Testosterone", "Progesterone", "Inhibin B", "Oxytocin", "hCG"]', 2, 'Inhibin B provides negative feedback specific to FSH.');

    -- CASE 3
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Spermatogenesis Support', 'A physiology teacher asks about the microenvironment required for sperm production.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Testosterone is necessary for spermatogenesis mainly within the:', '["Epididymis", "Seminiferous tubules", "Vas deferens", "Prostate", "Urethra"]', 1, 'High local concentrations are required in the germinal epithelium.'),
    (v_case_id, 'Which cells help maintain a high intratubular testosterone concentration by producing androgen-binding protein?', '["Leydig cells", "Sertoli cells", "Spermatogonia", "Peritubular myoid cells", "Epididymal cells"]', 1, 'ABP is a Sertoli cell product.'),
    (v_case_id, 'The blood-testis barrier is formed mainly by tight junctions between:', '["Leydig cells", "Sertoli cells", "Spermatids", "Epididymal cells", "Endothelial cells only"]', 1, 'Sertoli cell junctions partition the tubules.'),
    (v_case_id, 'The blood-testis barrier is important mainly because it:', '["增加 urinary testosterone", "Protects developing germ cells from immune exposure", "Secretes GnRH", "Activates sperm motility", "Produces prostaglandins"]', 1, 'Prevents autoimmune reactions against haploid germ cells.');

    -- CASE 4
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Testosterone Feedback', 'A man receives exogenous testosterone for non-medical reasons.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Exogenous testosterone would most likely suppress:', '["GnRH, LH, and FSH", "Prolactin only", "ADH only", "TSH and ACTH", "Oxytocin only"]', 0, 'Feedback loop inhibits the upstream drivers.'),
    (v_case_id, 'Endogenous testicular testosterone production falls mainly because LH decreases, reducing stimulation of:', '["Sertoli cells", "Leydig cells", "Epididymal cells", "Prostatic cells", "Germ cells directly"]', 1, 'Leydig cells stop producing when LH is absent.'),
    (v_case_id, 'Spermatogenesis may decrease despite normal serum androgen effect because:', '["Intratesticular testosterone may fall", "Estrogen always rises too much", "Oxytocin is blocked", "Prolactin falls to zero", "hCG is destroyed"]', 0, 'Intratesticular levels must be ~100x higher than serum for sperm production.');

    -- CASE 5
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sperm Maturation and Transport', 'A fertility specialist reviews normal sperm development.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Sperm are produced in the:', '["Epididymis", "Seminiferous tubules", "Vas deferens", "Seminal vesicles", "Prostate"]', 1, 'Creation happens in the testis tubules.'),
    (v_case_id, 'Sperm gain motility and functional maturation mainly in the:', '["Testis", "Epididymis", "Urethra", "Prostate", "Ejaculatory duct"]', 1, 'Sperm arrive in the epididymis unable to swim; they mature there.'),
    (v_case_id, 'During ejaculation, sperm travel from the epididymis into the:', '["Ureter", "Vas deferens", "Seminiferous tubules", "Rectum", "Urachus"]', 1, 'The ductus deferens carries them toward the urethra.');

    -- CASE 6
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Accessory Glands in Males', 'A student is asked about the composition of semen.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The seminal vesicles contribute fluid that is typically:', '["Acidic and enzyme-rich", "Alkaline and fructose-rich", "Purely mucous only", "Testosterone-rich only", "Rich in bile salts"]', 1, 'Fructose provides energy for the sperm.'),
    (v_case_id, 'The prostate contributes semen fluid containing:', '["Fructose only", "Citrate and proteolytic enzymes", "Spermatozoa only", "Progesterone only", "Glucose only"]', 1, 'PSA and zinc are also prostatic products.'),
    (v_case_id, 'Bulbourethral glands mainly secrete:', '["Acidic enzymes", "Mucus for lubrication", "Testosterone", "Sperm", "Fructose-rich fluid"]', 1, 'Pre-ejaculate lubricates the urethra.');

    -- CASE 7
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Erection vs Ejaculation', 'A 25-year-old healthy man is asked about the autonomic control of sexual function.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Penile erection is mediated primarily by:', '["Sympathetic alpha-1 stimulation", "Parasympathetic-mediated vasodilation", "Somatic motor output only", "Adrenal cortisol release", "hCG"]', 1, 'Point (Parasympathetic) and Shoot (Sympathetic).'),
    (v_case_id, 'A key mediator of penile erection is:', '["Histamine", "Nitric oxide", "Aldosterone", "ADH", "TSH"]', 1, 'NO leads to cGMP-mediated relaxation of cavernous smooth muscle.'),
    (v_case_id, 'Ejaculation is mediated primarily by:', '["Parasympathetic outflow only", "Sympathetic outflow", "Vagal reflex only", "Pituitary discharge", "Renal reflexes"]', 1, 'Sympathetic nerves trigger emission and ejaculation.'),
    (v_case_id, 'The external urethral sphincter and pelvic floor muscles contribute through:', '["Somatic innervation", "Only sympathetic input", "Only parasympathetic input", "Hormonal control only", "Endocrine feedback only"]', 0, 'Pudendal nerve (somatic) provides voluntary control.');

    -- CASE 8
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ovarian Cycle Basics', 'A 21-year-old woman tracks her menstrual cycle.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The first half of the ovarian cycle is the:', '["Luteal phase", "Follicular phase", "Secretory phase", "Menstrual phase only", "Implantation phase"]', 1, 'Focuses on the development of the follicle.'),
    (v_case_id, 'Ovulation is triggered by the mid-cycle surge of:', '["FSH only", "LH", "Prolactin", "Progesterone", "hCG"]', 1, 'The Luteinizing Hormone (LH) surge.'),
    (v_case_id, 'After ovulation, the ruptured follicle becomes the:', '["Corpus albicans immediately", "Corpus luteum", "Zona pellucida", "Endometrium", "Decidua basalis"]', 1, 'The "yellow body" secretes progesterone.');

    -- CASE 9
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Follicular Development', 'A physiology question asks how ovarian follicles mature.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'FSH primarily stimulates growth of:', '["The corpus luteum only", "Ovarian follicles", "Endometrial shedding", "Cervical closure", "Placenta"]', 1, 'As the name implies: Follicle Stimulating Hormone.'),
    (v_case_id, 'Granulosa cells are especially responsive to:', '["LH only", "FSH", "ACTH", "TSH", "Oxytocin"]', 1, 'FSH drives granulosa cell activity and aromatase.'),
    (v_case_id, 'Theca interna cells are stimulated mainly by:', '["FSH", "LH", "Prolactin", "Progesterone", "Inhibin"]', 1, 'LH triggers the production of androgens in theca cells.'),
    (v_case_id, 'The two-cell, two-gonadotropin model states that androgens produced by theca cells are converted to estrogens by granulosa cells via:', '["5-alpha reductase", "Aromatase", "Thyroid peroxidase", "Carbonic anyhydrase", "Renin"]', 1, 'Aromatase is the key enzyme for estrogen synthesis.');

    -- CASE 10
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Estrogen Physiology', 'A young woman in the late follicular phase has rising estradiol levels.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Estrogen in the follicular phase is produced mainly by:', '["Adrenal medulla", "Granulosa cell aromatization of androgens", "Corpus luteum only", "Posterior pituitary", "Placenta only"]', 1, 'The developing follicle is the primary source.'),
    (v_case_id, 'One major effect of estrogen on the reproductive tract is:', '["Making cervical mucus thick and scant", "Proliferation of the endometrium", "Triggering menstruation directly", "Suppressing all uterine growth", "Relaxing the myometrium completely throughout cycle"]', 1, 'Estrogen "builds" the lining (proliferative phase).'),
    (v_case_id, 'Estrogen usually exerts negative feedback on GnRH/LH/FSH, but near ovulation sustained high estrogen causes:', '["Complete pituitary shutdown", "Positive feedback leading to LH surge", "Progesterone surge first", "Reduced LH", "Increased prolactin only without LH change"]', 1, 'This unusual positive feedback switch enables ovulation.');

    -- CASE 11
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Progesterone Physiology', 'A woman in the luteal phase has elevated progesterone.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Progesterone is secreted mainly by the:', '["Theca externa", "Corpus luteum", "Hypothalamus", "Anterior pituitary", "Adrenal medulla"]', 1, 'Formed from the follicle post-ovulation.'),
    (v_case_id, 'Progesterone converts the endometrium into the:', '["Proliferative phase", "Secretory phase", "Menstrual phase", "Atrophic phase", "Basal phase only"]', 1, 'Endometrium becomes highly vascular and glandular.'),
    (v_case_id, 'Progesterone makes cervical mucus:', '["Thin and watery", "Thick and less permeable to sperm", "Alkaline and abundant only", "Bloody", "Rich in fructose"]', 1, 'Creates a "plug" to prevent further sperm entry after fertilization possibility.'),
    (v_case_id, 'Progesterone typically causes basal body temperature to:', '["Fall", "Rise slightly", "Stay unchanged always", "Become unstable only in pregnancy", "Equal ambient temperature"]', 1, 'Thermogenic effect is used for natural family planning.');

    -- CASE 12
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Menstrual Cycle and Endometrium', 'A medical student is comparing ovarian and uterine cycles.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The proliferative phase of the endometrium is driven mainly by:', '["Progesterone", "Estrogen", "hCG", "Oxytocin", "Prolactin"]', 1, 'Coincides with the follicular phase of the ovary.'),
    (v_case_id, 'The secretory phase is driven mainly by:', '["Estrogen only", "Progesterone", "FSH only", "LH only", "ACTH"]', 1, 'Coincides with the luteal phase of the ovary.'),
    (v_case_id, 'Menstruation occurs when there is withdrawal of:', '["Only FSH", "Estrogen and progesterone", "Only prolactin", "Only oxytocin", "Only inhibin"]', 1, 'Lysis of the corpus luteum causes the drop.');

    -- CASE 13
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Mid-Cycle Hormone Dynamics', 'A woman is studied during ovulation.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The LH surge is triggered by:', '["Low estrogen", "Sustained high estrogen positive feedback", "High progesterone alone", "Inhibin alone", "Low GnRH pulse frequency"]', 1, 'The sustained peak (24-48h) triggers the surge.'),
    (v_case_id, 'Ovulation occurs approximately:', '["At the start of menstruation", "14 days before the next menstrual period", "14 days after the end of menstruation in every woman regardless of cycle length", "Only when progesterone peaks", "During implantation"]', 1, 'The luteal phase is consistently 14 days.'),
    (v_case_id, 'After ovulation, the oocyte is captured by the:', '["Endometrium", "Fimbriae of the uterine tube", "Cervix", "Vagina", "Broad ligament directly"]', 1, 'Sweep the egg into the fallopian tube.');

    -- CASE 14
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fertilization and Early Embryology Physiology', 'A fertilized ovum is followed through the female tract.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Fertilization usually occurs in the:', '["Cervix", "Ampulla of the uterine tube", "Endometrium", "Ovary", "Vagina"]', 1, 'The widest part of the fallopian tube.'),
    (v_case_id, 'Before fertilization, sperm must undergo a functional change in the female tract called:', '["Implantation", "Capacitation", "Decidualization", "Organification", "Luteolysis"]', 1, 'Removal of surface proteins to allow the acrosome reaction.'),
    (v_case_id, 'The acrosome reaction helps sperm:', '["Produce testosterone", "Penetrate the zona pellucida", "Implant into endometrium", "Divide mitotically", "Form the corpus luteum"]', 1, 'Release of enzymes to digest the egg coating.');

    -- CASE 15
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Implantation and hCG', 'A woman misses her menstrual period and has a positive pregnancy test.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The hormone detected first in early pregnancy tests is usually:', '["Progesterone", "hCG", "LH", "Prolactin", "Oxytocin"]', 1, 'Human chorionic gonadotropin.'),
    (v_case_id, 'hCG is secreted by the:', '["Corpus luteum", "Syncytiotrophoblast", "Cytotrophoblast only", "Maternal pituitary", "Endometrial glands only"]', 1, 'Outer layer of the developing blastocyst.'),
    (v_case_id, 'The main early function of hCG is to:', '["Cause menstruation", "Maintain the corpus luteum", "Inhibit progesterone secretion", "Trigger oxytocin release", "Suppress placental growth"]', 1, 'Acts on LH receptors to keep the CL alive and producing progesterone.'),
    (v_case_id, 'hCG is structurally similar most closely to:', '["Prolactin", "LH", "ACTH", "ADH", "Testosterone"]', 1, 'They share the same alpha-subunit with TSH and FSH.');

    -- CASE 16
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Placental Hormones', 'A teacher asks about endocrine function of the placenta later in pregnancy.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'After the first trimester, the placenta becomes a major source of:', '["Progesterone and estrogens", "FSH and LH", "TSH and ACTH", "Testosterone only", "GnRH only"]', 0, 'The "luteal-placental shift" occurs.'),
    (v_case_id, 'Placental progesterone is important for:', '["Stimulating uterine contractions strongly", "Maintaining the uterine lining and reducing myometrial excitability", "Triggering ovulation", "Promoting menstruation", "Inhibiting breast development"]', 1, 'Progesterone "quiets" the uterus during pregnancy.'),
    (v_case_id, 'Human placental lactogen (hPL) has a major effect of:', '["Lower maternal lipolysis", "Increasing maternal insulin sensitivity", "Producing a diabetogenic state to favor fetal nutrient supply", "Replacing hCG in early luteal rescue", "Inhibiting mammary growth completely"]', 2, 'Increases maternal blood glucose and fats for the fetus.');

    -- CASE 17
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Parturition Physiology', 'A pregnant woman at term develops regular uterine contractions.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Oxytocin is synthesized in the:', '["Anterior pituitary", "Hypothalamus", "Posterior pituitary", "Placenta", "Ovary"]', 1, 'Produced in SON/PVN nuclei.'),
    (v_case_id, 'Oxytocin is released from the:', '["Anterior pituitary", "Posterior pituitary", "Adrenal medulla", "Placenta", "Corpus luteum"]', 1, 'Neurohypophyseal secretion.'),
    (v_case_id, 'Oxytocin during labor primarily causes:', '["Cervical mucus thickening only", "Uterine smooth muscle contraction", "Ovulation", "Follicular development", "Testicular steroidogenesis"]', 1, 'Drives the power of labor.'),
    (v_case_id, 'Uterine stretch near term promotes more oxytocin release, which is an example of:', '["Negative feedback", "Positive feedback", "Feedforward inhibition", "Osmotic regulation", "Countercurrent exchange"]', 1, 'Ferguson reflex (self-augmenting).');

    -- CASE 18
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lactation Physiology', 'A postpartum woman begins breastfeeding.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Milk production is stimulated mainly by:', '["Oxytocin", "Prolactin", "Progesterone", "FSH", "LH"]', 1, 'Prolactin = Production.'),
    (v_case_id, 'Milk ejection or let-down is mediated mainly by:', '["Prolactin", "Oxytocin", "Estrogen", "hCG", "ACTH"]', 1, 'Oxytocin = Out (ejection).'),
    (v_case_id, 'Suckling increases prolactin mainly by decreasing hypothalamic:', '["GnRH", "Dopamine", "TRH", "GHRH", "CRH"]', 1, 'Removing the dopamine "brake" allows prolactin to rise.'),
    (v_case_id, 'During pregnancy, high estrogen and progesterone prepare the breast but inhibit full milk secretion until after delivery because:', '["Placenta suppresses pituitary forever", "Their fall after delivery permits prolactin’s lactogenic effect", "Oxytocin disappears", "Dopamine rises markedly postpartum", "hCG blocks mammary receptors"]', 1, 'Steroids prevent milk synthesis until the baby is born.');

    -- CASE 19
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Puberty Physiology', 'A 12-year-old girl begins breast development and then menarche months later.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Puberty begins mainly with increased pulsatile release of:', '["FSH from ovary", "GnRH from hypothalamus", "Prolactin from posterior pituitary", "hCG from placenta", "ADH from hypothalamus"]', 1, 'Re-awakening of the HPG axis.'),
    (v_case_id, 'Thelarche refers to:', '["Onset of menstruation", "Breast development", "Pubic hair growth only", "Ovulation", "Decidualization"]', 1, 'First physical sign of female puberty usually.'),
    (v_case_id, 'Menarche refers to:', '["First ovulation only", "First menstrual bleeding", "First LH surge", "First pregnancy", "First breast bud"]', 1, 'The onset of menstruation.');

    -- CASE 20
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Menopause Physiology', 'A 52-year-old woman reports hot flashes and irregular periods that eventually stop.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Menopause occurs because of:', '["Pituitary failure first", "Ovarian follicular depletion", "Excess progesterone", "Excess prolactin", "Hypothalamic destruction in all women"]', 1, 'The "bank" of follicles is empty.'),
    (v_case_id, 'After menopause, FSH and LH are typically:', '["Low", "High", "Zero", "Unchanged", "Lower than during pregnancy"]', 1, 'Hypergonadotropic hypogonadism due to lack of feedback inhibition.'),
    (v_case_id, 'The rise in gonadotropins occurs because of loss of ovarian:', '["Negative feedback by estrogen and inhibin", "Positive feedback by progesterone", "Oxytocin release", "hCG production", "Placental lactogen"]', 0, 'No more estrogen/inhibin to tell the pituitary to slow down.');

    -- CASE 21
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Male Sexual Differentiation', 'A physiology question asks about fetal male development.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The fetal testes develop under the influence of the Y chromosome gene:', '["FMR1", "SRY", "CFTR", "DAX1 only", "SHOX"]', 1, 'Sex-determining Region of Y.'),
    (v_case_id, 'Sertoli cells in the male fetus secrete:', '["Testosterone", "Anti-Müllerian hormone", "hCG", "Progesterone", "Inhibin A only"]', 1, 'AMH is crucial for "erasing" female internal precursors.'),
    (v_case_id, 'Anti-Müllerian hormone causes regression of the:', '["Wolffian ducts", "Müllerian ducts", "Gonads", "Urogenital sinus", "External genitalia"]', 1, 'Müllerian ducts would become the uterus and tubes.'),
    (v_case_id, 'Testosterone from fetal Leydig cells supports development of the:', '["Müllerian structures", "Wolffian structures", "Placenta", "Endometrium", "Oocytes"]', 1, 'Wolffian ducts become vas deferens/epididymis.');

    -- CASE 22
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'DHT Physiology', 'A 46,XY fetus has normal testosterone production but impaired conversion to DHT.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'DHT is produced from testosterone by:', '["Aromatase", "5-alpha reductase", "21-hydroxylase", "11-beta hydroxylase", "Thyroid peroxidase"]', 1, 'Dihydrotestosterone (DHT) is a potent androgen.'),
    (v_case_id, 'DHT is particularly important for development of the:', '["Wolffian ducts", "Internal female tract", "External male genitalia and prostate", "Testicular descent only", "Seminiferous tubules only"]', 2, 'Without 5-alpha reductase, external genitalia appear female/ambiguous.'),
    (v_case_id, 'Testosterone itself is more important than DHT for development of:', '["Prostate", "External male genitalia", "Wolffian ducts", "Clitoris", "Labia majora"]', 2, 'DHT is not required for the internal Wolffian structures.');

    -- CASE 23
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Placental Exchange and Fetal Circulation Link', 'A teacher explains fetal dependence on the placenta.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The placenta provides the fetus primarily with:', '["Direct maternal blood flow into fetal arteries", "Exchange of gases and nutrients across a placental barrier", "Direct mixing of maternal and fetal circulation normally", "Only endocrine support", "Only oxygen without nutrients"]', 1, 'Maternal and fetal blood normally do NOT mix.'),
    (v_case_id, 'The umbilical vein carries blood that is relatively:', '["Deoxygenated from fetus to placenta", "Oxygenated from placenta to fetus", "Identical to maternal arterial blood", "Fully mixed venous blood only", "Rich in carbon dioxide only"]', 1, 'Vein = Toward heart (the only oxygenated vein in fetus aside from portal/ductus venosus).'),
    (v_case_id, 'The placenta also acts as an endocrine organ by secreting:', '["Only oxytocin", "hCG, progesterone, estrogens, and hPL", "Only FSH and LH", "Only ACTH and TSH", "Only testosterone"]', 1, 'A versatile metabolic and endocrine factory.');

    -- CASE 24
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Temperature and Testicular Function', 'A man with undescended testes in childhood later has reduced fertility.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Normal spermatogenesis requires the testes to be maintained at a temperature:', '["Higher than core body temperature", "Slightly lower than core body temperature", "Exactly equal to liver temperature", "Independent of temperature", "Higher only during puberty"]', 1, 'Ideally 2-3 degrees Celsius below core.'),
    (v_case_id, 'Scrotal temperature is regulated partly by the:', '["Dartos and cremaster muscles", "Corpus luteum", "Broad ligament", "Endometrium", "Placenta"]', 0, 'Muscles adjust proximity to the body warmth.'),
    (v_case_id, 'Elevated testicular temperature tends to impair:', '["Leydig cell steroidogenesis only", "Spermatogenesis", "Prolactin secretion", "Oxytocin release", "Cervical mucus formation"]', 1, 'Sperm-producing cells are hypersensitive to heat.');

    -- CASE 25
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Integrated Feedback in Reproduction', 'A student is asked to identify the main feedback patterns in reproductive physiology.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most of the reproductive axis is controlled by:', '["Positive feedback only", "Negative feedback", "Osmotic control only", "Renal filtration only", "Countercurrent flow only"]', 1, 'Maintains stable hormone levels.'),
    (v_case_id, 'A major physiologic example of positive feedback in the reproductive system is:', '["Testosterone suppressing LH", "Inhibin suppressing FSH", "Sustained estrogen causing LH surge", "Progesterone suppressing GnRH", "Prolactin suppressing GnRH"]', 2, 'The mid-cycle event.'),
    (v_case_id, 'In males, inhibin mainly feeds back on:', '["LH", "FSH", "ACTH", "TSH", "Oxytocin"]', 1, 'Specific feedback loop for sperm production rate.'),
    (v_case_id, 'In females, progesterone in the luteal phase generally exerts:', '["Positive feedback on LH", "Negative feedback on GnRH and gonadotropins", "Only a uterine effect with no hypothalamic effect", "Stimulation of ovulation", "Increased prolactin secretion only"]', 1, 'Inhibits new follicle development while preparing for possible pregnancy.');

    RAISE NOTICE 'Reproductive Physiology cases populated successfully.';
END $$;
