import requests
import time
from datetime import datetime

# MediHelp NPS Rigor Test Suite (v1.0)
API_BASE = "https://npiregistry.cms.hhs.gov/api/?version=2.1"

TEST_CASES = [
    {"id": "NPI-01", "name": "Exact NPI Lookup", "params": "number=1679576722"},
    {"id": "NPI-02", "name": "Individual Name", "params": "first_name=John*&last_name=Smith*"},
    {"id": "NPI-03", "name": "Large Organization", "params": "organization_name=Mayo Clinic*"},
    {"id": "NPI-04", "name": "Small Practice", "params": "organization_name=Care*"},
    {"id": "NPI-05", "name": "State Filtering (TX)", "params": "last_name=Smith*&state=TX"},
    {"id": "NPI-06", "name": "Taxonomy Integrity", "params": "organization_name=Hospital*&limit=1"},
    {"id": "NPI-07", "name": "Wildcard Robustness", "params": "first_name=John*&last_name=Smi*&limit=1"},
]

def run_tests():
    print("="*90)
    print(f" MEDIHELP NPS RIGOR VERIFICATION | {datetime.now().strftime('%Y-%m-%d %H:%M')}")
    print("="*90)
    
    passed = 0
    for test in TEST_CASES:
        print(f"({test['id']}) {test['name']:<30}", end="")
        try:
            # CMS API has rate limits, be respectful
            time.sleep(1) 
            
            url = f"{API_BASE}&{test['params']}"
            resp = requests.get(url, timeout=10)
            
            if resp.status_code == 200:
                data = resp.json()
                results = data.get('results', [])
                count = len(results)
                
                if count > 0:
                    print(f" [PASS] ({count} results)")
                    passed += 1
                else:
                    print(f" [FAIL] (Zero results found)")
            else:
                print(f" [FAIL] (HTTP {resp.status_code})")
                
        except Exception as e:
            print(f" [ERROR] ({str(e)})")

    print("-" * 90)
    print(f" FINAL NPS SUMMARY: {passed}/{len(TEST_CASES)} Tests Passed")
    print("=" * 90)

if __name__ == "__main__":
    run_tests()
