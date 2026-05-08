import json
import re

def format_text(text):
    # LaTeX-like symbols
    text = text.replace(r'\uparrow', '&uarr;')
    text = text.replace(r'\downarrow', '&darr;')
    text = text.replace(r'\rightarrow', '&rarr;')
    text = text.replace(r'\alpha', '&alpha;')
    text = text.replace(r'\beta', '&beta;')
    text = text.replace(r'\gamma', '&gamma;')
    text = text.replace(r'\delta', '&delta;')
    text = text.replace(r'\ge', '&ge;')
    text = text.replace(r'\pm', '&plusmn;')
    text = text.replace(r'\times', '&times;')
    
    # Generic Ions/Formulas in $...$
    def latex_replacer(match):
        inner = match.group(1)
        # Handle ^+ or ^- or ^{2+}
        inner = re.sub(r'\^\{([^}]+)\}', r'<sup>\1</sup>', inner)
        inner = re.sub(r'\^(\+|-)', r'<sup>\1</sup>', inner)
        # Handle _3 or _{m} or _p
        inner = re.sub(r'_\{([^}]+)\}', r'<sub>\1</sub>', inner)
        inner = re.sub(r'_([a-zA-Z0-9])', r'<sub>\1</sub>', inner)
        # Remove \text{...}
        inner = re.sub(r'\\text\{([^}]+)\}', r'\1', inner)
        return inner

    text = re.sub(r'\$([^$]+)\$', latex_replacer, text)
    
    # Organisms in Italics
    organisms = [
        'Viridans group streptococci', 'Staphylococcus aureus', 'Trypanosoma cruzi', 
        'Coxsackie B', 'Adenovirus', 'Neisseria', 'Streptococcus', 'Tuberculosis'
    ]
    for org in organisms:
        text = re.sub(rf'\b({re.escape(org)})\b', r'<i>\1</i>', text, flags=re.IGNORECASE)

    # Bolding high-yield terms
    keywords = [
        'Truncus arteriosus', 'Bulbus cordis', 'Ligamentum arteriosum', 'VSD', 'ASD', 
        'Tetralogy of Fallot', 'PDA', 'RCA', 'SA node', 'AV node', 'Aortic Stenosis', 
        'Mitral Regurgitation', 'Rheumatic Heart Disease', 'Dressler Syndrome', 'HFpEF', 
        'HOCM', 'Cardiac Output', 'Mean Arterial Pressure', 'Preload', 'Afterload', 
        'Beck\'s Triad', 'Kussmaul sign', 'Frank-Starling', 'Aschoff bodies', 
        'Cardiac Tamponade', 'Infective endocarditis', 'Aortic Dissection', 
        'Giant Cell Arteritis', 'Wegener', 'WPW', 'Jones criteria', 'Atrial Myxoma', 
        'Rhabdomyoma', 'Eisenmenger Syndrome', 'Ebstein Anomaly', 'Takotsubo', 
        'Kawasaki Disease', 'Cor Pulmonale', 'Brugada Syndrome', 'Torsades de Pointes',
        'Long QT Syndrome', 'LAD', 'Widowmaker', 'Ashman Phenomenon', 'Heyde Syndrome',
        'Wellens Syndrome', 'PCWP', 'PVR', 'EF', 'SV', 'EDV', 'ESV', 'BNP', 'CK-MB',
        'Troponin', 'Osler nodes', 'Janeway lesions', 'Roth spots'
    ]
    
    keywords = sorted(list(set(keywords)), key=len, reverse=True)
    for k in keywords:
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
    count = parse_file('c:/Users/Hasan-PC/Desktop/MedHelp/scratch/cardio_raw.txt', 'c:/Users/Hasan-PC/Desktop/MedHelp/scratch/cardio_cards.json')
    print(f"Parsed {count} cards.")
