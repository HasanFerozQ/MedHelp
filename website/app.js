// Replace with your Supabase URL and ANON Key
const SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4'; // This is the public anonymous key

let dbClient = null;

document.addEventListener('DOMContentLoaded', () => {
  // Initialize Supabase if client available
  if (window.supabase) {
    dbClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
  }

  setupAccordion();
  setupLiveSearch();
});

function setupAccordion() {
  const accordions = document.querySelectorAll('.accordion');
  accordions.forEach(acc => {
    const header = acc.querySelector('.accordion-header');
    header.addEventListener('click', () => {
      // Toggle active class on current accordion
      acc.classList.toggle('active');
      
      // Close others
      accordions.forEach(other => {
        if (other !== acc && other.classList.contains('active')) {
          other.classList.remove('active');
        }
      });
    });
  });
}

function setupLiveSearch() {
  const input = document.getElementById('web-search-input');
  let timeout = null;

  input.addEventListener('input', (e) => {
    const query = e.target.value.trim().toUpperCase();
    clearTimeout(timeout);
    timeout = setTimeout(() => {
      performWebSearch(query);
    }, 400); // 400ms debounce
  });
}

async function performWebSearch(query) {
  const resultsDiv = document.getElementById('search-results');
  
  if (query.length < 2) {
    resultsDiv.innerHTML = '';
    return;
  }

  if (!dbClient) {
    resultsDiv.innerHTML = '<p style="color:red">Database client failed to load.</p>';
    return;
  }

  resultsDiv.innerHTML = '<p style="color:var(--text-muted)">Searching database...</p>';

  try {
    // Search both CARC and RARC in parallel using Supabase
    const [carcRes, rarcRes] = await Promise.all([
      dbClient.from('carc_codes').select('*').ilike('code', `%${query}%`).limit(3),
      dbClient.from('rarc_codes').select('*').ilike('code', `%${query}%`).limit(3)
    ]);

    if (carcRes.error) throw carcRes.error;
    if (rarcRes.error) throw rarcRes.error;

    const allResults = [
      ...carcRes.data.map(d => ({ ...d, type: 'CARC' })),
      ...rarcRes.data.map(d => ({ ...d, type: 'RARC' }))
    ];

    if (allResults.length === 0) {
      resultsDiv.innerHTML = '<p>No codes found for "' + query + '".</p>';
      return;
    }

    let html = '';
    allResults.forEach(item => {
      html += `
        <div class="code-result-card">
          <span class="code-result-val">${item.code} <span style="font-size:10px; padding:2px 6px; background:var(--tint-teal); border-radius:4px; font-family:sans-serif;">${item.type}</span></span>
          <span class="code-result-desc">${item.description}</span>
        </div>
      `;
    });
    resultsDiv.innerHTML = html;

  } catch (err) {
    console.error(err);
    resultsDiv.innerHTML = '<p style="color:var(--text-muted)">Could not reach database.</p>';
  }
}
