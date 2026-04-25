/**
 * MediHelp — core.js
 * Global Utilities: Shared Supabase init, Theme toggling, FAQ rendering, and common UI helpers.
 */

// 1. Initialize Supabase globally
const SUPABASE_URL  = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

if (window.supabase) {
  window.dbClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
  
  // Listen for Auth changes for persistence
  window.dbClient.auth.onAuthStateChange(async (event, session) => {
    console.log(`MediHelp Auth: ${event}`, session?.user?.email);
    if (session?.user) {
      // Sync license from user metadata if not already active locally
      const userLicense = session.user.user_metadata?.mh_license_key;
      if (userLicense && !MediHelp.License.isActivated()) {
         console.log("MediHelp: Syncing license from user profile...");
         try {
           await MediHelp.License.verify(userLicense, session.user.email);
         } catch (e) {
           console.warn("MediHelp: Auth-based license sync failed.");
         }
      }
    }
  });
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

    // 2. Create Modal
    const modal = document.createElement('div');
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
            <label>Your Email</label>
            <input type="email" id="fb-email" placeholder="email@example.com" required>
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

    // 4. Form Handling (server-side delivery)
    const form = modal.querySelector('#global-feedback-form');
    form.onsubmit = async (e) => {
      e.preventDefault();
      const submitBtn = form.querySelector('.btn-submit');
      const type = document.getElementById('fb-type').value;
      const email = document.getElementById('fb-email').value;
      const msg = document.getElementById('fb-message').value;

      submitBtn.disabled = true;
      submitBtn.textContent = 'Sending...';

      try {
        const resp = await fetch('/api/feedback', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            source: 'feedback-widget',
            type,
            email,
            message: msg
          })
        });

        const data = await resp.json().catch(() => ({}));
        if (!resp.ok || !data.ok) {
          throw new Error(data.error || 'Could not send feedback.');
        }

        alert('Thanks! Your feedback was sent to our support team.');
        modal.classList.remove('active');
        form.reset();
      } catch (err) {
        alert(err.message || 'Failed to send feedback. Please try again.');
      } finally {
        submitBtn.disabled = false;
        submitBtn.textContent = 'Send Feedback';
      }
    };
  },

  initGlobalNegotiationBanner: function() {
    const path = window.location.pathname || '';
    if (path.includes('/audit')) return; // audit page has dedicated CTA block
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
          <a class="btn global-negotiation-banner__btn" href="/audit#human-negotiation">Start Full Audit + Negotiation</a>
        </div>
      </div>
    `;
    footer.parentNode.insertBefore(wrap, footer);
  },

  // 7. Global Licensing Logic (Gumroad)
  License: {
    STORAGE_KEY: 'mh_license_active',
    DATA_KEY: 'mh_license_data', // Stores {key, email}
    
    isActivated: function() {
      return localStorage.getItem(this.STORAGE_KEY) === 'true';
    },

    activate: async function(key, email) {
      localStorage.setItem(this.STORAGE_KEY, 'true');
      if (key && email) {
        localStorage.setItem(this.DATA_KEY, JSON.stringify({ key, email }));
        
        // If user is logged in, sync to Supabase metadata
        if (window.dbClient) {
          const { data: { user } } = await window.dbClient.auth.getUser();
          if (user) {
            await window.dbClient.auth.updateUser({
              data: { mh_license_key: key }
            });
          }
        }
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

      try {
        const response = await fetch('https://bisqgousuvljttesjkkm.supabase.co/functions/v1/verify-license', {
          method: 'POST',
          headers: { 
            'Content-Type': 'application/json',
            'apikey': SUPABASE_ANON_KEY,
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`
          },
          body: JSON.stringify({ license_key: key, email: email })
        });

        if (!response.ok) {
          const errorData = await response.json().catch(() => ({}));
          if (response.status === 403 || (errorData && errorData.message === "LICENSE_LIMIT_REACHED")) {
            throw new Error("LICENSE_LIMIT_REACHED");
          } else if (response.status === 401) {
            throw new Error("INVALID_KEY");
          } else {
            throw new Error(errorData.message || "SERVER_ERROR");
          }
        }

        const data = await response.json();
        if (data && data.success) {
          await this.activate(key, email);
          console.log("MediHelp License: Activation successful.");
          return true;
        }
        
        // If we got here, success was false or data was missing
        throw new Error(data.message || "INVALID_KEY");
      } catch (e) {
        console.error("MediHelp License: Verification failed", e);
        throw e;
      }
    }
  }
};

// 7. Auto-init on Load
document.addEventListener('DOMContentLoaded', () => {
  MediHelp.initFeedbackWidget();
});

// Export to window
window.MediHelp = MediHelp;
window.debounce = debounce;
window.renderFAQ = renderFAQ;
window.toggleFAQ = toggleFAQ;
window.switchTab = switchTab;
window.escapeHtml = escapeHtml;
window.sanitizeText = escapeHtml; // Alias for backward compatibility in audit modules
