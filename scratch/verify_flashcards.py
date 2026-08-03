import os
import re

path = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"

with open(path, encoding="utf-8") as f:
    content = f.read()

size_mb = os.path.getsize(path) / (1024 * 1024)

print("=" * 60)
print("FLASHCARDS AUDIT & VERIFICATION")
print("=" * 60)
print(f"1. File size: {size_mb:.2f} MB (Expected: > 7MB)")

print(f"2. /styles.css root-relative: {'/styles.css' in content}")
print(f"3. /core.js root-relative:   {'/core.js' in content}")
print(f"4. /icons/favicon root-rel:  {'/icons/favicon.ico' in content}")

# Check script positions
supabase_pos = content.rfind("supabase-js@2")
core_pos     = content.rfind('src="/core.js"')
lucide_pos   = content.rfind("unpkg.com/lucide")
flash_data   = content.rfind("const FLASH_DATA = {")
body_close   = content.rfind("</body>")

print("\nScript Order Checks:")
print(f"  supabase BEFORE flash_data: {supabase_pos < flash_data}")
print(f"  core.js BEFORE flash_data:  {core_pos < flash_data}")
print(f"  lucide BEFORE flash_data:   {lucide_pos < flash_data}")
print(f"  flash_data BEFORE </body>:  {flash_data < body_close}")

# Check relative images or links in flash-cards.html
srcs = re.findall(r'src=["\']([^"\'\s]+)["\']', content)
rel_srcs = [s for s in srcs if not s.startswith(('http', '//', '/', 'data:', '#'))]
print(f"\nRelative src attributes remaining in flash-cards.html: {rel_srcs}")

print("=" * 60)
