"""
Fix contaminated answer strings in the Surgery section of flashcards-data.js.
Section sub-headings from the source .txt file were incorrectly appended to
the end of answer strings. This script strips them cleanly.
"""

import re

INPUT_FILE = r"C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js"
OUTPUT_FILE = r"C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js"
BACKUP_FILE = r"C:\Users\Hasan-PC\Desktop\MedHelp\scratch\flashcards-data.js.bak_surgery_fix"

# These are the section/sub-section headings that leaked into answer text.
# They appear at the END of an answer string (before the closing quote).
# We match them as standalone words/phrases that shouldn't be in an answer.
LEAKED_HEADINGS = [
    # From source file structure headings
    r"Nasogastric Tubes",
    r"Ostomies",
    r"Enterocutaneous Fistulas",
    r"Anastomotic Leak",
    r"Enhanced Recovery After Surgery \(ERAS\)",
    r"Enhanced Recovery After Surgery",
    r"Surgical Site Infection \(SSI\)",
    r"Surgical Site Infection",
    r"Postoperative Fever",
    r"Perioperative Anticoagulation",
    r"Postoperative Urinary Retention",
    r"High-Yield Review",
    r"Bowel Obstruction",
    r"Appendicitis",
    r"Cholecystitis",
    r"Cholangitis",
    r"Mesenteric Ischemia",
    r"Abdominal Aortic Aneurysm",
    r"Testicular Emergencies",
    r"Vascular Surgery",
    r"Urology",
    r"Thoracic Surgery",
    r"Pediatric Surgery",
    r"Surgical ICU",
    r"Postoperative Complications",
    r"Surgical Principles",
    r"Gastrointestinal Surgery",
    r"Endocrine Surgery",
    r"Breast Surgery",
    r"Breast",
    r"Acute Abdomen",
    r"Trauma",
    r"Burns",
    r"ICU",
    r"Surgical Drains",
    r"Wound Healing",
    r"Factors Affecting Wound Healing",
    r"Wound Dehiscence",
    r"Wound Contraction",
    r"Hypertrophic Scars and Keloids",
    r"Hypertrophic Scars",
    r"Malignant Hyperthermia",
    r"Postoperative Respiratory Failure",
    r"Postoperative Ileus",
    r"Postoperative Delirium",
    r"Postoperative Electrolyte Disorders",
    r"Postoperative AKI",
    r"Postoperative Urinary Retention",
    r"Anesthetic Agents",
    r"Postoperative Bleeding",
    r"Shock States",
    r"Emphysematous Cholecystitis",
    r"Ascending Cholangitis",
    r"Biliary Colic",
    r"Acalculous Cholecystitis",
    r"Gallstone Pancreatitis",
    r"Gallstones and Biliary Disease",
    r"Pancreatitis",
    r"Hernias",
    r"Thyroid",
    r"Ileus",
    r"Thyroid Surgery",
    r"Adrenal",
    r"Adrenal Surgery",
    r"Colorectal Surgery",
    r"Colorectal Cancer",
    r"Colorectal",
    r"Diverticular Disease",
    r"Inflammatory Bowel Disease",
    r"Ischemic Colitis",
    r"Lower GI Bleeding",
    r"Upper GI Bleeding",
    r"GI Bleeding",
    r"Esophageal Surgery",
    r"Esophagus",
    r"Stomach",
    r"Small Bowel",
    r"Small Intestine",
    r"Colon",
    r"Rectum",
    r"Anus",
    r"Liver",
    r"Liver Surgery",
    r"Hepatic Surgery",
    r"Spleen",
    r"Splenectomy",
    r"Pancreas",
    r"Pancreatic Surgery",
    r"Retroperitoneum",
    r"Soft Tissue",
    r"Skin and Soft Tissue",
    r"Melanoma",
    r"Sarcoma",
    r"Peripheral Vascular Disease",
    r"Carotid Disease",
    r"Carotid Artery Disease",
    r"Deep Vein Thrombosis",
    r"Pulmonary Embolism",
    r"Aortic Disease",
    r"Venous Disease",
    r"Lymphatics",
    r"Renal Surgery",
    r"Urologic Oncology",
    r"Bladder",
    r"Prostate",
    r"Kidney",
    r"Testicular",
    r"Lung Surgery",
    r"Lung Cancer",
    r"Pleural Disease",
    r"Mediastinum",
    r"Pericardium",
    r"Cardiac Surgery",
    r"Minimally Invasive Surgery",
    r"Robotic Surgery",
    r"Laparoscopic Surgery",
    r"Surgical Nutrition",
    r"Nutrition",
    r"Fluid and Electrolytes",
    r"Shock",
    r"Sepsis",
    r"Septic Shock",
    r"Hemorrhagic Shock",
    r"Cardiogenic Shock",
    r"Distributive Shock",
    r"Obstructive Shock",
    r"Transfusion",
    r"Blood Products",
    r"Coagulation",
    r"Critical Care",
    r"Mechanical Ventilation",
    r"Airway Management",
    r"Intraoperative Mechanics",
    r"Post-Anesthesia Care",
    r"Pain Management",
    r"Analgesia",
    r"Regional Anesthesia",
    r"Neuraxial Anesthesia",
    r"General Anesthesia",
    r"Preoperative Assessment",
    r"Perioperative Management",
    r"Wound Classification",
    r"Wound Care",
    r"Surgical Drains and Tubes",
    r"Drains and Tubes",
    r"Ostomy Care",
    r"Stoma Care",
    r"Skin Grafts",
    r"Flaps",
    r"Reconstructive Surgery",
    r"Plastic Surgery",
    r"Hand Surgery",
    r"Orthopedic Surgery",
    r"Neurosurgery",
    r"Transplant Surgery",
    r"Organ Transplantation",
    r"Immunosuppression",
]

