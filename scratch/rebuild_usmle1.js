const fs = require('fs');

// Load raw cards
const { anatomyRawCards } = require('./anatomy_raw_cards.js');
const { anatomyAppendRawCards } = require('./anatomy_append_raw_cards.js');
const { pathologyRawCards } = require('./pathology_raw_cards.js');
const { biochem2RawCards } = require('./biochem2_raw_cards.js');
const { nutritionRawCards } = require('./nutrition_raw_cards.js');
const { behavioralSciencesRawCards } = require('./behavioral_sciences_raw_cards.js');
const { immunologyRawCards } = require('./immunology_raw_cards.js');
const { agingRawCards } = require('./aging_raw_cards.js');
const { geneticsRawCards } = require('./genetics_raw_cards.js');
const { pharmacologyRawCards } = require('./pharmacology_raw_cards.js');
const { hematologyRawCards } = require('./hematology_raw_cards.js');
const { neuropharmacologyRawCards } = require('./neuropharmacology_raw_cards.js');

const boldTerms = [
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
  'Rectouterine pouch',
  'Pectinate line', 'Dentate line',
  'Taeniae coli', 'Haustra',
  'Marginal artery of Drummond',
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

  'Glucose-6-phosphatase','Phosphofructokinase-1','PFK-1','Fructose-1,6-bisphosphatase',
  'Pyruvate kinase','Pyruvate carboxylase','PEPCK','HMG-CoA reductase',
  'Acetyl-CoA carboxylase','ALA synthase','HGPRT','CPS I','CPS II',
  'Carnitine palmitoyltransferase I','CPT-I','Isocitrate dehydrogenase',
  'Glutathione reductase',
  'Glucocerebrosidase','Sphingomyelinase','Hexosaminidase A',
  'α-L-iduronidase','Iduronate-2-sulfatase',
  'Primase','DNA helicase','Telomerase',
  'ApoC-II','ApoB-100','ApoE','LCAT','CETP','LPL',
  'NADPH','NADH','FADH₂','ATP','GTP',
  'Glycogen','Acetyl-CoA','Malonyl-CoA','Succinyl-CoA','Propionyl-CoA',
  'Fructose-2,6-bisphosphate','Fructose-2,6-BP',
  'Ribose-5-phosphate',
  'Calcitriol','Biotin', 'Niacin', 'Thiamine', 'Riboflavin',
  'Intrinsic factor','Schilling test',
  'HbS','HbF','2,3-BPG',
  'Bohr effect','Haldane effect',
  'Phenylketonuria','Cystinuria',
  'Lesch-Nyhan','Lesch-Nyhan syndrome',
  'MCAD', 'OTC', 'von Gierke', 'Pompe', 'McArdle', 'Hers disease', 'Cori disease',
  'Tangier disease', 'Refsum disease', 'Wilson disease',
  'Tay-Sachs','Gaucher','Niemann-Pick','Fabry','Hurler','Hunter',
  'Li-Fraumeni','HNPCC','Lynch syndrome',
  'GLUT2','GLUT4','AMPK','PKA','SGLT2',
  'Chloramphenicol','Tetracyclines','Methotrexate','5-Fluorouracil','5-FU',
  'Hydroxyurea','Penicillamine',
  'Philadelphia chromosome','BCR-ABL','JAK2',
  'Randle cycle',
  'Porphyria cutanea tarda','Acute intermittent porphyria',
  'Uric acid','Xeroderma pigmentosum',
  'NHEJ','Homologous recombination',
  'TATA box','Alternative splicing',
  'Ubiquitin','Proteasome',

  // Nutrition terms
  'Kwashiorkor', 'Marasmus', 'Refeeding syndrome', 'DASH diet', 'Mediterranean diet',
  'Celiac disease', 'Dumping syndrome', 'Menkes disease',

  // Behavioral Sciences terms
  'classical conditioning', 'operant conditioning', 'systematic desensitization',
  'positive reinforcement', 'negative reinforcement',
  'Kübler-Ross', 'DABDA',
  'Erikson', 'Piaget', 'Kohlberg', 'Freud',
  'object permanence', 'conservation',
  'Oedipus', 'Electra',
  'repression', 'suppression', 'denial', 'projection', 'displacement',
  'reaction formation', 'rationalization', 'intellectualization',
  'sublimation', 'altruism', 'splitting', 'regression',
  'REM sleep', 'NREM', 'narcolepsy', 'cataplexy', 'orexin', 'hypocretin',
  'sleep apnea', 'CPAP', 'CBT-I',
  'Wernicke encephalopathy', 'Korsakoff syndrome',
  'delirium tremens', 'naloxone', 'naltrexone', 'methadone', 'buprenorphine',
  'disulfiram', 'acamprosate',
  'autonomy', 'beneficence', 'non-maleficence', 'justice',
  'Tarasoff', 'informed consent', 'DNR',
  'Medicare', 'Medicaid',
  'SSRIs', 'MAO inhibitors', 'lithium', 'clozapine', 'haloperidol',
  'tardive dyskinesia', 'agranulocytosis',
  'serotonin syndrome', 'neuroleptic malignant syndrome',
  'buspirone', 'dantrolene', 'bromocriptine',
  'lead-time bias', 'length-time bias', 'healthy worker effect',
  'Maslow',

  // Immunology terms
  'Innate', 'Adaptive', 'Conventional DCs', 'Plasmacytoid DCs', 'NK cells', 'KIRs', 'PRRs',
  'PAMPs', 'DAMPs', 'TLR4', 'TLR9', 'MHC Class I', 'MHC Class II', 'MHC I', 'MHC II',
  'IgM', 'IgG', 'IgA', 'IgE', 'IgD', 'complement pathway', 'C3a', 'C3b', 'C5a', 'C5b-9',
  'CD4 T helper', 'Th1', 'Th2', 'Th17', 'Treg', 'Tregs', 'Tfh', 'FoxP3', 'Foxp3', 'central tolerance',
  'peripheral tolerance', 'hypersensitivity', 'Type I', 'Type II', 'Type III', 'Type IV',
  'active immunity', 'passive immunity', 'superantigens', 'selective IgA deficiency',
  'agammaglobulinemia', 'Bruton', 'SCID', 'DiGeorge', 'CATCH-22', 'Chronic Granulomatous Disease', 'CGD',
  'nitroblue tetrazolium', 'NBT', 'Leukocyte Adhesion Deficiency', 'LAD', 'Chediak-Higashi',
  'Job syndrome', 'Hyper-IgE', 'allograft', 'xenograft', 'isograft', 'hyperacute rejection',
  'acute cellular rejection', 'chronic rejection', 'cyclosporine', 'tacrolimus', 'sirolimus',
  'rapamycin', 'mycophenolate mofetil', 'azathioprine', 'basiliximab', 'pembrolizumab',
  'nivolumab', 'ipilimumab', 'abatacept', 'tocilizumab', 'ustekinumab', 'secukinumab',
  'Hashimoto thyroiditis', 'anti-TPO', 'Graves disease', 'TSI', 'Myasthenia Gravis',
  'AChR', 'Lambert-Eaton', 'VGCC', 'pernicious anemia', 'primary biliary cholangitis',
  'AMA', 'autoimmune hepatitis', 'ASMA', 'anti-Jo-1', 'anti-SSA', 'anti-SSB', 'Sjögren',
  'molecular mimicry', 'rheumatic fever', 'Jones criterion', 'mitral stenosis', 'MMR',
  'Varicella', 'Hib vaccine', 'herd immunity', 'AIRE gene', 'Coombs test', 'cold agglutinin',
  'rituximab', 'infliximab', 'adalimumab', 'etanercept', 'graft-versus-host disease', 'GVHD',
  'Kaposi sarcoma', 'PD-1', 'PD-L1', 'CTLA-4', 'Warburg effect', 'amyloidosis',

  // Aging terms
  'replicative senescence', 'Hayflick limit', 'telomere', 'telomeres', 'sarcopenia', 'osteopenia',
  'osteoporosis', 'osteomalacia', 'immunosenescence', 'inflammaging', 'Beers Criteria',
  'START/STOPP criteria', 'homeostenosis', 'SASP', 'andropause', 'menopause', 'presbycusis',
  'normal pressure hydrocephalus', 'NPH', 'donepezil', 'rivastigmine', 'galantamine', 'memantine',
  'cerumen impaction', 'Shingrix', 'PCV20', 'PCV15', 'PPSV23', 'CHADS2-VASc', 'HAS-BLED',
  'Rowe and Kahn', 'compression of morbidity', 'klotho gene', 'frailty syndrome', 'FRAIL mnemonic',
  'lipofuscin', 'sirtuins', 'epigenetic drift', 'caloric restriction', 'intermittent fasting',
  'Alzheimer disease', 'Vascular dementia', 'Pick disease', 'Lewy body dementia', 'sundowning',
  'decubitus', 'pressure ulcers', 'age-related macular degeneration', 'AMD', 'cataracts',
  'glaucoma', 'aortic stenosis', 'proteostasis collapse', 'MMM', 'MoCA', 'anticholinergics',

  // Genetics terms
  'Autosomal Dominant', 'Autosomal Recessive', 'X-linked Dominant', 'X-linked Recessive',
  'incomplete penetrance', 'variable expressivity', 'anticipation', 'genomic imprinting',
  'uniparental disomy', 'UPD', 'Down syndrome', 'AVSD', 'endocardial cushion defect',
  'Edwards syndrome', 'Patau syndrome', 'Fragile X', 'Fragile X syndrome', 'FMR1',
  'macroorchidism', 'Cystic Fibrosis', 'CFTR', 'Sweat chloride test', 'Phenylketonuria',
  'PKU', 'phenylalanine hydroxylase', 'PAH', 'Tay-Sachs', 'β-hexosaminidase A',
  'Gaucher', 'glucocerebrosidase', 'Huntington', 'HTT', 'Myotonic dystrophy', 'DMPK',
  'Prader-Willi', 'Angelman', 'Duchenne Muscular Dystrophy', 'Dystrophin', 'Gower sign',
  'Marfan', 'Marfan syndrome', 'FBN1', 'fibrillin-1', 'Familial Hypercholesterolemia',
  'Hemochromatosis', 'Hardy-Weinberg', 'linkage disequilibrium', 'missense mutation',
  'nonsense mutation', 'frameshift mutation', 'silent mutation', 'Lyonization',
  'mitochondrial inheritance', 'Robertsonian translocation', 'Cri-du-chat', 'Beckwith-Wiedemann',
  'Wolf-Hirschhorn', 'Klinefelter syndrome', 'Turner syndrome', 'Triple X syndrome',
  'XYY syndrome', 'Williams syndrome', 'FISH', 'Sanger sequencing', 'next-generation sequencing',
  'NGS', 'oncogenes', 'tumor suppressor', 'Li-Fraumeni', 'FAP', 'Lynch syndrome',
  'microsatellite instability', 'MSI', 'Neurofibromatosis type 1', 'NF1', 'NF2',
  'Wilson disease', 'Alpha-1 antitrypsin', 'SERPINA1', 'hereditary spherocytosis',
  'Gilbert syndrome', 'UGT1A1', 'Crigler-Najjar', 'heteroplasmy', 'threshold effect',
  'Lesch-Nyhan', 'Fabry disease', 'Hunter syndrome', 'Hurler syndrome', 'Pompe disease',
  'McArdle disease', 'Von Gierke disease', 'Galactosemia', 'Hereditary Fructose Intolerance',
  'founder effect', 'genetic drift', 'bottleneck effect', 'penetrance', 'expressivity',
  'pleiotropy', 'locus heterogeneity', 'allelic heterogeneity', 'dominant negative mutation',
  'haploinsufficiency', 'two-hit hypothesis', 'Retinoblastoma', 'RB1', 'Xeroderma Pigmentosum',
  'Ataxia-Telangiectasia', 'Bloom syndrome', 'Fanconi anemia', 'Sickle Cell Disease',
  'β-Thalassemia', 'α-Thalassemia', 'Hemophilia A', 'Hemophilia B', 'von Willebrand Disease',
  'erythroblastosis fetalis', 'DNA methylation', 'histone acetylation', 'Kartagener syndrome',
  'Polycystic Kidney Disease', 'Tuberous Sclerosis', 'Sturge-Weber', 'malignant hyperthermia',

  // Pharmacology terms
  'pharmacokinetic', 'pharmacodynamics', 'pharmacokinetics', 'pharmacodynamic',
  'bioavailability', 'extraction ratio', 'loading dose', 'maintenance dose',
  'zero-order elimination', 'zero-order kinetics', 'first-pass effect',
  'Phase I metabolism', 'Phase II metabolism', 'glucuronidation', 'CYP3A4', 'CYP450',
  'therapeutic index', 'competitive antagonists', 'non-competitive antagonists',
  'inverse agonist', 'GPCR', 'Gs', 'Gi', 'Gq', 'tachyphylaxis', 'prodrug', 'protein binding',
  'renal clearance', 'pH-dependent drug trapping', 'weak acids', 'weak bases',
  'gingival hyperplasia', 'photosensitivity', 'lupus-like syndrome', 'ototoxicity',
  'nephrotoxicity', 'hepatotoxicity', 'organophosphate', 'atropine', 'physostigmine',
  'pralidoxime', 'neostigmine', 'bethanechol', 'pilocarpine', 'edrophonium', 'glycopyrrolate',
  'sugammadex', 'dobutamine', 'albuterol', 'terbutaline', 'isoproterenol', 'phenoxybenzamine',
  'prazosin', 'propranolol', 'metoprolol', 'succinylcholine', 'rocuronium', 'vecuronium',
  'dantrolene', 'baclofen', 'tizanidine', 'nitroprusside', 'hydralazine', 'minoxidil',
  'lisinopril', 'losartan', 'aliskiren', 'amlodipine', 'nifedipine', 'verapamil', 'diltiazem',
  'digoxin', 'amiodarone', 'lidocaine', 'adenosine', 'statins', 'ezetimibe', 'gemfibrozil',
  'niacin', 'cholestyramine', 'penicillins', 'cephalosporins', 'vancomycin', 'aminoglycosides',
  'gentamicin', 'tobramycin', 'tetracyclines', 'macrolides', 'erythromycin', 'azithromycin',
  'clindamycin', 'linezolid', 'chloramphenicol', 'sulfonamides', 'trimethoprim', 'fluoroquinolones',
  'ciprofloxacin', 'metronidazole', 'rifampin', 'isoniazid', 'INH', 'pyrazinamide', 'ethambutol',
  'acyclovir', 'valacyclovir', 'ganciclovir', 'oseltamivir', 'sofosbuvir', 'amphotericin B',
  'fluconazole', 'itraconazole', 'caspofungin', 'terbinafine', 'griseofulvin', 'methotrexate',
  '5-fluorouracil', '5-FU', 'cytarabine', 'cisplatin', 'carboplatin', 'doxorubicin', 'vincristine',
  'vinblastine', 'paclitaxel', 'etoposide', 'imatinib', 'trastuzumab', 'rituximab', 'cyclophosphamide',
  'mesna', 'prednisone', 'dexamethasone', 'tamoxifen', 'levothyroxine', 'PTU', 'propylthiouracil',
  'methimazole', 'metformin', 'glipizide', 'pioglitazone', 'exenatide', 'dapagliflozin', 'omeprazole',
  'pantoprazole', 'cimetidine', 'ranitidine', 'ondansetron', 'loperamide', 'lactulose', 'sucralfate',
  'misoprostol', 'acetaminophen', 'aspirin', 'ibuprofen', 'naproxen', 'celecoxib', 'acetylcysteine',
  'allopurinol', 'febuxostat', 'colchicine', 'probenecid', 'rasburicase', 'furosemide', 'hydrochlorothiazide',
  'spironolactone', 'eplerenone', 'mannitol', 'acetazolamide', 'ethacrynic acid', 'SSRIs', 'SNRIs',
  'TCAs', 'amitriptyline', 'MAOIs', 'bupropion', 'mirtazapine', 'lithium', 'valproate', 'lamotrigine',
  'carbamazepine', 'phenytoin', 'benzodiazepines', 'barbiturates', 'buspirone', 'haloperidol',
  'risperidone', 'olanzapine', 'clozapine', 'levodopa', 'carbidopa', 'selegiline', 'rasagiline',
  'entacapone', 'memantine', 'donepezil', 'riluzole', 'primaquine', 'chloroquine', 'artemisinin',
  'ivermectin', 'albendazole', 'mebendazole', 'praziquantel', 'niclosamide', 'pentamidine',
  'miltefosine', 'abacavir', 'efavirenz', 'ritonavir', 'raltegravir', 'enfuvirtide', 'maraviroc',
  'hydroxychloroquine', 'mycophenolate mofetil', 'azathioprine', 'cyclosporine', 'tacrolimus',
  'sirolimus', 'rapamycin', 'basiliximab', 'natalizumab', 'infliximab', 'adalimumab', 'anakinra',
  'tocilizumab', 'ustekinumab', 'secukinumab', 'omalizumab', 'eculizumab', 'leflunomide',
  'sulfasalazine', 'finasteride', 'flutamide', 'bicalutamide', 'leuprolide', 'sildenafil',
  'tadalafil', 'tamsulosin', 'oxybutynin', 'tolterodine', 'desmopressin', 'DDAVP', 'demeclocycline',
  'conivaptan', 'tolvaptan', 'octreotide', 'cinacalcet', 'bisphosphonates', 'alendronate',
  'zoledronate', 'teriparatide', 'denosumab', 'raloxifene', 'calcitonin', 'orlistat', 'rifaximin',
  'alosetron', 'lubiprostone', 'teduglutide', 'montelukast', 'zafirlukast', 'theophylline',
  'cromolyn', 'ipratropium', 'tiotropium', 'pseudoephedrine', 'dextromethorphan', 'guaifenesin',
  'NAPQI', 'fomepizole', 'flumazenil', 'naloxone', 'naltrexone', 'protamine sulfate', 'idarucizumab',
  'dabigatran', 'andexanet alfa', 'methylene blue', 'deferoxamine', 'dimercaprol', 'BAL', 'EDTA',
  'penicillamine'
];

