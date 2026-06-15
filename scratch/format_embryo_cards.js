const fs = require('fs');
const { embryoRawCards } = require('./embryo_raw_cards.js');

function formatText(text, question) {
  if (!text) return text;
  let formatted = text;

  // 1. Escape operators < and > unless they are part of valid HTML tags
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

  // Escape any remaining < and >
  formatted = formatted.replace(/</g, '&lt;').replace(/>/g, '&gt;');

  // Restore HTML tags
  tagPlaceholders.forEach(item => {
    formatted = formatted.replace(item.id, item.tag);
  });

  // 2. Replace chemical/hormonal subscripts
  formatted = formatted.replace(/prostaglandin E2/gi, 'prostaglandin E₂')
                       .replace(/Prostaglandin E1/gi, 'Prostaglandin E₁')
                       .replace(/PGE2/g, 'PGE₂');

  // Let's normalize spaces around arrows
  formatted = formatted.replace(/\s*→\s*/g, ' → ');

  // 3. Custom high-yield overrides based on the question
  const qLower = question.toLowerCase();
  
  if (qLower.includes('four components of tetralogy of fallot')) {
    formatted = `<ul><li><b>Pulmonary stenosis</b></li><li><b>Right ventricular hypertrophy</b></li><li><b>Overriding aorta</b></li><li><b>Ventricular septal defect</b> (<b>PROV</b>)</li></ul>`;
    return formatted;
  }
  
  if (qLower.includes('rule of 2s for meckel’s diverticulum')) {
    formatted = `<ol><li><b>2%</b> of the population</li><li><b>2 inches</b> long</li><li><b>2 feet</b> from the ileocecal valve</li><li>Presents by age <b>2</b></li><li><b>2 types</b> of ectopic tissue (gastric, pancreatic)</li></ol>`;
    return formatted;
  }

  if (qLower.includes('derivative of surface ectoderm')) {
    formatted = `<ul><li><b>Epidermis</b>, hair, nails, sweat glands</li><li><b>Lens of eye</b></li><li><b>Inner ear</b></li></ul>`;
    return formatted;
  }

  if (qLower.includes('derivative of neuroectoderm')) {
    formatted = `<ul><li><b>CNS</b></li><li><b>Retina</b></li><li><b>Pineal gland</b></li><li><b>Posterior pituitary</b></li></ul>`;
    return formatted;
  }

  if (qLower.includes('derivatives of neural crest cells')) {
    formatted = `<ul><li><b>PNS</b> (sensory neurons, autonomic ganglia)</li><li><b>Adrenal medulla</b></li><li><b>Melanocytes</b></li><li><b>Craniofacial bones</b></li><li><b>Aorticopulmonary septum</b></li></ul>`;
    return formatted;
  }

  if (qLower.includes('derivatives of mesoderm')) {
    formatted = `<ul><li><b>Muscle, bone, connective tissue</b></li><li><b>Cardiovascular system</b></li><li><b>Kidneys</b></li><li><b>Gonads</b></li><li><b>Spleen</b></li></ul>`;
    return formatted;
  }

  if (qLower.includes('derivatives of endoderm')) {
    formatted = `<ul><li><b>Gut tube epithelium</b></li><li><b>Liver</b></li><li><b>Pancreas</b></li><li><b>Thyroid</b></li><li><b>Parathyroid</b></li><li><b>Lungs</b></li></ul>`;
    return formatted;
  }

  if (qLower.includes('three germ layers formed during gastrulation')) {
    formatted = `<ul><li><b>Ectoderm</b></li><li><b>Mesoderm</b></li><li><b>Endoderm</b></li></ul>`;
    return formatted;
  }

  if (qLower.includes('embryonic origin of the diaphragm')) {
    formatted = `<ul><li><b>Septum transversum</b></li><li><b>Pleuroperitoneal folds</b></li><li><b>Body wall</b></li><li><b>Dorsal mesentery of esophagus</b></li></ul>`;
    return formatted;
  }

  if (qLower.includes('embryonic origin of the external genitalia')) {
    formatted = `<ul><li><b>Genital tubercle</b></li><li><b>Urogenital folds</b></li><li><b>Labioscrotal swellings</b></li></ul>`;
    return formatted;
  }

  if (qLower.includes('embryonic origin of cardiac septa')) {
    formatted = `<ul><li><b>Endocardial cushions</b></li><li><b>Septum primum</b> and <b>septum secundum</b></li><li><b>Muscular septum</b></li><li><b>Neural crest cells</b> (conotruncal septum)</li></ul>`;
    return formatted;
  }

  if (qLower.includes('three stages of kidney development')) {
    formatted = `<b>Pronephros</b> → <b>Mesonephros</b> → <b>Metanephros</b> (definitive kidney).`;
    return formatted;
  }

  if (qLower.includes('two layers of the bilaminar disc')) {
    formatted = `<b>Epiblast</b> (future embryo) and <b>Hypoblast</b>.`;
    return formatted;
  }

  if (qLower.includes('branchial arches derived from')) {
    formatted = `<b>Mesoderm</b> + <b>neural crest cells</b>.`;
    return formatted;
  }

  if (qLower.includes('neural tube close')) {
    formatted = `<ul><li><b>Anterior neuropore</b> closes day 25</li><li><b>Posterior neuropore</b> closes day 27</li></ul>`;
    return formatted;
  }

  // 4. General <br> list handler:
  // e.g. "Superior parathyroids: 4th pharyngeal pouch.<br>Inferior parathyroids: 3rd pharyngeal pouch."
  if (formatted.includes('<br>')) {
    const parts = formatted.split('<br>');
    const items = parts.map(p => {
      const trimmed = p.trim();
      const colonIdx = trimmed.indexOf(':');
      if (colonIdx > 0) {
        const term = trimmed.substring(0, colonIdx).trim();
        const def = trimmed.substring(colonIdx + 1).trim();
        return `<b>${term}:</b> ${def}`;
      }
      return trimmed;
    });
    formatted = '<ul><li>' + items.join('</li><li>') + '</li></ul>';
    return formatted;
  }

  // 5. General — definition handler
  // e.g. "Spermatogenesis — begins at puberty..."
  if (formatted.includes(' — ')) {
    const parts = formatted.split(' — ');
    const term = parts[0].trim();
    const def = parts.slice(1).join(' — ').trim();
    formatted = `<b>${term}</b> — ${def}`;
    return formatted;
  }

  // 6. Bold key terms dynamically if they exist in the answer and are not already bolded
  const termsToBold = [
    'SRY gene',
    'Anti-Müllerian Hormone \\(AMH\\)',
    'Anti-Müllerian Hormone',
    'Testosterone',
    'Leydig cells',
    'Sertoli cells',
    'Dihydrotestosterone \\(DHT\\)',
    'hCG \\(human chorionic gonadotropin\\)',
    'hCG',
    'Indomethacin',
    'Prostaglandin E1 \\(alprostadil\\)',
    'Prostaglandin E1',
    'Thalidomide',
    'Sonic hedgehog',
    'DiGeorge syndrome',
    'Potter sequence',
    'Mayer-Rokitansky-Küster-Hauser \\(MRKH\\) syndrome',
    'Mayer-Rokitansky-Küster-Hauser syndrome',
    'MRKH syndrome',
    'Hirschsprung’s disease',
    'Meckel’s diverticulum',
    'Tetralogy of Fallot',
    'Chiari II malformation',
    'Dandy-Walker malformation',
    'Rathke’s pouch',
    'Rubella',
    'Bochdalek hernia',
    'Trisomy 16',
    'Trisomy 13',
    'Anencephaly',
    'Spina bifida',
    'myelomeningocele',
    'Polydactyly',
    'Syndactyly',
    'Hypospadias',
    'Epispadias',
    'Cryptorchidism',
    'gubernaculum',
    'processus vaginalis',
    'indirect inguinal hernia',
    'hydrocele',
    'holoprosencephaly',
    'syringomyelia',
    'Chiari I',
    'coloboma',
    'vitelline duct',
    'allantois',
    'urachus',
    'umbilical vein',
    'umbilical arteries',
    'portal vein',
    'superior vena cava',
    'anterior cardinal vein',
    'vitelline veins',
    'ureteric bud',
    'mesonephric duct',
    'metanephric mesenchyme',
    'ectoderm',
    'mesoderm',
    'endoderm',
    'surface ectoderm',
    'neuroectoderm',
    'neural crest cells',
    'neural crest',
    'cardiac septa',
    'ventricular septal defect',
    'VSD',
    'transposition of the great arteries',
    'persistent truncus arteriosus',
    'coarctation of the aorta',
    'patent ductus arteriosus',
    'PDA',
    'conotruncal septum',
    'aorticopulmonary septum',
    'multicystic dysplastic kidney',
    'palatine tonsils',
    'Eustachian tube',
    'middle ear cavity',
    'common carotid artery',
    'internal carotid artery',
    'subclavian artery',
    'aortic arch',
    'pulmonary arteries',
    'ductus arteriosus',
    'Vitelline duct',
    'tracheoesophageal fistula',
    'TEF',
    'esophageal atresia',
    'eventration of the diaphragm',
    'apical ectodermal ridge \\(AER\\)',
    'AER',
    'zone of polarizing activity \\(ZPA\\)',
    'ZPA',
    'phocomelia',
    'patent urachus',
    'exstrophy of the bladder',
    'ectopic testis',
    'septate uterus',
    'Müllerian agenesis'
  ];

  // Apply bolding to terms, ensuring we don't bold something already inside HTML tags
  termsToBold.forEach(term => {
    // Escape special characters for regex
    const regex = new RegExp(`\\b(${term})\\b(?![^<]*>)`, 'gi');
    formatted = formatted.replace(regex, '<b>$1</b>');
  });

  // Remove any redundant <b> tags like <b><b>...</b></b>
  formatted = formatted.replace(/<b><b>(.*?)<\/b><\/b>/g, '<b>$1</b>');

  return formatted;
}

const formattedCards = embryoRawCards.map(c => {
  return {
    q: formatText(c.q, c.q),
    a: formatText(c.a, c.q)
  };
});

const outputContent = `const embryologyCards = ${JSON.stringify(formattedCards, null, 2)};

module.exports = { embryologyCards };
`;

fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/embryology.js', outputContent, 'utf8');
console.log(`Saved ${formattedCards.length} formatted Embryology cards!`);
