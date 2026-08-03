content = open(r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html", encoding="utf-8").read()

# Move supabase + core.js + lucide from <head> to just before </body>
# These 3 lines need to be removed from <head>
remove_lines = [
    '<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>\n',
    '<script src="/core.js"></script>\n',
    '<script src="https://unpkg.com/lucide@latest"></script>\n',
]

for line in remove_lines:
    content = content.replace(line, '', 1)

# Insert them just before </body>
insert_block = (
    '<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>\n'
    '<script src="/core.js"></script>\n'
    '<script src="https://unpkg.com/lucide@latest"></script>\n'
)

content = content.replace('</body>', insert_block + '</body>', 1)

open(r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html", "w", encoding="utf-8").write(content)

# Verify positions
core_pos   = content.rfind('src="/core.js"')
lucide_pos = content.rfind("unpkg.com/lucide")
body_close = content.rfind("</body>")
inline_pos = content.rfind("<script>")  # main app script

print("core.js position from end:", len(content) - core_pos)
print("lucide position from end:", len(content) - lucide_pos)
print("</body> position from end:", len(content) - body_close)
print("Main inline script before supabase/core/lucide:", inline_pos < core_pos)
print("core.js after main inline script:", core_pos > inline_pos)
