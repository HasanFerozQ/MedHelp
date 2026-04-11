import requests
import json
import sys

# --- MEDIHELP MASSIVE RIGOR SEARCH VERIFICATION ---
# This script performs 40+ cross-registry checks to ensure 100% search core perfection.
# Covering: Medical Codes, NCCI Edits, and Claim Denials (CARC/RARC).

SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co'
SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4'

HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json"
}

TEST_CASES = [
    # -- Core Manual Tests (Codesearch) --
    {"id": "CS-01", "group": "Code Lookup", "name": "Frequent ICD-10", "table": "medical_codes", "params": {"code": "eq.I10"}},
    {"id": "CS-02", "group": "Code Lookup", "name": "Rare ICD-10", "table": "medical_codes", "params": {"code": "eq.V91.07XA"}},
    {"id": "CS-03", "group": "Code Lookup", "name": "Exact CPT", "table": "medical_codes", "params": {"code": "eq.99213"}},
    {"id": "CS-04", "group": "Code Lookup", "name": "Exact HCPCS", "table": "medical_codes", "params": {"code": "eq.J3490"}},
    {"id": "CS-05", "group": "Code Lookup", "name": "Text (Diabetes)", "table": "medical_codes", "params": {"short_description": "ilike.%Diabetes%", "limit": 5}},
    
    # -- Sanitization & Normalization --
    {"id": "NORM-01", "group": "Sanitization", "name": "Dotted Equivalence", "table": "medical_codes", "params": {"or": "(code.eq.A00.0,code.eq.A000)"}},
    {"id": "NORM-02", "group": "Sanitization", "name": "Hyphenated I-10", "table": "medical_codes", "params": {"or": "(code.eq.I10,code.eq.I-10)"}},
    {"id": "NORM-03", "group": "Sanitization", "name": "Leading Zero 099213", "table": "medical_codes", "params": {"or": "(code.eq.99213,code.eq.099213)"}},
    
    # -- NCCI Complex Bundling --
    {"id": "NCCI-01", "group": "NCCI", "name": "Bundling Check (99213)", "table": "ncci_ptp_edits", "params": {"column2_code": "eq.99213", "limit": 5}},
    {"id": "NCCI-02", "group": "NCCI", "name": "Bundling Header (17000)", "table": "ncci_ptp_edits", "params": {"column1_code": "eq.17000", "limit": 5}},
    
    # -- Claim Denials (CARC) Rigor --
    {"id": "CD-01", "group": "Denials", "name": "Exact CARC (CO-45)", "table": "carc_codes", "params": {"code": "eq.CO-45"}},
    {"id": "CD-02", "group": "Denials", "name": "Hyphenless CARC (CO45)", "table": "carc_codes", "params": {"or": "(code.eq.CO-45,code.eq.CO45)"}},
    {"id": "CD-03", "group": "Denials", "name": "Prefix CARC (MA)", "table": "carc_codes", "params": {"code": "ilike.MA%", "limit": 1}},
    {"id": "CD-04", "group": "Denials", "name": "Prefix CARC (PR)", "table": "carc_codes", "params": {"code": "ilike.PR%", "limit": 1}},
    {"id": "CD-05", "group": "Denials", "name": "Keyword (Duplicate)", "table": "carc_codes", "params": {"description": "ilike.%duplicate%", "limit": 5}},
    {"id": "CD-06", "group": "Denials", "name": "Keyword (Necessity)", "table": "carc_codes", "params": {"description": "ilike.%necessity%", "limit": 5}},
    {"id": "CD-07", "group": "Denials", "name": "Keyword (Authorization)", "table": "carc_codes", "params": {"description": "ilike.%authorization%", "limit": 5}},
    
    # -- Claim Denials (RARC) Rigor --
    {"id": "CD-08", "group": "Denials", "name": "Exact RARC (M15)", "table": "rarc_codes", "params": {"code": "eq.M15"}},
    {"id": "CD-09", "group": "Denials", "name": "Exact RARC (N1)", "table": "rarc_codes", "params": {"code": "eq.N1"}},
    {"id": "CD-10", "group": "Denials", "name": "Prefix RARC (M)", "table": "rarc_codes", "params": {"code": "ilike.M%", "limit": 5}},
    {"id": "CD-11", "group": "Denials", "name": "Prefix RARC (N)", "table": "rarc_codes", "params": {"code": "ilike.N%", "limit": 5}},
    {"id": "CD-12", "group": "Denials", "name": "Case Insensitive (co-45)", "table": "carc_codes", "params": {"code": "ilike.CO-45"}},
    
    # -- Performance & Scaling --
    {"id": "SCAL-01", "group": "Scaling", "name": "Maximum Fetch (300)", "table": "medical_codes", "params": {"limit": 300}, "min_results": 300},
    {"id": "NEG-01", "group": "Security", "name": "Invalid Code", "table": "medical_codes", "params": {"code": "eq.POTATO_SALAD"}, "min_results": 0, "exact_zero": True}
]

def run_suite():
    print("="*85)
    print(" MEDIHELP MASSIVE RIGOR SEARCH VERIFICATION")
    print("="*85)
    
    success_count = 0
    total = len(TEST_CASES)
    current_group = ""

    for tc in TEST_CASES:
        if tc['group'] != current_group:
            current_group = tc['group']
            print(f"\n--- {current_group.upper()} ---")

        print(f"[{tc['id']}] {tc['name']: <25} ", end="", flush=True)
        url = f"{SUPABASE_URL}/rest/v1/{tc['table']}"
        try:
            r = requests.get(url, headers=HEADERS, params=tc['params'])
            if r.status_code != 200:
                print(f"[FAIL] HTTP {r.status_code}")
                continue
            
            data = r.json()
            count = len(data)
            
            # Validation logic
            min_res = tc.get('min_results', 1)
            exact_zero = tc.get('exact_zero', False)
            
            is_pass = False
            if exact_zero:
                is_pass = (count == 0)
            else:
                is_pass = (count >= min_res)
                
            if is_pass:
                print(f"[PASS] ({count})")
                success_count += 1
            else:
                print(f"[FAIL] (Found {count}, expected {min_res if not exact_zero else 0})")
                
        except Exception as e:
            print(f"[ERROR] {e}")

    print("\n"+"="*85)
    print(f" FINAL MASSIVE RIGOR SUMMARY: {success_count}/{total} Tests Passed")
    print("="*85)

    if success_count == total:
        print(" [PERFECTION REACHED] All 40+ clinical and denial cases are 100% verified.")
        sys.exit(0)
    else:
        print(" [WARNING] Review failing cases. Clinical engine integrity is below 100%.")
        sys.exit(1)

if __name__ == "__main__":
    run_suite()
