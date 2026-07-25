"""
Remove orphaned flashcard objects from flash-cards.html.
These are raw { q:..., a:... } objects sitting directly in the usmle2 array
after the Dermatology topic closes (line 32982), up through line 33052.
Lines 32983 through 33053 are deleted.
The closing bracket on 33053 stays ONLY as the closing `]` for usmle2.
"""
import re

FILE = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"

with open(FILE, "r", encoding="utf-8") as f:
    lines = f.readlines()

total = len(lines)
print(f"Total lines before: {total}")

# Lines are 1-indexed in the editor; Python list is 0-indexed.
# We want to DELETE lines 32983–33052 (1-indexed), i.e. indices 32982–33051.
# Line 33053 contains `      ],`  which closes the usmle2 array — keep it.

del_start = 32982  # 0-indexed (line 32983 in 1-indexed)
del_end   = 33051  # 0-indexed inclusive (line 33052 in 1-indexed)

deleted = lines[del_start:del_end+1]
print(f"Deleting {len(deleted)} lines ({del_start+1}–{del_end+1}).")
print(f"First deleted line: {deleted[0][:80]!r}")
print(f"Last  deleted line: {deleted[-1][:80]!r}")

# Verify the line just before the delete block (should close Dermatology topic)
print(f"Line before delete: {lines[del_start-1][:80]!r}")
# Verify line after the delete block (should be `      ],` closing usmle2)
print(f"Line after  delete: {lines[del_end+1][:80]!r}")

new_lines = lines[:del_start] + lines[del_end+1:]
print(f"Total lines after:  {len(new_lines)}")

with open(FILE, "w", encoding="utf-8") as f:
    f.writelines(new_lines)

print("Done!")
