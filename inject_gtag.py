import os
import re

snippet = """
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-QRXGS9WBY8"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-QRXGS9WBY8');
</script>
"""

def inject_gtag(directory):
    for root, dirs, files in os.walk(directory):
        if 'node_modules' in dirs:
            dirs.remove('node_modules')
        if '.git' in dirs:
            dirs.remove('.git')
        if '__pycache__' in dirs:
            dirs.remove('__pycache__')
            
        for file in files:
            if file.endswith('.html'):
                filepath = os.path.join(root, file)
                try:
                    with open(filepath, 'r', encoding='utf-8') as f:
                        content = f.read()
                    
                    if 'G-QRXGS9WBY8' in content:
                        print(f"Skipping {filepath} (already contains tag)")
                        continue
                        
                    # find <head> or <head ...>
                    # using regex to insert after the tag
                    def repl(match):
                        return match.group(0) + "\n" + snippet
                        
                    new_content, num_subs = re.subn(r'(<head[^>]*>)', repl, content, count=1, flags=re.IGNORECASE)
                    
                    if num_subs > 0:
                        with open(filepath, 'w', encoding='utf-8') as f:
                            f.write(new_content)
                        print(f"Injected gtag into {filepath}")
                    else:
                        print(f"Could not find <head> in {filepath}")
                except Exception as e:
                    print(f"Error processing {filepath}: {e}")

if __name__ == '__main__':
    inject_gtag('.')
