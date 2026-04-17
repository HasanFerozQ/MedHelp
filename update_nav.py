import os
import re

nav_links_pattern = re.compile(r'<div class="nav-links">.*?</div>', re.DOTALL)
footer_tools_pattern = re.compile(r'<div class="footer-col">\s*<h4>Tools</h4>\s*<ul>.*?</ul>\s*</div>', re.DOTALL)

nav_replacement = """<div class="nav-links">
        <a href="/">Home</a>
        <a href="/cpt-code-search">CPT Code Search</a>
        <a href="/claim-denial-codes">Claim Denial Codes</a>
        <a href="/audit">Medical Bill Audit</a>
        <a href="/providers">National Provider Search</a>
        <a href="/blog">Blog</a>
      </div>"""

footer_replacement = """<div class="footer-col">
          <h4>Tools</h4>
          <ul>
            <li><a href="/cpt-code-search">CPT Code Search</a></li>
            <li><a href="/claim-denial-codes">Claim Denial Codes</a></li>
            <li><a href="/cpt-code-search">Rx Savings</a></li>
            <li><a href="/providers">National Provider Search</a></li>
            <li><a href="/audit">Medical Bill Audit</a></li>
            <li><a href="/blog">Blog</a></li>
          </ul>
        </div>"""

def update_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    new_content = re.sub(nav_links_pattern, nav_replacement, content)
    new_content = re.sub(footer_tools_pattern, footer_replacement, new_content)

    # Active link logic setup
    # Determine which is active by filename
    base = os.path.basename(filepath)
    link_map = {
        'index.html': 'href="/"',
        'cpt-code-search.html': 'href="/cpt-code-search"',
        'claim-denial-codes.html': 'href="/claim-denial-codes"',
        'audit.html': 'href="/audit"',
        'providers.html': 'href="/providers"',
        'blog.html': 'href="/blog"',
        'blog-post.html': 'href="/blog"'
    }
    
    if base in link_map:
        active_target = link_map[base]
        # Regex to add class="active"
        new_content = re.sub(r'<a ' + active_target + r'>(.*?)</a>', r'<a ' + active_target + r' class="active">\1</a>', new_content, 1)

    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {filepath}")

for root, dirs, files in os.walk('.'):
    for fn in files:
        if fn.endswith('.html'):
            update_file(os.path.join(root, fn))
