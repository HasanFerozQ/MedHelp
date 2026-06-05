"""
Validate the FLASH_DATA JavaScript structure in flash-cards.html
"""
import re, sys
sys.stdout.reconfigure(encoding='utf-8')

with open('flash-cards.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Extract the FLASH_DATA block
start_marker = 'const FLASH_DATA = {'
start = content.find(start_marker)
if start == -1:
    print("ERROR: FLASH_DATA not found!")
    sys.exit(1)

# Find matching closing brace
depth = 0
in_string = False
escape = False
string_char = None
i = content.index('{', start)

for pos in range(i, len(content)):
    c = content[pos]
    
    if escape:
        escape = False
        continue
    
    if c == '\\':
        if in_string:
            escape = True
        continue
    
    if in_string:
        if c == string_char:
            in_string = False
        continue
    
    if c in ('"', "'", '`'):
        in_string = True
        string_char = c
        continue
    
    if c == '{':
        depth += 1
    elif c == '}':
        depth -= 1
        if depth == 0:
            end = pos + 1
            break

print(f"FLASH_DATA block: {start} to {end} ({end-start:,} chars)")

# Check all year keys exist
for key in ['year1', 'year2', 'year3', 'year4', 'usmle1', 'usmle2', 'usmle3']:
    idx = content.find(f"'{key}'", start, end)
    if idx != -1:
        print(f"  {key}: found at {idx}")
    else:
        print(f"  {key}: NOT FOUND!")

# Check Ethics section count
ethics_count = len(re.findall(r"section:\s*'Ethics, Law & Health Systems'", content[start:end]))
print(f"\n  Ethics topics: {ethics_count}")

# Count total cards in year4
year4_start = content.find("'year4'", start, end)
usmle1_start = content.find("'usmle1'", start, end)
year4_section = content[year4_start:usmle1_start]
year4_cards = len(re.findall(r'\{ q:', year4_section))
print(f"  Total year4 cards: {year4_cards}")

# Count all sections in year4
sections = re.findall(r"section:\s*'([^']+)'", year4_section)
unique_sections = []
for s in sections:
    if s not in unique_sections:
        unique_sections.append(s)
print(f"\n  Year4 sections:")
for s in unique_sections:
    count = sections.count(s)
    print(f"    - {s} ({count} topics)")

# Basic bracket validation in the year4 block
open_brackets = year4_section.count('[')
close_brackets = year4_section.count(']')
print(f"\n  Bracket balance in year4: [ = {open_brackets}, ] = {close_brackets}")

open_braces = year4_section.count('{')
close_braces = year4_section.count('}')
print(f"  Brace balance in year4: {{ = {open_braces}, }} = {close_braces}")

print("\nValidation complete!")
