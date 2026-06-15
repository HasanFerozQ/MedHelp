const fs = require('fs');
const { renalRawCards } = require('./renal_raw_cards.js');

function formatText(text) {
  if (!text) return text;
  let formatted = text;

  // 1. Escape operators < and > unless they are part of valid HTML tags
  const tagPlaceholders = [];
  const validTagNames = ['b', 'br', 'ul', 'li', 'ol', 'sub', 'sup', 'i', 'table', 'tr', 'td', 'div', 'span', 'thead', 'tbody', 'th'];

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

  // Now escape any remaining < and > in the text
  formatted = formatted.replace(/</g, '&lt;').replace(/>/g, '&gt;');

  // Restore HTML tags from placeholders
  tagPlaceholders.forEach(item => {
    formatted = formatted.replace(item.id, item.tag);
  });

  // 2. Replace chemical formulas with beautiful Unicode subscripts/superscripts
  // Let's replace Na+, K+, H+, Ca2+, Mg2+, HCO3-, Cl-, NH4+, NH3, PO4, H2O, CO2
  // Make sure not to replace inside HTML tag attributes
  formatted = formatted.replace(/Na\+/g, 'Na⁺')
                       .replace(/K\+/g, 'K⁺')
                       .replace(/H\+/g, 'H⁺')
                       .replace(/Ca2\+/g, 'Ca²⁺')
                       .replace(/Mg2\+/g, 'Mg²⁺')
                       .replace(/HCO3-/g, 'HCO₃⁻')
                       .replace(/HCO3\-/g, 'HCO₃⁻')
                       .replace(/Cl-/g, 'Cl⁻')
                       .replace(/Cl\-/g, 'Cl⁻')
                       .replace(/NH4\+/g, 'NH₄⁺')
                       .replace(/NH3/g, 'NH₃')
                       .replace(/PO4/g, 'PO₄')
                       .replace(/H2O/g, 'H₂O')
                       .replace(/CO2/g, 'CO₂')
                       .replace(/HCO3/g, 'HCO₃')
                       .replace(/Ca2/g, 'Ca²⁺');

  // 3. Format equations to MathJax
  // GFR = Kf × [(Pgc − Pbs) − (πgc − πbs)]
  formatted = formatted.replace(/GFR = Kf × \[\(Pgc − Pbs\) − \(πgc − πbs\)\]/gi, '$$$$\\text{GFR} = K_f \\times [(P_{gc} - P_{bs}) - (\\pi_{gc} - \\pi_{bs})]$$$$');
  formatted = formatted.replace(/GFR = Kf × \[\(Pgc - Pbs\) - \(πgc - πbs\)\]/gi, '$$$$\\text{GFR} = K_f \\times [(P_{gc} - P_{bs}) - (\\pi_{gc} - \\pi_{bs})]$$$$');
  // Cx = (Ux × V) / Px
  formatted = formatted.replace(/Cx = \(Ux × V\) \/ Px/gi, '$$$$C_x = \\frac{U_x \\times V}{P_x}$$$$');
  // pH = 6.1 + log([HCO3−] / 0.03 × PCO2)
  formatted = formatted.replace(/pH = 6\.1 \+ log\(\[HCO3−\] \/ 0\.03 × PCO2\)/gi, '$$$$\\text{pH} = 6.1 + \\log\\left(\\frac{[\\text{HCO}_3^-]}{0.03 \\times P\\text{CO}_2}\\right)$$$$');
  formatted = formatted.replace(/pH = 6\.1 \+ log\(\[HCO3−\] \/ 0\.03 \* PCO2\)/gi, '$$$$\\text{pH} = 6.1 + \\log\\left(\\frac{[\\text{HCO}_3^-]}{0.03 \\times P\\text{CO}_2}\\right)$$$$');
  formatted = formatted.replace(/pH = 6\.1 \+ log\(\[HCO₃−\] \/ 0\.03 × PCO₂\)/gi, '$$$$\\text{pH} = 6.1 + \\log\\left(\\frac{[\\text{HCO}_3^-]}{0.03 \\times P\\text{CO}_2}\\right)$$$$');
  // FENa = (UNa/PNa) / (UCr/PCr) × 100
  formatted = formatted.replace(/FENa = \(UNa\/PNa\) \/ \(UCr\/PCr\) × 100/gi, '$$$$\\text{FE}_{\\text{Na}} = \\frac{U_{\\text{Na}} / P_{\\text{Na}}}{U_{\\text{Cr}} / P_{\\text{Cr}}} \\times 100$$$$');
  formatted = formatted.replace(/FENa = \(UNa\/PNa\) \/ \(UCr\/PCr\) \* 100/gi, '$$$$\\text{FE}_{\\text{Na}} = \\frac{U_{\\text{Na}} / P_{\\text{Na}}}{U_{\\text{Cr}} / P_{\\text{Cr}}} \\times 100$$$$');

  // Remove bold tags surrounding MathJax block equations
  formatted = formatted.replace(/<b>\s*(\$\$.*?\$\$)\s*<\/b>/g, '$1');

  // Let's normalize spaces and tabs around arrows
  formatted = formatted.replace(/\s*→\s*/g, ' → ');

  // 4. Format List structures
  // If there are numbered list items in the text: (e.g. 1. ... <br>2. ... <br>3. ...)
  // Check if text contains 1. and <br>2.
  if (/^1\.\s+|<br>1\.\s+/.test(formatted) && /<br>2\.\s+/.test(formatted)) {
    // Numbered list
    // Split by <br> or list markers
    const parts = formatted.split(/<br>(?=\d+\.)|^(?=\d+\.)/gm);
    let intro = '';
    const items = [];
    parts.forEach(p => {
      const trimmed = p.trim();
      if (/^\d+\.\s+/.test(trimmed)) {
        items.push(trimmed.replace(/^\d+\.\s+/, ''));
      } else {
        intro += p;
      }
    });
    if (items.length > 0) {
      formatted = (intro ? intro.trim() + '<br>' : '') + '<ol><li>' + items.join('</li><li>') + '</li></ol>';
    }
  }

  // If there are bullet list items in the text: (e.g. • ... <br>• ... or • ... \n • ...)
  if (formatted.includes('•')) {
    const parts = formatted.split(/<br>•\s*|•\s*/g);
    let intro = parts[0].trim();
    const items = parts.slice(1).map(x => x.trim()).filter(Boolean);
    if (items.length > 0) {
      formatted = (intro ? intro + '<br>' : '') + '<ul><li>' + items.join('</li><li>') + '</li></ul>';
    }
  }

  // Special block lists for cards where bold terms are separated by <br>:
  // e.g. "<b>Cortical Nephrons (85%):</b> ... <br><b>Juxtamedullary Nephrons (15%):</b> ..."
  // Let's convert them to <ul> list items if there are multiple <b>...</b>: items separated by <br>
  if (formatted.includes('<br><b>') && formatted.match(/<b>[^:]+:<\/b>/g)?.length >= 2) {
    const parts = formatted.split('<br>');
    // Verify that all parts look like list items
    const allListLike = parts.every(p => p.trim().startsWith('<b>'));
    if (allListLike) {
      formatted = '<ul><li>' + parts.map(p => p.trim()).join('</li><li>') + '</li></ul>';
    }
  }

  // Clean up any empty/double list elements or spaces
  formatted = formatted.replace(/<br>\s*(<ol>|<ul>)/g, '$1')
                       .replace(/(<\/ol>|<\/ul>)\s*<br>/g, '$1')
                       .replace(/<li>\s*<\/li>/g, '');

  return formatted;
}

// Format all cards
const formattedCards = renalRawCards.map(c => {
  return {
    q: formatText(c.q),
    a: formatText(c.a)
  };
});

// Write formatted cards to a output js file
const outputContent = `const renalCards = ${JSON.stringify(formattedCards, null, 2)};

module.exports = { renalCards };
`;

fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/renal_physiology.js', outputContent, 'utf8');
console.log(`Saved ${formattedCards.length} formatted cards!`);
