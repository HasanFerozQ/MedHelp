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

  const query = nameInput.value.trim().replace(/\s+/g, ' '); // Normalize spaces
  const state = stateInput ? stateInput.value.trim().toUpperCase() : '';

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
    const data = await executeNPISearch(query, state);

    if (!data.results || data.results.length === 0) {
      // Intelligent Fallback Logic (v4.0)
      // If a multi-word search failed as "First/Last", retry as "Organization"
      const parts = query.split(' ');
      if (parts.length >= 2 && !isOrgHint(query)) {
        resultsEl.innerHTML = `<p class="status-msg" style="font-size:12px; color:var(--accent);">No individual matches. Retrying as Organization...</p>`;
        const fallbackData = await executeNPISearch(query, state, true); // forceOrg = true
        if (fallbackData.results && fallbackData.results.length > 0) {
          renderNPIResults(fallbackData.results, resultsEl);
          return;
        }
      }

      resultsEl.innerHTML = `
        <div class="status-msg">
          No providers found for "<strong>${window.escapeHtml(query)}</strong>"${state ? ' in ' + state : ''}. 
          <br><small>Try check spelling, or search by a 10-digit NPI number.</small>
        </div>`;
    } else {
      renderNPIResults(data.results, resultsEl);
    }
  } catch (err) {
    console.error('NPI Proxy Error:', err);
    resultsEl.innerHTML = `
      <div class="audit-finding" style="border-left: 3px solid var(--danger); background: rgba(239, 68, 68, 0.05);">
        <div class="finding-icon danger">●</div>
        <div>
          <strong style="color:var(--text-h);">NPS Registry Offline</strong>
          <p style="margin:4px 0 0; font-size:13px; color:var(--text-muted);">The CMS registry search failed. This usually happens due to rate limiting or maintenance.</p>
        </div>
      </div>`;
  } finally {
    if (btn) btn.disabled = false;
  }
}

/**
 * executeNPISearch - Core fetcher for NPPES API via Proxy
 */
async function executeNPISearch(query, state, forceOrg = false) {
  let url = '/api/npi?';

  const isNPINumber = /^\d{10}$/.test(query.trim());

  if (isNPINumber) {
    // Exact NPI lookup — no wildcards, no name parsing, no state filter
    url += `number=${query.trim()}`;
    // Note: intentionally skip state for exact NPI lookups (NPI is globally unique)
  } else {
    const queryUpper = query.toUpperCase();
    const isOrg = forceOrg || isOrgHint(queryUpper);
    const parts = query.trim().split(/\s+/);

    if (isOrg || parts.length === 1) {
      url += `organization_name=${encodeURIComponent(query)}*`;
    } else {
      url += `first_name=${encodeURIComponent(parts[0])}*&last_name=${encodeURIComponent(parts.slice(1).join(' '))}*`;
    }

    if (state) url += `&state=${encodeURIComponent(state)}`;
  }

  const res = await fetch(url);
  if (!res.ok) throw new Error(`API error ${res.status}`);
  return res.json();
}

/**
 * isOrgHint - Detect if query looks like a business entity
 */
function isOrgHint(q) {
  const keywords = [
    'CLINIC', 'HOSPITAL', 'LLC', 'CENTER', 'MEDICAL', 'GROUP', 'CARE', 'UNIVERSITY', 'HEALTH', 'INC', 'SPECIALISTS',
    'FOUNDATION', 'SERVICES', 'PRACTICE', 'MANAGEMENT', 'SURGERY', 'ASSOCIATES', 'INSTITUTE', 'REHAB', 'NURSING', 'HOME', 'PLLC'
  ];
  const upper = q.toUpperCase();
  return keywords.some(kw => upper.includes(kw));
}

function renderNPIResults(results, container) {
  container.innerHTML = results.map(p => {
    const isOrg = p.enumeration_type === 'NPI-2';
    const typeLabel = isOrg ? 'Organization' : 'Individual';
    const typeClass = isOrg ? 'badge-org' : 'badge-indiv';

    const name = isOrg
      ? (p.basic.organization_name || 'Organization')
      : `${p.basic.first_name || ''} ${p.basic.middle_name ? p.basic.middle_name + ' ' : ''}${p.basic.last_name || ''}`.trim();
    
    const official = isOrg && p.basic.authorized_official_last_name 
      ? `${p.basic.authorized_official_prefix || ''} ${p.basic.authorized_official_first_name || ''} ${p.basic.authorized_official_last_name || ''} ${p.basic.authorized_official_credential || ''}`.trim()
      : null;

    const credential = p.basic.credential || '';
    const taxonomy = p.taxonomies?.[0]?.desc || 'Medical Professional';
    const addr = p.addresses?.[0];
    const addressLine = addr ? `${addr.address_1 || ''}, ${addr.city || ''}, ${addr.state || ''} ${(addr.postal_code || '').substring(0, 5)}` : 'Address details unavailable';
    const mapsUrl = addr ? `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(addressLine)}` : '#';
    const status = p.basic.status === 'A' ? '✓ Active' : '⚠ Inactive';
    const statusColor = p.basic.status === 'A' ? 'var(--success)' : 'var(--warning)';

    return `
      <div class="result-card npi-card">
        <div class="npi-header">
          <div class="npi-identity">
            <div class="npi-type-badge ${typeClass}">${typeLabel}</div>
            <div class="npi-name">
              ${window.escapeHtml(name)}
              ${credential ? `<span class="npi-credential">${window.escapeHtml(credential)}</span>` : ''}
            </div>
            ${official ? `<div class="npi-official">Official: ${window.escapeHtml(official)}</div>` : ''}
            <div class="npi-taxonomy">${window.escapeHtml(taxonomy)}</div>
          </div>
          <div class="npi-status-container">
            <span class="npi-status" style="color:${statusColor};">${status}</span>
            <code class="npi-number">NPI: ${p.number}</code>
          </div>
        </div>
        
        <div class="npi-address">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
          <span>${window.escapeHtml(addressLine)}</span>
        </div>
        
        ${mapsUrl !== '#' ? `
          <div class="npi-actions">
            <a href="${mapsUrl}" target="_blank" rel="noopener" class="btn-location">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
              View Location
            </a>
          </div>` : ''}
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
