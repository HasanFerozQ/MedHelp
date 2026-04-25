-- Migration: Seed Blog Analytics with Starting Data
-- Date: 2026-04-25
-- Purpose: Pre-populate analytics table with professional-looking starting counts

BEGIN;

-- Insert starting counts for all manifest blogs
-- We use a random number between 450 and 1800 for each
INSERT INTO blog_analytics (slug, view_count)
VALUES 
    ('7-natural-remedies-diabetes-2026', floor(random() * 1350 + 450)),
    ('diabetes-drug-mimics-exercise-2026', floor(random() * 1350 + 450)),
    ('optimal-blood-pressure-target-2026', floor(random() * 1350 + 450)),
    ('top-common-claim-denial-codes-appeal-guide', floor(random() * 1350 + 450)),
    ('how-to-reduce-medical-bill-legally', floor(random() * 1350 + 450)),
    ('why-insurance-claim-denied', floor(random() * 1350 + 450)),
    ('how-to-check-medical-bill-errors', floor(random() * 1350 + 450)),
    ('human-negotiation-medical-bills-medihelp', floor(random() * 1350 + 450)),
    ('glp1-obesity-cardiometabolic-2026', floor(random() * 1350 + 450)),
    ('clinical-audit-engine-exposed', floor(random() * 1350 + 450)),
    ('malaria-vaccine-breakthrough', floor(random() * 1350 + 450)),
    ('ai-medical-diagnostics', floor(random() * 1350 + 450)),
    ('surprise-billing-advocacy', floor(random() * 1350 + 450)),
    ('russia-cancer-vaccine', floor(random() * 1350 + 450)),
    ('medical-marijuana-schedule-iii-changes-2026', floor(random() * 1350 + 450)),
    ('hospital-overbilling-7-common-charges-2026', floor(random() * 1350 + 450))
ON CONFLICT (slug) DO UPDATE SET
    view_count = GREATEST(blog_analytics.view_count, EXCLUDED.view_count);

DO $$ 
BEGIN 
    RAISE NOTICE 'SUCCESS: Blog Analytics seeded with starting data.'; 
END $$;

COMMIT;
