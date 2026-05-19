/**
 * MediHelp Medical Calculator — UI Controller
 */
window.CalcUI = {
  state: { view: 'home', role: null, calcId: null, emergency: false },
  STORAGE: { favs: 'mh_calc_favs', recents: 'mh_calc_recents', searches: 'mh_calc_searches', values: 'mh_calc_last_vals' },

  init() {
    CalcI18n.init();
    this._bindEvents();
    this._registerSW();
    this._checkAccess().then(() => {
      this._parseRoute();
      this.render();
    });
  },

  async _checkAccess() {
    const user = (await window.dbClient?.auth.getUser())?.data?.user;
    this._user = user;
    this._premium = await MediHelp.isPremium();
    return true;
  },

  canAccess(calc) {
    if (!this._user) return 'auth';
    if (calc.freeDemo) return 'ok';
    if (this._premium) return 'ok';
    return 'premium';
  },

  _parseRoute() {
    const p = new URLSearchParams(location.search);
    const calc = p.get('calc');
    const role = p.get('role');
    if (calc && CalcRegistry.getById(calc)) {
      this.state.view = 'calc';
      this.state.calcId = calc;
    } else if (role) {
      this.state.view = 'role';
      this.state.role = role;
    }
    this.state.emergency = p.get('emergency') === '1' || ['er', 'icu'].includes(this.state.role);
  },

  _bindEvents() {
    window.addEventListener('popstate', () => { this._parseRoute(); this.render(); });
  },

  _registerSW() {
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker.register('/sw-calculator.js').catch(() => {});
    }
  },

  goHome() {
    this.state = { view: 'home', role: null, calcId: null, emergency: this.state.emergency };
    history.pushState({}, '', '/medical-calculator');
    this.render();
  },

  goRole(roleId) {
    this.state = { view: 'role', role: roleId, calcId: null, emergency: ['er', 'icu'].includes(roleId) };
    history.pushState({}, '', '/medical-calculator?role=' + roleId);
    this.render();
  },

  openCalc(id) {
    const calc = CalcRegistry.getById(id);
    if (!calc) return;
    const access = this.canAccess(calc);
    if (access === 'auth') { MediHelp.showAuthModal(); return; }
    if (access === 'premium' && !calc.implemented) return;
    if (access === 'premium') { this._showPremium(); return; }
    if (!calc.implemented) return;
    this._addRecent(id);
    this.state = { view: 'calc', role: calc.role, calcId: id, emergency: this.state.emergency || ['er', 'icu'].includes(calc.role) };
    history.pushState({}, '', '/medical-calculator?calc=' + id);
    this.render();
  },

  _showPremium() {
    document.getElementById('calc-premium-modal')?.classList.add('visible');
  },

  _addRecent(id) {
    let r = JSON.parse(localStorage.getItem(this.STORAGE.recents) || '[]');
    r = [id, ...r.filter(x => x !== id)].slice(0, 4);
    localStorage.setItem(this.STORAGE.recents, JSON.stringify(r));
  },

  _onSearch(q) {
    const box = document.getElementById('search-results');
    if (!box) return;
    if (!q.trim()) { box.innerHTML = ''; box.classList.remove('visible'); return; }
    const results = CalcRegistry.search(q).slice(0, 8);
    box.innerHTML = results.map(c => `
      <button class="search-item" data-id="${c.id}">
        <strong>${this._name(c)}</strong>
        <span>${c.implemented ? '' : CalcI18n.t('comingSoon')}</span>
      </button>`).join('');
    box.classList.add('visible');
    box.querySelectorAll('.search-item').forEach(btn => {
      btn.onclick = () => { this.openCalc(btn.dataset.id); box.classList.remove('visible'); document.getElementById('calc-search').value = ''; };
    });
    let s = JSON.parse(localStorage.getItem(this.STORAGE.searches) || '[]');
    if (q.length > 2) { s = [q, ...s.filter(x => x !== q)].slice(0, 5); localStorage.setItem(this.STORAGE.searches, JSON.stringify(s)); }
  },

  _name(c) { return c.name[CalcI18n.lang] || c.name.en; },
  _desc(c) { return c.desc[CalcI18n.lang] || c.desc.en; },

  toggleFav(id) {
    let f = JSON.parse(localStorage.getItem(this.STORAGE.favs) || '[]');
    f = f.includes(id) ? f.filter(x => x !== id) : [...f, id];
    localStorage.setItem(this.STORAGE.favs, JSON.stringify(f));
    this.render();
  },

  isFav(id) {
    return JSON.parse(localStorage.getItem(this.STORAGE.favs) || '[]').includes(id);
  },

  render() {
    const root = document.getElementById('calc-app');
    if (!root) return;
    root.classList.toggle('emergency-mode', this.state.emergency);
    if (this.state.view === 'home') root.innerHTML = this._renderHome();
    else if (this.state.view === 'role') root.innerHTML = this._renderRole(this.state.role);
    else if (this.state.view === 'calc') root.innerHTML = this._renderCalculator(this.state.calcId);
    this._updateOfflineBadge();
  },

  _renderHome() {
    const favs = JSON.parse(localStorage.getItem(this.STORAGE.favs) || '[]');
    const recents = JSON.parse(localStorage.getItem(this.STORAGE.recents) || '[]').slice(0, 4);
    let html = `
      <div class="calc-hero">
        <h1 class="hero-h1">${CalcI18n.t('appTitle')}</h1>
        <p class="hero-sub">${CalcI18n.t('appSubtitle')}</p>
        <div class="calc-search-wrap">
          <input id="calc-search" type="search" placeholder="${CalcI18n.t('searchPlaceholder')}" autocomplete="off" inputmode="search">
          <div id="search-results" class="search-results"></div>
        </div>
        <div class="calc-lang">
          <button id="lang-en" class="lang-btn ${CalcI18n.lang === 'en' ? 'active' : ''}">EN</button>
          <button id="lang-es" class="lang-btn ${CalcI18n.lang === 'es' ? 'active' : ''}">ES</button>
          <span class="lang-sep">|</span>
          <button id="unit-us" class="lang-btn ${CalcUnits.system === 'US' ? 'active' : ''}" title="US units (lbs, in, mg/dL)">US</button>
          <button id="unit-si" class="lang-btn ${CalcUnits.system === 'SI' ? 'active' : ''}" title="SI/metric units (kg, cm, µmol/L)">SI</button>
        </div>
        <div id="offline-badge" class="offline-badge">🟢 ${CalcI18n.t('offlineReady')}</div>
      </div>`;

    if (favs.length) html += `<section class="calc-section"><h2>${CalcI18n.t('favorites')}</h2><div class="calc-grid">${favs.map(id => this._card(CalcRegistry.getById(id))).join('')}</div></section>`;
    if (recents.length) html += `<section class="calc-section"><h2>${CalcI18n.t('recents')}</h2><div class="calc-grid">${recents.map(id => this._card(CalcRegistry.getById(id))).filter(Boolean).join('')}</div></section>`;

    html += `<section class="calc-section"><h2>${CalcI18n.t('selectRole')}</h2><div class="role-grid">`;
    html += CalcRegistry.roles.map(r => `
      <button class="role-card ${r.emergency ? 'role-emergency' : ''}" data-role="${r.id}">
        <span class="role-icon">${r.icon}</span>
        <span class="role-name">${CalcI18n.t('roles.' + r.id)}</span>
        <span class="role-count">${CalcRegistry.getByRole(r.id).filter(c => c.implemented).length} active</span>
      </button>`).join('');
    html += '</div></section>';
    html += `<p class="calc-disclaimer">${CalcI18n.t('disclaimer')}</p>`;

    setTimeout(() => {
      document.querySelectorAll('.role-card').forEach(btn => btn.onclick = () => this.goRole(btn.dataset.role));
      document.getElementById('calc-search')?.addEventListener('input', (e) => this._onSearch(e.target.value));
      document.getElementById('lang-en')?.addEventListener('click', () => { CalcI18n.setLang('en'); this.render(); });
      document.getElementById('lang-es')?.addEventListener('click', () => { CalcI18n.setLang('es'); this.render(); });
      document.getElementById('unit-us')?.addEventListener('click', () => { CalcUnits.setSystem('US'); this.render(); });
      document.getElementById('unit-si')?.addEventListener('click', () => { CalcUnits.setSystem('SI'); this.render(); });
      this._bindCalcCards();
    }, 0);
    return html;
  },

  _bindCalcCards() {
    document.querySelectorAll('.calc-card').forEach(card => {
      const id = card.dataset.id;
      const calc = CalcRegistry.getById(id);
      if (!calc) return;
      const btn = card.querySelector('button');
      if (!btn) return;
      if (!calc.implemented) { btn.disabled = true; return; }
      const access = this.canAccess(calc);
      if (access === 'premium') {
        btn.onclick = () => this._showPremium();
      } else if (access === 'auth') {
        btn.onclick = () => MediHelp.showAuthModal();
      } else {
        btn.onclick = () => this.openCalc(id);
      }
    });
  },

  _card(c) {
    if (!c) return '';
    const access = this.canAccess(c);
    const locked = access === 'premium';
    return `
      <article class="calc-card ${!c.implemented ? 'coming-soon' : ''} ${locked ? 'locked' : ''}" data-id="${c.id}">
        ${c.freeDemo ? `<span class="chip chip-free">${CalcI18n.t('freeDemo')}</span>` : ''}
        ${!c.implemented ? `<span class="chip chip-soon">${CalcI18n.t('comingSoon')}</span>` : ''}
        <h3>${this._name(c)}</h3>
        <p>${this._desc(c)}</p>
        <button class="btn btn-primary btn-sm" ${!c.implemented || locked ? 'disabled' : ''}>${CalcI18n.t('openCalculator')}</button>
      </article>`;
  },

  _renderRole(roleId) {
    const role = CalcRegistry.roles.find(r => r.id === roleId);
    const calcs = CalcRegistry.getByRole(roleId);
    const bySpec = {};
    calcs.forEach(c => { const s = c.specialty || 'general'; (bySpec[s] ||= []).push(c); });

    let html = `<div class="calc-role-header ${role?.emergency ? 'emergency' : ''}">
      <button id="calc-back" class="btn btn-ghost">← ${CalcI18n.t('back')}</button>
      <h1>${role?.icon || ''} ${CalcI18n.t('roles.' + roleId)}</h1>
      ${role?.emergency ? `<div class="emergency-presets">
        <span>${CalcI18n.t('presets')}:</span>
        <button class="preset-btn" data-preset="adult">Adult</button>
        <button class="preset-btn" data-preset="ped">Pediatric</button>
        <button class="preset-btn" data-preset="70">70 kg</button>
      </div>` : ''}
    </div>`;

    for (const [spec, items] of Object.entries(bySpec)) {
      html += `<section class="calc-section"><h2 class="spec-title">${spec.replace(/-/g, ' ')}</h2><div class="calc-grid">`;
      html += items.map(c => this._card(c)).join('');
      html += '</div></section>';
    }

    setTimeout(() => {
      document.getElementById('calc-back')?.addEventListener('click', () => this.goHome());
      this._bindCalcCards();
      document.querySelectorAll('.preset-btn').forEach(btn => {
        btn.onclick = () => this._applyPreset(btn.dataset.preset);
      });
    }, 0);
    return html;
  },

  _renderCalculator(id) {
    const calc = CalcRegistry.getById(id);
    const schema = CalcSchemas[id] || CalcSchemas[CalcCompute._aliases[id]];
    if (!calc || !schema) return '<p>Calculator not found</p>';

    const saved = JSON.parse(localStorage.getItem(this.STORAGE.values) || '{}')[id] || {};

    let html = `<div class="calc-view-header">
      <button id="calc-back" class="btn btn-ghost">← ${CalcI18n.t('back')}</button>
      <div class="calc-title-block">
        <h1>${this._name(calc)}</h1>
        <p>${this._desc(calc)}</p>
      </div>
      <button class="fav-btn ${this.isFav(id) ? 'active' : ''}" id="fav-btn" title="${CalcI18n.t('bookmark')}">⭐</button>
    </div>
    <div class="calc-layout">
      <form id="calc-form" class="calc-form">
        <div class="formula-box"><span>${CalcI18n.t('formula')}</span><code>${(schema.formula || '').replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;')}</code></div>`;

    const basic = schema.inputs.filter(i => !i.advanced);
    const advanced = schema.inputs.filter(i => i.advanced);

    html += basic.map(inp => this._inputHtml(inp, saved)).join('');
    if (advanced.length) {
      html += `<button type="button" id="toggle-adv" class="btn btn-ghost adv-toggle">${CalcI18n.t('showAdvanced')}</button>
        <div id="adv-fields" class="hidden">${advanced.map(inp => this._inputHtml(inp, saved)).join('')}</div>`;
    }
    html += `<button type="submit" class="btn btn-primary calc-submit">${CalcI18n.t('calculate')}</button>
      </form>
      <div id="calc-result" class="calc-result empty">
        <div class="result-placeholder">${CalcI18n.t('result')}</div>
      </div>
    </div>`;

    setTimeout(() => {
      document.getElementById('calc-back')?.addEventListener('click', () => this.goRole(calc.role));
      document.getElementById('fav-btn')?.addEventListener('click', () => this.toggleFav(id));
      document.getElementById('toggle-adv')?.addEventListener('click', () => {
        document.getElementById('adv-fields')?.classList.toggle('hidden');
      });
      document.getElementById('calc-form')?.addEventListener('submit', (e) => {
        e.preventDefault();
        this._runCalc(id);
      });
      document.querySelectorAll('.stepper').forEach(s => {
        s.querySelector('.step-minus')?.addEventListener('click', () => this._step(s, -1));
        s.querySelector('.step-plus')?.addEventListener('click', () => this._step(s, 1));
      });
      // Unit badge — toggle only this field's display unit (does not change global SI/US)
      document.querySelectorAll('.unit-badge').forEach(btn => {
        btn.addEventListener('click', () => {
          const grp = btn.dataset.group;
          if (!grp) return;
          const inp = document.querySelector(`[name="${btn.dataset.field}"]`);
          if (!inp) return;
          const currentDisplay = inp.dataset.displayUnit || CalcUnits.system;
          const newDisplay = currentDisplay === 'SI' ? 'US' : 'SI';
          const currentVal = parseFloat(inp.value);
          if (!isNaN(currentVal)) {
            const canonical = CalcUnits.displayToCanonical(currentVal, grp, currentDisplay);
            inp.value = CalcUnits.canonicalToDisplay(canonical, grp, newDisplay);
          }
          inp.dataset.displayUnit = newDisplay;
          btn.textContent = CalcUnits.getUnit(grp, newDisplay) + ' ⇆';
        });
      });
    }, 0);
    return html;
  },

  _inputHtml(inp, saved) {
    const grp = CalcUnits.inferGroup(inp);
    const savedUnits = saved._units || {};
    const fieldDisplaySys = savedUnits[inp.id] || CalcUnits.system;
    const displayUnit = grp ? CalcUnits.getUnit(grp, fieldDisplaySys) : (inp.unit || '');
    const siDefault = inp.default ?? '';
    const displayDefault = (grp && siDefault !== '')
      ? CalcUnits.canonicalToDisplay(siDefault, grp, fieldDisplaySys)
      : siDefault;
    const savedRaw = saved[inp.id];
    const val = savedRaw !== undefined ? savedRaw : displayDefault;
    const label = inp.label[CalcI18n.lang] || inp.label.en;
    const range = grp ? CalcUnits.getRange(grp, fieldDisplaySys) : (inp.min !== undefined ? inp.min + '–' + (inp.max || '') : '');
    const placeholder = range ? 'Norm: ' + range : '';

    if (inp.type === 'select') {
      const opts = inp.options.map(o => `<option value="${o.v}" ${String(val) === String(o.v) ? 'selected' : ''}>${o.l[CalcI18n.lang] || o.l.en}</option>`).join('');
      return `<label class="calc-field"><span>${label}</span><select name="${inp.id}" class="calc-input">${opts}</select></label>`;
    }
    if (inp.type === 'toggle') {
      return `<label class="calc-field toggle-field"><span>${label}</span><input type="checkbox" name="${inp.id}" class="calc-toggle" ${val ? 'checked' : ''}></label>`;
    }
    if (inp.type === 'date') {
      return `<label class="calc-field"><span>${label}</span><input type="date" name="${inp.id}" class="calc-input" value="${val}"></label>`;
    }
    if (inp.type === 'datetime-local') {
      return `<label class="calc-field"><span>${label}</span><input type="datetime-local" name="${inp.id}" class="calc-input" value="${val}"></label>`;
    }
    const unitBadge = displayUnit ? `<button type="button" class="unit-badge" data-field="${inp.id}" data-group="${grp || ''}" title="Toggle unit">${displayUnit} ⇆</button>` : '';
    return `<label class="calc-field">
      <span>${label}${inp.optional ? ' <em class="opt-label">Optional</em>' : ''}</span>
      <div class="stepper">
        <button type="button" class="step-minus">−</button>
        <input type="number" name="${inp.id}" class="calc-input" value="${val}" min="${inp.min ?? ''}" max="${inp.max ?? ''}" step="any" data-step="${inp.step || 1}" data-display-unit="${grp ? fieldDisplaySys : ''}" data-unit-group="${grp || ''}" inputmode="decimal" placeholder="${placeholder}">
        <button type="button" class="step-plus">+</button>
        ${unitBadge}
      </div>
    </label>`;
  },

  _step(wrap, dir) {
    const inp = wrap.querySelector('input');
    const step = parseFloat(inp.dataset.step) || 1;
    inp.value = (parseFloat(inp.value || 0) + dir * step).toFixed(step < 1 ? 1 : 0);
  },

  _runCalc(id) {
    const form = document.getElementById('calc-form');
    const vals = {};
    new FormData(form).forEach((v, k) => {
      const el = form.elements[k];
      vals[k] = el?.type === 'checkbox' ? el.checked : v;
    });
    form.querySelectorAll('input[type="checkbox"]').forEach(cb => {
      if (cb.name && !cb.checked) {
        vals[cb.name] = false;
      }
    });
    const displayUnits = {};
    form.querySelectorAll('[data-display-unit]').forEach(el => {
      if (el.name && el.dataset.displayUnit) displayUnits[el.name] = el.dataset.displayUnit;
    });

    const all = JSON.parse(localStorage.getItem(this.STORAGE.values) || '{}');
    all[id] = Object.assign({ _units: displayUnits }, vals);
    localStorage.setItem(this.STORAGE.values, JSON.stringify(all));

    const schema = CalcSchemas[id] || CalcSchemas[CalcCompute._aliases[id]];
    const siVals = schema ? CalcUnits.convertFormToSI(vals, schema, displayUnits) : vals;

    const result = CalcCompute.compute(id, siVals);
    const box = document.getElementById('calc-result');
    if (!box) return;

    if (result.error) {
      box.innerHTML = `<div class="result-error">${result.error}</div>`;
      box.classList.remove('empty');
      return;
    }

    const chipClass = 'chip-' + (result.chip || 'normal');
    let html = `<div class="result-primary">${result.primary}</div>
      <span class="status-chip ${chipClass}">${CalcI18n.t(result.chip || 'normal')}</span>
      <p class="result-interp">${result.interpretation}</p>`;
    if (result.details) {
      html += '<ul class="result-details">' + result.details.map(d => `<li><strong>${d.label}:</strong> ${d.value}</li>`).join('') + '</ul>';
    }
    html += `<button type="button" class="btn btn-ghost" id="copy-result">${CalcI18n.t('copy')}</button>`;
    box.innerHTML = html;
    box.classList.remove('empty');
    document.getElementById('copy-result')?.addEventListener('click', () => {
      navigator.clipboard.writeText(result.primary + ' — ' + result.interpretation);
    });
  },

  _applyPreset(preset) {
    // SI defaults in kg; convert to current display unit before populating fields
    const defaults = { adult: { weight: 70 }, ped: { weight: 20 }, '70': { weight: 70 } };
    const vals = defaults[preset];
    if (!vals) return;
    Object.entries(vals).forEach(([k, v]) => {
      const el = document.querySelector(`[name="${k}"]`);
      if (!el) return;
      // v is always in SI (kg); convert to display unit if US mode
      const displaySys = el.dataset.displayUnit || CalcUnits.system;
      const grp = el.dataset.unitGroup || (k === 'weight' ? 'weight' : '');
      const displayVal = grp ? CalcUnits.canonicalToDisplay(v, grp, displaySys) : v;
      el.value = displayVal;
    });
  },

  _updateOfflineBadge() {
    const badge = document.getElementById('offline-badge');
    if (!badge) return;
    if (navigator.onLine) {
      badge.textContent = '🟢 ' + CalcI18n.t('offlineReady');
      badge.style.opacity = '1';
    } else {
      badge.textContent = '🔴 Offline — cached content available';
      badge.style.opacity = '0.8';
    }
  }
};

async function verifyCalcLicense() {
  const user = (await window.dbClient?.auth.getUser())?.data?.user;
  if (!user) { MediHelp.showAuthModal(); return; }
  const key = document.getElementById('calc-license-key')?.value.trim();
  const email = document.getElementById('calc-license-email')?.value.trim();
  if (!key || !email) { MediHelp.toast?.('Enter license key and email') || alert('Enter license key and email'); return; }
  try {
    await MediHelp.License.verify(key, email);
    document.getElementById('calc-premium-modal')?.classList.remove('visible');
    CalcUI._premium = true;
    location.reload(); // reload fetches fresh premium state; in-memory render() before reload is wasted
  } catch (e) {
    alert(e.message || 'Invalid license');
  }
}

function closeCalcPremium() {
  document.getElementById('calc-premium-modal')?.classList.remove('visible');
}

document.addEventListener('DOMContentLoaded', () => CalcUI.init());
