# Read the raw content of year3_data.js
with open(r'c:\Users\Hasan-PC\Desktop\MedHelp\scratch\year3_data.js', 'r', encoding='utf-8') as f:
    raw_content = f.read()

# Replace only the literal string "\\n" with actual newline character "\n"
decoded_content = raw_content.replace('\\n', '\n')

# Write the cleaned content to year3_decoded.js
with open(r'c:\Users\Hasan-PC\Desktop\MedHelp\scratch\year3_decoded.js', 'w', encoding='utf-8') as f:
    f.write(decoded_content)

print("Decoded year3_data.js by replacing only \\n.")
