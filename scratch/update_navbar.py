import re
import os

# The canonical navbar HTML - exactly matching index.html design
# Each page gets its own "active" class on the correct link

PAGES = {
    'index.html':                    '/',
    'audit.html':                    '/audit',
    'blog.html':                     '/blog',
    'blog-post.html':                '/blog',
    'claim-denial-codes.html':       '/claim-denial-codes',
    'contact.html':                  None,
    'cpt-code-search.html':          '/cpt-code-search',
    'flash-cards.html':              '/medical-exam-preparation',
    'management-education.html':     '/medical-exam-preparation',
    'medical-exam-mock.html':        '/medical-exam-preparation',
    'medical-exam-nbme.html':        '/medical-exam-preparation',
    'medical-exam-preparation.html': '/medical-exam-preparation',
    'medical-exam-semester.html':    '/medical-exam-preparation',
    'medical-exam-simulator.html':   '/medical-exam-preparation',
    'medical-exam-usmle.html':       '/medical-exam-preparation',
    'pricing.html':                  None,
    'privacy.html':                  None,
    'providers.html':                None,
    'refund.html':                   None,
    'rx-savings.html':               None,
    'terms.html':                    None,
}

def make_nav(active_page):
    def active(href):
        return ' class="active"' if href == active_page else ''

    return f'''<nav class="navbar">
    <div class="container nav-content">
      <a href="/" class="nav-brand">
        <img src="icons/logo.png?v=1.1" alt="MediHelp — Medical Bill Audit">
        MediHelp
      </a>
      <div class="nav-links">
        <a href="/"{"" if active_page != "/" else ' class="active"'}>Home</a>
        <a href="/medical-exam-preparation"{"" if active_page != "/medical-exam-preparation" else ' class="active"'}>Medical Exams</a>
        <a href="/audit"{"" if active_page != "/audit" else ' class="active"'}>Medical Bill Audit</a>
        <a href="/cpt-code-search"{"" if active_page != "/cpt-code-search" else ' class="active"'}>CPT Codes</a>
        <a href="/claim-denial-codes"{"" if active_page != "/claim-denial-codes" else ' class="active"'}>Denial Codes</a>
        <div class="nav-dropdown">
          <div class="nav-dropdown-btn">More ▼</div>
          <div class="nav-dropdown-menu">
            <a href="/rx-savings">Rx Savings</a>
            <a href="/providers">Provider Search</a>
            <a href="/blog"{"" if active_page != "/blog" else ' class="active"'}>Blog</a>
          </div>
        </div>
      </div>
      <div class="nav-actions">
        <a href="/pricing" class="btn btn-ghost" style="padding:8px 18px; font-size:14px; border-radius:10px;">Expert Help</a>
        <button id="theme-toggle" title="Toggle Dark/Light Mode" class="theme-btn">🌙</button>
        <div class="nav-toggle" onclick="MediHelp.toggleMobileMenu()">
          <span></span><span></span><span></span>
        </div>
      </div>
    </div>
  </nav>'''

# Regex to match any existing navbar block
NAV_PATTERN = re.compile(
    r'<nav\s+class="navbar"[\s\S]*?</nav>',
    re.IGNORECASE
)

root = r'c:\Users\Hasan-PC\Desktop\MedHelp'
updated = []
skipped = []

for filename, active_page in PAGES.items():
    filepath = os.path.join(root, filename)
    if not os.path.exists(filepath):
        skipped.append(f'MISSING: {filename}')
        continue

    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    new_nav = make_nav(active_page)
    new_content, count = NAV_PATTERN.subn(new_nav, content, count=1)

    if count == 0:
        skipped.append(f'NO NAV FOUND: {filename}')
        continue

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)

    updated.append(filename)
    print(f'  OK: {filename}')

print(f'\nDone: {len(updated)} updated, {len(skipped)} skipped.')
if skipped:
    for s in skipped:
        print(f'  ! {s}')
