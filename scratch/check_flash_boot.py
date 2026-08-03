content = open(r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html", encoding="utf-8").read()

# Find the inline app script start
flash_data_pos = content.rfind('const FLASH_DATA')
# Show 200 chars before and 400 chars after to see boot sequence
print("=== Context around FLASH_DATA script tag ===")
print(content[flash_data_pos-300:flash_data_pos+200])
print()
# Show the very end of the file (last 1200 chars)
print("=== End of file (last 1200 chars) ===")
print(content[-1200:])
