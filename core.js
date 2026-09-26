/**
 * MediHelp — core.js
 * Global Utilities: Shared Supabase init, Theme toggling, FAQ rendering, and common UI helpers.
 * v4.9 — Nav slot, verify recovery, longer auth-sync wait for isPremium (20s).
 */

// 1. Initialize Supabase globally
const SUPABASE_URL  = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

// 1. Initialize Supabase globally with retry logic
window.RECAPTCHA_SITE_KEY = '6LeXyEctAAAAAH_iOMGLxvMGtQ1doCo3j1lSwVuR';

window.initDbClient = function() {
  if (window.dbClient) return window.dbClient;
  if (window.supabase) {
    window.dbClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
    console.log("MediHelp: dbClient initialized.");
    return window.dbClient;
  }
  return null;
};
window.initDbClient();

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

// 2.5 Minimal loading overlay — gear spinner, simple label, and progress bar
(function initPageLoader() {
  const ID = 'mh-page-loader';
  const existing = document.getElementById(ID);

  const css = `
  #${ID} { position: fixed; inset:0; pointer-events:none; z-index:99999; opacity:0; transition:opacity 220ms ease; background:rgba(7,10,16,0.84); backdrop-filter: blur(10px); }
  #${ID}.active { opacity:1; pointer-events:auto; }
  #${ID} .shell { position:fixed; inset:0; display:flex; align-items:center; justify-content:center; flex-direction:column; gap:12px; padding:24px; }
  #${ID} .row { display:flex; align-items:center; gap:12px; }
  #${ID} .gear { width:34px; height:34px; border-radius:50%; border:3px solid rgba(255,255,255,0.9); border-top-color:rgba(34,197,94,0.85); border-right-color:rgba(6,182,212,0.85); animation:mh-spin 900ms linear infinite; position:relative; box-shadow: inset 0 0 0 2px rgba(255,255,255,0.08); }
  #${ID} .gear::before { content:''; position:absolute; inset:7px; border-radius:50%; border:2px solid rgba(255,255,255,0.62); }
  #${ID} .gear::after { content:''; position:absolute; inset:0; transform:rotate(45deg); border-radius:50%; border:3px solid transparent; border-top-color:rgba(255,255,255,0.55); }
  #${ID} .label { color:#f8fafc; font-weight:700; letter-spacing:0.16em; text-transform:uppercase; font-size:13px; line-height:1; }
  #${ID} .progress { width:min(260px, 72vw); height:7px; border-radius:999px; overflow:hidden; background:rgba(255,255,255,0.1); }
  #${ID} .progress > div { height:100%; width:0%; border-radius:inherit; background:linear-gradient(90deg,#22c55e,#06b6d4,#8b5cf6); transition:width 260ms ease; }
  @keyframes mh-spin { to { transform: rotate(360deg); } }
  `;

  const style = document.createElement('style');
  style.id = 'mh-page-loader-style';
  style.textContent = css;
  (document.head || document.documentElement).appendChild(style);

  let wrap = existing;
  if (!wrap) {
    wrap = document.createElement('div');
    wrap.id = ID;
    wrap.innerHTML = `
      <div class="shell">
        <div class="row">
          <div class="gear" aria-hidden="true"></div>
          <div class="label">Loading</div>
        </div>
        <div class="progress"><div id="mh-progress-bar"></div></div>
      </div>
    `;

    function mount() { if (!document.body) return requestAnimationFrame(mount); document.body.prepend(wrap); }
    mount();
  }

  let progress = 0;
  let trickle = null;
  let finishTimer = null;
  let started = false;
  let startTime = 0;
  const MIN_VISIBLE_MS = 350;
  const bar = () => document.getElementById('mh-progress-bar');
  const overlay = () => document.getElementById(ID);

  function setProgress(p) {
    progress = Math.min(100, Math.max(progress, p));
    const el = bar(); if (el) el.style.width = progress + '%';
  }

  function getEstimatedDuration() {
    const path = (location.pathname || '').toLowerCase();
    if (path.includes('global-health-statistics')) return 2200;
    if (path.includes('medical-calculator') || path.includes('calculator')) return 1800;
    if (path.includes('medical-exam')) return 1600;
    if (path.includes('medical-bill-audit')) return 1400;
    return 1200;
  }

  function start(opts = {}) {
    if (started) return;
    started = true;
    startTime = performance.now();
    const el = overlay();
    if (!el) return;
    const duration = Math.max(MIN_VISIBLE_MS, opts.estimatedMs || getEstimatedDuration());
    el.classList.add('active');
    setProgress(10);
    clearInterval(trickle);
    clearTimeout(finishTimer);
    const interval = Math.max(140, Math.min(300, duration / 12));
    trickle = setInterval(() => {
      const next = progress < 40 ? progress + 10 : progress < 75 ? progress + 5 : progress + 1.5;
      setProgress(Math.min(92, next));
    }, interval);

    const early = Math.max(180, Math.min(700, duration * 0.3));
    const mid = Math.max(550, Math.min(1600, duration * 0.65));
    setTimeout(() => setProgress(Math.min(70, 50 + Math.round(duration / 1000 * 12))), early);
    setTimeout(() => setProgress(Math.min(88, 72 + Math.round(duration / 1000 * 10))), mid);
  }

  function done() {
    clearInterval(trickle);
    clearTimeout(finishTimer);
    setProgress(100);
    const elapsed = performance.now() - startTime;
    const remain = Math.max(0, MIN_VISIBLE_MS - elapsed);
    finishTimer = setTimeout(() => {
      const el = overlay();
      if (!el) return;
      el.classList.remove('active');
      setProgress(0);
      started = false;
    }, remain + 80);
  }

  function safeHide() {
    const el = overlay();
    if (!el) return;
    if (el.classList.contains('active')) {
      clearInterval(trickle);
      clearTimeout(finishTimer);
      setProgress(100);
      el.classList.remove('active');
      setProgress(0);
      started = false;
    }
  }

  document.addEventListener('click', (e) => {
    const a = e.target.closest && e.target.closest('a[href]');
    if (!a) return;
    if (a.target === '_blank' || a.hasAttribute('download')) return;
    if (e.metaKey || e.ctrlKey || e.shiftKey || e.altKey) return;
    try {
      const url = new URL(a.href, location.href);
      const sameOrigin = url.origin === location.origin;
      const samePath = url.pathname === location.pathname && url.search === location.search;
      if (sameOrigin && !samePath) {
        e.preventDefault();
        start({ estimatedMs: getEstimatedDuration(url.pathname) });
        setTimeout(() => {
          window.location.assign(url.href);
        }, 260);
      }
    } catch (_) {}
  }, true);

  window.MediHelpPageLoader = { start, done, setProgress, safeHide };

  document.addEventListener('DOMContentLoaded', () => {
    try {
      setProgress(95);
      done();
    } catch (e) {}
  }, { once: true });

  window.addEventListener('load', () => {
    try {
      setProgress(100);
      setTimeout(done, 80);
    } catch (e) {}
  });

  // Safety net: if loader is still visible after 8s, force-hide it
  let safetyTimer = null;
  const resetSafetyNet = () => {
    clearTimeout(safetyTimer);
    safetyTimer = setTimeout(() => {
      safeHide();
    }, 8000);
  };

  const origStart = start;
  window.MediHelpPageLoader.start = function(opts) {
    resetSafetyNet();
    return origStart.call(this, opts);
  };

  if (document.readyState === 'loading') {
    setTimeout(() => start({ estimatedMs: getEstimatedDuration() }), 80);
  } else {
    setProgress(95);
    done();
  }
})();

// 3. Shared Utils: Debounce
function debounce(fn, wait) {
  let timeout;
  return function(...args) {
    clearTimeout(timeout);
    timeout = setTimeout(() => fn.apply(this, args), wait);
  };
}

