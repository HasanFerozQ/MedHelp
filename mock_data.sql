-- Run this in your Supabase SQL Editor to populate test data!

-- 1. Insert Test CARC Codes
INSERT INTO public.carc_codes (code, description, effective_date) VALUES 
('CO-45', 'Charge exceeds fee schedule/maximum allowable or contracted/legislated fee arrangement.', '2023-01-01'),
('PR-1', 'Deductible Amount', '2023-01-01'),
('PR-2', 'Coinsurance Amount', '2023-01-01'),
('PR-3', 'Copayment Amount', '2023-01-01'),
('CO-16', 'Claim/service lacks information or has submission/billing error(s).', '2023-01-01')
ON CONFLICT (code) DO NOTHING;

-- 2. Insert Test RARC Codes
INSERT INTO public.rarc_codes (code, description, effective_date) VALUES 
('N362', 'Number of Days or Units of Service exceeds acceptable maximum.', '2023-01-01'),
('M15', 'Separately billed services/tests have been bundled as they are considered components of the same procedure.', '2023-01-01')
ON CONFLICT (code) DO NOTHING;

-- 3. Insert Test NCCI Edits (For Code Search UI Testing)
INSERT INTO public.ncci_edits (primary_code, secondary_code, modifier_allowed, effective_date) VALUES 
('99213', '36415', '1', '2023-01-01'),
('99214', '36415', '1', '2023-01-01'),
('36415', 'G0471', '0', '2023-01-01')
ON CONFLICT (primary_code, secondary_code) DO NOTHING;
