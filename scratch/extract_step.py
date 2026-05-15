import json

log_path = r"C:\Users\Hasan-PC\.gemini\antigravity\brain\928c3cc7-8322-4f1b-a646-32216c20859f\.system_generated\logs\overview.txt"
target_step = 375

with open(log_path, 'r', encoding='utf-8') as f:
    for line in f:
        try:
            data = json.loads(line)
            if data.get("step_index") == target_step:
                print(data.get("content"))
                break
        except:
            continue
