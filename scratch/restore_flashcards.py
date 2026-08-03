import os

html_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"
js_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js"

with open(html_path, "r", encoding="utf-8") as f:
    lines = f.readlines()

with open(js_path, "r", encoding="utf-8") as f:
    flash_data_content = f.read()

# Remove the external <script src="/flashcards-data.js"> tag
new_lines = []
for line in lines:
    if '<script src="/flashcards-data.js">' in line and '</script>' in line:
        # Replace this line with the inline FLASH_DATA wrapped in a script tag
        new_lines.append("  <script>\n")
        new_lines.append(flash_data_content)
        new_lines.append("\n  </script>\n")
    else:
        new_lines.append(line)

with open(html_path, "w", encoding="utf-8") as f:
    f.writelines(new_lines)

final_size = os.path.getsize(html_path)
print(f"Restored! flash-cards.html is now {final_size / (1024*1024):.2f} MB with FLASH_DATA inline.")
print(f"Total lines: {len(new_lines)}")
