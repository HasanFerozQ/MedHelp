filepath = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"

with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# Add MathJax.typesetClear before typesetPromise
old_typeset = """        // Trigger MathJax dynamic rendering
        if (window.MathJax && typeof MathJax.typesetPromise === 'function') {
          MathJax.typesetPromise([frontText, backText]).catch((err) => {
            console.error("MathJax typesetting error:", err);
          });
        }"""

new_typeset = """        // Trigger MathJax dynamic rendering
        if (window.MathJax && typeof MathJax.typesetPromise === 'function') {
          // Clear previous typeset state so MathJax can re-process these elements
          if (typeof MathJax.typesetClear === 'function') {
            MathJax.typesetClear([frontText, backText]);
          }
          MathJax.typesetPromise([frontText, backText]).catch((err) => {
            console.error("MathJax typesetting error:", err);
          });
        }"""

norm = content.replace('\r\n', '\n')
old_norm = old_typeset.replace('\r\n', '\n')
new_norm = new_typeset.replace('\r\n', '\n')

if old_norm in norm:
    norm = norm.replace(old_norm, new_norm, 1)
    if '\r\n' in content:
        norm = norm.replace('\n', '\r\n')
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(norm)
    print("Added MathJax.typesetClear() call successfully.")
else:
    print("ERROR: Could not find target MathJax block.")
