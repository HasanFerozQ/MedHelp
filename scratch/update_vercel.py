import json

with open('vercel.json', 'r', encoding='utf-8') as f:
    v = json.load(f)

# Add health stats rewrites if not already present
rewrites = v.get('rewrites', [])
has_stats = any(r.get('source') == '/global-health-statistics' for r in rewrites)
if not has_stats:
    rewrites.insert(0, { "source": "/global-health-statistics", "destination": "/global-health-statistics.html" })
    rewrites.insert(1, { "source": "/global-health-statistics/:category", "destination": "/global-health-statistics-detail.html?category=:category" })
    v['rewrites'] = rewrites

with open('vercel.json', 'w', encoding='utf-8') as f:
    json.dump(v, f, indent=2)

print("Updated vercel.json with health stats rewrites.")
