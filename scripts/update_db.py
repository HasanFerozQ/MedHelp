import os
import time
import requests
from supabase import create_client, Client

# ─────────────────────────────────────────────────────────────────────────────
# CARC codes – CMS Claim Adjustment Reason Codes (updated quarterly ~300 codes)
# Source: https://www.cms.gov/medicare (X12 controlled code set)
# ─────────────────────────────────────────────────────────────────────────────
CARC_CODES = [
    ("CO-1","Deductible Amount","2024-01-01"),("CO-2","Coinsurance Amount","2024-01-01"),
    ("CO-3","Co-payment Amount","2024-01-01"),("CO-4","The procedure code is inconsistent with the modifier used or a required modifier is missing.","2024-01-01"),
    ("CO-5","The procedure code/bill type is inconsistent with the place of service.","2024-01-01"),
    ("CO-6","The procedure/revenue code is inconsistent with the patient's age.","2024-01-01"),
    ("CO-7","The procedure/revenue code is inconsistent with the patient's gender.","2024-01-01"),
    ("CO-8","The procedure code is inconsistent with the provider type/specialty (taxonomy).","2024-01-01"),
    ("CO-9","The diagnosis is inconsistent with the patient's age.","2024-01-01"),
    ("CO-10","The diagnosis is inconsistent with the patient's gender.","2024-01-01"),
    ("CO-11","The diagnosis is inconsistent with the procedure.","2024-01-01"),
    ("CO-12","The diagnosis is inconsistent with the provider type.","2024-01-01"),
    ("CO-13","The date of death precedes the date of service.","2024-01-01"),
    ("CO-14","The date of birth follows the date of service.","2024-01-01"),
    ("CO-15","The authorization number is missing, invalid, or does not apply to the billed services or provider.","2024-01-01"),
    ("CO-16","Claim/service lacks information or has submission/billing error(s).","2024-01-01"),
    ("CO-18","Exact duplicate claim/service (plan procedures not met).","2024-01-01"),
    ("CO-19","This is a work-related injury/illness and thus the liability of the Worker's Compensation Carrier.","2024-01-01"),
    ("CO-20","This injury/illness is covered by the liability carrier.","2024-01-01"),
    ("CO-21","This injury/illness is the liability of the no-fault carrier.","2024-01-01"),
    ("CO-22","This care may be covered by another payer per coordination of benefits.","2024-01-01"),
    ("CO-23","The impact of prior payer(s) adjudication including payments and/or adjustments.","2024-01-01"),
    ("CO-24","Charges are covered under a capitation agreement/managed care plan.","2024-01-01"),
    ("CO-26","Expenses incurred prior to coverage.","2024-01-01"),
    ("CO-27","Expenses incurred after coverage terminated.","2024-01-01"),
    ("CO-29","The time limit for filing has expired.","2024-01-01"),
    ("CO-31","Patient cannot be identified as our insured.","2024-01-01"),
    ("CO-32","Our records indicate that this dependent is not an eligible dependent as defined.","2024-01-01"),
    ("CO-33","Insured has no dependent coverage.","2024-01-01"),
    ("CO-34","Insured has no coverage for newborns.","2024-01-01"),
    ("CO-35","Lifetime benefit maximum has been reached.","2024-01-01"),
    ("CO-39","Services denied at the time authorization/pre-certification was requested.","2024-01-01"),
    ("CO-40","Charges do not meet qualifications for emergent/urgent care.","2024-01-01"),
    ("CO-44","Prompt-pay discount.","2024-01-01"),
    ("CO-45","Charge exceeds fee schedule/maximum allowable or contracted/legislated fee arrangement.","2024-01-01"),
    ("CO-49","This is a non-covered service because it is a routine/preventive exam or a diagnostic/screening procedure done in conjunction with a routine/preventive exam.","2024-01-01"),
    ("CO-50","These are non-covered services because this is not deemed a 'medical necessity' by the payer.","2024-01-01"),
    ("CO-51","These are non-covered services because this is a pre-existing condition.","2024-01-01"),
    ("CO-53","Services by an immediate relative or a member of the same household are not covered.","2024-01-01"),
    ("CO-55","Procedure/treatment is deemed experimental/investigational by the payer.","2024-01-01"),
    ("CO-56","Procedure/treatment has not been deemed 'safe and effective' by the payer.","2024-01-01"),
    ("CO-57","This procedure/service is not covered when performed with, or subsequent to, the procedure/service previously billed.","2024-01-01"),
    ("CO-58","Treatment was deemed by the payer to have been rendered in an inappropriate or invalid place of service.","2024-01-01"),
    ("CO-59","Processed based on multiple or concurrent procedure rules.","2024-01-01"),
    ("CO-60","Charges for outpatient services are not covered when performed within a period of time prior to or after inpatient services.","2024-01-01"),
    ("CO-61","Penalty for failure to obtain second surgical opinion.","2024-01-01"),
    ("CO-62","Payment denied/reduced for absence of, or exceeded, precertification/authorization.","2024-01-01"),
    ("CO-63","Correction to a prior claim.","2024-01-01"),
    ("CO-65","Procedure code was incorrect. This payment reflects the correct code.","2024-01-01"),
    ("CO-66","Blood Deductible.","2024-01-01"),
    ("CO-69","Day outlier amount.","2024-01-01"),
    ("CO-70","Cost outlier - Reimbursement in excess of outlier threshold.","2024-01-01"),
    ("CO-74","Indirect Medical Education Adjustment.","2024-01-01"),
    ("CO-75","Direct Medical Education Adjustment.","2024-01-01"),
    ("CO-76","Disproportionate Share Adjustment.","2024-01-01"),
    ("CO-78","Non-Covered days/Room and Board/Ancillaries.","2024-01-01"),
    ("CO-85","Patient Interest Adjustment (Use Only Group Code PR).","2024-01-01"),
    ("CO-87","Transfer amount.","2024-01-01"),
    ("CO-89","Professional fees removed from institutional claim.","2024-01-01"),
    ("CO-90","Emergency services not covered when provided out of network.","2024-01-01"),
    ("CO-91","Lab procedures with different dates of service bundled into the same bill.","2024-01-01"),
    ("CO-94","Processed in Excess of charges.","2024-01-01"),
    ("CO-95","Plan procedures not followed.","2024-01-01"),
    ("CO-96","Non-covered charge(s).","2024-01-01"),
    ("CO-97","The benefit for this service is included in the payment/allowance for another service/procedure that has already been adjudicated.","2024-01-01"),
    ("CO-100","Payment made to patient/insured/responsible party/employer.","2024-01-01"),
    ("CO-101","Predetermination: anticipated payment upon completion of services or claim adjudication.","2024-01-01"),
    ("CO-102","Major Medical Adjustment.","2024-01-01"),
    ("CO-103","Provider promotional discount (e.g. Senior citizen discount).","2024-01-01"),
    ("CO-104","Managed care withholding.","2024-01-01"),
    ("CO-105","Tax withholding.","2024-01-01"),
    ("CO-106","Patient payment option/election not in effect.","2024-01-01"),
    ("CO-107","The related or qualifying claim/service was not identified on this claim.","2024-01-01"),
    ("CO-108","Rent/purchase guidelines were not met.","2024-01-01"),
    ("CO-109","Claim/service not covered by this payer/contractor. You must send the claim/service to the correct payer/contractor.","2024-01-01"),
    ("CO-110","Billing date predates service date.","2024-01-01"),
    ("CO-111","Not covered unless the provider accepts assignment.","2024-01-01"),
    ("CO-112","Service not furnished directly to the patient and/or not documented.","2024-01-01"),
    ("CO-114","Procedure/product not approved by the Food and Drug Administration.","2024-01-01"),
    ("CO-115","Claim not covered by this payer. Claim submitted to correct carrier.","2024-01-01"),
    ("CO-116","The advance indemnification notice signed by the patient did not comply with requirements.","2024-01-01"),
    ("CO-117","Transportation is only covered to the closest facility that can provide the necessary care.","2024-01-01"),
    ("CO-118","ESRD network support adjustment.","2024-01-01"),
    ("CO-119","Benefit maximum for this time period or occurrence has been reached.","2024-01-01"),
    ("CO-121","Indemnification adjustment - compensation for outstanding member responsibility.","2024-01-01"),
    ("CO-122","Psychiatric reduction.","2024-01-01"),
    ("CO-125","Submission/billing error(s). At least one Remark Code must be provided.","2024-01-01"),
    ("CO-127","Duplicate of a claim processed, or to be processed, as a crossover claim.","2024-01-01"),
    ("CO-128","Claim received after split/refund issued.","2024-01-01"),
    ("CO-129","Prior processing information appears incorrect.","2024-01-01"),
    ("CO-130","Claim submission fee.","2024-01-01"),
    ("CO-131","Claim specific negotiated discount.","2024-01-01"),
    ("CO-132","Prearranged demonstration project adjustment.","2024-01-01"),
    ("CO-133","The disposition of this service line is pending further review.","2024-01-01"),
    ("CO-134","Technical fees removed from charges.","2024-01-01"),
    ("CO-135","Interim bills cannot be processed.","2024-01-01"),
    ("CO-136","Failure to follow prior payer's coverage determination.","2024-01-01"),
    ("CO-137","Legislative/regulatory penalty.","2024-01-01"),
    ("CO-138","Appeal procedures not followed or time limits not met.","2024-01-01"),
    ("CO-139","Contracted funding agreement - Subscriber is employed by the provider of services.","2024-01-01"),
    ("CO-140","Patient/Insured health identification number and name do not match.","2024-01-01"),
    ("CO-141","Claim spans eligible and ineligible periods of coverage.","2024-01-01"),
    ("CO-142","Monthly Medicaid patient liability amount.","2024-01-01"),
    ("CO-143","Portion of payment deducted to satisfy a previous debt.","2024-01-01"),
    ("CO-144","Incentive adjustment, e.g. preferred product/service.","2024-01-01"),
    ("CO-146","Diagnosis was invalid for the date(s) of service reported.","2024-01-01"),
    ("CO-147","Provider contracted/negotiated rate expired or not on file.","2024-01-01"),
    ("CO-148","Information from another provider was not provided or was insufficient/incomplete.","2024-01-01"),
    ("CO-149","Lifetime benefit maximum has been reached for this service/benefit category.","2024-01-01"),
    ("CO-150","Payer deems the information submitted does not support this level of service.","2024-01-01"),
    ("CO-151","Payment adjusted because the payer deems the information submitted does not support this many/frequency of services.","2024-01-01"),
    ("CO-152","Payer deems the information submitted does not support this length of service.","2024-01-01"),
    ("CO-153","Payer deems the information submitted does not support this dosage.","2024-01-01"),
    ("CO-154","Payer deems the information submitted does not support this day's supply.","2024-01-01"),
    ("CO-155","Patient refused the service/procedure.","2024-01-01"),
    ("CO-157","Service/procedure was provided as a result of an act of war.","2024-01-01"),
    ("CO-158","Service/procedure was provided outside of the United States.","2024-01-01"),
    ("CO-163","Attachment referenced on the claim was not received.","2024-01-01"),
    ("CO-164","Attachment was incomplete or missing data.","2024-01-01"),
    ("CO-167","This (these) diagnosis(es) is (are) not covered.","2024-01-01"),
    ("CO-169","Alternate benefit has been provided.","2024-01-01"),
    ("CO-170","Payment is denied when performed/billed by this type of provider in this type of facility.","2024-01-01"),
    ("CO-171","Payment is denied when performed/billed by this type of provider.","2024-01-01"),
    ("CO-172","Payment is adjusted when performed/billed by a provider of this specialty.","2024-01-01"),
    ("CO-173","Service/equipment was not prescribed by a physician.","2024-01-01"),
    ("CO-174","Service was not prescribed prior to delivery.","2024-01-01"),
    ("CO-175","Prescription is incomplete.","2024-01-01"),
    ("CO-176","Authorization number not valid.","2024-01-01"),
    ("CO-177","Patient has not met the required eligibility requirements.","2024-01-01"),
    ("CO-178","The claim was submitted after the claim filing limit.","2024-01-01"),
    ("CO-179","The request for payment does not identify a physician/surgeon or a physician/surgeon signature.","2024-01-01"),
    ("CO-180","Procedure code was not valid at the time of service.","2024-01-01"),
    ("CO-181","Procedure code was invalid on the date of service.","2024-01-01"),
    ("CO-182","Procedure modifier was invalid on the date of service.","2024-01-01"),
    ("CO-183","The referring provider is not eligible to refer the service billed.","2024-01-01"),
    ("CO-184","The prescribing/ordering provider is not eligible to prescribe/order the service billed.","2024-01-01"),
    ("CO-185","The rendering provider is not eligible to perform the service billed.","2024-01-01"),
    ("CO-186","Level of care change adjustment.","2024-01-01"),
    ("CO-187","Consumer Spending Account payments (includes but is not limited to Flexible Spending Account, Health Savings Account, Health Reimbursement Account, etc.)","2024-01-01"),
    ("CO-188","This product was not prescribed for use at the time it was dispensed.","2024-01-01"),
    ("CO-189","Not eligible due to specific plan exclusions.","2024-01-01"),
    ("CO-190","Payment is included in the allowance for a Skilled Nursing Facility (SNF) stay or a Medicare Part A stay.","2024-01-01"),
    ("CO-192","Non standard adjustment code from paper remittance.","2024-01-01"),
    ("CO-193","Original payment decision is being maintained.","2024-01-01"),
    ("CO-194","Anesthesia performed by the operating physician, the assistant surgeon or the attending physician.","2024-01-01"),
    ("CO-195","Refund issued to an erroneous priority payer for this claim/service.","2024-01-01"),
    ("CO-197","Precertification/authorization/notification absent.","2024-01-01"),
    ("CO-198","Precertification/authorization exceeded.","2024-01-01"),
    ("CO-199","Revenue code and Procedure code do not match.","2024-01-01"),
    ("CO-200","Expenses incurred during lapse in coverage.","2024-01-01"),
    ("CO-201","Workers' Compensation case settled. Patient is responsible for amount of this claim/service through WC 'Medicare set aside arrangement' or other agreement.","2024-01-01"),
    ("CO-202","Non-covered personal comfort or convenience services.","2024-01-01"),
    ("CO-203","Discontinued or reduced service.","2024-01-01"),
    ("CO-204","This service/equipment/drug is not covered under the patient's current benefit plan.","2024-01-01"),
    ("CO-205","Pharmacy discount card processing fee.","2024-01-01"),
    ("CO-206","National Drug Codes (NDC) not eligible for rebate, are unapproved drugs or are not reimbursable.","2024-01-01"),
    ("PR-1","Deductible Amount","2024-01-01"),("PR-2","Coinsurance Amount","2024-01-01"),
    ("PR-3","Co-payment Amount","2024-01-01"),
    ("OA-18","Exact duplicate claim/service","2024-01-01"),
    ("OA-23","The impact of prior payer(s) adjudication","2024-01-01"),
]

