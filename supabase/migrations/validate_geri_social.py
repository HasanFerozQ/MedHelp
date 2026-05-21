import os
import json
import re

def parse_sql_string(s, pos):
    """
    Parses a single-quoted SQL string starting at position pos.
    Handles double single-quotes ('') as escaped single quotes.
    Returns (unescaped_string, next_pos).
    """
    if pos >= len(s) or s[pos] != "'":
        raise ValueError(f"Expected single quote at index {pos}, got: {s[pos:pos+20]!r}")
    
    pos += 1  # Skip starting quote
    chars = []
    while pos < len(s):
        if s[pos] == "'":
            if pos + 1 < len(s) and s[pos+1] == "'":
                chars.append("'")
                pos += 2
            else:
                pos += 1
                return "".join(chars), pos
        else:
            chars.append(s[pos])
            pos += 1
            
    raise ValueError(f"Unterminated single-quoted string starting near: {''.join(chars[:50])!r}")

def extract_mcq_records(content, filename, errors):
    records = []
    pos = 0
    while True:
        pos = content.find("(v_topic_id,", pos)
        if pos == -1:
            break
            
        start_pos = pos
        line_num = content[:start_pos].count("\n") + 1
        pos += len("(v_topic_id,")
        
        try:
            while pos < len(content) and content[pos].isspace():
                pos += 1
                
            if pos >= len(content) or content[pos] != "'":
                errors.append(f"{filename} [Line {line_num}]: Expected starting quote for question, got near: {content[pos:pos+30]!r}")
                pos += 1
                continue
                
            q_text, pos = parse_sql_string(content, pos)
            
            while pos < len(content) and content[pos].isspace():
                pos += 1
                
            if not content[pos:].startswith(", '"):
                errors.append(f"{filename} [Line {line_num}]: Expected separator ', '' after question text, got near: {content[pos:pos+30]!r}")
                continue
            pos += 2
            
            opts_json_str, pos = parse_sql_string(content, pos)
            
            if not content[pos:].startswith("::jsonb,"):
                errors.append(f"{filename} [Line {line_num}]: Expected '::jsonb,' after options, got near: {content[pos:pos+30]!r}")
                continue
            pos += len("::jsonb,")
            
            while pos < len(content) and content[pos].isspace():
                pos += 1
                
            match = re.match(r"^(\d+)\s*,\s*", content[pos:])
            if not match:
                errors.append(f"{filename} [Line {line_num}]: Expected correct answer index, got near: {content[pos:pos+30]!r}")
                continue
            correct_idx = int(match.group(1))
            pos += match.end()
            
            if pos >= len(content) or content[pos] != "'":
                errors.append(f"{filename} [Line {line_num}]: Expected starting quote for explanation, got near: {content[pos:pos+30]!r}")
                continue
                
            exp_text, pos = parse_sql_string(content, pos)
            
            while pos < len(content) and content[pos].isspace():
                pos += 1
                
            if pos >= len(content) or (content[pos] != ")" and not content[pos:].startswith("),") and not content[pos:].startswith(");")):
                errors.append(f"{filename} [Line {line_num}]: Expected closing parenthesis ')' for record, got near: {content[pos:pos+30]!r}")
                continue
            if content[pos] == ")":
                pos += 1
            
            records.append({
                "line_num": line_num,
                "question": q_text,
                "options": opts_json_str,
                "correct_index": correct_idx,
                "explanation": exp_text
            })
            
        except ValueError as ve:
            errors.append(f"{filename} [Line {line_num}]: Parsing failed with error: {ve}")
            pos += 1
            
    return records

