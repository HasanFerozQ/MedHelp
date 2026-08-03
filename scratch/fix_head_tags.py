import os
import re

root_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp"

html_files = []
for root, dirs, files in os.walk(root_dir):
    if "node_modules" in root or ".git" in root or "brain" in root:
        continue
    for file in files:
        if file.endswith(".html") and not file.endswith(".bak"):
            html_files.append(os.path.join(root, file))

print(f"Found {len(html_files)} HTML files to optimize.")

for filepath in html_files:
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    # Match head content
    head_match = re.search(r"<head\b[^>]*>(.*?)</head>", content, re.DOTALL | re.IGNORECASE)
    if not head_match:
        continue

    head_inner = head_match.group(1)

    # Check if meta charset is already first
    stripped_head = head_inner.strip()
    if stripped_head.startswith('<meta charset='):
        # Already first in head
        pass
    else:
        # Extract <meta charset="..."> if exists
        charset_match = re.search(r'<meta\s+charset=["\'][^"\']+["\'][^>]*>', head_inner, re.IGNORECASE)
        charset_tag = charset_match.group(0) if charset_match else '<meta charset="UTF-8">'
        
        # Remove original charset tag if present
        if charset_match:
            head_inner = head_inner[:charset_match.start()] + head_inner[charset_match.end():]

        # Extract viewport tag if exists
        viewport_match = re.search(r'<meta\s+name=["\']viewport["\'][^>]*>', head_inner, re.IGNORECASE)
        viewport_tag = viewport_match.group(0) if viewport_match else '<meta name="viewport" content="width=device-width, initial-scale=1.0">'
        if viewport_match:
            head_inner = head_inner[:viewport_match.start()] + head_inner[viewport_match.end():]

        # Put charset and viewport at the top of head
        new_head_inner = f"\n  {charset_tag}\n  {viewport_tag}\n" + head_inner.lstrip()

        new_content = content[:head_match.start(1)] + new_head_inner + content[head_match.end(1):]
        with open(filepath, "w", encoding="utf-8") as f:
            f.write(new_content)
        print(f"Fixed head order in: {os.path.basename(filepath)}")

print("Head tag reordering completed!")