# ─────────────────────────────────────────────────────────────────────────────
# RARC codes – CMS Remittance Advice Remark Codes (most common 100+)
# Source: https://www.cms.gov/medicare (X12 controlled code set)
# ─────────────────────────────────────────────────────────────────────────────
RARC_CODES = [
    ("M1","X-ray not taken within the past 12 months or near enough to the start of treatment.","2024-01-01"),
    ("M2","Not covered unless a more conservative treatment is tried first.","2024-01-01"),
    ("M4","Alert: You may appeal this decision.","2024-01-01"),
    ("M5","Monthly rental payments can be made for a total of 15 months for this durable medical equipment.","2024-01-01"),
    ("M6","Alert: You must file a Medicare Secondary Payer claim (primary payer info required).","2024-01-01"),
    ("M10","Equipment is the same or similar to equipment already being used.","2024-01-01"),
    ("M13","Only one initial visit is covered per specialty per medical group.","2024-01-01"),
    ("M14","No separate payment for an office visit that results in a decision to perform surgery within the next 24 hours.","2024-01-01"),
    ("M15","Separately billed services/tests have been bundled as they are considered components of the same procedure.","2024-01-01"),
    ("M16","Alert: Please see our reimbursement policy for complete billing and payment information.","2024-01-01"),
    ("M17","Alert: Payment approved as claimed; however, this payment will be applied to a prior balance owed from a previous overpayment.","2024-01-01"),
    ("M18","Certain services may be approved for home use.","2024-01-01"),
    ("M19","Information provided was incomplete.","2024-01-01"),
    ("M20","Missing/incomplete/invalid HCPCS modifier(s).","2024-01-01"),
    ("M22","Missing/incomplete/invalid tax identification number.","2024-01-01"),
    ("M23","Missing/incomplete/invalid beginning date(s) of service.","2024-01-01"),
    ("M24","Missing/incomplete/invalid ending date(s) of service.","2024-01-01"),
    ("M25","Missing/incomplete/invalid diagnosis code(s).","2024-01-01"),
    ("M26","Missing/incomplete/invalid referring provider primary identifier.","2024-01-01"),
    ("M27","Alert: The patient has been relieved of liability of payment of these items and services under the limitation on liability provisions.","2024-01-01"),
    ("M28","Incomplete/invalid claim information.","2024-01-01"),
    ("M29","Missing documentation.","2024-01-01"),
    ("M30","Missing/incomplete/invalid National Drug Code (NDC).","2024-01-01"),
    ("M31","Missing/incomplete/invalid National Drug Code (NDC) unit of measure.","2024-01-01"),
    ("M32","Alert: This is a conditional payment made pending a decision on this service by the patient's primary insurer.","2024-01-01"),
    ("M36","This is the 12th rental month.","2024-01-01"),
    ("M37","Not covered when the patient is under age 35.","2024-01-01"),
    ("M38","The patient is liable for the charges for this service as you informed the patient in writing before the service was furnished that Medicare would likely deny it, and the patient agreed to pay.","2024-01-01"),
    ("M39","The patient is not liable for payment of this service as the advance beneficiary notice was not signed by the patient.","2024-01-01"),
    ("M44","Alert: The use of this code requires a 7th character.","2024-01-01"),
    ("M45","Missing/incomplete/invalid occurrence span code.","2024-01-01"),
    ("M46","Missing/incomplete/invalid occurrence code.","2024-01-01"),
    ("M47","Missing/incomplete/invalid internal control number.","2024-01-01"),
    ("M49","Missing/incomplete/invalid value code.","2024-01-01"),
    ("M50","Missing/incomplete/invalid revenue code(s).","2024-01-01"),
    ("M51","Missing/incomplete/invalid procedure code(s).","2024-01-01"),
    ("M52","Missing/incomplete/invalid 'from' date(s) of service.","2024-01-01"),
    ("M53","Missing/incomplete/invalid days or units of service.","2024-01-01"),
    ("M54","Missing/incomplete/invalid total charges.","2024-01-01"),
    ("M55","Missing/incomplete/invalid rendering provider primary identifier.","2024-01-01"),
    ("M56","Missing/incomplete/invalid National Provider Identifier (NPI).","2024-01-01"),
    ("M57","Missing/incomplete/invalid pay-to provider address.","2024-01-01"),
    ("M58","Missing/incomplete/invalid charge amount.","2024-01-01"),
    ("M59","Missing/incomplete/invalid quantity billed.","2024-01-01"),
    ("M60","Missing Certificate of Medical Necessity.","2024-01-01"),
    ("M61","Provider/supplier surpassed the cap amount.","2024-01-01"),
    ("M62","Missing/incomplete/invalid treatment authorization code.","2024-01-01"),
    ("M63","Missing/incomplete/invalid principal diagnosis code.","2024-01-01"),
    ("M64","Missing/incomplete/invalid other diagnosis code(s).","2024-01-01"),
    ("M65","One standard written order is required for all accessories, supplies, repairs, and/or labor.","2024-01-01"),
    ("M66","Our records indicate that this patient was participating in a Medicare-sponsored research study when this item or service was provided..","2024-01-01"),
    ("M67","Missing/incomplete/invalid other procedure code(s).","2024-01-01"),
    ("M68","Missing/incomplete/invalid principal procedure code.","2024-01-01"),
    ("M69","Claim received after the RAP/Initial Claim.","2024-01-01"),
    ("M70","Alert: The NDC submitted for this drug/biologic is not on the fee schedule; however, a rate may have been established for this service. Please resubmit with a valid NDC.","2024-01-01"),
    ("M76","Missing/incomplete/invalid diagnosis or condition.","2024-01-01"),
    ("M77","Missing/incomplete/invalid place of service.","2024-01-01"),
    ("M78","The patient is not liable for payment for this service since the provider failed to issue a valid advance beneficiary notice.","2024-01-01"),
    ("M79","Missing/incomplete/invalid charge.","2024-01-01"),
    ("M80","Not covered when performed during the same session/date as a previously processed service for the patient.","2024-01-01"),
    ("M81","You are a participating provider and are not supposed to bill the patient for the denied/adjusted service.","2024-01-01"),
    ("M82","Service is not covered when patient is in a Medicare Advantage plan.","2024-01-01"),
    ("M83","Did not indicate whether the patient had been informed of the possibility that this service may be denied as not reasonable and necessary.","2024-01-01"),
    ("M84","Patient identified as a Medicare Advantage plan enrollee for this service. Refer to your provider contract.","2024-01-01"),
    ("M85","Subjected to review of physician orders or referrals.","2024-01-01"),
    ("M86","Service denied because payment already made for same/similar procedure within set time frame.","2024-01-01"),
    ("M87","Claim/service(s) subjected to state-mandated review.","2024-01-01"),
    ("M88","Alert: This product/procedure is only covered when used according to FDA recommendations if experimental treatment is involved.","2024-01-01"),
    ("M89","Not covered more than once in a rolling 12-month period.","2024-01-01"),
    ("M91","Lab procedures with different dates of service must be billed on separate claims.","2024-01-01"),
    ("M93","No claim may be submitted for a period covered by a 'level of care' decision.","2024-01-01"),
    ("M94","When billing for a clinical trial, include the eight-digit clinical trial number.","2024-01-01"),
    ("M95","Services subjected to Home Health Initiative medical review/cost report audit.","2024-01-01"),
    ("M96","The Interstate Blood Bank does not provide that type of blood.","2024-01-01"),
    ("M97","Not paid to a provider when the patient is in a Medicare Advantage plan and the service is covered by the plan.","2024-01-01"),
    ("M99","Missing/incomplete/invalid Universal Product Number/Serial Number.","2024-01-01"),
    ("N1","Alert: You may appeal this decision in writing within the required time limits following receipt of this notice by following the instructions included in your contract or plan benefit documents.","2024-01-01"),
    ("N2","A charge submitted exceeds the plan's dollar limitation for this service. The member is responsible for the remaining charges.","2024-01-01"),
    ("N3","Missing/incomplete/invalid insured/subscriber primary identifier.","2024-01-01"),
    ("N4","Missing/incomplete/invalid insured/subscriber/patient identification.","2024-01-01"),
    ("N5","EOB received from previous payer. Claim not on file.","2024-01-01"),
    ("N6","Under the HIPAA rules, all claims must be submitted electronically unless the submitter qualifies for an exemption.","2024-01-01"),
    ("N7","Alert: Processing of this claim/service has included consideration under a Medicare Secondary Payer program. For the most accurate determination of your liability, call 1-800-MEDICARE (1-800-633-4227).","2024-01-01"),
    ("N8","Claim is incomplete. Contact the provider for a corrected claim.","2024-01-01"),
    ("N10","Payment based on an appropriate share of the patient's Medicaid 'cap' amount.","2024-01-01"),
    ("N11","Claim processed in accordance with ambulatory surgical guidelines.","2024-01-01"),
    ("N12","Policy provides coverage supplemental to Medicare. As Medicare has not adjudicated this claim, we are returning/rejecting it.","2024-01-01"),
    ("N14","Only one visit per day covered.","2024-01-01"),
    ("N15","Patient's date of birth follows the date of service.","2024-01-01"),
    ("N16","'New Patient' qualifications were not met.","2024-01-01"),
    ("N17","Sales tax included in total charges.","2024-01-01"),
    ("N18","Missing/incomplete/invalid discharge hour.","2024-01-01"),
    ("N19","Claim contains only non-covered and/or non-payable procedures.","2024-01-01"),
    ("N20","Service not payable to this type of provider.","2024-01-01"),
    ("N21","Alert: Your stop-loss deductible has been met. Contact your insurer for any additional questions.","2024-01-01"),
    ("N22","Resubmit with multiple claims, each claim containing only one place of service.","2024-01-01"),
    ("N23","Alert: Patient is enrolled in hospice. See your contract or call your provider representative for more information.","2024-01-01"),
    ("N24","Missing/incomplete/invalid Electronic Funds Transfer (EFT) banking information.","2024-01-01"),
    ("N25","This company has been contracted by your benefit plan to provide your mental health and/or substance abuse benefits.","2024-01-01"),
    ("N26","Missing/incomplete/invalid billing provider primary identifier.","2024-01-01"),
    ("N27","Missing/incomplete/invalid subscriber and subscriber number.","2024-01-01"),
    ("N28","Consent form for this procedure is on file at your provider's office.","2024-01-01"),
    ("N29","Missing/incomplete/invalid Physician Order.","2024-01-01"),
    ("N30","Missing/incomplete/invalid plan information for other insurance.","2024-01-01"),
    ("N31","Missing/incomplete/invalid group member information for other insurance.","2024-01-01"),
    ("N32","Claim must be resubmitted by the provider.","2024-01-01"),
    ("N33","No record of health coverage. Resubmit with proof of coverage.","2024-01-01"),
    ("N34","Incorrect claim form/format for this service.","2024-01-01"),
    ("N35","Program integrity organization (PIO) has determined that the provider has been overpaid.","2024-01-01"),
    ("N36","Alert: This adjudication is for a claim received from you as a secondary payer. This claim has been processed in accordance with applicable requirements for claims submitted to secondary payers.","2024-01-01"),
    ("N37","Missing/incomplete/invalid tooth number/letter.","2024-01-01"),
    ("N38","Missing/incomplete/invalid tooth surface code(s).","2024-01-01"),
    ("N39","Missing/incomplete/invalid oral cavity designation code.","2024-01-01"),
    ("N40","Missing/incomplete/invalid prosthodontic chart.","2024-01-01"),
    ("N41","Missing/incomplete/invalid procedure date(s).","2024-01-01"),
    ("N42","Missing/incomplete/invalid number of teeth extracted.","2024-01-01"),
    ("N43","Missing/incomplete/invalid urinalysis results.","2024-01-01"),
    ("N44","Resolved rebundling issue.","2024-01-01"),
    ("N45","Resubmit with proof of signature on file.","2024-01-01"),
    ("N46","Missing/incomplete/invalid attending physician information.","2024-01-01"),
    ("N47","Claim conflicts with another inpatient stay.","2024-01-01"),
    ("N48","Claim information does not agree with information received from other insurance carrier.","2024-01-01"),
    ("N49","Court order/legal action requires different handling.","2024-01-01"),
    ("N50","Missing/incomplete/invalid operating physician information.","2024-01-01"),
    ("N51","Electronic interchange agreement not on file for provider/submitter.","2024-01-01"),
    ("N52","Patient not enrolled in the specified managed care plan on the date of service.","2024-01-01"),
    ("N53","Missing/incomplete/invalid point of pick-up address.","2024-01-01"),
    ("N54","Claim information is inconsistent with pre-certified/authorized services.","2024-01-01"),
    ("N55","Procedures for billing with condition code 04 were not followed.","2024-01-01"),
    ("N56","Procedure code billed is not correct/valid for the services billed or the date of service billed.","2024-01-01"),
    ("N57","Missing/incomplete/invalid prescribing/ordering provider identifier.","2024-01-01"),
    ("N58","Missing/incomplete/invalid record of delivery.","2024-01-01"),
    ("N59","Alert: Please refer to your provider manual for a listing of diagnoses that support this procedure.","2024-01-01"),
    ("N60","Alert: Consult our contractual agreement for restrictions/billing/payment information related to these services.","2024-01-01"),
    ("N61","Rebill service(s) as... and/or... .","2024-01-01"),
    ("N62","Alert: Timely filing requirements have been met for this service; however, payment has been denied/reduced for a reason that can be appealed.","2024-01-01"),
    ("N63","Rebill claim(s) as a corrected claim.","2024-01-01"),
    ("N64","The 'Onset of Current Symptoms or Illness' date is not within the accepted timeframe.","2024-01-01"),
    ("N65","Procedure code or procedure rate count cannot be determined, or was not on file, for the date of service/provider.","2024-01-01"),
    ("N67","Professional provider services not payable per managed care contract.","2024-01-01"),
    ("N68","The provider's request for waiver of the Advance Beneficiary Notice has been denied.","2024-01-01"),
    ("N69","PPS (Prospective Payment System) code changed by claims processing system.","2024-01-01"),
    ("N70","Consolidated billing and payment applies.","2024-01-01"),
    ("N71","Your unassigned claim for a service to a Medicare Advantage plan enrollee will be reprocessed as an assigned claim.","2024-01-01"),
    ("N72","PPS (Prospective Payment System) FY 2001 limitation.","2024-01-01"),
    ("N73","Missing/incomplete/invalid purchase price of the service/item billed.","2024-01-01"),
    ("N74","Resubmit with a copy of the remittance/explanation of benefits received from the primary payer showing the primary payer's patient responsibility.","2024-01-01"),
    ("N75","Missing/incomplete/invalid type, make and/or model of equipment.","2024-01-01"),
    ("N76","Missing/incomplete/invalid number of units.","2024-01-01"),
    ("N77","Missing/incomplete/invalid invoice.","2024-01-01"),
    ("N78","The non-payable code submitted has been converted to a payable code during claims processing.","2024-01-01"),
    ("N79","Service billed is not correct/valid for the patient's age.","2024-01-01"),
    ("N80","Service billed is not correct/valid for the patient's gender.","2024-01-01"),
    ("N81","Procedure code was not covered by the prior payer.","2024-01-01"),
    ("N82","Provider must accept insurance payment as payment-in-full when a third party payer contract so specifies.","2024-01-01"),
    ("N83","No appeal rights. Adjudicative decision is final.","2024-01-01"),
    ("N84","Alert: Further installment payments/information will follow.","2024-01-01"),
    ("N85","Alert: This payment is the final installment payment/information.","2024-01-01"),
    ("N86","A failed/incomplete transfer of care. The provider who failed to complete the transfer of care is responsible for the services rendered by the referral provider.","2024-01-01"),
    ("N87","Alert: Consideration of benefits is for informational purposes.","2024-01-01"),
    ("N88","Alert: This payment is being made to a third party.","2024-01-01"),
    ("N89","Alert: Adjustment represents a correction to a prior remit.","2024-01-01"),
    ("N90","Covered only when performed by the attending physician.","2024-01-01"),
    ("N104","This claim has been identified as a readmission.","2024-01-01"),
    ("N105","Your claim has been identified as a readmission based on our records.","2024-01-01"),
    ("N115","This decision was based on a Local Coverage Determination (LCD).","2024-01-01"),
    ("N130","Consult plan benefit documents/guidelines for information about restrictions for this service.","2024-01-01"),
    ("N180","Alert: This payer does not cover 'never events'.","2024-01-01"),
    ("N210","Alert: You may appeal this decision.","2024-01-01"),
    ("N211","Alert: You may not appeal this decision.","2024-01-01"),
    ("N257","Additional information requested. Resubmit claim when the information is available.","2024-01-01"),
    ("N362","Number of Days or Units of Service exceeds acceptable maximum.","2024-01-01"),
    ("N363","Alert: Rebilled services should be reduced by the approved amount on the initial claim.","2024-01-01"),
    ("N365","This service is not covered when performed within the global surgery period of a previously submitted service.","2024-01-01"),
    ("N443","Alert: This decision reflects payment based on a standard fee schedule.","2024-01-01"),
    ("N490","Alert: This claim has been processed using the submitted National Provider Identifier (NPI).","2024-01-01"),
    ("N517","Resubmit your claim with the appropriate claim type/form date.","2024-01-01"),
    ("N522","Duplicate of a claim processed, or to be processed, as a crossover claim.","2024-01-01"),
    ("N570","Missing/incomplete/invalid credentialing data.","2024-01-01"),
    ("N572","Alert: Medicare Advantage, Inc. is the primary payer for this patient.","2024-01-01"),
]


