const fs = require('fs');
const { pathologyRawCards } = require('./pathology_raw_cards.js');

function formatText(text, question) {
  if (!text) return text;
  let formatted = text;
  const qLower = (question || '').toLowerCase();

  // 1. Protect valid HTML tags
  const tagPlaceholders = [];
  const validTagNames = ['b', 'br', 'ul', 'li', 'ol', 'sub', 'sup', 'i', 'span'];
  validTagNames.forEach(tagName => {
    formatted = formatted.replace(new RegExp(`<(${tagName})\\b([^>]*)>`, 'gi'), (m) => {
      const id = `___TS_${tagPlaceholders.length}___`; tagPlaceholders.push({ id, tag: m }); return id;
    });
    formatted = formatted.replace(new RegExp(`</(${tagName})>`, 'gi'), (m) => {
      const id = `___TE_${tagPlaceholders.length}___`; tagPlaceholders.push({ id, tag: m }); return id;
    });
  });
  formatted = formatted.replace(/</g, '&lt;').replace(/>/g, '&gt;');
  tagPlaceholders.forEach(item => { formatted = formatted.replace(item.id, item.tag); });

  // 2. Normalise arrows
  formatted = formatted.replace(/\s*→\s*/g, ' → ');

  // 3. Custom overrides for specific cards
  if (qLower.includes('five cardinal signs of inflammation')) {
    return '<ul><li><b>Rubor</b> — redness</li><li><b>Tumor</b> — swelling</li><li><b>Calor</b> — heat</li><li><b>Dolor</b> — pain</li><li><b>Functio laesa</b> — loss of function</li></ul>';
  }
  if (qLower.includes('steps of leukocyte extravasation')) {
    return '<ol><li><b>Margination</b></li><li><b>Rolling</b> (selectins)</li><li><b>Adhesion</b> (integrins)</li><li><b>Transmigration / Diapedesis</b></li><li><b>Chemotaxis</b></li></ol>';
  }
  if (qLower.includes('labile, stable, and permanent tissues')) {
    return '<ul><li><b>Labile:</b> high turnover (skin, GI epithelium, bone marrow)</li><li><b>Stable:</b> low turnover but can regenerate (liver, kidney, pancreas)</li><li><b>Permanent:</b> cannot divide (neurons, cardiac muscle, skeletal muscle)</li></ul>';
  }
  if (qLower.includes('hallmarks of cancer')) {
    return '<ol><li>Sustaining <b>proliferative signaling</b></li><li>Evading <b>growth suppressors</b></li><li>Resisting <b>cell death</b></li><li>Enabling <b>replicative immortality</b></li><li>Inducing <b>angiogenesis</b></li><li>Activating <b>invasion & metastasis</b></li></ol>';
  }
  if (qLower.includes('hallmarks of reversible cell injury')) {
    return '<ul><li><b>Cellular swelling</b> (hydropic change)</li><li><b>Fatty change</b> (steatosis)</li><li><b>Plasma membrane blebbing</b></li></ul>';
  }
  if (qLower.includes('hallmarks of irreversible cell injury')) {
    return '<ul><li><b>Mitochondrial damage</b> (flocculent densities)</li><li><b>Plasma membrane rupture</b></li><li>Nuclear changes: <b>pyknosis</b> → <b>karyorrhexis</b> → <b>karyolysis</b></li></ul>';
  }
  if (qLower.includes('major pathways of apoptosis')) {
    return '<ul><li><b>Intrinsic (mitochondrial):</b> cytochrome c release → caspase-9 → caspase-3</li><li><b>Extrinsic (death receptor):</b> FasL/TNF → caspase-8 → caspase-3</li></ul>';
  }
  if (qLower.includes('abcde rule for melanoma')) {
    return '<ul><li><b>A</b> — Asymmetry</li><li><b>B</b> — Border irregularity</li><li><b>C</b> — Color variation</li><li><b>D</b> — Diameter &gt;6 mm</li><li><b>E</b> — Evolution (change over time)</li></ul>';
  }
  if (qLower.includes('classic reed-sternberg cell variants')) {
    return '<ul><li><b>Owl-eye</b> — Classic RS cell (nodular sclerosis, mixed cellularity)</li><li><b>Popcorn cell</b> — Lymphocyte predominant</li><li><b>Lacunar cell</b> — Nodular sclerosis</li></ul>';
  }
  if (qLower.includes('complications of wound healing')) {
    return '<ul><li><b>Infection</b></li><li><b>Dehiscence</b> (wound reopening)</li><li><b>Keloid / Hypertrophic scar</b></li><li><b>Contracture</b></li></ul>';
  }
  if (qLower.includes('characteristic nuclear feature of papillary thyroid')) {
    return '<ul><li><b>Orphan Annie eye nuclei</b> (ground-glass, empty appearing)</li><li><b>Nuclear grooves</b></li><li><b>Psammoma bodies</b></li></ul>';
  }

  // 4. <br> → list conversion
  if (formatted.includes('<br>')) {
    const parts = formatted.split('<br>');
    // Detect numbered list
    if (/^\d+\./.test(parts[0].trim())) {
      const items = parts.map(p => p.trim().replace(/^\d+\.\s*/, ''));
      return '<ol><li>' + items.join('</li><li>') + '</li></ol>';
    }
    // Detect label: value pairs
    const allLabelled = parts.length >= 2 && parts.every(p => {
      const t = p.trim(); const ci = t.indexOf(':'); return ci > 0 && ci < 40;
    });
    if (allLabelled) {
      const items = parts.map(p => {
        const t = p.trim(); const ci = t.indexOf(':');
        return `<b>${t.substring(0, ci).trim()}:</b> ${t.substring(ci + 1).trim()}`;
      });
      return '<ul><li>' + items.join('</li><li>') + '</li></ul>';
    }
    // Plain multi-item
    return '<ul><li>' + parts.map(p => p.trim()).filter(Boolean).join('</li><li>') + '</li></ul>';
  }

  // 5. Em-dash definition
  if (formatted.includes(' — ') && !formatted.includes('<b>')) {
    const di = formatted.indexOf(' — ');
    return `<b>${formatted.substring(0, di).trim()}</b> — ${formatted.substring(di + 3).trim()}`;
  }

  // 6. Auto-bold key pathology terms
  const boldTerms = [
    'Neutrophils', 'Macrophages', 'Eosinophils', 'Mast cells', 'Basophils', 'Plasma cells',
    'Selectins', 'Integrins', 'Diapedesis', 'Chemotaxis', 'Opsonins',
    'IgG', 'C3b', 'C5a', 'LTB4', 'IL-8', 'TGF-β', 'VEGF', 'TNF',
    'Histamine', 'Serotonin', 'Bradykinin', 'Prostaglandins',
    'Granuloma', 'Granulation tissue', 'Epithelioid macrophages',
    'Reed-Sternberg', 'Smudge cells', 'Starry sky',
    'Caseating', 'Non-caseating',
    'Pyknosis', 'Karyorrhexis', 'Karyolysis',
    'Apoptosis', 'Necrosis', 'Caspase-3', 'Caspase-9', 'Bcl-2', 'Bax', 'Bak', 'p53',
    'Cytochrome c',
    'Liquefactive necrosis', 'Caseous necrosis', 'Fat necrosis', 'Fibrinoid necrosis', 'Gangrenous necrosis', 'Coagulative necrosis',
    'Amyloidosis', 'Congo red', 'Apple-green birefringence',
    'AL amyloidosis', 'AA amyloidosis',
    'Keloid', 'Hypertrophic scar',
    'Dysplasia', 'Carcinoma in situ', 'Metastasis',
    'Warburg effect', 'Angiogenesis',
    'TNM system', 'Lymphatics', 'Hematogenous',
    'AFP', 'PSA', 'CA-125', 'CA 19-9', 'CEA',
    'PTHrP', 'SIADH', 'Lambert-Eaton',
    'Glioblastoma multiforme', 'Pilocytic astrocytoma', 'Medulloblastoma', 'Craniopharyngioma',
    'Osteosarcoma', 'Liposarcoma', 'Rhabdomyosarcoma',
    'ALL', 'CLL', 'CML', 'AML',
    'Philadelphia chromosome', 'BCR-ABL', 'JAK2 V617F',
    'Polycythemia vera', 'Blast crisis',
    'Diffuse large B-cell lymphoma', 'Follicular lymphoma', 'Burkitt lymphoma', 'Mantle cell lymphoma',
    'BCL-2', 'c-MYC',
    'Nodular sclerosis', 'Lymphocyte predominant',
    'Seminoma', 'Yolk sac tumor',
    'Dermoid cyst', 'Serous cystadenocarcinoma',
    'Invasive ductal carcinoma', 'BRCA1', 'BRCA2',
    'Paget disease', 'Papillary thyroid carcinoma', 'Anaplastic thyroid carcinoma',
    'Multiple myeloma',
    'Minimal change disease', 'FSGS', 'IgA nephropathy', 'Berger disease',
    'Renal cell carcinoma',
    'Basal cell carcinoma', 'Melanoma', 'Squamous cell carcinoma',
    'Breslow thickness',
    'Adenocarcinoma', 'Small cell lung cancer',
    'Myxoma', 'Rhabdomyoma',
    'Pseudopalisading',
  ];
  boldTerms.forEach(term => {
    const esc = term.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    formatted = formatted.replace(new RegExp(`(?<!<[^>]*)\\b(${esc})\\b`, 'gi'), '<b>$1</b>');
  });
  formatted = formatted.replace(/<b><b>(.*?)<\/b><\/b>/g, '<b>$1</b>');
  return formatted;
}

const formattedCards = pathologyRawCards.map(c => ({
  q: formatText(c.q, c.q),
  a: formatText(c.a, c.q)
}));

const out = `const pathologyCards = ${JSON.stringify(formattedCards, null, 2)};\n\nmodule.exports = { pathologyCards };\n`;
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/pathology.js', out, 'utf8');
console.log(`Saved ${formattedCards.length} formatted Pathology cards!`);
