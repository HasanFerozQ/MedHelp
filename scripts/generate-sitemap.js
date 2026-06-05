const fs = require('fs');
const path = require('path');

// 1. Mock window object to safely load/evaluate tabs/calculator/registry.js
global.window = {};
const registryPath = path.join(__dirname, '../tabs/calculator/registry.js');

try {
  const registryCode = fs.readFileSync(registryPath, 'utf8');
  eval(registryCode);
} catch (error) {
  console.error('Failed to load calculator registry:', error);
  process.exit(1);
}

const CalcRegistry = global.window.CalcRegistry;
if (!CalcRegistry || !CalcRegistry.roles || !CalcRegistry.calculators) {
  console.error('Invalid CalcRegistry loaded from registry.js');
  process.exit(1);
}

// 2. Load blog manifest
let blogPosts = [];
const blogManifestPath = path.join(__dirname, '../blog/manifest.json');
try {
  if (fs.existsSync(blogManifestPath)) {
    const manifest = JSON.parse(fs.readFileSync(blogManifestPath, 'utf8'));
    if (manifest && Array.isArray(manifest.posts)) {
      blogPosts = manifest.posts.map(file => file.replace(/\.md$/, ''));
    }
  }
} catch (error) {
  console.error('Failed to load blog manifest.json:', error);
}

// 3. Setup configurations
const BASE_URL = 'https://www.medihelp.live';
const TODAY = new Date().toISOString().split('T')[0];

const sitemapEntries = [];

function addEntry(loc, lastmod, changefreq, priority) {
  sitemapEntries.push(`  <url>
    <loc>${BASE_URL}${loc}</loc>
    <lastmod>${lastmod}</lastmod>
    <changefreq>${changefreq}</changefreq>
    <priority>${priority.toFixed(1)}</priority>
  </url>`);
}

// --- 4. Populate Entries ---

// Main Pages
const mainPages = [
  { loc: '/', priority: 1.0, changefreq: 'weekly' },
  { loc: '/medical-exam-preparation', priority: 0.9, changefreq: 'weekly' },
  { loc: '/medical-exam-usmle', priority: 0.9, changefreq: 'weekly' },
  { loc: '/medical-exam-semester', priority: 0.9, changefreq: 'weekly' },
  { loc: '/medical-exam-mock', priority: 0.9, changefreq: 'weekly' },
  { loc: '/medical-exam-nbme', priority: 0.9, changefreq: 'weekly' },
  { loc: '/medical-exam-simulator', priority: 0.9, changefreq: 'weekly' },
  { loc: '/medical-exam-simulator-step3', priority: 0.9, changefreq: 'weekly' },
  { loc: '/flash-cards', priority: 0.9, changefreq: 'weekly' },
  { loc: '/medical-bill-audit', priority: 0.9, changefreq: 'weekly' },
  { loc: '/medical-calculator', priority: 0.9, changefreq: 'weekly' },
  { loc: '/med-trivia', priority: 0.9, changefreq: 'daily' },
  { loc: '/management-education', priority: 0.8, changefreq: 'weekly' },
  { loc: '/cpt-code-search', priority: 0.9, changefreq: 'weekly' },
  { loc: '/claim-denial-codes', priority: 0.9, changefreq: 'weekly' },
  { loc: '/rx-savings', priority: 0.8, changefreq: 'monthly' },
  { loc: '/providers', priority: 0.8, changefreq: 'monthly' },
  { loc: '/blog', priority: 0.7, changefreq: 'daily' }
];

mainPages.forEach(p => addEntry(p.loc, TODAY, p.changefreq, p.priority));

// Standalone SEO Calculators
const standaloneCalculators = [
  '/calculators/bmi-calculator',
  '/calculators/creatinine-clearance-calculator',
  '/calculators/bsa-calculator',
  '/calculators/bicarbonate-deficit-calculator'
];
standaloneCalculators.forEach(loc => addEntry(loc, TODAY, 'monthly', 0.8));

// Calculator Category Pages (by role)
CalcRegistry.roles.forEach(role => {
  addEntry(`/calculators/${role.id}`, TODAY, 'monthly', 0.8);
});

// Individual Calculator Sub-Pages (dynamic query param routes)
// Grouped by role for logical grouping in the generated sitemap
CalcRegistry.roles.forEach(role => {
  const roleCalcs = CalcRegistry.calculators.filter(c => c.role === role.id && c.implemented !== false);
  if (roleCalcs.length > 0) {
    sitemapEntries.push(`\n  <!-- Individual Calculator Pages — ${role.id.toUpperCase()} (${roleCalcs.length} calculators) -->`);
    roleCalcs.forEach(calc => {
      addEntry(`/calculators/${role.id}?calc=${calc.id}`, TODAY, 'monthly', 0.7);
    });
  }
});

// Medical Exam Preparation Topics (SEO Slugs)
const examPrepTopics = [
  '/medical-exam-preparation/thorax-anatomy-mcqs-usmle-mbbs-preparation',
  '/medical-exam-preparation/abdomen-anatomy-mcqs-usmle-mbbs-preparation',
  '/medical-exam-preparation/pelvis-perineum-anatomy-mcqs-usmle-mbbs-preparation',
  '/medical-exam-preparation/upper-limb-anatomy-mcqs-usmle-mbbs-preparation',
  '/medical-exam-preparation/lower-limb-anatomy-mcqs-usmle-mbbs-preparation',
  '/medical-exam-preparation/pediatric-nephrology-endocrinology-mcqs-usmle-mbbs-preparation'
];
sitemapEntries.push('\n  <!-- Medical Exam Preparation Topics (SEO Slugs) -->');
examPrepTopics.forEach(loc => addEntry(loc, TODAY, 'monthly', 0.6));

// Blog Posts (from manifest.json)
if (blogPosts.length > 0) {
  sitemapEntries.push(`\n  <!-- Blog Posts (all ${blogPosts.length} from manifest.json) -->`);
  blogPosts.forEach(slug => {
    addEntry(`/blog-post?slug=${slug}`, TODAY, 'monthly', 0.6);
  });
}

// Legal & Static Pages
const legalPages = [
  '/pricing',
  '/privacy',
  '/terms',
  '/refund',
  '/contact'
];
sitemapEntries.push('\n  <!-- Legal & Static Pages -->');
legalPages.forEach(loc => addEntry(loc, TODAY, 'monthly', 0.5));

// 5. Construct Sitemap XML Content
const xmlContent = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${sitemapEntries.join('\n')}
</urlset>
`;

// 6. Write to sitemap.xml
const sitemapPath = path.join(__dirname, '../sitemap.xml');
fs.writeFileSync(sitemapPath, xmlContent.trim() + '\n', 'utf8');

console.log(`Successfully generated sitemap.xml with ${sitemapEntries.filter(e => e.includes('<url>')).length} URLs!`);