def validate_migrations():
    migrations_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations"
    file_prefix = "20260521_geri_social_mcqs_p"
    
    all_questions = set()
    total_mcqs = 0
    errors = []
    
    expected_counts = {
        1: 100,
        2: 100,
        3: 100,
        4: 50
    }
    
    print("=== Starting Geriatrics Social Determinants MCQs Validation ===\n")
    
    for p in range(1, 5):
        filename = f"{file_prefix}{p}.sql"
        filepath = os.path.join(migrations_dir, filename)
        
        if not os.path.exists(filepath):
            errors.append(f"File not found: {filename}")
            continue
            
        print(f"Validating {filename}...")
        
        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()
            
        if not content.strip().startswith("--"):
            errors.append(f"{filename}: Does not start with comment header")
        if "BEGIN;" not in content:
            errors.append(f"{filename}: Missing BEGIN;")
        if "COMMIT;" not in content:
            errors.append(f"{filename}: Missing COMMIT;")
        if "DO $$" not in content:
            errors.append(f"{filename}: Missing DO $$")
        if "END $$;" not in content:
            errors.append(f"{filename}: Missing END $$;")
            
        if p == 1:
            if "DELETE FROM mcqs WHERE topic_id = v_topic_id;" not in content:
                errors.append(f"{filename}: Part 1 must contain the DELETE statement to clean old records")
        else:
            if "DELETE FROM mcqs" in content:
                errors.append(f"{filename}: Only Part 1 should contain the DELETE statement")
                
        records = extract_mcq_records(content, filename, errors)
        count = len(records)
        print(f"  Found {count} MCQ insert records in file.")
        
        expected_count = expected_counts[p]
        if count != expected_count:
            errors.append(f"{filename}: Contains {count} records instead of exactly {expected_count}")
            
        for r in records:
            line_num = r["line_num"]
            q_text = r["question"]
            opts_json_str = r["options"]
            correct_idx = r["correct_index"]
            exp_text = r["explanation"]
            
            if not q_text.strip():
                errors.append(f"{filename} [Line {line_num}]: Question text is empty")
                
            if q_text in all_questions:
                errors.append(f"{filename} [Line {line_num}]: Duplicate question detected! Text: {q_text[:60]}...")
            all_questions.add(q_text)
            
            try:
                options = json.loads(opts_json_str)
                if not isinstance(options, list):
                    errors.append(f"{filename} [Line {line_num}]: Options JSON is not a list")
                elif len(options) != 5:
                    errors.append(f"{filename} [Line {line_num}]: Options list contains {len(options)} choices instead of exactly 5")
                else:
                    for opt_idx, opt in enumerate(options):
                        if not isinstance(opt, str) or not opt.strip():
                            errors.append(f"{filename} [Line {line_num}]: Option at index {opt_idx} is empty or not a string")
                    if len(set(options)) != len(options):
                        errors.append(f"{filename} [Line {line_num}]: Duplicate options found: {options}")
            except json.JSONDecodeError as je:
                errors.append(f"{filename} [Line {line_num}]: Options JSON decoding failed: {je}")
                
            if correct_idx < 0 or correct_idx >= 5:
                errors.append(f"{filename} [Line {line_num}]: Correct answer index {correct_idx} is out of bounds (must be 0-4)")
                
            if not exp_text.strip():
                errors.append(f"{filename} [Line {line_num}]: Explanation is empty")
            elif len(exp_text) < 50:
                errors.append(f"{filename} [Line {line_num}]: Explanation is too short ({len(exp_text)} chars)")
            if "(Ref:" not in exp_text:
                errors.append(f"{filename} [Line {line_num}]: Explanation missing reference citation '(Ref: ...)'")
                
        total_mcqs += count
        
    print(f"\nValidation completed. Total MCQs scanned: {total_mcqs}")
    print(f"Total Unique Questions in set: {len(all_questions)}")
    
    if errors:
        print(f"\n[FAILED]: Found {len(errors)} validation errors:")
        for err in errors[:30]:
            print(f" - {err}")
        if len(errors) > 30:
            print(f" ... and {len(errors) - 30} more errors.")
        return False
    else:
        print("\n[SUCCESS]: All checks passed! No errors or duplicate questions found.")
        return True

if __name__ == "__main__":
    validate_migrations()
