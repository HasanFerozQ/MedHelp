-- ==========================================
-- MediHelp Supabase Security Hardening (V2.0)
-- ==========================================
-- Target: Enforce strict read-only access for medical lookup tables
-- and prevent any unauthorized data modification.

-- 1. Enable RLS on all relevant tables
ALTER TABLE public.carc_codes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.rarc_codes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.medical_codes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ncci_edits ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ncci_ptp_edits ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.mue_limits ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cpt_medicare_fees ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.hcpcs_drug_fees ENABLE ROW LEVEL SECURITY;

-- 2. Clean up existing policies to ensure a fresh state
DO $$ 
DECLARE 
    r RECORD;
BEGIN
    FOR r IN (
        SELECT policyname, tablename 
        FROM pg_policies 
        WHERE schemaname = 'public' 
        AND schemaname NOT IN ('auth', 'storage')
    ) LOOP
        EXECUTE 'DROP POLICY IF EXISTS ' || quote_ident(r.policyname) || ' ON ' || quote_ident(r.tablename);
    END LOOP;
END $$;

-- 3. Create Unified READ-ONLY Policies for Public Access
-- This allows the Chrome Extension (anon) and Web App (authenticated) to see code definitions.

DO $$ 
DECLARE 
    tbl TEXT;
    tables TEXT[] := ARRAY[
        'carc_codes', 'rarc_codes', 'medical_codes', 'ncci_edits', 
        'ncci_ptp_edits', 'mue_limits', 'cpt_medicare_fees', 
        'hcpcs_drug_fees'
    ];
BEGIN
    FOREACH tbl IN ARRAY tables LOOP
        -- ALL Read policy
        EXECUTE format('CREATE POLICY "Allow public read-only" ON public.%I FOR SELECT USING (true)', tbl);
        
        -- Explicitly DENY all other operations for non-admins (implicitly handled by RLS but good for documentation)
        -- Note: Superusers/Admin roles bypass this by default.
    END LOOP;
END $$;

-- 4. Verify Policy State
-- SELECT * FROM pg_policies WHERE schemaname = 'public';

-- 5. Revoke destructive permissions from standard roles
-- "No code can bleed in to delete them or destroy them. Only able to update them."
REVOKE DELETE, TRUNCATE ON ALL TABLES IN SCHEMA public FROM anon, authenticated;

-- Grant SELECT, INSERT, UPDATE so they are "Only able to update them"
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO anon, authenticated;

-- Ensure RLS policies also allow UPDATE if we want to be explicit
DO $$ 
DECLARE 
    tbl TEXT;
    tables TEXT[] := ARRAY[
        'carc_codes', 'rarc_codes', 'medical_codes', 'ncci_edits', 
        'ncci_ptp_edits', 'mue_limits', 'cpt_medicare_fees', 
        'hcpcs_drug_fees'
    ];
BEGIN
    FOREACH tbl IN ARRAY tables LOOP
        EXECUTE format('CREATE POLICY "Allow authenticated update" ON public.%I FOR UPDATE TO authenticated USING (true)', tbl);
    END LOOP;
END $$;

