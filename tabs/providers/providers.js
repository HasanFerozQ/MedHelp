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
  // Helper to convert names to Title Case
  const toTitleCase = (str) => {
    if (!str) return '';
    return str.toLowerCase().split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
  };

  container.innerHTML = results.map(p => {
    const isOrg = p.enumeration_type === 'NPI-2';
    const typeLabel = isOrg ? 'Organization' : 'Individual';
    const typeClass = isOrg ? 'badge-org' : 'badge-indiv';

    const name = isOrg
      ? (p.basic.organization_name || 'Organization')
      : `${p.basic.first_name || ''} ${p.basic.middle_name ? p.basic.middle_name + ' ' : ''}${p.basic.last_name || ''}`.trim();
    
    // Exact mapping for NPPES authorized official prefix and fields
    const officialPrefix = p.basic.authorized_official_name_prefix || '';
    const officialFirst = p.basic.authorized_official_first_name || '';
    const officialLast = p.basic.authorized_official_last_name || '';
    const officialTitle = p.basic.authorized_official_title_or_position || '';

    const officialName = isOrg && officialLast 
      ? toTitleCase(`${officialPrefix} ${officialFirst} ${officialLast}`.trim().replace(/\s+/g, ' '))
      : null;
    const officialDisplayTitle = isOrg && officialTitle ? toTitleCase(officialTitle) : null;

    const credential = p.basic.credential || '';
    const taxonomy = p.taxonomies?.[0]?.desc || 'Medical Professional';
    const addr = p.addresses?.[0];
    const addressLine = addr ? `${addr.address_1 || ''}, ${addr.city || ''}, ${addr.state || ''} ${(addr.postal_code || '').substring(0, 5)}` : 'Address details unavailable';
    const mapsUrl = addr ? `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(addressLine)}` : '#';
    const status = p.basic.status === 'A' ? '✓ Active' : '⚠ Inactive';
    const statusColor = p.basic.status === 'A' ? 'var(--success)' : 'var(--warning)';

    // Copy string exact format matching user request
    const copyText = `${name} | NPI: ${p.number} | ${taxonomy} | ${addressLine}${officialName ? ' | Official : ' + officialName : ''}`;
    const escapedCopyText = window.escapeHtml(copyText);

    return `
      <div class="result-card npi-card" style="border-left: 5px solid var(--accent); padding: 28px; background: var(--bg-card); border-radius: 16px; margin-bottom: 24px; box-shadow: 0 8px 32px rgba(0,0,0,0.25);">
        
        <!-- Header: Type, Status, NPI number -->
        <div class="npi-top-bar" style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--border); padding-bottom: 14px; margin-bottom: 16px; flex-wrap: wrap; gap: 12px;">
          <div style="display: flex; align-items: center; gap: 8px;">
            <div class="npi-type-badge ${typeClass}" style="margin-bottom: 0;">${typeLabel}</div>
            <span class="npi-status" style="color:${statusColor}; font-size: 13px; font-weight: 700;">${status}</span>
          </div>
          <div style="display: flex; align-items: center; gap: 10px;">
            <span style="font-family: monospace; font-size: 14px; font-weight: 800; color: var(--accent); background: rgba(var(--accent-rgb), 0.12); padding: 5px 12px; border-radius: 8px; border: 1.5px solid rgba(var(--accent-rgb), 0.35);">
              NPI: ${p.number}
            </span>
            <button class="npi-copy-btn" 
                    data-details="${escapedCopyText}" 
                    title="Copy details"
                    style="background: rgba(255,255,255,0.05); border: 1px solid var(--border); border-radius: 8px; width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; cursor: pointer; color: var(--text-muted); transition: var(--transition);">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg>
            </button>
          </div>
        </div>

        <!-- Facility Name / Provider Name -->
        <div style="margin-bottom: 16px;">
          <div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--text-muted); letter-spacing: 0.08em; margin-bottom: 4px;">
            ${isOrg ? 'Facility / Organization' : 'Practitioner Name'}
          </div>
          <h3 class="npi-name-heading" style="font-size: 22px; font-weight: 900; color: var(--text-h); margin: 0; line-height: 1.3;">
            ${window.escapeHtml(name)}
            ${credential ? `<span class="npi-credential" style="font-size: 12px; margin-left: 8px; vertical-align: middle;">${window.escapeHtml(credential)}</span>` : ''}
          </h3>
        </div>

        <!-- Official Full Name Section -->
        ${officialName ? `
        <div style="
          background: rgba(var(--amber-rgb), 0.05);
          border: 1px solid rgba(var(--amber-rgb), 0.22);
          border-radius: 12px;
          padding: 14px 18px;
          margin-bottom: 16px;
          box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.05);
        ">
          <div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--expert-amber); letter-spacing: 0.08em; margin-bottom: 4px;">
            Authorized Official
          </div>
          <div style="font-size: 15px; font-weight: 800; color: var(--text-h);">
            ${window.escapeHtml(officialName)}
          </div>
          ${officialDisplayTitle ? `
          <div style="font-size: 12.5px; color: var(--text-muted); margin-top: 2px; font-weight: 500;">
            ${window.escapeHtml(officialDisplayTitle)}
          </div>` : ''}
        </div>` : ''}

        <!-- Specialty / Taxonomy -->
        <div style="
          background: rgba(var(--accent-rgb), 0.05);
          border: 1px solid rgba(var(--accent-rgb), 0.2);
          border-radius: 12px;
          padding: 14px 18px;
          margin-bottom: 16px;
        ">
          <div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--accent); letter-spacing: 0.08em; margin-bottom: 4px;">
            Medical Specialty
          </div>
          <div style="font-size: 14.5px; font-weight: 700; color: var(--text-h);">
            ${window.escapeHtml(taxonomy)}
          </div>
        </div>

        <!-- Address & Action -->
        <div style="display: flex; justify-content: space-between; align-items: flex-end; flex-wrap: wrap; gap: 16px; margin-top: 8px;">
          <div>
            <div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--text-muted); letter-spacing: 0.08em; margin-bottom: 4px;">
              Practice Location
            </div>
            <div style="display: flex; gap: 8px; align-items: flex-start; color: var(--text-body); font-size: 14px; line-height: 1.5;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="margin-top: 2px; flex-shrink: 0;"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
              <span>${window.escapeHtml(addressLine)}</span>
            </div>
          </div>
          ${mapsUrl !== '#' ? `
            <a href="${mapsUrl}" target="_blank" rel="noopener" class="btn-location" style="display: inline-flex; align-items: center; gap: 6px; padding: 10px 18px; border-radius: 8px; font-weight: 700; font-size: 13.5px; text-decoration: none; border: 1px solid var(--border); transition: all 0.2s;">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
              View Location
            </a>` : ''}
        </div>

      </div>
    `;
  }).join('');

  // Add event listener for copy buttons
  container.querySelectorAll('.npi-copy-btn').forEach(btn => {
    btn.onclick = (e) => {
      e.preventDefault();
      const details = btn.dataset.details;
      navigator.clipboard.writeText(details).then(() => {
        const originalHtml = btn.innerHTML;
        btn.innerHTML = `<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--success)" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>`;
        btn.style.borderColor = 'var(--success)';
        setTimeout(() => {
          btn.innerHTML = originalHtml;
          btn.style.borderColor = 'var(--border)';
        }, 2000);
      });
    };
  });
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
