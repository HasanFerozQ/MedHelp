// TOPIC: Osteoporosis & fracture prevention — DEXA criteria, bisphosphonates, fall cascade
// SECTION: Geriatrics
// CARD COUNT: 80

const cards_geri_osteoporosis = [
  {
    q: "What are the cellular origins and primary functions of osteoblasts and osteoclasts?",
    a: "<b>Osteoblasts:</b> Derived from <b>mesenchymal stem cells</b>; primary function is to synthesize and secrete <b>osteoid</b> (mostly type I collagen) and regulate mineralization.<br><b>Osteoclasts:</b> Derived from <b>hematopoietic stem cells</b> (monocyte-macrophage lineage); primary function is <b>bone resorption</b> via acid and protease secretion."
  },
  {
    q: "What are the five consecutive phases of the bone remodeling cycle?",
    a: "<b>Bone Remodeling Cycle:</b><ol><li><b>Activation:</b> Recruitment and activation of osteoclast precursors on the bone surface.</li><li><b>Resorption:</b> Active <b>osteoclasts</b> dissolve mineralized bone using <b>hydrochloric acid</b> and <b>cathepsin K</b>.</li><li><b>Reversal:</b> Osteoclasts undergo apoptosis; osteoblast precursors are recruited to the site.</li><li><b>Formation:</b> <b>Osteoblasts</b> lay down new collagenous <b>osteoid</b> matrix.</li><li><b>Mineralization:</b> Hydroxyapatite crystals deposit into the osteoid matrix to complete new bone formation.</li></ol>"
  },
  {
    q: "At what age range is peak bone mass typically achieved, and what is its primary determinant?",
    a: "<b>Peak Bone Mass:</b><br><b>Age Range:</b> Typically achieved between ages <b>25 to 30 years</b>.<br><b>Primary Determinant:</b> <b>Genetics</b> (accounts for 60% to 80% of peak bone mass variance).<br><b>Modifiable Factors:</b> Adequate <b>calcium</b> and <b>vitamin D</b> intake, weight-bearing exercise, and avoiding tobacco and excess alcohol."
  },
  {
    q: "How is the T-score calculated on a DEXA scan, and in which population is it used for diagnosis?",
    a: "<b>T-score Calculation:</b><br>The number of standard deviations (SD) a patient's bone mineral density (BMD) deviates from the mean BMD of a healthy, <b>young-adult, sex-matched reference population</b> (typically aged 20–29 years).<br><b>Target Population:</b> Used to diagnose osteoporosis or osteopenia in <b>postmenopausal women</b> and <b>men aged 50 and older</b>."
  },
  {
    q: "What is the WHO T-score threshold for diagnosing osteoporosis on a DEXA scan, and which sites are measured?",
    a: "<b>Osteoporosis Diagnostic Threshold:</b><br>A T-score <b>&lt;= -2.5</b> at any of the following standard anatomical sites:<ul><li><b>Lumbar spine</b> (specifically L1–L4)</li><li><b>Femoral neck</b></li><li><b>Total hip</b></li><li><b>One-third (33%) distal radius</b> (if spine or hip cannot be measured)</li></ul>"
  },
  {
    q: "What T-score range defines osteopenia (low bone mass)?",
    a: "<b>Osteopenia Diagnostic Threshold:</b><br>A T-score <b>between -1.0 and -2.5</b> (i.e., <b>&lt; -1.0 and &gt; -2.5</b>) at the lumbar spine, femoral neck, or total hip."
  },
  {
    q: "How is the Z-score calculated on a DEXA scan, and in which patient populations is it preferred?",
    a: "<b>Z-score Calculation:</b><br>The number of standard deviations (SD) a patient's bone mineral density deviates from the mean BMD of an <b>age-matched, sex-matched, and ethnicity-matched</b> reference population.<br><b>Target Populations:</b><ul><li><b>Premenopausal women</b></li><li><b>Men under age 50</b></li><li><b>Children and adolescents</b></li></ul>"
  },
  {
    q: "What Z-score threshold is considered below the expected range, and what is its clinical significance?",
    a: "<b>Abnormal Z-score:</b><br>A Z-score <b>&lt;= -2.0</b> is defined as 'below the expected range for age'.<br><b>Clinical Significance:</b> Strongly suggests a <b>secondary cause of osteoporosis</b> (e.g., hyperthyroidism, celiac disease, hyperparathyroidism, Cushing's) and requires a detailed diagnostic evaluation."
  },
  {
    q: "What are the screening recommendations for bone mineral density (BMD) testing in women?",
    a: "<b>DEXA Screen in Women:</b><ul><li>All women <b>age &gt;= 65</b> (regardless of clinical risk factors).</li><li>Postmenopausal women <b>under age 65</b> with clinical risk factors that place them at an increased risk of fracture (e.g., <b>FRAX 10-year risk &gt;= 9.3%</b>).</li></ul>"
  },
  {
    q: "What are the screening recommendations for bone mineral density (BMD) testing in men?",
    a: "<b>DEXA Screen in Men:</b><ul><li>All men <b>age &gt;= 70</b> (regardless of risk factors).</li><li>Men <b>aged 50 to 69</b> who have <b>clinical risk factors</b> for fracture (e.g., chronic glucocorticoid use, hypogonadism, history of fragility fracture).</li></ul>"
  },
  {
    q: "What three anatomic sites are standardly scanned during a routine dual-energy X-ray absorptiometry (DEXA) scan?",
    a: "<b>Standard DEXA Sites:</b><ol><li><b>Lumbar spine:</b> L1–L4.</li><li><b>Femoral neck:</b> Most predictive of hip fractures.</li><li><b>Total hip:</b> Useful for monitoring long-term therapy response.</li></ol>"
  },
  {
    q: "Why might a lumbar spine DEXA scan falsely overestimate bone mineral density (BMD) in older adults?",
    a: "<b>Lumbar Spine Artifacts:</b><br>Degenerative joint disease (spinal osteoarthritis), <b>osteophytes</b>, <b>facet joint hypertrophy</b>, <b>aortic calcifications</b>, and prior spine surgeries (e.g., kyphoplasty) add mineralized density to the scan field, causing a <b>falsely elevated T-score</b>."
  },
  {
    q: "Which specific anatomical site's bone mineral density (BMD) is the most predictive of hip fracture risk?",
    a: "<b>Best Hip Fracture Predictor:</b><br>The bone mineral density of the <b>femoral neck</b> is the single most reliable and predictive site for <b>hip fracture</b> risk."
  },
  {
    q: "Under what three clinical circumstances is the one-third (33%) distal radius measured on a DEXA scan?",
    a: "<b>One-Third Distal Radius Indications:</b><ol><li><b>Primary hyperparathyroidism:</b> Cortical bone is preferentially resorbed over trabecular bone by excess PTH, and the radius is predominantly cortical bone.</li><li><b>Unmeasurable primary sites:</b> Bilateral hip replacements, severe scoliosis, or extensive spinal hardware.</li><li>Patients who exceed the <b>DEXA table weight limit</b>.</li></ol>"
  },
  {
    q: "What does the FRAX tool calculate, and what are its target age ranges?",
    a: "<b>FRAX Tool:</b><br>A validated computer algorithm that calculates the <b>10-year probability</b> of:<ul><li><b>Major osteoporotic fracture</b> (hip, clinical spine, distal radius, or humerus)</li><li><b>Hip fracture</b> alone</li></ul><b>Target Population:</b> Untreated men and women <b>aged 40 to 90 years</b>."
  },
  {
    q: "Which clinical risk variables are input into the FRAX tool?",
    a: "<b>FRAX Input Variables:</b><ul><li><b>Age</b> and <b>Sex</b></li><li><b>Weight</b> and <b>Height</b></li><li>Prior personal <b>fragility fracture</b></li><li>Parent history of <b>hip fracture</b></li><li>Current <b>smoking</b> and <b>alcohol</b> (&gt;= 3 units/day)</li><li><b>Glucocorticoid use</b> (prednisone &gt;= 5 mg/day for &gt;= 3 months)</li><li><b>Rheumatoid arthritis</b></li><li>Other causes of <b>secondary osteoporosis</b></li><li>Femoral neck <b>BMD</b> (optional but highly predictive)</li></ul>"
  },
  {
    q: "What major clinical risk factor for fractures is notably NOT included in the FRAX algorithm?",
    a: "<b>Omitted FRAX Variable:</b><br><b>History of falls</b> (a critical predictor of future fractures, but excluded from the FRAX score due to lack of standardized data across cohorts)."
  },
  {
    q: "What T-score threshold on a DEXA scan warrants initiation of pharmacological osteoporosis therapy?",
    a: "<b>T-score Treatment Threshold:</b><br>A T-score <b>&lt;= -2.5</b> at the femoral neck, total hip, or lumbar spine, after excluding secondary causes."
  },
  {
    q: "For a patient with osteopenia (T-score -1.0 to -2.5), what FRAX score thresholds warrant starting pharmacological therapy?",
    a: "<b>Osteopenia + FRAX Thresholds:</b><br>Initiate pharmacotherapy in patients with osteopenia if the FRAX 10-year probability is:<ul><li><b>Hip fracture risk &gt;= 3%</b></li><li><b>Major osteoporotic fracture risk &gt;= 20%</b></li></ul>"
  },
  {
    q: "When is pharmacological osteoporosis therapy indicated regardless of T-score or FRAX results?",
    a: "<b>Fragility Fracture Indication:</b><br>Any postmenopausal woman or man aged 50 or older who has experienced a <b>fragility fracture</b> of the <b>hip</b> or <b>spine</b> (clinical or asymptomatic vertebral fracture)."
  },
  {
    q: "What is the clinical distinction between primary and secondary osteoporosis?",
    a: "<b>Primary vs. Secondary Osteoporosis:</b><br><b>Primary:</b> Age-related bone loss (<b>senile osteoporosis</b>) or accelerated bone loss post-menopause due to <b>estrogen deficiency</b>.<br><b>Secondary:</b> Bone loss caused by an <b>underlying medical disease</b>, nutritional deficiency, or <b>medication</b>."
  },
  {
    q: "What endocrine disorders are common causes of secondary osteoporosis?",
    a: "<b>Endocrine Causes of Osteoporosis:</b><ul><li><b>Primary hyperparathyroidism:</b> High PTH increases osteoclast bone resorption.</li><li><b>Hyperthyroidism:</b> Thyrotoxicosis increases bone turnover and shortens the remodeling cycle.</li><li><b>Cushing's syndrome:</b> Excess glucocorticoids inhibit osteoblasts and decrease calcium absorption.</li><li><b>Hypogonadism:</b> E.g., premature ovarian failure, Turner syndrome, or androgen deprivation therapy.</li></ul>"
  },
  {
    q: "Which gastrointestinal conditions are causes of secondary osteoporosis, and what is the mechanism?",
    a: "<b>Gastrointestinal Secondary Causes:</b><ul><li><b>Celiac disease:</b> Autoimmune enteropathy destroys duodenal villi, causing <b>malabsorption of calcium</b> and fat-soluble <b>vitamin D</b>.</li><li><b>Inflammatory bowel disease (IBD):</b> Chronic systemic inflammation and frequent <b>glucocorticoid use</b> impair bone formation.</li><li><b>Bariatric surgery (Gastric bypass):</b> Bypassing the duodenum prevents active <b>calcium absorption</b>.</li></ul>"
  },
  {
    q: "What rheumatologic condition is directly linked to secondary osteoporosis, and what is the pathophysiology?",
    a: "<b>Rheumatologic Secondary Cause:</b><br><b>Rheumatoid arthritis (RA)</b>.<br><b>Pathophysiology:</b> Systemic inflammatory cytokines (e.g., <b>TNF-alpha</b>, <b>IL-6</b>) upregulate <b>RANKL</b> expression, which stimulates osteoclasts. Chronic immobilization and glucocorticoid treatment further accelerate bone loss."
  },
  {
    q: "Which non-steroid medication classes are major causes of secondary osteoporosis?",
    a: "<b>Medication-Induced Bone Loss:</b><ul><li><b>Proton pump inhibitors (PPIs):</b> Reduce gastric acidity, impairing calcium carbonate absorption.</li><li><b>SSRIs:</b> Direct adverse effects on osteoblast viability.</li><li><b>Anticonvulsants</b> (e.g., phenytoin, carbamazepine): Induce cytochrome P450, accelerating <b>vitamin D metabolism</b>.</li><li><b>Aromatase inhibitors</b> (e.g., anastrozole): Deplete estrogen in breast cancer patients.</li><li><b>Androgen deprivation therapy (ADT)</b> (e.g., leuprolide): Depletes testosterone and estrogen in prostate cancer patients.</li></ul>"
  },
  {
    q: "What is the dose and duration threshold of glucocorticoid use that defines Glucocorticoid-Induced Osteoporosis (GIOP) risk?",
    a: "<b>GIOP Threshold:</b><br>Planned or actual oral prednisone dose of <b>&gt;= 5 mg/day</b> (or equivalent) for <b>&gt;= 3 months</b>."
  },
  {
    q: "What is the first-line pharmacotherapy and monitoring strategy for Glucocorticoid-Induced Osteoporosis (GIOP)?",
    a: "<b>GIOP Management:</b><br><b>Treatment:</b> Oral <b>bisphosphonates</b> (e.g., alendronate) or IV zoledronic acid, plus <b>calcium</b> and <b>vitamin D</b>.<br><b>Monitoring:</b> Repeat DEXA scan <b>every 12 months</b> as long as glucocorticoid therapy continues."
  },
  {
    q: "What is the recommended daily calcium intake for postmenopausal women and older men?",
    a: "<b>Recommended Daily Calcium Intake:</b><ul><li>Postmenopausal women <b>age &gt;= 51</b>: <b>1200 mg/day</b> (elemental calcium)</li><li>Men <b>age &gt;= 71</b>: <b>1200 mg/day</b></li><li>Men <b>age 50–70</b>: <b>1000 mg/day</b></li></ul>"
  },
  {
    q: "Contrast calcium carbonate and calcium citrate supplements.",
    a: "<b>Calcium Supplements:</b><br><b>Calcium Carbonate:</b> Contains 40% elemental calcium; requires <b>acidic gastric environment</b> for dissolution (must be taken <b>with food</b>; poorly absorbed if on PPIs).<br><b>Calcium Citrate:</b> Contains 21% elemental calcium; absorption is <b>acid-independent</b> (can be taken <b>with or without food</b>; preferred in elderly or patients on PPIs)."
  },
  {
    q: "What is the recommended daily vitamin D intake for adults aged 50 and older, and what is the target serum 25(OH)D level?",
    a: "<b>Vitamin D Supplementation:</b><br><b>Recommended Dose:</b> <b>800 to 1000 IU/day</b> of vitamin D3 (cholecalciferol).<br><b>Target Serum Level:</b> 25-hydroxyvitamin D <b>[25(OH)D] &gt;= 30 ng/mL</b> (75 nmol/L)."
  },
  {
    q: "Why is dietary calcium preferred over calcium supplements, and what is the risk of high-dose supplementation?",
    a: "<b>Dietary vs. Supplemental Calcium:</b><br><b>Dietary Calcium:</b> Highly bioavailable and does not cause transient spikes in serum calcium.<br><b>Supplement Risks:</b> High doses (especially &gt; 1200–1500 mg/day) increase the risk of <b>nephrolithiasis</b> (kidney stones) and are weakly linked to <b>cardiovascular calcification</b>."
  },
  {
    q: "What is the molecular mechanism of action of bisphosphonates?",
    a: "<b>Bisphosphonates Mechanism:</b><br>They bind to hydroxyapatite crystals in bone. During bone resorption, they are released and internalized by <b>osteoclasts</b>, where they inhibit <b>farnesyl pyrophosphate (FPP) synthase</b> (mevalonate pathway).<br><b>Result:</b> Inhibits cholesterol synthesis needed for prenylation of proteins, leading to osteoclast dysfunction and <b>apoptosis</b>."
  },
  {
    q: "What is the standard dosing and frequency for oral alendronate and risedronate for osteoporosis treatment?",
    a: "<b>Oral Bisphosphonate Regimen:</b><br><b>Alendronate:</b> <b>70 mg orally once weekly</b> (or 10 mg daily).<br><b>Risedronate:</b> <b>35 mg orally once weekly</b> (or 150 mg monthly)."
  },
  {
    q: "What is the dosing schedule of ibandronate, and what is its primary clinical trial limitation?",
    a: "<b>Ibandronate:</b><br><b>Dosing:</b> <b>150 mg orally monthly</b> or <b>3 mg IV every 3 months</b>.<br><b>Limitation:</b> Clinical trials show <b>ibandronate</b> reduces <b>vertebral fractures</b>, but it has <b>no proven efficacy in preventing hip fractures</b>."
  },
  {
    q: "What is the dose and dosing frequency of IV zoledronic acid for osteoporosis treatment?",
    a: "<b>Zoledronic Acid Dosing:</b><br><b>Dose:</b> <b>5 mg IV</b> infusion.<br><b>Frequency:</b> <b>Once annually</b> (for treatment) or <b>once every 2 years</b> (for prevention)."
  },
  {
    q: "What specific administration instructions must be given to patients taking oral bisphosphonates?",
    a: "<b>Oral Bisphosphonate Administration:</b><ol><li>Take first thing in the morning with a <b>full glass (8 oz) of plain water</b>.</li><li>Do not take with other beverages, food, or medications (must wait <b>at least 30 minutes</b>).</li><li>Remain completely <b>upright</b> (standing or sitting) for <b>at least 30 minutes</b> to prevent reflux.</li></ol>"
  },
  {
    q: "What are the primary gastrointestinal adverse effects and contraindications of oral bisphosphonates?",
    a: "<b>Oral Bisphosphonate GI Profile:</b><br><b>Adverse Effects:</b> Esophagitis, <b>esophageal ulceration</b>, and dyspepsia.<br><b>Contraindications:</b> <b>Esophageal motility disorders</b> (e.g., achalasia, strictures) or inability to <b>sit or stand upright for 30 minutes</b>."
  },
  {
    q: "What are the renal safety thresholds for alendronate, risedronate, and zoledronic acid?",
    a: "<b>Bisphosphonate Renal Thresholds:</b><br>Contraindicated in patients with:<br><b>Alendronate & Zoledronic Acid:</b> eGFR <b>&lt; 35 mL/min</b>.<br><b>Risedronate:</b> eGFR <b>&lt; 30 mL/min</b>."
  },
  {
    q: "What is the 'acute phase response' associated with IV zoledronic acid, and how is it prevented?",
    a: "<b>Acute Phase Response:</b><br>A transient flu-like syndrome (fever, myalgias, arthralgias, headache) occurring in ~30% of patients within 24–72 hours of their <b>first IV infusion</b>.<br><b>Prevention/Treatment:</b> Pre-medicate with <b>acetaminophen</b> or ibuprofen."
  },
  {
    q: "What is an atypical femoral fracture (AFF), and where does it typically occur?",
    a: "<b>Atypical Femoral Fracture (AFF):</b><br>A low-trauma stress fracture occurring in the femoral <b>subtrochanteric</b> region or <b>femoral shaft</b> (diaphysis) associated with long-term (usually <b>&gt;= 3–5 years</b>) antiresorptive therapy."
  },
  {
    q: "What prodromal symptom must be monitored in patients on long-term bisphosphonates to prevent a full atypical femoral fracture (AFF)?",
    a: "<b>AFF Prodrome:</b><br>New-onset, dull, aching <b>thigh or groin pain</b>. If present, obtain immediate <b>bilateral femur X-rays</b> to look for cortical thickening (beaking)."
  },
  {
    q: "What is osteonecrosis of the jaw (ONJ) in the context of antiresorptive therapy, and what are the main risk factors?",
    a: "<b>Osteonecrosis of the Jaw (ONJ):</b><br>Exposed bone in the maxillofacial region that does not heal within <b>8 weeks</b> in a patient exposed to bisphosphonates or denosumab.<br><b>Risk Factors:</b> Invasive dental procedures (e.g., <b>tooth extraction</b>, dental implants), poor oral hygiene, cancer (receiving high-dose IV oncology regimens), and long duration of therapy."
  },
  {
    q: "What is the clinical rationale for a bisphosphonate 'drug holiday'?",
    a: "<b>Drug Holiday Rationale:</b><br>Bisphosphonates bind tightly to bone and persist in the skeleton for years. Pausing therapy after accumulation allows bone turnover to recover slightly, reducing the risk of <b>atypical femoral fractures (AFF)</b> and <b>osteonecrosis of the jaw (ONJ)</b> while maintaining protection against fractures."
  },
  {
    q: "When should a drug holiday be considered for oral and IV bisphosphonates in moderate-risk patients?",
    a: "<b>Drug Holiday Timing:</b><ul><li><b>Oral Bisphosphonates (e.g., alendronate):</b> Consider holiday after <b>5 years</b> of continuous use.</li><li><b>IV Zoledronic Acid:</b> Consider holiday after <b>3 years</b> of annual infusions.</li></ul>"
  },
  {
    q: "Which osteoporosis patients are considered high risk and should NOT be offered a standard drug holiday?",
    a: "<b>High-Risk (No Holiday):</b><br>Continue therapy (up to 10 years for oral, 6 years for IV) if:<ul><li><b>T-score &lt; -2.5</b> at the femoral neck</li><li>Prior history of a <b>hip or spine fracture</b></li><li>High-risk patient who fractures during therapy</li></ul>"
  },
  {
    q: "How should a patient be monitored during a bisphosphonate drug holiday, and when is therapy restarted?",
    a: "<b>Holiday Monitoring:</b><br>Assess bone mineral density (DEXA) every <b>2 to 3 years</b>.<br><b>Restart Therapy:</b> If there is a <b>significant BMD decline</b>, a <b>new fragility fracture</b>, or if bone turnover markers (e.g., serum CTx) rise significantly."
  },
  {
    q: "What is the mechanism of action of denosumab?",
    a: "<b>Denosumab Mechanism:</b><br>A fully human monoclonal antibody that binds to <b>RANKL</b> (Receptor Activator of Nuclear Factor kappa-B Ligand).<br><b>Effect:</b> Prevents RANKL from activating <b>RANK</b> on the surface of osteoclast precursors and mature osteoclasts, leading to decreased osteoclast recruitment and survival."
  },
  {
    q: "What is the dosing, route, and frequency of denosumab for osteoporosis?",
    a: "<b>Denosumab Dosing:</b><br><b>Dose:</b> <b>60 mg</b><br><b>Route:</b> <b>Subcutaneous injection</b><br><b>Frequency:</b> Once <b>every 6 months</b>."
  },
  {
    q: "Why is denosumab preferred over bisphosphonates in patients with renal impairment, and what metabolic risk must be monitored?",
    a: "<b>Denosumab in Renal Impairment:</b><br><b>Renal Safety:</b> Denosumab is not cleared by the kidneys and is safe to use in patients with <b>CKD</b> (eGFR &lt; 30 mL/min).<br><b>Metabolic Risk:</b> High risk of severe <b>hypocalcemia</b>; check calcium and vitamin D levels before administration and supplement aggressively."
  },
  {
    q: "What is the critical risk associated with discontinuing or delaying denosumab therapy?",
    a: "<b>Denosumab Discontinuation Risk:</b><br>Denosumab's effects are reversible. Discontinuation leads to a rapid rebound in bone resorption, causing swift bone loss and a high risk of <b>multiple vertebral fractures</b> within 3–12 months of the missed dose."
  },
  {
    q: "How must the discontinuation of denosumab be managed to mitigate rebound fracture risk?",
    a: "<b>Denosumab Transition Strategy:</b><br>Never stop denosumab without immediately transitioning to another antiresorptive agent. An oral bisphosphonate (e.g., alendronate) or IV <b>zoledronic acid</b> must be administered <b>within 6 months</b> of the last denosumab dose."
  },
  {
    q: "What is the mechanism of action of teriparatide?",
    a: "<b>Teriparatide Mechanism:</b><br>Recombinant human parathyroid hormone analog (<b>PTH 1-34</b>). Intermittent (daily subcutaneous) administration preferentially stimulates <b>osteoblast</b> activity over osteoclasts, leading to an increase in bone mass and strength (<b>anabolic</b> effect)."
  },
  {
    q: "What is the dosing, route, and lifetime duration limit for teriparatide?",
    a: "<b>Teriparatide Dosing:</b><br><b>Dose:</b> <b>20 mcg</b><br><b>Route:</b> <b>Subcutaneous injection daily</b><br><b>Lifetime Limit:</b> Maximum of <b>2 years</b> (due to FDA warning regarding potential osteosarcoma risk)."
  },
  {
    q: "What are the major contraindications to teriparatide and abaloparatide therapy?",
    a: "<b>Contraindications to PTH Analogs:</b><ul><li>Increased risk of <b>osteosarcoma</b> (e.g., <b>Paget's disease of bone</b>, prior radiation to skeleton, open epiphyses)</li><li>Unexplained elevation of <b>alkaline phosphatase</b></li><li>Pre-existing <b>hypercalcemia</b> or primary hyperparathyroidism</li><li>Skeletal malignancies or bone metastases</li></ul>"
  },
  {
    q: "What is abaloparatide, and how does its dosing and duration compare to teriparatide?",
    a: "<b>Abaloparatide:</b><br><b>Class:</b> Synthetic analog of human <b>PTHrP 1-34</b>; osteoblast-stimulating <b>anabolic</b> agent.<br><b>Dosing:</b> <b>80 mcg subcutaneously daily</b>.<br><b>Duration:</b> Maximum lifetime duration of <b>2 years</b> (shares the same contraindications and osteosarcoma warnings as teriparatide)."
  },
  {
    q: "What is the mechanism of action of romosozumab?",
    a: "<b>Romosozumab Mechanism:</b><br>A humanized monoclonal antibody that binds and inhibits <b>sclerostin</b> (a protein that blocks the Wnt pathway in osteoblasts).<br><b>Dual Action:</b> Simultaneously increases bone formation (<b>anabolic</b>) and decreases bone resorption (<b>antiresorptive</b>)."
  },
  {
    q: "What is the dosing, route, and duration of romosozumab?",
    a: "<b>Romosozumab Regimen:</b><br><b>Dosing:</b> <b>210 mg</b> (given as two consecutive 105 mg subcutaneous injections).<br><b>Frequency:</b> <b>Monthly</b>.<br><b>Duration:</b> Limited to exactly <b>12 months</b> (anabolic effect wanes after 1 year)."
  },
  {
    q: "What cardiovascular boxed warning is associated with romosozumab?",
    a: "<b>Romosozumab Boxed Warning:</b><br>May increase the risk of <b>myocardial infarction (MI)</b>, <b>stroke</b>, and cardiovascular death.<br><b>Contraindication:</b> Do not initiate in patients who have had a <b>myocardial infarction or stroke within the past year</b>."
  },
  {
    q: "What is the recommended sequencing of therapies for patients with severe osteoporosis, and why?",
    a: "<b>Sequential Therapy:</b><br>Start with an <b>anabolic agent</b> (e.g., teriparatide, romosozumab) to build bone microarchitecture, followed immediately by an <b>antiresorptive agent</b> (e.g., bisphosphonates, denosumab).<br><b>Rationale:</b> This sequence achieves greater BMD gains. Starting with an antiresorptive first blunts the bone-building response of subsequent anabolic therapy."
  },
  {
    q: "How does prior bisphosphonate use affect the bone-building efficacy of teriparatide?",
    a: "<b>Bisphosphonate Blunting Effect:</b><br>Prior long-term use of <b>bisphosphonates</b> (especially alendronate) blunts the initial anabolic action of <b>teriparatide</b>, resulting in a delayed increase in bone mineral density."
  },
  {
    q: "What is Vertebral Fracture Assessment (VFA) on DEXA, and what is its clinical significance?",
    a: "<b>Vertebral Fracture Assessment (VFA):</b><br>A lateral spine scan performed on a DEXA machine with very low radiation to identify asymptomatic <b>vertebral compression fractures</b>.<br><b>Significance:</b> Finding a silent vertebral fracture confirms a diagnosis of <b>severe osteoporosis</b>, bypassing T-score criteria and indicating immediate pharmacotherapy."
  },
  {
    q: "What is the classic clinical presentation of an acute vertebral compression fracture?",
    a: "<b>Vertebral Compression Fracture Presentation:</b><ul><li>Acute onset of localized <b>back pain</b> following minor trauma (e.g., bending, coughing, or sneezing)</li><li>Pain is worse with <b>standing or sitting</b> and relieved by lying completely flat</li><li>Localized <b>spinous process tenderness</b> on palpation</li><li>Loss of height and progressive <b>kyphosis</b></li></ul>"
  },
  {
    q: "What are the key components of conservative management for an acute vertebral compression fracture?",
    a: "<b>Conservative Management:</b><ul><li><b>Pain control:</b> Acetaminophen, NSAIDs, or short-term oral opioids.</li><li><b>Nasal calcitonin:</b> Can be used for 2–4 weeks to reduce acute bone pain.</li><li><b>Early mobilization:</b> Avoid bed rest &gt; 24–48 hours to prevent further bone loss.</li><li>Physical therapy: Avoid spinal flexion/bending; focus on extension.</li></ul>"
  },
  {
    q: "What are the indications for kyphoplasty or vertebroplasty in patients with vertebral compression fractures?",
    a: "<b>Vertebral Augmentation Indications:</b><br>Indicated for patients with severe, debilitating pain from an acute vertebral compression fracture who have <b>failed conservative therapy</b> (usually after 2 to 4 weeks of optimization).<br><b>Procedure choice:</b> <b>Kyphoplasty</b> uses a balloon to restore height before cement injection; <b>vertebroplasty</b> injects cement directly."
  },
  {
    q: "Compare the anatomical location and complications of femoral neck vs. intertrochanteric hip fractures.",
    a: "<b>Hip Fracture Types:</b><br><b>Femoral Neck (Intracapsular):</b> Disruption of the ascending cervical branches of the <b>medial femoral circumflex artery</b>. High risk of <b>avascular necrosis (AVN)</b> and nonunion.<br><b>Intertrochanteric (Extracapsular):</b> Occurs outside the joint capsule; preserves blood supply (low AVN risk) but is highly vascular, posing a risk of <b>large hematoma and blood loss</b>."
  },
  {
    q: "Within what timeframe should hip fracture surgery ideally occur, and why?",
    a: "<b>Hip Fracture Surgical Timing:</b><br>Within <b>24 to 48 hours</b> of admission.<br><b>Benefits:</b> Reduces risk of <b>mortality</b>, <b>postoperative delirium</b>, <b>pressure ulcers</b>, deep vein thrombosis (DVT), and length of hospital stay."
  },
  {
    q: "What is the recommended duration and agents for VTE prophylaxis following hip fracture surgery?",
    a: "<b>VTE Prophylaxis:</b><br><b>Agents:</b> <b>LMWH</b> (preferred), low-dose aspirin, fondaparinux, or DOACs.<br><b>Duration:</b> Continue for <b>28 to 35 days</b> postoperatively."
  },
  {
    q: "What perioperative interventions are effective for preventing postoperative delirium in elderly hip fracture patients?",
    a: "<b>Delirium Prevention:</b><ul><li>Perform <b>regional nerve blocks</b> (e.g., fascia iliaca block) to minimize opioid use</li><li>Avoid <b>deliriogenic medications</b> (e.g., benzodiazepines, anticholinergic drugs)</li><li>Initiate <b>early mobilization</b> on postoperative day 1</li><li>Maintain sleep-wake cycles and provide orientation/sensory aids</li></ul>"
  },
  {
    q: "What is the 'orthogeriatric co-management' model, and why is it recommended for hip fracture patients?",
    a: "<b>Orthogeriatric Co-Management:</b><br>A shared care model where <b>geriatrics</b> and <b>orthopedic surgery</b> jointly manage patients from admission.<br><b>Impact:</b> Decreases inpatient complications, reduces time to surgery, optimizes chronic comorbidities, and ensures <b>secondary fracture prevention</b> is started before discharge."
  },
  {
    q: "What is the standard postoperative weight-bearing status for elderly patients after surgical repair of a hip fracture?",
    a: "<b>Postoperative Weight-Bearing:</b><br><b>Early weight-bearing as tolerated (WBAT)</b> starting on <b>postoperative day 1</b>.<br><b>Goal:</b> Minimizes deconditioning, atelectasis, DVT risk, and pressure ulcers."
  },
  {
    q: "Describe the components of the 'fall cascade' in elderly patients with osteoporosis.",
    a: "<b>The Fall Cascade:</b><br>A cycle of decline:<br><b>Osteoporosis + Fall</b> &rarr; <b>Fracture</b> &rarr; <b>Immobility</b> &rarr; <b>Muscle Atrophy / Deconditioning</b> &rarr; <b>Fear of Falling</b> &rarr; <b>Activity Restriction</b> &rarr; <b>Increased Fall Risk & loss of independence</b>."
  },
  {
    q: "What home environment modifications are most effective for fall prevention in osteoporotic patients?",
    a: "<b>Home Safety Modifications:</b><ul><li>Remove <b>throw rugs</b> and floor clutter.</li><li>Install <b>grab bars</b> and non-slip rubber mats in the tub/shower.</li><li>Improve <b>lighting</b> in hallways, staircases, and bedside.</li><li>Secure loose electrical wires.</li></ul>"
  },
  {
    q: "Which high-risk medication classes should be tapered or discontinued to reduce fall risk in older adults?",
    a: "<b>High-Risk Medications to Deprescribe:</b><ul><li><b>Benzodiazepines</b> and Z-drugs (cause sedation and ataxia)</li><li><b>Anticholinergics</b> (cause confusion and blurred vision)</li><li><b>Antihypertensives</b> (cause orthostatic hypotension)</li><li><b>SSRIs/SNRIs</b> (associated with falls and direct bone density loss)</li><li><b>Opioids</b> (cause drowsiness and gait instability)</li></ul>"
  },
  {
    q: "What physical exercise modalities are recommended for fall prevention and bone health?",
    a: "<b>Exercise Recommendations:</b><ul><li><b>Balance & Gait Training:</b> E.g., <b>Tai Chi</b> (reduces falls by 20–30%)</li><li><b>Resistance Training:</b> E.g., weighted exercises to strengthen the quadriceps and core</li><li><b>Weight-bearing aerobic exercise:</b> E.g., brisk walking to maintain bone mass</li></ul>"
  },
  {
    q: "How is orthostatic hypotension screened and defined in clinical practice?",
    a: "<b>Orthostatic Hypotension:</b><br>Measure blood pressure supine (or sitting) and then after standing for <b>3 minutes</b>.<br><b>Diagnostic Drop:</b> A decline of <b>&gt;= 20 mmHg</b> in systolic blood pressure OR <b>&gt;= 10 mmHg</b> in diastolic blood pressure."
  },
  {
    q: "What vision and footwear recommendations help prevent falls?",
    a: "<b>Vision & Footwear Interventions:</b><br><b>Vision:</b> Annual eye exams; <b>avoid multifocal/bifocal lenses</b> when walking outside or on uneven surfaces.<br><b>Footwear:</b> Wear <b>firm, low-heeled, slip-resistant shoes</b>; avoid walking in socks, floppy slippers, or barefoot."
  },
  {
    q: "What is the standard DEXA monitoring interval for patients on stable osteoporosis therapy?",
    a: "<b>Standard DEXA Interval:</b><br>Repeat DEXA <b>every 2 years</b>.<br><b>Rationale:</b> Changes in bone mineral density occur slowly; shorter intervals fail to exceed the <b>least significant change</b> of the scanner."
  },
  {
    q: "Under what circumstances is a 1-year DEXA monitoring interval indicated?",
    a: "<b>1-Year DEXA Indications:</b><ul><li>Patients on <b>anabolic therapy</b> (e.g., teriparatide, romosozumab) to assess rapid response.</li><li>Patients initiating <b>high-dose glucocorticoids</b>.</li><li>Patients with suspected <b>treatment failure</b> (defined as a significant decrease in BMD or recurrent fractures while adherent).</li></ul>"
  },
  {
    q: "By what pathophysiological mechanism does celiac disease lead to secondary osteoporosis?",
    a: "<b>Celiac Disease & Bone Loss:</b><br>Autoimmune enteropathy destroys duodenal villi, causing <b>malabsorption of calcium</b> and fat-soluble <b>vitamin D</b>.<br><b>Mechanism:</b> Low calcium levels lead to compensatory <b>secondary hyperparathyroidism</b>, which upregulates osteoclasts to resorb bone calcium."
  },
  {
    q: "Why does long-term PPI therapy increase the risk of osteoporosis and fractures?",
    a: "<b>PPI-Induced Bone Loss:</b><br>Proton pump inhibitors suppress gastric acid, raising gastric pH.<br><b>Mechanism:</b> Insoluble <b>calcium carbonate</b> requires acid to dissolve and absorb. Reduced absorption leads to secondary hyperparathyroidism and increased bone resorption. (Use <b>calcium citrate</b> if PPI therapy is required)."
  }
];

module.exports = cards_geri_osteoporosis;
