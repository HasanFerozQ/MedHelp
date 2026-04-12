import os
import csv
from supabase import create_client, Client
from dotenv import load_dotenv

load_dotenv()
url = os.environ.get("NEXT_PUBLIC_SUPABASE_URL")
key = os.environ.get("SUPABASE_SERVICE_ROLE_KEY")
supabase = create_client(url, key)

file_path = "vision/april_2026_medicare_part_b_payment_limit_file_033026_final_file/section 5208 version of April 2026 Medicare Part B Payment Limit File 033026.csv"

if __name__ == "__main__":
    print(f"--- ROBUST PHASE 1 INGESTION ---")
    if not os.path.exists(file_path):
        print(f"Error: Could not locate CSV at {file_path}")
        exit()

    with open(file_path, mode='r', encoding='latin1') as f:
        reader = csv.reader(f)
        
        # Scan forward to find the true table header row (CMS often puts 5-10 blank title rows above the table)
        headers = None
        for row in reader:
            non_empty_cells = [c for c in row if str(c).strip()]
            if len(non_empty_cells) >= 3 and any('hcpcs' in str(cell).lower() or 'code' in str(cell).lower() for cell in non_empty_cells):
                headers = row
                break
        
        if not headers:
            print("Error: Could not locate table headers within the CSV.")
            exit()
            
        print(f"True Headers Detected: {headers}")
        
        # Fuzzy find column indexes from the true headers
        code_idx = next((i for i, h in enumerate(headers) if 'code' in str(h).lower() or 'hcpcs' in str(h).lower()), 0)
        desc_idx = next((i for i, h in enumerate(headers) if 'desc' in str(h).lower() or 'name' in str(h).lower()), 1)
        limit_idx = next((i for i, h in enumerate(headers) if 'limit' in str(h).lower() or 'payment' in str(h).lower() or 'price' in str(h).lower() or 'rate' in str(h).lower() or 'amount' in str(h).lower()), None)
        note_idx = next((i for i, h in enumerate(headers) if 'note' in str(h).lower() or 'ind' in str(h).lower()), None)
        
        if limit_idx is None:
            # CMS sometimes calls it just something weird, usually the last numerical column
            print("Could not confidentially identify Payment Limit column. Defaulting to index 2.")
            limit_idx = 2

        print(f"Mapping Matrix -> Code: [{code_idx}], Desc: [{desc_idx}], Limit: [{limit_idx}]")

        batch = []
        count = 0
        for row in reader:
            if len(row) <= max(code_idx, limit_idx): continue
            
            code = str(row[code_idx]).strip()
            desc = str(row[desc_idx]).strip() if len(row) > desc_idx else ""
            limit_str = str(row[limit_idx]).strip()
            note_str = str(row[note_idx]).strip() if note_idx and len(row) > note_idx else ""
            
            if not code or not limit_str: continue
            
            # Clean payment limit string 
            try:
                limit = float(limit_str.replace('$', '').replace(',', '').strip())
            except ValueError:
                continue # Skip rows that are empty or have text like "Not Payable"
                
            batch.append({
                "hcpcs_code": code,
                "short_description": desc[:250],
                "payment_limit": limit,
                "unit_note": note_str
            })
            
            if len(batch) >= 1000:
                supabase.table("hcpcs_drug_fees").upsert(batch).execute()
                batch = []
                count += 1000
                print(f"Processed {count} drug codes...")

        if batch:
            supabase.table("hcpcs_drug_fees").upsert(batch).execute()
            count += len(batch)

    print(f"Drug Pricing Ingestion Complete! Total Upserted: {count}")
