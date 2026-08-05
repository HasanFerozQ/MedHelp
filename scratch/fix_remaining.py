"""
Fix remaining 3 contaminated answer strings that were missed by the first script
(headings were inside <b> tags or are compound phrases with 'Pearls').
Also check for Parkland Formula and other medical formulas to ensure correct format.
"""

import re

INPUT_FILE = r"C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js"

with open(INPUT_FILE, 'r', encoding='utf-8') as f:
    content = f.read()

original_len = len(content)
fixes = 0

# ── Fix 1: "Ostomies" inside a <b> tag ──────────────────────────────────────
old1 = '<b>Correct gastric position before use, typically with radiographic confirmation when indicated. Ostomies</b>'
new1 = '<b>Correct gastric position before use, typically with radiographic confirmation when indicated.</b>'
if old1 in content:
    content = content.replace(old1, new1, 1)
    fixes += 1
    print("FIX 1: Removed 'Ostomies' from inside <b> tag")
else:
    print("FIX 1: NOT FOUND (may already be fixed)")

# ── Fix 2: "Burn Complications" after </b> ──────────────────────────────────
old2 = 'delay wound healing.</b> Burn Complications"'
new2 = 'delay wound healing.</b>"'
if old2 in content:
    content = content.replace(old2, new2, 1)
    fixes += 1
    print("FIX 2: Removed 'Burn Complications' after </b>")
else:
    print("FIX 2: NOT FOUND (may already be fixed)")

# ── Fix 3: "Wound Healing Pearls" after </b> ────────────────────────────────
old3 = 'An enteric leak or bowel injury.</b> Wound Healing Pearls"'
new3 = 'An enteric leak or bowel injury.</b>"'
if old3 in content:
    content = content.replace(old3, new3, 1)
    fixes += 1
    print("FIX 3: Removed 'Wound Healing Pearls' after </b>")
else:
    print("FIX 3: NOT FOUND (may already be fixed)")

# ── FORMULA CHECK: Parkland Formula ─────────────────────────────────────────
print("\n── Formula Check ──────────────────────────────────────────────────────")

parkland_hits = [m.start() for m in re.finditer(r'Parkland', content, re.IGNORECASE)]
print(f"Parkland formula occurrences: {len(parkland_hits)}")
for pos in parkland_hits:
    snippet = content[pos:pos+200].replace('\n', ' ')
    print(f"  → {snippet[:180]}")

# Check the Parkland formula card specifically for correct format
# It should be: 4 mL × body weight (kg) × %TBSA burned
parkland_correct = r'4 mL'
if re.search(parkland_correct, content[35000*4:]):  # roughly in surgery section
    print("  ✓ Parkland formula contains '4 mL' - looks correct")
else:
    print("  ✗ Parkland formula may be missing the '4 mL' value")

# Check for other key formulas in Surgery section
formulas_to_check = [
    ("Parkland", r'4[\s]*mL[\s]*[×x\*][\s]*body weight'),
    ("TBSA",     r'TBSA|total body surface area'),
    ("GFR",      r'GFR|glomerular filtration'),
    ("CrCl",     r'CrCl|creatinine clearance'),
    ("MAP",      r'MAP|mean arterial pressure'),
    ("Fick",     r'Fick|cardiac output'),
]

surgery_pos = content.find('"section": "Surgery"')
surgery_content = content[surgery_pos:]

print("\n── Formula Presence in Surgery Section ───────────────────────────────")
for name, pattern in formulas_to_check:
    matches = re.findall(pattern, surgery_content, re.IGNORECASE)
    print(f"  {name}: {len(matches)} occurrence(s)")

print(f"\nTotal additional fixes applied: {fixes}")

if fixes > 0:
    with open(INPUT_FILE, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"File written successfully ({len(content):,} bytes)")
else:
    print("No changes needed - file unchanged.")
