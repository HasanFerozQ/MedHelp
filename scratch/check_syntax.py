import re
import subprocess
import tempfile
import os

filepath = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"

with open(filepath, 'r', encoding='utf-8') as f:
    html = f.read()

# Find all inline script tags
scripts = re.findall(r'<script>(.*?)</script>', html, re.DOTALL)

print(f"Found {len(scripts)} script blocks to validate.")

for i, script_content in enumerate(scripts):
    # Let's skip empty or tiny scripts
    if len(script_content.strip()) < 10:
        continue
        
    # Write to a temporary file
    with tempfile.NamedTemporaryFile(suffix='.js', delete=False, mode='w', encoding='utf-8') as temp:
        temp.write(script_content)
        temp_name = temp.name
    
    try:
        # Run node -c on the temporary file
        result = subprocess.run(['node', '-c', temp_name], capture_output=True, text=True)
        if result.returncode == 0:
            print(f"Script block {i+1} syntax is VALID.")
        else:
            print(f"Script block {i+1} syntax has ERRORS:")
            print(result.stderr)
    except Exception as e:
        print(f"Error checking script block {i+1}: {e}")
    finally:
        if os.path.exists(temp_name):
            os.remove(temp_name)
