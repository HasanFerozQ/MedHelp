import re
import json

def parse_md(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Split content by "## Case "
    cases_raw = content.split('## Case ')[1:]
    
    parsed_cases = []
    
    for case_raw in cases_raw:
        lines = case_raw.strip().split('\n')
        if not lines:
            continue
            
        # Parse title
        title_line = lines[0]
        # Title format is: "Case X: Title Text" or "X: Title Text"
        title_match = re.search(r'^\d+\s*:\s*(.*)$', title_line.strip())
        if title_match:
            title = title_match.group(1).strip()
        else:
            title = title_line.strip()
            
        # Join lines back to find questions
        case_body = '\n'.join(lines[1:])
        
        # Split case_body by "### Question "
        q_split = case_body.split('### Question ')
        
        # Scenario is everything before the first "### Question " (stripped of "---" at the end)
        scenario = q_split[0].strip()
        if scenario.endswith('---'):
            scenario = scenario[:-3].strip()
            
        questions = []
        for q_block in q_split[1:]:
            q_lines = q_block.strip().split('\n')
            if not q_lines:
                continue
                
            q_header = q_lines[0].strip()
            # Header is like "1: Diagnosis & Initial Management"
            
            # The remaining is question text, options, answer, reasoning
            q_body = '\n'.join(q_lines[1:])
            
            # Extract question text
            # Usually starts from the beginning of q_body and ends at option A.
            opt_a_idx = q_body.find('\nA.')
            if opt_a_idx == -1:
                opt_a_idx = q_body.find('\n*   A.') # sometimes formatted differently
            if opt_a_idx == -1:
                opt_a_idx = q_body.find('A. ')
                
            q_text = q_body[:opt_a_idx].strip()
            
            # Extract options
            options = []
            options_text = q_body[opt_a_idx:]
            
            # Find options lines
            opt_patterns = [
                r'(?:^|\n)[*]?\s*A\.\s*(.*?)(?=\n[*]?\s*B\.)',
                r'(?:^|\n)[*]?\s*B\.\s*(.*?)(?=\n[*]?\s*C\.)',
                r'(?:^|\n)[*]?\s*C\.\s*(.*?)(?=\n[*]?\s*D\.)',
                r'(?:^|\n)[*]?\s*D\.\s*(.*?)(?=\n[*]?\s*E\.|\n\*\*Q|\n\*\*Reasoning)',
                r'(?:^|\n)[*]?\s*E\.\s*(.*?)(?=\n\*\*Q|\n\*\*Reasoning)'
            ]
            
            # Let's do a more robust parsing for options
            opt_a = re.search(r'(?:^|\n)[*]?\s*A\.\s*(.*?)(?=\n[*]?\s*B\.)', options_text, re.DOTALL)
            opt_b = re.search(r'(?:^|\n)[*]?\s*B\.\s*(.*?)(?=\n[*]?\s*C\.)', options_text, re.DOTALL)
            opt_c = re.search(r'(?:^|\n)[*]?\s*C\.\s*(.*?)(?=\n[*]?\s*D\.)', options_text, re.DOTALL)
            
            # Let's search for D and E
            opt_d_match = re.search(r'(?:^|\n)[*]?\s*D\.\s*(.*?)(?=\n[*]?\s*E\.|\n\*\*Q|\n\*\*Reasoning)', options_text, re.DOTALL)
            opt_e_match = re.search(r'(?:^|\n)[*]?\s*E\.\s*(.*?)(?=\n\*\*Q|\n\*\*Reasoning|\n---)', options_text, re.DOTALL)
            
            opts = []
            if opt_a: opts.append(opt_a.group(1).strip())
            if opt_b: opts.append(opt_b.group(1).strip())
            if opt_c: opts.append(opt_c.group(1).strip())
            
            if opt_d_match:
                opts.append(opt_d_match.group(1).strip())
            else:
                # Try fallback
                opt_d_fallback = re.search(r'(?:^|\n)[*]?\s*D\.\s*(.*?)(?=\n\*\*Q|\n\*\*Reasoning|\n---)', options_text, re.DOTALL)
                if opt_d_fallback:
                    opts.append(opt_d_fallback.group(1).strip())
                    
            if opt_e_match:
                opts.append(opt_e_match.group(1).strip())
                
            # If any options contain markdown bold/italics, keep them.
            
            # Extract answer
            ans_match = re.search(r'\*\*Q\d+ Answer:\s*([A-E])\*\*', q_body)
            if ans_match:
                ans_letter = ans_match.group(1)
                ans_idx = ord(ans_letter) - ord('A')
            else:
                ans_idx = 0
                
            # Extract reasoning
            reason_match = re.search(r'\*\*Reasoning:\*\*\s*(.*?)$', q_body, re.DOTALL)
            if reason_match:
                explanation = reason_match.group(1).strip()
                if explanation.endswith('---'):
                    explanation = explanation[:-3].strip()
            else:
                explanation = ""
                
            questions.append({
                "question": q_text,
                "options": opts,
                "correct_index": ans_idx,
                "explanation": explanation
            })
            
        parsed_cases.append({
            "title": title,
            "scenario": scenario,
            "questions": questions
        })
        
    return parsed_cases

# Test parsing
cases = parse_md('c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\ophthalmology_red_eye_caseblocks_50.md')
print(f"Parsed {len(cases)} cases")

out_file = "c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\ophthalmology_red_eye_caseblocks_50.sql"
with open(out_file, 'w', encoding='utf-8') as f:
    f.write("-- Ophthalmology: Red Eye — conjunctivitis, uveitis, keratitis\n")
    f.write("-- US MD/MBBS (4th Year) clinical case blocks\n")
    f.write("-- Target platform: Supabase (Postgres)\n")
    f.write("-- Topic Slug: optho-red-eye\n\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("    v_case_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'optho-red-eye' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write("        RAISE EXCEPTION 'Topic slug % not found.', 'optho-red-eye';\n")
    f.write("    END IF;\n\n")

    for idx, c in enumerate(cases):
        case_order = idx + 1
        title_escaped = c['title'].replace("'", "''")
        scenario_escaped = c['scenario'].replace("'", "''")
        
        f.write(f"    ---------------------------------------------------------------------------\n")
        f.write(f"    -- CASE {case_order:02d}: {c['title']}\n")
        f.write(f"    ---------------------------------------------------------------------------\n")
        f.write(f"    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = '{title_escaped}' LIMIT 1;\n")
        f.write(f"    IF v_case_id IS NULL THEN\n")
        f.write(f"        INSERT INTO case_studies (topic_id, title, scenario, \"order\")\n")
        f.write(f"        VALUES (v_topic_id, '{title_escaped}', '{scenario_escaped}', {case_order}) RETURNING id INTO v_case_id;\n")
        f.write(f"    ELSE\n")
        # In the update, we can update scenario and order
        f.write(f"        UPDATE case_studies SET scenario = '{scenario_escaped}', \"order\" = {case_order} WHERE id = v_case_id;\n")
        f.write(f"    END IF;\n\n")
        
        f.write(f"    DELETE FROM case_questions WHERE case_id = v_case_id;\n")
        if c['questions']:
            f.write(f"    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES\n")
            for q_idx, q in enumerate(c['questions']):
                q_text_escaped = q['question'].replace("'", "''")
                # Format options as JSON array and escape single quotes
                opts_json = json.dumps(q['options'], ensure_ascii=False)
                opts_escaped = opts_json.replace("'", "''")
                exp_escaped = q['explanation'].replace("'", "''")
                
                comma = "," if q_idx < len(c['questions']) - 1 else ";"
                f.write(f"    (v_case_id, '{q_text_escaped}', '{opts_escaped}'::jsonb, {q['correct_index']}, '{exp_escaped}'){comma}\n")
        f.write("\n")
        
    f.write("END $$;\n")
    f.write("COMMIT;\n")

print(f"Successfully generated {out_file}")

