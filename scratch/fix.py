import os
import glob

files = glob.glob('scratch/pediatric_oncology_mcqs_batch*.sql')
for file in files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # We will use a dynamic subquery so you don't need to look up the UUID
    new_content = content.replace("'YOUR_TOPIC_ID_HERE'", "(SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1)")
    
    with open(file, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print(f"Updated {file}")
