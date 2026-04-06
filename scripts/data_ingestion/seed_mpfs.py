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

FILE_PATH = "data/mpfs.csv"
BATCH_SIZE = 1000
API_URL = f"{SUPABASE_URL}/rest/v1/cpt_medicare_fees"

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

    print(f"Starting MPFS Ingestion from {FILE_PATH}...")
    
    with open(FILE_PATH, mode='r', encoding='utf-8-sig') as f:
        # SEARCH for the header row dynamically
        header_row = None
        while True:
            line = f.readline()
            if not line: break
            if "CPT" in line or "HCPCS" in line:
                header_row = line
                break
        
        if not header_row:
            print("Error: Could not find a header row containing 'CPT' or 'HCPCS'")
            return

        # Use the found line as headers
        reader = csv.DictReader(f, fieldnames=header_row.strip().split(','))
        batch_dict = {} # Use a dict to deduplicate locally
        total_processed = 0

        for row in reader:
            # Clean up keys (sometimes they have newlines or spaces from the CSV)
            clean_row = {k.strip().replace('\n', ' '): v for k, v in row.items() if k}
            
            cpt_code = next((v for k, v in clean_row.items() if 'CPT' in k or 'HCPCS' in k), None)
            
            if not cpt_code or len(cpt_code.strip()) > 5 or 'Addendum' in cpt_code:
                continue

            # Calculate estimated price
            try:
                work_rvu = float(next((v for k, v in clean_row.items() if 'Work' in k and 'RVU' in k), 0) or 0)
                pe_rvu = float(next((v for k, v in clean_row.items() if 'PE' in k and 'RVU' in k), 0) or 0)
                mp_rvu = float(next((v for k, v in clean_row.items() if 'Mal' in k and 'RVU' in k), 0) or 0)
                base_price = (work_rvu + pe_rvu + mp_rvu) * 32.74
            except (ValueError, StopIteration, TypeError):
                base_price = 0

            # Deduplicate by CPT code
            code_key = cpt_code.strip().upper()
            batch_dict[code_key] = {
                "cpt_code": code_key,
                "description": clean_row.get("DESCRIPTION", "No description")[:500],
                "base_price": round(base_price, 2),
                "status_code": clean_row.get("Status", "A")[:5],
                "rvu_work": work_rvu,
                "year": 2026
            }

            if len(batch_dict) >= BATCH_SIZE:
                payload = list(batch_dict.values())
                response = requests.post(API_URL, headers=headers, json=payload)
                if response.status_code not in [200, 201]:
                    print(f"Error in batch: {response.text}")
                else:
                    total_processed += len(payload)
                    print(f"Processed {total_processed} codes...")
                batch_dict = {}

        # Final batch
        if batch_dict:
            payload = list(batch_dict.values())
            response = requests.post(API_URL, headers=headers, json=payload)
            if response.status_code in [200, 201]:
                total_processed += len(payload)
            
    print(f"MPFS Ingestion Complete! Total: {total_processed}")

if __name__ == "__main__":
    run_ingestion()
