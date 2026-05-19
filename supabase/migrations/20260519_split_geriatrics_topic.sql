-- Split 'Physiological aging — organ system changes, pharmacokinetic/pharmacodynamic shifts' into two topics:
-- 1: Physiological aging — organ system changes
-- 2: Pharmacokinetic/pharmacodynamic shifts

BEGIN;

DO $$
BEGIN
    -- Check if the new topic already exists
    IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'geri-pharmacokinetic-shifts' AND year_id = 4) THEN
        -- 1. Shift the orders of all subsequent topics in Geriatrics section to make room for the new topic
        UPDATE topics
        SET "order" = "order" + 1
        WHERE year_id = 4 AND "order" >= 798;

        -- 2. Update the title of the existing topic
        UPDATE topics
        SET title = 'Physiological aging — organ system changes'
        WHERE slug = 'geri-aging-changes' AND year_id = 4;

        -- 3. Insert the new second topic
        INSERT INTO topics (title, slug, section, year_id, "order")
        VALUES (
            'Pharmacokinetic/pharmacodynamic shifts',
            'geri-pharmacokinetic-shifts',
            'Geriatrics',
            4,
            798
        );
    ELSE
        -- 4. Just ensure titles and order are correct in case they were updated in subsequent runs
        UPDATE topics
        SET title = 'Physiological aging — organ system changes'
        WHERE slug = 'geri-aging-changes' AND year_id = 4;

        UPDATE topics
        SET title = 'Pharmacokinetic/pharmacodynamic shifts',
            "order" = 798
        WHERE slug = 'geri-pharmacokinetic-shifts' AND year_id = 4;
    END IF;
END $$;

COMMIT;
