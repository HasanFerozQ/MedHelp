import os
import re

def check_semicolons(directory):
    files = [f for f in os.listdir(directory) if f.startswith('em_neurological_mcqs_batch') and f.endswith('.sql')]
    files.sort()

    for filename in files:
        path = os.path.join(directory, filename)
        with open(path, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            
            terminators = []
            for i, line in enumerate(lines):
                if line.strip().endswith(');'):
                    terminators.append(i + 1)
            
            if len(terminators) > 1:
                print(f"Error in {filename}: Found {len(terminators)} line terminators (');'). Expected 1 at the end.")
                for line_num in terminators:
                    print(f"  Line {line_num}: {lines[line_num-1].strip()}")
            elif len(terminators) == 0:
                print(f"Error in {filename}: No line terminator (');') found.")

if __name__ == "__main__":
    check_semicolons(r'c:\Users\Hasan-PC\Desktop\MedHelp\scratch')
