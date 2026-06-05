import os
import re

files = [
    "cards_ortho_fractures.js",
    "cards_ortho_spine.js",
    "cards_ortho_sports.js",
    "cards_ortho_joints.js",
    "cards_ortho_tumors.js",
    "cards_ortho_pediatrics.js"
]

scratch_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch"

for filename in files:
    filepath = os.path.join(scratch_dir, filename)
    if not os.path.exists(filepath):
        print(f"Error: {filename} does not exist!")
        continue
    
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Count occurrences of `{ q:` or `{q:`
    card_matches = re.findall(r'\{\s*q\s*:', content)
    print(f"{filename}: found {len(card_matches)} cards")
