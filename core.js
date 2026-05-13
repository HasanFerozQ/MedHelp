/**
 * MediHelp — core.js
 * Global Utilities: Shared Supabase init, Theme toggling, FAQ rendering, and common UI helpers.
 */

// 1. Initialize Supabase globally
const SUPABASE_URL  = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

if (window.supabase) {
  window.dbClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
  // NOTE: Auth state listener is registered AFTER MediHelp is defined (see DOMContentLoaded below)
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

  initAuthModal: function() {
    if (document.getElementById('auth-modal')) return;

    // Add modal to body
    const modal = document.createElement('div');
    modal.id = 'auth-modal';
    modal.className = 'auth-modal';
    modal.innerHTML = `
      <div class="auth-modal-content">
        <button class="auth-close" onclick="MediHelp.hideAuthModal()">&times;</button>
        <h2 id="auth-title">Sign In to MediHelp</h2>
        <form id="auth-form" class="auth-form">
          <input type="email" id="auth-email" placeholder="Email" required>
          <div class="password-wrapper">
            <input type="password" id="auth-password" placeholder="Password" required>
            <button type="button" class="password-toggle" id="password-toggle" title="Show/Hide Password">👁️</button>
          </div>
          <div id="password-rules" class="password-rules hidden">
            Password must be 8+ characters with uppercase, lowercase, and a number.
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
    const GUMROAD_URL = "https://prodat.gumroad.com/l/medical-exam-mastery";

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
      const email = document.getElementById('auth-email').value.trim();
      const password = document.getElementById('auth-password').value;
      const submitBtn = document.getElementById('auth-submit');

      if (!validateEmail(email)) {
        alert('Please enter a valid email address.');
        return;
      }
      if (this.isSignUp && !validatePassword(password)) {
        alert('Password does not meet requirements:\n- At least 8 characters\n- At least one uppercase letter\n- At least one lowercase letter\n- At least one number');
        return;
      }

      submitBtn.disabled = true;
      submitBtn.textContent = this.isSignUp ? 'Creating Account...' : 'Signing In...';

      try {
        let result;
        if (this.isSignUp) {
          result = await window.dbClient.auth.signUp({ email, password });
          if (result.error) throw result.error;
          
          // Show beautiful banner and redirect
          this.showNotification(
            'Account Created!', 
            'Opening the secure licensing portal in a new tab. Please get your key and return here to activate.',
            'success',
            { url: GUMROAD_URL, text: 'Open License Portal' }
          );
          
          setTimeout(() => {
            window.open(GUMROAD_URL, '_blank');
            // Open the activator modal so it's waiting for them when they return
            this.License.showActivator();
          }, 2000);

          this.hideAuthModal();
        } else {
          result = await window.dbClient.auth.signInWithPassword({ email, password });
          if (result.error) {
            if (result.error.message.toLowerCase().includes('invalid login credentials')) {
              if (confirm('Account not found with these credentials. Would you like to Sign Up instead?')) {
                this.toggleAuthMode();
                submitBtn.disabled = false;
                submitBtn.textContent = 'Sign Up';
                return;
              }
            }
            throw result.error;
          }
          this.showNotification('Welcome Back!', 'You have signed in successfully.');
          this.hideAuthModal();
        }
      } catch (error) {
        this.showNotification('Auth Error', error.message, 'error');
      } finally {
        submitBtn.disabled = false;
        submitBtn.textContent = this.isSignUp ? 'Sign Up' : 'Sign In';
      }
    });

    // Auth state change
    window.dbClient.auth.onAuthStateChange((event, session) => {
      this.updateAuthButton();
      if (session?.user) {
        this.hideAuthModal();
      }
    });

    // Add signin button to navbar
    this.updateAuthButton();
  },

  isAuthPage: function() {
    const path = window.location.pathname;
    return path.includes('medical-exam') ||
      path.includes('flash-cards') ||
      path.includes('cpt-code-search') ||
      path.includes('claim-denial-codes') ||
      path.includes('medical-bill-audit') ||
      path === '/' ||
      path.endsWith('.html');
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
    if (this.isSignUp) {
      title.textContent = 'Sign Up for MediHelp';
      submitBtn.textContent = 'Sign Up';
      toggleText.textContent = 'Already have an account? Sign In';
      rulesHint.classList.remove('hidden');
    } else {
      title.textContent = 'Sign In to MediHelp';
      submitBtn.textContent = 'Sign In';
      toggleText.textContent = "Don't have an account? Sign Up";
      rulesHint.classList.add('hidden');
    }
  },

  updateAuthButton: async function() {
    if (!this.isAuthPage()) return;
    if (!window.dbClient) {
      console.warn('MediHelp: dbClient not initialized yet. Retrying in 100ms...');
      setTimeout(() => this.updateAuthButton(), 100);
      return;
    }
    const containers = document.querySelectorAll('.nav-actions');
    if (containers.length === 0) return;

    const { data, error } = await window.dbClient.auth.getUser();
    const user = data?.user;
    
    containers.forEach(container => {
      // 1. Remove ANY existing auth button in THIS specific container
      container.querySelectorAll('.auth-btn').forEach(el => el.remove());

      const authBtn = document.createElement('button');
      // Use class for multiple instances, not ID
      authBtn.className = 'btn btn-ghost auth-btn';
      authBtn.style.padding = '8px 18px';
      authBtn.style.fontSize = '14px';
      authBtn.style.borderRadius = '10px';

      if (user) {
        authBtn.textContent = 'Logout';
        authBtn.onclick = async () => {
          if (confirm('Are you sure you want to logout?')) {
            await window.dbClient.auth.signOut();
          }
        };
      } else {
        authBtn.textContent = 'Login / Sign Up';
        authBtn.onclick = () => this.showAuthModal();
      }

      // 2. Insert before theme toggle or at the end of THIS container
      const themeBtn = container.querySelector('.theme-btn');
      if (themeBtn) {
        container.insertBefore(authBtn, themeBtn);
      } else {
        container.appendChild(authBtn);
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
        <div class="mh-notif-h">${title}</div>
        <div class="mh-notif-p">${message}</div>
        ${action ? `<a href="${action.url}" class="mh-notif-btn">${action.text}</a>` : ''}
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
      if (!window.dbClient) return;
      const { data: { user } } = await window.dbClient.auth.getUser();
      if (!user) return;

      const { error } = await window.dbClient
        .from('licenses')
        .upsert({
          user_id: user.id,
          license_key: key,
          email: email,
          status: 'active',
          source: 'gumroad'
        }, {
          onConflict: 'license_key'
        });
      if (error) throw error;
    },

    restore: async function() {
      const data = localStorage.getItem(this.DATA_KEY);
      if (!data) throw new Error("No license data found on this device.");
      const { key, email } = JSON.parse(data);
      return this.verify(key, email);
    },

    verify: async function(key, email) {
      if (!key || !email) throw new Error("License key and email are required.");

      const controller = new AbortController();
      const timeoutId = setTimeout(() => controller.abort(), 15000); // 15s timeout

      try {
        console.log("MediHelp License: Verifying with Edge Function...");
        const response = await fetch('https://bisqgousuvljttesjkkm.supabase.co/functions/v1/verify-license', {
          method: 'POST',
          headers: { 
            'Content-Type': 'application/json',
            'apikey': SUPABASE_ANON_KEY,
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`
          },
          body: JSON.stringify({ license_key: key, email: email }),
          signal: controller.signal
        });

        clearTimeout(timeoutId);

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
        // Be flexible with success indicators
        if (data && (data.success === true || data.verified === true || data.ok === true || data.status === 'active')) {
          await this.activate(key, email);
          console.log("MediHelp License: Activation successful.");
          return true;
        }
        
        throw new Error(data.message || "INVALID_KEY");
      } catch (e) {
        clearTimeout(timeoutId);
        if (e.name === 'AbortError') {
          console.error("MediHelp License: Verification timed out after 15s");
          throw new Error("TIMEOUT");
        }
        console.error("MediHelp License: Verification failed", e);
        throw e;
      }
    }
  },

  _cachedUser: null,
  _isPremiumCache: null,
  isPremium: async function() {
    if (!window.dbClient) return false;
    
    // Return cache if available (Phase 3.1)
    if (this._isPremiumCache !== null) return this._isPremiumCache;

    try {
      if (!this._cachedUser) {
        const { data, error } = await window.dbClient.auth.getUser();
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
      return false;
    }
  },
  // New: Simple sync check for UI rendering
  isPremiumSync: function() {
    return this._isPremiumCache === true;
  }
};