function formatText(text, question, topic) {
  if (!text) return text;
  let s = text;
  const qLower = (question || '').toLowerCase();
  const isQuestion = text.trim() === question.trim();

  // 1. Protect HTML tags
  const ph = [];
  const tags = ['b', 'br', 'ul', 'li', 'ol', 'sub', 'sup', 'i', 'span'];
  tags.forEach(t => {
    s = s.replace(new RegExp(`<(${t})\\b([^>]*)>`, 'gi'), m => { const id=`__S${ph.length}__`; ph.push({id,tag:m}); return id; });
    s = s.replace(new RegExp(`</(${t})>`, 'gi'), m => { const id=`__E${ph.length}__`; ph.push({id,tag:m}); return id; });
  });
  s = s.replace(/</g, '&lt;').replace(/>/g, '&gt;');
  ph.forEach(p => { s = s.replace(p.id, p.tag); });

  // Normalise arrows
  s = s.replace(/\s*→\s*/g, ' → ');
  s = s.replace(/\s*↔\s*/g, ' ↔ ');

  // 2. Custom overrides (only for answers!)
  if (!isQuestion) {
    if (topic === 'anatomy') {
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
      if (qLower.includes('order of structures in the popliteal fossa')) {
        return '<ul><li><b>Common peroneal nerve</b> (most lateral)</li><li><b>Tibial nerve</b></li><li><b>Popliteal vein</b></li><li><b>Popliteal artery</b> (deepest)</li></ul>';
      }
      if (qLower.includes('blood supply to the pancreas')) {
        return '<ul><li><b>Head:</b> Superior + inferior pancreaticoduodenal arteries</li><li><b>Body & tail:</b> Splenic artery branches</li></ul>';
      }
    }

    if (topic === 'anatomy_append') {
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
    }

    if (topic === 'pathology') {
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
    }

    if (topic === 'biochem') {
      if (qLower.includes('four major classes of biomolecules'))
        return '<ol><li><b>Carbohydrates</b></li><li><b>Lipids</b></li><li><b>Proteins</b></li><li><b>Nucleic acids</b></li></ol>';
      if (qLower.includes('three irreversible steps of glycolysis'))
        return '<ol><li><b>Hexokinase</b> → <b>Glucose-6-phosphatase</b></li><li><b>PFK-1</b> → <b>Fructose-1,6-bisphosphatase</b></li><li><b>Pyruvate kinase</b> → <b>Pyruvate carboxylase</b> + <b>PEPCK</b></li></ol>';
      if (qLower.includes('cori cycle'))
        return '<b>Cori cycle:</b> Anaerobic muscle glycolysis → <b>lactate</b> → transported to liver → <b>gluconeogenesis</b> → glucose returned to muscle.';
      if (qLower.includes('essential amino acids'))
        return '<b>Mnemonic: PVT TIM HaLL</b><ul><li><b>P</b>henylalanine</li><li><b>V</b>aline</li><li><b>T</b>ryptophan</li><li><b>T</b>hreonine</li><li><b>I</b>soleucine</li><li><b>M</b>ethionine</li><li><b>H</b>istidine</li><li><b>L</b>eucine</li><li><b>L</b>ysine</li></ul>';
      if (qLower.includes('pyruvate dehydrogenase complex') && qLower.includes('function'))
        return '<b>Converts pyruvate → acetyl-CoA.</b> Requires 5 cofactors:<ul><li><b>TPP</b> (B1 — Thiamine)</li><li><b>Lipoic acid</b></li><li><b>CoA</b> (B5 — Pantothenate)</li><li><b>FAD</b> (B2 — Riboflavin)</li><li><b>NAD</b> (B3 — Niacin)</li></ul><b>Mnemonic: Tender Loving Care For Nancy</b>';
      if (qLower.includes('sources of nadph'))
        return '<ol><li><b>Pentose phosphate pathway</b> (oxidative phase, via G6PD)</li><li><b>Malic enzyme</b></li><li><b>Isocitrate dehydrogenase</b> (cytosolic)</li></ol>';
      if (qLower.includes('key allosteric regulators of pfk-1'))
        return '<ul><li><b>Activators ↑:</b> AMP, Fructose-2,6-bisphosphate</li><li><b>Inhibitors ↓:</b> ATP, Citrate, Low pH</li></ul>';
      if (qLower.includes('three types of rna polymerase'))
        return '<ul><li><b>RNA Pol I</b> — rRNA</li><li><b>RNA Pol II</b> — mRNA</li><li><b>RNA Pol III</b> — tRNA & 5S rRNA</li></ul><b>Mnemonic:</b> I make rRNA, II make mRNA, III make tRNA.';
      if (qLower.includes('name three trinucleotide repeat disorders'))
        return '<ol><li><b>Huntington disease</b> — CAG (chromosome 4)</li><li><b>Fragile X syndrome</b> — CGG (FMR1)</li><li><b>Myotonic dystrophy</b> — CTG</li></ol>';
      if (qLower.includes('stop codons'))
        return '<ul><li><b>UAA</b> (ochre)</li><li><b>UAG</b> (amber)</li><li><b>UGA</b> (opal/umber)</li></ul>';
      if (qLower.includes('role of oncogenes vs tumor suppressor'))
        return '<ul><li><b>Oncogenes:</b> gain-of-function (one mutated copy sufficient — dominant)</li><li><b>Tumor suppressors:</b> loss-of-function (both copies usually lost — recessive, Knudson two-hit hypothesis)</li></ul>';
      if (qLower.includes('lysosomal storage diseases') && qLower.includes('inheritance'))
        return '<b>Autosomal recessive</b> — except:<ul><li><b>Fabry disease</b> — X-linked (α-galactosidase A)</li><li><b>Hunter syndrome</b> — X-linked (iduronate-2-sulfatase)</li></ul>';
    }

    // General list formatting
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

    // Em-dash pattern
    if (s.includes(' — ') && !s.includes('<b>')) {
      const di = s.indexOf(' — ');
      return `<b>${s.slice(0,di).trim()}</b> — ${s.slice(di+3).trim()}`;
    }
  }

  // 3. Auto-bold key terms (for both! but check no nested bolds)
  boldTerms.forEach(t => {
    const esc = t.replace(/[.*+?^${}()|[\]\\]/g,'\\$&');
    s = s.replace(new RegExp(`(?<!<[^>]*)\\b(${esc})\\b`,'gi'),'<b>$1</b>');
  });
  s = s.replace(/<b><b>(.*?)<\/b><\/b>/g,'<b>$1</b>');
  return s;
}

