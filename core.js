/**
 * MediHelp — core.js
 * Global Utilities: Shared Supabase init, Theme toggling, FAQ rendering, and common UI helpers.
 * v4.9 — Nav slot, verify recovery, longer auth-sync wait for isPremium (20s).
 */

// 1. Initialize Supabase globally
const SUPABASE_URL  = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

// 1. Initialize Supabase globally with retry logic
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
    .replace(/&amp;nbsp;/gi, '&nbsp;');
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

    function openFeedbackMailto(payload) {
      const to = payload.support_email || 'supportdesk@medihelp.live';
      const subject = encodeURIComponent(`[MediHelp Feedback] ${payload.type || 'General'}`);
      const body = encodeURIComponent(
        `Type: ${payload.type || 'General'}\nEmail: ${payload.email || ''}\n\n${payload.message || ''}`
      );
      window.location.href = `mailto:${to}?subject=${subject}&body=${body}`;
    }

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
          if (data.fallback_mailto) {
            const useMailto = confirm(
              (data.error || 'Could not send feedback.') +
              '\n\nOpen your email app to send this message to support instead?'
            );
            if (useMailto) {
              openFeedbackMailto({ type, email, message: msg, support_email: data.support_email });
              modal.classList.remove('active');
              form.reset();
              return;
            }
          }
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

  initGlobalTriviaBanner: function() {
    const path = window.location.pathname || '';
    if (path.includes('/med-trivia')) return;
    if (document.getElementById('global-trivia-banner')) return;

    const footer = document.querySelector('.site-footer');
    if (!footer || !footer.parentNode) return;

    const wrap = document.createElement('section');
    wrap.id = 'global-trivia-banner';
    wrap.className = 'global-trivia-banner';
    wrap.innerHTML = `
      <div class="container">
        <div style="background:linear-gradient(135deg, rgba(var(--accent-rgb),0.14), rgba(56,189,248,0.08)); border:1px solid rgba(var(--accent-rgb),0.35); border-radius:16px; padding:22px; margin:36px 0 24px;">
          <div style="display:flex; justify-content:space-between; gap:16px; flex-wrap:wrap; align-items:center;">
            <div>
              <div style="font-size:12px; font-weight:800; color:var(--accent); text-transform:uppercase; letter-spacing:0.08em;">Free Daily Clinical Challenge</div>
              <div style="font-size:22px; font-weight:900; color:var(--text-h); margin-top:4px;">MedTrivia Daily Live at 8:00 PM ET</div>
              <div style="font-size:14px; color:var(--text-muted); margin-top:6px;">10 timed questions. Instant rationale. Share your score and percentile.</div>
            </div>
            <a class="btn" href="/med-trivia" style="white-space:nowrap;">Play MedTrivia</a>
          </div>
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
          <input type="text" id="auth-username" placeholder="Username (for MedTrivia leaderboard)" maxlength="24" style="display:none;">
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
      const username = document.getElementById('auth-username').value.trim();
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
          result = await window.dbClient.auth.signUp({
            email,
            password,
            options: {
              data: {
                username: username || null
              }
            }
          });
          if (result.error) throw result.error;
          
          this.hideAuthModal();

          // Show a clear instruction notification (no action link — the panel is opening)
          this.showNotification(
            'Account Created! 🎉',
            'Gumroad is opening in a new tab. After purchase, return here and paste your license key in the panel that just opened.',
            'success'
          );

          // Open Gumroad in a NEW tab, and simultaneously open the license
          // activation panel on THIS tab so it is waiting when the user returns.
          setTimeout(() => {
            window.open('https://prodat.gumroad.com/l/medical-exam-mastery', '_blank');
            // showActivator() opens #premium-modal if it exists on this page,
            // or redirects to /medical-exam-semester?showActivation=true which opens it there.
            this.License.showActivator();
          }, 800);

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
          // Clear caches so premium is re-evaluated fresh
          MediHelp._isPremiumCache = null;
          MediHelp._cachedUser = null;
          this.hideAuthModal();
          this.updateAuthButton();
          this.showNotification('Welcome Back! 👋', 'You are now signed in. Loading your access...');
        }
      } catch (error) {
        this.showNotification('Auth Error', error.message, 'error');
      } finally {
        submitBtn.disabled = false;
        submitBtn.textContent = this.isSignUp ? 'Sign Up' : 'Sign In';
      }
    });

    // Add signin button to navbar
    this.updateAuthButton();
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
    if (path.startsWith('/med-trivia')) return true;
    if (path.includes('medical-exam')) return true;
    if (path.includes('flash-cards')) return true;
    if (path.includes('medical-calculator')) return true;

    // Match by full href (covers local file:// and localhost serving)
    if (href.includes('medical-exam-semester')) return true;
    if (href.includes('medical-exam-preparation')) return true;
    if (href.includes('medical-exam-usmle')) return true;
    if (href.includes('flash-cards')) return true;
    if (href.includes('medical-calculator')) return true;
    if (href.includes('med-trivia')) return true;

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
          <span style="overflow:hidden;text-overflow:ellipsis;">${emailShort}</span>
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
  // New: Simple sync check for UI rendering
  isPremiumSync: function() {
    return this._isPremiumCache === true || this.License.isActivated();
  }
};

// 7. Auto-init on Load
document.addEventListener('DOMContentLoaded', async () => {
  MediHelp.initFeedbackWidget();
  MediHelp.initGlobalTriviaBanner();
  
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
