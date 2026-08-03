content = open(r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html", encoding="utf-8").read()

pos = content.rfind('const topicGrid')
if pos == -1:
    pos = content.rfind('topicGrid =')

print(content[pos-200:pos+1000])
