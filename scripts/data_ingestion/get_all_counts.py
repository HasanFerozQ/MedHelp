import os
import requests

def manual_load_dotenv():
    env_path = os.path.join(os.getcwd(), '.env')
    if os.path.exists(env_path):
        with open(env_path, "r") as f:
            for line in f:
                if "=" in line and not line.startswith("#"):
                    parts = line.strip().split("=", 1)
                    if len(parts) == 2:
                        os.environ[parts[0].strip()] = parts[1].strip()

manual_load_dotenv()
url = os.getenv("NEXT_PUBLIC_SUPABASE_URL")
key = os.getenv("SUPABASE_SERVICE_ROLE_KEY")

if not url or not key:
    print("Credentials missing")
    exit(1)

headers = {"apikey": key, "Authorization": f"Bearer {key}", "Prefer": "count=exact"}
tables = ['medical_codes', 'cpt_medicare_fees', 'ncci_ptp_edits', 'mue_limits', 'carc_codes', 'rarc_codes']

print(f"{'Table':<20} | {'Count':<10}")
print("-" * 35)

for t in tables:
    try:
        r = requests.get(f"{url}/rest/v1/{t}?select=count", headers=headers)
        if r.status_code in [200, 206]:
            count = r.headers.get("Content-Range", "0/0").split("/")[-1]
            print(f"{t:<20} | {count:<10}")
        else:
            print(f"{t:<20} | Error {r.status_code}")
    except Exception as e:
        print(f"{t:<20} | Failed: {e}")
