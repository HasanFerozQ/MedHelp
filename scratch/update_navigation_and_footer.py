import os
import glob
import re

def update_html_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Dropdown replacement
    # Using regex to find the dropdown with More
    dropdown_pattern = re.compile(
        r'<div class="nav-dropdown">\s*<div class="nav-dropdown-btn">More ▼</div>\s*<div class="nav-dropdown-menu">.*?</div>\s*</div>',
        re.DOTALL
    )

    new_dropdown = """<div class="nav-dropdown">
          <div class="nav-dropdown-btn">More ▼</div>
          <div class="nav-dropdown-menu">
            <a href="/rx-savings">Rx Savings</a>
            <a href="/providers">Provider Search</a>
            <a href="/blog">Blog</a>
            <div style="border-top: 1px solid var(--border); margin: 8px 0;"></div>
            <div style="padding: 4px 16px; font-size: 11px; font-weight: 800; text-transform: uppercase; color: var(--text-muted); letter-spacing: 0.1em;">Calculators</div>
            <a href="/calculators/bmi-calculator" style="font-size: 14px;">BMI Calculator</a>
            <a href="/calculators/creatinine-clearance-calculator" style="font-size: 14px;">CrCl Calculator</a>
            <a href="/calculators/bsa-calculator" style="font-size: 14px;">BSA Calculator</a>
            <a href="/calculators/bicarbonate-deficit-calculator" style="font-size: 14px;">HCO3 Deficit</a>
            <a href="/calculators/doctors" style="font-size: 14px; color: var(--expert-amber);">For Doctors</a>
            <a href="/calculators/nurses" style="font-size: 14px; color: var(--expert-amber);">For Nurses</a>
            <a href="/calculators/pharmacists" style="font-size: 14px; color: var(--expert-amber);">For Pharmacists</a>
            <a href="/calculators/students" style="font-size: 14px; color: var(--expert-amber);">For Students</a>
            <a href="/calculators/er" style="font-size: 14px; color: var(--expert-amber);">ER / Emergency</a>
            <a href="/calculators/icu" style="font-size: 14px; color: var(--expert-amber);">ICU / Critical Care</a>
            <a href="/calculators/pediatrics" style="font-size: 14px; color: var(--expert-amber);">Pediatrics</a>
            <a href="/calculators/obgyn" style="font-size: 14px; color: var(--expert-amber);">OB/GYN</a>
            <a href="/calculators/surgeons" style="font-size: 14px; color: var(--expert-amber);">Surgeons</a>
            <a href="/calculators/anesthesia" style="font-size: 14px; color: var(--expert-amber);">Anesthesia</a>
            <a href="/calculators/lab" style="font-size: 14px; color: var(--expert-amber);">Lab / Pathology</a>
            <a href="/calculators/dietitians" style="font-size: 14px; color: var(--expert-amber);">Dietitians</a>
          </div>
        </div>"""

    content, num_subs = dropdown_pattern.subn(new_dropdown, content)

    # Footer replacement
    footer_pattern = re.compile(
        r'<footer class="site-footer">.*?</footer>',
        re.DOTALL
    )

    new_footer = """<footer class="site-footer">
    <div class="container">
      <div class="footer-grid">
        <div class="footer-brand">
          <h3>MediHelp</h3>
          <p>Free tools and professional advocates helping patients fight medical billing errors and reduce hospital costs.</p>
          <div style="margin-top:16px; display:flex; gap:12px; margin-bottom: 16px;">
            <a href="https://www.linkedin.com/company/medihelplive/" target="_blank" rel="noopener" style="color:var(--text-muted); transition:0.3s;" onmouseover="this.style.color='var(--accent)'" onmouseout="this.style.color='var(--text-muted)'" title="Follow MediHelp on LinkedIn">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/></svg>
            </a>
          </div>
          <div style="margin-top:16px; display:flex; gap:8px; flex-wrap:wrap;">
            <span style="font-size:11px; background:rgba(var(--accent-rgb),0.1); color:var(--accent); padding:4px 10px; border-radius:6px; border:1px solid rgba(var(--accent-rgb),0.2);">HIPAA-Safe</span>
            <span style="font-size:11px; background:rgba(56,189,248,0.1); color:var(--trust-blue); padding:4px 10px; border-radius:6px; border:1px solid rgba(56,189,248,0.2);">CMS Data</span>
            <span style="font-size:11px; background:rgba(var(--amber-rgb),0.1); color:var(--expert-amber); padding:4px 10px; border-radius:6px; border:1px solid rgba(var(--amber-rgb),0.2);">No Signup</span>
          </div>
        </div>
        <div class="footer-col">
          <h4>Free Tools</h4>
          <ul>
            <li><a href="/medical-bill-audit">Bill Audit Tool</a></li>
            <li><a href="/cpt-code-search">CPT Code Lookup</a></li>
            <li><a href="/claim-denial-codes">Claim Denial Codes</a></li>
            <li><a href="/rx-savings">Rx Savings Search</a></li>
            <li><a href="/providers">Provider Search</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>Calculators</h4>
          <ul>
            <li><a href="/calculators/bmi-calculator">BMI</a></li>
            <li><a href="/calculators/creatinine-clearance-calculator">Creatinine Clearance</a></li>
            <li><a href="/calculators/bsa-calculator">BSA</a></li>
            <li><a href="/calculators/bicarbonate-deficit-calculator">Bicarbonate Deficit</a></li>
            <li><a href="/calculators/doctors">For Doctors</a></li>
            <li><a href="/calculators/nurses">For Nurses</a></li>
            <li><a href="/calculators/pharmacists">For Pharmacists</a></li>
            <li><a href="/calculators/students">For Students</a></li>
            <li><a href="/calculators/er">ER / Emergency</a></li>
            <li><a href="/calculators/icu">ICU / Critical</a></li>
            <li><a href="/calculators/pediatrics">Pediatrics</a></li>
            <li><a href="/calculators/obgyn">OB/GYN</a></li>
            <li><a href="/calculators/surgeons">Surgeons</a></li>
            <li><a href="/calculators/anesthesia">Anesthesia</a></li>
            <li><a href="/calculators/lab">Lab / Pathology</a></li>
            <li><a href="/calculators/dietitians">Dietitians</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>Services</h4>
          <ul>
            <li><a href="/pricing" style="color:var(--expert-amber); display: inline-flex; align-items: center; gap: 6px;">Human Bill Negotiation <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><path d="m12 3 1.91 5.82L21 12l-7.09 3.18L12 21l-1.91-5.82L3 12l7.09-3.18L12 3z"/></svg></a></li>
            <li><a href="/medical-exam-preparation" style="color:var(--accent); font-weight:700;">Medical Exam Mastery</a></li>
            <li><a href="/blog">Patient Blog</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>Legal</h4>
          <ul>
            <li><a href="/privacy">Privacy Policy</a></li>
            <li><a href="/terms">Terms of Service</a></li>
            <li><a href="/refund">Refund Policy</a></li>
            <li><a href="/pricing">Pricing</a></li>
            <li><a href="/contact">Contact Us</a></li>
            <li><a href="/sitemap.xml">Sitemap</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom" style="justify-content:center; border-top:1px solid var(--border); padding-top:40px; flex-direction:column; gap:10px; align-items:center;">
        <span>© 2026 MediHelp. All Rights Reserved.</span>
        <span style="font-size:11px; opacity:0.7;">Informational only. Not medical or legal advice. <a href="/terms" style="color:var(--accent); text-decoration:none; font-weight:700;">Terms & Disclaimer</a></span>
        <span style="display:block; font-size:10px; opacity:0.5;">Support: supportdesk@medihelp.live</span>
      </div>
    </div>
  </footer>"""

    content, f_subs = footer_pattern.subn(new_footer, content)

    if num_subs > 0 or f_subs > 0:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Updated {filepath} (Dropdowns: {num_subs}, Footers: {f_subs})")

directories = ['.', 'calculators', 'blog']
for d in directories:
    for filepath in glob.glob(os.path.join(d, '*.html')):
        update_html_file(filepath)
