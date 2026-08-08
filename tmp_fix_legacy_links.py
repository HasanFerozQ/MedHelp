from pathlib import Path
import json

replacements = {
    'medical-exam-preparation.html': [
        ('href="flash-cards.html"', 'href="/flash-cards"'),
        ('href="medical-exam-semester.html"', 'href="/medical-exam-semester"'),
        ('href="medical-exam-usmle.html"', 'href="/usmle-preparation"'),
        ('href="medical-exam-mock.html"', 'href="/medical-exam-mock"'),
        ('href="medical-exam-semester.html?subject=', 'href="/medical-exam-semester?subject='),
        ('href="medical-exam-semester.html?tab=', 'href="/medical-exam-semester?tab='),
    ],
    'medical-exam-usmle.html': [
        ('href="medical-exam-mock.html"', 'href="/medical-exam-mock"'),
        ('window.location.href = `medical-exam-semester.html?', 'window.location.href = `/medical-exam-semester?'),
    ],
    'medical-exam-nbme.html': [
        ('href="medical-exam-mock.html"', 'href="/medical-exam-mock"'),
        ('window.location.href = `medical-exam-semester.html?', 'window.location.href = `/medical-exam-semester?'),
    ],
    'medical-exam-semester.html': [
        ("window.location.href = 'medical-exam-usmle.html'", "window.location.href = '/usmle-preparation'"),
    ],
}

for filename, reps in replacements.items():
    path = Path(filename)
    if not path.exists():
        print(f"Skipping missing file: {filename}")
        continue
    text = path.read_text(encoding='utf-8')
    original = text
    for old, new in reps:
        text = text.replace(old, new)
    if text != original:
        path.write_text(text, encoding='utf-8')
        print(f"Updated {filename}")
    else:
        print(f"No changes in {filename}")

vc_path = Path('vercel.json')
vc = json.loads(vc_path.read_text(encoding='utf-8'))
redirects = vc.get('redirects', [])
new_redirects = [
    {'source': '/medical-exam-preparation.html', 'destination': '/medical-exam-preparation', 'permanent': True},
    {'source': '/medical-exam-semester.html', 'destination': '/medical-exam-semester', 'permanent': True},
    {'source': '/medical-exam-usmle.html', 'destination': '/usmle-preparation', 'permanent': True},
    {'source': '/flash-cards.html', 'destination': '/flash-cards', 'permanent': True},
    {'source': '/medical-exam-mock.html', 'destination': '/medical-exam-mock', 'permanent': True},
    {'source': '/blog.html', 'destination': '/blog', 'permanent': True},
]
existing = {r['source'] for r in redirects if isinstance(r, dict) and 'source' in r}
added = False
for nr in new_redirects:
    if nr['source'] not in existing:
        redirects.append(nr)
        added = True
        print(f"Added redirect {nr['source']} -> {nr['destination']}")
vc['redirects'] = redirects
if added:
    vc_path.write_text(json.dumps(vc, indent=2) + '\n', encoding='utf-8')
    print('Updated vercel.json')
else:
    print('No redirect changes needed in vercel.json')
