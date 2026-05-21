const { createClient } = require('@supabase/supabase-js');

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

module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ ok: false, error: 'Method not allowed' });

  try {
    const body = req.body || {};
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

    const supabase = getSupabaseAdmin();
    if (!supabase) {
      return res.status(500).json({
        ok: false,
        error: 'Feedback storage is not configured. Add SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in Vercel.',
        fallback_mailto: true,
        support_email: 'supportdesk@medihelp.live',
      });
    }

    const { error } = await supabase.from('feedback_submissions').insert({
      source,
      type,
      name: name || null,
      email: email || null,
      phone: phone || null,
      message,
      page_url: pageUrl || null,
    });

    if (error) {
      return res.status(500).json({
        ok: false,
        error: error.message || 'Could not save feedback.',
        fallback_mailto: true,
        support_email: 'supportdesk@medihelp.live',
      });
    }

    return res.status(200).json({ ok: true });
  } catch (err) {
    return res.status(500).json({
      ok: false,
      error: err.message || 'Failed to save feedback.',
      fallback_mailto: true,
      support_email: 'supportdesk@medihelp.live',
    });
  }
};
