#!/usr/bin/env python3
"""
Parse FlashCards USMLE 2.txt and inject PEDIATRICS flashcards into flashcards-data.js
"""

import re

INPUT_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\vision\FlashCards USMLE 2.txt'
DATA_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js'
BACKUP_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js.bak_peds'

# Topic icon mapping
TOPIC_ICONS = {
    "Growth & Development": "baby",
    "Neonatology": "heart-pulse",
    "Genetic/Congenital Disorders": "dna",
    "Infectious Disease in Children": "bacteria",
    "Immunizations": "syringe",
    "Pediatric GI/Cardio/Pulm": "stethoscope",
    "Adolescent Medicine": "user",
}

def escape_for_js(text):
    """Escape text for use in a JS double-quoted string"""
    text = text.replace('\\', '\\\\')
    text = text.replace('"', '\\"')
    text = text.replace('\r', '')
    text = text.replace('\n', '')
    return text

def build_answer_html(lines):
    """Build HTML from answer lines"""
    # Remove trailing empty lines
    while lines and not lines[-1].strip():
        lines.pop()
    
    # Remove empty lines at start
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
        
        # Check if it's a table row (contains tab characters)
        if '\t' in lines[i]:
            # Build a table
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

def build_table(rows):
    """Build an HTML table from rows"""
    if not rows:
        return ''
    
    html = '<table style=\\"border-collapse:collapse;margin:4px 0;\\">'
    for r_idx, row in enumerate(rows):
        html += '<tr>'
        tag = 'th' if r_idx == 0 else 'td'
        style = 'style=\\"border:1px solid #ccc;padding:2px 6px;font-weight:bold;\\"' if r_idx == 0 else 'style=\\"border:1px solid #ccc;padding:2px 6px;\\"'
        for cell in row:
            html += f'<{tag} {style}>{cell}</{tag}>'
        html += '</tr>'
    html += '</table>'
    return html

