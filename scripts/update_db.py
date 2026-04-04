import os
import time
import json
import requests

# ─── Supabase REST API Config ────────────────────────────────────────────────
SUPABASE_URL = os.environ.get("SUPABASE_URL", "").rstrip("/")
SUPABASE_KEY = os.environ.get("SUPABASE_SERVICE_ROLE_KEY", "")

if not SUPABASE_URL or not SUPABASE_KEY:
    print("ERROR: Set SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in GitHub Secrets.")
    exit(1)

HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json",
    "Prefer": "resolution=merge-duplicates"  # upsert behaviour
}

# ─────────────────────────────────────────────────────────────────────────────
# CARC codes – CMS Claim Adjustment Reason Codes
# ─────────────────────────────────────────────────────────────────────────────
CARC_CODES = [
    ("CO-1","Deductible Amount"),("CO-2","Coinsurance Amount"),("CO-3","Co-payment Amount"),
    ("CO-4","The procedure code is inconsistent with the modifier used or a required modifier is missing."),
    ("CO-5","The procedure code/bill type is inconsistent with the place of service."),
    ("CO-6","The procedure/revenue code is inconsistent with the patient's age."),
    ("CO-7","The procedure/revenue code is inconsistent with the patient's gender."),
    ("CO-8","The procedure code is inconsistent with the provider type/specialty (taxonomy)."),
    ("CO-9","The diagnosis is inconsistent with the patient's age."),
    ("CO-10","The diagnosis is inconsistent with the patient's gender."),
    ("CO-11","The diagnosis is inconsistent with the procedure."),
    ("CO-12","The diagnosis is inconsistent with the provider type."),
    ("CO-13","The date of death precedes the date of service."),
    ("CO-14","The date of birth follows the date of service."),
    ("CO-15","The authorization number is missing, invalid, or does not apply to the billed services or provider."),
    ("CO-16","Claim/service lacks information or has submission/billing error(s)."),
    ("CO-18","Exact duplicate claim/service (plan procedures not met)."),
    ("CO-19","This is a work-related injury/illness and thus the liability of the Worker's Compensation Carrier."),
    ("CO-20","This injury/illness is covered by the liability carrier."),
    ("CO-21","This injury/illness is the liability of the no-fault carrier."),
    ("CO-22","This care may be covered by another payer per coordination of benefits."),
    ("CO-23","The impact of prior payer(s) adjudication including payments and/or adjustments."),
    ("CO-24","Charges are covered under a capitation agreement/managed care plan."),
    ("CO-26","Expenses incurred prior to coverage."),
    ("CO-27","Expenses incurred after coverage terminated."),
    ("CO-29","The time limit for filing has expired."),
    ("CO-31","Patient cannot be identified as our insured."),
    ("CO-32","Our records indicate that this dependent is not an eligible dependent as defined."),
    ("CO-33","Insured has no dependent coverage."),
    ("CO-34","Insured has no coverage for newborns."),
    ("CO-35","Lifetime benefit maximum has been reached."),
    ("CO-39","Services denied at the time authorization/pre-certification was requested."),
    ("CO-40","Charges do not meet qualifications for emergent/urgent care."),
    ("CO-44","Prompt-pay discount."),
    ("CO-45","Charge exceeds fee schedule/maximum allowable or contracted/legislated fee arrangement."),
    ("CO-49","This is a non-covered service because it is a routine/preventive exam or a diagnostic/screening procedure done in conjunction with a routine/preventive exam."),
    ("CO-50","These are non-covered services because this is not deemed a 'medical necessity' by the payer."),
    ("CO-51","These are non-covered services because this is a pre-existing condition."),
    ("CO-53","Services by an immediate relative or a member of the same household are not covered."),
    ("CO-55","Procedure/treatment is deemed experimental/investigational by the payer."),
    ("CO-56","Procedure/treatment has not been deemed 'safe and effective' by the payer."),
    ("CO-57","This procedure/service is not covered when performed with, or subsequent to, the procedure/service previously billed."),
    ("CO-58","Treatment was deemed by the payer to have been rendered in an inappropriate or invalid place of service."),
    ("CO-59","Processed based on multiple or concurrent procedure rules."),
    ("CO-60","Charges for outpatient services are not covered when performed within a period of time prior to or after inpatient services."),
    ("CO-61","Penalty for failure to obtain second surgical opinion."),
    ("CO-62","Payment denied/reduced for absence of, or exceeded, precertification/authorization."),
    ("CO-63","Correction to a prior claim."),
    ("CO-65","Procedure code was incorrect. This payment reflects the correct code."),
    ("CO-66","Blood Deductible."),
    ("CO-74","Indirect Medical Education Adjustment."),
    ("CO-75","Direct Medical Education Adjustment."),
    ("CO-76","Disproportionate Share Adjustment."),
    ("CO-78","Non-Covered days/Room and Board/Ancillaries."),
    ("CO-87","Transfer amount."),
    ("CO-89","Professional fees removed from institutional claim."),
    ("CO-90","Emergency services not covered when provided out of network."),
    ("CO-91","Lab procedures with different dates of service bundled into the same bill."),
    ("CO-94","Processed in Excess of charges."),
    ("CO-95","Plan procedures not followed."),
    ("CO-96","Non-covered charge(s)."),
    ("CO-97","The benefit for this service is included in the payment/allowance for another service/procedure that has already been adjudicated."),
    ("CO-100","Payment made to patient/insured/responsible party/employer."),
    ("CO-101","Predetermination: anticipated payment upon completion of services or claim adjudication."),
    ("CO-104","Managed care withholding."),
    ("CO-107","The related or qualifying claim/service was not identified on this claim."),
    ("CO-109","Claim/service not covered by this payer/contractor. You must send the claim/service to the correct payer/contractor."),
    ("CO-110","Billing date predates service date."),
    ("CO-111","Not covered unless the provider accepts assignment."),
    ("CO-112","Service not furnished directly to the patient and/or not documented."),
    ("CO-114","Procedure/product not approved by the Food and Drug Administration."),
    ("CO-116","The advance indemnification notice signed by the patient did not comply with requirements."),
    ("CO-117","Transportation is only covered to the closest facility that can provide the necessary care."),
    ("CO-119","Benefit maximum for this time period or occurrence has been reached."),
    ("CO-122","Psychiatric reduction."),
    ("CO-125","Submission/billing error(s). At least one Remark Code must be provided."),
    ("CO-127","Duplicate of a claim processed, or to be processed, as a crossover claim."),
    ("CO-129","Prior processing information appears incorrect."),
    ("CO-133","The disposition of this service line is pending further review."),
    ("CO-135","Interim bills cannot be processed."),
    ("CO-136","Failure to follow prior payer's coverage determination."),
    ("CO-137","Legislative/regulatory penalty."),
    ("CO-138","Appeal procedures not followed or time limits not met."),
    ("CO-139","Contracted funding agreement - Subscriber is employed by the provider of services."),
    ("CO-140","Patient/Insured health identification number and name do not match."),
    ("CO-141","Claim spans eligible and ineligible periods of coverage."),
    ("CO-143","Portion of payment deducted to satisfy a previous debt."),
    ("CO-146","Diagnosis was invalid for the date(s) of service reported."),
    ("CO-147","Provider contracted/negotiated rate expired or not on file."),
    ("CO-148","Information from another provider was not provided or was insufficient/incomplete."),
    ("CO-149","Lifetime benefit maximum has been reached for this service/benefit category."),
    ("CO-150","Payer deems the information submitted does not support this level of service."),
    ("CO-151","Payment adjusted because the payer deems the information submitted does not support this many/frequency of services."),
    ("CO-152","Payer deems the information submitted does not support this length of service."),
    ("CO-153","Payer deems the information submitted does not support this dosage."),
    ("CO-154","Payer deems the information submitted does not support this day's supply."),
    ("CO-155","Patient refused the service/procedure."),
    ("CO-157","Service/procedure was provided as a result of an act of war."),
    ("CO-158","Service/procedure was provided outside of the United States."),
    ("CO-163","Attachment referenced on the claim was not received."),
    ("CO-164","Attachment was incomplete or missing data."),
    ("CO-167","This diagnosis(es) is not covered."),
    ("CO-169","Alternate benefit has been provided."),
    ("CO-170","Payment is denied when performed/billed by this type of provider in this type of facility."),
    ("CO-171","Payment is denied when performed/billed by this type of provider."),
    ("CO-173","Service/equipment was not prescribed by a physician."),
    ("CO-174","Service was not prescribed prior to delivery."),
    ("CO-176","Authorization number not valid."),
    ("CO-177","Patient has not met the required eligibility requirements."),
    ("CO-178","The claim was submitted after the claim filing limit."),
    ("CO-180","Procedure code was not valid at the time of service."),
    ("CO-181","Procedure code was invalid on the date of service."),
    ("CO-182","Procedure modifier was invalid on the date of service."),
    ("CO-183","The referring provider is not eligible to refer the service billed."),
    ("CO-184","The prescribing/ordering provider is not eligible to prescribe/order the service billed."),
    ("CO-185","The rendering provider is not eligible to perform the service billed."),
    ("CO-186","Level of care change adjustment."),
    ("CO-187","Consumer Spending Account payments (FSA, HSA, HRA, etc.)"),
    ("CO-189","Not eligible due to specific plan exclusions."),
    ("CO-190","Payment is included in the allowance for a Skilled Nursing Facility (SNF) stay."),
    ("CO-193","Original payment decision is being maintained."),
    ("CO-197","Precertification/authorization/notification absent."),
    ("CO-198","Precertification/authorization exceeded."),
    ("CO-199","Revenue code and Procedure code do not match."),
    ("CO-200","Expenses incurred during lapse in coverage."),
    ("CO-201","Workers' Compensation case settled. Patient is responsible for amount through WC Medicare set aside arrangement."),
    ("CO-202","Non-covered personal comfort or convenience services."),
    ("CO-203","Discontinued or reduced service."),
    ("CO-204","This service/equipment/drug is not covered under the patient's current benefit plan."),
    ("PR-1","Deductible Amount"),("PR-2","Coinsurance Amount"),("PR-3","Co-payment Amount"),
    ("OA-18","Exact duplicate claim/service"),("OA-23","The impact of prior payer(s) adjudication"),
]

