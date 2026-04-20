-- ==========================================
-- Curriculum Reorganization Script (V2 - Robust Fix)
-- Moves specified topics to Semester 1 and the rest to Semester 2
-- ==========================================

BEGIN;

-- 1. Ensure Semester 1 and 2 exist
INSERT INTO public.semesters (id, name, "order")
VALUES 
    (1, 'Semester 1', 1),
    (2, 'Semester 2', 2)
ON CONFLICT (id) DO NOTHING;

-- 2. Move ALL topics to Semester 2 temporarily
UPDATE public.topics SET semester_id = 2;

-- 3. Assign Priority Topics to Semester 1 by slug matching
DO $$
DECLARE
    v_topic_titles TEXT[] := ARRAY[
        'Cell Biology',
        'Histology',
        'Upper Limb',
        'Lower Limb',
        'General Physiology',
        'Blood Physiology',
        'Biochem Basics',
        'General Embryology'
    ];
    v_title TEXT;
    v_slug TEXT;
    v_order INTEGER;
BEGIN
    FOR i IN 1..cardinality(v_topic_titles) LOOP
        v_title := v_topic_titles[i];
        v_slug := LOWER(REPLACE(v_title, ' ', '-'));
        v_order := i;

        -- We check by slug globally first to avoid "Duplicate Key" errors
        -- If it exists anywhere, we move it to Sem 1 and sync the title/order
        IF EXISTS (SELECT 1 FROM public.topics WHERE slug = v_slug) THEN
            UPDATE public.topics 
            SET semester_id = 1, 
                title = v_title,
                "order" = v_order
            WHERE slug = v_slug;
        ELSE
            -- Only if it doesn't exist anywhere do we insert it
            INSERT INTO public.topics (semester_id, title, slug, "order")
            VALUES (1, v_title, v_slug, v_order);
        END IF;
    END LOOP;
END $$;

COMMIT;