// 1. Process Anatomy
console.log('Processing Anatomy...');
const formattedAnatMain = anatomyRawCards.map(c => ({
  q: formatText(c.q, c.q, 'anatomy'),
  a: formatText(c.a, c.q, 'anatomy')
}));
const formattedAnatAppend = anatomyAppendRawCards.map(c => ({
  q: formatText(c.q, c.q, 'anatomy_append'),
  a: formatText(c.a, c.q, 'anatomy_append')
}));
const fullAnatomyCards = [...formattedAnatMain, ...formattedAnatAppend];
console.log(`Anatomy: Main=${formattedAnatMain.length}, Append=${formattedAnatAppend.length}, Combined=${fullAnatomyCards.length}`);

// 2. Process Pathology
console.log('Processing Pathology...');
const fullPathologyCards = pathologyRawCards.map(c => ({
  q: formatText(c.q, c.q, 'pathology'),
  a: formatText(c.a, c.q, 'pathology')
}));
console.log(`Pathology: ${fullPathologyCards.length} cards`);

// 3. Process Biochemistry
console.log('Processing Biochemistry...');
const fullBiochemCards = biochem2RawCards.map(c => ({
  q: formatText(c.q, c.q, 'biochem'),
  a: formatText(c.a, c.q, 'biochem')
}));
console.log(`Biochemistry: ${fullBiochemCards.length} cards`);

