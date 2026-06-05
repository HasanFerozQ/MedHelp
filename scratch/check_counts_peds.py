import os
import re
import json

files = [
    "cards_pals.js",
    "cards_chd.js",
    "cards_peds_resp.js",
    "cards_peds_onc.js",
    "cards_dev_behavioral.js",
    "cards_peds_nephro_endo.js",
    "cards_child_abuse.js"
]

scratch_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch"

for filename in files:
    filepath = os.path.join(scratch_dir, filename)
    if not os.path.exists(filepath):
        print(f"Error: {filename} does not exist!")
        continue
    
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Extract the array
    # e.g., const CARDS_PALS = [ ... ];
    # Let's remove the variable definition and find the first [ and last ]
    # Also let's clean up comments
    cleaned = re.sub(r'//.*', '', content)
    match = re.search(r'=\s*(\[[\s\S]*\])\s*;?\s*$', cleaned)
    if not match:
        print(f"Error: Could not parse array from {filename}")
        continue
        
    array_str = match.group(1)
    
    # Let's count elements of type { q: "...", a: "..." }
    # To do this safely, we can count the occurrences of `{ q:` or `{q:`
    card_matches = re.findall(r'\{\s*q\s*:', array_str)
    print(f"{filename}: found {len(card_matches)} cards")

