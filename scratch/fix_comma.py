filepath = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"

with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace the boundary without a comma to one with a comma
target = """          ]
        }

        {
          section: 'Advanced Pediatrics',"""

replacement = """          ]
        },

        {
          section: 'Advanced Pediatrics',"""

if target in content:
    content = content.replace(target, replacement)
    print("Successfully replaced and added the comma!")
else:
    # Let's try matching with different spacing/newline styles
    print("Exact target string not found, attempting regex replacement...")
    import re
    # Match:
    #           ]
    #         }
    #
    #         {
    #           section: 'Advanced Pediatrics',
    pattern = r'\]\s*\}\s*\{\s*section:\s*\'Advanced Pediatrics\','
    # Let's see if we can find it
    match = re.search(pattern, content)
    if match:
        print("Regex match found!")
        # Let's do a more precise string replace or use regex replace
        # We can find the start of `{` and insert `,`
        # Let's construct a replacement using the matched text
        matched_text = match.group(0)
        # Replace the first `}` with `},`
        replaced_text = matched_text.replace('}', '},', 1)
        content = content.replace(matched_text, replaced_text)
        print("Fixed via regex replace!")
    else:
        print("Error: Could not locate boundary between Emergency Medicine and Advanced Pediatrics")

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
