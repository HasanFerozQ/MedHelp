let currentFilter = 'ALL';
let currentRegion = 'US'; // Default to US
let searchTimeout = null;
let currentSearchId = 0; // Prevent race conditions
const MAX_WAIT_ATTEMPTS = 20; // 2 seconds max wait for DB init

// Curated plain-English overrides for high-traffic CPT/HCPCS codes
const PLAIN_ENGLISH_OVERRIDES = {
  '99202': 'Outpatient office visit for a new patient, low complexity',
  '99203': 'Outpatient office visit for a new patient, moderate complexity',
  '99204': 'Outpatient office visit for a new patient, moderate-high complexity',
  '99205': 'Outpatient office visit for a new patient, high complexity',
  '99211': 'Outpatient office visit for an established patient, minimal complexity',
  '99212': 'Outpatient office visit for an established patient, low complexity',
  '99213': 'Outpatient office visit for an established patient, low-moderate complexity, ~20 minutes',
  '99214': 'Outpatient office visit for an established patient, moderate complexity, ~30 minutes',
  '99215': 'Outpatient office visit for an established patient, high complexity, ~40 minutes',
  '99221': 'Initial hospital inpatient care, low complexity',
  '99222': 'Initial hospital inpatient care, moderate complexity',
  '99223': 'Initial hospital inpatient care, high complexity',
  '99283': 'Emergency department visit, moderate severity',
  '99284': 'Emergency department visit, high severity',
  '99285': 'Emergency department visit, high severity and risk',
  '99291': 'Critical care, first 30–74 minutes',
  '93000': 'Electrocardiogram (ECG) with interpretation and report',
  '85025': 'Complete blood count (CBC) with automated differential',
  '80053': 'Comprehensive metabolic panel (blood chemistry panel)',
  '36415': 'Routine venipuncture (blood draw)',
  '71046': 'Chest X-ray, two views',
  '45378': 'Diagnostic colonoscopy',
  '96372': 'Therapeutic injection (subcutaneous or intramuscular)',
};

// Initialize
document.addEventListener('DOMContentLoaded', () => {
  setupEventListeners();
  
  // Parse query parameter on load to support direct SEO deep links
  const urlParams = new URLSearchParams(window.location.search);
  const initialQuery = urlParams.get('q') || urlParams.get('code');
  if (initialQuery) {
    const searchInput = document.getElementById('code-search-input');
    if (searchInput) {
      searchInput.value = initialQuery;
      performSearch(initialQuery.trim());
    }
  }
});

function selectRegion(btn, region) {
  document.querySelectorAll('.tool-toggle-btn[data-region]').forEach(b => b.classList.remove('active'));
  if (btn) btn.classList.add('active');
  currentRegion = region;
  clearTimeout(searchTimeout);
  const searchInput = document.getElementById('code-search-input');
  if (searchInput) performSearch(searchInput.value.trim());
}
window.selectRegion = selectRegion;



function setupEventListeners() {
  const searchInput = document.getElementById('code-search-input');
  const filterBtns = document.querySelectorAll('.filter-btn');
  const regionBtns = document.querySelectorAll('.region-pill');

  searchInput.addEventListener('input', (e) => {
    const query = e.target.value.trim();
    clearTimeout(searchTimeout);
    searchTimeout = setTimeout(() => {
      performSearch(query);
    }, 400); // 400ms debounce for network requests
  });

  filterBtns.forEach(btn => {
    btn.addEventListener('click', (e) => {
      filterBtns.forEach(b => b.classList.remove('active'));
      e.currentTarget.classList.add('active');
      
      currentFilter = e.currentTarget.dataset.filter;
      clearTimeout(searchTimeout); 
      performSearch(searchInput.value.trim());
    });
  });

  regionBtns.forEach(btn => {
    btn.addEventListener('click', (e) => {
      regionBtns.forEach(b => b.classList.remove('active'));
      e.currentTarget.classList.add('active');
      
      currentRegion = e.currentTarget.dataset.region;
      clearTimeout(searchTimeout); 
      performSearch(searchInput.value.trim());
    });
  });

  // Event Delegation for Copy Buttons (Optimized)
  const listContainer = document.getElementById('search-results-list');
  listContainer.addEventListener('click', (e) => {
    const btn = e.target.closest('.copy-btn');
    if (!btn) return;
    
    const code = btn.getAttribute('data-code');
    const desc = btn.getAttribute('data-desc');
    
    // Clean description for copy
    const cleaned = cleanMedicalDescription(desc);
    const cleanDesc = (cleaned && cleaned !== '—') ? cleaned : '';
    const textToCopy = cleanDesc ? `${code} : ${cleanDesc}` : code;
    
    navigator.clipboard.writeText(textToCopy)
      .then(() => {
        const originalIcon = btn.innerHTML;
        btn.innerHTML = '<svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#0d9488" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>';
        setTimeout(() => btn.innerHTML = originalIcon, 1500);
      })
      .catch(err => {
        console.warn('Clipboard failed:', err);
        // Fallback or user notification could go here
      });
  });
}