def get_supabase_client() -> Client:
    url: str = os.environ.get("SUPABASE_URL")
    key: str = os.environ.get("SUPABASE_SERVICE_ROLE_KEY")
    if not url or not key:
        print("ERROR: Supabase credentials not found in environment variables.")
        exit(1)
    return create_client(url, key)


def fetch_icd10_codes():
    print("Fetching ICD-10-CM codes from National Library of Medicine...")
    base_url = "https://clinicaltables.nlm.nih.gov/api/icd10cm/v3/search?sf=code,name&cf=code,name&terms=&df=code,name&maxList=600&offset={}"
    all_codes = []
    offset = 0

    while True:
        try:
            print(f"  ICD-10 offset {offset}...")
            response = requests.get(base_url.format(offset), timeout=15)
            if response.status_code != 200:
                break
            data = response.json()
            total = data[0]
            records = data[3]
            if not records:
                break
            for record in records:
                desc = record[1][:950] if len(record[1]) > 950 else record[1]
                all_codes.append({
                    "code": record[0], "code_type": "ICD10",
                    "short_description": desc, "long_description": desc,
                    "effective_date": "2024-01-01"
                })
            offset += len(records)
            time.sleep(0.1)
            if offset >= total:
                break
        except Exception as e:
            print(f"  Error: {e}")
            break

    return all_codes


