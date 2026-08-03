with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\blog.html", encoding="utf-8") as f:
    b_html = f.read()

with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\blog-post.html", encoding="utf-8") as f:
    bp_html = f.read()

import re

def check_relative_assets(html, filename):
    print(f"=== RELATIVE ASSETS IN {filename} ===")
    srcs = re.findall(r'src=["\']([^"\'\s]+)["\']', html)
    hrefs = re.findall(r'href=["\']([^"\'\s]+)["\']', html)
    
    for s in srcs:
        if not s.startswith('http') and not s.startswith('//') and not s.startswith('/') and not s.startswith('data:'):
            print(f"  [src] {s}")
            
    for h in hrefs:
        if not h.startswith('http') and not h.startswith('//') and not h.startswith('/') and not h.startswith('#') and not h.startswith('mailto:') and not h.startswith('javascript:'):
            print(f"  [href] {h}")

check_relative_assets(b_html, "blog.html")
check_relative_assets(bp_html, "blog-post.html")
