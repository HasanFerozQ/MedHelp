import sys
sys.stdout.reconfigure(encoding='utf-8')

with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\blog-post.html", encoding="utf-8") as f:
    bp_html = f.read()

import re
scripts = re.findall(r'<script>(.*?)</script>', bp_html, re.DOTALL)
load_post_idx = scripts[5].find('async function loadPost()')
print(scripts[5][load_post_idx:load_post_idx+1500])
