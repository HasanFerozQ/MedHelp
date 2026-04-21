-- ==========================================
-- License Activation Audit Logging Table
-- ==========================================

CREATE TABLE IF NOT EXISTS public.license_activations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    license_key TEXT NOT NULL,
    email TEXT NOT NULL,
    device_ip TEXT,
    user_agent TEXT,
    gumroad_uses INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Row Level Security (RLS)
-- Only service role (backend) should write to this; admins can read.
ALTER TABLE public.license_activations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow service role to manage activations" 
ON public.license_activations 
FOR ALL 
TO service_role 
USING (true);

RAISE NOTICE 'license_activations table initialized.';
