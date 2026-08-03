import os
import re

root_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp"
skip_dirs = {'node_modules', '.git', 'brain', 'scratch'}

relative_matches = []

for dirpath, dirnames, filenames in os.walk(root_dir):
    dirnames[:] = [d for d in dirnames if d not in skip_dirs]
    for fname in filenames:
        if not fname.endswith('.html'):
            continue
        fpath = os.path.join(dirpath, fname)
        with open(fpath, encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        # Check src="relative" or href="relative"
        srcs = re.findall(r'src=["\']([^"\'\s]+)["\']', content)
        hrefs = re.findall(r'href=["\']([^"\'\s]+)["\']', content)
        
        issues = []
        for s in srcs:
            if not s.startswith(('http', '//', '/', 'data:', '#', 'javascript:')):
                issues.append(f'src="{s}"')
        for h in hrefs:
            if not h.startswith(('http', '//', '/', 'data:', '#', 'javascript:', 'mailto:')):
                issues.append(f'href="{h}"')
                
        if issues:
            relative_matches.append((fpath, issues))

print(f"Found {len(relative_matches)} files with relative assets:")
for fpath, issues in relative_matches:
    print(f"\nFile: {os.path.relpath(fpath, root_dir)}")
    for issue in issues[:10]:
        print(f"   {issue}")
