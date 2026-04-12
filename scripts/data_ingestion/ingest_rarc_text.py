import os
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

# Try both naming conventions
supabase_url = os.environ.get("NEXT_PUBLIC_SUPABASE_URL") or os.environ.get("SUPABASE_URL")
supabase_key = os.environ.get("SUPABASE_SERVICE_ROLE_KEY") or os.environ.get("SERVICE_ROLE_KEY")

if not supabase_url or not supabase_key:
    print("Error: Missing Supabase environment variables.")
    print("Checked for: NEXT_PUBLIC_SUPABASE_URL, SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, SERVICE_ROLE_KEY")
    print("Please check your .env file at the project root.")
    exit(1)

supabase = create_client(supabase_url, supabase_key)

with open('vision/raw_rarc.txt', 'r', encoding='utf-8') as f:
    lines = f.readlines()

rarc_data = {}

# Pattern match: starts with an alphanumeric code between 2 and 4 characters (e.g. M1, MA01, N103), followed by a tab or space, followed by text.
rarc_pattern = re.compile(r'^([A-Z]+\d+)\s+(.*)$')

for line in lines:
    line = line.strip()
    match = rarc_pattern.match(line)
    if match:
        code = match.group(1).strip()
        desc = match.group(2).strip()
        
        # Don't overwrite if it's already recorded, but they shouldn't be duplicated anyway.
        if code not in rarc_data:
            rarc_data[code] = desc

print(f"Discovered {len(rarc_data)} distinct RARC codes in the raw text file.")

# Upsert loop
batch_size = 200
records = []
upsert_count = 0

for code, desc in rarc_data.items():
    records.append({
        "code": code,
        "description": desc
    })
    
    if len(records) >= batch_size:
        supabase.table("rarc_codes").upsert(records, on_conflict="code").execute()
        upsert_count += len(records)
        print(f"Upserted {upsert_count} RARC codes...")
        records = []

if records:
    supabase.table("rarc_codes").upsert(records, on_conflict="code").execute()
    upsert_count += len(records)
    print(f"Upserted {upsert_count} RARC codes...")

print(f"\n--- RARC Text Ingestion Complete! Total Upserted: {upsert_count} ---")
