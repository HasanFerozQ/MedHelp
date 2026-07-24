import json, re

with open('data.js', encoding='utf-8') as f:
    data = f.read()

print('File size:', len(data), 'bytes')
match = re.match(r'const FLASH_DATA = (\{.*\});?\s*$', data, re.DOTALL)
if not match:
    print('FAILED TO PARSE - regex did not match')
else:
    print('Regex matched, parsing JSON...')
    try:
        flash = json.loads(match.group(1))
    except json.JSONDecodeError as e:
        print('JSON error:', e)
        exit(1)
    
    usmle2 = flash.get('usmle2', [])
    print(f'Total usmle2 topics: {len(usmle2)}')
    for item in usmle2:
        if item.get('section') == 'Internal Medicine':
            topic = item.get('topic', 'Unknown')
            count = len(item.get('cards', []))
            print(f'  {topic}: {count} cards')
