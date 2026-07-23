import sys

with open('bad_file.txt', 'r', encoding='utf-8') as f:
    bad_lines = f.readlines()

# Guide starts at line 565 and ends at line 898 (inclusive) in bad_file.txt
guide_lines = bad_lines[564:898]

with open('medical-exam-semester.html', 'r', encoding='utf-8') as f:
    orig_lines = f.readlines()

# The old SEO block in medical-exam-semester.html starts at line 562 and ends at line 599 (inclusive)
new_lines = orig_lines[:561] + guide_lines + orig_lines[599:]

with open('medical-exam-semester.html', 'w', encoding='utf-8') as f:
    f.writelines(new_lines)

print("Replacement successful")
