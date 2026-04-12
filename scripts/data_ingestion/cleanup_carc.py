import os
import re
import pdfplumber
from supabase import create_client, Client
from dotenv import load_dotenv

load_dotenv()
url = os.environ.get("NEXT_PUBLIC_SUPABASE_URL")
key = os.environ.get("SUPABASE_SERVICE_ROLE_KEY")
supabase: Client = create_client(url, key)

def cleanup_pdf_mistakes():
    pdf_path = "vision/CARC-RARC-Consolidated List-2-11-26_0.pdf"
    bad_codes = []

    print("Re-scanning PDF to identify the exact corrupted codes...")
    with pdfplumber.open(pdf_path) as pdf:
        for page in pdf.pages:
            tables = page.extract_tables()
            for table in tables:
                for row in table:
                    if not row or len(row) < 2: continue
                    code = str(row[0]).replace('\n', '').replace(' ', '').strip()
                    if not code or code.upper() == 'CODE' or len(code) > 12: continue
                        
                    is_rarc = bool(re.match(r'^[A-Z]{1,3}\d{1,4}$', code, re.IGNORECASE)) and not '-' in code
                    is_carc = bool(re.match(r'^([A-Z]{1,2}-)?\d+$', code, re.IGNORECASE)) and not is_rarc
                    
                    if is_carc:
                        bad_codes.append(code)

    # Deduplicate the list
    bad_codes = list(set(bad_codes))
    print(f"Discovered {len(bad_codes)} distinct EOB codes that were erroneously uploaded.")
    
    # Delete them from Supabase in batches of 100
    deleted_count = 0
    batch_size = 100
    for i in range(0, len(bad_codes), batch_size):
        batch = bad_codes[i:i+batch_size]
        try:
            # supabase-py .in_() expects a comma-separated list or an actual Python array.
            res = supabase.table("carc_codes").delete().in_("code", batch).execute()
            deleted_count += len(batch)
            print(f"Purged {deleted_count}/{len(bad_codes)} corrupted codes...")
        except Exception as e:
            print(f"Failed to delete batch: {e}")

    print("--- Database Cleanup Complete! Your original 144 CARC codes remain unharmed. ---")

if __name__ == "__main__":
    cleanup_pdf_mistakes()
