import json
import re
import os

with open('data.js', 'r', encoding='utf-8') as f:
    data_content = f.read()

# Extract JSON part
match = re.match(r'const FLASH_DATA = (\{.*\});?\s*$', data_content, re.DOTALL)
if not match:
    print("Could not parse data.js")
    exit(1)

json_data = match.group(1)
try:
    flash_data = json.loads(json_data)
except json.JSONDecodeError as e:
    print("Error decoding JSON from data.js:", e)
    exit(1)

topics_map = {
    'Cardiology': 'Cardiology_cards.json',
    'Pulmonology': 'Pulmonology_cards.json',
    'GI/Hepatology': 'GI_Hepatology_cards.json',
    'Nephrology': 'Nephrology_cards.json',
    'Endocrinology': 'Endocrinology_cards.json',
    'Hematology/Oncology': 'Hematology_Oncology_cards.json',
    'Rheumatology': 'Rheumatology_cards.json',
    'Infectious Disease': 'Infectious_Disease_cards.json',
    'Allergy/Immunology': 'Allergy_Immunology_cards.json',
    'Dermatology': 'Dermatology_cards.json'
}

for item in flash_data.get('usmle2', []):
    if item.get('section') == 'Internal Medicine':
        topic = item.get('topic')
        if topic in topics_map:
            filepath = os.path.join('scratch', topics_map[topic])
            if os.path.exists(filepath):
                try:
                    with open(filepath, 'r', encoding='utf-8') as f:
                        new_cards = json.load(f)
                    if isinstance(new_cards, list):
                        item['cards'].extend(new_cards)
                        print(f"Added {len(new_cards)} cards to {topic}")
                    else:
                        print(f"Invalid format in {filepath}")
                except Exception as e:
                    print(f"Error reading {filepath}: {e}")
            else:
                print(f"File not found: {filepath}")

# Write back
new_content = 'const FLASH_DATA = ' + json.dumps(flash_data, indent=2) + ';\n'
with open('data.js', 'w', encoding='utf-8') as f:
    f.write(new_content)

print("Done updating data.js")
