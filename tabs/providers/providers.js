/**
 * MediHelp — providers.js
 * Handles: National Provider Search (NPPES API)
 */

function mergeNPIResults(resultSets) {
  const merged = [];
  const seen = new Set();
  (resultSets || []).forEach((set) => {
    (set || []).forEach((provider) => {
      if (!provider?.number || seen.has(provider.number)) return;
      seen.add(provider.number);
      merged.push(provider);
    });
  });
  return merged;
}

function parseLabeledNPIQuery(raw) {
  const result = {
    practitioner: null,
    facility: null,
    npiNumber: null,
    stateCode: null,
    hasLabels: false,
    freeText: null,
  };

  if (!raw || !raw.trim()) return result;

  // Normalize accents and diacritics (e.g. René -> Rene, Muñoz -> Munoz)
  const normalizedRaw = raw.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
  const text = normalizedRaw.replace(/\r\n/g, '\n').trim();
  const inlineLabelPattern = /(Practitioner(?:\s+Name)?|Facility(?:\s+Name)?|NPI(?:\s+Number)?|With\s+State|State)\s*:/gi;
  const labelCount = (text.match(inlineLabelPattern) || []).length;

  if (labelCount === 0) {
    result.freeText = text;
    return result;
  }

  result.hasLabels = true;
  const unlabeled = [];

  const consume = (pattern, assign) => {
    const match = text.match(pattern);
    if (match && match[1]) assign(match[1].trim());
  };

  consume(/Practitioner(?:\s+Name)?\s*:\s*([^\n]+?)(?=\s*(?:Facility(?:\s+Name)?|NPI(?:\s+Number)?|With\s+State|State)\s*:|$)/is, (v) => {
    result.practitioner = v.replace(/\s+/g, ' ').trim();
  });
  consume(/Facility(?:\s+Name)?\s*:\s*([^\n]+?)(?=\s*(?:Practitioner(?:\s+Name)?|NPI(?:\s+Number)?|With\s+State|State)\s*:|$)/is, (v) => {
    result.facility = v.replace(/\s+/g, ' ').trim();
  });
  consume(/NPI(?:\s+Number)?\s*:\s*([^\n]+?)(?=\s*(?:Practitioner(?:\s+Name)?|Facility(?:\s+Name)?|With\s+State|State)\s*:|$)/is, (v) => {
    const digits = v.replace(/\D/g, '');
    if (digits.length === 10) result.npiNumber = digits;
  });
  consume(/With\s+State\s*:\s*([^\n]+?)(?=\s*(?:Practitioner(?:\s+Name)?|Facility(?:\s+Name)?|NPI(?:\s+Number)?|State)\s*:|$)/is, (v) => {
    applyStateLine(v, result);
  });
  consume(/^State\s*:\s*([^\n]+?)(?=\s*(?:Practitioner(?:\s+Name)?|Facility(?:\s+Name)?|NPI(?:\s+Number)?|With\s+State)\s*:|$)/ims, (v) => {
    applyStateLine(v, result);
  });

  text.split('\n').forEach((line) => {
    const trimmed = line.trim();
    if (!trimmed) return;
    if (/^(Practitioner(?:\s+Name)?|Facility(?:\s+Name)?|NPI(?:\s+Number)?|With\s+State|State)\s*:/i.test(trimmed)) return;
    unlabeled.push(trimmed);
  });

  result.freeText = unlabeled.join(' ').trim() || null;
  return result;
}

function applyStateLine(value, result) {
  const parsed = parseNPIQuery(value);
  if (parsed?.stateCode) result.stateCode = parsed.stateCode;
  if (!result.practitioner && parsed?.cleanName) {
    result.practitioner = parsed.cleanName;
  }
}

function stripTrailingGenericWords(query) {
  if (!query) return '';
  const genericWords = [
    'center', 'clinic', 'hospital', 'facility', 'services', 'service',
    'group', 'llc', 'inc', 'corp', 'corporation', 'pllc', 'associates',
    'surgical', 'surgery', 'medical', 'health', 'healthcare', 'care',
    'practice', 'office', 'provider', 'providers', 'dialysis'
  ];
  
  let tokens = query.split(/\s+/);
  while (tokens.length > 1) {
    const lastWord = tokens[tokens.length - 1].toLowerCase().replace(/[^a-z0-9]/g, '');
    if (genericWords.includes(lastWord)) {
      tokens.pop();
    } else {
      break;
    }
  }
  return tokens.join(' ');
}

