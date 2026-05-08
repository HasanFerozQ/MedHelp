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
        'Treponema pallidum', 'Chlamydia trachomatis', 'Neisseria gonorrhoeae', 
        'Staphylococcus aureus', 'Trichomonas vaginalis', 'Corynebacterium', 
        'E. coli', 'Pseudomonas', 'Mumps virus', 'CMV', 'Gardnerella vaginalis',
        'Bacteroides', 'Fusobacterium', 'Peptostreptococcus', 'Schistosoma haematobium',
        'Chlamydia', 'Syphilis', 'Gonorrhea', 'Staph. aureus'
    ]
    organisms = sorted(list(set(organisms)), key=len, reverse=True)
    for org in organisms:
        text = re.sub(rf'\b({re.escape(org)})\b', r'<i>\1</i>', text, flags=re.IGNORECASE)

    # Bolding high-yield terms
    keywords = [
        'Bartholin Cyst', 'Lichen Sclerosus', 'Lichen Simplex Chronicus', 'Extramammary Paget Disease', 
        'Transformation Zone', 'HPV', 'Endometrial Hyperplasia', 'Endometrial Carcinoma', 
        'Adenomyosis', 'Endometriosis', 'Chocolate Cysts', 'Leiomyoma', 'Fibroid', 'Leiomyosarcoma', 
        'Yolk Sac Tumor', 'Schiller-Duval bodies', 'Dysgerminoma', 'Cystic Teratoma', 'Dermoid Cyst', 
        'Struma Ovarii', 'Granulosa Cell Tumor', 'Call-Exner bodies', 'Meigs Syndrome', 
        'Krukenberg Tumor', 'Hydatidiform Mole', 'Choriocarcinoma', 'Preeclampsia', 'Eclampsia', 
        'Placenta Previa', 'Placenta Abruptio', 'Cryptorchidism', 'Seminoma', 'Reinke crystals', 
        'BPH', 'Benign Prostatic Hyperplasia', 'PSA', 'Prostate Specific Antigen', 
        'Fibrocystic Changes', 'Fibroadenoma', 'Phyllodes Tumor', 'Invasive Ductal Carcinoma', 
        'Invasive Lobular Carcinoma', 'Inflammatory Breast Cancer', 'DCIS', 'LCIS', 
        'Syphilis', 'Lymphogranuloma Venereum', 'LGV', 'Pelvic Inflammatory Disease', 'PID', 
        'Fitz-Hugh-Curtis Syndrome', 'Bacterial Vaginosis', 'PCOS', 'Polycystic Ovarian Syndrome', 
        'Turner Syndrome', 'Klinefelter Syndrome', 'Asherman Syndrome', 'HELLP Syndrome', 
        'Arias-Stella Reaction', 'Peyronie Disease', 'Bowen Disease', 'Bowenoid Papulosis', 
        'Fournier Gangrene', 'Kallmann Syndrome', 'McCune-Albright Syndrome', 'Swyer Syndrome',
        'Paget Disease', 'BRCA1', 'BRCA2', 'CA-125', 'AFP', 'hCG', 'DES', 'PAS', 'S100', 
        'PTEN', 'p53', 'p16', 'p57', 'ER', 'PR', 'HER2'
    ]
    
    keywords = sorted(list(set(keywords)), key=len, reverse=True)
    for k in keywords:
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
    count = parse_file('c:/Users/Hasan-PC/Desktop/MedHelp/scratch/reproductive_raw.txt', 'c:/Users/Hasan-PC/Desktop/MedHelp/scratch/reproductive_cards.json')
    print(f"Parsed {count} cards.")
