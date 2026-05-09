import json
import re

def format_text(text):
    # Handle LaTeX-style Greek letters
    greek_letters = {
        r'\$\\kappa\$': '&kappa;',
        r'\$\\alpha\$': '&alpha;',
        r'\$\\beta\$': '&beta;',
        r'\$\\beta_2\$': '&beta;<sub>2</sub>',
        r'\$\\gamma\$': '&gamma;',
        r'\$\\epsilon\$': '&epsilon;',
        r'\$\\zeta\$': '&zeta;',
        r'\$\\Delta\$': '&Delta;',
        r'\\alpha_4\\beta_7': '&alpha;<sub>4</sub>&beta;<sub>7</sub>',
        r'\\alpha_4': '&alpha;<sub>4</sub>',
        r'\\alpha': '&alpha;',
        r'\\beta': '&beta;',
        r'\\gamma': '&gamma;',
        r'\\epsilon': '&epsilon;',
        r'\\zeta': '&zeta;',
        r'\\Delta': '&Delta;',
        r'\\kappa': '&kappa;'
    }
    
    for pattern, replacement in greek_letters.items():
        text = re.sub(pattern, replacement, text)

    # Handle remaining LaTeX-style subscripts and superscripts
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
    
    # Remove remaining $ signs
    text = text.replace('$', '')
    
    # Bold key terms (heuristic: first word or two if followed by colon)
    if ':' in text and not re.search(r'<(sup|sub|b)>', text):
        parts = text.split(':', 1)
        if len(parts[0].split()) <= 4:
            text = f"<b>{parts[0].strip()}:</b> {parts[1].strip()}"
    
    # Common medical terms to bold
    terms_to_bold = [
        "Bone marrow", "Thymus", "Dendritic cells", "Neutrophil Extracellular Traps",
        "Membrane Attack Complex", "Decay-Accelerating Factor", "Paroxysmal Nocturnal Hemoglobinuria",
        "Hereditary Angioedema", "MHC Class I", "MHC Class II", "Invariant Chain", "Ankylosing Spondylitis",
        "Multiple Sclerosis", "Celiac Disease", "Autoimmune Polyendocrine Syndrome Type 1", "Regulatory T-cells",
        "VDJ recombination", "Activation-induced Cytidine Deaminase", "Type I Hypersensitivity",
        "Type II Hypersensitivity", "Type III Hypersensitivity", "Type IV Hypersensitivity",
        "Graves disease", "Myasthenia Gravis", "SLE", "Polyarteritis nodosa", "Poststreptococcal glomerulonephritis",
        "Contact dermatitis", "Graft-versus-host disease", "X-linked Agammaglobulinemia",
        "Selective IgA deficiency", "Common Variable Immunodeficiency", "DiGeorge Syndrome",
        "Severe Combined Immunodeficiency", "Wiskott-Aldrich Syndrome", "Hyper-IgM Syndrome",
        "Chronic Granulomatous Disease", "Leukocyte Adhesion Deficiency", "Chédiak-Higashi Syndrome",
        "Graft-versus-Host Disease", "Rheumatoid Arthritis", "Scleroderma", "CREST Syndrome",
        "Sjögren Syndrome", "Mixed Connective Tissue Disease", "Wegener", "Microscopic Polyangiitis",
        "Hashimoto Thyroiditis", "Primary Biliary Cholangitis", "Autoimmune Hepatitis", "Cyclosporine",
        "Tacrolimus", "Sirolimus", "Azathioprine", "Mycophenolate Mofetil", "Infliximab", "Rituximab",
        "Abatacept", "Natalizumab", "Ustekinumab", "Denosumab", "Passive Immunity", "Serum sickness",
        "Arthus reaction", "Direct Coombs Test", "Indirect Coombs Test", "ELISA", "Flow Cytometry",
        "Western Blot", "Ataxia-Telangiectasia", "Job Syndrome", "Goodpasture Syndrome", "Pemphigus Vulgaris",
        "Bullous Pemphigoid", "Omalizumab", "Palivizumab", "Eculizumab", "Abciximab", "Vedolizumab",
        "Clonal Ignorance", "Molecular Mimicry", "Plasmacytoid Dendritic Cells", "Natural Killer",
        "Bare Lymphocyte Syndrome", "Prozone Effect", "Direct Pathway", "Indirect Pathway", "Kupffer cells",
        "Microglia", "Alveolar macrophages", "Properdin", "Langerhans cells"
    ]
    for term in terms_to_bold:
        if f"<b>{term}" not in text:
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

path = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\immunology_raw.txt"
cards = parse_flashcards(path)

output_json = json.dumps(cards, indent=2)
with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\immunology_cards.json", "w", encoding='utf-8') as f:
    f.write(output_json)

print(f"Successfully parsed {len(cards)} cards.")
