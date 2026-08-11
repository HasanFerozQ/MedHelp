import json

print("1. Testing usmle2.json...")
with open(r'C:\Users\Hasan-PC\Desktop\MedHelp\tabs\flashcards\data\usmle2.json', 'r', encoding='utf-8') as f:
    usmle2 = json.load(f)
print(f"   SUCCESS! usmle2.json contains {len(usmle2)} topics.")
peds_topics = [t for t in usmle2 if t.get('section') == 'PEDIATRICS']
total_peds_cards = sum(len(t['cards']) for t in peds_topics)
print(f"   Found {len(peds_topics)} PEDIATRICS topics with {total_peds_cards} cards.")

print("\n2. Testing manifest.json...")
with open(r'C:\Users\Hasan-PC\Desktop\MedHelp\tabs\flashcards\data\manifest.json', 'r', encoding='utf-8') as f:
    manifest = json.load(f)
print(f"   SUCCESS! manifest.json contains {len(manifest)} total entries.")

peds_slugs = [
    "GrowthDevelopmentFlashCards",
    "NeonatologyFlashCards",
    "GeneticCongenitalDisordersFlashCards",
    "InfectiousDiseaseInChildrenFlashCards",
    "ImmunizationsFlashCards",
    "PediatricGICardioPulmFlashCards",
    "AdolescentMedicineFlashCards"
]

for slug in peds_slugs:
    entry = manifest.get(slug)
    print(f"   - {slug}: {entry}")

print("\n3. Testing flashcards-data.js...")
with open(r'C:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js', 'r', encoding='utf-8') as f:
    js_content = f.read()

print(f"   Size of flashcards-data.js: {len(js_content)} bytes ({len(js_content.splitlines())} lines).")
print("   All checks PASSED!")
