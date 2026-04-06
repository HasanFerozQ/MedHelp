import os
import csv
import requests

# Manually load .env file to avoid dependency issues
def manual_load_dotenv():
    if os.path.exists(".env"):
        with open(".env", "r") as f:
            for line in f:
                if "=" in line and not line.startswith("#"):
                    key, value = line.strip().split("=", 1)
                    os.environ[key] = value

manual_load_dotenv()

SUPABASE_URL = os.getenv("NEXT_PUBLIC_SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_SERVICE_ROLE_KEY")

if not SUPABASE_URL or not SUPABASE_KEY:
    print("Error: NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY not found in .env")
    exit(1)

FILE_PATH = "data/ncci_ptp.csv"
BATCH_SIZE = 5000
API_URL = f"{SUPABASE_URL}/rest/v1/ncci_ptp_edits"

headers = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json",
    "Prefer": "resolution=merge-duplicates"
}

def run_ingestion():
    if not os.path.exists(FILE_PATH):
        print(f"Error: {FILE_PATH} not found.")
        return

    print(f"Starting NCCI PTP Ingestion (675k+ rows)... This will take a few minutes.")
    
    with open(FILE_PATH, mode='r', encoding='utf-8-sig') as f:
        # The AMA disclaimer is lines 1-2. Line 3 is the ACTUAL header.
        f.readline()
        f.readline()
        
        reader = csv.DictReader(f)
        batch_dict = {} # Use a dict to deduplicate locally
        total_processed = 0

        for row in reader:
            col1 = (row.get('Column 1') or row.get('Column1') or "").strip().upper()
            col2 = (row.get('Column 2') or row.get('Column2') or "").strip().upper()
            
            if not col1 or not col2 or len(col1) > 7 or '*' in col1:
                continue

            modifier = row.get('Modifier') or '0'
            
            # Key for deduplication
            pair_key = f"{col1}_{col2}"
            batch_dict[pair_key] = {
                "column1_code": col1,
                "column2_code": col2,
                "modifier_allowed": str(modifier)[:1]
            }

            if len(batch_dict) >= BATCH_SIZE:
                payload = list(batch_dict.values())
                response = requests.post(API_URL, headers=headers, json=payload)
                if response.status_code not in [200, 201]:
                    print(f"Error in batch: {response.text}")
                else:
                    total_processed += len(payload)
                    print(f"Processed {total_processed} pairs...")
                batch_dict = {}

        # Final batch
        if batch_dict:
            payload = list(batch_dict.values())
            response = requests.post(API_URL, headers=headers, json=payload)
            if response.status_code in [200, 201]:
                total_processed += len(payload)
            
    print(f"NCCI Ingestion Complete! Total: {total_processed}")

if __name__ == "__main__":
    run_ingestion()
