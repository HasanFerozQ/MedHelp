import re
import subprocess

with open(r'c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html', 'r', encoding='utf-8') as f:
    html = f.read()

# Extract the script content
script_match = re.search(r'<script>(.*?)</script>', html, re.DOTALL)
if script_match:
    script_content = script_match.group(1)
    with open('test_script.js', 'w', encoding='utf-8') as f:
        f.write(script_content)
    print("Extracted script.")
else:
    print("Could not extract script.")
