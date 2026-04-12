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

# The CARC input file
input_file = 'vision/raw_carc.txt'

if not os.path.exists(input_file):
    print(f"Error: {input_file} not found.")
    exit(1)

with open(input_file, 'r', encoding='utf-8') as f:
    lines = f.readlines()

carc_data = {}

# Regex pattern for CARC codes: 
# Usually a Number (1-999) or Alphanumeric (A0-A8, B1-B23, P1-P32)
# Pattern: Start of line, then 1-3 digits OR a letter followed by 1-2 digits, then whitespace.
carc_pattern = re.compile(r'^([A-Z]*\d+)\s+(.*)$')

for line in lines:
    line = line.strip()
    
    # Custom fix for 'Deductible Amount' which often misses its '1' prefix in text dumps
    if line == "Deductible Amount":
        carc_data["1"] = "Deductible Amount"
        continue
        
    match = carc_pattern.match(line)
    if match:
        code = match.group(1).strip()
        desc = match.group(2).strip()
        
        # Avoid notes and start dates
        if code.lower() == 'start' or code.lower() == 'notes':
            continue
            
        if code not in carc_data:
            carc_data[code] = desc

print(f"Discovered {len(carc_data)} distinct CARC codes in '{input_file}'.")

# Prepare records for Supabase
records = []
for code, desc in carc_data.items():
    records.append({
        "code": code,
        "description": desc
    })

# Batch upsert logic
if records:
    batch_size = 100
    upsert_count = 0
    for i in range(0, len(records), batch_size):
        batch = records[i:i + batch_size]
        try:
            supabase.table("carc_codes").upsert(batch, on_conflict="code").execute()
            upsert_count += len(batch)
            print(f"Upserted {upsert_count}/{len(records)} CARC codes...")
        except Exception as e:
            print(f"Error during batch upsert: {e}")

print(f"\n--- CARC Text Ingestion Complete! Total Upserted: {upsert_count} ---")
