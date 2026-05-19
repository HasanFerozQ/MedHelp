const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

async function run() {
  const { data: topics, error } = await supabase
    .from('topics')
    .select('id, title, slug, section, year_id, order')
    .ilike('section', '%Geriatrics%')
    .order('order', { ascending: true });

  if (error) {
    console.error('Error fetching topics:', error);
    return;
  }

  console.log('Geriatrics Topics:');
  console.log(JSON.stringify(topics, null, 2));
}

run();
