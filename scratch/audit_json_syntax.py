import glob
import re

files = glob.glob(r'c:\Users\Hasan-PC\Desktop\MedHelp\scratch\peds_child_abuse_mcqs_batch*.sql')

for file_path in files:
    print(f"Checking {file_path}...")
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    for line_idx, line in enumerate(lines):
        matches = re.finditer(r"'(\[.*?\])'::jsonb", line)
        for match in matches:
            json_str = match.group(1)
            for i in range(len(json_str)):
                if json_str[i] == '"':
                    if i > 0 and json_str[i-1] == '\\':
                        continue
                    is_start = (i > 0 and json_str[i-1] == '[')
                    is_end = (i < len(json_str)-1 and json_str[i+1] == ']')
                    is_after_comma = (i > 1 and json_str[i-2:i] == ', ')
                    is_before_comma = (i < len(json_str)-1 and json_str[i+1] == ',')
                    if not (is_start or is_end or is_after_comma or is_before_comma):
                        context = json_str[max(0, i-20):min(len(json_str), i+20)]
                        print(f"Potential Error in {file_path} (Line {line_idx+1}):\n  Context: ...{context}...\n")
