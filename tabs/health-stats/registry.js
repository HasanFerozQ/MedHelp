/**
 * Global Health Statistics — Category Registry
 * Register new categories here to add pages without duplicating render logic.
 */
window.HealthStatsRegistry = {
  hubTitle: 'Global Health Statistics',
  hubDescription: 'MediHelp collects, organizes, and visualizes health statistics from trusted global organizations including WHO, IDF, IARC, IHME, CDC, and the World Heart Federation.',
  categories: [
    {
      id: 'diabetes-statistics-2026',
      slug: 'diabetes-statistics-2026',
      title: 'Diabetes Statistics 2026',
      shortTitle: 'Diabetes',
      description: 'Global diabetes prevalence, undiagnosed cases, type breakdowns, country rankings, mortality, age and gender distribution, and projections to 2030 and 2045.',
      lastUpdated: '2026-01-15',
      statCount: 24,
      icon: '🩸',
      accent: '#ef4444',
      sources: ['IDF Diabetes Atlas 11th Edition', 'WHO GHO', 'CDC Diabetes Data'],
      dataPath: '/tabs/health-stats/data/diabetes-2026.json',
      relatedArticles: [
        { title: 'Medical Bill Audit', url: '/medical-bill-audit' },
        { title: 'BMI Calculator', url: '/calculators/bmi-calculator' }
      ]
    },
    {
      id: 'cancer-statistics-2026',
      slug: 'cancer-statistics-2026',
      title: 'Cancer Statistics 2026',
      shortTitle: 'Cancer',
      description: 'New cancer cases, deaths, most common cancer types, survival context, country rankings, gender and age breakdowns, trends, and regional comparisons from GLOBOCAN.',
      lastUpdated: '2026-01-15',
      statCount: 22,
      icon: '🎗️',
      accent: '#8b5cf6',
      sources: ['IARC GLOBOCAN 2024', 'American Cancer Society', 'WHO'],
      dataPath: '/tabs/health-stats/data/cancer-2026.json',
      relatedArticles: [
        { title: 'Medical Bill Audit', url: '/medical-bill-audit' },
        { title: 'Blog', url: '/blog' }
      ]
    },
    {
      id: 'obesity-statistics-2026',
      slug: 'obesity-statistics-2026',
      title: 'Obesity Statistics 2026',
      shortTitle: 'Obesity',
      description: 'Adult and childhood obesity rates, BMI trends, country rankings, gender and age distribution, economic impact, future projections, and regional comparisons.',
      lastUpdated: '2026-01-15',
      statCount: 20,
      icon: '⚖️',
      accent: '#f59e0b',
      sources: ['WHO GHO', 'NCD-RisC', 'World Obesity Federation', 'Our World in Data'],
      dataPath: '/tabs/health-stats/data/obesity-2026.json',
      relatedArticles: [
        { title: 'BMI Calculator', url: '/calculators/bmi-calculator' },
        { title: 'Medical Calculator', url: '/medical-calculator' }
      ]
    },
    {
      id: 'heart-disease-statistics-2026',
      slug: 'heart-disease-statistics-2026',
      title: 'Heart Disease Statistics 2026',
      shortTitle: 'Heart Disease',
      description: 'Cardiovascular deaths, leading causes, stroke and heart attack statistics, hypertension, cholesterol, smoking-related CVD, country rankings, and demographic breakdowns.',
      lastUpdated: '2026-01-15',
      statCount: 23,
      icon: '❤️',
      accent: '#ec4899',
      sources: ['WHO', 'World Heart Federation', 'IHME GBD (referenced)'],
      dataPath: '/tabs/health-stats/data/heart-disease-2026.json',
      relatedArticles: [
        { title: 'Medical Bill Audit', url: '/medical-bill-audit' },
        { title: 'BMI Calculator', url: '/calculators/bmi-calculator' }
      ]
    }
  ],

  getCategory(slug) {
    return this.categories.find(c => c.slug === slug);
  },

  getCategoryUrl(slug) {
    return '/global-health-statistics/' + slug;
  }
};