// 4. Process Nutrition
console.log('Processing Nutrition...');
const fullNutritionCards = nutritionRawCards.map(c => ({
  q: formatText(c.q, c.q, 'nutrition'),
  a: formatText(c.a, c.q, 'nutrition')
}));
console.log(`Nutrition: ${fullNutritionCards.length} cards`);

// 5. Process Behavioral Sciences
console.log('Processing Behavioral Sciences...');
const fullBehavioralSciencesCards = behavioralSciencesRawCards.map(c => ({
  q: formatText(c.q, c.q, 'behavioral'),
  a: formatText(c.a, c.q, 'behavioral')
}));
console.log(`Behavioral Sciences: ${fullBehavioralSciencesCards.length} cards`);

// 6. Process Immunology
console.log('Processing Immunology...');
const fullImmunologyCards = immunologyRawCards.map(c => ({
  q: formatText(c.q, c.q, 'immunology'),
  a: formatText(c.a, c.q, 'immunology')
}));
console.log(`Immunology: ${fullImmunologyCards.length} cards`);

// 7. Process Aging
console.log('Processing Aging...');
const fullAgingCards = agingRawCards.map(c => ({
  q: formatText(c.q, c.q, 'aging'),
  a: formatText(c.a, c.q, 'aging')
}));
console.log(`Aging: ${fullAgingCards.length} cards`);