function extractPractitionerName(cleanName) {
  if (!cleanName) return { firstName: null, lastName: null };
  const baseName = stripTrailingGenericWords(cleanName);
  const tokens = baseName.split(/\s+/).filter(Boolean);
  if (tokens.length >= 2) {
    return {
      firstName: tokens[0],
      lastName: tokens.slice(1).join(' ')
    };
  } else if (tokens.length === 1) {
    return {
      firstName: null,
      lastName: tokens[0]
    };
  }
  return { firstName: null, lastName: null };
}

async function executeStructuredNPISearch(structured, dropdownState) {
  const stateCode = dropdownState || structured.stateCode || '';
  const resultSets = [];

  if (structured.npiNumber) {
    const npiData = await executeNPISearch(
      { npiNumber: structured.npiNumber, cleanName: null, firstName: null, lastName: null, isOrg: false, stateCode: null },
      stateCode
    );
    if (npiData.results?.length) return npiData;
  }

  if (structured.practitioner) {
    const parsed = parseNPIQuery(structured.practitioner);
    if (parsed?.npiNumber) {
      const npiData = await executeNPISearch(parsed, stateCode);
      if (npiData.results?.length) return npiData;
    }
    if (parsed?.cleanName || parsed?.lastName) {
      const indiv = await executeNPISearch(parsed, stateCode);
      if (indiv.results?.length) resultSets.push(indiv.results);
      if (!parsed.isOrg && parsed.firstName && parsed.lastName) {
        const reversed = await executeNPISearch(parsed, stateCode, { reverseName: true });
        if (reversed.results?.length) resultSets.push(reversed.results);
      }
    }
  }

  if (structured.facility) {
    const parsed = parseNPIQuery(structured.facility);
    if (parsed?.cleanName) {
      const orgNameQuery = stripTrailingGenericWords(parsed.cleanName);
      if (orgNameQuery) {
        const orgParsed = { ...parsed, cleanName: orgNameQuery };
        const org = await executeNPISearch(orgParsed, stateCode, { forceOrg: true });
        if (org.results?.length) resultSets.push(org.results);
      }
    }
  }

  return { results: mergeNPIResults(resultSets) };
}

async function executeDualNPISearch(parsed, dropdownState) {
  if (parsed.npiNumber) return executeNPISearch(parsed, dropdownState);

  const stateCode = dropdownState || parsed.stateCode || '';
  const resultSets = [];

  // 1. Search as Organization (Facility)
  const orgNameQuery = stripTrailingGenericWords(parsed.cleanName);
  if (orgNameQuery) {
    const orgParsed = { ...parsed, cleanName: orgNameQuery, isOrg: true };
    try {
      const orgResults = await executeNPISearch(orgParsed, stateCode, { forceOrg: true });
      if (orgResults.results?.length) resultSets.push(orgResults.results);
    } catch (e) {
      console.warn('Organization search failed:', e);
    }
  }

  // 2. Search as Practitioner (Individual)
  const practNames = extractPractitionerName(parsed.cleanName);
  if (practNames.lastName) {
    const indParsed = {
      ...parsed,
      firstName: practNames.firstName,
      lastName: practNames.lastName,
      isOrg: false
    };
    try {
      const indResults = await executeNPISearch(indParsed, stateCode);
      if (indResults.results?.length) resultSets.push(indResults.results);
    } catch (e) {
      console.warn('Practitioner search failed:', e);
    }

    if (practNames.firstName && practNames.lastName) {
      try {
        const reversedResults = await executeNPISearch(indParsed, stateCode, { reverseName: true });
        if (reversedResults.results?.length) resultSets.push(reversedResults.results);
      } catch (e) {
        console.warn('Reversed practitioner search failed:', e);
      }
    }
  }

  return { results: mergeNPIResults(resultSets) };
}

