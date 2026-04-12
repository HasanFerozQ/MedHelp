import csv
import os

file_path = "vision/april_2026_asp_ndc_hcpcs_crosswalk_033026/section 508 verison of April 2026 ASP NDC-HCPCS Crosswalk 033026.csv"

if not os.path.exists(file_path):
    print(f"File not found: {file_path}")
else:
    try:
        with open(file_path, 'r', encoding='latin1') as f:
            reader = csv.reader(f)
            for i, row in enumerate(reader):
                if i < 20: # Show first 20 rows
                    print(f"{i}: {row}")
                else:
                    break
    except Exception as e:
        print(f"Error: {e}")
