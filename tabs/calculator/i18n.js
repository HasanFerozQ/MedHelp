/**
 * MediHelp Medical Calculator — EN/ES translations
 */
window.CalcI18n = {
  lang: 'en',

  strings: {
    en: {
      appTitle: 'Medical Calculator',
      appSubtitle: 'Role-based clinical calculators for bedside use',
      searchPlaceholder: 'Search calculators… (e.g. vancomycin, GCS, parkland)',
      recentSearches: 'Recent',
      favorites: 'Favorites',
      recents: 'Recently Used',
      allRoles: 'All Roles',
      openCalculator: 'Open Calculator',
      comingSoon: 'Coming Soon',
      freeDemo: 'Free Demo',
      calculate: 'Calculate',
      reset: 'Reset',
      copy: 'Copy Result',
      copied: 'Copied!',
      showAdvanced: 'Show advanced settings',
      hideAdvanced: 'Hide advanced settings',
      back: 'Back',
      result: 'Result',
      interpretation: 'Interpretation',
      formula: 'Formula',
      normal: 'Normal',
      high: 'High',
      low: 'Low',
      critical: 'Critical',
      offlineReady: 'Available Offline',
      offlinePending: 'Syncing offline cache…',
      emergencyMode: 'Emergency Mode',
      unlockPremium: 'Unlock Calculator Access',
      premiumDesc: 'Activate your Medical Exam Mastery license to access all calculators.',
      getLicense: 'Get Instant Access',
      activateLicense: 'Activate Access',
      licenseKey: 'Gumroad License Key',
      licenseEmail: 'Email Address',
      signInRequired: 'Sign in to use calculators',
      signInDesc: 'Create an account or sign in, then activate your license.',
      premiumRequired: 'Premium license required for this calculator',
      tryFreeDemo: 'Try the free demo calculators in each category',
      noResults: 'No calculators found',
      selectRole: 'Select your role',
      bookmark: 'Bookmark',
      unbookmark: 'Remove bookmark',
      presets: 'Quick Presets',
      adult: 'Adult',
      pediatric: 'Pediatric',
      kg70: '70 kg',
      kg50: '50 kg',
      disclaimer: 'For educational and clinical support only. Verify all results independently before clinical use.',
      metaTitle: 'Free Medical Calculators — 150+ Clinical Tools | MediHelp',
      metaDescription: 'Role-based clinical calculators for bedside decisions. BMI, creatinine clearance, SOFA, APACHE-II, vancomycin dosing & more. Works offline. Free for all specialties.',
      roles: {
        doctors: 'Doctors',
        er: 'Emergency Department',
        icu: 'ICU / Critical Care',
        nurses: 'Nurses',
        pharmacists: 'Pharmacists',
        pediatrics: 'Pediatrics',
        obgyn: 'OB/GYN',
        anesthesia: 'Anesthesia',
        students: 'Medical Students',
        surgeons: 'Surgeons',
        lab: 'Laboratory',
        dietitians: 'Dietitians'
      }
    },
    es: {
      appTitle: 'Calculadora Médica',
      appSubtitle: 'Calculadoras clínicas por rol para uso en cabecera',
      searchPlaceholder: 'Buscar calculadoras… (ej. vancomicina, GCS, parkland)',
      recentSearches: 'Recientes',
      favorites: 'Favoritos',
      recents: 'Usados recientemente',
      allRoles: 'Todos los roles',
      openCalculator: 'Abrir calculadora',
      comingSoon: 'Próximamente',
      freeDemo: 'Demo gratis',
      calculate: 'Calcular',
      reset: 'Restablecer',
      copy: 'Copiar resultado',
      copied: '¡Copiado!',
      showAdvanced: 'Mostrar ajustes avanzados',
      hideAdvanced: 'Ocultar ajustes avanzados',
      back: 'Volver',
      result: 'Resultado',
      interpretation: 'Interpretación',
      formula: 'Fórmula',
      normal: 'Normal',
      high: 'Alto',
      low: 'Bajo',
      critical: 'Crítico',
      offlineReady: 'Disponible sin conexión',
      offlinePending: 'Sincronizando caché…',
      emergencyMode: 'Modo emergencia',
      unlockPremium: 'Desbloquear calculadoras',
      premiumDesc: 'Active su licencia Medical Exam Mastery para acceder a todas las calculadoras.',
      getLicense: 'Obtener acceso',
      activateLicense: 'Activar acceso',
      licenseKey: 'Clave de licencia Gumroad',
      licenseEmail: 'Correo electrónico',
      signInRequired: 'Inicie sesión para usar calculadoras',
      signInDesc: 'Cree una cuenta o inicie sesión, luego active su licencia.',
      premiumRequired: 'Se requiere licencia premium para esta calculadora',
      tryFreeDemo: 'Pruebe las calculadoras demo gratis en cada categoría',
      noResults: 'No se encontraron calculadoras',
      selectRole: 'Seleccione su rol',
      bookmark: 'Marcar',
      unbookmark: 'Quitar marcador',
      presets: 'Presets rápidos',
      adult: 'Adulto',
      pediatric: 'Pediátrico',
      kg70: '70 kg',
      kg50: '50 kg',
      disclaimer: 'Solo para apoyo educativo y clínico. Verifique todos los resultados antes del uso clínico.',
      metaTitle: 'Calculadoras Médicas Gratuitas — 150+ Herramientas Clínicas | MediHelp',
      metaDescription: 'Calculadoras clínicas por rol para decisiones en cabecera. IMC, aclaramiento de creatinina, SOFA, APACHE-II, dosificación de vancomicina y más. Funciona sin conexión. Gratis para todas las especialidades.',
      roles: {
        doctors: 'Médicos',
        er: 'Urgencias',
        icu: 'UCI / Cuidados críticos',
        nurses: 'Enfermeras',
        pharmacists: 'Farmacéuticos',
        pediatrics: 'Pediatría',
        obgyn: 'Obstetricia/Ginecología',
        anesthesia: 'Anestesia',
        students: 'Estudiantes de medicina',
        surgeons: 'Cirujanos',
        lab: 'Laboratorio',
        dietitians: 'Dietistas'
      }
    }
  },

  t(key) {
    const parts = key.split('.');
    let val = this.strings[this.lang];
    for (const p of parts) {
      val = val?.[p];
    }
    return val ?? key;
  },

  setLang(lang) {
    if (this.strings[lang]) {
      this.lang = lang;
      localStorage.setItem('mh_calc_lang', lang);
    }
  },

  init() {
    const path = window.location.pathname;
    if (path === '/es' || path.startsWith('/es/')) {
      this.lang = 'es';
    } else {
      const saved = localStorage.getItem('mh_calc_lang');
      if (saved && this.strings[saved]) this.lang = saved;
    }
    document.documentElement.lang = this.lang === 'es' ? 'es' : 'en';
  }
};
