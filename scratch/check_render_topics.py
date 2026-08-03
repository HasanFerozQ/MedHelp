content = open(r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html", encoding="utf-8").read()

pos = content.rfind('function renderTopics()')
print(content[pos:pos+3000])
