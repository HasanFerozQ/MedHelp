import os
import re
import json

def audit_sql_file(filepath):
    print(f"Auditing {filepath}...")
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    errors = 0
    for i, line in enumerate(lines):
        # Match the options array part
        match = re.search(r"'(\[.*?\])'", line)
        if match:
            json_str = match.group(1)
            try:
                json.loads(json_str)
            except json.JSONDecodeError as e:
                print(f"  [ERROR] Line {i+1}: {e}")
                print(f"    Content: {json_str}")
                errors += 1
                
    if errors == 0:
        print("  [SUCCESS] No JSON errors found.")
    else:
        print(f"  [FAILURE] Found {errors} errors.")

files = [
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_contraception_mcqs_p1.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_contraception_mcqs_p2.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_contraception_mcqs_p3.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_contraception_mcqs_p4.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_contraception_mcqs_p5.sql",
]

for f in files:
    if os.path.exists(f):
        audit_sql_file(f)
