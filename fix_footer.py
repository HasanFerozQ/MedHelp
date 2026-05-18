import os
import glob

def fix_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    changed = False

    # 1. Add Medical Calculator to Free Tools if missing
    if '<li><a href="/medical-calculator">Medical Calculator</a></li>' not in content:
        # Look for the Free Tools list. We can insert it after Provider Search.
        target1 = '<li><a href="/providers">Provider Search</a></li>'
        replacement1 = target1 + '\n              <li><a href="/medical-calculator">Medical Calculator</a></li>'
        if target1 in content:
            content = content.replace(target1, replacement1)
            changed = True

    # 2. Add Medical Exam Mastery to Services if missing
    target2 = '<li><a href="/medical-exam-preparation" style="color:var(--accent); font-weight:700;">Medical Exam Mastery</a></li>'
    if target2 not in content:
        # Insert after Human Bill Negotiation
        # Since Human Bill Negotiation line has SVG, let's find Patient Blog and insert before it
        # Sometimes there's a blank line before Patient Blog.
        target_blog = '<li><a href="/blog">Patient Blog</a></li>'
        replacement_blog = target2 + '\n              ' + target_blog
        if target_blog in content:
            content = content.replace(target_blog, replacement_blog)
            changed = True

    if changed:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Updated {filepath}")

for d in ['.', 'blog']:
    for filepath in glob.glob(os.path.join(d, '*.html')):
        fix_file(filepath)
