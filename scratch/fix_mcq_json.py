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
        lines = f.readlines()
    
    new_lines = []
    for line in lines:
        if '(v_topic_id,' in line:
            # Find the options array part: '["...", "..."]'
            # We look for the first '[" and the last ]' on the line
            match = re.search(r'\'\[(.*)\]\'', line)
            if match:
                options_content = match.group(1)
                # Replace unescaped double quotes inside the content
                # But wait, the options are already double-quoted: "Option A", "Option B"
                # The issue is when someone uses a double quote INSIDE the option: "Option "Quote" A"
                # So we want to replace " with '' ONLY IF it's not part of the JSON structure.
                # Actually, in this specific case, the simplest way is to turn the whole thing 
                # into a JSON string where double quotes are escaped or replaced.
                
                # Let's try a simpler approach: 
                # The items are separated by ", "
                parts = options_content.split('", "')
                fixed_parts = []
                for p in parts:
                    # Remove leading and trailing " if they exist
                    clean_p = p.strip('"')
                    # Replace any remaining " with ''
                    fixed_p = clean_p.replace('"', "''")
                    fixed_parts.append(fixed_p)
                
                new_options_content = '", "'.join(fixed_parts)
                # Re-wrap
                new_line = line.replace(options_content, new_options_content)
                new_lines.append(new_line)
            else:
                new_lines.append(line)
        else:
            new_lines.append(line)
            
    with open(filepath, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)

for f in files:
    if os.path.exists(f):
        print(f"Fixing {f}...")
        fix_sql_file(f)
    else:
        print(f"File not found: {f}")
