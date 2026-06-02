import re
import os
import json

def parse_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    lines = content.splitlines()
    
    topics_data = {}
    current_topic = None
    
    idx = 0
    while idx < len(lines):
        line = lines[idx].strip()
        if not line:
            idx += 1
            continue
        
        if line.startswith("Topic:"):
            current_topic = line[len("Topic:"):].strip()
            if current_topic not in topics_data:
                topics_data[current_topic] = []
            idx += 1
            continue
        
        if line.startswith("Front:"):
            # Check if 'Back:' is also on the same line
            if "Back:" in line:
                parts = line.split("Back:", 1)
                front_text = parts[0][len("Front:"):].strip()
                back_text = parts[1].strip()
                if current_topic:
                    topics_data[current_topic].append({"q": front_text, "a": back_text})
                idx += 1
                continue
            else:
                front_text = line[len("Front:"):].strip()
                back_text = ""
                idx += 1
                # Consume lines until we find "Back:"
                while idx < len(lines):
                    sub_line = lines[idx].strip()
                    if sub_line.startswith("Back:"):
                        back_text = sub_line[len("Back:"):].strip()
                        break
                    elif sub_line:
                        front_text += " " + sub_line
                    idx += 1
                
                # Consume subsequent lines for Back if they don't start with Front/Topic/empty line
                idx += 1
                while idx < len(lines):
                    next_line = lines[idx].strip()
                    if not next_line or next_line.startswith("Front:") or next_line.startswith("Topic:") or next_line.startswith("====="):
                        break
                    else:
                        back_text += " " + next_line
                        idx += 1
                
                if current_topic:
                    topics_data[current_topic].append({"q": front_text, "a": back_text})
                continue
        
        idx += 1
    return topics_data

