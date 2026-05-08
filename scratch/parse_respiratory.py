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
    text = text.replace(r'\Delta', '&Delta;')
    text = text.replace(r'\ge', '&ge;')
    
    # Generic Ions/Formulas in $...$
    def latex_replacer(match):
        inner = match.group(1)
        # Handle ^+ or ^- or ^{2+} or ^{3-}
        inner = re.sub(r'\^\{([^}]+)\}', r'<sup>\1</sup>', inner)
        inner = re.sub(r'\^(\+|-)', r'<sup>\1</sup>', inner)
        # Handle _3 or _{m} or _p or _{Na} or _1 or _2
        inner = re.sub(r'_\{([^}]+)\}', r'<sub>\1</sub>', inner)
        inner = re.sub(r'_([a-zA-Z0-9])', r'<sub>\1</sub>', inner)
        # Handle Pa, PA, Sa, Pv as italic if in math mode
        inner = re.sub(r'\b(Pa|PA|Sa|Pv|CaO2|CcO2|CvO2|DLCO)\b', r'<i>\1</i>', inner)
        # Remove \text{...}
        inner = re.sub(r'\\text\{([^}]+)\}', r'\1', inner)
        return inner

    text = re.sub(r'\$([^$]+)\$', latex_replacer, text)
    
    # Organisms in Italics
    organisms = [
        'Streptococcus pneumoniae', 'Klebsiella pneumoniae', 'Pseudomonas aeruginosa', 
        'Mycoplasma pneumoniae', 'Legionella pneumophila', 'Mycobacterium tuberculosis', 
        'Pneumocystis jirovecii', 'Staphylococcus aureus', 'Haemophilus influenzae type b', 
        'Bordetella pertussis', 'Coccidioides immitis', 'Histoplasma capsulatum', 
        'Blastomyces dermatitidis', 'Aspergillus fumigatus', 'Bacillus anthracis', 
        'Candida albicans', 'Haemophilus influenzae', 'Klebsiella', 'Pseudomonas', 
        'Mycoplasma', 'Legionella', 'Mycobacterium', 'Bordetella', 'Coccidioides', 
        'Histoplasma', 'Blastomyces', 'Aspergillus'
    ]
    # Sort by length to avoid partial matches
    organisms = sorted(list(set(organisms)), key=len, reverse=True)
    for org in organisms:
        text = re.sub(rf'\b({re.escape(org)})\b', r'<i>\1</i>', text, flags=re.IGNORECASE)

    # Bolding high-yield terms
    keywords = [
        'Tracheoesophageal Fistula', 'TEF', 'Pulmonary Surfactant', 'Type II pneumocytes', 
        'Emphysema', 'Chronic Bronchitis', 'Asthma', 'Bronchiectasis', 'Kartagener Syndrome', 
        'Cystic Fibrosis', 'CF', 'Sarcoidosis', 'Asbestosis', 'Silicosis', 'Berylliosis', 
        'Pulmonary Hypertension', 'Pulmonary Embolism', 'PE', 'DVT', 'Deep vein thrombosis', 
        'Pneumonia', 'Tuberculosis', 'TB', 'Adenocarcinoma', 'Squamous cell carcinoma', 
        'Small cell carcinoma', 'Horner Syndrome', 'Pancoast tumor', 'ARDS', 'Pneumothorax', 
        'Chylothorax', 'Obstructive Sleep Apnea', 'OSA', 'CO poisoning', 'Cyanide poisoning', 
        'Goodpasture Syndrome', 'Granulomatosis with Polyangiitis', 'GPA', 
        'Churg-Strauss Syndrome', 'EGPA', 'Hypersensitivity Pneumonitis', 'Farmer’s Lung', 
        'Lung Abscess', 'Epiglottitis', 'Croup', 'Laryngotracheobronchitis', 
        'Honeycomb lung', 'Reid Index', 'Charcot-Leyden crystals', 'Curschmann spirals', 
        'Ghon complex', 'Ghon focus', 'Wegener Granulomatosis', 'Pancoast tumor', 
        'Tension Pneumothorax', 'Methemoglobinemia', 'Bohr Effect', 'Haldane effect', 
        'West zones', 'L/S ratio', 'A-a gradient', 'Westermark Sign', 'Hampton’s Hump', 
        'Kussmaul breathing', 'Cheyne-Stokes respiration', 'SVC syndrome', 'Egophony'
    ]
    
    keywords = sorted(list(set(keywords)), key=len, reverse=True)
    for k in keywords:
        # Avoid double bolding or bolding inside italics
        text = re.sub(rf'\b(?<!<b>)(?<!<i>)({re.escape(k)})(?!</i>)(?!</b>)\b', r'<b>\1</b>', text, flags=re.IGNORECASE)

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
    count = parse_file('c:/Users/Hasan-PC/Desktop/MedHelp/scratch/respiratory_raw.txt', 'c:/Users/Hasan-PC/Desktop/MedHelp/scratch/respiratory_cards.json')
    print(f"Parsed {count} cards.")
