/**
 * MediHelp — providers.js
 * Handles: National Provider Search (NPPES API)
 */

const TAXONOMY_MAP = {
  'cardiology': '207RC0000X',
  'cardiologist': '207RC0000X',
  'pediatrics': '208000000X',
  'pediatrician': '208000000X',
  'pediatric': '208000000X',
  'dermatology': '207N00000X',
  'dermatologist': '207N00000X',
  'orthopedics': '207X00000X',
  'orthopedic': '207X00000X',
  'gastroenterology': '207RG0100X',
  'gastroenterologist': '207RG0100X',
  'neurology': '2084N0400X',
  'neurologist': '2084N0400X',
  'oncology': '207RX0202X',
  'oncologist': '207RX0202X',
  'radiology': '2085R0202X',
  'radiologist': '2085R0202X',
  'psychiatry': '2084P0800X',
  'psychiatrist': '2084P0800X',
  'optometry': '152W00000X',
  'optometrist': '152W00000X',
  'dentistry': '122300000X',
  'dentist': '122300000X',
  'dental': '122300000X',
  'podiatry': '213E00000X',
  'podiatrist': '213E00000X',
  'urology': '208800000X',
  'urologist': '208800000X',
  'gynecology': '207V00000X',
  'gynecologist': '207V00000X',
  'obstetrics': '207V00000X',
  'obstetrician': '207V00000X',
  'obgyn': '207V00000X',
  'anesthesiology': '207L00000X',
  'anesthesiologist': '207L00000X',
  'pathology': '207P00000X',
  'pathologist': '207P00000X',
  'pharmacy': '333600000X',
  'pharmacist': '183500000X',
  'chiropractic': '111N00000X',
  'chiropractor': '111N00000X',
  'dialysis': '261QE0700X',
  'therapy': '225X00000X',
  'therapist': '225X00000X',
  'physical therapy': '225X00000X'
};

const POPULAR_CITIES = new Set([
  'new york', 'los angeles', 'chicago', 'houston', 'phoenix', 'philadelphia',
  'san antonio', 'san diego', 'dallas', 'san jose', 'austin', 'jacksonville',
  'fort worth', 'columbus', 'charlotte', 'san francisco', 'indianapolis',
  'seattle', 'denver', 'washington', 'boston', 'el paso', 'nashville',
  'detroit', 'oklahoma city', 'portland', 'las vegas', 'memphis', 'louisville',
  'baltimore', 'milwaukee', 'albuquerque', 'tucson', 'fresno', 'sacramento',
  'mesa', 'kansas city', 'atlanta', 'omaha', 'colorado springs', 'raleigh',
  'miami', 'virginia beach', 'oakland', 'minneapolis', 'tulsa', 'tampa',
  'arlington', 'new orleans', 'wichita', 'bakersfield', 'cleveland', 'aurora',
  'anaheim', 'honolulu', 'santa ana', 'riverside', 'corpus christi', 'lexington',
  'henderson', 'stockton', 'saint paul', 'cincinnati', 'st louis', 'st. louis',
  'pittsburgh', 'greensboro', 'lincoln', 'anchorage', 'plano', 'orlando',
  'irvine', 'newark', 'durham', 'chula vista', 'toledo', 'fort wayne',
  'st petersburg', 'st. petersburg', 'laredo', 'jersey city', 'chandler',
  'madison', 'lubbock', 'scottsdale', 'reno', 'buffalo', 'gilbert',
  'glendale', 'north las vegas', 'winston-salem', 'chesapeake', 'norfolk',
  'fremont', 'garland', 'irving', 'hialeah', 'boise', 'richmond', 'spokane',
  'baton rouge', 'tacoma', 'san bernardino', 'modesto', 'des moines',
  'lindenhurst', 'league city', 'galveston', 'waukegan', 'brentwood'
]);

function normalizeAbbreviations(text) {
  if (!text) return '';
  const ABBREVIATIONS = {
    'ctr': 'center',
    'hosp': 'hospital',
    'med': 'medical',
    'assoc': 'associates',
    'grp': 'group',
    'dept': 'department',
    'div': 'division',
    'fac': 'facility',
    'cli': 'clinic',
    'surg': 'surgical',
    'peds': 'pediatrics',
    'fam': 'family'
  };
  
  return text.split(/\s+/).map(word => {
    const cleanWord = word.toLowerCase().replace(/[^a-z]/g, '');
    if (ABBREVIATIONS[cleanWord]) {
      const mapped = ABBREVIATIONS[cleanWord];
      if (word[0] === word[0].toUpperCase()) {
        return mapped.charAt(0).toUpperCase() + mapped.slice(1);
      }
      return mapped;
    }
    return word;
  }).join(' ');
}

function detectCity(text) {
  if (!text) return { city: null, cleanedText: text };
  const lower = text.toLowerCase();
  const cities = Array.from(POPULAR_CITIES).sort((a, b) => b.length - a.length);
  
  for (const city of cities) {
    const regex = new RegExp(`\\b${city}\\b`, 'i');
    if (regex.test(lower)) {
      const cleaned = text.replace(regex, '').replace(/\s+/g, ' ').trim();
      return { city: city.toUpperCase(), cleanedText: cleaned };
    }
  }
  return { city: null, cleanedText: text };
}

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

  // Normalize abbreviations (e.g. Med Ctr -> Medical Center)
  let normalizedRaw = normalizeAbbreviations(raw);
  normalizedRaw = expandNameSynonyms(normalizedRaw);

  // Normalize accents and diacritics (e.g. René -> Rene, Muñoz -> Munoz)
  normalizedRaw = normalizedRaw.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
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

function expandNameSynonyms(text) {
  if (!text) return '';
  return text
    .replace(/\bSt\.?\b/gi, (match, offset, str) => {
      const before = str.slice(0, offset).trim();
      const after = str.slice(offset + match.length).trim();
      // "Houston ST" or trailing state abbrev — leave alone
      if (!before && /^[A-Z]{0,2}(\s|$)/.test(after)) return match.toUpperCase();
      return match[0] === match[0].toUpperCase() ? 'Saint' : 'saint';
    })
    .replace(/\bMt\.?\b/gi, (m) => (m[0] === m[0].toUpperCase() ? 'Mount' : 'mount'))
    .replace(/\bFt\.?\b/gi, (m) => (m[0] === m[0].toUpperCase() ? 'Fort' : 'fort'))
    .replace(/\bMem\b/gi, (m) => (m[0] === m[0].toUpperCase() ? 'Memorial' : 'memorial'));
}

