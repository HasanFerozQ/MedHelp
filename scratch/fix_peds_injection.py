#!/usr/bin/env python3
"""Fix the comma and CRLF issues in the injected PEDIATRICS data"""

DATA_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js'

print("Reading file...")
with open(DATA_FILE, 'r', encoding='utf-8') as f:
    content = f.read()

print(f"File size: {len(content)} bytes")

# Fix double \r\r\n -> \r\n (normalize line endings)
before = content.count('\r\r\n')
content = content.replace('\r\r\n', '\r\n')
after_fix1 = content.count('\r\r\n')
print(f"Fixed {before - after_fix1} double CRLF issues (before={before}, after={after_fix1})")

# Fix missing comma between last old topic and first PEDIATRICS topic
# Pattern: the closing of the old last topic followed directly by PEDIATRICS first topic
old_pattern = '        }\r\n        {\r\n          section: "PEDIATRICS",'
new_pattern = '        },\r\n        {\r\n          section: "PEDIATRICS",'

count = content.count(old_pattern)
print(f"Found {count} occurrence(s) of missing comma pattern")
if count > 0:
    content = content.replace(old_pattern, new_pattern, 1)
    print("Fixed missing comma!")
else:
    print("Pattern not found - checking alternative...")
    # Check what's around PEDIATRICS
    idx = content.find('"PEDIATRICS"')
    if idx > 0:
        snippet = content[idx-200:idx+50]
        print(f"Context around PEDIATRICS: {repr(snippet[-100:])}")

print("\nWriting fixed file...")
with open(DATA_FILE, 'w', encoding='utf-8') as f:
    f.write(content)
print("Done!")
