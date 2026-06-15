const fs = require('fs');
const { biochem2RawCards } = require('./biochem2_raw_cards.js');

function formatText(text, question) {
  if (!text) return text;
  let s = text;
  const q = (question || '').toLowerCase();

  // 1. Protect HTML tags
  const ph = [];
  ['b','br','ul','li','ol','sub','sup','i','span'].forEach(t => {
    s = s.replace(new RegExp(`<(${t})\\b([^>]*)>`, 'gi'), m => { const id=`__S${ph.length}__`; ph.push({id,tag:m}); return id; });
    s = s.replace(new RegExp(`</(${t})>`, 'gi'), m => { const id=`__E${ph.length}__`; ph.push({id,tag:m}); return id; });
  });
  s = s.replace(/</g,'&lt;').replace(/>/g,'&gt;');
  ph.forEach(p => { s = s.replace(p.id, p.tag); });

  s = s.replace(/\s*→\s*/g,' → ');

  // 2. Custom overrides
  if (q.includes('four major classes of biomolecules'))
    return '<ol><li><b>Carbohydrates</b></li><li><b>Lipids</b></li><li><b>Proteins</b></li><li><b>Nucleic acids</b></li></ol>';

  if (q.includes('three irreversible steps of glycolysis'))
    return '<ol><li><b>Hexokinase</b> → <b>Glucose-6-phosphatase</b></li><li><b>PFK-1</b> → <b>Fructose-1,6-bisphosphatase</b></li><li><b>Pyruvate kinase</b> → <b>Pyruvate carboxylase</b> + <b>PEPCK</b></li></ol>';

  if (q.includes('cori cycle'))
    return '<b>Cori cycle:</b> Anaerobic muscle glycolysis → <b>lactate</b> → transported to liver → <b>gluconeogenesis</b> → glucose returned to muscle.';

  if (q.includes('essential amino acids'))
    return '<b>Mnemonic: PVT TIM HaLL</b><ul><li><b>P</b>henylalanine</li><li><b>V</b>aline</li><li><b>T</b>ryptophan</li><li><b>T</b>hreonine</li><li><b>I</b>soleucine</li><li><b>M</b>ethionine</li><li><b>H</b>istidine</li><li><b>L</b>eucine</li><li><b>L</b>ysine</li></ul>';

  if (q.includes('pyruvate dehydrogenase complex') && q.includes('function'))
    return '<b>Converts pyruvate → acetyl-CoA.</b> Requires 5 cofactors:<ul><li><b>TPP</b> (B1 — Thiamine)</li><li><b>Lipoic acid</b></li><li><b>CoA</b> (B5 — Pantothenate)</li><li><b>FAD</b> (B2 — Riboflavin)</li><li><b>NAD</b> (B3 — Niacin)</li></ul><b>Mnemonic: Tender Loving Care For Nancy</b>';

  if (q.includes('sources of nadph'))
    return '<ol><li><b>Pentose phosphate pathway</b> (oxidative phase, via G6PD)</li><li><b>Malic enzyme</b></li><li><b>Isocitrate dehydrogenase</b> (cytosolic)</li></ol>';

  if (q.includes('key allosteric regulators of pfk-1'))
    return '<ul><li><b>Activators ↑:</b> AMP, Fructose-2,6-bisphosphate</li><li><b>Inhibitors ↓:</b> ATP, Citrate, Low pH</li></ul>';

  if (q.includes('three types of rna polymerase'))
    return '<ul><li><b>RNA Pol I</b> — rRNA</li><li><b>RNA Pol II</b> — mRNA</li><li><b>RNA Pol III</b> — tRNA & 5S rRNA</li></ul><b>Mnemonic:</b> I make rRNA, II make mRNA, III make tRNA.';

  if (q.includes('name three trinucleotide repeat disorders'))
    return '<ol><li><b>Huntington disease</b> — CAG (chromosome 4)</li><li><b>Fragile X syndrome</b> — CGG (FMR1)</li><li><b>Myotonic dystrophy</b> — CTG</li></ol>';

  if (q.includes('stop codons'))
    return '<ul><li><b>UAA</b> (ochre)</li><li><b>UAG</b> (amber)</li><li><b>UGA</b> (opal/umber)</li></ul>';

  if (q.includes('role of oncogenes vs tumor suppressor'))
    return '<ul><li><b>Oncogenes:</b> gain-of-function (one mutated copy sufficient — dominant)</li><li><b>Tumor suppressors:</b> loss-of-function (both copies usually lost — recessive, Knudson two-hit hypothesis)</li></ul>';

  if (q.includes('lysosomal storage diseases') && q.includes('inheritance'))
    return '<b>Autosomal recessive</b> — except:<ul><li><b>Fabry disease</b> — X-linked (α-galactosidase A)</li><li><b>Hunter syndrome</b> — X-linked (iduronate-2-sulfatase)</li></ul>';

  // 3. <br> → list
  if (s.includes('<br>')) {
    const parts = s.split('<br>');
    if (/^\d+\./.test(parts[0].trim())) {
      return '<ol><li>' + parts.map(p => p.trim().replace(/^\d+\.\s*/,'')).join('</li><li>') + '</li></ol>';
    }
    const allLabel = parts.length >= 2 && parts.every(p => { const t=p.trim(),ci=t.indexOf(':'); return ci>0 && ci<40; });
    if (allLabel) {
      return '<ul><li>' + parts.map(p => { const t=p.trim(),ci=t.indexOf(':'); return `<b>${t.slice(0,ci).trim()}:</b> ${t.slice(ci+1).trim()}`; }).join('</li><li>') + '</li></ul>';
    }
    return '<ul><li>' + parts.map(p=>p.trim()).filter(Boolean).join('</li><li>') + '</li></ul>';
  }

  // 4. Em-dash pattern
  if (s.includes(' — ') && !s.includes('<b>')) {
    const di = s.indexOf(' — ');
    return `<b>${s.slice(0,di).trim()}</b> — ${s.slice(di+3).trim()}`;
  }

  // 5. Auto-bold key terms
  const terms = [
    'Glucose-6-phosphatase','Phosphofructokinase-1','PFK-1','Fructose-1,6-bisphosphatase',
    'Pyruvate kinase','Pyruvate carboxylase','PEPCK','HMG-CoA reductase',
    'Acetyl-CoA carboxylase','ALA synthase','HGPRT','CPS I','CPS II',
    'Carnitine palmitoyltransferase I','CPT-I','Isocitrate dehydrogenase',
    'Glutathione reductase','G6PD','Aldolase B','GALT','Galactose-1-phosphate uridyltransferase',
    'Tyrosinase','Homogentisate oxidase','Cystathionine β-synthase',
    'Phytanoyl-CoA hydroxylase','HMG-CoA synthase','Thiophorase',
    'Glucocerebrosidase','Sphingomyelinase','Hexosaminidase A',
    'α-L-iduronidase','Iduronate-2-sulfatase',
    'Primase','DNA helicase','Telomerase',
    'ApoC-II','ApoB-100','ApoE','LCAT','CETP','LPL',
    'NADPH','NADH','FADH₂','ATP','GTP',
    'Glycogen','Acetyl-CoA','Malonyl-CoA','Succinyl-CoA','Propionyl-CoA',
    'Fructose-2,6-bisphosphate','Fructose-2,6-BP',
    'Ribose-5-phosphate','Transketolase',
    'Calcitriol','Biotin','Niacin','Thiamine','Riboflavin',
    'Intrinsic factor','Schilling test',
    'HbS','HbF','2,3-BPG',
    'Bohr effect','Haldane effect',
    'PKU','Phenylketonuria','Cystinuria','Alkaptonuria',
    'Lesch-Nyhan','Lesch-Nyhan syndrome',
    'MCAD','OTC','von Gierke','Pompe','McArdle','Hers disease','Cori disease',
    'Tangier disease','Refsum disease','Wilson disease',
    'Tay-Sachs','Gaucher','Niemann-Pick','Fabry','Hurler','Hunter',
    'Li-Fraumeni','HNPCC','Lynch syndrome',
    'GLUT2','GLUT4','AMPK','PKA','SGLT2',
    'Chloramphenicol','Tetracyclines','Methotrexate','5-Fluorouracil','5-FU',
    'Hydroxyurea','Penicillamine',
    'Philadelphia chromosome','BCR-ABL','JAK2',
    'Warburg effect','Randle cycle',
    'Porphyria cutanea tarda','Acute intermittent porphyria',
    'Uric acid','Xeroderma pigmentosum',
    'NHEJ','Homologous recombination',
    'TATA box','Alternative splicing',
    'Ubiquitin','Proteasome',
  ];
  terms.forEach(t => {
    const esc = t.replace(/[.*+?^${}()|[\]\\]/g,'\\$&');
    s = s.replace(new RegExp(`(?<!<[^>]*)\\b(${esc})\\b`,'gi'),'<b>$1</b>');
  });
  s = s.replace(/<b><b>(.*?)<\/b><\/b>/g,'<b>$1</b>');
  return s;
}

const out = biochem2RawCards.map(c => ({ q: formatText(c.q,c.q), a: formatText(c.a,c.q) }));
const content = `const biochem2Cards = ${JSON.stringify(out, null, 2)};\n\nmodule.exports = { biochem2Cards };\n`;
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/biochem2.js', content, 'utf8');
console.log(`Saved ${out.length} formatted Biochemistry (expanded) cards!`);
