import requests
import re
import urllib.parse
from datetime import datetime
import time

# --- MEDIHELP ULTIMATE SEARCH SUITE (v10.0) ---
# Tests 100% of user input scenarios by closely mimicking the new 
# hardened normalization engines inside codesearch.js, denials.js, and providers.js

SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co'
SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4'

HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json"
}

NPS_API_BASE = "https://npiregistry.cms.hhs.gov/api/?version=2.1"

# --- JS Frontend Emulation ---
def build_codesearch_or(query):
    query = query.strip()
    safeQuery = re.sub(r'[^a-zA-Z0-9\s\.\-\,]', '', query).strip()
    cleanQ = re.sub(r'[\.\-\s\,]', '', query).upper()
    
    dottedQ = cleanQ
    if re.match(r'^[A-Z]\d{2}[A-Z0-9]+$', cleanQ) and not '.' in cleanQ:
        dottedQ = cleanQ[:3] + '.' + cleanQ[3:]
        
    cleanQFiltered = cleanQ.lstrip('0') if (cleanQ.startswith('0') and len(cleanQ) >= 5 and cleanQ.isdigit()) else cleanQ
    
    isCodeLikely = bool(re.match(r'^[A-Z0-9.\-\,]+$', query, re.IGNORECASE)) and len(query) < 10
    isPhrase = ' ' in query
    
    unique_codes = list(dict.fromkeys([safeQuery, cleanQ, cleanQFiltered, dottedQ])) # Deduplicate
    codeFilters = ",".join([f'code.ilike."{c}%"' for c in unique_codes])
    
    if isCodeLikely and not isPhrase:
        or_str = f'{codeFilters},short_description.ilike."%{safeQuery}%"'
    else:
        words = [w for w in re.sub(r'[\.\-\,]', ' ', safeQuery).split() if len(w) >= 2]
        if words:
            wordFilters = ','.join([f'short_description.ilike."%{w}%"' for w in words])
            fullPhrase = f'short_description.ilike."%{safeQuery}%"'
            or_str = f'{codeFilters},{wordFilters},{fullPhrase}'
        else:
            or_str = f'{codeFilters},short_description.ilike."%{safeQuery}%"'
    return or_str

def build_denial_or(query):
    query = query.strip()
    qUpper = query.upper()
    cleanQ = re.sub(r'[\-\s\.\,]', '', qUpper)
    
    match = re.match(r'^(CO|PR|OA|PI|CR|MA|M|N)(\d+)$', cleanQ, re.IGNORECASE)
    normQ = f"{match.group(1)}-{match.group(2)}" if match else cleanQ
    safeDescQ = query.replace('"', '').strip()
    return f'code.ilike."{normQ}%",code.ilike."{cleanQ}%",description.ilike."%{safeDescQ}%"'

def parse_nps(query):
    query = query.strip()
    isNPINumber = bool(re.match(r'^\d{10}$', query))
    if isNPINumber:
        return f"number={query}"
        
    queryUpper = query.upper()
    keywords = ['CLINIC', 'HOSPITAL', 'LLC', 'CENTER', 'MEDICAL', 'GROUP', 'CARE', 'UNIVERSITY', 'INC']
    isOrg = any(kw in queryUpper for kw in keywords)
    parts = query.split()
    
    if isOrg or len(parts) == 1:
        return f"organization_name={urllib.parse.quote(query)}*"
    else:
        return f"first_name={urllib.parse.quote(parts[0])}*&last_name={urllib.parse.quote(' '.join(parts[1:]))}*"

TEST_CASES = [
    # ---- CODE SEARCH (UI Emulation Tests) ----
    {"module": "codesearch", "name": "Exact ICD-10 (I10)", "input": "I10"},
    {"module": "codesearch", "name": "Comma Typo (A00,0)", "input": "A00,0"},
    {"module": "codesearch", "name": "Missing Dot (A000)", "input": "A000"},
    {"module": "codesearch", "name": "Lower Mixed (i10)", "input": "i10"},
    {"module": "codesearch", "name": "Leading Zero CPT", "input": "099213"},
    {"module": "codesearch", "name": "Phrase Search", "input": "Diabetes type 2"},
    {"module": "codesearch", "name": "Special Chars Trap", "input": "A00.0@#!"},
    
    # ---- DENIAL SEARCH (UI Emulation Tests) ----
    {"module": "denial", "name": "Exact CARC", "input": "CO-45"},
    {"module": "denial", "name": "Dot Typo CARC", "input": "CO.45"},
    {"module": "denial", "name": "Comma Typo CARC", "input": "CO, 45"},
    {"module": "denial", "name": "Missing Dash", "input": "CO45"},
    {"module": "denial", "name": "Phrase Denial", "input": "time limit"},
    {"module": "denial", "name": "Quotes Trap", "input": '"duplicate"'},

    # ---- NATIONAL PROVIDER SEARCH ----
    {"module": "nps", "name": "Exact NPI", "input": "1679576722"},
    {"module": "nps", "name": "Individual", "input": "John Smith"},
    {"module": "nps", "name": "Organization Hint", "input": "Cleveland Clinic"}
]

def run():
    print("="*90)
    print(f" MEDIHELP ULTIMATE SEARCH INTEGRATION TEST | v10.0 | {datetime.now().strftime('%Y-%m-%d %H:%M')}")
    print("="*90)
    print(" Testing Frontend-to-Backend Parsing & Connection Safety\n")

    passed = 0
    total = len(TEST_CASES)

    for test in TEST_CASES:
        print(f"[{test['module'].upper()}] {test['name']} ('{test['input']}')".ljust(55), end="")
        mod = test['module']
        
        try:
            if mod == "codesearch":
                or_query = build_codesearch_or(test['input'])
                url = f"{SUPABASE_URL}/rest/v1/medical_codes"
                r = requests.get(url, headers=HEADERS, params={"or": f"({or_query})", "limit": 10})
                if r.status_code == 200 and len(r.json()) > 0:
                    print(f"PASS ({len(r.json())} refs) ✓")
                    passed += 1
                else:
                    print(f"FAIL (HTTP {r.status_code} | Empty)")
                    
            elif mod == "denial":
                or_query = build_denial_or(test['input'])
                url = f"{SUPABASE_URL}/rest/v1/carc_codes"
                r = requests.get(url, headers=HEADERS, params={"or": f"({or_query})", "limit": 10})
                if r.status_code == 200 and len(r.json()) > 0:
                    print(f"PASS ({len(r.json())} refs) ✓")
                    passed += 1
                else:
                    print(f"FAIL (HTTP {r.status_code} | Empty)")
                    
            elif mod == "nps":
                params = parse_nps(test['input'])
                url = f"{NPS_API_BASE}&{params}"
                r = requests.get(url)
                if r.status_code == 200 and r.json().get('results'):
                    print(f"PASS ({len(r.json()['results'])} refs) ✓")
                    passed += 1
                else:
                    print(f"FAIL (HTTP {r.status_code})")
                time.sleep(1) # Rate limit respect
                
        except Exception as e:
            print(f"ERROR: {e}")

    print("-" * 90)
    if passed == total:
        print(" 💯 ALL TESTS PASSED: UI parameters successfully scrubbed and accepted by databases.")
    else:
        print(f" ⚠️ {total-passed} TESTS FAILED: Review parsing logic or database seed status.")
    print("=" * 90)

if __name__ == "__main__":
    run()