// 8. Process Genetics
console.log('Processing Genetics...');
const fullGeneticsCards = geneticsRawCards.map(c => ({
  q: formatText(c.q, c.q, 'genetics'),
  a: formatText(c.a, c.q, 'genetics')
}));
console.log(`Genetics: ${fullGeneticsCards.length} cards`);

// 9. Process Pharmacology
console.log('Processing Pharmacology...');
const fullPharmacologyCards = pharmacologyRawCards.map(c => ({
  q: formatText(c.q, c.q, 'pharmacology'),
  a: formatText(c.a, c.q, 'pharmacology')
}));
console.log(`Pharmacology: ${fullPharmacologyCards.length} cards`);

// Perform self-checks
function checkSanity(cards, name) {
  let issues = 0;
  cards.forEach((c, i) => {
    if (c.q.trim() === c.a.trim()) {
      console.error(`ERROR: [${name}] Card ${i + 1} has identical question and answer: ${c.q}`);
      issues++;
    }
    if (c.q.includes('<ul>') || c.q.includes('<ol>')) {
      console.warn(`WARNING: [${name}] Card ${i + 1} question contains list HTML: ${c.q}`);
      issues++;
    }
  });
  return issues === 0;
}

const anatSane = checkSanity(fullAnatomyCards, 'Anatomy');
const pathSane = checkSanity(fullPathologyCards, 'Pathology');
const biochemSane = checkSanity(fullBiochemCards, 'Biochemistry');
const nutritionSane = checkSanity(fullNutritionCards, 'Nutrition');
const behavioralSane = checkSanity(fullBehavioralSciencesCards, 'Behavioral Sciences');
const immunologySane = checkSanity(fullImmunologyCards, 'Immunology');
const agingSane = checkSanity(fullAgingCards, 'Aging');
const geneticsSane = checkSanity(fullGeneticsCards, 'Genetics');
const pharmacologySane = checkSanity(fullPharmacologyCards, 'Pharmacology');

