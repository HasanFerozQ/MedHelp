import json

log_path = r'C:\Users\Hasan-PC\antigravity\brain\928c3cc7-8322-4f1b-a646-32216c20859f\.system_generated\logs\overview.txt'
# Wait, I need to make sure the path is correct. 
# C:\Users\Hasan-PC\.gemini\antigravity\brain\928c3cc7-8322-4f1b-a646-32216c20859f\.system_generated\logs\overview.txt

log_path = r'C:\Users\Hasan-PC\.gemini\antigravity\brain\928c3cc7-8322-4f1b-a646-32216c20859f\.system_generated\logs\overview.txt'

try:
    with open(log_path, 'r', encoding='utf-8') as f:
        for line in f:
            try:
                data = json.loads(line)
                if data.get('step_index') == 375:
                    content = data.get('content', '')
                    with open('scratch/blog_content_raw.txt', 'w', encoding='utf-8') as out:
                        out.write(content)
                    print("Successfully extracted content to scratch/blog_content_raw.txt")
                    break
            except json.JSONDecodeError:
                continue
except Exception as e:
    print(f"Error: {e}")
