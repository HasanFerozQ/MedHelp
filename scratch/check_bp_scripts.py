with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\blog-post.html", encoding="utf-8") as f:
    bp_html = f.read()

import re
scripts = re.findall(r'<script>(.*?)</script>', bp_html, re.DOTALL)
for i, s in enumerate(scripts):
    print(f"=== SCRIPT {i} in blog-post.html ===")
    print(s[:2000])
