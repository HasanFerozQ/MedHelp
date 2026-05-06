import os
import re
import json

def check_sql_files(directory):
    for filename in os.listdir(directory):
        if not filename.endswith('.sql'):
            continue
            
        filepath = os.path.join(directory, filename)
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            
        for i, line in enumerate(lines):
            # Look for lines that look like: ('number: question', '["opt1", "opt2"]', ...
            match = re.search(r"',\s*'(\[.*?\])',\s*\d+,", line)
            if match:
                json_str = match.group(1)
                try:
                    json.loads(json_str)
                except json.JSONDecodeError as e:
                    print(f"Error in {filename} line {i+1}:")
                    print(f"  {json_str}")
                    print(f"  {e}")

if __name__ == '__main__':
    check_sql_files(r'c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations')
