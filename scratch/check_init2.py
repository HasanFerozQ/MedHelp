content = open(r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html", encoding="utf-8").read()

# Try multiple ways to find init
for pattern in ['async function init()', 'function init()', 'const init =', 'init = async']:
    pos = content.rfind(pattern)
    if pos != -1:
        print(f"Found '{pattern}' at byte {pos}")
        print(content[pos:pos+800])
        print()
        break
else:
    print("No standard init function found. Searching for init call...")
    pos = content.rfind('init();')
    print(f"init() call at byte: {pos}")
    # Show context before the call
    print(content[pos-3000:pos+50])
