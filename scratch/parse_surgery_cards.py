import re
import os
import shutil
import json

# Setup paths
workspace_dir = r"C:\Users\Hasan-PC\Desktop\MedHelp"
flash_cards_path = os.path.join(workspace_dir, "flash-cards.html")
txt_path = os.path.join(workspace_dir, "vision", "3rdYearGeneralSurgeryFlashCards.txt")

# Create a backup of flash-cards.html first
backup_path = os.path.join(workspace_dir, "flash-cards.html.bak")
shutil.copy2(flash_cards_path, backup_path)
print(f"Created backup of flash-cards.html at {backup_path}")

# Read and parse the flash cards txt file
with open(txt_path, "r", encoding="utf-8") as f:
    content = f.read()

# Let's find topics and their cards
# We can split the content by 'Topic:'
topics_raw = re.split(r'Topic:\s*', content)

parsed_topics = {}
current_topic = None

# The first split will be content before the first 'Topic:'
for part in topics_raw[1:]:
    lines = part.split("\n")
    topic_name = lines[0].strip()
    
    # Rest of the lines are cards
    cards_content = "\n".join(lines[1:])
    
    # Find all Front: and Back: pairs
    # Since fronts/backs can be multiline, let's use regex with DOTALL or line-by-line parsing
    cards = []
    
    # We can parse by looking for Front: and Back:
    # A robust way is to scan line by line
    current_front = None
    current_back = None
    
    temp_lines = cards_content.split("\n")
    i = 0
    while i < len(temp_lines):
        line = temp_lines[i].strip()
        if line.startswith("Front:"):
            # Extract front
            front_text = line[len("Front:"):].strip()
            # If next lines are not Back:, they might belong to front
            i += 1
            while i < len(temp_lines) and not temp_lines[i].strip().startswith("Back:") and not temp_lines[i].strip().startswith("Front:") and not temp_lines[i].strip().startswith("Section:") and not temp_lines[i].strip().startswith("Topic:"):
                addition = temp_lines[i].strip()
                if addition:
                    front_text += "\n" + addition
                i += 1
            current_front = front_text
            continue
        elif line.startswith("Back:"):
            back_text = line[len("Back:"):].strip()
            i += 1
            while i < len(temp_lines) and not temp_lines[i].strip().startswith("Front:") and not temp_lines[i].strip().startswith("Back:") and not temp_lines[i].strip().startswith("Section:") and not temp_lines[i].strip().startswith("Topic:"):
                addition = temp_lines[i].strip()
                if addition:
                    back_text += "\n" + addition
                i += 1
            current_back = back_text
            
            # Save the card
            if current_front and current_back:
                # Clean up any HTML entities/formatting
                # Replace newlines in back with <br> to format nicely in HTML
                formatted_back = current_back.replace("\n", "<br>")
                cards.append({
                    "q": current_front,
                    "a": formatted_back
                })
                current_front = None
                current_back = None
            continue
        i += 1
        
    parsed_topics[topic_name] = cards
    print(f"Parsed topic '{topic_name}' with {len(cards)} cards.")

# Now mapping of topic names from txt to HTML
topic_mapping = [
    ("Surgical Principles", "Surgical principles — wound healing, fluid & electrolytes, shock"),
    ("Pre/post-operative care & anesthesia basics", "Pre/post-operative care & anesthesia basics"),
    ("Abdominal surgery — appendicitis, hernias, bowel obstruction", "Abdominal surgery — appendicitis, hernias, bowel obstruction"),
    ("Hepatobiliary — cholecystitis, liver abscess, biliary disease", "Hepatobiliary — cholecystitis, liver abscess, biliary disease"),
    ("Breast surgery — benign vs malignant disease", "Breast surgery — benign vs malignant disease"),
    ("Trauma — ATLS principles, damage control surgery", "Trauma — ATLS principles, damage control surgery"),
    ("Surgical oncology basics", "Surgical oncology basics"),
    ("Vascular surgery — PAD, AAA, DVT/PE", "Vascular surgery — PAD, AAA, DVT/PE")
]

# Read flash-cards.html
with open(flash_cards_path, "r", encoding="utf-8") as f:
    html_content = f.read()

# Let's replace cards: [] for each topic
for txt_topic, html_topic in topic_mapping:
    cards_list = parsed_topics.get(txt_topic, [])
    if not cards_list:
        # try case insensitive or partial match
        for key in parsed_topics.keys():
            if txt_topic.lower() in key.lower() or key.lower() in txt_topic.lower():
                cards_list = parsed_topics[key]
                break
                
    if not cards_list:
        print(f"Warning: No cards found for topic {txt_topic}")
        continue

    # Convert the cards list to JSON formatted nicely
    # We want a single line/indented formatting to fit into JS
    cards_json = json.dumps(cards_list, indent=12, ensure_ascii=False)
    # Adjust indentation to match the structure
    cards_json = cards_json.strip()
    
    # We find:
    # topic: "..."
    # icon: '...'
    # cards: []
    
    # Escape special regex characters in topic name
    escaped_topic = re.escape(html_topic)
    
    pattern = rf'topic:\s*["\']{escaped_topic}["\'],\s*icon:\s*[\'"]activity[\'"],\s*cards:\s*\[\s*\]'
    replacement = f'topic: "{html_topic}",\n          icon: \'activity\',\n          cards: {cards_json}'
    
    new_html_content, count = re.subn(pattern, replacement, html_content)
    if count > 0:
        html_content = new_html_content
        print(f"Successfully populated '{html_topic}' with {len(cards_list)} cards.")
    else:
        print(f"Failed to find match for topic '{html_topic}' with standard pattern. Trying fallback pattern.")
        # Fallback in case spacing is different
        pattern_fallback = rf'topic:\s*["\']{escaped_topic}["\'](?:[^{{}}]*?)cards:\s*\[\s*\]'
        new_html_content, count_fb = re.subn(pattern_fallback, lambda m: m.group(0).replace("cards: []", f"cards: {cards_json}"), html_content)
        if count_fb > 0:
            html_content = new_html_content
            print(f"Successfully populated (fallback) '{html_topic}' with {len(cards_list)} cards.")
        else:
            print(f"ERROR: Could not find '{html_topic}' with empty cards in HTML.")

# Write the updated HTML back
with open(flash_cards_path, "w", encoding="utf-8") as f:
    f.write(html_content)

print("Done updating flash-cards.html!")
