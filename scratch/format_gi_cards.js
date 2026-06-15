const fs = require('fs');
const { giRawCards } = require('./gi_raw_cards.js');

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

  // 2. Replace chemical and hormonal subscripts
  formatted = formatted.replace(/HCO3-/g, 'HCO₃⁻')
                       .replace(/HCO3\-/g, 'HCO₃⁻')
                       .replace(/HCO3/g, 'HCO₃')
                       .replace(/Na\+/g, 'Na⁺')
                       .replace(/Cl-/g, 'Cl⁻')
                       .replace(/Cl\-/g, 'Cl⁻')
                       .replace(/H\+/g, 'H⁺')
                       .replace(/K\+/g, 'K⁺')
                       .replace(/Fe2\+/g, 'Fe²⁺')
                       .replace(/PGE2/g, 'PGE₂')
                       .replace(/PGE1/g, 'PGE₁')
                       .replace(/O2/g, 'O₂');

  // Let's normalize spaces around arrows
  formatted = formatted.replace(/\s*→\s*/g, ' → ');

  // 3. Format List structures
  // Special handling for: <b>1. ... </b> <br> <b>2. ... </b>
  if (formatted.includes('<b>1. ') && formatted.includes('<b>2. ')) {
    const parts = formatted.split('<br>');
    const items = parts.map(p => {
      let trimmed = p.trim();
      // Remove <b>1. </b> or <b>1. ...</b> leading numbers
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

  // Bullet list: • or <br>•
  else if (formatted.includes('•')) {
    const parts = formatted.split(/<br>•\s*|•\s*/g);
    let intro = parts[0].trim();
    const items = parts.slice(1).map(x => x.trim()).filter(Boolean);
    if (items.length > 0) {
      formatted = (intro ? intro + '<br>' : '') + '<ul><li>' + items.join('</li><li>') + '</li></ul>';
    }
  }

  // Bold items separated by <br>: e.g. "<b>Gastrin:</b> ... <br><b>CCK:</b> ..."
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
const formattedCards = giRawCards.map(c => {
  return {
    q: formatText(c.q),
    a: formatText(c.a)
  };
});

// Write to output file
const outputContent = `const giCards = ${JSON.stringify(formattedCards, null, 2)};

module.exports = { giCards };
`;

fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/gastrointestinal_physiology.js', outputContent, 'utf8');
console.log(`Saved ${formattedCards.length} formatted GI cards!`);
