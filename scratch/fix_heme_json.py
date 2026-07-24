import re

with open('scratch/Hematology_Oncology_cards_20.json', 'r', encoding='utf-8') as f:
    raw = f.read()

# Fix invalid \' escapes (single quotes don't need escaping in JSON)
fixed = raw.replace("\\'", "'")

with open('scratch/Hematology_Oncology_cards_20.json', 'w', encoding='utf-8') as f:
    f.write(fixed)

import json
try:
    data = json.loads(fixed)
    print(f"Fixed successfully: {len(data)} cards")
except Exception as e:
    print(f"Still broken: {e}")
