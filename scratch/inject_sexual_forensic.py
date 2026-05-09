import json
import os

html_path = r'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html'
json_path = r'c:/Users/Hasan-PC/Desktop/MedHelp/scratch/sexual_forensic_cards.json'

with open(html_path, 'r', encoding='utf-8') as f:
    html_content = f.read()

with open(json_path, 'r', encoding='utf-8') as f:
    cards = json.load(f)

new_topic = {
    "topic": "Sexual & Forensic Pathology",
    "icon": "microscope",
    "cards": cards
}

# Convert to JS object string
topic_js = json.dumps(new_topic, indent=10)
topic_js = topic_js.replace('\n', '\n        ')
topic_js = '        ' + topic_js

# Insert into year2 array
parts = html_content.split("'year3': [")
if len(parts) > 1:
    year2_part = parts[0]
    last_bracket_index = year2_part.rfind(']')
    if last_bracket_index != -1:
        injected_topic = ',\n        ' + json.dumps(new_topic, indent=10).replace('\n', '\n        ')
        new_html = year2_part[:last_bracket_index] + injected_topic + year2_part[last_bracket_index:] + "'year3': [" + parts[1]
        
        with open(html_path, 'w', encoding='utf-8') as f:
            f.write(new_html)
        print("Successfully injected Sexual & Forensic Pathology.")
    else:
        print("Could not find end of year2 topics.")
else:
    print("Could not find year3 start.")
