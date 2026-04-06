import os
import csv
import json
from supabase import create_client, Client
from dotenv import load_dotenv

# Load env vars
load_dotenv()

url: str = os.environ.get("NEXT_PUBLIC_SUPABASE_URL")
key: str = os.environ.get("SUPABASE_SERVICE_ROLE_KEY")
supabase: Client = create_client(url, key)

def seed_drug_pricing(file_path):
    print(f"Starting Drug Pricing Ingestion from {file_path}...")
    
    if not os.path.exists(file_path):
        print(f"Error: File {file_path} not found.")
        return

    with open(file_path, mode='r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f)
        
        # Detected Headers: Often contains 'HCPCS Code', 'Short Description', 'Payment Limit'
        batch = []
        count = 0
        
        for row in reader:
            # CMS ASP files often have specific column names
            # We map them to our internal schema
            code = row.get('HCPCS Code') or row.get('HCPCS')
            description = row.get('Short Description') or row.get('Description')
            limit_str = row.get('Payment Limit') or row.get('Limit')
            
            if not code or not limit_str:
                continue
                
            try:
                # Clean currency string (remove $, commas)
                limit = float(limit_str.replace('$', '').replace(',', '').strip())
            except ValueError:
                continue

            batch.append({
                "hcpcs_code": code.strip(),
                "short_description": description.strip() if description else "",
                "payment_limit": limit,
                "unit_note": row.get('Notes') or ""
            })

            if len(batch) >= 1000:
                supabase.table("hcpcs_drug_fees").upsert(batch).execute()
                batch = []
                count += 1000
                print(f"Processed {count} drug codes...")

        # Final batch
        if batch:
            supabase.table("hcpcs_drug_fees").upsert(batch).execute()
            count += len(batch)
            
    print(f"Drug Pricing Ingestion Complete! Total: {count}")

if __name__ == "__main__":
    # Default file name based on CMS patterns
    seed_drug_pricing("data/asp_pricing.csv")
