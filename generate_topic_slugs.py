"""
Generate slugs for topics that don't have them.
This script connects to Supabase and updates all topics with missing slugs.
"""

import os
import re
from supabase import create_client

# Supabase configuration
SUPABASE_URL = os.getenv('SUPABASE_URL', 'https://bisqgousuvljttesjkkm.supabase.co')
SUPABASE_KEY = os.getenv('SUPABASE_SERVICE_ROLE_KEY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NTMwNDMxOSwiZXhwIjoyMDkwODgwMzE5fQ.PpVOWNEvMkLTuw8nJm7NwW30u8pKLbQL7tJVNh4jdn0')

def slugify(text):
    """Convert text to a URL-friendly slug."""
    # Convert to lowercase
    text = text.lower()
    # Replace special characters with hyphens
    text = re.sub(r'[^\w\s-]', '', text)
    # Replace spaces and multiple hyphens with single hyphen
    text = re.sub(r'[-\s]+', '-', text)
    # Remove leading/trailing hyphens
    text = text.strip('-')
    return text

def generate_unique_slug(base_slug, existing_slugs, topic_id=None):
    """Generate a unique slug by appending a number if needed."""
    if base_slug not in existing_slugs or (topic_id and existing_slugs.get(base_slug) == topic_id):
        return base_slug
    
    counter = 1
    while True:
        new_slug = f"{base_slug}-{counter}"
        if new_slug not in existing_slugs or (topic_id and existing_slugs.get(new_slug) == topic_id):
            return new_slug
        counter += 1

def main():
    # Initialize Supabase client
    supabase = create_client(SUPABASE_URL, SUPABASE_KEY)
    
    print("Fetching all topics...")
    response = supabase.table('topics').select('id, title, slug').execute()
    topics = response.data
    
    if not topics:
        print("No topics found.")
        return
    
    print(f"Found {len(topics)} topics")
    
    # Build a map of existing slugs to topic IDs
    existing_slugs = {}
    for topic in topics:
        if topic.get('slug'):
            existing_slugs[topic['slug']] = topic['id']
    
    # Find topics without slugs
    topics_without_slugs = [t for t in topics if not t.get('slug')]
    print(f"Topics without slugs: {len(topics_without_slugs)}")
    
    if not topics_without_slugs:
        print("All topics already have slugs!")
        return
    
    # Generate slugs for topics without them
    updates = []
    for topic in topics_without_slugs:
        base_slug = slugify(topic['title'])
        unique_slug = generate_unique_slug(base_slug, existing_slugs)
        
        updates.append({
            'id': topic['id'],
            'slug': unique_slug,
            'title': topic['title']
        })
        
        existing_slugs[unique_slug] = topic['id']
        print(f"  {topic['title']} -> {unique_slug}")
    
    # Update the database
    print("\nUpdating database...")
    for update in updates:
        try:
            supabase.table('topics').update({'slug': update['slug']}).eq('id', update['id']).execute()
            print(f"  ✓ Updated: {update['title']} -> {update['slug']}")
        except Exception as e:
            print(f"  ✗ Failed to update {update['title']}: {e}")
    
    print("\nDone!")

if __name__ == '__main__':
    main()
