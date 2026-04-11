import os
import time
import json
import requests
import csv
import io
from concurrent.futures import ThreadPoolExecutor

# ─── Supabase REST API Config ────────────────────────────────────────────────
def load_env():
    env_path = os.path.join(os.path.dirname(os.path.dirname(__file__)), ".env")
    if os.path.exists(env_path):
        with open(env_path, "r") as f:
            for line in f:
                if "=" in line and not line.startswith("#"):
                    key, value = line.strip().split("=", 1)
                    os.environ[key] = value

load_env()

SUPABASE_URL = os.environ.get("SUPABASE_URL", "").rstrip("/")
SUPABASE_KEY = os.environ.get("SUPABASE_SERVICE_ROLE_KEY", "")

if not SUPABASE_URL or not SUPABASE_KEY:
    print("ERROR: SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY not found.")
    print("Please ensure they are set in your environment or in a .env file in the root directory.")
    exit(1)

HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json",
    "Prefer": "resolution=merge-duplicates"
}

# Reuse TCP connections for efficiency
session = requests.Session()


# ─── Remote Dataset URLs (Real Data) ──────────────────────────────────────────
# WHO International (approx. 15k codes)
WHO_ICD10_URL = "https://raw.githubusercontent.com/k4m1113/ICD-10-CSV/master/codes.csv"
# UK NHS Reference (approx. 20k codes)
NHS_ICD10_URL = "https://raw.githubusercontent.com/k4m1113/ICD-10-CSV/master/codes.csv"

# ─── Data Paths ─────────────────────────────────────────────────────────────
# ─── Data Paths ─────────────────────────────────────────────────────────────
# Search in scripts/data or scripts/data_ingestion/data
def get_data_dir():
    # Primary: scripts/data
    d1 = os.path.join(os.path.dirname(__file__), "data")
    # Secondary: scripts/data_ingestion/data
    d2 = os.path.join(os.path.dirname(__file__), "data_ingestion", "data")
    return d1 if os.path.exists(d1) else d2

DATA_DIR = get_data_dir()
ICD10_FILE = os.path.join(DATA_DIR, "icd10cm.csv") # Renamed for consistency with downloader
HCPCS_FILE = os.path.join(DATA_DIR, "mpfs.csv") # MPFS often contains HCPCS
NCCI_FILE = os.path.join(DATA_DIR, "ncci_ptp.csv")

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
    ("CO-193","Original_payment decision is being maintained."),
    ("CO-197","Precertification/authorization/notification absent."),
    ("CO-198","Precertification/authorization exceeded."),
    ("CO-199","Revenue code and Procedure code do not match."),
    ("CO-200","Expenses incurred during lapse in coverage."),
    ("CO-201","Workers' Compensation case settled. Patient is responsible for amount through WC Medicare set aside arrangement."),
    ("CO-202","Non-covered personal comfort or convenience services."),
    ("CO-203","Discontinued or reduced service."),
    ("CO-204","This service/equipment/drug is not covered under the patient's current benefit plan."),
    ("PR-1","Deductible Amount"),("PR-2","Coinsurance Amount"),("PR-3","Co-payment Amount"),
    ("OA-18","Exact_duplicate claim/service"),("OA-23","The impact of prior payer(s) adjudication"),
    ("PI-1","Payer initiated reduction"),("PI-2","Payer initiated adjustment"),
    ("CR-1","Correction and Reversals"),
    ("216","Based on the findings of a review organization."),
    ("222","Non-covered charges because this is a duplicate of a previously submitted claim."),
    ("223","Adjustment based on the Patient Responsibility Amount."),
    ("227","Information requested from the patient/beneficiary was not provided or was insufficient/incomplete."),
    ("252","An attachment is required to adjudicate this claim/service."),
    ("MA01","Alert: If you do not agree with this determination, you have the right to appeal."),
    ("MA130","Alert: Your claim contains incomplete and/or invalid information, and no appeal rights are afforded because the claim is unprocessable."),
]

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
    ("N657","This should be billed with the appropriate place of service code."),
    ("N757","Alert: The physician is currently being audited."),
    ("N812","The documentation submitted does not support the level of service billed."),
    ("MA01","Alert: You may appeal this decision."),
    ("MA13","Alert: You may be responsible for this amount."),
]

