import re, sys
sys.stdout.reconfigure(encoding='utf-8')

with open('flash-cards.html', 'r', encoding='utf-8') as f:
    content = f.read()

data_idx = content.find('const FLASH_DATA')
year4_idx = content.find("'year4'", data_idx)

# Find where usmle1 starts
usmle1_idx = content.find("'usmle1'", year4_idx)
print(f"year4 at: {year4_idx}")
print(f"usmle1 at: {usmle1_idx}")

# Show the end of year4 section (just before usmle1)
snippet = content[usmle1_idx-500:usmle1_idx+50]
print("\n--- END OF YEAR4 / START OF USMLE1 ---")
print(snippet)

# Find the last topic in Ophthalmology section
ophtho_idx = content.rfind("Ophthalmology", year4_idx, usmle1_idx)
print(f"\nLast 'Ophthalmology' section reference at: {ophtho_idx}")

# Find the closing bracket pattern before usmle1
# We need to find the ], pattern that closes year4
lines = content[usmle1_idx-200:usmle1_idx].split('\n')
for i, line in enumerate(lines):
    print(f"Line {i}: {line[:120]}")
