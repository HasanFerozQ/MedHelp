#!/usr/bin/env python3
"""
Complete update script for USMLE 2 Pediatrics flashcards:
1. Parses FlashCards USMLE 2.txt
2. Updates tabs/flashcards/data/usmle2.json
3. Updates tabs/flashcards/data/manifest.json
4. Updates flashcards-data.js (in 'usmle2' deck)
"""

import os
import re
import json

TXT_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\vision\FlashCards USMLE 2.txt'
USMLE2_JSON_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\tabs\flashcards\data\usmle2.json'
MANIFEST_JSON_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\tabs\flashcards\data\manifest.json'
FLASHCARDS_JS_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js'

TOPIC_ICONS = {
    "Growth & Development": "baby",
    "Neonatology": "heart-pulse",
    "Genetic/Congenital Disorders": "dna",
    "Infectious Disease in Children": "bacteria",
    "Immunizations": "syringe",
    "Pediatric GI/Cardio/Pulm": "stethoscope",
    "Adolescent Medicine": "user",
}

def flash_topic_slug(topic_name):
    # Mimic JS flashTopicSlug
    base = re.sub(r'[^a-zA-Z0-9\s]', '', topic_name or 'Topic')
    base = re.sub(r'\s+(\w)', lambda m: m.group(1).upper(), base)
    base = re.sub(r'\s+', '', base)
    if not base:
        base = 'Topic'
    titled = base[0].upper() + base[1:]
    return titled + 'FlashCards'

def build_table(rows):
    if not rows:
        return ''
    html = '<table style="border-collapse:collapse;margin:4px 0;">'
    for r_idx, row in enumerate(rows):
        html += '<tr>'
        tag = 'th' if r_idx == 0 else 'td'
        style = 'style="border:1px solid #ccc;padding:2px 6px;font-weight:bold;"' if r_idx == 0 else 'style="border:1px solid #ccc;padding:2px 6px;"'
        for cell in row:
            html += f'<{tag} {style}>{cell}</{tag}>'
        html += '</tr>'
    html += '</table>'
    return html

def build_answer_html(lines):
    while lines and not lines[-1].strip():
        lines.pop()
    while lines and not lines[0].strip():
        lines.pop(0)
    if not lines:
        return ''
    
    result_parts = []
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        if not line:
            i += 1
            continue
        
        if '\t' in lines[i]:
            table_rows = []
            while i < len(lines) and '\t' in lines[i]:
                cells = [c.strip() for c in lines[i].split('\t')]
                table_rows.append(cells)
                i += 1
            if table_rows:
                table_html = build_table(table_rows)
                result_parts.append(table_html)
            continue
        
        result_parts.append(line)
        i += 1
    
    return '<br>'.join(result_parts)

def parse_txt_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    topics = []
    current_topic = None
    current_cards = []
    
    lines = content.replace('\r\n', '\n').replace('\r', '\n').split('\n')
    
    i = 0
    while i < len(lines):
        line = lines[i]
        
        if line.startswith('Topic:'):
            if current_topic and current_cards:
                topics.append({
                    'section': 'PEDIATRICS',
                    'topic': current_topic,
                    'icon': TOPIC_ICONS.get(current_topic, 'stethoscope'),
                    'cards': current_cards
                })
            current_topic = line.replace('Topic:', '').strip()
            current_cards = []
            i += 1
            continue
        
        if line.startswith('===') or line.startswith('Section:') or line.startswith('For FlashCards'):
            i += 1
            continue
        
        q_match = re.match(r'^\s*\d+\.\s*Q:\s*(.*)', line)
        if q_match:
            question = q_match.group(1).strip()
            i += 1
            while i < len(lines):
                next_line = lines[i].strip()
                if next_line.startswith('A:') or re.match(r'^\s*\d+\.\s*Q:', lines[i]):
                    break
                if next_line:
                    question += ' ' + next_line
                i += 1
            
            answer_lines = []
            if i < len(lines) and lines[i].strip().startswith('A:'):
                answer_start = lines[i].strip()[2:].strip()
                if answer_start:
                    answer_lines.append(answer_start)
                i += 1
                
                while i < len(lines):
                    curr = lines[i]
                    curr_stripped = curr.strip()
                    if re.match(r'^\s*\d+\.\s*Q:', curr):
                        break
                    if curr_stripped.startswith('===') or curr_stripped.startswith('Topic:') or curr_stripped.startswith('For FlashCards'):
                        break
                    answer_lines.append(curr_stripped)
                    i += 1
                
                answer = build_answer_html(answer_lines)
                current_cards.append({
                    'q': question,
                    'a': answer
                })
            continue
        
        i += 1
    
    if current_topic and current_cards:
        topics.append({
            'section': 'PEDIATRICS',
            'topic': current_topic,
            'icon': TOPIC_ICONS.get(current_topic, 'stethoscope'),
            'cards': current_cards
        })
    
    return topics

