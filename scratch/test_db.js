const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

async function testConnection() {
  console.log('Testing Supabase connection...');
  try {
    const { data, error } = await supabase
      .from('medical_codes')
      .select('code')
      .limit(1);

    if (error) {
      console.error('Connection failed:', error.message);
      process.exit(1);
    } else {
      console.log('Connection successful! Found data:', data);
      process.exit(0);
    }
  } catch (err) {
    console.error('Unexpected error:', err.message);
    process.exit(1);
  }
}

testConnection();
