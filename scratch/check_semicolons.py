import os
import re

def check_semicolons(directory):
    files = [f for f in os.listdir(directory) if f.startswith('em_neurological_mcqs_batch') and f.endswith('.sql')]
    files.sort()

    for filename in files:
        path = os.path.join(directory, filename)
        # print(f"Checking {filename}...")
        with open(path, 'r', encoding='utf-8') as f:
            content = f.read()
            # Look for ); that is NOT at the end of the file (allowing for whitespace)
            # Or just count );
            terminators = re.findall(r'\);', content)
            
            if len(terminators) > 1:
                print(f"Error in {filename}: Found {len(terminators)} terminators (');'). Expected 1.")
                # Show context
                lines = content.splitlines()
                for i, line in enumerate(lines):
                    if line.strip().endswith(');'):
                        print(f"  Line {i+1}: {line.strip()}")
            elif len(terminators) == 0:
                print(f"Error in {filename}: No terminator (');') found.")

if __name__ == "__main__":
    check_semicolons(r'c:\Users\Hasan-PC\Desktop\MedHelp\scratch')
