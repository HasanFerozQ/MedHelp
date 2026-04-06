-- Phase 2: Specialty Drug Pricing (ASP)
CREATE TABLE IF NOT EXISTS hcpcs_drug_fees (
    hcpcs_code TEXT PRIMARY KEY,
    short_description TEXT,
    payment_limit NUMERIC,
    unit_note TEXT,
    is_self_administered BOOLEAN DEFAULT FALSE,
    last_updated DATE DEFAULT CURRENT_DATE
);

CREATE INDEX IF NOT EXISTS idx_hcpcs_drug_code ON hcpcs_drug_fees(hcpcs_code);

-- Optional: NDC to HCPCS Crosswalk for advanced audits
CREATE TABLE IF NOT EXISTS ndc_hcpcs_crosswalk (
    ndc_code TEXT PRIMARY KEY,
    hcpcs_code TEXT REFERENCES hcpcs_drug_fees(hcpcs_code),
    drug_name TEXT
);

-- Security: Enable Public Read Access for the Frontend
ALTER TABLE hcpcs_drug_fees ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public Read Access" ON hcpcs_drug_fees FOR SELECT USING (true);

ALTER TABLE ndc_hcpcs_crosswalk ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public Read Access Crosswalk" ON ndc_hcpcs_crosswalk FOR SELECT USING (true);
