import os
import re

root = r"c:\Users\Hasan-PC\Desktop\MedHelp"

def get_html(fname):
    path = os.path.join(root, fname)
    if not os.path.exists(path):
        return None
    with open(path, encoding="utf-8", errors="ignore") as f:
        return f.read()

def get_tag(html, pattern):
    m = re.search(pattern, html, re.IGNORECASE | re.DOTALL)
    return m.group(1).strip() if m else "NOT FOUND"

def first_script_pos(html):
    m = re.search(r"<head\b[^>]*>(.*?)</head>", html, re.DOTALL | re.IGNORECASE)
    if not m: return -1, -1
    head = m.group(1)
    s = head.find("<script")
    return s, len(head)

print("=" * 70)
print("SEO AUDIT REPORT")
print("=" * 70)

# ── 1. index.html title, description, H1
print("\n[1] index.html — Title / Description / H1")
idx = get_html("index.html")
title = get_tag(idx, r"<title>([^<]+)</title>")
desc  = get_tag(idx, r'<meta name="description" content="([^"]+)"')
print(f"  Title ({len(title)} chars): {title}")
print(f"  Desc  ({len(desc)} chars): {desc[:100]}...")
print(f"  Title OK (<=60): {'PASS' if len(title) <= 60 else 'FAIL'}")
print(f"  Desc OK (150-160): {'PASS' if 150 <= len(desc) <= 160 else 'FAIL'}")

h1_match = re.search(r'<h1 class="hero-h1">(.*?)</h1>', idx, re.DOTALL)
if h1_match:
    h1 = re.sub(r"<[^>]+>", "", h1_match.group(1)).strip().replace("\n", " ")
    print(f"  H1  ({len(h1)} chars): {h1[:80]}")
else:
    print("  H1: NOT FOUND")

# ── 2. Check skip-to-content and landmarks
print("\n[2] index.html — Accessibility landmarks")
print(f"  skip-to-content: {'PASS' if 'skip-to-content' in idx else 'FAIL - MISSING'}")
print(f"  <header class: {'PASS' if '<header' in idx else 'FAIL - MISSING'}")
print(f"  <main id=\"main-content\": {'PASS' if 'id=\"main-content\"' in idx else 'FAIL - MISSING'}")

# ── 3. Head tag ordering across key files
print("\n[3] Head tag ordering (canonicals/titles/hreflang before scripts)")
key_files = [
    "index.html", "flash-cards.html", "blog-post.html",
    "global-health-statistics-detail.html", "medical-calculator.html",
    "about.html", "calculators/er.html", "calculators/anesthesia.html"
]
all_pass = True
for fname in key_files:
    html = get_html(fname)
    if not html:
        print(f"  {fname}: NOT FOUND")
        continue
    m = re.search(r"<head\b[^>]*>(.*?)</head>", html, re.DOTALL | re.IGNORECASE)
    if not m:
        print(f"  {fname}: no <head> found")
        continue
    head = m.group(1)
    first_script = head.find("<script")
    title_pos    = head.find("<title")
    canonical_pos= head.find('rel="canonical"')
    hreflang_pos = head.find("hreflang=")
    issues = []
    if title_pos != -1 and first_script != -1 and title_pos > first_script:
        issues.append("title after script")
    if canonical_pos != -1 and first_script != -1 and canonical_pos > first_script:
        issues.append("canonical after script")
    if hreflang_pos != -1 and first_script != -1 and hreflang_pos > first_script:
        issues.append("hreflang after script")
    if issues:
        all_pass = False
        print(f"  FAIL [{fname}]: {', '.join(issues)}")
    else:
        print(f"  PASS: {fname}")

# ── 4. meta charset byte offset
print("\n[4] meta charset byte offset (< 1024 bytes)")
for fname in ["index.html", "flash-cards.html", "blog-post.html", "global-health-statistics-detail.html"]:
    html = get_html(fname)
    if not html: continue
    idx_c = html.find("<meta charset=")
    offset = len(html[:idx_c].encode("utf-8")) if idx_c != -1 else -1
    ok = 0 < offset < 1024
    print(f"  {fname}: {offset} bytes -> {'PASS' if ok else 'FAIL'}")

# ── 5. flash-cards.html file size
print("\n[5] flash-cards.html file size")
fc_size = os.path.getsize(os.path.join(root, "flash-cards.html"))
print(f"  Size: {fc_size / (1024*1024):.2f} MB")
print(f"  {'RESTORED (>2MB inline)' if fc_size > 2000000 else 'WARNING: still extracted (<2MB)'}")

# ── 6. styles.css accessibility helpers
print("\n[6] styles.css accessibility helpers")
css = get_html("styles.css")
print(f"  .skip-to-content: {'PASS' if '.skip-to-content' in css else 'FAIL - MISSING'}")
print(f"  .sr-only: {'PASS' if '.sr-only' in css else 'FAIL - MISSING'}")

# ── 7. vercel.json routes intact
print("\n[7] vercel.json routes")
vcfg = get_html("vercel.json")
print(f"  /blog/:slug route: {'PASS' if '/blog/:slug' in vcfg else 'FAIL - MISSING'}")
print(f"  /global-health-statistics/:category route: {'PASS' if '/global-health-statistics/:category' in vcfg else 'FAIL - MISSING'}")
print(f"  /es/calculators/:path* route: {'PASS' if '/es/calculators/:path*' in vcfg else 'FAIL - MISSING'}")

# ── 8. Asset paths root-relative
print("\n[8] Root-relative asset paths (no broken relative paths)")
broken = []
skip_dirs = {"node_modules", ".git", "brain", "scratch"}
for dirpath, dirnames, filenames in os.walk(root):
    dirnames[:] = [d for d in dirnames if d not in skip_dirs]
    for fname in filenames:
        if not fname.endswith(".html"): continue
        fpath = os.path.join(dirpath, fname)
        with open(fpath, encoding="utf-8", errors="ignore") as f:
            c = f.read()
        issues = []
        if 'src="core.js"' in c: issues.append("core.js relative")
        if 'href="styles.css"' in c: issues.append("styles.css relative")
        if issues:
            broken.append(f"{fname}: {', '.join(issues)}")
if broken:
    for b in broken:
        print(f"  FAIL: {b}")
else:
    print("  PASS: All files use root-relative paths")

print("\n" + "=" * 70)
print("AUDIT COMPLETE")
print("=" * 70)
