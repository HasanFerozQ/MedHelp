import json
import re

def format_text(text):
    # Handle LaTeX-style subscripts and superscripts
    text = re.sub(r'(\w)_(\d+)', r'\1<sub>\2</sub>', text)
    text = re.sub(r'(\w)\^(\w+)', r'\1<sup>\2</sup>', text)
    text = re.sub(r'(\w)\^\+(\w*)', r'\1<sup>+</sup>\2', text)
    
    # Common formulas
    text = re.sub(r'\bO2\b', 'O<sub>2</sub>', text)
    text = re.sub(r'\bCO2\b', 'CO<sub>2</sub>', text)
    text = re.sub(r'\bH2O\b', 'H<sub>2</sub>O', text)
    text = re.sub(r'Na\+', 'Na<sup>+</sup>', text)
    text = re.sub(r'K\+', 'K<sup>+</sup>', text)
    text = re.sub(r'Ca2\+', 'Ca<sup>2+</sup>', text)
    text = re.sub(r'H\+', 'H<sup>+</sup>', text)
    text = re.sub(r'HCO3-', 'HCO<sub>3</sub><sup>-</sup>', text)
    text = re.sub(r'COHb', 'COHb', text)
    text = re.sub(r'(\d+) degrees', r'\1&deg;', text)
    
    # Remove remaining $ signs
    text = text.replace('$', '')
    
    # Bold key terms (heuristic: first word or two if followed by colon)
    if ':' in text and not re.search(r'<(sup|sub|b)>', text): # simplistic way to avoid breaking HTML
        parts = text.split(':', 1)
        if len(parts[0].split()) <= 4: # If it's a short phrase before the colon
            text = f"<b>{parts[0].strip()}:</b> {parts[1].strip()}"
    
    # Common medical terms to bold
    terms_to_bold = [
        "Hypertrophy", "Hyperplasia", "Metaplasia", "Atrophy", "Necrosis", "Apoptosis",
        "Condyloma Acuminatum", "Extramammary Paget Disease", "Sarcoma Botryoides",
        "Clear Cell Adenocarcinoma", "Cervical Intraepithelial Neoplasia", "Asherman Syndrome",
        "Endometriosis", "Adenomyosis", "Leiomyoma", "Polycystic Ovarian Syndrome",
        "Cystic Teratoma", "Struma Ovarii", "Dysgerminoma", "Yolk Sac Tumors", "Granulosa Cell Tumors",
        "Meigs Syndrome", "Krukenberg Tumor", "Hydatidiform Mole", "Choriocarcinoma",
        "Cryptorchidism", "Orchitis", "Hydrocele", "Varicocele", "Seminoma",
        "Benign Prostatic Hyperplasia", "Prostate Adenocarcinoma", "Algor Mortis",
        "Livor Mortis", "Rigor Mortis", "Carbon Monoxide", "Cyanide", "Saponification",
        "Mummification", "Tardieu Spots", "Putrefaction", "Cadaveric Spasm", "Exsanguination",
        "Sudden Infant Death Syndrome"
    ]
    for term in terms_to_bold:
        if f"<b>{term}" not in text:
            # use regex word boundary to bold
            text = re.sub(rf'\b({term})\b', r'<b>\1</b>', text, flags=re.IGNORECASE)
            
    return text

def parse_flashcards(file_path):
    cards = []
    current_q = None
    
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        
    for line in lines:
        line = line.strip()
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

path = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\sexual_forensic_raw.txt"
cards = parse_flashcards(path)

output_json = json.dumps(cards, indent=2)
with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\sexual_forensic_cards.json", "w", encoding='utf-8') as f:
    f.write(output_json)

print(f"Successfully parsed {len(cards)} cards.")
