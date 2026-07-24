import re

with open('flash-cards.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Find the usmle2 section in the HTML
# It appears as 'usmle2': [ ... ]
# Count occurrences of { q: in each topic block
usmle2_start = content.find("'usmle2': [")
if usmle2_start == -1:
    print("usmle2 not found!")
    exit()

print(f"usmle2 section starts at char: {usmle2_start}")
print(f"Line number: {content[:usmle2_start].count(chr(10)) + 1}")

# Show the topics and their card counts by looking for section/topic patterns
# Find all topic blocks between usmle2_start and next top-level key
# Look for 'usmle3' or end of array
usmle2_end = content.find("'usmle3'", usmle2_start)
if usmle2_end == -1:
    usmle2_end = content.find('"usmle3"', usmle2_start)
if usmle2_end == -1:
    # find closing of the array
    usmle2_end = usmle2_start + 200000  # just search a big chunk

usmle2_block = content[usmle2_start:usmle2_end]

# Count topics
topics = re.findall(r'topic:\s*["\']([^"\']+)["\']', usmle2_block)
print(f"\nTopics found in HTML usmle2: {topics}")

# Count cards per topic - look for topic blocks
import re

# Find each topic and count { q: patterns before next topic
topic_pattern = re.compile(r'topic:\s*["\']([^"\']+)["\']')
card_pattern = re.compile(r'\{\s*q:')

# Split by topics
topic_positions = [(m.start(), m.group(1)) for m in topic_pattern.finditer(usmle2_block)]
print(f"\nCard counts per topic:")
for i, (pos, topic_name) in enumerate(topic_positions):
    if i + 1 < len(topic_positions):
        chunk = usmle2_block[pos:topic_positions[i+1][0]]
    else:
        chunk = usmle2_block[pos:]
    card_count = len(card_pattern.findall(chunk))
    print(f"  {topic_name}: {card_count} cards")
