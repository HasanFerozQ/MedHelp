/**
 * MediHelp Universal Logic: Tabbed UI & Active Search
 */

const SUPABASE_URL = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

let db = null;
if (window.supabase) {
  db = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
}

// --- Tab Switching ---
function switchTab(tabId) {
  document.querySelectorAll('.tab-content').forEach(t => t.classList.remove('active'));
  document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
  
  document.getElementById(tabId).classList.add('active');
  event.currentTarget.classList.add('active');
}

// --- Scoped Search Logic (Active Tab only) ---
document.addEventListener('DOMContentLoaded', () => {
    // 1. Code Search (ICD-10)
    const codesInput = document.getElementById('codes-input');
    if (codesInput) {
        codesInput.addEventListener('input', debounce(async (e) => {
            const q = e.target.value.trim().toUpperCase();
            const resultsDiv = document.getElementById('codes-results');
            if (q.length < 2) { resultsDiv.innerHTML = ''; return; }
            
            resultsDiv.innerHTML = '<p style="color:var(--text-secondary)">Scanning 74,000+ codes...</p>';
            const { data } = await db.from('medical_codes').select('*').or(`code.ilike.%${q}%,short_description.ilike.%${q}%`).limit(10);
            renderResults(resultsDiv, data || [], 'ICD-10');
        }, 400));
    }

    // 2. Denials Search (CARC/RARC)
    const denialsInput = document.getElementById('denials-input');
    if (denialsInput) {
        denialsInput.addEventListener('input', debounce(async (e) => {
            const q = e.target.value.trim().toUpperCase();
            const resultsDiv = document.getElementById('denials-results');
            if (q.length < 2) { resultsDiv.innerHTML = ''; return; }
            
            resultsDiv.innerHTML = '<p style="color:var(--text-secondary)">Decoding denials...</p>';
            const [carc, rarc] = await Promise.all([
                db.from('carc_codes').select('*').or(`code.ilike.%${q}%,description.ilike.%${q}%`).limit(5),
                db.from('rarc_codes').select('*').or(`code.ilike.%${q}%,description.ilike.%${q}%`).limit(5)
            ]);
            const merged = [...(carc.data || []).map(d => ({...d, type: 'CARC'})), ...(rarc.data || []).map(d => ({...d, type: 'RARC'}))];
            renderResults(resultsDiv, merged, 'DENIAL');
        }, 400));
    }

    // 3. NPI Search (Providers)
    const npiInput = document.getElementById('npi-input');
    if (npiInput) {
        npiInput.addEventListener('input', debounce(async (e) => {
            const q = e.target.value.trim();
            const resultsDiv = document.getElementById('npi-results');
            if (q.length < 3) { resultsDiv.innerHTML = ''; return; }
            
            resultsDiv.innerHTML = '<p style="color:var(--text-secondary)">Querying NPPES Registry...</p>';
            // Example NPI API fetch
            const res = await fetch(`https://npiregistry.cms.hhs.gov/api/?version=2.1&number=${isNaN(q) ? '' : q}&first_name=${isNaN(q) ? q : ''}&limit=5`);
            const data = await res.json();
            renderNPI(resultsDiv, data.results || []);
        }, 600));
    }
});

// --- UI Rendering ---
function renderResults(container, data, tag) {
    if (data.length === 0) { container.innerHTML = '<p>No matches found.</p>'; return; }
    container.innerHTML = data.map(item => `
        <div class="feature-card" style="margin-bottom: 12px; padding: 20px;">
            <div style="display:flex; justify-content:space-between; margin-bottom:8px;">
                <span style="font-weight:700; color:var(--accent); font-family:monospace;">${item.code}</span>
                <span class="blog-category" style="font-size:10px;">${tag} ${item.type || ''}</span>
            </div>
            <p style="font-size: 14px; color: var(--text-primary); margin:0;">${item.short_description || item.description}</p>
        </div>
    `).join('');
}

function renderNPI(container, results) {
    if (!results || results.length === 0) { container.innerHTML = '<p>No providers found.</p>'; return; }
    container.innerHTML = results.map(p => `
        <div class="feature-card" style="margin-bottom: 12px; padding: 24px;">
            <div style="display:flex; justify-content:space-between; align-items:start; margin-bottom:12px;">
                <div>
                    <h3 style="color:#fff; margin-bottom:4px;">${p.basic.first_name || ''} ${p.basic.last_name || p.basic.organization_name}</h3>
                    <span style="color:var(--accent); font-family:monospace; font-size:14px;">NPI: ${p.number}</span>
                </div>
                <span class="blog-category">${p.taxonomies[0].desc.substring(0, 20)}...</span>
            </div>
            <p style="font-size:13px; color:var(--text-secondary); margin:0;">
                ${p.addresses[0].address_1}, ${p.addresses[0].city}, ${p.addresses[0].state}
            </p>
        </div>
    `).join('');
}

function debounce(func, wait) {
    let timeout;
    return function() {
        const context = this, args = arguments;
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(context, args), wait);
    };
}
