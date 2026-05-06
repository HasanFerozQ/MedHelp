import os
import re
import json

def audit_sql_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    for i, line in enumerate(lines):
        # Look for the JSON array part
        match = re.search(r"'(\[.*?\])'", line)
        if match:
            json_str = match.group(1)
            try:
                json.loads(json_str)
            except json.JSONDecodeError as e:
                print(f"Error in {os.path.basename(filepath)} line {i+1}:")
                print(f"  JSON: {json_str}")
                print(f"  Error: {e}")

files = [
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_benign_gynecology_mcqs_p1.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_benign_gynecology_mcqs_p2.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_benign_gynecology_mcqs_p3.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_benign_gynecology_mcqs_p4.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_benign_gynecology_mcqs_p5.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_benign_gynecology_mcqs_p6.sql",
]

for f in files:
    if os.path.exists(f):
        audit_sql_file(f)
