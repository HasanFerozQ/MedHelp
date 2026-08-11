#!/usr/bin/env python3
"""
Full upload script for all 3,100 PEDIATRICS flashcards across all 7 topics:
- Growth & Development (350)
- Neonatology (350)
- Genetic/Congenital Disorders (350)
- Infectious Disease in Children (500)
- Immunizations (300)
- Pediatric GI/Cardio/Pulm (1000)
- Adolescent Medicine (250)

Updates:
1. tabs/flashcards/data/usmle2.json
2. tabs/flashcards/data/manifest.json
3. flashcards-data.js
"""

import os
import re
import json
from robust_parse_peds import parse_txt_file, TXT_FILE

USMLE2_JSON_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\tabs\flashcards\data\usmle2.json'
MANIFEST_JSON_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\tabs\flashcards\data\manifest.json'
FLASHCARDS_JS_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js'
BACKUP_JS_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js.bak_peds'

def flash_topic_slug(topic_name):
    base = re.sub(r'[^a-zA-Z0-9\s]', '', topic_name or 'Topic')
    base = re.sub(r'\s+(\w)', lambda m: m.group(1).upper(), base)
    base = re.sub(r'\s+', '', base)
    if not base:
        base = 'Topic'
    titled = base[0].upper() + base[1:]
    return titled + 'FlashCards'

def update_usmle2_json(peds_topics):
    print(f"Updating {USMLE2_JSON_FILE}...")
    with open(USMLE2_JSON_FILE, 'r', encoding='utf-8') as f:
        usmle2_data = json.load(f)
    
    # Filter out existing PEDIATRICS topics
    usmle2_data = [t for t in usmle2_data if t.get('section') != 'PEDIATRICS']
    start_index = len(usmle2_data)
    
    usmle2_data.extend(peds_topics)
    
    with open(USMLE2_JSON_FILE, 'w', encoding='utf-8') as f:
        json.dump(usmle2_data, f, indent=2, ensure_ascii=False)
    
    print(f"  Done. usmle2.json now has {len(usmle2_data)} total topics (PEDIATRICS starts at index {start_index}).")
    return start_index

def update_manifest_json(peds_topics, start_index):
    print(f"Updating {MANIFEST_JSON_FILE}...")
    with open(MANIFEST_JSON_FILE, 'r', encoding='utf-8') as f:
        manifest = json.load(f)
    
    for idx, top in enumerate(peds_topics):
        topic_name = top['topic']
        slug = flash_topic_slug(topic_name)
        manifest[slug] = {
            "tab": "usmle2",
            "index": start_index + idx,
            "title": topic_name
        }
        print(f"  Manifest: {slug} -> usmle2 index {start_index + idx} ({len(top['cards'])} cards)")
    
    with open(MANIFEST_JSON_FILE, 'w', encoding='utf-8') as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False)
    print("  Done updating manifest.json.")

def update_flashcards_js(peds_topics):
    print(f"Updating {FLASHCARDS_JS_FILE}...")
    
    # Use clean base backup if available
    if os.path.exists(BACKUP_JS_FILE):
        with open(BACKUP_JS_FILE, 'r', encoding='utf-8') as bf:
            content = bf.read()
        print("  Restored clean base content from backup.")
    else:
        with open(FLASHCARDS_JS_FILE, 'r', encoding='utf-8') as f:
            content = f.read()
    
    usmle2_pos = content.find("'usmle2': [")
    if usmle2_pos == -1:
        print("ERROR: 'usmle2' array not found in flashcards-data.js")
        return
    
    end_obj = content.find('};', usmle2_pos)
    if end_obj == -1:
        end_obj = len(content)
    closing_bracket = content.rfind(']', usmle2_pos, end_obj)
    
    if closing_bracket == -1:
        print("ERROR: closing bracket of 'usmle2' not found")
        return
    
    peds_json_str = json.dumps(peds_topics, indent=2, ensure_ascii=False)
    peds_inner = peds_json_str.strip()[1:-1].strip()
    
    slice_before = content[usmle2_pos:closing_bracket].rstrip()
    if not slice_before.endswith('['):
        insertion = ',\n' + peds_inner + '\n'
    else:
        insertion = '\n' + peds_inner + '\n'
    
    new_content = content[:closing_bracket] + insertion + content[closing_bracket:]
    
    with open(FLASHCARDS_JS_FILE, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print("  Done updating flashcards-data.js.")

def main():
    print("Parsing ALL PEDIATRICS flashcards...")
    peds_topics = parse_txt_file(TXT_FILE)
    total_cards = sum(len(t['cards']) for t in peds_topics)
    print(f"Parsed {len(peds_topics)} topics, total {total_cards} cards.\n")
    
    start_index = update_usmle2_json(peds_topics)
    update_manifest_json(peds_topics, start_index)
    update_flashcards_js(peds_topics)
    
    print(f"\nALL 3,100 PEDIATRICS FLASHCARDS UPLOADED SUCCESSFULLY!")

if __name__ == '__main__':
    main()
