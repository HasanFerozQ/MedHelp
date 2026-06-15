const fs = require('fs');
const { generalRawCards } = require('./general_raw_cards.js');

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

  // Escape any remaining < and >
  formatted = formatted.replace(/</g, '&lt;').replace(/>/g, '&gt;');

  // Restore HTML tags
  tagPlaceholders.forEach(item => {
    formatted = formatted.replace(item.id, item.tag);
  });

  // 2. Replace chemical, hormonal, and receptor subscripts/superscripts
  formatted = formatted.replace(/Na\+/g, 'Na⁺')
                       .replace(/K\+/g, 'K⁺')
                       .replace(/H\+/g, 'H⁺')
                       .replace(/Ca2\+/g, 'Ca²⁺')
                       .replace(/Ca2/g, 'Ca²⁺')
                       .replace(/HPO42-/g, 'HPO₄²⁻')
                       .replace(/H2PO4-/g, 'H₂PO₄⁻')
                       .replace(/NH3/g, 'NH₃')
                       .replace(/NH4\+/g, 'NH₄⁺')
                       .replace(/PO4/g, 'PO₄')
                       .replace(/HCO3-/g, 'HCO₃⁻')
                       .replace(/HCO3/g, 'HCO₃')
                       .replace(/Cl-/g, 'Cl⁻')
                       .replace(/CO2/g, 'CO₂')
                       .replace(/O2/g, 'O₂')
                       .replace(/PCO2/g, 'PCO₂')
                       .replace(/PaCO2/g, 'PaCO₂')
                       .replace(/PaO2/g, 'PaO₂')
                       .replace(/α1/g, 'α₁')
                       .replace(/α2/g, 'α₂')
                       .replace(/β1/g, 'β₁')
                       .replace(/β2/g, 'β₂')
                       .replace(/β3/g, 'β₃')
                       .replace(/M1/g, 'M₁')
                       .replace(/M2/g, 'M₂')
                       .replace(/M3/g, 'M₃')
                       .replace(/M4/g, 'M₄')
                       .replace(/M5/g, 'M₅');

  // 3. Format equations to MathJax
  // Jv = Kf [(Pc − Pi) − σ(πc − πi)]
  formatted = formatted.replace(/Jv = Kf \[\(Pc − Pi\) − σ\(πc − πi\)\]/gi, '$$$$J_v = K_f [(P_c - P_i) - \\sigma(\\pi_c - \\pi_i)]$$$$');
  formatted = formatted.replace(/Jv = Kf \[\(Pc - Pi\) - σ\(πc - πi\)\]/gi, '$$$$J_v = K_f [(P_c - P_i) - \\sigma(\\pi_c - \\pi_i)]$$$$');
  // E = (61/z) log([ion]out / [ion]in)
  formatted = formatted.replace(/E = \(61\/z\) log\(\[ion\]out \/ \[ion\]in\)/gi, '$$$$E = \\frac{61}{z} \\log\\left(\\frac{[\\text{ion}]_{\\text{out}}}{[\\text{ion}]_{\\text{in}}}\\right)$$$$');
  // pH = 6.1 + log([HCO₃⁻] / (0.03 × PCO₂))
  formatted = formatted.replace(/pH = 6\.1 \+ log\(\[HCO₃⁻\] \/ \(0\.03 × PCO₂\)\)/gi, '$$$$\\text{pH} = 6.1 + \\log\\left(\\frac{[\\text{HCO}_3^-]}{0.03 \times P\\text{CO}_2}\\right)$$$$');
  formatted = formatted.replace(/pH = 6\.1 \+ log\(\[HCO₃⁻\] \/ \(0\.03 \* PCO₂\)\)/gi, '$$$$\\text{pH} = 6.1 + \\log\\left(\\frac{[\\text{HCO}_3^-]}{0.03 \times P\\text{CO}_2}\\right)$$$$');

  // Let's normalize spaces around arrows
  formatted = formatted.replace(/\s*→\s*/g, ' → ');

  // 4. Format List structures
  // Special list structure: <b>1. ... </b> <br> <b>2. ... </b>
  if (formatted.includes('<b>1. ') && formatted.includes('<b>2. ')) {
    const parts = formatted.split('<br>');
    const items = parts.map(p => {
      let trimmed = p.trim();
      trimmed = trimmed.replace(/^<b>\d+\.\s*(.*?)<\/b>/gi, '<b>$1</b>');
      return trimmed;
    });
    formatted = '<ol><li>' + items.join('</li><li>') + '</li></ol>';
  }

  // General numbered list: 1. ... <br> 2. ...
  else if (/^1\.\s+|<br>1\.\s+/.test(formatted) && /<br>2\.\s+/.test(formatted)) {
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

  // Bullet list starting with • or containing •
  else if (formatted.includes('•')) {
    const parts = formatted.split(/<br>•\s*|•\s*/g);
    let intro = parts[0].trim();
    const items = parts.slice(1).map(x => x.trim()).filter(Boolean);
    if (items.length > 0) {
      formatted = (intro ? intro + '<br>' : '') + '<ul><li>' + items.join('</li><li>') + '</li></ul>';
    }
  }

  // Bold items separated by <br>: e.g. "<b>Intracellular:</b> ... <br><b>Extracellular:</b> ..."
  else if (formatted.includes('<br><b>') && formatted.match(/<b>[^:]+:<\/b>/g)?.length >= 2) {
    const parts = formatted.split('<br>');
    const allListLike = parts.every(p => p.trim().startsWith('<b>'));
    if (allListLike) {
      formatted = '<ul><li>' + parts.map(p => p.trim()).join('</li><li>') + '</li></ul>';
    }
  }

  // Clean up any double list elements or formatting artifacts
  formatted = formatted.replace(/<br>\s*(<ol>|<ul>)/g, '$1')
                       .replace(/(<\/ol>|<\/ul>)\s*<br>/g, '$1')
                       .replace(/<li>\s*<\/li>/g, '');

  return formatted;
}

// Format all cards
const formattedCards = generalRawCards.map(c => {
  return {
    q: formatText(c.q),
    a: formatText(c.a)
  };
});

// Write output file
const outputContent = `const generalCards = ${JSON.stringify(formattedCards, null, 2)};

module.exports = { generalCards };
`;

fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/general_physiology.js', outputContent, 'utf8');
console.log(`Saved ${formattedCards.length} formatted General cards!`);
