/**
 * MediHelp — blog_handler.js
 * Handles: Blog fetching from GitHub, Error Logging to Supabase,
 * Read Count tracking, and theme + FAQ rendering
 */

const SUPABASE_URL  = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

let _supabase = null;
function getClient() {
  if (!_supabase && window.supabase) {
    _supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
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

  // ── Blog Fetcher (GitHub API) ─────────────────────────────────────────────
  fetchBlogs: async function() {
    const owner = 'HasanFerozQ';
    const repo  = 'MedHelp';
    const path  = 'blog';

    // Use raw GitHub API — add cache-busting to avoid stale 304s
    const api = `https://api.github.com/repos/${owner}/${repo}/contents/${path}?ref=main&_=${Date.now()}`;

    try {
      const res = await fetch(api, {
        headers: { 'Accept': 'application/vnd.github.v3+json' }
      });

      if (!res.ok) {
        this.logError(`GitHub API ${res.status}: ${res.statusText}`);
        return [];
      }

      const files = await res.json();
      if (!Array.isArray(files)) { this.logError('GitHub API did not return array'); return []; }

      const mdFiles = files.filter(f => f.name.endsWith('.md') && f.type === 'file');

      const posts = await Promise.all(mdFiles.map(async file => {
        try {
          const rawUrl = file.download_url + (file.download_url.includes('?') ? '&' : '?') + `_=${Date.now()}`;
          const rawRes = await fetch(rawUrl);
          if (!rawRes.ok) throw new Error(`Fetch ${file.name} failed: ${rawRes.status}`);
          const text = await rawRes.text();
          return this._parseFrontmatter(text, file.name);
        } catch (e) {
          console.error(`MediHelp Blog Error: ${file.name}`, e);
          this.logError(`Failed to fetch post ${file.name}: ${e.message}`);
          return null;
        }
      }));

      return posts
        .filter(Boolean)
        .sort((a, b) => new Date(b.date) - new Date(a.date));

    } catch (e) {
      this.logError('fetchBlogs failed: ' + e.message);
      return [];
    }
  },

  // ── Parse Frontmatter from .md ────────────────────────────────────────────
  _parseFrontmatter: function(text, filename) {
    const slug = filename.replace('.md', '');
    const fm = {};

    // Extract YAML front matter block between ---
    const fmMatch = text.match(/^---\s*\n([\s\S]*?)\n---/);
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

  // ── Read Count (Supabase blog_stats) ─────────────────────────────────────
  incrementReadCount: async function(slug) {
    const db = getClient();
    if (!db) return 0;
    try {
      // Try to fetch existing count
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

// ── Global error catcher ──────────────────────────────────────────────────
window.addEventListener('error', (e) => {
  MediHelp.logError(`${e.message} at ${e.filename}:${e.lineno}`);
});
window.addEventListener('unhandledrejection', (e) => {
  MediHelp.logError('Unhandled Promise: ' + (e.reason?.message || e.reason));
});

// ── Dark / Light Theme ────────────────────────────────────────────────────
(function initTheme() {
  const saved = localStorage.getItem('mh-theme') || 'dark';
  document.documentElement.setAttribute('data-theme', saved);

  document.addEventListener('DOMContentLoaded', () => {
    const btn = document.getElementById('theme-toggle');
    if (!btn) return;
    btn.textContent = saved === 'dark' ? '☀️' : '🌙';
    btn.addEventListener('click', () => {
      const cur = document.documentElement.getAttribute('data-theme');
      const next = cur === 'dark' ? 'light' : 'dark';
      document.documentElement.setAttribute('data-theme', next);
      localStorage.setItem('mh-theme', next);
      btn.textContent = next === 'dark' ? '☀️' : '🌙';
    });
  });
})();

// ── FAQ Renderer ──────────────────────────────────────────────────────────
function renderFAQ(containerId, items) {
  document.addEventListener('DOMContentLoaded', () => {
    const el = document.getElementById(containerId);
    if (!el) return;
    el.innerHTML = items.map((item, i) => `
      <div class="faq-item" id="faq-item-${containerId}-${i}">
        <button class="faq-q" onclick="toggleFAQ('faq-item-${containerId}-${i}')">
          ${item.q}
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        </button>
        <div class="faq-a">${item.a}</div>
      </div>`).join('');
  });
}

function toggleFAQ(id) {
  const el = document.getElementById(id);
  el.classList.toggle('open');
}
