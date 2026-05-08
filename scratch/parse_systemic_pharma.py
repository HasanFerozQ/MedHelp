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
    text = text.replace(r'\tau', '&tau;')
    text = text.replace(r'\ge', '&ge;')
    text = text.replace(r'\pm', '&plusmn;')
    
    # Complex Ion/Formula patterns (matching $...$)
    # Na+/K+-ATPase
    text = text.replace(r'$Na^+/K^+-ATPase$', 'Na<sup>+</sup>/K<sup>+</sup>-ATPase')
    text = text.replace(r'$H^+/K^+-ATPase$', 'H<sup>+</sup>/K<sup>+</sup>-ATPase')
    text = text.replace(r'$Na^+/Cl^-$', 'Na<sup>+</sup>/Cl<sup>-</sup>')
    
    # Generic Ions/Formulas in $...$
    def latex_replacer(match):
        inner = match.group(1)
        # Handle ^+ or ^- or ^{2+}
        inner = re.sub(r'\^\{([^}]+)\}', r'<sup>\1</sup>', inner)
        inner = re.sub(r'\^(\+|-)', r'<sup>\1</sup>', inner)
        # Handle _3 or _{m} or _p
        inner = re.sub(r'_\{([^}]+)\}', r'<sub>\1</sub>', inner)
        inner = re.sub(r'_([a-zA-Z0-9])', r'<sub>\1</sub>', inner)
        return inner

    text = re.sub(r'\$([^$]+)\$', latex_replacer, text)
    
    # Bolding high-yield terms
    keywords = [
        'Acetylcholine', 'Botulinum toxin', 'Dopamine', 'Atropine', 'Pheochromocytoma', 
        'Digoxin', 'Adenosine', 'ACE inhibitors', 'Bradykinin', 'Aliskiren', 
        'Loop Diuretics', 'Spironolactone', 'Hydralazine', 'Methyldopa', 'Labetalol', 
        'Nifedipine', 'Niacin', 'Statins', 'Amiodarone', 'Thiazide diuretics', 
        'Acetazolamide', 'Benzodiazepines', 'Barbiturates', 'Flumazenil', 'Memantine', 
        'Dantrolene', 'Sumatriptan', 'Haloperidol', 'Fluoxetine', 'NMS', 'Carbidopa', 
        'Levodopa', 'Vancomycin', 'Gentamicin', 'Ciprofloxacin', 'Chloramphenicol', 
        'MRSA', 'Amphotericin B', 'Omeprazole', 'Cimetidine', 'Misoprostol', 
        'Metformin', 'Sulfonylurea', 'PTU', 'Methimazole', 'Desmopressin', 'Levothyroxine', 
        'Albuterol', 'Fluticasone', 'Montelukast', 'Ipratropium', 'Heparin', 'Warfarin', 
        'Methotrexate', 'Doxorubicin', 'Cyclophosphamide', 'Aspirin', 'Celecoxib', 
        'Colchicine', 'Allopurinol', 'Sildenafil', 'Teriparatide', 'Pyridostigmine', 
        'Clopidogrel', 'Nitroprusside', 'Vincristine', 'Paclitaxel', 'Cyclosporine', 
        'Tacrolimus', 'Sirolimus', 'Valproic acid', 'Phenytoin', 'Ethosuximide', 
        'Lidocaine', 'Methylphenidate', 'Bupropion', 'Varenicline', 'Lithium', 
        'Metronidazole', 'Zidovudine', 'Acyclovir', 'Ganciclovir', 'Isoniazid', 
        'Sulfonamides', 'TMP-SMX', 'Ezetimibe', 'Bisphosphonates', 'Acetone', 
        'Carbon Monoxide', 'Fomepizole', 'HIT', 'Abciximab', 'Dabigatran', 
        'Flutamide', 'Finasteride', 'Clomiphene', 'Anastrozole', 'Mifepristone', 
        'Tamsulosin', 'Ketamine', 'Propofol', 'Mycophenolate Mofetil', 'Adalimumab', 
        'Etanercept', 'Thalidomide', 'Leflunomide', 'Colistin', 'Daptomycin', 
        'Azithromycin', 'Griseofulvin', 'Permethrin', 'Albendazole', 'Guaifenesin', 
        'Dextromethorphan', 'Bosentan', 'Omalizumab', 'EDTA', 'Dimercaprol', 
        'Succimer', 'Penicillamine', 'Sugammadex', 'Glucagon', 'Zero-order', 'First-order',
        'Imatinib', 'Trastuzumab', 'Rituximab', 'Tamoxifen', '5-Fluorouracil', 'Etoposide',
        'Pembrolizumab', 'Nivolumab', 'Linezolid', 'Nitrofurantoin', 'SJS', 'Ebstein Anomaly',
        'Raynaud', 'Ivabradine', 'Milrinone', 'Octreotide', 'Isotretinoin', 'Latanoprost',
        'Timolol', 'Oxytocin', 'Indomethacin', 'Alprostadil', 'Metyrapone', 'Kallmann Syndrome'
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
    count = parse_file('c:/Users/Hasan-PC/Desktop/MedHelp/scratch/systemic_pharma_raw.txt', 'c:/Users/Hasan-PC/Desktop/MedHelp/scratch/systemic_pharma_cards.json')
    print(f"Parsed {count} cards.")