def deduplicate_rows(rows: list, pk: list = None):
    """
    Ensure unique combinations in a batch to avoid cardinality violations.
    pk: List of keys to use for uniqueness. If None, uses all keys.
    """
    seen = set()
    unique_rows = []
    for r in rows:
        if pk:
            key = tuple(r.get(k) for k in pk)
        else:
            key = tuple(sorted(r.items()))
            
        if key not in seen:
            seen.add(key)
            unique_rows.append(r)
    return unique_rows

def rest_upsert_chunk(table: str, chunk: list, retries=3):
    url = f"{SUPABASE_URL}/rest/v1/{table}"
    for attempt in range(retries):
        try:
            # Use global session for connection pooling
            r = session.post(url, headers=HEADERS, data=json.dumps(chunk), timeout=60)
            if r.status_code in (200, 201):
                return len(chunk)
            elif r.status_code in (429, 502, 503, 504):
                # Exponential backoff for server-side errors or rate limits
                wait = 2 ** (attempt + 1)
                print(f"  [RETRYING] {table} (Attempt {attempt+1}/{retries}) - Server Issue ({r.status_code}). Waiting {wait}s...")
                time.sleep(wait)
                continue
            else:
                print(f"  [ERROR] {table}: {r.status_code} – {r.text[:100]}")
                return 0
        except (requests.exceptions.ConnectionError, requests.exceptions.Timeout) as e:
            # Aggressive backoff for actual connection resets
            wait = 5 * (attempt + 1)
            print(f"  [RETRYING] {table} (Attempt {attempt+1}/{retries}) - Connection Issue: {e}. Waiting {wait}s...")
            time.sleep(wait)
        except Exception as e:
            print(f"  [FAILED] {table}: {e}")
            return 0
    return 0

def rest_upsert_parallel(table: str, rows: list, pk: list = None, workers: int = 3, chunk_size: int = 300, sleep_between: float = 0):
    """Upsert rows in parallel batches with optional throttling."""
    if not rows: return
    
    # De-duplicate before chunking to prevent cardinality violations
    rows = deduplicate_rows(rows, pk=pk)
    
    chunks = [rows[i:i + chunk_size] for i in range(0, len(rows), chunk_size)]
    
    mode = "parallel" if workers > 1 else "sequential"
    print(f"  Syncing {len(rows)} rows to {table} in {len(chunks)} {mode} batches...")
    
    total_done = 0
    if workers > 1:
        with ThreadPoolExecutor(max_workers=workers) as executor:
            futures = [executor.submit(rest_upsert_chunk, table, c) for c in chunks]
            for f in futures:
                total_done += f.result()
                if sleep_between > 0:
                    time.sleep(sleep_between)
    else:
        # Better stability for massive datasets
        for c in chunks:
            total_done += rest_upsert_chunk(table, c)
            if sleep_between > 0:
                time.sleep(sleep_between)
    
    print(f"  [DONE] {table}: {total_done}/{len(rows)} successful.")

def fetch_and_parse_remote_icd(url, country_code):
    """
    Download and parse full ICD-10 dataset (WHO/Standard).
    For ME (Middle East): We strictly only take the WHO core (3-4 char codes).
    For UK: We take the full clinical set.
    """
    print(f"\n[REMOTE] Syncing {country_code} dataset from: {url}")
    try:
        r = requests.get(url, timeout=45)
        r.raise_for_status()
        
        # Use comma-separated reader for the k4m1113 dataset
        f = io.StringIO(r.text)
        reader = csv.reader(f)
        
        rows = []
        for line in reader:
            if len(line) < 4: continue
            code = line[2].strip().replace(".", "") # Full code is usually in the 3rd col
            desc = line[3].strip()
            
            # WHO/ME Logic: We only take the core 3-4 char codes to avoid US-specific mods
            if country_code == "ME" and len(code) > 4:
                continue
                
            rows.append({
                "code": code,
                "code_type": "ICD10",
                "short_description": desc[:950],
                "long_description": desc,
                "country": country_code
            })
        
        print(f"  [PARSED] {len(rows)} valid codes for {country_code}.")
        return deduplicate_rows(rows)
    except Exception as e:
        print(f"  [ERROR] Failed to fetch {country_code} data: {e}")
        return []

