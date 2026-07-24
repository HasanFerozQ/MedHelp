import json
import re

with open('data.js', 'r', encoding='utf-8') as f:
    data = f.read()

# The JS file might define a global variable, so it's not pure JSON.
# I'll extract lines with "section": "Internal Medicine" and the following "topic": ...
import re
lines = data.split('\n')
in_im = False
topics = []
count = 0
for line in lines:
    if '"section": "Internal Medicine"' in line:
        in_im = True
    elif in_im and '"topic":' in line:
        topic_name = re.search(r'"topic":\s*"([^"]+)"', line).group(1)
        topics.append(topic_name)
        in_im = False

print(topics)
