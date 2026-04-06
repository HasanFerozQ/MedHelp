const { GoogleGenerativeAI } = require("@google/generative-ai");
const multer = require("multer");

// Helper to run middleware in Vercel
const runMiddleware = (req, res, fn) => {
  return new Promise((resolve, reject) => {
    fn(req, res, (result) => {
      if (result instanceof Error) {
        return reject(result);
      }
      return resolve(result);
    });
  });
};

const upload = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: 5 * 1024 * 1024 }, // Vercel Free tier limit 4.5MB, setting 5MB to be safe
});

const AUDIT_PROMPT = `
You are a medical billing auditor.
Analyze this medical bill and return STRICT JSON only.

### FAST MODE: STRICT 8S RESPONSE LIMIT ###
Prioritize the 5 most egregious anomalies only to stay under Vercel's 10s request timeout. 
Ignore minor spelling errors. Focus on duplicates, arithmetic, and unbundling.

Detect:
- duplicate charges
- unbundling
- CPT / ICD mismatch
- modifier issues
- arithmetic errors
- inflated pricing

Return JSON in this format:
{
  "document_type": "string",
  "summary": "string",
  "findings": [
    {
      "type": "duplicate_charge | unbundling | dx_proc_mismatch | modifier_issue | arithmetic_error | pricing_outlier | other",
      "code": "string",
      "title": "string",
      "reason": "string",
      "confidence": "low | medium | high"
    }
  ]
}
`;

module.exports = async (req, res) => {
  // Add CORS headers
  res.setHeader('Access-Control-Allow-Credentials', true);
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,PATCH,DELETE,POST,PUT');
  res.setHeader(
    'Access-Control-Allow-Headers',
    'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version'
  );

  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ error: "Method not allowed" });
  }

  try {
    // 1. Run Multer
    await runMiddleware(req, res, upload.single('bill'));

    if (!req.file) {
      return res.status(400).json({ error: "Missing PDF file" });
    }

    // 2. Select API Key (Rotation)
    const keys = [
      process.env.Key1,
      process.env.Key2,
      process.env.Key3,
      process.env.Key4
    ].filter(k => !!k);

    if (keys.length === 0) {
       return res.status(500).json({ error: "API Keys not configured on server" });
    }
    
    const apiKey = keys[Math.floor(Math.random() * keys.length)];
    const genAI = new GoogleGenerativeAI(apiKey);
    const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

    // 3. Prepare Gemini Request
    const base64Data = req.file.buffer.toString("base64");
    
    const result = await model.generateContent([
      { text: AUDIT_PROMPT },
      {
        inlineData: {
          mimeType: "application/pdf",
          data: base64Data
        }
      }
    ]);

    const response = await result.response;
    let text = response.text();

    // Clean up markdown if Gemini adds it
    text = text.replace(/```json/g, "").replace(/```/g, "").trim();

    let parsed;
    try {
      parsed = JSON.parse(text);
    } catch (e) {
      console.error("Gemini JSON Parse Error:", text);
      return res.status(500).json({ 
        error: "Failed to parse AI response as JSON",
        raw: text 
      });
    }

    res.status(200).json({
      ok: true,
      result: parsed
    });

  } catch (err) {
    console.error("Vercel Function Error:", err);
    res.status(500).json({ 
      ok: false, 
      error: err.message 
    });
  }
};

// Disable Vercel's body parser to allow Multer to handle multipart
module.exports.config = {
  api: {
    bodyParser: false,
  },
};
