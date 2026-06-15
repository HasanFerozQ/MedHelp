const fs = require('fs');
const { anatomyAppendRawCards } = require('./anatomy_append_raw_cards.js');

function formatText(text, question) {
  if (!text) return text;
  let formatted = text;
  const qLower = (question || '').toLowerCase();

  // 1. Placeholder-protect valid HTML tags before escaping < >
  const tagPlaceholders = [];
  const validTagNames = ['b', 'br', 'ul', 'li', 'ol', 'sub', 'sup', 'i', 'span'];
  validTagNames.forEach(tagName => {
    const startRegex = new RegExp(`<(${tagName})\\b([^>]*)>`, 'gi');
    formatted = formatted.replace(startRegex, (m) => {
      const id = `___TS_${tagPlaceholders.length}___`;
      tagPlaceholders.push({ id, tag: m });
      return id;
    });
    const endRegex = new RegExp(`</(${tagName})>`, 'gi');
    formatted = formatted.replace(endRegex, (m) => {
      const id = `___TE_${tagPlaceholders.length}___`;
      tagPlaceholders.push({ id, tag: m });
      return id;
    });
  });
  formatted = formatted.replace(/</g, '&lt;').replace(/>/g, '&gt;');
  tagPlaceholders.forEach(item => { formatted = formatted.replace(item.id, item.tag); });

  // 2. Normalise arrows
  formatted = formatted.replace(/\s*→\s*/g, ' → ');

  // 3. Custom overrides
  if (qLower.includes('zones of the prostate')) {
    return '<ul><li><b>Peripheral zone</b> — most cancers (70%)</li><li><b>Central zone</b></li><li><b>Transition zone</b> — BPH</li></ul>';
  }
  if (qLower.includes('most common site of ureteric constriction')) {
    return '<ol><li><b>Ureteropelvic junction</b> (UPJ)</li><li>Crossing of <b>common iliac artery</b></li><li><b>Ureterovesical junction</b> (UVJ)</li></ol>';
  }
  if (qLower.includes('layers traversed during lumbar puncture')) {
    return '<ol><li>Skin</li><li>Subcutaneous tissue</li><li><b>Supraspinous ligament</b></li><li><b>Interspinous ligament</b></li><li><b>Ligamentum flavum</b></li><li>Epidural space</li><li><b>Dura mater</b></li><li><b>Arachnoid mater</b></li><li><b>Subarachnoid space</b> (CSF)</li></ol>';
  }
  if (qLower.includes('three major openings in the diaphragm')) {
    return '<ul><li><b>T8</b> — Caval opening (<b>IVC</b>)</li><li><b>T10</b> — Esophageal hiatus (<b>esophagus</b> + <b>vagus nerves</b>)</li><li><b>T12</b> — Aortic hiatus (<b>aorta</b>, thoracic duct, azygos vein)</li></ul><b>Mnemonic:</b> I (8) ate (10) eggs (12) at the table.';
  }
  if (qLower.includes('innervation of the penis')) {
    return '<ul><li><b>Erection:</b> Parasympathetic (pelvic splanchnics S2–S4)</li><li><b>Ejaculation:</b> Sympathetic (hypogastric nerves)</li></ul><b>Mnemonic:</b> <i>Point</i> (parasympathetic) and <i>Shoot</i> (sympathetic).';
  }
  if (qLower.includes('anterior spinal artery occlusion')) {
    return '<b>Anterior Spinal Artery Syndrome:</b><ul><li>Bilateral <b>loss of motor function</b> (corticospinal tract)</li><li>Bilateral <b>loss of pain and temperature</b> (spinothalamic tract)</li><li><b>Preserved proprioception and vibration</b> (dorsal columns)</li></ul>';
  }
  if (qLower.includes("structures are in the posterior triangle")) {
    return '<ul><li><b>Accessory nerve (CN XI)</b></li><li><b>Brachial plexus trunks</b></li><li><b>Subclavian artery</b></li><li><b>External jugular vein</b></li></ul>';
  }

  // 4. General <br> → list conversion
  if (formatted.includes('<br>')) {
    const parts = formatted.split('<br>');
    // Numbered list detection
    const firstPart = parts[0].trim();
    if (/^\d+\./.test(firstPart)) {
      const items = parts.map(p => p.trim().replace(/^\d+\.\s*/, ''));
      return '<ol><li>' + items.join('</li><li>') + '</li></ol>';
    }
    // Label: value pairs
    const allLabelled = parts.every(p => {
      const t = p.trim();
      const ci = t.indexOf(':');
      return ci > 0 && ci < 35;
    });
    if (allLabelled && parts.length >= 2) {
      const items = parts.map(p => {
        const t = p.trim();
        const ci = t.indexOf(':');
        const label = t.substring(0, ci).trim();
        const val = t.substring(ci + 1).trim();
        return `<b>${label}:</b> ${val}`;
      });
      return '<ul><li>' + items.join('</li><li>') + '</li></ul>';
    }
    // Plain multi-item
    if (parts.length >= 2) {
      return '<ul><li>' + parts.map(p => p.trim()).filter(Boolean).join('</li><li>') + '</li></ul>';
    }
  }

  // 5. Em-dash definition (only if no bold yet)
  if (formatted.includes(' — ') && !formatted.includes('<b>')) {
    const dashIdx = formatted.indexOf(' — ');
    const term = formatted.substring(0, dashIdx).trim();
    const def = formatted.substring(dashIdx + 3).trim();
    return `<b>${term}</b> — ${def}`;
  }

  // 6. Auto-bold key terms
  const termsToBold = [
    'Horseshoe kidney', 'Pelvic kidney', 'Nutcracker syndrome',
    'Batson\'s plexus', 'Artery of Adamkiewicz',
    'Conus medullaris', 'Cauda equina',
    'Phrenic nerve', 'Ansa cervicalis',
    'Spinal accessory nerve', 'Accessory nerve',
    'Anterior communicating artery',
    'Middle meningeal artery', 'Bridging veins',
    'Basal ganglia', 'Putamen',
    'Bochdalek hernia', 'Morgagni hernia', 'Hiatal hernia',
    'Carotid body', 'Carotid sinus', 'Carotid sheath',
    'Berry aneurysm', 'Saccular aneurysm',
    'Subarachnoid hemorrhage', 'Epidural hematoma', 'Subdural hematoma',
    'Intracerebral hemorrhage',
    'Trigone', 'Detrusor muscle',
    'Internal urethral sphincter', 'External urethral sphincter',
    'Pudendal nerve',
    'Uterine artery',
    'Para-aortic', 'Internal iliac',
    'Ligamentum flavum', 'Subarachnoid space', 'Epidural space',
    'L1–L2', 'L3–L4', 'L4–L5',
    'Vagus nerve', 'Glossopharyngeal nerve',
    'Trapezius',
    'Infrarenal', 'Ascending aorta',
    'Anterior spinal artery', 'Posterior spinal arteries',
  ];
  termsToBold.forEach(term => {
    const esc = term.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    const rx = new RegExp(`(?<!<[^>]*)\\b(${esc})\\b`, 'gi');
    formatted = formatted.replace(rx, '<b>$1</b>');
  });
  formatted = formatted.replace(/<b><b>(.*?)<\/b><\/b>/g, '<b>$1</b>');

  return formatted;
}

const formattedCards = anatomyAppendRawCards.map(c => ({
  q: formatText(c.q, c.q),
  a: formatText(c.a, c.q)
}));

const outputContent = `const anatomyAppendCards = ${JSON.stringify(formattedCards, null, 2)};

module.exports = { anatomyAppendCards };
`;

fs.writeFileSync(
  'C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/anatomy_append.js',
  outputContent, 'utf8'
);
console.log(`Saved ${formattedCards.length} formatted Anatomy-append cards!`);
