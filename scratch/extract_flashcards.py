import os

html_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"
js_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\flashcards-data.js"

with open(html_path, "r", encoding="utf-8") as f:
    lines = f.readlines()

start_idx = None
end_idx = None

for i, line in enumerate(lines):
    if "const FLASH_DATA = {" in line and start_idx is None:
        start_idx = i
    if start_idx is not None and "for (const tab of Object.keys(FLASH_DATA)) {" in line:
        end_idx = i
        break

if start_idx is not None and end_idx is not None:
    # Find the closing brace of FLASH_DATA before end_idx
    data_lines = lines[start_idx:end_idx]
    # Extract FLASH_DATA
    # The last non-empty line before end_idx in data_lines should be the end of FLASH_DATA
    # Let's find where FLASH_DATA ends (line with }; or };)
    flash_data_code = "".join(lines[start_idx:end_idx])
    
    # Save flashcards-data.js
    with open(js_path, "w", encoding="utf-8") as f_js:
        f_js.write(flash_data_code)
    
    # Replace FLASH_DATA in html with script inclusion tag
    new_lines = lines[:start_idx] + ["    // FLASH_DATA extracted to /flashcards-data.js for performance & SEO\n"] + lines[end_idx:]
    
    # Insert <script src="/flashcards-data.js" defer></script> into head
    head_insert_idx = None
    for i, line in enumerate(new_lines):
        if "</head>" in line:
            head_insert_idx = i
            break
            
    if head_insert_idx is not None:
        new_lines.insert(head_insert_idx, '  <script src="/flashcards-data.js" defer></script>\n')
        
    with open(html_path, "w", encoding="utf-8") as f_html:
        f_html.writelines(new_lines)

    print(f"Extracted {len(data_lines)} lines of FLASH_DATA to {js_path}")
    print(f"Updated {html_path}, new line count: {len(new_lines)}")
else:
    print("Could not locate FLASH_DATA bounds!", start_idx, end_idx)
