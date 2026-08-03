path = r"c:\Users\Hasan-PC\Desktop\MedHelp\flash-cards.html"

with open(path, encoding="utf-8") as f:
    content = f.read()

# Fix relative path for styles.css
content = content.replace('href="styles.css"', 'href="/styles.css"', 1)

# Fix relative path for core.js
content = content.replace('src="core.js"', 'src="/core.js"', 1)

# Also fix icon relative path if present
content = content.replace('href="icons/favicon.ico', 'href="/icons/favicon.ico', 1)

with open(path, "w", encoding="utf-8") as f:
    f.write(content)

print("Fixed paths. Verifying...")
print("styles.css root-relative:", 'href="/styles.css"' in content)
print("core.js root-relative:", 'src="/core.js"' in content)
print("No bare styles.css:", 'href="styles.css"' not in content)
print("No bare core.js:", 'src="core.js"></script>' not in content)
