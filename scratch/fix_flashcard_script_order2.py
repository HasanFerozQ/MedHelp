content = open(r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html", encoding="utf-8").read()

# The correct final order at end of body should be:
# 1. <script src="supabase">
# 2. <script src="/core.js">
# 3. <script src="lucide">
# 4. <script> ... FLASH_DATA + app logic ... </script>
# 5. </body>

# Currently after our last fix:
# <script> FLASH_DATA + app </script>    <-- inline at ~line 1073
# <script src="supabase">               <-- we just moved to end of body
# <script src="/core.js">
# <script src="lucide">
# </body>

# We need to move supabase/core/lucide BEFORE the inline app script.

# Step 1: Remove the 3 end-of-body script tags we just added
remove_block = (
    '<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>\n'
    '<script src="/core.js"></script>\n'
    '<script src="https://unpkg.com/lucide@latest"></script>\n'
    '</body>'
)
insert_without_body = (
    '<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>\n'
    '<script src="/core.js"></script>\n'
    '<script src="https://unpkg.com/lucide@latest"></script>\n'
)
# Find the last occurrence of the inline <script> that contains FLASH_DATA
flash_data_marker = '    const FLASH_DATA = {'
inline_script_start = content.rfind('<script>\n' + flash_data_marker)
if inline_script_start == -1:
    inline_script_start = content.rfind('<script>')

print(f"Inline app script starts at byte: {inline_script_start}")

# Remove the 3 lines from end of body first
content = content.replace(remove_block, '</body>', 1)

# Now insert supabase/core/lucide just before the inline app script
content = content[:inline_script_start] + insert_without_body + content[inline_script_start:]

open(r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html", "w", encoding="utf-8").write(content)

# Verify
supabase_last = content.rfind("supabase-js@2")
core_last     = content.rfind('src="/core.js"')
lucide_last   = content.rfind("unpkg.com/lucide")
inline_last   = content.rfind('<script>\n    const FLASH_DATA')
body_close    = content.rfind("</body>")

print(f"\nFinal order check:")
print(f"  supabase at: {supabase_last}")
print(f"  core.js at:  {core_last}")
print(f"  lucide at:   {lucide_last}")
print(f"  inline app at: {inline_last}")
print(f"  </body> at:  {body_close}")
print()
print(f"  supabase BEFORE inline: {supabase_last < inline_last}")
print(f"  core.js BEFORE inline:  {core_last < inline_last}")
print(f"  lucide BEFORE inline:   {lucide_last < inline_last}")
print(f"  inline BEFORE </body>:  {inline_last < body_close}")
