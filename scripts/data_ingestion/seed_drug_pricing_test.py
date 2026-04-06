import os
import json
from supabase import create_client, Client
from dotenv import load_dotenv

# Load env vars
load_dotenv()

url: str = os.environ.get("SUPABASE_URL")
key: str = os.environ.get("SUPABASE_SERVICE_ROLE_KEY")
supabase: Client = create_client(url, key)

def seed_test_drugs():
    print("Seeding Common Specialty Drugs for Phase 2 Testing...")
    
    # Common J-Codes for oncology and autoimmune
    test_drugs = [
        {
            "hcpcs_code": "J1745",
            "short_description": "Infliximab, 10 mg (Remicade)",
            "payment_limit": 31.42,
            "unit_note": "1 unit = 10mg"
        },
        {
            "hcpcs_code": "J9312",
            "short_description": "Rituximab, 10 mg (Rituxan)",
            "payment_limit": 68.15,
            "unit_note": "1 unit = 10mg"
        },
        {
            "hcpcs_code": "J0178",
            "short_description": "Aflibercept, 1 mg (Eylea)",
            "payment_limit": 185.20,
            "unit_note": "1 unit = 1mg"
        }
    ]

    try:
        supabase.table("hcpcs_drug_fees").upsert(test_drugs).execute()
        print("✅ SUCCESS: Phase 2 Test Data Seeded!")
        print("Drugs Added: J1745 (Infliximab), J9312 (Rituximab), J0178 (Aflibercept)")
    except Exception as e:
        print(f"❌ ERROR: {str(e)}")
        print("NOTE: Ensure you have executed 'database_phase2_drugs.sql' in your Supabase console first.")

if __name__ == "__main__":
    seed_test_drugs()
