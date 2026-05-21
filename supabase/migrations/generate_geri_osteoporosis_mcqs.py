import json
import random

random.seed(42)

topic_slug = 'geri-osteoporosis'

# ============================================================
# 40 UNIQUE TEMPLATES - Geriatrics: Osteoporosis & Fracture Prevention
# Covers: DEXA criteria, bisphosphonates, fall cascade, FRAX,
#         secondary causes, hip fractures, vertebral fractures,
#         calcium/VitD, denosumab, teriparatide, SERMs,
#         glucocorticoid-induced OP, screening, fall prevention,
#         atypical fractures, ONJ, drug holidays, male OP, etc.
# ============================================================

templates = [
    # ===== DEXA & DIAGNOSTIC CRITERIA (Templates 1-6) =====
    # T1: WHO T-score Classification — Osteoporosis diagnosis
    {
        "q": "A {age}-year-old postmenopausal {gender} presents for a routine health maintenance visit. She has no history of fractures. A dual-energy X-ray absorptiometry (DEXA) scan is performed, revealing a T-score of {t_score} at the femoral neck. According to the World Health Organization (WHO) diagnostic criteria, how should this result be classified, and what is the most appropriate next step?",
        "options": [
            "Osteoporosis (T-score <= -2.5); initiate pharmacologic therapy with a first-line bisphosphonate plus calcium and vitamin D supplementation",
            "Osteopenia (T-score between -1.0 and -2.5); calculate the FRAX score to determine 10-year fracture probability and guide the treatment decision",
            "Normal bone density (T-score >= -1.0); reassure the patient and repeat DEXA in 15 years",
            "Severe osteoporosis; immediately start teriparatide as the only acceptable first-line agent",
            "Indeterminate result; the Z-score, not the T-score, is the standard diagnostic metric for postmenopausal women"
        ],
        "answer_key": "t_score_class",
        "exp": "The WHO classifies bone mineral density (BMD) by DEXA T-scores: **Normal >= -1.0**, **Osteopenia -1.0 to -2.5**, **Osteoporosis <= -2.5**. The T-score compares a patient's BMD to a healthy 30-year-old reference (peak bone mass). For postmenopausal women, the T-score (not Z-score) is the standard. Z-scores are used for premenopausal women, men <50, and children. For osteopenia, the **FRAX tool** (Fracture Risk Assessment Tool) should be used to calculate 10-year major osteoporotic and hip fracture probability to guide treatment decisions. Pharmacotherapy is indicated if FRAX shows >=20% major osteoporotic fracture risk or >=3% hip fracture risk. (Ref: Hazzard's Ch. 77; USPSTF 2018; NOF Guidelines)"
    },
    # T2: DEXA Screening Indications — USPSTF Guidelines
    {
        "q": "A {age}-year-old {gender} presents for an annual wellness visit. She has no personal history of fractures, no chronic glucocorticoid use, and no secondary causes of osteoporosis. She asks whether she should be screened for osteoporosis. According to the United States Preventive Services Task Force (USPSTF) guidelines, which of the following is the most appropriate recommendation regarding DEXA screening for this patient?",
        "options": [
            "Screen all women aged >= 65 years with DEXA; for women younger than 65, screen only those with clinical risk factors (e.g., low body weight, parental hip fracture history, smoking, excessive alcohol) that result in a comparable fracture risk",
            "Screen all women starting at age 50, regardless of risk factors, because menopause universally causes osteoporosis",
            "DEXA screening is not recommended for any women until they sustain their first fragility fracture",
            "Screen only women with a BMI > 30, as obesity is the strongest risk factor for osteoporosis",
            "Screen all women with annual DEXA scans beginning at age 40 to establish a longitudinal bone density trend"
        ],
        "answer": 0,
        "exp": "The **USPSTF recommends DEXA screening for all women aged >= 65 years**. For **postmenopausal women younger than 65**, screening is recommended only for those whose clinical risk profile (assessed using tools like FRAX) indicates a fracture risk equivalent to that of a 65-year-old white woman with no additional risk factors (approximately a 9.3% 10-year major osteoporotic fracture risk). Key clinical risk factors include low body weight (<127 lbs / 57.7 kg), parental history of hip fracture, current smoking, and excessive alcohol use. The USPSTF found insufficient evidence to recommend screening in men. Annual screening is not recommended due to radiation exposure and cost. (Ref: USPSTF 2018 Recommendation; Hazzard's Ch. 77; First Aid Step 2 CK)"
    },
    # T3: Z-score vs T-score — Premenopausal/Young Patient
    {
        "q": "A {age_young}-year-old premenopausal woman is referred for bone density testing after sustaining a low-trauma wrist fracture. Her DEXA scan reveals a femoral neck T-score of -2.8 and a Z-score of -2.4. Which of the following is the most accurate interpretation and the most appropriate clinical reasoning regarding the choice of reference metric?",
        "options": [
            "In premenopausal women and men under 50, the Z-score (comparison to age- and sex-matched peers) is the preferred metric; a Z-score <= -2.0 is classified as 'below expected range for age' and should prompt investigation for secondary causes of bone loss",
            "The T-score of -2.8 confirms osteoporosis regardless of patient age; initiate bisphosphonate therapy immediately",
            "The Z-score is only used in children under age 10; for all adults, the T-score is the sole diagnostic standard",
            "A Z-score of -2.4 is normal and requires no further workup because the patient's bone density is expected for her age",
            "Both T-scores and Z-scores are obsolete; quantitative CT (QCT) has replaced DEXA as the gold standard for diagnosing osteoporosis"
        ],
        "answer": 0,
        "exp": "For **premenopausal women, men under 50, and children**, the International Society for Clinical Densitometry (ISCD) recommends using the **Z-score**, which compares the patient's BMD to age-, sex-, and ethnicity-matched controls. A **Z-score <= -2.0** is classified as **'below the expected range for age'** and should trigger a thorough workup for **secondary causes of bone loss** (e.g., hyperparathyroidism, hyperthyroidism, celiac disease, multiple myeloma, chronic glucocorticoid use, hypogonadism, vitamin D deficiency). The WHO T-score criteria (osteoporosis <= -2.5) are validated only for postmenopausal women and men >= 50 years. DEXA remains the gold standard for clinical BMD measurement. (Ref: ISCD 2019 Official Positions; Hazzard's Ch. 77)"
    },
    # T4: DEXA Sites and Measurement
    {
        "q": "A {age}-year-old postmenopausal {gender} undergoes a DEXA scan for osteoporosis screening. The report shows T-scores at the lumbar spine (L1-L4), femoral neck, total hip, and distal one-third radius. The T-scores are: lumbar spine {spine_t}, femoral neck {neck_t}, total hip -1.8, and distal radius -2.0. Which of the following is the most accurate statement regarding DEXA site interpretation and the patient's diagnosis?",
        "options": [
            "The diagnosis is based on the LOWEST T-score among the central skeletal sites (lumbar spine, femoral neck, or total hip); the peripheral forearm is used when central sites are invalid (e.g., bilateral hip replacements, severe degenerative changes)",
            "The diagnosis must be based exclusively on the lumbar spine T-score because it is the most metabolically active site and the only validated location",
            "An average of all four sites should be calculated; the mean T-score determines the diagnosis",
            "The distal radius T-score always takes precedence over central sites because cortical bone loss is the earliest detectable change",
            "DEXA results at different sites cannot be compared; each site must be evaluated independently with site-specific treatment thresholds"
        ],
        "answer": 0,
        "exp": "The **diagnosis of osteoporosis is based on the lowest T-score** among the standard central skeletal measurement sites: the **lumbar spine (L1-L4), femoral neck, and total hip**. If central sites are invalid due to artifacts (e.g., severe degenerative disease, compression fractures, bilateral hip arthroplasties, or morbid obesity), the **distal one-third (33%) radius** of the non-dominant arm is used as a valid alternative. The NOF and ISCD recommend using the lowest T-score from any qualifying site for diagnosis and treatment decisions. Sites should not be averaged. The femoral neck T-score is specifically used for FRAX calculations. (Ref: ISCD 2019; NOF Clinician's Guide; Hazzard's Ch. 77)"
    },
    # T5: FRAX Score Interpretation and Treatment Thresholds
    {
        "q": "A {age}-year-old postmenopausal {gender} has a DEXA T-score of {t_osteopenia} at the femoral neck (osteopenia). She has a history of {risk_factor}. Her FRAX 10-year probability of major osteoporotic fracture is calculated at {frax_major}% and hip fracture at {frax_hip}%. According to the National Osteoporosis Foundation (NOF) treatment guidelines, what is the most appropriate management?",
        "options_key": "frax_treatment",
        "answer_key": "frax_answer",
        "exp": "The **NOF/AACE treatment guidelines** recommend initiating pharmacotherapy for osteoporosis in postmenopausal women and men >= 50 with: (1) a **hip or vertebral fragility fracture**, (2) a **T-score <= -2.5** at the femoral neck, total hip, or lumbar spine, OR (3) a T-score between -1.0 and -2.5 (osteopenia) **AND a FRAX 10-year probability of >= 20% for major osteoporotic fracture OR >= 3% for hip fracture**. Below these FRAX thresholds, lifestyle modifications (calcium, vitamin D, weight-bearing exercise, fall prevention) are appropriate. FRAX incorporates age, sex, BMI, prior fracture, parental hip fracture, glucocorticoid use, rheumatoid arthritis, secondary osteoporosis, smoking, and alcohol intake. (Ref: NOF Clinician's Guide 2014; Hazzard's Ch. 77; Master the Boards Step 2 CK)"
    },
    # T6: DEXA Monitoring Interval
    {
        "q": "A {age}-year-old postmenopausal {gender} was started on alendronate {duration} years ago for osteoporosis (initial femoral neck T-score of -2.7). She has been adherent to therapy and takes calcium and vitamin D supplementation. She asks when her next DEXA scan should be performed. Which of the following is the most appropriate recommendation regarding bone density monitoring during osteoporosis treatment?",
        "options": [
            "Repeat DEXA 1-2 years after initiating or changing therapy to assess treatment response; once stable, extend the interval to every 2 years",
            "Repeat DEXA every 6 months to detect rapid bone loss and adjust medication doses accordingly",
            "DEXA monitoring is unnecessary once pharmacotherapy is initiated; treatment efficacy is determined solely by the absence of new fractures",
            "Repeat DEXA only after completing a full 10-year course of bisphosphonate therapy",
            "Repeat DEXA every 5 years regardless of treatment status, as bone density changes too slowly to detect in shorter intervals"
        ],
        "answer": 0,
        "exp": "The **ISCD and NOF recommend repeat DEXA 1-2 years after initiating or changing osteoporosis therapy** to assess treatment response. A significant change in BMD is defined as a change exceeding the **least significant change (LSC)**, which is typically 3-6% at the lumbar spine and 4-6% at the hip. Once a stable BMD response is confirmed, the monitoring interval can be extended to **every 2 years**. More frequent scanning (e.g., every 6 months) is not recommended because bone density changes are too small to be detected reliably within that timeframe given the precision error of DEXA. Monitoring is essential to confirm treatment efficacy and adherence, and to detect treatment failure (continued bone loss despite therapy). (Ref: ISCD 2019; Hazzard's Ch. 77; NOF Clinician's Guide)"
    },

    # ===== BISPHOSPHONATES (Templates 7-14) =====
    # T7: Bisphosphonate Mechanism of Action
    {
        "q": "A {age}-year-old postmenopausal {gender} is diagnosed with osteoporosis (femoral neck T-score -2.9). Alendronate is prescribed as first-line therapy. The patient asks how the medication works. Which of the following best describes the mechanism of action of bisphosphonates and their effect on bone remodeling?",
        "options": [
            "Bisphosphonates are potent inhibitors of osteoclast-mediated bone resorption; they bind to hydroxyapatite in bone and are internalized by osteoclasts during resorption, where they inhibit the mevalonate/farnesyl pyrophosphate synthase pathway, inducing osteoclast apoptosis",
            "Bisphosphonates stimulate osteoblast proliferation and new bone formation without affecting osteoclast activity, making them purely anabolic agents",
            "Bisphosphonates act as selective estrogen receptor modulators (SERMs) that mimic estrogen's protective effect on bone",
            "Bisphosphonates inhibit RANKL binding to RANK, preventing osteoclast differentiation and activation in the same manner as denosumab",
            "Bisphosphonates increase intestinal calcium absorption by upregulating 1-alpha-hydroxylase in the kidney, thereby increasing active vitamin D levels"
        ],
        "answer": 0,
        "exp": "Bisphosphonates (alendronate, risedronate, ibandronate, zoledronic acid) are **anti-resorptive agents** that are the **first-line pharmacotherapy for osteoporosis**. They have a high affinity for **hydroxyapatite** in mineralized bone. During osteoclast-mediated resorption, bisphosphonates are released from the bone surface and internalized by osteoclasts. Nitrogen-containing bisphosphonates (all modern agents) inhibit **farnesyl pyrophosphate synthase (FPPS)** in the **mevalonate pathway**, disrupting osteoclast function and inducing **osteoclast apoptosis**. This reduces bone turnover and net bone resorption, increasing BMD over time. They do NOT stimulate osteoblasts (that is the mechanism of teriparatide). They are NOT SERMs (that is raloxifene). They do NOT inhibit RANKL (that is denosumab). (Ref: Hazzard's Ch. 77; First Aid Step 2 CK; Goodman & Gilman's Pharmacology)"
    },
    # T8: Oral Bisphosphonate Administration Instructions
    {
        "q": "A {age}-year-old postmenopausal {gender} is prescribed oral alendronate 70 mg weekly for newly diagnosed osteoporosis. Which of the following instructions regarding proper administration is most important to ensure adequate drug absorption and minimize the risk of adverse effects?",
        "options": [
            "Take the tablet first thing in the morning on an empty stomach with a full glass (6-8 oz) of plain water; remain upright (sitting or standing) for at least 30 minutes before eating, drinking anything else, or taking other medications, to prevent esophageal irritation and ensure absorption",
            "Take the tablet at bedtime with a glass of milk to enhance calcium-mediated absorption and reduce gastrointestinal upset",
            "Take the tablet with food to minimize the risk of nausea; lying down immediately after ingestion is acceptable",
            "Take the tablet with coffee or orange juice because acidic beverages enhance bisphosphonate bioavailability",
            "Take the tablet at any time of day with any beverage; the timing and food intake do not affect absorption or safety"
        ],
        "answer": 0,
        "exp": "Oral bisphosphonates have extremely **low bioavailability (< 1%)**. To maximize absorption and minimize esophageal adverse effects, patients must: (1) Take the tablet **first thing in the morning on an empty stomach** (fasting), (2) Swallow with a **full glass (6-8 oz) of plain water only** (no coffee, juice, milk, or mineral water, as calcium, magnesium, iron, and other minerals chelate bisphosphonates and prevent absorption), (3) **Remain upright (sitting or standing) for at least 30 minutes** (60 minutes for ibandronate) to prevent esophageal irritation, ulceration, and stricture, and (4) **Wait at least 30 minutes before eating, drinking, or taking other medications**. Non-adherence to these instructions is the most common cause of treatment failure and esophageal complications. (Ref: Hazzard's Ch. 77; First Aid Step 2 CK; AGS Geriatrics At Your Fingertips)"
    },
    # T9: Bisphosphonate-Related Esophageal Adverse Effects
    {
        "q": "A {age}-year-old {gender} on weekly oral alendronate for {duration} months presents with progressive dysphagia, retrosternal burning, and odynophagia. Upper endoscopy reveals discrete esophageal ulcerations in the distal esophagus. Which of the following is the most appropriate management?",
        "options": [
            "Discontinue oral alendronate immediately; switch to an intravenous bisphosphonate (e.g., annual zoledronic acid) or a non-bisphosphonate agent (e.g., denosumab) to avoid further esophageal injury while continuing osteoporosis treatment",
            "Continue oral alendronate but add a proton pump inhibitor (PPI) to heal the esophageal ulcers while maintaining therapy",
            "Switch to oral risedronate, which has no risk of esophageal injury unlike alendronate",
            "Reduce the alendronate dose to 35 mg weekly and instruct the patient to take it with food to coat the esophagus",
            "Discontinue all osteoporosis therapy permanently, as the esophageal injury indicates a contraindication to all anti-resorptive agents"
        ],
        "answer": 0,
        "exp": "Esophageal ulceration, erosion, and stricture are well-recognized adverse effects of **oral bisphosphonates**, particularly when administration instructions are not followed (e.g., lying down after ingestion, taking with insufficient water, or taking at bedtime). When significant esophageal injury occurs, **oral bisphosphonates must be discontinued** and the patient should be switched to an **intravenous bisphosphonate** (e.g., zoledronic acid 5 mg IV annually or ibandronate 3 mg IV quarterly) or a **non-bisphosphonate agent** (e.g., denosumab). Simply adding a PPI does not address the direct caustic injury mechanism. Oral bisphosphonates are **contraindicated** in patients with esophageal disorders that delay emptying (e.g., achalasia, strictures) or inability to remain upright for 30 minutes. (Ref: Hazzard's Ch. 77; FDA Safety Communication; AGS Geriatrics At Your Fingertips)"
    },
    # T10: Osteonecrosis of the Jaw (ONJ)
    {
        "q": "A {age}-year-old {gender} who has been receiving {onj_drug} for osteoporosis for {onj_duration} years presents with exposed, necrotic bone in the {jaw_site} that has persisted for {onj_weeks} weeks despite conservative wound care. She recently underwent {dental_procedure}. Which of the following is the most accurate statement regarding bisphosphonate-related osteonecrosis of the jaw (BRONJ)?",
        "options": [
            "BRONJ is defined as exposed bone in the maxillofacial region persisting for > 8 weeks in a patient on anti-resorptive or anti-angiogenic therapy with no history of radiation; risk is higher with IV bisphosphonates used in oncology doses than with oral osteoporosis doses",
            "BRONJ occurs exclusively with oral bisphosphonates and never with intravenous formulations",
            "BRONJ is an extremely common complication affecting > 25% of all patients on oral bisphosphonates for osteoporosis",
            "BRONJ only occurs in the mandible and never affects the maxilla",
            "A dental extraction performed during bisphosphonate therapy always leads to BRONJ, so all teeth should be extracted prophylactically before starting therapy"
        ],
        "answer": 0,
        "exp": "**Bisphosphonate-related osteonecrosis of the jaw (BRONJ)** is defined by the AAOMS as **exposed bone in the maxillofacial region that has persisted for > 8 weeks** in a patient currently or previously treated with anti-resorptive or anti-angiogenic agents, **with no history of radiation therapy to the jaw**. The risk is significantly **higher with high-dose IV bisphosphonates** used in oncology (e.g., zoledronic acid for bone metastases) than with standard oral doses for osteoporosis. The incidence in osteoporosis patients is very low (~1/10,000 to 1/100,000 patient-years). **Invasive dental procedures** (extractions, implant placement) are the most common precipitating events. Prevention includes completing necessary dental work **before** initiating bisphosphonate therapy and maintaining good oral hygiene. Both the mandible and maxilla can be affected. (Ref: AAOMS 2014 Position Paper; Hazzard's Ch. 77; Current Geriatrics)"
    },
    # T11: Atypical Femoral Fractures
    {
        "q": "A {age}-year-old {gender} on oral alendronate for {aff_duration} years presents with progressive dull, aching pain in {aff_side} thigh for {aff_weeks} weeks. Radiographs reveal a transverse or short oblique fracture of the lateral cortex of the femoral diaphysis with cortical thickening (beaking) at the fracture site and no comminution. Which of the following is the most accurate diagnosis and the most appropriate next step?",
        "options": [
            "Atypical femoral fracture (AFF); this is associated with prolonged bisphosphonate use (typically > 5 years) due to over-suppression of bone turnover; discontinue the bisphosphonate and evaluate the contralateral femur with imaging",
            "Typical osteoporotic hip fracture; continue bisphosphonate therapy and proceed with surgical fixation without medication changes",
            "Pathologic fracture due to metastatic bone disease; order a bone biopsy and staging workup",
            "Stress fracture unrelated to bisphosphonate use; prescribe non-weight-bearing and continue current therapy",
            "Paget disease of bone; start calcitonin and continue the bisphosphonate at higher doses"
        ],
        "answer": 0,
        "exp": "**Atypical femoral fractures (AFFs)** are a recognized complication of **prolonged bisphosphonate therapy (typically > 3-5 years)**. They are characterized by: (1) Location in the **subtrochanteric or femoral shaft** (NOT the femoral neck), (2) **Transverse or short oblique fracture pattern** (unlike the spiral/comminuted pattern of typical fragility fractures), (3) **Lateral cortical thickening/beaking** at the fracture site, (4) **Minimal or no comminution**, and (5) Often preceded by **prodromal thigh or groin pain** for weeks to months. AFFs are attributed to **oversuppression of bone turnover** (adynamic bone), which impairs microdamage repair. Management includes **discontinuing the bisphosphonate**, surgical fixation if complete, and **imaging the contralateral femur** (bilateral in up to 28% of cases). AFFs are a key reason for considering bisphosphonate drug holidays. (Ref: ASBMR AFF Task Force 2014; Hazzard's Ch. 77; NEJM 2011)"
    },
    # T12: Bisphosphonate Drug Holiday
    {
        "q": "A {age}-year-old postmenopausal {gender} has been taking oral alendronate for {holiday_duration} years with good adherence. Her most recent DEXA shows a femoral neck T-score of -2.0 (improved from -2.8 at baseline). She has had no fractures during treatment. She asks about the need for continued therapy. Which of the following is the most appropriate recommendation regarding a bisphosphonate drug holiday?",
        "options": [
            "After 5 years of oral bisphosphonate therapy (or 3 years of IV zoledronic acid) in patients at moderate risk, a drug holiday can be considered; reassess fracture risk periodically and resume therapy if BMD declines significantly or a fracture occurs",
            "Bisphosphonates must be continued indefinitely without interruption because bone density declines rapidly within weeks of discontinuation",
            "Drug holidays are recommended after 2 years of therapy for all patients regardless of fracture risk",
            "Drug holidays are contraindicated because bisphosphonates have no residual skeletal effect after discontinuation",
            "Switch to teriparatide for the drug holiday period to maintain bone density; bisphosphonates and teriparatide should always be used in alternating cycles"
        ],
        "answer": 0,
        "exp": "**Bisphosphonate drug holidays** are considered to reduce the risk of rare long-term complications (atypical femoral fractures, osteonecrosis of the jaw). Current guidelines recommend: (1) After **5 years of oral** bisphosphonate therapy (or **3 years of IV zoledronic acid**), reassess the patient's fracture risk. (2) For patients at **moderate fracture risk** (no prior hip/vertebral fracture, T-score > -2.5), a **drug holiday** can be considered. (3) For patients at **high fracture risk** (prior vertebral/hip fracture, T-score still <= -2.5, or very high FRAX), continuing therapy for up to 10 years (oral) or 6 years (IV) is recommended before considering a holiday. (4) During a holiday, bisphosphonates retain **residual anti-resorptive activity** for months to years due to their long skeletal half-life (embedded in bone matrix). (5) **Reassess with DEXA and bone turnover markers** periodically; resume if BMD declines or fracture occurs. (Ref: ASBMR Task Force 2016; Hazzard's Ch. 77; ACP Clinical Guidelines)"
    },
    # T13: IV Zoledronic Acid — Post-Hip Fracture
    {
        "q": "A {age}-year-old {gender} underwent surgical repair of a low-trauma hip fracture {post_hip_days} days ago. Prior to the fracture, she was not on any osteoporosis treatment and had never had a DEXA scan. Her serum calcium is {calcium} mg/dL and 25-hydroxyvitamin D is {vitd} ng/mL. Which of the following is the most appropriate osteoporosis management strategy?",
        "options_key": "post_hip",
        "answer_key": "post_hip_answer",
        "exp": "After a **low-trauma hip fracture**, pharmacologic osteoporosis treatment should be **initiated during or shortly after the hospitalization** (within 2-12 weeks post-fracture), as this population has extremely high refracture and mortality risk (up to 20-30% 1-year mortality after hip fracture). **Zoledronic acid 5 mg IV** is the preferred agent because it is given as a once-yearly infusion (ensuring adherence in a population with high pill burden and swallowing difficulties). The **HORIZON Recurrent Fracture Trial** demonstrated that zoledronic acid administered within 90 days of hip fracture repair reduced recurrent fractures by 35% and mortality by 28%. **Prerequisite**: Correct **vitamin D deficiency** (25(OH)D should be >= 20 ng/mL) and ensure **adequate calcium** before infusion to prevent hypocalcemia. A DEXA scan can be performed later but should NOT delay treatment initiation after a fragility fracture. (Ref: HORIZON-RFT, NEJM 2007; Hazzard's Ch. 77; NOF Guidelines)"
    },
    # T14: Alendronate vs Risedronate vs Zoledronic Acid Selection
    {
        "q": "A {age}-year-old postmenopausal {gender} is diagnosed with osteoporosis (T-score -3.0 at the lumbar spine). She has a history of gastroesophageal reflux disease (GERD) with Barrett esophagus and cannot tolerate oral medications that require prolonged upright positioning. She is otherwise healthy. Which of the following is the most appropriate first-line bisphosphonate for this patient?",
        "options": [
            "Zoledronic acid 5 mg IV once yearly; IV administration bypasses the esophagus, avoiding the risk of esophageal injury in patients with pre-existing esophageal disorders",
            "Oral alendronate 70 mg weekly with careful upright positioning for 60 minutes instead of the standard 30 minutes",
            "Oral risedronate 35 mg weekly, as it has no risk of esophageal side effects unlike alendronate",
            "Oral ibandronate 150 mg monthly, as monthly dosing eliminates the esophageal risk compared to weekly dosing",
            "Defer all bisphosphonate therapy until the Barrett esophagus resolves spontaneously"
        ],
        "answer": 0,
        "exp": "**Oral bisphosphonates are contraindicated** in patients with **esophageal abnormalities that delay esophageal emptying** (e.g., strictures, achalasia) and in patients with **inability to stand or sit upright for at least 30 minutes**. Barrett esophagus is a relative contraindication due to the pre-existing esophageal mucosal injury. In these patients, **IV zoledronic acid 5 mg once yearly** is the preferred first-line bisphosphonate because it bypasses the gastrointestinal tract entirely. IV ibandronate (3 mg quarterly) is an alternative but has less evidence for hip fracture reduction compared to zoledronic acid. All oral bisphosphonates (alendronate, risedronate, ibandronate) carry the same class-wide risk of esophageal injury. (Ref: Hazzard's Ch. 77; FDA Label; NOF Guidelines)"
    },

    # ===== OTHER PHARMACOTHERAPY (Templates 15-20) =====
    # T15: Denosumab — Mechanism and Rebound Risk
    {
        "q": "A {age}-year-old postmenopausal {gender} with osteoporosis is started on denosumab 60 mg subcutaneously every 6 months after failing to tolerate oral bisphosphonates and having a contraindication to IV bisphosphonates due to {denosumab_reason}. Which of the following best describes the mechanism of denosumab and the most important counseling point?",
        "options": [
            "Denosumab is a fully human monoclonal antibody against RANKL that prevents osteoclast differentiation and activation; discontinuation carries a risk of rapid rebound bone loss and vertebral fractures, so patients must transition to an alternative anti-resorptive before stopping",
            "Denosumab directly inhibits farnesyl pyrophosphate synthase in osteoclasts, identical to the bisphosphonate mechanism",
            "Denosumab stimulates osteoblast activity through the Wnt/sclerostin pathway, making it a purely anabolic agent",
            "Denosumab has a long skeletal half-life like bisphosphonates, so a drug holiday can be safely taken without rebound effects",
            "Denosumab is administered orally once monthly and has no effect on bone turnover markers"
        ],
        "answer": 0,
        "exp": "**Denosumab** is a **fully human monoclonal antibody against RANKL** (Receptor Activator of Nuclear factor Kappa-B Ligand). RANKL is essential for osteoclast differentiation, activation, and survival. By binding and neutralizing RANKL, denosumab **prevents osteoclast formation and function**, reducing bone resorption. It is administered as a **60 mg subcutaneous injection every 6 months**. **Critical counseling**: Unlike bisphosphonates, denosumab has **NO residual skeletal effect** after discontinuation. Stopping denosumab causes **rapid rebound bone turnover**, with BMD declining to or below pre-treatment levels within 12-18 months and a significant increase in **vertebral compression fractures**. Therefore, if denosumab is discontinued, the patient must be **transitioned to a bisphosphonate** (e.g., alendronate or zoledronic acid) to prevent rebound bone loss. (Ref: Hazzard's Ch. 77; NEJM 2017; Bone 2011; FREEDOM Extension Trial)"
    },
    # T16: Teriparatide — Anabolic Therapy
    {
        "q": "A {age}-year-old postmenopausal {gender} with severe osteoporosis (T-score -3.8 at the lumbar spine) and {teri_fractures} vertebral compression fractures despite {teri_years} years of bisphosphonate therapy is being considered for teriparatide (recombinant PTH 1-34). Which of the following best describes the indication, mechanism, and limitations of teriparatide?",
        "options": [
            "Teriparatide is an anabolic agent that stimulates osteoblast-mediated new bone formation when given intermittently (daily subcutaneous injection); it is indicated for severe osteoporosis with fractures or treatment failure; maximum treatment duration is 2 years, followed by consolidation with an anti-resorptive agent",
            "Teriparatide is an anti-resorptive agent that inhibits osteoclasts through the RANKL pathway; it can be used indefinitely without a time limit",
            "Teriparatide is indicated as first-line therapy for mild osteopenia (T-score -1.0 to -1.5) before trying bisphosphonates",
            "Teriparatide works by stimulating calcitonin secretion from the thyroid gland to directly suppress osteoclast activity",
            "Teriparatide is administered as a once-yearly intravenous infusion and has no duration restrictions"
        ],
        "answer": 0,
        "exp": "**Teriparatide** (recombinant human PTH 1-34) is the first FDA-approved **anabolic (bone-forming) agent** for osteoporosis. When given as **intermittent daily subcutaneous injections (20 mcg/day)**, it preferentially stimulates **osteoblast activity and new bone formation** (unlike the continuous PTH elevation in hyperparathyroidism, which causes resorption). Indications include **severe osteoporosis** (very low T-scores), **multiple fractures**, **fracture despite bisphosphonate therapy** (treatment failure), and **glucocorticoid-induced osteoporosis**. The maximum treatment duration is **2 years** (due to a theoretical risk of osteosarcoma observed in rat studies at high doses). After completing teriparatide therapy, patients MUST be transitioned to an **anti-resorptive agent** (bisphosphonate or denosumab) to **consolidate** the bone gains; without this step, newly formed bone is rapidly resorbed. **Contraindications**: Paget disease, unexplained elevated alkaline phosphatase, prior bone radiation, open epiphyses, pre-existing hypercalcemia, and bone metastases. (Ref: Hazzard's Ch. 77; NEJM 2001; NOF Guidelines)"
    },
    # T17: Raloxifene (SERM)
    {
        "q": "A {age}-year-old postmenopausal {gender} with osteoporosis (T-score -2.7 at the lumbar spine) also has a strong family history of invasive breast cancer. She has no personal history of venous thromboembolism. She asks about raloxifene as a treatment option. Which of the following best describes the role of raloxifene in osteoporosis management?",
        "options": [
            "Raloxifene is a selective estrogen receptor modulator (SERM) that acts as an estrogen agonist on bone (reducing vertebral fracture risk) and an estrogen antagonist on breast tissue (reducing invasive breast cancer risk); it does NOT reduce hip fracture risk and increases the risk of venous thromboembolism and hot flashes",
            "Raloxifene reduces both vertebral and hip fracture risk equally and has no effect on breast cancer incidence",
            "Raloxifene is an estrogen agonist on both bone and breast tissue, increasing breast cancer risk",
            "Raloxifene is the first-line agent for osteoporosis in all postmenopausal women, regardless of breast cancer history",
            "Raloxifene acts as an estrogen antagonist on bone, reducing bone density, and is used solely for breast cancer chemoprevention"
        ],
        "answer": 0,
        "exp": "**Raloxifene** is a **selective estrogen receptor modulator (SERM)** with tissue-specific effects: (1) **Estrogen agonist on bone** - reduces bone resorption and decreases the risk of **vertebral fractures by ~30%**. (2) **Estrogen antagonist on breast tissue** - reduces the risk of **invasive ER-positive breast cancer by ~65%**. (3) **Does NOT reduce hip or non-vertebral fracture risk** (unlike bisphosphonates, denosumab, or teriparatide). **Adverse effects** include increased risk of **venous thromboembolism (DVT/PE)**, **hot flashes**, and **leg cramps**. Raloxifene is NOT first-line for osteoporosis (bisphosphonates are superior) but is a reasonable option for postmenopausal women at high breast cancer risk who also have osteoporosis, provided they have no history or risk factors for VTE. It is **contraindicated** in women with active or past VTE. (Ref: MORE Trial, JAMA 1999; Hazzard's Ch. 77; First Aid Step 2 CK)"
    },
    # T18: Romosozumab — Sclerostin Inhibitor
    {
        "q": "A {age}-year-old postmenopausal {gender} with very severe osteoporosis (T-score -{romo_t} at the femoral neck) and a recent vertebral compression fracture is being considered for romosozumab. She has no history of cardiovascular disease, myocardial infarction, or stroke. Which of the following best describes the mechanism and clinical considerations for romosozumab?",
        "options": [
            "Romosozumab is a monoclonal antibody against sclerostin that has a dual mechanism: it stimulates bone formation (anabolic) and reduces bone resorption (anti-resorptive); it carries a boxed warning for increased cardiovascular risk (MI, stroke) and is limited to 12 monthly doses",
            "Romosozumab is a bisphosphonate with enhanced potency that can be used indefinitely without cardiovascular risk",
            "Romosozumab inhibits RANKL identical to denosumab and has no anabolic properties",
            "Romosozumab is a calcitonin analog that only reduces bone resorption without any effect on bone formation",
            "Romosozumab is administered as a once-yearly IV infusion like zoledronic acid and has no treatment duration limits"
        ],
        "answer": 0,
        "exp": "**Romosozumab** is a **humanized monoclonal antibody against sclerostin**, a glycoprotein produced by osteocytes that inhibits the Wnt signaling pathway. By blocking sclerostin, romosozumab has a **unique dual mechanism**: (1) **Stimulates bone formation** (anabolic effect via Wnt pathway activation of osteoblasts) AND (2) **Reduces bone resorption** (anti-resorptive effect). It is administered as **210 mg SC monthly for 12 months** (one course only). The **ARCH trial** showed romosozumab followed by alendronate reduced vertebral fracture risk by 48% vs. alendronate alone. **Key safety concern**: Romosozumab carries a **FDA boxed warning for cardiovascular risk** (increased risk of myocardial infarction, stroke, and cardiovascular death). It is **contraindicated** in patients with a history of MI or stroke within the preceding year. After completing 12 months, patients must be transitioned to a bisphosphonate or denosumab. (Ref: ARCH Trial, NEJM 2017; FDA Label 2019; Hazzard's Ch. 77)"
    },
    # T19: Glucocorticoid-Induced Osteoporosis (GIOP)
    {
        "q": "A {age}-year-old {gender} with rheumatoid arthritis has been started on prednisone {pred_dose} mg daily, which is expected to continue for at least {pred_duration} months. She has no prior fractures and her baseline DEXA T-score is {giop_t}. According to the American College of Rheumatology (ACR) guidelines, which of the following is the most appropriate approach to prevent glucocorticoid-induced osteoporosis (GIOP)?",
        "options_key": "giop_treatment",
        "answer_key": "giop_answer",
        "exp": "**Glucocorticoid-induced osteoporosis (GIOP)** is the most common form of **secondary osteoporosis**. Glucocorticoids cause bone loss through multiple mechanisms: (1) **Inhibiting osteoblast function and promoting osteoblast/osteocyte apoptosis** (primary mechanism), (2) Increasing osteoclast activity, (3) Reducing intestinal calcium absorption and increasing renal calcium excretion, and (4) Suppressing GnRH, causing hypogonadism. Bone loss is **most rapid in the first 3-6 months** of therapy. The **ACR 2017 GIOP guidelines** recommend: For adults >= 40 years on prednisone >= 2.5 mg/day for >= 3 months, **initiate prophylactic therapy** with oral bisphosphonates (first-line), or IV bisphosphonates, or teriparatide (for very high-risk patients). Calcium (1000-1200 mg/day) and vitamin D (600-800 IU/day) should be started for ALL patients. FRAX underestimates fracture risk in glucocorticoid users, so risk adjustment is needed. (Ref: ACR 2017 GIOP Guidelines; Hazzard's Ch. 77; Current Geriatrics)"
    },
    # T20: Calcitonin — Limited Role
    {
        "q": "A {age}-year-old postmenopausal {gender} with a recent acute vertebral compression fracture presents with severe back pain. Intranasal calcitonin is being considered. Which of the following best describes the current role of calcitonin in osteoporosis management?",
        "options": [
            "Calcitonin has a modest anti-resorptive effect and a potential analgesic effect for acute vertebral fracture pain; however, it is NOT first-line for osteoporosis because its fracture reduction efficacy is inferior to bisphosphonates, denosumab, and teriparatide, and it carries a signal for increased malignancy risk with prolonged use",
            "Calcitonin is the most effective anti-resorptive agent available and is first-line for all patients with osteoporosis",
            "Calcitonin is an anabolic agent that stimulates osteoblast activity and new bone formation",
            "Calcitonin has no role in osteoporosis management and has been removed from all clinical guidelines",
            "Calcitonin is the preferred agent for glucocorticoid-induced osteoporosis prevention because it directly counteracts prednisone's mechanism"
        ],
        "answer": 0,
        "exp": "**Calcitonin** (salmon calcitonin, available as intranasal spray or subcutaneous injection) has a **modest anti-resorptive effect** by directly inhibiting osteoclast activity. Its BMD-increasing effect is significantly weaker than bisphosphonates, denosumab, or teriparatide. Calcitonin's primary niche is its **potential analgesic effect** for **acute pain from vertebral compression fractures** (mechanism not fully understood; possibly related to beta-endorphin release). However, it is **NOT first-line** for osteoporosis treatment or prevention due to: (1) Inferior fracture reduction efficacy, (2) An FDA safety signal for a possible **increased risk of malignancy** (prostate cancer, hepatocellular cancer) with prolonged use (>6 months), prompting the EMA to withdraw it from the European market. Current guidelines limit its use to short-term pain management in acute vertebral fractures when other analgesics are insufficient. (Ref: PROOF Trial, AJM 2000; FDA Safety Review 2013; Hazzard's Ch. 77)"
    },

    # ===== CALCIUM, VITAMIN D, & LIFESTYLE (Templates 21-24) =====
    # T21: Calcium and Vitamin D Supplementation
    {
        "q": "A {age}-year-old postmenopausal {gender} is diagnosed with osteoporosis and started on alendronate. She asks about calcium and vitamin D supplementation. Her dietary calcium intake is approximately {calcium_intake} mg/day. Her 25-hydroxyvitamin D level is {vitd_level} ng/mL. Which of the following is the most appropriate supplementation recommendation?",
        "options": [
            "Total daily calcium intake (diet + supplements) should be 1200 mg/day for women > 50; vitamin D intake should be 800-1000 IU/day to maintain 25(OH)D levels >= 30 ng/mL; take calcium in divided doses (no more than 500-600 mg per dose) with food for optimal absorption",
            "Calcium supplementation of 2500 mg/day is recommended for all patients with osteoporosis to maximize bone density",
            "Vitamin D supplementation is unnecessary if the patient takes calcium supplements, because calcium is absorbed independently of vitamin D",
            "Calcium carbonate should always be taken on an empty stomach for best absorption",
            "There is no upper limit for calcium supplementation; higher doses always lead to greater bone density gains"
        ],
        "answer": 0,
        "exp": "The **NOF and Endocrine Society** recommend a **total daily calcium intake of 1200 mg/day** for women over 50 and men over 70 (from diet + supplements combined). Key points: (1) **Calcium should be taken in divided doses** (no more than 500-600 mg per dose) because fractional absorption decreases with higher single doses. (2) **Calcium carbonate** requires gastric acid for absorption and should be taken **with meals**. **Calcium citrate** can be taken with or without food and is preferred for patients on PPIs or with achlorhydria. (3) **Vitamin D** (800-1000 IU/day, or more to correct deficiency) is essential to maintain **25(OH)D levels >= 30 ng/mL** for optimal calcium absorption and musculoskeletal health. (4) Excessive calcium supplementation (>2000-2500 mg/day) increases the risk of **nephrolithiasis** and possibly **cardiovascular events** and should be avoided. (Ref: NOF Clinician's Guide; Hazzard's Ch. 77; Endocrine Society Guidelines)"
    },
    # T22: Weight-Bearing Exercise
    {
        "q": "A {age}-year-old postmenopausal {gender} with osteopenia (T-score -{exercise_t}) asks what exercises she should perform to help prevent osteoporosis and fractures. She has no history of fractures and is in good general health. Which of the following exercise recommendations is most appropriate?",
        "options": [
            "Weight-bearing aerobic exercises (e.g., brisk walking, jogging, stair climbing, dancing) and resistance/strength training are recommended to maintain bone density, improve muscle strength, and reduce fall risk; high-impact activities should be individualized based on fracture risk",
            "Only swimming and aquatic exercises are recommended for osteoporosis prevention because they reduce impact on bones",
            "Bed rest and complete avoidance of physical activity is recommended to prevent fractures in patients with low bone density",
            "Only flexibility exercises such as yoga and stretching are sufficient for osteoporosis prevention",
            "Vigorous high-impact activities (e.g., heavy jumping, plyometrics) are recommended for all elderly patients regardless of bone density or fracture risk"
        ],
        "answer": 0,
        "exp": "**Weight-bearing and resistance exercises** are the most effective non-pharmacologic interventions for maintaining and improving bone density: (1) **Weight-bearing aerobic exercises** (walking, jogging, stair climbing, dancing, hiking) provide axial loading that stimulates osteoblast activity through mechanostat signaling. (2) **Resistance/strength training** (free weights, resistance bands, weight machines) improves both BMD and **muscle strength**, reducing fall risk. (3) **Balance and postural exercises** (tai chi, balance training) specifically reduce **fall risk** by 20-40%. Swimming and cycling, while excellent for cardiovascular fitness, are **non-weight-bearing** and have minimal effect on bone density. Patients with severe osteoporosis should avoid **trunk flexion exercises** (sit-ups, toe-touches) due to increased vertebral compression fracture risk. (Ref: Hazzard's Ch. 77; NOF; ACSM Position Stand; Cochrane Review 2011)"
    },
    # T23: Secondary Causes of Osteoporosis Workup
    {
        "q": "A {age}-year-old postmenopausal {gender} is found to have a T-score of -3.2 on routine screening DEXA. Before initiating pharmacologic therapy, a workup for secondary causes of osteoporosis is performed. Which of the following laboratory panels is most appropriate for evaluating secondary causes?",
        "options": [
            "Complete blood count, comprehensive metabolic panel (calcium, phosphorus, creatinine, alkaline phosphatase, liver function), 25-hydroxyvitamin D, thyroid-stimulating hormone (TSH), intact PTH, 24-hour urine calcium, and serum protein electrophoresis (SPEP) if multiple myeloma is suspected",
            "Only a 25-hydroxyvitamin D level is needed, as vitamin D deficiency is the sole secondary cause of osteoporosis",
            "No laboratory workup is needed before starting bisphosphonates in a postmenopausal woman with a low T-score",
            "Only a TSH level is required because hyperthyroidism is the only endocrine cause of bone loss",
            "A bone biopsy is required for all patients before initiating any osteoporosis therapy"
        ],
        "answer": 0,
        "exp": "Before initiating osteoporosis treatment, a **workup for secondary causes** is essential because treatable conditions account for up to **30% of postmenopausal** and **50-80% of male** osteoporosis. The recommended laboratory panel includes: (1) **CBC** (anemia - myeloma, celiac), (2) **CMP** - serum calcium, phosphorus, creatinine (renal osteodystrophy), alkaline phosphatase (Paget's, osteomalacia), liver function (hepatic osteodystrophy), (3) **25-hydroxyvitamin D** (deficiency/insufficiency), (4) **TSH** (hyperthyroidism accelerates bone turnover), (5) **Intact PTH** (primary hyperparathyroidism), (6) **24-hour urine calcium** (hypercalciuria, malabsorption), and (7) **SPEP/UPEP** if multiple myeloma is suspected. Additional tests based on clinical suspicion: celiac serologies, cortisol (Cushing's), testosterone (men), prolactin, tryptase (mastocytosis). (Ref: Hazzard's Ch. 77; Endocrine Society; AACE/ACE Guidelines)"
    },
    # T24: Vitamin D Deficiency and Osteomalacia vs Osteoporosis
    {
        "q": "A {age}-year-old {gender} presents with diffuse bone pain, proximal muscle weakness, and a waddling gait. DEXA shows a T-score of -3.0. Laboratory results reveal a 25-hydroxyvitamin D level of {vitd_low} ng/mL, serum calcium {ca_low} mg/dL, phosphorus {phos_low} mg/dL, and elevated alkaline phosphatase. PTH is markedly elevated. Which of the following is the most important distinction and initial management step?",
        "options": [
            "This presentation is consistent with osteomalacia (impaired bone mineralization due to severe vitamin D deficiency) rather than primary osteoporosis; correct the vitamin D deficiency with high-dose ergocalciferol or cholecalciferol before initiating bisphosphonate therapy, as bisphosphonates are contraindicated in hypocalcemia and osteomalacia",
            "Start alendronate immediately along with low-dose vitamin D (400 IU/day) because the T-score confirms osteoporosis",
            "The elevated PTH confirms primary hyperparathyroidism; refer for parathyroidectomy before any other intervention",
            "Initiate teriparatide because the PTH is already elevated, indicating the patient will respond well to PTH analog therapy",
            "No treatment is needed; this is normal age-related bone loss and all laboratory values are expected in older adults"
        ],
        "answer": 0,
        "exp": "**Osteomalacia** (defective mineralization of newly formed osteoid) must be distinguished from **osteoporosis** (reduced bone mass with normal mineralization). Key features of osteomalacia: (1) **Severe vitamin D deficiency** (25(OH)D < 10 ng/mL), (2) **Hypocalcemia and hypophosphatemia**, (3) **Elevated alkaline phosphatase** (reflecting osteoblast activity attempting to mineralize deficient osteoid), (4) **Secondary hyperparathyroidism** (elevated PTH driven by hypocalcemia), (5) **Diffuse bone pain, proximal myopathy, and waddling gait**. The low DEXA T-score in osteomalacia reflects undermineralized bone, not necessarily reduced bone volume. **Bisphosphonates are contraindicated** until vitamin D deficiency and hypocalcemia are corrected, as they can worsen hypocalcemia and impair the healing of undermineralized bone. Treatment: high-dose vitamin D repletion (50,000 IU weekly for 8-12 weeks, then maintenance). (Ref: Hazzard's Ch. 77; Current Geriatrics; Harrison's Endocrinology)"
    },

    # ===== FRACTURE TYPES & MANAGEMENT (Templates 25-30) =====
    # T25: Hip Fracture — Mortality and Morbidity
    {
        "q": "A {age}-year-old {gender} sustains a low-trauma fall and is diagnosed with a femoral neck fracture. {pronoun_cap} had been living independently prior to the fall. The patient's family asks about the expected outcomes after hip fracture in older adults. Which of the following statements most accurately describes the prognosis following a hip fracture in the elderly?",
        "options": [
            "Hip fractures carry a 1-year mortality rate of approximately 20-30%; only about 40-60% of survivors regain their pre-fracture level of independence, and there is a markedly increased risk of subsequent fractures, institutionalization, and loss of functional independence",
            "Hip fractures in the elderly have a very low mortality rate (< 2%) and most patients return to full independence within 2 weeks",
            "Hip fractures only affect mobility and have no impact on overall mortality or long-term functional status",
            "The 1-year mortality rate after hip fracture is < 5% because modern surgical techniques have eliminated all post-operative complications",
            "Hip fractures in the elderly do not require surgical intervention and should be managed conservatively with bed rest alone"
        ],
        "answer": 0,
        "exp": "Hip fractures in older adults represent a **catastrophic event** with devastating consequences: (1) **1-year mortality: ~20-30%** (higher in men than women, higher with increasing age and comorbidity), (2) **Only 40-60% of survivors regain their pre-fracture level of independence**, (3) **25-50% require long-term institutional care** (skilled nursing facility or assisted living), (4) **Increased risk of subsequent fractures** (the risk of a second hip fracture is 2-10x higher than the general population), and (5) Significant morbidity from immobility-related complications (DVT/PE, pneumonia, pressure ulcers, urinary tract infections, delirium, depression). Surgical intervention (hemiarthroplasty, total hip arthroplasty, or internal fixation depending on fracture type and patient factors) is the standard of care. Conservative/non-operative management is reserved for patients who are non-ambulatory or have prohibitive surgical risk. (Ref: Hazzard's Ch. 77; Lancet 2010; NEJM 2011; Current Geriatrics)"
    },
    # T26: Femoral Neck vs Intertrochanteric Fracture Management
    {
        "q": "A {age}-year-old {gender} presents after a fall with {hip_fx_type}. Radiographs confirm the diagnosis. Which of the following is the most appropriate surgical management for this fracture type?",
        "options_key": "hip_fx_management",
        "answer_key": "hip_fx_answer",
        "exp_key": "hip_fx_exp"
    },
    # T27: Vertebral Compression Fracture — Clinical Presentation
    {
        "q": "A {age}-year-old postmenopausal {gender} presents with acute onset of severe mid-thoracic back pain after {vcf_trigger}. Physical examination reveals point tenderness over the T{vcf_level} spinous process, kyphotic deformity, and loss of height. She has no neurologic deficits. Radiographs show a {vcf_percent}% anterior wedge compression fracture of T{vcf_level}. Which of the following is the most appropriate initial management?",
        "options": [
            "Conservative management with analgesics (acetaminophen, short-course opioids if needed), early mobilization, bracing if tolerated, calcitonin for fracture-related pain, and initiation of osteoporosis pharmacotherapy; most vertebral compression fractures heal with conservative care",
            "Emergent surgical spinal fusion and decompression for all vertebral compression fractures",
            "Strict bed rest for 6-8 weeks to allow the fracture to heal, as early mobilization will worsen the compression",
            "Immediate kyphoplasty or vertebroplasty is mandatory for all vertebral compression fractures regardless of symptom severity",
            "No treatment is needed because vertebral compression fractures are incidental findings that do not cause pain or functional impairment"
        ],
        "answer": 0,
        "exp": "**Vertebral compression fractures (VCFs)** are the most common osteoporotic fractures. Up to **two-thirds are clinically silent** (asymptomatic) and discovered incidentally on imaging. When symptomatic, they present with **acute back pain, loss of height, and progressive kyphosis**. Initial management is **conservative**: (1) **Analgesics** - acetaminophen is first-line; short-course opioids for severe pain; NSAIDs should be used cautiously in the elderly. (2) **Intranasal calcitonin** may provide additional analgesic benefit for acute VCF pain. (3) **Early mobilization** and physical therapy - prolonged bed rest worsens deconditioning and bone loss. (4) **Bracing** may provide comfort. (5) **Initiate osteoporosis pharmacotherapy** if not already on treatment. **Vertebroplasty/kyphoplasty** (percutaneous cement augmentation) is considered for patients with **persistent severe pain unresponsive to 4-6 weeks of conservative therapy**, though evidence of efficacy is debated. (Ref: Hazzard's Ch. 77; AAOS Guidelines; NEJM 2009 INVEST Trial)"
    },
    # T28: Distal Radius (Colles) Fracture as Sentinel Event
    {
        "q": "A {age}-year-old postmenopausal {gender} presents to the emergency department after falling on an outstretched hand. Radiographs show a distal radius fracture with dorsal angulation and displacement (Colles fracture). She has never had a DEXA scan or been evaluated for osteoporosis. Which of the following is the most important principle regarding fracture liaison and secondary fracture prevention?",
        "options": [
            "A distal radius fracture in a postmenopausal woman after low-trauma fall is a sentinel fragility fracture; she should be evaluated for osteoporosis with DEXA scan, secondary causes workup, and initiated on pharmacotherapy if indicated, as prior fragility fracture doubles the risk of future fractures",
            "Distal radius fractures are traumatic injuries unrelated to bone density and do not warrant osteoporosis evaluation",
            "DEXA scanning should be deferred for at least 2 years after any fracture because the healing process artificially elevates bone density readings",
            "Only hip and vertebral fractures qualify as fragility fractures; wrist fractures are not associated with osteoporosis",
            "The patient should be referred for osteoporosis evaluation only if she sustains a second fracture"
        ],
        "answer": 0,
        "exp": "A **distal radius (Colles) fracture** resulting from a **low-trauma fall** (e.g., fall from standing height) in a postmenopausal woman is a **sentinel fragility fracture** — it should trigger a comprehensive osteoporosis evaluation. Key points: (1) Fragility fractures are defined as fractures from **minimal trauma** (e.g., fall from standing height or less) that would not cause a fracture in healthy bone. (2) Common fragility fracture sites include the **distal radius, vertebral body, proximal humerus, and hip**. (3) A **prior fragility fracture is the strongest independent risk factor** for future fractures, approximately **doubling the risk** of subsequent fractures. (4) **Fracture Liaison Services (FLS)** are systematic programs designed to identify and treat patients presenting with fragility fractures to close the **'secondary prevention gap'** (studies show < 20% of fragility fracture patients receive osteoporosis assessment). (Ref: Hazzard's Ch. 77; IOF Capture the Fracture; NOF Guidelines)"
    },
    # T29: Fragility Fracture Definition and DEXA-Independent Treatment
    {
        "q": "A {age}-year-old {gender} presents with an acute hip fracture after tripping over a rug at home and falling from standing height. {pronoun_cap} has never had a DEXA scan. After surgical repair, the orthopedic team asks whether a DEXA scan is needed before starting osteoporosis pharmacotherapy. Which of the following is the most appropriate response?",
        "options": [
            "A DEXA scan is NOT required before initiating pharmacotherapy after a low-trauma hip or vertebral fracture; these fractures independently confirm the diagnosis of osteoporosis and the need for treatment regardless of DEXA results",
            "A DEXA scan must be performed before any pharmacotherapy, as treatment cannot be justified without a documented T-score <= -2.5",
            "Treatment should be deferred until a DEXA scan can be performed at least 6 months after the fracture",
            "Only patients with T-scores <= -3.5 qualify for treatment after a hip fracture",
            "Pharmacotherapy is not indicated after hip fracture because the fracture was caused by a fall, not by osteoporosis"
        ],
        "answer": 0,
        "exp": "A **low-trauma hip or vertebral fracture** in an adult aged >= 50 is **clinically diagnostic of osteoporosis** and independently qualifies for pharmacologic treatment **regardless of DEXA results**. The NOF, AACE, and Endocrine Society guidelines all state that pharmacotherapy should be initiated after a **fragility fracture of the hip or spine without requiring DEXA confirmation**. In clinical practice, however, a DEXA scan is still recommended (when feasible) for baseline documentation, to guide monitoring, and to calculate FRAX scores. The critical point is that **treatment should NOT be delayed** waiting for DEXA scheduling. The post-fracture period (particularly the first year) represents the highest risk window for **recurrent fractures (the 'imminent fracture risk')**, making timely treatment initiation essential. (Ref: NOF Clinician's Guide; AACE/ACE 2020; Hazzard's Ch. 77)"
    },
    # T30: Kyphoplasty/Vertebroplasty — Indications
    {
        "q": "A {age}-year-old postmenopausal {gender} with a T{vcf_level2} vertebral compression fracture continues to have severe, debilitating pain despite {kyph_weeks} weeks of optimal conservative management including analgesics, bracing, and calcitonin. She is functionally incapacitated and confined to bed. Which of the following is the most appropriate next step?",
        "options": [
            "Refer for balloon kyphoplasty or vertebroplasty; these percutaneous cement augmentation procedures are considered for patients with persistent, debilitating vertebral fracture pain refractory to >= 4-6 weeks of conservative therapy, with the goal of pain relief and functional restoration",
            "Continue conservative management indefinitely because cement augmentation procedures have never been shown to provide any benefit",
            "Perform emergent open spinal fusion surgery with multilevel instrumentation",
            "Prescribe lifelong bed rest because weight-bearing will cause the fracture to propagate",
            "Discontinue all pain management and initiate antidepressant therapy because the pain is psychogenic"
        ],
        "answer": 0,
        "exp": "**Vertebroplasty** (percutaneous injection of polymethylmethacrylate [PMMA] bone cement into the fractured vertebral body) and **balloon kyphoplasty** (inflation of a balloon to restore vertebral height before cement injection) are interventional procedures for **painful osteoporotic VCFs refractory to conservative management**. Indications: (1) **Persistent severe pain** unresponsive to **>= 4-6 weeks** of analgesics, bracing, and physical therapy, (2) Significant **functional impairment** due to pain, (3) **Acute or subacute** fracture (typically < 3-6 months old). Kyphoplasty may partially **restore vertebral body height** and reduce kyphotic deformity. Evidence is mixed (the INVEST and FREE trials showed conflicting results), but these procedures are reasonable for **selected patients with refractory symptoms**. Risks include cement leakage, adjacent-level fracture, and infection. (Ref: Hazzard's Ch. 77; FREE Trial, Lancet 2009; AAOS Appropriate Use Criteria)"
    },

    # ===== FALL CASCADE & PREVENTION (Templates 31-38) =====
    # T31: The Fall Cascade — Post-Fall Syndrome
    {
        "q": "A {age}-year-old {gender} sustained a mechanical fall {fall_months} months ago without fracture. Since then, {pronoun} has been progressively restricting {possessive} activities, avoiding going outside, and is fearful of falling again. {pronoun_cap} now requires assistance for ambulation even though {pronoun} has no physical injury or neurologic deficit. This has led to deconditioning, muscle atrophy, and social isolation. Which of the following best describes this condition and the most appropriate intervention?",
        "options": [
            "Post-fall syndrome (fear of falling / ptophobia); this is a recognized geriatric syndrome characterized by excessive fear of falling leading to activity restriction, deconditioning, loss of independence, and paradoxically increased fall risk; management includes cognitive behavioral therapy, supervised physical therapy with progressive balance and strength training, and occupational therapy for home safety modifications",
            "Agoraphobia; this is a primary psychiatric disorder that requires antipsychotic medication as first-line treatment",
            "Malingering; the patient is intentionally restricting activities for secondary gain and should be confronted directly",
            "Normal aging; all older adults naturally reduce activity after age 70, and no intervention is needed",
            "Post-traumatic stress disorder (PTSD); start high-dose benzodiazepines for anxiety management"
        ],
        "answer": 0,
        "exp": "**Post-fall syndrome** (also called **ptophobia** or **fear of falling**) is a recognized and common geriatric syndrome affecting **30-73% of older adults who have fallen** and even 12-65% of those who have never fallen. It creates a **vicious cycle**: Fear of falling -> Activity restriction -> Physical deconditioning, muscle atrophy, loss of balance -> Increased fall risk -> Further falls -> Greater fear. This cycle leads to progressive loss of independence, social isolation, depression, and institutionalization. Management: (1) **Cognitive behavioral therapy (CBT)** to address fear and self-efficacy, (2) **Supervised physical therapy** with progressive balance and strength training (e.g., tai chi), (3) **Occupational therapy** for home safety modifications and adaptive strategies, (4) Treatment of underlying conditions (e.g., orthostatic hypotension, vision impairment). Benzodiazepines are **contraindicated** (Beers Criteria) as they increase fall risk. (Ref: Hazzard's Ch. 12; Current Geriatrics; JAGS 2011)"
    },
    # T32: Multifactorial Fall Risk Assessment
    {
        "q": "A {age}-year-old {gender} presents after {pronoun} {fall_recurrence} in the past year. {pronoun_cap} has hypertension, type 2 diabetes, and takes {fall_med_count} medications daily. According to the AGS/BGS Clinical Practice Guidelines, which of the following components should be included in a comprehensive multifactorial fall risk assessment?",
        "options": [
            "Gait and balance assessment (e.g., Timed Up and Go), orthostatic blood pressure measurement, visual acuity testing, medication review (especially CNS-active drugs, antihypertensives), lower extremity strength and sensation testing, footwear evaluation, cognitive screening, and home hazard assessment",
            "Only a brain MRI to rule out a structural lesion causing the falls",
            "Only an ECG to evaluate for cardiac arrhythmias as the sole cause of falls",
            "Only a medication count; falls are always caused by polypharmacy and no other evaluation is needed",
            "No assessment is needed for community-dwelling older adults with recurrent falls, as falls are a normal part of aging"
        ],
        "answer": 0,
        "exp": "The **AGS/BGS Clinical Practice Guidelines for Fall Prevention** recommend a **multifactorial fall risk assessment** for all older adults who report **>= 2 falls in 12 months, a single fall with injury, or gait/balance difficulties**. The assessment should include: (1) **Gait, balance, and mobility** (Timed Up and Go [TUG], Berg Balance Scale), (2) **Orthostatic blood pressure** (supine to standing), (3) **Visual acuity** (cataracts, macular degeneration, glaucoma), (4) **Medication review** (especially **CNS-active drugs**: benzodiazepines, opioids, anticonvulsants, antidepressants; antihypertensives causing orthostasis), (5) **Lower extremity strength, proprioception, and sensation** (peripheral neuropathy), (6) **Footwear evaluation**, (7) **Cognitive screening** (dementia increases fall risk 2-3x), (8) **Home safety/hazard assessment** (loose rugs, poor lighting, absence of grab bars), (9) **Cardiovascular assessment** (arrhythmias, carotid sinus hypersensitivity). (Ref: AGS/BGS 2010 Clinical Practice Guideline; Hazzard's Ch. 12; Current Geriatrics)"
    },
    # T33: Medication Review for Fall Prevention
    {
        "q": "A {age}-year-old {gender} is brought in after {possessive} {fall_number} fall in {fall_period} months. Medication review reveals: {fall_drug}, a thiazide diuretic, metformin, and atorvastatin. Which of the following is the most important pharmacologic intervention to reduce fall risk?",
        "options_key": "fall_drug_intervention",
        "answer": 0,
        "exp_key": "fall_drug_exp"
    },
    # T34: Home Safety Modifications
    {
        "q": "A {age}-year-old {gender} who lives alone has had {home_falls} falls in the past year, primarily occurring inside {possessive} home. An occupational therapist is consulted for a home safety evaluation. Which of the following home modification strategies has the strongest evidence for reducing fall risk in community-dwelling older adults?",
        "options": [
            "Remove loose rugs and clutter from walkways, install grab bars in the bathroom and near the toilet, ensure adequate lighting (especially nightlights in hallways and bathrooms), install handrails on all staircases, use non-slip mats in the shower/tub, and ensure the bed height allows easy transfers",
            "Install wall-to-wall carpeting throughout the house to cushion any future falls",
            "Remove all furniture from the living room to create an open space for walking",
            "Install hospital-grade bed rails on all beds to prevent the patient from getting up at night",
            "No home modifications are effective; the patient should be moved to an assisted living facility immediately"
        ],
        "answer": 0,
        "exp": "**Home safety modification** is a key component of multifactorial fall prevention. A Cochrane review demonstrated that **home hazard assessment and modification by occupational therapists reduces fall rates by approximately 20-30%** in community-dwelling older adults. Evidence-based modifications include: (1) **Remove tripping hazards** (loose rugs, electrical cords, clutter), (2) **Install grab bars** in the bathroom (near toilet, in shower/tub), (3) **Adequate lighting** (nightlights in hallways, bathrooms, bedrooms), (4) **Handrails on all staircases** (bilateral if possible), (5) **Non-slip mats/strips** in bathtubs and showers, (6) **Raised toilet seats** and shower chairs for patients with mobility limitations, (7) **Secure or remove loose carpeting**, (8) **Appropriate bed height** for easy transfers. Bed rails are NOT recommended as they increase the risk of entrapment injury, particularly in cognitively impaired patients. (Ref: Cochrane Review, Clemson 2008; AGS/BGS Guidelines; Hazzard's Ch. 12)"
    },
    # T35: Orthostatic Hypotension and Falls
    {
        "q": "A {age}-year-old {gender} with hypertension, type 2 diabetes, and Parkinson disease reports recurrent falls, primarily occurring when {pronoun} stands up from a seated or lying position. Blood pressure measured supine is {sbp_supine}/{dbp_supine} mmHg, and upon standing it drops to {sbp_standing}/{dbp_standing} mmHg with dizziness. Which of the following is the most accurate diagnosis and the most appropriate initial management?",
        "options": [
            "Orthostatic hypotension (drop of >= 20 mmHg systolic or >= 10 mmHg diastolic within 3 minutes of standing); management includes reviewing and reducing antihypertensive doses, adequate hydration, rising slowly from supine/seated positions, compression stockings, and considering midodrine or fludrocortisone if non-pharmacologic measures fail",
            "Essential hypertension with white coat effect; increase the antihypertensive doses because the supine blood pressure is elevated",
            "Vasovagal syncope; prescribe a beta-blocker to prevent future episodes",
            "Postprandial hypotension; restrict all meals to once daily to prevent blood pressure drops",
            "Carotid sinus hypersensitivity; immediately refer for pacemaker implantation"
        ],
        "answer": 0,
        "exp": "**Orthostatic hypotension (OH)** is defined as a sustained drop of **>= 20 mmHg systolic or >= 10 mmHg diastolic** blood pressure within **3 minutes of standing** from a supine position. It is a major reversible cause of falls in older adults and is highly prevalent in patients with **autonomic neuropathy** (diabetes, Parkinson disease), **volume depletion**, and **medication-related causes** (antihypertensives, alpha-blockers, tricyclic antidepressants, diuretics). Management: (1) **Review and reduce/discontinue offending medications** (most important step), (2) **Adequate hydration** (salt and fluid intake), (3) **Postural precautions** (rise slowly, sit at bedside before standing, avoid prolonged standing), (4) **Compression stockings** (thigh-high or abdominal binders), (5) If refractory: **midodrine** (alpha-1 agonist) or **fludrocortisone** (mineralocorticoid). (Ref: AGS/BGS Fall Prevention Guidelines; Hazzard's Ch. 12; Consensus Statement, JACC 2018)"
    },
    # T36: Vision Impairment and Fall Risk
    {
        "q": "A {age}-year-old {gender} with a history of recurrent falls undergoes a comprehensive fall risk assessment. Visual acuity testing reveals bilateral visual impairment. {pronoun_cap} wears bifocal glasses. Which of the following is the most accurate statement regarding the relationship between vision impairment, corrective lenses, and fall risk in older adults?",
        "options": [
            "Visual impairment (from cataracts, macular degeneration, glaucoma, or diabetic retinopathy) significantly increases fall risk; multifocal/bifocal lenses can increase fall risk during ambulation (especially on stairs) because the lower near-vision segment distorts depth perception and spatial awareness of the ground; single-lens distance glasses for outdoor walking may reduce falls",
            "Vision has no significant impact on fall risk; falls are exclusively caused by muscle weakness",
            "Bifocal and multifocal glasses reduce fall risk by improving near vision for obstacle detection",
            "Corrective surgery for cataracts has no impact on fall risk or functional outcomes in older adults",
            "Visual acuity testing is not a recommended component of fall risk assessment"
        ],
        "answer": 0,
        "exp": "**Visual impairment** is a significant independent risk factor for falls in older adults. Common age-related causes include **cataracts, age-related macular degeneration, glaucoma, and diabetic retinopathy**. An important and often overlooked risk factor is **multifocal/bifocal/progressive lenses**: the lower near-vision segment **impairs depth perception and spatial awareness** of the walking surface, particularly on **stairs and uneven terrain**. The **Visible Trial** demonstrated that providing **single-lens distance glasses for outdoor walking** in older adults who habitually wore multifocals reduced outdoor falls by 40%. **Cataract surgery** has been shown to reduce fall risk by approximately 34%. Comprehensive fall risk assessment must include **visual acuity testing** and referral to ophthalmology when impairment is identified. (Ref: Visible Trial, BMJ 2010; Lord 2006; AGS/BGS Fall Prevention Guidelines; Hazzard's Ch. 12)"
    },
    # T37: Exercise Programs for Fall Prevention
    {
        "q": "A {age}-year-old community-dwelling {gender} has had {exercise_falls} falls in the past year but sustained no fractures. {pronoun_cap} is interested in an exercise-based fall prevention program. Which of the following exercise interventions has the strongest evidence for reducing fall rates in community-dwelling older adults?",
        "options": [
            "Multicomponent exercise programs that include balance training, progressive strength training, and gait training (e.g., Tai Chi, Otago Exercise Programme) have the strongest evidence; these programs reduce fall rates by 20-40% when performed regularly",
            "Solely stretching and flexibility exercises are sufficient to prevent falls",
            "High-intensity interval training (HIIT) is the most effective fall prevention exercise for all older adults",
            "Only aquatic exercises are effective because they eliminate the risk of falling during the exercise itself",
            "Exercise-based programs have not been shown to reduce falls in any randomized controlled trials"
        ],
        "answer": 0,
        "exp": "**Exercise-based fall prevention programs** are one of the most effective interventions for reducing falls in community-dwelling older adults. The strongest evidence supports: (1) **Tai Chi** - reduces falls by 20-40% (multiple RCTs, Cochrane Review), improves balance, proprioception, and lower extremity strength. (2) **Otago Exercise Programme** - a home-based program of progressive strength and balance exercises with walking, shown to reduce falls by 35% in multiple RCTs. (3) **Multicomponent programs** combining **balance training, strength/resistance training, and gait training** are more effective than single-component programs. Key principles: exercises must be **progressive** (increasing difficulty), **sustained** (ongoing, not time-limited), and include a strong **balance challenge** component. Flexibility exercises alone are insufficient. The **Cochrane Review (Sherrington 2019)** confirmed that exercise programs reduce fall rates by 23% overall, with higher-dose balance-challenging programs showing greater benefit. (Ref: Cochrane Review, Sherrington 2019; AGS/BGS Guidelines; Hazzard's Ch. 12)"
    },
    # T38: Polypharmacy and Fall Risk — Beers Criteria Drugs
    {
        "q": "A {age}-year-old {gender} is seen for a fall risk assessment after {poly_falls} falls in {poly_months} months. Current medications include: lisinopril 10 mg daily, metformin 1000 mg twice daily, {beers_drug}, omeprazole 20 mg daily, and aspirin 81 mg daily. According to the AGS Beers Criteria and fall prevention guidelines, which medication class poses the highest fall risk and should be prioritized for dose reduction or discontinuation?",
        "options_key": "beers_fall_intervention",
        "answer": 0,
        "exp_key": "beers_fall_exp"
    },

    # ===== SPECIAL POPULATIONS & ADVANCED (Templates 39-40) =====
    # T39: Male Osteoporosis
    {
        "q": "A {age_male}-year-old male presents with a low-trauma vertebral compression fracture. He has a history of {male_op_cause}. A DEXA scan reveals a T-score of -2.8 at the lumbar spine. Which of the following statements is most accurate regarding osteoporosis in men?",
        "options": [
            "Osteoporosis in men is under-recognized; secondary causes account for up to 50-80% of male osteoporosis and must be systematically excluded (hypogonadism, glucocorticoid use, alcohol abuse, antiandrogen therapy); treatment includes bisphosphonates, denosumab, or teriparatide, with the same T-score diagnostic thresholds as for women aged >= 50",
            "Osteoporosis does not occur in men because testosterone completely protects bone density throughout life",
            "DEXA T-score criteria cannot be applied to men; a bone biopsy is required for diagnosis in all males",
            "Only women should be treated for osteoporosis; male bone loss is always benign and self-limited",
            "Testosterone replacement alone is sufficient treatment for all male osteoporosis regardless of the underlying cause"
        ],
        "answer": 0,
        "exp": "**Male osteoporosis** is significantly **under-recognized and under-treated**. Key facts: (1) About **30% of all hip fractures** occur in men, and men have **higher post-hip fracture mortality** than women. (2) **Secondary causes** account for **50-80%** of male osteoporosis (vs. ~30% in women). Common secondary causes include: **hypogonadism** (most common), **glucocorticoid use**, **excessive alcohol use** (>3 drinks/day), **androgen deprivation therapy** for prostate cancer, **malabsorption syndromes**, **hyperparathyroidism**, and **hyperthyroidism**. (3) WHO T-score criteria apply to men **>= 50 years** (osteoporosis = T-score <= -2.5). For men < 50, the Z-score is preferred. (4) Treatment: bisphosphonates (alendronate, risedronate, zoledronic acid), denosumab, and teriparatide are all FDA-approved for male osteoporosis. Testosterone replacement may be considered for hypogonadal men but is NOT sufficient as sole therapy if severe osteoporosis/fractures are present. (Ref: Hazzard's Ch. 77; Endocrine Society Guidelines 2012; AACE/ACE 2020)"
    },
    # T40: Osteoporosis Treatment Cascade and Algorithm
    {
        "q": "A {age}-year-old postmenopausal {gender} is diagnosed with osteoporosis (T-score -2.9 at the femoral neck). She has no contraindications to any osteoporosis medication. She asks about the overall treatment approach and the sequence of available therapies. Which of the following most accurately describes the current evidence-based treatment algorithm for postmenopausal osteoporosis?",
        "options": [
            "First-line: oral bisphosphonate (alendronate or risedronate) plus calcium and vitamin D for all patients; IV zoledronic acid if oral bisphosphonates are contraindicated or not tolerated; denosumab as an alternative anti-resorptive; teriparatide or romosozumab reserved for very high-risk patients (very low T-score, multiple fractures, treatment failure); raloxifene considered if concurrent breast cancer risk reduction is desired",
            "Teriparatide is always first-line for all patients with osteoporosis regardless of severity",
            "Denosumab is always first-line because it has the fewest side effects of any osteoporosis medication",
            "Raloxifene is the preferred first-line agent for all postmenopausal women with osteoporosis because it reduces both vertebral and hip fracture risk",
            "Hormone replacement therapy (HRT) with estrogen plus progesterone is the recommended first-line treatment for all postmenopausal osteoporosis"
        ],
        "answer": 0,
        "exp": "The evidence-based **treatment algorithm for postmenopausal osteoporosis**: **First-line**: Oral bisphosphonates (**alendronate** or **risedronate**) are first-line for most patients due to strong fracture reduction evidence (vertebral, non-vertebral, and hip), long track record, generic availability, and cost-effectiveness. **Calcium (1200 mg/day) and vitamin D (800-1000 IU/day)** are adjunctive for all patients. **Second-line/alternatives**: (1) **IV zoledronic acid** - for patients who cannot tolerate or are contraindicated for oral bisphosphonates. (2) **Denosumab** - for patients with renal insufficiency (eGFR < 35 mL/min, where bisphosphonates are relatively contraindicated), intolerance to bisphosphonates, or preference for SC injection. (3) **Raloxifene** - for patients with concurrent high breast cancer risk (reduces only vertebral fractures). **Reserved for very high risk**: (4) **Teriparatide** or **abaloparatide** (anabolic agents) - for very low T-scores, multiple fractures, or treatment failure. (5) **Romosozumab** - for very high fracture risk without CV contraindications. **HRT** is no longer first-line due to cardiovascular and cancer risks (WHI Trial). (Ref: NOF Clinician's Guide; AACE/ACE 2020; Hazzard's Ch. 77; Endocrine Society)"
    }
]

