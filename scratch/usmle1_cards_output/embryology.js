const embryologyCards = [
  {
    "q": "What is the process of gametogenesis in males called?",
    "a": "<b>Spermatogenesis</b> — begins at puberty and continues throughout life."
  },
  {
    "q": "What is the process of gametogenesis in females called?",
    "a": "<b>Oogenesis</b> — begins in fetal life; primary oocytes arrested in prophase I until puberty."
  },
  {
    "q": "What is the most common chromosomal abnormality in spontaneous abortions?",
    "a": "<b>Trisomy 16</b>."
  },
  {
    "q": "What structure forms the female pronucleus after fertilization?",
    "a": "The secondary oocyte completes meiosis II upon sperm entry."
  },
  {
    "q": "What is the zona pellucida?",
    "a": "Glycoprotein layer surrounding the oocyte; prevents polyspermy and protects the embryo."
  },
  {
    "q": "What prevents polyspermy after fertilization?",
    "a": "Cortical reaction (release of cortical granules) hardens the zona pellucida."
  },
  {
    "q": "What is the morula?",
    "a": "Solid ball of 16–32 blastomeres formed after cleavage (day 3–4)."
  },
  {
    "q": "What is the blastocyst?",
    "a": "Hollow ball with inner cell mass (embryoblast) and trophoblast (day 5)."
  },
  {
    "q": "What structure implants into the endometrium?",
    "a": "Blastocyst (around day 6–7)."
  },
  {
    "q": "<b>Epiblast</b> (future embryo) and <b>Hypoblast</b>.",
    "a": "<b>Epiblast</b> (future embryo) and <b>Hypoblast</b>."
  },
  {
    "q": "What is gastrulation?",
    "a": "Formation of the three germ layers (<b>ectoderm</b>, <b>mesoderm</b>, <b>endoderm</b>) from the epiblast (week 3)."
  },
  {
    "q": "What is the primitive streak?",
    "a": "Site of gastrulation; cells migrate through it to form <b>mesoderm</b> and <b>endoderm</b>."
  },
  {
    "q": "What is the notochord?",
    "a": "Mesodermal structure that induces neural plate formation."
  },
  {
    "q": "What is neurulation?",
    "a": "Formation of the neural tube from the neural plate (week 3–4)."
  },
  {
    "q": "<ul><li><b>Anterior neuropore</b> closes day 25</li><li><b>Posterior neuropore</b> closes day 27</li></ul>",
    "a": "<ul><li><b>Anterior neuropore</b> closes day 25</li><li><b>Posterior neuropore</b> closes day 27</li></ul>"
  },
  {
    "q": "What defect results from failure of anterior neuropore closure?",
    "a": "<b>Anencephaly</b>."
  },
  {
    "q": "What defect results from failure of posterior neuropore closure?",
    "a": "<b>Spina bifida</b> (<b>myelomeningocele</b> most severe)."
  },
  {
    "q": "<ul><li><b>Epidermis</b>, hair, nails, sweat glands</li><li><b>Lens of eye</b></li><li><b>Inner ear</b></li></ul>",
    "a": "<ul><li><b>Epidermis</b>, hair, nails, sweat glands</li><li><b>Lens of eye</b></li><li><b>Inner ear</b></li></ul>"
  },
  {
    "q": "<ul><li><b>CNS</b></li><li><b>Retina</b></li><li><b>Pineal gland</b></li><li><b>Posterior pituitary</b></li></ul>",
    "a": "<ul><li><b>CNS</b></li><li><b>Retina</b></li><li><b>Pineal gland</b></li><li><b>Posterior pituitary</b></li></ul>"
  },
  {
    "q": "<ul><li><b>PNS</b> (sensory neurons, autonomic ganglia)</li><li><b>Adrenal medulla</b></li><li><b>Melanocytes</b></li><li><b>Craniofacial bones</b></li><li><b>Aorticopulmonary septum</b></li></ul>",
    "a": "<ul><li><b>PNS</b> (sensory neurons, autonomic ganglia)</li><li><b>Adrenal medulla</b></li><li><b>Melanocytes</b></li><li><b>Craniofacial bones</b></li><li><b>Aorticopulmonary septum</b></li></ul>"
  },
  {
    "q": "<ul><li><b>Muscle, bone, connective tissue</b></li><li><b>Cardiovascular system</b></li><li><b>Kidneys</b></li><li><b>Gonads</b></li><li><b>Spleen</b></li></ul>",
    "a": "<ul><li><b>Muscle, bone, connective tissue</b></li><li><b>Cardiovascular system</b></li><li><b>Kidneys</b></li><li><b>Gonads</b></li><li><b>Spleen</b></li></ul>"
  },
  {
    "q": "<ul><li><b>Gut tube epithelium</b></li><li><b>Liver</b></li><li><b>Pancreas</b></li><li><b>Thyroid</b></li><li><b>Parathyroid</b></li><li><b>Lungs</b></li></ul>",
    "a": "<ul><li><b>Gut tube epithelium</b></li><li><b>Liver</b></li><li><b>Pancreas</b></li><li><b>Thyroid</b></li><li><b>Parathyroid</b></li><li><b>Lungs</b></li></ul>"
  },
  {
    "q": "<ul><li><b>Ectoderm</b></li><li><b>Mesoderm</b></li><li><b>Endoderm</b></li></ul>",
    "a": "<ul><li><b>Ectoderm</b></li><li><b>Mesoderm</b></li><li><b>Endoderm</b></li></ul>"
  },
  {
    "q": "What is the <b>allantois</b>?",
    "a": "Outpouching of yolk sac; becomes <b>urachus</b> (median umbilical ligament)."
  },
  {
    "q": "What is the yolk sac derivative in humans?",
    "a": "Contributes to gut and primordial germ cells."
  },
  {
    "q": "What is the amniotic cavity?",
    "a": "Space above the epiblast that becomes filled with amniotic fluid."
  },
  {
    "q": "What is the chorion?",
    "a": "Outer membrane formed by trophoblast + extraembryonic <b>mesoderm</b>; becomes fetal part of placenta."
  },
  {
    "q": "What is the decidua basalis?",
    "a": "Maternal endometrium beneath the implanted blastocyst; forms maternal part of placenta."
  },
  {
    "q": "What hormone maintains the corpus luteum in early pregnancy?",
    "a": "<b>hCG</b> (human chorionic gonadotropin)."
  },
  {
    "q": "When does the placenta take over progesterone production?",
    "a": "Around 8–10 weeks (luteoplacental shift)."
  },
  {
    "q": "<b>Mesoderm</b> + <b>neural crest cells</b>.",
    "a": "<b>Mesoderm</b> + <b>neural crest cells</b>."
  },
  {
    "q": "What is the derivative of the 1st branchial arch?",
    "a": "Mandible, maxilla, malleus, incus, muscles of mastication (Meckel’s cartilage)."
  },
  {
    "q": "What is the derivative of the 2nd branchial arch?",
    "a": "Stapes, styloid process, Reichert’s cartilage, muscles of facial expression."
  },
  {
    "q": "What is the derivative of the 3rd branchial arch?",
    "a": "Greater horn of hyoid, stylopharyngeus muscle, inferior parathyroid, thymus."
  },
  {
    "q": "What is the derivative of the 4th branchial arch?",
    "a": "Thyroid cartilage, cricothyroid muscle, superior parathyroid."
  },
  {
    "q": "What is the derivative of the 6th branchial arch?",
    "a": "Cricoid cartilage, intrinsic laryngeal muscles (except cricothyroid)."
  },
  {
    "q": "What is a branchial cleft cyst?",
    "a": "Persistent cervical sinus (failure of 2nd–4th clefts to obliterate)."
  },
  {
    "q": "What is a thyroglossal duct cyst?",
    "a": "Persistent thyroglossal duct (midline neck mass that moves with swallowing)."
  },
  {
    "q": "What is the embryonic origin of the anterior pituitary?",
    "a": "<b>Rathke’s pouch</b> (surface <b>ectoderm</b>)."
  },
  {
    "q": "What is the embryonic origin of the posterior pituitary?",
    "a": "<b>Neuroectoderm</b> (infundibulum from diencephalon)."
  },
  {
    "q": "What is the embryonic origin of the thyroid gland?",
    "a": "<b>Endoderm</b> from the floor of the primitive pharynx (foramen cecum); descends via thyroglossal duct."
  },
  {
    "q": "What is the embryonic origin of the parathyroid glands?",
    "a": "<ul><li><b>Superior parathyroids:</b> 4th pharyngeal pouch.</li><li><b>Inferior parathyroids:</b> 3rd pharyngeal pouch.</li></ul>"
  },
  {
    "q": "What is the embryonic origin of the thymus?",
    "a": "3rd pharyngeal pouch (ventral wings)."
  },
  {
    "q": "What is <b>DiGeorge syndrome</b>?",
    "a": "22q11.2 deletion → failure of 3rd and 4th pharyngeal pouch development → absent thymus and parathyroids → T-cell deficiency + hypocalcemia."
  },
  {
    "q": "What structures develop from the 1st pharyngeal pouch?",
    "a": "<b>Middle ear cavity</b> and <b>Eustachian tube</b>."
  },
  {
    "q": "What structures develop from the 2nd pharyngeal pouch?",
    "a": "<b>Palatine tonsils</b>."
  },
  {
    "q": "What is the <b>aortic arch</b> derivative of the 3rd pharyngeal arch?",
    "a": "<b>Common carotid artery</b> and proximal <b>internal carotid artery</b>."
  },
  {
    "q": "What is the <b>aortic arch</b> derivative of the 4th pharyngeal arch?",
    "a": "<ul><li><b>Right:</b> proximal right subclavian artery.</li><li><b>Left:</b> aortic arch.</li></ul>"
  },
  {
    "q": "What is the <b>aortic arch</b> derivative of the 6th pharyngeal arch?",
    "a": "Proximal <b>pulmonary arteries</b> and <b>ductus arteriosus</b> (left side)."
  },
  {
    "q": "What is the most common <b>aortic arch</b> anomaly?",
    "a": "Right <b>aortic arch</b> with aberrant left <b>subclavian artery</b>."
  },
  {
    "q": "What is the embryonic origin of the <b>superior vena cava</b>?",
    "a": "Right <b>anterior cardinal vein</b>."
  },
  {
    "q": "What is the embryonic origin of the <b>portal vein</b>?",
    "a": "<b>Vitelline veins</b>."
  },
  {
    "q": "What is the embryonic origin of the <b>umbilical vein</b>?",
    "a": "Left <b>umbilical vein</b> (right regresses)."
  },
  {
    "q": "What is the fate of the <b>umbilical arteries</b>?",
    "a": "Become medial umbilical ligaments."
  },
  {
    "q": "What is the fate of the <b>allantois</b>?",
    "a": "Becomes <b>urachus</b> → median umbilical ligament."
  },
  {
    "q": "What is the embryonic origin of the kidney?",
    "a": "Intermediate <b>mesoderm</b>."
  },
  {
    "q": "<b>Pronephros</b> → <b>Mesonephros</b> → <b>Metanephros</b> (definitive kidney).",
    "a": "<b>Pronephros</b> → <b>Mesonephros</b> → <b>Metanephros</b> (definitive kidney)."
  },
  {
    "q": "What induces the <b>metanephric mesenchyme</b> to form nephrons?",
    "a": "<b>Ureteric bud</b> (from <b>mesonephric duct</b>)."
  },
  {
    "q": "What is <b>Potter sequence</b>?",
    "a": "Bilateral renal agenesis → oligohydramnios → pulmonary hypoplasia, characteristic facies, limb deformities."
  },
  {
    "q": "What is the embryonic origin of the gonads?",
    "a": "Genital ridge (intermediate <b>mesoderm</b>) + primordial germ cells."
  },
  {
    "q": "What gene determines testicular differentiation?",
    "a": "<b>SRY gene</b> on Y chromosome."
  },
  {
    "q": "What hormone causes regression of Müllerian ducts?",
    "a": "<b>Anti-Müllerian Hormone</b> (AMH) from <b>Sertoli cells</b>."
  },
  {
    "q": "What hormone stimulates development of Wolffian ducts?",
    "a": "<b>Testosterone</b> from <b>Leydig cells</b>."
  },
  {
    "q": "What is the fate of the Müllerian ducts in females?",
    "a": "Uterus, fallopian tubes, upper vagina."
  },
  {
    "q": "What is the fate of the Wolffian ducts in males?",
    "a": "Epididymis, vas deferens, seminal vesicles."
  },
  {
    "q": "What is the most common cause of male pseudohermaphroditism?",
    "a": "5α-reductase deficiency or androgen insensitivity syndrome."
  },
  {
    "q": "What is the most common cause of female pseudohermaphroditism?",
    "a": "Congenital adrenal hyperplasia (21-hydroxylase deficiency)."
  },
  {
    "q": "What is the embryonic origin of the adrenal cortex?",
    "a": "<b>Mesoderm</b> (intermediate <b>mesoderm</b>)."
  },
  {
    "q": "What is the embryonic origin of the adrenal medulla?",
    "a": "<b><b>Neural crest</b> cells</b>."
  },
  {
    "q": "What is the embryonic origin of the spleen?",
    "a": "<b>Mesoderm</b> (dorsal mesentery of stomach)."
  },
  {
    "q": "What is the embryonic origin of the liver and pancreas?",
    "a": "Foregut <b>endoderm</b>."
  },
  {
    "q": "What is the embryonic origin of the lung buds?",
    "a": "Foregut <b>endoderm</b>."
  },
  {
    "q": "What is the <b>tracheoesophageal fistula</b>?",
    "a": "Abnormal separation of respiratory diverticulum from foregut."
  },
  {
    "q": "What is the most common type of <b>tracheoesophageal fistula</b>?",
    "a": "Proximal <b>esophageal atresia</b> with distal <b>TEF</b> (85%)."
  },
  {
    "q": "What is congenital diaphragmatic hernia?",
    "a": "Failure of pleuroperitoneal folds to close (usually left <b>Bochdalek hernia</b>) → pulmonary hypoplasia."
  },
  {
    "q": "What is omphalocele?",
    "a": "Failure of abdominal wall closure at umbilicus; covered by peritoneum."
  },
  {
    "q": "What is gastroschisis?",
    "a": "Full-thickness abdominal wall defect usually to the right of umbilicus; bowel not covered by peritoneum."
  },
  {
    "q": "What is the <b>vitelline duct</b> remnant?",
    "a": "<b>Meckel’s diverticulum</b> (on antimesenteric border of ileum)."
  },
  {
    "q": "<ol><li><b>2%</b> of the population</li><li><b>2 inches</b> long</li><li><b>2 feet</b> from the ileocecal valve</li><li>Presents by age <b>2</b></li><li><b>2 types</b> of ectopic tissue (gastric, pancreatic)</li></ol>",
    "a": "<ol><li><b>2%</b> of the population</li><li><b>2 inches</b> long</li><li><b>2 feet</b> from the ileocecal valve</li><li>Presents by age <b>2</b></li><li><b>2 types</b> of ectopic tissue (gastric, pancreatic)</li></ol>"
  },
  {
    "q": "What is <b>Hirschsprung’s disease</b>?",
    "a": "Absence of ganglion cells (<b>neural crest</b> migration failure) in distal colon → functional obstruction."
  },
  {
    "q": "What is the embryonic origin of the anal canal?",
    "a": "<ul><li><b>Upper 2/3:</b> endoderm.</li><li><b>Lower 1/3:</b> ectoderm (proctodeum).</li></ul>"
  },
  {
    "q": "What is the most common congenital heart defect?",
    "a": "<b>Ventricular septal defect</b> (<b>VSD</b>)."
  },
  {
    "q": "What is the embryonic origin of the atrial septum?",
    "a": "Septum primum and septum secundum."
  },
  {
    "q": "What is the most common cause of cyanotic congenital heart disease?",
    "a": "<b>Tetralogy of Fallot</b>."
  },
  {
    "q": "<ul><li><b>Pulmonary stenosis</b></li><li><b>Right ventricular hypertrophy</b></li><li><b>Overriding aorta</b></li><li><b>Ventricular septal defect</b> (<b>PROV</b>)</li></ul>",
    "a": "<ul><li><b>Pulmonary stenosis</b></li><li><b>Right ventricular hypertrophy</b></li><li><b>Overriding aorta</b></li><li><b>Ventricular septal defect</b> (<b>PROV</b>)</li></ul>"
  },
  {
    "q": "What is <b>persistent truncus arteriosus</b>?",
    "a": "Failure of truncus arteriosus to divide into aorta and pulmonary trunk (often with <b>VSD</b>)."
  },
  {
    "q": "What is <b>transposition of the great arteries</b>?",
    "a": "Aorta arises from right ventricle, pulmonary trunk from left ventricle. Needs shunt for survival."
  },
  {
    "q": "What is the most common cause of early cyanosis in newborns?",
    "a": "<b>Transposition of the great arteries</b>."
  },
  {
    "q": "What is <b>coarctation of the aorta</b>?",
    "a": "Narrowing of aorta usually distal to left <b>subclavian artery</b>. Associated with Turner syndrome."
  },
  {
    "q": "What is <b>patent <b>ductus arteriosus</b></b> (<b>PDA</b>)?",
    "a": "Failure of <b>ductus arteriosus</b> to close after birth. Continuous 'machine-like' murmur."
  },
  {
    "q": "What keeps the <b>ductus arteriosus</b> open in fetal life?",
    "a": "Low oxygen tension and high prostaglandin E₂ levels."
  },
  {
    "q": "What drug is used to close a <b>PDA</b>?",
    "a": "<b>Indomethacin</b> (prostaglandin inhibitor)."
  },
  {
    "q": "What drug is used to keep a <b>PDA</b> open?",
    "a": "Prostaglandin E₁ (alprostadil)."
  },
  {
    "q": "<ul><li><b>Septum transversum</b></li><li><b>Pleuroperitoneal folds</b></li><li><b>Body wall</b></li><li><b>Dorsal mesentery of esophagus</b></li></ul>",
    "a": "<ul><li><b>Septum transversum</b></li><li><b>Pleuroperitoneal folds</b></li><li><b>Body wall</b></li><li><b>Dorsal mesentery of esophagus</b></li></ul>"
  },
  {
    "q": "What is the most common type of congenital diaphragmatic hernia?",
    "a": "<b>Bochdalek hernia</b> (posterolateral, usually left side)."
  },
  {
    "q": "What is <b>eventration of the diaphragm</b>?",
    "a": "Incomplete muscularization leading to elevated hemidiaphragm."
  },
  {
    "q": "What is the embryonic origin of the limbs?",
    "a": "Limb buds (<b>mesoderm</b> covered by <b>ectoderm</b>) appear at week 4."
  },
  {
    "q": "What is the apical ectodermal ridge (<b>AER</b>)?",
    "a": "Directs proximal-distal limb growth."
  },
  {
    "q": "What is the zone of polarizing activity (<b>ZPA</b>)?",
    "a": "Determines anterior-posterior limb axis (via <b>Sonic hedgehog</b>)."
  },
  {
    "q": "What causes <b>phocomelia</b>?",
    "a": "<b>Thalidomide</b> exposure (disrupts limb bud development)."
  },
  {
    "q": "What is the most common congenital limb defect?",
    "a": "<b>Polydactyly</b>."
  },
  {
    "q": "What is <b>syndactyly</b>?",
    "a": "Failure of apoptosis between digits."
  },
  {
    "q": "What is the embryonic origin of the urinary bladder?",
    "a": "Vesicourethral canal (from urogenital sinus)."
  },
  {
    "q": "What is the <b>urachus</b>?",
    "a": "Remnant of <b>allantois</b>; becomes median umbilical ligament."
  },
  {
    "q": "What is a patent <b>urachus</b>?",
    "a": "Urine leaks from umbilicus."
  },
  {
    "q": "<ul><li><b>Genital tubercle</b></li><li><b>Urogenital folds</b></li><li><b>Labioscrotal swellings</b></li></ul>",
    "a": "<ul><li><b>Genital tubercle</b></li><li><b>Urogenital folds</b></li><li><b>Labioscrotal swellings</b></li></ul>"
  },
  {
    "q": "What hormone drives male external genitalia differentiation?",
    "a": "Dihydrotestosterone (DHT)."
  },
  {
    "q": "What is the indifferent stage of external genitalia?",
    "a": "Until week 9–10, male and female genitalia are identical."
  },
  {
    "q": "What is the most common congenital anomaly of the penis?",
    "a": "<b>Hypospadias</b> (urethral opening on ventral surface)."
  },
  {
    "q": "What is <b>epispadias</b> associated with?",
    "a": "<b>Exstrophy of the bladder</b>."
  },
  {
    "q": "What is <b>cryptorchidism</b>?",
    "a": "Undescended testis. Increases risk of infertility and testicular cancer."
  },
  {
    "q": "What is the <b>gubernaculum</b>?",
    "a": "Fibrous cord that guides testicular descent."
  },
  {
    "q": "What is the <b>processus vaginalis</b>?",
    "a": "Peritoneal evagination that precedes testicular descent; failure to obliterate → <b>indirect inguinal hernia</b> or <b>hydrocele</b>."
  },
  {
    "q": "What is the embryonic origin of primordial germ cells?",
    "a": "Yolk sac <b>endoderm</b>; migrate to genital ridge."
  },
  {
    "q": "What is the fate of the paramesonephric (Müllerian) ducts in males?",
    "a": "Regress due to AMH."
  },
  {
    "q": "What is the fate of the mesonephric (Wolffian) ducts in females?",
    "a": "Regress."
  },
  {
    "q": "What is the most common uterine anomaly?",
    "a": "<b>Septate uterus</b> (failure of septum resorption)."
  },
  {
    "q": "What is <b>Mayer-Rokitansky-Küster-Hauser (MRKH) syndrome</b>?",
    "a": "<b>Müllerian agenesis</b> — congenital absence of uterus and upper vagina with normal ovaries and secondary sexual characteristics."
  },
  {
    "q": "What is the most common congenital malformation of the CNS?",
    "a": "Neural tube defects (especially <b>spina bifida</b>)."
  },
  {
    "q": "What maternal factor is most strongly associated with neural tube defects?",
    "a": "Folate deficiency."
  },
  {
    "q": "What is the role of folate in embryogenesis?",
    "a": "Essential for neural tube closure (DNA synthesis and methylation)."
  },
  {
    "q": "What is <b>holoprosencephaly</b>?",
    "a": "Failure of forebrain to divide into two hemispheres. Strongly associated with <b>trisomy 13</b>."
  },
  {
    "q": "What is <b>anencephaly</b>?",
    "a": "Absence of cranial vault and cerebral hemispheres due to failure of anterior neuropore closure."
  },
  {
    "q": "What is <b>Chiari II malformation</b>?",
    "a": "Caudal displacement of cerebellar vermis and tonsils through foramen magnum; almost always associated with <b>myelomeningocele</b>."
  },
  {
    "q": "What is <b>Dandy-Walker malformation</b>?",
    "a": "Agenesis/hypoplasia of cerebellar vermis with cystic dilation of 4th ventricle."
  },
  {
    "q": "What is <b>syringomyelia</b>?",
    "a": "Central canal dilation in spinal cord (often associated with <b>Chiari I</b> or trauma)."
  },
  {
    "q": "What is the embryonic origin of the adrenal cortex vs medulla?",
    "a": "<ul><li><b>Cortex:</b> mesoderm.</li><li><b>Medulla:</b> neural crest.</li></ul>"
  },
  {
    "q": "What is the embryonic origin of the anterior pituitary?",
    "a": "<b>Rathke’s pouch</b> (oral <b>ectoderm</b>)."
  },
  {
    "q": "What is the embryonic origin of the posterior pituitary?",
    "a": "<b>Neuroectoderm</b> (hypothalamic outgrowth)."
  },
  {
    "q": "What is the embryonic origin of the pineal gland?",
    "a": "<b>Neuroectoderm</b> (diencephalon)."
  },
  {
    "q": "What is the embryonic origin of the lens of the eye?",
    "a": "Surface <b>ectoderm</b>."
  },
  {
    "q": "What is the embryonic origin of the retina?",
    "a": "<b>Neuroectoderm</b> (optic cup)."
  },
  {
    "q": "What is the embryonic origin of the cornea?",
    "a": "Surface <b>ectoderm</b> (epithelium) + <b>neural crest</b> (stroma)."
  },
  {
    "q": "What is <b>coloboma</b>?",
    "a": "Failure of choroid fissure to close → defect in iris, retina, or optic disc."
  },
  {
    "q": "What is the embryonic origin of the external ear?",
    "a": "1st and 2nd branchial arches."
  },
  {
    "q": "What is the embryonic origin of the middle ear ossicles?",
    "a": "<ul><li><b>Malleus & incus:</b> 1st arch.</li><li><b>Stapes:</b> 2nd arch.</li></ul>"
  },
  {
    "q": "What is the embryonic origin of the inner ear?",
    "a": "Otic placode (surface <b>ectoderm</b>)."
  },
  {
    "q": "What is the embryonic origin of the teeth?",
    "a": "<b>Ectoderm</b> (enamel) + <b>neural crest</b> (dentin, pulp)."
  },
  {
    "q": "<ul><li><b>Endocardial cushions</b></li><li><b>Septum primum</b> and <b>septum secundum</b></li><li><b>Muscular septum</b></li><li><b>Neural crest cells</b> (conotruncal septum)</li></ul>",
    "a": "<ul><li><b>Endocardial cushions</b></li><li><b>Septum primum</b> and <b>septum secundum</b></li><li><b>Muscular septum</b></li><li><b>Neural crest cells</b> (conotruncal septum)</li></ul>"
  },
  {
    "q": "What is the most common congenital heart defect overall?",
    "a": "<b>Ventricular septal defect</b> (<b>VSD</b>)."
  },
  {
    "q": "What is the most common cyanotic congenital heart disease?",
    "a": "<b>Tetralogy of Fallot</b>."
  },
  {
    "q": "What is the embryonic cause of <b>transposition of the great arteries</b>?",
    "a": "Failure of spiral septation of the truncus arteriosus."
  },
  {
    "q": "What is the embryonic cause of <b>persistent truncus arteriosus</b>?",
    "a": "Failure of <b><b>neural crest</b> cells</b> to migrate and form the <b>aorticopulmonary septum</b>."
  },
  {
    "q": "What is the embryonic cause of <b>Tetralogy of Fallot</b>?",
    "a": "Anterior displacement of the <b>conotruncal septum</b>."
  },
  {
    "q": "What maternal infection is classically associated with congenital heart defects (<b>PDA</b>, pulmonary stenosis)?",
    "a": "<b>Rubella</b>."
  },
  {
    "q": "What is the embryonic origin of the kidneys?",
    "a": "Intermediate <b>mesoderm</b> (metanephros)."
  },
  {
    "q": "What is <b>Potter sequence</b>?",
    "a": "Bilateral renal agenesis → oligohydramnios → pulmonary hypoplasia, characteristic facies, limb deformities."
  },
  {
    "q": "What is <b>multicystic dysplastic kidney</b>?",
    "a": "Abnormal metanephric development with multiple non-communicating cysts."
  },
  {
    "q": "What is the embryonic origin of the gonads?",
    "a": "Genital ridge (intermediate <b>mesoderm</b>) + primordial germ cells from yolk sac."
  },
  {
    "q": "What structure guides testicular descent?",
    "a": "<b>Gubernaculum</b>."
  },
  {
    "q": "What is the <b>processus vaginalis</b>?",
    "a": "Peritoneal evagination accompanying testicular descent; patent processus → <b>indirect inguinal hernia</b> or <b>hydrocele</b>."
  },
  {
    "q": "What is the most common site of <b>ectopic testis</b>?",
    "a": "Inguinal canal."
  },
  {
    "q": "What is the embryonic origin of the uterus and upper vagina?",
    "a": "Paramesonephric (Müllerian) ducts."
  },
  {
    "q": "What is <b>Mayer-Rokitansky-Küster-Hauser syndrome</b>?",
    "a": "<b>Müllerian agenesis</b> — congenital absence of uterus and upper vagina with normal secondary sexual characteristics and ovaries."
  },
  {
    "q": "What is the embryonic origin of the lower vagina?",
    "a": "Urogenital sinus."
  },
  {
    "q": "What is the most common uterine anomaly?",
    "a": "<b>Septate uterus</b> (incomplete resorption of septum)."
  },
  {
    "q": "What is the embryonic origin of the prostate?",
    "a": "Urogenital sinus <b>endoderm</b>."
  },
  {
    "q": "What is the embryonic origin of the seminal vesicles?",
    "a": "Mesonephric (Wolffian) ducts."
  }
];

module.exports = { embryologyCards };
