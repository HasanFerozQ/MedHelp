const multer = require('multer');
const crypto = require('crypto');
const PDFDocument = require('pdfkit');
const nodemailer = require('nodemailer');

const upload = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: 8 * 1024 * 1024 }
});

const runMiddleware = (req, res, fn) =>
  new Promise((resolve, reject) => {
    fn(req, res, (result) => {
      if (result instanceof Error) return reject(result);
      return resolve(result);
    });
  });

function required(value) {
  return value !== undefined && value !== null && String(value).trim() !== '';
}

function parseBool(value) {
  if (typeof value === 'boolean') return value;
  const v = String(value || '').trim().toLowerCase();
  return v === 'true' || v === '1' || v === 'yes' || v === 'on';
}

function sha256(buffer) {
  return crypto.createHash('sha256').update(buffer).digest('hex');
}

function buildIntakePdfBuffer({ caseId, fields, integrityMeta }) {
  return new Promise((resolve, reject) => {
    try {
      const doc = new PDFDocument({ size: 'A4', margin: 48 });
      const chunks = [];
      doc.on('data', (chunk) => chunks.push(chunk));
      doc.on('end', () => resolve(Buffer.concat(chunks)));

      const h = (text) => {
        doc.moveDown(0.6);
        doc.font('Helvetica-Bold').fontSize(12).text(text);
        doc.moveDown(0.2);
      };
      const row = (label, value) => {
        doc.font('Helvetica-Bold').fontSize(10).text(`${label}: `, { continued: true });
        doc.font('Helvetica').fontSize(10).text(String(value ?? ''));
      };

      doc.font('Helvetica-Bold').fontSize(16).text('MediHelp Negotiation Intake');
      doc.font('Helvetica').fontSize(10).text(`Case ID: ${caseId}`);
      doc.text(`Submitted At (UTC): ${new Date().toISOString()}`);

      h('Basic Info');
      row('Full Name', fields.fullName);
      row('Email', fields.email);
      row('Phone', fields.phone);

      h('Bill Details');
      row('Provider Name', fields.providerName);
      row('Bill Amount', fields.billAmount);
      row('Date of Service', fields.dateOfService);

      h('Insurance');
      row('Has Insurance', fields.hasInsurance);
      row('Claim Status', fields.claimStatus);

      h('Visit');
      row('Visit Type', fields.visitType);
      row('Visit Type Other', fields.visitTypeOther);

      h('Financial');
      row('Financial Difficulty', fields.financialDifficulty);
      row('Monthly Income', fields.monthlyIncome);
      row('Hardship Checked', fields.hardshipChecked);

      h('Negotiation Request');
      row('Goal', fields.negotiationGoal);

      h('Audit Snapshot');
      row('Savings Potential', fields.savingsPotential);
      row('Findings Count', fields.findingsCount);
      row('Source', fields.source || 'audit-page');

      h('Authorization & Payment Acknowledgment');
      row('Authorization Consent', fields.authorizationConsent);
      row('15% Success Fee Consent', fields.successFeeConsent);
      row('Upfront $15 Consent', fields.upfrontFeeConsent);
      row('Digital Signature Name', fields.signatureName);
      row('Digital Signature Date', fields.signatureDate);

      h('Evidence Integrity Snapshot');
      row('Consent Receipt SHA-256', integrityMeta.consentReceiptHash);
      row('Bill SHA-256', integrityMeta.billHash);
      row('EOB SHA-256', integrityMeta.eobHash || 'N/A');
      row('Submitted At (UTC)', integrityMeta.submittedAtUtc);

      doc.moveDown(0.8);
      doc.font('Helvetica').fontSize(9).text(
        'Disclaimer: MediHelp is a billing advocacy service and does not provide legal, medical, or insurance advice.'
      );

      doc.end();
    } catch (err) {
      reject(err);
    }
  });
}

