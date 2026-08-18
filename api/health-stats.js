const fs = require('fs');
const path = require('path');

/**
 * Escape string for safe insertion into HTML attribute values.
 */
function escAttr(str) {
  return String(str || '')
    .replace(/&/g, '&amp;')
    .replace(/"/g, '&quot;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;');
}

/**
 * Formats description string to be between 150 and 160 characters for optimal SEO.
 */
function formatMetaDescription(text, categoryName) {
  if (!text) {
    return `Latest ${categoryName} data, prevalence trends, regional metrics, and projections compiled from WHO, CDC, and IHME.`;
  }
  const clean = String(text).trim().replace(/\s+/g, ' ');
  if (clean.length >= 150 && clean.length <= 160) return clean;
  if (clean.length > 160) {
    let truncated = clean.slice(0, 155);
    const lastSpace = truncated.lastIndexOf(' ');
    if (lastSpace > 120) {
      truncated = truncated.slice(0, lastSpace);
    }
    return (truncated + '...').slice(0, 160);
  }
  return (clean + ' Read full clinical evidence and global data on MediHelp.').slice(0, 158);
}

const CATEGORY_FILES = {
  'diabetes-statistics-2026':       { name: 'Diabetes Statistics 2026',          file: 'tabs/health-stats/data/diabetes-2026.json' },
  'cancer-statistics-2026':         { name: 'Cancer Statistics 2026',            file: 'tabs/health-stats/data/cancer-2026.json' },
  'obesity-statistics-2026':        { name: 'Obesity Statistics 2026',           file: 'tabs/health-stats/data/obesity-2026.json' },
  'heart-disease-statistics-2026':  { name: 'Heart Disease Statistics 2026',     file: 'tabs/health-stats/data/heart-disease-2026.json' },
  'stroke-statistics-2026':         { name: 'Stroke Statistics 2026',            file: 'tabs/health-stats/data/stroke-2026.json' },
  'hypertension-statistics-2026':   { name: 'Hypertension Statistics 2026',      file: 'tabs/health-stats/data/hypertension-2026.json' },
  'kidney-disease-statistics-2026': { name: 'Kidney Disease Statistics 2026',    file: 'tabs/health-stats/data/kidney-disease-2026.json' },
  'mental-health-statistics-2026':  { name: 'Mental Health Statistics 2026',     file: 'tabs/health-stats/data/mental-health-2026.json' },
  'tobacco-statistics-2026':        { name: 'Tobacco & Smoking Statistics 2026', file: 'tabs/health-stats/data/tobacco-2026.json' },
  'tuberculosis-statistics-2026':   { name: 'Tuberculosis Statistics 2026',      file: 'tabs/health-stats/data/tuberculosis-2026.json' },
  'malaria-statistics-2026':        { name: 'Malaria Statistics 2026',           file: 'tabs/health-stats/data/malaria-2026.json' },
  'hiv-aids-statistics-2026':       { name: 'HIV/AIDS Statistics 2026',          file: 'tabs/health-stats/data/hiv-aids-2026.json' },
  'hepatitis-b-statistics-2026':    { name: 'Hepatitis B Statistics 2026',       file: 'tabs/health-stats/data/hepatitis-b-2026.json' },
  'cholera-statistics-2026':        { name: 'Cholera Statistics 2026',           file: 'tabs/health-stats/data/cholera-2026.json' },
  'covid19-statistics-2026':        { name: 'COVID-19 Statistics 2026',          file: 'tabs/health-stats/data/covid19-2026.json' }
};

module.exports = async (req, res) => {
  const category =
    req.query.category ||
    (req.url.split('?')[0].replace(/^\/global-health-statistics\//, '').trim());

  if (!category) {
    res.setHeader('Location', '/global-health-statistics');
    res.status(302).end();
    return;
  }

  // Return 404 for unknown/invalid categories (e.g. garbage URLs like /${key})
  // so search engines don't crawl and attempt to index junk URLs.
  if (!CATEGORY_FILES[category]) {
    res.status(404).send('Not Found');
    return;
  }

  const categoryInfo = CATEGORY_FILES[category];

  let pageTitle = `${categoryInfo.name} | MediHelp`;
  let h1Text = categoryInfo.name;
  let pageDesc = `Comprehensive ${categoryInfo.name} report from WHO, CDC, and IHME datasets on MediHelp.`;

  const jsonFilePath = path.join(process.cwd(), categoryInfo.file);
  if (fs.existsSync(jsonFilePath)) {
    try {
      const rawJson = fs.readFileSync(jsonFilePath, 'utf8');
      const data = JSON.parse(rawJson);
      if (data.meta && data.meta.title) {
        h1Text = data.meta.title;
        pageTitle = `${data.meta.title} | MediHelp`;
      }
      if (data.hero && data.hero.description) {
        pageDesc = data.hero.description;
      }
    } catch (e) {
      console.warn('Failed to parse health stats JSON', e);
    }
  }

  const formattedDesc = formatMetaDescription(pageDesc, categoryInfo.name);
  const canonicalUrl = `https://www.medihelp.live/global-health-statistics/${encodeURIComponent(category)}`;

  const templatePath = path.join(process.cwd(), 'global-health-statistics-detail.html');
  let html = fs.readFileSync(templatePath, 'utf8');

  // Inject unique meta elements
  html = html
    .replace(/<title[^>]*>.*?<\/title>/i, `<title>${escAttr(pageTitle)}</title>`)
    .replace(/(<meta name="description"[^>]*content=")[^"]*(")/i, `$1${escAttr(formattedDesc)}$2`);

  // Ensure a valid H1 tag exists in raw HTML output for SEO crawlers
  const h1Markup = `<h1 id="seo-static-h1" class="sr-only">${escAttr(h1Text)}</h1>`;
  if (!html.includes('id="seo-static-h1"')) {
    html = html.replace('<body>', `<body>\n  ${h1Markup}`);
  }

  // Update or insert canonical tag
  if (html.includes('<link rel="canonical"')) {
    html = html.replace(/(<link rel="canonical"[^>]*href=")[^"]*(")/i, `$1${escAttr(canonicalUrl)}$2`);
  } else {
    html = html.replace('</head>', `  <link rel="canonical" href="${escAttr(canonicalUrl)}">\n</head>`);
  }

  // Update or insert og tags
  if (html.includes('<meta property="og:title"')) {
    html = html.replace(/(<meta property="og:title"[^>]*content=")[^"]*(")/i, `$1${escAttr(pageTitle)}$2`);
  } else {
    html = html.replace('</head>', `  <meta property="og:title" content="${escAttr(pageTitle)}">\n</head>`);
  }

  if (html.includes('<meta property="og:description"')) {
    html = html.replace(/(<meta property="og:description"[^>]*content=")[^"]*(")/i, `$1${escAttr(formattedDesc)}$2`);
  } else {
    html = html.replace('</head>', `  <meta property="og:description" content="${escAttr(formattedDesc)}">\n</head>`);
  }

  if (html.includes('<meta property="og:url"')) {
    html = html.replace(/(<meta property="og:url"[^>]*content=")[^"]*(")/i, `$1${escAttr(canonicalUrl)}$2`);
  } else {
    html = html.replace('</head>', `  <meta property="og:url" content="${escAttr(canonicalUrl)}">\n</head>`);
  }

  res.setHeader('Content-Type', 'text/html; charset=utf-8');
  res.setHeader('Cache-Control', 'public, max-age=3600, stale-while-revalidate=86400');
  res.status(200).send(html);
};
