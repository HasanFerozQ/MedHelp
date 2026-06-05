filepath = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"

with open(filepath, 'r', encoding='utf-8') as f:
    lines = f.readlines()

print(f"Total lines: {len(lines)}")

# First half: lines 1 to 37724 (0-indexed: 0 to 37723)
half1 = lines[0:37724]
# Second half: lines 37725 to 75429 (0-indexed: 37724 to 75428)
# Let's adjust for the fact that the second half starts with a broken HTML tag at 37724 (line 37725)
# "en" data-theme="dark">
# which is the rest of: <html lang="en" data-theme="dark">
# Let's prepend "<html lang=" to line 37724 (index 37724) to see if they match.
half2_mod = [lines[0], '<html lang=' + lines[37724]] + lines[37725:]

print(f"Half 1 lines: {len(half1)}")
print(f"Half 2 lines: {len(half2_mod)}")

# Let's write them out and run a quick diff or check line-by-line
diff_count = 0
for i in range(min(len(half1), len(half2_mod))):
    if half1[i] != half2_mod[i]:
        diff_count += 1
        if diff_count <= 10:
            print(f"Diff at line {i+1}:")
            print(f"  Half 1: {repr(half1[i])}")
            print(f"  Half 2: {repr(half2_mod[i])}")

print(f"Total diff lines: {diff_count}")
