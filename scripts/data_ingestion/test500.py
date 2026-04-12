import requests

SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co'
SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4'

HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json"
}

def test_query(or_str):
    url = f"{SUPABASE_URL}/rest/v1/medical_codes"
    r = requests.get(url, headers=HEADERS, params={"or": f"({or_str})", "limit": 10})
    print(f"[{r.status_code}] {or_str}")
    if r.status_code != 200:
        print(r.text)

test_query('code.ilike."I10%",short_description.ilike."%I10%"')
test_query('code.ilike."I10%",code.ilike."I10%",code.ilike."I10%",code.ilike."I10%",short_description.ilike."%I10%"')
test_query('code.ilike."i10%",code.ilike."I10%",code.ilike."I10%",code.ilike."I10%",short_description.ilike."%i10%"')
