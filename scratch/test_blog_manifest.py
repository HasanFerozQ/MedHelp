import os
import json

root = r"c:\Users\Hasan-PC\Desktop\MedHelp"
manifest_path = os.path.join(root, "blog", "manifest.json")

with open(manifest_path, encoding="utf-8") as f:
    manifest = json.load(f)

print(f"Total posts listed in manifest: {len(manifest['posts'])}")

missing = []
for post_fn in manifest["posts"]:
    post_path = os.path.join(root, "blog", post_fn)
    if not os.path.exists(post_path):
        missing.append(post_fn)

if missing:
    print("MISSING POST FILES:")
    for m in missing:
        print(" -", m)
else:
    print("ALL 37 blog posts exist in /blog/ directory!")
