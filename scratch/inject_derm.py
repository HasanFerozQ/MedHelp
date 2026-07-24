import json
import os

# Load Dermatology new cards
files = ['Dermatology_cards.json', 'Dermatology_cards_20.json']
new_cards = []
for fname in files:
    fpath = os.path.join('scratch', fname)
    cards = json.load(open(fpath, encoding='utf-8'))
    new_cards.extend(cards)

print(f"Loaded {len(new_cards)} Dermatology cards")

# Convert to JS format
def card_to_js(card):
    q = card['q'].replace('\\', '\\\\').replace('"', '\\"')
    a = card['a'].replace('\\', '\\\\').replace('"', '\\"')
    return f'            {{ q: "{q}", a: "{a}" }}'

cards_js = ',\n'.join(card_to_js(c) for c in new_cards)

# Read the HTML
with open('flash-cards.html', 'r', encoding='utf-8') as f:
    html = f.read()

# The target is line 32969 which has:
#             { q: "What is the primary treatment for mild localized plaque psoriasis?", ...
# followed by the closing bracket at end of line 32969

# Find the specific closing of the Dermatology usmle2 cards array
# The unique anchor: the last card in the usmle2 Dermatology section
anchor = '{ q: "What is the primary treatment for mild localized plaque psoriasis?", a: "Topical <b>Corticosteroids</b> (high-potency) + topical Vitamin D analogs (<b>Calcipotriene</b>)." }'

if anchor not in html:
    print("ERROR: Anchor not found!")
    exit(1)

# Find the position of the anchor
pos = html.find(anchor)
# Find the closing } after the anchor
end_of_card = html.find('}', pos + len(anchor)) + 1
print(f"Found anchor at char {pos}, end_of_card at {end_of_card}")

# Insert: add comma + new cards after the last existing card
insertion = ',\n' + cards_js
new_html = html[:end_of_card] + insertion + html[end_of_card:]

with open('flash-cards.html', 'w', encoding='utf-8') as f:
    f.write(new_html)

print(f"Done! Injected {len(new_cards)} Dermatology cards into flash-cards.html")
