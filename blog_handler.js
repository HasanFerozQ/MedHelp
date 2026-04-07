/**
 * MediHelp — blog_handler.js
 * Handles: Blog fetching from GitHub, Error Logging to Supabase,
 * and Read Count tracking. (Theme and FAQ handled by core.js)
 */

let _supabase = null;
function getClient() {
  if (window.dbClient) return window.dbClient;
  if (!_supabase && window.supabase) {
    const URL  = 'https://bisqgousuvljttesjkkm.supabase.co';
    const KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';
    _supabase = window.supabase.createClient(URL, KEY);
  }
  return _supabase;
}

window.MediHelp = {

  // ── Error Logger ──────────────────────────────────────────────────────────
  logError: async function(message, page) {
    const db = getClient();
    if (!db) return;
    try {
      await db.from('site_logs').insert([{
        source: 'website',
        page: page || window.location.pathname,
        error_message: String(message).substring(0, 500),
        user_agent: navigator.userAgent
      }]);
    } catch (e) { /* silent */ }
  },

  // ── Local Blog Fetcher ───────────────────────────────────────────────────
  fetchBlogs: async function() {
    try {
      const manifestRes = await fetch(`./blog/manifest.json?_=${Date.now()}`);
      if (!manifestRes.ok) return [];
      
      const json = await manifestRes.json();
      const filenames = json.posts;

      if (!Array.isArray(filenames)) return [];

      const posts = await Promise.all(filenames.map(async name => {
        try {
          const res = await fetch(`./blog/${name}?_=${Date.now()}`);
          if (!res.ok) throw new Error(`Fetch ${name} failed`);
          const text = await res.text();
          return this._parseFrontmatter(text, name);
        } catch (e) {
          return null;
        }
      }));

      return posts
        .filter(Boolean)
        .sort((a, b) => new Date(b.date) - new Date(a.date));

    } catch (e) {
      if (this.logError) this.logError('fetchBlogs failed: ' + e.message);
      return [];
    }
  },

  // ── Parse Frontmatter from .md ────────────────────────────────────────────
  _parseFrontmatter: function(text, filename) {
    const slug = filename.replace('.md', '');
    const fm = {};
    const trimmedText = text.trim();
    const fmMatch = trimmedText.match(/^---\s*\n([\s\S]*?)\n---/);
    if (fmMatch) {
      const lines = fmMatch[1].split('\n');
      lines.forEach(line => {
        const colonIdx = line.indexOf(':');
        if (colonIdx === -1) return;
        const key = line.substring(0, colonIdx).trim().toLowerCase();
        const val = line.substring(colonIdx + 1).trim().replace(/^"|"$/g, '');
        fm[key] = val;
      });
    }

    return {
      slug,
      title:     fm.title     || slug.replace(/-/g, ' '),
      date:      fm.date      || '2026-01-01',
      thumbnail: fm.thumbnail || '',
      category:  fm.category  || 'General',
      summary:   fm.summary   || '',
      raw:       text
    };
  },

  // ── Read Count ──────────────────────────────────────────────────────────
  incrementReadCount: async function(slug) {
    const db = getClient();
    if (!db) return 0;
    try {
      const { data } = await db
        .from('blog_stats')
        .select('read_count')
        .eq('slug', slug)
        .maybeSingle();

      const newCount = (data?.read_count ?? 0) + 1;

      await db.from('blog_stats').upsert(
        { slug, read_count: newCount, last_read_at: new Date().toISOString() },
        { onConflict: 'slug' }
      );
      return newCount;
    } catch (e) {
      this.logError('incrementReadCount: ' + e.message);
      return 0;
    }
  }
};

// Global error catcher
window.addEventListener('error', (e) => {
  if (window.MediHelp) MediHelp.logError(`${e.message} at ${e.filename}:${e.lineno}`);
});
window.addEventListener('unhandledrejection', (e) => {
  if (window.MediHelp) MediHelp.logError('Unhandled Promise: ' + (e.reason?.message || e.reason));
});