def enhance_text(text):
    if not text:
        return text
    
    # 1. Protect existing LaTeX blocks (delimited by $...$)
    latex_blocks = []
    def save_latex(match):
        latex_blocks.append(match.group(0))
        return f"__LATEX_BLOCK_{len(latex_blocks)-1}__"
    
    # Extract any LaTeX delimited by $...$
    text_processed = re.sub(r'\$[^\$]+\$', save_latex, text)
    
    # Helper to treat replacement strings as raw literals in re.sub
    lit = lambda s: (lambda m: s)
    
    # 2. Perform replacements on the remaining text, using (?<!\\) to avoid double replacing LaTeX macros
    
    # Replace GABA-A / GABA A / GABA-a
    text_processed = re.compile(r'(?<!\\)\bgaba[-\s]?a\b', re.IGNORECASE).sub(lit(r'$\text{GABA}_\text{A}$'), text_processed)
    # Replace GABA-B / GABA B / GABA-b
    text_processed = re.compile(r'(?<!\\)\bgaba[-\s]?b\b', re.IGNORECASE).sub(lit(r'$\text{GABA}_\text{B}$'), text_processed)
    
    # Replace 5-HT receptors: 5-HT1A, 5-HT2A, 5-HT2C, 5-HT2, 5-HT1, 5-HT3, 5-HT7, 5-HT
    text_processed = re.compile(r'(?<!\\)\b5-ht1a\b', re.IGNORECASE).sub(lit(r'$\text{5-HT}_{1\text{A}}$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b5-ht2a\b', re.IGNORECASE).sub(lit(r'$\text{5-HT}_{2\text{A}}$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b5-ht2c\b', re.IGNORECASE).sub(lit(r'$\text{5-HT}_{2\text{C}}$'), text_processed)
    
    def replace_5ht(m):
        g1 = m.group(1)
        g2 = m.group(2)
        if g2:
            return f"$\\text{{5-HT}}_{{{g1}\\text{{{g2.upper()}}}}}$"
        else:
            return f"$\\text{{5-HT}}_{{{g1}}}$"
    text_processed = re.compile(r'(?<!\\)\b5-ht(\d)([a-z]?)\b', re.IGNORECASE).sub(replace_5ht, text_processed)
    text_processed = re.compile(r'(?<!\\)\b5-ht\b', re.IGNORECASE).sub(lit(r'$\text{5-HT}$'), text_processed)
    
    # Replace receptors D2, H1, H2
    text_processed = re.compile(r'(?<!\\)\b(d2)\b', re.IGNORECASE).sub(lit(r'$\text{D}_2$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(h1)\b', re.IGNORECASE).sub(lit(r'$\text{H}_1$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(h2)\b', re.IGNORECASE).sub(lit(r'$\text{H}_2$'), text_processed)
    
    # Greek letters used in medical terms
    text_processed = re.compile(r'(?<!\\)\b(alpha-1|alpha 1)\b', re.IGNORECASE).sub(lit(r'$\alpha_1$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(alpha-2|alpha 2)\b', re.IGNORECASE).sub(lit(r'$\alpha_2$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(beta-1|beta 1)\b', re.IGNORECASE).sub(lit(r'$\beta_1$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(beta-2|beta 2)\b', re.IGNORECASE).sub(lit(r'$\beta_2$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(alpha-blocker|alpha blocker)s?\b', re.IGNORECASE).sub(lit(r'$\alpha$-blocker'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(beta-blocker|beta blocker)s?\b', re.IGNORECASE).sub(lit(r'$\beta$-blocker'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(beta-lactam|beta lactam)s?\b', re.IGNORECASE).sub(lit(r'$\beta$-lactam'), text_processed)
    text_processed = re.compile(r'(?<!\\)\bbeta-glucuronidase\b', re.IGNORECASE).sub(lit(r'$\beta$-glucuronidase'), text_processed)
    text_processed = re.compile(r'(?<!\\)\bbeta-lactamase\b', re.IGNORECASE).sub(lit(r'$\beta$-lactamase'), text_processed)
    text_processed = re.compile(r'(?<!\\)\balpha-adrenergic\b', re.IGNORECASE).sub(lit(r'$\alpha$-adrenergic'), text_processed)
    text_processed = re.compile(r'(?<!\\)\bbeta-adrenergic\b', re.IGNORECASE).sub(lit(r'$\beta$-adrenergic'), text_processed)
    text_processed = re.compile(r'(?<!\\)\bbeta-hcg\b', re.IGNORECASE).sub(lit(r'$\beta$-hCG'), text_processed)
    
    # Opioids receptors
    text_processed = re.compile(r'(?<!\\)\b(mu-opioid|mu opioid)\b', re.IGNORECASE).sub(lit(r'$\mu$-opioid'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(kappa-opioid|kappa opioid)\b', re.IGNORECASE).sub(lit(r'$\kappa$-opioid'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(delta-opioid|delta opioid)\b', re.IGNORECASE).sub(lit(r'$\delta$-opioid'), text_processed)
    
    # Generic greek letter words when used in clinical contexts
    text_processed = re.compile(r'(?<!\\)\b(alpha)\b', re.IGNORECASE).sub(lit(r'$\alpha$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(beta)\b', re.IGNORECASE).sub(lit(r'$\beta$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(gamma)\b', re.IGNORECASE).sub(lit(r'$\gamma$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(delta)\b', re.IGNORECASE).sub(lit(r'$\delta$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(mu)\b', re.IGNORECASE).sub(lit(r'$\mu$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(kappa)\b', re.IGNORECASE).sub(lit(r'$\kappa$'), text_processed)
    
    # Chemical formulas (CO2, O2, H2O, NaHCO3, H2S)
    text_processed = re.compile(r'(?<!\\)\bco2\b', re.IGNORECASE).sub(lit(r'$\text{CO}_2$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\bo2\b', re.IGNORECASE).sub(lit(r'$\text{O}_2$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\bh2o\b', re.IGNORECASE).sub(lit(r'$\text{H}_2\text{O}$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\bnahco3\b', re.IGNORECASE).sub(lit(r'$\text{NaHCO}_3$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\bh2s\b', re.IGNORECASE).sub(lit(r'$\text{H}_2\text{S}$'), text_processed)
    
    # Blood gases and saturation
    text_processed = re.compile(r'(?<!\\)\bpao2\b', re.IGNORECASE).sub(lit(r'$PaO_2$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\bpaco2\b', re.IGNORECASE).sub(lit(r'$PaCO_2$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\bspo2\b', re.IGNORECASE).sub(lit(r'$SpO_2$'), text_processed)
    
    # 1,25-(OH)2D3 and vitamin D conversion
    text_processed = re.compile(r'(?<!\\)\b1,25-\(oh\)2d3\b', re.IGNORECASE).sub(lit(r'$1,25\text{-(OH)}_2\text{D}_3$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b1,25-\(oh\)2d\b', re.IGNORECASE).sub(lit(r'$1,25\text{-(OH)}_2\text{D}$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b1-alpha-hydroxylase\b', re.IGNORECASE).sub(lit(r'1-$\alpha$-hydroxylase'), text_processed)
    text_processed = re.compile(r'(?<!\\)\bvitamin d3\b', re.IGNORECASE).sub(lit(r'Vitamin $\text{D}_3$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\bvitamin d2\b', re.IGNORECASE).sub(lit(r'Vitamin $\text{D}_2$'), text_processed)
    
    # Electrolyte ions
    text_processed = re.compile(r'(?<!\\)\b(na\+)\b', re.IGNORECASE).sub(lit(r'$\text{Na}^+$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(k\+)\b', re.IGNORECASE).sub(lit(r'$\text{K}^+$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(cl-)\b', re.IGNORECASE).sub(lit(r'$\text{Cl}^-$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(hco3-)\b', re.IGNORECASE).sub(lit(r'$\text{HCO}_3^-$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(h\+)\b', re.IGNORECASE).sub(lit(r'$\text{H}^+$'), text_processed)
    text_processed = re.compile(r'(?<!\\)\b(nh4\+)\b', re.IGNORECASE).sub(lit(r'$\text{NH}_4^+$'), text_processed)
    
    # pH representation
    text_processed = re.compile(r'(?<!\\)\b(ph)\b').sub(lit(r'$pH$'), text_processed)
    
    # Standard comparisons and math formatting in text if they are not already in LaTeX
    text_processed = re.compile(r'(?<!\$)([><=]=?\s*\d+(?:\.\d+)?%?)(?!\$)').sub(lit(r'$\1$'), text_processed)
    
    # 3. Put back the protected LaTeX blocks
    for i, latex in enumerate(latex_blocks):
        text_processed = text_processed.replace(f"__LATEX_BLOCK_{i}__", latex)
        
    # Standardize comparison characters inside LaTeX blocks
    def fix_latex_comparisons(match):
        inner = match.group(0)
        inner = inner.replace('>=', '\\ge').replace('<=', '\\le')
        inner = inner.replace('%', '\\%')
        return inner

    text_processed = re.sub(r'\$[^\$]+\$', fix_latex_comparisons, text_processed)

    # 4. Standard spelling and grammar fixes
    text_processed = text_processed.replace("Simultanous", "Simultaneous")
    
    return text_processed

def make_js_cards(cards_list):
    lines = []
    for i, card in enumerate(cards_list):
        q = enhance_text(card['q'])
        a = enhance_text(card['a'])
        
        # Step 1: Escape backslashes first
        q_escaped = q.replace('\\', '\\\\')
        a_escaped = a.replace('\\', '\\\\')
        
        # Step 2: Escape quotes
        q_escaped = q_escaped.replace('"', '\\"')
        a_escaped = a_escaped.replace('"', '\\"')
        
        # Step 3: Escape literal newlines
        q_escaped = q_escaped.replace('\n', '\\n')
        a_escaped = a_escaped.replace('\n', '\\n')
        
        comma = "," if i < len(cards_list) - 1 else ""
        lines.append(f'            {{ q: "{q_escaped}", a: "{a_escaped}" }}{comma}')
    return "[\n" + "\n".join(lines) + "\n          ]"

def inject_cards(html_content, section_name, topic_name, cards_js):
    escaped_topic = re.escape(topic_name)
    escaped_section = re.escape(section_name)
    
    pattern = re.compile(
        r'section:\s*[\'\"]' + escaped_section + r'[\'\"]\s*,\s*'
        r'topic:\s*[\'\"]' + escaped_topic + r'[\'\"]\s*,\s*'
        r'icon:\s*[\'\"]\w+[\'\"]\s*,\s*'
        r'cards:\s*\[\s*\]',
        re.MULTILINE
    )
    
    match = pattern.search(html_content)
    if not match:
        print(f"WARNING: Could not find section '{section_name}', topic '{topic_name}' in HTML.")
        pattern_fallback = re.compile(
            r'topic:\s*[\'\"]' + escaped_topic + r'[\'\"]\s*,\s*'
            r'icon:\s*[\'\"]\w+[\'\"]\s*,\s*'
            r'cards:\s*\[\s*\]',
            re.MULTILINE
        )
        match = pattern_fallback.search(html_content)
        if not match:
            print(f"ERROR: Could not find topic '{topic_name}' in HTML.")
            return html_content
            
    matched_text = match.group(0)
    cards_start = matched_text.find("cards:")
    if cards_start != -1:
        replaced_text = matched_text[:cards_start] + f"cards: {cards_js}"
        return html_content.replace(matched_text, replaced_text)
    return html_content

def main():
    psych_path = r"C:\Users\Hasan-PC\Desktop\MedHelp\vision\3rdYearPsychiatryFlashCards.txt"
    peds_path = r"C:\Users\Hasan-PC\Desktop\MedHelp\vision\3rdYearPediatricsFlashCards.txt"
    html_path = r"C:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"
    
    print("Parsing text files...")
    psych_data = parse_file(psych_path)
    peds_data = parse_file(peds_path)
    
    with open(html_path, 'r', encoding='utf-8') as f:
        html_content = f.read()
        
    original_html_len = len(html_content)
    
    print("\nInjecting Psychiatry cards...")
    for topic, cards in psych_data.items():
        print(f" - {topic}: {len(cards)} cards")
        cards_js = make_js_cards(cards)
        html_content = inject_cards(html_content, "Psychiatry", topic, cards_js)
        
    print("\nInjecting Pediatrics cards...")
    for topic, cards in peds_data.items():
        print(f" - {topic}: {len(cards)} cards")
        cards_js = make_js_cards(cards)
        html_content = inject_cards(html_content, "Pediatrics (Introductory)", topic, cards_js)
        
    print(f"\nWriting updated flash-cards.html (original length: {original_html_len}, new length: {len(html_content)})")
    
    with open(html_path, 'w', encoding='utf-8') as f:
        f.write(html_content)
        
    print("SUCCESS: Cards injected successfully!")

if __name__ == "__main__":
    main()