/* ─────────────────────────────────────────────────────────────────────────
 *  parseNPIQuery  — Smart Query Parser
 *  Handles all edge cases: noise words, credentials, specialties,
 *  honorific titles, US state detection, org vs individual detection,
 *  punctuation stripping, and embedded NPI numbers.
 * ────────────────────────────────────────────────────────────────────────*/
function parseNPIQuery(raw) {
  if (!raw || !raw.trim()) return null;

  // Normalize accents and diacritics (e.g. René -> Rene, Muñoz -> Munoz)
  const normalizedRaw = raw.normalize("NFD").replace(/[\u0300-\u036f]/g, "");

  // ── 1. Extract any 10-digit NPI number embedded anywhere in input ──
  const npiMatch = normalizedRaw.match(/\b(\d{10})\b/);
  if (npiMatch) {
    return { npiNumber: npiMatch[1], cleanName: null, firstName: null, lastName: null, isOrg: false, stateCode: null };
  }

  // ── 2. Normalize: collapse dotted credentials (m.d.→md, r.n.→rn) BEFORE stripping punctuation ──
  let input = normalizedRaw.replace(/\b([a-zA-Z])\.([a-zA-Z])\.?\b/g, '$1$2');
  // Strip remaining punctuation (keep hyphens for hyphenated names)
  input = input.replace(/[,\.;:!?()'"]/g, ' ').replace(/\s+/g, ' ').trim();

  // ── 3. Word-level dictionaries ──

  const NOISE_WORDS = new Set([
    'npi', 'number', 'no', 'find', 'lookup', 'search', 'the', 'for', 'of', 'from',
    'get', 'show', 'me', 'look', 'up', 'please', 'can', 'you', 'code', 'registry',
    'cms', 'national', 'identifier', 'what', 'is', 'are', 'a', 'an', 'and', 'or',
    'by', 'at', 'with', 'their', 'his', 'her', 'its', 'my', 'our', 'your', 'who',
    'where', 'how', 'i', 'want', 'need', 'check', 'verify', 'this', 'that',
    'tell', 'give', 'look', 'in', 'about',
    'practitioner', 'facility', 'organization', 'provider', 'official', 'state'
  ]);

  // Credentials — always stripped from name queries (dots already removed)
  const CREDENTIALS = new Set([
    'md', 'do', 'rn', 'np', 'fnp', 'lcsw', 'lpc', 'dds', 'dpm', 'dc', 'phd',
    'dpt', 'crnp', 'aprn', 'cns', 'cnm', 'crna', 'facp', 'facs', 'mba', 'mph',
    'msn', 'bsn', 'adn', 'lpn', 'lvn', 'cna', 'emt', 'nrp', 'cen', 'ccrn',
    'rph', 'pharmd', 'od', 'ot', 'pt', 'slp', 'scd', 'dsc', 'edd', 'psyd',
    'atc', 'rdh', 'rda', 'cst', 'rrt', 'rdms', 'rt', 'arrt', 'agpcnp', 'pmhnp',
    'cfnp', 'acnp', 'dnp', 'anp', 'gnp', 'whnp', 'rnc', 'cns', 'chfn', 'cmd',
    'lmft', 'lmhc', 'lcadc', 'lac', 'cad', 'cadc', 'ladc', 'mft', 'lpha',
    'cpnp', 'cpen', 'cfrn', 'ctrn', 'tcrn', 'msw', 'lmsw', 'llmsw', 'csw',
    'acsw', 'dcsw', 'licsw', 'lisw', 'apsw', 'bcba', 'bcba-d', 'rbt',
    'ccc', 'slpa', 'aud', 'scfei', 'cota', 'ota', 'pta', 'cpht', 'rph',
    'bspharm', 'mph', 'drph', 'dpth', 'mhsa', 'mha', 'mhm'
  ]);

  // Honorific / title prefixes — always stripped
  const TITLE_PREFIXES = new Set([
    'dr', 'doctor', 'mr', 'mrs', 'ms', 'miss', 'prof', 'professor',
    'sir', 'rev', 'nurse', 'sister', 'brother', 'father', 'st'
  ]);

  // Org-detection keywords — strong signal that the query is an organization
  const ORG_DETECTION_KEYWORDS = new Set([
    'clinic', 'hospital', 'llc', 'center', 'group', 'inc', 'pllc', 'corp',
    'corporation', 'associates', 'institute', 'foundation', 'services', 'service',
    'system', 'network', 'alliance', 'partners', 'solutions', 'authority',
    'trust', 'council', 'board', 'department', 'division', 'district',
    'urgent', 'emergency', 'pharmacy', 'laboratory', 'labs', 'wellness',
    'rehabilitation', 'outpatient', 'inpatient', 'multispecialty', 'support',
    'university', 'college', 'school', 'academy', 'association', 'society',
    'team', 'company', 'co', 'enterprise', 'enterprises', 'organization',
    'agency', 'bureau', 'office', 'program', 'project', 'initiative',
    'surgical', 'lakes', 'medical', 'health', 'healthcare', 'care', 'home',
    'nursing', 'therapy', 'diagnostic', 'imaging', 'dental', 'surgery'
  ]);

  // Specialty words — stripped from INDIVIDUAL searches only (kept for org names)
  const SPECIALTY_WORDS = new Set([
    'paramedic', 'cardiologist', 'cardiology', 'surgeon', 'surgery', 'physician',
    'gastroenterologist', 'gastroenterology', 'radiologist', 'radiology',
    'neurologist', 'neurology', 'oncologist', 'oncology', 'therapist',
    'dentist', 'psychiatrist', 'psychiatry', 'psychologist', 'psychology',
    'dermatologist', 'dermatology', 'ophthalmologist', 'ophthalmology',
    'orthopedic', 'orthopedics', 'pediatrician', 'pediatrics', 'pediatric',
    'endocrinologist', 'endocrinology', 'nephrologist', 'nephrology',
    'pulmonologist', 'pulmonology', 'rheumatologist', 'rheumatology',
    'urologist', 'urology', 'obstetrician', 'obstetrics', 'gynecologist', 'gynecology',
    'obgyn', 'anesthesiologist', 'anesthesiology', 'pathologist',
    'allergist', 'immunologist', 'immunology', 'hematologist', 'hematology',
    'geriatrician', 'geriatrics', 'neonatologist', 'neonatology',
    'hospitalist', 'internist', 'chiropractor', 'chiropractic',
    'optometrist', 'optometry', 'podiatrist', 'podiatry', 'audiologist', 'audiology',
    'vascular', 'plastic', 'cosmetic', 'colorectal', 'bariatric', 'transplant',
    'trauma', 'pain', 'addiction', 'palliative', 'hospice', 'wound', 'sleep',
    'reproductive', 'fertility', 'genetics', 'nuclear', 'diagnostic',
    'preventive', 'behavioral', 'mental', 'acupuncture', 'naturopath',
    'naturopathic', 'integrative', 'holistic', 'specialist', 'clinician',
    'practitioner', 'professional'
  ]);

  // US State full names → abbreviation
  const STATE_NAMES = {
    'alabama':'AL','alaska':'AK','arizona':'AZ','arkansas':'AR','california':'CA',
    'colorado':'CO','connecticut':'CT','delaware':'DE','florida':'FL','georgia':'GA',
    'hawaii':'HI','idaho':'ID','illinois':'IL','indiana':'IN','iowa':'IA',
    'kansas':'KS','kentucky':'KY','louisiana':'LA','maine':'ME','maryland':'MD',
    'massachusetts':'MA','michigan':'MI','minnesota':'MN','mississippi':'MS',
    'missouri':'MO','montana':'MT','nebraska':'NE','nevada':'NV',
    'ohio':'OH','oklahoma':'OK','oregon':'OR','pennsylvania':'PA',
    'tennessee':'TN','texas':'TX','utah':'UT','vermont':'VT','virginia':'VA',
    'washington':'WA','wisconsin':'WI','wyoming':'WY'
  };

  // Safe 2-letter state abbreviations (excludes PA/MD/IN/OR/MA/DC to avoid credential conflicts)
  const SAFE_STATE_ABBREVS = new Set([
    'AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID',
    'IL','IA','KS','KY','LA','ME','MI','MN','MS','MO','MT','NE',
    'NV','NH','NJ','NM','NY','NC','ND','OH','OK','RI','SC',
    'SD','TN','TX','UT','VT','VA','WA','WV','WI','WY'
  ]);

  // ── 4. Multi-word state detection (must happen before tokenizing) ──
  let stateCode = null;
  const MULTI_STATES = {
    'new hampshire':'NH','new jersey':'NJ','new mexico':'NM','new york':'NY',
    'north carolina':'NC','north dakota':'ND','south carolina':'SC','south dakota':'SD',
    'west virginia':'WV','rhode island':'RI','district of columbia':'DC'
  };
  const inputLower = input.toLowerCase();
  for (const [stateName, abbrev] of Object.entries(MULTI_STATES)) {
    if (inputLower.includes(stateName)) {
      stateCode = abbrev;
      input = input.replace(new RegExp(stateName, 'gi'), ' ');
      break;
    }
  }

  // ── 5. Tokenize ──
  const tokens = input.split(/\s+/).filter(t => t.length > 0);

  // ── 6. Quick-scan: does it look like an org? (before stripping anything) ──
  const hasOrgKeyword = tokens.some(t => ORG_DETECTION_KEYWORDS.has(t.toLowerCase()));

  // ── 7. Filter tokens ──
  const nameTokens = [];

  for (const tok of tokens) {
    const tokL  = tok.toLowerCase();
    const tokU  = tok.toUpperCase();
    const tokNP = tokL.replace(/\./g, ''); // strip dots: "m.d." → "md"

    // Noise words
    // For org queries keep connectors like 'of', 'and' (they may be part of org name)
    if (NOISE_WORDS.has(tokL) && !(hasOrgKeyword && ['of', 'and', 'for', 'at', 'in', 'the'].includes(tokL))) continue;

    // Credentials (strip for everyone — if it's an org the org name won't contain these)
    if (CREDENTIALS.has(tokNP)) continue;

    // Honorific titles
    if (TITLE_PREFIXES.has(tokL) || TITLE_PREFIXES.has(tokNP)) continue;

    // State abbreviation (safe set only, and only if we already have some name tokens)
    // Accept both upper and lower case: 'CA' and 'ca' both match
    if (!stateCode && SAFE_STATE_ABBREVS.has(tokU) && tok.length === 2 && nameTokens.length > 0) {
      stateCode = tokU;
      continue;
    }

    // State full name (single-word states)
    if (!stateCode && STATE_NAMES[tokL]) {
      stateCode = STATE_NAMES[tokL];
      continue;
    }

    // Specialty words — only strip for individual searches
    if (!hasOrgKeyword && SPECIALTY_WORDS.has(tokL)) continue;

    nameTokens.push(tok);
  }

  // ── 8. Build result ──
  const cleanName = nameTokens.join(' ').trim();
  const isOrg     = hasOrgKeyword;

  let firstName = null;
  let lastName  = null;

  if (!isOrg) {
    if (nameTokens.length >= 2) {
      firstName = nameTokens[0];
      lastName  = nameTokens.slice(1).join(' ');
    } else if (nameTokens.length === 1) {
      lastName = nameTokens[0]; // treat single token as last name
    }
  }

  return { npiNumber: null, cleanName, firstName, lastName, isOrg, stateCode };
}


/* ─────────────────────────────────────────────────────────────────────────
 *  executeNPISearch — Builds URL and fetches from NPPES via proxy
 * ────────────────────────────────────────────────────────────────────────*/
async function executeNPISearch(parsed, dropdownState, { forceOrg = false, reverseName = false } = {}) {
  if (!parsed) return { results: [] };

  // Dropdown state always wins over detected state
  const stateCode = dropdownState || parsed.stateCode || '';

  let url = '/api/npi?';

  if (parsed.npiNumber) {
    url += `number=${parsed.npiNumber}`;
  } else if (forceOrg || parsed.isOrg) {
    const orgQuery = parsed.cleanName || '';
    if (!orgQuery) return { results: [] };
    url += `organization_name=${encodeURIComponent(orgQuery)}*`;
    if (stateCode) url += `&state=${encodeURIComponent(stateCode)}`;
  } else if (parsed.firstName && parsed.lastName) {
    const fn = reverseName ? parsed.lastName  : parsed.firstName;
    const ln = reverseName ? parsed.firstName : parsed.lastName;
    url += `first_name=${encodeURIComponent(fn)}*&last_name=${encodeURIComponent(ln)}*`;
    if (stateCode) url += `&state=${encodeURIComponent(stateCode)}`;
  } else if (parsed.lastName) {
    // Single-token: search as last name
    url += `last_name=${encodeURIComponent(parsed.lastName)}*`;
    if (stateCode) url += `&state=${encodeURIComponent(stateCode)}`;
  } else {
    return { results: [] };
  }

  const res = await fetch(url);
  if (!res.ok) throw new Error(`API error ${res.status}`);
  return res.json();
}


/* ─────────────────────────────────────────────────────────────────────────
 *  searchNPI — Main entry point with smart 4-stage fallback
 * ────────────────────────────────────────────────────────────────────────*/
async function searchNPI() {
  const nameInput = document.getElementById('npi-name');
  const stateInput = document.getElementById('npi-state');
  const resultsEl  = document.getElementById('npi-results');
  const btn        = document.getElementById('npi-search-btn');
  if (!nameInput || !resultsEl) return;

  const rawQuery = nameInput.value.trim();
  const dropdownState = stateInput ? stateInput.value.trim().toUpperCase() : '';

  if (rawQuery.length < 2) {
    resultsEl.innerHTML = '<p class="status-msg">Please enter at least 2 characters.</p>';
    return;
  }

  resultsEl.innerHTML = `
    <div style="text-align:center; padding: 40px 0;">
      <div class="spinner" style="margin: 0 auto 16px; width:36px; height:36px; border:3px solid var(--border); border-top-color:var(--accent); border-radius:50%; animation: spin 1s linear infinite;"></div>
      <p style="color:var(--text-muted); font-size:14px;">Searching CMS NPPES Registry...</p>
    </div>`;
  if (btn) btn.disabled = true;

  try {
    const structured = parseLabeledNPIQuery(rawQuery);
    let data = { results: [] };
    let searchLabel = '';

    if (structured.hasLabels) {
      const hasAnyField = structured.npiNumber || structured.practitioner || structured.facility || structured.stateCode;
      if (!hasAnyField && !structured.freeText) {
        resultsEl.innerHTML = `
          <div class="status-msg">
            Could not extract a practitioner, facility, NPI, or state from your labeled query.
            <br><small>Try: <code>Practitioner: Christal Smith</code>, <code>Facility: Fresh Start Service Support</code>, <code>NPI: 1548497795</code>, or <code>With State: John Smith TX</code></small>
          </div>`;
        return;
      }

      data = await executeStructuredNPISearch(structured, dropdownState);
      searchLabel = [
        structured.npiNumber ? `NPI ${structured.npiNumber}` : null,
        structured.practitioner ? `Practitioner "${structured.practitioner}"` : null,
        structured.facility ? `Facility "${structured.facility}"` : null,
        (structured.stateCode || dropdownState) ? `State ${structured.stateCode || dropdownState}` : null,
      ].filter(Boolean).join(' · ');

      if ((!data.results || data.results.length === 0) && structured.freeText) {
        const parsedFree = parseNPIQuery(structured.freeText);
        if (parsedFree && (parsedFree.npiNumber || parsedFree.cleanName)) {
          data = await executeDualNPISearch(parsedFree, dropdownState || structured.stateCode);
        }
      }
    } else {
      const parsed = parseNPIQuery(rawQuery);
      if (!parsed || (!parsed.npiNumber && !parsed.cleanName)) {
        resultsEl.innerHTML = `
          <div class="status-msg">
            Could not extract a valid provider name or NPI from <strong>"${window.escapeHtml(rawQuery)}"</strong>.
            <br><small>Try: "John Smith", "Victory Lakes Surgical Center", "Practitioner: Christal Smith", or a 10-digit NPI.</small>
          </div>`;
        return;
      }

      if (parsed.npiNumber) {
        data = await executeNPISearch(parsed, dropdownState);
      } else {
        data = await executeDualNPISearch(parsed, dropdownState);
      }
      searchLabel = parsed.cleanName || rawQuery;
    }

    if (data.results && data.results.length > 0) {
      const prefix = searchLabel
        ? `<p style="font-size:12px;color:var(--text-muted);text-align:center;margin-bottom:16px;">Showing matches for ${window.escapeHtml(searchLabel)} — practitioners and facilities</p>`
        : '';
      renderNPIResults(data.results, resultsEl, prefix);
      return;
    }

    const displayName = searchLabel || rawQuery;
    resultsEl.innerHTML = `
      <div class="status-msg">
        No providers found for "<strong>${window.escapeHtml(displayName)}</strong>"${dropdownState ? ` in ${dropdownState}` : ''}.
        <br><small>Check spelling, try a single field (Practitioner, Facility, or NPI), or search by 10-digit NPI number.</small>
      </div>`;

  } catch (err) {
    console.error('NPI Proxy Error:', err);
    resultsEl.innerHTML = `
      <div class="audit-finding" style="border-left: 3px solid var(--danger); background: rgba(239, 68, 68, 0.05);">
        <div class="finding-icon danger">●</div>
        <div>
          <strong style="color:var(--text-h);">NPI Registry Offline</strong>
          <p style="margin:4px 0 0; font-size:13px; color:var(--text-muted);">The CMS registry search failed. This usually happens due to rate limiting or maintenance.</p>
        </div>
      </div>`;
  } finally {
    if (btn) btn.disabled = false;
  }
}


function renderNPIResults(results, container, prefixHtml = '') {
  // Helper to convert names to Title Case
  const toTitleCase = (str) => {
    if (!str) return '';
    return str.toLowerCase().split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
  };

  container.innerHTML = prefixHtml + results.map(p => {
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

    // Helper to format addresses nicely (including unit/suite address_2)
    const formatAddress = (addrObj) => {
      if (!addrObj) return '';
      const street = [addrObj.address_1, addrObj.address_2].filter(Boolean).join(', ');
      return `${street}, ${addrObj.city || ''}, ${addrObj.state || ''} ${(addrObj.postal_code || '').substring(0, 5)}`.trim().replace(/\s+/g, ' ');
    };

    // Extract physical location and mailing addresses
    const locationAddr = p.addresses?.find(a => a.address_purpose === 'LOCATION') || p.addresses?.[0];
    const mailingAddr = p.addresses?.find(a => a.address_purpose === 'MAILING');

    const addressLine = locationAddr ? formatAddress(locationAddr) : 'Address details unavailable';
    const mailingLine = mailingAddr ? formatAddress(mailingAddr) : null;
    const showMailing = mailingLine && mailingLine !== addressLine;

    const mapsUrl = locationAddr ? `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(addressLine)}` : '#';
    const status = p.basic.status === 'A' ? '✓ Active' : '⚠ Inactive';
    const statusColor = p.basic.status === 'A' ? 'var(--success)' : 'var(--warning)';

    // Extract Doing Business As (DBA) or other names for organization
    let dbaNamesHtml = '';
    let dbaText = '';
    if (isOrg && p.other_names && p.other_names.length > 0) {
      const dbaList = p.other_names
        .map(n => {
          const typeStr = n.type ? ` (${n.type})` : '';
          return toTitleCase(n.organization_name) + typeStr;
        })
        .filter(Boolean);
      if (dbaList.length > 0) {
        dbaNamesHtml = `
          <div style="font-size: 13.5px; color: var(--text-muted); margin-top: 6px; font-weight: 600; line-height: 1.4;">
            <span style="color: var(--accent); font-weight: 800;">Also known as:</span> ${window.escapeHtml(dbaList.join(', '))}
          </div>`;
        dbaText = ' | DBA: ' + p.other_names.map(n => n.organization_name).join(', ');
      }
    }

    // Copy string exact format matching user request (includes mailing address if distinct)
    const copyText = `${name}${dbaText} | NPI: ${p.number} | ${taxonomy} | Practice: ${addressLine}${showMailing ? ' | Mailing: ' + mailingLine : ''}${officialName ? ' | Official : ' + officialName : ''}`;
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
          ${dbaNamesHtml}
        </div>

        <!-- Affiliated Org placeholder (filled async for individual NPI) -->
        ${!isOrg ? `<div class="npi-affiliated-org" data-first="${window.escapeHtml(p.basic.first_name || '')}" data-last="${window.escapeHtml(p.basic.last_name || '')}" style="display:none; margin-bottom:16px;">
          <div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--text-muted); letter-spacing: 0.08em; margin-bottom: 4px;">Affiliated Facility</div>
          <div class="npi-affiliated-org-name" style="font-size: 15px; font-weight: 800; color: var(--text-h);"></div>
        </div>` : ''}

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
          <div style="flex: 1; min-width: 250px;">
            <div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--text-muted); letter-spacing: 0.08em; margin-bottom: 4px;">
              Practice Location (Physical)
            </div>
            <div style="display: flex; gap: 8px; align-items: flex-start; color: var(--text-body); font-size: 14px; line-height: 1.5; margin-bottom: ${showMailing ? '12px' : '0'};">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="margin-top: 2px; flex-shrink: 0;"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
              <span>${window.escapeHtml(addressLine)}</span>
            </div>
            ${showMailing ? `
            <div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--text-muted); letter-spacing: 0.08em; margin-bottom: 4px;">
              Mailing Address
            </div>
            <div style="display: flex; gap: 8px; align-items: flex-start; color: var(--text-body); font-size: 14px; line-height: 1.5;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="margin-top: 2px; flex-shrink: 0;"><rect x="2" y="4" width="20" height="16" rx="2"></rect><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"></path></svg>
              <span>${window.escapeHtml(mailingLine)}</span>
            </div>
            ` : ''}
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

  // ── Async reverse-org lookup for individual cards ──
  container.querySelectorAll('.npi-affiliated-org').forEach(async (placeholder) => {
    const firstName = placeholder.dataset.first;
    const lastName  = placeholder.dataset.last;
    if (!firstName && !lastName) return;

    try {
      const params = new URLSearchParams();
      if (firstName) params.set('authorized_official_first_name', firstName);
      if (lastName)  params.set('authorized_official_last_name',  lastName);
      const res  = await fetch(`/api/npi?${params.toString()}`);
      if (!res.ok) return;
      const data = await res.json();
      const orgs = data.results || [];
      if (orgs.length === 0) return;

      // Pick the first org with a real name
      const org = orgs.find(o => o.basic?.organization_name) || orgs[0];
      const orgName = org?.basic?.organization_name;
      if (!orgName) return;

      // Show the affiliated org section
      placeholder.querySelector('.npi-affiliated-org-name').textContent = orgName;
      placeholder.style.display = 'block';

      // Also update the copy button to include the org name
      const card    = placeholder.closest('.npi-card');
      const copyBtn = card?.querySelector('.npi-copy-btn');
      if (copyBtn && !copyBtn.dataset.details.includes(orgName)) {
        copyBtn.dataset.details += ` | Facility: ${orgName}`;
      }
    } catch (_) { /* silently skip if lookup fails */ }
  });
}

// Global hook for Search Button
window.searchNPI = searchNPI;

// Allow pressing Enter in NPI name field to trigger search & click listener for guide pills
document.addEventListener('DOMContentLoaded', () => {
  const npiInput = document.getElementById('npi-name');
  if (npiInput) {
    npiInput.addEventListener('keydown', (e) => {
      if (e.key !== 'Enter') return;
      const isTextarea = npiInput.tagName === 'TEXTAREA';
      if (isTextarea) {
        if (e.ctrlKey || e.metaKey) {
          e.preventDefault();
          searchNPI();
        }
        return;
      }
      e.preventDefault();
      searchNPI();
    });
  }

  // Handle recommended format pills
  document.querySelectorAll('.npi-fmt-pill').forEach(pill => {
    pill.onclick = (e) => {
      e.preventDefault();
      const query = pill.dataset.query;
      if (npiInput) {
        npiInput.value = query;
        searchNPI();
      }
    };
  });
});