function parseCommaSeparatedName(text) {
  const match = text.match(/^([A-Za-z][A-Za-z'\-.]+)\s*,\s*(.+)$/);
  if (!match) return text;
  const lastName = match[1].trim();
  const firstPart = match[2].trim();
  return `${firstPart} ${lastName}`.replace(/\s+/g, ' ').trim();
}

function detectPostalCode(text) {
  if (!text) return { postalCode: null, cleanedText: text };
  const zipMatch = text.match(/\b(\d{5})(?:-\d{4})?\b/);
  if (!zipMatch) return { postalCode: null, cleanedText: text };
  const cleaned = text.replace(zipMatch[0], ' ').replace(/\s+/g, ' ').trim();
  return { postalCode: zipMatch[1], cleanedText: cleaned };
}

function buildMiddleWordQueries(cleanName) {
  const tokens = (cleanName || '').split(/\s+/).filter(Boolean);
  const queries = [];
  if (tokens.length < 3) return queries;

  for (let size = Math.min(3, tokens.length - 1); size >= 2; size--) {
    for (let start = 1; start <= tokens.length - size; start++) {
      const phrase = tokens.slice(start, start + size).join(' ');
      if (phrase && !queries.includes(phrase)) queries.push(phrase);
    }
  }
  return queries;
}

function looksLikePersonName(cleanName) {
  const tokens = (cleanName || '').split(/\s+/).filter(Boolean);
  if (tokens.length < 2 || tokens.length > 4) return false;
  const orgWords = new Set([
    'center', 'clinic', 'hospital', 'medical', 'health', 'surgical', 'surgery',
    'group', 'services', 'llc', 'inc', 'corp', 'foundation', 'institute',
  ]);
  return !tokens.some((token) => orgWords.has(token.toLowerCase()));
}

function buildStepDownQueries(cleanName) {
  const tokens = (cleanName || '').split(/\s+/).filter(Boolean);
  const queries = [];
  for (let i = tokens.length; i >= 1; i--) {
    queries.push(tokens.slice(0, i).join(' '));
  }
  return queries;
}

function escapeRegExp(str) {
  return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function getProviderFieldValues(provider) {
  const isOrg = provider.enumeration_type === 'NPI-2';
  const basic = provider.basic || {};
  const name = isOrg
    ? (basic.organization_name || '')
    : [basic.first_name, basic.middle_name, basic.last_name].filter(Boolean).join(' ');

  const formatAddress = (addrObj) => {
    if (!addrObj) return '';
    const street = [addrObj.address_1, addrObj.address_2].filter(Boolean).join(', ');
    return `${street}, ${addrObj.city || ''}, ${addrObj.state || ''} ${(addrObj.postal_code || '').substring(0, 5)}`.trim().replace(/\s+/g, ' ');
  };

  const locationAddr = provider.addresses?.find((a) => a.address_purpose === 'LOCATION') || provider.addresses?.[0];
  const mailingAddr = provider.addresses?.find((a) => a.address_purpose === 'MAILING');

  const officialName = isOrg
    ? [basic.authorized_official_name_prefix, basic.authorized_official_first_name, basic.authorized_official_last_name]
      .filter(Boolean).join(' ')
    : '';

  const specialty = (provider.taxonomies || []).map((t) => t.desc || '').join(' ');

  const otherNames = (provider.other_names || [])
    .map((entry) => {
      if (entry.organization_name) return entry.organization_name;
      return [entry.first_name, entry.last_name].filter(Boolean).join(' ');
    })
    .filter(Boolean)
    .join(' | ');

  return {
    name,
    practiceAddress: formatAddress(locationAddr),
    mailingAddress: formatAddress(mailingAddr),
    official: officialName,
    specialty,
    otherNames,
    npi: provider.number || '',
  };
}

const NPI_FIELD_LABELS = {
  name: 'Practitioner / Facility Name',
  practiceAddress: 'Practice Location',
  mailingAddress: 'Mailing Address',
  official: 'Authorized Official',
  specialty: 'Medical Specialty',
  otherNames: 'Alternate Name (DBA)',
  npi: 'NPI Number',
};

const NPI_FIELD_SCORE_WEIGHTS = {
  name: 50,
  otherNames: 45,
  official: 40,
  practiceAddress: 30,
  mailingAddress: 25,
  specialty: 20,
  npi: 15,
};

function scoreProviderRelevance(provider, searchPhrase, parsed = {}, analysis = null) {
  const phrase = (searchPhrase || '').trim().toLowerCase();
  if (!phrase) return 50;

  const terms = phrase.split(/\s+/).filter(Boolean);
  const fields = analysis?.fields || getProviderFieldValues(provider);
  const nameLower = (fields.name || '').toLowerCase();
  let score = 0;

  if (nameLower === phrase) score += 100;
  else if (nameLower.startsWith(phrase)) score += 80;
  else if (terms.length && terms.every((term) => nameLower.includes(term))) score += 65;
  else if (nameLower.includes(phrase)) score += 50;

  (analysis?.matchedFields || []).forEach((fieldKey) => {
    if (fieldKey !== 'name') score += NPI_FIELD_SCORE_WEIGHTS[fieldKey] || 10;
  });

  if (provider.basic?.status === 'A') score += 10;
  else score -= 15;

  const stateCode = parsed.stateCode || '';
  if (stateCode && fields.practiceAddress.toUpperCase().includes(stateCode)) score += 12;

  const postalCode = parsed.postalCode || '';
  if (postalCode && fields.practiceAddress.includes(postalCode)) score += 20;

  const city = (parsed.city || '').toLowerCase();
  if (city && fields.practiceAddress.toLowerCase().includes(city.toLowerCase())) score += 10;

  if (parsed.taxonomyCode && (provider.taxonomies || []).some((t) => t.code === parsed.taxonomyCode)) score += 8;

  return Math.min(100, Math.max(5, score));
}

function getMatchConfidenceLabel(score) {
  if (score >= 85) return { label: 'Excellent match', color: '#22c55e' };
  if (score >= 65) return { label: 'Good match', color: '#38bdf8' };
  if (score >= 45) return { label: 'Partial match', color: '#f59e0b' };
  return { label: 'Weak match', color: '#94a3b8' };
}

function rankNPIResults(results, searchPhrase, matchMeta, parsed = {}) {
  return (results || [])
    .map((provider) => {
      const analysis = matchMeta.get(provider.number) || analyzeProviderMatch(provider, searchPhrase);
      const score = scoreProviderRelevance(provider, searchPhrase, parsed, analysis);
      matchMeta.set(provider.number, { ...analysis, score });
      return { provider, score };
    })
    .sort((a, b) => b.score - a.score)
    .map(({ provider }) => provider);
}

const NPI_PAGE_SIZE = 20;

let npiSearchState = null;

const TYPO_REPLACEMENTS = {
  victoy: 'victory', victroy: 'victory',
  surgial: 'surgical', surgicl: 'surgical', surger: 'surgery',
  centre: 'center', centr: 'center', cntr: 'center',
  hospial: 'hospital', hosptal: 'hospital', medcal: 'medical',
  lke: 'lake', lk: 'lake', clinc: 'clinic', practce: 'practice',
  helth: 'health', helath: 'health', surical: 'surgical',
};

function generateTypoVariants(text) {
  if (!text || text.length < 3) return [];
  const variants = new Set();
  const lower = text.toLowerCase();

  text.split(/\s+/).forEach((word) => {
    const key = word.toLowerCase().replace(/[^a-z]/g, '');
    if (TYPO_REPLACEMENTS[key]) {
      variants.add(text.replace(new RegExp(`\\b${escapeRegExp(word)}\\b`, 'i'), TYPO_REPLACEMENTS[key]));
    }
  });

  const normalized = expandNameSynonyms(normalizeAbbreviations(text));
  if (normalized.toLowerCase() !== lower) variants.add(normalized);

  const stripped = stripTrailingGenericWords(text);
  if (stripped && stripped.toLowerCase() !== lower) variants.add(stripped);

  const deduped = text.replace(/([a-z])\1{2,}/gi, '$1');
  if (deduped.toLowerCase() !== lower) variants.add(deduped);

  return [...variants].filter((v) => v && v.toLowerCase() !== lower).slice(0, 6);
}

function getAddressGroupKey(provider) {
  const loc = provider.addresses?.find((a) => a.address_purpose === 'LOCATION') || provider.addresses?.[0];
  if (!loc) return `unknown-${provider.number}`;
  const street = (loc.address_1 || '').toLowerCase().replace(/\s+/g, ' ').trim();
  const city = (loc.city || '').toLowerCase();
  const state = (loc.state || '').toUpperCase();
  const zip = (loc.postal_code || '').substring(0, 5);
  if (!street && !city) return `unknown-${provider.number}`;
  return `${street}|${city}|${state}|${zip}`;
}

function buildResultGroups(providers) {
  const map = new Map();
  (providers || []).forEach((provider) => {
    const key = getAddressGroupKey(provider);
    if (!map.has(key)) {
      map.set(key, {
        key,
        address: getProviderFieldValues(provider).practiceAddress || 'Unknown location',
        providers: [],
      });
    }
    map.get(key).providers.push(provider);
  });

  return Array.from(map.values())
    .map((group) => ({
      ...group,
      providers: group.providers.sort((a, b) => {
        const aOrg = a.enumeration_type === 'NPI-2' ? 0 : 1;
        const bOrg = b.enumeration_type === 'NPI-2' ? 0 : 1;
        if (aOrg !== bOrg) return aOrg - bOrg;
        const aScore = npiSearchState?.matchMeta?.get(a.number)?.score || 0;
        const bScore = npiSearchState?.matchMeta?.get(b.number)?.score || 0;
        return bScore - aScore;
      }),
    }))
    .sort((a, b) => b.providers.length - a.providers.length);
}

function shouldRenderAsLocationGroup(group) {
  if (!group || group.providers.length < 2) return false;
  const individuals = group.providers.filter((p) => p.enumeration_type !== 'NPI-2');
  return individuals.length >= 2;
}

function finalizeSearchResults(results, searchPhrase, matchMeta, parsed = {}, pagination = null) {
  const ranked = rankNPIResults(results, searchPhrase, matchMeta, parsed);
  return {
    results: ranked,
    matchedPhrase: searchPhrase,
    matchMeta,
    totalResultCount: pagination?.totalCount || ranked.length,
    pagination,
  };
}

function analyzeProviderMatch(provider, searchPhrase) {
  const phrase = (searchPhrase || '').trim();
  if (!phrase) return { matches: true, matchedFields: [] };

  const terms = phrase.toLowerCase().split(/\s+/).filter(Boolean);
  const fields = getProviderFieldValues(provider);
  const matchedFields = [];
  const phraseLower = phrase.toLowerCase();

  for (const [key, value] of Object.entries(fields)) {
    if (!value) continue;
    const haystack = value.toLowerCase();
    if (haystack.includes(phraseLower) || terms.every((term) => haystack.includes(term))) {
      matchedFields.push(key);
    }
  }

  if (matchedFields.length === 0) {
    const combined = Object.values(fields).join(' ').toLowerCase();
    if (terms.every((term) => combined.includes(term))) {
      for (const [key, value] of Object.entries(fields)) {
        if (!value) continue;
        if (terms.some((term) => value.toLowerCase().includes(term))) {
          matchedFields.push(key);
        }
      }
    }
  }

  return { matches: matchedFields.length > 0, matchedFields, fields };
}

function filterProvidersBySearchPhrase(providers, searchPhrase) {
  const filtered = [];
  const matchMeta = new Map();

  (providers || []).forEach((provider) => {
    const analysis = analyzeProviderMatch(provider, searchPhrase);
    if (analysis.matches) {
      filtered.push(provider);
      matchMeta.set(provider.number, analysis);
    }
  });

  return { results: filtered, matchMeta };
}

function highlightNPIText(text, searchPhrase) {
  if (!text || !searchPhrase) return window.escapeHtml(text || '');

  const terms = [...new Set(
    searchPhrase.toLowerCase().split(/\s+/).filter((term) => term.length >= 2)
  )].sort((a, b) => b.length - a.length);

  let html = window.escapeHtml(text);
  terms.forEach((term) => {
    const re = new RegExp(`(${escapeRegExp(term)})`, 'gi');
    html = html.replace(re, '<span class="npi-match-highlight">$1</span>');
  });
  return html;
}

async function searchTier(queryStr, stateCode, { city = '', taxonomyCode = '' } = {}, skip = 0) {
  const requests = [
    executeNPISearch({ cleanName: queryStr, isOrg: true, city, taxonomyCode }, stateCode, { forceOrg: true, skip }),
  ];

  const practNames = extractPractitionerName(queryStr);
  if (practNames.lastName) {
    const indParsed = {
      firstName: practNames.firstName,
      lastName: practNames.lastName,
      isOrg: false,
      city,
      taxonomyCode,
    };
    requests.push(executeNPISearch(indParsed, stateCode, { skip }));
    if (practNames.firstName && practNames.lastName) {
      requests.push(executeNPISearch(indParsed, stateCode, { reverseName: true, skip }));
    }
  }

  const responses = await Promise.all(requests);
  const merged = mergeNPIResults(responses.map((res) => res.results || []));
  const totalCount = Math.max(0, ...responses.map((res) => Number(res.result_count) || 0), merged.length + skip);
  return { results: merged, totalCount };
}

async function trySearchPhrase(queryStr, stateCode, parsed, matchMeta, skip = 0) {
  const { results: rawResults, totalCount } = await searchTier(queryStr, stateCode, {
    city: parsed.city || '',
    taxonomyCode: parsed.taxonomyCode || '',
  }, skip);
  const { results, matchMeta: tierMeta } = filterProvidersBySearchPhrase(rawResults, queryStr);
  tierMeta.forEach((value, key) => matchMeta.set(key, value));
  if (!results.length) return null;

  const pagination = {
    queryStr,
    stateCode,
    parsed,
    skip,
    totalCount,
    hasMore: skip + rawResults.length < totalCount,
  };
  return finalizeSearchResults(results, queryStr, matchMeta, parsed, pagination);
}

async function executeAuthorizedOfficialSearch(cleanName, stateCode, parsed) {
  if (!looksLikePersonName(cleanName)) return null;
  const names = extractPractitionerName(cleanName);
  if (!names.lastName) return null;

  const params = new URLSearchParams();
  if (names.firstName) params.set('authorized_official_first_name', `${names.firstName}*`);
  params.set('authorized_official_last_name', `${names.lastName}*`);
  if (stateCode) params.set('state', stateCode);

  const res = await fetch(`/api/npi?${params.toString()}`);
  if (!res.ok) return null;

  const data = await res.json();
  const matchMeta = new Map();
  const { results, matchMeta: filteredMeta } = filterProvidersBySearchPhrase(data.results || [], cleanName);
  filteredMeta.forEach((value, key) => matchMeta.set(key, value));
  if (!results.length) return null;
  return finalizeSearchResults(results, cleanName, matchMeta, parsed);
}

async function executePostalCodeSearch(postalCode, stateCode, parsed) {
  if (!postalCode) return null;
  const data = await executeNPISearch(
    { cleanName: null, firstName: null, lastName: null, isOrg: false, postalCode, city: parsed.city || '', taxonomyCode: parsed.taxonomyCode || '' },
    stateCode,
    { forcePostal: true }
  );
  const matchMeta = new Map();
  const phrase = parsed.cleanName || postalCode;
  const { results, matchMeta: filteredMeta } = filterProvidersBySearchPhrase(data.results || [], phrase || postalCode);
  filteredMeta.forEach((value, key) => matchMeta.set(key, value));
  if (!results.length && data.results?.length) {
    data.results.forEach((provider) => {
      matchMeta.set(provider.number, analyzeProviderMatch(provider, postalCode));
    });
    return finalizeSearchResults(data.results, postalCode, matchMeta, parsed);
  }
  if (!results.length) return null;
  return finalizeSearchResults(results, phrase || postalCode, matchMeta, parsed);
}

async function executeTaxonomyLocationSearch(parsed, stateCode) {
  if (!parsed.taxonomyCode) return null;
  const data = await executeNPISearch(
    {
      cleanName: null,
      firstName: null,
      lastName: null,
      isOrg: false,
      city: parsed.city || '',
      taxonomyCode: parsed.taxonomyCode,
      postalCode: parsed.postalCode || '',
    },
    stateCode,
    { forceTaxonomy: true }
  );
  if (!data.results?.length) return null;
  const phrase = parsed.cleanName || parsed.city || 'specialty search';
  const matchMeta = new Map();
  const { results, matchMeta: filteredMeta } = filterProvidersBySearchPhrase(data.results, phrase);
  filteredMeta.forEach((value, key) => matchMeta.set(key, value));
  const finalResults = results.length ? results : data.results;
  finalResults.forEach((provider) => {
    if (!matchMeta.has(provider.number)) {
      matchMeta.set(provider.number, analyzeProviderMatch(provider, phrase));
    }
  });
  return finalizeSearchResults(finalResults, phrase, matchMeta, parsed);
}

async function executeFallbackSearches(parsed, stateCode, cleanName) {
  const fallbacks = [];

  buildMiddleWordQueries(cleanName).forEach((phrase) => {
    fallbacks.push({ fn: () => trySearchPhrase(phrase, stateCode, parsed, new Map()), phrase });
  });

  if (looksLikePersonName(cleanName)) {
    fallbacks.push({ fn: () => executeAuthorizedOfficialSearch(cleanName, stateCode, parsed), phrase: cleanName });
  }

  if (parsed.postalCode) {
    fallbacks.push({ fn: () => executePostalCodeSearch(parsed.postalCode, stateCode, parsed), phrase: parsed.postalCode });
  }

  if (parsed.taxonomyCode && (parsed.city || stateCode)) {
    fallbacks.push({ fn: () => executeTaxonomyLocationSearch(parsed, stateCode), phrase: parsed.cleanName || parsed.city || 'specialty' });
  }

  for (const fallback of fallbacks) {
    try {
      const result = await fallback.fn();
      if (result?.results?.length) return result;
    } catch (e) {
      console.warn(`NPI fallback search failed (${fallback.phrase}):`, e);
    }
  }

  return null;
}

async function executeSmartStepDownSearch(parsed, stateCode) {
  const cleanName = parsed?.cleanName || '';
  const city = parsed?.city || '';
  const taxonomyCode = parsed?.taxonomyCode || '';

  if (!cleanName && parsed?.postalCode) {
    return executePostalCodeSearch(parsed.postalCode, stateCode, parsed)
      || { results: [], matchedPhrase: parsed.postalCode, matchMeta: new Map() };
  }

  if (!cleanName && parsed?.taxonomyCode && (city || stateCode)) {
    return executeTaxonomyLocationSearch(parsed, stateCode)
      || { results: [], matchedPhrase: '', matchMeta: new Map() };
  }

  if (!cleanName) return { results: [], matchedPhrase: '', matchMeta: new Map() };

  const queries = buildStepDownQueries(cleanName);

  for (const queryStr of queries) {
    try {
      const matchMeta = new Map();
      const result = await trySearchPhrase(queryStr, stateCode, parsed, matchMeta);
      if (result?.results?.length) return result;
    } catch (e) {
      console.warn(`Smart step-down search failed for "${queryStr}":`, e);
    }
  }

  const tokens = cleanName.split(/\s+/).filter(Boolean);
  if (tokens.length === 1) {
    try {
      const cityResults = await executeNPISearch(
        { cleanName: null, firstName: null, lastName: null, isOrg: false, city: tokens[0], taxonomyCode },
        stateCode,
        { forceCity: true }
      );
      const matchMeta = new Map();
      const { results, matchMeta: filteredMeta } = filterProvidersBySearchPhrase(cityResults.results || [], tokens[0]);
      filteredMeta.forEach((value, key) => matchMeta.set(key, value));
      if (results.length) {
        return finalizeSearchResults(results, tokens[0], matchMeta, parsed);
      }
    } catch (e) {
      console.warn(`City fallback search failed for "${tokens[0]}":`, e);
    }
  }

  const fallbackResult = await executeFallbackSearches(parsed, stateCode, cleanName);
  if (fallbackResult?.results?.length) return fallbackResult;

  return { results: [], matchedPhrase: cleanName, matchMeta: new Map() };
}

async function executeStructuredNPISearch(structured, dropdownState) {
  const stateCode = dropdownState || structured.stateCode || '';
  const resultSets = [];
  const matchMetaMaps = [];
  let matchedPhrase = '';
  let pagination = null;
  let totalResultCount = 0;

  if (structured.npiNumber) {
    const npiData = await executeNPISearch(
      { npiNumber: structured.npiNumber, cleanName: null, firstName: null, lastName: null, isOrg: false, stateCode: null },
      stateCode
    );
    if (npiData.results?.length) {
      return { ...npiData, matchedPhrase: structured.npiNumber, matchMeta: new Map() };
    }
  }

  if (structured.practitioner) {
    const parsed = parseNPIQuery(structured.practitioner);
    if (parsed?.npiNumber) {
      const npiData = await executeNPISearch(parsed, stateCode);
      if (npiData.results?.length) {
        return { ...npiData, matchedPhrase: parsed.npiNumber, matchMeta: new Map() };
      }
    }
    if (parsed?.cleanName || parsed?.lastName) {
      const practData = await executeSmartStepDownSearch(parsed, stateCode);
      if (practData.results?.length) {
        resultSets.push(practData.results);
        matchMetaMaps.push(practData.matchMeta);
        matchedPhrase = matchedPhrase || practData.matchedPhrase;
        if (practData.pagination) pagination = practData.pagination;
        totalResultCount = Math.max(totalResultCount, practData.totalResultCount || practData.results.length);
      }
    }
  }

  if (structured.facility) {
    const parsed = parseNPIQuery(structured.facility);
    if (parsed?.cleanName) {
      const facData = await executeSmartStepDownSearch(parsed, stateCode);
      if (facData.results?.length) {
        resultSets.push(facData.results);
        matchMetaMaps.push(facData.matchMeta);
        matchedPhrase = matchedPhrase || facData.matchedPhrase;
        if (!pagination && facData.pagination) pagination = facData.pagination;
        totalResultCount = Math.max(totalResultCount, facData.totalResultCount || facData.results.length);
      }
    }
  }

  const merged = mergeNPIResults(resultSets);
  const combinedMeta = new Map();
  matchMetaMaps.forEach((map) => {
    map.forEach((value, key) => combinedMeta.set(key, value));
  });

  const ranked = rankNPIResults(merged, matchedPhrase || structured.facility || structured.practitioner || '', combinedMeta, {});
  return {
    results: ranked,
    matchedPhrase,
    matchMeta: combinedMeta,
    totalResultCount: totalResultCount || ranked.length,
    pagination,
  };
}

async function executeDualNPISearch(parsed, dropdownState, rawQuery = '') {
  if (parsed.npiNumber) {
    const data = await executeNPISearch(parsed, dropdownState);
    return { ...data, matchedPhrase: parsed.npiNumber, matchMeta: new Map(), totalResultCount: data.results?.length || 0 };
  }

  const stateCode = dropdownState || parsed.stateCode || '';
  let data = await executeSmartStepDownSearch(parsed, stateCode);

  if (!data.results?.length && (parsed.cleanName || rawQuery)) {
    const variants = generateTypoVariants(parsed.cleanName || rawQuery);
    for (const variant of variants) {
      const retry = await executeSmartStepDownSearch({ ...parsed, cleanName: variant }, stateCode);
      if (retry.results?.length) {
        return { ...retry, typoSuggestion: variant, originalQuery: rawQuery || parsed.cleanName };
      }
    }
  }

  return data;
}

/* ─────────────────────────────────────────────────────────────────────────
 *  parseNPIQuery  — Smart Query Parser
 *  Handles all edge cases: noise words, credentials, specialties,
 *  honorific titles, US state detection, org vs individual detection,
 *  punctuation stripping, and embedded NPI numbers.
 * ────────────────────────────────────────────────────────────────────────*/
function parseNPIQuery(raw) {
  if (!raw || !raw.trim()) return null;

  // Normalize abbreviations (e.g. Med Ctr -> Medical Center)
  let normalizedRaw = normalizeAbbreviations(raw);
  normalizedRaw = expandNameSynonyms(normalizedRaw);
  normalizedRaw = parseCommaSeparatedName(normalizedRaw);

  // Normalize accents and diacritics (e.g. René -> Rene, Muñoz -> Munoz)
  normalizedRaw = normalizedRaw.normalize("NFD").replace(/[\u0300-\u036f]/g, "");

  // ── 1. Extract any 10-digit NPI number embedded anywhere in input ──
  const npiMatch = normalizedRaw.match(/\b(\d{10})\b/);
  if (npiMatch) {
    return {
      npiNumber: npiMatch[1], cleanName: null, firstName: null, lastName: null,
      isOrg: false, stateCode: null, city: null, taxonomyCode: null, postalCode: null,
    };
  }

  // 1b. Extract ZIP / postal code
  const postalResult = detectPostalCode(normalizedRaw);
  const postalCode = postalResult.postalCode;
  normalizedRaw = postalResult.cleanedText;

  // 2. Detect and extract City
  const cityResult = detectCity(normalizedRaw);
  const city = cityResult.city;
  let input = cityResult.cleanedText;

  // 3. Detect and extract Taxonomy (Specialty) Code
  let taxonomyCode = null;
  let lowerInput = input.toLowerCase();
  for (const [key, code] of Object.entries(TAXONOMY_MAP)) {
    const regex = new RegExp(`\\b${key}\\b`, 'i');
    if (regex.test(lowerInput)) {
      taxonomyCode = code;
      // Strip taxonomy keyword from name input to clean it
      input = input.replace(regex, ' ');
      break;
    }
  }

  // ── 4. Normalize: collapse dotted credentials (m.d.→md, r.n.→rn) BEFORE stripping punctuation ──
  input = input.replace(/\b([a-zA-Z])\.([a-zA-Z])\.?\b/g, '$1$2');
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

  return {
    npiNumber: null, cleanName, firstName, lastName, isOrg, stateCode, city, taxonomyCode, postalCode,
  };
}


/* ─────────────────────────────────────────────────────────────────────────
 *  executeNPISearch — Builds URL and fetches from NPPES via proxy
 * ────────────────────────────────────────────────────────────────────────*/
async function executeNPISearch(parsed, dropdownState, { forceOrg = false, reverseName = false, forceCity = false, forcePostal = false, forceTaxonomy = false, skip = 0 } = {}) {
  if (!parsed) return { results: [] };

  // Dropdown state always wins over detected state
  const stateCode = dropdownState || parsed.stateCode || '';
  const city = parsed.city || '';
  const taxonomyCode = parsed.taxonomyCode || '';
  const postalCode = parsed.postalCode || '';

  let url = '/api/npi?';
  if (skip > 0) url += `skip=${skip}&`;

  if (parsed.npiNumber) {
    url += `number=${parsed.npiNumber}`;
  } else if (forcePostal && postalCode) {
    url += `postal_code=${encodeURIComponent(postalCode)}`;
    if (stateCode)    url += `&state=${encodeURIComponent(stateCode)}`;
    if (city)         url += `&city=${encodeURIComponent(city)}`;
    if (taxonomyCode) url += `&taxonomy_code=${encodeURIComponent(taxonomyCode)}`;
  } else if (forceTaxonomy && taxonomyCode) {
    url += `taxonomy_code=${encodeURIComponent(taxonomyCode)}`;
    if (stateCode)    url += `&state=${encodeURIComponent(stateCode)}`;
    if (city)         url += `&city=${encodeURIComponent(city)}*`;
    if (postalCode)   url += `&postal_code=${encodeURIComponent(postalCode)}`;
  } else if (forceCity && city) {
    url += `city=${encodeURIComponent(city)}*`;
    if (stateCode)    url += `&state=${encodeURIComponent(stateCode)}`;
    if (taxonomyCode) url += `&taxonomy_code=${encodeURIComponent(taxonomyCode)}`;
    if (postalCode)   url += `&postal_code=${encodeURIComponent(postalCode)}`;
  } else if (forceOrg || parsed.isOrg) {
    const orgQuery = parsed.cleanName || '';
    if (!orgQuery) return { results: [] };
    url += `organization_name=${encodeURIComponent(orgQuery)}*`;
    if (stateCode)    url += `&state=${encodeURIComponent(stateCode)}`;
    if (city)         url += `&city=${encodeURIComponent(city)}`;
    if (taxonomyCode) url += `&taxonomy_code=${encodeURIComponent(taxonomyCode)}`;
    if (postalCode)   url += `&postal_code=${encodeURIComponent(postalCode)}`;
  } else if (parsed.firstName && parsed.lastName) {
    const fn = reverseName ? parsed.lastName  : parsed.firstName;
    const ln = reverseName ? parsed.firstName : parsed.lastName;
    url += `first_name=${encodeURIComponent(fn)}*&last_name=${encodeURIComponent(ln)}*`;
    if (stateCode)    url += `&state=${encodeURIComponent(stateCode)}`;
    if (city)         url += `&city=${encodeURIComponent(city)}`;
    if (taxonomyCode) url += `&taxonomy_code=${encodeURIComponent(taxonomyCode)}`;
    if (postalCode)   url += `&postal_code=${encodeURIComponent(postalCode)}`;
  } else if (parsed.lastName) {
    // Single-token: search as last name
    url += `last_name=${encodeURIComponent(parsed.lastName)}*`;
    if (stateCode)    url += `&state=${encodeURIComponent(stateCode)}`;
    if (city)         url += `&city=${encodeURIComponent(city)}`;
    if (taxonomyCode) url += `&taxonomy_code=${encodeURIComponent(taxonomyCode)}`;
    if (postalCode)   url += `&postal_code=${encodeURIComponent(postalCode)}`;
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

  if (rawQuery.length < 2 && !/^\d{10}$/.test(rawQuery.replace(/\D/g, ''))) {
    resultsEl.innerHTML = '<p class="status-msg">Please enter at least 2 characters or a 10-digit NPI.</p>';
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
    let data = { results: [], matchedPhrase: '', matchMeta: new Map() };
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
          data = await executeDualNPISearch(parsedFree, dropdownState || structured.stateCode, structured.freeText);
        }
      }
    } else {
      const parsed = parseNPIQuery(rawQuery);
      if (!parsed || (!parsed.npiNumber && !parsed.cleanName && !parsed.postalCode && !(parsed.taxonomyCode && (parsed.city || parsed.stateCode || dropdownState)))) {
        resultsEl.innerHTML = `
          <div class="status-msg">
            Could not extract a valid provider name or NPI from <strong>"${window.escapeHtml(rawQuery)}"</strong>.
            <br><small>Try: "John Smith", "Victory Lakes Surgical Center", "Practitioner: Christal Smith", or a 10-digit NPI.</small>
          </div>`;
        return;
      }

      data = await executeDualNPISearch(parsed, dropdownState, rawQuery);
      searchLabel = parsed.npiNumber
        ? `NPI ${parsed.npiNumber}`
        : parsed.postalCode && !parsed.cleanName
          ? `ZIP ${parsed.postalCode}`
          : (parsed.cleanName || rawQuery);
    }

    if (data.results && data.results.length > 0) {
      const matchedPhrase = data.matchedPhrase || searchLabel || rawQuery;
      let matchNote = '';
      if (!data.typoSuggestion && matchedPhrase && matchedPhrase !== rawQuery) {
        const rawLower = rawQuery.toLowerCase();
        const phraseLower = matchedPhrase.toLowerCase();
        if (rawLower.startsWith(phraseLower) || rawLower.includes(phraseLower)) {
          matchNote = `<p style="font-size:12px;color:var(--text-muted);text-align:center;margin-bottom:8px;">Matched using <strong style="color:var(--text-h);">"${window.escapeHtml(matchedPhrase)}"</strong> (step-down from your search)</p>`;
        } else {
          matchNote = `<p style="font-size:12px;color:var(--text-muted);text-align:center;margin-bottom:8px;">Matched using <strong style="color:var(--text-h);">"${window.escapeHtml(matchedPhrase)}"</strong> (smart fallback)</p>`;
        }
      }
      const countNote = searchLabel
        ? `<p style="font-size:12px;color:var(--text-muted);text-align:center;margin-bottom:16px;">Showing results for ${window.escapeHtml(searchLabel)}</p>`
        : '';
      displayNPISearchResults(data, {
        rawQuery,
        searchLabel,
        prefixHtml: `${matchNote}${countNote}`,
      });
      return;
    }

    const displayName = searchLabel || rawQuery;
    const typoVariants = generateTypoVariants(parseNPIQuery(rawQuery)?.cleanName || rawQuery);
    const typoHint = typoVariants.length
      ? `<br><small>Try checking spelling${typoVariants[0] ? ` — did you mean <button type="button" class="npi-typo-link" data-query="${String(typoVariants[0]).replace(/"/g, '&quot;')}" style="all:unset;cursor:pointer;color:var(--accent);font-weight:700;text-decoration:underline;">${window.escapeHtml(typoVariants[0])}</button>?` : ''}</small>`
      : '';
    resultsEl.innerHTML = `
      <div class="status-msg">
        No providers found for "<strong>${window.escapeHtml(displayName)}</strong>"${dropdownState ? ` in ${dropdownState}` : ''}.
        ${typoHint}
        <br><small>Check spelling, try a single field (Practitioner, Facility, or NPI), or search by 10-digit NPI number.</small>
      </div>`;
    resultsEl.querySelector('.npi-typo-link')?.addEventListener('click', (e) => {
      nameInput.value = e.currentTarget.dataset.query;
      searchNPI();
    });
    return;

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


function buildNPIResultsSummaryPrefix(state) {
  const shown = Math.min(state.displayedCount, state.allResults.length);
  const total = state.totalResultCount || state.allResults.length;
  return `<p style="font-size:12px;color:var(--text-muted);text-align:center;margin-bottom:16px;">Showing ${shown} of ${total} ranked result${total === 1 ? '' : 's'}</p>`;
}

function displayNPISearchResults(data, { rawQuery, searchLabel, prefixHtml = '' }) {
  const resultsEl = document.getElementById('npi-results');
  if (!resultsEl) return;

  const matchedPhrase = data.matchedPhrase || searchLabel || rawQuery;
  npiSearchState = {
    allResults: data.results || [],
    displayedCount: Math.min(NPI_PAGE_SIZE, (data.results || []).length),
    totalResultCount: data.totalResultCount || (data.results || []).length,
    matchedPhrase,
    matchMeta: data.matchMeta || new Map(),
    searchLabel,
    rawQuery,
    typoSuggestion: data.typoSuggestion || null,
    originalQuery: data.originalQuery || rawQuery,
    pagination: data.pagination || null,
  };

  let typoNote = '';
  if (data.typoSuggestion) {
    typoNote = `<p style="font-size:12px;color:#f59e0b;text-align:center;margin-bottom:8px;">No exact match for "<strong>${window.escapeHtml(data.originalQuery || rawQuery)}</strong>" — showing results for "<strong>${window.escapeHtml(data.typoSuggestion)}</strong>"</p>`;
  }

  renderNPIResults(npiSearchState.allResults, resultsEl, `${typoNote}${prefixHtml}${buildNPIResultsSummaryPrefix(npiSearchState)}`, {
    searchPhrase: matchedPhrase,
    matchMeta: npiSearchState.matchMeta,
    displayedCount: npiSearchState.displayedCount,
    totalResultCount: npiSearchState.totalResultCount,
  });
}

async function loadMoreNPIResults() {
  if (!npiSearchState) return;
  const resultsEl = document.getElementById('npi-results');
  const btn = document.getElementById('npi-load-more-btn');
  if (btn) btn.disabled = true;

  try {
    const state = npiSearchState;
    const { allResults, displayedCount, pagination, matchedPhrase, matchMeta } = state;

    if (displayedCount < allResults.length) {
      state.displayedCount = Math.min(displayedCount + NPI_PAGE_SIZE, allResults.length);
    } else if (pagination?.hasMore) {
      const nextSkip = (pagination.skip || 0) + NPI_PAGE_SIZE;
      const nextPage = await trySearchPhrase(
        pagination.queryStr,
        pagination.stateCode,
        pagination.parsed,
        new Map(),
        nextSkip
      );
      if (nextPage?.results?.length) {
        const merged = mergeNPIResults([allResults, nextPage.results]);
        nextPage.matchMeta.forEach((value, key) => matchMeta.set(key, value));
        state.allResults = rankNPIResults(merged, matchedPhrase, matchMeta, pagination.parsed || {});
        state.displayedCount = state.allResults.length;
        state.pagination = nextPage.pagination;
        state.totalResultCount = nextPage.totalResultCount;
      } else {
        state.pagination = { ...pagination, hasMore: false };
        state.displayedCount = Math.min(displayedCount + NPI_PAGE_SIZE, allResults.length);
      }
    }

    const prefixParts = [];
    if (state.typoSuggestion) {
      prefixParts.push(`<p style="font-size:12px;color:#f59e0b;text-align:center;margin-bottom:8px;">Showing results for "<strong>${window.escapeHtml(state.typoSuggestion)}</strong>"</p>`);
    }
    prefixParts.push(buildNPIResultsSummaryPrefix(state));

    renderNPIResults(state.allResults, resultsEl, prefixParts.join(''), {
      searchPhrase: state.matchedPhrase,
      matchMeta: state.matchMeta,
      displayedCount: state.displayedCount,
      totalResultCount: state.totalResultCount,
    });
  } catch (err) {
    console.error('Load more NPI results failed:', err);
  } finally {
    if (btn) btn.disabled = false;
  }
}


function renderNPIResults(results, container, prefixHtml = '', { searchPhrase = '', matchMeta = new Map(), displayedCount = null, totalResultCount = null } = {}) {
  // Helper to convert names to Title Case
  const toTitleCase = (str) => {
    if (!str) return '';
    return str.toLowerCase().split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
  };

  const renderField = (text, fieldKey, providerNumber) => {
    const analysis = matchMeta.get(providerNumber) || analyzeProviderMatch(
      results.find((item) => item.number === providerNumber),
      searchPhrase
    );
    const shouldHighlight = analysis.matchedFields?.includes(fieldKey);
    return shouldHighlight ? highlightNPIText(text, searchPhrase) : window.escapeHtml(text);
  };

  const renderMatchReasons = (providerNumber) => {
    const analysis = matchMeta.get(providerNumber) || analyzeProviderMatch(
      results.find((item) => item.number === providerNumber),
      searchPhrase
    );
    if (!searchPhrase && analysis.score == null) return '';

    const labels = (analysis.matchedFields || []).map((field) => NPI_FIELD_LABELS[field] || field);
    const confidence = analysis.score != null ? getMatchConfidenceLabel(analysis.score) : null;

    if (!labels.length && !confidence) return '';

    return `
      <div class="npi-match-reasons" style="display:flex; flex-wrap:wrap; gap:6px; margin-bottom:14px; align-items:center;">
        ${confidence ? `
          <span style="font-size:11px; font-weight:800; color:${confidence.color}; background:rgba(255,255,255,0.04); border:1px solid ${confidence.color}; padding:3px 8px; border-radius:999px;">
            ${confidence.label} · ${analysis.score}%
          </span>` : ''}
        ${labels.map((label) => `
          <span style="font-size:11px; font-weight:700; color:#ef4444; background:rgba(239,68,68,0.1); border:1px solid rgba(239,68,68,0.25); padding:3px 8px; border-radius:999px;">
            Matched in ${window.escapeHtml(label)}
          </span>
        `).join('')}
      </div>`;
  };

  const buildProviderCard = (p, { compact = false } = {}) => {
    const isOrg = p.enumeration_type === 'NPI-2';
    const typeLabel = isOrg ? 'Organization' : 'Individual';
    const typeClass = isOrg ? 'badge-org' : 'badge-indiv';

    const name = isOrg
      ? (p.basic.organization_name || 'Organization')
      : `${p.basic.first_name || ''} ${p.basic.middle_name ? p.basic.middle_name + ' ' : ''}${p.basic.last_name || ''}`.trim();

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

    const formatAddress = (addrObj) => {
      if (!addrObj) return '';
      const street = [addrObj.address_1, addrObj.address_2].filter(Boolean).join(', ');
      return `${street}, ${addrObj.city || ''}, ${addrObj.state || ''} ${(addrObj.postal_code || '').substring(0, 5)}`.trim().replace(/\s+/g, ' ');
    };

    const locationAddr = p.addresses?.find((a) => a.address_purpose === 'LOCATION') || p.addresses?.[0];
    const mailingAddr = p.addresses?.find((a) => a.address_purpose === 'MAILING');

    const addressLine = locationAddr ? formatAddress(locationAddr) : 'Address details unavailable';
    const mailingLine = mailingAddr ? formatAddress(mailingAddr) : null;
    const showMailing = !compact && mailingLine && mailingLine !== addressLine;

    const mapsUrl = locationAddr ? `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(addressLine)}` : '#';
    const status = p.basic.status === 'A' ? '✓ Active' : '⚠ Inactive';
    const statusColor = p.basic.status === 'A' ? 'var(--success)' : 'var(--warning)';

    const copyText = `${name} | NPI: ${p.number} | ${taxonomy} | Practice: ${addressLine}${showMailing ? ' | Mailing: ' + mailingLine : ''}${officialName ? ' | Official : ' + officialName : ''}`;
    const escapedCopyText = window.escapeHtml(copyText);
    const cardPadding = compact ? '16px' : '28px';
    const nameSize = compact ? '18px' : '22px';

    return `
      <div class="result-card npi-card ${compact ? 'npi-card-compact' : ''}" style="border-left: 5px solid var(--accent); padding: ${cardPadding}; background: var(--bg-card); border-radius: 16px; margin-bottom: ${compact ? '12px' : '24px'}; box-shadow: 0 8px 32px rgba(0,0,0,0.25);">
        <div class="npi-top-bar" style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--border); padding-bottom: 14px; margin-bottom: 16px; flex-wrap: wrap; gap: 12px;">
          <div style="display: flex; align-items: center; gap: 8px;">
            <div class="npi-type-badge ${typeClass}" style="margin-bottom: 0;">${typeLabel}</div>
            <span class="npi-status" style="color:${statusColor}; font-size: 13px; font-weight: 700;">${status}</span>
          </div>
          <div style="display: flex; align-items: center; gap: 10px;">
            <span style="font-family: monospace; font-size: 14px; font-weight: 800; color: var(--accent); background: rgba(var(--accent-rgb), 0.12); padding: 5px 12px; border-radius: 8px; border: 1.5px solid rgba(var(--accent-rgb), 0.35);">
              NPI: ${renderField(String(p.number), 'npi', p.number)}
            </span>
            <button class="npi-copy-btn" data-details="${escapedCopyText}" title="Copy details" style="background: rgba(255,255,255,0.05); border: 1px solid var(--border); border-radius: 8px; width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; cursor: pointer; color: var(--text-muted); transition: var(--transition);">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg>
            </button>
          </div>
        </div>

        ${compact ? '' : renderMatchReasons(p.number)}

        <div style="margin-bottom: 16px;">
          <div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--text-muted); letter-spacing: 0.08em; margin-bottom: 4px;">
            ${isOrg ? 'Facility / Organization' : 'Practitioner Name'}
          </div>
          <h3 class="npi-name-heading" style="font-size: ${nameSize}; font-weight: 900; color: var(--text-h); margin: 0; line-height: 1.3;">
            ${renderField(toTitleCase(name), 'name', p.number)}
            ${credential ? `<span class="npi-credential" style="font-size: 12px; margin-left: 8px; vertical-align: middle;">${window.escapeHtml(credential)}</span>` : ''}
          </h3>
          ${compact ? `<div style="font-size:13px;color:var(--text-muted);margin-top:6px;">${renderField(taxonomy, 'specialty', p.number)}</div>` : ''}
        </div>

        ${!compact && !isOrg ? `<div class="npi-affiliated-org" data-first="${window.escapeHtml(p.basic.first_name || '')}" data-last="${window.escapeHtml(p.basic.last_name || '')}" style="display:none; margin-bottom:16px;">
          <div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--text-muted); letter-spacing: 0.08em; margin-bottom: 4px;">Affiliated Facility</div>
          <div class="npi-affiliated-org-name" style="font-size: 15px; font-weight: 800; color: var(--text-h);"></div>
        </div>` : ''}

        ${!compact && officialName ? `
        <div style="background: rgba(var(--amber-rgb), 0.05); border: 1px solid rgba(var(--amber-rgb), 0.22); border-radius: 12px; padding: 14px 18px; margin-bottom: 16px;">
          <div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--expert-amber); letter-spacing: 0.08em; margin-bottom: 4px;">Authorized Official</div>
          <div style="font-size: 15px; font-weight: 800; color: var(--text-h);">${renderField(officialName, 'official', p.number)}</div>
          ${officialDisplayTitle ? `<div style="font-size: 12.5px; color: var(--text-muted); margin-top: 2px; font-weight: 500;">${window.escapeHtml(officialDisplayTitle)}</div>` : ''}
        </div>` : ''}

        ${compact ? '' : `
        <div style="background: rgba(var(--accent-rgb), 0.05); border: 1px solid rgba(var(--accent-rgb), 0.2); border-radius: 12px; padding: 14px 18px; margin-bottom: 16px;">
          <div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--accent); letter-spacing: 0.08em; margin-bottom: 4px;">Medical Specialty</div>
          <div style="font-size: 14.5px; font-weight: 700; color: var(--text-h);">${renderField(taxonomy, 'specialty', p.number)}</div>
        </div>`}

        <div style="display: flex; justify-content: space-between; align-items: flex-end; flex-wrap: wrap; gap: 16px; margin-top: 8px;">
          <div style="flex: 1; min-width: 250px;">
            ${compact ? '' : `<div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--text-muted); letter-spacing: 0.08em; margin-bottom: 4px;">Practice Location (Physical)</div>`}
            <div style="display: flex; gap: 8px; align-items: flex-start; color: var(--text-body); font-size: 14px; line-height: 1.5; margin-bottom: ${showMailing ? '12px' : '0'};">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="margin-top: 2px; flex-shrink: 0;"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
              <span>${renderField(addressLine, 'practiceAddress', p.number)}</span>
            </div>
            ${showMailing ? `
            <div style="font-size: 11px; text-transform: uppercase; font-weight: 800; color: var(--text-muted); letter-spacing: 0.08em; margin-bottom: 4px;">Mailing Address</div>
            <div style="display: flex; gap: 8px; align-items: flex-start; color: var(--text-body); font-size: 14px; line-height: 1.5;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="margin-top: 2px; flex-shrink: 0;"><rect x="2" y="4" width="20" height="16" rx="2"></rect><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"></path></svg>
              <span>${renderField(mailingLine, 'mailingAddress', p.number)}</span>
            </div>` : ''}
          </div>
          ${!compact && mapsUrl !== '#' ? `
            <a href="${mapsUrl}" target="_blank" rel="noopener" class="btn-location" style="display: inline-flex; align-items: center; gap: 6px; padding: 10px 18px; border-radius: 8px; font-weight: 700; font-size: 13.5px; text-decoration: none; border: 1px solid var(--border); transition: all 0.2s;">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
              View Location
            </a>` : ''}
        </div>
      </div>
    `;
  };

  const visibleResults = displayedCount != null ? results.slice(0, displayedCount) : results;
  const groups = buildResultGroups(visibleResults);
  let bodyHtml = '';

  groups.forEach((group) => {
    if (shouldRenderAsLocationGroup(group)) {
      const individuals = group.providers.filter((p) => p.enumeration_type !== 'NPI-2');
      const orgs = group.providers.filter((p) => p.enumeration_type === 'NPI-2');
      bodyHtml += `
        <div class="npi-location-group" style="margin-bottom: 24px; border: 1px solid var(--border); border-radius: 16px; overflow: hidden; background: rgba(255,255,255,0.02);">
          <button type="button" class="npi-group-toggle" aria-expanded="true" style="width:100%; text-align:left; background: rgba(var(--accent-rgb), 0.08); border:0; border-bottom:1px solid var(--border); padding:16px 20px; cursor:pointer; color:var(--text-h);">
            <div style="font-size:13px; font-weight:800; color:var(--accent); margin-bottom:4px;">${individuals.length} Practitioners at this location</div>
            <div class="npi-group-address" style="font-size:14px; color:var(--text-body); line-height:1.5;">${window.escapeHtml(group.address)}</div>
          </button>
          <div class="npi-group-body" style="padding:16px 16px 4px;">
            ${orgs.map((p) => buildProviderCard(p)).join('')}
            ${individuals.map((p) => buildProviderCard(p, { compact: true })).join('')}
          </div>
        </div>`;
    } else {
      group.providers.forEach((p) => { bodyHtml += buildProviderCard(p); });
    }
  });

  const shown = visibleResults.length;
  const total = totalResultCount || results.length;
  const hasCachedMore = displayedCount != null && displayedCount < results.length;
  const hasRemoteMore = npiSearchState?.pagination?.hasMore && shown >= results.length;
  const showLoadMore = hasCachedMore || hasRemoteMore || shown < total;
  const remaining = Math.max(0, total - shown);

  const loadMoreHtml = showLoadMore ? `
    <div style="text-align:center; margin-top: 8px; margin-bottom: 24px;">
      <button id="npi-load-more-btn" type="button" class="btn btn-ghost" onclick="loadMoreNPIResults()" style="padding: 12px 28px; font-weight: 700; border-radius: 10px;">
        Show more results${remaining ? ` (${remaining} remaining)` : ''}
      </button>
    </div>` : '';

  container.innerHTML = prefixHtml + bodyHtml + loadMoreHtml;

  // Collapsible location groups
  container.querySelectorAll('.npi-group-toggle').forEach((toggle) => {
    toggle.onclick = () => {
      const body = toggle.nextElementSibling;
      const expanded = toggle.getAttribute('aria-expanded') === 'true';
      toggle.setAttribute('aria-expanded', expanded ? 'false' : 'true');
      if (body) body.style.display = expanded ? 'none' : 'block';
    };
  });

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

// Global hooks
window.searchNPI = searchNPI;
window.loadMoreNPIResults = loadMoreNPIResults;

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
