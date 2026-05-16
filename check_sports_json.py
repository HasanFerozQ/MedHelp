import os
import json
import re

def check_sql_files():
    directory = 'supabase/migrations'
    files = [f for f in os.listdir(directory) if f.startswith('20260516_ortho_sports_mcqs_p') and f.endswith('.sql')]
    
    total_mcqs = 0
    errors = 0
    
    for filename in sorted(files):
        path = os.path.join(directory, filename)
        with open(path, 'r', encoding='utf-8') as f:
            content = f.read()
            
            # Find all MCQ inserts
            # Format: (v_topic_id, 'Question', '["Option A", "Option B"]', 0, 'Explanation')
            matches = re.findall(r"\(v_topic_id,\s*'(.*?)',\s*'(.*?)',\s*(\d+),\s*'(.*?)'\)", content, re.DOTALL)
            
            file_mcqs = len(matches)
            total_mcqs += file_mcqs
            print(f"File {filename}: Found {file_mcqs} MCQs")
            
            for i, match in enumerate(matches):
                q, opt_str, corr, expl = match
                try:
                    # Validate JSON options
                    options = json.loads(opt_str)
                    if not isinstance(options, list):
                        print(f"  [ERROR] {filename} MCQ {i+1}: Options not a list")
                        errors += 1
                except json.JSONDecodeError as e:
                    print(f"  [ERROR] {filename} MCQ {i+1}: JSON Decode Error: {e}")
                    print(f"          String: {opt_str[:100]}...")
                    errors += 1
                    
    print(f"\nProcessed {len(files)} files.")
    print(f"Total MCQs generated and validated: {total_mcqs}")
    if errors == 0:
        print("SUCCESS: All JSON arrays are perfectly valid. No syntax errors found.")
    else:
        print(f"FAILURE: Found {errors} errors in JSON syntax.")

if __name__ == "__main__":
    check_sql_files()
