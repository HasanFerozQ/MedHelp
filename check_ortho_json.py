import os
import re
import json

directory = r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations"
pattern = re.compile(r"20260516_ortho_fractures_mcqs_p\d+\.sql")

files = [f for f in os.listdir(directory) if pattern.match(f)]
files.sort(key=lambda x: int(re.search(r"p(\d+)", x).group(1)))

total_mcqs = 0
errors_found = False

for file_name in files:
    file_path = os.path.join(directory, file_name)
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Find all VALUES tuples: (v_topic_id, 'question', '["opt1", "opt2", ...]', index, 'explanation')
    # We will just extract the JSON array string and try to load it.
    
    # Matches the JSON array string between single quotes
    json_matches = re.findall(r"',\s*'(\[.*?\])',\s*\d+,", content, re.DOTALL)
    
    total_mcqs += len(json_matches)
    
    for i, json_str in enumerate(json_matches):
        try:
            # We must load it to ensure it's valid JSON
            json.loads(json_str)
        except json.JSONDecodeError as e:
            print(f"ERROR in {file_name} at MCQ #{i+1}: {e}")
            print(f"Problematic JSON string: {json_str[:100]}...")
            errors_found = True

print(f"Processed {len(files)} files.")
print(f"Total MCQs generated and validated: {total_mcqs}")
if not errors_found:
    print("SUCCESS: All JSON arrays are perfectly valid. No syntax errors found.")
else:
    print("FAILURE: JSON syntax errors detected.")
