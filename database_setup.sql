-- ==========================================
-- MedHelp Supabase Database Initialization
-- ==========================================

-- 1. CARC Codes (Claim Adjustment Reason Codes)
CREATE TABLE public.carc_codes (
    code VARCHAR(10) PRIMARY KEY,
    description TEXT NOT NULL,
    effective_date DATE
);

-- 2. RARC Codes (Remittance Advice Remark Codes)
CREATE TABLE public.rarc_codes (
    code VARCHAR(10) PRIMARY KEY,
    description TEXT NOT NULL,
    effective_date DATE
);

-- 3. Medical Codes (Combines ICD-10, CPT, HCPCS)
CREATE TABLE public.medical_codes (
    code VARCHAR(20) NOT NULL,
    code_type VARCHAR(10) NOT NULL, -- 'ICD10', 'CPT', 'HCPCS'
    short_description TEXT,
    long_description TEXT,
    PRIMARY KEY (code, code_type)
);

-- 4. NCCI Edits (National Correct Coding Initiative)
CREATE TABLE public.ncci_edits (
    primary_code VARCHAR(10) NOT NULL,
    secondary_code VARCHAR(10) NOT NULL,
    modifier_allowed VARCHAR(1) NOT NULL, -- '0'=No, '1'=Yes, '9'=N/A
    effective_date DATE,
    deletion_date DATE,
    PRIMARY KEY (primary_code, secondary_code)
);

-- ==========================================
-- Security & Row Level Security (RLS)
-- ==========================================

-- Enable Row Level Security on all tables
ALTER TABLE public.carc_codes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.rarc_codes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.medical_codes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ncci_edits ENABLE ROW LEVEL SECURITY;

-- Create Policies to ALLOW ANONYMOUS READ ONLY access
-- Because this is a Chrome Extension, users need to search codes without logging in, 
-- but they should NEVER be able to insert/delete codes.

CREATE POLICY "Allow public read-only access on carc_codes" 
ON public.carc_codes FOR SELECT USING (true);

CREATE POLICY "Allow public read-only access on rarc_codes" 
ON public.rarc_codes FOR SELECT USING (true);

CREATE POLICY "Allow public read-only access on medical_codes" 
ON public.medical_codes FOR SELECT USING (true);

CREATE POLICY "Allow public read-only access on ncci_edits" 
ON public.ncci_edits FOR SELECT USING (true);

-- ==========================================
-- Enable Search Optimization (Indexes)
-- ==========================================
CREATE INDEX idx_medical_codes_type ON public.medical_codes(code_type);
CREATE INDEX idx_carc_description ON public.carc_codes USING GIN (to_tsvector('english', description));
CREATE INDEX idx_medical_description ON public.medical_codes USING GIN (to_tsvector('english', short_description));
