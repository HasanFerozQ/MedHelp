import os
import re

root_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp"

skip_dirs = {'node_modules', '.git', 'brain', 'scratch'}
broken_files = []

for dirpath, dirnames, filenames in os.walk(root_dir):
    dirnames[:] = [d for d in dirnames if d not in skip_dirs]
    for fname in filenames:
        if not fname.endswith('.html'):
            continue
        fpath = os.path.join(dirpath, fname)
        # Skip large flash-cards.html to save time  
        if fname == 'flash-cards.html':
            continue
        with open(fpath, encoding='utf-8', errors='ignore') as f:
            content = f.read()
        issues = []
        if 'src="core.js"' in content:
            issues.append('core.js relative')
        if 'href="styles.css"' in content:
            issues.append('styles.css relative')
        if 'href="icons/favicon' in content:
            issues.append('favicon relative')
        if issues:
            broken_files.append((fname, issues))

if broken_files:
    print("Files with broken relative paths:")
    for fname, issues in broken_files:
        print(f"  - {fname}: {', '.join(issues)}")
    
    # Auto-fix them
    print("\nAuto-fixing...")
    for dirpath, dirnames, filenames in os.walk(root_dir):
        dirnames[:] = [d for d in dirnames if d not in skip_dirs]
        for fname in filenames:
            if not fname.endswith('.html') or fname == 'flash-cards.html':
                continue
            fpath = os.path.join(dirpath, fname)
            with open(fpath, encoding='utf-8', errors='ignore') as f:
                content = f.read()
            new_content = content
            new_content = new_content.replace('src="core.js"', 'src="/core.js"')
            new_content = new_content.replace('href="styles.css"', 'href="/styles.css"')
            new_content = new_content.replace('href="icons/favicon.ico', 'href="/icons/favicon.ico')
            if new_content != content:
                with open(fpath, 'w', encoding='utf-8') as f:
                    f.write(new_content)
                print(f"  Fixed: {fname}")
    print("Done!")
else:
    print("All files have correct root-relative asset paths!")
