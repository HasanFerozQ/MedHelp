import re

with open(r'C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js', 'r', encoding='utf-8') as f:
    content = f.read()

keys = re.findall(r"'([^']+)'\s*:\s*\[", content)
print('Keys in flashcards-data.js:', keys)
