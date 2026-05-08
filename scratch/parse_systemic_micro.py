import json
import re

def format_text(text):
    # Chemical formulas
    text = re.sub(r'H2S', 'H<sub>2</sub>S', text)
    text = re.sub(r'O2', 'O<sub>2</sub>', text)
    text = re.sub(r'H2O', 'H<sub>2</sub>O', text)
    
    # Symbols
    text = re.sub(r'TNF-alpha', 'TNF-&alpha;', text)
    text = re.sub(r'IFN-gamma', 'IFN-&gamma;', text)
    text = re.sub(r'(\d+)\s?degrees', r'\1&deg;', text)
    text = re.sub(r'(\d+)\s?°', r'\1&deg;', text)
    
    # Comparisons
    text = re.sub(r'<', '&lt;', text)
    text = re.sub(r'>', '&gt;', text)
    
    # Italics for common genera and species
    genera = [
        'Staphylococcus', 'Streptococcus', 'Bacillus', 'Listeria', 'Actinomyces', 
        'Nocardia', 'Neisseria', 'Haemophilus', 'Francisella', 'Escherichia', 
        'Salmonella', 'Campylobacter', 'Klebsiella', 'Vibrio', 'Pseudomonas', 
        'Helicobacter', 'Borrelia', 'Treponema', 'Coxiella', 'Mycobacterium', 
        'Mycoplasma', 'Malassezia', 'Histoplasma', 'Paracoccidioidomycosis', 
        'Aspergillus', 'Mucor', 'Rhizopus', 'Cryptococcus', 'Parvovirus', 
        'Babesia', 'Giardia', 'Enterobius', 'Schistosoma', 'Yersinia', 
        'Bordetella', 'Brucella', 'Chlamydia', 'Bartonella', 'Rickettsia', 
        'Ehrlichia', 'Strongyloides', 'Entamoeba', 'Trypanosoma', 'Clonorchis', 
        'Taenia', 'Echinococcus', 'Ascaris', 'Ancylostoma', 'Necator', 
        'Eikenella', 'Gardnerella', 'Serratia', 'Burkholderia', 'Variola', 'Varicella'
    ]
    
    for g in genera:
        # Match genus and potentially species
        text = re.sub(rf'\b({g}\s[a-z]+)\b', r'<i>\1</i>', text)
        text = re.sub(rf'\b({g})\b(?!\s[a-z])', r'<i>\1</i>', text)

    # Specific common species/shorthand
    text = re.sub(r'\bS\. aureus\b', '<i>S. aureus</i>', text)
    text = re.sub(r'\bS\. pyogenes\b', '<i>S. pyogenes</i>', text)
    text = re.sub(r'\bS\. pneumoniae\b', '<i>S. pneumoniae</i>', text)
    text = re.sub(r'\bS\. agalactiae\b', '<i>S. agalactiae</i>', text)
    text = re.sub(r'\bE\. coli\b', '<i>E. coli</i>', text)
    text = re.sub(r'\bN\. gonorrhoeae\b', '<i>N. gonorrhoeae</i>', text)
    text = re.sub(r'\bN\. meningitidis\b', '<i>N. meningitidis</i>', text)
    text = re.sub(r'\bH\. influenzae\b', '<i>H. influenzae</i>', text)
    text = re.sub(r'\bH\. pylori\b', '<i>H. pylori</i>', text)
    text = re.sub(r'\bC\. jejuni\b', '<i>C. jejuni</i>', text)
    text = re.sub(r'\bC\. burnetii\b', '<i>C. burnetii</i>', text)
    text = re.sub(r'\bC\. albicans\b', '<i>C. albicans</i>', text)
    text = re.sub(r'\bC\. perfringens\b', '<i>C. perfringens</i>', text)
    text = re.sub(r'\bC\. diphtheriae\b', '<i>C. diphtheriae</i>', text)
    text = re.sub(r'\bB\. anthracis\b', '<i>B. anthracis</i>', text)
    text = re.sub(r'\bB\. pertussis\b', '<i>B. pertussis</i>', text)
    text = re.sub(r'\bB\. burgdorferi\b', '<i>B. burgdorferi</i>', text)
    
    # Bold key terms
    keywords = [
        'Protein A', 'M protein', 'JONES criteria', 'Catalase test', 'Optochin sensitivity',
        'Thayer-Martin', 'Waterhouse-Friderichsen', 'Medusa head', 'SNARE proteins',
        'EF-2', 'ADP-ribosylation', 'currant jelly', 'Exotoxin A', 'Ixodes tick',
        'Ziehl-Neelsen', 'Lowenstein-Jensen', 'Cold agglutinin', 'Maltese cross',
        'Negri bodies', 'Councilman bodies', 'Guarnieri bodies', 'Tzanck smear',
        'India Ink', 'Elek test', 'Nagler Reaction', 'Quellung Reaction', 'Weil-Felix',
        'Steeple sign', 'Thumbprint sign', 'Clue cells', 'Whiff test', 'Rose gardener\'s',
        'Floppy Baby Syndrome', 'Swimmer’s Ear', 'Ecthyma gangrenosum', 'Staghorn calculus',
        'Red Man Syndrome'
    ]
    
    for k in keywords:
        text = re.sub(rf'\b({k})\b', r'<b>\1</b>', text, flags=re.IGNORECASE)

    return text

def parse_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    cards = []
    # Match Front: ... Back: ...
    matches = re.findall(r'Front:\s*(.*?)\s*Back:\s*(.*?)(?=Front:|$)', content, re.DOTALL)
    
    for front, back in matches:
        cards.append({
            "q": format_text(front.strip()),
            "a": format_text(back.strip())
        })
    
    return cards

if __name__ == "__main__":
    data = parse_file('c:/Users/Hasan-PC/Desktop/MedHelp/scratch/systemic_micro_raw.txt')
    with open('c:/Users/Hasan-PC/Desktop/MedHelp/scratch/systemic_micro_cards.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2)
    print(f"Parsed {len(data)} cards.")
