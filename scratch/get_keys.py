
import os
import sys

# Since I don't have the db keys, I'll look for where they are defined in core.js
with open('core.js', 'r', encoding='utf-8') as f:
    content = f.read()
    # Look for supabaseUrl and supabaseKey
    import re
    url_match = re.search(r"const\s+supabaseUrl\s*=\s*['\"](.*?)['\"]", content)
    key_match = re.search(r"const\s+supabaseKey\s*=\s*['\"](.*?)['\"]", content)
    
    if url_match and key_match:
        url = url_match.group(1)
        key = key_match.group(1)
        print(f"URL: {url}")
        print(f"Key: {key}")
    else:
        print("Keys not found in core.js")
