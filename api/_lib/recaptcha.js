const https = require('https');
const querystring = require('querystring');

const RECAPTCHA_SECRET_KEY = process.env.RECAPTCHA_SECRET_KEY || '6LeXyEctAAAAACtP_GU1SWfh2jPUh76FPlBSf3-a';

/**
 * Validates a reCAPTCHA v3 token with Google's siteverify endpoint.
 * @param {string} token - The client response token from reCAPTCHA v3
 * @param {string} [ip] - Optional client IP address
 * @returns {Promise<{success: boolean, score: number, errorCodes: string[], error?: string}>}
 */
function verifyRecaptchaToken(token, ip = '') {
  return new Promise((resolve) => {
    if (!token) {
      return resolve({ success: false, score: 0, error: 'missing_token', errorCodes: [] });
    }

    const postData = querystring.stringify({
      secret: RECAPTCHA_SECRET_KEY,
      response: token,
      remoteip: ip || undefined
    });

    const options = {
      hostname: 'www.google.com',
      port: 443,
      path: '/recaptcha/api/siteverify',
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(postData)
      }
    };

    const req = https.request(options, (res) => {
      let body = '';
      res.on('data', (chunk) => { body += chunk; });
      res.on('end', () => {
        try {
          const parsed = JSON.parse(body);
          const score = Number(parsed.score ?? 0);
          resolve({
            success: !!parsed.success && score >= 0.5,
            score: score,
            errorCodes: parsed['error-codes'] || []
          });
        } catch (e) {
          resolve({ success: false, score: 0, error: 'json_parse_failed', errorCodes: [] });
        }
      });
    });

    req.on('error', (e) => {
      resolve({ success: false, score: 0, error: e.message, errorCodes: [] });
    });

    req.write(postData);
    req.end();
  });
}

module.exports = { verifyRecaptchaToken };
