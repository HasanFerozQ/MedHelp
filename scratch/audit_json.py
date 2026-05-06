import re
import os

files = [
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260505_year4_obgyn_malignancies_mcqs_p4.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260505_year4_obgyn_malignancies_mcqs_p5.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260505_year4_obgyn_malignancies_mcqs_p6.sql",
    r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year4_obgyn_malignancies_mcqs_p7.sql"
]

# Pattern to match the options string: '["...", "..."]'
# We look for double quotes inside the JSON string that are not preceded by a backslash
# and are not structural (i.e., start/end of a JSON string)
options_pattern = re.compile(r"'(?P<json_str>\[.*?\])'")

for file_path in files:
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        continue
    
    print(f"Scanning {os.path.basename(file_path)}...")
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        
    for i, line in enumerate(lines):
        match = options_pattern.search(line)
        if match:
            json_str = match.group('json_str')
            # Count double quotes
            # A valid JSON array of 4 strings should have exactly 8 double quotes
            # or more if they are escaped.
            # However, if there are unescaped double quotes, it will break the JSON parser.
            
            # Simple check: find " that is not preceded by \ and is not structural.
            # Structural " in our files are:
            # ["
            # ", "
            # "]
            
            # Let's try to parse it as JSON after stripping the SQL context
            import json
            try:
                json.loads(json_str)
            except json.JSONDecodeError as e:
                # If it fails to parse, it's a bug
                print(f"  Line {i+1} ERROR: {e}")
                print(f"    Content: {json_str}")
