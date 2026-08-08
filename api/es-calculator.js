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

module.exports = async (req, res) => {
  // Extract request URL and preserve query string for SEO-friendly canonicals.
  const rawUrl = req.url || '';
  const queryString = rawUrl.includes('?') ? rawUrl.slice(rawUrl.indexOf('?')) : '';
  const rawPath = rawUrl.split('?')[0];
  const reqPath = rawPath.endsWith('/') && rawPath.length > 1 ? rawPath.slice(0, -1) : rawPath;

  // Ensure path starts with /es
  const esPath = reqPath.startsWith('/es') ? reqPath : `/es${reqPath}`;
  const enPath = esPath.replace(/^\/es/, '') || '/medical-calculator';

  // Determine target HTML file on disk
  let htmlFile = 'medical-calculator.html';
  if (esPath.startsWith('/es/calculators/')) {
    const calcName = esPath.replace('/es/calculators/', '');
    const candidateFile = path.join('calculators', `${calcName}.html`);
    if (fs.existsSync(path.join(process.cwd(), candidateFile))) {
      htmlFile = candidateFile;
    }
  }

  const absoluteHtmlPath = path.join(process.cwd(), htmlFile);
  if (!fs.existsSync(absoluteHtmlPath)) {
    res.status(404).send('Page not found');
    return;
  }

  let html = fs.readFileSync(absoluteHtmlPath, 'utf8');

  const canonicalUrl = `https://www.medihelp.live${esPath}${queryString}`;
  const enUrl = `https://www.medihelp.live${enPath}${queryString}`;

  // 1. Set self-referential canonical tag for Spanish URL
  if (html.includes('<link rel="canonical"')) {
    html = html.replace(/(<link rel="canonical"[^>]*href=")[^"]*(")/, `$1${escAttr(canonicalUrl)}$2`);
  } else {
    html = html.replace('</head>', `  <link rel="canonical" href="${escAttr(canonicalUrl)}">\n</head>`);
  }

  // 2. Set og:url tag
  if (html.includes('<meta property="og:url"')) {
    html = html.replace(/(<meta property="og:url"[^>]*content=")[^"]*(")/, `$1${escAttr(canonicalUrl)}$2`);
  }

  // 3. Align hreflang tags
  // hreflang="es" -> self-referencing Spanish URL
  html = html.replace(/(<link rel="alternate"[^>]*hreflang="es"[^>]*href=")[^"]*(")/, `$1${escAttr(canonicalUrl)}$2`);
  // hreflang="en" -> English URL
  html = html.replace(/(<link rel="alternate"[^>]*hreflang="en"[^>]*href=")[^"]*(")/, `$1${escAttr(enUrl)}$2`);
  // hreflang="x-default" -> English URL
  html = html.replace(/(<link rel="alternate"[^>]*hreflang="x-default"[^>]*href=")[^"]*(")/, `$1${escAttr(enUrl)}$2`);

  // 4. Ensure asset paths do not use relative paths without leading slash
  html = html
    .replace(/(src|href)="tabs\//g, '$1="/tabs/')
    .replace(/(src|href)="styles\.css"/g, '$1="/styles.css"')
    .replace(/(src|href)="core\.js"/g, '$1="/core.js"')
    .replace(/(src|href)="icons\//g, '$1="/icons/');

  res.setHeader('Content-Type', 'text/html; charset=utf-8');
  res.setHeader('Cache-Control', 'public, max-age=3600, stale-while-revalidate=86400');
  res.status(200).send(html);
};
