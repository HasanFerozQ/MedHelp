const { GoogleGenerativeAI } = require("@google/generative-ai");
const multer = require("multer");

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

const AUDIT_PROMPT = `
ACT AS MEDICAL AUDITOR. ANALYZE BILL. RETURN ONLY JSON.
DETECT: Duplicates, Math errors, Unbundling, Extreme Prices.
FORMAT: { "summary": "...", "findings": [{ "type": "...", "code": "...", "title": "...", "reason": "..." }] }
BE FAST. MAX 5 FINDINGS.
`;

module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: "Method not allowed" });

  try {
    await runMiddleware(req, res, upload.single('bill'));
    if (!req.file) return res.status(400).json({ error: "Missing PDF" });

    // Key Health Check (V2.6)
    const keys = [process.env.Key1, process.env.Key2, process.env.Key3, process.env.Key4].filter(k => !!k);
    if (keys.length === 0) {
      console.error("Vercel Env Warning: Keys are missing from runtime.");
      return res.status(500).json({ error: "AI Keys not synced. Please re-deploy the project on Vercel." });
    }
    
    const apiKey = keys[Math.floor(Math.random() * keys.length)];
    const genAI = new GoogleGenerativeAI(apiKey);
    const model = genAI.getGenerativeModel({ 
      model: "gemini-1.5-flash",
      generationConfig: { maxOutputTokens: 500, temperature: 0.1 } // Optimized for Speed
    });

    const base64Data = req.file.buffer.toString("base64");
    
    // Set a client-side timeout hint
    const result = await model.generateContent([
      { text: AUDIT_PROMPT },
      { inlineData: { mimeType: "application/pdf", data: base64Data } }
    ]);

    const response = await result.response;
    const text = response.text();
    const jsonMatch = text.match(/\{[\s\S]*\}/);
    
    if (!jsonMatch) throw new Error("AI returned no structured data.");

    res.status(200).json({ ok: true, result: JSON.parse(jsonMatch[0]) });

  } catch (err) {
    console.error("V2.6 API Error:", err.message);
    res.status(500).json({ ok: false, error: err.message });
  }
};

module.exports.config = { api: { bodyParser: false } };
