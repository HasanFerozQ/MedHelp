const SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

let dbClient = null;

document.addEventListener('DOMContentLoaded', () => {
  if (window.supabase) {
    dbClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
  }
  setupAccordion();
  setupLiveSearch();
});

// ─── Accordion ──────────────────────────────────────────────────────────────
function setupAccordion() {
  const accordions = document.querySelectorAll('.accordion');
  accordions.forEach(acc => {
    acc.querySelector('.accordion-header').addEventListener('click', () => {
      acc.classList.toggle('active');
      accordions.forEach(other => {
        if (other !== acc) other.classList.remove('active');
      });
    });
  });
}

// ─── Live Search Setup ───────────────────────────────────────────────────────
function setupLiveSearch() {
  const input = document.getElementById('web-search-input');
  let timeout = null;
  input.addEventListener('input', (e) => {
    clearTimeout(timeout);
    timeout = setTimeout(() => performWebSearch(e.target.value.trim()), 400);
  });
}

// ─── Core Search: queries CARC, RARC, and ICD-10 in parallel ────────────────
async function performWebSearch(query) {
  const resultsDiv = document.getElementById('search-results');

  if (query.length < 2) {
    resultsDiv.innerHTML = '';
    return;
  }

  if (!dbClient) {
    resultsDiv.innerHTML = '<p style="color:red">Database client failed to initialize.</p>';
    return;
  }

  resultsDiv.innerHTML = '<p style="color:var(--text-muted); text-align:center; padding:20px 0;">Searching database...</p>';

  try {
    const q = query.toUpperCase();

    // Run all three table queries in parallel for maximum speed
    const [carcRes, rarcRes, icdRes] = await Promise.all([
      dbClient.from('carc_codes').select('*').or(`code.ilike.%${q}%,description.ilike.%${query}%`).limit(3),
      dbClient.from('rarc_codes').select('*').or(`code.ilike.%${q}%,description.ilike.%${query}%`).limit(3),
      dbClient.from('medical_codes').select('*').or(`code.ilike.%${q}%,short_description.ilike.%${query}%`).eq('code_type', 'ICD10').limit(5)
    ]);

    if (carcRes.error) throw carcRes.error;
    if (rarcRes.error) throw rarcRes.error;
    // ICD10 errors are non-fatal — just show what we have
    const icdData = icdRes.error ? [] : (icdRes.data || []);

    const allResults = [
      ...(carcRes.data || []).map(d => ({ ...d, display_type: 'CARC', color: '#0d9488' })),
      ...(rarcRes.data || []).map(d => ({ ...d, display_type: 'RARC', color: '#06b6d4' })),
      ...icdData.map(d => ({ ...d, description: d.short_description, display_type: 'ICD-10', color: '#6366f1' }))
    ];

    if (allResults.length === 0) {
      resultsDiv.innerHTML = `<p style="text-align:center; color:var(--text-muted); padding:20px 0">No results found for "<strong>${query}</strong>".</p>`;
      return;
    }

    let html = '';
    allResults.forEach(item => {
      html += `
        <div class="code-result-card">
          <span class="code-result-val">
            ${item.code}
            <span style="font-size:10px; padding:2px 8px; background:${item.color}22; color:${item.color}; border-radius:4px; font-family:sans-serif; font-weight:600; margin-left:6px;">${item.display_type}</span>
          </span>
          <span class="code-result-desc">${item.description || ''}</span>
        </div>
      `;
    });
    resultsDiv.innerHTML = html;

  } catch (err) {
    console.error(err);
    resultsDiv.innerHTML = '<p style="color:var(--text-muted); text-align:center">Could not reach database. Please try again.</p>';
  }
}
