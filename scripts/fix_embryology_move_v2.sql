-- Resilient Fix: Force Move Embryology with Data
DO $$
DECLARE
    v_data_topic_id UUID;
    v_empty_topic_id UUID;
BEGIN
    -- 1. Locate the topic that has actual MCQs or Cases (anywhere in DB)
    SELECT id INTO v_data_topic_id 
    FROM public.topics t
    WHERE (slug ILIKE '%embryology%' OR title ILIKE '%embryology%')
      AND (EXISTS (SELECT 1 FROM public.mcqs WHERE topic_id = t.id) 
           OR EXISTS (SELECT 1 FROM public.case_studies WHERE topic_id = t.id))
    LIMIT 1;

    -- 2. Locate the "Empty Shell" in Semester 1
    SELECT id INTO v_empty_topic_id
    FROM public.topics t
    WHERE semester_id = 1 
      AND (slug ILIKE '%embryology%' OR title ILIKE '%embryology%')
      AND NOT EXISTS (SELECT 1 FROM public.mcqs WHERE topic_id = t.id)
      AND NOT EXISTS (SELECT 1 FROM public.case_studies WHERE topic_id = t.id)
    LIMIT 1;

    -- 3. Surgical Execution
    -- Delete the empty barrier first to avoid unique constraint violations
    IF v_empty_topic_id IS NOT NULL THEN
        DELETE FROM public.topics WHERE id = v_empty_topic_id;
    END IF;

    -- Update the record that holds your 125 questions to Semester 1
    IF v_data_topic_id IS NOT NULL THEN
        UPDATE public.topics 
        SET semester_id = 1, 
            title = 'General Embryology', 
            slug = 'general-embryology', 
            "order" = 8 
        WHERE id = v_data_topic_id;
    END IF;
END $$;
