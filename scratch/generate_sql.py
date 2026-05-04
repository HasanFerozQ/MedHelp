import re
import json
import uuid

def escape_sql_string(s):
    if s is None:
        return ""
    # Escape single quotes by doubling them
    s = s.replace("'", "''")
    return s

def generate_sql():
    file_path = r"C:\Users\Hasan-PC\Desktop\MedHelp\vision\NBME\Test_Pattern.txt"
    out_path = r"C:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260506_year1_nbme_anatomy.sql"

    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    questions = []
    
    # Split by Question and then try to extract
    # A robust way is to split by "Question " or "QUESTION "
    parts = re.split(r'\n(?:Question|QUESTION)\s+(?=\d+|\n)', '\n' + content, flags=re.IGNORECASE)
    
    for part in parts[1:]: # skip the first empty or intro part
        part = part.strip()
        if not part:
            continue
            
        # Extract the question text
        # The first line might be "1 (Embryology)" or just a number
        # Let's remove the first line if it's just the question number and topic
        lines = part.split('\n')
        
        # Look for Answer: or Correct Answer:
        answer_match = re.search(r'(?i)\n(Correct\s+)?Answer:\s*([A-E]).*?\n(.*)', '\n' + part, re.DOTALL)
        if not answer_match:
            # Let's try matching without newline at the end
            answer_match = re.search(r'(?i)\n(Correct\s+)?Answer:\s*([A-E])(.*)', '\n' + part, re.DOTALL)
            if not answer_match:
                continue
                
        correct_letter = answer_match.group(2).upper()
        explanation = answer_match.group(3).strip()
        
        q_and_options = part[:answer_match.start() - 1].strip() # -1 for the added newline
        
        # Extract options
        options_dict = {}
        last_option_start = -1
        options_match = list(re.finditer(r'\n([A-E])\.\s*(.*?)(?=\n[A-E]\.|\Z)', '\n' + q_and_options, re.DOTALL))
        
        if not options_match:
            continue
            
        for m in options_match:
            if last_option_start == -1:
                last_option_start = m.start() - 1 # -1 for the added newline
            options_dict[m.group(1).upper()] = m.group(2).strip()
            
        if last_option_start != -1:
            question_text = q_and_options[:last_option_start].strip()
        else:
            question_text = q_and_options
            
        question_text = re.sub(r'(?i)^[\d\s]+\(.*?\)\n', '', question_text).strip()
        question_text = re.sub(r'(?i)^[\d\s]+\n', '', question_text).strip()
        question_text = re.sub(r'(?i)^Vignette:\s*', '', question_text).strip()
        
        options_list = [
            options_dict.get('A', ''),
            options_dict.get('B', ''),
            options_dict.get('C', ''),
            options_dict.get('D', ''),
            options_dict.get('E', '')
        ]
        
        correct_index = ord(correct_letter) - ord('A')
        
        questions.append({
            'text': question_text,
            'options': options_list,
            'answer': correct_index,
            'explanation': explanation
        })
        
        if len(questions) == 110:
            break

    print(f"Found {len(questions)} questions.")

    topic_id = "nbme-shelf-anatomy-1st-year"
    
    sql_statements = [
        "-- Migration for NBME Shelf: Gross Anatomy & Embryology (1st Year)",
        "-- Auto-generated from Test_Pattern.txt",
        "",
        "BEGIN;",
        "",
        "-- Ensure the topic exists",
        "INSERT INTO topics (id, title, description, category)",
        "VALUES (",
        f"    '{topic_id}',",
        "    'NBME Shelf: Gross Anatomy & Embryology',",
        "    '110 high-yield questions covering 1st Year Anatomy & Embryology for NBME Shelf preparation.',",
        "    '1st Year'",
        ")",
        "ON CONFLICT (id) DO UPDATE",
        "SET title = EXCLUDED.title, description = EXCLUDED.description, category = EXCLUDED.category;",
        "",
        "-- Delete existing questions for this topic to ensure idempotency",
        f"DELETE FROM questions WHERE topic_id = '{topic_id}';",
        ""
    ]
    
    for i, q in enumerate(questions):
        q_id = str(uuid.uuid4())
        
        text = escape_sql_string(q['text'])
        exp = escape_sql_string(q['explanation'])
        opts_json = json.dumps(q['options'])
        # Properly escape the JSON string for SQL
        opts_sql = escape_sql_string(opts_json)
        
        sql = f"""
INSERT INTO questions (id, topic_id, question_text, options, correct_option_index, explanation, difficulty)
VALUES (
    '{q_id}',
    '{topic_id}',
    '{text}',
    '{opts_sql}'::jsonb,
    {q['answer']},
    '{exp}',
    'Medium'
);"""
        sql_statements.append(sql.strip())
        
    sql_statements.append("")
    sql_statements.append("COMMIT;")
    
    with open(out_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_statements))
        
    print(f"Generated SQL file at {out_path} with {len(questions)} questions.")

if __name__ == '__main__':
    generate_sql()
