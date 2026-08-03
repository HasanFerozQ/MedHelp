with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\blog-post.html", encoding="utf-8") as f:
    bp_html = f.read()

import re
scripts = re.findall(r'<script>(.*?)</script>', bp_html, re.DOTALL)
print(scripts[5][1000:])