# ─────────────────────────────────────────────────────────────────────────────
# RARC codes – CMS Remittance Advice Remark Codes
# ─────────────────────────────────────────────────────────────────────────────
RARC_CODES = [
    ("M1","X-ray not taken within the past 12 months or near enough to the start of treatment."),
    ("M2","Not covered unless a more conservative treatment is tried first."),
    ("M4","Alert: You may appeal this decision."),
    ("M6","Alert: You must file a Medicare Secondary Payer claim."),
    ("M10","Equipment is the same or similar to equipment already being used."),
    ("M13","Only one initial visit is covered per specialty per medical group."),
    ("M15","Separately billed services/tests have been bundled as they are considered components of the same procedure."),
    ("M16","Alert: Please see our reimbursement policy for complete billing and payment information."),
    ("M19","Information provided was incomplete."),
    ("M20","Missing/incomplete/invalid HCPCS modifier(s)."),
    ("M22","Missing/incomplete/invalid tax identification number."),
    ("M23","Missing/incomplete/invalid beginning date(s) of service."),
    ("M24","Missing/incomplete/invalid ending date(s) of service."),
    ("M25","Missing/incomplete/invalid diagnosis code(s)."),
    ("M26","Missing/incomplete/invalid referring provider primary identifier."),
    ("M29","Missing documentation."),
    ("M36","This is the 12th rental month."),
    ("M38","The patient is liable for the charges for this service as you informed the patient in writing before the service was furnished that Medicare would likely deny it."),
    ("M39","The patient is not liable for payment of this service as the advance beneficiary notice was not signed by the patient."),
    ("M44","Alert: The use of this code requires a 7th character."),
    ("M50","Missing/incomplete/invalid revenue code(s)."),
    ("M51","Missing/incomplete/invalid procedure code(s)."),
    ("M52","Missing/incomplete/invalid from date(s) of service."),
    ("M53","Missing/incomplete/invalid days or units of service."),
    ("M55","Missing/incomplete/invalid rendering provider primary identifier."),
    ("M56","Missing/incomplete/invalid National Provider Identifier (NPI)."),
    ("M60","Missing Certificate of Medical Necessity."),
    ("M62","Missing/incomplete/invalid treatment authorization code."),
    ("M63","Missing/incomplete/invalid principal diagnosis code."),
    ("M76","Missing/incomplete/invalid diagnosis or condition."),
    ("M77","Missing/incomplete/invalid place of service."),
    ("M79","Missing/incomplete/invalid charge."),
    ("M80","Not covered when performed during the same session/date as a previously processed service for the patient."),
    ("M81","You are a participating provider and are not supposed to bill the patient for the denied/adjusted service."),
    ("M86","Service denied because payment already made for same/similar procedure within set time frame."),
    ("M89","Not covered more than once in a rolling 12-month period."),
    ("M94","When billing for a clinical trial, include the eight-digit clinical trial number."),
    ("N1","Alert: You may appeal this decision in writing within the required time limits."),
    ("N3","Missing/incomplete/invalid insured/subscriber primary identifier."),
    ("N4","Missing/incomplete/invalid insured/subscriber/patient identification."),
    ("N8","Claim is incomplete. Contact the provider for a corrected claim."),
    ("N14","Only one visit per day covered."),
    ("N15","Patient's date of birth follows the date of service."),
    ("N16","New Patient qualifications were not met."),
    ("N19","Claim contains only non-covered and/or non-payable procedures."),
    ("N20","Service not payable to this type of provider."),
    ("N23","Alert: Patient is enrolled in hospice."),
    ("N24","Missing/incomplete/invalid Electronic Funds Transfer (EFT) banking information."),
    ("N26","Missing/incomplete/invalid billing provider primary identifier."),
    ("N29","Missing/incomplete/invalid Physician Order."),
    ("N34","Incorrect claim form/format for this service."),
    ("N36","Alert: This adjudication is for a claim received from you as a secondary payer."),
    ("N44","Resolved rebundling issue."),
    ("N46","Missing/incomplete/invalid attending physician information."),
    ("N47","Claim conflicts with another inpatient stay."),
    ("N50","Missing/incomplete/invalid operating physician information."),
    ("N54","Claim information is inconsistent with pre-certified/authorized services."),
    ("N56","Procedure code billed is not correct/valid for the services billed or the date of service billed."),
    ("N57","Missing/incomplete/invalid prescribing/ordering provider identifier."),
    ("N62","Alert: Timely filing requirements have been met for this service."),
    ("N63","Rebill claim(s) as a corrected claim."),
    ("N70","Consolidated billing and payment applies."),
    ("N74","Resubmit with a copy of the remittance/explanation of benefits from the primary payer."),
    ("N76","Missing/incomplete/invalid number of units."),
    ("N79","Service billed is not correct/valid for the patient's age."),
    ("N80","Service billed is not correct/valid for the patient's gender."),
    ("N82","Provider must accept insurance payment as payment-in-full when a third party payer contract so specifies."),
    ("N83","No appeal rights. Adjudicative decision is final."),
    ("N86","Service denied because payment already made for same/similar procedure within set time frame."),
    ("N89","Alert: Adjustment represents a correction to a prior remit."),
    ("N90","Covered only when performed by the attending physician."),
    ("N104","This claim has been identified as a readmission."),
    ("N115","This decision was based on a Local Coverage Determination (LCD)."),
    ("N130","Consult plan benefit documents/guidelines for information about restrictions for this service."),
    ("N210","Alert: You may appeal this decision."),
    ("N211","Alert: You may not appeal this decision."),
    ("N257","Additional information requested. Resubmit claim when the information is available."),
    ("N362","Number of Days or Units of Service exceeds acceptable maximum."),
    ("N365","This service is not covered when performed within the global surgery period of a previously submitted service."),
    ("N443","Alert: This decision reflects payment based on a standard fee schedule."),
    ("N490","Alert: This claim has been processed using the submitted National Provider Identifier (NPI)."),
    ("N517","Resubmit your claim with the appropriate claim type/form date."),
    ("N522","Duplicate of a claim processed, or to be processed, as a crossover claim."),
    ("N570","Missing/incomplete/invalid credentialing data."),
]


