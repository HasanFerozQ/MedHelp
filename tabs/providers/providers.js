/**
 * MediHelp — providers.js
 * Handles: National Provider Search (NPPES API)
 */

async function searchNPI() {
  const nameInput = document.getElementById('npi-name');
  const stateInput = document.getElementById('npi-state');
  const resultsEl  = document.getElementById('npi-results');
  const btn        = document.getElementById('npi-search-btn');
  if (!nameInput || !resultsEl) return;

  const query = nameInput.value.trim();
  const state = stateInput ? stateInput.value.trim() : '';

  if (query.length < 2) {
    resultsEl.innerHTML = '<p class="status-msg">Please enter at least 2 characters.</p>';
    return;
  }

  // Show loading state
  resultsEl.innerHTML = `
    <div style="text-align:center; padding: 40px 0;">
      <div class="spinner" style="margin: 0 auto 16px; width:36px; height:36px; border:3px solid var(--border); border-top-color:var(--accent); border-radius:50%; animation: spin 1s linear infinite;"></div>
      <p style="color:var(--text-muted); font-size:14px;">Searching CMS NPPES Registry...</p>
    </div>`;
  if (btn) btn.disabled = true;

  try {
    // CMS NPPES API via Vercel Proxy (fixes CORS)
    let url = '/api/npi?';

    if (/^\d{10}$/.test(query)) {
      url += `number=${query}`;
    } else {
      const parts = query.trim().split(/\s+/);
      if (parts.length >= 2) {
        url += `first_name=${encodeURIComponent(parts[0])}*&last_name=${encodeURIComponent(parts.slice(1).join(' '))}*`;
      } else {
        url += `organization_name=${encodeURIComponent(query)}*`;
      }
    }

    if (state) url += `&state=${encodeURIComponent(state)}`;

    const res = await fetch(url);
    if (!res.ok) throw new Error(`API error ${res.status}`);
    const data = await res.json();

    if (!data.results || data.results.length === 0) {
      resultsEl.innerHTML = `<p class="status-msg">No providers found for "${query}"${state ? ' in ' + state : ''}. Try: John Smith, Mayo Clinic, etc.</p>`;
    } else {
      renderNPIResults(data.results, resultsEl);
    }
  } catch (err) {
    console.error('NPI Proxy Error:', err);
    resultsEl.innerHTML = `
      <div class="audit-finding" style="border-left: 3px solid var(--danger);">
        <div class="finding-icon danger">●</div>
        <div>
          <strong style="color:var(--text-h);">NPS Search Failed</strong>
          <p style="margin:4px 0 0; font-size:13px; color:var(--text-muted);">The search requested failed. This might be due to a temporary network issue or an API rate limit.</p>
        </div>
      </div>`;
  } finally {
    if (btn) btn.disabled = false;
  }
}

function renderNPIResults(results, container) {
  container.innerHTML = results.map(p => {
    const isOrg = p.enumeration_type === 'NPI-2';
    const name = isOrg
      ? (p.basic.organization_name || 'Organization')
      : `${p.basic.first_name || ''} ${p.basic.middle_name ? p.basic.middle_name + ' ' : ''}${p.basic.last_name || ''}`.trim();
    
    const official = isOrg && p.basic.authorized_official_last_name 
      ? `${p.basic.authorized_official_prefix || ''} ${p.basic.authorized_official_first_name || ''} ${p.basic.authorized_official_last_name || ''} ${p.basic.authorized_official_credential || ''}`.trim()
      : null;

    const credential = p.basic.credential || '';
    const taxonomy = p.taxonomies?.[0]?.desc || 'Provider';
    const addr = p.addresses?.[0];
    const addressLine = addr ? `${addr.address_1 || ''}, ${addr.city || ''}, ${addr.state || ''} ${(addr.postal_code || '').substring(0, 5)}` : 'Address not available';
    const mapsUrl = addr ? `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(addressLine)}` : '#';
    const status = p.basic.status === 'A' ? '✓ Active' : '⚠ Inactive';
    const statusColor = p.basic.status === 'A' ? '#22c55e' : '#f59e0b';

    return `
      <div class="result-card" style="padding: 20px; margin-bottom: 12px; display: flex; flex-direction: column; gap: 10px; border-left: 3px solid var(--accent);">
        <div style="display:flex; justify-content:space-between; align-items:flex-start; gap:12px; flex-wrap:wrap;">
          <div>
            <div style="font-size:15px; font-weight:700; color:var(--text-h); margin-bottom:4px;">
              ${name}${credential ? ` <span style="font-size:11px; color:var(--accent); background:var(--accent-glow); padding:2px 6px; border-radius:4px; font-weight:800; margin-left:4px;">${credential}</span>` : ''}
            </div>
            ${official ? `<div style="font-size:13px; color:var(--accent); font-weight:600; margin-bottom:4px;">Official: ${official}</div>` : ''}
            <div style="font-size:12px; color:var(--text-muted);">${taxonomy}</div>
          </div>
          <div style="display:flex; flex-direction:column; align-items:flex-end; gap:4px;">
            <span style="font-size:11px; font-weight:700; color:${statusColor};">${status}</span>
            <code style="font-size:12px; font-family:monospace; background:rgba(255,255,255,0.06); padding:2px 8px; border-radius:4px;">NPI: ${p.number}</code>
          </div>
        </div>
        <div style="font-size:12px; color:var(--text-muted); display:flex; align-items:start; gap:6px;">
          <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="opacity:0.6; margin-top:1px; flex-shrink:0;"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
          <span>${addressLine}</span>
        </div>
        ${mapsUrl !== '#' ? `<a href="${mapsUrl}" target="_blank" rel="noopener" class="btn-location" style="margin-top:4px;">
          <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
          View Location
        </a>` : ''}
      </div>
    `;
  }).join('');
}

// Global hook for Search Button
window.searchNPI = searchNPI;

// Allow pressing Enter in NPI name field to trigger search
document.addEventListener('DOMContentLoaded', () => {
  const npiInput = document.getElementById('npi-name');
  if (npiInput) {
    npiInput.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') searchNPI();
    });
  }
});
