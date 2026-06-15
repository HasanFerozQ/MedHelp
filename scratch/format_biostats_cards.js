const fs = require('fs');
const { biostatsRawCards } = require('./biostats_raw_cards.js');

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

  // 2. Format equations to MathJax (use $$$$ in JS replace to get $$ in output)
  
  // PPV = TP / (TP + FP)
  formatted = formatted.replace(/PPV = TP \/ \(TP \+ FP\)/gi, '$$$$\\text{PPV} = \\frac{\\text{TP}}{\\text{TP} + \\text{FP}}$$$$');
  
  // NPV = TN / (TN + FN)
  formatted = formatted.replace(/NPV = TN \/ \(TN \+ FN\)/gi, '$$$$\\text{NPV} = \\frac{\\text{TN}}{\\text{TN} + \\text{FN}}$$$$');
  
  // OR = (a/d) / (b/c) or (ad/bc) or ad/bc
  formatted = formatted.replace(/OR = \(a\/d\) \/ \(b\/c\)[^.]*\(ad\/bc\)/gi, '$$$$\\text{OR} = \\frac{a \\times d}{b \\times c}$$$$');
  formatted = formatted.replace(/OR = \(a\/d\) \/ \(b\/c\) in a 2×2 table \(ad\/bc\)/gi, '$$$$\\text{OR} = \\frac{a \\times d}{b \\times c}$$$$');

  // ARR = Risk in control group − Risk in treatment group (or with hyphen)
  formatted = formatted.replace(/ARR = Risk in control group [−\-–] Risk in treatment group/gi, '$$$$\\text{ARR} = \\text{Risk}_{\\text{control}} - \\text{Risk}_{\\text{treatment}}$$$$');
  formatted = formatted.replace(/Risk in control group [−\-–] Risk in treatment group/gi, '$$$$\\text{ARR} = \\text{Risk}_{\\text{control}} - \\text{Risk}_{\\text{treatment}}$$$$');
  
  // NNT = 1 / ARR
  formatted = formatted.replace(/1 \/ ARR/g, '$$$$\\text{NNT} = \\frac{1}{\\text{ARR}}$$$$');
  formatted = formatted.replace(/NNT = 1 \/ Absolute Risk Reduction \(ARR\)/gi, '$$$$\\text{NNT} = \\frac{1}{\\text{ARR}}$$$$');
  
  // NNH = 1 / Absolute Risk Increase
  formatted = formatted.replace(/1 \/ Absolute Risk Increase/gi, '$$$$\\text{NNH} = \\frac{1}{\\text{ARI}}$$$$');
  
  // LR+ = Sensitivity / (1 − Specificity)
  formatted = formatted.replace(/Positive LR = Sensitivity \/ \(1 − Specificity\)/gi, '$$$$\\text{LR}^+ = \\frac{\\text{Sensitivity}}{1 - \\text{Specificity}}$$$$');
  formatted = formatted.replace(/Sensitivity \/ \(1 - Specificity\)/gi, '$$$$\\text{LR}^+ = \\frac{\\text{Sensitivity}}{1 - \\text{Specificity}}$$$$');

  // LR- = (1 − Sensitivity) / Specificity
  formatted = formatted.replace(/\(1 - Sensitivity\) \/ Specificity/gi, '$$$$\\text{LR}^- = \\frac{1 - \\text{Sensitivity}}{\\text{Specificity}}$$$$');
  formatted = formatted.replace(/\(1 − Sensitivity\) \/ Specificity/gi, '$$$$\\text{LR}^- = \\frac{1 - \\text{Sensitivity}}{\\text{Specificity}}$$$$');
  
  // Prevalence = Incidence × Duration
  formatted = formatted.replace(/Prevalence = Incidence × Duration of disease/gi, '$$$$\\text{Prevalence} = \\text{Incidence} \\times \\text{Duration}$$$$');

  // Remove bold tags surrounding MathJax block equations
  formatted = formatted.replace(/<b>\s*(\$\$.*?\$\$)\s*<\/b>/g, '$1');

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

  // Bold items separated by <br>: e.g. "<b>Incidence:</b> ... <br><b>Prevalence:</b> ..."
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
const formattedCards = biostatsRawCards.map(c => {
  return {
    q: formatText(c.q),
    a: formatText(c.a)
  };
});

// Write output file
const outputContent = `const biostatsCards = ${JSON.stringify(formattedCards, null, 2)};

module.exports = { biostatsCards };
`;

fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/biostats_epidemiology.js', outputContent, 'utf8');
console.log(`Saved ${formattedCards.length} formatted Biostats cards!`);
