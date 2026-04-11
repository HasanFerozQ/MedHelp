import requests
import json

# --- Supabase Config ---
SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co'
SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4'

HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json"
}

def test_rest(label, table, params):
    print(f"\n--- Testing: {label} ---")
    url = f"{SUPABASE_URL}/rest/v1/{table}"
    try:
        r = requests.get(url, headers=HEADERS, params=params)
        if r.status_code != 200:
            print(f"  [ERROR] {r.status_code}: {r.text[:200]}")
            return
        
        data = r.json()
        if not data:
            print("  [EMPTY] No results found.")
        else:
            print(f"  [SUCCESS] Found {len(data)} results.")
            for i, item in enumerate(data[:3]):
                code = item.get('code') or item.get('column1_code') or '?'
                desc = item.get('short_description') or item.get('description')
                if not desc and table == 'ncci_ptp_edits':
                    desc = f"Bundles with {item.get('column2_code')}"
                if not desc:
                    desc = 'No description'
                print(f"    {i+1}. {code}: {str(desc)[:70]}...")
    except Exception as e:
        print(f"  [EXCEPTION] {e}")

if __name__ == "__main__":
    print("="*60)
    print(" MediHelp SEARCH PERFECTION - Final Verification")
    print("="*60)

    # 1. Raw Sample
    test_rest("Registry Sample", "medical_codes", {"limit": 1})

    # 2. Exact Match (Unquoted ilike)
    test_rest("Exact Match (99213)", "medical_codes", {
        "code": "eq.99213",
        "select": "code,short_description"
    })

    # 3. Phrase Search (Unquoted ilike)
    test_rest("Phrase Search (Office)", "medical_codes", {
        "short_description": "ilike.%Office%",
        "select": "code,short_description",
        "limit": 3
    })

    # 4. Abbreviation (Simplified pattern, unquoted)
    # Using .or() to search both code and description correctly
    test_rest("Abbreviation (CT)", "medical_codes", {
        "or": "(code.ilike.CT%,short_description.ilike.%CT%)",
        "select": "code,short_description",
        "limit": 3
    })

    # 5. NCCI Dual-Column (Unquoted)
    test_rest("NCCI (99213 check)", "ncci_ptp_edits", {
        "or": "(column1_code.eq.99213,column2_code.eq.99213)",
        "limit": 3
    })

    # 6. Denial Codes (Unquoted)
    test_rest("Denial (CO-45)", "carc_codes", {"code": "eq.CO-45"})

    print("\n"+"="*60)
    print(" Verification Complete")
    print("="*60)
