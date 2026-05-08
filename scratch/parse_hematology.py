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
    text = text.replace(r'\pm', '&plusmn;')
    text = text.replace(r'\times', '&times;')
    text = text.replace(r'\ge', '&ge;')
    text = text.replace(r'\le', '&le;')
    text = text.replace(r'\Delta', '&Delta;')
    text = text.replace(r'^\circ\text{C}', '&deg;C')
    
    # Generic Ions/Formulas in $...$
    def latex_replacer(match):
        inner = match.group(1)
        # Handle t(9;22) etc.
        inner = re.sub(r't\((\d+);(\d+)\)', r'<i>t</i>(\1;\2)', inner)
        # Handle ^+ or ^- or ^{2+}
        inner = re.sub(r'\^\{([^}]+)\}', r'<sup>\1</sup>', inner)
        inner = re.sub(r'\^(\+|-|2\+|3\+)', r'<sup>\1</sup>', inner)
        # Handle _3 or _{m} or _2 or _A
        inner = re.sub(r'_\{([^}]+)\}', r'<sub>\1</sub>', inner)
        inner = re.sub(r'_([a-zA-Z0-9])', r'<sub>\1</sub>', inner)
        # Handle genes/proteins as italics if in math mode
        inner = re.sub(r'\b(BCR-ABL|c-MYC|BCL-2|JAK2|TXA2|PIGA|RAR|ADAMTS13|ALK|HFE|PTEN|p53)\b', r'<i>\1</i>', inner)
        # Remove \text{...}
        inner = re.sub(r'\\text\{([^}]+)\}', r'\1', inner)
        return inner

    text = re.sub(r'\$([^$]+)\$', latex_replacer, text)
    
    # Organisms in Italics
    organisms = [
        'Salmonella', 'H. pylori', 'Plasmodium falciparum', 'Mycoplasma pneumoniae', 
        'EBV', 'HTLV-1', 'Parvovirus B19', 'Staphylococcus aureus', 'E. coli O157:H7',
        'Staph. aureus', 'E. coli', 'Mycoplasma', 'Mumps', 'Corynebacterium', 'HTLV-1'
    ]
    organisms = sorted(list(set(organisms)), key=len, reverse=True)
    for org in organisms:
        text = re.sub(rf'\b({re.escape(org)})\b', r'<i>\1</i>', text, flags=re.IGNORECASE)

    # Bolding high-yield terms
    keywords = [
        'Iron Deficiency Anemia', 'Thalassemia', 'Plummer-Vinson Syndrome', 'Sideroblastic Anemia', 
        'Anemia of Chronic Disease', 'ACD', 'Megaloblastic Anemia', 'Pernicious Anemia', 
        'Hemolytic Anemia', 'Hereditary Spherocytosis', 'Sickle Cell Anemia', 'Sickle Cell', 
        'Paroxysmal Nocturnal Hemoglobinuria', 'PNH', 'G6PD deficiency', 'Autoimmune Hemolytic Anemia', 
        'AIHA', 'Acute Myeloid Leukemia', 'AML', 'Acute Promyelocytic Leukemia', 'APL', 
        'Acute Lymphoblastic Leukemia', 'ALL', 'Chronic Lymphocytic Leukemia', 'CLL', 
        'Chronic Myeloid Leukemia', 'CML', 'Polycythemia Vera', 'Essential Thrombocythemia', 
        'Hodgkin Lymphoma', 'Non-Hodgkin Lymphoma', 'Burkitt Lymphoma', 'Follicular Lymphoma', 
        'Mantle Cell Lymphoma', 'Marginal Zone Lymphoma', 'Multiple Myeloma', 'MGUS', 
        'Waldenström Macroglobulinemia', 'ITP', 'TTP', 'DIC', 'vWD', 'von Willebrand Disease', 
        'Hemophilia A', 'Hemophilia B', 'Hemophilia', 'Factor V Leiden', 'Myelofibrosis', 
        'Aplastic Anemia', 'MDS', 'Myelodysplastic Syndromes', 'Hairy Cell Leukemia', 
        'Bernard-Soulier', 'Glanzmann Thrombasthenia', 'HELLP Syndrome', 'HUS', 'Hemolytic Uremic Syndrome',
        'Schistocytes', 'Heinz bodies', 'Auer Rods', 'Philadelphia Chromosome', 'Reed-Sternberg', 
        'Bence-Jones proteins', 'Rouleaux formation', 'Aquagenic pruritus', 'Howell-Jolly bodies', 
        'Target cells', 'Bite cells', 'Smudge cells', 'Teardrop cells', 'Dacrocytes'
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
    count = parse_file('c:/Users/Hasan-PC/Desktop/MedHelp/scratch/hematology_raw.txt', 'c:/Users/Hasan-PC/Desktop/MedHelp/scratch/hematology_cards.json')
    print(f"Parsed {count} cards.")
