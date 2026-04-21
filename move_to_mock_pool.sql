-- USMLE Step 1: Move 280 MCQs to Categorical Mock Pool
-- This keeps the subject topics (Anatomy, Pathology, etc.) empty for future content.

DO $$
DECLARE
    v_pool_id UUID;
BEGIN
    -- 1. Create the Mock Pool topic (with a unique slug to hide it from dashboard if needed)
    INSERT INTO public.topics (title, slug, usmle_step, "order")
    VALUES ('USMLE Step 1 Mock Pool', 'usmle-1-mock-pool-hidden', 1, 999)
    ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title
    RETURNING id INTO v_pool_id;

    -- 2. Move all questions from existing Step 1 topics to this pool
    -- We target all questions that currently belong to any Step 1 topic
    UPDATE public.mcqs 
    SET topic_id = v_pool_id
    WHERE topic_id IN (
        SELECT id FROM public.topics 
        WHERE usmle_step = 1 AND slug != 'usmle-1-mock-pool-hidden'
    );

    RAISE NOTICE 'Moved all USMLE Step 1 questions to topic: %', v_pool_id;
END $$;
