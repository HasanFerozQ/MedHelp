import os

manifest_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\blog\manifest.json"
if os.path.exists(manifest_path):
    with open(manifest_path, encoding="utf-8") as f:
        print("=== blog/manifest.json ===")
        print(f.read())
else:
    print("blog/manifest.json DOES NOT EXIST!")

blog_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp\blog"
print("\nFiles in blog directory:")
if os.path.exists(blog_dir):
    for f in os.listdir(blog_dir):
        print("  -", f)
