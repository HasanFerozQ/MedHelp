with open(r'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Find all occurrences of "Immunology" as a topic
import re
matches = [(m.start(), m.group()) for m in re.finditer(r'"topic":\s*"Immunology"', content)]
print(f"Topic 'Immunology' found {len(matches)} times")
for idx, match in matches:
    print(f"  At index {idx}: {content[idx:idx+60]}")

# Check year2 and year3 structure
y2 = content.find("'year2'")
y3 = content.find("'year3'")
print(f"\nyear2 at: {y2}, year3 at: {y3}")

# Count topics in year2
year2_section = content[y2:y3]
topics = re.findall(r'"topic":\s*"([^"]+)"', year2_section)
print(f"\nTopics in year2 ({len(topics)}):")
for t in topics:
    print(f"  - {t}")
