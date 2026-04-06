-- ==========================================
-- MedHelp Database Update V3 (Bill Audit Validation Tables)
-- Execution: Run this in your Supabase SQL Editor
-- ==========================================

-- 1. Medicare Physician Fee Schedule (MPFS) Base Rates
CREATE TABLE IF NOT EXISTS public.cpt_medicare_fees (
    cpt_code VARCHAR(10) PRIMARY KEY,
    description TEXT,
    base_price NUMERIC(10, 2) NOT NULL,
    rvu_work NUMERIC(10, 2),
    rvu_facility NUMERIC(10, 2),
    year INT DEFAULT 2024,
    status_code VARCHAR(5)
);

-- 2. NCCI PTP (Procedure-to-Procedure) Edits for unbundling checks
-- Note: A simplified ncci_edits exists in v1, but this specifically caters to the precise PTP CMS format
CREATE TABLE IF NOT EXISTS public.ncci_ptp_edits (
    column1_code VARCHAR(10) NOT NULL, -- Comprehensive Code
    column2_code VARCHAR(10) NOT NULL, -- Component Code (Unbundled if billed with Col 1)
    modifier_allowed VARCHAR(1) NOT NULL, -- '0'=Not Allowed, '1'=Allowed, '9'=N/A
    effective_date DATE,
    deletion_date DATE,
    PRIMARY KEY (column1_code, column2_code)
);

-- ==========================================
-- Security & Row Level Security (RLS)
-- ==========================================

-- Secure the audit tables
ALTER TABLE public.cpt_medicare_fees ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ncci_ptp_edits ENABLE ROW LEVEL SECURITY;

-- Anonymous users (the backend API or unauthenticated frontend audit script) 
-- can freely lookup codes, but cannot modify the base datasets.
CREATE POLICY "Allow public read-only access on cpt_medicare_fees" 
ON public.cpt_medicare_fees FOR SELECT USING (true);

CREATE POLICY "Allow public read-only access on ncci_ptp_edits" 
ON public.ncci_ptp_edits FOR SELECT USING (true);

-- ==========================================
-- Performance Indexes
-- ==========================================

-- Index for searching comprehensive code quickly
CREATE INDEX IF NOT EXISTS idx_ncci_col1 ON public.ncci_ptp_edits(column1_code);
-- Index for reverse-lookup of component code isolation
CREATE INDEX IF NOT EXISTS idx_ncci_col2 ON public.ncci_ptp_edits(column2_code);
