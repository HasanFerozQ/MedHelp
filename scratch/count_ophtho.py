import os
import re

dir_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch"
files = [
    "cards_ophtho_red_eye.js",
    "cards_ophtho_glaucoma.js",
    "cards_ophtho_retinal.js",
    "cards_ophtho_retinopathy.js",
    "cards_ophtho_cataract.js",
    "cards_ophtho_trauma.js"
]

for filename in files:
    filepath = os.path.join(dir_path, filename)
    if not os.path.exists(filepath):
        print(f"Error: {filename} does not exist!")
        continue
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    card_matches = re.findall(r'\{\s*q\s*:', content)
    print(f"{filename}: found {len(card_matches)} cards")
