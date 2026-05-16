import os
import re

files = [
    'supabase/migrations/20260516_patient_safety_mcqs_p1.sql',
    'supabase/migrations/20260516_patient_safety_mcqs_p2.sql',
    'supabase/migrations/20260516_patient_safety_mcqs_p3.sql',
    'supabase/migrations/20260516_patient_safety_mcqs_p4.sql',
    'supabase/migrations/20260516_patient_safety_mcqs_p5.sql',
    'supabase/migrations/20260516_patient_safety_mcqs_p6.sql',
    'supabase/migrations/20260516_patient_safety_mcqs_p7.sql'
]

questions = {}

for f in files:
    path = os.path.join('c:/Users/Hasan-PC/Desktop/MedHelp', f)
    with open(path, 'r', encoding='utf-8') as file:
        content = file.read()
        # Regex to find (v_topic_id, 'Question', 'Options', index, 'Explanation')
        matches = re.findall(r"\(v_topic_id,\s*'(.+?)',", content)
        for q in matches:
            if q in questions:
                questions[q].append(f)
            else:
                questions[q] = [f]

duplicates = {q: f for q, f in questions.items() if len(f) > 1}

if duplicates:
    print("Found duplicates:")
    for q, f in duplicates.items():
        print(f"Question: {q}")
        print(f"Files: {f}")
else:
    print("No duplicates found across the 7 files.")