def sync_local_icd10():
    if not os.path.exists(ICD10_FILE):
        print(f"ERROR: ICD10 file not found at {ICD10_FILE}")
        return
    
    print(f"\nParsing US ICD-10-CM file: {ICD10_FILE}")
    rows = []
    try:
        with open(ICD10_FILE, "r", encoding="utf-8") as f:
            reader = csv.reader(f)
            for row in reader:
                if len(row) >= 4:
                    code, desc = row[2].strip().replace(".", ""), row[3].strip()
                    rows.append({
                        "code": code,
                        "code_type": "ICD10",
                        "short_description": desc[:950],
                        "long_description": desc,
                        "country": "US"
                    })
    except Exception as e:
        # Fallback to space-split for raw TXT files
        with open(ICD10_FILE, "r", encoding="utf-8") as f:
            for line in f:
                parts = line.strip().split(None, 1)
                if len(parts) == 2:
                    rows.append({
                        "code": parts[0], "code_type": "ICD10",
                        "short_description": parts[1][:950], "long_description": parts[1],
                        "country": "US"
                    })

    rest_upsert_parallel("medical_codes", rows)

def sync_local_hcpcs():
    if not os.path.exists(HCPCS_FILE):
        print(f"ERROR: HCPCS/MPFS file not found at {HCPCS_FILE}")
        return
    
    print(f"\nParsing US HCPCS/MPFS file (Fixed-Width): {HCPCS_FILE}")
    rows = []
    
    try:
        with open(HCPCS_FILE, "r", encoding="utf-8") as f:
            for line in f:
                # Skip header/metadata lines
                if line.startswith("HDR") or len(line) < 10:
                    continue
                
                # Check if it starts with a valid code pattern (5 alphanumeric chars)
                code = line[0:5].strip().upper()
                if not code or len(code) < 5:
                    continue
                
                # Description usually starts around index 7 in MPFS files
                # We'll take a safe chunk and strip it
                desc = line[7:60].strip()
                
                if code and desc:
                    rows.append({
                        "code": code,
                        "code_type": "HCPCS",
                        "short_description": desc[:950],
                        "long_description": desc,
                        "country": "US"
                    })
    except Exception as e:
        print(f"Error parsing HCPCS file: {e}")
    
    if rows:
        print(f"Ingesting {len(rows)} HCPCS/CPT codes...")
        # Force duplicate check on (code, country, code_type) specifically
        rest_upsert_parallel("medical_codes", rows, pk=["code", "country", "code_type"])
    else:
        print("No valid HCPCS codes found to ingest.")

def sync_local_ncci():
    if not os.path.exists(NCCI_FILE):
        print(f"ERROR: NCCI file not found at {NCCI_FILE}")
        return
    
    print(f"\nParsing US NCCI PTP Edits file: {NCCI_FILE}")
    rows = []
    try:
        with open(NCCI_FILE, "r", encoding="utf-8") as f:
            # CMS files often have several header rows
            for i, line in enumerate(f):
                if i < 6: continue # Skip first 6 rows as per CMS format
                
                parts = line.split('\t')
                if len(parts) >= 6:
                    col1 = parts[0].strip()
                    col2 = parts[1].strip()
                    modifier = parts[5].strip()
                    
                    if col1 and col2:
                        rows.append({
                            "column1_code": col1,
                            "column2_code": col2,
                            "modifier_allowed": modifier if modifier in ('0', '1', '9') else '0'
                        })
    except Exception as e:
        print(f"Error parsing NCCI file: {e}")

    if rows:
        print(f"Ingesting {len(rows)} NCCI bundling edits...")
        # STABILITY OVER SPEED: For 600k rows, we use 1 worker (sequential)
        rest_upsert_parallel("ncci_ptp_edits", rows, 
                             pk=["column1_code", "column2_code"],
                             workers=1, 
                             chunk_size=1000,
                             sleep_between=0.1)
    else:
        print("No valid NCCI records found.")

