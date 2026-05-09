import glob
import re
import json

files = glob.glob(r'c:\Users\Hasan-PC\Desktop\MedHelp\scratch\em_toxicology_mcqs_batch*.sql')

questions = []
errors = 0

for file_path in files:
    print(f"Checking {file_path}...")
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Check for JSON syntax errors (unescaped quotes)
    matches = re.finditer(r"'(\[.*?\])'::jsonb", content)
    for match in matches:
        json_str = match.group(1)
        try:
            # Check if it can be parsed as JSON
            json.loads(json_str)
        except json.JSONDecodeError as e:
            print(f"JSON Error in {file_path}: {e}")
            print(f"Content: {json_str[:100]}...")
            errors += 1

    # Extract questions to check for duplicates
    # Pattern: ((SELECT id FROM topics WHERE slug = 'em-toxicology-poisoning' LIMIT 1), 'Question text',
    q_matches = re.findall(r"LIMIT 1\),\s*'(.*?)',", content, re.DOTALL)
    for q in q_matches:
        q_clean = q.strip().lower()
        if q_clean in questions:
            print(f"Duplicate Question found in {file_path}: {q[:50]}...")
            errors += 1
        else:
            questions.append(q_clean)

print(f"\nAudit Complete.")
print(f"Total Questions Checked: {len(questions)}")
print(f"Total Errors/Duplicates Found: {errors}")
