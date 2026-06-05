import os
import re

html_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"
scratch_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch"

topics_info = [
    {
        "file": "cards_ophtho_red_eye.js",
        "topic": "Red eye — conjunctivitis, uveitis, keratitis",
        "icon": "eye"
    },
    {
        "file": "cards_ophtho_glaucoma.js",
        "topic": "Glaucoma — types & management",
        "icon": "eye"
    },
    {
        "file": "cards_ophtho_retinal.js",
        "topic": "Retinal emergencies — detachment, CRAO, CRVO",
        "icon": "eye"
    },
    {
        "file": "cards_ophtho_retinopathy.js",
        "topic": "Diabetic & hypertensive retinopathy",
        "icon": "eye"
    },
    {
        "file": "cards_ophtho_cataract.js",
        "topic": "Cataract & lens disorders",
        "icon": "eye"
    },
    {
        "file": "cards_ophtho_trauma.js",
        "topic": "Ocular trauma",
        "icon": "eye"
    }
]

# Build the injection string
injection_content = ""

for t_info in topics_info:
    filepath = os.path.join(scratch_dir, t_info["file"])
    with open(filepath, 'r', encoding='utf-8') as f:
        js_content = f.read()
    
    # Extract the cards array block between `[` and `]`
    first_bracket = js_content.find('[')
    last_bracket = js_content.rfind(']')
    
    if first_bracket == -1 or last_bracket == -1:
        raise ValueError(f"Could not find array brackets in {t_info['file']}")
        
    cards_str = js_content[first_bracket+1 : last_bracket].strip()
    
    topic_block = f"""
        {{
          section: 'Ophthalmology',
          topic: "{t_info['topic']}",
          icon: "{t_info['icon']}",
          cards: [
            {cards_str}
          ]
        }},"""
    injection_content += topic_block

# Read the html file
with open(html_path, 'r', encoding='utf-8') as f:
    html_content = f.read()

# Find the end of the `year4` array.
# Let's search for the pattern `]\s*,\s*'usmle1':\s*\[\]` or `]\s*,\s*usmle1:\s*\[\]`
target_pattern = r'\]\s*,\s*[\'"]usmle1[\'"]:\s*\[\]'
match = re.search(target_pattern, html_content)
if not match:
    target_pattern = r'\]\s*,\s*usmle1:\s*\[\]'
    match = re.search(target_pattern, html_content)

if not match:
    raise ValueError("Could not find the end of year4 block (looking for 'usmle1')")

# Insert before the `]` character (which is at match.start())
insert_pos = match.start()

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

print("Successfully injected all 6 Ophthalmology topics!")
