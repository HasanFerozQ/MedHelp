import os

def find_admin_terms():
    root_dir = r"c:\Users\Hasan-PC\Desktop\MedHelp"
    exclude_dirs = {".git", "node_modules", ".gemini", "brain"}
    
    matches = []
    
    for dirpath, dirnames, filenames in os.walk(root_dir):
        # Filter excluded directories
        dirnames[:] = [d for d in dirnames if d not in exclude_dirs]
        
        for filename in filenames:
            filepath = os.path.join(dirpath, filename)
            
            # Check filename
            if "admin" in filename.lower() or "panel" in filename.lower():
                matches.append(f"Filename match: {filepath}")
                continue
                
            # Check content for text files
            if filename.endswith(('.html', '.js', '.json', '.md', '.py', '.txt', '.sql')):
                try:
                    with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                        content = f.read()
                        if "admin panel" in content.lower() or "admin_panel" in content.lower() or "admin-panel" in content.lower():
                            matches.append(f"Content match in {filepath}")
                except Exception:
                    pass
                    
    print("Matches found:")
    for m in matches:
        print(m)

if __name__ == '__main__':
    find_admin_terms()