async function sendViaSmtp({ caseId, fields, attachments, integrityMeta, consentReceiptText }) {
  const host = process.env.NEGOTIATION_SMTP_HOST || 'mail.privateemail.com';
  const port = Number(process.env.NEGOTIATION_SMTP_PORT || 587);
  const user = process.env.NEGOTIATION_SMTP_USER;
  const pass = process.env.NEGOTIATION_SMTP_PASS;
  const from = process.env.NEGOTIATION_FROM_EMAIL || user;
  const to = 'supportdesk@medihelp.live';

  if (!user || !pass) {
    throw new Error('SMTP credentials are missing. Set NEGOTIATION_SMTP_USER and NEGOTIATION_SMTP_PASS.');
  }

  const lines = [
    `Case ID: ${caseId}`,
    '',
    '== Basic Info ==',
    `Full Name: ${fields.fullName || ''}`,
    `Email: ${fields.email || ''}`,
    `Phone: ${fields.phone || ''}`,
    '',
    '== Bill Details ==',
    `Provider Name: ${fields.providerName || ''}`,
    `Bill Amount: ${fields.billAmount || ''}`,
    `Date of Service: ${fields.dateOfService || ''}`,
    '',
    '== Insurance ==',
    `Has Insurance: ${fields.hasInsurance || ''}`,
    `Claim Status: ${fields.claimStatus || ''}`,
    '',
    '== Visit ==',
    `Visit Type: ${fields.visitType || ''}`,
    `Visit Type Other: ${fields.visitTypeOther || ''}`,
    '',
    '== Financial ==',
    `Financial Difficulty: ${fields.financialDifficulty || ''}`,
    `Monthly Income: ${fields.monthlyIncome || ''}`,
    `Hardship Checked: ${fields.hardshipChecked || ''}`,
    '',
    '== Negotiation Request ==',
    `Negotiation Goal: ${fields.negotiationGoal || ''}`,
    '',
    '== Consent ==',
    `Authorization Consent: ${fields.authorizationConsent || ''}`,
    `Payment 15% Consent: ${fields.successFeeConsent || ''}`,
    `Upfront $15 Consent: ${fields.upfrontFeeConsent || ''}`,
    `Digital Signature Name: ${fields.signatureName || ''}`,
    `Digital Signature Date: ${fields.signatureDate || ''}`,
    '',
    '== Audit Snapshot ==',
    `Savings Potential: ${fields.savingsPotential || ''}`,
    `Findings Count: ${fields.findingsCount || ''}`,
    `Source: ${fields.source || 'audit-page'}`,
    '',
    '== Integrity & Evidence ==',
    `Submitted At (UTC): ${integrityMeta.submittedAtUtc}`,
    `Consent Receipt SHA-256: ${integrityMeta.consentReceiptHash}`,
    `Bill SHA-256: ${integrityMeta.billHash}`,
    `EOB SHA-256: ${integrityMeta.eobHash || 'N/A'}`
  ];

  const intakePdf = await buildIntakePdfBuffer({ caseId, fields, integrityMeta });

  const transporter = nodemailer.createTransport({
    host,
    port,
    secure: port === 465,
    auth: { user, pass },
    requireTLS: port !== 465
  });

  await transporter.sendMail({
    from,
    to,
    replyTo: fields.email || undefined,
    subject: `MediHelp Negotiation Intake - ${caseId}`,
    text: lines.join('\n'),
    attachments: [
      ...attachments,
      {
        filename: `intake-consent-${caseId}.pdf`,
        content: intakePdf
      },
      {
        filename: `consent-receipt-${caseId}.txt`,
        content: Buffer.from(consentReceiptText, 'utf8')
      },
      {
        filename: `integrity-metadata-${caseId}.json`,
        content: Buffer.from(JSON.stringify(integrityMeta, null, 2), 'utf8')
      }
    ]
  });

  const userEmail = String(fields.email || '').trim();
  if (userEmail) {
    const acknowledgementHtml = `
      <div style="font-family:Arial,Helvetica,sans-serif; max-width:640px; margin:0 auto; color:#111827; line-height:1.6;">
        <h2 style="margin:0 0 10px;">MediHelp Human Negotiation Intake Received</h2>
        <p style="margin:0 0 12px;">Thank you for submitting your negotiation intake. Please save your Case ID for all future communication.</p>
        <div style="padding:14px; border:1px solid #d1d5db; border-radius:8px; background:#f9fafb; margin-bottom:14px;">
          <div style="font-size:12px; color:#6b7280; margin-bottom:4px;">Your Case ID</div>
          <div style="font-size:22px; font-weight:800; letter-spacing:0.4px;">${caseId}</div>
        </div>
        <p style="font-weight:700; margin:0 0 8px;">What happens next:</p>
        <ol style="margin:0 0 12px 18px; padding:0;">
          <li>Process will take 3-5 working days.</li>
          <li>SupportDesk will email payment link and details to your provided email for the $15 initiation fee.</li>
          <li>After submission of initiation fee, negotiator starts audit and negotiations and contacts you with results.</li>
          <li>Final payment details are shared after successful negotiations (15% of saved amount).</li>
        </ol>
        <p style="margin:0;">If you need help, reply to this email and include your Case ID.</p>
      </div>
    `;

    await transporter.sendMail({
      from,
      to: userEmail,
      subject: `MediHelp Case Confirmation - ${caseId}`,
      html: acknowledgementHtml,
      text: [
        'MediHelp Human Negotiation Intake Received',
        '',
        `Your Case ID: ${caseId}`,
        'Please save this Case ID for future communication.',
        '',
        'What happens next:',
        '1) Process will take 3-5 working days.',
        '2) SupportDesk will email payment link and details to your provided email for the $15 initiation fee.',
        '3) After submission of initiation fee, negotiator starts audit and negotiations and contacts you with results.',
        '4) Final payment details are shared after successful negotiations (15% of saved amount).',
        '',
        'If you need help, reply to this email and include your Case ID.'
      ].join('\n')
    });
  }
}

