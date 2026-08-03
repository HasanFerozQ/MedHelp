with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\blog.html", encoding="utf-8") as f:
    b_html = f.read()

with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\blog-post.html", encoding="utf-8") as f:
    bp_html = f.read()

def print_inline_scripts(html, name):
    print(f"=== INLINE SCRIPTS IN {name} ===")
    import re
    scripts = re.findall(r'<script>(.*?)</script>', html, re.DOTALL)
    for s in scripts:
        if 'loadBlog' in s or 'fetchBlogs' in s or 'renderPost' in s or 'slug' in s or 'manifest' in s:
            print(s[:1500])
            print("-" * 50)

print_inline_scripts(b_html, "blog.html")
print_inline_scripts(bp_html, "blog-post.html")
