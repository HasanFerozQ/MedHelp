with open('flash-cards.html', 'r', encoding='utf-8') as f:
    content = f.read()

import re

# Find year4 section
idx4 = content.find("'year4'")
# Find year4 end (start of usmle1 or next year)
idx_usmle = content.find("'usmle1'", idx4)
year4_block = content[idx4:idx_usmle]

print(f"year4 block length: {len(year4_block)}")

# Find all topics in year4
topics = re.findall(r"topic:\s*['\"](.+?)['\"]", year4_block)
print(f"\nTotal topics in year4: {len(topics)}")
for i, t in enumerate(topics):
    print(f"  {i+1}. {t}")

# Find all sections
sections = re.findall(r"section:\s*['\"](.+?)['\"]", year4_block)
print(f"\nSections: {set(sections)}")
