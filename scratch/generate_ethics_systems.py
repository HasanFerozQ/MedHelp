import os

# Define the 125 flashcards
cards = [
    # --- MEDICARE: General, Eligibility, Funding (Cards 1-40) ---
    {
        "q": "What is Medicare?",
        "a": "A federal health insurance program in the United States designed primarily for individuals aged <b>$\\\\ge 65$</b>, younger people with specific disabilities, and individuals with End-Stage Renal Disease (ESRD) or ALS."
    },
    {
        "q": "Which federal agency is responsible for administering the Medicare program?",
        "a": "The <b>Centers for Medicare & Medicaid Services (CMS)</b>, which is a division of the Department of Health and Human Services (HHS)."
    },
    {
        "q": "What is the age requirement for standard Medicare eligibility?",
        "a": "Individuals must be <b>$\\\\ge 65$ years old</b>, and they or their spouse must have paid Medicare taxes for at least 10 years (40 quarters) to receive premium-free Part A."
    },
    {
        "q": "Under what condition can an individual younger than 65 qualify for Medicare due to disability?",
        "a": "They must have received Social Security Disability Insurance (SSDI) benefits for at least <b>24 months</b>."
    },
    {
        "q": "What is the exception to the 24-month SSDI waiting period for Medicare eligibility in patients with ALS?",
        "a": "Patients diagnosed with <b>Amyotrophic Lateral Sclerosis (ALS)</b> are eligible for Medicare the first month they begin receiving SSDI benefits, with no waiting period."
    },
    {
        "q": "What is the Medicare eligibility criteria for patients with End-Stage Renal Disease (ESRD)?",
        "a": "Patients with ESRD who require dialysis or a kidney transplant qualify for Medicare <b>regardless of age</b>, usually starting the 4th month of dialysis."
    },
    {
        "q": "How is Medicare Part A (Hospital Insurance) primarily funded?",
        "a": "Primarily through a dedicated <b>payroll tax</b> under the Federal Insurance Contributions Act (FICA), which is $1.45\\\\%$ for both employers and employees ($2.9\\\\%$ total)."
    },
    {
        "q": "What is the Additional Medicare Tax introduced by the ACA, and how does it fund the program?",
        "a": "An additional <b>$0.9\\\\%$ payroll tax</b> on self-employment and wages above $200,000 for individuals ($250,000 for married couples), which goes toward the Medicare Hospital Insurance Trust Fund."
    },
    {
        "q": "How is Medicare Part B (Medical Insurance) funded?",
        "a": "Through a combination of <b>general federal tax revenues</b> (approximately $75\\\\%$) and monthly <b>beneficiary premiums</b> (approximately $25\\\\%$)."
    },
    {
        "q": "What are the four components of Medicare?",
        "a": "<b>Part A</b> (Hospital Insurance), <b>Part B</b> (Medical Insurance), <b>Part C</b> (Medicare Advantage), and <b>Part D</b> (Prescription Drug Coverage)."
    },
    {
        "q": "What type of care is covered under Medicare Part A?",
        "a": "<b>Inpatient hospital care</b>, skilled nursing facility (SNF) care, home health care, and hospice care."
    },
    {
        "q": "What type of care is covered under Medicare Part B?",
        "a": "<b>Outpatient services</b>, physician services, preventive care (screenings, wellness visits), durable medical equipment (DME), and limited home health care."
    },
    {
        "q": "What is Medicare Part C (Medicare Advantage)?",
        "a": "A program that allows beneficiaries to enroll in private health plans (like HMOs or PPOs) that contract with Medicare to provide all Part A and Part B benefits, and usually Part D."
    },
    {
        "q": "What is Medicare Part D?",
        "a": "A voluntary <b>prescription drug benefit</b> run by private insurance companies that are approved and subsidized by Medicare."
    },
    {
        "q": "Is Medicare Part A premium-free for everyone?",
        "a": "<b>No</b>. It is premium-free only for those who have paid Medicare taxes for <b>$\\\\ge 40$ quarters</b> (10 years). Those with fewer quarters must pay a monthly premium."
    },
    {
        "q": "How is the deductible for Medicare Part A hospital stays structured?",
        "a": "It is charged per <b>benefit period</b> (which starts the day of admission and ends after 60 consecutive days without inpatient hospital or SNF care), not per calendar year."
    },
    {
        "q": "How many inpatient hospital days does Medicare Part A cover per benefit period?",
        "a": "Up to <b>90 days</b> of inpatient care, plus an additional 60 <b>lifetime reserve days</b> which can be used once the 90 days are exhausted."
    },
    {
        "q": "What is the cost-sharing structure for inpatient hospital stays under Medicare Part A?",
        "a": "$0$ copay for days 1–60, a daily copay for days 61–90, and a higher daily copay for lifetime reserve days. The patient pays 100% of costs beyond that."
    },
    {
        "q": "Under what circumstances does Medicare Part A cover Skilled Nursing Facility (SNF) care?",
        "a": "The stay must follow a hospital stay of at least <b>3 consecutive days</b> (excluding discharge day) for a related condition, and must be for skilled rehabilitation or nursing."
    },
    {
        "q": "What is the maximum number of days of SNF care covered by Medicare Part A per benefit period?",
        "a": "Up to <b>100 days</b>, with $0$ coinsurance for days 1–20 and a daily copayment for days 21–100."
    },
    {
        "q": "Does Medicare Part A cover long-term custodial care (e.g., permanent nursing home residency)?",
        "a": "<b>No</b>. Medicare Part A only covers short-term skilled nursing care for rehabilitation, not custodial care or assistance with activities of daily living (ADLs)."
    },
    {
        "q": "Is Medicare Part B voluntary, and does it require a premium?",
        "a": "<b>Yes</b>. Part B is voluntary, though most seniors enroll, and it requires a <b>monthly premium</b> which is typically deducted from Social Security checks."
    },
    {
        "q": "What is the Income-Related Monthly Adjustment Amount (IRMAA) in Medicare?",
        "a": "An <b>extra surcharge</b> added to Medicare Part B and Part D premiums for beneficiaries with higher incomes (based on tax returns from two years prior)."
    },
    {
        "q": "What is the typical coinsurance rate for Medicare Part B services?",
        "a": "<b>$20\\\\%$</b> of the Medicare-approved amount, which the patient must pay out-of-pocket after meeting the annual Part B deductible."
    },
    {
        "q": "Does Medicare Part B cover routine preventive services?",
        "a": "<b>Yes</b>. Services like annual wellness visits, mammograms, colonoscopies, and cardiovascular screenings are covered at <b>$100\\\\%$</b> with no coinsurance or deductible."
    },
    {
        "q": "Under what condition does Medicare Part B cover outpatient prescription drugs?",
        "a": "Only if they are drugs that are not usually self-administered, such as <b>chemotherapy infusions</b>, immunosuppressive drugs after transplant, or drugs given in an outpatient clinic."
    },
    {
        "q": "Which vaccines are covered under Medicare Part B?",
        "a": "Vaccines for <b>influenza, pneumococcal disease, COVID-19</b>, and hepatitis B (for intermediate/high-risk patients) are covered under Part B."
    },
    {
        "q": "Which vaccines are covered under Medicare Part D instead of Part B?",
        "a": "Most other preventive vaccines, such as those for <b>shingles (zoster)</b> and <b>Tdap</b> (tetanus, diphtheria, pertussis), are covered under Medicare Part D."
    },
    {
        "q": "What is Medigap (Medicare Supplement Insurance)?",
        "a": "Private insurance policies sold to individuals with Original Medicare (Parts A and B) to help pay for out-of-pocket costs like copayments, coinsurance, and deductibles."
    },
    {
        "q": "Can an individual enrolled in Medicare Advantage (Part C) also buy a Medigap policy?",
        "a": "<b>No</b>. It is illegal for private insurance companies to sell a Medigap policy to anyone who is enrolled in a Medicare Advantage plan."
    },
    {
        "q": "How does Medicare Advantage (Part C) restrict provider choices compared to Original Medicare?",
        "a": "Original Medicare allows patients to see any provider in the US who accepts Medicare. Medicare Advantage plans typically restrict patients to a <b>network of providers</b> (HMO or PPO)."
    },
    {
        "q": "What was the 'donut hole' in Medicare Part D?",
        "a": "A temporary coverage gap where beneficiaries had to pay a higher percentage of prescription drug costs out-of-pocket after total spending reached a certain threshold."
    },
    {
        "q": "How did the Inflation Reduction Act of 2022 change insulin coverage under Medicare?",
        "a": "It capped the out-of-pocket cost of Medicare-covered insulin at <b>$35 per month</b>, with no deductible applying to the insulin."
    },
    {
        "q": "What major change does the Inflation Reduction Act of 2022 bring to Medicare Part D by 2025?",
        "a": "It caps total annual out-of-pocket prescription drug spending for Medicare beneficiaries at <b>$2,000</b>."
    },
    {
        "q": "Does Original Medicare cover routine dental, vision, or hearing services?",
        "a": "<b>No</b>. Original Medicare does not cover routine cleanings, dentures, eyeglasses, or hearing aids, although many Medicare Advantage (Part C) plans offer these as extra benefits."
    },
    {
        "q": "How is hospice care covered under Medicare?",
        "a": "Hospice care is covered under <b>Medicare Part A</b>. To qualify, a physician must certify that the patient has a life expectancy of <b>$\\\\text{< } 6$ months</b>, and the patient must waive curative treatments."
    },
    {
        "q": "What happens if a beneficiary fails to enroll in Medicare Part B when they first become eligible?",
        "a": "They face a <b>late enrollment penalty</b> of a $10\\\\%$ premium increase for each full 12-month period they could have had Part B but didn't, which is added to their monthly premium for life."
    },
    {
        "q": "What is a Medicare Administrative Contractor (MAC)?",
        "a": "A private health care insurer that has been awarded a geographic jurisdiction to process Medicare Part A and Part B medical claims for providers."
    },
    {
        "q": "What is a National Coverage Determination (NCD)?",
        "a": "A nationwide determination by CMS regarding whether Medicare will pay for a specific medical service, item, or technology based on clinical evidence."
    },
    {
        "q": "What is a Local Coverage Determination (LCD)?",
        "a": "A decision by a Medicare Administrative Contractor (MAC) regarding whether a service is reasonable and necessary and therefore covered within their specific region."
    },

    # --- MEDICAID: General, Eligibility, Funding, Administration (Cards 41-60) ---
    {
        "q": "What is Medicaid?",
        "a": "A joint <b>federal and state program</b> that provides health insurance coverage to low-income individuals, families, children, pregnant women, the elderly, and disabled individuals."
    },
    {
        "q": "How is Medicaid funded?",
        "a": "Medicaid is funded jointly by the <b>federal government and state governments</b>. The federal government matches state Medicaid spending based on the FMAP."
    },
    {
        "q": "What does FMAP stand for in the context of Medicaid funding?",
        "a": "<b>Federal Medical Assistance Percentage</b>, which is the percentage of a state's Medicaid program costs paid by the federal government (ranging from $50\\\\%$ to over $80\\\\%$ based on state per capita income)."
    },
    {
        "q": "Who is responsible for administering the Medicaid program?",
        "a": "<b>Individual states</b> administer the program. They establish their own eligibility standards, benefit packages, and provider payment rates within broad federal guidelines."
    },
    {
        "q": "What mandatory eligibility groups must all states cover under Medicaid?",
        "a": "Low-income families, pregnant women, children up to age 19, recipients of Supplemental Security Income (SSI), and low-income elderly individuals."
    },
    {
        "q": "What is the federal minimum income threshold for Medicaid coverage of pregnant women?",
        "a": "States must cover pregnant women with household incomes up to at least <b>$133\\\\%$</b> of the Federal Poverty Level (FPL) (though many states choose to cover higher income levels)."
    },
    {
        "q": "Under recent federal legislation, how long can states extend postpartum Medicaid coverage?",
        "a": "States have the option to extend postpartum Medicaid coverage from the mandatory 60 days to <b>12 months</b>."
    },
    {
        "q": "What is the Children's Health Insurance Program (CHIP)?",
        "a": "A joint federal-state program that provides health insurance to children in families with incomes too high to qualify for Medicaid but too low to afford private coverage."
    },
    {
        "q": "How did the Affordable Care Act (ACA) seek to change Medicaid eligibility?",
        "a": "It established a nationwide expansion of Medicaid eligibility to nearly all adults with incomes up to <b>$138\\\\%$</b> of the Federal Poverty Level (FPL)."
    },
    {
        "q": "What was the outcome of the 2012 Supreme Court ruling in NFIB v. Sebelius regarding Medicaid expansion?",
        "a": "The Supreme Court ruled that the federal government could not penalize states that chose not to expand Medicaid, effectively making the ACA expansion <b>optional for states</b>."
    },
    {
        "q": "What does the term 'dual eligible' mean?",
        "a": "It refers to individuals who qualify for <b>both Medicare and Medicaid</b> (often low-income seniors or disabled individuals) and receive benefits from both programs."
    },
    {
        "q": "In a dual-eligible beneficiary, which insurance program pays first for medical services?",
        "a": "<b>Medicare</b> is the primary payer for Medicare-covered services; <b>Medicaid</b> is the secondary payer (payer of last resort), covering deductibles, coinsurance, and non-Medicare services."
    },
    {
        "q": "Does Medicaid cover long-term custodial nursing home care?",
        "a": "<b>Yes</b>. Medicaid is the <b>largest single payer</b> of long-term nursing home care in the United States, covering individuals who meet both clinical and financial eligibility criteria."
    },
    {
        "q": "What is the Medicaid 'spend-down' process?",
        "a": "A process by which individuals with incomes higher than Medicaid limits can qualify by subtracting their medical expenses from their income until it reaches the state's Medicaid threshold."
    },
    {
        "q": "What is the Medicaid 'look-back period' for long-term care eligibility?",
        "a": "A <b>5-year (60-month)</b> period prior to applying for Medicaid during which any assets transferred or sold for less than fair market value are scrutinized, which can trigger a penalty period."
    },
    {
        "q": "What are mandatory Medicaid benefits that every state must provide?",
        "a": "Inpatient and outpatient hospital services, physician services, laboratory and X-ray services, family planning services, and home health services."
    },
    {
        "q": "What are examples of optional Medicaid benefits that states may choose to cover?",
        "a": "Prescription drugs, dental care, physical therapy, vision care, and prosthetic devices. (Note: all states currently cover prescription drugs)."
    },
    {
        "q": "Can states charge copayments or premiums to Medicaid beneficiaries?",
        "a": "<b>Yes</b>, but they must be nominal, and certain populations (e.g., children, pregnant women) and services (e.g., emergency care) are exempt from cost-sharing under federal law."
    },
    {
        "q": "What is a Section 1115 Medicaid Demonstration Waiver?",
        "a": "A waiver granted by the federal government (CMS) that allows states to test pilot projects that differ from standard federal Medicaid rules (e.g., work requirements or unique benefit designs)."
    },
    {
        "q": "What is the Medicaid Estate Recovery Program?",
        "a": "A federally mandated program requiring states to recover the costs of long-term care services paid by Medicaid from the estate of deceased beneficiaries aged 55 or older."
    },

    # --- HEALTH INSURANCE PLANS: HMO, PPO, EPO, POS, etc. (Cards 61-90) ---
    {
        "q": "What is an HMO (Health Maintenance Organization)?",
        "a": "A managed care plan that requires members to receive care from a specific network of providers, designate a primary care provider (PCP), and obtain PCP referrals to see specialists."
    },
    {
        "q": "What does it mean for a Primary Care Physician (PCP) to act as a 'gatekeeper' in an HMO?",
        "a": "The PCP manages the patient's overall care and must authorize <b>referrals</b> for any specialist visits or diagnostic procedures for them to be covered by the insurance."
    },
    {
        "q": "Does an HMO cover out-of-network care?",
        "a": "<b>No</b>, except in the case of emergency medical services; all routine out-of-network care must be paid entirely by the patient."
    },
    {
        "q": "What are the primary cost-control mechanisms used by HMO plans?",
        "a": "Strict provider networks, utilization reviews, PCP gatekeeping, and paying providers via <b>capitation</b> or discounted fee schedules."
    },
    {
        "q": "What is a PPO (Preferred Provider Organization)?",
        "a": "A health plan that offers a network of preferred providers but allows members to see out-of-network doctors and see specialists without a referral, at a higher cost."
    },
    {
        "q": "Are referrals required to see a specialist under a PPO plan?",
        "a": "<b>No</b>. Patients enrolled in a PPO do not need referrals to see specialists and are not required to designate a primary care physician."
    },
    {
        "q": "Does a PPO plan cover out-of-network care?",
        "a": "<b>Yes</b>, but the patient is responsible for higher cost-sharing (e.g., higher deductibles and coinsurance) than when using in-network providers."
    },
    {
        "q": "Why are PPO premiums typically higher than HMO premiums?",
        "a": "Because PPOs offer <b>greater flexibility</b> and choice of providers, which reduces the insurer's ability to negotiate steep discounts and manage utilization."
    },
    {
        "q": "What is an EPO (Exclusive Provider Organization)?",
        "a": "A managed care plan where members must use <b>in-network providers only</b> (like an HMO) but do <b>not</b> need a PCP gatekeeper or referrals to see specialists (like a PPO)."
    },
    {
        "q": "What happens if a patient in an EPO sees an out-of-network specialist for routine care?",
        "a": "The insurance plan will <b>not cover</b> the services, and the patient must pay the entire cost out-of-pocket."
    },
    {
        "q": "What is a POS (Point of Service) plan?",
        "a": "A hybrid plan where patients choose a PCP gatekeeper for in-network care, but can see out-of-network providers if they obtain a PCP referral (with higher out-of-pocket costs)."
    },
    {
        "q": "What is the primary difference between POS and HMO plans?",
        "a": "Both require a PCP gatekeeper and referrals, but a <b>POS plan allows out-of-network care</b> with a referral, whereas an HMO does not allow out-of-network care at all."
    },
    {
        "q": "Which health insurance plan types require a primary care physician gatekeeper?",
        "a": "<b>HMO</b> and <b>POS</b> plans require a gatekeeper; <b>PPO</b> and <b>EPO</b> plans do not."
    },
    {
        "q": "Which health insurance plan types offer out-of-network coverage for routine care?",
        "a": "<b>PPO</b> (no referral needed) and <b>POS</b> (referral from PCP required) plans offer out-of-network coverage; <b>HMO</b> and <b>EPO</b> do not."
    },
    {
        "q": "What is a High-Deductible Health Plan (HDHP)?",
        "a": "A plan with lower premiums but higher annual deductibles ($1,650 for individuals / $3,300 for families minimum in 2024). It is the only plan type that can be paired with an HSA."
    },
    {
        "q": "What is a Health Savings Account (HSA)?",
        "a": "A tax-advantaged savings account owned by an individual to pay for qualified medical expenses using pre-tax contributions. It requires enrollment in an HDHP."
    },
    {
        "q": "What happens to unused funds in a Health Savings Account (HSA) at the end of the year?",
        "a": "The funds <b>roll over</b> indefinitely from year to year; there is no 'use-it-or-lose-it' rule, and the account stays with the individual if they change jobs."
    },
    {
        "q": "What is a Flexible Spending Account (FSA)?",
        "a": "An employer-established account where employees contribute pre-tax dollars for medical expenses. Unused funds are generally <b>subject to a 'use-it-or-lose-it'</b> rule at the end of the plan year."
    },
    {
        "q": "In health insurance, what is a 'premium'?",
        "a": "The amount paid (usually monthly) to the health insurance company by the individual or employer to keep the insurance policy active."
    },
    {
        "q": "In health insurance, what is a 'deductible'?",
        "a": "The fixed dollar amount a patient must pay out-of-pocket for covered medical services before the insurance plan begins to pay."
    },
    {
        "q": "In health insurance, what is a 'copayment'?",
        "a": "A flat, pre-determined fee (e.g., $25) that a patient pays at the time of service for a specific medical event, such as a doctor's visit or prescription refill."
    },
    {
        "q": "In health insurance, what is 'coinsurance'?",
        "a": "The percentage of a medical bill (e.g., $20\\\\%$) that the patient pays after meeting their deductible, with the insurance company paying the remaining percentage."
    },
    {
        "q": "What is the 'Out-of-Pocket Maximum' (OOPM) in a health insurance plan?",
        "a": "The most a patient will pay for covered services in a plan year; after reaching this limit, the insurance plan pays $100\\\\%$ of all covered costs."
    },
    {
        "q": "What is 'prior authorization'?",
        "a": "A requirement by health plans where a provider must obtain approval from the insurer before performing a procedure or prescribing a drug for it to be covered."
    },
    {
        "q": "What is 'utilization review'?",
        "a": "A process where the health plan evaluates the clinical necessity, appropriateness, and efficiency of proposed healthcare services and procedures."
    },
    {
        "q": "What is a health insurance 'formulary'?",
        "a": "A list of prescription drugs covered by a health insurance plan, usually divided into cost-sharing tiers (generic, brand name, specialty)."
    },
    {
        "q": "What is 'step therapy' (also known as the 'fail-first' requirement)?",
        "a": "A policy where an insurer requires a patient to try cheaper or standard medications first (and fail to respond) before they will cover a more expensive drug."
    },
    {
        "q": "What is 'balance billing'?",
        "a": "When a provider bills a patient for the difference between the provider's charge and the insurance company's allowed payment (often occurring with out-of-network care)."
    },
    {
        "q": "What is the primary purpose of the federal No Surprises Act?",
        "a": "To protect patients from <b>surprise medical bills</b> arising from emergency care or out-of-network services received at in-network facilities."
    },
    {
        "q": "What is a Third-Party Administrator (TPA)?",
        "a": "An organization that processes insurance claims and administers employee benefit plans on behalf of a self-insured employer."
    },

    # --- REIMBURSEMENT MODELS (Cards 91-110) ---
    {
        "q": "What is the Fee-for-Service (FFS) reimbursement model?",
        "a": "A payment model where healthcare providers are paid separately for <b>each service, procedure, test, or visit</b> they render."
    },
    {
        "q": "What provider behavior does the Fee-for-Service model encourage?",
        "a": "It encourages <b>over-utilization</b> and volume-driven care, as providers generate more revenue by performing more services."
    },
    {
        "q": "In a Fee-for-Service model, who bears the financial risk of high healthcare utilization?",
        "a": "The <b>insurer</b> (or the employer/government program funding the care), since they must pay for every service billed."
    },
    {
        "q": "What is the Capitation reimbursement model?",
        "a": "A payment model where a provider is paid a <b>fixed amount per patient per period</b> (e.g., monthly) to deliver all necessary care, regardless of the volume of services used."
    },
    {
        "q": "In a capitated payment model, who bears the financial risk of high healthcare utilization?",
        "a": "The <b>healthcare provider</b>, because if patients require costly services, the provider's expenses will exceed the fixed capitated payments."
    },
    {
        "q": "What provider behavior does the Capitation model encourage?",
        "a": "It encourages <b>under-utilization</b> of services, cost-efficiency, and a focus on preventive care to keep patients healthy and reduce expensive treatments."
    },
    {
        "q": "What is a 'bundled payment' (episode-based payment) model?",
        "a": "A reimbursement model where a single, consolidated payment covers <b>all services</b> related to a specific episode of care (e.g., a total hip replacement surgery and rehab)."
    },
    {
        "q": "What is the primary goal of the bundled payment model?",
        "a": "To encourage <b>coordination among different providers</b> (surgeons, hospitals, post-acute care) and reduce redundant tests and complications."
    },
    {
        "q": "What is a 'global payment' (or global budgeting) model?",
        "a": "A reimbursement model where a single fixed payment covers <b>all healthcare services</b> provided to a patient or population over a specific period (e.g., a hospital's annual operating budget)."
    },
    {
        "q": "What is an Accountable Care Organization (ACO)?",
        "a": "A voluntary group of doctors, hospitals, and other providers who collaborate to coordinate care for Medicare patients and share in financial savings."
    },
    {
        "q": "What is the 'Shared Savings' mechanism in an ACO?",
        "a": "An incentive program where providers who meet quality benchmarks and reduce overall healthcare spending compared to a benchmark receive a percentage of the savings."
    },
    {
        "q": "What is the difference between 'one-sided' and 'two-sided' risk in ACOs?",
        "a": "In <b>one-sided risk</b>, providers share in savings but face no penalty if spending increases; in <b>two-sided risk</b>, they must pay penalties if spending exceeds targets."
    },
    {
        "q": "What is the Pay-for-Performance (P4P) reimbursement model?",
        "a": "A reimbursement model that ties provider payments or bonuses directly to <b>quality metrics and outcomes</b> (e.g., readmission rates, HbA1c control, patient satisfaction)."
    },
    {
        "q": "What is a Relative Value Unit (RVU) in physician reimbursement?",
        "a": "A standard measure used to determine physician compensation based on <b>physician work</b>, <b>practice expenses</b>, and <b>malpractice insurance costs</b>."
    },
    {
        "q": "What is the Resource-Based Relative Value Scale (RBRVS)?",
        "a": "The system used by Medicare to calculate payments to physicians by multiplying the total <b>RVUs</b> by geographic and national conversion factors."
    },
    {
        "q": "What is a Diagnosis-Related Group (DRG) in hospital billing?",
        "a": "A classification system that groups inpatient stays based on diagnosis and pays the hospital a <b>fixed amount</b> per stay, regardless of actual resources consumed."
    },
    {
        "q": "How does a DRG payment model affect a hospital's management of inpatient stay length?",
        "a": "It encourages hospitals to <b>minimize the length of stay</b> and prevent complications, as they receive the same fixed payment regardless of how long the patient occupies a bed."
    },
    {
        "q": "What is the Medicare Hospital Readmissions Reduction Program (HRRP)?",
        "a": "A program that penalizes hospitals with higher-than-expected <b>30-day readmission rates</b> for specific conditions (e.g., heart failure, COPD) by reducing their Medicare payments."
    },
    {
        "q": "What is the Hospital Value-Based Purchasing (VBP) Program?",
        "a": "A CMS program that adjusts a portion of hospital payments based on quality of care, safety, efficiency, and patient experience scores."
    },
    {
        "q": "What is 'reference pricing'?",
        "a": "A model where an employer or insurer sets a maximum price they will pay for a standard service, and the patient pays the difference if they choose a more expensive provider."
    },

    # --- KEY FEDERAL LAWS: EMTALA, COBRA, etc. (Cards 111-125) ---
    {
        "q": "What is EMTALA?",
        "a": "The <b>Emergency Medical Treatment and Active Labor Act</b>, a federal law requiring Medicare-participating hospitals to screen and stabilize anyone seeking emergency care."
    },
    {
        "q": "Does EMTALA apply to all hospitals in the United States?",
        "a": "It applies specifically to all hospitals that accept Medicare funding and operate an <b>emergency department</b>."
    },
    {
        "q": "What is a Medical Screening Examination (MSE) under EMTALA?",
        "a": "A screening process performed by a qualified medical professional to determine if an <b>emergency medical condition (EMC)</b> or active labor exists."
    },
    {
        "q": "Under EMTALA, what constitutes an Emergency Medical Condition (EMC)?",
        "a": "An acute condition with symptoms of sufficient severity (such as severe pain) where lack of immediate medical attention could seriously jeopardize health or bodily function."
    },
    {
        "q": "What is the definition of 'stabilized' under EMTALA?",
        "a": "That no material clinical deterioration of the patient's condition is likely, within reasonable medical probability, to result from or occur during transfer."
    },
    {
        "q": "Can a hospital transfer an unstable patient to another facility under EMTALA?",
        "a": "Only if the patient requests the transfer in writing after being informed of the risks, or if a physician certifies that the <b>medical benefits of transfer outweigh the risks</b>."
    },
    {
        "q": "What is 'patient dumping' under EMTALA?",
        "a": "The illegal practice of transferring or refusing to treat an unstable patient because of their inability to pay or lack of health insurance."
    },
    {
        "q": "What are the penalties for a hospital that violates EMTALA regulations?",
        "a": "Civil monetary fines per violation and potential <b>termination of the hospital's Medicare provider agreement</b>."
    },
    {
        "q": "What does COBRA stand for, and what is its primary purpose?",
        "a": "<b>Consolidated Omnibus Budget Reconciliation Act</b>. It allows workers and their families to temporarily continue their employer's group health insurance after job loss."
    },
    {
        "q": "What are common 'qualifying events' that make an individual eligible for COBRA?",
        "a": "Voluntary or involuntary job loss, reduction in work hours, divorce or legal separation from the covered employee, or death of the covered employee."
    },
    {
        "q": "Who is responsible for paying the premiums for COBRA coverage?",
        "a": "The <b>individual</b> is responsible for the entire premium (both the employee and former employer shares) plus a $2\\\\%$ administrative fee, up to <b>$102\\\\%$</b> of the plan cost."
    },
    {
        "q": "What is the typical maximum duration of COBRA coverage following job loss?",
        "a": "Up to <b>18 months</b>. (Certain events like divorce or death of the covered employee can extend coverage up to 36 months)."
    },
    {
        "q": "Which employers are legally required to offer COBRA continuation coverage?",
        "a": "Employers in the private sector with <b>$\\\\ge 20$ employees</b> who offer a group health plan."
    },
    {
        "q": "How long is the election period for an eligible individual to choose COBRA coverage?",
        "a": "At least <b>60 days</b> from the date of the qualifying event or the date they receive notice of eligibility, whichever is later."
    },
    {
        "q": "Does COBRA coverage apply retroactively once elected?",
        "a": "<b>Yes</b>. If elected within the 60-day window, COBRA coverage is <b>retroactive</b> to the date of the qualifying event, preventing any gap in coverage."
    }
]

# Write to file
target_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\cards_ethics_systems.js"

content = "const CARDS_ETHICS_SYSTEMS = [\n"
for c in cards:
    # Escape quotes inside question and answer
    q_escaped = c["q"].replace('"', '\\"')
    a_escaped = c["a"].replace('"', '\\"')
    content += f'{{ q: "{q_escaped}", a: "{a_escaped}" }},\n'
content += "];\n"

with open(target_path, "w", encoding="utf-8") as f:
    f.write(content)

print(f"Successfully wrote {len(cards)} cards to {target_path}")