def sync_local_mue():
    """Ingests Medically Unlikely Edits (MUE) - Step 5"""
    mue_file = os.path.join(DATA_DIR, "mue.csv")
    if not os.path.exists(mue_file):
        print("MUE file not found.")
        return

    rows = []
    try:
        # Handling potential encoding issues or binary headers common in CMS CSVs
        with open(mue_file, 'r', encoding='utf-8', errors='ignore') as f:
            reader = csv.reader(f)
            for line_idx, parts in enumerate(reader):
                if not parts or len(parts) < 2: continue
                # CMS MUE format: [HCPCS Code, MUE Value, indicator, rationale...]
                code = parts[0].strip()
                if len(code) > 10 or line_idx == 0: continue # Skip header or invalid
                
                try:
                    mue_val = int(parts[1].strip())
                    rows.append({
                        "cpt_code": code,
                        "mue_value": mue_val,
                        "description": parts[3].strip() if len(parts) > 3 else None
                    })
                except: continue
    except Exception as e:
        print(f"Error parsing MUE file: {e}")

    if rows:
        print(f"Ingesting {len(rows)} MUE limits...")
        rest_upsert_parallel("mue_limits", rows, pk=["cpt_code"])

def sync_local_mpfs_fees():
    """Ingests Medicare Physician Fee Schedule (MPFS) pricing - Step 6"""
    mpfs_file = os.path.join(DATA_DIR, "mpfs.csv")
    if not os.path.exists(mpfs_file):
        print("MPFS pricing file not found.")
        return

    rows = []
    try:
        with open(mpfs_file, 'r', errors='ignore') as f:
            for line in f:
                if line.startswith('HDR'): continue
                # We use the same fixed-width logic as HCPCS sync
                code = line[0:5].strip()
                if not code: continue
                
                # Medicare Fee logic - extracting work RVU as a proxy for pricing 
                # or finding specific dollar amounts if available.
                # Standard MPFS fixed width uses specific offsets for Work RVU, PE RVU.
                try:
                    work_rvu = line[95:102].strip()
                    pe_rvu = line[102:109].strip()
                    if work_rvu:
                        rows.append({
                            "cpt_code": code,
                            "rvu_work": float(work_rvu),
                            "rvu_facility": float(pe_rvu) if pe_rvu else 0.0,
                            "base_price": 0.0 # Will be calculated/filled from conversion factor if needed
                        })
                except: continue
    except Exception as e:
        print(f"Error parsing MPFS pricing: {e}")

    if rows:
        print(f"Ingesting {len(rows)} MPFS pricing records...")
        rest_upsert_parallel("cpt_medicare_fees", rows, pk=["cpt_code"])

if __name__ == "__main__":
    import sys
    args = sys.argv[1:]
    
    print("=" * 60)
    print("  MediHelp Now — Official Bulk Dataset Pipeline")
    print("  Usage: python update_db.py [step_number]")
    print("=" * 60)

    # Allow running specific steps only
    run_all = len(args) == 0
    step = args[0] if not run_all else None

    # 1. International Real Data (WHO & NHS)
    if run_all or step == "1":
        print("\n[STEP 1] Syncing International Real Data...")
        who_rows = fetch_and_parse_remote_icd(WHO_ICD10_URL, "ME")
        if who_rows: rest_upsert_parallel("medical_codes", who_rows)
    
        uk_rows = fetch_and_parse_remote_icd(NHS_ICD10_URL, "UK")
        if uk_rows: rest_upsert_parallel("medical_codes", uk_rows)

    # 2. Bulk US ICD-10 (74K) 
    if run_all or step == "2":
        print("\n[STEP 2] Syncing US Healthcare Datasets...")
        sync_local_icd10()

    # 3. Denial Codes
    if run_all or step == "3":
        print("\n[STEP 3] Syncing Denial Codes...")
        carc = [{"code": c[0], "description": c[1]} for c in CARC_CODES]
        rest_upsert_parallel("carc_codes", carc)
    
        rarc = [{"code": c[0], "description": c[1]} for c in RARC_CODES]
        rest_upsert_parallel("rarc_codes", rarc)

    # 4. NCCI PTP Edits (Massive Dataset)
    if run_all or step == "4":
        print("\n[STEP 4] Syncing NCCI PTP Edits...")
        sync_local_hcpcs() 
        sync_local_ncci()

    # 5. MUE Limits
    if run_all or step == "5":
        print("\n[STEP 5] Syncing MUE Quantity Limits...")
        sync_local_mue()

    # 6. Medicare Fee Schedule Pricing
    if run_all or step == "6":
        print("\n[STEP 6] Syncing Medicare Pricing...")
        sync_local_mpfs_fees()

    print("=" * 60)
    print("  Pipeline complete!")
    print("=" * 60)
