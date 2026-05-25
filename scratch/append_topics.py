# Python script to append the remaining year3 sections and topics
import os

new_topics = [
    # General Surgery
    {"section": "General Surgery", "topic": "Surgical principles — wound healing, fluid & electrolytes, shock", "icon": "activity"},
    {"section": "General Surgery", "topic": "Pre/post-operative care & anesthesia basics", "icon": "activity"},
    {"section": "General Surgery", "topic": "Abdominal surgery — appendicitis, hernias, bowel obstruction", "icon": "activity"},
    {"section": "General Surgery", "topic": "Hepatobiliary — cholecystitis, liver abscess, biliary disease", "icon": "activity"},
    {"section": "General Surgery", "topic": "Breast surgery — benign vs malignant disease", "icon": "activity"},
    {"section": "General Surgery", "topic": "Trauma — ATLS principles, damage control surgery", "icon": "activity"},
    {"section": "General Surgery", "topic": "Surgical oncology basics", "icon": "activity"},
    {"section": "General Surgery", "topic": "Vascular surgery — PAD, AAA, DVT/PE", "icon": "activity"},

    # Psychiatry
    {"section": "Psychiatry", "topic": "Mood disorders — major depression, bipolar I & II", "icon": "brain"},
    {"section": "Psychiatry", "topic": "Psychotic disorders — schizophrenia spectrum", "icon": "brain"},
    {"section": "Psychiatry", "topic": "Anxiety disorders — GAD, panic, PTSD, OCD", "icon": "brain"},
    {"section": "Psychiatry", "topic": "Substance use disorders — alcohol, opioids, stimulants", "icon": "brain"},
    {"section": "Psychiatry", "topic": "Personality disorders", "icon": "brain"},
    {"section": "Psychiatry", "topic": "Eating disorders", "icon": "brain"},
    {"section": "Psychiatry", "topic": "Psychiatric emergencies & commitment law", "icon": "brain"},
    {"section": "Psychiatry", "topic": "Psychopharmacology essentials", "icon": "brain"},

    # Pediatrics (Introductory)
    {"section": "Pediatrics (Introductory)", "topic": "Growth & development milestones", "icon": "baby"},
    {"section": "Pediatrics (Introductory)", "topic": "Neonatal conditions — jaundice, RDS, sepsis", "icon": "baby"},
    {"section": "Pediatrics (Introductory)", "topic": "Common pediatric infections — otitis, RSV, meningitis", "icon": "baby"},
    {"section": "Pediatrics (Introductory)", "topic": "Pediatric vaccines & preventive care", "icon": "baby"},
    {"section": "Pediatrics (Introductory)", "topic": "Congenital anomalies overview", "icon": "baby"},
    {"section": "Pediatrics (Introductory)", "topic": "Failure to thrive & nutritional disorders", "icon": "baby"},

    # Clinical Skills & Diagnostics
    {"section": "Clinical Skills & Diagnostics", "topic": "History taking & physical examination", "icon": "stethoscope"},
    {"section": "Clinical Skills & Diagnostics", "topic": "ECG interpretation", "icon": "stethoscope"},
    {"section": "Clinical Skills & Diagnostics", "topic": "Chest X-ray & basic radiology reading", "icon": "stethoscope"},
    {"section": "Clinical Skills & Diagnostics", "topic": "ABG interpretation", "icon": "stethoscope"},
    {"section": "Clinical Skills & Diagnostics", "topic": "Common lab interpretation (CBC, CMP, LFTs)", "icon": "stethoscope"},
    {"section": "Clinical Skills & Diagnostics", "topic": "Clinical reasoning & differential diagnosis", "icon": "stethoscope"}
]

# Generate JS code block for the new topics
js_parts = []
for t in new_topics:
    topic_escaped = t["topic"].replace('"', '\\"')
    block = f"""        {{
          section: '{t["section"]}',
          topic: "{topic_escaped}",
          icon: '{t["icon"]}',
          cards: []
        }}"""
    js_parts.append(block)

# Read flash-cards.html
filepath = r'c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html'
with open(filepath, 'r', encoding='utf-8') as f:
    html = f.read()

# Find the end of the year3 block
# The year3 block is inside FLASH_DATA and ends right before 'year4': [
# In our successfully patched file, it ends with:
#           ]
#         }
#       ],
#       'year4': [

end_pattern = """          ]
        }
      ],
      'year4': ["""

if end_pattern in html:
    print("Found end pattern of year3 block!")
    
    # We will replace it with:
    #           ]
    #         },
    #         <new empty topics...>
    #       ],
    #       'year4': [
    
    new_topics_js = ",\n".join(js_parts)
    
    replacement = "          ]\n        },\n" + new_topics_js + "\n      ],\n      'year4': ["
    
    updated_html = html.replace(end_pattern, replacement)
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(updated_html)
    print("Successfully appended the remaining sections and topics to year3!")
else:
    print("Error: Could not locate the end pattern in flash-cards.html")
