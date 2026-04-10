import os
import csv
import requests

# Manually load .env file — path relative to this script, not CWD
def manual_load_dotenv():
    env_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..', '.env')
    if os.path.exists(env_path):
        with open(env_path, "r") as f:
            for line in f:
                if "=" in line and not line.startswith("#"):
                    key, value = line.strip().split("=", 1)
                    os.environ.setdefault(key.strip(), value.strip())

manual_load_dotenv()

SUPABASE_URL = os.getenv("NEXT_PUBLIC_SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_SERVICE_ROLE_KEY")

if not SUPABASE_URL or not SUPABASE_KEY:
    print("Error: NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY not found in .env")
    exit(1)

FILE_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "data", "mpfs.csv")
BATCH_SIZE = 1000
API_URL = f"{SUPABASE_URL}/rest/v1/cpt_medicare_fees"

headers = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json",
    "Prefer": "resolution=merge-duplicates"
}

def run_ingestion():
    # Prioritize the local vision Addendum B file if it exists, otherwise use the downloaded one
    local_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "vision", "cms_1832_f_cy_2026_addenda_020426-gpci_floor_", "Addendum B Relative Value Units and Related Information CY 2026 CMS 1832-F_110325_508.txt")
    source_path = local_path if os.path.exists(local_path) else FILE_PATH
    
    print(f"Starting MPFS Ingestion from {source_path}...")
    
    with open(source_path, mode='r', encoding='latin-1') as f:
        # PEEK at the first line to determine format
        first_line = f.readline()
        f.seek(0)
        
        is_addendum_b = "\t" in first_line
        print(f"  Detected format: {'Addendum B (Tab-Delimited)' if is_addendum_b else 'Fixed-Width/CSV'}")

        batch_dict = {}
        total_processed = 0
        
        for line in f:
            if "\t" in line:
                # Addendum B Tab-Delimited Parsing
                cols = line.split("\t")
                if len(cols) < 8: continue
                cpt_code = cols[0].strip().replace('"', '')
                if not cpt_code or not cpt_code[0].isalnum() or len(cpt_code) > 5: continue
                
                try:
                    status = cols[2].strip().replace('"', '')
                    desc = cols[4].strip().replace('"', '')
                    work_rvu = float(cols[5].strip().replace('"', '') or 0)
                    pe_rvu   = float(cols[6].strip().replace('"', '') or 0)
                    mp_rvu   = float(cols[7].strip().replace('"', '') or 0)
                    
                    base_price = round((work_rvu + pe_rvu + mp_rvu) * 33.40, 2)
                    
                    if total_processed < 5:
                        print(f"  Confirming: Code={cpt_code}, Price={base_price}, Status={status}")
                except (ValueError, IndexError):
                    continue
            elif len(line) > 80:
                # Fallback Fixed-Width Parsing
                cpt_code = line[0:5].strip()
                if not cpt_code or not cpt_code[0].isalnum(): continue
                try:
                    status = line[56:58].strip()
                    work_rvu = float(line[61:69].strip() or 0)
                    pe_rvu   = float(line[70:78].strip() or 0)
                    mp_rvu   = float(line[79:87].strip() or 0)
                    base_price = round((work_rvu + pe_rvu + mp_rvu) * 33.40, 2)
                    desc = line[7:55].strip()
                except (ValueError, IndexError):
                    continue
            else:
                continue

            batch_dict[cpt_code] = {
                "cpt_code": cpt_code,
                "description": desc[:500],
                "base_price": base_price,
                "status_code": status,
                "rvu_work": work_rvu,
                "year": 2026
            }
            
            if len(batch_dict) >= BATCH_SIZE:
                payload = list(batch_dict.values())
                response = requests.post(API_URL, headers=headers, json=payload)
                if response.status_code in [200, 201]:
                    total_processed += len(payload)
                    print(f"  Processed {total_processed} codes...")
                else:
                    print(f"  Error in batch: {response.text}")
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
