with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\blog.html", encoding="utf-8") as f:
    blog_html = f.read()

with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\blog-post.html", encoding="utf-8") as f:
    blog_post_html = f.read()

print("=== BLOG.HTML SCRIPT REFS ===")
import re
for m in re.finditer(r'<script.*?</script>', blog_html, re.DOTALL):
    print(m.group(0)[:150])

print("\n=== BLOG-POST.HTML SCRIPT REFS ===")
for m in re.finditer(r'<script.*?</script>', blog_post_html, re.DOTALL):
    print(m.group(0)[:150])
