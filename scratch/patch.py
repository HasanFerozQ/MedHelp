import re

with open(r'c:\Users\Hasan-PC\Desktop\MedHelp\scratch\year3_data.js', 'r', encoding='utf-8') as f:
    new_data = f.read()

with open(r'c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html', 'r', encoding='utf-8') as f:
    html = f.read()

# We need to replace the old 'year3' array
# The old one is:
old_target = """      'year3': [
        {
          section: 'Internal Medicine',
          topic: 'Cardiology — ACS, heart failure, arrhythmias, valvular disease',
          icon: 'heart',
          cards: []
        }
      ],"""

if old_target in html:
    html = html.replace(old_target, new_data)
    with open(r'c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html', 'w', encoding='utf-8') as f:
        f.write(html)
    print("Patched successfully")
else:
    print("Could not find the target string to replace.")
