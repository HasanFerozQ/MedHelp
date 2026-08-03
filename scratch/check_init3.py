content = open(r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html", encoding="utf-8").text if False else open(r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html", encoding="utf-8").read()

# Get the full init function (from position to end of file)
init_pos = content.rfind('function init()')
print(content[init_pos:init_pos+4000])
