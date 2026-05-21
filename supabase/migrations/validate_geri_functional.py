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
                pos += 2  # Skip both quotes
            else:
                pos += 1  # Skip closing quote
                return "".join(chars), pos
        else:
            chars.append(s[pos])
            pos += 1
            
    raise ValueError(f"Unterminated single-quoted string starting near: {''.join(chars[:50])!r}")

def validate_migrations():
    migrations_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations"
    file_prefix = "20260521_geri_functional_mcqs_p"
    
    all_questions = set()
    total_mcqs = 0
    errors = []
    
    print("=== Starting Geriatrics Functional Assessment MCQs Validation ===\n")
    
    for p in range(1, 5):
        filename = f"{file_prefix}{p}.sql"
        filepath = os.path.join(migrations_dir, filename)
        
        if not os.path.exists(filepath):
            errors.append(f"File not found: {filename}")
            continue
            
        print(f"Validating {filename}...")
        
        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()
            
        # Basic structural checks
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
            
        # Part 1 should contain DELETE statement, others should not
        if p == 1:
            if "DELETE FROM mcqs WHERE topic_id = v_topic_id;" not in content:
                errors.append(f"{filename}: Part 1 must contain the DELETE statement to clean old records")
        else:
            if "DELETE FROM mcqs" in content:
                errors.append(f"{filename}: Only Part 1 should contain the DELETE statement to prevent deleting previously inserted parts")
                
        # Find the MCQ rows. Each MCQ row looks like: (v_topic_id, '...', '...'::jsonb, ..., '...')
        # We can find them by extracting lines starting with optional whitespace and `(v_topic_id, `
        lines = content.splitlines()
        mcq_lines = []
        for line_idx, line in enumerate(lines, 1):
            stripped = line.strip()
            if stripped.startswith("(v_topic_id,"):
                mcq_lines.append((line_idx, stripped))
                
        count = len(mcq_lines)
        print(f"  Found {count} MCQ insert records in file.")
        if count != 100:
            errors.append(f"{filename}: Contains {count} records instead of exactly 100")
            
        for line_num, line in mcq_lines:
            # Normalize the line: remove (v_topic_id, prefix and trailing , or ;
            # We want to parse the rest: 'q_esc', 'opts_json'::jsonb, ans_idx, 'exp_esc'
            row_content = line
            if row_content.endswith(",") or row_content.endswith(";"):
                row_content = row_content[:-1]
            row_content = row_content.strip()
            
            # Now row_content is: (v_topic_id, 'q_esc', 'opts_json'::jsonb, ans_idx, 'exp_esc')
            if not row_content.startswith("(v_topic_id,") or not row_content.endswith(")"):
                errors.append(f"{filename} [Line {line_num}]: Record is not properly enclosed in parentheses")
                continue
                
            # Strip '(v_topic_id, ' from start and ')' from end
            inner = row_content[len("(v_topic_id,"): -1].strip()
            
            try:
                # 1. Parse question string
                pos = 0
                q_text, pos = parse_sql_string(inner, pos)
                
                # Check separator after question
                if not inner[pos:].startswith(", '"):
                    errors.append(f"{filename} [Line {line_num}]: Expected separator ', '' after question text, got: {inner[pos:pos+10]!r}")
                    continue
                pos += 2  # Move to the start of options single quote
                
                # 2. Parse options JSON string
                opts_json_str, pos = parse_sql_string(inner, pos)
                
                # Check separator after options
                expected_suffix = "'::jsonb, "
                if not inner[pos-1:].startswith(expected_suffix):
                    errors.append(f"{filename} [Line {line_num}]: Expected suffix {expected_suffix!r} after options JSON, got: {inner[pos-1:pos+15]!r}")
                    continue
                pos += len(expected_suffix) - 1 # skip to the answer index start
                
                # 3. Parse answer index (integer)
                match = re.match(r"^(\d+)\s*,\s*", inner[pos:])
                if not match:
                    errors.append(f"{filename} [Line {line_num}]: Expected correct answer index integer, got: {inner[pos:pos+20]!r}")
                    continue
                correct_idx = int(match.group(1))
                pos += match.end()
                
                # 4. Parse explanation string
                exp_text, pos = parse_sql_string(inner, pos)
                
                # Ensure we reached the end of the inner content
                remaining = inner[pos:].strip()
                if remaining:
                    errors.append(f"{filename} [Line {line_num}]: Extra content found at end of record: {remaining!r}")
                    
                # Field level semantic validation
                if not q_text.strip():
                    errors.append(f"{filename} [Line {line_num}]: Question text is empty")
                    
                # Check duplicate question
                if q_text in all_questions:
                    errors.append(f"{filename} [Line {line_num}]: Duplicate question detected! Text: {q_text[:60]}...")
                all_questions.add(q_text)
                
                # Verify JSON
                try:
                    options = json.loads(opts_json_str)
                    if not isinstance(options, list):
                        errors.append(f"{filename} [Line {line_num}]: Options JSON is not a list")
                    elif len(options) != 5:
                        errors.append(f"{filename} [Line {line_num}]: Options list contains {len(options)} choices instead of exactly 5")
                    else:
                        for opt_idx, opt in enumerate(options):
                            if not isinstance(opt, str) or not opt.strip():
                                errors.append(f"{filename} [Line {line_num}]: Option choice at index {opt_idx} is empty or not a string")
                        if len(set(options)) != len(options):
                            errors.append(f"{filename} [Line {line_num}]: Duplicate options found within the choice array: {options}")
                except json.JSONDecodeError as je:
                    errors.append(f"{filename} [Line {line_num}]: Options JSON decoding failed: {je}. JSON string: {opts_json_str}")
                    
                # Verify index range
                if correct_idx < 0 or correct_idx >= 5:
                    errors.append(f"{filename} [Line {line_num}]: Correct answer index {correct_idx} is out of bounds (must be 0-4)")
                    
                # Verify explanation
                if not exp_text.strip():
                    errors.append(f"{filename} [Line {line_num}]: Explanation is empty")
                elif len(exp_text) < 50:
                    errors.append(f"{filename} [Line {line_num}]: Explanation is too short ({len(exp_text)} chars)")
                if "(Ref:" not in exp_text:
                    errors.append(f"{filename} [Line {line_num}]: Explanation is missing standard reference citation '(Ref: ...)'")
                    
            except ValueError as ve:
                errors.append(f"{filename} [Line {line_num}]: Parsing failed: {ve}")
                
        total_mcqs += count
        
    print(f"\nValidation completed. Total MCQs scanned: {total_mcqs}")
    print(f"Total Unique Questions in set: {len(all_questions)}")
    
    if errors:
        print(f"\n[FAILED]: Found {len(errors)} validation errors:")
        for err in errors[:30]:  # Show first 30 errors
            print(f" - {err}")
        if len(errors) > 30:
            print(f" ... and {len(errors) - 30} more errors.")
        return False
    else:
        print("\n[SUCCESS]: All checks passed! No errors or duplicate questions found.")
        return True

if __name__ == "__main__":
    validate_migrations()
