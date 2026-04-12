import os
import sys

# Import the existing tool
sys.path.append(os.path.abspath("scripts/data_ingestion"))
try:
    from seed_drug_pricing import seed_drug_pricing
except ImportError:
    print("Failed to import seed_drug_pricing.py")
    exit(1)

file_path = "vision/april_2026_medicare_part_b_payment_limit_file_033026_final_file/section 5208 version of April 2026 Medicare Part B Payment Limit File 033026.csv"

if __name__ == "__main__":
    print(f"--- PREPARING PHASE 1 INGESTION ---")
    if not os.path.exists(file_path):
        print(f"Error: Could not locate CSV at {file_path}")
    else:
        seed_drug_pricing(file_path)