def parse_flashcards(filepath):
    """Parse the file and return structured data"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    topics = []
    current_topic = None
    current_cards = []
    
    lines = content.replace('\r\n', '\n').replace('\r', '\n').split('\n')
    
    i = 0
    while i < len(lines):
        line = lines[i]
        
        # Check for topic header
        if line.startswith('Topic:'):
            # Save current topic if exists
            if current_topic and current_cards:
                topics.append({
                    'topic': current_topic,
                    'cards': current_cards
                })
            current_topic = line.replace('Topic:', '').strip()
            current_cards = []
            i += 1
            continue
        
        # Skip separator lines, section headers, and "For FlashCards" lines
        if line.startswith('===') or line.startswith('Section:') or line.startswith('For FlashCards'):
            i += 1
            continue
        
        # Check for question: starts with number. Q:
        q_match = re.match(r'^\s*\d+\.\s*Q:\s*(.*)', line)
        if q_match:
            question = q_match.group(1).strip()
            
            # Collect continued question lines (until we hit A: or next Q:)
            i += 1
            while i < len(lines):
                next_line = lines[i].strip()
                if next_line.startswith('A:') or re.match(r'^\s*\d+\.\s*Q:', lines[i]):
                    break
                if next_line:
                    question += ' ' + next_line
                i += 1
            
            # Now collect the answer
            answer_lines = []
            if i < len(lines) and lines[i].strip().startswith('A:'):
                answer_start = lines[i].strip()[2:].strip()
                if answer_start:
                    answer_lines.append(answer_start)
                i += 1
                
                # Collect continued answer lines until next question or separator
                while i < len(lines):
                    curr = lines[i]
                    curr_stripped = curr.strip()
                    
                    # Stop at next question
                    if re.match(r'^\s*\d+\.\s*Q:', curr):
                        break
                    # Stop at topic separator
                    if curr_stripped.startswith('===') or curr_stripped.startswith('Topic:') or curr_stripped.startswith('For FlashCards'):
                        break
                    
                    answer_lines.append(curr_stripped)
                    i += 1
                
                # Process answer_lines into HTML
                answer = build_answer_html(answer_lines)
                
                current_cards.append({
                    'q': question,
                    'a': answer
                })
            continue
        
        i += 1
    
    # Don't forget the last topic
    if current_topic and current_cards:
        topics.append({
            'topic': current_topic,
            'cards': current_cards
        })
    
    return topics

def generate_js_block(topics):
    """Generate JavaScript for the PEDIATRICS section entries (to inject into year2 array)"""
    lines = []
    
    for t_idx, topic_data in enumerate(topics):
        topic_name = topic_data['topic']
        icon = TOPIC_ICONS.get(topic_name, 'stethoscope')
        cards = topic_data['cards']
        
        lines.append('        {')
        lines.append('          section: "PEDIATRICS",')
        lines.append(f'          topic: "{escape_for_js(topic_name)}",')
        lines.append(f'          icon: "{icon}",')
        lines.append('          cards: [')
        
        for c_idx, card in enumerate(cards):
            q = escape_for_js(card['q'])
            a = escape_for_js(card['a'])
            comma = ',' if c_idx < len(cards) - 1 else ''
            lines.append(f'            {{ q: "{q}", a: "{a}" }}{comma}')
        
        lines.append('          ]')
        lines.append('        },')
    
    return '\r\n'.join(lines)

def inject_into_data_file(data_filepath, backup_filepath, new_js_block):
    """Inject the PEDIATRICS block into the year2 section"""
    print(f"Reading data file...")
    with open(data_filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Backup
    print(f"Creating backup: {backup_filepath}")
    with open(backup_filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    
    # The injection point: just before the closing of year2 array
    # The year2 array ends with:
    #   ]
    # },
    # 'year3': [
    # We insert before the `],` that closes year2
    
    # Find the closing of year2 (the `],` before `'year3'`)
    # Pattern: we find the sequence ending year2
    year3_pos = content.find("      'year3': [")
    if year3_pos == -1:
        print("ERROR: Could not find 'year3' section!")
        return False
    
    # Find the `],` that closes year2, right before year3
    # It should be `      ],\r\n      'year3'` or similar
    # Go backwards from year3_pos to find the `],`
    close_pos = content.rfind('      ],\r\n', 0, year3_pos)
    if close_pos == -1:
        close_pos = content.rfind('      ],\n', 0, year3_pos)
    
    if close_pos == -1:
        print("ERROR: Could not find year2 closing bracket!")
        return False
    
    print(f"Found injection point at position {close_pos}")
    
    # The closing is `      ],\r\n      'year3': [`
    # We need to insert our block BEFORE this closing bracket
    # Find the actual `]` on that line
    
    # Insert the new block: before `      ],`
    new_content = content[:close_pos] + new_js_block + '\r\n' + content[close_pos:]
    
    print(f"Writing updated file...")
    with open(data_filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"Done! Injected PEDIATRICS section into year2.")
    return True

def main():
    print("Parsing flashcard file...")
    topics = parse_flashcards(INPUT_FILE)
    
    print(f"Found {len(topics)} topics:")
    total_cards = 0
    for t in topics:
        count = len(t['cards'])
        total_cards += count
        print(f"  - {t['topic']}: {count} cards")
    print(f"  TOTAL: {total_cards} cards\n")
    
    print("Generating JavaScript block...")
    js_block = generate_js_block(topics)
    
    # Save JS block for inspection
    debug_file = r'C:\Users\Hasan-PC\Desktop\MedHelp\scratch\peds_flashcards_output_v2.js'
    with open(debug_file, 'w', encoding='utf-8') as f:
        f.write(js_block)
    print(f"JS block saved to: {debug_file}\n")
    
    # Inject into data file
    success = inject_into_data_file(DATA_FILE, BACKUP_FILE, js_block)
    
    if success:
        print(f"\nSUCCESS! {total_cards} PEDIATRICS flashcards added to the data file.")
    else:
        print("\nFAILED to inject. Please check the error messages above.")

if __name__ == '__main__':
    main()
