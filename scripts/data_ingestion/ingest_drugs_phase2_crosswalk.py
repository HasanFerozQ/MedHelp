import os
import csv
import re
from supabase import create_client

def load_env():
    """Manual .env loader to bypass missing environment issues."""
    env_path = '.env'
    if os.path.exists(env_path):
        with open(env_path, 'r') as f:
            for line in f:
                if '=' in line and not line.startswith('#'):
                    key, value = line.strip().split('=', 1)
                    os.environ[key] = value.strip('"').strip("'")

# Load environment variables from .env
load_env()

supabase_url = os.environ.get("NEXT_PUBLIC_SUPABASE_URL") or os.environ.get("SUPABASE_URL")
supabase_key = os.environ.get("SUPABASE_SERVICE_ROLE_KEY") or os.environ.get("SERVICE_ROLE_KEY")

if not supabase_url or not supabase_key:
    print("Error: Missing Supabase environment variables.")
    exit(1)

supabase = create_client(supabase_url, supabase_key)

# Aggregate data from multiple crosswalk files
folders = [
    'vision/april_2026_asp_ndc_hcpcs_crosswalk_033026',
    'vision/april_2026_medicare_part_b_payment_limit_file_033026_final_file'
]

drug_data = {}

print("--- PHASE 2 DRUG INGESTION (CROSSWALK EXPANSION) ---")

for folder in folders:
    if not os.path.exists(folder):
        continue
    
    for filename in os.listdir(folder):
        if not filename.lower().endswith('.csv'):
            continue
            
        file_path = os.path.join(folder, filename)
        print(f"Processing: {filename}...")
        
        try:
            with open(file_path, mode='r', encoding='latin1') as f:
                reader = csv.reader(f)
                
                # Identify headers
                headers = None
                for row in reader:
                    non_empty = [c.strip() for c in row if c.strip()]
                    if len(non_empty) >= 3 and any('hcpcs' in c.lower() or 'code' in c.lower() for c in non_empty):
                        headers = [h.lower() for h in row]
                        break
                
                if not headers:
                    print(f"  Skipping: Could not find headers in {filename}")
                    continue
                
                # Finding column indexes
                code_idx = -1
                desc_idx = -1
                price_idx = -1
                
                for i, h in enumerate(headers):
                    if 'hcpcs' in h and ('code' in h or 'cpt' in h): code_idx = i
                    if 'desc' in h or 'short' in h or 'drug name' in h: desc_idx = i
                    if any(x in h for x in ['price', 'limit', 'amt', 'rate', 'payment']): price_idx = i
                
                # Fallbacks
                if code_idx == -1: code_idx = 0
                if desc_idx == -1: desc_idx = 1
                
                count_in_file = 0
                for row in reader:
                    if len(row) <= max(code_idx, desc_idx):
                        continue
                        
                    code = row[code_idx].strip().upper()
                    # Validate HCPCS format (A-Z followed by 4 digits, or 5 digits)
                    if not re.match(r'^[A-Z0-9]{4,6}$', code):
                        continue
                        
                    desc = row[desc_idx].strip()
                    price = 0.0
                    if price_idx != -1 and len(row) > price_idx:
                        p_val = row[price_idx].replace('$', '').replace(',', '').strip()
                        try:
                            price = float(p_val)
                        except ValueError:
                            price = 0.0
                    
                    # Store distinct codes. 
                    # If duplicate, keep existing if it has a price and new one doesn't.
                    if code not in drug_data or (price > 0 and drug_data[code]['payment_limit'] == 0):
                        drug_data[code] = {
                            "hcpcs_code": code,
                            "short_description": desc[:250],
                            "payment_limit": price,
                            "unit_note": f"Source: {filename[:50]}"
                        }
                        count_in_file += 1
                
                print(f"  Added {count_in_file} records from this file.")
                
        except Exception as e:
            print(f"  Error reading {filename}: {e}")

print(f"\nTotal unique drug codes compiled: {len(drug_data)}")

# Upsert Batching
records = list(drug_data.values())
if records:
    batch_size = 500
    upserted = 0
    for i in range(0, len(records), batch_size):
        batch = records[i:i+batch_size]
        try:
            supabase.table("hcpcs_drug_fees").upsert(batch, on_conflict="hcpcs_code").execute()
            upserted += len(batch)
            print(f"Upserted {upserted}/{len(records)} codes...")
        except Exception as e:
            print(f"Batch Upsert Error: {e}")

print(f"\n--- Drug Ingestion Phase 2 Complete! Total: {len(drug_data)} ---")
