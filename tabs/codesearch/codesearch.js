let currentFilter = 'ALL';
let currentRegion = 'ALL'; // Search all regions; badges on results show US/UK/ME availability
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

// AMA-deleted / replaced CPT codes (show replacement + history)
const DELETED_CODE_REPLACEMENTS = {
  '43272': {
    replacement: '43278',
    reason: 'Deleted by the AMA — this ERCP-related code was replaced.',
  },
};

const SEARCH_STOP_WORDS = new Set([
  'cpt', 'icd', 'icd10', 'icd-10', 'icd10-cm', 'icd10-pcs', 'hcpcs', 'drg',
  'code', 'codes', 'lookup', 'search', 'find', 'free', 'online', 'description',
  'what', 'is', 'the', 'for', 'a', 'an', 'of', 'in', 'to', 'how', 'do', 'i',
  'my', 'bill', 'billing', 'medical', 'procedure', 'diagnosis', 'meaning',
  'define', 'definition', 'explain', 'show', 'me', 'tell', 'about', 'get',
  'number', 'no', 'num', 'tool', 'instantly', 'verify', 'check', 'list',
]);

const TERMINOLOGY_SYNONYMS = {
  mri: ['magnetic', 'resonance'],
  ekg: ['electrocardiogram', 'ecg'],
  ecg: ['electrocardiogram'],
  pap: ['cervical', 'cytology', 'smear'],
  flu: ['influenza', 'vaccine', 'vaccination'],
  ercp: ['endoscopic', 'retrograde', 'cholangiopancreatography'],
  cholecystectomy: ['gallbladder', 'removal'],
  laparoscopic: ['laparoscopy', 'minimally', 'invasive'],
};

const CATEGORY_PREFIX_RE = /^(icd[- ]?10(?:[- ]?(?:cm|pcs))?|icd|hcpcs|drg|cpt(?:[- ]?(?:code|codes))?)\s+/i;
const MIN_NUMERIC_SEARCH_LEN = 3;

