// Setup type definitions for built-in Supabase Runtime APIs
import "@supabase/functions-js/edge-runtime.d.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

// Stateless Random Key Selector for Load Balancing (avoids Redis/KV for simplicity)
const getDynamicApiKey = () => {
  const keys = [
    Deno.env.get('GEMINI_KEY_1'),
    Deno.env.get('GEMINI_KEY_2'),
    Deno.env.get('GEMINI_KEY_3'),
    Deno.env.get('GEMINI_KEY_4'),
  ].filter(k => k !== undefined && k !== null && k.trim() !== "");

  if (keys.length === 0) {
    throw new Error("No GEMINI API keys configured in Edge Function.");
  }

  // Statistically random distribution across available keys
  return keys[Math.floor(Math.random() * keys.length)];
};

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const { pdfBase64, mimeType } = await req.json();

    if (!pdfBase64) {
      return new Response(
        JSON.stringify({ error: "No document base64 provided." }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const apiKey = getDynamicApiKey();
    const model = 'gemini-1.5-flash';
    const apiUrl = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${apiKey}`;

    const promptText = `You are an expert Medical Auditor looking for billing anomalies. 
Analyze the provided medical bill (whether EOB, hospital statement, or CMS-1500).
Identify any coding anomalies such as duplicate charges, unbundling errors, medically unnecessary services, dx-procedure mismatches, arithmetic errors, or missing modifiers.
Return ONLY a valid JSON array of objects, where each object has exactly two keys: "code" (the problematic CPT, HCPCS, or ICD-10 code) and "reason" (a short 1-sentence explanation of why it is an anomaly).
If no anomalies are found, return an empty array [].
Do not include markdown blocks like \`\`\`json. Return raw JSON.`;

    const requestBody = {
      contents: [
        {
          role: "user",
          parts: [
            { text: promptText },
            {
              inlineData: {
                mimeType: mimeType || "application/pdf",
                data: pdfBase64
              }
            }
          ]
        }
      ],
      generationConfig: {
        responseMimeType: "application/json"
      }
    };

    const response = await fetch(apiUrl, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(requestBody)
    });

    if (!response.ok) {
      const errText = await response.text();
      console.error(`Gemini API Error: ${response.status} ${response.statusText}`, errText);
      return new Response(JSON.stringify({ error: "Gemini API failed to process the document.", details: errText }), {
        status: response.status === 429 ? 429 : 502, // Pass 429 explicitly for client backoff
        headers: { ...corsHeaders, "Content-Type": "application/json" }
      });
    }

    const resultData = await response.json();
    let extractedText = "[]";
    
    if (resultData.candidates && resultData.candidates.length > 0) {
       extractedText = resultData.candidates[0].content.parts[0].text;
    }

    // Try parsing to ensure it's valid JSON
    let parsedArray = [];
    try {
        parsedArray = JSON.parse(extractedText);
    } catch (e) {
        console.error("Failed to parse Gemini output as JSON", extractedText);
    }

    return new Response(
      JSON.stringify({ anomalies: parsedArray }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" }, status: 200 }
    );

  } catch (error) {
    console.error("Function error:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
      status: 500,
    });
  }
});
