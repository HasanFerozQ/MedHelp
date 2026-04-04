import os
import time
import requests
from supabase import create_client, Client

def get_supabase_client() -> Client:
    url: str = os.environ.get("SUPABASE_URL")
    key: str = os.environ.get("SUPABASE_SERVICE_ROLE_KEY")
    
    if not url or not key:
        print("ERROR: Supabase credentials not found in environment variables.")
        print("Set SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in your GitHub Secrets.")
        exit(1)
        
    return create_client(url, key)

def fetch_icd10_codes():
    print("Connecting to National Library of Medicine API...")
    base_url = "https://clinicaltables.nlm.nih.gov/api/icd10cm/v3/search?sf=code,name&cf=code,name&terms=&df=code,name&maxList=600&offset={}"
    
    all_codes = []
    offset = 0
    total_expected = 74719 # Approximation, API gives exact in index 0
    
    while True:
        try:
            print(f"Fetching from offset {offset}...")
            # We use urllib for zero-dependency parsing if requests fails, but requests is cleaner
            response = requests.get(base_url.format(offset), timeout=10)
            if response.status_code != 200:
                print(f"Error fetching data: {response.status_code}")
                break
                
            data = response.json()
            total_records_in_db = data[0]
            records = data[3] # index 3 contains the actual [code, description] array
            
            if not records or len(records) == 0:
                break
                
            for record in records:
                code_val = record[0]
                desc = record[1]
                
                # Truncate description if extremely long (safety measure)
                if len(desc) > 950:
                    desc = desc[:950] + "..."
                    
                all_codes.append({
                    "code": code_val,
                    "code_type": "ICD10",
                    "short_description": desc,
                    "long_description": desc,
                    "effective_date": "2024-01-01"
                })
            
            offset += len(records)
            time.sleep(0.1) # Small throttle to not slam the NLM API
            
            if offset >= total_records_in_db:
                break
                
        except Exception as e:
            print(f"Error during API fetch: {e}")
            break
            
    return all_codes

def upload_to_supabase(supabase: Client, data: list):
    print(f"Uploading {len(data)} codes to Supabase...")
    
    chunk_size = 500 # Supabase typically limits bulk inserts to 1000-2000
    success_count = 0
    
    for i in range(0, len(data), chunk_size):
        chunk = data[i:i + chunk_size]
        try:
            # Using upsert to avoid duplicate key errors if the script runs again
            res = supabase.table("medical_codes").upsert(chunk, on_conflict="code,code_type").execute()
            success_count += len(chunk)
            print(f"Progress: {success_count} / {len(data)} uploaded.")
        except Exception as e:
            print(f"Error uploading chunk at index {i}: {e}")
            

if __name__ == "__main__":
    print("--- Starting Medical Data Pipeline ---")
    supabase_client = get_supabase_client()
    
    icd10_payload = fetch_icd10_codes()
    print(f"Fetched {len(icd10_payload)} active ICD-10 codes from NLM.")
    
    if len(icd10_payload) > 0:
        upload_to_supabase(supabase_client, icd10_payload)
        
    print("--- Data Pipeline Finished Successfully ---")
