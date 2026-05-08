import json
import re

def format_text(text):
    # LaTeX-like symbols (if any)
    text = text.replace(r'\uparrow', '&uarr;')
    text = text.replace(r'\downarrow', '&darr;')
    text = text.replace(r'\rightarrow', '&rarr;')
    
    # Greek symbols
    text = text.replace(r'\alpha', '&alpha;')
    text = text.replace(r'\beta', '&beta;')
    text = text.replace(r'\gamma', '&gamma;')
    text = text.replace(r'\delta', '&delta;')
    
    # Subscripts and Superscripts for Endocrine specific terms
    # Hormones
    text = re.sub(r'\bT([34])\b', r'T<sub>\1</sub>', text)
    text = re.sub(r'\b(f|free) T([34])\b', r'\1 T<sub>\2</sub>', text, flags=re.IGNORECASE)
    
    # Ions and formulas
    text = re.sub(r'\bCa2\+\b', 'Ca<sup>2+</sup>', text)
    text = re.sub(r'\bH2O\b', 'H<sub>2</sub>O', text)
    text = re.sub(r'\b(CO2|O2)\b', lambda m: m.group(1)[:2] + '<sub>' + m.group(1)[2:] + '</sub>', text)
    
    # HbA1c
    text = re.sub(r'\bHbA1c\b', 'HbA<sub>1c</sub>', text)
    
    # General Sub/Sup logic
    text = re.sub(r'\^\{([^}]+)\}', r'<sup>\1</sup>', text)
    text = re.sub(r'_\{([^}]+)\}', r'<sub>\1</sub>', text)
    
    # Remove remaining math delimiters
    text = text.replace('$', '')
    
    # Common medical/biological italics
    genera = ['Neisseria', 'Mycobacterium', 'Staphylococcus', 'Streptococcus']
    for g in genera:
        text = re.sub(rf'\b({g})\b', r'<i>\1</i>', text)
    
    # Species
    text = re.sub(r'\bN\. meningitidis\b', '<i>N. meningitidis</i>', text)

    # Bolding high-yield terms
    keywords = [
        'Prolactinoma', 'Acromegaly', 'Gigantism', 'Sheehan Syndrome', 
        'Diabetes Insipidus', 'SIADH', 'Graves Disease', 'Hashimoto Thyroiditis', 
        'Papillary Thyroid Carcinoma', 'Follicular Carcinoma', 'Medullary Thyroid Carcinoma', 
        'MEN 1', 'MEN 2A', 'MEN 2B', 'Cushing Syndrome', 'Cushing Disease', 
        'Addison Disease', 'Pheochromocytoma', 'Neuroblastoma', 'Diabetes Mellitus', 
        'DKA', 'HHS', 'Zollinger-Ellison', 'Conn Syndrome', 'CAH', 
        'Waterhouse-Friderichsen', 'Psammoma bodies', 'Orphan Annie', 
        'Kimmelstiel-Wilson', 'Whipple Triad', 'Homer-Wright rosettes', 
        'Zellballen', 'C-peptide', 'HbA1c', 'TSH', 'ACTH', 'ADH', 'PTH', 'PTHrP'
    ]
    
    keywords = sorted(list(set(keywords)), key=len, reverse=True)
    for k in keywords:
        text = re.sub(rf'\b(?<!<b>)({re.escape(k)})(?!</b>)\b', r'<b>\1</b>', text, flags=re.IGNORECASE)

    # Comparisons
    text = text.replace(' < ', ' &lt; ')
    text = text.replace(' > ', ' &gt; ')
    text = re.sub(r'> 6.5%', '&gt; 6.5%', text)
    text = re.sub(r'> 200', '&gt; 200', text)
    text = re.sub(r'> 100g', '&gt; 100g', text)
    text = re.sub(r'> 600 mg/dL', '&gt; 600 mg/dL', text)

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
    count = parse_file('c:/Users/Hasan-PC/Desktop/MedHelp/scratch/endocrine_raw.txt', 'c:/Users/Hasan-PC/Desktop/MedHelp/scratch/endocrine_cards.json')
    print(f"Parsed {count} cards.")
