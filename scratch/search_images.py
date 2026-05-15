import os

log_path = r"C:\Users\Hasan-PC\.gemini\antigravity\brain\928c3cc7-8322-4f1b-a646-32216c20859f\.system_generated\logs\overview.txt"
extensions = [".png", ".jpg", ".jpeg", ".webp"]

with open(log_path, 'r', encoding='utf-8') as f:
    for line in f:
        line_lower = line.lower()
        if any(ext in line_lower for ext in extensions):
            if "artera" in line_lower or "breast" in line_lower:
                print(line.strip())
