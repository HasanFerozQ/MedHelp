import re
import json

with open(r'C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js', 'r', encoding='utf-8') as f:
    content = f.read()

# Find 'usmle2': [ ... ]
pos = content.find("'usmle2': [")
if pos != -1:
    print("Found 'usmle2' at position:", pos)
    snippet = content[pos:pos+1500]
    print(snippet[:500])
else:
    print("'usmle2' not found")
