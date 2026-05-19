import os
import re
import sys
import json

def split_sql_file(file_path, chunk_size=100):
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        return False

    print(f"\n--- Splitting {os.path.basename(file_path)} into chunks of {chunk_size} ---")
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Split content into lines
    lines = content.splitlines()

    # Find where the INSERT statement starts
    insert_idx = -1
    for i, line in enumerate(lines):
        if 'INSERT INTO mcqs' in line:
            insert_idx = i
            break

    if insert_idx == -1:
        print("Could not find 'INSERT INTO mcqs' in the file.")
        return False

    # The setup lines (header)
    header_lines = lines[:insert_idx + 1]

    # Find the MCQ lines and footer lines
    mcq_lines = []
    footer_lines = []
    
    for i in range(insert_idx + 1, len(lines)):
        line = lines[i]
        stripped = line.strip()
        if stripped.startswith('(v_topic_id,'):
            mcq_lines.append(line)
        elif stripped.startswith('END $$;') or stripped.startswith('COMMIT;') or stripped == ';':
            footer_lines.append(line)
        elif stripped == '':
            if len(mcq_lines) > 0:
                footer_lines.append(line)
        else:
            if len(mcq_lines) > 0:
                footer_lines.append(line)

    num_mcqs = len(mcq_lines)
    print(f"Found {num_mcqs} MCQs.")
    if num_mcqs == 0:
        print("No MCQs found to split.")
        return False

    # Find the DELETE statement in the header
    delete_line_idx = -1
    for i, line in enumerate(header_lines):
        if 'DELETE FROM mcqs' in line:
            delete_line_idx = i
            break

    # Split mcq_lines into chunks
    num_chunks = (num_mcqs + chunk_size - 1) // chunk_size
    base, ext = os.path.splitext(file_path)

    for chunk_idx in range(num_chunks):
        part_num = chunk_idx + 1
        part_file_path = f"{base}_p{part_num}{ext}"
        
        start_idx = chunk_idx * chunk_size
        end_idx = min(start_idx + chunk_size, num_mcqs)
        chunk_mcqs = mcq_lines[start_idx:end_idx]

        # Prepare header for this part
        part_header_lines = list(header_lines)
        
        # Modify migration comment at the top if present
        if part_header_lines[0].startswith('--'):
            # Clear old part suffix if any, then append the new one
            clean_comment = re.sub(r'\s*-\s*Part\s*\d+\s*\(\d+-\d+\)', '', part_header_lines[0])
            part_header_lines[0] = clean_comment + f" - Part {part_num} ({start_idx + 1}-{end_idx})"
        
        # If this is not the first part, disable/omit the DELETE statement
        if part_num > 1 and delete_line_idx != -1:
            part_header_lines[delete_line_idx] = "    -- DELETE statement omitted in subsequent parts to preserve previously inserted MCQs"

        # Format the chunk MCQs (ensure comma separation and trailing semicolon on the last one)
        formatted_mcqs = []
        for j, mcq in enumerate(chunk_mcqs):
            mcq_stripped = mcq.rstrip()
            if mcq_stripped.endswith(','):
                mcq_stripped = mcq_stripped[:-1]
            elif mcq_stripped.endswith(';'):
                mcq_stripped = mcq_stripped[:-1]
            
            # For the last one in this part, append a semicolon
            if j == len(chunk_mcqs) - 1:
                formatted_mcqs.append(mcq_stripped + ';')
            else:
                formatted_mcqs.append(mcq_stripped + ',')

        # Combine everything
        part_content = "\n".join(part_header_lines) + "\n" + "\n".join(formatted_mcqs) + "\n" + "\n".join(footer_lines)
        
        with open(part_file_path, 'w', encoding='utf-8') as f_out:
            f_out.write(part_content)
        
        print(f"Created: {os.path.basename(part_file_path)} with {len(chunk_mcqs)} MCQs.")

    # Successfully split all parts, now delete the original file
    try:
        os.remove(file_path)
        print(f"Deleted original unsplit file: {os.path.basename(file_path)}")
    except Exception as e:
        print(f"Warning: Could not delete original file {file_path}: {e}")

    return True

def auto_split_large_migrations(directory, threshold_bytes=500000, chunk_size=100):
    print(f"Scanning {directory} for SQL migrations larger than {threshold_bytes / 1024:.1f} KB...")
    
    files_to_split = []
    for filename in os.listdir(directory):
        if not filename.endswith('.sql'):
            continue
        # Skip already split files
        if re.search(r'_p\d+\.sql$', filename):
            continue
            
        filepath = os.path.join(directory, filename)
        file_size = os.path.getsize(filepath)
        if file_size > threshold_bytes:
            files_to_split.append((filepath, file_size))
            
    if not files_to_split:
        print("No unsplit migrations exceed the size threshold.")
        return

    print(f"Found {len(files_to_split)} file(s) to split:")
    for filepath, size in files_to_split:
        print(f"  - {os.path.basename(filepath)} ({size / 1024:.1f} KB)")

    success_count = 0
    for filepath, _ in files_to_split:
        if split_sql_file(filepath, chunk_size):
            success_count += 1

    print(f"\nSuccessfully split {success_count} migration file(s)!")

    # Run validation on the resulting directory
    print("\nRunning JSON validation on generated parts...")
    validate_json_in_dir(directory)

def validate_json_in_dir(directory):
    error_count = 0
    validated_count = 0
    for filename in os.listdir(directory):
        if not filename.endswith('.sql'):
            continue
            
        filepath = os.path.join(directory, filename)
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            
        for i, line in enumerate(lines):
            # Look for lines that look like: ('number: question', '["opt1", "opt2"]', ...
            match = re.search(r"',\s*'(\[.*?\])',\s*\d+,", line)
            if match:
                json_str = match.group(1)
                validated_count += 1
                try:
                    # In SQL, single quotes are escaped as ''
                    # Convert '' to ' for standard JSON loading
                    js_clean = json_str.replace("''", "'")
                    json.loads(js_clean)
                except json.JSONDecodeError as e:
                    print(f"Error in {filename} line {i+1}:")
                    print(f"  {json_str}")
                    print(f"  {e}")
                    error_count += 1

    print(f"Validated {validated_count} JSON option arrays. Errors found: {error_count}")

if __name__ == '__main__':
    migrations_dir = os.path.dirname(os.path.abspath(__file__))
    auto_split_large_migrations(migrations_dir)
