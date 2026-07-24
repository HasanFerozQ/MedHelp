import json
import re
import os

with open('data.js', 'r', encoding='utf-8') as f:
    data_content = f.read()

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
    'Cardiology': 'Cardiology_cards_20.json',
    'Pulmonology': 'Pulmonology_cards_20.json',
    'GI/Hepatology': 'GI_Hepatology_cards_20.json',
    'Nephrology': 'Nephrology_cards_20.json',
    'Endocrinology': 'Endocrinology_cards_20.json',
    'Hematology/Oncology': 'Hematology_Oncology_cards_20.json',
    'Rheumatology': 'Rheumatology_cards_20.json',
    'Infectious Disease': 'Infectious_Disease_cards_20.json',
    'Allergy/Immunology': 'Allergy_Immunology_cards_20.json',
    'Dermatology': 'Dermatology_cards_20.json'
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
                        print(f"Added {len(new_cards)} cards to {topic} (Total: {len(item['cards'])})")
                    else:
                        print(f"Invalid format in {filepath}")
                except Exception as e:
                    print(f"Error reading {filepath}: {e}")
            else:
                print(f"File not found: {filepath}")

new_content = 'const FLASH_DATA = ' + json.dumps(flash_data, indent=2) + ';\n'
with open('data.js', 'w', encoding='utf-8') as f:
    f.write(new_content)

print("Done updating data.js")