# ─────────────────────────────────────────────────────────────────────────────
# INTERNATIONAL DATASETS (UK / ME)
# ─────────────────────────────────────────────────────────────────────────────
UK_CODES = [
    {"code": "G30.9", "description": "Alzheimer disease, unspecified", "country": "UK"},
    {"code": "I10", "description": "Essential (primary) hypertension", "country": "UK"},
    {"code": "E11.9", "description": "Type 2 diabetes mellitus without complications", "country": "UK"},
    {"code": "Z00.0", "description": "General medical examination", "country": "UK"},
    {"code": "W51.0", "description": "PROCEDURE: Appendicectomy (OPCS-4 Sample)", "country": "UK"},
]

ME_CODES = [
    {"code": "H52.1", "description": "Myopia (UAE Standard)", "country": "ME"},
    {"code": "J45.909", "description": "Asthma, unspecified, uncomplicated", "country": "ME"},
    {"code": "R51", "description": "Headache (Saudi Standard)", "country": "ME"},
]

US_SAMPLES = [
    {"code": "J45.909", "description": "Asthma, unspecified, uncomplicated (ICD-10-CM)", "country": "US"},
    {"code": "R07.9", "description": "Chest pain, unspecified", "country": "US"},
    {"code": "I10", "description": "Essential (primary) hypertension", "country": "US"},
    {"code": "E11.9", "description": "Type 2 diabetes mellitus without complications", "country": "US"},
]

