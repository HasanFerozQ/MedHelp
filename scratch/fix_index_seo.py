import re

path = r"c:\Users\Hasan-PC\Desktop\MedHelp\index.html"
with open(path, encoding="utf-8") as f:
    content = f.read()

# 1. Fix H1
old_h1 = """      <h1 class="hero-h1">
        Medical Bill Audit —<br>
        You Probably <span class="grad-text">Overpaid.</span><br>
        Let's Prove It.
      </h1>"""
new_h1 = """      <h1 class="hero-h1">
        Medical Bill Audit — <span class="grad-text">Find &amp; Fix</span> Billing Errors
      </h1>"""
content = content.replace(old_h1, new_h1)

# 2. Add skip-to-content link right after <body>
if 'skip-to-content' not in content:
    content = content.replace(
        '<body>',
        '<body>\n  <a href="#main-content" class="skip-to-content">Skip to main content</a>'
    )

# 3. Wrap navbar in <header>
if '<header class="site-header">' not in content:
    content = content.replace(
        '  <!-- ── NAVBAR ── -->\n  <nav class="navbar">',
        '  <!-- ── NAVBAR ── -->\n  <header class="site-header">\n  <nav class="navbar">'
    )
    # Close the header after </nav>
    content = content.replace(
        '  </nav>\n\n  <!-- HERO SECTION -->',
        '  </nav>\n  </header>\n\n  <main id="main-content">\n  <!-- HERO SECTION -->'
    )
    # Close main before </body>
    content = content.replace('</body>', '  </main>\n</body>')

with open(path, "w", encoding="utf-8") as f:
    f.write(content)

# Verify
with open(path, encoding="utf-8") as f:
    final = f.read()

h1_m = re.search(r'<h1 class="hero-h1">(.*?)</h1>', final, re.DOTALL)
h1_text = re.sub(r'<[^>]+>', '', h1_m.group(1)).strip().replace('\n', ' ') if h1_m else 'NOT FOUND'
print(f"H1 ({len(h1_text)} chars): {h1_text}")
print("skip-to-content:", 'skip-to-content' in final)
print("<header class:", '<header class="site-header">' in final)
print('<main id="main-content":', 'id="main-content"' in final)
