
const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

async function checkCounts() {
  const { data: topic } = await supabase
    .from('topics')
    .select('id, title, mcq_count, case_count')
    .eq('slug', 'em-cardiac-emergencies')
    .single();

  if (!topic) {
    console.log('Topic not found');
    return;
  }

  console.log('Topic Data:', topic);

  const { count: mcqRealCount } = await supabase
    .from('mcqs')
    .select('*', { count: 'exact', head: true })
    .eq('topic_id', topic.id);

  const { count: caseRealCount } = await supabase
    .from('case_studies')
    .select('*', { count: 'exact', head: true })
    .eq('topic_id', topic.id);

  console.log('Real MCQ Count:', mcqRealCount);
  console.log('Real Case Count:', caseRealCount);
}

checkCounts();
