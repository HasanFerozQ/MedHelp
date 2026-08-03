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

print(f"Found {len(html_files)} HTML files to restructure head tags.")

for filepath in html_files:
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    head_match = re.search(r"<head\b[^>]*>(.*?)</head>", content, re.DOTALL | re.IGNORECASE)
    if not head_match:
        continue

    head_inner = head_match.group(1)

    # Separate elements inside head into non-script metadata vs script elements
    # Tags that should be at top of head:
    # <meta ...>, <title>...</title>, <link ...>, <base ...>
    # Script elements: <script ...>...</script>
    
    # Extract all <script>...</script> blocks
    script_blocks = []
    def script_replacer(match):
        script_blocks.append(match.group(0))
        return ""

    head_no_scripts = re.sub(r'<script\b[^>]*>.*?</script>', script_replacer, head_inner, flags=re.DOTALL | re.IGNORECASE)

    # Clean up blank lines in head_no_scripts
    clean_meta = "\n".join([line for line in head_no_scripts.splitlines() if line.strip()])
    clean_scripts = "\n".join([script.strip() for script in script_blocks if script.strip()])

    # Combine: All metadata first, followed by script blocks
    new_head_inner = f"\n  {clean_meta}\n  {clean_scripts}\n"

    new_content = content[:head_match.start(1)] + new_head_inner + content[head_match.end(1):]

    with open(filepath, "w", encoding="utf-8") as f:
        f.write(new_content)

    print(f"Restructured head in: {os.path.basename(filepath)}")

print("Head restructuring completed successfully for all files!")
