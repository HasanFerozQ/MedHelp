import requests
import json

SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co'
SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4'
HEADERS = {
    'apikey': SUPABASE_KEY,
    'Authorization': f'Bearer {SUPABASE_KEY}'
}

def get_count(table):
    r = requests.get(f"{SUPABASE_URL}/rest/v1/{table}", headers=HEADERS, params={"select": "code"})
    if r.status_code == 200:
        return len(r.json())
    return 0

def get_prefixes(table):
    r = requests.get(f"{SUPABASE_URL}/rest/v1/{table}", headers=HEADERS, params={"select": "code"})
    if r.status_code == 200:
        data = r.json()
        prefixes = {}
        for row in data:
            code = row['code']
            # Get letters before numbers
            prefix = ''.join([c for c in code if c.isalpha()])
            prefixes[prefix] = prefixes.get(prefix, 0) + 1
        return prefixes
    return {}

print("============ DATABASE AUDIT ============")
carc_count = get_count("carc_codes")
rarc_count = get_count("rarc_codes")
print(f"Total CARC Codes: {carc_count} / Expected: ~400")
print(f"Total RARC Codes: {rarc_count} / Expected: ~1,200")

print("\nRARC Code Prefix Distribution:")
rarc_prefixes = get_prefixes("rarc_codes")
for p, c in sorted(rarc_prefixes.items()):
    print(f"  {p}: {c} codes")

print("\n(Note: A full RARC database usually has strong coverage across M, MA, N, and N-series prefixes. If any are abnormally low, the original CSV ingestion file may have been truncated.)")
