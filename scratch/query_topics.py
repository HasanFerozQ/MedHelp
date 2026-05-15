
import requests
import json

URL = 'https://bisqgousuvljttesjkkm.supabase.co'
KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4'

headers = {
    "apikey": KEY,
    "Authorization": f"Bearer {KEY}"
}

# Fetch topics
try:
    response = requests.get(f"{URL}/rest/v1/topics?select=id,title,slug", headers=headers)
    response.raise_for_status()
    topics = response.json()
    print("Searching for End-of-life...")
    for t in topics:
        if "end-of-life" in t['title'].lower():
            print(f"ID: {t['id']}, Title: {t['title']}, Slug: {t['slug']}")
except Exception as e:
    print(f"Error: {e}")
