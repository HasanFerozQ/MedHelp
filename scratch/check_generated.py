import json, os

files = [
    'Cardiology_cards.json', 'Pulmonology_cards.json', 'GI_Hepatology_cards.json',
    'Nephrology_cards.json', 'Endocrinology_cards.json', 'Hematology_Oncology_cards.json',
    'Rheumatology_cards.json', 'Infectious_Disease_cards.json', 'Allergy_Immunology_cards.json',
    'Dermatology_cards.json'
]

for fname in files:
    fpath = os.path.join('scratch', fname)
    if os.path.exists(fpath):
        try:
            with open(fpath, 'r', encoding='utf-8') as f:
                cards = json.load(f)
            print(f"{fname}: {len(cards)} cards")
        except Exception as e:
            print(f"{fname}: Error reading ({e})")
    else:
        print(f"{fname}: MISSING")
