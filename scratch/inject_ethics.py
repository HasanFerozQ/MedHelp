"""
Inject Ethics, Law & Health Systems flashcards into flash-cards.html
"""
import re, sys
sys.stdout.reconfigure(encoding='utf-8')

# Read all 6 card files
card_files = {
    'cards_ethics_principles': ('Medical ethics — autonomy, beneficence, justice', 'scale'),
    'cards_ethics_consent': ('Informed consent & capacity assessment', 'file-check'),
    'cards_ethics_eol': ('End-of-life care & advance directives', 'heart-handshake'),
    'cards_ethics_systems': ('Healthcare systems — Medicare, Medicaid, insurance', 'landmark'),
    'cards_ethics_safety': ('Patient safety & quality improvement', 'shield-check'),
    'cards_ethics_prevention': ('Public health & preventive medicine', 'activity'),
}

all_cards_blocks = []
for fname, (topic_name, icon) in card_files.items():
    path = f'scratch/{fname}.js'
    with open(path, 'r', encoding='utf-8') as f:
        raw = f.read()
    
    # Extract just the array contents (between [ and ];)
    start = raw.index('[')
    end = raw.rindex('];')
    array_body = raw[start+1:end].strip()
    
    # Count cards
    count = len(re.findall(r'\{ q:', array_body))
    print(f"  {fname}: {count} cards")
    
    block = f"""{{
          section: 'Ethics, Law & Health Systems',
          topic: "{topic_name}",
          icon: "{icon}",
          cards: [
            {array_body}
          ]
        }}"""
    all_cards_blocks.append(block)

# Join all blocks
injection = ',\n'.join(all_cards_blocks)

# Read the HTML
with open('flash-cards.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Find the injection point: the closing of year4 array, just before 'usmle1'
# Pattern: },],\n      'usmle1'
# We want to insert our new topics BEFORE the ],
# The pattern is: ...},],\n      'usmle1'
# Replace with: ...},\nNEW_TOPICS,],\n      'usmle1'

target = "},],\n      'usmle1'"
if target not in content:
    # Try with \r\n
    target = "},],\r\n      'usmle1'"

if target not in content:
    print("ERROR: Could not find injection target!")
    print("Trying alternative patterns...")
    # Search around usmle1
    usmle1_idx = content.find("'usmle1'")
    print(f"usmle1 at {usmle1_idx}")
    print(repr(content[usmle1_idx-50:usmle1_idx+20]))
    sys.exit(1)

replacement = "},\n" + injection + ",],\n      'usmle1'"
if "\r\n" in target:
    replacement = "},\r\n" + injection + ",],\r\n      'usmle1'"

new_content = content.replace(target, replacement, 1)

if len(new_content) <= len(content):
    print("ERROR: Content was not modified!")
    sys.exit(1)

with open('flash-cards.html', 'w', encoding='utf-8') as f:
    f.write(new_content)

added_bytes = len(new_content) - len(content)
total_cards = len(re.findall(r'\{ q:', injection))
print(f"\nInjection complete!")
print(f"  Added {added_bytes:,} bytes")
print(f"  Added {total_cards} cards across 6 topics")
print(f"  Section: Ethics, Law & Health Systems")

# Verify the section exists in the file
verify = re.findall(r"section:\s*'Ethics, Law & Health Systems'", new_content)
print(f"  Verification: found {len(verify)} topic entries with section name")
