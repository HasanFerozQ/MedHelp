import requests
import os

# --- Supabase Config ---
SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co'
# Note: In production we'd use the anon key for public search testing
SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4'

HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json"
}

def test_search(query_label, query_string, filter_params=None):
    print(f"\n--- Testing: {query_label} ({query_string}) ---")
    url = f"{SUPABASE_URL}/rest/v1/medical_codes"
    
    params = {
        "select": "code,short_description,country,code_type",
        "limit": 5
    }
    
    if filter_params:
        params.update(filter_params)
    
    try:
        r = requests.get(url, headers=HEADERS, params=params)
        r.raise_for_status()
        data = r.json()
        
        if not data:
            print("  [NOT FOUND] No results.")
        else:
            for item in data:
                print(f"  [{item['country']}] {item['code']}: {item['short_description'][:60]}...")
    except Exception as e:
        print(f"  [ERROR] {e}")

if __name__ == "__main__":
    print("="*60)
    print(" MediHelp Search Perfection - Programmatic Verification")
    print("="*60)

    # 1. Exact Code Search (US)
    test_search("Exact HCPCS (US)", "99213", {"code": "eq.99213", "country": "eq.US"})

    # 2. Description Search with Spaces
    # Simulate: short_description.ilike.%Drugs%unclassified% 
    test_search("Phrase Search", "Drugs unclassified", {"short_description": "ilike.%Drugs%unclassified%"})

    # 3. Medical Abbreviation (2-char word)
    test_search("Abbreviation", "CT", {"short_description": "ilike.%CT%"})

    # 4. Region Specificity (UK vs US)
    test_search("UK ICD-10 Check", "I10", {"code": "eq.I10", "country": "eq.UK"})
    test_search("US ICD-10 Check", "I10", {"code": "eq.I10", "country": "eq.US"})

    # 5. NCCI Lookup Check
    print("\n--- Testing: NCCI Bundling Edits (99213) ---")
    ncci_url = f"{SUPABASE_URL}/rest/v1/ncci_ptp_edits"
    try:
        r = requests.get(ncci_url, headers=HEADERS, params={"column1_code": "eq.99213", "limit": 3})
        r.raise_for_status()
        ncci_data = r.json()
        if ncci_data:
            print(f"  [FOUND] 99213 bundles: {[item['column2_code'] for item in ncci_data]}")
        else:
            print("  [NOT FOUND] No bundling edits found.")
    except Exception as e:
        print(f"  [ERROR] {e}")

    print("\n"+"="*60)
    print(" Verification Complete")
    print("="*60)
