import re
import json

def parse_histology_mcqs(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    mcqs = []
    current_mcq = None
    
    # regex for Question start: "1. ", "2. ", etc
    q_start_re = re.compile(r'^(\d+)\.\s*(.*)')
    # regex for Option start: "A. ", "B. ", etc
    opt_start_re = re.compile(r'^([A-E])\.\s*(.*)')

    for line in lines:
        line = line.strip()
        if not line: continue
        
        q_match = q_start_re.match(line)
        if q_match:
            num = int(q_match.group(1))
            text = q_match.group(2)
            current_mcq = {'num': num, 'question': text, 'options': []}
            mcqs.append(current_mcq)
            continue
            
        opt_match = opt_start_re.match(line)
        if opt_match and current_mcq:
            current_mcq['options'].append(opt_match.group(2))
            continue
            
        # If it's none of the above and we have a current_mcq, it might be extra question text
        if current_mcq and not current_mcq['options']:
            current_mcq['question'] += " " + line

    # Parse answer keys
    content = "".join(lines)
    parts = re.split(r'✅ Answer Key', content)
    answers_raw = "".join(parts[1:])
    
    ans_map = {}
    ans_matches = re.findall(r'(\d+)-([A-E])', answers_raw)
    for num, letter in ans_matches:
        ans_map[int(num)] = ord(letter) - ord('A')

    # Build final list
    final_mcqs = []
    for m in mcqs:
        if m['num'] in ans_map and len(m['options']) >= 4:
            m['correct_index'] = ans_map[m['num']]
            final_mcqs.append(m)

    return final_mcqs

def generate_sql(mcqs):
    sql = []
    sql.append("-- Histology MCQ Migration Script")
    sql.append("BEGIN;")
    sql.append("")
    sql.append("-- 1. Ensure Histology Topic exists")
    sql.append("INSERT INTO public.topics (semester_id, title, slug, \"order\")")
    sql.append("VALUES (1, 'Histology', 'histology', 10)")
    sql.append("ON CONFLICT (semester_id, slug) DO NOTHING;")
    sql.append("")
    sql.append("-- 2. Get the Histology Topic ID")
    sql.append("DO $$")
    sql.append("DECLARE")
    sql.append("    v_topic_id UUID;")
    sql.append("BEGIN")
    sql.append("    SELECT id INTO v_topic_id FROM public.topics WHERE slug = 'histology' LIMIT 1;")
    sql.append("")
    
    for m in mcqs:
        q = m['question'].replace("'", "''")
        opts = json.dumps(m['options']).replace("'", "''")
        idx = m['correct_index']
        sql.append(f"    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)")
        sql.append(f"    VALUES (v_topic_id, '{q}', '{opts}'::jsonb, {idx}, 'The correct answer is {chr(ord('A')+idx)}.')")
        sql.append(f"    ON CONFLICT DO NOTHING;")
        sql.append("")

    sql.append("END $$;")
    sql.append("")
    sql.append("COMMIT;")
    return "\n".join(sql)

if __name__ == "__main__":
    data = parse_histology_mcqs('c:/Users/Hasan-PC/Desktop/MedHelp/scratch/histology_raw.txt')
    sql_content = generate_sql(data)
    with open('c:/Users/Hasan-PC/Desktop/MedHelp/scripts/histology_mcq_migration.sql', 'w', encoding='utf-8') as f:
        f.write(sql_content)
    print(f"Generated SQL for {len(data)} MCQs.")
