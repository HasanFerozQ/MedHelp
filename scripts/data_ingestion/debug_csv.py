import csv
import os

file_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\scripts\data_ingestion\data\icd10cm.csv"
if os.path.exists(file_path):
    with open(file_path, "r", encoding="utf-8-sig") as f:
        reader = csv.reader(f)
        for i, row in enumerate(reader):
            if i > 20: break
            print(f"Row {i} (len {len(row)}): {row}")
else:
    print("File not found.")
