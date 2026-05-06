import os
import re
import json

def audit_sql_file(filepath):
    print(f"Auditing {filepath}...")
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Match lines like (v_topic_id, 'Question', '["Option1", "Option2"]', correct_index, 'Explanation')
    # This is a rough regex to find the options array string
    pattern = re.compile(r"\((?:v_topic_id|NULL|'[^']*'),\s*'[^']*',\s*'(\[.*?\])',\s*\d+,\s*'[^']*'\)", re.DOTALL)
    
    matches = pattern.findall(content)
    errors = 0
    for i, match in enumerate(matches):
        try:
            # Check if it's valid JSON
            json.loads(match)
        except json.JSONDecodeError as e:
            print(f"  [ERROR] Match {i+1} in {os.path.basename(filepath)} is invalid JSON:")
            print(f"    Content: {match}")
            print(f"    Error: {e}")
            errors += 1
            
    if errors == 0:
        print("  [SUCCESS] No JSON errors found.")
    else:
        print(f"  [FAILURE] Found {errors} errors.")

# Audit the 6 parts
files_to_audit = [
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_benign_gynecology_mcqs_p1.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_benign_gynecology_mcqs_p2.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_benign_gynecology_mcqs_p3.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_benign_gynecology_mcqs_p4.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_benign_gynecology_mcqs_p5.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_benign_gynecology_mcqs_p6.sql",
]

for f in files_to_audit:
    if os.path.exists(f):
        audit_sql_file(f)
    else:
        print(f"File not found: {f}")