module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ ok: false, error: 'Method not allowed' });

  try {
    await runMiddleware(req, res, upload.fields([
      { name: 'bill', maxCount: 1 },
      { name: 'eob', maxCount: 1 }
    ]));

    const b = req.body || {};
    const authConsent = parseBool(b.authorizationConsent);
    const successConsent = parseBool(b.successFeeConsent);
    const upfrontConsent = parseBool(b.upfrontFeeConsent);
    if (!required(b.fullName) || !required(b.email) || !required(b.phone)) {
      return res.status(400).json({ ok: false, error: 'Missing required identity/contact fields.' });
    }
    if (!authConsent || !successConsent || !upfrontConsent) {
      return res.status(400).json({ ok: false, error: 'All required consent checkboxes must be accepted.' });
    }
    if (!required(b.signatureName) || !required(b.signatureDate)) {
      return res.status(400).json({ ok: false, error: 'Digital signature is required before submission.' });
    }

    const billFile = req.files?.bill?.[0];
    if (!billFile) {
      return res.status(400).json({ ok: false, error: 'Bill PDF is required.' });
    }

    const caseId = `MH-${new Date().toISOString().slice(0, 10).replace(/-/g, '')}-${crypto.randomBytes(3).toString('hex').toUpperCase()}`;
    const eobFile = req.files?.eob?.[0];
    const integrityMeta = {
      caseId,
      submittedAtUtc: new Date().toISOString(),
      fullName: String(b.fullName || '').trim(),
      email: String(b.email || '').trim(),
      phone: String(b.phone || '').trim(),
      signatureName: String(b.signatureName || '').trim(),
      signatureDate: String(b.signatureDate || '').trim(),
      authorizationConsent: authConsent,
      successFeeConsent: successConsent,
      upfrontFeeConsent: upfrontConsent,
      billFileName: billFile.originalname || 'bill.pdf',
      billMimeType: billFile.mimetype || 'application/pdf',
      billSizeBytes: Number(billFile.size || billFile.buffer?.length || 0),
      billHash: sha256(billFile.buffer),
      eobFileName: eobFile?.originalname || null,
      eobMimeType: eobFile?.mimetype || null,
      eobSizeBytes: Number(eobFile?.size || eobFile?.buffer?.length || 0),
      eobHash: eobFile?.buffer ? sha256(eobFile.buffer) : null
    };
    const consentReceiptText = [
      'MediHelp Negotiation Intake Consent Receipt',
      `Case ID: ${caseId}`,
      `Submitted At (UTC): ${integrityMeta.submittedAtUtc}`,
      '',
      `Full Name: ${integrityMeta.fullName}`,
      `Email: ${integrityMeta.email}`,
      `Phone: ${integrityMeta.phone}`,
      '',
      `Authorization Consent: ${integrityMeta.authorizationConsent}`,
      `15% Success Fee Consent: ${integrityMeta.successFeeConsent}`,
      `Upfront Fee Consent: ${integrityMeta.upfrontFeeConsent}`,
      `Digital Signature Name: ${integrityMeta.signatureName}`,
      `Digital Signature Date: ${integrityMeta.signatureDate}`,
      '',
      'Attached File Integrity (SHA-256)',
      `Bill: ${integrityMeta.billFileName} | ${integrityMeta.billHash}`,
      `EOB: ${integrityMeta.eobFileName || 'N/A'} | ${integrityMeta.eobHash || 'N/A'}`
    ].join('\n');

    const attachments = [billFile, ...(eobFile ? [eobFile] : [])].map((f) => ({
      filename: f.originalname || 'attachment.pdf',
      content: f.buffer
    }));

    await sendViaSmtp({
      caseId,
      fields: b,
      attachments,
      integrityMeta,
      consentReceiptText
    });

    return res.status(200).json({ ok: true, caseId });
  } catch (err) {
    return res.status(500).json({ ok: false, error: err.message || 'Failed to submit negotiation intake.' });
  }
};

module.exports.config = { api: { bodyParser: false } };
