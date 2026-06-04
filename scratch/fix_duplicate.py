filepath = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"

with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# The duplicate block to remove (lines 39-53 in the current file)
duplicate_block = """  <!-- MathJax configuration and script -->
  <script>
    window.MathJax = {
      tex: {
        inlineMath: [['$', '$'], ['\\\\(', '\\\\)']],
        displayMath: [['$$', '$$'], ['\\\\[', '\\\\]']],
        processEscapes: true
      },
      options: {
        ignoreHtmlClass: 'tex2jax_ignore',
        processHtmlClass: 'tex2jax_process'
      }
    };
  </script>
  <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js" id="MathJax-script" async></script>"""

# We want to keep the first occurrence and remove the second
# The pattern is: the duplicate block appears right before <style>
# So we find both occurrences and remove the second one

# Normalize line endings for matching
norm = content.replace('\r\n', '\n')
norm_dup = duplicate_block.replace('\r\n', '\n')

first_idx = norm.find(norm_dup)
if first_idx == -1:
    print("ERROR: Could not find the MathJax block at all.")
else:
    second_idx = norm.find(norm_dup, first_idx + len(norm_dup))
    if second_idx == -1:
        print("No duplicate found — only one copy exists. Nothing to fix.")
    else:
        # Remove the second occurrence (plus the trailing newline)
        end_of_second = second_idx + len(norm_dup)
        # Also remove the trailing newline after the block
        if end_of_second < len(norm) and norm[end_of_second] == '\n':
            end_of_second += 1
        norm = norm[:second_idx] + norm[end_of_second:]
        
        # Restore CRLF if original had it
        if '\r\n' in content:
            norm = norm.replace('\n', '\r\n')
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(norm)
        print("Duplicate MathJax block removed successfully.")
