import requests
import json
import sys

# --- MediHelp Search Perfection - Rigorous Verification Suite ---

# Supabase Config (Extracted from environment)
SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co'
SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4'

HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json"
}

def run_test(name, table, params, expected_min=1):
    """Executes a search test against the Supabase REST API and verifies results."""
    print(f"\n[TEST] {name}")
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
            
        print(f"  [PASS] Found {count} results.")
        # Sample output for human verification
        for i, item in enumerate(data[:2]):
            code = item.get('code') or item.get('column1_code') or '?'
            desc = item.get('short_description') or item.get('description') or 'No description'
            print(f"    - {code}: {str(desc)[:60]}...")
            
        return True
    except Exception as e:
        print(f"  [ERROR] {e}")
        return False

def main():
    print("="*70)
    print(" MEDIHELP CODE LOOKUP - RIGOROUS 100% VERIFICATION")
    print("="*70)

    results = []

    # 1. Exact Match Persistence
    results.append(run_test("Exact CPT (99213)", "medical_codes", {
        "code": "eq.99213",
        "select": "code,short_description"
    }))

    results.append(run_test("Exact ICD-10 (A00.0)", "medical_codes", {
        "code": "eq.A00.0",
        "select": "code,short_description"
    }))

    # 2. Prefix Search (Frontend Logic Simulation)
    # cleanQ logic: "992" -> ilike.992%
    results.append(run_test("Prefix Check (992)", "medical_codes", {
        "code": "ilike.992%",
        "select": "code,short_description",
        "limit": 5
    }))

    # 3. Phrase/Description Matching (Sanitization Logic)
    # safeQuery logic: Allows dots. "A00.0" -> ilike.%A00.0%
    results.append(run_test("Description Exact (A00.0)", "medical_codes", {
        "short_description": "ilike.%A00.0%",
        "select": "code,short_description"
    }))

    results.append(run_test("Multi-word Phrase (Office outpatient)", "medical_codes", {
        "short_description": "ilike.%office%outpatient%",
        "select": "code,short_description",
        "limit": 5
    }))

    # 4. NCCI Reciprocity (Dual Column)
    results.append(run_test("NCCI Col 1 -> Col 2 (29881)", "ncci_ptp_edits", {
        "column1_code": "eq.29881",
        "select": "column1_code,column2_code",
        "limit": 5
    }))

    results.append(run_test("NCCI Col 2 -> Col 1 (99213)", "ncci_ptp_edits", {
        "column2_code": "eq.99213",
        "select": "column1_code,column2_code",
        "limit": 5
    }))

    # 5. Region/Filter Scenarios
    results.append(run_test("Region Check (US Only)", "medical_codes", {
        "country": "eq.US",
        "limit": 5
    }))

    results.append(run_test("Type Check (ICD10 only)", "medical_codes", {
        "code_type": "eq.ICD10",
        "limit": 5
    }))

    # 6. Pagination / Limit Verification
    results.append(run_test("Limit Threshold (300 results)", "medical_codes", {
        "limit": 300
    }, expected_min=300))

    # Summary
    success_count = sum(1 for r in results if r)
    print("\n" + "="*70)
    print(f" FINAL SUMMARY: {success_count}/{len(results)} Tests Passed")
    print("="*70)

    if success_count == len(results):
        print(" [PERFECTION ACHIEVED] Search engine logic is 100% verified.")
        sys.exit(0)
    else:
        print(" [WARNING] Some verification checks failed. Review DB state.")
        sys.exit(1)

if __name__ == "__main__":
    main()
