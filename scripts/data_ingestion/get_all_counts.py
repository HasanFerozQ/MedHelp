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
tables = [
    ('medical_codes', '~74,000+'),
    ('cpt_medicare_fees', '~10,000+'),
    ('ncci_ptp_edits', '~500,000+'),
    ('mue_limits', '~17,000+'),
    ('carc_codes', '~400+'),
    ('rarc_codes', '~1,200+'),
    ('hcpcs_drug_fees', '~3,000+')
]

print(f"{'Table Name':<20} | {'Current Row Count':<18} | {'Minimum Required For Live Site'}")
print("-" * 75)

for t, expected in tables:
    try:
        r = requests.get(f"{url}/rest/v1/{t}?select=count", headers=headers)
        if r.status_code in [200, 206]:
            count = int(r.headers.get("Content-Range", "0/0").split("/")[-1])
            status = "✅ PASS" if count > 0 else "❌ FAILED / EMPTY"
            
            # Simple soft threshold warnings
            if "74,000" in expected and count < 50000: status = "⚠️ TRUNCATED"
            if "500,000" in expected and count < 100000: status = "⚠️ TRUNCATED"
            
            print(f"{t:<20} | {count:<18} | {expected:<10} [{status}]")
        else:
            print(f"{t:<20} | Error {r.status_code:<12} | {expected}")
    except Exception as e:
        print(f"{t:<20} | Failed: {str(e)[:15]:<10} | {expected}")
