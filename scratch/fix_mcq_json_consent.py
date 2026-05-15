import os
import re

files = [
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260515_ethics_consent_mcqs_p1.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260515_ethics_consent_mcqs_p2.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260515_ethics_consent_mcqs_p3.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260515_ethics_consent_mcqs_p4.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260515_ethics_consent_mcqs_p5.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260515_ethics_consent_mcqs_p6.sql"
]

def fix_sql_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    def replacement(match):
        options_raw = match.group(1)
        # Split by ", " to separate options
        parts = options_raw.split('", "')
        
        fixed_parts = []
        for p in parts:
            clean_p = p.strip('"')
            # Replace internal double quotes with double-single quotes for SQL/JSON safety
            fixed_p = clean_p.replace('"', "''")
            fixed_parts.append(fixed_p)
            
        return f"\'[\"{'\", \"'.join(fixed_parts)}\"]\'"

    # Match the options array string
    new_content = re.sub(r"\'\[(.*?)\]\'", replacement, content)
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)

for f in files:
    if os.path.exists(f):
        print(f"Fixing {f}...")
        fix_sql_file(f)
    else:
        print(f"File not found: {f}")
