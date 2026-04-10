import os
import requests

# Manually load .env file
def manual_load_dotenv():
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
    print("\n[ERROR] Supabase credentials missing!")
    print("Please ensure your .env file exists in the root directory and contains:")
    print("  NEXT_PUBLIC_SUPABASE_URL=...")
    print("  SUPABASE_SERVICE_ROLE_KEY=...\n")
    exit(1)

BATCH_SIZE = 1000
API_URL = f"{SUPABASE_URL}/rest/v1/medical_codes"

headers = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json",
    "Prefer": "resolution=merge-duplicates"
}

def format_icd10_code(raw_code, is_cm=True):
    """
    Standard ICD-10-CM format: XXX.XXXX
    PCS codes typically do not use dots in official CMS files.
    """
    raw_code = raw_code.strip()
    if not is_cm:
        return raw_code
    
    if len(raw_code) > 3 and "." not in raw_code:
        return f"{raw_code[:3]}.{raw_code[3:]}"
    return raw_code

def parse_icd_file(file_path, code_type="ICD10", is_cm=True):
    if not os.path.exists(file_path):
        print(f"Warning: {file_path} not found. Skipping...")
        return []

    print(f"Parsing {file_path}...")
    codes = []
    
    # Handle CSV Fallbacks (e.g. from GitHub)
    if file_path.endswith('.csv'):
        import csv
        with open(file_path, "r", encoding="utf-8-sig") as f:
            reader = csv.reader(f)
            for row in reader:
                if not row or len(row) < 3: continue
                # Format in GitHub Fallback: Prefix, SubID, Code, Desc, LongDesc, Category
                raw_code = row[2].strip()
                desc = row[3].strip()
                codes.append({
                    "code": format_icd10_code(raw_code, is_cm),
                    "code_type": code_type,
                    "short_description": desc[:950],
                    "long_description": row[4].strip() if len(row) > 4 else desc,
                    "country": "US"
                })
        return codes

    # Handle Fixed-Width Order Files (CMS Standard)
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            if len(line) < 80:
                continue
            raw_code = line[6:13].strip()
            short_desc = line[16:77].strip()
            long_desc = line[77:].strip()
            if not raw_code: continue
            codes.append({
                "code": format_icd10_code(raw_code, is_cm),
                "code_type": code_type,
                "short_description": short_desc,
                "long_description": long_desc,
                "country": "US"
            })
    return codes

def run_ingestion():
    data_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "data")
    
    targets = [
        {"file": "icd10cm.csv", "type": "ICD10", "is_cm": True},
        {"file": "icd10cm.txt", "type": "ICD10", "is_cm": True},
        {"file": "icd10pcs.txt", "type": "ICD10PCS", "is_cm": False}
    ]
    
    for target in targets:
        file_path = os.path.join(data_dir, target["file"])
        all_codes = parse_icd_file(file_path, target["type"], target["is_cm"])
        
        if not all_codes:
            continue
            
        print(f"Seeding {len(all_codes)} codes for {target['type']}...")
        total_processed = 0
        
        for i in range(0, len(all_codes), BATCH_SIZE):
            try:
                batch = all_codes[i:i + BATCH_SIZE]
                
                # De-duplicate batch by 'code' to prevent PostgREST/PostgreSQL 
                # "ON CONFLICT DO UPDATE command cannot affect row a second time"
                # We keep the last occurrence in the batch.
                deduped_batch = list({item['code']: item for item in batch}.values())
                
                response = requests.post(API_URL, headers=headers, json=deduped_batch)
                
                if response.status_code not in [200, 201, 204]:
                    print(f"Error in batch starting at {i}: {response.text}")
                else:
                    total_processed += len(deduped_batch)
                    # Use a more visible progress print
                    if (i // BATCH_SIZE) % 5 == 0:
                        print(f"  Batch {i//BATCH_SIZE + 1} uploaded... Total: {total_processed}")
            except Exception as e:
                print(f"Unexpected error in batch starting at {i}: {e}")
                continue
        
        print(f"Finished {target['type']}. Total: {total_processed}")

if __name__ == "__main__":
    run_ingestion()
