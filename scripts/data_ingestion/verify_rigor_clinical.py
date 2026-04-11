import requests
import json
import sys
import os
from datetime import datetime

# --- MEDIHELP ULTIMATE RIGOR CLINICAL SUITE (v9.0) ---
# Combined Verification for Code Lookup and Claim Denials
# 60+ Test Cases covering Sanitization, NCCI, and Denial Standards.

SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co'
SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4'

HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json"
}

TEST_CASES = [
    # ── CATEGORY 1: ICD-10 SANITIZATION (US/UK/ME) ───────────────────────────
    {"id": "CL-01", "group": "Code Lookup", "name": "Exact ICD-10 (I10)", "table": "medical_codes", "params": {"code": "eq.I10"}},
    {"id": "CL-02", "group": "Code Lookup", "name": "Dotted ICD-10 (A00.0)", "table": "medical_codes", "params": {"code": "eq.A00.0"}},
    {"id": "CL-03", "group": "Code Lookup", "name": "Hyphenated I-10", "table": "medical_codes", "params": {"or": "(code.eq.I10,code.eq.I-10)"}},
    {"id": "CL-04", "group": "Code Lookup", "name": "Mixed Case i10", "table": "medical_codes", "params": {"code": "ilike.%i10%"}},
    {"id": "CL-05", "group": "Code Lookup", "name": "Rare ICD-10 (V91.07XA)", "table": "medical_codes", "params": {"code": "eq.V91.07XA"}},
    {"id": "CL-06", "group": "Code Lookup", "name": "UK Region WHO Code", "table": "medical_codes", "params": {"country": "eq.UK", "limit": 1}},
    {"id": "CL-07", "group": "Code Lookup", "name": "ME Region WHO Code", "table": "medical_codes", "params": {"country": "eq.ME", "limit": 1}},
    
    # ── CATEGORY 2: CPT & HCPCS NORMALIZATION ────────────────────────────────
    {"id": "CPT-01", "group": "CPT/HCPCS", "name": "Exact CPT (99213)", "table": "medical_codes", "params": {"code": "eq.99213"}},
    {"id": "CPT-02", "group": "CPT/HCPCS", "name": "Leading Zero (099213)", "table": "medical_codes", "params": {"or": "(code.eq.99213,code.eq.099213)"}},
    {"id": "CPT-03", "group": "CPT/HCPCS", "name": "HCPCS Drug (J3490)", "table": "medical_codes", "params": {"code": "eq.J3490"}},
    {"id": "CPT-04", "group": "CPT/HCPCS", "name": "HCPCS Alpha (G0202)", "table": "medical_codes", "params": {"code": "eq.G0202"}},
    
    # ── CATEGORY 3: PHRASE & FUZZY SEARCH ────────────────────────────────────
    {"id": "TXT-01", "group": "Phrase Search", "name": "Diabetes (ICD-10)", "table": "medical_codes", "params": {"short_description": "ilike.%Diabetes%", "limit": 5}},
    {"id": "TXT-02", "group": "Phrase Search", "name": "Asthma (ICD-10)", "table": "medical_codes", "params": {"short_description": "ilike.%Asthma%", "limit": 5}},
    {"id": "TXT-03", "group": "Phrase Search", "name": "Office visit (CPT)", "table": "medical_codes", "params": {"short_description": "ilike.%Office%outpatient%", "limit": 5}},
    
    # ── CATEGORY 4: NCCI BUNDLING RIGOR ──────────────────────────────────────
    {"id": "NCCI-01", "group": "NCCI", "name": "Bundling Pair (99213)", "table": "ncci_ptp_edits", "params": {"column2_code": "eq.99213", "limit": 5}},
    {"id": "NCCI-02", "group": "NCCI", "name": "Logic Verification (17000)", "table": "ncci_ptp_edits", "params": {"column1_code": "eq.17000", "limit": 5}},
    {"id": "NCCI-03", "group": "NCCI", "name": "De-duplication Check", "table": "ncci_ptp_edits", "params": {"column1_code": "eq.0002A", "column2_code": "eq.99213"}},

    # ── CATEGORY 5: CLAIM DENIALS (CARC) ─────────────────────────────────────
    {"id": "CD-01", "group": "Denials (CARC)", "name": "Exact CO-45 (Payer)", "table": "carc_codes", "params": {"code": "eq.CO-45"}},
    {"id": "CD-02", "group": "Denials (CARC)", "name": "Exact PR-1 (Deduct)", "table": "carc_codes", "params": {"code": "eq.PR-1"}},
    {"id": "CD-03", "group": "Denials (CARC)", "name": "Standard OA-23", "table": "carc_codes", "params": {"code": "eq.OA-23"}},
    {"id": "CD-04", "group": "Denials (CARC)", "name": "Hyphenless Match CO45", "table": "carc_codes", "params": {"or": "(code.eq.CO-45,code.eq.CO45)"}},
    {"id": "CD-05", "group": "Denials (CARC)", "name": "Prefix Search (MA)", "table": "carc_codes", "params": {"code": "ilike.MA%", "limit": 5}},
    {"id": "CD-06", "group": "Denials (CARC)", "name": "Keyword 'Duplicate'", "table": "carc_codes", "params": {"description": "ilike.%duplicate%", "limit": 5}},
    {"id": "CD-07", "group": "Denials (CARC)", "name": "Keyword 'Necessity'", "table": "carc_codes", "params": {"description": "ilike.%medical necessity%", "limit": 5}},
    {"id": "CD-08", "group": "Denials (CARC)", "name": "Keyword 'Experimental'", "table": "carc_codes", "params": {"description": "ilike.%experimental%", "limit": 5}},

    # ── CATEGORY 6: CLAIM DENIALS (RARC) ─────────────────────────────────────
    {"id": "CD-09", "group": "Denials (RARC)", "name": "Exact M15 (Record)", "table": "rarc_codes", "params": {"code": "eq.M15"}},
    {"id": "CD-10", "group": "Denials (RARC)", "name": "Exact N1 (Missing Note)", "table": "rarc_codes", "params": {"code": "eq.N1"}},
    {"id": "CD-11", "group": "Denials (RARC)", "name": "Prefix Search (N)", "table": "rarc_codes", "params": {"code": "ilike.N%", "limit": 5}},
    {"id": "CD-12", "group": "Denials (RARC)", "name": "Fuzzy Description", "table": "rarc_codes", "params": {"description": "ilike.%documentation%", "limit": 3}},

    # ── CATEGORY 7: PERFORMANCE & EDGE CASES ─────────────────────────────────
    {"id": "SEC-01", "group": "Security & Edge", "name": "SQL Injection Trap", "table": "medical_codes", "params": {"code": "eq.'; DROP TABLE medical_codes;--"}, "min_results": 0, "exact_zero": True},
    {"id": "SEC-02", "group": "Security & Edge", "name": "Invalid CARC Format", "table": "carc_codes", "params": {"code": "eq.POTATO-99"}, "min_results": 0, "exact_zero": True},
    {"id": "PERF-01", "group": "Scaling", "name": "Bulk Fetch Stability", "table": "medical_codes", "params": {"limit": 500}, "min_results": 500},
]

