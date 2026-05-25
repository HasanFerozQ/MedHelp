with open(r'c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html', 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Read the clean, multi-line year3 block
with open(r'c:\Users\Hasan-PC\Desktop\MedHelp\scratch\year3_decoded.js', 'r', encoding='utf-8') as f:
    year3_clean = f.read()

# Let's locate the line containing 'year3'
target_idx = -1
for idx, line in enumerate(lines):
    if "'year3':" in line:
        target_idx = idx
        break

if target_idx != -1:
    print(f"Found 'year3': on line {target_idx + 1}")
    print(f"Line content begins with: {lines[target_idx][:100]}...")
    
    # We replace that line with the clean block
    # Note that year3_clean has a trailing comma or we can add it if needed
    # Let's inspect the last few characters of year3_clean
    print(f"Clean block ends with: {year3_clean[-50:]}")
    
    lines[target_idx] = year3_clean + "\n"
    
    with open(r'c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html', 'w', encoding='utf-8') as f:
        f.writelines(lines)
    print("Successfully patched flash-cards.html with clean year3 data!")
else:
    print("Could not find 'year3': in flash-cards.html")