if (!anatSane || !pathSane || !biochemSane || !nutritionSane || !behavioralSane || !immunologySane || !agingSane || !geneticsSane || !pharmacologySane) {
  console.error('Sanity check FAILED. Aborting insertion.');
  process.exit(1);
}
console.log('✅ Sanity checks passed successfully!');

// Save to usmle1_cards_output files for trace
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/anatomy.js', `const anatomyCards = ${JSON.stringify(fullAnatomyCards, null, 2)};\nmodule.exports = { anatomyCards };\n`);
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/pathology.js', `const pathologyCards = ${JSON.stringify(fullPathologyCards, null, 2)};\nmodule.exports = { pathologyCards };\n`);
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/biochem2.js', `const biochem2Cards = ${JSON.stringify(fullBiochemCards, null, 2)};\nmodule.exports = { biochem2Cards };\n`);
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/nutrition.js', `const nutritionCards = ${JSON.stringify(fullNutritionCards, null, 2)};\nmodule.exports = { nutritionCards };\n`);
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/behavioral_sciences.js', `const behavioralSciencesCards = ${JSON.stringify(fullBehavioralSciencesCards, null, 2)};\nmodule.exports = { behavioralSciencesCards };\n`);
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/immunology.js', `const immunologyCards = ${JSON.stringify(fullImmunologyCards, null, 2)};\nmodule.exports = { immunologyCards };\n`);
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/aging.js', `const agingCards = ${JSON.stringify(fullAgingCards, null, 2)};\nmodule.exports = { agingCards };\n`);
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/genetics.js', `const geneticsCards = ${JSON.stringify(fullGeneticsCards, null, 2)};\nmodule.exports = { geneticsCards };\n`);
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/usmle1_cards_output/pharmacology.js', `const pharmacologyCards = ${JSON.stringify(fullPharmacologyCards, null, 2)};\nmodule.exports = { pharmacologyCards };\n`);

