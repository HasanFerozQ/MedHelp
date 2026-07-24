import json
import re
import os

# Load all new cards from JSON files (50+20 = 70 cards per topic to inject)
topics_map = {
    'Cardiology':           ['Cardiology_cards.json',           'Cardiology_cards_20.json'],
    'Pulmonology':          ['Pulmonology_cards.json',          'Pulmonology_cards_20.json'],
    'GI/Hepatology':        ['GI_Hepatology_cards.json',        'GI_Hepatology_cards_20.json'],
    'Nephrology':           ['Nephrology_cards.json',           'Nephrology_cards_20.json'],
    'Endocrinology':        ['Endocrinology_cards.json',        'Endocrinology_cards_20.json'],
    'Hematology/Oncology':  ['Hematology_Oncology_cards.json',  'Hematology_Oncology_cards_20.json'],
    'Rheumatology':         ['Rheumatology_cards.json',         'Rheumatology_cards_20.json'],
    'Infectious Disease':   ['Infectious_Disease_cards.json',   'Infectious_Disease_cards_20.json'],
    'Allergy/Immunology':   ['Allergy_Immunology_cards.json',   'Allergy_Immunology_cards_20.json'],
    'Dermatology':          ['Dermatology_cards.json',          'Dermatology_cards_20.json'],
}

# Load all new cards
new_cards_by_topic = {}
for topic, files in topics_map.items():
    all_cards = []
    for fname in files:
        fpath = os.path.join('scratch', fname)
        if os.path.exists(fpath):
            cards = json.load(open(fpath, encoding='utf-8'))
            all_cards.extend(cards)
        else:
            print(f"WARNING: Missing {fpath}")
    new_cards_by_topic[topic] = all_cards
    print(f"{topic}: loaded {len(all_cards)} new cards to inject")

# Read the HTML
with open('flash-cards.html', 'r', encoding='utf-8') as f:
    html = f.read()

# For each topic, find its cards array closing bracket and inject new cards before it
# Strategy: find the topic name, then find the end of its cards array, inject before the closing ]

def cards_to_js(cards):
    """Convert JSON cards to JS object literal format used in the HTML."""
    lines = []
    for card in cards:
        q = card['q'].replace('\\', '\\\\').replace('"', '\\"')
        a = card['a'].replace('\\', '\\\\').replace('"', '\\"')
        lines.append(f'            {{ q: "{q}", a: "{a}" }}')
    return ',\n'.join(lines)

total_injected = 0
modified_html = html

for topic, new_cards in new_cards_by_topic.items():
    if not new_cards:
        print(f"No new cards for {topic}, skipping")
        continue

    # Find the topic's cards array end ]
    # Pattern: topic: "Cardiology" ... cards: [ ... ]
    # We need to find the closing bracket of the cards array for this specific topic
    
    # Find the topic occurrence in the usmle2 section
    topic_escaped = re.escape(topic)
    pattern = rf"(topic:\s*['\"]){re.escape(topic)}(['\"].*?cards:\s*\[)(.*?)(\s*\]\s*\}})"
    
    match = re.search(pattern, modified_html, re.DOTALL)
    if not match:
        print(f"Could not find topic block for: {topic}")
        continue
    
    # Build replacement: keep everything up to the closing ], then add new cards
    prefix = match.group(1) + topic + match.group(2)
    existing_cards = match.group(3)
    suffix = match.group(4)
    
    new_cards_js = cards_to_js(new_cards)
    
    # Insert new cards before the closing bracket
    replacement = prefix + existing_cards + ',\n' + new_cards_js + suffix
    
    modified_html = modified_html[:match.start()] + replacement + modified_html[match.end():]
    total_injected += len(new_cards)
    print(f"Injected {len(new_cards)} cards into {topic}")

# Write the modified HTML
with open('flash-cards.html', 'w', encoding='utf-8') as f:
    f.write(modified_html)

print(f"\nDone! Total cards injected: {total_injected}")
print("flash-cards.html updated.")
