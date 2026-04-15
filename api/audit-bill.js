require('dotenv').config();
const { TextractClient, AnalyzeDocumentCommand } = require("@aws-sdk/client-textract");
const { createClient } = require("@supabase/supabase-js");
const multer = require("multer");
const { PDFDocument } = require('pdf-lib');
const pdfjsLib = require('pdfjs-dist/legacy/build/pdf.js');
let sharp = null;
try { sharp = require('sharp'); } catch (_) { sharp = null; }

// Helper to run middleware in Vercel
const runMiddleware = (req, res, fn) => {
  return new Promise((resolve, reject) => {
    fn(req, res, (result) => {
      if (result instanceof Error) return reject(result);
      return resolve(result);
    });
  });
};

const upload = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: 4 * 1024 * 1024 }, // Keep under 4MB for Vercel
});

const TEXTRACT_MAX_ATTEMPTS = 3;
const TEXTRACT_BACKOFF_MS = [0, 700, 1500];
const TEXTRACT_BYTES_LIMIT = 10 * 1024 * 1024;
const MONEY_EPSILON = 0.01;
const DIRECT_TEXT_MAX_ROWS = 250;

/**
 * Robustly parse strings into numbers, stripping currency symbols, 
 * commas, and handling accounting-style negative parentheses.
 */
function parseCurrency(val) {
  if (val == null || val === '') return null;
  if (typeof val === 'number') return val;
  const cleaned = String(val)
    .replace(/[$\s,]/g, '')
    .replace(/\((.*)\)/, '-$1')
    .trim();
  const n = parseFloat(cleaned);
  return Number.isFinite(n) ? Math.round(n * 100) / 100 : null;
}

const RATE_WINDOW_MS = 5 * 60 * 1000;
const RATE_MAX_REQUESTS = Number(process.env.AUDIT_RATE_LIMIT_COUNT || 20);
const GEMINI_OVERRIDE_MARGIN = Number(process.env.GEMINI_OVERRIDE_MARGIN || 10);
const requestBuckets = new Map();

const DEFAULT_ALLOWED_ORIGINS = [
  'https://www.medihelp.live',
  'https://medihelp.live',
  'http://localhost:3000',
  'http://127.0.0.1:3000'
];

function getAllowedOrigins() {
  const configured = String(process.env.CORS_ALLOWED_ORIGINS || '').split(',').map(s => s.trim()).filter(Boolean);
  return configured.length > 0 ? configured : DEFAULT_ALLOWED_ORIGINS;
}

