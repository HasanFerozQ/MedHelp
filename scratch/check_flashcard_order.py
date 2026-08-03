content = open(r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html", encoding="utf-8").read()

core_pos    = content.find('src="/core.js"')
lucide_pos  = content.find("unpkg.com/lucide")
supabase_pos= content.find("supabase-js")
inline_pos  = content.rfind("<script>")  # last <script> = main inline app script

print(f"core.js at byte: {core_pos}")
print(f"lucide at byte:  {lucide_pos}")
print(f"supabase at byte:{supabase_pos}")
print(f"main app inline script at byte: {inline_pos}")
print()
print(f"core.js before inline app: {core_pos < inline_pos}")
print(f"lucide before inline app:  {lucide_pos < inline_pos}")
print(f"supabase before inline app:{supabase_pos < inline_pos}")

# Check if MediHelp is referenced in inline script
app_script = content[inline_pos:]
print()
print(f"MediHelp referenced in inline script: {'MediHelp' in app_script}")
print(f"lucide.createIcons called: {'lucide.createIcons' in app_script}")