def rest_upsert(table: str, rows: list):
    """Upsert rows directly via Supabase REST API — no SDK needed."""
    url = f"{SUPABASE_URL}/rest/v1/{table}"
    chunk_size = 500
    done = 0
    for i in range(0, len(rows), chunk_size):
        chunk = rows[i:i + chunk_size]
        r = requests.post(url, headers=HEADERS, data=json.dumps(chunk), timeout=30)
        if r.status_code in (200, 201):
            done += len(chunk)
            print(f"  {table}: {done}/{len(rows)} rows uploaded.")
        else:
            print(f"  ERROR at chunk {i}: {r.status_code} – {r.text[:200]}")


def fetch_icd10_codes():
    print("Fetching ICD-10-CM codes from NLM API...")
    base_url = "https://clinicaltables.nlm.nih.gov/api/icd10cm/v3/search?sf=code,name&cf=code,name&terms=&df=code,name&maxList=500&offset={}"
    all_codes = []
    offset = 0
    while True:
        try:
            print(f"  ICD-10 offset {offset}...")
            r = requests.get(base_url.format(offset), timeout=15)
            data = r.json()
            total = data[0]
            records = data[3]
            if not records:
                break
            for rec in records:
                desc = rec[1][:950] if len(rec[1]) > 950 else rec[1]
                all_codes.append({
                    "code": rec[0], "code_type": "ICD10",
                    "short_description": desc, "long_description": desc,
                    "effective_date": "2024-01-01",
                    "country": "US"  # Default for NLM API
                })
            offset += len(records)
            time.sleep(0.05) # Rate limit handling
            if offset >= total: # Full sync
                break
        except Exception as e:
            print(f"  Error: {e}")
            break
    return all_codes


