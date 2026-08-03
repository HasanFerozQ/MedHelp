const fs = require('fs');
const path = require('path');

/**
 * Parse YAML-style frontmatter from a markdown file.
 * Mirrors the regex used in core.js so values match exactly.
 */
function parseFrontmatter(raw) {
  const match = raw.match(/^---[\r\n]([\s\S]+?)[\r\n]---/);
  if (!match) return {};
  const meta = {};
  match[1].split('\n').forEach(line => {
    const colonIdx = line.indexOf(':');
    if (colonIdx === -1) return;
    const key = line.slice(0, colonIdx).trim();
    const val = line.slice(colonIdx + 1).trim().replace(/^["']|["']$/g, '');
    if (key) meta[key] = val;
  });
  return meta;
}

/**
 * Escape a string for safe insertion into an HTML attribute value.
 */
function escAttr(str) {
  return String(str || '')
    .replace(/&/g, '&amp;')
    .replace(/"/g, '&quot;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;');
}

/**
 * Formats a description string to be strictly between 150 and 160 characters for optimal SEO.
 */
function formatMetaDescription(text) {
  if (!text) {
    return 'Read authoritative MediHelp medical blog articles covering clinical research, health updates, medical bill auditing, CPT coding, and patient advocacy.';
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
  return (clean + ' Read full clinical evidence and advocacy guidance on MediHelp.').slice(0, 158);
}

module.exports = async (req, res) => {
  // Extract slug from URL: /blog/:slug  (vercel rewrite passes it as query param)
  const slug =
    req.query.slug ||
    (req.url.split('?')[0].replace(/^\/blog\//, '').trim());

  if (!slug) {
    res.setHeader('Location', '/blog');
    res.status(302).end();
    return;
  }

  // Locate the markdown file
  const blogDir = path.join(process.cwd(), 'blog');
  const mdFile = path.join(blogDir, `${slug}.md`);

  let meta = {};
  if (fs.existsSync(mdFile)) {
    const raw = fs.readFileSync(mdFile, 'utf8');
    meta = parseFrontmatter(raw);
  }

  // Build per-post values (fallback to generics if frontmatter is missing)
  const title = meta.title
    ? `${meta.title} | MediHelp Blog`
    : 'MediHelp Blog | Article';

  const rawDescription = meta.summary || meta.excerpt || meta.description || '';

  // Format meta description to strictly fit the 150-160 character SEO standard
  const descTrimmed = formatMetaDescription(rawDescription);

  const ogImage = meta.thumbnail || 'https://www.medihelp.live/icons/logo.png?v=1.1';
  const canonicalUrl = `https://www.medihelp.live/blog/${encodeURIComponent(slug)}`;

  // Read the base blog-post.html template
  const templatePath = path.join(process.cwd(), 'blog-post.html');
  let html = fs.readFileSync(templatePath, 'utf8');

  // Inject the correct per-post values into the static head.
  // These replacements target the exact static strings in blog-post.html.
  html = html
    // <title>
    .replace(
      '<title>MediHelp Blog | Article</title>',
      `<title>${escAttr(title)}</title>`
    )
    // <meta name="description">
    .replace(
      /(<meta name="description" content=")[^"]*(")/,
      `$1${escAttr(descTrimmed)}$2`
    )
    // og:title
    .replace(
      /(<meta property="og:title" content=")[^"]*(")/,
      `$1${escAttr(title)}$2`
    )
    // og:description
    .replace(
      /(<meta property="og:description" content=")[^"]*(")/,
      `$1${escAttr(descTrimmed)}$2`
    )
    // og:image
    .replace(
      /(<meta property="og:image" content=")[^"]*(")/,
      `$1${escAttr(ogImage)}$2`
    )
    // og:url — inject if present, otherwise add after og:image
    .replace(
      /(<meta property="og:url" content=")[^"]*(")/,
      `$1${escAttr(canonicalUrl)}$2`
    )
    // twitter:title
    .replace(
      /(<meta name="twitter:title" content=")[^"]*(")/,
      `$1${escAttr(title)}$2`
    )
    // twitter:description
    .replace(
      /(<meta name="twitter:description" content=")[^"]*(")/,
      `$1${escAttr(descTrimmed)}$2`
    )
    // twitter:image
    .replace(
      /(<meta name="twitter:image" content=")[^"]*(")/,
      `$1${escAttr(ogImage)}$2`
    )
    // canonical link
    .replace(
      /(<link rel="canonical"[^>]*href=")[^"]*(")/,
      `$1${escAttr(canonicalUrl)}$2`
    );

  // If no static og:url tag existed in head, insert it after og:image
  if (!html.includes('<meta property="og:url"')) {
    html = html.replace(
      /(<meta property="og:image"[^>]*>)/,
      `$1\n  <meta property="og:url" content="${escAttr(canonicalUrl)}">`
    );
  }

  // If no static canonical link existed in head, insert one before </head>
  if (!html.includes('<link rel="canonical"')) {
    html = html.replace(
      '</head>',
      `  <link rel="canonical" href="${escAttr(canonicalUrl)}">\n</head>`
    );
  }

  res.setHeader('Content-Type', 'text/html; charset=utf-8');
  // Cache for 1 hour on CDN edge; still stale-while-revalidate for freshness
  res.setHeader('Cache-Control', 'public, max-age=3600, stale-while-revalidate=86400');
  res.status(200).send(html);
};
