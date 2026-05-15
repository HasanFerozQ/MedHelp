import os
import re

files = [
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260515_ethics_medical_mcqs_p2.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260515_ethics_medical_mcqs_p3.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260515_ethics_medical_mcqs_p4.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260515_ethics_medical_mcqs_p5.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260515_ethics_medical_mcqs_p6.sql"
]

def fix_sql_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Pattern to find the options array: '["..." , "..." , "..."]'
    # Or in the broken state: '[Item", "Item", "Item]'
    # We look for the 3rd argument of the VALUES row.
    # (v_topic_id, 'Question', 'Options', CorrectIndex, 'Explanation')
    
    def replacement(match):
        options_raw = match.group(1) # This is the content inside '[ ... ]'
        
        # Split by ", " (the standard separator we used)
        parts = options_raw.split('", "')
        
        fixed_parts = []
        for p in parts:
            # Clean up any residual quotes at the very beginning or very end of the part
            # (especially for the first and last items)
            clean_p = p.strip('"')
            # Escape any internal double quotes to single quotes (standard for our MCQ UI)
            fixed_p = clean_p.replace('"', "''")
            fixed_parts.append(fixed_p)
            
        # Reconstruct with proper JSON quotes
        return f"\'[\"{'\", \"'.join(fixed_parts)}\"]\'"

    # Regex to match the options string: '[(.*)]'
    # We use a non-greedy match but ensure it's the right argument.
    # Typically: (v_topic_id, '...', '...', ..., '...')
    # We want the string between the 2nd and 3rd comma.
    
    new_content = re.sub(r"\'\[(.*?)\]\'", replacement, content)
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)

for f in files:
    if os.path.exists(f):
        print(f"Fixing {f}...")
        fix_sql_file(f)
    else:
        print(f"File not found: {f}")
