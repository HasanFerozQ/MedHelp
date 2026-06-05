# -*- coding: utf-8 -*-
import os
import json

# Define the list of 130 flashcards
cards = [
    # 1. Medicare Overview & Eligibility
    {
        "q": "What is Medicare?",
        "a": "A <b>federally funded and administered</b> social insurance program providing health coverage primarily to seniors and certain disabled individuals."
    },
    {
        "q": "What is the primary age-based eligibility threshold for Medicare?",
        "a": "Individuals aged <b>65 or older</b> who are US citizens or permanent residents (for at least 5 years)."
    },
    {
        "q": "Under what condition is an individual under 65 eligible for Medicare based on disability?",
        "a": "After receiving Social Security Disability Insurance (SSDI) benefits for <b>24 months</b>."
    },
    {
        "q": "What condition allows immediate Medicare eligibility at the time SSDI begins, waiving the 24-month waiting period?",
        "a": "<b>Amyotrophic Lateral Sclerosis (ALS)</b> (Lou Gehrig's disease)."
    },
    {
        "q": "What kidney-related condition makes an individual eligible for Medicare regardless of age?",
        "a": "<b>End-Stage Renal Disease (ESRD)</b> requiring maintenance dialysis or a kidney transplant."
    },
    {
        "q": "How is Medicare Part A primarily funded?",
        "a": r"Through a <b>2.9% Federal Insurance Contributions Act (FICA) payroll tax</b>, split equally between employers and employees (i.e., $\\\\text{Employer} = 1.45\\\\%$ and $\\\\text{Employee} = 1.45\\\\%$, totaling $2.9\\\\%$)."
    },
    {
        "q": "What is the income threshold for the additional 0.9% Medicare tax under the ACA for single filers?",
        "a": r"An additional $0.9\\\\%$ Medicare tax (totaling $2.35\\\\%$) is levied on earned income exceeding $\\\\text{Income} > \\\\$200,000$."
    },
    {
        "q": "How is Medicare Part B primarily funded?",
        "a": "A combination of <b>general federal revenues (about 75%)</b> and <b>beneficiary monthly premiums (about 25%)</b>."
    },
    {
        "q": "What is Medicare Part A?",
        "a": "<b>Inpatient Hospital Insurance</b>, covering hospital stays, skilled nursing facility care, hospice care, and some home health care."
    },
    {
        "q": "What is Medicare Part B?",
        "a": "<b>Supplementary Medical Insurance</b>, covering outpatient services, physician visits, preventive care, and durable medical equipment (DME)."
    },
    {
        "q": "What is Medicare Part C?",
        "a": "<b>Medicare Advantage</b>, which allows beneficiaries to enroll in private health plans (like HMOs or PPOs) that receive capitated payments from CMS to provide Parts A and B coverage."
    },
    {
        "q": "What is Medicare Part D?",
        "a": "A voluntary <b>Prescription Drug Benefit</b> delivered through private insurance companies approved by Medicare."
    },
    {
        "q": "What is the work-credit requirement to qualify for premium-free Medicare Part A?",
        "a": "The beneficiary or their spouse must have worked and paid Medicare taxes for at least <b>40 quarters (10 years)</b>."
    },
    {
        "q": "What is the penalty for late enrollment in Medicare Part B?",
        "a": "The monthly premium increases by <b>10% for each full 12-month period</b> the beneficiary delayed enrollment, unless they had qualifying employer coverage."
    },
    {
        "q": "What is the penalty for late enrollment in Medicare Part D?",
        "a": "A lifetime penalty of <b>1% of the national base beneficiary premium</b> for every month the beneficiary went without Part D or other creditable coverage."
    },
    {
        "q": "What is 'creditable prescription drug coverage' in the context of Medicare?",
        "a": "Prescription coverage (e.g., from an employer or union) that is expected to pay, on average, <b>at least as much</b> as Medicare's standard prescription drug coverage."
    },
    {
        "q": "What are 'dual-eligible' beneficiaries?",
        "a": "Low-income individuals who qualify for <b>both Medicare and Medicaid</b>, with Medicaid covering some or all of their Medicare out-of-pocket costs."
    },
    {
        "q": "What is a 'Medigap' policy?",
        "a": "Private insurance policies sold to individuals with Original Medicare (Parts A & B) to help pay for <b>out-of-pocket costs</b> like copayments, coinsurance, and deductibles."
    },
    {
        "q": "Can a Medicare beneficiary have both a Medicare Advantage (Part C) plan and a Medigap policy?",
        "a": "<b>No</b>, it is illegal for private insurance companies to sell a Medigap policy to anyone enrolled in a Medicare Advantage plan."
    },
    {
        "q": "Which federal trust fund pays for Medicare Part A benefits?",
        "a": "The **Hospital Insurance (HI) Trust Fund**."
    },
    {
        "q": "Which federal agency administers the Medicare and Medicaid programs?",
        "a": "The <b>Centers for Medicare & Medicaid Services (CMS)</b>, under the Department of Health and Human Services (HHS)."
    },

    # 2. Medicare Part A (Inpatient)
    {
        "q": "What is the definition of a 'benefit period' (spell of illness) under Medicare Part A?",
        "a": "It begins the day a beneficiary is admitted as an inpatient to a hospital or SNF and ends when they have not received inpatient hospital or SNF care for <b>60 consecutive days</b>."
    },
    {
        "q": "Is there a limit to the number of benefit periods a Medicare Part A beneficiary can have?",
        "a": "<b>No</b>, there is no limit; a new benefit period begins and a new deductible applies after 60 consecutive days without inpatient care."
    },
    {
        "q": "How is the inpatient hospital deductible in Medicare Part A applied?",
        "a": "It is applied <b>per benefit period</b>, not per calendar year."
    },
    {
        "q": "How many days of inpatient hospital care does Medicare Part A cover in a single benefit period before using lifetime reserve days?",
        "a": "Up to <b>90 days</b> (days 1-60 are fully covered after the deductible; days 61-90 require a daily copayment)."
    },
    {
        "q": "What are 'lifetime reserve days' in Medicare Part A hospital coverage?",
        "a": "An extra <b>60 days</b> of inpatient hospital coverage that a beneficiary can use once in their lifetime after exceeding 90 days in a benefit period, requiring a high daily copayment."
    },
    {
        "q": "Under Medicare Part A, what is the maximum lifetime limit for inpatient care in a psychiatric hospital?",
        "a": "A lifetime limit of <b>190 days</b>."
    },
    {
        "q": "What is the prior hospital stay requirement for Medicare Part A to cover care in a Skilled Nursing Facility (SNF)?",
        "a": "A medically necessary inpatient hospital stay of at least <b>3 consecutive days</b> (not counting the day of discharge)."
    },
    {
        "q": "Within what timeframe after hospital discharge must a patient be admitted to a SNF to qualify for Medicare Part A coverage?",
        "a": "Usually within <b>30 days</b> of leaving the hospital."
    },
    {
        "q": "What is the maximum number of days Medicare Part A will cover skilled nursing facility (SNF) care per benefit period?",
        "a": "Up to <b>100 days</b> (days 1-20 are fully covered; days 21-100 require a daily copayment)."
    },
    {
        "q": "Does Medicare Part A cover long-term custodial care (such as help with dressing, bathing, or eating)?",
        "a": "<b>No</b>, Medicare does not cover custodial care if that is the only care the patient needs."
    },
    {
        "q": "What are the eligibility requirements for a Medicare beneficiary to receive hospice care under Part A?",
        "a": "A physician must certify that the patient is terminally ill with a life expectancy of <b>6 months or less</b>, and the patient must choose hospice care instead of curative care."
    },
    {
        "q": "If a Medicare patient enters hospice care, what happens to their coverage for curative treatments for their terminal illness?",
        "a": "They <b>forfeit</b> Medicare coverage for curative treatments, though Medicare still covers treatments for unrelated conditions."
    },
    {
        "q": "What is 'respite care' in the context of Medicare hospice benefits?",
        "a": "Short-term inpatient care (up to <b>5 consecutive days</b> at a time) provided to a hospice patient to give their primary caregiver a rest."
    },
    {
        "q": "Under Medicare Part A, what are the requirements for home health care coverage?",
        "a": "The patient must be <b>homebound</b>, require intermittent skilled nursing or therapy, and have a care plan established and reviewed by a physician."
    },
    {
        "q": "What is the 'first 3 pints' rule under Medicare Part A and B?",
        "a": "The beneficiary is responsible for either paying for or replacing the <b>first 3 pints of blood</b> used in a calendar year (unless donated)."
    },
    {
        "q": "How many consecutive days must a beneficiary be free of inpatient hospital/SNF care to reset the benefit period under Medicare Part A?",
        "a": "<b>60 consecutive days</b>."
    },

    # 3. Medicare Part B (Outpatient)
    {
        "q": "What does Medicare Part B cover?",
        "a": "Outpatient services, physician visits, preventive services, medical supplies (like DME), and limited home health care."
    },
    {
        "q": "What determines the base monthly premium that a Medicare Part B beneficiary pays?",
        "a": "It is set annually by CMS, but high-income beneficiaries pay an additional surcharge (IRMAA) based on their **modified adjusted gross income (MAGI)** from 2 years prior."
    },
    {
        "q": "Which preventive service is offered to Medicare Part B beneficiaries within their first 12 months of enrollment?",
        "a": "The <b>'Welcome to Medicare' preventive visit</b> (a one-time baseline review of health, risk factors, and education)."
    },
    {
        "q": "What is the Medicare Part B Annual Wellness Visit?",
        "a": "An annual visit covered with $0 copay/deductible to develop or update a <b>personalized prevention plan</b>, distinct from a comprehensive physical exam."
    },
    {
        "q": "What is the standard beneficiary coinsurance rate for most Medicare Part B covered outpatient services after meeting the annual deductible?",
        "a": r"<b>20%</b> of the Medicare-approved amount (represented as $\\\\text{Coinsurance} = 20\\\\%$)."
    },
    {
        "q": "What is a 'participating provider' in Medicare Part B?",
        "a": "A clinician who signs an agreement to accept <b>assignment</b> (meaning they accept the Medicare-approved amount as full payment for all covered services)."
    },
    {
        "q": "What is a 'non-participating provider' in Medicare Part B who has not opted out?",
        "a": "A clinician who can choose on a case-by-case basis whether to accept assignment, but is subject to a <b>limiting charge</b>."
    },
    {
        "q": "What is the 'limiting charge' for non-participating providers who do not accept assignment on a Medicare claim?",
        "a": "The provider cannot charge the patient more than <b>15% above</b> the Medicare-approved amount for non-participating providers (which is itself 95% of the participating provider rate)."
    },
    {
        "q": "What is the result if a clinician 'opts out' of Medicare entirely?",
        "a": "They enter private contracts with Medicare patients, charging whatever they agree upon; <b>no Medicare reimbursement</b> is paid to either the clinician or the patient."
    },
    {
        "q": "What is Durable Medical Equipment (DME) under Medicare Part B?",
        "a": "Equipment that can withstand repeated use, is primarily used for a medical reason, and is appropriate for use in the home (e.g., wheelchairs, oxygen concentrators)."
    },
    {
        "q": "What chiropractic services are covered under Medicare Part B?",
        "a": "Only manual manipulation of the spine to correct a <b>subluxation</b>; routine physical exams, X-rays, or other services ordered by a chiropractor are not covered."
    },
    {
        "q": "What are the eligibility criteria for a screening abdominal aortic aneurysm (AAA) ultrasound under Medicare Part B?",
        "a": "A one-time screening for beneficiaries at risk: either a <b>family history of AAA</b>, or a <b>man aged 65-75 who has smoked at least 100 cigarettes</b> in his lifetime."
    },
    {
        "q": "Under what circumstances does Medicare Part B cover outpatient prescription drugs?",
        "a": "Only for drugs that are <b>not usually self-administered</b> and are given in an outpatient setting (e.g., IV chemotherapy, immunosuppressives post-transplant, or drugs infused via DME)."
    },
    {
        "q": "What is the Income-Related Monthly Adjustment Amount (IRMAA)?",
        "a": "An <b>extra fee</b> added to Part B and Part D premiums for beneficiaries with modified adjusted gross incomes above a certain threshold."
    },
    {
        "q": "Name three examples of preventive services covered at 100% (no copay or deductible) under Medicare Part B.",
        "a": "<b>1. Mammograms</b> (annual screening)<br><b>2. Colonoscopies</b> (screening)<br><b>3. Annual Wellness Visits</b>"
    },
    {
        "q": "Does Medicare Part B cover outpatient mental health services like psychotherapy?",
        "a": "<b>Yes</b>, Medicare Part B covers outpatient mental health services, usually subject to the standard 20% coinsurance after the deductible."
    },
    {
        "q": "What routine personal care services are excluded from Original Medicare (Parts A & B)?",
        "a": "Routine <b>dental care</b> (cleanings, fillings), **vision care** (eye exams, glasses), and **hearing aids**."
    },
    {
        "q": "Which major vaccines are covered under Medicare Part B without cost-sharing?",
        "a": "<b>Influenza, pneumococcal, COVID-19, and Hepatitis B</b> (for medium-to-high risk patients; other vaccines are covered under Part D)."
    },

    # 4. Medicare Part C (Medicare Advantage) & Part D (Prescription Drugs)
    {
        "q": "How is Medicare Part C (Medicare Advantage) delivered to beneficiaries?",
        "a": "Through <b>private health insurance companies</b> approved by Medicare, which receive capitated payments from the federal government."
    },
    {
        "q": "How does a Medicare Advantage (Part C) plan limit a beneficiary's financial risk compared to Original Medicare?",
        "a": "It is required to have a yearly <b>out-of-pocket maximum limit</b> on cost-sharing for Parts A and B services."
    },
    {
        "q": "How is Medicare Part D delivered to beneficiaries?",
        "a": "Through <b>private health plans</b>, either as stand-alone Prescription Drug Plans (PDPs) or integrated Medicare Advantage Prescription Drug (MA-PD) plans."
    },
    {
        "q": "In Medicare Part D, what is the 'Initial Coverage Limit' (ICL)?",
        "a": "The threshold of total drug costs (paid by both the beneficiary and the plan) after which the beneficiary enters the <b>Coverage Gap ('donut hole')</b>."
    },
    {
        "q": "Historically, what was the 'donut hole' in Medicare Part D?",
        "a": "A coverage gap where the beneficiary was responsible for <b>100% of their drug costs</b> after the initial coverage limit until reaching catastrophic coverage."
    },
    {
        "q": "How did the Affordable Care Act (ACA) modify the Medicare Part D coverage gap ('donut hole') cost-sharing?",
        "a": "It closed the gap by lowering the beneficiary's coinsurance for both brand-name and generic drugs in the coverage gap to <b>25%</b>."
    },
    {
        "q": "What change did the Inflation Reduction Act of 2022 introduce to Part D catastrophic coverage starting in 2024?",
        "a": "It <b>eliminated the 5% coinsurance</b> requirement for beneficiaries in the catastrophic phase, making drugs $0 out-of-pocket after reaching that threshold."
    },
    {
        "q": "What is a drug 'formulary' in Medicare Part D?",
        "a": "A list of prescription drugs covered by the plan, organized into <b>tiers</b> that determine the patient's copayment or coinsurance."
    },
    {
        "q": "What is a 'formulary exception' in Medicare Part D?",
        "a": "A request by a prescriber to get coverage for a drug not on the plan's formulary, or to obtain a non-preferred drug at a lower cost-sharing tier."
    },
    {
        "q": "What is the Medication Therapy Management (MTM) program under Medicare Part D?",
        "a": "A free service for high-risk beneficiaries taking multiple medications for chronic conditions to review their drugs and optimize therapy outcomes."
    },
    {
        "q": "How do provider networks in Medicare Part C (Advantage) plans differ from Original Medicare?",
        "a": "Original Medicare allows patients to see any provider that accepts Medicare nationwide, whereas Part C plans typically restrict patients to a local <b>network of providers</b> (HMO/PPO)."
    },
    {
        "q": "What monthly cost-sharing cap did the Inflation Reduction Act place on insulin for Medicare Part D beneficiaries?",
        "a": "Insulin copayments are capped at <b>\$35 per month</b> per covered formulation, with no deductible applying to insulin."
    },

    # 5. Medicaid
    {
        "q": "What is Medicaid?",
        "a": "A joint <b>federal and state-funded</b> program that provides health insurance to low-income individuals, families, pregnant women, and people with disabilities."
    },
    {
        "q": "How is Medicaid funding structured between the federal and state governments?",
        "a": "It is an <b>open-ended matching program</b> where the federal government matches state spending based on the state's FMAP."
    },
    {
        "q": "What is the Federal Medical Assistance Percentage (FMAP)?",
        "a": "The percentage of Medicaid program costs paid by the federal government, ranging from a statutory minimum of <b>50% to a maximum of 83%</b> based on state per capita income."
    },
    {
        "q": "Which low-income group is a mandatory eligibility category that all states must cover under Medicaid?",
        "a": "<b>Pregnant women and children</b> up to certain income thresholds, low-income parents, and individuals receiving Supplemental Security Income (SSI)."
    },
    {
        "q": "Under the Affordable Care Act (ACA), what is the eligibility threshold for states that choose to expand Medicaid?",
        "a": "Individuals with incomes up to <b>138% of the Federal Poverty Level (FPL)</b>, including childless adults."
    },
    {
        "q": "What are 'mandatory benefits' that every state Medicaid program must cover?",
        "a": "Services like inpatient/outpatient hospital care, <b>EPSDT</b> for children, family planning services, and nursing facility services for adults."
    },
    {
        "q": "Give examples of 'optional benefits' that states may choose to cover under Medicaid but are not federally required to.",
        "a": "<b>Prescription drugs</b>, dental care, physical therapy, optometry services, and prosthetic devices (though all states currently cover prescription drugs)."
    },
    {
        "q": "What does EPSDT stand for in Medicaid, and what is its purpose?",
        "a": "<b>Early and Periodic Screening, Diagnostic, and Treatment</b>; a mandatory comprehensive preventive health program for children under 21."
    },
    {
        "q": "What is the 'Medicaid spend-down' process?",
        "a": "A pathway for 'medically needy' individuals who have income too high for Medicaid to qualify by subtracting their <b>incurred medical expenses</b> from their income."
    },
    {
        "q": "What is the Medicaid Estate Recovery Program?",
        "a": "A federally mandated program requiring states to seek recovery of costs for **long-term care and related services** from the estate of deceased Medicaid beneficiaries aged 55 or older."
    },
    {
        "q": "What is the Children's Health Insurance Program (CHIP)?",
        "a": "A program that provides health insurance to children in families with incomes <b>too high to qualify for Medicaid</b> but who cannot afford private coverage."
    },
    {
        "q": "How does the funding structure of CHIP differ from Medicaid?",
        "a": "CHIP is funded via a **capped federal block grant** with a higher federal matching rate than Medicaid, whereas Medicaid is an open-ended entitlement."
    },
    {
        "q": "What is 'presumptive eligibility' in Medicaid?",
        "a": "A policy allowing qualified entities (like hospitals or clinics) to immediately enroll pregnant women or children in Medicaid based on **preliminary income information** while their formal application is processed."
    },
    {
        "q": "What is 'crowd-out' in health policy?",
        "a": "The phenomenon where expansion of a public insurance program (like Medicaid/CHIP) leads individuals to **drop their private employer-sponsored coverage** in favor of the free/cheaper public option."
    },

    # 6. Health Insurance Plans
    {
        "q": "What is a Health Maintenance Organization (HMO)?",
        "a": "A managed care plan that requires members to use a network of doctors and hospitals and mandates a **Primary Care Physician (PCP) gatekeeper** for all specialist care."
    },
    {
        "q": "What happens if an HMO member receives non-emergency care out-of-network?",
        "a": "The plan **will not cover** the cost; the member is responsible for 100% of the bill."
    },
    {
        "q": "What is the role of a 'gatekeeper' in managed care plans like HMOs?",
        "a": "A Primary Care Physician (PCP) who coordinates all care and must write a **referral** before the patient can see a specialist."
    },
    {
        "q": "What is a Preferred Provider Organization (PPO)?",
        "a": "A plan that offers a network of preferred providers but allows members to seek care **out-of-network without a referral**, though at a higher out-of-pocket cost."
    },
    {
        "q": "Does a PPO require a gatekeeper PCP or referrals for specialists?",
        "a": "<b>No</b>; members can see any specialist, in or out of network, without a referral."
    },
    {
        "q": "What is an Exclusive Provider Organization (EPO)?",
        "a": "A plan that restricts coverage to **in-network providers only** (like an HMO) but **does not require referrals** or a PCP gatekeeper to see in-network specialists."
    },
    {
        "q": "What is a Point of Service (POS) plan?",
        "a": "A hybrid plan that requires a **gatekeeper PCP** for in-network care, but allows members to go **out-of-network** if they obtain a referral (with higher cost-sharing)."
    },
    {
        "q": "What is a High Deductible Health Plan (HDHP)?",
        "a": "A health plan with a higher deductible than traditional plans, which must meet federal guidelines to allow the enrollee to open a **Health Savings Account (HSA)**."
    },
    {
        "q": "What is a Health Savings Account (HSA)?",
        "a": "A tax-advantaged savings account owned by an individual enrolled in an HDHP, used to pay for qualified medical expenses with **funds that roll over year-to-year**."
    },
    {
        "q": "What is the 'triple tax advantage' of a Health Savings Account (HSA)?",
        "a": "1. Contributions are **tax-deductible**.<br>2. Growth/earnings are **tax-free**.<br>3. Withdrawals for qualified medical expenses are **tax-free**."
    },
    {
        "q": "How does a Flexible Spending Account (FSA) differ from an HSA regarding year-end funds?",
        "a": "An FSA has a **'use-it-or-lose-it'** rule where unused funds generally expire at the end of the plan year, unlike HSA funds which roll over indefinitely."
    },
    {
        "q": "What is 'prior authorization' (precertification)?",
        "a": "A requirement by health plans that a clinician must obtain **approval from the insurer** before performing a specific procedure or prescribing a drug to ensure it is medically necessary."
    },
    {
        "q": "What is 'step therapy' (also known as the 'fail-first' requirement)?",
        "a": "An insurance policy requiring patients to try and fail on a **less expensive or generic drug** before the insurer will approve coverage for a more expensive brand-name drug."
    },
    {
        "q": "What is an 'out-of-pocket maximum' (or out-of-pocket limit)?",
        "a": "The maximum amount a beneficiary will pay for covered services in a plan year; once reached, the plan pays **100% of covered benefits** for the rest of the year."
    },
    {
        "q": "In health insurance, how does a deductible differ from a copayment?",
        "a": "A **deductible** is the total amount paid out-of-pocket before insurance coverage kicks in; a **copayment** is a fixed fee paid for a specific service after or during the deductible phase."
    },
    {
        "q": "What is the difference between health insurance in-network vs. out-of-network providers?",
        "a": "<b>In-network</b> providers have contracted with the insurer for discounted rates; **out-of-network** providers have no contract, leading to higher or no coverage and potential balance billing."
    },

    # 7. Reimbursement Models
    {
        "q": "What is 'capitation' in physician reimbursement?",
        "a": "A payment model where a provider is paid a **fixed amount per patient** assigned to them per unit of time (e.g., per month), regardless of whether the patient seeks care or how many services are provided."
    },
    {
        "q": "What is the financial incentive for a physician under a pure capitation model?",
        "a": "To focus on **preventive care and efficiency**, with a potential risk of **underutilization** of resources (doing less for patients to save money)."
    },
    {
        "q": "What is 'Fee-for-Service' (FFS) reimbursement?",
        "a": "A payment model where healthcare providers are paid for **each specific service** rendered (e.g., office visit, test, or procedure)."
    },
    {
        "q": "What is the primary drawback of Fee-for-Service (FFS) reimbursement?",
        "a": "It incentivizes **overutilization** of services (volume over value), driving up healthcare costs."
    },
    {
        "q": "What are 'bundled payments' (episode-based payments)?",
        "a": "A single fixed payment made to providers for **all services** associated with a single defined episode of care (e.g., a total hip replacement and subsequent rehabilitation)."
    },
    {
        "q": "What is the primary clinical incentive of bundled payments?",
        "a": "It encourages **care coordination** and efficiency among multiple providers (e.g., surgeons, hospitals, physical therapists) to minimize complications and keep costs below the bundle target."
    },
    {
        "q": "What is a 'global payment' system?",
        "a": "A reimbursement model where a single fixed payment covers **all care** provided to a patient or population for a specified period (e.g., a hospital's annual global budget)."
    },
    {
        "q": "What is the Resource-Based Relative Value Scale (RBRVS)?",
        "a": "A schema used by Medicare and other insurers to determine physician payments based on the **relative resource costs** of providing services."
    },
    {
        "q": "What are the three components of a Relative Value Unit (RVU) under the RBRVS?",
        "a": "1. **Physician work** (time, skill, effort).<br>2. **Practice expense** (rent, equipment, staff).<br>3. **Malpractice insurance expense**."
    },
    {
        "q": "What is a Diagnosis-Related Group (DRG)?",
        "a": "A classification system that groups inpatient hospital cases with similar clinical characteristics and resource needs, used to make a single **flat prospective payment** to the hospital per admission."
    },
    {
        "q": "If a hospital treats a patient for a DRG-classified illness and spends less than the flat DRG payment, what happens to the remaining funds?",
        "a": "The hospital **keeps the difference** as profit, incentivizing efficient care and early discharge."
    },
    {
        "q": "If a hospital spends more on a patient's care than the assigned DRG payment, who covers the excess cost?",
        "a": "The **hospital absorbs the loss**, except in rare cases that qualify for an 'outlier' payment."
    },
    {
        "q": "What is 'Pay-for-Performance' (P4P) in healthcare?",
        "a": "A value-based reimbursement model that offers **financial incentives or penalties** to providers based on their performance on specified quality metrics (e.g., readmission rates, patient satisfaction)."
    },
    {
        "q": "What is an Accountable Care Organization (ACO)?",
        "a": "A network of doctors, hospitals, and other providers who voluntarily band together to give coordinated high-quality care to Medicare patients, sharing in **financial savings** if they meet quality and cost-reduction targets."
    },
    {
        "q": "What are the two pathways for physician payment under MACRA's Quality Payment Program?",
        "a": "1. **MIPS** (Merit-based Incentive Payment System).<br>2. **APMs** (Advanced Alternative Payment Models)."
    },
    {
        "q": "What is the Merit-based Incentive Payment System (MIPS)?",
        "a": "A performance-adjusted payment program where physicians receive bonuses or penalties based on scores in four categories: **Quality, Cost, Promoting Interoperability, and Improvement Activities**."
    },

    # 8. Key Federal Laws: EMTALA & COBRA
    {
        "q": "What does EMTALA stand for?",
        "a": "<b>Emergency Medical Treatment and Active Labor Act</b> (passed in 1986)."
    },
    {
        "q": "What is the primary mandate of EMTALA for Medicare-participating hospitals?",
        "a": "They must provide a **Medical Screening Examination (MSE)** to anyone who comes to the emergency department requesting care, regardless of their ability to pay or insurance status."
    },
    {
        "q": "If a medical emergency or active labor is identified during an EMTALA screening, what must the hospital do?",
        "a": "They must **stabilize** the medical condition or arrange for an **appropriate transfer** to another facility."
    },
    {
        "q": "Under EMTALA, what does 'stabilize' mean for an emergency medical condition?",
        "a": "To provide medical treatment necessary to assure, within reasonable medical probability, that **no material deterioration** of the condition is likely to result from or occur during transfer or discharge."
    },
    {
        "q": "When can an unstable patient be transferred to another hospital under EMTALA?",
        "a": "Only if the patient/representative makes a **written request** for transfer, or a physician certifies in writing that the **medical benefits of transfer outweigh the risks**."
    },
    {
        "q": "What requirements must be met for an EMTALA-compliant transfer of an unstable patient?",
        "a": "The transferring hospital must stabilize as much as possible, the **receiving hospital must agree to accept the transfer**, medical records must be sent, and the transfer must occur using **appropriate personnel and equipment**."
    },
    {
        "q": "Can a hospital delay an EMTALA medical screening exam to inquire about a patient's insurance status or payment method?",
        "a": "<b>No</b>; hospitals may not delay screening or stabilization to ask about insurance or payment."
    },
    {
        "q": "What does COBRA stand for?",
        "a": "<b>Consolidated Omnibus Budget Reconciliation Act</b> (passed in 1985)."
    },
    {
        "q": "What is the primary function of COBRA health benefits?",
        "a": "It allows employees and their dependents to **temporarily continue group health coverage** after a qualifying event that would otherwise cause them to lose coverage (like job loss)."
    },
    {
        "q": "Which employers are subject to COBRA regulations?",
        "a": "Private-sector employers with **20 or more employees** on more than 50% of their typical business days in the previous calendar year."
    },
    {
        "q": "Who pays the premium for COBRA coverage?",
        "a": "The **beneficiary** pays the full premium (both the employer and employee portions) plus up to a **2% administrative fee**."
    },
    {
        "q": "What is the standard maximum duration of COBRA coverage after job termination or reduction of hours?",
        "a": "Up to <b>18 months</b>."
    },
    {
        "q": "Under what qualifying events can COBRA coverage be extended up to 36 months?",
        "a": "Events such as the **death of the covered employee**, **divorce or legal separation**, or a **dependent child losing status** as a dependent."
    },
    {
        "q": "How long is the election period for an eligible beneficiary to choose COBRA coverage?",
        "a": "At least **60 days** from the date of the qualifying event or the date the COBRA election notice is provided, whichever is later."
    },
    {
        "q": "What does EMTALA define as 'active labor' (in the context of unstable transfer)?",
        "a": "Labor where there is **inadequate time** to effect a safe transfer to another hospital before delivery, or transfer poses a **threat to the health or safety** of the woman or unborn child."
    },
    {
        "q": "What is a 'qualifying event' under COBRA?",
        "a": "An event (like voluntary/involuntary job termination, reduction in hours, divorce, or death of the employee) that results in a **loss of group health coverage**."
    },
    {
        "q": "What is the maximum monetary penalty (fine) per violation that a hospital can face under EMTALA?",
        "a": r"Hospitals can be fined up to approximately $\\\\text{Fine} \\\\approx \\\\$120,000$ per violation (adjusted annually for inflation) and risk termination of their Medicare provider agreement."
    }
]

# Validation
print(f"Total cards defined: {len(cards)}")
assert len(cards) == 130, f"Expected exactly 130 cards, got {len(cards)}"

# Check for duplicate questions
seen_questions = set()
for c in cards:
    q = c["q"].strip().lower()
    if q in seen_questions:
        print(f"WARNING: Duplicate question found: '{c['q']}'")
    seen_questions.add(q)

# Write to file
target_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\cards_ethics_systems.js"
print(f"Writing cards to {target_path}...")

with open(target_path, "w", encoding="utf-8") as f:
    f.write("const CARDS_ETHICS_SYSTEMS = [\n")
    for i, c in enumerate(cards):
        # Escape quotes in q and a
        q_escaped = c["q"].replace('"', '\\"')
        a_escaped = c["a"].replace('"', '\\"')
        
        # Write format: { q: "...", a: "..." },
        line = f'  {{ q: "{q_escaped}", a: "{a_escaped}" }}'
        if i < len(cards) - 1:
            line += ","
        f.write(line + "\n")
    f.write("];\n")

print("Done!")
