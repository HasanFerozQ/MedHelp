-- Run ONCE in Supabase SQL Editor after migration 20260525_trivia_admin_list_rpc.sql
-- Use the EXACT same string as TRIVIA_ADMIN_SECRET (Edge Function secret).

SELECT public.trivia_admin_sync_secret('PASTE_YOUR_SECRET_HERE');