// 4. Shared Utils: Security Helper (Escape HTML)
function escapeHtml(str) {
  if (!str) return '';
  return String(str)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

function formatMcqHtml(str) {
  if (!str) return '';
  return escapeHtml(str)
    .replace(/&lt;br\s*\/?&gt;/gi, '<br>')
    .replace(/&lt;b&gt;/gi, '<b>')
    .replace(/&lt;\/b&gt;/gi, '</b>')
    .replace(/&lt;strong&gt;/gi, '<strong>')
    .replace(/&lt;\/strong&gt;/gi, '</strong>')
    .replace(/&lt;ul&gt;/gi, '<ul>')
    .replace(/&lt;\/ul&gt;/gi, '</ul>')
    .replace(/&lt;li&gt;/gi, '<li>')
    .replace(/&lt;\/li&gt;/gi, '</li>')
    .replace(/&amp;bull;/gi, '&bull;')
    .replace(/&amp;nbsp;/gi, '&nbsp;')
    .replace(/\n/g, '<br>');
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

// 6. MediHelp Global Namespace & Advanced Fetch (v4.9)
const MediHelp = {
  trackEvent: function(eventName, params = {}) {
    try {
      if (typeof window.gtag === 'function') {
        window.gtag('event', eventName, params);
      }
    } catch (e) {
      console.warn('MediHelp trackEvent error:', e);
    }
  },

  initTheme: function() {
    const saved = localStorage.getItem('mh-theme') || 'dark';
    document.documentElement.setAttribute('data-theme', saved);
    const btn = document.getElementById('theme-toggle');
    if (btn) btn.textContent = saved === 'dark' ? '☀️' : '🌙';
  },

  fetchBlogs: async function() {
    console.log('MediHelp: Fetching authoritative blog content from local storage...');
    try {
      // 1. Fetch manifest
      const mRes = await fetch('/blog/manifest.json');
      if (!mRes.ok) throw new Error('Manifest not found');
      const manifest = await mRes.json();
      
      // 2. Fetch all posts in parallel
      const postPromises = manifest.posts.map(async (filename) => {
        try {
          const pRes = await fetch(`/blog/${filename}`);
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

  // 6.1 Live Read Count Tracking
  trackBlogView: async function(slug) {
    if (!slug || !window.dbClient) return;
    try {
      await window.dbClient.rpc('increment_blog_view', { blog_slug: slug });
      console.log(`MediHelp: View tracked for ${slug}`);
    } catch (e) {
      console.warn('MediHelp: Tracking failed', e);
    }
  },

  fetchReadCount: async function(slug) {
    if (!slug || !window.dbClient) return this.getSimulatedCount(slug);
    try {
      const { data, error } = await window.dbClient
        .from('blog_analytics')
        .select('view_count')
        .eq('slug', slug)
        .single();
      
      if (error || !data) return this.getSimulatedCount(slug);
      return data.view_count;
    } catch (e) {
      return this.getSimulatedCount(slug);
    }
  },

  getSimulatedCount: function(slug) {
    let hash = 0;
    for (let i = 0; i < slug.length; i++) {
      hash = ((hash << 5) - hash) + slug.charCodeAt(i);
      hash |= 0; 
    }
    return Math.abs(hash % 1000) + 150;
  },

  revealReadCount: async function(event, element, slug) {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    
    const countSpan = element.querySelector('.read-count-value');
    if (!countSpan) return;

    if (countSpan.style.display === 'none') {
      countSpan.textContent = '...';
      countSpan.style.display = 'inline';
      try {
        const count = await this.fetchReadCount(slug);
        countSpan.textContent = `${count} reads`;
      } catch (e) {
        countSpan.textContent = 'Error';
      }
    } else {
      countSpan.style.display = 'none';
    }
  },

  toggleMobileMenu: function() {
    const nav = document.querySelector('.nav-links');
    const toggle = document.querySelector('.nav-toggle');
    const body = document.body;
    
    // Create backdrop if it doesn't exist
    let backdrop = document.querySelector('.nav-backdrop');
    if (!backdrop) {
      backdrop = document.createElement('div');
      backdrop.className = 'nav-backdrop';
      document.body.appendChild(backdrop);
      backdrop.onclick = () => MediHelp.toggleMobileMenu();
    }

    const isActive = nav.classList.contains('active');
    
    if (!isActive) {
      nav.classList.add('active');
      toggle.classList.add('active');
      backdrop.classList.add('active');
      body.style.overflow = 'hidden';
    } else {
      nav.classList.remove('active');
      toggle.classList.remove('active');
      backdrop.classList.remove('active');
      body.style.overflow = '';
    }

    // Close menu when clicking links
    const navLinks = nav.querySelectorAll('a');
    navLinks.forEach(link => {
      link.onclick = () => {
        nav.classList.remove('active');
        toggle.classList.remove('active');
        backdrop.classList.remove('active');
        body.style.overflow = '';
      };
    });
  },

  initMobileNav: function() {
    const dropdownBtns = document.querySelectorAll('.nav-dropdown-btn');
    dropdownBtns.forEach(btn => {
      if (window.innerWidth <= 900) {
        btn.textContent = btn.textContent.replace(' ▼', '').replace('▼', '');
      }
    });
  },

  initFeedbackWidget: function() {
    // 1. Create Floating Button
    const fab = document.createElement('button');
    fab.className = 'feedback-fab';
    fab.innerHTML = `
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
      </svg>`;
    fab.title = "Send Feedback";
    document.body.appendChild(fab);

    // Load reCAPTCHA v3 script dynamically if not present
    if (!document.querySelector('script[src*="recaptcha/api.js"]')) {
      const script = document.createElement('script');
      script.src = `https://www.google.com/recaptcha/api.js?render=${window.RECAPTCHA_SITE_KEY}`;
      script.async = true;
      script.defer = true;
      document.head.appendChild(script);
    }

    // 2. Create Modal
    const modal = document.createElement('div');
    modal.id = 'feedback-modal';
    modal.className = 'feedback-modal';
    modal.innerHTML = `
      <div class="feedback-content">
        <button class="close-feedback" style="display: flex; align-items: center; justify-content: center; padding: 4px;"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><path d="M18 6 6 18"/><path d="m6 6 12 12"/></svg></button>
        <div class="feedback-header">
          <h3>Share Feedback</h3>
          <p>Encountered a bug or have a suggestion? Let us know below.</p>
        </div>
        <form class="feedback-form" id="global-feedback-form">
          <div class="form-group">
            <label>Type of Feedback</label>
            <select id="fb-type" required>
              <option value="General">General Inquiry</option>
              <option value="Bug">Bug Report</option>
              <option value="Feature">Feature Request</option>
              <option value="Complaint">Complaint</option>
            </select>
          </div>
          <div class="form-group">
            <label>Your Name</label>
            <input type="text" id="fb-name" placeholder="John Doe">
          </div>
          <div class="form-group">
            <label>Your Email</label>
            <input type="email" id="fb-email" placeholder="email@example.com" required>
          </div>
          <div class="form-group">
            <label>Phone (Optional)</label>
            <input type="tel" id="fb-phone" placeholder="e.g. +1 (555) 000-0000">
          </div>
          <div class="form-group">
            <label>Message</label>
            <textarea id="fb-message" placeholder="Describe your feedback here..." required></textarea>
          </div>
          <button type="submit" class="btn-submit">Send Feedback</button>
        </form>
      </div>`;
    document.body.appendChild(modal);

    // 3. Event Listeners
    const closeBtn = modal.querySelector('.close-feedback');
    fab.onclick = () => modal.classList.add('active');
    closeBtn.onclick = () => modal.classList.remove('active');
    window.onclick = (e) => { if (e.target === modal) modal.classList.remove('active'); };

    function openFeedbackMailto(payload) {
      const to = payload.support_email || 'supportdesk@medihelp.live';
      const subject = encodeURIComponent(`[MediHelp Feedback] ${payload.type || 'General'}`);
      const body = encodeURIComponent(
        `Type: ${payload.type || 'General'}\nName: ${payload.name || ''}\nEmail: ${payload.email || ''}\nPhone: ${payload.phone || ''}\n\n${payload.message || ''}`
      );
      window.location.href = `mailto:${to}?subject=${subject}&body=${body}`;
    }

    // 4. Form Handling (server-side delivery)
    const form = modal.querySelector('#global-feedback-form');
    form.onsubmit = async (e) => {
      e.preventDefault();
      const submitBtn = form.querySelector('.btn-submit');
      const type = document.getElementById('fb-type').value;
      const name = document.getElementById('fb-name').value;
      const email = document.getElementById('fb-email').value;
      const phone = document.getElementById('fb-phone').value;
      const msg = document.getElementById('fb-message').value;

      submitBtn.disabled = true;
      submitBtn.textContent = 'Sending...';

      const sendFormData = async (recaptchaToken = '') => {
        try {
          const resp = await fetch('/api/feedback', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
              source: 'feedback-widget',
              type,
              name,
              email,
              phone,
              message: msg,
              page_url: window.location.href,
              recaptcha_token: recaptchaToken
            })
          });

          const data = await resp.json().catch(() => ({}));
          if (!resp.ok || !data.ok) {
            if (data.fallback_mailto) {
              const useMailto = confirm(
                (data.error || 'Could not send feedback.') +
                '\n\nOpen your email app to send this message to support instead?'
              );
              if (useMailto) {
                openFeedbackMailto({ type, name, email, phone, message: msg, support_email: data.support_email });
                modal.classList.remove('active');
                form.reset();
                return;
              }
            }
            throw new Error(data.error || 'Could not send feedback.');
          }

          if (data.email_warning) {
            form.innerHTML = `
              <div style="text-align:center; padding: 20px;">
                <h3 style="color:#ff5555; margin-bottom:8px;">Database Saved, Email Failed</h3>
                <p style="font-size:13px; color:var(--text-muted); margin-bottom:12px;">Your feedback was saved in the admin panel, but the email notification failed to send due to a configuration error:</p>
                <div style="background:rgba(255,0,0,0.1); border: 1px solid rgba(255,0,0,0.2); color:#ff5555; padding:10px; border-radius:6px; font-size:12px; margin-bottom:16px;">${escapeHtml(data.email_warning)}</div>
                <button type="button" onclick="document.getElementById('feedback-modal').classList.remove('active');" class="btn btn-ghost">Close</button>
              </div>
            `;
            return;
          }

          form.innerHTML = `
            <div style="text-align:center; padding: 20px;">
              <div style="margin-bottom: 24px; display: flex; justify-content: center;"><svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" style="color: var(--accent);"><polyline points="20 6 9 17 4 12"/></svg></div>
              <h3 style="color:var(--accent); margin-bottom:8px;">Feedback Sent</h3>
              <p style="font-size:13px; color:var(--text-muted);">Thank you! Our team will review it soon.</p>
              <button type="button" onclick="document.getElementById('feedback-modal').classList.remove('active');" class="btn btn-ghost" style="margin-top:10px;">Close</button>
            </div>
          `;
        } catch (err) {
          alert(err.message || 'Failed to send feedback. Please try again.');
        } finally {
          submitBtn.disabled = false;
          submitBtn.textContent = 'Send Feedback';
        }
      };

      if (typeof grecaptcha !== 'undefined') {
        grecaptcha.ready(() => {
          grecaptcha.execute(window.RECAPTCHA_SITE_KEY, { action: 'feedback' })
            .then((token) => {
              sendFormData(token);
            })
            .catch(() => {
              sendFormData('');
            });
        });
      } else {
        sendFormData('');
      }
    };
  },

  initSiteFooter: function() {
    if (document.querySelector('.site-footer .footer-grid')) return;

    const html = `
  <footer class="site-footer">
    <div class="container">
      <div class="footer-grid">
        <div class="footer-brand">
          <h3>MediHelp</h3>
          <p>Free tools and professional advocates helping patients fight medical billing errors and reduce hospital costs.</p>
          <div style="margin-top:16px; display:flex; gap:12px; margin-bottom: 16px;">
            <a href="https://www.linkedin.com/company/medihelplive/" target="_blank" rel="noopener" style="color:var(--text-muted); transition:0.3s;" title="Follow MediHelp on LinkedIn">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/></svg>
            </a>
          </div>
        </div>
        <div class="footer-col">
          <h4>Free Tools</h4>
          <ul>
            <li><a href="/medical-bill-audit">Bill Audit Tool</a></li>
            <li><a href="/cpt-code-search">CPT Code Lookup</a></li>
            <li><a href="/claim-denial-codes">Claim Denial Codes</a></li>
            <li><a href="/rx-savings">Rx Savings Search</a></li>
            <li><a href="/providers">Provider Search</a></li>
            <li><a href="/medical-calculator">Medical Calculator</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>Services</h4>
          <ul>
            <li><a href="/pricing" style="color:var(--expert-amber);">Human Bill Negotiation</a></li>
            <li><a href="/medical-exam-preparation" style="color:var(--accent); font-weight:700;">Medical Exam Mastery</a></li>
            <li><a href="/blog">Patient Blog</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>Legal</h4>
          <ul>
            <li><a href="/about">About Us</a></li>
            <li><a href="/editorial-policy">Editorial Policy</a></li>
            <li><a href="/privacy">Privacy Policy</a></li>
            <li><a href="/terms">Terms of Service</a></li>
            <li><a href="/refund">Refund Policy</a></li>
            <li><a href="/pricing">Pricing</a></li>
            <li><a href="/contact">Contact Us</a></li>
            <li><a href="/sitemap.xml">Sitemap</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom" style="justify-content:center; border-top:1px solid var(--border); padding-top:40px; flex-direction:column; gap:10px; align-items:center;">
        <span>© 2026 MediHelp. All Rights Reserved.</span>
        <span style="font-size:11px; opacity:0.7;">Informational only. Not medical or legal advice. <a href="/terms" style="color:var(--accent); text-decoration:none; font-weight:700;">Terms & Disclaimer</a></span>
        <span style="display:block; font-size:10px; opacity:0.5;">Support: supportdesk@medihelp.live</span>
      </div>
    </div>
  </footer>`;

    const existing = document.querySelector('.site-footer');
    if (existing) {
      existing.outerHTML = html;
    } else {
      document.body.insertAdjacentHTML('beforeend', html);
    }
  },

  initGlobalNegotiationBanner: function() {
    const path = window.location.pathname || '';
    if (path.includes('/medical-bill-audit') || path.includes('/audit')) return; // audit page has dedicated CTA block
    if (document.getElementById('global-negotiation-banner')) return;

    const footer = document.querySelector('.site-footer');
    if (!footer || !footer.parentNode) return;

    const wrap = document.createElement('section');
    wrap.id = 'global-negotiation-banner';
    wrap.className = 'global-negotiation-banner';
    wrap.innerHTML = `
      <div class="container">
        <div class="global-negotiation-banner__card">
          <div class="global-negotiation-banner__kicker">MediHelp Premium Service</div>
          <h3 class="global-negotiation-banner__title">Human Negotiation: Full Audit + Provider Negotiation</h3>
          <p class="global-negotiation-banner__text">We re-audit your bill, build your dispute case, and negotiate with billing teams directly to reduce your payable balance.</p>
          <div class="global-negotiation-banner__points">
            <span>Includes expert line-item audit</span>
            <span>$15 initiation fee</span>
            <span>15% success-based only on realized savings</span>
          </div>
          <a class="btn global-negotiation-banner__btn" href="/medical-bill-audit#human-negotiation">Start Full Audit + Negotiation</a>
        </div>
      </div>
    `;
    footer.parentNode.insertBefore(wrap, footer);
  },

  initAuthModal: function() {
    if (document.getElementById('auth-modal')) return;

    // Add modal to body
    const modal = document.createElement('div');
    modal.id = 'auth-modal';
    modal.className = 'auth-modal';
    modal.innerHTML = `
      <div class="auth-modal-content">
        <button type="button" class="auth-close" onclick="MediHelp.hideAuthModal()">&times;</button>
        <h2 id="auth-title">Sign In to MediHelp</h2>
        
        <!-- IN-SITE ERROR / ALERT CARD INSIDE MODAL -->
        <div id="auth-error-card" class="auth-error-card hidden"></div>

        <form id="auth-form" class="auth-form">
          <input type="email" id="auth-email" placeholder="Email" required>
          <input type="text" id="auth-username" placeholder="Username" maxlength="24" style="display:none;">
          <div class="password-wrapper">
            <input type="password" id="auth-password" placeholder="Password" required>
            <button type="button" class="password-toggle" id="password-toggle" title="Show/Hide Password">👁️</button>
          </div>
          <div id="password-rules" class="password-rules hidden">
            Password must be 8+ characters with uppercase, lowercase, and a number.
          </div>
          <div style="text-align: right; margin-top: 4px; margin-bottom: 8px;">
            <a href="javascript:void(0)" id="auth-forgot-link" class="auth-forgot-link" onclick="MediHelp.handleForgotPassword()" style="font-size: 12px; color: var(--text-muted); text-decoration: none;">Forgot Password?</a>
          </div>
          <button type="submit" class="btn btn-primary" id="auth-submit">Sign In</button>
        </form>
        <div class="auth-toggle" onclick="MediHelp.toggleAuthMode()">Don't have an account? Sign Up</div>
      </div>
    `;
    document.body.appendChild(modal);

    // Add styles
    const style = document.createElement('style');
    style.textContent = `
      .auth-modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.8);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 1000;
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
      }
      .auth-modal.active {
        opacity: 1;
        visibility: visible;
      }
      .auth-modal-content {
        background: var(--bg-card);
        border: 1px solid var(--border);
        border-radius: 16px;
        padding: 40px;
        max-width: 400px;
        width: 90%;
        text-align: center;
        position: relative;
        box-sizing: border-box;
      }
      .auth-modal h2 {
        margin-bottom: 20px;
        color: var(--text-h);
      }
      .auth-form input {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid var(--border);
        border-radius: 8px;
        background: var(--bg);
        color: var(--text);
        box-sizing: border-box;
      }
      .auth-form .btn {
        width: 100%;
        margin: 10px 0;
      }
      .password-wrapper {
        position: relative;
        width: 100%;
      }
      .password-toggle {
        position: absolute;
        right: 12px;
        top: 50%;
        transform: translateY(-50%);
        background: none;
        border: none;
        cursor: pointer;
        font-size: 18px;
        padding: 0;
        color: var(--text-muted);
        opacity: 0.7;
      }
      .password-toggle:hover { opacity: 1; }
      .password-rules {
        font-size: 11px;
        color: var(--text-muted);
        text-align: left;
        margin: -5px 0 10px 4px;
        line-height: 1.4;
      }
      .password-rules.hidden { display: none; }
      .auth-toggle {
        margin-top: 20px;
        color: var(--text-muted);
        cursor: pointer;
      }
      .auth-toggle:hover {
        color: var(--accent);
      }
      .auth-close {
        position: absolute;
        top: 10px;
        right: 10px;
        background: none;
        border: none;
        font-size: 24px;
        cursor: pointer;
        color: var(--text-muted);
      }
      .auth-error-card {
        background: rgba(239, 68, 68, 0.12);
        border: 1px solid rgba(239, 68, 68, 0.35);
        color: #f87171;
        padding: 12px 14px;
        border-radius: 10px;
        font-size: 13px;
        line-height: 1.45;
        margin-bottom: 14px;
        text-align: left;
      }
      .auth-error-card.info {
        background: rgba(59, 130, 246, 0.12);
        border-color: rgba(59, 130, 246, 0.35);
        color: #60a5fa;
      }
      .auth-error-card.success {
        background: rgba(34, 197, 94, 0.12);
        border-color: rgba(34, 197, 94, 0.35);
        color: #4ade80;
      }
      .auth-error-card.hidden { display: none; }
      .auth-card-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-weight: 700;
        margin-bottom: 6px;
      }
      .auth-card-close {
        background: none;
        border: none;
        color: inherit;
        font-size: 18px;
        cursor: pointer;
        opacity: 0.7;
        padding: 0;
        line-height: 1;
      }
      .auth-card-close:hover { opacity: 1; }
      .auth-card-actions {
        display: flex;
        gap: 8px;
        margin-top: 10px;
        flex-wrap: wrap;
      }
      .auth-card-btn {
        background: rgba(255, 255, 255, 0.15);
        border: 1px solid rgba(255, 255, 255, 0.25);
        color: inherit;
        padding: 6px 12px;
        border-radius: 6px;
        font-size: 12px;
        font-weight: 700;
        cursor: pointer;
        transition: background 0.2s;
      }
      .auth-card-btn:hover {
        background: rgba(255, 255, 255, 0.25);
      }
    `;
    document.head.appendChild(style);

    const validateEmail = (email) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    const validatePassword = (password) => {
      const rules = {
        length: password.length >= 8,
        upper: /[A-Z]/.test(password),
        lower: /[a-z]/.test(password),
        number: /[0-9]/.test(password)
      };
      return rules.length && rules.upper && rules.lower && rules.number;
    };

    // Auth logic
    this.isSignUp = false;

    // Toggle Password Visibility
    const passInput = document.getElementById('auth-password');
    const passToggle = document.getElementById('password-toggle');
    const eyeOpen = `<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>`;
    const eyeClosed = `<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>`;
    
    passToggle.innerHTML = eyeOpen;
    passToggle.onclick = () => {
      const isPass = passInput.type === 'password';
      passInput.type = isPass ? 'text' : 'password';
      passToggle.innerHTML = isPass ? eyeClosed : eyeOpen;
    };

    // Form submit
    document.getElementById('auth-form').addEventListener('submit', async (e) => {
      e.preventDefault();
      this.hideAuthError();

      const email = document.getElementById('auth-email').value.trim().toLowerCase();
      const username = document.getElementById('auth-username').value.trim();
      const password = document.getElementById('auth-password').value;
      const submitBtn = document.getElementById('auth-submit');

      if (!validateEmail(email)) {
        this.showAuthError('Please enter a valid email address.', { title: 'Invalid Email' });
        return;
      }
      if (this.isSignUp && !validatePassword(password)) {
        this.showAuthError('Password must contain at least 8 characters, including uppercase, lowercase, and a number.', { title: 'Password Requirements' });
        return;
      }

      submitBtn.disabled = true;
      submitBtn.textContent = this.isSignUp ? 'Creating Account...' : 'Signing In...';

      try {
        let result;
        if (this.isSignUp) {
          result = await window.dbClient.auth.signUp({
            email,
            password,
            options: {
              data: {
                username: username || null
              }
            }
          });
          
          if (result.error) {
            const errMsg = result.error.message || '';
            if (errMsg.toLowerCase().includes('already registered') || errMsg.toLowerCase().includes('already exists')) {
              if (this.isSignUp) this.toggleAuthMode();
              this.showAuthError(`An account with <strong>${escapeHtml(email)}</strong> already exists. We've switched you to Sign In — please enter your password or click Reset Password.`, {
                title: 'User Already Registered',
                action: 'signin'
              });
              return;
            }
            throw result.error;
          }

          // Check if user already exists (Supabase obfuscation returns empty identities array)
          if (result.data?.user?.identities && result.data.user.identities.length === 0) {
            if (this.isSignUp) this.toggleAuthMode();
            this.showAuthError(`An account with <strong>${escapeHtml(email)}</strong> already exists. We've switched you to Sign In — please enter your password or click Reset Password.`, {
              title: 'User Already Registered',
              action: 'signin'
            });
            return;
          }

          const user = result.data?.user;
          const session = result.data?.session;

          if (user && !session) {
            // Email confirmation required by Supabase
            this.showAuthError(`Account created for <strong>${escapeHtml(email)}</strong>! Please check your email inbox and click the confirmation link before signing in.`, {
              title: 'Verification Required',
              type: 'info',
              action: 'resend',
              email: email
            });
            this.showNotification('Verification Required 📧', 'Please check your email to confirm your account before signing in.', 'info');
            return;
          }

          this.hideAuthModal();
          this.showNotification(
            'Account Created! 🎉',
            'Gumroad is opening in a new tab. After purchase, return here and paste your license key in the panel that just opened.',
            'success'
          );

          setTimeout(() => {
            window.open('https://prodat.gumroad.com/l/medical-exam-mastery', '_blank');
            this.License.showActivator();
          }, 800);

        } else {
          // Sign In
          result = await window.dbClient.auth.signInWithPassword({ email, password });
          if (result.error) {
            const errMsg = result.error.message || '';
            if (errMsg.toLowerCase().includes('invalid login credentials')) {
              this.showAuthError(`Account not found or password incorrect for <strong>${escapeHtml(email)}</strong>. Would you like to Sign Up instead or Reset Password?`, {
                title: 'Sign In Failed',
                action: 'signup'
              });
              return;
            } else if (errMsg.toLowerCase().includes('email not confirmed')) {
              this.showAuthError(`Your email <strong>${escapeHtml(email)}</strong> has not been confirmed yet. Please check your inbox or resend the link.`, {
                title: 'Email Unconfirmed',
                action: 'resend',
                email: email
              });
              return;
            }
            throw result.error;
          }

          // Clear caches so premium is re-evaluated fresh
          MediHelp._isPremiumCache = null;
          MediHelp._cachedUser = null;
          this.hideAuthModal();
          this.updateAuthButton();
          this.showNotification('Welcome Back! 👋', 'You are now signed in. Loading your access...');
        }
      } catch (error) {
        this.showAuthError(error.message || 'Authentication error. Please try again.', { title: 'Auth Error' });
      } finally {
        submitBtn.disabled = false;
        submitBtn.textContent = this.isSignUp ? 'Sign Up' : 'Sign In';
      }
    });

    // Add signin button to navbar
    this.updateAuthButton();
  },

  showAuthError: function(message, options = {}) {
    const card = document.getElementById('auth-error-card');
    if (!card) return;

    const type = options.type || (options.action ? 'info' : 'error');
    card.className = `auth-error-card ${type}`;
    
    let actionsHtml = '';
    if (options.action === 'signup') {
      actionsHtml = `
        <div class="auth-card-actions">
          <button type="button" class="auth-card-btn" onclick="MediHelp.toggleAuthMode(); MediHelp.hideAuthError();">Sign Up Instead</button>
          <button type="button" class="auth-card-btn" onclick="MediHelp.handleForgotPassword()">Reset Password</button>
        </div>
      `;
    } else if (options.action === 'signin') {
      actionsHtml = `
        <div class="auth-card-actions">
          <button type="button" class="auth-card-btn" onclick="if (MediHelp.isSignUp) MediHelp.toggleAuthMode(); MediHelp.hideAuthError();">Sign In Now</button>
          <button type="button" class="auth-card-btn" onclick="MediHelp.handleForgotPassword()">Forgot Password?</button>
        </div>
      `;
    } else if (options.action === 'resend') {
      actionsHtml = `
        <div class="auth-card-actions">
          <button type="button" class="auth-card-btn" onclick="MediHelp.resendConfirmationEmail('${escapeHtml(options.email || '')}')">Resend Confirmation Link</button>
        </div>
      `;
    }

    card.innerHTML = `
      <div class="auth-card-header">
        <span>${escapeHtml(options.title || (type === 'info' ? 'Notice' : 'Auth Error'))}</span>
        <button type="button" class="auth-card-close" onclick="MediHelp.hideAuthError()">&times;</button>
      </div>
      <div>${message}</div>
      ${actionsHtml}
    `;
  },

  hideAuthError: function() {
    const card = document.getElementById('auth-error-card');
    if (card) card.classList.add('hidden');
  },

  handleForgotPassword: async function() {
    const emailInput = document.getElementById('auth-email');
    const email = emailInput ? emailInput.value.trim().toLowerCase() : '';
    if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      this.showAuthError('Please enter your email address in the Email field first.', { title: 'Email Required' });
      return;
    }
    try {
      const db = window.initDbClient();
      const { error } = await db.auth.resetPasswordForEmail(email, {
        redirectTo: window.location.origin + window.location.pathname + '?reset=true'
      });
      if (error) throw error;
      this.showAuthError(`Password reset instructions have been sent to <strong>${escapeHtml(email)}</strong>. Please check your inbox.`, {
        title: 'Check Your Email',
        type: 'success'
      });
    } catch (err) {
      this.showAuthError(err.message || 'Failed to send password reset email.', { title: 'Reset Error' });
    }
  },

  resendConfirmationEmail: async function(email) {
    if (!email) {
      const emailInput = document.getElementById('auth-email');
      email = emailInput ? emailInput.value.trim().toLowerCase() : '';
    }
    if (!email) return;
    try {
      const db = window.initDbClient();
      const { error } = await db.auth.resend({ type: 'signup', email });
      if (error) throw error;
      this.showAuthError(`Confirmation email resent to <strong>${escapeHtml(email)}</strong>. Please check your inbox!`, {
        title: 'Email Sent',
        type: 'success'
      });
    } catch (err) {
      this.showAuthError(err.message || 'Failed to resend confirmation email.', { title: 'Resend Error' });
    }
  },

  showAuthModal: function() {
    if (!document.getElementById('auth-modal')) {
      this.initAuthModal();
    }
    this.hideAuthError();
    const modal = document.getElementById('auth-modal');
    if (modal) modal.classList.add('active');
  },

  hideAuthModal: function() {
    this.hideAuthError();
    const modal = document.getElementById('auth-modal');
    if (modal) modal.classList.remove('active');
  },

  toggleAuthMode: function() {
    this.isSignUp = !this.isSignUp;
    this.hideAuthError();
    const title = document.getElementById('auth-title');
    const submitBtn = document.getElementById('auth-submit');
    const toggleText = document.querySelector('.auth-toggle');
    const rulesHint = document.getElementById('password-rules');
    const usernameInput = document.getElementById('auth-username');
    if (this.isSignUp) {
      title.textContent = 'Sign Up for MediHelp';
      submitBtn.textContent = 'Sign Up';
      toggleText.textContent = 'Already have an account? Sign In';
      rulesHint.classList.remove('hidden');
      if (usernameInput) usernameInput.style.display = 'block';
    } else {
      title.textContent = 'Sign In to MediHelp';
      submitBtn.textContent = 'Sign In';
      toggleText.textContent = "Don't have an account? Sign Up";
      rulesHint.classList.add('hidden');
      if (usernameInput) usernameInput.style.display = 'none';
    }
  },

  /**
   * Exam prep + flashcards zone: navbar Login/Logout and auth modal.
   * Explicitly excludes marketing and free-tool routes per site requirements.
   */
  isAuthPage: function() {
    const path = window.location.pathname || '';
    const href = window.location.href || '';

    // Excluded free-tool / marketing routes
    const excludedPrefixes = [
      '/medical-bill-audit',
      '/cpt-code-search',
      '/claim-denial-codes',
      '/rx-savings',
      '/providers',
      '/blog'
    ];
    for (const p of excludedPrefixes) {
      if (path === p || path.startsWith(p + '/')) return false;
    }

    // Match by pathname
    if (path.startsWith('/medical-exam-semester')) return true;
    if (path.startsWith('/medical-exam-preparation')) return true;
    if (path.startsWith('/medical-exam-usmle')) return true;
    if (path.startsWith('/flash-cards')) return true;
    if (path.startsWith('/medical-calculator')) return true;
    if (path.includes('medical-exam')) return true;
    if (path.includes('flash-cards')) return true;
    if (path.includes('medical-calculator')) return true;

    // Match by full href (covers local file:// and localhost serving)
    if (href.includes('medical-exam-semester')) return true;
    if (href.includes('medical-exam-preparation')) return true;
    if (href.includes('medical-exam-usmle')) return true;
    if (href.includes('flash-cards')) return true;
    if (href.includes('medical-calculator')) return true;

    return false;
  },

  /**
   * Some static pages omit .nav-actions; create a slot beside the theme toggle so Login still appears.
   */
  _getNavAuthContainers: function() {
    const found = Array.from(document.querySelectorAll('.nav-actions'));
    if (found.length) return found;

    const theme = document.querySelector(
      '#theme-toggle, button#theme-toggle, .theme-btn, button.theme-btn, [data-theme-toggle]'
    );
    if (theme && theme.parentElement) {
      let slot = theme.parentElement.querySelector('.mh-nav-auth-slot');
      if (!slot) {
        slot = document.createElement('div');
        slot.className = 'nav-actions mh-nav-auth-slot';
        slot.setAttribute('data-mh-injected-nav', '1');
        slot.style.cssText = 'display:inline-flex;align-items:center;gap:10px;margin-right:8px;flex-shrink:0;';
        theme.parentElement.insertBefore(slot, theme);
      }
      return [slot];
    }

    const header = document.querySelector('header, .site-header, .navbar, .top-bar');
    if (header) {
      let slot = header.querySelector('.mh-nav-auth-slot');
      if (!slot) {
        slot = document.createElement('div');
        slot.className = 'nav-actions mh-nav-auth-slot';
        slot.setAttribute('data-mh-injected-nav', '1');
        slot.style.cssText = 'display:inline-flex;align-items:center;gap:10px;margin-left:auto;';
        header.appendChild(slot);
      }
      return [slot];
    }

    return [];
  },

  showAuthModal: function() {
    if (!document.getElementById('auth-modal')) {
      this.initAuthModal();
    }
    const modal = document.getElementById('auth-modal');
    if (modal) modal.classList.add('active');
  },

  hideAuthModal: function() {
    const modal = document.getElementById('auth-modal');
    if (modal) modal.classList.remove('active');
  },

  toggleAuthMode: function() {
    this.isSignUp = !this.isSignUp;
    const title = document.getElementById('auth-title');
    const submitBtn = document.getElementById('auth-submit');
    const toggleText = document.querySelector('.auth-toggle');
    const rulesHint = document.getElementById('password-rules');
    const usernameInput = document.getElementById('auth-username');
    if (this.isSignUp) {
      title.textContent = 'Sign Up for MediHelp';
      submitBtn.textContent = 'Sign Up';
      toggleText.textContent = 'Already have an account? Sign In';
      rulesHint.classList.remove('hidden');
      if (usernameInput) usernameInput.style.display = 'block';
    } else {
      title.textContent = 'Sign In to MediHelp';
      submitBtn.textContent = 'Sign In';
      toggleText.textContent = "Don't have an account? Sign Up";
      rulesHint.classList.add('hidden');
      if (usernameInput) usernameInput.style.display = 'none';
    }
  },

  updateAuthButton: async function() {
    if (!this.isAuthPage()) return;
    if (!window.dbClient) {
      console.warn('MediHelp: dbClient not initialized yet. Retrying in 100ms...');
      setTimeout(() => this.updateAuthButton(), 100);
      return;
    }
    const containers = this._getNavAuthContainers();
    if (containers.length === 0) {
      return;
    }

    const { data, error } = await window.dbClient.auth.getUser();
    const user = data?.user;
    
    containers.forEach(container => {
      // 1. Remove ANY existing auth button in THIS specific container
      container.querySelectorAll('.auth-btn, .auth-user-chip').forEach(el => el.remove());

      if (user) {
        // Show email chip + logout button when logged in
        const emailShort = user.email.length > 22
          ? user.email.substring(0, 20) + '…'
          : user.email;

        const chip = document.createElement('div');
        chip.className = 'auth-user-chip';
        chip.title = user.email;
        chip.style.cssText = `
          display:inline-flex; align-items:center; gap:8px;
          background:rgba(34,197,94,0.1); border:1px solid rgba(34,197,94,0.3);
          border-radius:20px; padding:6px 14px; font-size:13px;
          color:var(--accent); font-weight:700; white-space:nowrap;
          cursor:default; max-width:220px;
        `;
        chip.innerHTML = `
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/>
          </svg>
          <span style="overflow:hidden;text-overflow:ellipsis;">${escapeHtml(emailShort)}</span>
        `;

        const logoutBtn = document.createElement('button');
        logoutBtn.className = 'btn btn-ghost auth-btn';
        logoutBtn.textContent = 'Log out';
        logoutBtn.style.cssText = 'padding:6px 14px; font-size:13px; border-radius:10px; color:var(--text-muted);';
        logoutBtn.onclick = async () => {
          const confirmed = await MediHelp.confirm("Are you sure you want to log out?", {
            title: "Sign Out",
            confirmText: "Log out",
            cancelText: "Stay signed in"
          });
          if (confirmed) {
            await window.dbClient.auth.signOut();
          }
        };

        const themeBtn = container.querySelector('.theme-btn');
        if (themeBtn) {
          container.insertBefore(logoutBtn, themeBtn);
          container.insertBefore(chip, logoutBtn);
        } else {
          container.appendChild(chip);
          container.appendChild(logoutBtn);
        }
        return; // skip the shared authBtn append below
      } else {
        const authBtn = document.createElement('button');
        authBtn.className = 'btn btn-ghost auth-btn';
        authBtn.style.padding = '8px 18px';
        authBtn.style.fontSize = '14px';
        authBtn.style.borderRadius = '10px';
        authBtn.textContent = 'Sign in / Sign up';
        authBtn.setAttribute('aria-label', 'Sign in or sign up');
        authBtn.onclick = () => this.showAuthModal();

        // Insert before theme toggle or append at end of container
        const themeBtn = container.querySelector('.theme-btn');
        if (themeBtn) {
          container.insertBefore(authBtn, themeBtn);
        } else {
          container.appendChild(authBtn);
        }
      }
    });
  },

  showNotification: function(title, message, type = 'success', action = null) {
    let container = document.querySelector('.mh-notification-container');
    if (!container) {
      container = document.createElement('div');
      container.className = 'mh-notification-container';
      document.body.appendChild(container);
    }

    const notif = document.createElement('div');
    notif.className = `mh-notification ${type}`;
    
    const icon = type === 'success' 
      ? `<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"/></svg>`
      : `<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>`;

    notif.innerHTML = `
      <div class="mh-notif-icon">${icon}</div>
      <div class="mh-notif-content">
        <div class="mh-notif-h">${escapeHtml(title)}</div>
        <div class="mh-notif-p">${escapeHtml(message)}</div>
        ${action ? `<a href="${escapeHtml(action.url)}" class="mh-notif-btn">${escapeHtml(action.text)}</a>` : ''}
      </div>
      <button class="mh-notif-close" style="background:none; border:none; color:inherit; opacity:0.5; cursor:pointer; padding:5px; margin-left:10px; font-size:18px;" onclick="this.parentElement.remove()">×</button>
    `;

    container.appendChild(notif);

    // Auto-remove after 8 seconds unless it has an action
    if (!action) {
      setTimeout(() => {
        if (notif.parentElement) {
          notif.classList.add('fade-out');
          setTimeout(() => { if (notif.parentElement) notif.remove(); }, 400);
        }
      }, 8000);
    }
  },

  /**
   * New: Premium Global Confirm Dialog
   * Replaces browser's standard confirm()
   */
  confirm: function(message, options = {}) {
    return new Promise((resolve) => {
      let overlay = document.querySelector('.mh-confirm-overlay');
      if (!overlay) {
        overlay = document.createElement('div');
        overlay.className = 'mh-confirm-overlay';
        overlay.innerHTML = `
          <div class="mh-confirm-card">
            <h3 class="mh-confirm-title"></h3>
            <p class="mh-confirm-text"></p>
            <div class="mh-confirm-btns">
              <button class="mh-confirm-btn mh-confirm-btn-ghost cancel-btn"></button>
              <button class="mh-confirm-btn mh-confirm-btn-primary confirm-btn"></button>
            </div>
          </div>
        `;
        document.body.appendChild(overlay);
      }

      const titleEl = overlay.querySelector('.mh-confirm-title');
      const textEl = overlay.querySelector('.mh-confirm-text');
      const confirmBtn = overlay.querySelector('.confirm-btn');
      const cancelBtn = overlay.querySelector('.cancel-btn');

      titleEl.textContent = options.title || "Are you sure?";
      textEl.textContent = message;
      confirmBtn.textContent = options.confirmText || "Confirm";
      cancelBtn.textContent = options.cancelText || "Cancel";

      const close = (result) => {
        overlay.classList.remove('visible');
        setTimeout(() => {
          resolve(result);
        }, 300);
      };

      confirmBtn.onclick = () => close(true);
      cancelBtn.onclick = () => close(false);
      overlay.onclick = (e) => { if (e.target === overlay) close(false); };

      // Trigger animation
      requestAnimationFrame(() => overlay.classList.add('visible'));
    });
  },

  /**
   * If verify-license is slow or times out, the Edge Function may still have written `licenses`.
   * Restore premium from Supabase for the signed-in user (matches saved email + key on the server).
   */
  syncPremiumFromCloud: async function() {
    const db = window.initDbClient();
    if (!db) return false;
    const { data: { user } } = await db.auth.getUser();
    if (!user) return false;
    try {
      let { data: rows, error } = await db
        .from('licenses')
        .select('license_key, email, status')
        .eq('user_id', user.id)
        .limit(1);

      if (error) {
        console.warn('MediHelp syncPremiumFromCloud:', error.message);
        return false;
      }
      if (!rows || !rows.length) {
        const r2 = await db
          .from('licenses')
          .select('license_key, email, status, user_id')
          .ilike('email', user.email)
          .limit(1);
        if (!r2.error && r2.data && r2.data.length) {
          rows = r2.data;
        }
      }

      if (!rows || !rows.length) return false;

      const license = rows[0];
      const st = String(license.status || '').toLowerCase();
      if (st === 'inactive' || st === 'revoked' || st === 'cancelled') {
        console.warn('MediHelp syncPremiumFromCloud: license not usable:', license.status);
        return false;
      }

      await this.License.activate(license.license_key, license.email);
      this._isPremiumCache = true;
      console.log('MediHelp: Premium restored from Supabase (cloud row).');
      return true;
    } catch (e) {
      console.warn('MediHelp syncPremiumFromCloud failed', e);
    }
    return false;
  },

  syncPremiumFromCloudWithRetry: async function() {
    for (let attempt = 0; attempt < 4; attempt++) {
      if (await this.syncPremiumFromCloud()) return true;
      await new Promise((r) => setTimeout(r, 1000 * (attempt + 1)));
    }
    return false;
  },

  // 7. Global Licensing Logic (Gumroad)
  License: {
    STORAGE_KEY: 'mh_license_active',
    DATA_KEY: 'mh_license_data', // Stores {key, email}
    
    isActivated: function() {
      return localStorage.getItem(this.STORAGE_KEY) === 'true';
    },

    showActivator: function() {
      const modal = document.getElementById('premium-modal');
      if (modal) {
        modal.classList.add('visible');
      } else {
        // Redirect to a page that has it if not present on current page
        window.location.href = '/medical-exam-semester?showActivation=true';
      }
    },

    activate: async function(key, email) {
      localStorage.setItem(this.STORAGE_KEY, 'true');
      if (key && email) {
        localStorage.setItem(this.DATA_KEY, JSON.stringify({ key, email }));
        
        // Background sync — do not await to prevent blocking the UI
        this._syncToCloud(key, email).catch(e => console.warn("Background sync failed:", e));
      }
      return true;
    },

    _syncToCloud: async function(key, email) {
      const db = window.initDbClient();
      if (!db) return;

      try {
        const { data: { user } } = await db.auth.getUser();
        if (!user) {
          console.warn("MediHelp: License activated but not synced (Not logged in).");
          return;
        }

        const row = {
          user_id: user.id,
          license_key: key,
          email: email,
          status: 'active',
          source: 'gumroad'
        };

        console.log("MediHelp: Syncing license to cloud for user:", user.email);
        let { error } = await db
          .from('licenses')
          .upsert(row, { onConflict: 'license_key' });

        if (error) {
          console.warn("MediHelp: upsert on license_key failed, retrying on user_id:", error.message);
          ({ error } = await db.from('licenses').upsert(row, { onConflict: 'user_id' }));
        }

        if (error) {
          console.error("MediHelp: Cloud sync error:", error.message);
        } else {
          console.log("MediHelp: License successfully synced to cloud.");
        }
      } catch (e) {
        console.warn("MediHelp: Background sync failed:", e.message);
      }
    },

    restore: async function() {
      const data = localStorage.getItem(this.DATA_KEY);
      if (!data) throw new Error("No license data found on this device.");
      const { key, email } = JSON.parse(data);
      return this.verify(key, email);
    },

    verify: async function(key, email) {
      if (!key || !email) throw new Error("License key and email are required.");

      const VERIFY_MS = 90000;

      const runFetch = async () => {
        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), VERIFY_MS);
        try {
          const db = window.initDbClient();
          let authHeader = `Bearer ${SUPABASE_ANON_KEY}`;
          if (db) {
            const { data: { session } } = await db.auth.getSession();
            if (session?.access_token) {
              authHeader = `Bearer ${session.access_token}`;
            }
          }

          console.log("MediHelp License: Verifying with Edge Function (up to " + (VERIFY_MS / 1000) + "s)...");
          return await fetch('https://bisqgousuvljttesjkkm.supabase.co/functions/v1/verify-license', {
            method: 'POST',
            headers: { 
              'Content-Type': 'application/json',
              'apikey': SUPABASE_ANON_KEY,
              'Authorization': authHeader
            },
            body: JSON.stringify({ license_key: key, email: email }),
            signal: controller.signal
          });
        } finally {
          clearTimeout(timeoutId);
        }
      };

      try {
        let response = await runFetch();

        if (!response.ok) {
          const errorData = await response.json().catch(() => ({}));
          console.error("MediHelp License: Server returned error", response.status, errorData);
          
          if (response.status === 403 || (errorData && errorData.message === "LICENSE_LIMIT_REACHED")) {
            throw new Error("LICENSE_LIMIT_REACHED");
          } else if (response.status === 401 || response.status === 404) {
            throw new Error("INVALID_KEY");
          } else {
            throw new Error(errorData.message || "SERVER_ERROR");
          }
        }

        const data = await response.json();
        if (data && (data.success === true || data.verified === true || data.ok === true || data.status === 'active')) {
          await this.activate(key, email);
          console.log("MediHelp License: Activation successful.");
          return true;
        }
        
        throw new Error(data.message || "INVALID_KEY");
      } catch (e) {
        if (e.name === 'AbortError') {
          console.warn("MediHelp License: Verification timed out — checking Supabase for a saved license row...");
          if (await MediHelp.syncPremiumFromCloudWithRetry()) {
            console.log("MediHelp License: Recovered from Supabase after slow verify.");
            setTimeout(() => window.location.reload(), 400);
            return true;
          }
          console.error("MediHelp License: Verification timed out after " + (VERIFY_MS / 1000) + "s");
          throw new Error("TIMEOUT");
        }
        console.error("MediHelp License: Verification failed", e);
        throw e;
      }
    }
  },

  _cachedUser: null,
  _isPremiumCache: null,
  _authSyncPromise: null, // Track background license sync
  
  isPremium: async function() {
    const db = window.initDbClient();
    if (!db) return false;

    // Fast path: already activated in localStorage
    if (this.License.isActivated()) {
      this._isPremiumCache = true;
      return true;
    }

    if (this._isPremiumCache === true) return true;

    // Wait for background cloud-sync (max 5s, not 20s)
    if (this._authSyncPromise) {
      console.log("MediHelp: isPremium waiting for background sync (max 5s)...");
      await Promise.race([
        this._authSyncPromise,
        new Promise((res) => setTimeout(() => res(), 5000))
      ]);
      // Re-check after sync completes
      if (this.License.isActivated()) {
        this._isPremiumCache = true;
        return true;
      }
      if (this._isPremiumCache === true) return true;
    }

    try {
      if (!this._cachedUser) {
        const { data } = await db.auth.getUser();
        this._cachedUser = data?.user || null;
      }
      if (!this._cachedUser) {
        this._isPremiumCache = false;
        return false;
      }
      this._isPremiumCache = this.License.isActivated();
      return this._isPremiumCache;
    } catch (e) {
      console.warn("MediHelp: isPremium check failed", e);
      this._isPremiumCache = this.License.isActivated();
      return !!this._isPremiumCache;
    }
  },
  isBlogPostPage: function() {
    const path = (window.location.pathname || '').replace(/\/+$/, '') || '/';
    if (path === '/blog' || path === '/blog.html') return false;
    if (document.querySelector('.post-layout .post-sidebar')) return true;
    return path.indexOf('/blog/') === 0;
  },

  // Desktop Left & Right Affiliate Banners + Bottom Pre-Footer Ad
  initAffiliateBanner: function() {
    const isBlogPost = this.isBlogPostPage();

    // 1. Left Banner (Tall Vertical)
    if (!document.getElementById('mh-desktop-affiliate-banner')) {
      const bannerLeft = document.createElement('div');
      bannerLeft.id = 'mh-desktop-affiliate-banner';
      bannerLeft.className = 'mh-desktop-affiliate-banner';
      bannerLeft.innerHTML = `
        <a href="https://www.kqzyfj.com/click-101847975-17327794" target="_blank" rel="sponsored noopener noreferrer">
          <img src="https://www.awltovhc.com/image-101847975-17327794" width="206" height="800" alt="Special Offer — GearUp / Healthcare" border="0" 
               onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=400&q=80';"
               style="display:block; width:100%; height:auto; max-height:calc(100vh - 110px); object-fit:contain; border-radius:12px; box-shadow:0 8px 24px rgba(0,0,0,0.4);" />
        </a>
      `;
      document.body.appendChild(bannerLeft);
    }

    // 2. Right Banner Grid (Tiled Box Ads Vertically)
    // On blog posts only: stack these under the Audit Your Bill sidebar card
    // so the article can use the extra horizontal space.
    if (!document.getElementById('mh-desktop-affiliate-banner-right')) {
      const bannerRight = document.createElement('div');
      bannerRight.id = 'mh-desktop-affiliate-banner-right';
      bannerRight.className = 'mh-desktop-affiliate-banner-right';
      bannerRight.innerHTML = `
        <div class="mh-ad-box-grid">
          <!-- Box Ad 1 -->
          <div class="mh-ad-box-card">
            <span class="mh-ad-badge">SPONSORED</span>
            <a href="https://www.anrdoezrs.net/click-101847975-13689149" target="_blank" rel="sponsored noopener noreferrer" class="mh-ad-box-link">
              <div class="mh-ad-box-img-wrapper">
                <img src="https://www.ftjcfx.com/image-101847975-13689149" width="190" height="196" alt="Special Offer" border="0"
                     onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=400&q=80';" />
              </div>
            </a>
          </div>

          <!-- Box Ad 2 -->
          <div class="mh-ad-box-card">
            <span class="mh-ad-badge">SPONSORED</span>
            <a href="https://www.anrdoezrs.net/click-101847975-17183529?url=https%3A%2F%2Frexing.com%2Fproducts%2Frexing-r316-dash-cam-4k-front-1080p-cabin-with-wi-fi-gps%3Fvariant%3D43851262492862&cjsku=43851262492862" target="_blank" rel="sponsored noopener noreferrer" class="mh-ad-box-link">
              <div class="mh-ad-box-img-wrapper">
                <img src="https://cdn.shopify.com/s/files/1/0556/5536/6846/files/R316-2-Main-scaled.jpg?v=1712594342" alt="Rexing R316 Dash Cam 4K Front"
                     onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1508974239320-0a029497e820?w=400&q=80';" />
              </div>
            </a>
          </div>

          <!-- Box Ad 3 -->
          <div class="mh-ad-box-card">
            <span class="mh-ad-badge">SPONSORED</span>
            <a href="https://www.anrdoezrs.net/click-101847975-11680307" target="_top" rel="sponsored noopener noreferrer" class="mh-ad-box-link">
              <div class="mh-ad-box-img-wrapper">
                <img src="https://www.tqlkg.com/image-101847975-11648983" width="250" height="250" alt="" border="0" />
              </div>
            </a>
          </div>
        </div>
      `;
      const sidebarMount = isBlogPost && (
        document.getElementById('sidebar-affiliate-ads') ||
        document.querySelector('.post-sidebar')
      );
      if (sidebarMount) {
        bannerRight.classList.add('mh-sidebar-placed');
        sidebarMount.appendChild(bannerRight);
      } else {
        document.body.appendChild(bannerRight);
      }
    }

    if (!document.getElementById('mh-affiliate-banner-styles')) {
      const style = document.createElement('style');
      style.id = 'mh-affiliate-banner-styles';
      style.textContent = `
        /* Left Vertical Banner */
        .mh-desktop-affiliate-banner {
          position: fixed;
          top: 95px;
          left: 12px;
          z-index: 90;
          display: block;
          width: 180px;
          height: auto;
          max-height: calc(100vh - 110px);
          pointer-events: auto;
          transition: opacity 0.3s ease;
        }

        /* Right Vertical Banner Grid */
        .mh-desktop-affiliate-banner-right {
          position: fixed;
          top: 95px;
          right: 12px;
          z-index: 90;
          display: flex;
          flex-direction: column;
          width: 200px;
          max-height: calc(100vh - 110px);
          overflow-y: auto;
          scrollbar-width: none;
          pointer-events: auto;
          transition: opacity 0.3s ease;
        }
        .mh-desktop-affiliate-banner-right::-webkit-scrollbar {
          display: none;
        }

        .mh-ad-box-grid {
          display: flex;
          flex-direction: column;
          gap: 12px;
          width: 100%;
        }

        .mh-ad-box-card {
          position: relative;
          width: 200px;
          height: 200px;
          background: rgba(17, 24, 39, 0.9);
          backdrop-filter: blur(12px);
          -webkit-backdrop-filter: blur(12px);
          border: 1px solid rgba(255, 255, 255, 0.12);
          border-radius: 14px;
          overflow: hidden;
          box-shadow: 0 8px 24px rgba(0, 0, 0, 0.45);
          transition: transform 0.25s ease, border-color 0.25s ease, box-shadow 0.25s ease;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .mh-ad-box-card:hover {
          transform: translateY(-2px);
          border-color: rgba(34, 197, 94, 0.5);
          box-shadow: 0 12px 32px rgba(34, 197, 94, 0.2);
        }

        .mh-ad-badge {
          position: absolute;
          top: 6px;
          right: 6px;
          z-index: 5;
          background: rgba(0, 0, 0, 0.7);
          backdrop-filter: blur(4px);
          color: #94a3b8;
          font-size: 8px;
          font-weight: 700;
          letter-spacing: 0.5px;
          padding: 2px 5px;
          border-radius: 4px;
          border: 1px solid rgba(255, 255, 255, 0.1);
          pointer-events: none;
        }

        .mh-ad-box-link {
          text-decoration: none;
          color: inherit;
          display: flex;
          align-items: center;
          justify-content: center;
          width: 100%;
          height: 100%;
          padding: 0;
          box-sizing: border-box;
        }

        .mh-ad-box-img-wrapper {
          width: 100%;
          height: 100%;
          display: flex;
          align-items: center;
          justify-content: center;
          overflow: hidden;
          border-radius: 12px;
          background: #0b0f19;
          position: relative;
        }

        .mh-ad-box-img-wrapper img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          display: block;
          border-radius: 12px;
          transition: transform 0.3s ease;
        }

        .mh-ad-box-card:hover .mh-ad-box-img-wrapper img {
          transform: scale(1.04);
        }

        /* Blog post: sit in the article sidebar instead of a fixed right rail */
        .mh-desktop-affiliate-banner-right.mh-sidebar-placed {
          position: static;
          top: auto;
          right: auto;
          width: 100%;
          max-height: none;
          overflow: visible;
          z-index: 1;
        }
        .mh-desktop-affiliate-banner-right.mh-sidebar-placed .mh-ad-box-card {
          width: 100%;
          height: 200px;
        }

        @media (max-width: 1180px) {
          .mh-desktop-affiliate-banner-right:not(.mh-sidebar-placed),
          .mh-desktop-affiliate-banner {
            display: none !important;
          }
        }
      `;
      document.head.appendChild(style);
    }

    // 3. Pre-Footer Ad Banner (Bottom just before footer)
    this.initPreFooterAd();
  },

  // Pre-Footer Bottom Banner Ad
  initPreFooterAd: function() {
    if (document.getElementById('mh-prefooter-affiliate-ad')) return;
    const footer = document.querySelector('.site-footer');
    if (!footer || !footer.parentNode) return;

    const adSection = document.createElement('div');
    adSection.id = 'mh-prefooter-affiliate-ad';
    adSection.className = 'mh-prefooter-affiliate-ad';
    adSection.innerHTML = `
      <div class="mh-prefooter-ad-container">
        <span class="mh-ad-badge">SPONSORED</span>
        <a href="https://www.tkqlhce.com/click-101847975-11648782" target="_top" rel="sponsored noopener noreferrer" class="mh-prefooter-ad-link">
          <img src="https://www.tqlkg.com/image-101847975-11648782" width="728" height="90" alt="" border="0"
               onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800&q=80';" />
        </a>
      </div>
    `;

    footer.parentNode.insertBefore(adSection, footer);

    if (!document.getElementById('mh-prefooter-ad-styles')) {
      const style = document.createElement('style');
      style.id = 'mh-prefooter-ad-styles';
      style.textContent = `
        .mh-prefooter-affiliate-ad {
          width: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
          padding: 32px 16px 20px;
          box-sizing: border-box;
        }
        .mh-prefooter-ad-container {
          position: relative;
          max-width: 720px;
          width: 100%;
          background: rgba(17, 24, 39, 0.85);
          backdrop-filter: blur(12px);
          -webkit-backdrop-filter: blur(12px);
          border: 1px solid rgba(255, 255, 255, 0.12);
          border-radius: 16px;
          padding: 10px;
          box-shadow: 0 10px 30px rgba(0, 0, 0, 0.35);
          display: flex;
          justify-content: center;
          align-items: center;
          box-sizing: border-box;
          transition: border-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
        }
        .mh-prefooter-ad-container:hover {
          transform: translateY(-2px);
          border-color: rgba(34, 197, 94, 0.4);
          box-shadow: 0 14px 36px rgba(34, 197, 94, 0.12);
        }
        .mh-prefooter-ad-link {
          display: block;
          width: 100%;
          text-align: center;
          line-height: 0;
        }
        .mh-prefooter-ad-container img {
          max-width: 100%;
          height: auto;
          display: inline-block;
          border-radius: 10px;
          object-fit: contain;
        }
      `;
      document.head.appendChild(style);
    }
  },

  // Simple sync check for UI rendering
  isPremiumSync: function() {
    return this._isPremiumCache === true || this.License.isActivated();
  },

  // ── AD SUPPRESSION FOR PREMIUM MEMBERS ─────────────────────────────────
  // Prevents ALL ad networks from displaying for users with an active license.
  // Works on: Ezoic (ezstandalone), Adsterra vignette, Google AdSense, affiliate banner.
  suppressAdsForPremium: function() {
    // 1. Neuter ezstandalone.showAds so Ezoic ad slots don't render
    const noOpShowAds = function() {};
    if (window.ezstandalone) {
      window.ezstandalone.showAds = noOpShowAds;
      window.ezstandalone.cmd = { push: function() {} };
    } else {
      window.ezstandalone = { showAds: noOpShowAds, cmd: { push: function() {} } };
    }

    // 2. CSS: instantly hide all known ad containers
    if (!document.getElementById('mh-premium-no-ads-style')) {
      const style = document.createElement('style');
      style.id = 'mh-premium-no-ads-style';
      style.textContent = `
        /* MediHelp Premium: ad-free experience */
        [id^="ezoic-pub-ad"],
        .ezoic-adpicker-ad,
        .ezoic-ad,
        [class*="ezoic-ad"],
        ins.adsbygoogle,
        iframe[src*="adsterra"],
        iframe[src*="n6wxm"],
        iframe[src*="googlesyndication"],
        #mh-desktop-affiliate-banner,
        #mh-desktop-affiliate-banner-right,
        #mh-prefooter-affiliate-ad {
          display: none !important;
          visibility: hidden !important;
          pointer-events: none !important;
          width: 0 !important;
          height: 0 !important;
          overflow: hidden !important;
        }
      `;
      document.head.appendChild(style);
    }

    // 3. Remove affiliate banner element if already injected
    const affiliate = document.getElementById('mh-desktop-affiliate-banner');
    if (affiliate) affiliate.remove();
    const affiliateRight = document.getElementById('mh-desktop-affiliate-banner-right');
    if (affiliateRight) affiliateRight.remove();
    const prefooterAd = document.getElementById('mh-prefooter-affiliate-ad');
    if (prefooterAd) prefooterAd.remove();

    // 4. MutationObserver: hide dynamically injected ad iframes/slots
    const adSelector = [
      '[id^="ezoic-pub-ad"]', '.ezoic-adpicker-ad', '.ezoic-ad',
      'ins.adsbygoogle', 'iframe[src*="adsterra"]',
      'iframe[src*="n6wxm"]', 'iframe[src*="googlesyndication"]',
      '#mh-desktop-affiliate-banner', '#mh-desktop-affiliate-banner-right', '#mh-prefooter-affiliate-ad'
    ].join(',');
    const adObserver = new MutationObserver(function(mutations) {
      mutations.forEach(function(m) {
        m.addedNodes.forEach(function(node) {
          if (node.nodeType !== 1) return;
          if (node.matches && node.matches(adSelector)) { node.style.display = 'none'; }
          node.querySelectorAll && node.querySelectorAll(adSelector).forEach(function(ad) {
            ad.style.display = 'none';
          });
        });
      });
    });
    adObserver.observe(document.documentElement, { childList: true, subtree: true });
    console.log('MediHelp Premium: Ad-free mode active.');
  }
};

// 7. Auto-init on Load
document.addEventListener('DOMContentLoaded', async () => {
  MediHelp.initSiteFooter();
  MediHelp.initFeedbackWidget();
  MediHelp.initMobileNav();

  // ── Premium Ad Suppression ──────────────────────────────────────────────
  // Check premium status (waits for auth sync up to 5s), then suppress ads
  // if the user has an active license. Affiliate banner only shown for free users.
  (async () => {
    // Quick sync check first (covers cached/localStorage license)
    if (MediHelp.isPremiumSync()) {
      MediHelp.suppressAdsForPremium();
      return; // skip affiliate banner entirely
    }
    // Wait for cloud auth sync (covers Supabase-backed premium)
    try {
      const premium = await MediHelp.isPremium();
      if (premium) {
        MediHelp.suppressAdsForPremium();
        return; // skip affiliate banner entirely
      }
    } catch(e) {
      console.warn('MediHelp: Premium check error during ad init', e);
    }
    // Not premium — show affiliate banner as normal
    MediHelp.initAffiliateBanner();
  })();
  
  if (MediHelp.isAuthPage()) {
    MediHelp.initAuthModal();
    const am = document.getElementById('auth-modal');
    if (am) am.classList.remove('active');
  }

  [0, 200, 600, 1500, 3200].forEach((ms) => {
    setTimeout(() => MediHelp.updateAuthButton(), ms);
  });

  // Ensure dbClient is ready
  const db = window.initDbClient();
  if (db) {
    // SINGLE AUTHORITATIVE AUTH LISTENER
    // IMPORTANT: This handler must NOT await long-running tasks.
    // isPremium() already awaits _authSyncPromise where needed.
    db.auth.onAuthStateChange((event, session) => {
      console.log(`MediHelp Auth Event: ${event}`, session?.user?.email || 'no-user');
      
      const wasPremium = MediHelp._isPremiumCache === true || MediHelp.License.isActivated();
      MediHelp._cachedUser = session?.user || null;
      
      // Update UI button (fire and forget)
      MediHelp.updateAuthButton();

      if (event === 'SIGNED_OUT') {
        localStorage.removeItem(MediHelp.License.STORAGE_KEY);
        localStorage.removeItem(MediHelp.License.DATA_KEY);
        MediHelp._isPremiumCache = false;
        const cleanPath = window.location.pathname;
        window.location.href = cleanPath + '?logout=true&cb=' + Date.now();
        return;
      }

      if (session?.user) {
        MediHelp.hideAuthModal();
        
        if (MediHelp.License.isActivated()) {
          // Already have a local license — just confirm cache
          MediHelp._isPremiumCache = true;
        } else {
          // Kick off background cloud sync — do NOT await inside this handler
          MediHelp._authSyncPromise = (async () => {
            try {
              const { data: rows, error } = await db.from('licenses')
                .select('license_key, email, status')
                .eq('user_id', session.user.id)
                .limit(1);

              if (error) {
                console.error('MediHelp Sync Error (RLS or Table Issue?):', error.message);
                throw error;
              }

              if (rows && rows.length > 0) {
                const license = rows[0];
                console.log(`MediHelp: Cloud license found (Status: ${license.status}).`);
                
                if (license.status === 'active') {
                  await MediHelp.License.activate(license.license_key, license.email);
                  MediHelp._isPremiumCache = true;
                  // Reload once so the page re-reads premium state
                  if (!wasPremium) {
                    console.log('MediHelp: Premium restored — reloading page.');
                    // Small delay so the current render cycle finishes
                    setTimeout(() => window.location.reload(), 300);
                  }
                } else {
                  console.warn('MediHelp: Cloud license found but it is NOT active.');
                  MediHelp._isPremiumCache = false;
                }
              } else {
                console.log('MediHelp: No license record found in cloud for this user ID.');
                MediHelp._isPremiumCache = false;
              }
            } catch (e) { 
              console.warn('MediHelp: Cloud sync failed.', e.message); 
            } finally { 
              MediHelp._authSyncPromise = null; 
            }
          })();
          // DO NOT await here — the handler must return quickly
        }
      }
    });
  }
});

// Export to window
window.MediHelp = MediHelp;
window.debounce = debounce;
window.renderFAQ = renderFAQ;
window.toggleFAQ = toggleFAQ;
window.switchTab = switchTab;
window.escapeHtml = escapeHtml;
window.formatMcqHtml = formatMcqHtml;
window.sanitizeText = escapeHtml; // Alias for backward compatibility in audit modules
