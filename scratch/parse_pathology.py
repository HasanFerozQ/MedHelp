import json
import re

def format_text(text):
    # Handle LaTeX-style subscripts and superscripts
    text = re.sub(r'(\w)_(\d+)', r'\1<sub>\2</sub>', text)
    text = re.sub(r'(\w)\^(\w+)', r'\1<sup>\2</sup>', text)
    
    # Common formulas
    text = re.sub(r'O2\b', 'O<sub>2</sub>', text)
    text = re.sub(r'CO2\b', 'CO<sub>2</sub>', text)
    text = re.sub(r'H2O\b', 'H<sub>2</sub>O', text)
    text = re.sub(r'Na\+', 'Na<sup>+</sup>', text)
    text = re.sub(r'K\+', 'K<sup>+</sup>', text)
    text = re.sub(r'Ca2\+', 'Ca<sup>2+</sup>', text)
    text = re.sub(r'H\+', 'H<sup>+</sup>', text)
    text = re.sub(r'HCO3', 'HCO<sub>3</sub>', text)
    
    # Remove remaining $ signs
    text = text.replace('$', '')
    
    # Bold key terms (heuristic: first word or two if followed by colon)
    if ':' in text:
        parts = text.split(':', 1)
        text = f"<b>{parts[0].strip()}:</b> {parts[1].strip()}"
    
    # Common medical terms to bold
    terms_to_bold = [
        "Hypertrophy", "Hyperplasia", "Metaplasia", "Atrophy", "Necrosis", "Apoptosis",
        "Dystrophic Calcification", "Metastatic Calcification", "Acute Inflammation",
        "Chronic Inflammation", "Granuloma", "Phagocytosis", "Neoplasia", "Anaplasia",
        "Dysplasia", "Metastasis", "Carcinoma", "Sarcoma", "Hamartoma", "Choristoma"
    ]
    for term in terms_to_bold:
        # Avoid double bolding
        if f"<b>{term}" not in text:
            text = re.sub(rf'\b({term})\b', r'<b>\1</b>', text, flags=re.IGNORECASE)
            
    return text

def parse_flashcards(file_path, start_line, end_line):
    cards = []
    current_q = None
    
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        
    for i in range(start_line - 1, min(end_line, len(lines))):
        line = lines[i].strip()
        if not line: continue
        if line.startswith("Front:"):
            current_q = line.replace("Front:", "").strip()
        elif line.startswith("Back:") and current_q:
            answer = line.replace("Back:", "").strip()
            cards.append({
                "q": format_text(current_q),
                "a": format_text(answer)
            })
            current_q = None
            
    return cards

path = r"c:\Users\Hasan-PC\Desktop\MedHelp\vision\NotepadTxt\Flashcards.txt"
cards = parse_flashcards(path, 2772, 3200)

output_json = json.dumps(cards, indent=2)
with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\gen_path_cards.json", "w", encoding='utf-8') as f:
    f.write(output_json)

print(f"Successfully parsed {len(cards)} cards.")
