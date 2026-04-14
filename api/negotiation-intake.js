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

function buildIntakePdfBuffer({ caseId, fields }) {
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

async function sendViaSmtp({ caseId, fields, attachments }) {
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
    `Source: ${fields.source || 'audit-page'}`
  ];

  const intakePdf = await buildIntakePdfBuffer({ caseId, fields });

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
    subject: `MediHelp Negotiation Intake - ${caseId}`,
    text: lines.join('\n'),
    attachments: [
      ...attachments,
      {
        filename: `intake-consent-${caseId}.pdf`,
        content: intakePdf
      }
    ]
  });
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
    if (!required(b.fullName) || !required(b.email) || !required(b.phone) || !required(b.authorizationConsent)) {
      return res.status(400).json({ ok: false, error: 'Missing required intake fields.' });
    }

    const billFile = req.files?.bill?.[0];
    if (!billFile) {
      return res.status(400).json({ ok: false, error: 'Bill PDF is required.' });
    }

    const caseId = `MH-${new Date().toISOString().slice(0, 10).replace(/-/g, '')}-${crypto.randomBytes(3).toString('hex').toUpperCase()}`;
    const attachments = [billFile, ...(req.files?.eob || [])].map((f) => ({
      filename: f.originalname || 'attachment.pdf',
      content: f.buffer
    }));

    await sendViaSmtp({
      caseId,
      fields: b,
      attachments
    });

    return res.status(200).json({ ok: true, caseId });
  } catch (err) {
    return res.status(500).json({ ok: false, error: err.message || 'Failed to submit negotiation intake.' });
  }
};

module.exports.config = { api: { bodyParser: false } };
