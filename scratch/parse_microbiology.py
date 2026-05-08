import json
import re

def format_text(text):
    # Greek Symbols
    text = re.sub(r'TNF-\\alpha', 'TNF-&alpha;', text)
    text = re.sub(r'IFN-\\gamma', 'IFN-&gamma;', text)
    text = re.sub(r'\\beta-glucan', '&beta;-glucan', text)
    text = re.sub(r'\\alpha', '&alpha;', text)
    text = re.sub(r'\\beta', '&beta;', text)
    text = re.sub(r'\\gamma', '&gamma;', text)
    
    # Subscripts and Superscripts
    text = re.sub(r'H2O\b', 'H<sub>2</sub>O', text)
    text = re.sub(r'O2\b', 'O<sub>2</sub>', text)
    text = re.sub(r'CO2\b', 'CO<sub>2</sub>', text)
    text = re.sub(r'K\+', 'K<sup>+</sup>', text)
    text = re.sub(r'Mg2\+', 'Mg<sup>2+</sup>', text)
    text = re.sub(r'Cl-', 'Cl<sup>-</sup>', text)
    text = re.sub(r'H\+', 'H<sup>+</sup>', text)
    
    # Degrees and angles (Handle LaTeX \circ)
    text = re.sub(r'(\d+)\^\\circ\s*C', r'\1&deg;C', text)
    text = re.sub(r'(\d+)\^\\text\{C\}', r'\1&deg;C', text)
    text = re.sub(r'(\d+)\^C', r'\1&deg;C', text)
    text = re.sub(r'(\d+)\^\\circ', r'\1&deg;', text)
    text = re.sub(r'(\d+)\^', r'\1&deg;', text)
    
    # Species names (Italics) - common microbiology ones
    species = [
        "Bacillus anthracis", "Legionella", "Chlamydia", "Rickettsia", "Treponema pallidum",
        "N. gonorrhoeae", "C. diphtheriae", "H. influenzae", "S. aureus", "Clostridium",
        "Listeria monocytogenes", "S. pyogenes", "S. sanguinis", "S. pneumoniae",
        "C. difficile", "Actinomyces israelii", "Nocardia", "Actinomyces", "Escherichia coli",
        "Klebsiella pneumoniae", "Proteus mirabilis", "Salmonella typhi", "Vibrio vulnificus",
        "Poxvirus", "Influenza", "Retroviruses", "Histoplasmosis", "Aspergillus fumigatus",
        "Pneumocystis jirovecii", "Giardia lamblia", "Entamoeba histolytica", "Trypanosoma cruzi",
        "Enterobius vermicularis", "Taenia solium", "Campylobacter jejuni", "Mycoplasma pneumoniae",
        "Neisseria meningitidis", "Vibrio cholerae", "Trichomonas vaginalis", "Babesia microti",
        "Parvovirus B19", "Haemophilus influenzae", "S. agalactiae", "Pseudomonas",
        "Coxsackievirus A", "Schistosoma haematobium", "Borrelia burgdorferi", "Leptospira interrogans",
        "Enterococcus", "Bartonella henselae", "Vibrio", "S. epidermidis", "S. saprophyticus",
        "Gardnerella vaginalis", "Salmonella", "Francisella tularensis", "Cryptococcus neoformans",
        "Francisella", "Brucella", "Pasteurella", "Bacteroides", "Fusobacterium", "Ixodes",
        "Dermacentor", "Pasteurella multocida", "Coxiella burnetii", "Leishmania", "Clonorchis sinensis",
        "Diphyllobothrium latum", "Schistosoma mansoni", "Schistosoma japonicum", "Sarcoptes scabiei",
        "Strongyloides stercoralis", "Coccidioides immitis", "Paracoccidiodes brasiliensis",
        "Mucor", "Rhizopus", "Pseudomonas aeruginosa", "S. bovis", "S. gallolyticus",
        "Fusobacterium necrophorum", "Bacillus cereus", "Yersinia enterocolitica", "Clostridium botulinum",
        "S. agalactiae", "Malassezia furfur", "Tinea versicolor", "Blastomyces dermatitidis",
        "Sporothrix schenckii", "Trichinella spiralis"
    ]
    for sp in species:
        if f"<i>{sp}</i>" not in text:
            text = re.sub(rf'\b({sp})\b', r'<i>\1</i>', text)

    # Bold key terms
    terms_to_bold = [
        "Teichoic acid", "Lipid A", "LPS", "Polypeptide capsule", "Thayer-Martin", "VPN",
        "Löffler", "Tellurite", "Protein A", "Diphtheria toxin", "Cholera toxin", "Shiga toxin",
        "Tetanospasmin", "Botulinum toxin", "JONES criteria", "Optochin", "sulfur granules",
        "SNAP", "PPD", "IGRA", "UTIs", "Antigenic Shift", "Antigenic Drift", "Tzanck prep",
        "Mononucleosis", "HPV", "Negri bodies", "Koplik spots", "Amphotericin B", "steatorrhea",
        "Chagas", "Beta-lactams", "Vancomycin", "Aminoglycosides", "Macrolides", "Fluoroquinolones",
        "Chloramphenicol", "MRSA", "MHC", "MAC", "Guillain-Barré", "Waterhouse-Friderichsen",
        "Rice-water", "Maltese cross", "Slapped cheek", "Ecthyma gangrenosum", "HUS", "Indole",
        "Urease", "Medusa head", "Weil Disease", "Cold Agglutinins", "Biliary Tract Disease",
        "Elephantiasis", "Red Man Syndrome", "Grey Baby Syndrome", "Hutchinson teeth",
        "Saber shins", "Double zone of hemolysis", "Quellung Reaction", "Nagler Reaction",
        "Weil-Felix Reaction"
    ]
    for term in terms_to_bold:
        if f"<b>{term}" not in text:
            text = re.sub(rf'\b({term})\b', r'<b>\1</b>', text, flags=re.IGNORECASE)

    # Remove remaining $ signs and \text{}
    text = text.replace('$', '').replace('\\text{', '').replace('}', '')
    
    return text

def parse_microbiology(file_path):
    cards = []
    current_q = None
    
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        
    for line in lines:
        line = line.strip()
        if not line or line.startswith("Section"): continue
        
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

path = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\micro_raw.txt"
cards = parse_microbiology(path)

output_json = json.dumps(cards, indent=2)
with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\gen_micro_cards.json", "w", encoding='utf-8') as f:
    f.write(output_json)

print(f"Successfully parsed {len(cards)} cards.")
