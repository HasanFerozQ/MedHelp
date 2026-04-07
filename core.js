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
      <button class="faq-q" onclick="toggleFAQ('faq-item-${containerId}-${i}')">
        ${item.q}
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

// Export common helpers to window for legacy support if needed
window.debounce = debounce;
window.renderFAQ = renderFAQ;
window.toggleFAQ = toggleFAQ;
window.switchTab = switchTab;
