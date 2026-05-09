import os
import glob
import re

root_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp"

# 1. Rename audit.html to medical-bill-audit.html
old_file = os.path.join(root_dir, "audit.html")
new_file = os.path.join(root_dir, "medical-bill-audit.html")
if os.path.exists(old_file):
    os.rename(old_file, new_file)
    print("Renamed audit.html to medical-bill-audit.html")

# 2. Update all HTML and XML files
files_to_check = glob.glob(os.path.join(root_dir, "*.html")) + glob.glob(os.path.join(root_dir, "*.xml"))
for filepath in files_to_check:
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    new_content = content.replace('href="/audit"', 'href="/medical-bill-audit"')
    new_content = new_content.replace('href="https://www.medihelp.live/audit"', 'href="https://www.medihelp.live/medical-bill-audit"')
    
    # Just in case there are specific sitemap formats
    new_content = new_content.replace('<loc>https://www.medihelp.live/audit</loc>', '<loc>https://www.medihelp.live/medical-bill-audit</loc>')

    if new_content != content:
        with open(filepath, "w", encoding="utf-8") as f:
            f.write(new_content)
        print(f"Updated links in: {os.path.basename(filepath)}")

# 3. Update update_navbar.py script
script_path = os.path.join(root_dir, "scratch", "update_navbar.py")
if os.path.exists(script_path):
    with open(script_path, "r", encoding="utf-8") as f:
        content = f.read()
    
    new_content = content.replace("'audit.html':                    '/audit',", "'medical-bill-audit.html':       '/medical-bill-audit',")
    new_content = new_content.replace('href="/audit"', 'href="/medical-bill-audit"')
    new_content = new_content.replace('active_page != "/audit"', 'active_page != "/medical-bill-audit"')
    
    if new_content != content:
        with open(script_path, "w", encoding="utf-8") as f:
            f.write(new_content)
        print("Updated scratch/update_navbar.py")

print("Done.")
