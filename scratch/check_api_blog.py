import os

api_blog_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\api\blog.js"
if os.path.exists(api_blog_path):
    with open(api_blog_path, encoding="utf-8") as f:
        print("=== api/blog.js ===")
        print(f.read())
else:
    print("api/blog.js DOES NOT EXIST!")

print("\nFiles in api directory:")
api_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp\api"
if os.path.exists(api_dir):
    for f in os.listdir(api_dir):
        print("  -", f)
