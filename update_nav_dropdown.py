import os

old_nav = """<div class="nav-links">
        <a href="/">Home</a>
        <a href="/cpt-code-search">CPT Code Search</a>
        <a href="/claim-denial-codes">Claim Denial Codes</a>
        <a href="/audit">Medical Bill Audit</a>
        <a href="/providers">National Provider Search</a>
        <a href="/blog">Blog</a>
      </div>"""

# Since active state varies, I will replace by stripping class="active" conceptually,
# or better, just loop and remove any `class="active"` first, then do literal replacement, then add it back!

def update_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Normalize active links back to clean state
    temp_content = content.replace(' class="active">', '>')
    
    # We also might have an issue with whitespace. A simple regex for the whole block is easier if carefully crafted.
    import re
    # Match <div class="nav-links"> up to the next div closing that is followed by <div class="nav-actions">
    nav_pattern = re.compile(r'<div class="nav-links">.*?</div>\s*<div class="nav-actions">', re.DOTALL)
    
    new_nav = """<div class="nav-links">
        <a href="/">Home</a>
        <a href="/audit">Medical Bill Audit</a>
        <a href="/cpt-code-search">CPT Codes</a>
        <a href="/claim-denial-codes">Denial Codes</a>
        <div class="nav-dropdown">
          <div class="nav-dropdown-btn">More ▼</div>
          <div class="nav-dropdown-menu">
            <a href="/providers">National Provider Search</a>
            <a href="/blog">Blog</a>
          </div>
        </div>
      </div>
      <div class="nav-actions">"""
    
    new_content = re.sub(nav_pattern, new_nav, content)

    # Re-apply active state based on file
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
        # Only replace the first match of the exact target to add class="active"
        new_content = re.sub(r'<a ' + active_target + r'>(.*?)</a>', r'<a ' + active_target + r' class="active">\1</a>', new_content, 1)

    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {filepath}")

for root, dirs, files in os.walk('.'):
    if '.git' in root: continue
    for fn in files:
        if fn.endswith('.html'):
            update_file(os.path.join(root, fn))
