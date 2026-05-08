import json
import re

def format_text(text):
    # Remove Section headers that get caught in text
    text = re.sub(r'\nSection \d+:.*', '', text)
    
    # LaTeX-like symbols
    # Arrows
    text = text.replace(r'\uparrow', '&uarr;')
    text = text.replace(r'\downarrow', '&darr;')
    text = text.replace(r'\rightarrow', '&rarr;')
    
    # Math symbols
    text = text.replace(r'\\%', '%')
    text = text.replace(r'\%', '%')
    text = text.replace(r'\times', '&times;')
    text = text.replace(r'\approx', '&approx;')
    
    # Greek symbols
    text = text.replace(r'\delta', '&delta;')
    text = text.replace(r'\alpha', '&alpha;')
    text = text.replace(r'\beta', '&beta;')
    text = text.replace(r'\gamma', '&gamma;')
    
    # Subscripts and Superscripts
    text = re.sub(r'\^\{([^}]+)\}', r'<sup>\1</sup>', text)
    text = re.sub(r'_\{([^}]+)\}', r'<sub>\1</sub>', text)
    text = re.sub(r'\^(\w|\d)', r'<sup>\1</sup>', text)
    text = re.sub(r'_(\w|\d)', r'<sub>\1</sub>', text)
    
    # Remove remaining math delimiters
    text = text.replace('$', '')
    
    # Chemical formulas (more aggressive)
    text = re.sub(r'\b(H2S|O2|CO2|Fe2\+)\b', lambda m: m.group(1).replace('2', '<sub>2</sub>').replace('+', '<sup>+</sup>'), text)
    text = re.sub(r'TXA2', 'TXA<sub>2</sub>', text)
    
    # Common medical/biological italics
    genera = ['Salmonella', 'Staphylococcus', 'Streptococcus', 'Mycoplasma', 'Plasmodium', 'Erythrocyte', 'Reticulocyte']
    for g in genera:
        text = re.sub(rf'\b({g})\b', r'<i>\1</i>', text)

    # Bolding high-yield terms
    keywords = [
        'ALA synthase', 'Vitamin B6', 'erythropoietin', 'EPO', 'HbA1', 'HbF', 
        'Reticulocyte Index', 'Plummer-Vinson Syndrome', 'Sideroblastic Anemia', 
        'Thalassemia', 'Iron Deficiency', 'Lead Poisoning', 'B12', 'Folate', 
        'SCD', 'Pernicious Anemia', 'Megaloblastic Anemia', 'PNH', 'Budd-Chiari', 
        'Sickle Cell', 'G6PD', 'Heinz bodies', 'Bite cells', 'Coombs', 'CML', 
        'Philadelphia chromosome', 'AML', 'ALL', 'Hodgkin Lymphoma', 
        'Multiple Myeloma', 'DIC', 'TTP', 'HUS', 'ADAMTS13', 'Warfarin', 
        'Heparin', 'HIT', 'Factor V Leiden', 'Polycythemia Vera', 'JAK2', 
        'Burton lines', 'Reed-Sternberg', 'Bence-Jones', 'ATRA', 'Auer Rods',
        'TRAP', 'Sezary Syndrome', 'Myelofibrosis', 'HALT', 'Howell-Jolly',
        'Dacrocytes', 'Acanthocytes', 'Echinocytes', 'Degmacytes', 'Cabot Rings',
        'Zeta potential', 'Rouleaux', 'Acute Chest Syndrome', 'vWF', 'GpIb', 
        'GpIIb/IIIa', 'Pentad', 'CRAB', 'Bence-Jones', 'Reed-Sternberg', 'ATRA', 
        'Auer Rods', 'Bence-Jones', 'Reed-Sternberg', 'ATRA', 'Auer Rods'
    ]
    
    keywords = sorted(list(set(keywords)), key=len, reverse=True)
    for k in keywords:
        text = re.sub(rf'\b(?<!<b>)({re.escape(k)})(?!</b>)\b', r'<b>\1</b>', text, flags=re.IGNORECASE)

    # Comparisons
    text = text.replace(' < ', ' &lt; ')
    text = text.replace(' > ', ' &gt; ')
    text = re.sub(r'MCV < 80', 'MCV &lt; 80', text)
    text = re.sub(r'MCV > 100', 'MCV &gt; 100', text)
    text = re.sub(r'RI > 2%', 'RI &gt; 2%', text)
    text = re.sub(r'> 3.5%', '&gt; 3.5%', text)
    text = re.sub(r'> 5', '&gt; 5', text)
    text = re.sub(r'< 10%', '&lt; 10%', text)
    text = re.sub(r'< 13', '&lt; 13', text)
    text = re.sub(r'> 13', '&gt; 13', text)

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
    count = parse_file('c:/Users/Hasan-PC/Desktop/MedHelp/scratch/hematology_raw.txt', 'c:/Users/Hasan-PC/Desktop/MedHelp/scratch/hematology_cards.json')
    print(f"Parsed {count} cards.")
