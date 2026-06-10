"""
Check the slug for OB/GYN topic
"""

import os
from supabase import create_client

# Supabase configuration
SUPABASE_URL = os.getenv('SUPABASE_URL', 'https://bisqgousuvljttesjkkm.supabase.co')
SUPABASE_KEY = os.getenv('SUPABASE_SERVICE_ROLE_KEY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NTMwNDMxOSwiZXhwIjoyMDkwODgwMzE5fQ.PpVOWNEvMkLTuw8nJm7NwW30u8pKLbQL7tJVNh4jdn0')

def main():
    supabase = create_client(SUPABASE_URL, SUPABASE_KEY)
    
    # Search for OB/GYN related topics
    response = supabase.table('topics').select('id, title, slug').ilike('title', '%obstetrics%').execute()
    
    print("OB/GYN related topics:")
    for topic in response.data:
        print(f"  Title: {topic['title']}")
        print(f"  Slug: {topic['slug']}")
        print(f"  ID: {topic['id']}")
        print()
    
    # Also search for "gynecology"
    response2 = supabase.table('topics').select('id, title, slug').ilike('title', '%gynecology%').execute()
    
    print("Gynecology related topics:")
    for topic in response2.data:
        print(f"  Title: {topic['title']}")
        print(f"  Slug: {topic['slug']}")
        print(f"  ID: {topic['id']}")
        print()

if __name__ == '__main__':
    main()
