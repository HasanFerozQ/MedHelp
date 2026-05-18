-- Add new Ophthalmology and Geriatrics topics to the 4th Year curriculum
BEGIN;



-- Dynamically reorder to place exactly after ENT (Otolaryngology)
DO $$
DECLARE
    v_ent_order INTEGER;
    v_slug TEXT;
    v_slugs TEXT[] := ARRAY[
        'optho-red-eye',
        'optho-glaucoma',
        'optho-retinal-emergencies',
        'optho-retinopathy',
        'optho-cataract',
        'optho-trauma',
        'geri-aging-changes',
        'geri-falls',
        'geri-delirium-dementia',
        'geri-incontinence',
        'geri-pressure-ulcers',
        'geri-malnutrition',
        'geri-polypharmacy',
        'geri-cognitive-disorders',
        'geri-functional-assessment',
        'geri-osteoporosis',
        'geri-sensory-changes',
        'geri-cardiovascular',
        'geri-end-of-life',
        'geri-abuse',
        'geri-social-determinants'
    ];
    v_current_order INTEGER;
BEGIN
    -- Find the max order of ENT topics in year 4
    SELECT COALESCE(MAX("order"), 0) INTO v_ent_order 
    FROM topics 
    WHERE year_id = 4 AND (section ILIKE '%ENT%' OR section ILIKE '%Otolaryngology%');
    
    -- If ENT isn't found, just append to the very end
    IF v_ent_order = 0 THEN
        SELECT COALESCE(MAX("order"), 0) INTO v_ent_order FROM topics WHERE year_id = 4;
    END IF;

    -- Shift everything after ENT down by 50 to make room (excluding the newly inserted ones)
    UPDATE topics 
    SET "order" = "order" + 50 
    WHERE year_id = 4 AND "order" > v_ent_order AND slug != ALL(v_slugs);

    -- Now assign order to the new topics starting immediately after v_ent_order
    v_current_order := v_ent_order + 1;
    
    FOREACH v_slug IN ARRAY v_slugs LOOP
        UPDATE topics SET "order" = v_current_order WHERE slug = v_slug;
        v_current_order := v_current_order + 1;
    END LOOP;
    
END $$;

COMMIT;
