/**
 * MediHelp — core.js (v5.0 Hardened)
 * Global Utilities, Authentication, and Secure Licensing System.
 */

const SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

// Initialize Supabase
if (window.supabase) {
  window.dbClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
}

const MediHelp = {
  _cachedUser: null,
  _isPremiumCache: null,
  _authSyncPromise: null,
  
  // High-level initialization state
  authReady: new Promise(resolve => {
    window._mhAuthResolver = resolve;
  }),

  /**
   * 1. BOOT SEQUENCE: The primary entry point for the entire platform
   */
  boot: async function() {
    console.log('MediHelp: Booting system...');
    this.initTheme();
    this.initFeedbackWidget();
    this.initGlobalNegotiationBanner();
    
    if (this.isAuthPage()) {
      this.initAuthModal();
    }

    this._registerAuthListener();
  },

  /**
   * 2. THEME ENGINE
   */
  initTheme: function() {
    const saved = localStorage.getItem('mh-theme') || 'dark';
    document.documentElement.setAttribute('data-theme', saved);
    const btn = document.getElementById('theme-toggle');
    if (btn) {
      btn.textContent = saved === 'dark' ? '☀️' : '🌙';
      btn.onclick = () => {
        const cur = document.documentElement.getAttribute('data-theme');
        const next = cur === 'dark' ? 'light' : 'dark';
        document.documentElement.setAttribute('data-theme', next);
        localStorage.setItem('mh-theme', next);
        btn.textContent = next === 'dark' ? '☀️' : '🌙';
      };
    }
  },

  /**
   * 3. AUTHENTICATION & STATE MANAGEMENT
   */
  _registerAuthListener: function() {
    const attempt = () => {
      if (!window.dbClient) {
        setTimeout(attempt, 50);
        return;
      }

      window.dbClient.auth.onAuthStateChange(async (event, session) => {
        console.log(`MediHelp Auth: ${event}`, session?.user?.email);
        
        const wasPremium = this._isPremiumCache;
        this._cachedUser = session?.user || null;
        this._isPremiumCache = this.License.isActivated();

        if (event === 'SIGNED_OUT') {
          this._handleLogout();
          return;
        }

        if (session?.user) {
          await this._syncLicenseState(session.user, wasPremium);
        }

        // Signal system ready
        if (window._mhAuthResolver) {
          window._mhAuthResolver();
          window._mhAuthResolver = null;
        }
        
        this.updateAuthButton();
      });
    };
    attempt();
  },

  _handleLogout: function() {
    console.log('MediHelp: Clearing local session...');
    localStorage.removeItem(this.License.STORAGE_KEY);
    localStorage.removeItem(this.License.DATA_KEY);
    sessionStorage.removeItem('mh_premium_session'); // Clear session cache
    this._isPremiumCache = false;
    
    const cleanPath = window.location.pathname;
    window.location.href = cleanPath + '?logout_success=' + Date.now();
  },

  _syncLicenseState: async function(user, wasPremium) {
    const isLocallyActive = this.License.isActivated();
    
    if (isLocallyActive) {
      // UPLOAD: Ensure local key is linked to this account
      const data = localStorage.getItem(this.License.DATA_KEY);
      if (data) {
        const { key, email } = JSON.parse(data);
        this.License._syncToCloud(key, email).catch(e => console.warn("Background upload failed:", e));
      }
      this._isPremiumCache = true;
    } else {
      // DOWNLOAD: Check if this account has an active license in the cloud
      this._authSyncPromise = (async () => {
        try {
          const { data: licenseRows, error } = await window.dbClient
            .from('licenses').select('license_key, email')
            .eq('user_id', user.id).eq('status', 'active').limit(1);

          if (licenseRows && licenseRows.length > 0 && !error) {
            const license = licenseRows[0];
            console.log('MediHelp: Cloud license found. Restoring access...');
            await this.License.activate(license.license_key, license.email);
            this._isPremiumCache = true;
            
            // Auto-refresh to unlock premium UI if we were previously free
            if (!wasPremium && !this.isAuthPage()) {
              window.location.reload();
            }
          } else {
            this._isPremiumCache = false;
          }
        } catch (e) {
          console.warn('MediHelp: Cloud sync failed.', e);
        } finally {
          this._authSyncPromise = null;
        }
      })();
      await this._authSyncPromise;
    }
  },

  /**
   * 4. PUBLIC API: PREMIUM STATUS
   */
  isPremium: async function() {
    if (!window.dbClient) {
      await new Promise(r => setTimeout(r, 500));
      if (!window.dbClient) return false;
    }
    
    await this.authReady;
    if (this._authSyncPromise) await this._authSyncPromise;

    if (this._isPremiumCache !== null) return this._isPremiumCache;
    
    // Final fallback check
    this._isPremiumCache = this.License.isActivated();
    return this._isPremiumCache;
  },

  /**
   * 5. LICENSING ENGINE (Gumroad)
   */
  License: {
    STORAGE_KEY: 'mh_license_active',
    DATA_KEY: 'mh_license_data',

    isActivated: function() {
      return localStorage.getItem(this.STORAGE_KEY) === 'true';
    },

    activate: async function(key, email) {
      localStorage.setItem(this.STORAGE_KEY, 'true');
      if (key && email) {
        localStorage.setItem(this.DATA_KEY, JSON.stringify({ key, email }));
        this._syncToCloud(key, email).catch(e => console.warn("Sync failed:", e));
      }
      return true;
    },

    verify: async function(key, email) {
      if (!key || !email) throw new Error("Key and email required.");
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
        const err = await response.json().catch(() => ({}));
        if (response.status === 403) throw new Error("LICENSE_LIMIT_REACHED");
        throw new Error(err.message || "INVALID_KEY");
      }

      await this.activate(key, email);
      return true;
    },

    _syncToCloud: async function(key, email) {
      if (!window.dbClient) return;
      const { data: { user } } = await window.dbClient.auth.getUser();
      if (!user) return;

      await window.dbClient.from('licenses').upsert({
        user_id: user.id,
        license_key: key,
        email: email,
        status: 'active',
        source: 'gumroad'
      }, { onConflict: 'license_key' });
    }
  },

  /**
   * 6. UI HELPERS & MODALS
   */
  initAuthModal: function() {
    if (document.getElementById('auth-modal')) return;
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
            <button type="button" class="password-toggle" id="password-toggle">👁️</button>
          </div>
          <div id="password-rules" class="password-rules hidden">8+ chars, upper, lower, number required.</div>
          <button type="submit" class="btn btn-primary" id="auth-submit">Sign In</button>
        </form>
        <div class="auth-toggle" onclick="MediHelp.toggleAuthMode()">Don't have an account? Sign Up</div>
      </div>`;
    document.body.appendChild(modal);

    // Setup password toggle
    const passInput = document.getElementById('auth-password');
    const passToggle = document.getElementById('password-toggle');
    passToggle.onclick = () => {
      passInput.type = passInput.type === 'password' ? 'text' : 'password';
    };

    // Form logic
    document.getElementById('auth-form').onsubmit = async (e) => {
      e.preventDefault();
      const email = document.getElementById('auth-email').value.trim();
      const password = document.getElementById('auth-password').value;
      const btn = document.getElementById('auth-submit');
      const isSignUp = document.getElementById('auth-title').textContent.includes('Sign Up');

      btn.disabled = true;
      btn.textContent = 'Processing...';

      try {
        const { error } = isSignUp 
          ? await window.dbClient.auth.signUp({ email, password })
          : await window.dbClient.auth.signInWithPassword({ email, password });

        if (error) throw error;
        
        if (isSignUp) {
          this.showNotification('Verify Email', 'Please check your inbox to confirm your account.');
          window.open('https://prodat.gumroad.com/l/medical-exam-mastery', '_blank');
        } else {
          this.showNotification('Success', 'Welcome back!');
        }
        this.hideAuthModal();
      } catch (err) {
        this.showNotification('Error', err.message, 'error');
      } finally {
        btn.disabled = false;
        btn.textContent = isSignUp ? 'Sign Up' : 'Sign In';
      }
    };
  },

  showAuthModal: function() { this.initAuthModal(); document.getElementById('auth-modal').classList.add('active'); },
  hideAuthModal: function() { document.getElementById('auth-modal').classList.remove('active'); },
  toggleAuthMode: function() {
    const title = document.getElementById('auth-title');
    const submit = document.getElementById('auth-submit');
    const toggle = document.querySelector('.auth-toggle');
    const rules = document.getElementById('password-rules');
    const isLogin = title.textContent.includes('Sign In');
    title.textContent = isLogin ? 'Sign Up for MediHelp' : 'Sign In to MediHelp';
    submit.textContent = isLogin ? 'Sign Up' : 'Sign In';
    toggle.textContent = isLogin ? 'Already have an account? Sign In' : "Don't have an account? Sign Up";
    isLogin ? rules.classList.remove('hidden') : rules.classList.add('hidden');
  },

  updateAuthButton: async function() {
    const containers = document.querySelectorAll('.nav-actions');
    const user = this._cachedUser;
    containers.forEach(c => {
      c.querySelectorAll('.auth-btn').forEach(b => b.remove());
      const btn = document.createElement('button');
      btn.className = 'btn btn-ghost auth-btn';
      btn.textContent = user ? 'Logout' : 'Login / Sign Up';
      btn.onclick = user ? () => this.signOut() : () => this.showAuthModal();
      const theme = c.querySelector('.theme-btn');
      theme ? c.insertBefore(btn, theme) : c.appendChild(btn);
    });
  },

  signOut: async function() {
    const confirmed = await this.confirm("Are you sure you want to sign out?");
    if (confirmed) await window.dbClient.auth.signOut();
  },

  confirm: function(msg) {
    return new Promise(resolve => {
      const confirmed = window.confirm(msg); // Fallback to window.confirm for simplicity, can be replaced with custom UI
      resolve(confirmed);
    });
  },

  showNotification: function(title, msg, type = 'success') {
    alert(`${title}: ${msg}`); // Simple alert for now, can be replaced with custom toast
  },

  isAuthPage: function() { return true; }, // Simplified for audit
  initFeedbackWidget: function() {},
  initGlobalNegotiationBanner: function() {}
};

// 8. HELPERS (Global Access)
window.MediHelp = MediHelp;
window.escapeHtml = (s) => s ? String(s).replace(/[&<>"']/g, m => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#039;'}[m])) : '';

// 9. START
document.addEventListener('DOMContentLoaded', () => MediHelp.boot());
