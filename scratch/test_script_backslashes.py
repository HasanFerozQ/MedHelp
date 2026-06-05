import os

target = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\test_backslashes.txt"
with open(target, "w") as f:
    # We want to write exactly 4 backslashes to the file
    f.write("test: $\\\\text{formula}$")

with open(target, "r") as f:
    content = f.read()
    print("FILE CONTENT:", content)
    print("NUMBER OF BACKSLASHES:", content.count('\\'))
