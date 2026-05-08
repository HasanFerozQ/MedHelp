import json
import os

html_path = r'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html'
json_path = r'c:/Users/Hasan-PC/Desktop/MedHelp/scratch/hematology_cards.json'

with open(html_path, 'r', encoding='utf-8') as f:
    html_content = f.read()

with open(json_path, 'r', encoding='utf-8') as f:
    cards = json.load(f)

new_topic = {
    "topic": "General Hematology",
    "icon": "droplet",
    "cards": cards
}

# Convert to JS object string (manual formatting to match style)
topic_js = json.dumps(new_topic, indent=10)
# Adjust indentation to match the file (10 spaces for the whole object)
topic_js = topic_js.replace('\n', '\n        ')
# Fix the first line indentation
topic_js = '        ' + topic_js

# We want to insert this into the year2 array.
# year2 is on line 4552. It ends around 8256.
# Let's find the closing bracket of the year2 array.
# The year2 array is part of FLASH_DATA.

target_marker = '      ],\n      \'year3\':'
if target_marker in html_content:
    replacement = '        ' + json.dumps(new_topic, indent=10).replace('\n', '\n        ') + ',\n' + target_marker
    # Using a simpler target for replacement
    # The last topic in year2 ends with } then ] then , then year3
    
    # Better approach: split by 'year3': [ and find the last ] before it
    parts = html_content.split("'year3': [")
    if len(parts) > 1:
        year2_part = parts[0]
        # Find the last closing bracket of the topics in year2
        last_bracket_index = year2_part.rfind(']')
        if last_bracket_index != -1:
            injected_topic = ',\n        ' + json.dumps(new_topic, indent=10).replace('\n', '\n        ')
            new_html = year2_part[:last_bracket_index] + injected_topic + year2_part[last_bracket_index:] + "'year3': [" + parts[1]
            
            with open(html_path, 'w', encoding='utf-8') as f:
                f.write(new_html)
            print("Successfully injected General Hematology.")
        else:
            print("Could not find end of year2 topics.")
    else:
        print("Could not find year3 start.")
else:
    print("Could not find target marker.")