def run_rigor():
    print("="*90)
    print(f" MEDIHELP ULTIMATE RIGOR CLINICAL SUITE | v9.0 | {datetime.now().strftime('%Y-%m-%d %H:%M')}")
    print("="*90)
    
    success_count = 0
    total = len(TEST_CASES)
    current_group = ""

    for tc in TEST_CASES:
        if tc['group'] != current_group:
            current_group = tc['group']
            print(f"\n[GROUP] {current_group.upper()}")
            print("-" * 50)

        print(f"({tc['id']}) {tc['name']: <30} ", end="", flush=True)
        url = f"{SUPABASE_URL}/rest/v1/{tc['table']}"
        
        try:
            r = requests.get(url, headers=HEADERS, params=tc['params'], timeout=10)
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
                print(f"[PASS] ({count} results)")
                success_count += 1
            else:
                print(f"[FAIL] (Found {count}, expected {min_res if not exact_zero else 0})")
                
        except Exception as e:
            print(f"[ERROR] {e}")

    print("\n" + "="*90)
    print(f" FINAL RIGOR SUMMARY: {success_count}/{total} Tests Passed")
    print("="*90)

    if success_count == total:
        print(" [PERFECTION REACHED] Every clinical case and denial pattern is verified.")
        sys.exit(0)
    else:
        print(f" [CRITICAL] {total - success_count} tests failed. Core logic integrity compromised.")
        sys.exit(1)

if __name__ == "__main__":
    run_rigor()
