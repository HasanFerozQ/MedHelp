#!/usr/bin/env python3
"""
MediHelp — MUE Seed Script (v1.3)
===================================
Loads full CMS Medically Unlikely Edits (MUE) data into Supabase.
"""

import os
import csv
import re
import requests

# ── Load .env ──────────────────────────────────────────────────────────────────
def manual_load_dotenv():
    env_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..', '.env')
    if os.path.exists(env_path):
        with open(env_path, "r") as f:
            for line in f:
                if "=" in line and not line.startswith("#"):
                    parts = line.strip().split("=", 1)
                    if len(parts) == 2:
                        key, value = parts
                        os.environ.setdefault(key.strip(), value.strip())

manual_load_dotenv()

SUPABASE_URL = os.getenv("NEXT_PUBLIC_SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_SERVICE_ROLE_KEY")

if not SUPABASE_URL or not SUPABASE_KEY:
    print("Error: NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY not found in .env")
    exit(1)

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
FILE_PATH  = os.path.join(SCRIPT_DIR, "data", "mue.csv")
BATCH_SIZE = 2000
API_URL    = f"{SUPABASE_URL}/rest/v1/mue_limits"

HEADERS = {
    "apikey"        : SUPABASE_KEY,
    "Authorization" : f"Bearer {SUPABASE_KEY}",
    "Content-Type"  : "application/json",
    "Prefer"        : "resolution=merge-duplicates"
}

CODE_PATTERN = re.compile(r'^[A-Z0-9]{4,6}$') # Relaxed for odd codes

def is_valid_code(code):
    return bool(CODE_PATTERN.match(code))

def upsert_batch(batch):
    if not batch:
        return 0
    resp = requests.post(API_URL, headers=HEADERS, json=batch, timeout=30)
    if resp.status_code not in (200, 201):
        print(f"  Batch error {resp.status_code}: {resp.text[:200]}")
        return 0
    return len(batch)

def run_ingestion():
    if not os.path.exists(FILE_PATH):
        print(f"File not found: {FILE_PATH}")
        return

    print(f"Starting MUE Ingestion from {FILE_PATH}...")

    total_ok      = 0
    total_skipped = 0
    batch         = {}

    with open(FILE_PATH, mode='r', encoding='latin-1', newline='') as f:
        reader = csv.reader(f)
        
        fieldnames = None
        for row in reader:
            if not row: continue
            row_text = " ".join(row).lower()
            if 'hcpcs' in row_text and ('mue' in row_text or 'limit' in row_text) and len(row) >= 3:
                fieldnames = [h.strip().replace('\n', ' ') for h in row]
                break
        
        if not fieldnames:
            print("[ERROR] Could not find header row.")
            return

    # Re-open or seek is better? Re-opening to be safe with DictReader pointer
    with open(FILE_PATH, mode='r', encoding='latin-1', newline='') as f:
        # Skip disclaimer again to get to data
        tmp_reader = csv.reader(f)
        for row in tmp_reader:
            row_text = " ".join(row).lower()
            if 'hcpcs' in row_text and ('mue' in row_text or 'limit' in row_text) and len(row) >= 3:
                break
        
        dict_reader = csv.DictReader(f, fieldnames=fieldnames)

        for row in dict_reader:
            row = {k.strip(): (v or '').strip() for k, v in row.items() if k}

            code = ""
            for k, v in row.items():
                lk = k.lower()
                if any(x in lk for x in ['hcpcs', 'cpt', 'code']):
                    if len(v) >= 4 and len(v) <= 6:
                        code = v.upper()
                        break
            
            if not code or not is_valid_code(code):
                total_skipped += 1
                continue

            mue_raw = "0"
            for k, v in row.items():
                lk = k.lower()
                # Prioritize 'value' or 'limit' and DISCLUDE 'indicator' or 'rationale'
                if ('mue' in lk or 'limit' in lk or 'value' in lk) and \
                   ('indicator' not in lk and 'rationale' not in lk):
                    mue_raw = v
                    break
            
            try:
                mue_clean = re.sub(r'[^0-9.]', '', mue_raw)
                mue_val = int(float(mue_clean)) if mue_clean else 0
            except (ValueError, TypeError):
                mue_val = 0

            if mue_val <= 0:
                total_skipped += 1
                continue

            mai = ""
            desc = ""
            for k, v in row.items():
                lk = k.lower()
                if 'mai' in lk or 'indicator' in lk: 
                    # Try to extra the number from MAI if possible (e.g. "2 Date of service...")
                    mai_match = re.search(r'\d', v)
                    mai = mai_match.group(0) if mai_match else v[:10]
                if 'rationale' in lk or 'description' in lk or 'short' in lk:
                    desc = v[:500]

            code_type = 'HCPCS' if any(c.isalpha() for c in code) else 'CPT'

            batch[code] = {
                "cpt_code"  : code,
                "mue_value" : mue_val,
                "mue_mai"   : mai or None,
                "description": desc or None,
                "code_type" : code_type,
                "year"      : 2026
            }

            if len(batch) >= BATCH_SIZE:
                ok = upsert_batch(list(batch.values()))
                total_ok += ok
                print(f"  Upserted {total_ok} codes so far...")
                batch = {}

    if batch:
        ok = upsert_batch(list(batch.values()))
        total_ok += ok

    print(f"\nMUE Ingestion Complete!")
    print(f"   Loaded : {total_ok} codes")
    print(f"   Skipped: {total_skipped} (invalid code or zero MUE)")

if __name__ == "__main__":
    run_ingestion()
