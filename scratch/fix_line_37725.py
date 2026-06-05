filepath = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"

with open(filepath, 'r', encoding='utf-8') as f:
    lines = f.readlines()

print(f"Total lines: {len(lines)}")
print(f"Line 37725 (index 37724): {repr(lines[37724])}")

if '}"en" data-theme="dark">' in lines[37724]:
    lines[37724] = "    }\n"
    print("Fixed line 37725!")
else:
    print("Line 37725 does not match the target string.")

with open(filepath, 'w', encoding='utf-8') as f:
    f.writelines(lines)
