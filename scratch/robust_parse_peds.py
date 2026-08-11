#!/usr/bin/env python3
"""
Robust parser for FlashCards USMLE 2.txt handling both:
- '1. Q: Question...'
- '651.\nQ: Question...'
"""

import re
import json

TXT_FILE = r'C:\Users\Hasan-PC\Desktop\MedHelp\vision\FlashCards USMLE 2.txt'

TOPIC_ICONS = {
    "Growth & Development": "baby",
    "Neonatology": "heart-pulse",
    "Genetic/Congenital Disorders": "dna",
    "Infectious Disease in Children": "bacteria",
    "Immunizations": "syringe",
    "Pediatric GI/Cardio/Pulm": "stethoscope",
    "Adolescent Medicine": "user",
}

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
    
    lines = content.replace('\r\n', '\n').replace('\r', '\n').split('\n')
    
    topics = []
    current_topic = None
    current_cards = []
    
    i = 0
    while i < len(lines):
        line = lines[i]
        line_stripped = line.strip()
        
        if line_stripped.startswith('Topic:'):
            if current_topic and current_cards:
                topics.append({
                    'section': 'PEDIATRICS',
                    'topic': current_topic,
                    'icon': TOPIC_ICONS.get(current_topic, 'stethoscope'),
                    'cards': current_cards
                })
            current_topic = line_stripped.replace('Topic:', '').strip()
            current_cards = []
            i += 1
            continue
        
        if line_stripped.startswith('===') or line_stripped.startswith('Section:') or line_stripped.startswith('For FlashCards'):
            i += 1
            continue
        
        # Determine if this line starts a question
        # Case A: '1. Q: Question text'
        m_inline = re.match(r'^\s*\d+\.\s*Q:\s*(.*)', line)
        # Case B: '651.' on standalone line, followed by 'Q: Question text'
        m_num = re.match(r'^\s*\d+\.\s*$', line)
        
        question = None
        
        if m_inline:
            question = m_inline.group(1).strip()
            i += 1
            # Collect additional question lines until 'A:' or next question start
            while i < len(lines):
                curr = lines[i].strip()
                if curr.startswith('A:') or re.match(r'^\s*\d+\.\s*Q:', lines[i]) or re.match(r'^\s*\d+\.\s*$', lines[i]):
                    break
                if curr:
                    question += ' ' + curr
                i += 1
        elif m_num:
            # Check next non-empty line for 'Q:'
            j = i + 1
            while j < len(lines) and not lines[j].strip():
                j += 1
            if j < len(lines) and lines[j].strip().startswith('Q:'):
                question = lines[j].strip()[2:].strip()
                i = j + 1
                # Collect additional question lines
                while i < len(lines):
                    curr = lines[i].strip()
                    if curr.startswith('A:') or re.match(r'^\s*\d+\.\s*Q:', lines[i]) or re.match(r'^\s*\d+\.\s*$', lines[i]):
                        break
                    if curr:
                        question += ' ' + curr
                    i += 1
            else:
                i += 1
                continue
        else:
            i += 1
            continue
        
        # Now collect answer lines
        answer_lines = []
        if i < len(lines) and lines[i].strip().startswith('A:'):
            answer_start = lines[i].strip()[2:].strip()
            if answer_start:
                answer_lines.append(answer_start)
            i += 1
            
            while i < len(lines):
                curr = lines[i]
                curr_s = curr.strip()
                
                if re.match(r'^\s*\d+\.\s*Q:', curr) or re.match(r'^\s*\d+\.\s*$', curr):
                    break
                if curr_s.startswith('===') or curr_s.startswith('Topic:') or curr_s.startswith('For FlashCards'):
                    break
                
                answer_lines.append(curr_s)
                i += 1
            
            answer = build_answer_html(answer_lines)
            if question:
                current_cards.append({
                    'q': question,
                    'a': answer
                })
    
    if current_topic and current_cards:
        topics.append({
            'section': 'PEDIATRICS',
            'topic': current_topic,
            'icon': TOPIC_ICONS.get(current_topic, 'stethoscope'),
            'cards': current_cards
        })
    
    return topics

if __name__ == '__main__':
    topics = parse_txt_file(TXT_FILE)
    print(f"Total topics parsed: {len(topics)}")
    total_q = 0
    for t in topics:
        q_count = len(t['cards'])
        total_q += q_count
        first_q = t['cards'][0]['q'][:50] if q_count > 0 else 'N/A'
        last_q = t['cards'][-1]['q'][:50] if q_count > 0 else 'N/A'
        print(f"\n- Topic: {t['topic']}")
        print(f"  Count: {q_count}")
        print(f"  First Q: {first_q}...")
        print(f"  Last Q:  {last_q}...")
    
    print(f"\nTOTAL FLASHCARDS: {total_q}")
