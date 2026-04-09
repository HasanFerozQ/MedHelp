-- ==========================================
-- MedHelp Database Update V4 — MUE Table
-- Run this in Supabase SQL Editor BEFORE running seed_mue.py
-- ==========================================

-- Medically Unlikely Edits table
-- Source: CMS NCCI MUE files (quarterly, free download)
-- https://www.cms.gov/Medicare/Coding/NationalCorrectCodInitEd/MUE

CREATE TABLE IF NOT EXISTS public.mue_limits (
    cpt_code        VARCHAR(10) PRIMARY KEY,
    mue_value       INT NOT NULL,           -- Max units allowed per day
    mue_mai         VARCHAR(5),             -- MAI: 1=Claim line, 2=Date of service, 3=Per day
    description     TEXT,
    code_type       VARCHAR(10) DEFAULT 'CPT', -- 'CPT' or 'HCPCS'
    year            INT DEFAULT 2024
);

-- Security
ALTER TABLE public.mue_limits ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read-only access on mue_limits"
ON public.mue_limits FOR SELECT USING (true);

-- Performance index
CREATE INDEX IF NOT EXISTS idx_mue_code ON public.mue_limits(cpt_code);

-- ==========================================
-- Also add MUE lookup to lookup_codes function
-- ==========================================
-- After running this SQL, update the Supabase Edge Function
-- lookup_codes/index.ts to also query mue_limits by code list
-- and return mue: { [code]: limit } in the response.
