import requests
import json

URL = 'https://bisqgousuvljttesjkkm.supabase.co'
KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4'

headers = {
    "apikey": KEY,
    "Authorization": f"Bearer {KEY}"
}

# Fetch topics where year_id = 4 and usmle_step is null, ordered by "order"
try:
    response = requests.get(
        f"{URL}/rest/v1/topics?year_id=eq.4&usmle_step=is.null&order=order.asc",
        headers=headers
    )
    response.raise_for_status()
    topics = response.json()
    print(f"Total Year 4 topics found: {len(topics)}")
    for t in topics:
        print(f"Order: {t.get('order')}, Slug: {t.get('slug')}, Section: {t.get('section')}, Title: {t.get('title')[:40]}...")
except Exception as e:
    print(f"Error: {e}")
