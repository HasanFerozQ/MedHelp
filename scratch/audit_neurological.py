import os
import json
import re

def audit_sql_files(directory):
    total_questions = 0
    errors = 0
    duplicates = set()
    
    files = [f for f in os.listdir(directory) if f.startswith('em_neurological_mcqs_batch') and f.endswith('.sql')]
    files.sort()

    for filename in files:
        path = os.path.join(directory, filename)
        print(f"Checking {path}...")
        with open(path, 'r', encoding='utf-8') as f:
            content = f.read()
            
            # Extract questions and options
            # Matches: ((SELECT id FROM topics WHERE slug = 'em-neurological' LIMIT 1), 'Question', '["Options"]'::jsonb, index, 'Explanation')
            matches = re.findall(r"\(\(SELECT id FROM topics WHERE slug = 'em-neurological' LIMIT 1\),\s*'(.*?)',\s*'(.*?)'::jsonb,\s*(\d+),\s*'(.*?)'\)", content, re.DOTALL)
            
            for q, opts, idx, exp in matches:
                total_questions += 1
                q_clean = q.strip()
                if q_clean in duplicates:
                    print(f"Duplicate found: {q_clean[:50]}...")
                    errors += 1
                duplicates.add(q_clean)
                
                # Validate JSON options
                try:
                    json.loads(opts)
                except json.JSONDecodeError as e:
                    print(f"JSON Error in {filename}: {e}")
                    print(f"Content: {opts[:100]}...")
                    errors += 1

    print(f"\nAudit Complete.")
    print(f"Total Questions Checked: {total_questions}")
    print(f"Total Errors/Duplicates Found: {errors}")

if __name__ == "__main__":
    audit_sql_files(r'c:\Users\Hasan-PC\Desktop\MedHelp\scratch')