function normalizeBillLineText(text) {
  return String(text || '')
    .replace(/\$\s*[\d,]+\.?\d*/g, ' ')
    .replace(/\b\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\b/g, ' ')
    .replace(/\b\d{4}[\/\-]\d{1,2}[\/\-]\d{1,2}\b/g, ' ')
    .replace(/\b(qty|quantity|units?|amt|amount|total|balance|paid|charge[s]?)\s*:?\s*/gi, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

function expandWildcardToken(token) {
  if (!token) return { base: token, isWildcard: false, prefix: null };
  const upper = token.toUpperCase().trim();

  const icdDotWild = upper.match(/^([A-TV-Z]\d{2})\.X$/);
  if (icdDotWild) return { base: `${icdDotWild[1]}.`, isWildcard: true, prefix: `${icdDotWild[1]}.` };

  const icdWild = upper.match(/^([A-TV-Z]\d{2})X$/);
  if (icdWild) return { base: icdWild[1], isWildcard: true, prefix: icdWild[1] };

  const numDotWild = upper.match(/^(\d{2,4})\.X$/);
  if (numDotWild) return { base: `${numDotWild[1]}.`, isWildcard: true, prefix: `${numDotWild[1]}.` };

  const numWild = upper.match(/^(\d{2,4})X$/);
  if (numWild) return { base: numWild[1], isWildcard: true, prefix: numWild[1] };

  const xxxWild = upper.match(/^(\d{2,3})X{2,}$/);
  if (xxxWild) return { base: xxxWild[1], isWildcard: true, prefix: xxxWild[1] };

  return { base: upper, isWildcard: false, prefix: null };
}

function validateSearchQuery(parsed, query) {
  const trimmed = (query || '').trim();
  if (trimmed.length < 2) {
    return { ok: false, message: 'Start typing to search instantly...' };
  }
  if (trimmed.length === 1) {
    return { ok: false, message: 'Please enter at least 2 characters to search.' };
  }
  if (/^\d{1,2}$/.test(trimmed) && !parsed.codeRange) {
    return {
      ok: false,
      message: 'Enter at least 3 digits for a numeric code search, or include a letter prefix (e.g. Z43.05 for ICD-10).',
    };
  }
  if (parsed.isNumericOnly && parsed.primaryCode && parsed.primaryCode.length < MIN_NUMERIC_SEARCH_LEN && !parsed.codeRange) {
    return {
      ok: false,
      message: `Enter at least ${MIN_NUMERIC_SEARCH_LEN} digits for a numeric-only search, or add a letter prefix for ICD-10.`,
    };
  }
  return { ok: true };
}

function getPreferredCodeType(parsed) {
  if (parsed.typeMismatch?.detected) return parsed.typeMismatch.detected;
  if (parsed.primaryType) return parsed.primaryType;
  if (parsed.hintedType) return parsed.hintedType;
  return null;
}

function buildAllCodeVariants(codes) {
  const all = new Set();
  (codes || []).forEach((code) => {
    buildCodeVariants(code).forEach((variant) => all.add(variant));
  });
  return [...all];
}

function parseSearchQuery(rawQuery) {
  let q = (rawQuery || '').trim();
  let hintedType = null;

  const prefixMatch = q.match(CATEGORY_PREFIX_RE);
  if (prefixMatch) {
    const prefix = prefixMatch[1].toLowerCase();
    if (/icd/.test(prefix)) hintedType = 'ICD10';
    else if (/hcpcs/.test(prefix)) hintedType = 'HCPCS';
    else if (/cpt/.test(prefix)) hintedType = 'CPT';
    else if (/drg/.test(prefix)) hintedType = 'DRG';
    q = q.slice(prefixMatch[0].length).trim();
  }

  if (!hintedType) {
    if (/\bicd[- ]?10\b/i.test(rawQuery)) hintedType = 'ICD10';
    else if (/\bhcpcs\b/i.test(rawQuery)) hintedType = 'HCPCS';
    else if (/\bcpt\b/i.test(rawQuery)) hintedType = 'CPT';
  }

  const codeRange = parseCodeRange(q);
  const extractedCodes = extractCodesFromQuery(q);
  const wildcardCodes = extractedCodes.filter((code) => expandWildcardToken(code).isWildcard);
  const primaryCode = pickPrimaryCode(extractedCodes, q);
  const primaryWildcard = primaryCode ? expandWildcardToken(primaryCode) : null;
  const primaryType = primaryCode ? detectCodeType(primaryWildcard?.isWildcard ? primaryWildcard.prefix : primaryCode) : null;
  const numericCore = primaryCode ? primaryCode.replace(/[^\d]/g, '') : '';
  const isCompleteIcd10 = isCompleteIcd10Code(primaryCode);
  const isNumericOnly = !!primaryCode && /^\d{2,5}$/.test(primaryCode);
  const icd10SuffixHint = isNumericOnly ? inferIcd10DecimalSuffix(primaryCode) : null;
  const isWildcardSearch = wildcardCodes.length > 0 || !!primaryWildcard?.isWildcard;
  const isPartialCode = !!primaryCode && !isCompleteIcd10 && !isWildcardSearch && (
    (/^\d{2,4}$/.test(numericCore) && !/^[A-TV-Z]/i.test(primaryCode)) ||
    /^[A-TV-Z]\d{1,2}$/i.test((primaryCode || '').replace(/\./g, ''))
  );
  const semanticTerms = expandSemanticTerms(extractSemanticTerms(q, extractedCodes));
  const allCodeVariants = buildAllCodeVariants(extractedCodes);
  const codeVariants = buildCodeVariants(primaryCode);
  const deletedInfo = primaryCode
    ? DELETED_CODE_REPLACEMENTS[normalizeCodeKey(primaryCode)]
    : null;

  const isCodeSearch = extractedCodes.length > 0 || !!codeRange || isWildcardSearch;
  const isDescriptionSearch = extractedCodes.length === 0 && !codeRange && semanticTerms.length > 0;
  const isHybrid = extractedCodes.length > 0 && semanticTerms.length > 0;
  const isMultiCode = extractedCodes.length > 1;
  const typeMismatch = hintedType && primaryType && hintedType !== primaryType
    ? { hinted: hintedType, detected: primaryType }
    : null;

  return {
    raw: rawQuery,
    normalized: q,
    hintedType,
    preferredType: getPreferredCodeType({ hintedType, primaryType, typeMismatch }),
    primaryType,
    extractedCodes,
    primaryCode,
    codeVariants,
    allCodeVariants,
    wildcardCodes,
    codeRange,
    isPartialCode,
    isCompleteIcd10,
    isNumericOnly,
    isWildcardSearch,
    isMultiCode,
    icd10SuffixHint,
    isCodeSearch,
    isDescriptionSearch,
    isHybrid,
    semanticTerms,
    deletedInfo,
    typeMismatch,
  };
}

function normalizeCodeKey(code) {
  if (!code) return '';
  const base = code.toUpperCase().trim();
  const modMatch = base.match(/^(.+)-(\d{2})$/);
  return modMatch ? modMatch[1] : base;
}

function detectCodeType(token) {
  if (!token) return null;
  const upper = token.toUpperCase().trim();
  const compact = upper.replace(/[\.\-\s]/g, '');

  if (/^[A-TV-Z]\d{2}(\.[0-9A-Z]{1,4})?$/i.test(upper)) return 'ICD10';
  if (/^[A-TV-Z]\d{2}[A-Z0-9]{1,4}$/i.test(compact) && /^[A-TV-Z]/.test(compact)) return 'ICD10';
  if (/^[A-Z]\d{4}[A-Z]?$/.test(compact)) return 'HCPCS';
  if (/^\d{4}T$/i.test(compact)) return 'CPT';
  if (/^\d{5}$/.test(compact) || /^\d{4,5}-\d{2}$/.test(upper)) return 'CPT';
  if (/^\d{2,4}(\.\d+)?$/.test(upper)) return 'CPT';
  if (/^[0-9A-HJ-NP-Z]{3,7}$/i.test(compact) && /\d/.test(compact)) return 'ICD10';
  return null;
}

function looksLikeCodeToken(token) {
  if (!token || token.length < 2) return false;
  const upper = token.toUpperCase();
  const compact = upper.replace(/[\.\-\s]/g, '');

  if (/^[A-TV-Z]\d/.test(compact)) return true;
  if (/^[A-Z]\d{3,4}[A-Z]?$/.test(compact)) return true;
  if (/^\d{2,5}(-\d{2})?$/.test(upper)) return true;
  if (/^\d{2}\.\d{1,4}$/.test(upper)) return true;
  if (/^\d{2,4}x$/i.test(upper)) return true;
  if (/^[A-TV-Z]\d{2}\.X$/i.test(upper)) return true;
  if (/^\d{2,4}\.X$/i.test(upper)) return true;
  if (/^\d{2,3}X{2,}$/i.test(upper)) return true;
  return false;
}

function extractCodesFromQuery(text) {
  const found = new Set();
  const normalized = normalizeBillLineText(text);
  const segments = normalized.split(/[\|\t]+/).flatMap((part) => part.split(/[\s,;]+/)).filter(Boolean);

  segments.forEach((token) => {
    const lower = token.toLowerCase();
    if (SEARCH_STOP_WORDS.has(lower)) return;

    const wild = expandWildcardToken(token);
    if (wild.isWildcard) {
      found.add(token.toUpperCase());
      return;
    }

    if (looksLikeCodeToken(token)) {
      found.add(token.toUpperCase());
      return;
    }

    const modMatch = token.match(/^(\d{4,5})-(\d{2})$/i);
    if (modMatch) found.add(`${modMatch[1]}-${modMatch[2]}`.toUpperCase());
  });

  const inlinePatterns = [
    /\b(?:cpt|hcpcs|icd[- ]?10)[-\s]*([A-Z0-9][A-Z0-9.\-]{1,10})\b/gi,
    /\b([A-TV-Z]\d{2}\.[0-9A-Z]{1,4})\b/gi,
    /\b([A-TV-Z]\d{2}[A-Z0-9]{1,4})\b/gi,
    /\b([A-TV-Z]\d{2}\.X)\b/gi,
    /\b([A-TV-Z]\d{2}X)\b/gi,
    /\b([A-Z]\d{4}[A-Z]?)\b/g,
    /\b(\d{4,5}-\d{2})\b/g,
    /\b(\d{5})\b/g,
    /\b(\d{2,4})\b/g,
    /\b(\d{2}\.\d{1,4})\b/g,
    /\b(\d{2,4}\.X)\b/gi,
    /\b(\d{2,3}X{2,})\b/gi,
  ];

  inlinePatterns.forEach((pattern) => {
    let match;
    while ((match = pattern.exec(normalized)) !== null) {
      const candidate = match[1].toUpperCase();
      if (SEARCH_STOP_WORDS.has(candidate.toLowerCase())) continue;
      if (looksLikeCodeToken(candidate) || expandWildcardToken(candidate).isWildcard) {
        found.add(candidate);
      }
    }
  });

  return [...found];
}

function pickPrimaryCode(codes, text) {
  if (codes.length === 0) return null;
  if (codes.length === 1) return codes[0];

  const tokens = text.split(/[\s,;]+/).filter(Boolean);
  for (const token of tokens) {
    const upper = token.toUpperCase();
    if (codes.includes(upper)) return upper;
    const modMatch = token.match(/^(\d{4,5})-(\d{2})$/i);
    if (modMatch) {
      const modCode = `${modMatch[1]}-${modMatch[2]}`.toUpperCase();
      if (codes.includes(modCode)) return modCode;
    }
  }

  return codes.sort((a, b) => b.replace(/\D/g, '').length - a.replace(/\D/g, '').length)[0];
}

function extractSemanticTerms(text, extractedCodes) {
  const codeSet = new Set((extractedCodes || []).map((c) => c.toLowerCase()));
  const terms = new Set();

  text.split(/[\s,;]+/).filter(Boolean).forEach((token) => {
    const lower = token.toLowerCase();
    if (SEARCH_STOP_WORDS.has(lower)) return;
    if (codeSet.has(lower)) return;
    if (looksLikeCodeToken(token)) return;
    if (lower.length >= 2) terms.add(lower);
  });

  return [...terms];
}

function expandSemanticTerms(terms) {
  const expanded = new Set();
  terms.forEach((term) => {
    expanded.add(term);
    const synonyms = TERMINOLOGY_SYNONYMS[term];
    if (synonyms) synonyms.forEach((s) => expanded.add(s));
  });
  return [...expanded];
}

function parseCodeRange(text) {
  const match = text.match(/\b(\d{4,5})\s*-\s*(\d{4,5})\b/);
  if (!match) return null;
  return { start: match[1], end: match[2] };
}

function isCompleteIcd10Code(code) {
  if (!code) return false;
  const compact = code.toUpperCase().replace(/[\.\-\s]/g, '');
  return /^[A-TV-Z]\d{2}[A-Z0-9]{1,4}$/i.test(compact);
}

function inferIcd10DecimalSuffix(numericCode) {
  const digits = String(numericCode || '').replace(/\D/g, '');
  if (digits.length === 4) return `${digits.slice(0, 2)}.${digits.slice(2)}`;
  if (digits.length === 5) return `${digits.slice(0, 3)}.${digits.slice(3)}`;
  return null;
}

function buildCodeVariants(code) {
  if (!code) return [];
  const wild = expandWildcardToken(code);
  if (wild.isWildcard && wild.prefix) {
    return [wild.prefix];
  }

  const variants = new Set();
  const upper = code.toUpperCase().trim();
  variants.add(upper);

  const modMatch = upper.match(/^(.+)-(\d{2})$/);
  const base = modMatch ? modMatch[1] : upper;
  variants.add(base);

  const noSep = base.replace(/[\.\-\s,]/g, '');
  variants.add(noSep);

  if (/\d+\.\d+/.test(base)) variants.add(base);

  if (/^0+\d+$/.test(noSep) && noSep.length >= 5) {
    variants.add(noSep.replace(/^0+/, ''));
  }

  if (/^[A-Z]\d{2}[A-Z0-9]+$/i.test(noSep) && !base.includes('.')) {
    variants.add(`${noSep.substring(0, 3)}.${noSep.substring(3)}`);
  }

  if (/^\d{2,4}x$/i.test(base)) {
    variants.add(base.replace(/x$/i, ''));
  }

  return [...variants].filter(Boolean);
}

function getWildcardPrefixes(codes) {
  const prefixes = new Set();
  (codes || []).forEach((code) => {
    const wild = expandWildcardToken(code);
    if (wild.isWildcard && wild.prefix) prefixes.add(wild.prefix);
  });
  return [...prefixes];
}

function getIcd10SearchSuffix(code) {
  if (!code) return null;
  const dotted = buildCodeVariants(code).find((v) => /^[A-TV-Z]\d{2}\.[0-9A-Z]+$/i.test(v));
  if (dotted) return dotted.substring(1);
  const compact = String(code).toUpperCase().replace(/[\.\-\s]/g, '');
  if (/^[A-TV-Z]\d{2}[A-Z0-9]{1,4}$/i.test(compact)) {
    return `${compact.substring(1, 3)}.${compact.substring(3)}`;
  }
  return null;
}

function getIcd10CategoryPrefix(code) {
  const compact = String(code || '').toUpperCase().replace(/[\.\-\s]/g, '');
  if (/^[A-TV-Z]\d{2}/i.test(compact)) return compact.substring(0, 3);
  return null;
}

function getIcd10LetterPrefix(code) {
  const compact = String(code || '').toUpperCase().replace(/[\.\-\s]/g, '');
  return /^[A-TV-Z]/.test(compact) ? compact[0] : null;
}

async function fetchIcd10NearMatches(client, code, limit) {
  const rows = [];
  const seen = new Set();
  const addRows = (data) => {
    (data || []).forEach((row) => {
      const key = `${row.code}_${row.code_type}_${row.country}`;
      if (!seen.has(key)) {
        seen.add(key);
        rows.push(row);
      }
    });
  };

  const suffix = getIcd10SearchSuffix(code);
  if (suffix) addRows(await fetchIcd10SuffixMatches(client, suffix, limit));

  const category = getIcd10CategoryPrefix(code);
  if (category) addRows(await fetchPrefixCodeMatches(client, [category], limit));

  const fuzzyVariants = generateIcd10FuzzyVariants(code);
  if (fuzzyVariants.length > 0) {
    addRows(await fetchExactCodeMatches(client, fuzzyVariants, Math.min(limit, 30)));
  }

  return rows;
}

function applyRegionAndFilter(query) {
  if (currentRegion !== 'ALL') query = query.eq('country', currentRegion);
  if (currentFilter !== 'ALL') query = query.eq('code_type', currentFilter);
  return query;
}

async function fetchExactCodeMatches(client, codes, limit) {
  const exact = [...new Set(codes.filter(Boolean))];
  if (exact.length === 0) return [];

  let query = applyRegionAndFilter(
    client.from('medical_codes').select('code, short_description, country, code_type')
  );
  const { data, error } = await query.in('code', exact.slice(0, 80)).limit(limit);
  if (error) throw error;
  return data || [];
}

function toIlikePrefix(prefix) {
  const cleanPrefix = String(prefix || '').toUpperCase();
  if (cleanPrefix.endsWith('.')) return `${cleanPrefix}%`;
  if (cleanPrefix.includes('.')) return `${cleanPrefix.replace(/\./g, '%')}%`;
  return `${cleanPrefix}%`;
}

async function fetchPrefixCodeMatches(client, prefixes, limit) {
  const merged = [];
  const seen = new Set();

  for (const prefix of prefixes) {
    const cleanPrefix = String(prefix || '').toUpperCase();
    if (!cleanPrefix || cleanPrefix.length < 2) continue;

    let query = applyRegionAndFilter(
      client.from('medical_codes').select('code, short_description, country, code_type')
    );
    const { data, error } = await query.ilike('code', toIlikePrefix(cleanPrefix)).limit(limit);
    if (error) throw error;

    (data || []).forEach((row) => {
      const key = `${row.code}_${row.code_type}_${row.country}`;
      if (!seen.has(key)) {
        seen.add(key);
        merged.push(row);
      }
    });
  }

  return merged;
}

async function fetchIcd10SuffixMatches(client, suffix, limit) {
  if (!suffix) return [];

  let query = applyRegionAndFilter(
    client.from('medical_codes').select('code, short_description, country, code_type')
  );
  if (currentFilter === 'ALL') query = query.eq('code_type', 'ICD10');
  const { data, error } = await query.ilike('code', `%${suffix}`).limit(limit);
  if (error) throw error;
  return data || [];
}

async function executeSmartCodeSearch(client, parsed, codeVariants, fetchLimit) {
  const merged = [];
  const seen = new Set();
  const addRows = (rows) => {
    (rows || []).forEach((row) => {
      const key = `${row.code}_${row.code_type}_${row.country}`;
      if (!seen.has(key)) {
        seen.add(key);
        merged.push(row);
      }
    });
  };

  const wildcardPrefixes = getWildcardPrefixes(parsed.extractedCodes);
  if (wildcardPrefixes.length > 0) {
    addRows(await fetchPrefixCodeMatches(client, wildcardPrefixes, fetchLimit));
    return merged;
  }

  addRows(await fetchExactCodeMatches(client, codeVariants, fetchLimit));

  const hasExactVariantHit = codeVariants.some((v) =>
    merged.some((r) => r.code.toUpperCase() === v.toUpperCase())
  );

  if (!hasExactVariantHit && parsed.primaryCode && (
    parsed.primaryType === 'ICD10' || isCompleteIcd10Code(parsed.primaryCode)
  )) {
    addRows(await fetchIcd10NearMatches(client, parsed.primaryCode, fetchLimit));
  }

  const needsPrefix = parsed.isPartialCode || (
    parsed.primaryCode && !hasExactVariantHit && merged.length === 0
  );
  if (needsPrefix) {
    addRows(await fetchPrefixCodeMatches(client, codeVariants, fetchLimit));
  }

  if (parsed.isNumericOnly && parsed.icd10SuffixHint) {
    addRows(await fetchIcd10SuffixMatches(client, parsed.icd10SuffixHint, 50));
  }

  return merged;
}

async function executeCrossCodeSetFallback(client, parsed, codeVariants, fetchLimit) {
  const typesToTry = ['ICD10', 'CPT', 'HCPCS'].filter((type) => {
    if (currentFilter !== 'ALL' && currentFilter !== type) return false;
    return type !== parsed.primaryType;
  });

  const merged = [];
  const seen = new Set();
  for (const codeType of typesToTry) {
    let query = client.from('medical_codes').select('code, short_description, country, code_type');
    if (currentRegion !== 'ALL') query = query.eq('country', currentRegion);
    query = query.eq('code_type', codeType);

    const exact = await query.in('code', codeVariants.slice(0, 50)).limit(fetchLimit);
    if (exact.error) continue;

    (exact.data || []).forEach((row) => {
      const key = `${row.code}_${row.code_type}_${row.country}`;
      if (!seen.has(key)) {
        seen.add(key);
        merged.push(row);
      }
    });

    if (parsed.isPartialCode || parsed.isWildcardSearch) {
      for (const prefix of codeVariants.slice(0, 10)) {
        let prefixQuery = client.from('medical_codes').select('code, short_description, country, code_type');
        if (currentRegion !== 'ALL') prefixQuery = prefixQuery.eq('country', currentRegion);
        prefixQuery = prefixQuery.eq('code_type', codeType).ilike('code', toIlikePrefix(prefix));
        const prefixResult = await prefixQuery.limit(Math.min(fetchLimit, 80));
        if (prefixResult.error) continue;
        (prefixResult.data || []).forEach((row) => {
          const key = `${row.code}_${row.code_type}_${row.country}`;
          if (!seen.has(key)) {
            seen.add(key);
            merged.push(row);
          }
        });
      }
    }
  }

  return merged;
}

function generateIcd10FuzzyVariants(code) {
  const compact = String(code || '').toUpperCase().replace(/[\.\-\s]/g, '');
  if (!/^[A-TV-Z]\d{2}[A-Z0-9]{1,4}$/i.test(compact)) return [];

  const variants = new Set();
  for (let i = 3; i < compact.length; i++) {
    const ch = compact[i];
    if (/\d/.test(ch)) {
      const digit = Number(ch);
      if (digit > 0) variants.add(compact.slice(0, i) + String(digit - 1) + compact.slice(i + 1));
      if (digit < 9) variants.add(compact.slice(0, i) + String(digit + 1) + compact.slice(i + 1));
    } else if (/[A-Z]/.test(ch)) {
      variants.add(compact.slice(0, i) + String.fromCharCode(ch.charCodeAt(0) - 1) + compact.slice(i + 1));
      variants.add(compact.slice(0, i) + String.fromCharCode(ch.charCodeAt(0) + 1) + compact.slice(i + 1));
    }
  }

  for (let i = 3; i < compact.length - 1; i++) {
    const arr = compact.split('');
    [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
    variants.add(arr.join(''));
  }

  variants.delete(compact);
  const expanded = new Set();
  [...variants].slice(0, 12).forEach((variant) => {
    buildCodeVariants(variant).forEach((v) => expanded.add(v));
  });
  return [...expanded].slice(0, 20);
}

function generateCptFuzzyVariants(code) {
  const compact = (code || '').replace(/\D/g, '');
  if (!/^\d{5}$/.test(compact)) return [];

  const variants = new Set();
  for (let i = 0; i < 5; i++) {
    const digit = Number(compact[i]);
    if (digit > 0) variants.add(compact.slice(0, i) + String(digit - 1) + compact.slice(i + 1));
    if (digit < 9) variants.add(compact.slice(0, i) + String(digit + 1) + compact.slice(i + 1));
  }
  for (let i = 0; i < 4; i++) {
    const arr = compact.split('');
    [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
    variants.add(arr.join(''));
  }

  variants.delete(compact);
  return [...variants].slice(0, 12);
}

function buildSearchMeta(parsed, extra = {}) {
  return {
    parsed,
    deletedInfo: parsed.deletedInfo,
    isPartialCode: parsed.isPartialCode,
    isNumericOnly: parsed.isNumericOnly,
    isMultiCode: parsed.isMultiCode,
    isWildcardSearch: parsed.isWildcardSearch,
    icd10SuffixHint: parsed.icd10SuffixHint,
    typeMismatch: parsed.typeMismatch,
    preferredType: parsed.preferredType || getPreferredCodeType(parsed),
    usedFuzzy: extra.usedFuzzy || false,
    fuzzyFrom: extra.fuzzyFrom || null,
    fuzzyKind: extra.fuzzyKind || null,
    crossCodeSetFallback: extra.crossCodeSetFallback || false,
  };
}

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

function selectRegion(_btn, region) {
  // Region toggles removed — search always covers US, UK, and ME.
  currentRegion = 'ALL';
  clearTimeout(searchTimeout);
  const searchInput = document.getElementById('code-search-input');
  if (searchInput) performSearch(searchInput.value.trim());
}
window.selectRegion = selectRegion;



function setupEventListeners() {
  const searchInput = document.getElementById('code-search-input');
  const filterBtns = document.querySelectorAll('.filter-btn');

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
  if (window.MediHelp && typeof window.MediHelp.trackEvent === 'function') {
    window.MediHelp.trackEvent('search_cpt_code', { search_term: String(query || '').substring(0, 100) });
  }
  const listContainer = document.getElementById('search-results-list');
  const parsed = parseSearchQuery(query);
  const validation = validateSearchQuery(parsed, query);

  if (!validation.ok) {
    listContainer.innerHTML = `<div class="empty-state">${escapeHtml(validation.message)}</div>`;
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
  const searchMeta = buildSearchMeta(parsed);
  const primaryCode = parsed.primaryCode;
  const cleanQ = (primaryCode || parsed.normalized || query).replace(/[\.\-\s,]/g, '').toUpperCase();
  const cleanQFiltered = (cleanQ.startsWith('0') && cleanQ.length >= 5 && /^\d+$/.test(cleanQ))
    ? cleanQ.replace(/^0+/, '')
    : cleanQ;

  let dottedQ = primaryCode ? primaryCode.toUpperCase() : cleanQ;
  if (/^[A-Z]\d{2}[A-Z0-9]+$/i.test(cleanQ) && !String(primaryCode || '').includes('.')) {
    dottedQ = cleanQ.substring(0, 3) + '.' + cleanQ.substring(3);
  }

  listContainer.innerHTML = '<div class="empty-state">Querying Global Registry...</div>';

  try {
    // 1. Handle NCCI Edits separately (check both comprehensive and component columns)
    if (currentFilter === 'NCCI') {
      const ncciCode = normalizeCodeKey(parsed.primaryCode || cleanQFiltered || cleanQ);
      const { data, error } = await window.dbClient
        .from('ncci_ptp_edits')
        .select('*')
        .or(`column1_code.eq."${ncciCode}",column2_code.eq."${ncciCode}"`)
        .limit(50);

      if (error) throw error;
      if (searchId !== currentSearchId) return;

      renderNCCIResults(data, ncciCode);
      return;
    }

    const safeQuery = (parsed.primaryCode || parsed.normalized || query)
      .replace(/[^a-zA-Z0-9\s.\-,]/g, '')
      .trim();
    const codeVariants = [...new Set([
      ...buildAllCodeVariants(parsed.extractedCodes),
      ...(parsed.extractedCodes.length === 1 && parsed.primaryCode ? [safeQuery, cleanQ, cleanQFiltered, dottedQ] : []),
      ...(parsed.deletedInfo ? [parsed.deletedInfo.replacement] : []),
    ].filter(Boolean))];

    const fetchLimit = 300;
    let data = null;
    let error = null;
    let status = null;

    if (parsed.codeRange) {
      let dbQuery = applyRegionAndFilter(
        window.dbClient.from('medical_codes').select('code, short_description, country, code_type')
      );
      dbQuery = dbQuery
        .gte('code', parsed.codeRange.start)
        .lte('code', parsed.codeRange.end);
      ({ data, error, status } = await dbQuery.limit(fetchLimit));
    } else if (parsed.isCodeSearch && !parsed.isHybrid) {
      try {
        data = await executeSmartCodeSearch(window.dbClient, parsed, codeVariants, fetchLimit);
      } catch (searchErr) {
        error = searchErr;
      }
    } else if (parsed.isDescriptionSearch) {
      const allOrs = new Set();
      const phrase = parsed.semanticTerms.join(' ');
      if (phrase.length >= 2) allOrs.add(`short_description.ilike."%${phrase}%"`);
      parsed.semanticTerms.forEach((w) => {
        if (w.length >= 2) allOrs.add(`short_description.ilike."%${w}%"`);
      });
      if (allOrs.size === 0) {
        renderResults([], 0, fetchLimit, buildSearchMeta(parsed));
        return;
      }
      let dbQuery = applyRegionAndFilter(
        window.dbClient.from('medical_codes').select('code, short_description, country, code_type')
      );
      dbQuery = dbQuery.or(Array.from(allOrs).join(','));
      ({ data, error, status } = await dbQuery.limit(fetchLimit));
    } else {
      const allOrs = new Set();
      parsed.semanticTerms.forEach((w) => {
        if (w.length >= 2) allOrs.add(`short_description.ilike."%${w}%"`);
      });
      if (parsed.semanticTerms.length > 0) {
        allOrs.add(`short_description.ilike."%${parsed.normalized}%"`);
      }

      if (parsed.primaryCode) {
        try {
          data = await executeSmartCodeSearch(window.dbClient, parsed, codeVariants, fetchLimit);
        } catch (searchErr) {
          error = searchErr;
        }
      }

      if (!error && parsed.semanticTerms.length > 0) {
        let dbQuery = applyRegionAndFilter(
          window.dbClient.from('medical_codes').select('code, short_description, country, code_type')
        );
        dbQuery = dbQuery.or(Array.from(allOrs).join(','));
        const descResult = await dbQuery.limit(fetchLimit);
        if (descResult.error) error = descResult.error;
        else {
          status = descResult.status;
          const merged = [...(data || []), ...(descResult.data || [])];
          const seen = new Set();
          data = merged.filter((row) => {
            const key = `${row.code}_${row.code_type}_${row.country}`;
            if (seen.has(key)) return false;
            seen.add(key);
            return true;
          });
        }
      } else if (!parsed.primaryCode && allOrs.size === 0) {
        renderResults([], 0, fetchLimit, buildSearchMeta(parsed));
        return;
      }
    }

    if (error && isTimeoutError(error) && searchId === currentSearchId) {
      await new Promise(r => setTimeout(r, 350));
      if (searchId !== currentSearchId) return;
      if (parsed.isCodeSearch && !parsed.isHybrid) {
        try {
          data = await executeSmartCodeSearch(window.dbClient, parsed, codeVariants, fetchLimit);
          error = null;
        } catch (retryErr) {
          error = retryErr;
        }
      }
    }

    if (searchId !== currentSearchId) {
      console.log('Stale search result discarded:', query);
      return;
    }

    if (error) {
      console.error('Search error:', error, 'Query:', parsed);
      listContainer.innerHTML = `<div class="empty-state" style="color:var(--text-danger)">
            <strong>Database Error [${status}]:</strong> ${escapeHtml(error.message) || 'Unknown error'}<br>
            <span style="font-size:10px; opacity:0.7;">Check console for query details</span>
        </div>`;
      return;
    }

    let usedFuzzy = false;
    let fuzzyFrom = null;
    let fuzzyKind = null;
    let crossCodeSetFallback = false;

    if ((!data || data.length === 0) && parsed.primaryCode && (
      parsed.primaryType === 'ICD10' || isCompleteIcd10Code(parsed.primaryCode)
    )) {
      const nearMatches = await fetchIcd10NearMatches(window.dbClient, parsed.primaryCode, fetchLimit);
      if (searchId !== currentSearchId) return;
      if (nearMatches.length > 0) {
        data = nearMatches;
        usedFuzzy = true;
        fuzzyFrom = parsed.primaryCode;
        fuzzyKind = 'ICD10';
      }
    }

    if ((!data || data.length === 0) && parsed.primaryCode && /^\d{5}$/.test(cleanQFiltered)) {
      const fuzzyVariants = generateCptFuzzyVariants(cleanQFiltered);
      if (fuzzyVariants.length > 0) {
        let fuzzyQuery = applyRegionAndFilter(
          window.dbClient.from('medical_codes').select('code, short_description, country, code_type')
        );
        const fuzzyResult = await fuzzyQuery.in('code', fuzzyVariants).limit(20);
        if (searchId !== currentSearchId) return;
        if (!fuzzyResult.error && fuzzyResult.data && fuzzyResult.data.length > 0) {
          data = fuzzyResult.data;
          usedFuzzy = true;
          fuzzyFrom = cleanQFiltered;
          fuzzyKind = 'CPT';
        }
      }
    }

    if ((!data || data.length === 0) && parsed.isCodeSearch && codeVariants.length > 0) {
      const crossData = await executeCrossCodeSetFallback(window.dbClient, parsed, codeVariants, fetchLimit);
      if (searchId !== currentSearchId) return;
      if (crossData.length > 0) {
        data = crossData;
        crossCodeSetFallback = true;
      }
    }

    if (!data || data.length === 0) {
      renderResults([], 0, fetchLimit, buildSearchMeta(parsed, { usedFuzzy, fuzzyFrom, fuzzyKind, crossCodeSetFallback }));
      return;
    }

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
          regions: new Set([r.country || 'US']),
          isDeleted: !!DELETED_CODE_REPLACEMENTS[normalizeCodeKey(r.code)],
          replacement: DELETED_CODE_REPLACEMENTS[normalizeCodeKey(r.code)]?.replacement || null,
        };
      } else {
        grouped[key].regions.add(r.country || 'US');
      }
    });

    let finalResults = Object.values(grouped);
    const rankKeys = new Set(codeVariants.map((v) => v.toUpperCase()));

    finalResults.sort((a, b) => {
      const preferredType = parsed.preferredType || getPreferredCodeType(parsed);
      if (preferredType) {
        if (a.type === preferredType && b.type !== preferredType) return -1;
        if (b.type === preferredType && a.type !== preferredType) return 1;
      }

      const aKey = normalizeCodeKey(a.code);
      const bKey = normalizeCodeKey(b.code);
      const aExact = rankKeys.has(a.code.toUpperCase()) || rankKeys.has(aKey);
      const bExact = rankKeys.has(b.code.toUpperCase()) || rankKeys.has(bKey);
      if (aExact && !bExact) return -1;
      if (bExact && !aExact) return 1;

      if (parsed.isNumericOnly && parsed.icd10SuffixHint) {
        const suffix = parsed.icd10SuffixHint;
        const aIcd = a.type === 'ICD10' && a.code.toUpperCase().includes(suffix);
        const bIcd = b.type === 'ICD10' && b.code.toUpperCase().includes(suffix);
        if (aIcd && !bIcd) return -1;
        if (bIcd && !aIcd) return 1;
        if (a.type === 'ICD10' && b.type !== 'ICD10') return -1;
        if (b.type === 'ICD10' && a.type !== 'ICD10') return 1;
      }

      const icdLetter = getIcd10LetterPrefix(parsed.primaryCode);
      const icdCategory = getIcd10CategoryPrefix(parsed.primaryCode);
      if (icdLetter) {
        const aLetter = a.code.toUpperCase().startsWith(icdLetter);
        const bLetter = b.code.toUpperCase().startsWith(icdLetter);
        if (aLetter && !bLetter) return -1;
        if (bLetter && !aLetter) return 1;
      }
      if (icdCategory) {
        const aCat = a.code.toUpperCase().startsWith(icdCategory);
        const bCat = b.code.toUpperCase().startsWith(icdCategory);
        if (aCat && !bCat) return -1;
        if (bCat && !aCat) return 1;
      }

      const aStarts = codeVariants.some((v) => a.code.toUpperCase().startsWith(v.toUpperCase()));
      const bStarts = codeVariants.some((v) => b.code.toUpperCase().startsWith(v.toUpperCase()));
      if (aStarts && !bStarts) return -1;
      if (bStarts && !aStarts) return 1;

      if (parsed.deletedInfo) {
        if (a.code === parsed.primaryCode) return -1;
        if (b.code === parsed.primaryCode) return 1;
        if (a.code === parsed.deletedInfo.replacement) return -1;
        if (b.code === parsed.deletedInfo.replacement) return 1;
      }

      const phrase = parsed.semanticTerms.join(' ').toUpperCase();
      if (phrase) {
        const aDesc = a.desc.toUpperCase();
        const bDesc = b.desc.toUpperCase();
        const aStartsDesc = aDesc.startsWith(phrase) || parsed.semanticTerms.some((t) => aDesc.includes(t.toUpperCase()));
        const bStartsDesc = bDesc.startsWith(phrase) || parsed.semanticTerms.some((t) => bDesc.includes(t.toUpperCase()));
        if (aStartsDesc && !bStartsDesc) return -1;
        if (bStartsDesc && !aStartsDesc) return 1;
      }

      return a.code.localeCompare(b.code);
    });

    renderResults(
      finalResults,
      data.length,
      fetchLimit,
      buildSearchMeta(parsed, { usedFuzzy, fuzzyFrom, fuzzyKind, crossCodeSetFallback })
    );

    if (finalResults.length > 0 && finalResults.length < 50) {
      const extractedCodes = finalResults.map(r => r.code);
      window.dbClient.from('medical_codes')
        .select('code, country')
        .in('code', extractedCodes)
        .then(({ data: locData }) => {
          if (!locData) return;
          locData.forEach(row => {
            const safeCode = row.code.replace(/"/g, '\\"');
            const domBadges = document.querySelectorAll(`.reg-badge-async[data-badgecode="${safeCode}"]`);
            domBadges.forEach(badge => {
              if (badge.dataset.val === row.country || badge.dataset.val === 'ALL') {
                badge.classList.remove('inactive');
                if (badge.innerText.includes('N/A')) {
                  badge.innerText = badge.dataset.val;
                }
              }
            });
          });
        });
    }

  } catch (err) {
    console.error('Unexpected search failure:', err);
    listContainer.innerHTML = `<div class="empty-state" style="color:var(--text-danger)">Unexpected Error: ${escapeHtml(err.message) || 'Check connection'}</div>`;
  }
}

function renderResults(results, rawCount = 0, rawFetchLimit = 150, searchMeta = null) {
  const listContainer = document.getElementById('search-results-list');

  if (!results || results.length === 0) {
    let html = renderSearchNotices(searchMeta);
    html += '<div class="empty-state">No matching codes found in database.</div>';
    if (searchMeta?.deletedInfo) {
      html += `<div class="search-notice search-notice-warning" style="margin-top:12px;">
        <strong>CPT ${escapeHtml(searchMeta.parsed.primaryCode)}</strong> is a deleted code.
        Try searching <strong>${escapeHtml(searchMeta.deletedInfo.replacement)}</strong> instead.
      </div>`;
    }
    listContainer.innerHTML = html;
    return;
  }

  const regionList = ['US', 'UK', 'ME'];
  let html = renderSearchNotices(searchMeta);

  const count = results.length;
  const isCapped = rawCount >= rawFetchLimit;
  html += `<div class="results-count">Showing <b>${count}</b> unique codes${isCapped ? ' (Limit reached, narrow query)' : ''}</div>`;

  results.forEach(item => {
    let tagClass = `tag-${escapeHtml(item.type)}`;
    let displayType = item.type.replace('ICD10', 'ICD-10');
    const deletedMeta = DELETED_CODE_REPLACEMENTS[normalizeCodeKey(item.code)];
    const isDeleted = item.isDeleted || !!deletedMeta;

    html += `
      <div class="result-card${isDeleted ? ' result-card-deleted' : ''}">
        <div class="result-main-area">
          <div class="result-header">
            <span class="code-val">${escapeHtml(item.code)}</span>
            <span class="code-tag ${tagClass}">${escapeHtml(displayType)}</span>
            ${isDeleted ? '<span class="code-tag tag-deleted">Deleted</span>' : ''}
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
          ${isDeleted ? `<div class="search-notice search-notice-warning" style="margin:8px 0 0;">
            ${escapeHtml(deletedMeta?.reason || 'This code is deleted or obsolete.')}
            ${deletedMeta?.replacement ? ` Use <strong>${escapeHtml(deletedMeta.replacement)}</strong> instead.` : ''}
          </div>` : ''}
          <div class="result-desc">${escapeHtml(item.desc)}</div>
          ${item.plainDesc ? `<div class="result-desc-plain">Plain English: ${escapeHtml(item.plainDesc)}</div>` : ''}
        </div>
      </div>
    `;
  });

  listContainer.innerHTML = html;
}

function renderSearchNotices(searchMeta) {
  if (!searchMeta) return '';

  let html = '';

  if (searchMeta.isMultiCode && searchMeta.parsed?.extractedCodes?.length) {
    html += `<div class="search-notice search-notice-info">
      Searching <strong>${searchMeta.parsed.extractedCodes.length}</strong> codes from your query:
      <strong>${escapeHtml(searchMeta.parsed.extractedCodes.join(', '))}</strong>
    </div>`;
  }

  if (searchMeta.isWildcardSearch && searchMeta.parsed?.wildcardCodes?.length) {
    html += `<div class="search-notice search-notice-info">
      Wildcard search — showing all codes matching
      <strong>${escapeHtml(searchMeta.parsed.wildcardCodes.join(', '))}</strong>.
    </div>`;
  }

  if (searchMeta.isPartialCode && searchMeta.parsed?.primaryCode) {
    html += `<div class="search-notice search-notice-info">
      Showing codes starting with <strong>${escapeHtml(searchMeta.parsed.primaryCode)}</strong>.
      Select the exact code from your bill if you see multiple matches.
    </div>`;
  }

  if (searchMeta.isNumericOnly && searchMeta.icd10SuffixHint) {
    html += `<div class="search-notice search-notice-info">
      Numeric-only search — ICD-10 codes require a letter prefix.
      Prioritizing ICD-10 matches ending in <strong>${escapeHtml(searchMeta.icd10SuffixHint)}</strong>
      (e.g. <strong>Z${escapeHtml(searchMeta.icd10SuffixHint)}</strong>).
    </div>`;
  }

  if (searchMeta.typeMismatch) {
    html += `<div class="search-notice search-notice-info">
      Your query looks like a <strong>${escapeHtml(searchMeta.typeMismatch.detected.replace('ICD10', 'ICD-10'))}</strong> code,
      not ${escapeHtml(searchMeta.typeMismatch.hinted.replace('ICD10', 'ICD-10'))}.
      Showing the best matching ${escapeHtml(searchMeta.typeMismatch.detected.replace('ICD10', 'ICD-10'))} results.
    </div>`;
  }

  if (searchMeta.usedFuzzy && searchMeta.fuzzyFrom) {
    const kindLabel = searchMeta.fuzzyKind === 'ICD10' ? 'ICD-10' : 'CPT';
    html += `<div class="search-notice search-notice-info">
      No exact match for <strong>${escapeHtml(searchMeta.fuzzyFrom)}</strong>.
      Showing close ${escapeHtml(kindLabel)} matches (same category, suffix, or typo correction).
    </div>`;
  }

  if (searchMeta.crossCodeSetFallback) {
    html += `<div class="search-notice search-notice-info">
      No exact match in the expected code type — expanded search across CPT, ICD-10, and HCPCS.
    </div>`;
  }

  if (searchMeta.deletedInfo) {
    html += `<div class="search-notice search-notice-warning">
      <strong>CPT ${escapeHtml(searchMeta.parsed.primaryCode)}</strong> is deleted.
      Replacement: <strong>${escapeHtml(searchMeta.deletedInfo.replacement)}</strong>.
    </div>`;
  }

  return html;
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
