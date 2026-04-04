// lib/supabaseClient.js

// Using the UMD build of Supabase injected globally
const SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

// Verify Supabase is loaded from the UMD build
if (!window.supabase) {
  console.error("Supabase JS not found! Make sure 'lib/supabase.min.js' is loaded before this script.");
}

// Initialize Supabase Client
const supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
  auth: {
    persistSession: false // Not needed for a public read-only code lookup tool
  }
});

// Export it for our other scripts to use
window.dbClient = supabase;
