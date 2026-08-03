import os
import re

root_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp"
skip_dirs = {'node_modules', '.git', 'brain', 'scratch', 'popup'}

fixed_count = 0

# Mapping of relative src/href to root-relative
replacements = [
    ('src="blog_handler.js"', 'src="/blog_handler.js"'),
    ('src="icons/logo.png', 'src="/icons/logo.png'),
    ('src="tabs/denials/denials.js"', 'src="/tabs/denials/denials.js"'),
    ('src="tabs/codesearch/codesearch.js"', 'src="/tabs/codesearch/codesearch.js"'),
    ('src="tabs/providers/providers.js"', 'src="/tabs/providers/providers.js"'),
    ('src="tabs/rxscout/rxscout.js"', 'src="/tabs/rxscout/rxscout.js"'),
    ('src="mock-exam-step3-config.js', 'src="/mock-exam-step3-config.js'),
    ('src="mock-exam-config.js', 'src="/mock-exam-config.js'),
    ('src="medical-exam-simulator-step3.js', 'src="/medical-exam-simulator-step3.js'),
    ('href="images/hero-bg.webp"', 'href="/images/hero-bg.webp"'),
]

for dirpath, dirnames, filenames in os.walk(root_dir):
    dirnames[:] = [d for d in dirnames if d not in skip_dirs]
    for fname in filenames:
        if not fname.endswith('.html'):
            continue
        fpath = os.path.join(dirpath, fname)
        with open(fpath, encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        new_content = content
        for old, new in replacements:
            new_content = new_content.replace(old, new)
            
        if new_content != content:
            with open(fpath, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"Fixed asset paths in: {os.path.relpath(fpath, root_dir)}")
            fixed_count += 1

print(f"\nSuccessfully fixed {fixed_count} files!")