// 5. Load flash-cards.html
const htmlPath = 'C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
const html = fs.readFileSync(htmlPath, 'utf8');

// Find usmle1 range
const startIdx = html.indexOf("'usmle1': [");
const endIdx = html.indexOf("'usmle2': [", startIdx);
if (startIdx === -1 || endIdx === -1) {
  console.error("Could not find usmle1 or usmle2 in html");
  process.exit(1);
}

const u1Block = html.substring(startIdx, endIdx);

// Parse the first 10 topics using JS engine
let topics;
try {
  let blockCode = u1Block.trim();
  if (blockCode.endsWith(',')) blockCode = blockCode.slice(0, -1);
  const code = blockCode.replace("'usmle1':", "module.exports =");
  const tempFile = 'C:/Users/Hasan-PC/Desktop/MedHelp/scratch/temp_u1_rebuild.js';
  fs.writeFileSync(tempFile, code, 'utf8');
  topics = require(tempFile);
  fs.unlinkSync(tempFile);
} catch (e) {
  console.error("Failed to parse existing usmle1 topics:", e);
  process.exit(1);
}

console.log(`Currently parsed ${topics.length} topics. Slicing first 10...`);
const keptTopics = topics.slice(0, 10);
console.log('Keeping topics:');
keptTopics.forEach((t, i) => console.log(`  ${i+1}. ${t.topic} (${t.cards.length} cards)`));

