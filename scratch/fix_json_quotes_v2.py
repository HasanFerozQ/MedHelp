import glob
import re
import os

# Cover all MCQ batches in the scratch directory
files = glob.glob(r'c:\Users\Hasan-PC\Desktop\MedHelp\scratch\*_mcqs_batch*.sql')

def fix_json_quotes(line):
    # Pattern to find the JSON array part: '[" ... "]'::jsonb
    match = re.search(r"'(\[.*\])'::jsonb", line)
    if not match:
        return line
    
    full_json_literal = match.group(0)
    json_content = match.group(1) # The [ ... ] part
    
    inner = json_content[1:-1] # Removes the first [ and last ]
    
    if inner.startswith('"') and inner.endswith('"'):
        body = inner[1:-1]
        
        # Replace ", " with a marker
        marker = "@@@MARKER@@@"
        body = body.replace('", "', marker)
        body = body.replace('","', marker)
        
        # Replace any remaining double quotes in the elements with two single quotes
        body = body.replace('"', "''")
        
        # Restore delimiters
        body = body.replace(marker, '", "')
        
        fixed_json_content = '["' + body + '"]'
        fixed_json_literal = f"'{fixed_json_content}'::jsonb"
        
        # Return the line with the fixed literal
        return line.replace(full_json_literal, fixed_json_literal)
    
    return line

for file_path in files:
    print(f"Fixing {file_path}...")
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    new_lines = [fix_json_quotes(line) for line in lines]
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)

print("Done fixing all files!")