// 7. Auto-init on Load
document.addEventListener('DOMContentLoaded', () => {
  MediHelp.initFeedbackWidget();
  
  if (MediHelp.isAuthPage()) {
    MediHelp.initAuthModal(); // Enabled - rollout secure licensing
  }

  // Register auth state listener HERE — after MediHelp is fully defined
  // This prevents a ReferenceError when onAuthStateChange fires with INITIAL_SESSION
  if (window.dbClient) {
    window.dbClient.auth.onAuthStateChange(async (event, session) => {
      console.log(`MediHelp Auth: ${event}`, session?.user?.email);
      
      const wasPremium = MediHelp._isPremiumCache;

      // Update global cache
      MediHelp._cachedUser = session?.user || null;
      MediHelp._isPremiumCache = MediHelp.License.isActivated();

      if (event === 'SIGNED_OUT') {
        console.log('MediHelp: User signed out. Clearing storage and performing HARD REFRESH...');
        localStorage.removeItem(MediHelp.License.STORAGE_KEY);
        localStorage.removeItem(MediHelp.License.DATA_KEY);
        MediHelp._isPremiumCache = false;
        
        // Hard Refresh: Redirect to current path with a cache-busting timestamp
        const cleanPath = window.location.pathname;
        window.location.href = cleanPath + '?cache_bust=' + Date.now();
        return;
      }

      if (session?.user) {
        // Sync license from licenses table if not already active locally
        if (!MediHelp.License.isActivated()) {
          try {
            const { data: licenses, error } = await window.dbClient
              .from('licenses')
              .select('license_key, email')
              .eq('user_id', session.user.id)
              .eq('status', 'active')
              .single();

            if (licenses && !error) {
              console.log('MediHelp: Syncing license from database...');
              await MediHelp.License.activate(licenses.license_key, licenses.email);
              MediHelp._isPremiumCache = true;
              if (!wasPremium) window.location.reload(); // Reload to unlock premium UI if newly synced
            }
          } catch (e) {
            console.warn('MediHelp: Database license sync failed.', e);
          }
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
window.sanitizeText = escapeHtml; // Alias for backward compatibility in audit modules