def update_usmle2_json(peds_topics):
    print(f"Updating {USMLE2_JSON_FILE}...")
    with open(USMLE2_JSON_FILE, 'r', encoding='utf-8') as f:
        usmle2_data = json.load(f)
    
    # Remove existing PEDIATRICS topics if re-running
    usmle2_data = [t for t in usmle2_data if t.get('section') != 'PEDIATRICS']
    start_index = len(usmle2_data)
    
    usmle2_data.extend(peds_topics)
    
    with open(USMLE2_JSON_FILE, 'w', encoding='utf-8') as f:
        json.dump(usmle2_data, f, indent=2, ensure_ascii=False)
    
    print(f"Updated usmle2.json, now has {len(usmle2_data)} topics (started at {start_index}).")
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
        print(f"  Manifest: {slug} -> usmle2 index {start_index + idx}")
    
    with open(MANIFEST_JSON_FILE, 'w', encoding='utf-8') as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False)
    print("Manifest updated.")

def update_flashcards_js(peds_topics):
    print(f"Updating {FLASHCARDS_JS_FILE}...")
    with open(FLASHCARDS_JS_FILE, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Also clean up year2 if we injected it there before
    # Restore from bak_peds if present or clean up
    bak_file = r'C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js.bak_peds'
    if os.path.exists(bak_file):
        with open(bak_file, 'r', encoding='utf-8') as bf:
            content = bf.read()
        print("Restored base content from backup before usmle2 update.")
    
    # Update 'usmle2' inside flashcards-data.js
    # Find 'usmle2': [ ... ]
    usmle2_pos = content.find("'usmle2': [")
    if usmle2_pos == -1:
        print("ERROR: 'usmle2' array not found in flashcards-data.js")
        return
    
    # Find the closing array bracket of usmle2
    # usmle2 is the last key in FLASH_DATA object before `};`
    # Let's locate `];` or `]` after usmle2_pos
    closing_bracket = content.rfind(']', usmle2_pos)
    # Make sure it's the array closing bracket before `};`
    end_obj = content.find('};', usmle2_pos)
    if end_obj != -1:
        closing_bracket = content.rfind(']', usmle2_pos, end_obj)
    
    if closing_bracket == -1:
        print("ERROR: closing bracket of 'usmle2' not found")
        return
    
    # Convert peds_topics to JSON string
    peds_json_str = json.dumps(peds_topics, indent=2, ensure_ascii=False)
    # Strip leading `[` and trailing `]`
    peds_inner = peds_json_str.strip()[1:-1].strip()
    
    # Insert before closing_bracket
    # Check if usmle2 array already had elements (add comma)
    slice_before = content[usmle2_pos:closing_bracket].rstrip()
    if not slice_before.endswith('['):
        insertion = ',\n' + peds_inner + '\n'
    else:
        insertion = '\n' + peds_inner + '\n'
    
    new_content = content[:closing_bracket] + insertion + content[closing_bracket:]
    
    with open(FLASHCARDS_JS_FILE, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print("flashcards-data.js updated successfully.")

def main():
    print("Parsing PEDIATRICS flashcards from txt file...")
    peds_topics = parse_txt_file(TXT_FILE)
    
    total_cards = sum(len(t['cards']) for t in peds_topics)
    print(f"Parsed {len(peds_topics)} topics with {total_cards} total flashcards:\n")
    for t in peds_topics:
        print(f"  - {t['topic']}: {len(t['cards'])} cards")
    print()
    
    start_index = update_usmle2_json(peds_topics)
    update_manifest_json(peds_topics, start_index)
    update_flashcards_js(peds_topics)
    
    print("\nALL UPDATES COMPLETED SUCCESSFULLY!")

if __name__ == '__main__':
    main()
