/**
 * MediHelp Medical Calculator — SEO (SoftwareApplication schema, hreflang, meta)
 */
window.CalcSEO = {
  BASE: 'https://www.medihelp.live',

  LANDING_SLUGS: {
    bmi: '/calculators/bmi-calculator',
    'creatinine-clearance': '/calculators/creatinine-clearance-calculator',
    bsa: '/calculators/bsa-calculator',
    'bicarbonate-deficit': '/calculators/bicarbonate-deficit-calculator'
  },

  isSpanishPath(path) {
    const p = path || location.pathname;
    return p === '/es' || p.startsWith('/es/');
  },

  stripLocale(path) {
    if (path === '/es') return '/medical-calculator';
    if (path.startsWith('/es/')) return path.slice(3) || '/medical-calculator';
    return path;
  },

  withLocale(path, lang) {
    const base = this.stripLocale(path);
    if (lang === 'es') return base === '/medical-calculator' ? '/es/medical-calculator' : '/es' + base;
    return base;
  },

  localePath(path) {
    return this.withLocale(path, CalcI18n.lang);
  },

  pagePath(state) {
    const raw = location.pathname;
    const base = this.stripLocale(raw);

    if (state.view === 'calc' && state.calcId) {
      const landing = this.LANDING_SLUGS[state.calcId];
      if (landing) return landing;
      const role = state.role || CalcRegistry.getById(state.calcId)?.role;
      if (role && base.startsWith('/calculators/')) return base;
      if (role) return `/calculators/${role}`;
      return '/medical-calculator';
    }

    if (state.view === 'role' && state.role) {
      return `/calculators/${state.role}`;
    }

    if (base.startsWith('/calculators/')) return base;
    return '/medical-calculator';
  },

  pageSearch(state) {
    if (state.view === 'calc' && state.calcId && !this.LANDING_SLUGS[state.calcId]) {
      return `?calc=${state.calcId}`;
    }
    if (state.view === 'role' && state.role && !location.search.includes('role=')) {
      return `?role=${state.role}`;
    }
    const params = new URLSearchParams(location.search);
    if (state.view === 'home') {
      params.delete('calc');
      params.delete('role');
    }
    const q = params.toString();
    return q ? `?${q}` : '';
  },

  pageUrl(lang, state) {
    const path = this.withLocale(this.pagePath(state), lang);
    const search = this.pageSearch(state);
    return `${this.BASE}${path}${search}`;
  },

  update(state) {
    this.updateHreflang(state);
    if (state.view === 'calc' && state.calcId) {
      const calc = CalcRegistry.getById(state.calcId);
      if (calc) {
        this.updateSoftwareApplication(calc, state);
        this.updateMeta(calc, state);
      }
    } else {
      this.removeSoftwareApplication();
      this.updateHubMeta(state);
    }
  },

  updateHreflang(state) {
    document.querySelectorAll('link[rel="alternate"][hreflang]').forEach(el => el.remove());

    const enUrl = this.pageUrl('en', state);
    const esUrl = this.pageUrl('es', state);

    [
      { hreflang: 'en', href: enUrl },
      { hreflang: 'es', href: esUrl },
      { hreflang: 'x-default', href: enUrl }
    ].forEach(({ hreflang, href }) => {
      const link = document.createElement('link');
      link.rel = 'alternate';
      link.hreflang = hreflang;
      link.href = href;
      link.setAttribute('data-calc-hreflang', '1');
      document.head.appendChild(link);
    });
  },

  updateSoftwareApplication(calc, state) {
    this.removeSoftwareApplication();

    const lang = CalcI18n.lang;
    const name = calc.name[lang] || calc.name.en;
    const desc = this._schemaDescription(calc, lang);
    const url = this.pageUrl(lang, state);
    const features = this._featureList(calc);

    const schema = {
      '@context': 'https://schema.org',
      '@type': 'SoftwareApplication',
      name,
      description: desc,
      applicationCategory: 'MedicalApplication',
      operatingSystem: 'Web, iOS, Android',
      url,
      offers: {
        '@type': 'Offer',
        price: '0',
        priceCurrency: 'USD'
      },
      featureList: features,
      inLanguage: lang === 'es' ? 'es' : 'en-US'
    };

    const script = document.createElement('script');
    script.type = 'application/ld+json';
    script.id = 'calc-software-application-schema';
    script.textContent = JSON.stringify(schema);
    document.head.appendChild(script);
  },

  removeSoftwareApplication() {
    document.getElementById('calc-software-application-schema')?.remove();
  },

  _schemaDescription(calc, lang) {
    const desc = calc.desc[lang] || calc.desc.en;
    if (lang === 'es') {
      return `Calculadora gratuita basada en evidencia clínica. ${desc}. Funciona sin conexión.`;
    }
    return `Free evidence-based ${calc.name.en.toLowerCase()}. ${desc}. Works offline.`;
  },

  _featureList(calc) {
    const tags = (calc.tags || []).slice(0, 3).join(', ');
    const base = 'metric and imperial units, offline support';
    return tags ? `${tags}, ${base}` : base;
  },

  updateMeta(calc, state) {
    const lang = CalcI18n.lang;
    const name = calc.name[lang] || calc.name.en;
    const url = this.pageUrl(lang, state);

    let title;
    let description;
    if (lang === 'es') {
      title = `${name} | MediHelp`;
      description = this._schemaDescription(calc, 'es');
    } else {
      title = `${calc.name.en} | MediHelp`;
      description = this._schemaDescription(calc, 'en');
    }

    document.title = title;
    this._setMeta('name', 'description', description);
    this._setMeta('property', 'og:title', title);
    this._setMeta('property', 'og:description', description);
    this._setMeta('property', 'og:url', url);
    this._setMeta('name', 'twitter:title', title);
    this._setMeta('name', 'twitter:description', description);
    this._setLink('canonical', url);
    document.documentElement.lang = lang === 'es' ? 'es' : 'en';
  },

  updateHubMeta(state) {
    const lang = CalcI18n.lang;
    const url = this.pageUrl(lang, state);
    const title = CalcI18n.t('metaTitle');
    const description = CalcI18n.t('metaDescription');

    document.title = title;
    this._setMeta('name', 'description', description);
    this._setMeta('property', 'og:title', title);
    this._setMeta('property', 'og:description', description);
    this._setMeta('property', 'og:url', url);
    this._setMeta('name', 'twitter:title', title);
    this._setMeta('name', 'twitter:description', description);
    this._setLink('canonical', url);
    document.documentElement.lang = lang === 'es' ? 'es' : 'en';
  },

  _setMeta(attr, key, content) {
    let el = document.querySelector(`meta[${attr}="${key}"]`);
    if (!el) {
      el = document.createElement('meta');
      el.setAttribute(attr, key);
      document.head.appendChild(el);
    }
    el.setAttribute('content', content);
  },

  _setLink(rel, href) {
    let el = document.querySelector(`link[rel="${rel}"]`);
    if (!el) {
      el = document.createElement('link');
      el.rel = rel;
      document.head.appendChild(el);
    }
    el.href = href;
  },

  navigateToLocale(lang) {
    if (!CalcI18n.strings[lang]) return;
    CalcI18n.setLang(lang);

    const path = this.withLocale(location.pathname, lang);
    const next = path + location.search;
    if (next !== location.pathname + location.search) {
      history.pushState({}, '', next);
    }

    CalcUI._parseRoute();
    CalcUI.render();
  }
};
