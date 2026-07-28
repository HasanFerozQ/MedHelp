const CACHE_NAME = 'ghs-data-v1';
const DATA_PATH_PREFIX = '/tabs/health-stats/data/';

self.addEventListener('install', event => {
  self.skipWaiting();
});

self.addEventListener('activate', event => {
  event.waitUntil(self.clients.claim());
});

self.addEventListener('fetch', event => {
  try {
    const url = new URL(event.request.url);
    if (url.pathname.startsWith(DATA_PATH_PREFIX)) {
      event.respondWith((async () => {
        const cache = await caches.open(CACHE_NAME);
        const cached = await cache.match(event.request);
        const networkFetch = fetch(event.request).then(async (res) => {
          try { if (res && res.ok) await cache.put(event.request, res.clone()); } catch (e) {}
          return res;
        }).catch(() => null);
        // Return cached immediately if available, else network. Still update cache in background.
        return cached || networkFetch;
      })());
    }
  } catch (e) {
    // ignore
  }
});

self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting();
  }
});
