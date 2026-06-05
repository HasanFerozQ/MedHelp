filepath = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"

with open(filepath, 'r', encoding='utf-8') as f:
    lines = f.readlines()

print(f"Original lines count: {len(lines)}")

# We want to keep lines up to index 37724 (which is line 37725)
# Let's inspect the lines around 37724 to be sure
for idx in range(37720, 37725):
    print(f"{idx+1}: {repr(lines[idx])}")

# Let's truncate at 37725 lines (index 0 to 37724)
truncated_lines = lines[:37725]

# Now append the closing code
closing_code = [
    "\n",
    "    init();\n",
    "  </script>\n",
    "</body>\n",
    "</html>\n"
]

new_lines = truncated_lines + closing_code

with open(filepath, 'w', encoding='utf-8') as f:
    f.writelines(new_lines)

print(f"New lines count: {len(new_lines)}")
