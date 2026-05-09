import glob
import re
import os

files = glob.glob(r'c:\Users\Hasan-PC\Desktop\MedHelp\scratch\peds_child_abuse_mcqs_batch*.sql')

def fix_json_quotes(line):
    # Pattern to find the JSON array part: '[" ... "]'::jsonb
    match = re.search(r"('\[.*?\]'::jsonb)", line)
    if not match:
        return line
    
    json_part = match.group(1)
    # We want to replace " with '' if it's NOT a delimiter
    # Delimiters are: ["   ", "   ","]   ",
    
    # Let's be surgical. 
    # The JSON string starts after the first ' and before the last '
    inner_json = json_part[1:-8] # Removes ' at start and '::jsonb at end
    
    # We will replace any " that is not a delimiter
    # A delimiter " is:
    # 1. At index 1 (after [)
    # 2. At index len-2 (before ])
    # 3. Part of ", "
    
    new_inner = list(inner_json)
    for i in range(len(new_inner)):
        if new_inner[i] == '"':
            # Check if it's a delimiter
            is_start = (i == 1 and new_inner[i-1] == '[')
            is_end = (i == len(new_inner)-2 and new_inner[i+1] == ']')
            is_after_comma = (i > 1 and new_inner[i-2:i+1] == (', "')) # Wait, this logic is tricky
            
            # Simpler logic:
            # If it's preceded by [ or , 
            # OR followed by , or ]
            # then it's a delimiter.
            
            # Actually, the standard delimiters in my files are:
            # ["
            # ", "
            # ",
            # "]
            
            is_delim = False
            if i > 0 and new_inner[i-1] == '[': is_delim = True
            if i < len(new_inner)-1 and new_inner[i+1] == ']': is_delim = True
            if i > 1 and "".join(new_inner[i-2:i+1]) == ', "': is_delim = True
            if i < len(new_inner)-2 and "".join(new_inner[i:i+3]) == '", ': is_delim = True
            if i < len(new_inner)-1 and "".join(new_inner[i:i+2]) == '",': is_delim = True # Case for last element without space

            if not is_delim:
                new_inner[i] = "''" # Replace with two single quotes for SQL
                
    fixed_json_part = "'" + "".join(new_inner) + "'::jsonb"
    return line.replace(json_part, fixed_json_part)

for file_path in files:
    print(f"Fixing {file_path}...")
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    new_lines = [fix_json_quotes(line) for line in lines]
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)

print("Done!")
