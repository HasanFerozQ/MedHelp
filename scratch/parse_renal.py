import json
import re

def format_text(text):
    # LaTeX-like symbols
    text = text.replace(r'\uparrow', '&uarr;')
    text = text.replace(r'\downarrow', '&darr;')
    text = text.replace(r'\rightarrow', '&rarr;')
    text = text.replace(r'\alpha', '&alpha;')
    text = text.replace(r'\beta', '&beta;')
    text = text.replace(r'\pm', '&plusmn;')
    text = text.replace(r'\times', '&times;')
    text = text.replace(r'\ge', '&ge;')
    text = text.replace(r'\le', '&le;')
    
    # Generic Ions/Formulas in $...$
    def latex_replacer(match):
        inner = match.group(1)
        # Handle ^+ or ^- or ^{2+} or ^{3-}
        inner = re.sub(r'\^\{([^}]+)\}', r'<sup>\1</sup>', inner)
        inner = re.sub(r'\^(\+|-)', r'<sup>\1</sup>', inner)
        # Handle _3 or _{m} or _p or _{Na}
        inner = re.sub(r'_\{([^}]+)\}', r'<sub>\1</sub>', inner)
        inner = re.sub(r'_([a-zA-Z0-9])', r'<sub>\1</sub>', inner)
        # Remove \text{...}
        inner = re.sub(r'\\text\{([^}]+)\}', r'\1', inner)
        return inner

    text = re.sub(r'\$([^$]+)\$', latex_replacer, text)
    
    # Organisms in Italics
    organisms = [
        'E. coli', 'Proteus mirabilis', 'Proteus', 'Chlamydia trachomatis', 
        'Neisseria gonorrhoeae', 'Candida albicans', 'Schistosoma haematobium', 
        'Klebsiella', 'Enterococcus', 'S. saprophyticus', 'Trypanosoma cruzi',
        'Coxsackie B', 'Adenovirus', 'BK Polyomavirus', 'BK Virus'
    ]
    for org in organisms:
        text = re.sub(rf'\b({re.escape(org)})\b', r'<i>\1</i>', text, flags=re.IGNORECASE)

    # Bolding high-yield terms
    keywords = [
        'Nephrotic Syndrome', 'Minimal Change Disease', 'MCD', 'FSGS', 
        'Focal Segmental Glomerulosclerosis', 'Membranous Nephropathy', 
        'Nephritic Syndrome', 'Poststreptococcal Glomerulonephritis', 'PSGN', 
        'IgA Nephropathy', 'Berger Disease', 'Henoch-Schönlein Purpura', 'HSP', 
        'Rapidly Progressive Glomerulonephritis', 'RPGN', 'Goodpasture Syndrome', 
        'Granulomatosis with Polyangiitis', 'GPA', 'Membranoproliferative Glomerulonephritis', 
        'MPGN', 'Alport Syndrome', 'Acute Kidney Injury', 'AKI', 'Acute Tubular Necrosis', 
        'ATN', 'FENA', 'Acute Interstitial Nephritis', 'AIN', 'Renal Papillary Necrosis', 
        'ADPKD', 'ARPKD', 'Potter Sequence', 'Diabetic Nephropathy', 'Renal Cell Carcinoma', 
        'RCC', 'Wilms Tumor', 'Urothelial Carcinoma', 'Transitional Cell Carcinoma', 
        'Struvite stones', 'Cystinuria', 'Fanconi Syndrome', 'Bartter Syndrome', 
        'Gitelman Syndrome', 'Liddle Syndrome', 'Lupus Nephritis', 'HUS', 
        'Hemolytic Uremic Syndrome', 'TTP', 'Renal Artery Stenosis', 'Anion Gap', 
        'HAGMA', 'NAGMA', 'RTA', 'Renal Tubular Acidosis', 'Beckwith-Wiedemann Syndrome',
        'WAGR Syndrome', 'Denys-Drash Syndrome', 'BPH', 'Michaelis-Gutmann bodies', 
        'Malakoplakia', 'Kimmelstiel-Wilson nodules', 'Aschoff bodies'
    ]
    
    keywords = sorted(list(set(keywords)), key=len, reverse=True)
    for k in keywords:
        # Avoid double bolding
        text = re.sub(rf'\b(?<!<b>)({re.escape(k)})(?!</b>)\b', r'<b>\1</b>', text, flags=re.IGNORECASE)

    return text.strip()

def parse_file(input_path, output_path):
    with open(input_path, 'r', encoding='utf-8') as f:
        content = f.read()

    cards = []
    # Match Front: ... Back: ...
    matches = re.findall(r'Front:\s*(.*?)\s*Back:\s*(.*?)(?=Front:|$)', content, re.DOTALL)
    
    for front, back in matches:
        cards.append({
            "q": format_text(front.strip()),
            "a": format_text(back.strip())
        })
    
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(cards, f, indent=2)
    
    return len(cards)

if __name__ == "__main__":
    count = parse_file('c:/Users/Hasan-PC/Desktop/MedHelp/scratch/renal_raw.txt', 'c:/Users/Hasan-PC/Desktop/MedHelp/scratch/renal_cards.json')
    print(f"Parsed {count} cards.")