async function performSearch(query) {
  const listContainer = document.getElementById('search-results-list');
  
  if (query.length < 2) {
    listContainer.innerHTML = '<div class="empty-state">Start typing to search instantly...</div>';
    return;
  }

  // UI Feedback during DB initialization
  if (!window.dbClient) {
    listContainer.innerHTML = '<div class="empty-state"><span class="loading-dots">Initializing Secure Connection...</span></div>';
    for (let i = 0; i < MAX_WAIT_ATTEMPTS; i++) { 
        await new Promise(r => setTimeout(r, 100));
        if (window.dbClient) break;
    }
  }

  if (!window.dbClient) {
    listContainer.innerHTML = '<div class="empty-state" style="color:var(--text-danger)">Database connection error. Please refresh.</div>';
    return;
  }

  const searchId = ++currentSearchId; 
  const cleanQ = query.replace(/[\.\-\s\,]/g, '').toUpperCase();
  // Create a dotted variant automatically for 4+ char ICD-10 codes missing the dot (Smart Dot Injection)
  let dottedQ = cleanQ;
  if (/^[A-Z]\d{2}[A-Z0-9]+$/.test(cleanQ) && !cleanQ.includes('.')) {
    dottedQ = cleanQ.substring(0, 3) + '.' + cleanQ.substring(3);
  }

  // [High] Handle leading zeros for numeric CPT codes (e.g. 099213 -> 99213)
  const cleanQFiltered = (cleanQ.startsWith('0') && cleanQ.length >= 5 && /^\d+$/.test(cleanQ)) ? cleanQ.replace(/^0+/, '') : cleanQ;
  
  listContainer.innerHTML = '<div class="empty-state">Querying Global Registry...</div>';

  try {
    // 1. Handle NCCI Edits separately (check both comprehensive and component columns)
    if (currentFilter === 'NCCI') {
      const { data, error } = await window.dbClient
        .from('ncci_ptp_edits')
        .select('*')
        .or(`column1_code.eq."${cleanQ}",column2_code.eq."${cleanQ}"`)
        .limit(50);
        
      if (error) throw error;
      // [High] Add race guard to NCCI branch
      if (searchId !== currentSearchId) return;

      renderNCCIResults(data, cleanQ); // Pass query to highlight the match
      return;
    }

    // [Medium] Robust sanitization for safeQuery (dots and commas allowed to be parsed/ignored safely)
    const safeQuery = query.replace(/[^a-zA-Z0-9\s\.\-\,]/g, '').trim();
    // [High] Support hyphens in code-likelihood detection (e.g. I-10)
    const isCodeLikely = /^[A-Z0-9.\-\,]+$/i.test(query.trim()) && query.trim().length < 10;
    const isPhrase = query.trim().includes(' ');

    let dbQuery = window.dbClient
      .from('medical_codes')
      .select('code, short_description, country, code_type');

    // [High] Reinstate strict country filter to prevent catastrophic PostgREST timeouts
    // This allows PostgreSQL to use partitioning/indexing to return results in 20ms instead of timing out.
    if (currentRegion !== 'ALL') {
      dbQuery = dbQuery.eq('country', currentRegion);
    }
    if (currentFilter !== 'ALL') {
      dbQuery = dbQuery.eq('code_type', currentFilter);
    }

    if (isCodeLikely && !isPhrase) {
      // Code-only search: skip short_description ILIKE to avoid full-table scans and timeouts
      const codeVariants = [...new Set([safeQuery, cleanQ, cleanQFiltered, dottedQ].filter(Boolean))];
      const allOrs = new Set();
      codeVariants.forEach(v => {
        allOrs.add(`code.eq."${v}"`);
        allOrs.add(`code.ilike."${v}%"`);
      });
      dbQuery = dbQuery.or(Array.from(allOrs).join(','));
    } else {
      // Phrase search - deeply deduplicated to prevent AST parser timeouts
      const words = safeQuery.replace(/[\.\-\,]/g, ' ').split(/\s+/).filter(w => w.length >= 2);
      const allOrs = new Set([
        `code.ilike."${safeQuery}%"`,
        `code.ilike."${cleanQ}%"`,
        `code.ilike."${cleanQFiltered}%"`,
        `code.ilike."${dottedQ}%"`
      ]);
      
      if (words.length > 0) {
        words.forEach(w => allOrs.add(`short_description.ilike."%${w}%"`));
        allOrs.add(`short_description.ilike."%${safeQuery}%"`);
      } else {
        allOrs.add(`short_description.ilike."%${safeQuery}%"`);
      }
      dbQuery = dbQuery.or(Array.from(allOrs).join(','));
    }
    
    // [Medium] Always pull enough global records to safely group regions
    const fetchLimit = 300;
    let { data, error, status } = await dbQuery.limit(fetchLimit);

    // Auto-retry once on statement timeout (cold-start / plan-cache warmup)
    if (error && isTimeoutError(error) && searchId === currentSearchId) {
      await new Promise(r => setTimeout(r, 350));
      if (searchId !== currentSearchId) return;
      ({ data, error, status } = await dbQuery.limit(fetchLimit));
    }
    
    // Race Condition Guard: If a newer search has started, discard this result
    if (searchId !== currentSearchId) {
        console.log('Stale search result discarded:', query);
        return;
    }
    
    if (error) {
        console.error('Search error:', error, 'Query:', cleanQ);
        listContainer.innerHTML = `<div class="empty-state" style="color:var(--text-danger)">
            <strong>Database Error [${status}]:</strong> ${escapeHtml(error.message) || 'Unknown error'}<br>
            <span style="font-size:10px; opacity:0.7;">Check console for query details</span>
        </div>`;
        return;
    }

    if (!data || data.length === 0) {
      renderResults([], 0, fetchLimit);
      return;
    }

    // 3. Group by Code & Type
    const grouped = {};
    data.forEach(r => {
      const type = r.code_type || 'HCPCS';
      const key = `${r.code}_${type}`;
      if (!grouped[key]) {
        grouped[key] = {
          code: r.code,
          type: type,
          desc: cleanMedicalDescription(r.short_description),
          plainDesc: getPlainEnglishDescription(r.code, type, r.short_description),
          regions: new Set([r.country || 'US'])
        };
      } else {
        grouped[key].regions.add(r.country || 'US');
      }
    });

    // 4. Convert map to array for sorting
    let finalResults = Object.values(grouped);

    // 5. Sort by relevance (Exact matches first, then starts-with phrases)
    finalResults.sort((a, b) => {
      const aExact = a.code === cleanQ || a.code === cleanQFiltered || a.code === dottedQ;
      const bExact = b.code === cleanQ || b.code === cleanQFiltered || b.code === dottedQ;
      if (aExact && !bExact) return -1;
      if (bExact && !aExact) return 1;
      
      const aStartsCode = a.code.startsWith(cleanQ) || a.code.startsWith(cleanQFiltered);
      const bStartsCode = b.code.startsWith(cleanQ) || b.code.startsWith(cleanQFiltered);
      if (aStartsCode && !bStartsCode) return -1;
      if (bStartsCode && !aStartsCode) return 1;

      // [Medium] Description phrase ranking (Starts with query gets priority)
      const aStartsDesc = a.desc.toUpperCase().startsWith(safeQuery.toUpperCase());
      const bStartsDesc = b.desc.toUpperCase().startsWith(safeQuery.toUpperCase());
      if (aStartsDesc && !bStartsDesc) return -1;
      if (bStartsDesc && !aStartsDesc) return 1;
      
      return a.code.localeCompare(b.code);
    });

    renderResults(finalResults, data.length, fetchLimit);

    // [New] Asynchronous Badge Illuminator
    // We launch a non-blocking background fetch to perfectly light up the global US/UK/ME badges
    if (finalResults.length > 0 && finalResults.length < 50) {
      const extractedCodes = finalResults.map(r => r.code);
      window.dbClient.from('medical_codes')
        .select('code, country')
        .in('code', extractedCodes)
        .then(({data: locData}) => {
          if (!locData) return;
          locData.forEach(row => {
            const safeCode = row.code.replace(/"/g, '\\"');
            const domBadges = document.querySelectorAll(`.reg-badge-async[data-badgecode="${safeCode}"]`);
            domBadges.forEach(badge => {
               if (badge.dataset.val === row.country || badge.dataset.val === 'ALL') {
                 badge.classList.remove('inactive');
                 if (badge.innerText.includes('N/A')) {
                   badge.innerText = badge.dataset.val; // Strip the N/A
                 }
               }
            });
          });
        });
    }

  } catch(err) {
    console.error('Unexpected search failure:', err);
    listContainer.innerHTML = `<div class="empty-state" style="color:var(--text-danger)">Unexpected Error: ${escapeHtml(err.message) || 'Check connection'}</div>`;
  }
}

function renderResults(results, rawCount = 0, rawFetchLimit = 150) {
  const listContainer = document.getElementById('search-results-list');
  
  if (!results || results.length === 0) {
    listContainer.innerHTML = '<div class="empty-state">No matching codes found in database.</div>';
    return;
  }

  const regionList = ['US', 'UK', 'ME'];
  let html = '';

  // [Low] Show result count based on raw DB record threshold
  const count = results.length;
  const isCapped = rawCount >= rawFetchLimit; 
  html += `<div class="results-count">Showing <b>${count}</b> unique codes${isCapped ? ' (Limit reached, narrow query)' : ''}</div>`;
  
  results.forEach(item => {
    let tagClass = `tag-${escapeHtml(item.type)}`;
    let displayType = item.type.replace('ICD10', 'ICD-10');
    
    html += `
      <div class="result-card">
        <div class="result-main-area">
          <div class="result-header">
            <span class="code-val">${escapeHtml(item.code)}</span>
            <span class="code-tag ${tagClass}">${escapeHtml(displayType)}</span>
            <div class="region-badges">
              ${regionList.map(reg => {
                const active = item.regions.has(reg);
                return `<span class="reg-badge reg-badge-async ${reg.toLowerCase()} ${active ? '' : 'inactive'}" data-badgecode="${escapeHtml(item.code)}" data-val="${reg}">${reg}${active ? '' : ': N/A'}</span>`;
              }).join('')}
            </div>
            <button class="copy-btn" data-code="${escapeHtml(item.code)}" data-desc="${escapeHtml(item.desc)}" title="Copy to clipboard">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg>
            </button>
          </div>
          <div class="result-desc">${escapeHtml(item.desc)}</div>
          ${item.plainDesc ? `<div class="result-desc-plain">Plain English: ${escapeHtml(item.plainDesc)}</div>` : ''}
        </div>
      </div>
    `;
  });
  
  listContainer.innerHTML = html;
}

function renderNCCIResults(results, queryCode) {
  const listContainer = document.getElementById('search-results-list');
  if (!results || results.length === 0) {
    listContainer.innerHTML = `<div class="empty-state">No NCCI bundling edits found for "${escapeHtml(queryCode)}".</div>`;
    return;
  }

  let html = `<div class="ncci-summary-header">
                NCCI Bundling Policy: Found records where <strong>${escapeHtml(queryCode)}</strong> is restricted.
              </div>`;
              
  results.forEach(item => {
    const isCol1 = item.column1_code === queryCode.toUpperCase();
    const otherCode = isCol1 ? item.column2_code : item.column1_code;
    const colNum = isCol1 ? "Column 1 (Comprehensive)" : "Column 2 (Component)";
    const relevanceClass = isCol1 ? "ncci-high-relevance" : "ncci-low-relevance";
    
    // Sanitized data for display
    const safeColNum = escapeHtml(colNum);
    const safeCol1 = escapeHtml(item.column1_code);
    const safeCol2 = escapeHtml(item.column2_code);
    const safeOther = escapeHtml(otherCode);
    
    html += `
      <div class="ncci-card ${relevanceClass}">
        <div class="ncci-header">Bundle Relationship • ${safeColNum}</div>
        <div class="result-code-group">
          <span class="ncci-code-block">${safeCol1}</span>
          <span class="ncci-separator">+</span>
          <span class="ncci-code-block">${safeCol2}</span>
          <button class="copy-btn" data-code="${otherCode}" title="Copy Conflict Code">
            <svg width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"></path></svg>
          </button>
          ${item.modifier_allowed ? `<span class="result-badge">Mod Allowed: ${escapeHtml(item.modifier_allowed === '1' ? 'Yes' : 'No')}</span>` : ''}
        </div>
        <div class="result-desc">
          <strong>Clinical Rule:</strong> These codes are clinically bundled. 
          ${item.modifier_allowed === '1' ? 'A modifier (e.g., -59) may bypass this edit if performed at a separate site/session.' : 'No modifier bypass is permitted for this specific pair.'}
        </div>
      </div>
    `;
  });
  listContainer.innerHTML = html;
}

function isTimeoutError(error) {
  const msg = (error?.message || '').toLowerCase();
  return msg.includes('timeout') || msg.includes('canceling statement');
}

function isCptOrHcpcs(type) {
  const t = (type || '').toUpperCase();
  return t === 'HCPCS' || t === 'CPT' || t === 'CPT2';
}

function getPlainEnglishDescription(code, type, rawDesc) {
  if (!isCptOrHcpcs(type)) return null;
  const normalizedCode = (code || '').toUpperCase();
  if (PLAIN_ENGLISH_OVERRIDES[normalizedCode]) {
    return PLAIN_ENGLISH_OVERRIDES[normalizedCode];
  }
  return expandMedicareDescription(rawDesc);
}

function expandMedicareDescription(rawDesc) {
  const desc = cleanMedicalDescription(rawDesc);
  if (!desc || desc === '—') return null;

  const abbrevs = [
    ['w/o', 'without'], ['w/', 'with'], ['o/p', 'outpatient'], ['i/p', 'inpatient'],
    ['est', 'established patient'], ['subsq', 'subsequent'], ['init', 'initial'],
    ['preop', 'preoperative'], ['postop', 'postoperative'], ['new', 'new patient'],
    ['mod', 'moderate complexity'], ['comp', 'comprehensive'], ['ther', 'therapeutic'],
    ['diag', 'diagnostic'], ['eval', 'evaluation'], ['mgmt', 'management'],
    ['admin', 'administration'], ['vacc', 'vaccine'], ['inj', 'injection'],
    ['surg', 'surgical'], ['proc', 'procedure'], ['svc', 'service'],
    ['abd', 'abdominal'], ['bk', 'back'], ['fx', 'fracture'], ['dx', 'diagnosis'],
    ['tx', 'treatment'], ['xr', 'x-ray'], ['rad', 'radiology'], ['min', 'minutes'],
    ['hr', 'hour'], ['hrs', 'hours'], ['obs', 'obstetric'], ['gyn', 'gynecologic'],
    ['pulm', 'pulmonary'], ['card', 'cardiac'], ['neuro', 'neurological'],
    ['l/s', 'lumbar spine'], ['c/s', 'cervical spine'], ['l/r', 'left or right'],
  ];

  let expanded = desc;
  for (const [abbr, full] of abbrevs) {
    expanded = expanded.replace(new RegExp(`\\b${abbr.replace('/', '\\/')}\\b`, 'gi'), full);
  }

  // E&M outpatient office visit pattern
  const emOffice = expanded.match(
    /^office\s+outpatient\s+(new patient|established patient)\s+((?:low(?:-moderate)?|moderate(?:-high)?|high|minimal)(?:\s+complexity)?)?\s*(\d+)?\s*minutes?/i
  );
  if (emOffice) {
    const patientType = emOffice[1].toLowerCase();
    let complexity = (emOffice[2] || '').replace(/\s+complexity/i, '').trim().toLowerCase();
    if (complexity && !complexity.includes('complexity')) complexity += ' complexity';
    const mins = emOffice[3];
    const cxPart = complexity ? `, ${complexity}` : '';
    const timePart = mins ? `, ~${mins} minutes` : '';
    return `Outpatient office visit for a ${patientType}${cxPart}${timePart}`;
  }

  // Hospital / ED patterns
  const emHospital = expanded.match(
    /^(initial|subsequent)\s+hospital\s+(?:inpatient\s+)?care\s+((?:low|moderate|high)(?:\s+complexity)?)/i
  );
  if (emHospital) {
    const phase = emHospital[1].toLowerCase();
    const complexity = emHospital[2].replace(/\s+complexity/i, '').trim().toLowerCase();
    return `${phase.charAt(0).toUpperCase() + phase.slice(1)} hospital inpatient care, ${complexity} complexity`;
  }

  const emEd = expanded.match(/^ed\s+visit\s+((?:low|moderate|high)(?:\s+severity)?)/i);
  if (emEd) {
    return `Emergency department visit, ${emEd[1].trim().toLowerCase()}`;
  }

  // General cleanup for fallback expansion
  expanded = expanded.replace(/(\d+)\s+minutes?/gi, '~$1 minutes');
  expanded = expanded.replace(/\s{2,}/g, ' ').trim();
  expanded = expanded.charAt(0).toUpperCase() + expanded.slice(1);

  if (expanded.toLowerCase() === desc.toLowerCase()) return null;
  return expanded;
}

function cleanMedicalDescription(desc) {
  if (!desc || desc === '—') return '—';
  
  // 1. Remove excessive internal whitespace (common in fixed-width CMS data)
  let cleaned = desc.replace(/\s{2,}/g, ' ').trim();
  
  // 2. Remove trailing single character flags (I, J, M, etc.) common in Medicare files
  if (/\s[I-Z]$/.test(cleaned)) {
    cleaned = cleaned.replace(/\s[I-Z]$/, '');
  }
  
  return cleaned;
}

function escapeHtml(str) {
  if (!str) return '';
  const div = document.createElement('div');
  div.textContent = str;
  return div.innerHTML;
}
