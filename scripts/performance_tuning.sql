-- ==========================================
-- MediHelp Performance Tuning & Optimization
-- ==========================================
-- Target: Optimize 700k+ medical and bundling records for sub-100ms search.

-- 1. Enable pg_trgm for advanced fuzzy matching (description searches)
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- 2. Core Medical Registry Indices
-- Fast exact match for 99213, I10, etc.
CREATE INDEX IF NOT EXISTS idx_medical_codes_code ON public.medical_codes(code);
-- Fast prefix match for search-as-you-type and country filtering
CREATE INDEX IF NOT EXISTS idx_medical_codes_composite ON public.medical_codes(country, code_type, code);

-- 3. GIN Index for "Perfect" Phrase Search
-- This powers the .ilike.%phrase% queries at scale.
CREATE INDEX IF NOT EXISTS idx_medical_codes_desc_trgm ON public.medical_codes USING GIN (short_description gin_trgm_ops);

-- 4. NCCI Bundling Optimization (Massive Table)
-- Since we search both columns simultaneously, both need high-performance indexing.
CREATE INDEX IF NOT EXISTS idx_ncci_ptp_col1 ON public.ncci_ptp_edits(column1_code);
CREATE INDEX IF NOT EXISTS idx_ncci_ptp_col2 ON public.ncci_ptp_edits(column2_code);

-- 5. Denial Code Registry (CARC/RARC)
CREATE INDEX IF NOT EXISTS idx_carc_code ON public.carc_codes(code);
CREATE INDEX IF NOT EXISTS idx_rarc_code ON public.rarc_codes(code);

-- 6. Pre-calculate statistics for the planner
ANALYZE public.medical_codes;
ANALYZE public.ncci_ptp_edits;
ANALYZE public.carc_codes;
ANALYZE public.rarc_codes;
