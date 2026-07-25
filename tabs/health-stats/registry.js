/**
 * Global Health Statistics Category Registry
 */

export const HEALTH_STATS_CATEGORIES = [
  {
    slug: 'diabetes-statistics-2026',
    title: 'Diabetes Statistics 2026',
    icon: '🩸',
    accent: '#ef4444',
    dataFile: '/tabs/health-stats/data/diabetes-2026.json',
    description: 'Global diabetes prevalence, undiagnosed cases, Type 1 vs Type 2 breakdown, country rankings, mortality, age and gender distribution, and projections to 2030 and 2045.',
    lastUpdated: 'January 15, 2026',
    statCount: 24,
    sources: ['IDF Diabetes Atlas 11th Edition', 'WHO GHO', 'CDC']
  },
  {
    slug: 'cancer-statistics-2026',
    title: 'Cancer Statistics 2026',
    icon: '🎗️',
    accent: '#8b5cf6',
    dataFile: '/tabs/health-stats/data/cancer-2026.json',
    description: 'New cancer cases, annual deaths, most common cancer types, survival context, country rankings, male vs female incidence, age groups, cancer trends, and regional comparisons.',
    lastUpdated: 'January 15, 2026',
    statCount: 22,
    sources: ['IARC GLOBOCAN 2024', 'American Cancer Society', 'WHO']
  },
  {
    slug: 'obesity-statistics-2026',
    title: 'Obesity Statistics 2026',
    icon: '⚖️',
    accent: '#f59e0b',
    dataFile: '/tabs/health-stats/data/obesity-2026.json',
    description: 'Adult and childhood obesity rates, BMI trends, country rankings, obesity by gender and age, economic impact (projected $4.3T by 2060), future projections, and regional comparisons.',
    lastUpdated: 'January 15, 2026',
    statCount: 20,
    sources: ['WHO GHO', 'NCD-RisC', 'World Obesity Federation']
  },
  {
    slug: 'heart-disease-statistics-2026',
    title: 'Heart Disease Statistics 2026',
    icon: '❤️',
    accent: '#ec4899',
    dataFile: '/tabs/health-stats/data/heart-disease-2026.json',
    description: 'Cardiovascular deaths, leading causes, stroke statistics, heart attack prevalence, hypertension (1.33B adults), cholesterol, smoking-related CVD, country rankings, and demographic breakdowns.',
    lastUpdated: 'January 15, 2026',
    statCount: 23,
    sources: ['WHO', 'World Heart Federation', 'IHME GBD']
  },
  {
    slug: 'stroke-statistics-2026',
    title: 'Stroke Statistics 2026',
    icon: '⚡',
    accent: '#3b82f6',
    dataFile: '/tabs/health-stats/data/stroke-2026.json',
    description: 'Global stroke incidence (12.2M/yr), 6.7M deaths, ischaemic vs hemorrhagic types, lifetime risk (1 in 4 adults), survivor disability, and country rankings.',
    lastUpdated: 'January 15, 2026',
    statCount: 21,
    sources: ['World Stroke Organization (WSO)', 'WHO', 'IHME GBD']
  },
  {
    slug: 'hypertension-statistics-2026',
    title: 'Hypertension Statistics 2026',
    icon: '🩺',
    accent: '#06b6d4',
    dataFile: '/tabs/health-stats/data/hypertension-2026.json',
    description: '1.33 billion adults with high blood pressure, care cascade (54% aware, 42% treated, 21% controlled), 10.8M attributable deaths, and sodium risk factors.',
    lastUpdated: 'January 15, 2026',
    statCount: 20,
    sources: ['WHO Global Report on Hypertension', 'NCD-RisC', 'CDC']
  },
  {
    slug: 'kidney-disease-statistics-2026',
    title: 'Kidney Disease Statistics 2026',
    icon: '🫘',
    accent: '#10b981',
    dataFile: '/tabs/health-stats/data/kidney-disease-2026.json',
    description: '850 million people with Chronic Kidney Disease (CKD), 90% undiagnosed early stages, diabetic nephropathy, dialysis/transplant figures, and 2040 forecasts.',
    lastUpdated: 'January 15, 2026',
    statCount: 19,
    sources: ['ISN Global Kidney Health Atlas', 'WHO', 'USRDS']
  },
  {
    slug: 'mental-health-statistics-2026',
    title: 'Mental Health Statistics 2026',
    icon: '🧠',
    accent: '#a78bfa',
    dataFile: '/tabs/health-stats/data/mental-health-2026.json',
    description: '970 million people with mental disorders, anxiety (301M), depression (280M), 720k annual suicide deaths, 75% treatment gap in LMICs, and $1T economic loss.',
    lastUpdated: 'January 15, 2026',
    statCount: 22,
    sources: ['WHO World Mental Health Report', 'IHME GBD', 'Lancet Commission']
  },
  {
    slug: 'tobacco-statistics-2026',
    title: 'Smoking & Tobacco Statistics 2026',
    icon: '🚭',
    accent: '#f97316',
    dataFile: '/tabs/health-stats/data/tobacco-2026.json',
    description: '1.3 billion tobacco users, 8.7 million annual deaths (7.4M direct + 1.3M secondhand), male vs female smoking rates, and country rankings.',
    lastUpdated: 'January 15, 2026',
    statCount: 20,
    sources: ['WHO Report on Global Tobacco Epidemic', 'CDC', 'IHME GBD']
  }
];
