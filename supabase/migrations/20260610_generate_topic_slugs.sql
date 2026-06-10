-- Generate slugs for topics that don't have them
-- This migration creates a function to slugify titles and updates all topics with missing slugs

-- First, create a function to generate slugs
CREATE OR REPLACE FUNCTION generate_slug(text TEXT)
RETURNS TEXT AS $$
BEGIN
  -- Convert to lowercase and replace special characters with hyphens
  RETURN lower(
    regexp_replace(
      regexp_replace(text, '[^a-zA-Z0-9\s-]', '', 'g'),
      '[-\s]+', '-', 'g'
    )
  );
END;
$$ LANGUAGE plpgsql;

-- Update topics without slugs
-- This will generate slugs and handle duplicates by appending numbers
DO $$
DECLARE
  topic_record RECORD;
  base_slug TEXT;
  final_slug TEXT;
  counter INTEGER;
BEGIN
  FOR topic_record IN 
    SELECT id, title FROM topics WHERE slug IS NULL OR slug = ''
  LOOP
    base_slug := generate_slug(topic_record.title);
    final_slug := base_slug;
    counter := 1;
    
    -- Check if slug already exists and find a unique one
    WHILE EXISTS (SELECT 1 FROM topics WHERE slug = final_slug AND id != topic_record.id) LOOP
      final_slug := base_slug || '-' || counter;
      counter := counter + 1;
    END LOOP;
    
    -- Update the topic with the generated slug
    UPDATE topics 
    SET slug = final_slug 
    WHERE id = topic_record.id;
    
    RAISE NOTICE 'Updated topic % (%) with slug: %', topic_record.id, topic_record.title, final_slug;
  END LOOP;
END $$;

-- Add a unique index on slug to prevent duplicates in the future
CREATE UNIQUE INDEX IF NOT EXISTS topics_slug_unique ON topics(slug) WHERE slug IS NOT NULL;