def upload_to_supabase(supabase: Client, table: str, data: list):
    print(f"Uploading {len(data)} rows to '{table}'...")
    chunk_size = 500
    done = 0
    for i in range(0, len(data), chunk_size):
        chunk = data[i:i + chunk_size]
        try:
            supabase.table(table).upsert(chunk, on_conflict="code" if table != "medical_codes" else "code,code_type").execute()
            done += len(chunk)
            print(f"  {table}: {done}/{len(data)}")
        except Exception as e:
            print(f"  Error at chunk {i}: {e}")


if __name__ == "__main__":
    print("=" * 60)
    print("  MediHelp Now – Full CMS Data Pipeline")
    print("=" * 60)

    sb = get_supabase_client()

    # 1. ICD-10 codes (74,000+ rows from NLM)
    icd10 = fetch_icd10_codes()
    print(f"Fetched {len(icd10)} ICD-10 codes.")
    if icd10:
        upload_to_supabase(sb, "medical_codes", icd10)

    # 2. CARC codes
    carc_payload = [{"code": c[0], "description": c[1], "effective_date": c[2]} for c in CARC_CODES]
    upload_to_supabase(sb, "carc_codes", carc_payload)

    # 3. RARC codes
    rarc_payload = [{"code": c[0], "description": c[1], "effective_date": c[2]} for c in RARC_CODES]
    upload_to_supabase(sb, "rarc_codes", rarc_payload)

    print("=" * 60)
    print("  Pipeline complete! All tables populated.")
    print("=" * 60)