def make_pattern():
    """Build a regex that matches any leaked heading at the end of an answer string."""
    # Sort by length descending so longer matches are tried first
    sorted_headings = sorted(LEAKED_HEADINGS, key=len, reverse=True)
    # Build alternation group
    alt = "|".join(sorted_headings)
    # Match: optional whitespace/newline + one of the headings + optional whitespace
    # at the end just before the closing "
    pattern = r'(?i)([\s\r\n]+(?:' + alt + r')[\s\r\n]*)'
    return pattern

def fix_line(line, pattern):
    """
    For a line containing an answer field ending with a leaked heading,
    strip the heading from the end of the answer value (before the closing quote).
    
    Lines look like:
        "a": "<b>Some answer.</b> Leaked Heading Name"
    or:
        "a": "<b>Some answer.</b>"
    """
    # Match answer lines: "a": "...LEAKED_HEADING"
    # We look for the pattern appearing right before the end of the string value
    # Pattern: content inside quotes ending with a leaked heading
    answer_re = re.compile(r'("a":\s*")(.*?)(' + make_stripped_pattern() + r')(")', re.DOTALL)
    
    def replacer(m):
        prefix = m.group(1)
        answer_body = m.group(2)
        leaked = m.group(3)
        closing_quote = m.group(4)
        # Strip trailing whitespace from the answer body
        answer_body = answer_body.rstrip()
        return prefix + answer_body + closing_quote
    
    new_line, count = re.subn(answer_re, replacer, line)
    return new_line, count

def make_stripped_pattern():
    """Pattern for the leaked portion: space(s) + heading text at end of value."""
    sorted_headings = sorted(LEAKED_HEADINGS, key=len, reverse=True)
    alt = "|".join(sorted_headings)
    # Match whitespace + heading at end of the answer value
    return r'[\s]+(?:' + alt + r')[\s]*'

def process_file():
    print(f"Reading {INPUT_FILE}...")
    with open(INPUT_FILE, 'r', encoding='utf-8') as f:
        content = f.read()

    # Back up
    print(f"Backing up to {BACKUP_FILE}...")
    with open(BACKUP_FILE, 'w', encoding='utf-8') as f:
        f.write(content)

    # We only process from the Surgery section onwards (line ~35295)
    # Find the Surgery section marker
    surgery_marker = '"section": "Surgery"'
    surgery_idx = content.find(surgery_marker)
    if surgery_idx == -1:
        print("ERROR: Could not find Surgery section!")
        return
    
    print(f"Found Surgery section at character position {surgery_idx}")

    # Split content into before and after surgery section
    before = content[:surgery_idx]
    surgery_part = content[surgery_idx:]

    # Build the regex pattern to find contaminated answer lines
    # These are answer strings ending with a section heading before the closing quote
    sorted_headings = sorted(LEAKED_HEADINGS, key=len, reverse=True)
    alt = "|".join(sorted_headings)
    
    # Pattern: answer value containing a leaked heading at the end
    # "a": "...ANSWER TEXT  LEAKED HEADING"
    # The leaked heading appears after real answer content, separated by whitespace
    leaked_pattern = re.compile(
        r'("a":\s*")((?:[^"\\]|\\.)*)(\s+(?:' + alt + r')\s*)(")',
        re.DOTALL | re.IGNORECASE
    )
    
    total_fixes = 0
    
    def replacer(m):
        nonlocal total_fixes
        prefix = m.group(1)
        answer_body = m.group(2).rstrip()
        closing_quote = m.group(4)
        total_fixes += 1
        print(f"  FIX #{total_fixes}: Stripped trailing: '{m.group(3).strip()[:60]}'")
        return prefix + answer_body + closing_quote
    
    fixed_surgery = re.sub(leaked_pattern, replacer, surgery_part)
    
    final_content = before + fixed_surgery
    
    print(f"\nTotal fixes applied: {total_fixes}")
    print(f"Writing fixed file to {OUTPUT_FILE}...")
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        f.write(final_content)
    
    print("Done!")

if __name__ == '__main__':
    process_file()
