#!/usr/bin/env python3
"""
MediHelp — MUE Seed Script (v1.0)
===================================
Loads full CMS Medically Unlikely Edits (MUE) data into Supabase.
Covers ~8,000 CPT/HCPCS codes vs the current inline table of 28.

Prerequisites:
  1. Run database_update_v4_mue.sql in Supabase SQL Editor first.
  2. Run download_cms_data.py to get data/mue.csv.
  3. pip install requests

Usage:
  cd c:\\Users\\Hasan-Pc\\Desktop\\MedHelp
  python scripts/data_ingestion/seed_mue.py
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
                    key, value = line.strip().split("=", 1)
                    os.environ.setdefault(key.strip(), value.strip())

manual_load_dotenv()

SUPABASE_URL = os.getenv("NEXT_PUBLIC_SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_SERVICE_ROLE_KEY")

if not SUPABASE_URL or not SUPABASE_KEY:
    print("❌ Error: NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY not found in .env")
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

# HCPCS L2 pattern: uppercase letter + 4 digits
HCPCS_RE = re.compile(r'^[A-Z]\d{4}$')
# CPT: 5 digits
CPT_RE   = re.compile(r'^\d{5}$')

def is_valid_code(code):
    return bool(CPT_RE.match(code) or HCPCS_RE.match(code))

def upsert_batch(batch):
    if not batch:
        return 0
    resp = requests.post(API_URL, headers=HEADERS, json=batch, timeout=30)
    if resp.status_code not in (200, 201):
        print(f"  ⚠️  Batch error {resp.status_code}: {resp.text[:200]}")
        return 0
    return len(batch)

def run_ingestion():
    if not os.path.exists(FILE_PATH):
        print(f"❌ File not found: {FILE_PATH}")
        print("   Run download_cms_data.py first, or download manually from:")
        print("   https://www.cms.gov/Medicare/Coding/NationalCorrectCodInitEd/MUE")
        return

    print(f"Starting MUE Ingestion from {FILE_PATH}...")

    batch         = {}
    total_ok      = 0
    total_skipped = 0

    with open(FILE_PATH, mode='r', encoding='utf-8-sig') as f:
        # CMS MUE files have a disclaimer header — skip non-data lines
        # until we hit a line that looks like a real header (contains "CPT" or "HCPCS" or "Code")
        header_line = None
        for line in f:
            if re.search(r'\b(CPT|HCPCS|Code|MUE)\b', line, re.IGNORECASE):
                header_line = line
                break

        if not header_line:
            print("❌ Could not find header row. Check the CSV format.")
            return

        # Parse remaining lines using the found header
        reader = csv.DictReader(f, fieldnames=[h.strip() for h in header_line.split(',')])

        for row in reader:
            # Normalise keys (strip whitespace and BOM artifacts)
            row = {k.strip().replace('\ufeff', ''): (v or '').strip() for k, v in row.items() if k}

            # Find the code column (CMS uses various header names across years)
            code = (
                row.get('CPT/HCPCS Code') or
                row.get('HCPCS Code') or
                row.get('CPT Code') or
                row.get('Code') or
                row.get('HCPCS') or
                ''
            ).strip().upper()

            if not code or not is_valid_code(code):
                total_skipped += 1
                continue

            # MUE value (max units per day)
            mue_raw = (
                row.get('Practitioner Services MUE') or
                row.get('MUE Value') or
                row.get('MUE') or
                row.get('Limit') or
                '0'
            ).strip()
            try:
                mue_val = int(float(mue_raw))
            except (ValueError, TypeError):
                mue_val = 0

            if mue_val <= 0:
                total_skipped += 1
                continue

            # MAI (MUE Adjudication Indicator): 1=Claim, 2=DOS, 3=Per day
            mai = (row.get('Practitioner Services MAI') or row.get('MAI') or '').strip()[:5]

            # Description (may or may not exist)
            desc = (row.get('Description') or row.get('Short Description') or '')[:500]

            code_type = 'HCPCS' if HCPCS_RE.match(code) else 'CPT'

            batch[code] = {
                "cpt_code"  : code,
                "mue_value" : mue_val,
                "mue_mai"   : mai or None,
                "description": desc or None,
                "code_type" : code_type,
                "year"      : 2024
            }

            if len(batch) >= BATCH_SIZE:
                ok = upsert_batch(list(batch.values()))
                total_ok += ok
                print(f"  Upserted {total_ok} codes so far...")
                batch = {}

    # Final batch
    if batch:
        ok = upsert_batch(list(batch.values()))
        total_ok += ok

    print(f"\n✅ MUE Ingestion Complete!")
    print(f"   Loaded : {total_ok} codes")
    print(f"   Skipped: {total_skipped} (invalid code or zero MUE)")

if __name__ == "__main__":
    run_ingestion()
