with open('flash-cards.html', 'r', encoding='utf-8') as f:
    content = f.read()

import re

# Find all year keys
years = re.findall(r"'(year\d+)'", content)
unique_years = list(dict.fromkeys(years))
print('Years found:', unique_years)

# Find year4
idx4 = content.find("'year4'")
print('year4 at index:', idx4)
if idx4 >= 0:
    chunk = content[idx4:idx4+4000]
    print(chunk)