// Add the 4 new/corrected topics
keptTopics.push({
  section: "Basic Sciences",
  topic: "Anatomy",
  icon: "bones",
  cards: fullAnatomyCards
});

keptTopics.push({
  section: "Basic Sciences",
  topic: "Pathology",
  icon: "microscope",
  cards: fullPathologyCards
});

keptTopics.push({
  section: "Basic Sciences",
  topic: "Biochemistry",
  icon: "flask",
  cards: fullBiochemCards
});

keptTopics.push({
  section: "Basic Sciences",
  topic: "Nutrition",
  icon: "apple",
  cards: fullNutritionCards
});

keptTopics.push({
  section: "Basic Sciences",
  topic: "Behavioral Sciences",
  icon: "brain",
  cards: fullBehavioralSciencesCards
});

keptTopics.push({
  section: "Basic Sciences",
  topic: "Immunology",
  icon: "shield",
  cards: fullImmunologyCards
});

keptTopics.push({
  section: "Basic Sciences",
  topic: "Aging",
  icon: "clock",
  cards: fullAgingCards
});

keptTopics.push({
  section: "Basic Sciences",
  topic: "Genetics",
  icon: "dna",
  cards: fullGeneticsCards
});

keptTopics.push({
  section: "Basic Sciences",
  topic: "Pharmacology",
  icon: "pill",
  cards: fullPharmacologyCards
});

keptTopics.push({
  section: "Basic Sciences",
  topic: "Hematology",
  icon: "droplet",
  cards: hematologyRawCards
});

keptTopics.push({
  section: "Basic Sciences",
  topic: "Neuropharmacology",
  icon: "brain",
  cards: neuropharmacologyRawCards
});

console.log(`New total topics: ${keptTopics.length}`);

// Serialize the new usmle1 array
function serializeTopics(topicsList) {
  let out = "      'usmle1': [\n";
  topicsList.forEach((t, tIdx) => {
    out += "        {\n";
    if (t.section !== undefined) {
      out += `          section: ${JSON.stringify(t.section)},\n`;
    } else {
      out += "          section: undefined,\n";
    }
    out += `          topic: ${JSON.stringify(t.topic)},\n`;
    out += `          icon: ${JSON.stringify(t.icon)},\n`;
    out += "          cards: [\n";
    t.cards.forEach((c, cIdx) => {
      const q = JSON.stringify(c.q);
      const a = JSON.stringify(c.a);
      out += `            { q: ${q}, a: ${a} }${cIdx < t.cards.length - 1 ? ',' : ''}\n`;
    });
    out += "          ]\n";
    out += `        }${tIdx < topicsList.length - 1 ? ',' : ''}\n`;
  });
  out += "      ]";
  return out;
}

const newU1String = serializeTopics(keptTopics);

// Backup
const backupPath = htmlPath + '.bak_usmle1_rebuild2';
fs.copyFileSync(htmlPath, backupPath);
console.log(`Backup saved to: ${backupPath}`);

// Replace in html
const newHtml = html.substring(0, startIdx) + newU1String + ",\n" + html.substring(endIdx);
fs.writeFileSync(htmlPath, newHtml, 'utf8');
console.log(`Successfully wrote rebuilt usmle1 topics to ${htmlPath}`);

// Final verify
const verifyHtml = fs.readFileSync(htmlPath, 'utf8');
const vStart = verifyHtml.indexOf("'usmle1': [");
const vEnd = verifyHtml.indexOf("'usmle2': [", vStart);
let verifyTopics;
try {
  let vCode = verifyHtml.substring(vStart, vEnd).trim();
  if (vCode.endsWith(',')) vCode = vCode.slice(0, -1);
  vCode = vCode.replace("'usmle1':", "module.exports =");
  const tempFile = 'C:/Users/Hasan-PC/Desktop/MedHelp/scratch/temp_v_rebuild.js';
  fs.writeFileSync(tempFile, vCode, 'utf8');
  verifyTopics = require(tempFile);
  fs.unlinkSync(tempFile);
} catch (e) {
  console.error("Verification require failed:", e);
  process.exit(1);
}

console.log("\n=== Rebuilt Topics Verification ===");
let totalCards = 0;
verifyTopics.forEach((t, i) => {
  console.log(`${i+1}. ${t.topic} (${t.section}): ${t.cards.length} cards`);
  totalCards += t.cards.length;
});
console.log(`Total topics: ${verifyTopics.length} (expected 21)`);
console.log(`Total cards: ${totalCards}`);