# ===== POOLS FOR GENERATING UNIQUE VARIATIONS =====

genders_pool = [
    {"gender": "woman", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "female", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "man", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"},
    {"gender": "male", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"}
]

# Female-only pool for postmenopausal templates
female_pool = [
    {"gender": "woman", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "female", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"}
]

medications_pool = ["diphenhydramine", "amitriptyline", "hydroxyzine", "oxybutynin"]
anti_hypertensives_pool = ["amlodipine", "nifedipine"]

risk_factors_pool = [
    "a parental history of hip fracture and current smoking",
    "low body weight (52 kg) and excessive alcohol intake (4 drinks/day)",
    "rheumatoid arthritis and chronic prednisone use (5 mg/day for 3 years)",
    "early menopause at age 42 and a maternal history of hip fracture"
]

denosumab_reasons = [
    "severe renal insufficiency (eGFR 25 mL/min)",
    "chronic kidney disease stage 4 (eGFR 22 mL/min)",
    "severe renal impairment (eGFR 28 mL/min)"
]

male_op_causes = [
    "long-term androgen deprivation therapy for prostate cancer",
    "chronic prednisone use (10 mg/day for 5 years) for COPD",
    "heavy alcohol use (5 drinks daily for 20 years)",
    "untreated primary hypogonadism"
]

dental_procedures = [
    "a molar extraction",
    "a dental implant placement",
    "a tooth extraction"
]

jaw_sites = ["mandible", "maxilla"]

hip_fx_types = [
    {
        "desc": "a displaced femoral neck fracture (Garden III-IV) in an active, ambulatory patient",
        "management": "Hemiarthroplasty or total hip arthroplasty (THA); displaced femoral neck fractures in elderly patients are treated with arthroplasty rather than internal fixation due to high rates of avascular necrosis (AVN) and nonunion with fixation; THA is preferred for active, high-demand patients",
        "wrong1": "Closed reduction and percutaneous cannulated screw fixation; this is appropriate for non-displaced femoral neck fractures, not displaced fractures in elderly patients",
        "wrong2": "Non-operative management with traction and bed rest; this approach carries unacceptable rates of DVT, pneumonia, pressure ulcers, and mortality",
        "wrong3": "Intramedullary nail fixation; this is the standard treatment for intertrochanteric fractures, not femoral neck fractures",
        "wrong4": "External fixation as definitive treatment; this is not standard for hip fractures and is reserved for damage control in polytrauma"
    },
    {
        "desc": "a non-displaced femoral neck fracture (Garden I-II)",
        "management": "Internal fixation with percutaneous cannulated screws or a sliding hip screw; non-displaced femoral neck fractures (Garden I-II) are treated with internal fixation because the blood supply to the femoral head is likely intact, preserving the native hip joint",
        "wrong1": "Total hip arthroplasty; this is overly aggressive for a non-displaced fracture where the femoral head blood supply is intact",
        "wrong2": "Non-operative management with strict bed rest for 12 weeks; this approach carries unacceptable morbidity and mortality in elderly patients",
        "wrong3": "Intramedullary nail fixation; this is the preferred treatment for intertrochanteric and subtrochanteric fractures, not femoral neck fractures",
        "wrong4": "External fixation as definitive treatment; this is not a standard approach for femoral neck fractures"
    },
    {
        "desc": "a stable intertrochanteric hip fracture",
        "management": "Open reduction and internal fixation (ORIF) with a sliding hip screw (dynamic hip screw/DHS) or cephalomedullary nail; intertrochanteric fractures have an intact blood supply to the femoral head, so internal fixation (not arthroplasty) is the standard treatment",
        "wrong1": "Total hip arthroplasty; arthroplasty is the standard for displaced femoral neck fractures, not intertrochanteric fractures, because the blood supply is intact in intertrochanteric fractures",
        "wrong2": "Non-operative management with traction; this is associated with prohibitive morbidity and mortality in elderly patients",
        "wrong3": "Percutaneous cannulated screw fixation alone; this provides insufficient stability for intertrochanteric fractures",
        "wrong4": "External fixation as definitive treatment; this is not standard for intertrochanteric hip fractures"
    }
]

vcf_triggers = [
    "bending down to pick up a bag of groceries",
    "coughing vigorously during a respiratory infection",
    "lifting a moderately heavy box",
    "sneezing forcefully"
]

fall_drugs_pool = [
    {
        "drug": "lorazepam 1 mg at bedtime for insomnia",
        "intervention": "Taper and discontinue lorazepam (benzodiazepine); benzodiazepines are listed in the Beers Criteria as potentially inappropriate for older adults due to significantly increased fall risk, cognitive impairment, sedation, and delirium; they are the highest-priority medication class to discontinue for fall prevention",
        "exp": "**Benzodiazepines** (lorazepam, diazepam, alprazolam, clonazepam) are among the **highest-risk medication classes for falls** in older adults. The AGS Beers Criteria strongly recommends **avoiding benzodiazepines** in older adults due to: (1) **Increased fall risk** (OR 1.4-1.8), (2) **Cognitive impairment**, (3) **Excessive sedation and psychomotor impairment**, (4) **Delirium risk**, and (5) **Fracture risk** (especially hip fractures). Non-pharmacologic sleep hygiene measures (CBT-I) are first-line for insomnia. If pharmacotherapy is needed, low-dose melatonin or ramelteon are safer alternatives. (Ref: AGS Beers Criteria 2023; AGS/BGS Fall Prevention Guidelines; Hazzard's Ch. 12)"
    },
    {
        "drug": "zolpidem 10 mg at bedtime for insomnia",
        "intervention": "Discontinue zolpidem (non-benzodiazepine sedative-hypnotic / Z-drug); Z-drugs are listed in the Beers Criteria as potentially inappropriate due to fall risk similar to benzodiazepines, including excessive sedation, psychomotor impairment, and increased fracture risk especially in older adults",
        "exp": "**Non-benzodiazepine receptor agonists (Z-drugs)** (zolpidem, zaleplon, eszopiclone) bind to the same GABA-A receptor as benzodiazepines and carry **similar fall risks** in older adults. The Beers Criteria recommends avoiding Z-drugs due to: (1) **Falls and fractures** (risk comparable to benzodiazepines), (2) **Excessive sedation and next-morning impairment**, (3) **Complex sleep behaviors** (sleep-driving, sleep-eating). The FDA specifically issued a warning for zolpidem regarding next-morning impairment and recommended lower doses for older adults. Non-pharmacologic CBT-I is preferred for insomnia management. (Ref: AGS Beers Criteria 2023; FDA Safety Communication; Hazzard's Ch. 12)"
    },
    {
        "drug": "amitriptyline 25 mg at bedtime for neuropathic pain",
        "intervention": "Discontinue amitriptyline (tricyclic antidepressant with strong anticholinergic properties); TCAs are listed in the Beers Criteria as potentially inappropriate due to high fall risk from orthostatic hypotension, sedation, and anticholinergic effects (confusion, blurred vision, urinary retention); consider duloxetine or gabapentin as safer alternatives for neuropathic pain",
        "exp": "**Tricyclic antidepressants (TCAs)** (amitriptyline, nortriptyline, imipramine) are highly anticholinergic and cause **orthostatic hypotension, excessive sedation, cognitive impairment, and blurred vision** - all of which increase fall risk. Amitriptyline is the most anticholinergic TCA and is **specifically listed in the Beers Criteria as a high-risk medication**. Safer alternatives for neuropathic pain include **duloxetine** (SNRI), **gabapentin** or **pregabalin** (though these also require caution for sedation), or topical agents (lidocaine patches, capsaicin). (Ref: AGS Beers Criteria 2023; AGS/BGS Fall Prevention Guidelines; Hazzard's Ch. 12)"
    },
    {
        "drug": "oxybutynin 5 mg twice daily for urinary urgency",
        "intervention": "Discontinue oxybutynin (first-generation anticholinergic/antimuscarinic); oxybutynin crosses the blood-brain barrier extensively and is listed in the Beers Criteria as potentially inappropriate due to cognitive impairment, confusion, sedation, and increased fall risk; consider mirabegron (beta-3 agonist) or behavioral therapies as safer alternatives",
        "exp": "**First-generation antimuscarinics** (oxybutynin, tolterodine) have high CNS penetration and cause significant **anticholinergic adverse effects** including cognitive impairment, confusion, blurred vision, constipation, dry mouth, and sedation - all contributing to **increased fall risk**. Oxybutynin is specifically listed in the Beers Criteria. Safer alternatives for overactive bladder include: (1) **Mirabegron** (beta-3 adrenergic agonist, no anticholinergic effects), (2) **Vibegron**, (3) **Bladder training and behavioral therapies** (first-line non-pharmacologic), (4) If an antimuscarinic is needed, use a more bladder-selective agent with lower CNS penetration (e.g., darifenacin, fesoterodine). (Ref: AGS Beers Criteria 2023; Hazzard's Ch. 12, Ch. 78)"
    }
]

beers_drugs_pool = [
    {
        "drug": "diazepam 5 mg twice daily for anxiety",
        "intervention": "Taper and discontinue diazepam (long-acting benzodiazepine); the Beers Criteria strongly recommends avoiding all benzodiazepines in older adults, especially long-acting agents like diazepam (half-life 20-100 hours and active metabolites), due to significantly increased risks of falls, fractures, cognitive impairment, delirium, and oversedation",
        "exp": "**Long-acting benzodiazepines** (diazepam, chlordiazepoxide, flurazepam, clonazepam) are among the **most dangerous medications** for falls in older adults due to their prolonged half-lives and accumulation of active metabolites. Diazepam has a half-life of **20-100 hours** in the elderly. The Beers Criteria identifies ALL benzodiazepines as **potentially inappropriate** regardless of indication. Evidence shows benzodiazepines increase fall risk by **40-80%** and hip fracture risk significantly. First-line alternatives for anxiety: CBT, SSRIs (e.g., sertraline), or SNRIs (e.g., venlafaxine). (Ref: AGS Beers Criteria 2023; AGS/BGS Fall Prevention Guidelines)"
    },
    {
        "drug": "diphenhydramine 50 mg at bedtime as a sleep aid",
        "intervention": "Discontinue diphenhydramine (first-generation antihistamine with strong anticholinergic properties); the Beers Criteria recommends avoiding first-generation antihistamines in older adults due to their high anticholinergic burden causing cognitive impairment, confusion, blurred vision, urinary retention, constipation, sedation, and significantly increased fall risk",
        "exp": "**First-generation antihistamines** (diphenhydramine, hydroxyzine, chlorpheniramine) are **highly anticholinergic** and cause excessive **sedation, cognitive impairment, confusion, blurred vision, dry mouth, constipation, and urinary retention** in older adults - all of which contribute to falls. Diphenhydramine is present in many OTC sleep aids and allergy medications. The Beers Criteria strongly recommends avoidance. Safer alternatives for insomnia: CBT-I, sleep hygiene, low-dose melatonin. For allergies: second-generation antihistamines (cetirizine, loratadine). (Ref: AGS Beers Criteria 2023; Hazzard's Ch. 12)"
    },
    {
        "drug": "chlorpromazine 25 mg at bedtime for agitation",
        "intervention": "Taper and discontinue chlorpromazine (first-generation antipsychotic); the Beers Criteria recommends avoiding antipsychotics for behavioral symptoms of dementia unless non-pharmacologic approaches have failed and the patient poses a danger; antipsychotics increase fall risk through sedation, orthostatic hypotension, and extrapyramidal effects, and carry an FDA boxed warning for increased mortality in elderly dementia patients",
        "exp": "**Antipsychotics** (both first-generation like chlorpromazine and second-generation like quetiapine) increase fall risk through multiple mechanisms: **sedation, orthostatic hypotension, extrapyramidal symptoms (akathisia, parkinsonism), and cognitive impairment**. Additionally, antipsychotics carry an **FDA boxed warning for increased mortality** in elderly patients with dementia-related psychosis. The Beers Criteria recommends avoiding antipsychotics for behavioral symptoms of dementia unless non-pharmacologic interventions have failed and the patient is a danger to self or others. Non-pharmacologic approaches (behavioral modification, environmental changes, caregiver education) are first-line. (Ref: AGS Beers Criteria 2023; FDA Boxed Warning; Hazzard's Ch. 12)"
    }
]


mcqs = []
seen_questions = set()

# Generate exactly 10 variants per template = 400 MCQs
for t_idx, t in enumerate(templates):
    variants_generated = 0
    attempts = 0
    while variants_generated < 10 and attempts < 2000:
        attempts += 1
        age = random.randint(66, 95)
        age_young = random.randint(28, 44)
        age_male = random.randint(60, 88)
        gp = random.choice(genders_pool)
        fp = random.choice(female_pool)
        duration = random.randint(2, 8)
        
        # DEXA scores
        t_scores_osteoporosis = ["-2.6", "-2.7", "-2.8", "-2.9", "-3.0", "-3.1", "-3.2", "-3.3"]
        t_scores_osteopenia = ["-1.2", "-1.4", "-1.5", "-1.6", "-1.8", "-2.0", "-2.2", "-2.4"]
        t_score_val = random.choice(t_scores_osteoporosis)
        t_osteopenia_val = random.choice(t_scores_osteopenia)
        spine_t = random.choice(["-2.6", "-2.8", "-3.0", "-3.2", "-1.5", "-1.8"])
        neck_t = random.choice(["-2.5", "-2.7", "-2.9", "-1.6", "-1.9", "-2.1"])
        exercise_t = random.choice(["1.3", "1.5", "1.8", "2.0", "2.2", "2.4"])
        romo_t = random.choice(["3.2", "3.5", "3.8", "4.0"])

        # FRAX
        risk_factor = random.choice(risk_factors_pool)
        frax_major_high = random.randint(22, 35)
        frax_hip_high = random.randint(4, 9)
        frax_major_low = random.randint(8, 18)
        frax_hip_low = round(random.uniform(0.5, 2.8), 1)
        
        # Determine FRAX treatment scenario
        frax_treat = random.choice(["high", "low"])
        if frax_treat == "high":
            frax_major = frax_major_high
            frax_hip = frax_hip_high
        else:
            frax_major = frax_major_low
            frax_hip = frax_hip_low

        # Denosumab
        denosumab_reason = random.choice(denosumab_reasons)

        # Teriparatide
        teri_fractures = random.randint(2, 4)
        teri_years = random.randint(3, 7)

        # Romosozumab
        # romo_t already set above

        # GIOP
        pred_dose = random.choice([5, 7.5, 10, 15, 20])
        pred_duration = random.choice([3, 6, 9, 12])
        giop_t_values = ["-1.2", "-1.5", "-1.8", "-2.0", "-2.3", "-2.6", "-2.8"]
        giop_t = random.choice(giop_t_values)

        # ONJ
        onj_drug = random.choice(["oral alendronate", "oral risedronate", "denosumab"])
        onj_duration = random.randint(4, 10)
        onj_weeks = random.randint(9, 16)
        dental_procedure = random.choice(dental_procedures)
        jaw_site = random.choice(jaw_sites)

        # AFF
        aff_duration = random.randint(5, 12)
        aff_side = random.choice(["the left", "the right"])
        aff_weeks = random.randint(3, 12)

        # Drug holiday
        holiday_duration = random.randint(5, 8)

        # Post-hip fracture
        post_hip_days = random.randint(5, 21)
        calcium_val = round(random.uniform(8.2, 9.6), 1)
        vitd_val = random.randint(12, 35)

        # Calcium/VitD supplementation
        calcium_intake = random.choice([300, 400, 500, 600, 700])
        vitd_level = random.randint(15, 38)

        # VitD deficiency / osteomalacia
        vitd_low = random.randint(4, 9)
        ca_low = round(random.uniform(7.2, 8.0), 1)
        phos_low = round(random.uniform(1.8, 2.4), 1)

        # VCF
        vcf_trigger = random.choice(vcf_triggers)
        vcf_level = random.randint(7, 12)
        vcf_percent = random.randint(25, 55)
        vcf_level2 = random.randint(8, 12)
        kyph_weeks = random.randint(5, 10)

        # Falls
        fall_months = random.randint(2, 8)
        fall_recurrence = random.choice(["fell 2 times", "fell 3 times", "had 4 falls"])
        fall_med_count = random.randint(6, 12)
        fall_number = random.choice(["2nd", "3rd", "4th"])
        fall_period = random.randint(3, 12)
        fall_drug_item = random.choice(fall_drugs_pool)
        home_falls = random.randint(2, 5)
        exercise_falls = random.randint(2, 4)
        poly_falls = random.randint(2, 5)
        poly_months = random.randint(3, 9)
        beers_drug_item = random.choice(beers_drugs_pool)

        # Orthostatic
        sbp_supine = random.randint(145, 170)
        dbp_supine = random.randint(78, 92)
        sbp_standing = sbp_supine - random.randint(22, 40)
        dbp_standing = dbp_supine - random.randint(12, 20)

        # Hip fracture type
        hip_fx = random.choice(hip_fx_types)

        # Male OP
        male_op_cause = random.choice(male_op_causes)

        format_kwargs = {
            "age": age,
            "age_young": age_young,
            "age_male": age_male,
            "gender": fp["gender"],
            "pronoun": fp["pronoun"],
            "pronoun_cap": fp["pronoun_cap"],
            "possessive": fp["possessive"],
            "possessive_cap": fp["possessive_cap"],
            "duration": duration,
            "t_score": t_score_val,
            "t_osteopenia": t_osteopenia_val,
            "spine_t": spine_t,
            "neck_t": neck_t,
            "exercise_t": exercise_t,
            "romo_t": romo_t,
            "risk_factor": risk_factor,
            "frax_major": frax_major,
            "frax_hip": frax_hip,
            "denosumab_reason": denosumab_reason,
            "teri_fractures": teri_fractures,
            "teri_years": teri_years,
            "pred_dose": pred_dose,
            "pred_duration": pred_duration,
            "giop_t": giop_t,
            "onj_drug": onj_drug,
            "onj_duration": onj_duration,
            "onj_weeks": onj_weeks,
            "dental_procedure": dental_procedure,
            "jaw_site": jaw_site,
            "aff_duration": aff_duration,
            "aff_side": aff_side,
            "aff_weeks": aff_weeks,
            "holiday_duration": holiday_duration,
            "post_hip_days": post_hip_days,
            "calcium": calcium_val,
            "vitd": vitd_val,
            "calcium_intake": calcium_intake,
            "vitd_level": vitd_level,
            "vitd_low": vitd_low,
            "ca_low": ca_low,
            "phos_low": phos_low,
            "vcf_trigger": vcf_trigger,
            "vcf_level": vcf_level,
            "vcf_percent": vcf_percent,
            "vcf_level2": vcf_level2,
            "kyph_weeks": kyph_weeks,
            "fall_months": fall_months,
            "fall_recurrence": fall_recurrence,
            "fall_med_count": fall_med_count,
            "fall_number": fall_number,
            "fall_period": fall_period,
            "home_falls": home_falls,
            "exercise_falls": exercise_falls,
            "poly_falls": poly_falls,
            "poly_months": poly_months,
            "sbp_supine": sbp_supine,
            "dbp_supine": dbp_supine,
            "sbp_standing": sbp_standing,
            "dbp_standing": dbp_standing,
            "male_op_cause": male_op_cause,
            "hip_fx_type": hip_fx["desc"],
            "fall_drug": fall_drug_item["drug"],
            "beers_drug": beers_drug_item["drug"],
        }

        # For templates that use both genders (falls, ortho, etc)
        # override gender pool for non-postmenopausal templates
        non_female_templates = [25, 26, 30, 31, 32, 33, 34, 35, 36, 37, 38]  # 0-indexed: 24,25,29,30,31,32,33,34,35,36,37
        if t_idx in [24, 25, 29, 30, 31, 32, 33, 34, 35, 36, 37]:
            gp_used = random.choice(genders_pool)
            format_kwargs["gender"] = gp_used["gender"]
            format_kwargs["pronoun"] = gp_used["pronoun"]
            format_kwargs["pronoun_cap"] = gp_used["pronoun_cap"]
            format_kwargs["possessive"] = gp_used["possessive"]
            format_kwargs["possessive_cap"] = gp_used["possessive_cap"]

        try:
            q_text = t["q"].format(**format_kwargs)
        except KeyError as e:
            print(f"KeyError in template {t_idx} (q): {e}")
            continue

        if q_text in seen_questions:
            continue

        # Build options
        if "options_key" in t:
            key = t["options_key"]
            if key == "frax_treatment":
                if frax_treat == "high":
                    opts = [
                        f"The FRAX score exceeds the treatment threshold (>= 20% major osteoporotic or >= 3% hip fracture risk); initiate pharmacologic therapy with a bisphosphonate plus calcium and vitamin D, in addition to lifestyle modifications",
                        "The FRAX score is below the treatment threshold; lifestyle modifications (calcium, vitamin D, weight-bearing exercise, fall prevention) are sufficient without pharmacotherapy",
                        "FRAX scores are not validated for postmenopausal women; perform a bone biopsy to guide treatment decisions",
                        "Initiate teriparatide immediately because any FRAX score above 10% requires anabolic therapy",
                        "Repeat the DEXA scan in 6 months because FRAX cannot be calculated from a single DEXA measurement"
                    ]
                else:
                    opts = [
                        f"The FRAX score is below the treatment threshold (< 20% major osteoporotic AND < 3% hip fracture risk); lifestyle modifications (calcium 1200 mg/day, vitamin D 800-1000 IU/day, weight-bearing exercise, fall prevention, smoking cessation) are appropriate; repeat DEXA in 1-2 years",
                        "Initiate bisphosphonate therapy immediately because any patient with osteopenia requires pharmacotherapy",
                        "FRAX scores are not validated for use in clinical decision-making and should be disregarded",
                        "Start denosumab because FRAX scores below 20% always indicate the need for biological therapy",
                        "Prescribe raloxifene as first-line therapy for all patients with FRAX scores below 20%"
                    ]
            elif key == "post_hip":
                if vitd_val >= 20:
                    opts = [
                        f"Initiate zoledronic acid 5 mg IV within 2-12 weeks post-fracture; vitamin D is adequate (>= 20 ng/mL); the HORIZON Recurrent Fracture Trial showed this reduces recurrent fractures by 35% and mortality by 28% after hip fracture; a DEXA scan should be obtained but should NOT delay treatment",
                        "Defer all treatment until a DEXA scan confirms a T-score <= -2.5, as fractures alone do not justify pharmacotherapy",
                        "Start oral alendronate 70 mg weekly immediately on postoperative day 1 before the patient can sit upright",
                        "No osteoporosis treatment is indicated because the fracture was caused by the fall, not by weak bones",
                        "Wait 12 months after the fracture before considering any osteoporosis treatment to allow for bone healing"
                    ]
                else:
                    opts = [
                        f"First correct the vitamin D deficiency (25(OH)D {vitd_val} ng/mL < 20 ng/mL) with high-dose cholecalciferol loading, then initiate zoledronic acid 5 mg IV within 2-12 weeks post-fracture; vitamin D must be repleted before bisphosphonate infusion to prevent severe hypocalcemia",
                        "Start zoledronic acid immediately without correcting vitamin D because the fracture risk is too high to delay treatment",
                        "Defer all treatment until the patient is fully rehabilitated (typically 6-12 months post-fracture)",
                        "No osteoporosis treatment is needed because the vitamin D deficiency alone caused the fracture, and repletion will be sufficient",
                        "Prescribe calcitonin nasal spray as the sole treatment because it is the only agent approved for post-fracture management"
                    ]
            elif key == "giop_treatment":
                if float(giop_t) <= -2.5:
                    opts = [
                        f"Initiate a bisphosphonate (alendronate or risedronate) plus calcium and vitamin D immediately; with a T-score of {giop_t} and expected glucocorticoid use >= 3 months at >= 2.5 mg/day, the ACR strongly recommends pharmacologic prophylaxis; teriparatide is reserved for very high-risk patients",
                        "No prophylaxis is needed because prednisone does not affect bone density at doses below 20 mg/day",
                        "Start raloxifene as first-line prevention because it is the most effective agent for glucocorticoid-induced bone loss",
                        "Defer any intervention until a fracture occurs, as prophylaxis has not been shown to prevent glucocorticoid-induced fractures",
                        "Prescribe calcitonin as the sole prophylactic agent because it directly counteracts glucocorticoid effects on osteoblasts"
                    ]
                else:
                    opts = [
                        f"Start calcium (1000-1200 mg/day) and vitamin D (800-1000 IU/day) for all patients on glucocorticoids; with a T-score of {giop_t} and prednisone >= 2.5 mg/day for >= 3 months, add bisphosphonate prophylaxis based on fracture risk assessment using FRAX (with glucocorticoid adjustment)",
                        "No intervention is needed because prednisone at low doses protects against bone loss",
                        "Start teriparatide immediately for all patients regardless of T-score and glucocorticoid dose",
                        "Only prescribe calcium supplementation without vitamin D because vitamin D is not affected by glucocorticoid use",
                        "Defer any intervention until repeat DEXA in 5 years to monitor for bone loss progression"
                    ]
            elif key == "hip_fx_management":
                opts = [
                    hip_fx["management"],
                    hip_fx["wrong1"],
                    hip_fx["wrong2"],
                    hip_fx["wrong3"],
                    hip_fx["wrong4"]
                ]
            elif key == "fall_drug_intervention":
                opts = [
                    fall_drug_item["intervention"],
                    "Increase the thiazide diuretic dose to lower blood pressure further and reduce fall risk",
                    "Add a long-acting benzodiazepine at bedtime to improve sleep quality and reduce nighttime falls",
                    "Start a first-generation antihistamine (diphenhydramine) as a sleep aid to ensure restful sleep and reduce daytime fatigue-related falls",
                    "No medication changes are needed; falls are an inevitable consequence of aging and are not related to medication use"
                ]
            elif key == "beers_fall_intervention":
                opts = [
                    beers_drug_item["intervention"],
                    "Discontinue aspirin 81 mg because it increases bleeding risk from fall-related injuries and has no effect on cardiovascular outcomes",
                    "Double the lisinopril dose to ensure tighter blood pressure control, as hypertension is the primary cause of falls",
                    "Switch omeprazole to a higher-dose PPI because acid reflux is causing nocturnal awakening and contributing to falls",
                    "No medication changes are needed; the current regimen is entirely appropriate for an older adult"
                ]
            else:
                print(f"Unknown options_key: {key}")
                continue
        else:
            opts = list(t["options"])

        # Build answer
        if "answer_key" in t:
            key = t["answer_key"]
            if key == "t_score_class":
                t_score_float = float(t_score_val)
                if t_score_float <= -2.5:
                    answer_idx = 0  # Osteoporosis
                elif t_score_float >= -1.0:
                    answer_idx = 2  # Normal
                else:
                    answer_idx = 1  # Osteopenia
            elif key == "frax_answer":
                answer_idx = 0
            elif key == "post_hip_answer":
                answer_idx = 0
            elif key == "giop_answer":
                answer_idx = 0
            elif key == "hip_fx_answer":
                answer_idx = 0
            else:
                answer_idx = t.get("answer", 0)
        else:
            answer_idx = t.get("answer", 0)

        # Build explanation
        if "exp_key" in t:
            key = t["exp_key"]
            if key == "fall_drug_exp":
                exp_text = fall_drug_item["exp"]
            elif key == "beers_fall_exp":
                exp_text = beers_drug_item["exp"]
            elif key == "hip_fx_exp":
                exp_text = f"Management of hip fractures depends on fracture location and displacement: (1) **Displaced femoral neck fractures (Garden III-IV)** in elderly patients: **arthroplasty** (hemiarthroplasty or THA) is preferred because displaced fractures disrupt the blood supply to the femoral head, resulting in high rates of AVN (15-33%) and nonunion (10-30%) with internal fixation. THA is preferred for active patients with a long life expectancy. (2) **Non-displaced femoral neck fractures (Garden I-II)**: **internal fixation** (cannulated screws or sliding hip screw) is preferred because the femoral head blood supply is likely intact. (3) **Intertrochanteric fractures**: **ORIF with a sliding hip screw (DHS) or cephalomedullary nail** is standard because the blood supply is intact (extracapsular fracture), and arthroplasty is not needed. All hip fracture patients should receive DVT prophylaxis, early mobilization, and osteoporosis assessment/treatment. (Ref: Hazzard's Ch. 77; AAOS Guidelines; Current Geriatrics)"
            else:
                exp_text = t.get("exp", "")
        else:
            exp_text = t.get("exp", "")

        # Format explanation
        try:
            exp_formatted = exp_text.format(**format_kwargs)
        except (KeyError, IndexError):
            exp_formatted = exp_text

        # Format options
        opts_formatted = []
        for o in opts:
            try:
                o_fmt = o.format(**format_kwargs)
            except (KeyError, IndexError):
                o_fmt = o
            opts_formatted.append(o_fmt)

        correct_opt = opts_formatted[answer_idx]
        random.shuffle(opts_formatted)
        new_ans_idx = opts_formatted.index(correct_opt)

        q_esc = q_text.replace("'", "''")
        opts_json = json.dumps(opts_formatted).replace("'", "''")
        exp_esc = exp_formatted.replace("'", "''")

        mcq_str = f"    (v_topic_id, '{q_esc}', '{opts_json}'::jsonb, {new_ans_idx}, '{exp_esc}')"

        seen_questions.add(q_text)
        mcqs.append(mcq_str)
        variants_generated += 1

    if variants_generated < 10:
        print(f"WARNING: Template {t_idx} only generated {variants_generated} variants after {attempts} attempts")

print(f"Total unique MCQs generated: {len(mcqs)}")

# Split into 4 parts of 100
parts = [mcqs[i:i+100] for i in range(0, len(mcqs), 100)]

for part_num, part_mcqs in enumerate(parts, 1):
    out_file = f"c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260521_geri_osteoporosis_mcqs_p{part_num}.sql"
    with open(out_file, "w", encoding="utf-8") as f:
        f.write(f"-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Osteoporosis & fracture prevention - DEXA criteria, bisphosphonates, fall cascade - Part {part_num} ({(part_num-1)*100+1}-{part_num*100})\n")
        f.write("BEGIN;\n\n")
        f.write("DO $$\nDECLARE\n    v_topic_id UUID;\nBEGIN\n")
        f.write(f"    SELECT id INTO v_topic_id FROM topics WHERE slug = '{topic_slug}' LIMIT 1;\n")
        f.write(f"    IF v_topic_id IS NULL THEN\n        RAISE EXCEPTION 'Topic {topic_slug} not found.';\n    END IF;\n\n")
        
        if part_num == 1:
            f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
        
        f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
        for i, m in enumerate(part_mcqs):
            if i < len(part_mcqs) - 1:
                f.write(m + ",\n")
            else:
                f.write(m + ";\n")
        f.write("END $$;\nCOMMIT;\n")
    
    print(f"Part {part_num}: {len(part_mcqs)} MCQs -> {out_file}")

print(f"\nDone! Total: {len(mcqs)} MCQs in {len(parts)} files.")
