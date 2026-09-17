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
 * Escape a string for safe insertion inside a JSON string value.
 */
function escJson(str) {
  return String(str || '').replace(/\\/g, '\\\\').replace(/"/g, '\\"').replace(/\n/g, ' ').replace(/\r/g, '');
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

/**
 * Build a BlogPosting JSON-LD schema block from post metadata.
 */
function buildJsonLd(meta, slug, canonicalUrl) {
  const schema = {
    "@context": "https://schema.org",
    "@type": "BlogPosting",
    "headline": escJson(meta.title || 'MediHelp Blog Article'),
    "description": escJson(meta.summary || meta.excerpt || meta.description || ''),
    "image": meta.thumbnail || 'https://www.medihelp.live/icons/logo.png?v=1.1',
    "url": canonicalUrl,
    "mainEntityOfPage": {
      "@type": "WebPage",
      "@id": canonicalUrl
    },
    "datePublished": meta.date || new Date().toISOString().split('T')[0],
    "dateModified": meta.date || new Date().toISOString().split('T')[0],
    "author": {
      "@type": "Organization",
      "name": "MediHelp",
      "url": "https://www.medihelp.live"
    },
    "publisher": {
      "@type": "Organization",
      "name": "MediHelp",
      "url": "https://www.medihelp.live",
      "logo": {
        "@type": "ImageObject",
        "url": "https://www.medihelp.live/icons/logo.png?v=1.1"
      }
    },
    "articleSection": meta.category || 'Health',
    "inLanguage": "en-US"
  };
  return `<script type="application/ld+json">\n${JSON.stringify(schema, null, 2)}\n</script>`;
}

const KNOWN_ALIASES = {
  'medical-dispatch-may-2026-zombie-cells-glp1-sl': 'medical-dispatch-may-2026-zombie-cells-glp1-ai',
  'fish-oil-warning-tbl-omega3-2026': 'fish-oil-warning-tbi-omega3-2026'
};

let cachedPosts = null;
function getAvailablePosts(blogDir) {
  if (!cachedPosts) {
    if (fs.existsSync(blogDir)) {
      cachedPosts = fs.readdirSync(blogDir).filter(f => f.endsWith('.md')).map(f => f.slice(0, -3));
    } else {
      cachedPosts = [];
    }
  }
  return cachedPosts;
}

function resolveSlug(raw, blogDir) {
  if (!raw) return null;
  let s = decodeURIComponent(String(raw).trim());
  s = s.replace(/[\s+]+/g, '-');
  const posts = getAvailablePosts(blogDir);
  if (posts.includes(s)) return s;
  if (KNOWN_ALIASES[s]) return KNOWN_ALIASES[s];

  const lower = s.toLowerCase();
  for (const f of posts) {
    if (f.toLowerCase() === lower) return f;
  }
  for (const [k, v] of Object.entries(KNOWN_ALIASES)) {
    if (k.toLowerCase() === lower) return v;
  }

  const simplified = lower.replace(/[^a-z0-9]/g, '');
  for (const f of posts) {
    if (f.toLowerCase().replace(/[^a-z0-9]/g, '') === simplified) return f;
  }

  return null;
}

module.exports = async (req, res) => {
  const blogDir = path.join(process.cwd(), 'blog');

  // Extract raw slug candidate from query or path
  let rawSlug = req.query.slug;
  if (!rawSlug && req.query) {
    for (const key of Object.keys(req.query)) {
      if (/^slug[-=]/i.test(key)) {
        rawSlug = key.replace(/^slug[-=]/i, '') || req.query[key];
        break;
      }
    }
  }
  if (!rawSlug && req.url) {
    const urlMatch = req.url.match(/slug[-=]([^&]+)/i);
    if (urlMatch) {
      rawSlug = urlMatch[1];
    }
  }
  if (!rawSlug && req.url) {
    rawSlug = req.url.split('?')[0].replace(/^\/blog\//, '').trim();
  }

  const slug = resolveSlug(rawSlug, blogDir);

  if (!slug) {
    res.writeHead(301, { Location: '/blog' });
    res.end();
    return;
  }

  // Determine requested URL to detect legacy / non-canonical access
  const forwardedUri = req.headers['x-forwarded-uri'] || req.url || '';
  const isLegacyPath = forwardedUri.includes('/blog-post') || !forwardedUri.startsWith('/blog/');
  const isCleanCanonical = forwardedUri.startsWith(`/blog/${encodeURIComponent(slug)}`) || forwardedUri.startsWith(`/blog/${slug}`);

  // If accessed via legacy endpoint (/blog-post, /blog-post.html) or an un-normalized slug:
  // issue a 301 Permanent Redirect to the canonical /blog/:slug clean URL
  if (isLegacyPath || !isCleanCanonical) {
    res.writeHead(301, {
      Location: `/blog/${encodeURIComponent(slug)}`,
      'Cache-Control': 'public, max-age=86400'
    });
    res.end();
    return;
  }

  // Locate the markdown file
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
  const publishedDate = meta.date ? new Date(meta.date).toISOString() : new Date().toISOString();
  const articleSection = meta.category || 'Health';

  // Read the base blog-post.html template
  const templatePath = path.join(process.cwd(), 'blog-post.html');
  let html = fs.readFileSync(templatePath, 'utf8');

  // Inject the correct per-post values into the static head.
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
    // canonical link
    .replace(
      /(<link rel="canonical"[^>]*href=")[^"]*(")/,
      `$1${escAttr(canonicalUrl)}$2`
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
    // og:url
    .replace(
      /(<meta property="og:url" content=")[^"]*(")/,
      `$1${escAttr(canonicalUrl)}$2`
    )
    // og:image
    .replace(
      /(<meta property="og:image" content=")[^"]*(")/,
      `$1${escAttr(ogImage)}$2`
    )
    // article:published_time
    .replace(
      /(<meta property="article:published_time" content=")[^"]*(")/,
      `$1${escAttr(publishedDate)}$2`
    )
    // article:section
    .replace(
      /(<meta property="article:section" content=")[^"]*(")/,
      `$1${escAttr(articleSection)}$2`
    )
    // author
    .replace(
      /(<meta name="author" content=")[^"]*(")/,
      `$1MediHelp$2`
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
    // robots — template defaults to noindex; SSR posts must be indexable
    .replace(
      /(<meta name="robots" content=")[^"]*(")/,
      '$1index, follow$2'
    );

  // Inject server-side BlogPosting JSON-LD schema before </head>
  const jsonLdBlock = buildJsonLd(meta, slug, canonicalUrl);
  html = html.replace('</head>', `${jsonLdBlock}\n</head>`);

  res.setHeader('Content-Type', 'text/html; charset=utf-8');
  // Cache for 1 hour on CDN edge; still stale-while-revalidate for freshness
  res.setHeader('Cache-Control', 'public, max-age=3600, stale-while-revalidate=86400');
  res.status(200).send(html);
};
