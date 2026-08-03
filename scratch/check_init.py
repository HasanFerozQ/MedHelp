content = open(r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html", encoding="utf-8").read()

# Find async function init()
init_pos = content.rfind('async function init()')
print("=== init() function (first 2000 chars) ===")
print(content[init_pos:init_pos+2000])
