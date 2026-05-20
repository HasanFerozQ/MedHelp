-- Migration: Enable RLS on public.topics table
-- Date: 2026-05-20
-- Severity: CRITICAL SECURITY FIX
-- Issue: The topics table has 5 RLS policies defined but RLS was never enabled,
--        meaning all policies are ignored and the table is wide open.
-- Policies that will now take effect:
--   1. "Allow admin all on topics"
--   2. "Allow public read on topics"
--   3. "Premium topics readable by licensed users"
--   4. "Public demo topics are readable by everyone"
--   5. "Topics are viewable by everyone"

ALTER TABLE public.topics ENABLE ROW LEVEL SECURITY;