function setCorsHeaders(req, res) {
  const origin = req.headers.origin;
  const allowed = getAllowedOrigins();
  if (origin && allowed.includes(origin)) {
    res.setHeader('Access-Control-Allow-Origin', origin);
    res.setHeader('Vary', 'Origin');
  }
  res.setHeader('Access-Control-Allow-Methods', 'POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
}

function enforceRateLimit(req) {
  const ip = String(req.headers['x-forwarded-for'] || req.socket?.remoteAddress || 'unknown').split(',')[0].trim();
  const origin = String(req.headers.origin || 'unknown');
  const ua = String(req.headers['user-agent'] || 'na').slice(0, 80);
  const key = `${ip}|${origin}|${ua}`;
  const now = Date.now();
  const bucket = requestBuckets.get(key) || [];
  const active = bucket.filter((ts) => now - ts < RATE_WINDOW_MS);
  if (active.length >= RATE_MAX_REQUESTS) return { limited: true, retryAfterSec: Math.ceil((RATE_WINDOW_MS - (now - active[0])) / 1000) };
  active.push(now);
  requestBuckets.set(key, active);
  if (requestBuckets.size > 1000) {
    for (const [k, arr] of requestBuckets.entries()) {
      const keep = arr.filter((ts) => now - ts < RATE_WINDOW_MS);
      if (keep.length === 0) requestBuckets.delete(k);
      else requestBuckets.set(k, keep);
    }
  }
  return { limited: false, retryAfterSec: 0 };
}

async function buildDocumentPreflight(file) {
  const mime = String(file?.mimetype || '').toLowerCase();
  const preflight = {
    mime_type: mime,
    file_size_bytes: Number(file?.size || file?.buffer?.length || 0),
    page_count: 1,
    has_selectable_text: false,
    is_scanned_like: false,
    is_encrypted_pdf: false,
    needs_preprocessing: false,
    image_quality_hints: []
  };
  if (!file?.buffer) return preflight;

  if (mime.includes('pdf')) {
    try {
      const loadingTask = pdfjsLib.getDocument({ data: new Uint8Array(file.buffer) });
      const pdf = await loadingTask.promise;
      preflight.page_count = pdf.numPages || 1;
      let textItems = 0;
      for (let p = 1; p <= Math.min(pdf.numPages, 3); p++) {
        const page = await pdf.getPage(p);
        const content = await page.getTextContent();
        textItems += (content.items || []).length;
      }
      preflight.has_selectable_text = textItems > 25;
      preflight.is_scanned_like = !preflight.has_selectable_text;
      preflight.needs_preprocessing = preflight.is_scanned_like;
    } catch (err) {
      preflight.image_quality_hints.push('pdf_text_probe_failed');
      preflight.is_scanned_like = true;
      preflight.needs_preprocessing = true;
    }
    try {
      await PDFDocument.load(file.buffer, { ignoreEncryption: false });
    } catch (err) {
      if (/encrypted|password/i.test(String(err?.message || ''))) {
        preflight.is_encrypted_pdf = true;
        preflight.needs_preprocessing = true;
      }
    }
  } else if (mime.startsWith('image/')) {
    preflight.is_scanned_like = true;
    preflight.needs_preprocessing = true;
    if (sharp) {
      try {
        const meta = await sharp(file.buffer).metadata();
        preflight.image_width = meta.width || null;
        preflight.image_height = meta.height || null;
        if ((meta.width || 0) < 1400 || (meta.height || 0) < 1400) preflight.image_quality_hints.push('low_resolution_scan');
      } catch (_) {
        preflight.image_quality_hints.push('image_metadata_unavailable');
      }
    }
  }
  return preflight;
}

async function preprocessImageForOcr(buffer) {
  if (!sharp || !buffer) return { buffer, applied: false, mode: 'none' };
  try {
    const out = await sharp(buffer)
      .rotate()
      .grayscale()
      .normalize()
      .sharpen()
      .png({ compressionLevel: 9 })
      .toBuffer();
    return { buffer: out, applied: true, mode: 'image_300dpi_grayscale_sharpen' };
  } catch (_) {
    return { buffer, applied: false, mode: 'preprocess_failed' };
  }
}

// Credentials must be set via environment variables — no fallback for security
const accessKeyId = process.env.AWS_ACCESS_KEY_ID;
const secretAccessKey = process.env.AWS_SECRET_ACCESS_KEY;
const region = process.env.AWS_REGION || "us-east-1";
const awsCredentialsConfigured = !!(accessKeyId && secretAccessKey);

if (!awsCredentialsConfigured) {
  console.error('FATAL: AWS credentials not set. Set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY env vars.');
}

const textractClient = awsCredentialsConfigured
  ? new TextractClient({
      region,
      credentials: {
        accessKeyId,
        secretAccessKey
      }
    })
  : null;

let supabase = null;
try {
  const supabaseUrl =
    process.env.NEXT_PUBLIC_SUPABASE_URL ||
    process.env.SUPABASE_URL ||
    null;
  const supabaseKey =
    process.env.SUPABASE_SERVICE_ROLE_KEY ||
    process.env.SUPABASE_SERVICE_KEY ||
    null;
  if (supabaseUrl && supabaseKey) {
    supabase = createClient(supabaseUrl, supabaseKey);
  } else {
    console.warn('MediHelp: Supabase env vars missing (SUPABASE_URL/NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY); database-dependent checks will be skipped.');
  }
} catch (err) {
  console.warn('MediHelp: Supabase client init failed; DB checks will be skipped:', err.message);
}

function getText(block, blockMap, minConfidence = 85) {
  let text = "";
  let hasLowConfidence = false;
  const lowConfidenceWords = [];
  if (block.Relationships) {
    block.Relationships.forEach(rel => {
      if (rel.Type === "CHILD") {
        rel.Ids.forEach(id => {
          const childBlock = blockMap[id];
          if (childBlock && childBlock.BlockType === "WORD") {
            const conf = childBlock.Confidence || 0;
            if (conf < minConfidence) {
              hasLowConfidence = true;
              if (childBlock.Text) lowConfidenceWords.push(childBlock.Text);
            }
            text += childBlock.Text + " ";
          }
        });
      }
    });
  }
  return { text: text.trim(), hasLowConfidence, lowConfidenceWords };
}

/**
 * parseCurrency — handles $1,234.00, (1234.00), $500 CR and similar variants.
 * Returns a float. Negative for amounts in parentheses or with CR/cr suffix.
 */
function parseCurrency(str) {
  if (str === null || str === undefined || str === '') return null;
  const s = String(str).trim();
  const isNeg = /^\(/.test(s) || /\(.*\d.*\)/.test(s) || /CR\s*$/i.test(s) || /^-/.test(s);
  let cleaned = s.replace(/[\$\(\)]/g, '').replace(/CR\s*$/i, '').trim();
  const hasEuropean = /\d{1,3}(?:\.\d{3})+,\d{2}$/.test(cleaned);
  if (hasEuropean) cleaned = cleaned.replace(/\./g, '').replace(',', '.');
  else cleaned = cleaned.replace(/,/g, '');
  const val = parseFloat(cleaned);
  if (isNaN(val)) return null;
  return isNeg ? -Math.abs(val) : val;
}

function isLikelyDate(value) {
  if (!value) return false;
  const s = String(value).trim();
  return /\b\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\b/.test(s) || /^\d{4}-\d{2}-\d{2}$/.test(s);
}

function collectRowQualityFlags(item) {
  const reasons = [];
  const cpt = String(item.CPT || '').trim().toUpperCase();
  const qty = Number(item.Qty || 0);
  const billed = Number(item.Billed_Amount || 0);
  const confidence = Number(item.extraction_confidence || 0);

  if (!cpt || !item.IsValidCode) reasons.push('Invalid or missing CPT/HCPCS code');
  if (!isLikelyDate(item.Date)) reasons.push('Missing or invalid date of service');
  if (!Number.isFinite(qty) || qty <= 0 || qty > 50) reasons.push('Unusual quantity');
  if (!Number.isFinite(billed) || billed <= 0) reasons.push('Missing or invalid billed amount');
  if (item.has_low_confidence_chars) reasons.push('Low-confidence OCR characters detected');
  if (confidence < 85) reasons.push('Extraction confidence below strict threshold');

  if (Number.isFinite(item.Unit_Price) && Number.isFinite(item.Billed_Amount) && Number.isFinite(item.Qty)) {
    const delta = Math.abs((item.Unit_Price * item.Qty) - item.Billed_Amount);
    if (delta > 0.01) reasons.push('Math mismatch between quantity, price, and billed amount');
  }

  return reasons;
}

function normalizeDateForCompare(value) {
  const raw = String(value || '').trim();
  if (!raw) return '';
  const m = raw.match(/^(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{2,4})$/);
  if (m) {
    const mm = m[1].padStart(2, '0');
    const dd = m[2].padStart(2, '0');
    const yy = m[3].length === 2 ? `20${m[3]}` : m[3];
    return `${yy}-${mm}-${dd}`;
  }
  return raw;
}

function splitCodeModifier(rawCode = '') {
  const s = String(rawCode || '').trim().toUpperCase().replace(/\s*-\s*/g, '-').replace(/\s+/g, ' ');
  const m = s.match(/^([A-Z]\d{4}|\d{5})(?:\s*-\s*|\s+)?([A-Z0-9]{2})$/);
  if (m) return { code: m[1], modifier: m[2] };
  return { code: s, modifier: '' };
}

function canonicalFingerprint(item) {
  const sm = splitCodeModifier(item.CPT || '');
  const qty = Number(item.Qty || 0);
  return {
    date: normalizeDateForCompare(item.Date),
    code: sm.code,
    modifier: (item.Modifier || sm.modifier || '').trim().toUpperCase(),
    qty: Number.isFinite(qty) ? String(Number(qty)) : '',
    amount: Number.isFinite(Number(item.Billed_Amount)) ? Number(item.Billed_Amount).toFixed(2) : '',
    desc: String(item.Description || item.desc || '').toUpperCase().replace(/\s+/g, ' ').trim()
  };
}

function classifyRowType(item) {
  const desc = String(item.Description || item.desc || '').toLowerCase();
  const code = String(item.CPT || '').toUpperCase();
  const amount = Number(item.Billed_Amount || 0);
  const paid = Number(item.Paid || 0);
  const owed = Number(item.Owed || 0);
  const qty = Number(item.Qty || 0);
  const adjustment = Number(item.Adjustment || 0);
  // Keep summary detection specific so procedure text like "total knee arthroplasty"
  // is not incorrectly classified as a subtotal/summary row.
  if (
    /\bsubtotal\b/.test(desc) ||
    /\btotal\s+(?:current\s+)?charges?\b/.test(desc) ||
    /\bbalance\s+forward\b/.test(desc) ||
    /\baccount\s+summary\b/.test(desc) ||
    /\bbalance\s+due\b/.test(desc) ||
    /^\s*totals?\s*$/i.test(desc)
  ) {
    return { rowType: 'summary/subtotal', confidence: 90, reason: 'summary keywords' };
  }
  if (/adjust|contractual|write[- ]?off|carc/.test(desc) || adjustment < 0) return { rowType: 'adjustment', confidence: 84, reason: 'adjustment marker' };
  if (/payment|remit|insurance payment|paid/.test(desc) || (paid > 0 && amount <= 0.01)) return { rowType: 'payment', confidence: 82, reason: 'payment marker' };
  if (/discount/.test(desc)) return { rowType: 'discount', confidence: 75, reason: 'discount keyword' };
  if (/tax/.test(desc)) return { rowType: 'tax', confidence: 75, reason: 'tax keyword' };
  if (/facility fee/.test(desc)) return { rowType: 'facility fee', confidence: 72, reason: 'facility fee keyword' };
  if (/pharmacy|drug|injection/.test(desc)) return { rowType: 'pharmacy item', confidence: 74, reason: 'pharmacy keyword' };
  if (/^J\d{4}$/.test(code)) return { rowType: 'pharmacy item', confidence: 78, reason: 'J-code' };
  if (/lab|imaging|x-ray|mri|ct|ultrasound|panel|assay/.test(desc)) return { rowType: 'lab/imaging', confidence: 74, reason: 'lab/imaging keyword' };
  const validCode = /^\d{5}$/.test(code) || /^[A-Z]\d{4}$/.test(code);
  if (validCode && qty > 0) {
    if (amount > 0) return { rowType: 'charge', confidence: 90, reason: 'valid charge row' };
    return { rowType: 'charge_candidate', confidence: 70, reason: 'missing amount but valid structure' };
  }
  return { rowType: 'unknown', confidence: 45, reason: 'insufficient structured indicators' };
}

function chooseMoneyMapping(money, qty) {
  const vals = (money || []).filter((n) => Number.isFinite(n));
  if (!vals.length) {
    return {
      unitPrice: null,
      billed: null,
      paid: 0,
      adjustment: 0,
      owed: 0,
      mapping_source: 'none',
      mapping_error: 999
    };
  }
  const q = Number(qty || 1) || 1;

  // If only one value appears, it's most likely the billed amount.
  if (vals.length === 1) {
    return {
      unitPrice: null,
      billed: vals[0],
      paid: 0,
      adjustment: 0,
      owed: 0,
      mapping_source: 'b-only',
      mapping_error: 0
    };
  }

  // If two values appear, prefer unit*billed relationship.
  if (vals.length === 2) {
    const [a, b] = vals;
    const expected = Math.abs((a * q) - b);
    if (expected < 0.01) {
      return {
        unitPrice: a,
        billed: b,
        paid: 0,
        adjustment: 0,
        owed: 0,
        mapping_source: 'u-b',
        mapping_error: Number(expected.toFixed(2))
      };
    }
    return {
      unitPrice: null,
      billed: Math.max(a, b),
      paid: 0,
      adjustment: 0,
      owed: 0,
      mapping_source: 'b-max',
      mapping_error: Number(expected.toFixed(2))
    };
  }

  // For 3+ values, anchor billed to the largest plausible charge.
  const maxVal = Math.max(...vals);
  let unitPrice = null;
  for (const v of vals) {
    if (Math.abs((v * q) - maxVal) < 0.01) {
      unitPrice = v;
      break;
    }
  }
  return {
    unitPrice,
    billed: maxVal,
    paid: 0,
    adjustment: 0,
    owed: 0,
    mapping_source: unitPrice ? 'b-max-heuristic-matched' : 'b-max-heuristic',
    mapping_error: unitPrice ? 0 : 5,
    priceWasDerived: !!unitPrice && maxVal > 0
  };
}

function computeFieldConfidence(item) {
  const cls = classifyRowType(item);
  const fp = canonicalFingerprint(item);
  const dateConf = isLikelyDate(item.Date) ? 85 : 35;
  const codeConf = (/^\d{5}$/.test(fp.code) || /^[A-Z]\d{4}$/.test(fp.code)) ? 90 : 30;
  const modConf = fp.modifier ? (/^[A-Z0-9]{2}$/.test(fp.modifier) ? 78 : 45) : 68;
  const qtyNum = Number(item.Qty || 0);
  const qtyConf = Number.isFinite(qtyNum) && qtyNum > 0 && qtyNum <= 50 ? 82 : 40;
  const amountNum = Number(item.Billed_Amount);
  const amountConf = Number.isFinite(amountNum) && Math.abs(amountNum) > 0 ? 90 : 35;
  const descConf = String(item.Description || item.desc || '').trim().length >= 3 ? 75 : 42;
  const unitNum = Number(item.Unit_Price);
  const arithmeticDiff = Number.isFinite(unitNum) && Number.isFinite(qtyNum) && Number.isFinite(amountNum) && qtyNum > 0
    ? Math.abs((unitNum * qtyNum) - amountNum)
    : 0;
  const majorArithmeticMismatch = Number.isFinite(unitNum) && Number.isFinite(qtyNum) && Number.isFinite(amountNum) && qtyNum > 0
    && arithmeticDiff > Math.max(1.0, Math.abs(amountNum) * 0.02);
  const fieldsPresent = [dateConf >= 70, codeConf >= 70, qtyConf >= 70, amountConf >= 70, descConf >= 65].filter(Boolean).length;
  const completenessScore = (fieldsPresent / 5) * 100;
  let overall = Math.round(dateConf*0.14 + codeConf*0.2 + modConf*0.08 + descConf*0.16 + qtyConf*0.14 + amountConf*0.2 + cls.confidence*0.08);
  overall = Math.round((overall * 0.8) + (completenessScore * 0.2));
  if (majorArithmeticMismatch) {
    overall -= 10;
  }
  const reviewReasons = [];
  if (majorArithmeticMismatch) reviewReasons.push('Major arithmetic mismatch qty × unit price != billed amount');
  return {
    row_type: cls.rowType,
    row_type_reason: cls.reason || '',
    date_confidence: dateConf,
    code_confidence: codeConf,
    modifier_confidence: modConf,
    description_confidence: descConf,
    qty_confidence: qtyConf,
    amount_confidence: amountConf,
    row_type_confidence: cls.confidence,
    overall_confidence: Math.max(0, Math.min(100, overall)),
    completeness_score: Number(completenessScore.toFixed(1)),
    arithmetic_mismatch: majorArithmeticMismatch,
    arithmetic_diff: Number(arithmeticDiff.toFixed(2)),
    confidence_penalty_applied: majorArithmeticMismatch ? 10 : 0,
    review_reasons: reviewReasons,
    canonical: fp
  };
}

function computePipelineMetrics(rows, crossCheck) {
  const list = rows || [];
  const total = Math.max(1, list.length);
  const validMoneyRate = list.filter(r => Number.isFinite(Number(r.Billed_Amount)) && Number(r.Billed_Amount) !== 0).length / total;
  const validDateRate = list.filter(r => isLikelyDate(r.Date)).length / total;
  const validCodeRate = list.filter(r => /^\d{5}$/.test(String(r.CPT || '')) || /^[A-Z]\d{4}$/.test(String(r.CPT || ''))).length / total;
  const unknownRowTypeRate = list.filter(r => String(r.row_type || '') === 'unknown').length / total;
  const duplicateSuspicionRate = list.filter(r => String(r.duplicate_status || 'none') !== 'none').length / total;
  const lowPageTrustRate = list.filter(r => Number(r.page_trust_score || 70) < 45).length / total;
  const arithmeticConsistencyRate = list.filter(r => {
    if (!Number.isFinite(Number(r.Unit_Price)) || !Number.isFinite(Number(r.Qty)) || !Number.isFinite(Number(r.Billed_Amount))) return false;
    return Math.abs((Number(r.Unit_Price) * Number(r.Qty)) - Number(r.Billed_Amount)) <= 0.01;
  }).length / total;
  return {
    validMoneyRate: Number(validMoneyRate.toFixed(3)),
    validDateRate: Number(validDateRate.toFixed(3)),
    validCodeRate: Number(validCodeRate.toFixed(3)),
    unknownRowTypeRate: Number(unknownRowTypeRate.toFixed(3)),
    duplicateSuspicionRate: Number(duplicateSuspicionRate.toFixed(3)),
    lowPageTrustRate: Number(lowPageTrustRate.toFixed(3)),
    arithmeticConsistencyRate: Number(arithmeticConsistencyRate.toFixed(3)),
    agreementScore: Number(crossCheck?.agreementScore || 0)
  };
}

function deriveDecisionState(m) {
  if ((m.unknownRowTypeRate || 0) > 0.45 || (m.validMoneyRate || 0) < 0.55 || (m.lowPageTrustRate || 0) > 0.45) return 'unsafe_to_import';
  if ((m.agreementScore || 0) < 50 || (m.arithmeticConsistencyRate || 0) < 0.45) return 'review_required';
  if ((m.agreementScore || 0) < 75 || (m.unknownRowTypeRate || 0) > 0.2 || (m.duplicateSuspicionRate || 0) > 0.25) return 'review_recommended';
  return 'auto_acceptable';
}

async function extractTextLinesFromPdf(buffer) {
  try {
    const loadingTask = pdfjsLib.getDocument({ data: new Uint8Array(buffer) });
    const pdf = await loadingTask.promise;
    const lines = [];
    const lineObjects = [];
    const pageStats = [];
    let textItemCount = 0;

    for (let p = 1; p <= pdf.numPages; p++) {
      const page = await pdf.getPage(p);
      const content = await page.getTextContent();
      textItemCount += (content.items || []).length;
      const rowsByY = new Map();
      (content.items || []).forEach((item) => {
        const y = Math.round((item.transform && item.transform[5]) || 0);
        const x = (item.transform && item.transform[4]) || 0;
        if (!rowsByY.has(y)) rowsByY.set(y, []);
        rowsByY.get(y).push({ x, str: item.str || '' });
      });
      const orderedRows = [...rowsByY.entries()]
        .sort((a, b) => b[0] - a[0])
        .map(([, cols]) => cols.sort((a, b) => a.x - b.x).map(c => c.str).join(' ').replace(/\s+/g, ' ').trim())
        .filter(Boolean);
      pageStats.push({ page: p, text_items: (content.items || []).length, row_count: orderedRows.length });
      lines.push(...orderedRows);
      orderedRows.forEach((line) => lineObjects.push({ page: p, text: line }));
    }

    return { lines, lineObjects, pageStats, hasSelectableText: textItemCount > 20 };
  } catch (_) {
    return { lines: [], lineObjects: [], pageStats: [], hasSelectableText: false };
  }
}

function parseRowsFromTextLines(linesOrObjects) {
  const out = [];
  const stats = { parsed: 0, dropped: 0, drop_reasons: {} };
  const bumpDrop = (reason) => {
    stats.dropped += 1;
    stats.drop_reasons[reason] = (stats.drop_reasons[reason] || 0) + 1;
  };
  const source = (linesOrObjects || []);
  const stitched = [];
  source.forEach((entry) => {
    const line = typeof entry === 'string' ? String(entry || '') : String(entry.text || '');
    const page = typeof entry === 'string' ? null : Number(entry.page || 0);
    if (!line.trim()) return;
    const isRowStart = /^\s*\d+\s+\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\s+([A-Z]\d{4}|\d{5})\b/.test(line);
    if (stitched.length === 0 || isRowStart) {
      stitched.push({ page, text: line });
    } else {
      stitched[stitched.length - 1].text += ` ${line}`;
    }
  });

  stitched.forEach((entry) => {
    const line = String(entry.text || '')
      .replace(/(\d{1,3}(?:,\d{3})*\.\d)\s+(\d)\b/g, '$1$2')
      .replace(/\$\s*(\d{1,3}(?:,\d{3})*\.\d)\s+(\d)\b/g, '$$$1$2')
      .replace(/\s+/g, ' ')
      .trim();
    const sourcePage = typeof entry === 'string' ? null : Number(entry.page || 0);
    const date = (line.match(/\b\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\b/) || [])[0] || '';
    const code = ([...line.matchAll(/\b([A-Z]\d{4}|\d{5})\b/g)].map(m => m[1]).find(c => /^\d{5}$/.test(c) || /^[A-Z]\d{4}$/.test(c))) || '';
    const dx = (line.match(/\b([A-TV-Z][0-9][0-9AB](?:\.[A-Z0-9]{1,4})?)\b/i) || [])[1] || '';
    const qtyFromLabel = (line.match(/\b(?:qty|units?)[:\s]*(\d+)\b/i) || [])[1];
    const qtyFromColumns = (line.match(/\b(?:[A-TV-Z][0-9][0-9AB](?:\.[A-Z0-9]{1,4})?)\s+(\d{1,2})\s+[A-Za-z]/i) || [])[1];
    const qty = parseInt(qtyFromLabel || qtyFromColumns || '1', 10);
    // Accept money tokens with or without decimal cents.
    const moneyMatches = [...line.matchAll(/(?:\$?\s*)(-?\d{1,3}(?:,\d{3})*(?:\.\d{1,2})?)/g)];
    const money = moneyMatches
      .map(m => parseFloat(String(m[1]).replace(/,/g, '')))
      .filter(n => Number.isFinite(n));
    const mapping = chooseMoneyMapping(money, qty);
    const unitPrice = mapping.unitPrice;
    const billed = mapping.billed;
    const paid = mapping.paid;
    const adjustment = mapping.adjustment;
    const owed = mapping.owed;
    if (code && billed == null && money.length > 0) {
      // Safe fallback: preserve candidate with best available amount instead of dropping.
      const fallback = Math.max(...money);
      if (Number.isFinite(fallback)) {
        mapping.billed = fallback;
        mapping.mapping_source = `${mapping.mapping_source || 'unknown'}+fallback_max_money`;
      }
    }
    const finalBilled = Number(mapping.billed);
    if (code && Number.isFinite(finalBilled) && finalBilled > 0) {
      const item = {
        Date: date,
        CPT: code,
        IsValidCode: /^\d{5}$/.test(code) || /^[A-Z]\d{4}$/.test(code),
        Qty: Number.isFinite(qty) ? qty : 1,
        Unit_Price: unitPrice,
        Modifier: '',
        Billed_Amount: finalBilled,
        Adjustment: adjustment,
        Paid: paid,
        Owed: owed,
        Description: line,
        raw_money_tokens: moneyMatches.map((m) => String(m[1] || '').trim()),
        money_mapping_source: mapping.mapping_source,
        money_mapping_error: mapping.mapping_error,
        DX: dx ? [dx] : [],
        source_page: sourcePage || null,
        page_trust_score: 70,
        extraction_confidence: 62,
        needs_manual_review: true,
        has_low_confidence_chars: false,
        review_reasons: ['Direct text extraction row (requires verification)']
      };
      Object.assign(item, computeFieldConfidence(item));
      if (Number(mapping.mapping_error || 0) > Math.max(1.0, Math.abs(Number(finalBilled || 0)) * 0.02)) {
        item.needs_manual_review = true;
        item.review_reasons = [...(item.review_reasons || []), `Money column mapping uncertainty (${mapping.mapping_source})`];
      }
      out.push(item);
      stats.parsed += 1;
    } else if (!code) {
      bumpDrop('missing_code');
    } else if (!Number.isFinite(finalBilled) || finalBilled <= 0) {
      bumpDrop('missing_or_invalid_billed_amount');
    } else {
      bumpDrop('unclassified_drop');
    }
  });
  const clipped = out.slice(0, DIRECT_TEXT_MAX_ROWS);
  if (out.length > DIRECT_TEXT_MAX_ROWS) {
    const over = out.length - DIRECT_TEXT_MAX_ROWS;
    stats.dropped += over;
    stats.drop_reasons.row_cap_applied = (stats.drop_reasons.row_cap_applied || 0) + over;
  }
  return { rows: clipped, stats };
}

function computePageTrustScores(rows, pageStats) {
  const rowList = rows || [];
  const byPage = new Map();
  rowList.forEach((r) => {
    const p = Number(r.source_page || 0);
    if (!p) return;
    if (!byPage.has(p)) byPage.set(p, []);
    byPage.get(p).push(r);
  });
  const result = {};
  (pageStats || []).forEach((stat) => {
    const page = Number(stat.page || 0);
    if (!page) return;
    const pageRows = byPage.get(page) || [];
    const total = Math.max(1, pageRows.length);
    const validCodeRate = pageRows.filter(r => /^\d{5}$/.test(String(r.CPT || '')) || /^[A-Z]\d{4}$/.test(String(r.CPT || ''))).length / total;
    const validMoneyRate = pageRows.filter(r => Number.isFinite(Number(r.Billed_Amount)) && Number(r.Billed_Amount) !== 0).length / total;
    const rowDensity = Math.min(1, Number(stat.row_count || 0) / 25);
    const score = Math.round((validCodeRate * 0.4 + validMoneyRate * 0.4 + rowDensity * 0.2) * 100);
    result[page] = {
      trust_score: Math.max(0, Math.min(100, score)),
      valid_code_rate: Number(validCodeRate.toFixed(3)),
      valid_money_rate: Number(validMoneyRate.toFixed(3)),
      row_density: Number(rowDensity.toFixed(3)),
      parsed_rows: pageRows.length,
      text_rows: Number(stat.row_count || 0)
    };
  });
  return result;
}

function applyPageTrustToRows(rows, pageTrust) {
  return (rows || []).map((r) => {
    const p = Number(r.source_page || 0);
    const trust = p && pageTrust[p] ? pageTrust[p].trust_score : 70;
    const adjusted = Math.round((Number(r.extraction_confidence || r.overall_confidence || 65) * 0.7) + (trust * 0.3));
    const lowTrust = trust < 45;
    return {
      ...r,
      page_trust_score: trust,
      extraction_confidence: Math.max(0, Math.min(100, adjusted)),
      needs_manual_review: r.needs_manual_review || lowTrust,
      review_reasons: lowTrust ? [...(r.review_reasons || []), `Low page trust score (${trust})`] : (r.review_reasons || [])
    };
  });
}

function applyDuplicateHeuristics(rows) {
  const out = (rows || []).map(r => ({ ...r }));
  for (let i = 0; i < out.length; i++) {
    for (let j = i + 1; j < out.length; j++) {
      const a = out[i];
      const b = out[j];
      const aAmt = Number(a.Billed_Amount || 0);
      const bAmt = Number(b.Billed_Amount || 0);
      const sameAmount = Math.abs(aAmt - bAmt) <= MONEY_EPSILON;
      const sim = descriptionSimilarity(a.Description || a.desc, b.Description || b.desc);
      const typeA = String(a.row_type || '').toLowerCase();
      const typeB = String(b.row_type || '').toLowerCase();
      const summaryCollision = (typeA === 'summary/subtotal' && typeB !== 'summary/subtotal') || (typeB === 'summary/subtotal' && typeA !== 'summary/subtotal');
      if (sameAmount && sim >= 0.82) {
        out[i].duplicate_status = out[i].duplicate_status === 'none' ? 'probable duplicate' : out[i].duplicate_status;
        out[j].duplicate_status = out[j].duplicate_status === 'none' ? 'probable duplicate' : out[j].duplicate_status;
      }
      if (sameAmount && summaryCollision) {
        out[i].needs_manual_review = true;
        out[j].needs_manual_review = true;
        out[i].review_reasons = [...(out[i].review_reasons || []), 'Summary/detail amount collision'];
        out[j].review_reasons = [...(out[j].review_reasons || []), 'Summary/detail amount collision'];
      }
    }
  }
  return out;
}

async function runGeminiOcrFallback(fileBuffer, mimeType) {
  const apiKey = process.env.GEMINI_API_KEY;
  if (!apiKey || !fileBuffer) return [];
  const model = 'gemini-2.5-flash-preview-04-17';
  // Comprehensive prompt — includes DX (ICD-10), financial fields, and clinical context
  // so Gemini participates fully in every downstream audit rule, not just extraction.
  const prompt = `You are a medical billing extraction specialist. Analyze this medical bill and extract every line-item service charge as a strict JSON array.

For EACH line item include ALL of these fields (use null if not found):
- Date: service date (MM/DD/YYYY)
- CPT: CPT or HCPCS code (5-digit number or letter+4 digits, e.g. 93000, G0444)
- Qty: number of units billed (integer, default 1)
- Unit_Price: per-unit charge amount (number, null if not shown)
- Modifier: 2-character modifier code if present (e.g. "25", "59", null)
- Billed_Amount: total billed amount for this line
- Paid: amount paid by insurance (0 if shown as $0 or blank)
- Adjustment: contractual adjustment amount (0 if not shown, negative if credit)
- Owed: patient responsibility / amount owed (0 if not shown)
- DX: array of ICD-10 diagnosis codes associated with this line (e.g. ["S72.001A", "I25.10"]), empty array [] if none
- Description: full service description text

Rules:
- Return ONLY a valid JSON array, no markdown, no explanation.
- If the bill shows a unit price AND a total that do not multiply correctly (qty * unit_price != billed_total), still return both values exactly as shown on the bill.
- Extract ALL ICD-10 codes you can find on the bill or associated with each line.
- Preserve exact dollar amounts as numbers without currency symbols.`;
  const body = {
    contents: [{
      parts: [
        { text: prompt },
        { inline_data: { mime_type: mimeType || 'application/pdf', data: fileBuffer.toString('base64') } }
      ]
    }],
    generationConfig: { temperature: 0.05, maxOutputTokens: 8192 }
  };
  try {
    const r = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${apiKey}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    if (!r.ok) {
      const errText = await r.text().catch(() => '');
      console.warn(`MediHelp: Gemini API error ${r.status}: ${errText.slice(0, 200)}`);
      return [];
    }
    const json = await r.json();
    const text = json?.candidates?.[0]?.content?.parts?.map(p => p.text || '').join('\n') || '';
    const cleaned = text.replace(/```json|```/gi, '').trim();
    const arr = JSON.parse(cleaned);
    if (!Array.isArray(arr)) return [];
    return arr.map((row) => {
      // Normalize DX: accept both array and comma-separated string
      let dxArr = [];
      if (Array.isArray(row.DX)) {
        dxArr = row.DX.map(d => String(d || '').trim().toUpperCase()).filter(Boolean);
      } else if (typeof row.DX === 'string' && row.DX.trim()) {
        dxArr = row.DX.split(/[,;\s]+/).map(d => d.trim().toUpperCase()).filter(Boolean);
      }
      const item = {
        Date: String(row.Date || '').trim(),
        CPT: String(row.CPT || '').trim().toUpperCase(),
        IsValidCode: /^\d{5}$/.test(String(row.CPT || '').trim()) || /^[A-Z]\d{4}$/.test(String(row.CPT || '').trim().toUpperCase()),
        Qty: Number(row.Qty || 1) || 1,
        Unit_Price: parseCurrency(row.Unit_Price),
        Modifier: String(row.Modifier || '').trim().toUpperCase(),
        Billed_Amount: parseCurrency(row.Billed_Amount) || 0,
        Adjustment: parseCurrency(row.Adjustment) || 0,
        Paid: parseCurrency(row.Paid) || 0,
        Owed: parseCurrency(row.Owed) || 0,
        DX: dxArr,
        Description: String(row.Description || '').trim(),
        extraction_confidence: 82,
        needs_manual_review: false,
        has_low_confidence_chars: false,
        review_reasons: []
      };
      Object.assign(item, computeFieldConfidence(item));
      return item;
    }).filter(rw => rw.CPT && Number.isFinite(Number(rw.Billed_Amount)));
  } catch (err) {
    console.warn('MediHelp: Gemini OCR fallback error:', String(err?.message || err).slice(0, 200));
    return [];
  }
}

/**
 * GEMINI ROLE 2: Clinical Audit Pass (Reasoning)
 * Acts as a senior auditor looking for clinical/narrative inconsistencies
 * that deterministic code might overlook.
 */
async function runGeminiClinicalAudit(items, fileBuffer, mimeType, model = "gemini-1.5-flash") {
  if (!items || items.length === 0) return [];
  const apiKey = process.env.GEMINI_API_KEY;
  if (!apiKey) return [];

  const rowSummary = items.map(i => 
    `Date: ${i.Date}, CPT: ${i.CPT}, Desc: ${i.Description}, Qty: ${i.Qty || 1}, Total: $${i.Billed_Amount}, DX: ${(i.DX || []).join(',')}`
  ).join('\n');

  const prompt = `
Act as a Senior Medical Auditor. I have extracted these rows from a medical bill. 
Review them against the original document for clinical anomalies.

STRUCTURED DATA:
${rowSummary}

INSTRUCTIONS:
1. Identify high-risk clinical mismatches (e.g., Cardiology procedures paired with Orthopedic diagnoses).
2. Identify "Hidden Denials" found in footnotes or plan remarks (e.g. CO-197, CO-16, "Prior Auth Missing").
3. Check for Quantity Paradoxes (e.g., description says "Double treatment" or "8 units" but Qty column is "1").
4. Check for Medically Unnecessary Screenings (e.g., Depression screenings on acute visits without Wellness context).
5. Output ONLY a valid JSON array of finding objects.

JSON Format:
[
  {
    "type": "Warning", 
    "title": "DX-Procedure Mismatch (CO-11 Risk)",
    "detail": "Detailed explanation...",
    "code": "CPT_CODE",
    "severity": "danger",
    "confidence": 95
  }
]
`;

  const body = {
    contents: [{
      parts: [
        { text: prompt },
        { inline_data: { mime_type: mimeType || 'application/pdf', data: fileBuffer.toString('base64') } }
      ]
    }],
    generationConfig: { temperature: 0.1, maxOutputTokens: 2048, response_mime_type: "application/json" }
  };

  try {
    const r = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${apiKey}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    if (!r.ok) return [];
    const json = await r.json();
    const text = json?.candidates?.[0]?.content?.parts?.map(p => p.text || '').join('\n') || '';
    const cleaned = text.replace(/```json|```/gi, '').trim();
    const arr = JSON.parse(cleaned);
    return Array.isArray(arr) ? arr : [];
  } catch (err) {
    console.warn('MediHelp: Gemini Clinical Pass error:', err.message);
    return [];
  }
}

function scoreExtractionCandidate(rows, crossCheckScore = 0) {
  const list = rows || [];
  if (!list.length) return 0;
  const total = list.length;
  const avgConf = list.reduce((s, r) => s + Number(r.overall_confidence || r.extraction_confidence || 0), 0) / total;
  const validCodeRate = list.filter(r => /^\d{5}$/.test(String(r.CPT || '')) || /^[A-Z]\d{4}$/.test(String(r.CPT || ''))).length / total;
  const validMoneyRate = list.filter(r => Number.isFinite(Number(r.Billed_Amount)) && Number(r.Billed_Amount) !== 0).length / total;
  const reviewRate = list.filter(r => !!r.needs_manual_review).length / total;
  return Math.round((avgConf * 0.4) + (validCodeRate * 100 * 0.25) + (validMoneyRate * 100 * 0.2) + (crossCheckScore * 0.2) - (reviewRate * 100 * 0.15));
}

function getExtractionHealth(rows) {
  const list = rows || [];
  const total = Math.max(1, list.length);
  const zeroOrMissingAmountRate = list.filter(r => !Number.isFinite(Number(r.Billed_Amount)) || Number(r.Billed_Amount) <= 0).length / total;
  const unknownRowTypeRate = list.filter(r => String(r.row_type || '').toLowerCase() === 'unknown').length / total;
  return {
    zeroOrMissingAmountRate: Number(zeroOrMissingAmountRate.toFixed(3)),
    unknownRowTypeRate: Number(unknownRowTypeRate.toFixed(3)),
    collapsed: list.length >= 5 && (zeroOrMissingAmountRate > 0.55 || unknownRowTypeRate > 0.65)
  };
}

function evaluateExtractionCandidate(rows) {
  const list = rows || [];
  const total = Math.max(1, list.length);
  const validCodeRate = list.filter(r => /^\d{5}$/.test(String(r.CPT || '')) || /^[A-Z]\d{4}$/.test(String(r.CPT || ''))).length / total;
  const validMoneyRate = list.filter(r => Number.isFinite(Number(r.Billed_Amount)) && Number(r.Billed_Amount) > 0).length / total;
  const unknownRowTypeRate = list.filter(r => String(r.row_type || '').toLowerCase() === 'unknown').length / total;
  const avgConfidence = list.reduce((s, r) => s + Number(r.overall_confidence || r.extraction_confidence || 0), 0) / total;
  const rowCountFactor = Math.min(1, list.length / 30);
  const health = getExtractionHealth(list);
  let score =
    (validCodeRate * 35) +
    (validMoneyRate * 35) +
    ((1 - unknownRowTypeRate) * 20) +
    ((Math.max(0, Math.min(100, avgConfidence)) / 100) * 10) +
    (rowCountFactor * 10);
  if (health.collapsed) score -= 30;
  return {
    score: Number(score.toFixed(2)),
    validCodeRate: Number(validCodeRate.toFixed(3)),
    validMoneyRate: Number(validMoneyRate.toFixed(3)),
    unknownRowTypeRate: Number(unknownRowTypeRate.toFixed(3)),
    avgConfidence: Number(avgConfidence.toFixed(2)),
    rowCount: list.length,
    collapsed: health.collapsed
  };
}

function rankHighValueFindings(findings) {
  const priority = (f) => {
    const title = String(f.title || '').toLowerCase();
    if (/bundle|ncci/.test(title)) return 100;
    if (/duplicate/.test(title)) return 95;
    if (/frequency|mue/.test(title)) return 92;
    if (/pricing variance|overcharge|high pricing|excessive/.test(title)) return 90;
    if (/upcoding|high-level/.test(title)) return 88;
    if (/math mismatch|rounding|insufficient/.test(title)) return 45;
    return 60;
  };
  return [...(findings || [])].sort((a, b) => priority(b) - priority(a)).slice(0, 5);
}

function descriptionSimilarity(a, b) {
  const ta = new Set(String(a || '').toLowerCase().replace(/[^\w\s]/g, ' ').split(/\s+/).filter(t => t.length > 2));
  const tb = new Set(String(b || '').toLowerCase().replace(/[^\w\s]/g, ' ').split(/\s+/).filter(t => t.length > 2));
  if (!ta.size || !tb.size) return 0;
  let intersect = 0;
  ta.forEach((t) => { if (tb.has(t)) intersect++; });
  const union = new Set([...ta, ...tb]).size || 1;
  return intersect / union;
}

function buildComparisonSummary(primaryRows, verifyRows) {
  const a = primaryRows || [];
  const b = verifyRows || [];
  if (!a.length || !b.length) {
    return { agreementScore: 0, notes: ['Insufficient overlap for cross-check'], verified: false };
  }

  const usedVerify = new Set();
  let dateMatch = 0;
  let codeMatch = 0;
  let amountMatch = 0;
  let qtyMatch = 0;
  let descSimTotal = 0;

  a.forEach((rowA) => {
    let bestIndex = -1;
    let bestScore = -1;
    b.forEach((rowB, idx) => {
      if (usedVerify.has(idx)) return;
      const dateScore = normalizeDateForCompare(rowA.Date) === normalizeDateForCompare(rowB.Date) ? 1 : 0;
      const codeScore = splitCodeModifier(rowA.CPT).code === splitCodeModifier(rowB.CPT).code ? 1 : 0;
      const amountA = Number(rowA.Billed_Amount || 0);
      const amountB = Number(rowB.Billed_Amount || 0);
      const amountDelta = Math.abs(amountA - amountB);
      const amountScore = amountDelta <= 0.01 ? 1 : (amountDelta <= 1 ? 0.5 : 0);
      const qtyA = Number(rowA.Qty || 0);
      const qtyB = Number(rowB.Qty || 0);
      const qtyScore = (qtyA > 0 && qtyB > 0 && Math.abs(qtyA - qtyB) <= 0.01) ? 1 : 0;
      const descScore = descriptionSimilarity(rowA.Description || rowA.desc, rowB.Description || rowB.desc);
      const combined = (dateScore * 0.2) + (codeScore * 0.3) + (amountScore * 0.3) + (qtyScore * 0.1) + (descScore * 0.1);
      if (combined > bestScore) {
        bestScore = combined;
        bestIndex = idx;
      }
    });

    if (bestIndex >= 0) {
      usedVerify.add(bestIndex);
      const best = b[bestIndex];
      if (normalizeDateForCompare(rowA.Date) === normalizeDateForCompare(best.Date)) dateMatch++;
      if (splitCodeModifier(rowA.CPT).code === splitCodeModifier(best.CPT).code) codeMatch++;
      if (Math.abs(Number(rowA.Billed_Amount || 0) - Number(best.Billed_Amount || 0)) <= MONEY_EPSILON) amountMatch++;
      if (Math.abs(Number(rowA.Qty || 0) - Number(best.Qty || 0)) <= 0.01 && Number(rowA.Qty || 0) > 0 && Number(best.Qty || 0) > 0) qtyMatch++;
      descSimTotal += descriptionSimilarity(rowA.Description || rowA.desc, best.Description || best.desc);
    }
  });

  const base = Math.max(1, a.length);
  const dateRate = dateMatch / base;
  const codeRate = codeMatch / base;
  const amountRate = amountMatch / base;
  const qtyRate = qtyMatch / base;
  const descRate = descSimTotal / base;
  const rowCountDelta = Math.abs(a.length - b.length);
  const weighted = (dateRate * 0.2) + (codeRate * 0.3) + (amountRate * 0.3) + (qtyRate * 0.1) + (descRate * 0.1);
  const rowPenalty = rowCountDelta <= 2 ? 0 : Math.min(0.2, rowCountDelta / Math.max(a.length, b.length, 1) * 0.2);
  const agreementScore = Math.min(100, Math.max(0, Math.round((weighted - rowPenalty) * 100)));
  const verified = agreementScore >= 70;
  return {
    agreementScore,
    field_scores: {
      date_match: Number((dateRate * 100).toFixed(1)),
      code_match: Number((codeRate * 100).toFixed(1)),
      amount_match: Number((amountRate * 100).toFixed(1)),
      qty_match: Number((qtyRate * 100).toFixed(1)),
      desc_similarity: Number((descRate * 100).toFixed(1))
    },
    verified,
    notes: [
      `Primary rows: ${a.length}`,
      `Verification rows: ${b.length}`,
      `Field-level weighted score applied`,
      `Row-count delta: ${rowCountDelta}`
    ]
  };
}

const PROVIDER_TEMPLATES = [
  {
    id: 'generic_hospital_statement_v1',
    matchAnyPhrases: ['patient account', 'statement date', 'account number', 'date of service', 'amount due'],
    headerAliases: {
      date: ['date of service', 'service date', 'dos', 'svc date', 'date'],
      cpt: ['cpt', 'hcpcs', 'procedure code', 'service code', 'code'],
      qty: ['qty', 'units', 'quantity'],
      unit_price: ['unit price', 'rate', 'fee', 'charge each'],
      billed_amount: ['total charge', 'total', 'amount', 'billed amount', 'billed', 'charge amount', 'charges', 'owed'],
      modifier: ['modifier', 'mod'],
      adjustment: ['adjustment', 'contractual', 'carc', 'write off'],
      dx: ['dx', 'diagnosis', 'icd', 'icd-10']
    }
  },
  {
    id: 'facility_revenue_table_v1',
    matchAnyPhrases: ['revenue code', 'service description', 'line charge', 'patient responsibility'],
    headerAliases: {
      date: ['service date', 'date'],
      cpt: ['procedure code', 'hcpcs', 'cpt', 'code'],
      qty: ['units', 'qty'],
      unit_price: ['rate', 'unit charge'],
      billed_amount: ['line charge', 'total charge', 'charges', 'amount', 'billed', 'owed'],
      modifier: ['modifier', 'mod'],
      adjustment: ['adjustment', 'contractual'],
      dx: ['diagnosis', 'dx', 'icd']
    }
  },
  {
    id: 'cms_itemized_style_v1',
    matchAnyPhrases: ['hcfa', 'ub-04', 'claim number', 'place of service'],
    headerAliases: {
      date: ['from date', 'to date', 'date of service', 'date'],
      cpt: ['cpt/hcpcs', 'hcpcs', 'cpt', 'procedure'],
      qty: ['units', 'qty'],
      unit_price: ['allowed', 'rate', 'unit price'],
      billed_amount: ['charged', 'billed', 'submitted charges', 'total', 'amount', 'owed'],
      modifier: ['modifier'],
      adjustment: ['adjustment'],
      dx: ['icd', 'diagnosis', 'dx']
    }
  }
];

function detectProviderTemplate(blocks, blockMap) {
  const sample = [];
  const textBlocks = blocks.filter(b => b.BlockType === 'LINE' || b.BlockType === 'WORD').slice(0, 800);
  textBlocks.forEach((b) => {
    if (b.BlockType === 'LINE' && b.Text) sample.push(b.Text.toLowerCase());
    else if (b.BlockType === 'WORD' && b.Text) sample.push(b.Text.toLowerCase());
  });
  const haystack = sample.join(' ');

  let best = null;
  let bestScore = 0;
  PROVIDER_TEMPLATES.forEach((tpl) => {
    const score = tpl.matchAnyPhrases.reduce((acc, phrase) => acc + (haystack.includes(phrase) ? 1 : 0), 0);
    if (score > bestScore) {
      bestScore = score;
      best = tpl;
    }
  });

  if (!best || bestScore < 2) {
    return {
      id: 'default_generic',
      headerAliases: PROVIDER_TEMPLATES[0].headerAliases,
      confidence: 0
    };
  }
  const confidence = Math.min(100, Math.round((bestScore / Math.max(1, best.matchAnyPhrases.length || 1)) * 100));
  return {
    ...best,
    confidence
  };
}

function mapHeadersFromAliases(text, aliases) {
  const t = String(text || '').trim().toLowerCase();
  return aliases.find(a => t === a || t.includes(a));
}

function normalizeTextractOutput(blocks) {
  const blockMap = {};
  blocks.forEach(b => blockMap[b.Id] = b);
  const template = detectProviderTemplate(blocks, blockMap);
  
  const tables = blocks.filter(b => b.BlockType === "TABLE");
  const keyValues = blocks.filter(b => b.BlockType === "KEY_VALUE_SET");

  let normalizedItems = [];
  let foundTotals = []; // { val, priority }

  // 1. Extract Grand Total from KEY_VALUE_SET (FORMS)
  keyValues.forEach(kv => {
    if (kv.EntityTypes && kv.EntityTypes.includes("KEY")) {
      const { text: keyText } = getText(kv, blockMap, 0); // Get key text regardless of confidence
      const lowerKey = keyText.toLowerCase();
      
      let priority = 0;
      if (lowerKey.includes("balance due") || lowerKey.includes("amount due")) priority = 3;
      else if (lowerKey.includes("total") && !lowerKey.includes("sub")) priority = 2;
      else if (lowerKey.includes("amount") || lowerKey.includes("balance")) priority = 1;

      if (priority > 0) {
        let valText = null;
        if (kv.Relationships) {
          kv.Relationships.forEach(rel => {
            if (rel.Type === "VALUE") {
              rel.Ids.forEach(id => {
                const valBlock = blockMap[id];
                valText = getText(valBlock, blockMap, 0).text;
              });
            }
          });
        }
        if (valText) {
          const parsedVal = parseCurrency(valText);
          if (parsedVal !== null && parsedVal !== 0) {
             foundTotals.push({ val: parsedVal, priority });
          }
        }
      }
    }
  });

  // Fallback: If no keywords found, find the largest numeric value in the forms layer
  const grandTotal = foundTotals.length > 0 
    ? foundTotals.sort((a,b) => b.priority - a.priority || b.val - a.val)[0].val 
    : null;

  // 2. Extract Line Items from TABLES
  tables.forEach(tableBlock => {
    const grid = {}; // grid[row][col] = { text, lowConf }
    let maxRow = 0;
    let maxCol = 0;

    if (tableBlock.Relationships) {
      tableBlock.Relationships.forEach(rel => {
        if (rel.Type === "CHILD") {
          rel.Ids.forEach(id => {
            const cellBlock = blockMap[id];
            if (cellBlock && cellBlock.BlockType === "CELL") {
              const r = cellBlock.RowIndex;
              const c = cellBlock.ColumnIndex;
              if (r > maxRow) maxRow = r;
              if (c > maxCol) maxCol = c;
              
              if (!grid[r]) grid[r] = {};
              grid[r][c] = getText(cellBlock, blockMap, 85);
            }
          });
        }
      });
    }

    if (maxRow > 0) {
      let headers = {};
      const alias = template.headerAliases || PROVIDER_TEMPLATES[0].headerAliases;
      
      // Multi-row header support: check top 2 rows
      const headerRows = [1, 2];
      headerRows.forEach(hr => {
        for (let c = 1; c <= maxCol; c++) {
          const cell = grid[hr] ? grid[hr][c] : null;
          if (!cell) continue;
          const text = cell.text.toLowerCase();

          if (!headers.date && mapHeadersFromAliases(text, alias.date || [])) headers.date = c;
          else if (!headers.cpt && mapHeadersFromAliases(text, alias.cpt || [])) headers.cpt = c;
          else if (!headers.qty && mapHeadersFromAliases(text, alias.qty || [])) headers.qty = c;
          else if (!headers.unit_price && mapHeadersFromAliases(text, alias.unit_price || [])) headers.unit_price = c;
          else if (!headers.billed_amount && mapHeadersFromAliases(text, alias.billed_amount || [])) headers.billed_amount = c;
          else if (!headers.modifier && mapHeadersFromAliases(text, alias.modifier || [])) headers.modifier = c;
          else if (!headers.adjustment && mapHeadersFromAliases(text, alias.adjustment || [])) headers.adjustment = c;
          else if (!headers.dx && mapHeadersFromAliases(text, alias.dx || [])) headers.dx = c;
        }
      });

      // Template-based fallback mapping when headers are weak/noisy.
      if (!headers.cpt || !headers.billed_amount) {
        const moneyColumnStats = [];
        for (let c = 1; c <= maxCol; c++) {
          const colSamples = [];
          const moneyVals = [];
          for (let r = 2; r <= Math.min(maxRow, 8); r++) {
            const v = (grid[r]?.[c]?.text || '').trim();
            if (!v) continue;
            colSamples.push(v);
            const pv = parseCurrency(v);
            if (Number.isFinite(pv)) moneyVals.push(Math.abs(pv));
          }
          if (!colSamples.length) continue;

          const codeHits = colSamples.filter(v => /^\d{5}$/.test(v) || /^[A-Z]\d{4}$/.test(v)).length;
          const moneyHits = colSamples.filter(v => parseCurrency(v) !== null).length;
          const dateHits = colSamples.filter(v => isLikelyDate(v)).length;
          const moneyAvg = moneyVals.length ? (moneyVals.reduce((s, n) => s + n, 0) / moneyVals.length) : 0;
          if (moneyHits >= 2) moneyColumnStats.push({ c, moneyHits, moneyAvg });

          if (!headers.cpt && codeHits >= 2) headers.cpt = c;
          if (!headers.billed_amount && moneyHits >= 2) headers.billed_amount = c;
          if (!headers.date && dateHits >= 2) headers.date = c;
        }
        // If money mapping was guessed, prefer the money-heavy column as billed.
        if (moneyColumnStats.length > 0) {
          moneyColumnStats.sort((a, b) => (b.moneyAvg - a.moneyAvg) || (b.moneyHits - a.moneyHits));
          headers.billed_amount = moneyColumnStats[0].c;
        }
      }

      if (headers.cpt || headers.billed_amount) {
        // Track the lowest row that contained a header
        let headerRowFoundIn = 1;
        headerRows.forEach(hr => {
          for (let c = 1; c <= maxCol; c++) {
            const cell = grid[hr]?.[c];
            if (!cell) continue;
            const text = cell.text.toLowerCase();
            if (text === 'cpt' || text === 'date' || text === 'code' || text.includes('charge')) {
              headerRowFoundIn = hr;
            }
          }
        });
        const dataStart = headerRowFoundIn + 1; 
        
        for (let r = dataStart; r <= maxRow; r++) {
          const rowData = grid[r] || {};
          const cellCpt = rowData[headers.cpt] || { text: "", hasLowConfidence: false };
          const cellAmt = rowData[headers.billed_amount] || { text: "", hasLowConfidence: false };
          
          if (cellCpt.text.trim() !== "" || cellAmt.text.trim() !== "") {
            let finalQtyStr = headers.qty ? (rowData[headers.qty]?.text || "1") : "1";

            // Use parseCurrency for all monetary fields — handles ($1,234.00), $500 CR etc.
            let billedAmount = parseCurrency(cellAmt.text) ?? 0.00;
            let unitPrice    = headers.unit_price ? parseCurrency(rowData[headers.unit_price]?.text) : null;
            const adjRawVal    = headers.adjustment ? parseCurrency(rowData[headers.adjustment]?.text) : null;
            // Normalize: adjustments reduce billed amount (negative in our model)
            const adjValue     = adjRawVal !== null ? (adjRawVal > 0 ? -adjRawVal : adjRawVal) : 0;
            const adjRaw       = adjRawVal !== null ? String(adjRawVal) : null; // for Paid calc gate

            const dxRaw = headers.dx ? (rowData[headers.dx]?.text || "").trim() : "";
            const ICD10_SERVER_RE = /\b([A-Z]\d{2}(?:\.\w{1,4})?)\b/g;
            const dxCodes = dxRaw ? [...dxRaw.matchAll(ICD10_SERVER_RE)].map(m => m[1]) : [];

            const isValidCode = cellCpt.text.trim() !== "" && (
              /^\d{5}$/.test(cellCpt.text.trim()) || /^[A-Z]\d{4}$/.test(cellCpt.text.trim())
            );

            const qty = parseFloat(finalQtyStr) || 1;
            const rowMoneyValues = Object.values(rowData)
              .map((cell) => parseCurrency(cell?.text))
              .filter((n) => Number.isFinite(n));
            const fallbackMoneyMap = rowMoneyValues.length > 0 ? chooseMoneyMapping(rowMoneyValues, qty) : null;

            // If billed column mapping is weak/empty, recover billed from row-level money values.
            if ((!Number.isFinite(billedAmount) || billedAmount <= 0) && fallbackMoneyMap && Number.isFinite(fallbackMoneyMap.billed) && fallbackMoneyMap.billed > 0) {
              billedAmount = fallbackMoneyMap.billed;
            } else if (Number.isFinite(unitPrice) && Number.isFinite(billedAmount) && billedAmount > 0 && qty > 0 && billedAmount < unitPrice) {
              // Guard against swapped unit/billed mapping on noisy OCR tables.
              const maxMoney = rowMoneyValues.reduce((m, n) => Math.max(m, n), Number.NEGATIVE_INFINITY);
              if (Number.isFinite(maxMoney) && maxMoney > billedAmount) billedAmount = maxMoney;
            }
            if ((!Number.isFinite(unitPrice) || unitPrice <= 0) && fallbackMoneyMap && Number.isFinite(fallbackMoneyMap.unitPrice) && fallbackMoneyMap.unitPrice > 0) {
              unitPrice = fallbackMoneyMap.unitPrice;
            }
            const coveredCols = new Set(Object.values(headers).filter((v) => Number.isFinite(v)));
            const derivedDescription = Object.entries(rowData)
              .filter(([col]) => !coveredCols.has(Number(col)))
              .map(([, cell]) => String(cell?.text || '').trim())
              .filter(Boolean)
              .join(' ')
              .replace(/\s+/g, ' ')
              .trim();

            // Internal anomaly detection
            let mappingError = 0;
            if (unitPrice && qty && Number.isFinite(unitPrice) && Number.isFinite(billedAmount)) {
              mappingError = Math.abs((unitPrice * qty) - billedAmount);
            }

            // Confidence Scoring
            let score = 100;
            if (!isValidCode) score -= 40;
            if (billedAmount === 0) score -= 30;
            if (!headers.date || !rowData[headers.date]?.text) score -= 15;
            if (rowData[headers.cpt]?.hasLowConfidence || rowData[headers.billed_amount]?.hasLowConfidence) score -= 20;
            if (mappingError > 1.0) score -= 25;

            const candidate = {
              Date: headers.date ? (rowData[headers.date]?.text || "").trim() : "",
              CPT: cellCpt.text.trim(),
              IsValidCode: isValidCode,
              Qty: qty,
              Unit_Price: unitPrice,
              Modifier: headers.modifier ? (rowData[headers.modifier]?.text || "").trim() : "",
              Billed_Amount: billedAmount,
              Adjustment: adjValue,
              Paid: adjRaw !== null ? Math.max(0, billedAmount + adjValue) : 0,
              Description: derivedDescription,
              DX: dxCodes,
              extraction_confidence: Math.max(0, score),
              needs_manual_review: score < 85 || mappingError > 1.0,
              has_low_confidence_chars: cellCpt.hasLowConfidence || cellAmt.hasLowConfidence,
              money_mapping_source: fallbackMoneyMap ? fallbackMoneyMap.mapping_source : (headers.billed_amount ? 'column_map' : 'none'),
              money_mapping_error: mappingError,
              priceWasDerived: fallbackMoneyMap ? !!fallbackMoneyMap.priceWasDerived : false
            };
            Object.assign(candidate, computeFieldConfidence(candidate));
            const reviewReasons = collectRowQualityFlags(candidate);
            candidate.review_reasons = reviewReasons;
            candidate.needs_manual_review = candidate.needs_manual_review || reviewReasons.length > 0;
            normalizedItems.push(candidate);
          }
        }
      }
    }
  });

  return {
    items: normalizedItems,
    grandTotal,
    detectedTemplate: template.id,
    templateConfidence: Number(template.confidence || 0)
  };
}

// ARITHMETIC ENGINE: Runs deterministic validation checks
// Server-side helper: validates CPT (5-digit) or HCPCS L2 (letter+4-digit)
function isValidBillingCode(code) {
  if (!code || typeof code !== 'string') return false;
  const c = code.trim().toUpperCase();
  if (/^\d{5}$/.test(c)) {
    const n = parseInt(c, 10);
    return n >= 10000 && n <= 99999;
  }
  return /^[A-Z]\d{4}$/.test(c); // HCPCS Level II
}

function runArithmeticEngine(items, grandTotal) {
  let findings = [];
  let calculatedSum = 0;
  let seenCodes = new Set();

  // Modifiers that justify distinct procedures/duplicates
  const distinctModifiers = ['59', '76', '91', 'RT', 'LT', 'XE', 'XS', 'XP', 'XU'];

  items.forEach((item, index) => {
    // Skip rows whose code is not a valid CPT or HCPCS L2 format
    if (item.CPT && !isValidBillingCode(item.CPT)) {
      findings.push({
        type: 'Warning',
        code: item.CPT,
        title: 'Invalid Billing Code',
        reason: `"${item.CPT}" does not match any valid CPT (10000–99999) or HCPCS Level II (Letter + 4 digits) format. Possible ZIP code or data-entry error.`
      });
    }

    // 1. Accumulate Summation
    calculatedSum += item.Billed_Amount;

    // 2. Line Item Math Check
    if (item.Unit_Price !== null) {
      const expectedTotal = item.Qty * item.Unit_Price;
      const difference    = Math.abs(expectedTotal - item.Billed_Amount);
      if (difference > MONEY_EPSILON) {
        findings.push({
          type: 'Warning',
          code: item.CPT,
          title: 'Math Mismatch',
          reason: `Line item math error. Expected $${expectedTotal.toFixed(2)} (${item.Qty} × $${item.Unit_Price.toFixed(2)}) but billed $${item.Billed_Amount.toFixed(2)}. (CMS Claims Processing Manual, Chapter 1 §30.2.5)`
        });
      }
    }

    // 3. CARC Adjustment consistency check
    if (item.Adjustment && item.Adjustment < 0) {
      const expectedPaid = item.Billed_Amount + item.Adjustment;
      if (expectedPaid < 0) {
        findings.push({
          type: 'Danger',
          code: item.CPT,
          title: 'Credit Balance Liability (CMS Compliance)',
          reason: `Adjustment ($${item.Adjustment.toFixed(2)}) exceeds billed amount ($${item.Billed_Amount.toFixed(2)}). The resulting credit balance ($${Math.abs(expectedPaid).toFixed(2)}) must be refunded within 60 days per CMS Chapter 4 §50.`
        });
      }
    }

    // 4. Duplicate Detection Check
    if (item.CPT && item.CPT !== '') {
      const codeKey = `${item.Date}-${item.CPT}`;
      if (seenCodes.has(codeKey)) {
        let hasDistinctModifier = false;
        if (item.Modifier) {
          const presentModifiers = item.Modifier.split(',').map(m => m.trim().toUpperCase());
          hasDistinctModifier = presentModifiers.some(m => distinctModifiers.includes(m));
        }
        if (!hasDistinctModifier) {
          findings.push({
            type: 'Danger',
            code: item.CPT,
            title: 'Potential Duplicate',
            reason: `Duplicate charge for code ${item.CPT} on ${item.Date || 'same date'}. No distinct unbundling modifier detected. (CMS Claims Processing Manual, Chapter 4 §20.4.2)`
          });
        }
      }
      seenCodes.add(codeKey);
    }
  });

  // 4. Summation Math Check
  if (grandTotal !== null) {
      const difference = Math.abs(calculatedSum - grandTotal);
      if (difference > MONEY_EPSILON) {
         findings.push({
            type: "Warning",
            code: "DOCUMENT",
            title: "Summation Error",
            reason: `Total line items ($${calculatedSum.toFixed(2)}) do not match Document Grand Total ($${grandTotal.toFixed(2)}).`
         });
      }
  }

  return { findings, calculatedSum, grandTotal };
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function runTextractWithRetry(fileBuffer) {
  if (!fileBuffer || !Buffer.isBuffer(fileBuffer) || fileBuffer.length === 0) {
    throw new Error('Empty document payload');
  }
  if (fileBuffer.length > TEXTRACT_BYTES_LIMIT) {
    throw new Error(`Document exceeds Textract byte limit (${Math.round(TEXTRACT_BYTES_LIMIT / (1024 * 1024))}MB)`);
  }
  let lastErr = null;
  for (let attempt = 1; attempt <= TEXTRACT_MAX_ATTEMPTS; attempt++) {
    try {
      if (attempt > 1) {
        console.warn(`MediHelp: Textract retry attempt ${attempt}/${TEXTRACT_MAX_ATTEMPTS}`);
      }
      const resp = await textractClient.send(new AnalyzeDocumentCommand({
        Document: { Bytes: fileBuffer },
        FeatureTypes: ["TABLES", "FORMS"]
      }));
      return { data: resp, attempts: attempt };
    } catch (err) {
      lastErr = err;
      const msg = String(err?.message || '').toLowerCase();
      const likelyTransient =
        msg.includes('timeout') ||
        msg.includes('throttl') ||
        msg.includes('internal') ||
        msg.includes('service unavailable') ||
        msg.includes('network') ||
        msg.includes('econn') ||
        msg.includes('socket') ||
        msg.includes('rate exceeded');
      if (!likelyTransient || attempt === TEXTRACT_MAX_ATTEMPTS) break;
      const waitMs = TEXTRACT_BACKOFF_MS[attempt] || (attempt * 1200);
      await sleep(waitMs);
    }
  }
  throw lastErr || new Error('Textract failed after retries');
}

async function normalizePdfForTextract(buffer) {
  const pdfDoc = await PDFDocument.load(buffer, { ignoreEncryption: true });
  const normalizedBytes = await pdfDoc.save({
    useObjectStreams: false,
    addDefaultPage: false,
    updateFieldAppearances: false
  });
  return Buffer.from(normalizedBytes);
}

// CLINICAL ENGINE: Uses Supabase database for Pricing & NCCI unbundling checks
async function runClinicalEngine(items) {
  if (!supabase) {
    return { clinicalFindings: [], savingsOpportunity: 0, totalBenchmark: 0 };
  }

  let clinicalFindings = [];
  let totalBenchmark = 0;
  let savingsOpportunity = 0;

  // 1. UNIQUE CODES for Bulk Pricing Lookup
  const allCodes = [...new Set(items.map(i => (i.CPT || "").trim().toUpperCase()).filter(c => c && c.length >= 2))];
  const cptCodes = allCodes.filter(c => /^[0-9]{5}$/.test(c));
  const drugCodes = allCodes.filter(c => /^[A-Z][0-9]{4}$/.test(c)); // J, Q, P, V codes
  
  // Parallel Fetch from both tables
  const [cptRes, drugRes] = await Promise.all([
    supabase.from('cpt_medicare_fees').select('cpt_code, base_price, description').in('cpt_code', cptCodes),
    supabase.from('hcpcs_drug_fees').select('hcpcs_code, payment_limit, short_description').in('hcpcs_code', drugCodes)
  ]);

  const feeMap = {};
  (cptRes.data || []).forEach(f => { feeMap[f.cpt_code] = { price: f.base_price, type: 'CPT', desc: f.description }; });
  (drugRes.data || []).forEach(f => { feeMap[f.hcpcs_code] = { price: f.hcpcs_code, type: 'DRUG', desc: f.short_description }; });

  // DB Health Check: If we have codes but zero benchmark data, warn the user
  const foundFeesCount = (cptRes.data || []).length + (drugRes.data || []).length;
  if (allCodes.length > 0 && foundFeesCount === 0) {
    clinicalFindings.push({
      type: "System",
      title: "Clinical Datasets Incomplete",
      detail: "Audit ran, but the Medicare benchmark database returned no matches for these codes. Pricing variance and specialty rules were skipped. Verify Supabase seed state.",
      severity: "warn",
      confidence: 100
    });
  }

  // 2. PRICING VALIDATION
  items.forEach(item => {
    const code = (item.CPT || "").trim().toUpperCase();
    const feeData = feeMap[code];
    if (feeData) {
      const benchmark = feeData.price;
      const totalBenchmarkValue = benchmark * item.Qty;
      totalBenchmark += totalBenchmarkValue;
      
      // RULE: Flag if charge is > 200% of Medicare
      if (item.Billed_Amount > (totalBenchmarkValue * 2.0)) {
        const typeLabel = feeData.type === 'DRUG' ? 'Drug Pricing Variance' : 'High Pricing Variance';
        const unitDetail = feeData.type === 'DRUG' ? `per unit (${feeData.desc})` : '';
        
        clinicalFindings.push({
          type: "Warning",
          code: code,
          title: typeLabel,
          reason: `Medicare benchmark is ~$${benchmark.toFixed(2)} ${unitDetail}, total fair market ~$${totalBenchmarkValue.toFixed(2)}. But you billed $${item.Billed_Amount.toFixed(2)} (${((item.Billed_Amount / totalBenchmarkValue) * 100).toFixed(0)}% of Medicare).`
        });
        
        // Accumulate potential savings vs 150% benchmark
        savingsOpportunity += (item.Billed_Amount - (totalBenchmarkValue * 1.5));
      }
    }
  });

  // 3. NCCI UNBUNDLING VALIDATION (Pairwise check for same-date items)
  const itemsByDate = items.reduce((acc, item) => {
    if (!acc[item.Date]) acc[item.Date] = [];
    acc[item.Date].push(item);
    return acc;
  }, {});

  const allCodesAcrossDates = [...new Set(
    items.map(i => String(i.CPT || '').trim().toUpperCase()).filter(c => c && c.length >= 5)
  )];

  const { data: allNcciEdits } = allCodesAcrossDates.length > 1
    ? await supabase
      .from('ncci_ptp_edits')
      .select('column1_code, column2_code, modifier_allowed')
      .in('column1_code', allCodesAcrossDates)
      .in('column2_code', allCodesAcrossDates)
    : { data: [] };

  const ncciSavingsSeen = new Set();

  for (const date in itemsByDate) {
    const dateItems = itemsByDate[date];
    if (dateItems.length < 2) continue;
    if (!allNcciEdits || allNcciEdits.length === 0) continue;

    const codesForDateSet = new Set(dateItems.map(i => String(i.CPT || '').trim().toUpperCase()).filter(c => c));
    const dateEdits = allNcciEdits.filter(
      (e) => codesForDateSet.has(e.column1_code) && codesForDateSet.has(e.column2_code)
    );

    dateEdits.forEach(edit => {
      // Find the specific line item for the component (Column 2)
      const componentItem = dateItems.find(i => i.CPT === edit.column2_code);
      const primaryItem = dateItems.find(i => i.CPT === edit.column1_code);

      if (!componentItem) return; // Guard: skip if component code not found on this date

      if (edit.modifier_allowed === '0') {
        clinicalFindings.push({
          type: "Danger",
          code: edit.column2_code,
          title: "Clinical Bundle Violation",
          reason: `Code ${edit.column2_code} is an inseparable component of ${edit.column1_code} and should not be billed separately per CMS NCCI rules.`
        });
        const key = `${date}|${edit.column1_code}|${edit.column2_code}|${Number(componentItem.Billed_Amount || 0).toFixed(2)}`;
        if (!ncciSavingsSeen.has(key)) {
          savingsOpportunity += Number(componentItem.Billed_Amount || 0);
          ncciSavingsSeen.add(key);
        }
      } else if (edit.modifier_allowed === '1') {
        const hasModifier = (componentItem.Modifier && componentItem.Modifier !== "") ||
                            (primaryItem && primaryItem.Modifier && primaryItem.Modifier !== "");

        if (!hasModifier) {
           clinicalFindings.push({
              type: "Warning",
              code: edit.column2_code,
              title: "Missing Modifier",
              reason: `Code ${edit.column2_code} overlaps with ${edit.column1_code}. It requires a distinct modifier (e.g. -59) to be allowed.`
           });
        }
      }
    });
  }

  return { 
    clinicalFindings, 
    savingsOpportunity: Math.max(0, savingsOpportunity),
    totalBenchmark 
  };
}

module.exports = async (req, res) => {
  setCorsHeaders(req, res);

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: "Method not allowed" });
  const rate = enforceRateLimit(req);
  if (rate.limited) {
    res.setHeader('Retry-After', String(rate.retryAfterSec));
    return res.status(429).json({ ok: false, error: 'Too many audit requests. Please retry shortly.' });
  }

  if (!awsCredentialsConfigured || !textractClient) {
    return res.status(500).json({
      ok: false,
      error: 'AWS credentials not configured. Set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.'
    });
  }

  try {
    await runMiddleware(req, res, upload.single('bill'));
    if (!req.file) return res.status(400).json({ error: "Missing file upload." });
    const mime = String(req.file.mimetype || '').toLowerCase();
    const allowedMimes = ['application/pdf', 'image/png', 'image/jpeg', 'image/jpg', 'image/webp', 'image/tiff'];
    if (!allowedMimes.includes(mime)) {
      return res.status(400).json({ ok: false, error: 'Unsupported file type. Upload PDF or image (PNG/JPG/WEBP/TIFF).' });
    }
    const preflight = await buildDocumentPreflight(req.file);
    let workingBuffer = req.file.buffer;
    let preprocessingApplied = false;
    let preprocessingMode = 'none';
    if (preflight.needs_preprocessing && mime.startsWith('image/')) {
      const prep = await preprocessImageForOcr(workingBuffer);
      workingBuffer = prep.buffer;
      preprocessingApplied = prep.applied;
      preprocessingMode = prep.mode;
    }

    // Step 0: Direct text extraction first (if PDF has selectable text)
    const directExtract = mime.includes('pdf') ? await extractTextLinesFromPdf(workingBuffer) : { lineObjects: [], hasSelectableText: false, pageStats: [] };
    const directParsed = directExtract.hasSelectableText ? parseRowsFromTextLines(directExtract.lineObjects) : { rows: [], stats: { parsed: 0, dropped: 0, drop_reasons: {} } };
    const directRows = directParsed.rows || [];
    const directParseStats = directParsed.stats || { parsed: directRows.length, dropped: 0, drop_reasons: {} };
    const directTextTruncated = directExtract.hasSelectableText && directRows.length >= DIRECT_TEXT_MAX_ROWS;

    // Step 1: Textract Extraction (primary verification engine)
    let data = null;
    let textractAttempts = 1;
    let normalizationApplied = false;
    let textractFailed = false;
    let textractError = '';
    try {
      const textractRun = await runTextractWithRetry(workingBuffer);
      data = textractRun.data;
      textractAttempts = textractRun.attempts || 1;
    } catch (err) {
      const message = String(err?.message || '');
      const canNormalize = /unsupported document format/i.test(message) && /pdf/i.test(req.file?.mimetype || '');
      if (canNormalize) {
        try {
          const normalizedBuffer = await normalizePdfForTextract(workingBuffer);
          const textractRun = await runTextractWithRetry(normalizedBuffer);
          data = textractRun.data;
          textractAttempts = textractRun.attempts || 1;
          normalizationApplied = true;
          console.warn('MediHelp: Applied automatic PDF normalization before Textract.');
        } catch (normErr) {
          textractFailed = true;
          textractError = `AWS Textract failed after auto-normalization: ${normErr.message}`;
        }
      } else {
        textractFailed = true;
        textractError = `AWS Textract failed: ${message}`;
      }
    }
    
    // Step 2: Normalization
    let normalizedItems = [];
    let textractRows = [];
    let grandTotal = null;
    let detectedTemplate = 'default_generic';
    let templateConfidence = 0;
    if (!textractFailed && data) {
      try {
          const blocks = data.Blocks || [];
          const result = normalizeTextractOutput(blocks);
          textractRows = result.items || [];
          normalizedItems = textractRows;
          grandTotal = result.grandTotal;
          detectedTemplate = result.detectedTemplate || detectedTemplate;
          templateConfidence = Number(result.templateConfidence || templateConfidence || 0);
      } catch (err) {
          throw new Error(`Normalization Layer Error: Failed to parse bill table structure. ${err.message}`);
      }
    } else if (directRows.length > 0) {
      normalizedItems = directRows;
      detectedTemplate = 'direct_text_first';
      templateConfidence = 40;
    } else {
      const aiRows = await runGeminiOcrFallback(workingBuffer, mime || 'application/pdf');
      if (aiRows.length > 0) {
        normalizedItems = aiRows;
        detectedTemplate = 'ai_ocr_fallback';
        templateConfidence = 35;
      } else {
        return res.status(500).json({ ok: false, error: textractError || 'Extraction failed and no direct text rows found.' });
      }
    }

    let geminiRows = [];
    let geminiCompare = null;
    if (process.env.GEMINI_API_KEY && workingBuffer && /pdf/i.test(mime || '')) {
      const shouldRunGemini = String(process.env.GEMINI_COMPARE_ENABLED || 'true') !== 'false';
      if (shouldRunGemini) {
        geminiRows = await runGeminiOcrFallback(workingBuffer, mime || 'application/pdf');
        if (geminiRows.length > 0) {
          geminiCompare = buildComparisonSummary(normalizedItems, geminiRows);
          const baseScore = scoreExtractionCandidate(normalizedItems, 0);
          const gemScore = scoreExtractionCandidate(geminiRows, geminiCompare.agreementScore || 0);
          if (gemScore > baseScore + GEMINI_OVERRIDE_MARGIN) {
            normalizedItems = geminiRows;
            detectedTemplate = 'textract_gemini_blend';
            templateConfidence = Math.max(45, templateConfidence);
          }
        }
      }
    }

    // Candidate arbitration: choose the healthiest extraction source.
    const sourceCandidates = [
      { name: 'current', rows: normalizedItems, profile: detectedTemplate, confidence: templateConfidence },
      { name: 'textract', rows: textractRows, profile: 'textract_primary', confidence: 65 },
      { name: 'direct', rows: directRows, profile: 'direct_text_preferred', confidence: 75 },
      { name: 'gemini', rows: geminiRows, profile: 'gemini_recovery', confidence: 55 }
    ].filter(c => Array.isArray(c.rows) && c.rows.length > 0);
    if (sourceCandidates.length > 0) {
      const ranked = sourceCandidates
        .map((c) => ({ ...c, eval: evaluateExtractionCandidate(c.rows) }))
        .sort((a, b) => b.eval.score - a.eval.score);
      const best = ranked[0];
      if (best && best.rows !== normalizedItems) {
        normalizedItems = best.rows;
        detectedTemplate = best.profile;
        templateConfidence = Math.max(templateConfidence, best.confidence || 0);
      }
    }

    // Recovery path: if primary extraction collapses row types/amounts, switch source.
    const baseHealth = getExtractionHealth(normalizedItems);
    if (baseHealth.collapsed) {
      const directHealth = getExtractionHealth(directRows);
      const gemHealth = getExtractionHealth(geminiRows);
      const baseScore = scoreExtractionCandidate(normalizedItems, 0);
      const directScore = scoreExtractionCandidate(directRows, 0);
      const gemScore = scoreExtractionCandidate(geminiRows, 0);

      if (directRows.length > 0 && !directHealth.collapsed && directScore >= baseScore) {
        normalizedItems = directRows;
        detectedTemplate = 'direct_text_recovery';
        templateConfidence = Math.max(templateConfidence, 55);
      } else if (geminiRows.length > 0 && !gemHealth.collapsed && gemScore >= baseScore) {
        normalizedItems = geminiRows;
        detectedTemplate = 'gemini_recovery';
        templateConfidence = Math.max(templateConfidence, 50);
      } else if (directRows.length > 0 && directHealth.zeroOrMissingAmountRate < baseHealth.zeroOrMissingAmountRate) {
        normalizedItems = directRows;
        detectedTemplate = 'direct_text_partial_recovery';
        templateConfidence = Math.max(templateConfidence, 45);
      }
    }

    // Normalize confidence/readiness so structurally valid rows are not trapped by stale low defaults.
    normalizedItems = normalizedItems.map((item) => {
      const overall = Number(item.overall_confidence || item.extraction_confidence || 0);
      const code = String(item.CPT || '').toUpperCase();
      const validCode = /^\d{5}$/.test(code) || /^[A-Z]\d{4}$/.test(code);
      const billed = Number(item.Billed_Amount || 0);
      const qty = Number(item.Qty || 0);
      const normalizedConfidence = Math.max(
        Number(item.extraction_confidence || 0),
        Math.min(95, Math.round(overall))
      );
      const autoReady = validCode && billed > 0 && qty > 0 && normalizedConfidence >= 78;
      return {
        ...item,
        extraction_confidence: normalizedConfidence,
        needs_manual_review: autoReady ? false : !!item.needs_manual_review
      };
    });

    const crossCheck = (!textractFailed && data && directRows.length > 0)
      ? buildComparisonSummary(normalizedItems, directRows)
      : { agreementScore: 0, notes: textractFailed ? ['Textract unavailable; no cross-check'] : ['No selectable text rows for cross-check'], verified: false };

    if (!crossCheck.verified && directRows.length > 0 && !textractFailed && !/^direct_text/.test(String(detectedTemplate || ''))) {
      normalizedItems = normalizedItems.map((item) => ({
        ...item,
        extraction_confidence: Math.min(Number(item.extraction_confidence || 70), 68),
        needs_manual_review: true,
        review_reasons: [...(item.review_reasons || []), 'Cross-check mismatch between direct text and Textract']
      }));
    }

    // Canonical duplicate candidate tagging
    const seenKeys = new Map();
    normalizedItems = normalizedItems.map((item) => {
      const fp = item.canonical || canonicalFingerprint(item);
      const descHash = String(fp.desc || '').slice(0, 28);
      const key = `${fp.date}|${fp.code}|${fp.qty}|${fp.amount}|${descHash}`;
      const seenCount = seenKeys.get(key) || 0;
      seenKeys.set(key, seenCount + 1);
      return {
        ...item,
        duplicate_status: seenCount > 0 ? (seenCount === 1 ? 'probable duplicate' : 'exact duplicate') : 'none'
      };
    });

    normalizedItems = applyDuplicateHeuristics(normalizedItems);
    const pageTrust = computePageTrustScores(normalizedItems, directExtract.pageStats);
    normalizedItems = applyPageTrustToRows(normalizedItems, pageTrust);

    const extractionMetrics = computePipelineMetrics(normalizedItems, crossCheck);
    const decisionState = deriveDecisionState(extractionMetrics);

    // Step 2b: CPT Code Existence Check — batch validate against Supabase
    // Any code not found in the DB is quarantined immediately (HITL) rather than
    // silently entering the audit engine with a potentially garbled code.
    try {
        const candidateCodes = [...new Set(
          normalizedItems.filter(i => i.CPT && i.IsValidCode).map(i => i.CPT)
        )];
        if (supabase && candidateCodes.length > 0) {
          const { data: knownCodes } = await supabase
            .from('cpt_codes')
            .select('code')
            .in('code', candidateCodes);
          const knownSet = new Set((knownCodes || []).map(r => r.code));
          normalizedItems.forEach(item => {
            if (item.CPT && item.IsValidCode && !knownSet.has(item.CPT)) {
              // Code passed format check but doesn't exist in CPT DB — likely OCR corruption
              item.IsValidCode = false;
              item.extraction_confidence = Math.min(item.extraction_confidence, 30);
              item.needs_manual_review = true;
              item.has_low_confidence_chars = true;
              item.review_reasons = [...(item.review_reasons || []), 'Code format is valid but not found in CPT registry'];
            }
          });
        }
    } catch (dbErr) {
        console.warn('MediHelp: CPT existence batch check skipped:', dbErr.message);
    }

    // Step 3: filter auditable rows by row_type before auditing
    const auditableRows = normalizedItems.filter((r) => {
      const t = String(r.row_type || classifyRowType(r).rowType || '').toLowerCase();
      return t === 'charge' || t === 'charge_candidate' || t === 'lab/imaging' || t === 'pharmacy item';
    });

    // Step 4: Arithmetic Engine
    let engineResults = { findings: [] };
    try {
        engineResults = runArithmeticEngine(auditableRows, grandTotal);
    } catch (err) {
        throw new Error(`Arithmetic Engine Error: Mathematical validation loop crashed. ${err.message}`);
    }

    // Step 5: Clinical Engine
    let clinicalResults = { clinicalFindings: [], savingsOpportunity: 0 };
    try {
        clinicalResults = await runClinicalEngine(auditableRows);
    } catch (err) {
        console.error("Clinical Engine Error:", err.message);
    }

    // [v8.8] Step 6: Gemini Clinical Reasoning Pass (Role 2)
    // Supplement deterministic findings with high-level clinical reasoning.
    let geminiClinicalFindings = [];
    if (auditableRows.length > 0) {
      try {
        geminiClinicalFindings = await runGeminiClinicalAudit(auditableRows, file.buffer, file.mimetype);
      } catch (err) {
        console.warn('MediHelp: Gemini Clinical reasoning pass skipped:', err.message);
      }
    }

    // Combine Findings (Deduplicate Gemini findings if rule engine already caught them)
    // Simple dedup by code + similarity (broadly)
    const ruleCodes = new Set(clinicalResults.clinicalFindings.map(f => `${f.code}|${f.title.slice(0,10)}`));
    const uniqueGeminiFindings = geminiClinicalFindings.filter(gf => !ruleCodes.has(`${gf.code}|${gf.title.slice(0,10)}`));

    const allFindings = [
      ...engineResults.findings, 
      ...clinicalResults.clinicalFindings,
      ...uniqueGeminiFindings.map(f => ({ ...f, type: f.type || 'Warning', model_source: 'Gemini 1.5 Clinical Audit' }))
    ];
    const numAnomalies = allFindings.length;
    
    let summaryText = `Found ${normalizedItems.length} billing items. Clinical datasets detect $${clinicalResults.savingsOpportunity.toFixed(2)} in potential savings.`;
    if (numAnomalies > 5) {
        summaryText = `High Risk: ${numAnomalies} critical billing anomalies isolated. Potential savings estimated at $${clinicalResults.savingsOpportunity.toFixed(2)}.`;
    }

    res.status(200).json({ 
        ok: true, 
        normalized_bill: normalizedItems, 
        extraction_profile: detectedTemplate || 'default_generic',
        extraction_profile_confidence: templateConfidence,
        preflight,
        preprocessing_applied: preprocessingApplied,
        preprocessing_mode: preprocessingMode,
        textract_attempts: textractAttempts,
        pdf_normalization_applied: normalizationApplied,
        textract_unavailable: textractFailed,
        textract_error: textractError || null,
        direct_text_used: directRows.length > 0,
        direct_text_truncated: directTextTruncated,
        direct_text_parse_stats: directParseStats,
        cross_check: crossCheck,
        gemini_compare: geminiCompare,
        page_trust: pageTrust,
        extraction_metrics: extractionMetrics,
        decision_state: decisionState,
        result: { 
            summary: summaryText,
            findings: allFindings,
            top_findings: rankHighValueFindings(allFindings),
            potential_savings: clinicalResults.savingsOpportunity,
            medicare_benchmark_total: clinicalResults.totalBenchmark
        } 
    });

  } catch (err) {
    console.error("Audit Execution Error:", err.message);
    res.status(500).json({ ok: false, error: 'Audit processing failed. Please retry with a clearer itemized PDF.' });
  }
};

module.exports.config = { api: { bodyParser: false } };