if __name__ == "__main__":
    print("=" * 60)
    print("  MediHelp Now – Global CMS Data Pipeline")
    print("=" * 60)

    # 1. ICD-10 US
    icd10 = fetch_icd10_codes()
    print(f"Fetched {len(icd10)} ICD-10 codes. Uploading...")
    if icd10:
        rest_upsert("medical_codes", icd10)

    # 2. International Samples (US/UK/ME)
    intl = [
        {"code": c["code"], "short_description": c["description"], "country": c["country"], "effective_date": "2024-01-01"} 
        for c in (US_SAMPLES + UK_CODES + ME_CODES)
    ]
    print(f"Uploading {len(intl)} International/Common codes...")
    rest_upsert("medical_codes", intl)

    # 3. CARC/RARC codes
    carc = [{"code": c[0], "description": c[1], "effective_date": "2024-01-01"} for c in CARC_CODES]
    print(f"Uploading {len(carc)} CARC codes...")
    rest_upsert("carc_codes", carc)

    rarc = [{"code": c[0], "description": c[1], "effective_date": "2024-01-01"} for c in RARC_CODES]
    print(f"Uploading {len(rarc)} RARC codes...")
    rest_upsert("rarc_codes", rarc)

    print("=" * 60)
    print("  Pipeline complete!")
    print("=" * 60)
