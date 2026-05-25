-- USMLE Step 3 hidden mock pools (authentic FIP Day 1 + ACP Day 2)
BEGIN;
DO $$
DECLARE v_max INT;
BEGIN
  SELECT COALESCE(MAX("order"), 0) INTO v_max FROM topics WHERE usmle_step = 3;
  IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-3-mock-pool-mock1-day1-fip') THEN
    INSERT INTO topics (title, slug, section, usmle_step, "order") VALUES ('USMLE Step 3 Mock #1 — Day 1 FIP', 'usmle-3-mock-pool-mock1-day1-fip', 'Mock Exams', 3, v_max + 2);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-3-mock-pool-mock1-day2-acp') THEN
    INSERT INTO topics (title, slug, section, usmle_step, "order") VALUES ('USMLE Step 3 Mock #1 — Day 2 ACP', 'usmle-3-mock-pool-mock1-day2-acp', 'Mock Exams', 3, v_max + 3);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-3-mock-pool-mock2-day1-fip') THEN
    INSERT INTO topics (title, slug, section, usmle_step, "order") VALUES ('USMLE Step 3 Mock #2 — Day 1 FIP', 'usmle-3-mock-pool-mock2-day1-fip', 'Mock Exams', 3, v_max + 4);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-3-mock-pool-mock2-day2-acp') THEN
    INSERT INTO topics (title, slug, section, usmle_step, "order") VALUES ('USMLE Step 3 Mock #2 — Day 2 ACP', 'usmle-3-mock-pool-mock2-day2-acp', 'Mock Exams', 3, v_max + 5);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-3-mock-pool-mock3-day1-fip') THEN
    INSERT INTO topics (title, slug, section, usmle_step, "order") VALUES ('USMLE Step 3 Mock #3 — Day 1 FIP', 'usmle-3-mock-pool-mock3-day1-fip', 'Mock Exams', 3, v_max + 6);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-3-mock-pool-mock3-day2-acp') THEN
    INSERT INTO topics (title, slug, section, usmle_step, "order") VALUES ('USMLE Step 3 Mock #3 — Day 2 ACP', 'usmle-3-mock-pool-mock3-day2-acp', 'Mock Exams', 3, v_max + 7);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-3-mock-pool-mock4-day1-fip') THEN
    INSERT INTO topics (title, slug, section, usmle_step, "order") VALUES ('USMLE Step 3 Mock #4 — Day 1 FIP', 'usmle-3-mock-pool-mock4-day1-fip', 'Mock Exams', 3, v_max + 8);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-3-mock-pool-mock4-day2-acp') THEN
    INSERT INTO topics (title, slug, section, usmle_step, "order") VALUES ('USMLE Step 3 Mock #4 — Day 2 ACP', 'usmle-3-mock-pool-mock4-day2-acp', 'Mock Exams', 3, v_max + 9);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-3-mock-pool-mock5-day1-fip') THEN
    INSERT INTO topics (title, slug, section, usmle_step, "order") VALUES ('USMLE Step 3 Mock #5 — Day 1 FIP', 'usmle-3-mock-pool-mock5-day1-fip', 'Mock Exams', 3, v_max + 10);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = 'usmle-3-mock-pool-mock5-day2-acp') THEN
    INSERT INTO topics (title, slug, section, usmle_step, "order") VALUES ('USMLE Step 3 Mock #5 — Day 2 ACP', 'usmle-3-mock-pool-mock5-day2-acp', 'Mock Exams', 3, v_max + 11);
  END IF;
END $$;
COMMIT;