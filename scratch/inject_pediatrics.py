import os
import re

html_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"
scratch_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch"

topics_info = [
    {
        "file": "cards_pals.js",
        "topic": "Pediatric emergencies & resuscitation (PALS)",
        "icon": "activity"
    },
    {
        "file": "cards_chd.js",
        "topic": "Congenital heart disease",
        "icon": "heart"
    },
    {
        "file": "cards_peds_resp.js",
        "topic": "Pediatric respiratory disorders",
        "icon": "wind"
    },
    {
        "file": "cards_peds_onc.js",
        "topic": "Pediatric oncology essentials",
        "icon": "activity"
    },
    {
        "file": "cards_dev_behavioral.js",
        "topic": "Developmental & behavioral pediatrics",
        "icon": "baby"
    },
    {
        "file": "cards_peds_nephro_endo.js",
        "topic": "Pediatric nephrology & endocrinology",
        "icon": "filter"
    },
    {
        "file": "cards_child_abuse.js",
        "topic": "Child abuse recognition & reporting",
        "icon": "shield-alert"
    }
]

# Build the injection string
injection_content = ""

for t_info in topics_info:
    filepath = os.path.join(scratch_dir, t_info["file"])
    with open(filepath, 'r', encoding='utf-8') as f:
        js_content = f.read()
    
    # Extract the cards array block between `[` and `]`
    # Find first `[` and last `]`
    first_bracket = js_content.find('[')
    last_bracket = js_content.rfind(']')
    
    if first_bracket == -1 or last_bracket == -1:
        raise ValueError(f"Could not find array brackets in {t_info['file']}")
        
    cards_str = js_content[first_bracket+1 : last_bracket].strip()
    
    # We want to format this as a JS object:
    # {
    #   section: 'Advanced Pediatrics',
    #   topic: '...',
    #   icon: '...',
    #   cards: [
    #     ...
    #   ]
    # },
    
    topic_block = f"""\n        {{\n          section: 'Advanced Pediatrics',\n          topic: "{t_info['topic']}",\n          icon: "{t_info['icon']}",\n          cards: [\n            {cards_str}\n          ]\n        }},"""
    injection_content += topic_block

# Now let's read the html file
with open(html_path, 'r', encoding='utf-8') as f:
    html_content = f.read()

# We need to find the end of the `year4` array.
# The `year4` array starts with `'year4': [`
# Let's search for `'usmle1': []` which comes immediately after `year4` closes.
# In the original file we saw:
#       'usmle1': [],
# Let's find the closing square bracket of `year4` right before `'usmle1': []`
# Let's search for the pattern `]\s*,\s*'usmle1':\s*\[\]`
target_pattern = r'\]\s*,\s*[\'"]usmle1[\'"]:\s*\[\]'
match = re.search(target_pattern, html_content)
if not match:
    # Let's try matching with space/newline variations
    print("Pattern check 1 failed, trying fallback patterns...")
    target_pattern = r'\]\s*,\s*usmle1:\s*\[\]'
    match = re.search(target_pattern, html_content)

if not match:
    raise ValueError("Could not find the end of year4 block (looking for 'usmle1')")

# The matched string is e.g. `], \n      'usmle1': []`
# We want to insert our new topics right before the closing `]` of the year4 array.
# The match starts at the closing `]` of the year4 array.
insert_pos = match.start()

# Let's verify we are cutting at the correct place
context_before = html_content[insert_pos-100 : insert_pos]
context_after = html_content[insert_pos : insert_pos+100]
print("--- Insertion Point Verification ---")
print("BEFORE:")
print(repr(context_before))
print("AFTER:")
print(repr(context_after))
print("------------------------------------")

new_html = html_content[:insert_pos] + injection_content + html_content[insert_pos:]

with open(html_path, 'w', encoding='utf-8') as f:
    f.write(new_html)

print("Successfully injected all 7 pediatrics topics!")
