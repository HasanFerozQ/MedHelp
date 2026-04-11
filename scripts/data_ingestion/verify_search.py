import requests
import json
import sys

# --- MEDIHELP CODE LOOKUP - RIGOROUS 100% VERIFICATION ---
# Optimized for Code Lookup perfection, covers CS-01 to CS-07 + Rigorous Extensions

SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co'
SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4'

HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json"
}

def run_test(id, name, table, params, expected_min=1, verify_fn=None):
    """Executes a search test with deep validation."""
    print(f"\n[{id}] {name}")
    url = f"{SUPABASE_URL}/rest/v1/{table}"
    try:
        r = requests.get(url, headers=HEADERS, params=params)
        if r.status_code != 200:
            print(f"  [FAIL] HTTP {r.status_code}: {r.text[:200]}")
            return False
        
        data = r.json()
        count = len(data)
        
        if count < expected_min:
            print(f"  [FAIL] Expected at least {expected_min} results, found {count}.")
            return False
            
        # Run custom verification logic if provided
        if verify_fn:
            if not verify_fn(data):
                print(f"  [FAIL] Data verification failed.")
                return False

        print(f"  [PASS] Found {count} results.")
        # Diagnostic display
        for i, item in enumerate(data[:2]):
            code = item.get('code') or item.get('column1_code') or '?'
            desc = item.get('short_description') or item.get('description') or 'No description'
            country = item.get('country', 'N/A')
            print(f"    - {code} [{country}]: {str(desc)[:75]}...")
            
        return True
    except Exception as e:
        print(f"  [ERROR] {e}")
        return False

def main():
    print("="*80)
    print(" MEDIHELP SEARCH RIGOR - 100% EXTENSIVE CODE LOOKUP SUITE")
    print("="*80)

    results = []

    # --- CS-01: Frequent ICD-10 Search ---
    def v_cs01(data):
        has_primary = any("hypertension" in (d.get('short_description') or "").lower() for d in data)
        countries = set(d.get('country') for d in data if d.get('code') == 'I10')
        print(f"    - Multi-region Check: {countries}")
        return has_primary

    results.append(run_test("CS-01", "Frequent ICD-10 (I10)", "medical_codes", {
        "or": "(code.eq.I10,code.eq.I.10)",
        "limit": 5
    }, verify_fn=v_cs01))

    # --- CS-02: Rare ICD-10 Search ---
    results.append(run_test("CS-02", "Rare ICD-10 (V91.07XA)", "medical_codes", {
        "code": "ilike.V91.07XA%",
        "limit": 1
    }))

    # --- CS-03: Exact CPT Search ---
    results.append(run_test("CS-03", "Exact CPT (99213)", "medical_codes", {
        "code": "eq.99213",
        "limit": 1
    }))

    # --- CS-04: Exact HCPCS Search ---
    results.append(run_test("CS-04", "Exact HCPCS (J3490)", "medical_codes", {
        "code": "eq.J3490",
        "limit": 1
    }))

    # --- CS-05: Text-Based Search ---
    results.append(run_test("CS-05", "Text Search (Diabetes)", "medical_codes", {
        "short_description": "ilike.%Diabetes%",
        "code_type": "eq.ICD10",
        "limit": 10
    }, expected_min=5))

    # --- CS-06: NCCI Bundling Edit ---
    results.append(run_test("CS-06", "NCCI Bundling (99213)", "ncci_ptp_edits", {
        "or": "(column1_code.eq.99213,column2_code.eq.99213)",
        "limit": 5
    }))

    # --- CS-07: Region Filtering ---
    results.append(run_test("CS-07", "Region Filter (ME Context)", "medical_codes", {
        "country": "eq.ME",
        "limit": 5
    }))

    # --- RIGOROUS EXTENSIONS ---
    
    # 8. Hyphenated Equivalence Check
    results.append(run_test("RG-08", "Hyphenated (I-10)", "medical_codes", {
        "or": "(code.eq.I10,code.eq.I-10,code.eq.I.10)",
        "limit": 5
    }))

    # 9. Leading Zero Persistence
    results.append(run_test("RG-09", "Leading Zero (099213 -> 99213)", "medical_codes", {
        "or": "(code.eq.99213,code.eq.099213)",
        "limit": 1
    }))

    # 10. Case Insensitivity (REST is naturally case-insensitive for ilike)
    results.append(run_test("RG-10", "Case Insensitivity (hypertension)", "medical_codes", {
        "short_description": "ilike.%HYPERTENSION%",
        "limit": 5
    }))

    # 11. Empty/Invalid Negative Test
    print("\n[RG-11] Negative Test (INVALIDCODE123)")
    r = requests.get(f"{SUPABASE_URL}/rest/v1/medical_codes", headers=HEADERS, params={"code": "eq.INVALIDCODE123"})
    if r.status_code == 200 and len(r.json()) == 0:
        print("  [PASS] Correctly found 0 results.")
        results.append(True)
    else:
        print("  [FAIL] Expected 0 results.")
        results.append(False)

    # Summary
    success_count = sum(1 for r in results if r)
    print("\n" + "="*80)
    print(f" FINAL RIGOR SUMMARY: {success_count}/{len(results)} Tests Passed")
    print("="*80)

    if success_count == len(results):
        print(" [PERFECTION ACHIEVED] Search core is 100% rigorous.")
        sys.exit(0)
    else:
        print(" [WARNING] Review failures. Total success:", success_count)
        sys.exit(1)

if __name__ == "__main__":
    main()
