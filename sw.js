const CACHE_NAME = 'ghs-data-v1';
const DATA_PATH_PREFIX = '/tabs/health-stats/data/';

self.addEventListener('install', event => {
  self.skipWaiting();
});

self.addEventListener('activate', event => {
  event.waitUntil((async () => {
    const cacheNames = await caches.keys();
    await Promise.all(cacheNames.map(name => {
      if (name !== CACHE_NAME) {
        return caches.delete(name);
      }
    }));
    await self.clients.claim();
  })());
});

self.addEventListener('fetch', event => {
  try {
    const url = new URL(event.request.url);
    if (url.pathname.startsWith(DATA_PATH_PREFIX)) {
      event.respondWith((async () => {
        const cache = await caches.open(CACHE_NAME);
        const cacheKey = new Request(url.toString(), { method: 'GET', credentials: 'same-origin' });
        const cached = await cache.match(cacheKey);

        const networkFetch = fetch(cacheKey).then(async (res) => {
          if (res && res.ok) {
            await cache.put(cacheKey, res.clone());
          }
          return res;
        }).catch(() => null);

        return cached || networkFetch;
      })());
    }
  } catch (e) {
    // ignore fetch errors from non-HTTP URLs or unsupported cases
  }
});

self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting();
  }
});
