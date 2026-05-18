/**
 * MediHelp Calculator Service Worker — offline cache
 * Caches calculator assets only (no auth/patient data)
 */
const CACHE = 'mh-calc-v2';
const ASSETS = [
  '/medical-calculator',
  '/medical-calculator.html',
  '/styles.css',
  '/tabs/calculator/calculator.css',
  '/tabs/calculator/formulas.js',
  '/tabs/calculator/clinical-data.js',
  '/tabs/calculator/i18n.js',
  '/tabs/calculator/registry.js',
  '/tabs/calculator/schemas.js',
  '/tabs/calculator/schemas-extra.js',
  '/tabs/calculator/schemas-remaining.js',
  '/tabs/calculator/compute.js',
  '/tabs/calculator/compute-remaining.js',
  '/tabs/calculator/ui.js',
  '/core.js',
  '/icons/logo.png',
  '/icons/favicon.ico',
  '/calculator.webmanifest'
];

self.addEventListener('install', (e) => {
  e.waitUntil(
    caches.open(CACHE).then((cache) => cache.addAll(ASSETS)).then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', (e) => {
  e.waitUntil(
    caches.keys().then((keys) =>
      Promise.all(keys.filter((k) => k !== CACHE).map((k) => caches.delete(k)))
    ).then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (e) => {
  const url = new URL(e.request.url);
  if (url.origin !== location.origin) return;
  if (url.pathname.includes('supabase') || url.pathname.startsWith('/api/')) return;

  const isCalcPage = url.pathname.includes('medical-calculator');
  const isCalcAsset = ASSETS.some((a) => url.pathname === a || url.pathname.endsWith(a.replace(/^\//, '')));
  if (!isCalcPage && !isCalcAsset) return;

  e.respondWith(
    caches.match(e.request).then((cached) => {
      const fetchPromise = fetch(e.request).then((res) => {
        if (res.ok) {
          const clone = res.clone();
          caches.open(CACHE).then((cache) => cache.put(e.request, clone));
        }
        return res;
      }).catch(() => cached);
      return cached || fetchPromise;
    })
  );
});
