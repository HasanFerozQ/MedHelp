const nodemailer = require('nodemailer');

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

    const host = process.env.NEGOTIATION_SMTP_HOST || 'mail.privateemail.com';
    const port = Number(process.env.NEGOTIATION_SMTP_PORT || 587);
    const user = process.env.NEGOTIATION_SMTP_USER;
    const pass = process.env.NEGOTIATION_SMTP_PASS;
    const from = process.env.NEGOTIATION_FROM_EMAIL || user;
    const to = 'supportdesk@medihelp.live';

    if (!user || !pass) {
      throw new Error('SMTP credentials are missing. Set NEGOTIATION_SMTP_USER and NEGOTIATION_SMTP_PASS.');
    }

    const transporter = nodemailer.createTransport({
      host,
      port,
      secure: port === 465,
      auth: { user, pass },
      requireTLS: port !== 465
    });

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
    return res.status(500).json({ ok: false, error: err.message || 'Failed to send message.' });
  }
};
