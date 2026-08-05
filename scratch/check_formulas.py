"""
Check formula correctness in the Surgery section of flashcards-data.js.
"""
import re, sys

sys.stdout.reconfigure(encoding='utf-8')

INPUT_FILE = r"C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js"

with open(INPUT_FILE, 'r', encoding='utf-8') as f:
    content = f.read()

# Find the Surgery section
surgery_pos = content.find('"section": "Surgery"')
if surgery_pos == -1:
    print("ERROR: Surgery section not found!")
    sys.exit(1)

surgery_content = content[surgery_pos:]
print(f"Surgery section found at char {surgery_pos}")
print(f"Surgery section size: {len(surgery_content):,} chars\n")

# ---- 1. Check for remaining contaminated headings ----
print("=== Remaining heading contamination check ===")
HEADINGS = [
    "Nasogastric Tubes", "Ostomies", "Enterocutaneous Fistulas",
    "Anastomotic Leak", "Enhanced Recovery", "Surgical Site Infection",
    "Postoperative Fever", "Perioperative Anticoagulation",
    "High-Yield Review", "Bowel Obstruction", "Appendicitis",
    "Cholecystitis", "Cholangitis", "Mesenteric Ischemia",
    "Vascular Surgery", "Thoracic Surgery", "Pediatric Surgery",
    "Surgical ICU", "Postoperative Complications", "Surgical Principles",
    "Gastrointestinal Surgery", "Endocrine Surgery", "Breast Surgery",
    "Wound Healing Pearls", "Burn Complications", "Surgical Drains",
    "Wound Dehiscence", "Shock States", "Postoperative Delirium",
    "Postoperative Ileus", "Postoperative Bleeding",
]

# Look for headings appearing right before the closing quote of an answer
contaminated = []
for h in HEADINGS:
    pattern = re.compile(r'"a":\s*"(?:[^"\\]|\\.)*?' + re.escape(h) + r'\s*"', re.DOTALL)
    hits = pattern.findall(surgery_content)
    if hits:
        contaminated.append((h, len(hits)))

if contaminated:
    print(f"STILL CONTAMINATED ({len(contaminated)} types):")
    for h, n in contaminated:
        print(f"  - '{h}' found {n} time(s)")
else:
    print("  All clear - no more contaminated headings found in answer strings!")

# ---- 2. Check key formulas ----
print("\n=== Formula integrity check ===")

checks = [
    ("Parkland formula (4 mL x kg x TBSA)",
     r"4\s*mL\s*[x*x]\s*body weight|4\s*mL.*?kg.*?TBSA|Parkland.*?4"),
    ("TBSA mentioned",
     r"TBSA|total body surface area"),
    ("Fluid resuscitation formula",
     r"4\s*mL|Parkland"),
    ("GCS score",
     r"GCS|Glasgow"),
    ("APACHE score",
     r"APACHE"),
    ("Ranson criteria",
     r"Ranson"),
    ("Charcot triad",
     r"Charcot|triad"),
    ("Reynolds pentad",
     r"Reynolds|pentad"),
    ("Alvarado score",
     r"Alvarado"),
    ("Child-Pugh",
     r"Child.Pugh"),
]

for label, pattern in checks:
    hits = re.findall(pattern, surgery_content, re.IGNORECASE)
    status = "OK" if hits else "NOT FOUND"
    print(f"  [{status}] {label}: {len(hits)} match(es)")

# ---- 3. Spot-check Parkland formula card ----
print("\n=== Parkland formula card content ===")
parkland_hits = list(re.finditer(r'Parkland', surgery_content, re.IGNORECASE))
for m in parkland_hits[:5]:
    start = max(0, m.start()-20)
    end = min(len(surgery_content), m.end()+300)
    snippet = surgery_content[start:end].replace('\r','').replace('\n',' ')
    print(f"  ...{snippet}...")
    print()

# ---- 4. Check the formula syntax (4 mL x kg x TBSA) ----
print("=== Parkland formula exact text ===")
parkland_card = re.search(
    r'"q":\s*"[^"]*Parkland[^"]*".*?"a":\s*"([^"]+)"',
    surgery_content, re.DOTALL | re.IGNORECASE
)
if parkland_card:
    print(f"  Answer: {parkland_card.group(1)[:300]}")
else:
    print("  Could not find Parkland formula Q&A card")

print("\nDone.")
