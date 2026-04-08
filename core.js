/**
 * MediHelp — core.js
 * Global Utilities: Shared Supabase init, Theme toggling, FAQ rendering, and common UI helpers.
 */

// 1. Initialize Supabase globally
const SUPABASE_URL  = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

if (window.supabase) {
  window.dbClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
}

// 2. Global Theme (Dark/Light) Logic
(function initTheme() {
  const saved = localStorage.getItem('mh-theme') || 'dark';
  document.documentElement.setAttribute('data-theme', saved);

  document.addEventListener('DOMContentLoaded', () => {
    const btn = document.getElementById('theme-toggle');
    if (!btn) return;
    
    // Sync button icon
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

// 3. Shared Utils: Debounce
function debounce(fn, wait) {
  let timeout;
  return function(...args) {
    clearTimeout(timeout);
    timeout = setTimeout(() => fn.apply(this, args), wait);
  };
}

// 4. Shared Utils: FAQ Rendering
function renderFAQ(containerId, items) {
  const el = document.getElementById(containerId);
  if (!el) return;
  
  el.innerHTML = items.map((item, i) => `
    <div class="faq-item" id="faq-item-${containerId}-${i}">
      <button class="faq-q" onclick="toggleFAQ('faq-item-${containerId}-${i}')" aria-expanded="false">
        <h3 style="margin:0; font-size:15px; font-weight:700; color:inherit; display:flex; align-items:center; gap:10px; flex:1; text-align:left;">
          ${item.q}
        </h3>
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
      </button>
      <div class="faq-a">${item.a}</div>
    </div>`).join('');
}

function toggleFAQ(id) {
  const el = document.getElementById(id);
  if (el) el.classList.toggle('open');
}

// 5. Global Tab Switcher (UI only)
function switchTab(tabId, btn) {
  if (!btn) return;
  const container = btn.closest('.suite-wrapper') || btn.closest('.audit-area');
  if (!container) return;

  // Deactivate all buttons in this bar
  const buttons = btn.parentElement.querySelectorAll('.tab-btn, .audit-tab');
  buttons.forEach(b => b.classList.remove('active'));

  // Deactivate all panels in this container
  const panels = container.querySelectorAll('.tab-panel, .audit-panel');
  panels.forEach(p => p.classList.remove('active'));

  // Activate selected
  btn.classList.add('active');
  const target = document.getElementById(tabId);
  if (target) target.classList.add('active');
}

// 6. MediHelp Global Namespace & Advanced Fetch (v4.6)
const MediHelp = {
  fetchBlogs: async function() {
    console.log('MediHelp: Fetching authoritative blog content from local storage...');
    try {
      // 1. Fetch manifest
      const mRes = await fetch('blog/manifest.json');
      if (!mRes.ok) throw new Error('Manifest not found');
      const manifest = await mRes.json();
      
      // 2. Fetch all posts in parallel
      const postPromises = manifest.posts.map(async (filename) => {
        try {
          const pRes = await fetch(`blog/${filename}`);
          if (!pRes.ok) return null;
          const raw = await pRes.text();
          
          // 3. Parse YAML Frontmatter (Regex)
          const fmMatch = raw.match(/^---\n([\s\S]+?)\n---/);
          if (!fmMatch) return null;
          
          const meta = {};
          fmMatch[1].split('\n').forEach(line => {
            const [key, ...valParts] = line.split(':');
            if (key && valParts.length > 0) {
              meta[key.trim()] = valParts.join(':').trim().replace(/^["']|["']$/g, '');
            }
          });

          return {
            ...meta,
            slug: filename.replace('.md', ''),
            raw: raw,
            date: meta.date ? new Date(meta.date) : new Date(0)
          };
        } catch (e) {
          console.error(`MediHelp: Failed to load ${filename}`, e);
          return null;
        }
      });

      const posts = (await Promise.all(postPromises))
        .filter(p => p !== null)
        .sort((a, b) => b.date - a.date);

      return posts;
    } catch (err) {
      console.error('MediHelp: Blog restoration failed:', err);
      return [];
    }
  },

  toggleMobileMenu: function() {
    const nav = document.querySelector('.nav-links');
    const toggle = document.querySelector('.nav-toggle');
    if (nav) nav.classList.toggle('active');
    if (toggle) toggle.classList.toggle('active');
  }
};

// Export to window
window.MediHelp = MediHelp;
window.debounce = debounce;
window.renderFAQ = renderFAQ;
window.toggleFAQ = toggleFAQ;
window.switchTab = switchTab;
