-- Hidden Step 2 CK full-length mock exam question pools (not shown in USMLE topic browser)
BEGIN;

DO $$
DECLARE
    v_max_order INT;
BEGIN
    SELECT COALESCE(MAX("order"), 0) INTO v_max_order FROM topics WHERE usmle_step = 2;

    IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-2-mock-pool-mock1') THEN
        INSERT INTO topics (title, slug, section, usmle_step, "order")
        VALUES ('USMLE Step 2 CK Mock #1 — Full-Length Pool', 'usmle-2-mock-pool-mock1', 'Mock Exams', 2, v_max_order + 1);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-2-mock-pool-mock2') THEN
        INSERT INTO topics (title, slug, section, usmle_step, "order")
        VALUES ('USMLE Step 2 CK Mock #2 — Internal Medicine Emphasis', 'usmle-2-mock-pool-mock2', 'Mock Exams', 2, v_max_order + 2);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-2-mock-pool-mock3') THEN
        INSERT INTO topics (title, slug, section, usmle_step, "order")
        VALUES ('USMLE Step 2 CK Mock #3 — Surgery & Acute Care', 'usmle-2-mock-pool-mock3', 'Mock Exams', 2, v_max_order + 3);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-2-mock-pool-mock4') THEN
        INSERT INTO topics (title, slug, section, usmle_step, "order")
        VALUES ('USMLE Step 2 CK Mock #4 — Pediatrics & OB/GYN', 'usmle-2-mock-pool-mock4', 'Mock Exams', 2, v_max_order + 4);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-2-mock-pool-mock5') THEN
        INSERT INTO topics (title, slug, section, usmle_step, "order")
        VALUES ('USMLE Step 2 CK Mock #5 — Psychiatry, Ethics & Multispecialty', 'usmle-2-mock-pool-mock5', 'Mock Exams', 2, v_max_order + 5);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-2-mock-pool-mock6') THEN
        INSERT INTO topics (title, slug, section, usmle_step, "order")
        VALUES ('USMLE Step 2 CK Mock #6 — Emergency & Clinical Subspecialty Integration', 'usmle-2-mock-pool-mock6', 'Mock Exams', 2, v_max_order + 6);
    END IF;

END $$;
COMMIT;