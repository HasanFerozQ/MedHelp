DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT id, title, semester_id, usmle_step FROM topics) LOOP
        RAISE NOTICE 'Topic: %, Semester: %, USMLE: %', r.title, r.semester_id, r.usmle_step;
    END LOOP;
END $$;
