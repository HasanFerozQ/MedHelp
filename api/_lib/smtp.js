const nodemailer = require('nodemailer');

function smtpConfig(prefix = 'NEGOTIATION') {
  if (prefix === 'FEEDBACK') {
    const user = process.env.FEEDBACK_SMTP_USER;
    const host = process.env.FEEDBACK_SMTP_HOST || 'smtppro.zoho.com';
    const port = Number(process.env.FEEDBACK_SMTP_PORT || 465);
    const pass = process.env.FEEDBACK_SMTP_PASS;
    const to = process.env.FEEDBACK_TO_EMAIL || user;
    const from = process.env.FEEDBACK_FROM_EMAIL || (user ? `MediHelp Contact <${user}>` : user);
    return { host, port, user, pass, from, to };
  }

  const host = process.env[`${prefix}_SMTP_HOST`] || process.env.NEGOTIATION_SMTP_HOST || 'smtppro.zoho.com';
  const port = Number(process.env[`${prefix}_SMTP_PORT`] || process.env.NEGOTIATION_SMTP_PORT || 465);
  const user = process.env[`${prefix}_SMTP_USER`] || process.env.NEGOTIATION_SMTP_USER;
  const pass = process.env[`${prefix}_PASS`] || process.env[`${prefix}_SMTP_PASS`] || process.env.NEGOTIATION_SMTP_PASS;
  const from = process.env[`${prefix}_FROM_EMAIL`] || process.env.NEGOTIATION_FROM_EMAIL || user;
  return { host, port, user, pass, from };
}

function friendlySmtpError(err) {
  const msg = String(err?.message || err || '');
  if (/535|5\.7\.8|authentication failed/i.test(msg)) {
    return 'Email server login failed. Update SMTP username/password in Vercel (FEEDBACK_SMTP_USER / FEEDBACK_SMTP_PASS). Use your Zoho Mail email and App Password.';
  }
  if (/missing|credentials/i.test(msg)) {
    return 'Email is not configured on the server. Set FEEDBACK_SMTP_USER and FEEDBACK_SMTP_PASS in Vercel environment variables.';
  }
  return msg || 'Failed to send email.';
}

function createSmtpTransport(prefix = 'NEGOTIATION') {
  const { host, port, user, pass } = smtpConfig(prefix);
  if (!user || !pass) {
    const hint = prefix === 'FEEDBACK'
      ? 'Set FEEDBACK_SMTP_USER and FEEDBACK_SMTP_PASS (Zoho Mail App Password).'
      : 'Set NEGOTIATION_SMTP_USER and NEGOTIATION_SMTP_PASS.';
    throw new Error(`SMTP credentials are missing. ${hint}`);
  }
  return nodemailer.createTransport({
    host,
    port,
    secure: port === 465,
    auth: { user, pass },
    requireTLS: port !== 465,
    tls: { minVersion: 'TLSv1.2' },
    connectionTimeout: 15_000,
    greetingTimeout: 15_000,
  });
}

module.exports = { smtpConfig, friendlySmtpError, createSmtpTransport };
