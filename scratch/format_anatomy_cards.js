const fs = require('fs');
const { anatomyRawCards } = require('./anatomy_raw_cards.js');

function formatText(text, question) {
  if (!text) return text;
  let formatted = text;
  const qLower = (question || '').toLowerCase();

  // 1. Hide valid HTML tags with placeholders before escaping < >
  const tagPlaceholders = [];
  const validTagNames = ['b', 'br', 'ul', 'li', 'ol', 'sub', 'sup', 'i', 'span'];

  validTagNames.forEach(tagName => {
    const startRegex = new RegExp(`<(${tagName})\\b([^>]*)>`, 'gi');
    formatted = formatted.replace(startRegex, (m) => {
      const id = `___TAG_START_${tagPlaceholders.length}___`;
      tagPlaceholders.push({ id, tag: m });
      return id;
    });
    const endRegex = new RegExp(`</(${tagName})>`, 'gi');
    formatted = formatted.replace(endRegex, (m) => {
      const id = `___TAG_END_${tagPlaceholders.length}___`;
      tagPlaceholders.push({ id, tag: m });
      return id;
    });
  });

  // Escape bare < and >
  formatted = formatted.replace(/</g, '&lt;').replace(/>/g, '&gt;');

  // Restore HTML tags
  tagPlaceholders.forEach(item => {
    formatted = formatted.replace(item.id, item.tag);
  });

  // 2. Normalise arrows
  formatted = formatted.replace(/\s*→\s*/g, ' → ');
  formatted = formatted.replace(/\s*↔\s*/g, ' ↔ ');

  // 3. Custom overrides for specific high-yield list-style answers
  if (qLower.includes('muscles form the rotator cuff')) {
    return '<ul><li><b>S</b>upraspinatus</li><li><b>I</b>nfraspinatus</li><li><b>T</b>eres minor</li><li><b>S</b>ubscapularis</li></ul><b>Mnemonic:</b> <b>SITS</b>';
  }
  if (qLower.includes("erb's palsy")) {
    return '<b>C5–C6</b> injury → <b>Waiter\'s tip posture</b>:<ul><li>Arm adducted + internally rotated</li><li>Elbow extended</li><li>Wrist flexed</li></ul>';
  }
  if (qLower.includes("klumpke's palsy")) {
    return '<b>C8–T1</b> injury:<ul><li><b>Claw hand</b></li><li><b>Horner syndrome</b> (if T1 sympathetic rami involved)</li></ul>';
  }
  if (qLower.includes('blood supply to the upper limb')) {
    return '<b>Subclavian</b> → <b>Axillary</b> → <b>Brachial</b> → <b>Radial</b> + <b>Ulnar</b> arteries.';
  }
  if (qLower.includes('contents of the cubital fossa')) {
    return '<ul><li>Tendon of <b>biceps</b></li><li><b>Brachial artery</b></li><li><b>Median nerve</b></li></ul><b>Mnemonic:</b> <b>TAN</b> (lateral to medial)';
  }
  if (qLower.includes('median nerve motor supply in the hand')) {
    return '<b>Thenar muscles</b> — mnemonic <b>LOAF</b>:<ul><li><b>L</b>ateral two lumbricals</li><li><b>O</b>pponens pollicis</li><li><b>A</b>bductor pollicis brevis</li><li><b>F</b>lexor pollicis brevis</li></ul>';
  }
  if (qLower.includes('ulnar nerve motor supply in the hand')) {
    return '<ul><li><b>Hypothenar muscles</b></li><li><b>Interossei</b></li><li><b>Adductor pollicis</b></li><li><b>Medial two lumbricals</b></li></ul>';
  }
  if (qLower.includes('contents of the femoral triangle')) {
    return '<ul><li><b>N</b>erve (femoral)</li><li><b>A</b>rtery (femoral)</li><li><b>V</b>ein (femoral)</li><li><b>E</b>mpty space</li><li><b>L</b>ymphatics</li></ul><b>Mnemonic:</b> <b>NAVEL</b> (lateral to medial)';
  }
  if (qLower.includes("trendelenburg sign")) {
    return '<b>Contralateral pelvic drop</b> when standing on one leg — due to <b>superior gluteal nerve</b> injury → <b>gluteus medius</b> weakness.';
  }
  if (qLower.includes("unhappy triad")) {
    return '<ul><li><b>ACL</b> tear</li><li><b>Medial meniscus</b> tear</li><li><b>MCL</b> tear</li></ul>';
  }
  if (qLower.includes('layers are incised in a mcburney')) {
    return '<ol><li>External oblique</li><li>Internal oblique</li><li>Transversus abdominis</li><li>Transversalis fascia</li><li>Peritoneum</li></ol>';
  }
  if (qLower.includes('portosystemic anastomosis at the esophagus')) {
    return '<b>Left gastric vein</b> (portal) ↔ <b>esophageal veins</b> (azygos/systemic) → <b>esophageal varices</b> in portal HTN.';
  }
  if (qLower.includes('portosystemic anastomosis at the umbilicus')) {
    return '<b>Paraumbilical veins</b> (portal) ↔ <b>superficial epigastric veins</b> (systemic) → <b>caput medusae</b>.';
  }
  if (qLower.includes('portosystemic anastomosis at the rectum')) {
    return '<b>Superior rectal vein</b> (portal) ↔ <b>middle & inferior rectal veins</b> (systemic) → <b>anorectal varices</b>.';
  }
  if (qLower.includes('blood supply of the foregut') || qLower.includes('blood supply of the midgut') || qLower.includes('blood supply of the hindgut')) {
    // handled per question individually above — fall through to general
  }
  if (qLower.includes('order of structures in the popliteal fossa')) {
    return '<ul><li><b>Common peroneal nerve</b> (most lateral)</li><li><b>Tibial nerve</b></li><li><b>Popliteal vein</b></li><li><b>Popliteal artery</b> (deepest)</li></ul>';
  }
  if (qLower.includes('blood supply to the pancreas')) {
    return '<ul><li><b>Head:</b> Superior + inferior pancreaticoduodenal arteries</li><li><b>Body & tail:</b> Splenic artery branches</li></ul>';
  }

  // 4. General <br> → <ul> conversion (when parts have "Label: value" pattern)
  if (formatted.includes('<br>')) {
    const parts = formatted.split('<br>');
    // Check if all parts look like label: value pairs
    const allLabelled = parts.every(p => p.trim().includes(':'));
    if (allLabelled && parts.length >= 2) {
      const items = parts.map(p => {
        const trimmed = p.trim();
        const colonIdx = trimmed.indexOf(':');
        if (colonIdx > 0 && colonIdx < 30) {
          const label = trimmed.substring(0, colonIdx).trim();
          const val = trimmed.substring(colonIdx + 1).trim();
          return `<b>${label}:</b> ${val}`;
        }
        return trimmed;
      });
      return '<ul><li>' + items.join('</li><li>') + '</li></ul>';
    }
    // Mixed content — convert numbered items only
    const numberedParts = parts.filter(p => /^\d+\./.test(p.trim()));
    if (numberedParts.length >= 2) {
      const items = parts.map(p => p.trim().replace(/^\d+\.\s*/, ''));
      return '<ol><li>' + items.join('</li><li>') + '</li></ol>';
    }
    // Otherwise convert <br> list items to <ul>
    if (parts.length >= 2) {
      const items = parts.map(p => p.trim()).filter(Boolean);
      return '<ul><li>' + items.join('</li><li>') + '</li></ul>';
    }
  }

  // 5. Em-dash definition pattern: "Term — description"
  if (formatted.includes(' — ') && !formatted.includes('<b>')) {
    const parts = formatted.split(' — ');
    const term = parts[0].trim();
    const def = parts.slice(1).join(' — ').trim();
    return `<b>${term}</b> — ${def}`;
  }

  // 6. Arrow chain bolding (e.g. "Condition → Consequence")
  // Bold key medical terms
  const termsToBold = [
    'Waiter\'s tip', 'Claw hand', 'Horner syndrome', 'Wrist drop', 'Foot drop',
    'Winged scapula', 'Ape hand', 'Dinner fork deformity',
    'Colles\' fracture', 'Smith\'s fracture',
    'Avascular necrosis', 'Carpal tunnel syndrome',
    'Piriformis syndrome', 'Trendelenburg sign',
    'Virchow\'s node', 'Caput medusae', 'Courvoisier\'s sign', 'Kehr\'s sign',
    'Pringle\'s maneuver', "McBurney's point",
    'ACL', 'MCL', 'PCL', 'SITS', 'NAVEL', 'LOAF', 'TAN',
    'Calot\'s triangle', 'Triangle of Calot',
    'Portal hypertension', 'Cirrhosis',
    'Splenic flexure', 'Griffith\'s point',
    'Hartmann\'s pouch',
    'Cantlie\'s line', 'Pouch of Douglas',
    'Hesselbach\'s triangle',
    'Indirect inguinal hernia', 'Direct inguinal hernia', 'Femoral hernia',
    'Ilioinguinal nerve',
    'Sciatic nerve', 'Femoral nerve', 'Obturator nerve',
    'Tibial nerve', 'Common peroneal nerve', 'Superficial peroneal nerve', 'Deep peroneal nerve',
    'Saphenous nerve', 'Sural nerve', 'Axillary nerve',
    'Long thoracic nerve', 'Radial nerve', 'Median nerve', 'Ulnar nerve',
    'Supraspinatus', 'Infraspinatus', 'Teres minor', 'Subscapularis',
    'Gastrosplenic ligament', 'Splenorenal ligament',
    'Ligamentum teres hepatis', 'Ligamentum venosum',
    'Porta hepatis',
    'Superior mesenteric artery', 'Inferior mesenteric artery', 'Celiac trunk',
    'Profunda femoris', 'Anterior tibial artery', 'Posterior tibial artery',
    'Dorsalis pedis', 'Splenic artery', 'Splenic vein',
    'Portal vein', 'Hepatic artery',
    'Popliteal artery', 'Popliteal vein',
    'Medial circumflex femoral', 'Lateral circumflex femoral',
    'Retrocecal',
    'Epiploic foramen', 'Omental bursa',
    'Cantlie\'s line',
    'Rectouterine pouch',
    'Pectinate line', 'Dentate line',
    'Taeniae coli', 'Haustra',
    'Marginal artery of Drummond',
  ];

  termsToBold.forEach(term => {
    const escaped = term.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    const regex = new RegExp(`(?<!<b>)\\b(${escaped})\\b(?![^<]*<\\/b>)`, 'gi');
    formatted = formatted.replace(regex, '<b>$1</b>');
  });

  // Remove double bold wrapping
  formatted = formatted.replace(/<b><b>(.*?)<\/b><\/b>/g, '<b>$1</b>');

  return formatted;
}

const formattedCards = anatomyRawCards.map(c => ({
  q: formatText(c.q, c.q),
  a: formatText(c.a, c.q)
}));

const outputContent = `const anatomyCards = ${JSON.stringify(formattedCards, null, 2)};

module.exports = { anatomyCards };
`;

fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/anatomy.js', outputContent, 'utf8');
console.log(`Saved ${formattedCards.length} formatted Anatomy cards!`);
