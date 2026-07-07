const { createClient } = require('@supabase/supabase-js');
const { createSmtpTransport, smtpConfig, friendlySmtpError } = require('./_lib/smtp');
const { verifyRecaptchaToken } = require('./_lib/recaptcha');

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


function required(value) {
  return value !== undefined && value !== null && String(value).trim() !== '';
}

function sanitize(value) {
  return String(value ?? '').trim();
}

function getSupabaseAdmin() {
  const url =
    process.env.SUPABASE_URL ||
    process.env.NEXT_PUBLIC_SUPABASE_URL ||
    '';
  const key =
    process.env.SUPABASE_SERVICE_ROLE_KEY ||
    process.env.SUPABASE_SERVICE_KEY ||
    '';
  if (!url || !key) return null;
  return createClient(url, key);
}

async function saveFeedbackRow(supabase, payload) {
  const { error } = await supabase.from('feedback_submissions').insert(payload);
  return error;
}

async function sendFeedbackEmail({ source, type, name, email, phone, message, pageUrl }) {
  const transporter = createSmtpTransport('FEEDBACK');
  const { from, to } = smtpConfig('FEEDBACK');
  const label = source === 'contact-form' ? 'Contact Form' : 'Site Feedback';
  const subject = `[MediHelp ${label}] ${type} — ${name}`;

  const text = [
    `New ${label.toLowerCase()} submission`,
    '',
    `Type: ${type}`,
    `Name: ${name}`,
    `Email: ${email || '—'}`,
    `Phone: ${phone || '—'}`,
    `Page: ${pageUrl || '—'}`,
    '',
    '— Message —',
    message,
    '',
    '—',
    'Reply directly to this email to reach the visitor (Reply-To is set to their address).',
  ].join('\n');

  await transporter.sendMail({
    from,
    to,
    replyTo: email || undefined,
    subject,
    text,
  });
}

module.exports = async (req, res) => {
  setCorsHeaders(req, res);

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ ok: false, error: 'Method not allowed' });

  try {
    const body = req.body || {};
    const recaptchaToken = body.recaptcha_token;

    // Verify reCAPTCHA v3 bot protection token
    const clientIp = req.headers['x-forwarded-for'] || req.socket?.remoteAddress || '';
    const recaptchaResult = await verifyRecaptchaToken(recaptchaToken, clientIp.split(',')[0].trim());
    if (!recaptchaResult.success) {
      return res.status(400).json({ ok: false, error: 'Security validation failed (reCAPTCHA v3). Please refresh and try again.' });
    }

    const source = sanitize(body.source || 'website');
    const type = sanitize(body.type || 'General Inquiry');
    const email = sanitize(body.email);
    const phone = sanitize(body.phone);
    const name = sanitize(body.name || 'Anonymous');
    const message = sanitize(body.message);
    const pageUrl = sanitize(body.page_url || body.pageUrl || '');

    if (!required(message)) {
      return res.status(400).json({ ok: false, error: 'Message is required.' });
    }

    if (source === 'feedback-widget' && !required(email)) {
      return res.status(400).json({ ok: false, error: 'Email is required for feedback submissions.' });
    }

    if (source === 'contact-form' && !required(name)) {
      return res.status(400).json({ ok: false, error: 'Name is required for contact form submissions.' });
    }
    if (source === 'contact-form' && !required(email)) {
      return res.status(400).json({ ok: false, error: 'Email is required for contact form submissions.' });
    }
    if (source === 'contact-form' && !required(phone)) {
      return res.status(400).json({ ok: false, error: 'Phone is required for contact form submissions.' });
    }

    const row = {
      source,
      type,
      name: name || null,
      email: email || null,
      phone: phone || null,
      message,
      page_url: pageUrl || null,
    };

    const supabase = getSupabaseAdmin();
    let dbError = null;
    if (supabase) {
      dbError = await saveFeedbackRow(supabase, row);
    } else {
      dbError = new Error('Supabase not configured');
    }

    let emailError = null;
    try {
      await sendFeedbackEmail({ source, type, name, email, phone, message, pageUrl });
    } catch (err) {
      emailError = friendlySmtpError(err);
    }

    if (!dbError && !emailError) {
      return res.status(200).json({ ok: true, delivered: 'database_and_email' });
    }
    if (!dbError) {
      return res.status(200).json({ ok: true, delivered: 'database', email_warning: emailError });
    }
    if (!emailError) {
      return res.status(200).json({ ok: true, delivered: 'email', db_warning: dbError.message });
    }

    return res.status(500).json({
      ok: false,
      error: dbError.message || 'Could not save feedback.',
      email_error: emailError,
      fallback_mailto: true,
      support_email: 'supportdesk@medihelp.live',
    });
  } catch (err) {
    return res.status(500).json({
      ok: false,
      error: err.message || 'Failed to save feedback.',
      fallback_mailto: true,
      support_email: 'supportdesk@medihelp.live',
    });
  }
};
