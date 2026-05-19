const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

async function run() {
  console.log('1. Updating existing topic geri-aging-changes title...');
  const { data: updateData, error: updateError } = await supabase
    .from('topics')
    .update({ title: 'Physiological aging — organ system changes' })
    .eq('slug', 'geri-aging-changes')
    .eq('year_id', 4);

  if (updateError) {
    console.error('Error updating existing topic:', updateError);
    return;
  }
  console.log('Successfully updated existing topic!');

  console.log('2. Checking if new topic geri-pharmacokinetic-shifts already exists...');
  const { data: existingTopic, error: fetchError } = await supabase
    .from('topics')
    .select('id')
    .eq('slug', 'geri-pharmacokinetic-shifts')
    .eq('year_id', 4)
    .maybeSingle();

  if (fetchError) {
    console.error('Error checking new topic:', fetchError);
    return;
  }

  if (existingTopic) {
    console.log('Topic geri-pharmacokinetic-shifts already exists in the database. No further action needed.');
    return;
  }

  console.log('3. Fetching all Geriatrics topics to shift in memory...');
  const { data: allGeriatricsTopics, error: fetchGeriError } = await supabase
    .from('topics')
    .select('id, title, slug, order')
    .eq('section', 'Geriatrics')
    .eq('year_id', 4);

  if (fetchGeriError) {
    console.error('Error fetching Geriatrics topics:', fetchGeriError);
    return;
  }

  const topicsToShift = allGeriatricsTopics.filter(t => t.order >= 798);
  console.log(`Found ${topicsToShift.length} topics to shift. Shifting...`);

  // To prevent conflicts, let's sort in descending order of their current "order" so we update the highest ones first
  topicsToShift.sort((a, b) => b.order - a.order);

  for (const topic of topicsToShift) {
    console.log(`Shifting ${topic.slug} from order ${topic.order} to ${topic.order + 1}...`);
    const { error: shiftError } = await supabase
      .from('topics')
      .update({ order: topic.order + 1 })
      .eq('id', topic.id);
    
    if (shiftError) {
      console.error(`Error shifting topic ${topic.slug}:`, shiftError);
      return;
    }
  }
  console.log('Successfully shifted all subsequent topics!');

  console.log('4. Inserting the new second topic...');
  const { data: insertData, error: insertError } = await supabase
    .from('topics')
    .insert([
      {
        title: 'Pharmacokinetic/pharmacodynamic shifts',
        slug: 'geri-pharmacokinetic-shifts',
        section: 'Geriatrics',
        year_id: 4,
        order: 798
      }
    ]);

  if (insertError) {
    console.error('Error inserting new topic:', insertError);
    return;
  }
  console.log('Successfully inserted Pharmacokinetic/pharmacodynamic shifts topic!');
}

run();
