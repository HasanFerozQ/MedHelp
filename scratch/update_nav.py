import os, glob

html_files = glob.glob('*.html') + glob.glob('calculators/*.html')

updated_count = 0
for filepath in html_files:
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
    except Exception as e:
        print(f"Skipping {filepath} due to read error: {e}")
        continue
    
    if 'global-health-statistics' in content:
        continue
    
    target = '<div class="nav-dropdown-menu">\n            <a href="/rx-savings">'
    replacement = '<div class="nav-dropdown-menu">\n            <a href="/global-health-statistics" style="color:var(--accent); font-weight:700;">Global Health Statistics</a>\n            <a href="/rx-savings">'
    
    if target in content:
        new_content = content.replace(target, replacement)
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        updated_count += 1
    else:
        # Search for More ▼
        pos = content.find('More ▼')
        if pos != -1:
            menu_pos = content.find('<div class="nav-dropdown-menu">', pos)
            if menu_pos != -1:
                insert_pos = menu_pos + len('<div class="nav-dropdown-menu">')
                new_content = content[:insert_pos] + '\n            <a href="/global-health-statistics" style="color:var(--accent); font-weight:700;">Global Health Statistics</a>' + content[insert_pos:]
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(new_content)
                updated_count += 1

print(f"Updated navigation in {updated_count} HTML files!")
