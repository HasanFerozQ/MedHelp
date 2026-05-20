with open(r"C:\Users\Hasan-PC\.gemini\antigravity\brain\3f836667-9ba4-49be-ad28-0e6c0dcf90fb\.system_generated\logs\overview.txt", "r", encoding="utf-8") as f:
    for idx, line in enumerate(f):
        if "admin" in line.lower() or "panel" in line.lower() or "supabase.co" in line.lower():
            print(f"Line {idx+1}: {line[:200]}...")
