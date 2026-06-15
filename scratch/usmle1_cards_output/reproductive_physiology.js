const reproductiveCards = [
  {
    "q": "What is the embryonic origin of the indifferent gonad?",
    "a": "Derived from genital ridge (intermediate mesoderm) + primordial germ cells (from yolk sac endoderm)."
  },
  {
    "q": "What gene on the Y chromosome determines male gonadal differentiation?",
    "a": "<b>SRY gene</b> (Sex-determining Region Y) → testis development."
  },
  {
    "q": "What hormone causes regression of Müllerian ducts in males?",
    "a": "<b>Anti-Müllerian Hormone (AMH)</b> secreted by Sertoli cells."
  },
  {
    "q": "What hormone stimulates development of Wolffian ducts (male internal genitalia)?",
    "a": "<b>Testosterone</b> produced by fetal Leydig cells."
  },
  {
    "q": "What hormone is required for development of male external genitalia?",
    "a": "<b>Dihydrotestosterone (DHT)</b> (converted by 5α-reductase)."
  },
  {
    "q": "What is the default developmental pathway of the reproductive system?",
    "a": "Female (Müllerian ducts develop into uterus, fallopian tubes, upper vagina in absence of SRY/AMH/testosterone)."
  },
  {
    "q": "What is the most common disorder of sexual development in genetic males with ambiguous genitalia?",
    "a": "5α-reductase deficiency (normal internal male genitalia, ambiguous or female external genitalia at birth)."
  },
  {
    "q": "What is the karyotype and classic phenotype of Turner syndrome?",
    "a": "45,X. Short stature, streak gonads, primary amenorrhea, webbed neck, coarctation of aorta."
  },
  {
    "q": "What is the karyotype of Klinefelter syndrome? Key features?",
    "a": "47,XXY. Tall stature, gynecomastia, small firm testes, infertility, hypogonadism."
  },
  {
    "q": "What cells in the testis produce testosterone?",
    "a": "<b>Leydig cells</b> (stimulated by LH)."
  },
  {
    "q": "What cells support spermatogenesis and produce inhibin?",
    "a": "<b>Sertoli cells</b> (stimulated by FSH)."
  },
  {
    "q": "What is the role of androgen-binding protein (ABP)?",
    "a": "Produced by Sertoli cells; concentrates testosterone within seminiferous tubules to maintain high local levels for spermatogenesis."
  },
  {
    "q": "What is the hypothalamic hormone that regulates the male reproductive axis?",
    "a": "GnRH (pulsatile) → stimulates FSH and LH release from anterior pituitary."
  },
  {
    "q": "What provides negative feedback on FSH secretion in males?",
    "a": "Inhibin B from Sertoli cells."
  },
  {
    "q": "What provides negative feedback on LH secretion in males?",
    "a": "Testosterone (and DHT)."
  },
  {
    "q": "Outline the stages of spermatogenesis.",
    "a": "Spermatogonium (2n) → Primary spermatocyte (meiosis I) → Secondary spermatocyte (meiosis II) → Spermatid → Spermatozoa (spermiogenesis)."
  },
  {
    "q": "Where does spermiogenesis occur?",
    "a": "In the seminiferous tubules with support from Sertoli cells."
  },
  {
    "q": "What is the function of the blood-testis barrier?",
    "a": "Formed by tight junctions between Sertoli cells; protects developing sperm from immune attack."
  },
  {
    "q": "What is the most common cause of male infertility?",
    "a": "Varicocele (dilated pampiniform plexus, usually left side)."
  },
  {
    "q": "What hormone is essential for initiation and maintenance of spermatogenesis?",
    "a": "FSH + high intratesticular testosterone."
  },
  {
    "q": "What is the effect of chronic GnRH agonist administration?",
    "a": "Downregulation of GnRH receptors → decreased FSH/LH → chemical castration (used in prostate cancer, endometriosis)."
  },
  {
    "q": "What is the source of fructose in semen?",
    "a": "Seminal vesicles."
  },
  {
    "q": "What provides the alkaline pH of semen?",
    "a": "Seminal vesicles and prostate."
  },
  {
    "q": "What is the composition of the sperm acrosome?",
    "a": "Contains hydrolytic enzymes (acrosin, hyaluronidase) needed for penetration of zona pellucida."
  },
  {
    "q": "What maintains the corpus luteum in early pregnancy?",
    "a": "hCG (produced by syncytiotrophoblast)."
  },
  {
    "q": "What is the two-cell, two-gonadotropin theory?",
    "a": "LH stimulates theca cells to produce androgens → FSH stimulates granulosa cells to aromatize androgens into estrogens."
  },
  {
    "q": "What hormone triggers the LH surge and ovulation?",
    "a": "High sustained levels of estradiol (positive feedback on pituitary)."
  },
  {
    "q": "What maintains the endometrium during the secretory (luteal) phase?",
    "a": "Progesterone from the corpus luteum."
  },
  {
    "q": "What causes the ischemic phase leading to menses?",
    "a": "Regression of corpus luteum → sharp drop in progesterone and estrogen."
  },
  {
    "q": "What is the average length of the menstrual cycle? What is the most variable phase?",
    "a": "28 days. Follicular (proliferative) phase is most variable."
  },
  {
    "q": "What is mittelschmerz?",
    "a": "Mid-cycle pelvic pain due to ovulation (peritoneal irritation by follicular fluid)."
  },
  {
    "q": "What is the dominant hormone in the follicular phase vs luteal phase?",
    "a": "Follicular: Estrogen.<br>Luteal: Progesterone."
  },
  {
    "q": "What is the effect of progesterone on basal body temperature?",
    "a": "Increases it by ~0.5°C (used in natural family planning)."
  },
  {
    "q": "What is the role of relaxin in pregnancy?",
    "a": "Softens cervix and pelvic ligaments; inhibits uterine contractions."
  },
  {
    "q": "What is human placental lactogen (hPL) function?",
    "a": "Causes maternal insulin resistance, promotes lipolysis, ensures glucose availability to fetus."
  },
  {
    "q": "When does the placenta take over progesterone production?",
    "a": "Around 8–10 weeks of gestation (luteoplacental shift)."
  },
  {
    "q": "What is the most common cause of primary amenorrhea with normal secondary sexual characteristics?",
    "a": "Müllerian agenesis (MRKH syndrome) — absent uterus/vagina."
  },
  {
    "q": "What is the most common cause of secondary amenorrhea?",
    "a": "Pregnancy (must always be ruled out first)."
  },
  {
    "q": "What is Asherman syndrome?",
    "a": "Intrauterine adhesions (usually post-D&C) causing amenorrhea and infertility."
  },
  {
    "q": "What is the pathophysiology of PCOS?",
    "a": "↑ LH/FSH ratio → theca cell androgen excess → anovulation, multiple cysts, insulin resistance."
  },
  {
    "q": "What are the Rotterdam criteria for PCOS diagnosis?",
    "a": "Need 2 of 3: oligo/anovulation, clinical/biochemical hyperandrogenism, polycystic ovaries on ultrasound."
  },
  {
    "q": "What is the first-line pharmacologic treatment for PCOS infertility?",
    "a": "Clomiphene citrate (selective estrogen receptor modulator → ↑ FSH)."
  },
  {
    "q": "What is the mechanism of action of clomiphene?",
    "a": "Blocks estrogen receptors in hypothalamus/pituitary → removes negative feedback → ↑ GnRH → ↑ FSH/LH."
  },
  {
    "q": "What is the most common cause of female infertility?",
    "a": "Anovulation (often due to PCOS)."
  },
  {
    "q": "What hormone is measured to assess ovarian reserve?",
    "a": "Anti-Müllerian Hormone (AMH) — produced by granulosa cells of preantral follicles."
  },
  {
    "q": "What is the effect of estrogen on the uterus (proliferative phase)?",
    "a": "Endometrial proliferation and ↑ myometrial excitability."
  },
  {
    "q": "What is the effect of progesterone on the uterus (secretory phase)?",
    "a": "Secretory changes, decidualization, decreased myometrial excitability."
  },
  {
    "q": "What is the proliferative phase of the endometrium driven by?",
    "a": "Estrogen — causes glandular and stromal proliferation."
  },
  {
    "q": "What is the secretory phase of the endometrium driven by?",
    "a": "Progesterone — induces glandular secretion, decidualization, and increased vascularity."
  },
  {
    "q": "What causes the LH surge?",
    "a": "High sustained estradiol levels exerting positive feedback on the anterior pituitary."
  },
  {
    "q": "When does ovulation typically occur in a 28-day cycle?",
    "a": "Day 14 (approximately 24–36 hours after LH surge)."
  },
  {
    "q": "What is the corpus luteum?",
    "a": "Remnant of the ruptured Graafian follicle after ovulation; secretes progesterone and estrogen."
  },
  {
    "q": "What maintains the corpus luteum if fertilization occurs?",
    "a": "hCG from the implanted blastocyst."
  },
  {
    "q": "What is the lifespan of the corpus luteum if no pregnancy occurs?",
    "a": "Approximately 10–14 days."
  },
  {
    "q": "What hormone is responsible for the mid-cycle increase in basal body temperature?",
    "a": "Progesterone."
  },
  {
    "q": "What is the role of prostaglandins in menstruation?",
    "a": "Cause uterine contractions and vasoconstriction leading to endometrial shedding."
  },
  {
    "q": "What is dysmenorrhea?",
    "a": "Painful menstruation, primarily due to excess prostaglandin F₂α."
  },
  {
    "q": "What is the mechanism of action of combined oral contraceptives (COCs)?",
    "a": "Suppress GnRH pulsatility → inhibit FSH/LH surge → prevent ovulation + thicken cervical mucus + thin endometrium."
  },
  {
    "q": "What is the mechanism of progestin-only pills (mini-pill)?",
    "a": "Primarily thicken cervical mucus and alter endometrium; ovulation may still occur in some cycles."
  },
  {
    "q": "What is the mechanism of emergency contraception (levonorgestrel)?",
    "a": "Delays or inhibits ovulation if taken before LH surge."
  },
  {
    "q": "What is the most effective form of long-acting reversible contraception (LARC)?",
    "a": "Levonorgestrel IUD or copper IUD (both &gt;99% effective)."
  },
  {
    "q": "What is endometriosis?",
    "a": "Presence of endometrial tissue outside the uterus (most commonly ovaries, peritoneum). Causes dysmenorrhea, dyspareunia, infertility."
  },
  {
    "q": "What is the gold standard for diagnosis of endometriosis?",
    "a": "Laparoscopy with biopsy."
  },
  {
    "q": "What is adenomyosis?",
    "a": "Endometrial glands and stroma within the myometrium → enlarged, tender uterus, heavy painful periods."
  },
  {
    "q": "What is the most common site of ectopic pregnancy?",
    "a": "Ampulla of the fallopian tube."
  },
  {
    "q": "What is the classic triad of ectopic pregnancy?",
    "a": "Amenorrhea + abdominal pain + vaginal bleeding."
  },
  {
    "q": "What hormone is used to monitor viability in early pregnancy?",
    "a": "β-hCG (should double every 48 hours in normal early pregnancy)."
  },
  {
    "q": "What is the role of progesterone in early pregnancy?",
    "a": "Maintains endometrium, inhibits uterine contractions, promotes decidualization."
  },
  {
    "q": "What causes morning sickness?",
    "a": "Elevated hCG and estrogen levels."
  },
  {
    "q": "What cardiovascular change occurs in pregnancy due to increased blood volume?",
    "a": "Increased cardiac output (↑ stroke volume + ↑ heart rate)."
  },
  {
    "q": "What is the effect of pregnancy on respiratory physiology?",
    "a": "Increased tidal volume and minute ventilation (progesterone-driven hyperventilation) → mild respiratory alkalosis."
  },
  {
    "q": "What is supine hypotensive syndrome?",
    "a": "Compression of inferior vena cava by gravid uterus when lying supine → decreased venous return and hypotension."
  },
  {
    "q": "What is the role of oxytocin during labor?",
    "a": "Causes uterine contractions (positive feedback during labor)."
  },
  {
    "q": "What is Ferguson’s reflex?",
    "a": "Pressure on cervix → increased oxytocin release → stronger contractions."
  },
  {
    "q": "What hormone softens the cervix and pubic symphysis before labor?",
    "a": "Relaxin."
  },
  {
    "q": "What is the most common cause of postpartum hemorrhage?",
    "a": "Uterine atony."
  },
  {
    "q": "What maintains milk production after delivery?",
    "a": "Prolactin (stimulated by suckling)."
  },
  {
    "q": "What triggers the milk ejection reflex?",
    "a": "Oxytocin released in response to suckling (neural reflex)."
  },
  {
    "q": "What is lactational amenorrhea?",
    "a": "Suckling-induced inhibition of GnRH pulsatility → suppressed ovulation (natural contraception for ~6 months if exclusive breastfeeding)."
  },
  {
    "q": "What is menopause?",
    "a": "Permanent cessation of menstruation due to ovarian follicle depletion (average age 51)."
  },
  {
    "q": "What hormonal change defines menopause?",
    "a": "Marked decrease in estrogen and inhibin → elevated FSH and LH."
  },
  {
    "q": "What are common symptoms of menopause?",
    "a": "Hot flashes, night sweats, vaginal dryness, osteoporosis risk, mood changes."
  },
  {
    "q": "What is the most serious long-term consequence of estrogen deficiency?",
    "a": "Osteoporosis (accelerated bone loss)."
  },
  {
    "q": "What is the definition of premature ovarian failure?",
    "a": "Menopause before age 40."
  },
  {
    "q": "What is the most common chromosomal cause of premature ovarian failure?",
    "a": "Turner syndrome (45,X)."
  },
  {
    "q": "What is the role of estrogen in bone health?",
    "a": "Inhibits osteoclast activity and promotes osteoblast function."
  },
  {
    "q": "What is the effect of estrogen on HDL and LDL?",
    "a": "Increases HDL, decreases LDL (protective against atherosclerosis before menopause)."
  },
  {
    "q": "What is the mechanism of action of tamoxifen?",
    "a": "SERM (Selective Estrogen Receptor Modulator) — antagonist in breast tissue, agonist in bone and endometrium."
  },
  {
    "q": "What is the mechanism of action of raloxifene?",
    "a": "SERM — agonist in bone (prevents osteoporosis), antagonist in breast and endometrium."
  },
  {
    "q": "What is the most common cause of male hypogonadism?",
    "a": "Klinefelter syndrome (47,XXY)."
  },
  {
    "q": "What is the presentation of androgen insensitivity syndrome (AIS)?",
    "a": "46,XY karyotype, female external phenotype, absent uterus, undescended testes, no pubic/axillary hair."
  },
  {
    "q": "What is the most common cause of ambiguous genitalia in genetic females?",
    "a": "Congenital adrenal hyperplasia (21-hydroxylase deficiency)."
  },
  {
    "q": "What is the most common cause of ambiguous genitalia in genetic males?",
    "a": "5α-reductase deficiency or partial androgen insensitivity."
  },
  {
    "q": "What is the most common chromosomal abnormality causing primary amenorrhea?",
    "a": "Turner syndrome (45,X) — streak gonads and ovarian failure."
  },
  {
    "q": "What is the karyotype and phenotype of complete androgen insensitivity syndrome (CAIS)?",
    "a": "46,XY. Female external genitalia, blind-ending vagina, no uterus, undescended testes, scant pubic/axillary hair."
  },
  {
    "q": "What is the underlying defect in 5α-reductase deficiency?",
    "a": "Inability to convert testosterone to DHT → ambiguous or female external genitalia at birth, but virilization at puberty."
  },
  {
    "q": "What is true hermaphroditism (ovotesticular DSD)?",
    "a": "Presence of both ovarian and testicular tissue. Rare."
  },
  {
    "q": "What hormone is responsible for thelarche (breast development)?",
    "a": "Estrogen."
  },
  {
    "q": "What hormone is responsible for pubarche (pubic/axillary hair)?",
    "a": "Androgens (mainly adrenal DHEA in females)."
  },
  {
    "q": "What is the first visible sign of puberty in girls?",
    "a": "Thelarche (breast budding)."
  },
  {
    "q": "What is the first visible sign of puberty in boys?",
    "a": "Testicular enlargement."
  },
  {
    "q": "What is the average age of menarche in the US?",
    "a": "Approximately 12.5 years."
  },
  {
    "q": "What is precocious puberty?",
    "a": "Onset of secondary sexual characteristics before age 8 in girls or 9 in boys."
  },
  {
    "q": "What is the most common cause of central precocious puberty?",
    "a": "Idiopathic (constitutional)."
  },
  {
    "q": "What is the treatment for central precocious puberty?",
    "a": "GnRH agonists (e.g., leuprolide) to suppress gonadotropin release."
  },
  {
    "q": "What is the most common cause of peripheral (gonadotropin-independent) precocious puberty in boys?",
    "a": "Congenital adrenal hyperplasia or Leydig cell tumor."
  },
  {
    "q": "What is delayed puberty?",
    "a": "No secondary sexual characteristics by age 13 in girls or 14 in boys."
  },
  {
    "q": "What is the most common cause of delayed puberty in both sexes?",
    "a": "Constitutional delay (normal variant)."
  },
  {
    "q": "What lab finding distinguishes primary from secondary hypogonadism?",
    "a": "<ul><li><b>Primary:</b> ↑ FSH/LH, ↓ sex steroids.</li><li><b>Secondary:</b> ↓ or normal FSH/LH, ↓ sex steroids.</li></ul>"
  },
  {
    "q": "What is the most common genetic cause of primary hypogonadism in males?",
    "a": "Klinefelter syndrome (47,XXY)."
  },
  {
    "q": "What is the treatment for hypogonadotropic hypogonadism (e.g., Kallmann syndrome)?",
    "a": "Pulsatile GnRH or exogenous FSH + LH (or hCG + FSH)."
  },
  {
    "q": "What is the role of aromatase in females?",
    "a": "Converts androgens to estrogens in granulosa cells."
  },
  {
    "q": "What is the effect of aromatase deficiency?",
    "a": "Excess androgens → maternal virilization during pregnancy and virilization of female fetus."
  },
  {
    "q": "What is the most common cause of anovulatory infertility?",
    "a": "Polycystic ovary syndrome (PCOS)."
  },
  {
    "q": "What lab pattern is classic in PCOS?",
    "a": "↑ LH/FSH ratio (&gt;2:1), ↑ androgens, normal/low FSH."
  },
  {
    "q": "What is the long-term risk associated with unopposed estrogen in PCOS?",
    "a": "Endometrial hyperplasia and endometrial cancer."
  },
  {
    "q": "What is the mechanism of metformin in PCOS?",
    "a": "Improves insulin sensitivity → reduces hyperinsulinemia → decreases ovarian androgen production."
  },
  {
    "q": "What is the definition of menopause?",
    "a": "12 months of amenorrhea after the final menstrual period."
  },
  {
    "q": "What is the average age of menopause in the US?",
    "a": "51 years."
  },
  {
    "q": "What hormonal change is the hallmark of menopause?",
    "a": "Marked decrease in estrogen and inhibin → elevated FSH (&gt;30 IU/L) and LH."
  },
  {
    "q": "What is the most effective treatment for vasomotor symptoms (hot flashes) of menopause?",
    "a": "Systemic estrogen therapy (HRT)."
  },
  {
    "q": "What is the major risk of long-term unopposed estrogen replacement therapy?",
    "a": "Endometrial hyperplasia and endometrial carcinoma."
  },
  {
    "q": "What is added to estrogen in HRT for women with an intact uterus?",
    "a": "Progestin (to oppose estrogen effect on endometrium)."
  },
  {
    "q": "What is the effect of estrogen on bone?",
    "a": "Inhibits osteoclast activity and promotes osteoblast survival."
  },
  {
    "q": "What is the leading cause of death in postmenopausal women?",
    "a": "Cardiovascular disease."
  },
  {
    "q": "What is the effect of estrogen on coagulation?",
    "a": "Increases clotting factors and decreases antithrombin III → increased risk of venous thromboembolism."
  },
  {
    "q": "What is the most common site of breast cancer?",
    "a": "Upper outer quadrant."
  },
  {
    "q": "What is the most common histologic type of breast cancer?",
    "a": "Invasive ductal carcinoma."
  },
  {
    "q": "What is the role of BRCA1/BRCA2 genes?",
    "a": "Tumor suppressor genes involved in DNA repair (homologous recombination). Mutations greatly increase breast and ovarian cancer risk."
  },
  {
    "q": "What is the most common cause of bloody nipple discharge?",
    "a": "Intraductal papilloma."
  },
  {
    "q": "What is the most common breast mass in women under 25?",
    "a": "Fibroadenoma."
  },
  {
    "q": "What is the most common breast mass in postmenopausal women?",
    "a": "Carcinoma (until proven otherwise)."
  },
  {
    "q": "What is the role of oxytocin in male reproduction?",
    "a": "Facilitates sperm transport during ejaculation."
  },
  {
    "q": "What is the blood-testis barrier composed of?",
    "a": "Tight junctions between adjacent Sertoli cells."
  },
  {
    "q": "What is the function of the epididymis?",
    "a": "Sperm maturation, acquisition of motility, and storage."
  },
  {
    "q": "What is the effect of chronic alcohol use on male reproduction?",
    "a": "Inhibits testosterone synthesis, increases estrogen via enhanced aromatization, testicular atrophy."
  },
  {
    "q": "What is the effect of anabolic steroid abuse on the HPG axis?",
    "a": "Exogenous androgens → negative feedback → suppression of GnRH, FSH, LH → testicular atrophy and infertility."
  },
  {
    "q": "What is the most common cause of infertility in women?",
    "a": "Anovulation (most frequently due to PCOS)."
  },
  {
    "q": "What is the most common treatable cause of male infertility?",
    "a": "Varicocele."
  },
  {
    "q": "What is the definition of primary infertility?",
    "a": "Inability to conceive after 12 months of regular unprotected intercourse in a couple who have never conceived."
  },
  {
    "q": "What is the definition of secondary infertility?",
    "a": "Inability to conceive after 12 months in a couple who have previously conceived."
  },
  {
    "q": "What is the most common cause of tubal factor infertility?",
    "a": "Pelvic inflammatory disease (especially Chlamydia trachomatis)."
  },
  {
    "q": "What test evaluates tubal patency?",
    "a": "Hysterosalpingography (HSG)."
  },
  {
    "q": "What is the first-line treatment for anovulatory infertility in PCOS?",
    "a": "Clomiphene citrate."
  },
  {
    "q": "What is the mechanism of letrozole in ovulation induction?",
    "a": "Aromatase inhibitor → ↓ estrogen → removes negative feedback → ↑ FSH."
  },
  {
    "q": "What are the risks of ovarian hyperstimulation syndrome (OHSS)?",
    "a": "Ovarian enlargement, ascites, pleural effusion, thromboembolism, hypovolemia."
  },
  {
    "q": "What is the role of progesterone in luteal phase support?",
    "a": "Maintains endometrium for implantation."
  },
  {
    "q": "What is the most common site of ectopic pregnancy?",
    "a": "Ampullary region of the fallopian tube."
  },
  {
    "q": "What is the diagnostic test of choice for ectopic pregnancy when patient is stable?",
    "a": "Transvaginal ultrasound + quantitative β-hCG."
  },
  {
    "q": "What is the discriminatory zone for β-hCG?",
    "a": "Approximately 1,500–2,000 mIU/mL (above this level, an intrauterine gestational sac should be visible on transvaginal US)."
  },
  {
    "q": "What is the treatment for unruptured ectopic pregnancy?",
    "a": "Methotrexate (if criteria met) or laparoscopic salpingostomy/salpingectomy."
  },
  {
    "q": "What is the most common cause of first-trimester spontaneous abortion?",
    "a": "Chromosomal abnormalities (especially trisomies)."
  },
  {
    "q": "What is the role of progesterone in threatened abortion?",
    "a": "Controversial; sometimes used in recurrent pregnancy loss with documented luteal phase defect."
  },
  {
    "q": "What is the definition of preeclampsia?",
    "a": "New-onset hypertension (&gt;140/90) after 20 weeks + proteinuria or end-organ dysfunction."
  },
  {
    "q": "What is the definitive treatment for preeclampsia?",
    "a": "Delivery of the fetus and placenta."
  },
  {
    "q": "What is HELLP syndrome?",
    "a": "Hemolysis, Elevated Liver enzymes, Low Platelets — a severe variant of preeclampsia."
  },
  {
    "q": "What is the pathophysiology of gestational diabetes?",
    "a": "Human placental lactogen (hPL) and other hormones cause insulin resistance."
  },
  {
    "q": "What is the screening test for gestational diabetes?",
    "a": "50g oral glucose challenge test (1-hour) at 24–28 weeks."
  },
  {
    "q": "What is the confirmatory test for gestational diabetes?",
    "a": "100g oral glucose tolerance test (3-hour)."
  },
  {
    "q": "What are the major fetal risks of uncontrolled gestational diabetes?",
    "a": "Macrosomia, shoulder dystocia, hypoglycemia, respiratory distress syndrome."
  },
  {
    "q": "What is the effect of pregnancy on thyroid-binding globulin (TBG)?",
    "a": "Increases due to estrogen → higher total T₄/T₃ but normal free levels."
  },
  {
    "q": "What is the treatment of choice for hyperthyroidism in pregnancy (first trimester)?",
    "a": "Propylthiouracil (PTU)."
  },
  {
    "q": "What is the most common cause of postpartum thyroiditis?",
    "a": "Autoimmune (similar to Hashimoto’s)."
  },
  {
    "q": "What is Sheehan syndrome?",
    "a": "Postpartum pituitary necrosis due to severe hemorrhage and hypotension → panhypopituitarism."
  },
  {
    "q": "What is the most common pituitary hormone affected in Sheehan syndrome?",
    "a": "Growth hormone and gonadotropins (often presents with failure to lactate)."
  },
  {
    "q": "What is the most common cause of secondary amenorrhea in a reproductive-age woman?",
    "a": "Pregnancy."
  },
  {
    "q": "What lab test is first performed in the workup of amenorrhea?",
    "a": "Urine or serum β-hCG."
  },
  {
    "q": "What is the workup for primary amenorrhea with normal secondary sexual characteristics?",
    "a": "Pelvic ultrasound (to check for uterus) and karyotype."
  },
  {
    "q": "What is the workup for primary amenorrhea with absent secondary sexual characteristics?",
    "a": "FSH level + karyotype."
  },
  {
    "q": "What is Asherman syndrome?",
    "a": "Intrauterine synechiae (adhesions) usually following D&C or endometritis → amenorrhea and infertility."
  },
  {
    "q": "What is the treatment for Asherman syndrome?",
    "a": "Hysteroscopic adhesiolysis + estrogen therapy to regenerate endometrium."
  },
  {
    "q": "What is the most common ovarian tumor in young women?",
    "a": "Mature cystic teratoma (dermoid cyst)."
  },
  {
    "q": "What is the most common malignant ovarian tumor?",
    "a": "Serous cystadenocarcinoma."
  },
  {
    "q": "What tumor marker is elevated in yolk sac tumor?",
    "a": "AFP (alpha-fetoprotein)."
  },
  {
    "q": "What tumor marker is elevated in choriocarcinoma?",
    "a": "β-hCG."
  },
  {
    "q": "What is the most common testicular tumor in young men?",
    "a": "Seminoma."
  },
  {
    "q": "What tumor marker is elevated in seminoma?",
    "a": "May have mildly elevated β-hCG; normal AFP."
  },
  {
    "q": "What tumor marker is elevated in nonseminomatous germ cell tumors?",
    "a": "AFP and/or β-hCG."
  },
  {
    "q": "What is cryptorchidism?",
    "a": "Undescended testis. Increases risk of infertility and testicular cancer."
  },
  {
    "q": "What is the most common cause of scrotal swelling in adult males?",
    "a": "Hydrocele."
  },
  {
    "q": "What is the most common cause of acute scrotal pain in adolescents?",
    "a": "Testicular torsion."
  }
];

module.exports = { reproductiveCards };
