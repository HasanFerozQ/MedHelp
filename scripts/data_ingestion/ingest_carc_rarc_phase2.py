import os
import re
import pdfplumber
from supabase import create_client, Client
from dotenv import load_dotenv

load_dotenv()
url = os.environ.get("NEXT_PUBLIC_SUPABASE_URL")
key = os.environ.get("SUPABASE_SERVICE_ROLE_KEY")

if not url or not key:
    print("Error: Supabase credentials missing.")
    exit(1)

supabase: Client = create_client(url, key)

def ingest_pdf(pdf_path):
    print(f"Opening PDF: {pdf_path}")
    if not os.path.exists(pdf_path):
        print("Error: File not found.")
        return

    carc_batch_dict = {}
    rarc_batch_dict = {}
    total_carc = 0
    total_rarc = 0
    
    with pdfplumber.open(pdf_path) as pdf:
        total_pages = len(pdf.pages)
        print(f"Successfully opened PDF with {total_pages} pages. Scanning for tables...")
        
        for i, page in enumerate(pdf.pages):
            tables = page.extract_tables()
            for table in tables:
                for row in table:
                    if not row or len(row) < 2:
                        continue
                        
                    # Usually [Code, Description, Date...]
                    code = str(row[0]).replace('\n', '').replace(' ', '').strip()
                    desc = str(row[1]).strip().replace('\n', ' ')
                    
                    if not code or code.upper() == 'CODE' or len(code) > 12:
                        continue
                        
                    # RARC Codes start with N, MA, M, or are alpha-numeric usually. 
                    is_rarc = bool(re.match(r'^[A-Z]{1,3}\d{1,4}$', code, re.IGNORECASE)) and not '-' in code
                    # CARC codes are usually just digits or have a dash
                    is_carc = bool(re.match(r'^([A-Z]{1,2}-)?\d+$', code, re.IGNORECASE)) and not is_rarc
                    
                    payload = {
                        "code": code,
                        "description": desc[:500]
                    }
                    
                    if is_rarc:
                        rarc_batch_dict[code] = payload
                    elif is_carc:
                        carc_batch_dict[code] = payload

            # Upsert in small batches to preserve memory
            if len(carc_batch_dict) >= 200:
                batch = list(carc_batch_dict.values())
                print(f"[Page {i+1}/{total_pages}] Upserting {len(batch)} unique CARC codes...")
                try: 
                    supabase.table("carc_codes").upsert(batch).execute()
                    total_carc += len(batch)
                except Exception as e: print(f"CARC Upsert Failed: {e}")
                carc_batch_dict = {}
                
            if len(rarc_batch_dict) >= 200:
                batch = list(rarc_batch_dict.values())
                print(f"[Page {i+1}/{total_pages}] Upserting {len(batch)} unique RARC codes...")
                try: 
                    supabase.table("rarc_codes").upsert(batch).execute()
                    total_rarc += len(batch)
                except Exception as e: print(f"RARC Upsert Failed: {e}")
                rarc_batch_dict = {}
                
        # Final flush
        if carc_batch_dict:
            batch = list(carc_batch_dict.values())
            print(f"[Final] Upserting {len(batch)} unique CARC codes...")
            try: 
                supabase.table("carc_codes").upsert(batch).execute()
                total_carc += len(batch)
            except Exception as e: print(f"CARC Final Upsert Failed: {e}")
            
        if rarc_batch_dict:
            batch = list(rarc_batch_dict.values())
            print(f"[Final] Upserting {len(batch)} unique RARC codes...")
            try: 
                supabase.table("rarc_codes").upsert(batch).execute()
                total_rarc += len(batch)
            except Exception as e: print(f"RARC Final Upsert Failed: {e}")

    print(f"--- Phase 2 Ingestion Complete! (Total CARC: {total_carc}, Total RARC: {total_rarc}) ---")

if __name__ == "__main__":
    pdf_file = "vision/CARC-RARC-Consolidated List-2-11-26_0.pdf"
    ingest_pdf(pdf_file)
