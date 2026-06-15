const fs = require('fs');
const { reproductiveRawCards } = require('./reproductive_raw_cards.js');

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
                       .replace(/PO43-/g, 'PO₄³⁻')
                       .replace(/PO4/g, 'PO₄')
                       .replace(/PO₄³⁻/g, 'PO₄³⁻')
                       .replace(/HCO3-/g, 'HCO₃⁻')
                       .replace(/T3/g, 'T₃')
                       .replace(/T4/g, 'T₄')
                       .replace(/α1/g, 'α₁')
                       .replace(/α2/g, 'α₂')
                       .replace(/β1/g, 'β₁')
                       .replace(/β2/g, 'β₂')
                       .replace(/O2/g, 'O₂')
                       .replace(/CO2/g, 'CO₂')
                       .replace(/F2α/g, 'F₂α')
                       .replace(/F2\\alpha/g, 'F₂α');

  // Let's normalize spaces around arrows
  formatted = formatted.replace(/\s*→\s*/g, ' → ');

  // 3. Format List structures
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

  // Bold items separated by <br>: e.g. "<b>Theca cells:</b> ... <br><b>Granulosa cells:</b> ..."
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
const formattedCards = reproductiveRawCards.map(c => {
  return {
    q: formatText(c.q),
    a: formatText(c.a)
  };
});

// Write output file
const outputContent = `const reproductiveCards = ${JSON.stringify(formattedCards, null, 2)};

module.exports = { reproductiveCards };
`;

fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/reproductive_physiology.js', outputContent, 'utf8');
console.log(`Saved ${formattedCards.length} formatted Reproductive cards!`);
