/**
 * MediHelp Blog Handler — Interactive Audit Demos
 * Allows blog posts to pre-populate the auditor with sample cases.
 */

function setupBlogDemos() {
  const demoButtons = document.querySelectorAll('[data-audit-demo]');
  demoButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      const demoKey = btn.getAttribute('data-audit-demo');
      const demoData = BLOG_SAMPLES[demoKey];
      
      if (demoData) {
        // Store in sessionStorage to bridge the page transition
        sessionStorage.setItem('MH_PENDING_DEMO', JSON.stringify(demoData));
        window.location.href = 'audit.html';
      }
    });
  });
}

const BLOG_SAMPLES = {
  'er_upcode': {
    billText: `05/12/2024  99285-25  EMERGENCY DEPT VISIT LEVEL 5  $1,250.00
05/12/2024  93000  ELECTROCARDIOGRAM  $450.00
05/12/2024  36415  VENIPUNCTURE  $25.00`,
    description: 'Sample ER Upcoding Case (Level 5 + Bundled Labs)'
  },
  'surgery_modifier': {
    billText: `06/01/2024  29881  KNEE ARTHROSCOPY  $4,500.00
06/01/2024  29877  KNEE DEBRIDEMENT  $2,100.00`,
    description: 'Multiple Procedure Case (Missing -51 Modifier)'
  },
  'npi_mismatch': {
    billText: `04/10/2024  12001  WOUND REPAIR  $350.00
NPI: 1093781222`, // Assuming this is a Psych NPI
    description: 'Specialty Mismatch Case (Psychiatrist billing Surgery)'
  }
};

document.addEventListener('DOMContentLoaded', setupBlogDemos);
