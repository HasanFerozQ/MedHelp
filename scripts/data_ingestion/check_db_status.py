import os
import requests

def manual_load_dotenv():
    # Look in the root directory (two levels up from scripts/data_ingestion)
    env_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..', '.env')
    if os.path.exists(env_path):
        with open(env_path, "r") as f:
            for line in f:
                if "=" in line and not line.startswith("#"):
                    parts = line.strip().split("=", 1)
                    if len(parts) == 2:
                        key, value = parts
                        os.environ[key.strip()] = value.strip()

manual_load_dotenv()

SUPABASE_URL = os.getenv("NEXT_PUBLIC_SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_SERVICE_ROLE_KEY")

if not SUPABASE_URL or not SUPABASE_KEY:
    print("Error: Supabase credentials missing!")
    exit(1)

API_URL = f"{SUPABASE_URL}/rest/v1/medical_codes"
headers = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json"
}

def check_counts():
    print(f"Checking medical_codes table at {SUPABASE_URL}...")
    
    # Query distinct code types and counts
    # Using Supabase/PostgREST syntax for aggregation if possible, 
    # but simplest is a series of count queries or one RPC.
    # We'll just try to fetch a few of each type to see if they exist.
    
    types = ["ICD10", "ICD10PCS", "CPT", "HCPCS"]
    results = {}
    
    for t in types:
        url = f"{API_URL}?code_type=eq.{t}&select=count"
        # PostgREST Count header
        headers_count = headers.copy()
        headers_count["Prefer"] = "count=exact"
        headers_count["Range"] = "0-0"
        
        try:
            response = requests.get(url, headers=headers_count)
            if response.status_code == 200 or response.status_code == 206:
                content_range = response.headers.get("Content-Range", "0/0")
                count = content_range.split("/")[-1]
                results[t] = count
            else:
                results[t] = f"Error ({response.status_code})"
        except Exception as e:
            results[t] = f"Failed: {e}"

    print("\nSummary of codes in Supabase:")
    for t, count in results.items():
        print(f"  {t}: {count} records")

if __name__ == "__main__":
    check_counts()
