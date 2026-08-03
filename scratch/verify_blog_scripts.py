import re

def print_head_and_body_scripts(filename):
    with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\\" + filename, encoding="utf-8") as f:
        html = f.read()
    print(f"==================== {filename} ====================")
    scripts = re.findall(r'<script.*?>.*?</script>', html, re.DOTALL)
    for s in scripts:
        # print first 100 chars of each script
        print("  -", s[:120].replace('\n', ' '))

print_head_and_body_scripts("blog.html")
print_head_and_body_scripts("blog-post.html")
