import json
import re

def parse_mcqs(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
        
    # Split by numbers followed by a dot to separate questions
    blocks = re.split(r'\n\d+\.\s*\n', content)
    # Remove empty blocks or initial leading text
    blocks = [b.strip() for b in blocks if b.strip()]
    
    mcqs = []
    
    for block in blocks:
        # Extract question, options, answer, explanation
        
        # Look for 👉 Answer: [A-D]
        answer_match = re.search(r'👉\s*Answer:\s*([A-D])', block)
        if not answer_match:
            continue
            
        correct_letter = answer_match.group(1).upper()
        letter_to_index = {'A': 0, 'B': 1, 'C': 2, 'D': 3}
        correct_index = letter_to_index[correct_letter]
        
        # Look for Explanation if any
        explanation_match = re.search(r'Explanation:\s*(.*)', block, re.IGNORECASE | re.DOTALL)
        explanation = explanation_match.group(1).strip().replace("'", "''") if explanation_match else ""
        
        # Remove Answer and Explanation from the block to parse options
        block_cleaned = re.sub(r'👉\s*Answer:.*', '', block, flags=re.IGNORECASE | re.DOTALL).strip()
        
        # Find options A., B., C., D.
        # Options might span multiple lines if not careful, but usually one line
        option_matches = list(re.finditer(r'([A-D])\.\s*(.+?)(?=(?:\n[A-D]\.|\Z))', block_cleaned, re.DOTALL))
        
        if len(option_matches) < 4:
            continue
            
        options = []
        for match in option_matches:
            options.append(match.group(2).strip())
            
        # The question is everything before the first option 'A.'
        first_option_idx = option_matches[0].start()
        question = block_cleaned[:first_option_idx].strip().replace("'", "''")
        
        # Escape options for sql/json
        options_json = json.dumps(options).replace("'", "''")
        
        mcqs.append({
            'question': question,
            'options': options_json,
            'correct_index': correct_index,
            'explanation': explanation
        })
        
    return mcqs

mcqs = parse_mcqs('raw_mcqs.txt')

sql = """DO $$
DECLARE
    v_topic_id UUID;
    -- Try to find Semester 1 or Semester 2? Let's use Semester 1.
    v_semester_id INTEGER := 1;
BEGIN
    -- 1. Check if the topic exists
    SELECT id INTO v_topic_id FROM public.topics WHERE title = 'PELVIS & PERINEUM' LIMIT 1;
    
    -- 2. If topic doesn't exist, create it
    IF v_topic_id IS NULL THEN
        -- Find a semester, if 1 doesn't exist just use whatever is min
        SELECT id INTO v_semester_id FROM public.semesters ORDER BY id LIMIT 1;
        
        INSERT INTO public.topics (semester_id, title, "order")
        VALUES (v_semester_id, 'PELVIS & PERINEUM', (SELECT COALESCE(MAX("order"), 0) + 1 FROM public.topics WHERE semester_id = v_semester_id))
        RETURNING id INTO v_topic_id;
    END IF;

    -- 3. Insert the MCQs
"""

for mcq in mcqs:
    sql += f"""
    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        '{mcq['question']}', 
        NULL, 
        '{mcq['options']}'::jsonb, 
        {mcq['correct_index']}, 
        nullif('{mcq['explanation']}', '')
    );
"""

sql += """
END $$;
"""

with open('seed_pelvis_perineum.sql', 'w', encoding='utf-8') as f:
    f.write(sql)

print(f"Generated seed_pelvis_perineum.sql with {len(mcqs)} questions.")
