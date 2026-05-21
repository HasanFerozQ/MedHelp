const { createSmtpTransport, friendlySmtpError, smtpConfig } = require('./_lib/smtp');

function required(value) {
  return value !== undefined && value !== null && String(value).trim() !== '';
}

function sanitize(value) {
  return String(value ?? '').trim();
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

    const { from } = smtpConfig('NEGOTIATION');
    const to = 'supportdesk@medihelp.live';
    const transporter = createSmtpTransport('NEGOTIATION');

    const subject = source === 'contact-form'
      ? `[MediHelp Contact] ${type} - ${name}`
      : `[MediHelp Feedback] ${type}`;

    const lines = [
      `Source: ${source}`,
      `Type: ${type}`,
      `Name: ${name}`,
      `Email: ${email || 'Not provided'}`,
      `Phone: ${phone || 'Not provided'}`,
      '',
      'Message:',
      message
    ];

    await transporter.sendMail({
      from,
      to,
      replyTo: email || undefined,
      subject,
      text: lines.join('\n')
    });

    return res.status(200).json({ ok: true });
  } catch (err) {
    const friendly = friendlySmtpError(err);
    const smtpAuthFailed = /login failed|535|authentication failed/i.test(friendly);
    return res.status(500).json({
      ok: false,
      error: friendly,
      fallback_mailto: smtpAuthFailed,
      support_email: 'supportdesk@medihelp.live',
    });
  }
};
